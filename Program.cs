using System.Data;
using System.Data.SqlClient;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllersWithViews();
builder.Services.AddScoped<IDbConnection>(option=>new SqlConnection(builder.Configuration.GetConnectionString("SqlServer")));

var app = builder.Build();


if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapAreaControllerRoute(

    name:"adminArea",
    pattern:"admin/{controller=Home}/{action=Index}/{id?}",
    areaName:"Admin"
);

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
