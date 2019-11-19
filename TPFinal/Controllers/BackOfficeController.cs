using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
        public ActionResult Login()
        {
            return View("Login");
        }
        public ActionResult CrearUsuarios()
        {
            return View("Correcto");
        }
        public ActionResult Registro()
        {
            return View("Registro");
        }

    }
}