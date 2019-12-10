using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace TPFinal.Models
{
    public class Usuarios
    {
        public int Idusuraio { get; set; }
        [Required(ErrorMessage = "Ingrese Nombre")]
        public string Nombre { get; set; }
        [Required(ErrorMessage = "Ingrese Apellido")]
        public string Apellido { get; set; }
        [Required(ErrorMessage = "Ingrese Mail")]
        public string Mail { get; set; }
        [Required(ErrorMessage = "Ingrese Contraseña")]
        public string Clave { get; set; }
    }
}