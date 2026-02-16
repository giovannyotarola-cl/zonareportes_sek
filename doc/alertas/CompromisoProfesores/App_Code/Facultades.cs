using System;
using System.Text;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace APRPAsignaturas
{
    public partial class Facultades_TYPE
    {

        private string nombre;
        private string codigo;

        private int codigoError;
        private string glosaError;

        public string Nombre
        {
            get { return this.nombre; }
            set { this.nombre = value; }
        }

        public string Codigo
        {
            get { return this.codigo; }
            set { this.codigo = value; }
        }

        public int CodigoError
        {
            get { return this.codigoError; }
            set { this.codigoError = value; }
        }

        public string GlosaError
        {
            get { return this.glosaError; }
            set { this.glosaError = value; }
        }

    }
}
