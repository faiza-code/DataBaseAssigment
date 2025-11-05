using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseAssignment.Models
{
    public class Employee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int EmployeeId { get; set; }

        public Employee(int id, string name, int employeeId)
        {
            Id = id;
            Name = name;
            EmployeeId = employeeId;
        }
    }
}
