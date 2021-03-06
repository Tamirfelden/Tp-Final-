﻿using System;
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
            ViewBag.Noticia = BD.TraerUnaNoticia(id);
            return View("Noticias");
        }
        public ActionResult Index(int idCat)
        {
          ViewBag.ListaNoticias = BD.TraerNoticias(idCat);
          return View();
        }
        [HttpGet]
        public ActionResult FiltrarPorCategoria()
        {
            ViewBag.ListCategoria = BD.TraerCategoria();
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
        public ActionResult FiltrarPorCategoria(int idCat)
        {
            BD.TraerNoticias(idCat);
            return View();
        }
    }
}