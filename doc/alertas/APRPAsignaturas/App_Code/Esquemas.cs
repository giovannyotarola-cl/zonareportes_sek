using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APRPAsignaturas
{
    public partial class DatosAsignatura_TYPE
    {
        private string cRamo;
        private string codigoRamo;
        private string nombreRamo;
        private string codigoSeccion;
        private string creditoRamo;
        private string codigoSede;
        private string nombreSede;
        private string codigoFacultad;
        private string nombreFacultad;
        private string codigoCarrera;
        private string nombreCarrera;

        private string totalalumnos;

        private string numaprobados;
        private string numreprobados;

        private string promaprobados;
        private string promreprobados;
        private string promasistencia;
        private string promnotafinal;

        private string anio;

        private int codigoError;
        private string glosaError;

        public string CRamo
        {
            get { return this.cRamo; }
            set { this.cRamo = value; }
        }

        public string CodigoRamo
        {
            get { return this.codigoRamo; }
            set { this.codigoRamo = value; }
        }

        public string NombreRamo
        {
            get { return this.nombreRamo; }
            set { this.nombreRamo = value; }
        }

        public string CodigoSeccion
        {
            get { return this.codigoSeccion; }
            set { this.codigoSeccion = value; }
        }

        public string CreditoRamo
        {
            get { return this.creditoRamo; }
            set { this.creditoRamo = value; }
        }

        public string CodigoSede
        {
            get { return this.codigoSede; }
            set { this.codigoSede = value; }
        }

        public string NombreSede
        {
            get { return this.nombreSede; }
            set { this.nombreSede = value; }
        }

        public string CodigoFacultad
        {
            get { return this.codigoFacultad; }
            set { this.codigoFacultad = value; }
        }

        public string NombreFacultad
        {
            get { return this.nombreFacultad; }
            set { this.nombreFacultad = value; }
        }

        public string CodigoCarrera
        {
            get { return this.codigoCarrera; }
            set { this.codigoCarrera = value; }
        }

        public string NombreCarrera
        {
            get { return this.nombreCarrera; }
            set { this.nombreCarrera = value; }
        }

        public string Anio
        {
            get { return this.anio; }
            set { this.anio = value; }
        }

        public string TotalAlumnos
        {
            get { return this.totalalumnos; }
            set { this.totalalumnos = value; }
        }

        public string NumAprobados
        {
            get { return this.numaprobados; }
            set { this.numaprobados = value; }
        }

        public string NumReprobados
        {
            get { return this.numreprobados; }
            set { this.numreprobados = value; }
        }

        public string PromAsistencia
        {
            get { return this.promasistencia; }
            set { this.promasistencia = value; }
        }

        public string PromNotasFinales
        {
            get { return this.promnotafinal; }
            set { this.promnotafinal = value; }
        }

        public string PromAprobados
        {
            get { return this.promaprobados; }
            set { this.promaprobados = value; }
        }

        public string PromReprobados
        {
            get { return this.promreprobados; }
            set { this.promreprobados = value; }
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