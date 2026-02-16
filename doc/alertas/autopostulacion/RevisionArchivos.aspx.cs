using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AutoPostulacion
{
    public partial class _RevisionArchivos : System.Web.UI.Page
    {
        string Rut = string.Empty;
        string Mail = string.Empty;

        double CuentaArchivos = 0;

        string Ano = string.Empty;
        string Periodo = string.Empty;

        string sql = string.Empty;

        string _url = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["mostrar_menu"] = "1";

            if (Session["User"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            lbl_ArchivoContrato.Visible = false;
            lbl_RutaArchivoContrato.Visible = false;
            link_RutaArchivoContrato.Visible = false;
            lbl_RutaArchivoContrato.Text = "";
            link_RutaArchivoContrato.Text = "";

            ListEstContrato.Visible = false;
            ListEstAnexContrato.Visible = false;
            ListEstPagare.Visible = false;

            lbl_ArchivoDetalle.Visible = false;
            lbl_RutaArchivoDetalle.Visible = false;
            link_RutaArchivoDetalle.Visible = false;
            lbl_RutaArchivoDetalle.Text = "";
            link_RutaArchivoDetalle.Text = "";
            

            lbl_ArchivoPagare.Visible = false;
            lbl_RutaArchivoPagare.Visible = false;
            link_RutaArchivoPagare.Visible = false;
            lbl_RutaArchivoPagare.Text = "";
            link_RutaArchivoPagare.Text = "";
           

            txt_cuerpoMail.Visible = false;
            lbl_envioMail.Visible = false;
            btn_envioMail.Visible = false;
            txt_MailAlumno.Visible = false;
            lbl_MailAlumno.Visible = false;
            btoGuardar.Visible = false;

            lbl_FechaRecepcionDocumentos.Visible = false;
            lbl_StatusRevision.Visible = false;

        }

        protected void bntBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                Rut = txt_Rut.Text;
                getAnoPeriodo();
                lbl_ArchivoDetalle.Visible = true;
                lbl_ArchivoPagare.Visible = true;
                lbl_ArchivoContrato.Visible = true;
                lbl_RutaArchivoDetalle.Visible = true;
                lbl_RutaArchivoPagare.Visible = true;
                lbl_RutaArchivoContrato.Visible = true;
                lbl_FechaRecepcionDocumentos.Visible = true;
                lbl_StatusRevision.Visible = true;

                ListEstContrato.Visible = true;
                ListEstAnexContrato.Visible = true;
                ListEstPagare.Visible = true;

                btoGuardar.Visible = true;

                //busca mail alumno
                DataSet ds;
                ds = Conexion.BuscarDatos_ds("PAGARE", Rut, "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Mail = ds.Tables[0].Rows[0]["MailAlumno"].ToString();
                }

                //DataSet ds;
                sql = "";
                sql = sql + " select top 1 RutaArchivo from SEK_REGISTRO_POSTULACION_ONLINE ";
                sql = sql + " where Ano = '" + Ano + "' ";
                sql = sql + " and Periodo = '" + Periodo + "' ";
                sql = sql + " and Tipo = 'DPA' ";
                sql = sql + " and RutAlumno = '" + Rut + "' ";
                sql = sql + " order by fecha desc";

                //ds = Conexion.BuscarDatos_ds("DOC_GENERA_ALUMNOS", Rut, "ARCHIVO DETALLE FIRMADO");
                ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", Rut, sql);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txt_cuerpoMail.Visible = true;
                    lbl_envioMail.Visible = true;
                    btn_envioMail.Visible = true;
                    txt_MailAlumno.Visible = true;
                    lbl_MailAlumno.Visible = true;
                    link_RutaArchivoDetalle.Visible = true;
                    link_RutaArchivoDetalle.Text = ds.Tables[0].Rows[0]["RutaArchivo"].ToString();
                    link_RutaArchivoDetalle.NavigateUrl = link_RutaArchivoDetalle.Text;
                    txt_MailAlumno.Text = Mail;
                    FechaRecepcionDocumentos();
                    CuentaArchivos++;
                    //btn_descargaArchivoDetalle.Visible = true;
                }
                else
                {
                    lbl_RutaArchivoDetalle.Visible = true;
                    lbl_RutaArchivoDetalle.Text = "No se encontró el archivo";
                }

                sql = "";
                sql = sql + " select top 1 RutaArchivo from SEK_REGISTRO_POSTULACION_ONLINE ";
                sql = sql + " where Ano = '" + Ano + "' ";
                sql = sql + " and Periodo = '" + Periodo + "' ";
                sql = sql + " and Tipo = 'PAG' ";
                sql = sql + " and RutAlumno = '" + Rut + "' ";
                sql = sql + " order by fecha desc";

                //ds = Conexion.BuscarDatos_ds("DOC_GENERA_ALUMNOS", Rut, "ARCHIVO PAGARE FIRMADO");
                ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", Rut, sql);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txt_cuerpoMail.Visible = true;
                    lbl_envioMail.Visible = true;
                    btn_envioMail.Visible = true;
                    txt_MailAlumno.Visible = true;
                    lbl_MailAlumno.Visible = true;
                    link_RutaArchivoPagare.Visible = true;
                    link_RutaArchivoPagare.Text = ds.Tables[0].Rows[0]["RutaArchivo"].ToString();
                    link_RutaArchivoPagare.NavigateUrl = link_RutaArchivoPagare.Text;
                    txt_MailAlumno.Text = Mail;
                    FechaRecepcionDocumentos();
                    CuentaArchivos++;
                    //btn_descargaArchivoPagare.Visible = true;
                }
                else
                {
                    lbl_RutaArchivoPagare.Visible = true;
                    lbl_RutaArchivoPagare.Text = "No se encontró el archivo";
                }

                sql = "";
                sql = sql + " select top 1 RutaArchivo from SEK_REGISTRO_POSTULACION_ONLINE ";
                sql = sql + " where Ano = '" + Ano + "' ";
                sql = sql + " and Periodo = '" + Periodo + "' ";
                sql = sql + " and Tipo = 'CON' ";
                sql = sql + " and RutAlumno = '"+ Rut + "' ";
                sql = sql + " order by fecha desc";

                //ds = Conexion.BuscarDatos_ds("DOC_GENERA_ALUMNOS", Rut, "ARCHIVO CONTRATO FIRMADO");
                ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", Rut, sql);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txt_cuerpoMail.Visible = true;
                    lbl_envioMail.Visible = true;
                    btn_envioMail.Visible = true;
                    txt_MailAlumno.Visible = true;
                    lbl_MailAlumno.Visible = true;
                    //lbl_RutaArchivoContrato.Text = ds.Tables[0].Rows[0]["RutaArchivo"].ToString();
                    link_RutaArchivoContrato.Visible = true;
                    link_RutaArchivoContrato.Text = ds.Tables[0].Rows[0]["RutaArchivo"].ToString();
                    link_RutaArchivoContrato.NavigateUrl = link_RutaArchivoContrato.Text;
                    txt_MailAlumno.Text = Mail;
                    FechaRecepcionDocumentos();
                    CuentaArchivos++;
                    //btn_descargaArchivoContrato.Visible = true;
                }
                else
                {
                    lbl_RutaArchivoContrato.Visible = true;
                    lbl_RutaArchivoContrato.Text = "No se encontró el Archivo";
                }

                if (CuentaArchivos == 0)
                {
                    string script = @"alert('No se encontró documentación cargada para este RUT.');window.opener.location.reload();window.close(); ";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
            }
            catch
            {
                return;
            }
            try
            {
                DataSet ds;
                ds = Conexion.BuscarDatos_ds("COMBOBOX", Session["Tipo_Usuario"].ToString() , "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ListEstPagare.Visible = true;
                    ListEstPagare.DataSource = ds;
                    ListEstPagare.DataTextField = "NOM_ESTADO";
                    ListEstPagare.DataValueField = "ID_ESTADO";              
                    ListEstPagare.DataBind();

                    ListEstPagare.SelectedIndex = 0;

                    ListEstAnexContrato.Visible = true;
                    ListEstAnexContrato.DataSource = ds;
                    ListEstAnexContrato.DataTextField = "NOM_ESTADO";
                    ListEstAnexContrato.DataValueField = "ID_ESTADO";
                    ListEstAnexContrato.DataBind();

                    ListEstPagare.SelectedIndex = 0;

               
                    ListEstPagare.DataSource = ds;
                    ListEstPagare.DataTextField = "NOM_ESTADO";
                    ListEstPagare.DataValueField = "ID_ESTADO";
                    ListEstPagare.DataBind();

                    ListEstPagare.SelectedIndex = 0;
                }
                //for (int i = 1; i < ListEstPagare.Items.Count; i++)
                //{
                //    if (ListEstPagare.Items[i].ToString() == "3")
                //    {
                //        ListEstContrato.SelectedIndex = i;
                //        ListEstPagare.SelectedIndex = i;
                //        break;
                //    }
                //}
            }
            catch
            {
                string script = @"alert('ERROR AL CARGAR ListEstPagare.');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }


        }

        protected void btn_envioMail_Click(object sender, EventArgs e)
        {
            LoginDb.Funciones.EnviarCorreo(txt_cuerpoMail.Text, txt_MailAlumno.Text);
        }

        protected void btn_salir_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }
        protected void FechaRecepcionDocumentos()
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("HORA_RECEPCION_ARCHIVOS", Rut, "FIRMADO");
            if (ds.Tables[0].Rows.Count > 0)
            {
                lbl_FechaRecepcionDocumentos.Visible = true;
                lbl_FechaRecepcionDocumentos.Text = "La documentación para este alumno fue recibida el día ";
                lbl_FechaRecepcionDocumentos.Text = lbl_FechaRecepcionDocumentos.Text + ds.Tables[0].Rows[0]["FechaSubida"].ToString() + " a las ";
                lbl_FechaRecepcionDocumentos.Text = lbl_FechaRecepcionDocumentos.Text + ds.Tables[0].Rows[0]["HoraSubida"].ToString() + ".";
            }
        }
        private void getAnoPeriodo()
        {
            DataSet ds;
            try
            {
                ds = Conexion.BuscarDatos_ds("GET_ANO_PERIODO", Rut, "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Ano = ds.Tables[0].Rows[0]["ANO_ACTUAL"].ToString();
                    Periodo = ds.Tables[0].Rows[0]["SEMESTRE_ACTUAL"].ToString();
                }
            }
            catch
            {
                return;
            }
        }
    }
}
