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
        public ActionResult SubirNoticias() 
        {
            ViewBag.TraerCategoria = BD.TraerCategoria();
            return View();
        }
       [HttpGet] 
        public ActionResult insertarnoti(Noticias noti)
        {
            BD.SubirNoticia(noti);
            return View("Correcto");
        }
        [HttpGet]
        public ActionResult BajarNoticias()
        {

            return View();

        }
        // GET: Backoffice
        public ActionResult Index()
        {
            ViewBag.Mensaje = "";
            return View();

        }

        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Login(Usuarios user)
        {
            bool Existe = BD.ValidarUsuarios(user);
            if (ModelState.IsValid)
            {
                if (Existe)
                {
                    if (user.Nombre == "backoffice" && user.Clave == "backoffice")
                    {
                        return View("BackOffice");
                    }
                    else
                    {
                        return View("Correcto");
                    }
                    
                }
                else
                {
                    return View("Login");
                    
                }
            }
            else
            {
                return View("Login");
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

        public ActionResult TraerCategoria()
        {
           
            return ViewBag.TraerCategoria;
        }
    }
}