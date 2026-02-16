using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AutoPostulacion
{
    public partial class RegistroAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["mostrar_menu"] = "1";
            if (Session["User"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void bntBuscar_Click(object sender, EventArgs e)
        {
            llenarGridRegistroAlumno(txt_Rut.Text);
        }

        protected void btn_salir_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void llenarGridRegistroAlumno(string Rut)
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("REGISTRO_ALUMNO", Rut, "");
            if (ds.Tables[0].Rows.Count > 0)
            {
                grdRegistroAlumno.Visible = true;
                grdRegistroAlumno.DataSource = ds;
                grdRegistroAlumno.DataBind();
            }
            else
            {
                grdRegistroAlumno.Visible = false;
                string script = @"alert('No se encontró información para este RUT.');window.opener.location.reload();window.close(); ";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }

        }
    }
}