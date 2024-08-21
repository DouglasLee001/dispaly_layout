using System;
using System.IO;
using System.Net;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace MultiServerWinForms
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();

            // 创建并启动三个服务器实例，每个服务器有自己的窗体
            StartServer("http://localhost:8080/", "Server 1");
            StartServer("http://localhost:8081/", "Server 2");
            StartServer("http://localhost:8082/", "Server 3");
        }

        private void StartServer(string url, string serverName)
        {
            ServerForm serverForm = new ServerForm(url, serverName);
            Thread formThread = new Thread(() => Application.Run(serverForm));
            formThread.Start();
        }
    }

    public class ServerForm : Form
    {
        private SimpleHttpServer server;
        private Label statusLabel;

        public ServerForm(string url, string serverName)
        {
            this.Text = serverName;
            this.Width = 300;
            this.Height = 150;

            statusLabel = new Label() { Dock = DockStyle.Fill, TextAlign = System.Drawing.ContentAlignment.MiddleCenter };
            this.Controls.Add(statusLabel);

            server = new SimpleHttpServer(url, serverName);
            server.Start();

            statusLabel.Text = $"{serverName} running on {url}";
        }

        protected override void OnFormClosing(FormClosingEventArgs e)
        {
            server.Stop();
            base.OnFormClosing(e);
        }
    }

    public class SimpleHttpServer
    {
        private HttpListener _httpListener;
        private Thread _listenerThread;
        private string _hostUrl;
        private string _serverName;

        public SimpleHttpServer(string hostUrl, string serverName)
        {
            _hostUrl = hostUrl;
            _serverName = serverName;
        }

        public void Start()
        {
            _httpListener = new HttpListener();
            _httpListener.Prefixes.Add(_hostUrl);
            _httpListener.Start();

            Console.WriteLine($"{_serverName} serving HTTP on {_hostUrl}");

            _listenerThread = new Thread(() =>
            {
                while (true)
                {
                    HttpListenerContext context = _httpListener.GetContext();
                    ProcessRequest(context);
                }
            });

            _listenerThread.IsBackground = true;
            _listenerThread.Start();
        }

        private void ProcessRequest(HttpListenerContext context)
        {
            string localPath = context.Request.Url.LocalPath.TrimStart('/');
            string filePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, localPath);

            if (Directory.Exists(filePath))
            {
                context.Response.ContentType = "text/html";
                using (StreamWriter writer = new StreamWriter(context.Response.OutputStream))
                {
                    writer.WriteLine("<html><body><h1>Directory Listing</h1><ul>");

                    foreach (string entry in Directory.GetFileSystemEntries(filePath))
                    {
                        string entryName = Path.GetFileName(entry);
                        writer.WriteLine($"<li><a href=\"{localPath}/{entryName}\">{entryName}</a></li>");
                    }

                    writer.WriteLine("</ul></body></html>");
                }
            }
            else if (File.Exists(filePath))
            {
                byte[] fileContent = File.ReadAllBytes(filePath);
                context.Response.ContentType = GetMimeType(filePath);
                context.Response.ContentLength64 = fileContent.Length;
                context.Response.OutputStream.Write(fileContent, 0, fileContent.Length);
            }
            else
            {
                context.Response.StatusCode = 404;
                using (StreamWriter writer = new StreamWriter(context.Response.OutputStream))
                {
                    writer.WriteLine("404 - File Not Found");
                }
            }

            context.Response.OutputStream.Close();
        }

        private string GetMimeType(string filePath)
        {
            switch (Path.GetExtension(filePath).ToLower())
            {
                case ".html":
                case ".htm": return "text/html";
                case ".css": return "text/css";
                case ".js": return "application/javascript";
                case ".png": return "image/png";
                case ".jpg":
                case ".jpeg": return "image/jpeg";
                case ".gif": return "image/gif";
                case ".cpp": return "text/x-c++src";
                case ".h": return "text/x-c++hdr";
                case ".txt": return "text/plain";
                case ".data": return "application/octet-stream";
                case ".wasm": return "application/wasm";
                default: return "application/octet-stream";
            }
        }

        public void Stop()
        {
            _httpListener?.Stop();
            _listenerThread?.Abort();
        }
    }

    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new MainForm());
        }
    }
}
