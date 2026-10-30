using College_DB.Models;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Data;

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection")
    ?? throw new InvalidOperationException("Connection string 'DefaultConnection' is not configured.");

builder.Services.AddDbContext<CollegeDBContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddRazorPages();

var app = builder.Build();

// Create the local database and tables on the first run, then seed usable reference data.
await using (var scope = app.Services.CreateAsyncScope())
{
    var db = scope.ServiceProvider.GetRequiredService<CollegeDBContext>();
    await db.Database.EnsureCreatedAsync();
    await DatabaseInitializer.SeedAsync(db);
}

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseDefaultFiles();
app.UseStaticFiles();
app.UseRouting();
app.Use(async (context, next) =>
{
    try
    {
        await next();
    }
    catch (DbUpdateException)
    {
        if (context.Response.HasStarted) throw;
        context.Response.Clear();
        context.Response.StatusCode = StatusCodes.Status409Conflict;
        await context.Response.WriteAsJsonAsync(new { title = "Операция нарушает связи данных. Проверьте, не используется ли эта запись другими данными." });
    }
});
app.UseAuthorization();
app.MapRazorPages();

var api = app.MapGroup("/api");

api.MapGet("/students", async (CollegeDBContext db) => Results.Ok(await db.Students.AsNoTracking().OrderBy(x => x.StudentId).ToListAsync()));
api.MapGet("/students/{id:int}", async (int id, CollegeDBContext db) => await db.Students.FindAsync(id) is { } item ? Results.Ok(item) : Results.NotFound());
api.MapPost("/students", async (Student item, CollegeDBContext db) => { db.Students.Add(item); await db.SaveChangesAsync(); return Results.Created($"/api/students/{item.StudentId}", item); });
api.MapPut("/students/{id:int}", async (int id, Student input, CollegeDBContext db) => { var item = await db.Students.FindAsync(id); if (item is null) return Results.NotFound(); item.FirstName = input.FirstName; item.LastName = input.LastName; item.Age = input.Age; item.GroupId = input.GroupId; await db.SaveChangesAsync(); return Results.NoContent(); });
api.MapDelete("/students/{id:int}", async (int id, CollegeDBContext db) => { var item = await db.Students.FindAsync(id); if (item is null) return Results.NotFound(); db.Remove(item); await db.SaveChangesAsync(); return Results.NoContent(); });

api.MapGet("/groups", async (CollegeDBContext db) => Results.Ok(await db.Groups.AsNoTracking().OrderBy(x => x.GroupId).ToListAsync()));
api.MapGet("/groups/{id:int}", async (int id, CollegeDBContext db) => await db.Groups.FindAsync(id) is { } item ? Results.Ok(item) : Results.NotFound());
api.MapPost("/groups", async (Group item, CollegeDBContext db) => { db.Groups.Add(item); await db.SaveChangesAsync(); return Results.Created($"/api/groups/{item.GroupId}", item); });
api.MapPut("/groups/{id:int}", async (int id, Group input, CollegeDBContext db) => { var item = await db.Groups.FindAsync(id); if (item is null) return Results.NotFound(); item.GroupName = input.GroupName; await db.SaveChangesAsync(); return Results.NoContent(); });
api.MapDelete("/groups/{id:int}", async (int id, CollegeDBContext db) => { var item = await db.Groups.FindAsync(id); if (item is null) return Results.NotFound(); db.Remove(item); await db.SaveChangesAsync(); return Results.NoContent(); });

api.MapGet("/subjects", async (CollegeDBContext db) => Results.Ok(await db.Subjects.AsNoTracking().OrderBy(x => x.SubjectId).ToListAsync()));
api.MapGet("/subjects/{id:int}", async (int id, CollegeDBContext db) => await db.Subjects.FindAsync(id) is { } item ? Results.Ok(item) : Results.NotFound());
api.MapPost("/subjects", async (Subject item, CollegeDBContext db) => { db.Subjects.Add(item); await db.SaveChangesAsync(); return Results.Created($"/api/subjects/{item.SubjectId}", item); });
api.MapPut("/subjects/{id:int}", async (int id, Subject input, CollegeDBContext db) => { var item = await db.Subjects.FindAsync(id); if (item is null) return Results.NotFound(); item.SubjectName = input.SubjectName; item.TeacherId = input.TeacherId; await db.SaveChangesAsync(); return Results.NoContent(); });
api.MapDelete("/subjects/{id:int}", async (int id, CollegeDBContext db) => { var item = await db.Subjects.FindAsync(id); if (item is null) return Results.NotFound(); db.Remove(item); await db.SaveChangesAsync(); return Results.NoContent(); });

api.MapGet("/teachers", async (CollegeDBContext db) => Results.Ok(await db.Teachers.AsNoTracking().OrderBy(x => x.TeacherId).ToListAsync()));
api.MapGet("/teachers/{id:int}", async (int id, CollegeDBContext db) => await db.Teachers.FindAsync(id) is { } item ? Results.Ok(item) : Results.NotFound());
api.MapPost("/teachers", async (Teacher item, CollegeDBContext db) => { db.Teachers.Add(item); await db.SaveChangesAsync(); return Results.Created($"/api/teachers/{item.TeacherId}", item); });
api.MapPut("/teachers/{id:int}", async (int id, Teacher input, CollegeDBContext db) => { var item = await db.Teachers.FindAsync(id); if (item is null) return Results.NotFound(); item.FirstName = input.FirstName; item.LastName = input.LastName; await db.SaveChangesAsync(); return Results.NoContent(); });
api.MapDelete("/teachers/{id:int}", async (int id, CollegeDBContext db) => { var item = await db.Teachers.FindAsync(id); if (item is null) return Results.NotFound(); db.Remove(item); await db.SaveChangesAsync(); return Results.NoContent(); });

api.MapGet("/grades", async (CollegeDBContext db) => Results.Ok(await db.Grades.AsNoTracking().OrderBy(x => x.GradeId).ToListAsync()));
api.MapGet("/grades/{id:int}", async (int id, CollegeDBContext db) => await db.Grades.FindAsync(id) is { } item ? Results.Ok(item) : Results.NotFound());
api.MapPost("/grades", async (Grade item, CollegeDBContext db) => { db.Grades.Add(item); await db.SaveChangesAsync(); return Results.Created($"/api/grades/{item.GradeId}", item); });
api.MapPut("/grades/{id:int}", async (int id, Grade input, CollegeDBContext db) => { var item = await db.Grades.FindAsync(id); if (item is null) return Results.NotFound(); item.StudentId = input.StudentId; item.SubjectId = input.SubjectId; item.Value = input.Value; item.GradeDate = input.GradeDate; await db.SaveChangesAsync(); return Results.NoContent(); });
api.MapDelete("/grades/{id:int}", async (int id, CollegeDBContext db) => { var item = await db.Grades.FindAsync(id); if (item is null) return Results.NotFound(); db.Remove(item); await db.SaveChangesAsync(); return Results.NoContent(); });

app.Run();
