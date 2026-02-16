using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Services.Protocols;
using System.ComponentModel;

namespace AutoPostulacion.WS
{
    /// <summary>
    /// Descripción breve de WebService2
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WebService2 : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void ActualizarIndicador()
        {
            string facultad = HttpContext.Current.Request.Params[0].ToString();
            string carrera = HttpContext.Current.Request.Params[1].ToString();
            string cohorte = HttpContext.Current.Request.Params[2].ToString();
            string jornada = HttpContext.Current.Request.Params[3].ToString();
            string estado = HttpContext.Current.Request.Params[4].ToString();
            string sexo = HttpContext.Current.Request.Params[5].ToString();
            string region = HttpContext.Current.Request.Params[6].ToString();
            string comuna = HttpContext.Current.Request.Params[7].ToString();
            string aprobado = HttpContext.Current.Request.Params[8].ToString();

            string sql = " ";
            DataSet ds;
            string Rut = "1=1";
            string sJSON = "";

            /*sql = sql + " select RutaArchivo, Ano from SEK_REGISTRO_POSTULACION_ONLINE ";
            sql = sql + " where Ano = '2018' ";
            sql = sql + " and Periodo = '1' ";
            sql = sql + " and Tipo in ('PAG','DPA','CON') ";*/

            sql = "exec [sp_get_datos_contratos_prueba] '3','" + facultad + "','" + carrera + "','" + cohorte + "','" + jornada + "','" + estado + "','" + sexo + "','" + region + "','" + comuna + "','" + aprobado + "'";

            ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", Rut, sql);

            List<indicadores> ind = new List<indicadores>();

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ind.Add(new indicadores()
                {
                    total_ingresos = ds.Tables[0].Rows[i]["INGRESOS"].ToString(),
                    total_aprobados = ds.Tables[0].Rows[i]["APROBADOS"].ToString(),
                    total_descargados = ds.Tables[0].Rows[i]["DESCARGADOS"].ToString(),
                    total_rechazados = ds.Tables[0].Rows[i]["RECHAZADOS"].ToString(),
                    total_matriculados = ds.Tables[0].Rows[i]["MATRICULADOS"].ToString()
                });

            }
            var mydata = ind;
            JavaScriptSerializer js = new JavaScriptSerializer();
            js.MaxJsonLength = int.MaxValue;
            Context.Response.Write(js.Serialize(mydata));
        }

        public class Filtro
        {

            public List<Filtros> data { get; set; }
        }

        public class Filtros
        {
            public string facultad { get; set; }
            public string carrera { get; set; }
            public string cohorte { get; set; }
            public string jornada { get; set; }
            public string estado { get; set; }
            public string sexo { get; set; }
            public string region { get; set; }
            public string comuna { get; set; }
            public string aprobado { get; set; }

        }

        public class indicadores
        {
            public string total_ingresos { get; set; }
            public string total_aprobados { get; set; }
            public string total_descargados { get; set; }
            public string total_rechazados { get; set; }
            public string total_matriculados { get; set; }
        }

        public class DataTable
        {
            public int iTotalRecords { get; set; }

            public int iTotalDisplayRecords { get; set; }

            public List<indicadores> aaData { get; set; }
        }
    }
}
