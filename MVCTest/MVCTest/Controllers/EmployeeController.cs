using Microsoft.AspNetCore.Mvc;
using MVCTest.Models;
using MVCTest.DBContext;

namespace MVCTest.Controllers
{
    public class EmployeeController : Controller
    {
        private readonly MVCTestDbContext _context;

        public EmployeeController(MVCTestDbContext context)
        {
            _context = context;
        }

        public IActionResult Create()
        {
            ViewBag.Designations = _context.EmployeeDesignations.ToList();
            ViewBag.Grades = _context.DesignationGrades.ToList();
            return View();
        }

        [HttpGet]
        public IActionResult IsEmailUnique(string email)
        {
            var isUnique = !_context.Employees.Any(e => e.EmailAddress == email);
            return Json(isUnique);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("Firstname, Lastname, EmailAddress, PhoneNumber, DesignationIdRef, GradeIdRef")] Employee employee)
        {
                ViewBag.Designations = _context.EmployeeDesignations.ToList();
                ViewBag.Grades = _context.DesignationGrades.ToList();
              
            _context.Add(employee);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }



        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var employee = _context.Employees.FirstOrDefault(e => e.Id == id);
            if (employee == null)
            {
                return NotFound();
            }

            ViewBag.Designations = _context.EmployeeDesignations.ToList(); 
            ViewBag.Grades = _context.DesignationGrades.ToList();

            return View(employee);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("Id, Firstname, Lastname, EmailAddress, PhoneNumber, DesignationIdRef, GradeIdRef")] Employee employee)
        {
            if (id != employee.Id)
            {
                return NotFound();
            }

                _context.Update(employee);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
                }

        public IActionResult Index()
        {
            var employees = _context.Employees.ToList();
            return View(employees);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id)
        {
            var employee = _context.Employees.FirstOrDefault(e => e.Id == id);
            if (employee == null)
            {
                return NotFound();
            }

            _context.Employees.Remove(employee);
            _context.SaveChanges();

            return RedirectToAction(nameof(Index));
        }
    }
}