using Microsoft.EntityFrameworkCore;
using College_DB.Models;

namespace WebApplication1.Data
{
    public class CollegeDBContext : DbContext
    {
        public CollegeDBContext(DbContextOptions<CollegeDBContext> options)
            :base(options){ }

        public DbSet<Student> Students => Set<Student>();
        public DbSet<Group> Groups => Set<Group>();
        public DbSet<Teacher> Teachers => Set<Teacher>();
        public DbSet<Subject> Subjects => Set<Subject>();
        public DbSet<Grade> Grades => Set<Grade>();

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Student>(e =>
            {
                e.ToTable("Students");
                e.HasKey(s => s.StudentId);
                e.Property(s => s.FirstName).HasMaxLength(50).IsRequired();
                e.Property(s => s.LastName).HasMaxLength(50).IsRequired();

                e.HasOne(s => s.Group)
                    .WithMany(g => g.Students)
                    .HasForeignKey(s => s.GroupId)
                    .OnDelete(DeleteBehavior.Cascade);
            });

            modelBuilder.Entity<Group>(e =>
            {
                e.ToTable("Groups");
                e.HasKey(g => g.GroupId);
                e.Property(s => s.GroupName).HasMaxLength(20).IsRequired();
            });

            modelBuilder.Entity<Teacher>(e =>
            {
                e.ToTable("Teachers");
                e.HasKey(x => x.TeacherId);
                e.Property(x => x.FirstName).HasMaxLength(50).IsRequired();
                e.Property(x => x.LastName).HasMaxLength(50).IsRequired();
            });

            modelBuilder.Entity<Subject>(e =>
            {
                e.ToTable("Subjects");
                e.HasKey(x => x.SubjectId);
                e.Property(x => x.SubjectName).HasMaxLength(80).IsRequired();
                e.HasOne(x => x.Teacher).WithMany(x => x.Subjects).HasForeignKey(x => x.TeacherId).OnDelete(DeleteBehavior.Restrict);
            });

            modelBuilder.Entity<Grade>(e =>
            {
                e.ToTable("Grades");
                e.HasKey(x => x.GradeId);
                e.HasOne(x => x.Student).WithMany().HasForeignKey(x => x.StudentId).OnDelete(DeleteBehavior.Cascade);
                e.HasOne(x => x.Subject).WithMany(x => x.Grades).HasForeignKey(x => x.SubjectId).OnDelete(DeleteBehavior.Restrict);
            });
        }
    }
}
