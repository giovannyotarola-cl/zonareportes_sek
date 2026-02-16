using AutoPostulacion.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace AutoPostulacion.WS
{
    /// <summary>
    /// Descripción breve de FiltrosTabla
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class FiltrosTabla : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetFiltros(string condicion)
        {
            string cs = ConfigurationManager.ConnectionStrings["MatriculaUISEK_SCL"].ConnectionString;
            List<Filtros> Filtro = new List<Filtros>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_get_datos_contratos", con);
                //cmd.Parameters.Add("RUT","");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@condicion", SqlDbType.VarChar).Value = condicion;

                //SqlParameter P_RUT = new SqlParameter("RUT", RUT);

                // cmd.Parameters.Add(P_RUT);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Filtros filtros = new Filtros();
                    //filtros.Value = rdr["value"].ToString();
                    filtros.Html = rdr["html"].ToString();


                    Filtro.Add(filtros);
                }
            }
            /* JavaScriptSerializer js = new JavaScriptSerializer();
             Context.Response.Write(js.Serialize(Filtro));*/

            /*JavaScriptSerializer js = new JavaScriptSerializer();
            js.MaxJsonLength = 500000000;
            string sJSON = js.Serialize(Filtro);
            Context.Response.Write(sJSON);*/

            /*JavaScriptSerializer js = new JavaScriptSerializer();
            string result = js.Serialize(Filtro);

            Context.Response.Clear();
            Context.Response.ContentType = "application/json; charset=utf-8";*/
            //Context.Response.Write(Filtro);

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(Filtro));

        }
    }
}
