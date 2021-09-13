using Ordering.API.Extensions;
using Ordering.Infrastructure;
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
using BuldingBlocks.SeedWork;
using Ordering.Domain.AggregatesModel.OrderAggregate;

namespace Ordering.API.Infrastructure
{
    public class OrderingContextSeed
    {
        public async Task SeedAsync(OrderingContext context, IWebHostEnvironment env, IOptions<OrderingSettings> settings, ILogger<OrderingContextSeed> logger)
        {
            var policy = CreatePolicy(logger, nameof(OrderingContextSeed));

            await policy.ExecuteAsync(async () =>
            {
                var contentRootPath = env.ContentRootPath;

                using (context)
                {
                    context.Database.Migrate();

                    if (!context.OrderStatus.Any())
                    {
                        context.OrderStatus.AddRange(GetOrderStatusFromFile(contentRootPath, logger));
                        await context.SaveChangesAsync();
                    }

                    await context.SaveChangesAsync();
                }
            });
        }

        private IEnumerable<OrderStatus> GetOrderStatusFromFile(string path, ILogger<OrderingContextSeed> log)
        {
            string csvFileCardTypes = Path.Combine(path, "Setup", "OrderStatus.csv");

            if (!File.Exists(csvFileCardTypes))
            {
                return Enumeration.GetAll<OrderStatus>();
            }

            string[] csvheaders;
            try
            {
                string[] requiredHeaders = { "orderstatus" };
                csvheaders = GetHeaders(requiredHeaders, csvFileCardTypes);
            }
            catch(Exception ex)
            {
                log.LogError(ex, "EXCEPTION ERROR: {Message}", ex.Message);
                return Enumeration.GetAll<OrderStatus>();
            }

            int id = 1;
            return File.ReadAllLines(csvFileCardTypes)
                .Skip(1) //header
                .SelectTry(x => CreateOrderStatus(x, ref id))
                .OnCaughtException(ex => { log.LogError(ex, "EXCEPTION ERROR: {Message}", ex.Message); return null; })
                .Where(x => x != null);
        }

        private OrderStatus CreateOrderStatus(string value, ref int id)
        {
            if (String.IsNullOrEmpty(value))
            {
                throw new Exception("OrderStatus is null or empty");
            }

            return new OrderStatus(id++, value.Trim('"').Trim());
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


        private AsyncRetryPolicy CreatePolicy(ILogger<OrderingContextSeed> logger, string prefix, int retries = 3)
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
