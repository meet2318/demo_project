using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MVCTest.Models;

public class Employee
{
    [Key]
    public int Id { get; set; }

    [Required]
    [MaxLength(100)]
    public string Firstname { get; set; }

    [Required]
    [MaxLength(100)]
    public string Lastname { get; set; }

    [Required]
    [MaxLength(100)]
    [EmailAddress(ErrorMessage = "Invalid email address")]
    public string EmailAddress { get; set; }

    [RegularExpression(@"^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$", ErrorMessage = "Invalid phone number")]
    public string PhoneNumber { get; set; }

    [ForeignKey("EmployeeDesignation")]
    public int DesignationIdRef { get; set; }

    [ForeignKey("DesignationGrade")]
    public int GradeIdRef { get; set; }

    public virtual EmployeeDesignation EmployeeDesignation { get; set; }
    public virtual DesignationGrade DesignationGrade { get; set; }
}