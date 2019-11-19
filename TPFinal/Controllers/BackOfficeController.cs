using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TPFinal.Models;


namespace TeleNews.Controllers
{
    public class BackofficeController : Controller
    {
        // GET: Backoffice
        public ActionResult Index()
        {
            ViewBag.Mensaje = "";
            return View();

        }
        [HttpPost]
        public ActionResult Login(Usuarios user)
        {
            if (ModelState.IsValid)
            {
                BD.ValidarUsuarios(user);
                return View("Correcto");
            }
            else
            {
                return View("Login", user);
            }
            
        }

        [HttpPost]
        public ActionResult CrearUsuarios(Usuarios user)
        {         
            if (ModelState.IsValid)
            {
                BD.CrearUsuarios(user);
                return View("Correcto");
            }
            else
            {
                return View("Registro", user);
            }
            
        }
        public ActionResult Registro()
        {
            return View("Registro");
        }

    }
}