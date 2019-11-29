using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TPFinal.Models;
namespace TPFinal.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Noticias(int id)
        {
            ViewBag.ListaNoticia = BD.TraerUnaNoticia();
            return View();
        }
        public ActionResult Index()
        {
          ViewBag.ListaNoticias = BD.TraerNoticias();
          return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Am Israel Defense";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}