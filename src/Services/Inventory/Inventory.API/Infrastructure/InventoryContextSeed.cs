using Inventory.API.Extensions;
using Inventory.Domain.AggregatesModel.ItemAggregate;
using Inventory.Domain.SeedWork;
using Inventory.Infrastructure;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Polly;
using Polly.Retry;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Inventory.API.Infrastructure
{
    public class InventoryContextSeed
    {
        public async Task SeedAsync(InventoryContext context, IWebHostEnvironment env, IOptions<InventorySettings> settings, ILogger<InventoryContextSeed> logger)
        {
            var policy = CreatePolicy(logger, nameof(InventoryContextSeed));

            await policy.ExecuteAsync(async () =>
            {
                var contentRootPath = env.ContentRootPath;

                using (context)
                {
                    context.Database.Migrate();

                    if (!context.ItemStatus.Any())
                    {
                        context.ItemStatus.AddRange(GetItemStatusFromFile(contentRootPath, logger));
                        await context.SaveChangesAsync();
                    }

                    await context.SaveChangesAsync();
                }
            });
        }

        private IEnumerable<ItemStatus> GetItemStatusFromFile(string path, ILogger<InventoryContextSeed> log)
        {
            string csvFileCardTypes = Path.Combine(path, "Setup", "ItemStatus.csv");

            if (!File.Exists(csvFileCardTypes))
            {
                return Enumeration.GetAll<ItemStatus>();
            }

            string[] csvheaders;
            try
            {
                string[] requiredHeaders = { "itemstatus" };
                csvheaders = GetHeaders(requiredHeaders, csvFileCardTypes);
            }
            catch(Exception ex)
            {
                log.LogError(ex, "EXCEPTION ERROR: {Message}", ex.Message);
                return Enumeration.GetAll<ItemStatus>();
            }

            int id = 1;
            return File.ReadAllLines(csvFileCardTypes)
                .Skip(1) //header
                .SelectTry(x => CreateItemStatus(x, ref id))
                .OnCaughtException(ex => { log.LogError(ex, "EXCEPTION ERROR: {Message}", ex.Message); return null; })
                .Where(x => x != null);
        }

        private ItemStatus CreateItemStatus(string value, ref int id)
        {
            if (String.IsNullOrEmpty(value))
            {
                throw new Exception("ItemStatus is null or empty");
            }

            return new ItemStatus(id++, value.Trim('"').Trim());
        }

        private string[] GetHeaders(string[] requiredHeaders, string csvfile)
        {
            string[] csvheaders = File.ReadLines(csvfile).First().ToLowerInvariant().Split(',');

            if (csvheaders.Count() != requiredHeaders.Count())
            {
                throw new Exception($"requiredHeader count '{ requiredHeaders.Count()}' is different then read header '{csvheaders.Count()}'");
            }

            foreach (var requiredHeader in requiredHeaders)
            {
                if (!csvheaders.Contains(requiredHeader))
                {
                    throw new Exception($"does not contain required header '{requiredHeader}'");
                }
            }

            return csvheaders;
        }


        private AsyncRetryPolicy CreatePolicy(ILogger<InventoryContextSeed> logger, string prefix, int retries = 3)
        {
            return Policy.Handle<SqlException>().
                WaitAndRetryAsync(
                    retryCount: retries,
                    sleepDurationProvider: retry => TimeSpan.FromSeconds(5),
                    onRetry: (exception, timeSpan, retry, ctx) =>
                    {
                        logger.LogWarning(exception, "[{prefix}] Exception {ExceptionType} with message {Message} detected on attempt {retry} of {retries}", prefix, exception.GetType().Name, exception.Message, retry, retries);
                    }
                );
        }
    }
}
