using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;

var builder = WebApplication.CreateBuilder(args);
// Force API to listen on a predictable port for the sample
builder.WebHost.UseUrls("http://localhost:5000");

var app = builder.Build();

app.MapGet("/", () => "Hello from MyApi");
app.MapGet("/hello", () => "Hello from MyApi (endpoint)");

app.Run();
