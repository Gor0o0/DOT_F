using College_DB.Models;
using Microsoft.EntityFrameworkCore;

namespace WebApplication1.Data;

public static class DatabaseInitializer
{
    public static async Task SeedAsync(CollegeDBContext db)
    {
        var groupNames = new[] { "РПО 1", "РПО 2", "СПО 1", "СПО 2" };
        var groups = await db.Groups.ToListAsync();

        // Rename the two sample groups created by earlier versions without changing their IDs.
        foreach (var group in groups)
        {
            if (group.GroupName == "ИС-1") group.GroupName = "РПО 1";
            if (group.GroupName == "ИС-2") group.GroupName = "РПО 2";
        }

        foreach (var name in groupNames)
        {
            if (!groups.Any(group => group.GroupName == name))
                db.Groups.Add(new Group { GroupName = name });
        }

        if (!await db.Teachers.AnyAsync())
            db.Teachers.AddRange(
                new Teacher { FirstName = "Анна", LastName = "Иванова" },
                new Teacher { FirstName = "Сергей", LastName = "Петров" });

        await db.SaveChangesAsync();

        if (!await db.Subjects.AnyAsync())
        {
            var teacherIds = await db.Teachers.OrderBy(x => x.TeacherId).Select(x => x.TeacherId).ToListAsync();
            db.Subjects.AddRange(
                new Subject { SubjectName = "Базы данных", TeacherId = teacherIds[0] },
                new Subject { SubjectName = "Программирование", TeacherId = teacherIds[^1] });
            await db.SaveChangesAsync();
        }
    }
}
