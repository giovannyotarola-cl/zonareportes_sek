using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using APRPAsignaturas;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Funciones Funciones = new Funciones();

        Dictionary<string, string> asignaturas = Funciones.Asignaturas();
        Dictionary<string, string> facultades = Funciones.Facultades();
        Dictionary<string, string> carreras = Funciones.Carreras();
		//Se agrega consulta por años
		//Dictionary<string, string> anos = Funciones.Anos();

        Asignaturas_TYPE listaAsignaturas = new Asignaturas_TYPE();
        Facultades_TYPE listaFacultades = new Facultades_TYPE();
        Carreras_TYPE listaCarreras = new Carreras_TYPE();
		
		//Anos_TYPE listaAnos = new Anos_TYPE();

        if (listaFacultades.CodigoError == 0)
        {
            lb_facultad.DataSource = facultades;
            lb_facultad.DataValueField = "key";
            lb_facultad.DataTextField = "value";
            lb_facultad.DataBind();
        }
        else
        {
            Response.Write(listaFacultades.GlosaError);
        }
		
		/*if (listaAnos.CodigoError == 0)
        {
            lb_anio.DataSource = listaAnos;
            lb_anio.DataValueField = "key";
            lb_anio.DataTextField = "value";
            lb_anio.DataBind();
        }
        else
        {
            Response.Write(listaAnos.GlosaError);
        }*/

        if (listaCarreras.CodigoError == 0)
        {
            lb_carrera.DataSource = carreras;
            lb_carrera.DataValueField = "key";
            lb_carrera.DataTextField = "value";
            lb_carrera.DataBind();
        }
        else
        {
            Response.Write(listaCarreras.GlosaError);
        }

        if (listaAsignaturas.CodigoError == 0)
        {
            /*lb_asignatura.DataSource = asignaturas;
            lb_asignatura.DataValueField = "key";
            lb_asignatura.DataTextField = "value";
            lb_asignatura.DataBind();*/
        }
        else
        {
            Response.Write(listaAsignaturas.GlosaError);
        }
    }
}