using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AutoPostulacion.Models
{
    public class RegistroContratos
    {
        public string Rut { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Nombres { get; set; }
        public string Carrera { get; set; }
        public string Nivel { get; set; }
        public string Categoria { get; set; }
        public string Localidad { get; set; }
        public string Mail { get; set; }
        public int Documentacion { get; set; }
        public string Jornada { get; set; }
        public int ArancelReal { get; set; }
        public int ArancelDocumentado { get; set; }
        public string Matriculado { get; set; }
        public string Estado { get; set;  }
    }
}