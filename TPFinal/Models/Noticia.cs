using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPFinal.Models
{
    public class Noticias
    {
        private int _IdNoticia;
        private int _idTipoNoticia;
        private string _Titulo;
        private string _Imagen;
        private string _Descripcion;
        private bool _Destacada;
        private string _Noticia;

        public int IdNoticia { get => _IdNoticia; set => _IdNoticia = value; }
        public int IdTipoNoticia { get => _idTipoNoticia; set => _idTipoNoticia = value; }
        public string Titulo { get => _Titulo; set => _Titulo = value; }
        public string Imagen { get => _Imagen; set => _Imagen = value; }
        public string Descripcion { get => _Descripcion; set => _Descripcion = value; }
        public bool Destacada { get => _Destacada; set => _Destacada = value; }
        public string Noticia { get => _Noticia; set => _Noticia = value; }

        
    }
}