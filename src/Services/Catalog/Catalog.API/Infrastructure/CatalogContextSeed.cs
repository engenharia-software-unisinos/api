using BuldingBlocks.SeedWork;
using Catalog.API.Extensions;
using Catalog.Domain.AggregatesModel.ProductAggregate;
using Catalog.Infrastructure;
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

namespace Catalog.API.Infrastructure
{
    public class CatalogContextSeed
    {
        public async Task SeedAsync(CatalogContext context, IWebHostEnvironment env, IOptions<CatalogSettings> settings, ILogger<CatalogContextSeed> logger)
        {
            var policy = CreatePolicy(logger, nameof(CatalogContextSeed));

            await policy.ExecuteAsync(async () =>
            {
                var contentRootPath = env.ContentRootPath;

                using (context)
                {
                    context.Database.Migrate();

                    if (!context.ProductStatus.Any())
                    {
                        context.ProductStatus.AddRange(GetProductStatusFromFile(contentRootPath, logger));
                        await context.SaveChangesAsync();
                    }

                    await context.SaveChangesAsync();
                }
            });
        }

        private IEnumerable<ProductStatus> GetProductStatusFromFile(string path, ILogger<CatalogContextSeed> log)
        {
            string csvFileCardTypes = Path.Combine(path, "Setup", "ProductStatus.csv");

            if (!File.Exists(csvFileCardTypes))
            {
                return Enumeration.GetAll<ProductStatus>();
            }

            string[] csvheaders;
            try
            {
                string[] requiredHeaders = { "productstatus" };
                csvheaders = GetHeaders(requiredHeaders, csvFileCardTypes);
            }
            catch (Exception ex)
            {
                log.LogError(ex, "EXCEPTION ERROR: {Message}", ex.Message);
                return Enumeration.GetAll<ProductStatus>();
            }

            int id = 1;
            return File.ReadAllLines(csvFileCardTypes)
                .Skip(1) //header
                .SelectTry(x => CreateProductStatus(x, ref id))
                .OnCaughtException(ex => { log.LogError(ex, "EXCEPTION ERROR: {Message}", ex.Message); return null; })
                .Where(x => x != null);
        }

        private ProductStatus CreateProductStatus(string value, ref int id)
        {
            if (String.IsNullOrEmpty(value))
            {
                throw new Exception("ProductStatus is null or empty");
            }

            return new ProductStatus(id++, value.Trim('"').Trim());
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

        private AsyncRetryPolicy CreatePolicy(ILogger<CatalogContextSeed> logger, string prefix, int retries = 3)
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
