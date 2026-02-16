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
    public class Funciones
    {
        private String strSql;
        public SqlDataAdapter da;
        public DataSet ds;
        public static SqlConnection connString = new SqlConnection();
        public SqlCommand objCommand;

        public Funciones()
        {
            connString.ConnectionString = ConfigurationManager.ConnectionStrings["BD_DEFAULT"].ConnectionString;
            da = new SqlDataAdapter();
            ds = new DataSet();
            strSql = "";

            if (connString.State == ConnectionState.Open)
            {
                connString.Close();
            }
        }

        public List<DatosAsignatura_TYPE> Asignatura(DatosAsignatura_TYPE datosAsignatura)
        {
            DatosAsignatura_TYPE infoAsignatura = new DatosAsignatura_TYPE();

            List<DatosAsignatura_TYPE> datos = new List<DatosAsignatura_TYPE>();

            strSql = "select rr.codramo, rr.nombre, rr.credito, rs.codsecc, rs.ano, " +
                     "(select count(estado) from ra_nota where codramo = rr.codramo and ano = '" + datosAsignatura.Anio + "' and codsecc = '1' and estado = 'A') as numA, " +
                     "(select count(estado) from ra_nota where codramo = rr.codramo and ano = '" + datosAsignatura.Anio + "' and codsecc = '1' and estado = 'R') as numR, " +
                     "(select avg(nf) from ra_nota where codramo = rr.codramo and ano = '" + datosAsignatura.Anio + "' and codsecc = '1' and ESTADO in ('A', 'R')) as promN, " +
                     "(select avg(asistencia) from ra_nota where codramo = rr.codramo and ano = '" + datosAsignatura.Anio + "' and codsecc = '1' and estado in ('A', 'R')) as promA " +
                     "from ra_ramo rr " +
                     "inner join ra_seccio rs on rr.codramo = rs.codramo " +
                     "where rs.ano = '" + datosAsignatura.Anio + "'";

            /*if (datosAsignatura.CRamo != "")
            {
                strSql += "and rr.codramo = '" + datosAsignatura.CodigoRamo + "'";
            }*/

            if (datosAsignatura.CodigoCarrera != "")
            {
                strSql += "and rs.codcarr = '" + datosAsignatura.CodigoCarrera + "'";
            }

            if (datosAsignatura.CodigoSeccion != "") 
            {
                strSql += "and rs.codsecc = '" + datosAsignatura.CodigoSeccion + "'";
            }

            //HttpContext.Current.Response.Write(strSql);
            try
            {
                DataSet ds = new DataSet();
                da = new SqlDataAdapter(strSql, connString);
                connString.Open();
                da.Fill(ds, "ra_ramo");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    datos.Add(new DatosAsignatura_TYPE() 
                    { 
                        CodigoCarrera = datosAsignatura.CodigoCarrera,
                        NombreCarrera = datosAsignatura.NombreCarrera
                    });
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        double numAprobados = 0;
                        double numReprobados = 0;
                        double promNota = 0;
                        double promAsis  = 0;

                        if (ds.Tables[0].Rows[i]["numA"].ToString() != "")
                        {
                            numAprobados = Convert.ToInt32(ds.Tables[0].Rows[i]["numA"]);
                        }

                        if (ds.Tables[0].Rows[i]["numR"].ToString() != "")
                        {
                            numAprobados = Convert.ToInt32(ds.Tables[0].Rows[i]["numR"]);
                        }

                        if (ds.Tables[0].Rows[i]["promN"].ToString() != "")
                        {
                            promNota = Convert.ToDouble(ds.Tables[0].Rows[i]["promN"]);
                        }

                        if (ds.Tables[0].Rows[i]["promA"].ToString() != "") 
                        {
                            promAsis = Convert.ToDouble(ds.Tables[0].Rows[i]["promA"]);
                        }

                        double numAlumnos = numAprobados + numReprobados;
                        double promAprobados = (numAprobados * 100) / numAlumnos;
                        double promReprobados = (numReprobados * 100) / numAlumnos;

                        datos.Add(new DatosAsignatura_TYPE()
                        {
                            CodigoRamo = ds.Tables[0].Rows[i]["codramo"].ToString(),
                            NombreRamo = ds.Tables[0].Rows[i]["nombre"].ToString(),
                            CreditoRamo = ds.Tables[0].Rows[i]["credito"].ToString(),
                            CodigoSeccion = ds.Tables[0].Rows[i]["codsecc"].ToString(),
                            PromAprobados = promAprobados.ToString("0.00"),
                            PromReprobados = promReprobados.ToString("0.00"),
                            NumAprobados = numAprobados.ToString(),
                            NumReprobados = numReprobados.ToString(),
                            PromNotasFinales =  promNota.ToString("0.0"),
                            PromAsistencia = promAsis.ToString("0.00"),
                            TotalAlumnos = numAlumnos.ToString(),
                            Anio = ds.Tables[0].Rows[i]["ano"].ToString()
                        });
                        infoAsignatura.CodigoError = 0;
                        infoAsignatura.GlosaError = "Asignatura Encontrada";
                    }
                }
                else
                {
                    infoAsignatura.CodigoError = 1;
                    infoAsignatura.GlosaError = "No se han encontrado Resultados para los filtros aplicados";
                }
            }
            catch (Exception ex)
            {
                infoAsignatura.CodigoError = 2;
                infoAsignatura.GlosaError = "Error SQL " + ex.Message;
            }
            finally
            {
                connString.Close();
                SqlConnection.ClearAllPools();
            }
            //HttpContext.Current.Response.Write(infoAsignatura.GlosaError);
            return datos;
        }

        public Dictionary<string, string> Facultades()
        {
            Dictionary<string, string> listaFacultades = new Dictionary<string, string>();
            Facultades_TYPE lista = new Facultades_TYPE();

            try
            {
                strSql = "select codfac, descripcion from ra_facultad order by descripcion";

                DataSet ds = new DataSet();
                da = new SqlDataAdapter(strSql, connString);
                da.Fill(ds, "ra_seccio");

                listaFacultades.Add("", "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        
                        lista.Codigo = ds.Tables[0].Rows[i]["codfac"].ToString();
                        lista.Nombre = ds.Tables[0].Rows[i]["descripcion"].ToString();

                        listaFacultades.Add(lista.Codigo, lista.Nombre);
                    }
                    lista.CodigoError = 0;
                    lista.GlosaError = "OK";
                }
                else
                {
                    lista.CodigoError = 1;
                    lista.GlosaError = "Lista sín facultades";
                }
            }
            catch (Exception ex)
            {
                lista.CodigoError = 2;
                lista.GlosaError = "Error " + ex.Message;
            }

            connString.Close();
            SqlConnection.ClearAllPools();

            return listaFacultades;
        }

        public Dictionary<string, string> Asignaturas()
        {
            Dictionary<string, string> listaASignaturas = new Dictionary<string, string>();
            Asignaturas_TYPE lista = new Asignaturas_TYPE();

            try
            {
                strSql = "select rs.codramo as codramo, rr.nombre as nombre from ra_seccio rs inner join ra_ramo rr on rr.codramo = rs.codramo where (rs.ano = '2018') group by rs.codramo, rr.nombre";

                DataSet ds = new DataSet();
                da = new SqlDataAdapter(strSql, connString);
                da.Fill(ds, "ra_seccio");

                listaASignaturas.Add("", "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        lista.Codigo = ds.Tables[0].Rows[i]["codramo"].ToString();
                        lista.Nombre = ds.Tables[0].Rows[i]["nombre"].ToString();

                        listaASignaturas.Add(lista.Codigo, lista.Nombre);
                    }
                    lista.CodigoError = 0;
                    lista.GlosaError = "OK";
                }
                else
                {
                    lista.CodigoError = 1;
                    lista.GlosaError = "Lista sín asignaturas";
                }
            }
            catch (Exception ex)
            {
                lista.CodigoError = 2;
                lista.GlosaError = "Error " + ex.Message;
            }

            connString.Close();
            SqlConnection.ClearAllPools();

            return listaASignaturas;
        }

        public Dictionary<string, string> Carreras()
        {
            Dictionary<string, string> listaCarreras = new Dictionary<string, string>();
            Asignaturas_TYPE lista = new Asignaturas_TYPE();
            String jornada = "";

            try
            {
                strSql = "select codcarr, nombre_c, jornada from mt_carrer where tipocarr = 1";

                DataSet ds = new DataSet();
                da = new SqlDataAdapter(strSql, connString);
                da.Fill(ds, "ra_seccio");

                listaCarreras.Add("", "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        if (ds.Tables[0].Rows[i]["jornada"].ToString() != "")
                        {
                            jornada = ds.Tables[0].Rows[i]["jornada"].ToString();
                        }
                        else 
                        {
                            jornada = "S/J";
                        }
                        lista.Codigo = ds.Tables[0].Rows[i]["codcarr"].ToString();
                        lista.Nombre = ds.Tables[0].Rows[i]["nombre_c"].ToString() + " - (" + jornada + ")";

                        listaCarreras.Add(lista.Codigo, lista.Nombre);
                    }
                    lista.CodigoError = 0;
                    lista.GlosaError = "OK";
                }
                else
                {
                    lista.CodigoError = 1;
                    lista.GlosaError = "Lista sín carreras";
                }
            }
            catch (Exception ex)
            {
                lista.CodigoError = 2;
                lista.GlosaError = "Error " + ex.Message;
            }

            connString.Close();
            SqlConnection.ClearAllPools();

            return listaCarreras;
        }

        public List<DatosAsignatura_TYPE> datosCarrera(string codcarr) 
        {
            List<DatosAsignatura_TYPE> result = new List<DatosAsignatura_TYPE>();
            try
            {
                strSql = "select mc.codcarr, mc.nombre_c, mc.sede, rs.descripcion as nomsede, mc.codfac, rf.descripcion as nomfac from mt_carrer mc " +
                         "inner join RA_SEDE rs on mc.sede = rs.codsede " +
                         "inner join Ra_facultad rf on rf.codfac = mc.codfac where mc.codcarr = '" + codcarr + "' ";

                DataSet ds = new DataSet();
                da = new SqlDataAdapter(strSql, connString);
                da.Fill(ds, "mt_carrer");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        result.Add(new DatosAsignatura_TYPE()
                        {
                            CodigoCarrera = ds.Tables[0].Rows[i]["codcarr"].ToString(),
                            NombreCarrera = ds.Tables[0].Rows[i]["nombre_c"].ToString(),
                            CodigoSede = ds.Tables[0].Rows[i]["sede"].ToString(),
                            NombreSede = ds.Tables[0].Rows[i]["nomsede"].ToString(),
                            CodigoFacultad = ds.Tables[0].Rows[i]["codfac"].ToString(),
                            NombreFacultad = ds.Tables[0].Rows[i]["nomfac"].ToString(),
                            CodigoError = 0,
                            GlosaError = "Datos carrera encontrados"
                        });

                    }
                }
                else 
                {
                    result.Add(new DatosAsignatura_TYPE() { 
                        CodigoError = 1,
                        GlosaError = "Datos carrera no encontrados"
                    });
                }
            }
            catch (Exception ex)
            {
                result.Add(new DatosAsignatura_TYPE()
                {
                    CodigoError = 2,
                    GlosaError = "Error Sql " + ex.Message
                });
            }
            
            return result;
        }
    }
}