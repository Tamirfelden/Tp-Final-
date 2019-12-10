using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPFinal.Models
{
    public class Categorias
    {      
        public int idCategoria { get; set ; }

        public string Categoria { get; set; }

        public Categorias()
        {

        }

        public Categorias(int idCat, string Cat)
        {
            idCategoria = idCategoria;
            Categoria = Categoria;            
        }
    }
}