using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Services.Protocols;

namespace AutoPostulacion
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["mostrar_menu"] = "1";
            if (Session["User"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            string INGRESARON = string.Empty;
            string DESCARGARON = string.Empty;
            string APROBARON = string.Empty;
            string RECHAZARON = string.Empty;
            string MATRICULARON = string.Empty;
            string sql = "exec [sp_get_datos_contratos_prueba] '3','','','','','','','','',''";

            DataSet ds;
            ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", "", sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lbltingresado.Text = ds.Tables[0].Rows[0]["INGRESOS"].ToString();
                lbltdescargado.Text = ds.Tables[0].Rows[0]["DESCARGADOS"].ToString();
                lbltaprobado.Text = ds.Tables[0].Rows[0]["APROBADOS"].ToString();
                lblrechazado.Text = ds.Tables[0].Rows[0]["RECHAZADOS"].ToString();
                lbltmatriculado.Text = ds.Tables[0].Rows[0]["MATRICULADOS"].ToString();

            }
        }

        protected void bntBuscar_Click(object sender, EventArgs e)
        { }



    }
}