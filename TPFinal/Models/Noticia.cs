using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace TPFinal.Models
{
    public class Noticias
    {
        public int IdNoticia { get; set; }
        public string Titulo { get; set; }
        public string Multimedia { get; set; }
        public string Descripcion { get; set; }
        public int fkCategoria { get; set; }
        public HttpPostedFileBase Foto {get; set; }
        public Noticias()
        {
           
        }

        public Noticias(int IdNot, string Tit, string Mult, string Desc, int fkCat)
        {
            IdNoticia = IdNoticia;
            Titulo = Titulo;
            Multimedia = Multimedia;
            Descripcion = Descripcion;
            fkCategoria = fkCategoria;
        }
        
       
    }
}