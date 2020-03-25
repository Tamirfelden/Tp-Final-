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
        [Required(ErrorMessage = "Ingrese Titulo")]
        public string Multimedia { get; set; }
        [Required(ErrorMessage = "Ingrese Multimedia")]
        public string Descripcion { get; set;}
        [Required(ErrorMessage = "Ingrese Descripcion")]
        public int fkCategoria { get; set; }
        [Required(ErrorMessage = "Ingrese Categoria")]
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