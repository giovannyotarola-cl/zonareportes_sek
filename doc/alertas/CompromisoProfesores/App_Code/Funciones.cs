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

        public List<Docentes_TYPE> Docentes(Docentes_TYPE datosFiltros)
        {
            Docentes_TYPE infoDocentes = new Docentes_TYPE();
            List<Docentes_TYPE> lista = new List<Docentes_TYPE>();

            strSql = "select aedc.ID, aedc.Profesor, rp.ap_pater, rp.ap_mater, rp.nombres, aedc.Asignatura, aedc.Anio, aedc.Periodo, aedc.seccion, mc.nombre_c, aedc.Observacion from SEK_AnalisisEncuestaDocentesCompromiso aedc inner join ra_profes rp on rp.codprof = aedc.profesor inner join mt_carrer mc on mc.codcarr = aedc.carrera where (aedc.ID <> 0) and observacion like '% %' ";

            if (datosFiltros.Codcarr != "")
            {
                strSql += "and (carrera = '" + datosFiltros.Codcarr + "') ";
            }
			
			if (datosFiltros.Codfac != "")
            {
                strSql += "and (mc.codfac = '" + datosFiltros.Codfac + "') ";
            }

            if (datosFiltros.Anio != "")
            {
                strSql += "and (Anio = '" + datosFiltros.Anio + "') ";
            }

            if (datosFiltros.Periodo != "")
            {
                strSql += "and (Periodo = '" + datosFiltros.Periodo + "') ";
            }

            try
            {
                DataSet ds = new DataSet();
                da = new SqlDataAdapter(strSql, connString);
                connString.Open();
                da.Fill(ds, "SEK_AnalisisEncuestaDocentesCompromiso");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        lista.Add(new Docentes_TYPE()
                        {
                            Codprof = ds.Tables[0].Rows[i]["Profesor"].ToString(),
                            Nombre = ds.Tables[0].Rows[i]["ap_pater"].ToString() + " " + ds.Tables[0].Rows[i]["ap_mater"].ToString() + ", " + ds.Tables[0].Rows[i]["nombres"].ToString(),
                            Ramo = ds.Tables[0].Rows[i]["asignatura"].ToString(),
                            Anio = ds.Tables[0].Rows[i]["Anio"].ToString(),
                            Periodo = ds.Tables[0].Rows[i]["Periodo"].ToString(),
                            Seccion = ds.Tables[0].Rows[i]["Seccion"].ToString(),
                            Carrera = ds.Tables[0].Rows[i]["nombre_c"].ToString(),
                            Compromiso = ds.Tables[0].Rows[i]["Observacion"].ToString()
                        });
                    }
                    infoDocentes.Coderror = 1;
                    infoDocentes.Glosaerror = "";
                }
            }
            catch (Exception ex)
            {
                infoDocentes.Coderror = 1;
                infoDocentes.Glosaerror = "Error consulta docente " + ex.Message;
            }
            finally
            {
                connString.Close();
                SqlConnection.ClearAllPools();
            }
         
            return lista;
        }

        public List<DatosAsignatura_TYPE> Asignatura(DatosAsignatura_TYPE datosAsignatura)
        {
            DatosAsignatura_TYPE infoAsignatura = new DatosAsignatura_TYPE();
            List<DatosAsignatura_TYPE> datos = new List<DatosAsignatura_TYPE>();
            
            strSql = "select rr.codramo, rr.nombre from mt_carrer rr where (codcarr <> '') "; 
            
            if (datosAsignatura.CodigoCarrera != "")
            {
                strSql += " and (codcarr '" + datosAsignatura.CodigoCarrera + "')";
            }

            //HttpContext.Current.Response.Write(strSql);
            try
            {
                DataSet ds = new DataSet();
                da = new SqlDataAdapter(strSql, connString);
                connString.Open();
                da.Fill(ds, "mt_carrer");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    datos.Add(new DatosAsignatura_TYPE() 
                    { 
                        CodigoCarrera = datosAsignatura.CodigoCarrera,
                        NombreCarrera = datosAsignatura.NombreCarrera
                    });
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {

                        datos.Add(new DatosAsignatura_TYPE()
                        {
                            CodigoRamo = ds.Tables[0].Rows[i]["codcarr"].ToString(),
                            NombreRamo = ds.Tables[0].Rows[i]["nombre"].ToString(),

                        });
                        infoAsignatura.CodigoError = 0;
                        infoAsignatura.GlosaError = "Asignatura Encontrada";
                    }
                }
                else
                {
                    infoAsignatura.CodigoCarrera = "--";
                    infoAsignatura.NombreCarrera = "--";
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
                //strSql = "select codfac, descripcion from ra_facultad order by descripcion";
				// Se quita la facultad FACULTAD DE CIENCIAS AGROPECUARIAS Y AMBIENTALES
				strSql = "select codfac, descripcion from ra_facultad where codfac <> 'CAA' order by descripcion";

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
		
		/*Se agrega nueva funcion para obtener los años de la tabla y filtrar*/
		
			/*public Dictionary<string, string> Anos()
        {
            Dictionary<string, string> listaAnos = new Dictionary<string, string>();
            Anos_TYPE lista = new Anos_TYPE();

            try
            {
                //strSql = "select codfac, descripcion from ra_facultad order by descripcion";
				// Se quita la facultad FACULTAD DE CIENCIAS AGROPECUARIAS Y AMBIENTALES
				strSql = "select distinct anio from SEK_AnalisisEncuestaDocentesCompromiso";

                DataSet ds = new DataSet();
                da = new SqlDataAdapter(strSql, connString);
                da.Fill(ds, "SEK_AnalisisEncuestaDocentesCompromiso");

                listaAnos.Add("", "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        
                        lista.Codigo = ds.Tables[0].Rows[i]["anio"].ToString();
                        lista.Nombre = ds.Tables[0].Rows[i]["anio"].ToString();

                        listaAnos.Add(lista.Codigo, lista.Nombre);
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

            return listaAnos;
        }*/
		
		/*===================================================================*/

        public Dictionary<string, string> Asignaturas()
        {
            Dictionary<string, string> listaASignaturas = new Dictionary<string, string>();
            Asignaturas_TYPE lista = new Asignaturas_TYPE();

            try
            {
                strSql = "select rs.codramo as codramo, rr.nombre as nombre from ra_seccio rs inner join ra_ramo rr on rr.codramo = rs.codramo where (rs.ano = (select year(getdate()))) group by rs.codramo, rr.nombre";

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
		
		public List<DatosFacultad_TYPE> datosFacultad(string codfac) 
        {
            List<DatosFacultad_TYPE> result = new List<DatosFacultad_TYPE>();
            try
            {
                strSql = "select mc.codcarr, mc.nombre_c, mc.sede, rs.descripcion as nomsede, mc.codfac, rf.descripcion as nomfac from mt_carrer mc " +
                         "inner join RA_SEDE rs on mc.sede = rs.codsede " +
                         "inner join Ra_facultad rf on rf.codfac = mc.codfac where rf.codfac = '" + codfac + "' ";

                DataSet ds = new DataSet();
                da = new SqlDataAdapter(strSql, connString);
                da.Fill(ds, "mt_carrer");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        result.Add(new DatosFacultad_TYPE()
                        {                            
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
                    result.Add(new DatosFacultad_TYPE() { 
                        CodigoError = 1,
                        GlosaError = "Datos facultad no encontrados"
                    });
                }
            }
            catch (Exception ex)
            {
                result.Add(new DatosFacultad_TYPE()
                {
                    CodigoError = 2,
                    GlosaError = "Error Sql " + ex.Message
                });
            }
            
            return result;
        }
    }
}