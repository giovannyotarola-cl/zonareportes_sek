using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APRPAsignaturas
{
    public class Docentes_TYPE
    {
        private string _anio;
        private string _periodo;

        private string _codprof;
        private string _nombre;
        private string _materno;
        private string _paterno;

        private string _codcarr;
        private string _carrera;
        private string _facultad;
        private string _seccion;
        private string _codramo;
        private string _ramo;
		private string _codfac;

        private string _compromiso;

        private int _coderror;
        private string _glosaerror;

        public string Anio
        {
            get { return this._anio; }
            set { this._anio = value; }
        }

        public string Periodo
        {
            get { return this._periodo; }
            set { this._periodo = value; }
        }

        public string Codprof
        {
            get { return this._codprof; }
            set { this._codprof = value; }
        }

        public string Nombre
        {
            get { return this._nombre; }
            set { this._nombre = value; }
        }

        public string Materno
        {
            get { return this._materno; }
            set { this._materno = value; }
        }

        public string Paterno
        {
            get { return this._paterno; }
            set { this._paterno = value; }
        }

        public string Codcarr
        {
            get { return this._codcarr; }
            set { this._codcarr = value; }
        }

        public string Carrera
        {
            get { return this._carrera; }
            set { this._carrera = value; }
        }

        public string Facultad
        {
            get { return this._facultad; }
            set { this._facultad = value; }
        }

        public string Seccion
        {
            get { return this._seccion; }
            set { this._seccion = value; }
        }

        public string Codramo
        {
            get { return this._codramo; }
            set { this._codramo = value; }
        }

        public string Ramo
        {
            get { return this._ramo; }
            set { this._ramo = value; }
        }
		
		public string Codfac
        {
            get { return this._codfac; }
            set { this._codfac = value; }
        }

        public string Compromiso
        {
            get { return this._compromiso; }
            set { this._compromiso = value; }
        }

        public int Coderror
        {
            get { return this._coderror; }
            set { this._coderror = value; }
        }

        public string Glosaerror
        {
            get { return this._glosaerror; }
            set { this._glosaerror = value; }
        }
    }
}