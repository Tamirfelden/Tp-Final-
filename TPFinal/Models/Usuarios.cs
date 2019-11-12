using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPFinal.Models
{
    public class Usuarios
    {
        private int  _Idusuraio;
        private string _nombre;
        private string _apellido;
        private string _mail;
        private string _clave;

        public int Idusuraio { get => _Idusuraio; set => _Idusuraio = value; }
        public string Nombre { get => _nombre; set => _nombre = value; }
        public string Apellido { get => _apellido; set => _apellido = value; }
        public string Mail { get => _mail; set => _mail = value; }
        public string Clave { get => _clave; set => _clave = value; }
    }
}