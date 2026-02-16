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
    public partial class cambiarEstado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string rut = Request.QueryString["rut"];
            string estado = Request.QueryString["estado"];
            string sql = "update Sek_Moodle_Firma_Contrato set estado='"+estado+"' where user_login='"+rut+"'";
            
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", "", sql);
            Response.Redirect("~/AlumnosSinFirma2.aspx");
        }
    }
}