using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AutoPostulacion
{
    public partial class MantencionCarrerasAgregar : System.Web.UI.Page
    {
        string CarreraCodigo = string.Empty;
        string Carrera = string.Empty;
        string Codigo = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["mostrar_menu"] = "0";
            btn_salir.Attributes.Add("onclick", "javascript:closeWin();");
            //btnAgregarCarrera.Attributes.Add("onclick", "javascript:openWin();");
            if (!IsPostBack)
            {
                llenarDrpCarreras();
            }
        }
        protected void llenarDrpCarreras()
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("DRP_CARRERAS", "", "");
            drpListaCarreras.DataSource = ds;
            drpListaCarreras.DataTextField = "Carrera";
            drpListaCarreras.DataValueField = "Carrera";
            drpListaCarreras.DataBind();
        }

        protected void btnAgregarCarrera_Click(object sender, EventArgs e)
        {
            if (CarreraCodigo.IndexOf("-") <= 0)
            {
                Carrera = CarreraCodigo;
                Conexion.AgregarCarrera("", Carrera);
            }
            else
            {
                Codigo = CarreraCodigo.Substring(0, CarreraCodigo.IndexOf("-"));
                Carrera = CarreraCodigo.Substring(CarreraCodigo.IndexOf("-"), CarreraCodigo.Length - CarreraCodigo.IndexOf("-"));
                Carrera = Carrera.Substring(1);
                Conexion.AgregarCarrera(Codigo, Carrera);
            }
            //Codigo = CarreraCodigo.Substring(0, CarreraCodigo.IndexOf("-")); 
            //Carrera = CarreraCodigo.Substring(CarreraCodigo.IndexOf("-"), CarreraCodigo.Length - CarreraCodigo.IndexOf("-"));
            //Carrera = Carrera.Substring(1);
            //Conexion.AgregarCarrera(Codigo, Carrera);
            string script = @"alert('Carrera Agregada Exitosamente.');window.opener.location.reload();window.close(); ";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            llenarDrpCarreras();
        }

        protected void drpListaCarreras_SelectedIndexChanged(object sender, EventArgs e)
        {
            CarreraCodigo = drpListaCarreras.SelectedValue.ToString();
        }

        protected void btn_salir_Click(object sender, EventArgs e)
        {
            
        }

        protected void txtBuscarListaCarrera_TextChanged(object sender, EventArgs e)
        {
            llenarDrpCarreras();
        }
    }
}