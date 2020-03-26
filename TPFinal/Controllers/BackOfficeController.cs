using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using TPFinal.Models;



namespace TeleNews.Controllers
{
    
    public class BackofficeController : Controller
    {
         Noticias noti = new Noticias();

        [HttpPost]
        public ActionResult Modinoti(Noticias noti)
        {

            if (noti.Foto != null)
            {
               
                string NuevaUbicacion = Server.MapPath("~/Content/") + noti.Foto.FileName;
                noti.Foto.SaveAs(NuevaUbicacion);
                noti.Multimedia = noti.Foto.FileName;               
            }

            else
            {
              ViewBag.UnaFoto =  BD.UnaFoto(noti);
                noti.Multimedia = ViewBag.UnaFoto.Multimedia;
                BD.CargarNoticia(noti);
                return View("Correcto");
            }

            BD.CargarNoticia(noti);
            return View("correcto");
        }

        
        public ActionResult Modificar(int idnoticia)
        {

         ViewBag.TraerCategoria = BD.TraerCategoria();
        
         noti= BD.TraerUnaNoticia(idnoticia);
         return View(noti);

            /*     if (noti.Multimedia != null)
                 {

                     string NuevaUbicacion = Server.MapPath("~/Content/") + noti.Multimedia;
                     noti.Foto.SaveAs(NuevaUbicacion);
                     noti.Multimedia = noti.Foto.FileName;
                     BD.CargarNoticia(noti);
                     return View(noti);
                 }
                 else
                 {

                     noti = BD.TraerUnaNoticia(idnoticia);
                     BD.CargarNoticia(noti);
                     return View(noti);
                 }
              */

        }

        public ActionResult UpdateNoti(int id)
        {
           
            return View();
        }

        public ActionResult UpdateNoticias()
        {
            ViewBag.TraerCategoria = BD.TraerCategoria();
            ViewBag.ListaNoticias = BD.TraerNoticias();
            return View();
        }

      
     

        public ActionResult SubirNoticias() 
        {
            ViewBag.TraerCategoria = BD.TraerCategoria();
            return View();
        }

        [HttpPost]
        public ActionResult insertarnoti(Noticias noti)
        {

            if (noti.Foto != null)
            {
                //string NuevaUbicacion = Server.MapPath("~/Content/") + noti.Foto.FileName;
                FileInfo info = new FileInfo(noti.Foto.FileName);
                string NuevaUbicacion = Server.MapPath("~/Content/") + info.Name;

                noti.Foto.SaveAs(NuevaUbicacion);
                noti.Multimedia = info.Name;
                //noti.Descripcion = Server.MapPath("~/Content/") + noti.Foto.FileName;
                BD.CargarNoticia(noti);
                BD.SubirNoticia(noti);
                return View("correcto");

            }
            else
            {

                return View("");
            }
        }


        public ActionResult BorrarNoti(int idNoticia)
        {
            BD.BorrarNoticia(idNoticia);
            return View("Correcto");
        }


        [HttpGet]
        public ActionResult BajarNoticias()
        {
            ViewBag.ListaNoticias = BD.TraerNoticias();
            return View("");
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
            if (user.Nombre== null|| user.Clave == null)
            {
                return View("Login");
            }

            bool Existe = BD.ValidarUsuarios(user);

            
              
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

        [HttpPost]
        public ActionResult CrearUsuarios(Usuarios user)
        {
            if (user.Nombre == null || user.Clave == null|| user.Apellido == null || user.Mail == null)
            {
                return View("Registro");
            }
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