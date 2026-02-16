using AutoPostulacion.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace AutoPostulacion.WS
{
    /// <summary>
    /// Descripción breve de WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetFiltros()
        {
            string cs = ConfigurationManager.ConnectionStrings["MatriculaUISEK_SCL"].ConnectionString;
            List<Filtros> Filtros = new List<Filtros>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_get_datos_contratos", con);
                //cmd.Parameters.Add("RUT","");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@condicion", SqlDbType.VarChar).Value = '2';

                //SqlParameter P_RUT = new SqlParameter("RUT", RUT);

                // cmd.Parameters.Add(P_RUT);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Filtros filtro = new Filtros();
                    filtro.Html = rdr["html"].ToString();
                    Filtros.Add(filtro);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(Filtros));

        }        
    }
}
