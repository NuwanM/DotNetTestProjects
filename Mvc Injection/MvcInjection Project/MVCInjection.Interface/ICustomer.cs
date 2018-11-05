using MVCInjection.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVCInjection.Interface
{
    public interface ICustomer
    {
        void Add(CustomerModel Customer);     // Create New Customer
        void Update(CustomerModel Customer);  // Modify Customer
        void Delete(CustomerModel Customer);  // Delete Customer
        CustomerModel GetById(int id); // Get an Single Customer details by id
        IEnumerable<CustomerModel> GetAll();  // Gets All Customer details
    }
}
