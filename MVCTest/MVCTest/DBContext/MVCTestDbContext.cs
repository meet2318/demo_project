using Microsoft.EntityFrameworkCore;
using MVCTest.Models;

namespace MVCTest.DBContext;
public class MVCTestDbContext : DbContext
{
    public MVCTestDbContext(DbContextOptions<MVCTestDbContext> options)
        : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Employee>()
            .HasIndex(e => e.EmailAddress)
            .IsUnique();
    }

    public DbSet<Employee> Employees { get; set; }
    public DbSet<EmployeeDesignation> EmployeeDesignations { get; set; }
    public DbSet<DesignationGrade> DesignationGrades { get; set; }
}
