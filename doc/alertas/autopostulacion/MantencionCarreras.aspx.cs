using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AjaxControlToolkit.HtmlEditor.Popups;

namespace AutoPostulacion
{
    public partial class _MantencionCarreras : System.Web.UI.Page
    {
        bool mostrarControlesAgregaCarreras = false;
        string Carrera = string.Empty;
        string Codigo = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["mostrar_menu"] = "1";
            if (Session["User"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            btnAgregarCarrera.Attributes.Add("onclick", "javascript:openWin();");
            btnEliminarCarrera.Attributes.Add("onclick", "javascript:openWinEliminar()");
            //if (!IsPostBack)
            //{
            //    mostrarControlesAgregaCarreras = false;
            //}
            btnAgregarCarrera.Visible = true;
            btnAgrega.Visible = false;
            drpListaCarreras.Visible = false;
            llenarGridCarreras();

        }

        protected void llenarGridCarreras()
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("GRID_CARRERAS", "", "");
            grdCarreras.DataSource = ds;
            grdCarreras.DataBind();
        }

        protected void grdCarreras_RowEditing(object sender, EventArgs e)
        {

        }

        protected void btnAgregarCarrera_Click(object sender, EventArgs e)
        {
            //if (mostrarControlesAgregaCarreras == false)
            //{
            //    lblAgregarCarreras.Visible = true;
            //    btnAgrega.Visible = true;
            //    drpListaCarreras.Visible = true;
            //    mostrarControlesAgregaCarreras = true;
            //    llenarDrpCarreras();
            //    return;
            //}
            //if (mostrarControlesAgregaCarreras == true)
            //{
            //    lblAgregarCarreras.Visible = false;
            //    btnAgrega.Visible = false;
            //    drpListaCarreras.Visible = false;
            //    mostrarControlesAgregaCarreras = false;
            //    return;
            //}
        }
        protected void llenarDrpCarreras()
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("DRP_CARRERAS", "", "");
            drpListaCarreras.DataSource = ds;
            drpListaCarreras.DataTextField = "NOMBRE_L";
            drpListaCarreras.DataValueField = "NOMBRE_L";
            drpListaCarreras.DataBind();
        }

        protected void btn_salir_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void grdCarreras_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            TableCell cellCodigo = grdCarreras.Rows[e.RowIndex].Cells[1];
            TableCell cellCarrera = grdCarreras.Rows[e.RowIndex].Cells[2];
            Codigo = cellCodigo.Text;
            Carrera = cellCarrera.Text;
            Conexion.eliminarCarrera(Codigo, Carrera);
            string script = @"alert('Carrera Eliminada Exitosamente.');window.opener.location.reload();window.close(); ";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            return;
        }

        protected void grdCarreras_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void borrarCarrera(object sender, EventArgs e)
        {

        }

        protected void btnEliminarCarrera_Click(object sender, EventArgs e)
        {

        }
    }
}