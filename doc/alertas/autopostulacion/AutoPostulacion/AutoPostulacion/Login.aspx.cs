//using iTextSharp.text;
//using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutoPostulacion.LoginDb;
using System.IO;


namespace AutoPostulacion
{
    public partial class _Login : System.Web.UI.Page

    {
        string usuario = string.Empty;
        string usuario_ok = string.Empty;
        string password = string.Empty;
        string password_ok = string.Empty;
        string Tipo_Usuario = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = null;
            Session["Tipo_Usuario"] = null;
            Session["mostrar_menu"] = "0";  //0 - no (login) / 1-si (otras) 
            //Session["CodProf"] = "10006044";
            //Session["Logueado"] = "1";

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            //if (txt_usuario.Text == "revision")
            //{
            //    Response.Redirect("~/revisionarchivos.aspx");
            //}
            //else if (txt_usuario.Text == "recepcion")
            //{
            //    Response.Redirect("~/subirarchivos.aspx");
            //}
            //else
            //{
            //    string script = @"alert('Usuario o password Erroneo'); ";
            //    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            //}
            if (txt_usuario.Text == "")
            {
                MsgBox("Por favor, ingresar nombre de usuario");
                return;
            }
            else
            {
                if (Txt_password.Text =="")
                {
                    MsgBox("Por favor, ingresar contraseña");
                    return;
                }
                else
                {
                    usuario = txt_usuario.Text;
                    password = Txt_password.Text;
                    DataSet ds;
                    try
                    {
                        ds = Conexion.BuscarDatos_ds("LOGIN", txt_usuario.Text, "");
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            password_ok = ds.Tables[0].Rows[0]["Password"].ToString();
                            Tipo_Usuario = ds.Tables[0].Rows[0]["id_TipoUsuario"].ToString();
                        }
                        else
                        {
                            MsgBox("Usuario no encontrado");
                            return;
                        }
                        if (password == password_ok)
                        {
                            Session["conected"] = 1;
                            Session["usuario"] = txt_usuario;

                            Session["tipo_usuario"] = Tipo_Usuario;
                            if (Tipo_Usuario.ToString() == "1")
                            {
                                Response.Redirect("~/detalleDocumentos.aspx");
                            }
                            if (Tipo_Usuario.ToString() == "2")
                            {
                                Response.Redirect("~/detalleDocumentos.aspx");
                            }
                            if (Tipo_Usuario.ToString() == "3")
                            {
                                Response.Redirect("~/subirarchivos.aspx");
                            }
                        }
                        else
                        {
                            MsgBox("Usuario y/o Contraseña incorrecto. Intente nuevamente.");
                        }
                    }
                    catch
                    {
                        return;
                    }
                }
            }
            
        }
        public void MsgBox(String msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language = 'javascript'>alert('" + msg + "')</script>");
        }
    }

}