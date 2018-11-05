using Dapper;
using MVCInjection.Interface;
using MVCInjection.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVCInjection.Concrete
{
    public class CustomerConcrete : ICustomer
    {
        public void Add(CustomerModel Customer)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    con.Open();
                    SqlTransaction sqltans = con.BeginTransaction();
                    var param = new DynamicParameters();
                    param.Add("@CustomerID", Customer.CustomerID);
                    param.Add("@Name", Customer.Name);
                    param.Add("@Address", Customer.Address);
                    param.Add("@Country", Customer.Country);
                    param.Add("@City", Customer.City);
                    param.Add("@Phoneno", Customer.Phoneno);
                    var result = con.Execute("sprocCustomerTBInsertUpdateSingleItem",
                          param,
                          sqltans,
                          0,
                          commandType: CommandType.StoredProcedure);

                    if (result > 0)
                    {
                        sqltans.Commit();
                    }
                    else
                    {
                        sqltans.Rollback();
                    }

                }
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void Delete(CustomerModel Customer)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    con.Open();
                    SqlTransaction sqltans = con.BeginTransaction();
                    var param = new DynamicParameters();
                    param.Add("@CustomerID", Customer.CustomerID);
                    var result = con.Execute("sprocCustomerTBDeleteSingleItem",
                        param,
                        sqltans,
                        0,
                        commandType: CommandType.StoredProcedure);

                    if (result > 0)
                    {
                        sqltans.Commit();
                    }
                    else
                    {
                        sqltans.Rollback();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IEnumerable<CustomerModel> GetAll()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    con.Open();
                    var param = new DynamicParameters();
                    return con.Query<CustomerModel>("sprocCustomerTBSelectList",
                        null,
                        null,
                        true,
                        0,
                        commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public CustomerModel GetById(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    con.Open();
                    var param = new DynamicParameters();
                    param.Add("@CustomerID", id);
                    return con.Query<CustomerModel>("sprocCustomerTBSelectList",
                        param,
                        null,
                        true,
                        0,
                        commandType: CommandType.StoredProcedure).SingleOrDefault();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update(CustomerModel Customer)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    con.Open();
                    SqlTransaction sqltans = con.BeginTransaction();
                    var param = new DynamicParameters();
                    param.Add("@CustomerID", Customer.CustomerID);
                    param.Add("@Name", Customer.Name);
                    param.Add("@Address", Customer.Address);
                    param.Add("@Country", Customer.Country);
                    param.Add("@City", Customer.City);
                    param.Add("@Phoneno", Customer.Phoneno);
                    var result = con.Execute("sprocCustomerTBInsertUpdateSingleItem",
                        param,
                        sqltans,
                        0,
                        commandType: CommandType.StoredProcedure);


                    if (result > 0)
                    {
                        sqltans.Commit();
                    }
                    else
                    {
                        sqltans.Rollback();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}