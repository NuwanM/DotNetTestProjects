using MVCInjection.Interface;
using MVCInjection.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcInjection.Controllers
{
    public class CustomerController : Controller
    {
        private readonly ICustomer ICustomer; 

        public CustomerController(ICustomer _ICustomer)
        {
            this.ICustomer = _ICustomer;
        }
        // GET: Customer
        public ActionResult Index()
        {
            var Alldata = ICustomer.GetAll();
            return View(Alldata);
        }

        // GET: Customer/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Customer/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Customer/Create
        [HttpPost]
        public ActionResult Create(CustomerModel customer)
        {
            try
            {
                // TODO: Add insert logic here
                if (ModelState.IsValid)
                {
                    ICustomer.Add(customer);
                    return View();
                    //return RedirectToAction("Index");
                }
                else
                {
                    return View(customer);
                }                
            }
            catch
            {
                return View();
            }
        }

        // GET: Customer/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Customer/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Customer/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Customer/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
