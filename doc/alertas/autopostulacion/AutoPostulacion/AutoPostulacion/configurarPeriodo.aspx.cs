using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AutoPostulacion
{
    public partial class configurarPeriodo : System.Web.UI.Page
    {
        int maxAno = DateTime.Now.Year;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["mostrar_menu"] = "1";
            if (Session["User"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            llenarDrpAno();
        }
        protected void llenarDrpAno()
        {
            while (maxAno > 1989)
            {
                drpAno.Items.Add(maxAno.ToString());
                maxAno--;
            }
                

        }

        protected void btn_salir_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void btnActualizarPeriodo_Click(object sender, EventArgs e)
        {
            //MsgBoxPreguntar("si?");
            lbl_ano_selected.Visible = true;
            lbl_semestre_selected.Visible = true;
            lbl_fechaultcuota_selected.Visible = true;


            lbl_ano_selected.Text = drpAno.SelectedValue.ToString();
            lbl_semestre_selected.Text = drpSemestre.SelectedValue.ToString();
            lbl_fechaultcuota_selected.Text = clndFechaUltimaCuota.SelectedDate.ToString();

            try
            {
                Conexion.actualizarFechas(lbl_ano_selected.Text, lbl_semestre_selected.Text, lbl_fechaultcuota_selected.Text);
                MsgBox("Fechas actualizadas correctamente");
            }
            catch
            {
                MsgBox("Error al actualizar las fechas");
            }
            

        }

        public void MsgBox(String msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language = 'javascript'>alert('" + msg + "')</script>");
        }

        //public void MsgBoxPreguntar(String msg)
        //{
        //    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language = 'javascript'>confirm('" + msg + "')</script>");
        //}
    }
}