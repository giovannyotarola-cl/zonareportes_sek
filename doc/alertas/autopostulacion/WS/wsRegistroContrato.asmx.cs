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
    /// Descripción breve de wsRegistroContrato
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsRegistroContrato : System.Web.Services.WebService
    {

        [WebMethod]
        //public string HelloWorld()
        //{
        //    return "Hola a todos";
        //}
        //public void GetRegistros(string RUT)
        public void GetRegistros()
        {
            string cs = ConfigurationManager.ConnectionStrings["MatriculaUISEK_SCL"].ConnectionString;
            List<RegistroContratos> Registro = new List<RegistroContratos>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SP_REGISTRO_CONTRATOS_ONLINE", con);
                //cmd.Parameters.Add("RUT","");
                cmd.CommandType = CommandType.StoredProcedure;

                //SqlParameter P_RUT = new SqlParameter("RUT", RUT);

               // cmd.Parameters.Add(P_RUT);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    RegistroContratos registro = new RegistroContratos();
                    registro.Rut = rdr["RUT"].ToString();
                    registro.ApellidoPaterno = rdr["PATERNO"].ToString();
                    registro.ApellidoMaterno = rdr["MATERNO"].ToString();
                    registro.Nombres = rdr["NOMBRE"].ToString();
                    registro.Carrera = rdr["CARRERA"].ToString();
                    registro.Nivel = rdr["NIVEL"].ToString();
                    registro.Categoria = rdr["CATEGORIA"].ToString(); //Convert.ToInt32(rdr["Salary"]);
                    registro.Localidad = rdr["LOCALIDADPRO"].ToString(); //Convert.ToDateTime(rdr["HireDate"]);
                    registro.Mail = rdr["MAIL"].ToString();
                    registro.Documentacion = Convert.ToInt32(rdr["TIPO_DOCUMENTACION"]);
                    registro.Jornada = rdr["JORNADA"].ToString();
                    registro.ArancelReal = Convert.ToInt32(rdr["ARANCEL_REAL"]);
                    registro.ArancelDocumentado = Convert.ToInt32(rdr["ARANCEL_DOCUMENTADO"]);
                    registro.Matriculado = rdr["MATRICULADO"].ToString();
                    registro.Estado = rdr["ESTADO"].ToString();

                    Registro.Add(registro);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(Registro));
        }
    }
}
