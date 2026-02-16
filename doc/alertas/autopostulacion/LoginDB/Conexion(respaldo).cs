using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace AutoPostulacion
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
        public static string registroActividad(string rut, string fecha,string observacion,string RutaArchivo,string ano,string periodo,string tipo)
        {
            string tabla = "SEK_REGISTRO_POSTULACION_ONLINE";
            string sql = null;
            string messages = string.Empty;
            SqlCommand comando = new SqlCommand();
            SqlConnection myConnection = CreateConnection();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            sql = "Insert into " + tabla + " values (";
            sql = sql + "'" + rut + "',";
            sql = sql + "'" + fecha + "',";
            sql = sql + "'" + ano + "',";
            sql = sql + "'" + periodo + "',";
            sql = sql + "'" + tipo + "',";
            sql = sql + "'" + observacion + "',";
            sql = sql + "'" + RutaArchivo + "')";
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
        public static DataSet BuscarDatos_ds(string TipoDocumento,string Rut,string Tipo)
        {
            SqlDataAdapter da = BuscarDatos(TipoDocumento,Rut,Tipo);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return (ds);
        }
        private static SqlDataAdapter BuscarDatos(string TipoDocumento,string Rut, string Tipo)
        {
            SqlConnection myConnection = CreateConnectionUMAS();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            string sql;
            sql = "";
            if (TipoDocumento == "DETALLE_PAGO")
            {
                sql = "exec sp_doc_detalle_pago '" + Rut + "'";
            }
            else if (TipoDocumento == "CONTRATO")
            {
                sql = "exec sp_doc_contrato '" + Rut + "'";
            }
            else if (TipoDocumento == "PAGARE")
            {
                sql = "exec sp_doc_pagare '" + Rut + "'";
            }
            else if (TipoDocumento == "DOC_GENERA_ALUMNOS")
            {
                //sql = "exec sp_doc_consulta_archivos '" + Rut + "','" + Tipo + "'";
                sql = Tipo;
            }
            else if (TipoDocumento == "REVISA_DEUDA")
            {
                sql = "exec sp_valida_cliente '" + Rut + "'";
            }
            else if (TipoDocumento == "HORA_RECEPCION_ARCHIVOS")
            {
                sql = "exec sp_doc_status_postulacion '" + Rut + "','" + Tipo + "'";
            }
            else if (TipoDocumento == "GRID_CARRERAS")
            {
                sql = "select * from SEK_POSTULACION_ONLINE_CARRERAS";
            }
            else if (TipoDocumento == "FOLIO")
            {
                sql = "exec SP_DOC_DETALLE_PAGO_Folios '" + Tipo + "'";
            }
            else if (TipoDocumento == "ARANCEL")
            {
                sql = "exec SP_DOC_DETALLE_PAGO_ArancelMatricula '" + Rut + "','" + Tipo + "'";
            }
            else if (TipoDocumento == "TABLA_ARANCEL")
            {
                sql = "exec SP_DOC_DETALLE_PAGO_TABLAS '" + Rut + "','" + Tipo + "'," + "'ARANCEL'";
            }
            else if (TipoDocumento == "TABLA_CUOTAS_ARANCEL")
            {
                sql = "exec SP_DOC_DETALLE_PAGO_TABLAS '" + Rut + "','" + Tipo + "'," + "'CUOTAS_ARANCEL'";
                //sql = "select * from SEK_POSTULACION_ONLINE_CUOTASPAGOARANCEL where FOLIO = '" + Tipo + "'";
            }
            else if (TipoDocumento == "DRP_CARRERAS")
            {
                sql = "select CODCARR + '-' + NOMBRE_L as Carrera from mt_carrer ";
                sql = sql + "where CODCARR not in (SELECT CODIGO from SEK_POSTULACION_ONLINE_CARRERAS)";
                //if(Tipo == "TODOS")
                //{
                //    sql = sql;
                //}
                //else
                //{
                //    sql = sql + " and NOMBRE_L like '%" + Tipo + "%'";
                //}
                
            }
            else if (TipoDocumento == "DRP_CARRERAS_ACTUALES")
            {
                //sql = "select Codigo,Carrera from SEK_POSTULACION_ONLINE_CARRERAS";
                sql = "select Codigo + '-' + Carrera as Carrera from SEK_POSTULACION_ONLINE_CARRERAS";
            }
            else if (TipoDocumento == "VALIDA_CARRERA")
            {
                sql = "select * from SEK_POSTULACION_ONLINE_CARRERAS ";
                sql = sql + "where Codigo = '" + Tipo + "'" ;
            }
            else if (TipoDocumento == "VALIDA_ULTIMA_MATRICULA")
            {
                sql = "select ANO_MAT,PERIODO_MAT from MT_ALUMNO ";
                sql = sql + "where RUT = '" + Rut + "'";
                //sql = "select '2017' as ANO_MAT,'2' as PERIODO_MAT";
            }
            else if (TipoDocumento == "REGISTRO_ALUMNO")
            {
                sql = "select RutAlumno,Fecha,Observacion from sek_registro_postulacion_online ";
                sql = sql + "where RUTAlumno = '" + Rut + "'";
            }
            else if (TipoDocumento == "FECHA_MAXIMA_ULTIMA_CUOTA")
            {
                sql = "select FECHA_MAX_ULTIMA_CUOTA from SEK_POSTULACION_ONLINE_FECHAS";
            }
            else if (TipoDocumento == "GET_ANO_PERIODO")
            {
                sql = "select ANO_ACTUAL,SEMESTRE_ACTUAL from SEK_POSTULACION_ONLINE_FECHAS";
            }
            else if (TipoDocumento == "LOGIN")
            {
                sql = "select dbo.decrypt(Password_Usuario) as Password, id_TipoUsuario from SEK_POSTULACION_ONLINE_USUARIOS ";
                sql = sql + " where Nombre_Usuario = '" + Rut + "'";
            }
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

        public static DataSet BuscarUMAS_ds(string tabla, string campos, string condicion)
        {
            SqlDataAdapter da = BuscarUMAS(tabla, campos, condicion);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return (ds);
        }

        private static SqlDataAdapter BuscarUMAS(string tabla, string campos, string condicion)
        {
            SqlConnection myConnection = CreateConnectionUMAS();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            string sql;
            sql = "SELECT " + campos + " FROM " + tabla + " " + condicion;
            SqlCommand comando = new SqlCommand(sql, myConnection);
            comando.CommandType = CommandType.Text;
            comando.CommandTimeout = 99999999;
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
        public static string crearFolio(string folio, string rut, string fecemision, string fecvencimiento,double monto,string banco)
        {
            string tabla = "SEK_POSTULACION_ONLINE_PAGOARANCEL";
            string sql = null;
            string messages = string.Empty;
            SqlCommand comando = new SqlCommand();
            SqlConnection myConnection = CreateConnection();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            sql = "Insert into " + tabla + " values (";
            sql = sql + "'" + folio + "',";
            sql = sql + "'" + rut + "',";
            sql = sql + "'" + fecemision + "',";
            sql = sql + "'" + fecvencimiento + "',";
            sql = sql + "" + monto + ",";
            sql = sql + "'" + banco + "')";
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
        public static string crearCuotaArancel(string folio, string foliocuota,string rut, string fecemision, string fecvencimiento, double monto, string banco)
        {
            string tabla = "SEK_POSTULACION_ONLINE_CUOTASPAGOARANCEL";
            string sql = null;
            string messages = string.Empty;
            SqlCommand comando = new SqlCommand();
            SqlConnection myConnection = CreateConnection();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            sql = "Insert into " + tabla + " values (";
            sql = sql + "'" + folio + "',";
            sql = sql + "'" + foliocuota + "',";
            sql = sql + "'" + fecemision + "',";
            sql = sql + "'" + fecvencimiento + "',";
            sql = sql + "" + monto + ",";
            sql = sql + "'" + banco + "')";
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
        public static string AgregarCarrera(string codigoCarrera,string Carrera)
        {
            string tabla = "SEK_POSTULACION_ONLINE_CARRERAS";
            string sql = null;
            string messages = string.Empty;
            SqlCommand comando = new SqlCommand();
            SqlConnection myConnection = CreateConnection();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            sql = "Insert into " + tabla + " values (";
            sql = sql + "'" + codigoCarrera + "',";
            sql = sql + "'" + Carrera + "')";
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
        public static string EliminarCarrera(string codigoCarrera, string Carrera)
        {
            string tabla = "SEK_POSTULACION_ONLINE_CARRERAS";
            string sql = null;
            string messages = string.Empty;
            SqlCommand comando = new SqlCommand();
            SqlConnection myConnection = CreateConnection();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            sql = "delete from  " + tabla + " ";
            if (codigoCarrera == "")
            {
                sql = sql + " where Carrera = '" + Carrera + "';";
            }
            else
            {
                sql = sql + " where Codigo = '" + codigoCarrera + "' ";
                sql = sql + " and Carrera = '" + Carrera + "';";
            }

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
        public static string eliminarCarrera(string codigoCarrera, string Carrera)
        {
            string tabla = "SEK_POSTULACION_ONLINE_CARRERAS";
            string sql = null;
            string messages = string.Empty;
            SqlCommand comando = new SqlCommand();
            SqlConnection myConnection = CreateConnection();
            if (myConnection.State == ConnectionState.Closed)
                myConnection.Open();

            sql = "Delete from " + tabla + " ";
            sql = sql + " where Codigo = " + "'" + codigoCarrera + "'";
            sql = sql + " and Carrera = " + "'" + Carrera + "'";
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