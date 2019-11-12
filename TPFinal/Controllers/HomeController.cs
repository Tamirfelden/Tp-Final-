using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TeleNews.Models;
namespace TeleNews.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            Noticias NT;
            TipoNoticias TNT;
            Noticias Destacada = BD.TraerDestacada();
            ViewBag.Destacada = Destacada;
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