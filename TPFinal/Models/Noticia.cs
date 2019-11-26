using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPFinal.Models
{
    public class Noticias
    {
        private int _IdNoticia;
        private string _Titulo;
        private string _Multimedia;
        private string _Descripcion;
        private string _fkCategoria;

        public Noticias()
        {
           
        }

        public int IdNoticia { get => _IdNoticia; set => _IdNoticia = value; }
        public string Titulo { get => _Titulo; set => _Titulo = value; }
        public string Multimedia { get => _Multimedia; set => _Multimedia = value; }
        public string Descripcion { get => _Descripcion; set => _Descripcion = value; }
        public string fkCategoria { get => _fkCategoria; set => _fkCategoria = value; }
    }
}