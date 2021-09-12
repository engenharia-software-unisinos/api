using System.IO;

namespace BuildingBlocks.FunctionalTests.Utils
{
    public class File
    {
        public File(string fileName, byte[] bytes)
        {
            FileName = fileName;
            Bytes = bytes;
        }

        public string FileName { get; private set; }
        public byte[] Bytes { get; private set; }
    }

    public static class FileUtils
    {
        public static File CreateFile(string fileName, string fileContent)
        {
            using var ms = new MemoryStream();

            var w = new StreamWriter(ms);
            w.WriteLine(fileContent);
            w.Flush();
            ms.Position = 0;

            System.Net.Mime.ContentType ct = new System.Net.Mime.ContentType(System.Net.Mime.MediaTypeNames.Text.Plain);
            System.Net.Mail.Attachment attach = new System.Net.Mail.Attachment(ms, ct);
            attach.ContentDisposition.FileName = fileName;

            return new File(fileName, ms.ToArray());
        }
    }
}
