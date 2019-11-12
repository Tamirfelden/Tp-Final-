using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeleNews.Models
{
    public class TipoNoticias
    {
        private int _IdTipoNoticia;
        private string _Nombre;

        public int IdTipoNoticia { get => _IdTipoNoticia; set => _IdTipoNoticia = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
    }
}
