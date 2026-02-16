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
using APRPAsignaturas;

public partial class Filtros : System.Web.UI.Page
{
    private String strSql;
    public SqlDataAdapter da;
    public DataSet ds;
    public static SqlConnection connString = new SqlConnection();
    public SqlCommand objCommand;

    public Filtros()
    {
        connString.ConnectionString = ConfigurationManager.ConnectionStrings["BD_DEFAULT"].ConnectionString;
        if (connString.State == ConnectionState.Open)
        {
            connString.Close();
        }
    }

    [System.Web.Services.WebMethod]
    public static Dictionary<string, string> filtroFacultad(string codFacultad)
    {

        Dictionary<string, string> listaCarreras = new Dictionary<string, string>();
        Carreras_TYPE lista = new Carreras_TYPE();
        String jornada = "";
        try
        {
            String strSql = "select codcarr, nombre_c, jornada from mt_carrer where (codfac = '" + codFacultad + "') order by nombre_c";

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSql, connString);
            da.Fill(ds, "mt_carrer");

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

    [System.Web.Services.WebMethod]
    public static Dictionary<string, string> filtroCarrera(string codCarrera, string codAno)
    {

        Dictionary<string, string> listaAsignaturas = new Dictionary<string, string>();
        Asignaturas_TYPE lista = new Asignaturas_TYPE();
        try
        {
            String strSql = "select rr.codramo, rr.nombre from ra_seccio rs inner join ra_ramo rr on rs.codramo = rr.codramo where (codcarr = '" + codCarrera + "') and (ano = '" + codAno + "') order by nombre asc";

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSql, connString);
            da.Fill(ds, "ra_seccio");

            listaAsignaturas.Add("", "");
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    lista.Codigo = ds.Tables[0].Rows[i]["codramo"].ToString();
                    lista.Nombre = ds.Tables[0].Rows[i]["nombre"].ToString();

                    listaAsignaturas.Add(lista.Codigo, lista.Nombre);
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
        return listaAsignaturas;
    } 
}