# CollegeDB

ASP.NET Core 8 application for managing college groups, students, teachers, subjects, and grades. Entity Framework Core creates the `CollegeDB` database and its tables on first launch and adds example groups, teachers, and subjects.

## Run in Visual Studio 2022

1. Install the **ASP.NET and web development** workload and **SQL Server Express LocalDB** (available as an individual component in Visual Studio Installer).
2. Open `WebApplication1.sln` and press **F5**.

The configured connection targets `(localdb)\MSSQLLocalDB`. LocalDB runs under your Windows account and can create the `CollegeDB` database on first launch without granting that account server administrator rights. To use another SQL Server instance, change `ConnectionStrings:DefaultConnection` in `appsettings.json`; that account must be allowed to create the database on first launch.

## Run from a terminal

```powershell
dotnet restore
dotnet run --project WebApplication1.csproj
```

Open the URL printed by `dotnet run`. The web interface and CRUD API are served by the same application. API routes follow `/api/{students|groups|teachers|subjects|grades}` and support `GET`, `GET /{id}`, `POST`, `PUT /{id}`, and `DELETE /{id}`.
