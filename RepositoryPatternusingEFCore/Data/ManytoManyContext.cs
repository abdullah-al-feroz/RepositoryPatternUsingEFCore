using Microsoft.EntityFrameworkCore;
using RepositoryPatternusingEFCore.Model;

namespace RepositoryPatternusingEFCore.Data
{
    public class ManytoManyContext : DbContext
    {
        public ManytoManyContext(DbContextOptions <ManytoManyContext> options):base(options)
        {

        }

        public DbSet<Student> Students { get; set; }
        public DbSet<Teacher> Teachers { get; set; }

        public DbSet<StudentTeacher> StudentTeachers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelbuilder)
        {
            modelbuilder.Entity<Teacher>()
                .HasMany(t => t.Students)
                .WithMany(s => s.Teachers)
                .UsingEntity(j => j.ToTable("StudentTeacher"));
        }
    }
}
