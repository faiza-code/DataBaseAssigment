using DataBaseAssignment.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseAssignment.Contacts
{
    public class ApplicationDb :DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string con = " server =localhost\\MSSQLSERVER05;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;\"Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False\" ";
            optionsBuilder.UseSqlServer(con);
        }

        public  DbSet <Employee> employees { get; set; }
    }
}
