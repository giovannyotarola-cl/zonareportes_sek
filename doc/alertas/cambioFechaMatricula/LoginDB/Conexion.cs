using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace cambioFechaMatriculas.LoginDB
{
    public class Conexion
    {
        //obtiene la cadena actual de conexión
        public string Conn = System.Web.HttpContext.Current.Session["Conn"].ToString();

        public static SqlConnection CreateConnection()
        {
            string _connectionString = "server=192.168.100.226;uid=sa;pwd=Sa070507;database=Matricula;";
            return new SqlConnection(_connectionString);
        }

        private static SqlConnection CreateConnectionUMAS()
        {
            string _connectionString = "server=192.168.100.226;uid=sa;pwd=Sa070507;database=Matricula;";
            return new SqlConnection(_connectionString);
        }
        public static DataSet BuscarDatos_ds(string sql)
        {
            SqlDataAdapter da = BuscarDatos(sql);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return (ds);
        }
        private static SqlDataAdapter BuscarDatos(string sql)
        {
            SqlConnection myConnection = CreateConnectionUMAS();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            SqlCommand comando = new SqlCommand(sql, myConnection);
            comando.CommandType = CommandType.Text;
            comando.CommandText = sql;
            //comando.CommandTimeout = 99999999;
            SqlDataAdapter lector = default(SqlDataAdapter);
            try
            {
                lector = new SqlDataAdapter(comando);
            }
            catch (Exception ex)
            {
                lector = null;
            }
            finally
            {
                if (myConnection.State == ConnectionState.Open)
                    myConnection.Close();
            }
            return lector;

        }
        public static string ActualizarAlumno(string codcli, string rut,string ano,string periodo,DateTime fecha)
        {
            string sql = null;
            string messages = string.Empty;
            SqlCommand comando = new SqlCommand();
            SqlConnection myConnection = CreateConnection();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            sql = "Execute SEK_CAMBIO_FECHA_MATRICULA ";
            sql = sql + "'" + ano + "',";
            sql = sql + "'" + periodo + "',";
            sql = sql + "'" + fecha + "',";
            sql = sql + "'" + rut + "',";
            sql = sql + "'" + codcli + "'";
            // crecion de excepcion de la consulta a la base de datos
            try
            {
                comando.Connection = myConnection;
                comando.CommandText = sql;
                // comando.Transaction = oTrans
                //comando.CommandTimeout = 14000
                comando.ExecuteNonQuery();

                messages = "1";

            }
            catch (SqlException ex)
            {
                messages = "-1";
            }
            finally
            {

                if (myConnection.State == ConnectionState.Open)
                    myConnection.Close();
            }
            return messages;

        }

    }
}