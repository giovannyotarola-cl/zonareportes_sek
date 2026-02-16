using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoPostulacion
{
    public partial class error : System.Web.UI.Page
    {
        string glosaError = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //btnSalir.Attributes.Add("onclick", "javascript:closeWin();");
            glosaError = Request.QueryString["error"];
            if (glosaError == "")
            {
                lblTipoError.Text = "";
            }
            else
            {
                if (glosaError == "Rut_No_Encontrado")
                {
                    lblTipoError.Text = "Rut No Encontrado";
                }
                else if (glosaError == "Error")
                    lblTipoError.Text = "Error";
                else
                {
                    lblTipoError.Text = glosaError;
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://alumnosnet.usek.cl");
        }
    }
}