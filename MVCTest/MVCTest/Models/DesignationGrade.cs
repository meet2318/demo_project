using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MVCTest.Models;

public class DesignationGrade
{
    [Key]
    public int Id { get; set; }

    [Required]
    [MaxLength(100)]
    public string Gradename { get; set; }

    [ForeignKey("EmployeeDesignation")]
    public int DesignationIdRef { get; set; }

    public bool IsActive { get; set; }
}