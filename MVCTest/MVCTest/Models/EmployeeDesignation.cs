using System.ComponentModel.DataAnnotations;

namespace MVCTest.Models;

public class EmployeeDesignation
{
    [Key]
    public int Id { get; set; }

    [Required]
    [MaxLength(100)]
    public string DesignationName { get; set; }

    public bool IsActive { get; set; }
}
