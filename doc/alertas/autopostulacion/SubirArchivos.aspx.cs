using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;
using System.Data;
using Microsoft.VisualBasic.FileIO;

namespace AutoPostulacion
{
    public partial class _SubirArchivos : System.Web.UI.Page
    {
        //string servidor = "c:\\users\\" + Environment.UserName + "\\documents\\";
        //string Servidor = "C:\\Webs\\3_Universidades\\contratos.usek.cl\\Temp\\";
        string Servidor = "E:\\";
        string ArchivoSubirContrato = string.Empty;
        string ArchivoSubirDetalle = string.Empty;
        string ArchivoSubirPagare = string.Empty;
        string RUT = string.Empty;
        string CODCLI = string.Empty;
        string RutaContrato = string.Empty;
        string RutaDetalle = string.Empty;
        string RutaPagare = string.Empty;
        double cuentaArchivos = 0;

        string Ano = string.Empty;
        string Periodo = string.Empty;

        static string yourSuperSecretDirectory = @"C:\inetpub\wwwroot\AutoPostulacion\DocumentosSubidos";

        string sql = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null & Session["RUTALUMNO"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            
            if (Session["User"] != null)
            {
                Session["mostrar_menu"] = "1";
            }

            lbl_ArchivoContrato.Visible = true;
            ruta_ArchivoContrato.Visible = true;
            
            lbl_ArchivoDetalle.Visible = true;
            ruta_ArchivoDetalle.Visible = true;
            
            lbl_ArchivoPagare.Visible = true;
            ruta_ArchivoPagare.Visible = true;
            
            lbl_hayArchivosCargados.Visible = false;
            btn_subirArchivos.Visible = false;

            if (Session["RUTALUMNO"] != null)
            {
                RUT = Session["RUTALUMNO"].ToString();
                Session["User"] = Session["RUTALUMNO"].ToString();
                //bntBuscarRUT.Visible = false;
                txt_Rut.Text = RUT;
                txt_Rut.Enabled = false;
                buscaarchivo();
                //bucadatos();
            }
        }

        protected void btn_subirArchivos_Click(object sender, EventArgs e)
        {
            RUT = txt_Rut.Text;
            try
            {
                getAnoPeriodo();

                if ((ruta_ArchivoContrato.PostedFile != null) && (ruta_ArchivoContrato.PostedFile.ContentLength > 0))
                {
                    //subirArchivo(ruta_ArchivoContrato, "ARCHIVO CONTRATO FIRMADO");
                    //subirArchivoFTP2(ruta_ArchivoContrato, "ftp://192.168.200.50/3_Universidades/contratos.usek.cl/DocumentosSubidos/",RUT,"luis.galindo","luisG2018");
                    subirArchivoFTP3(ruta_ArchivoContrato, RUT);
                    Conexion.registroActividad(RUT, DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToLongTimeString(), "ARCHIVO CONTRATO FIRMADO", "http://192.168.30.215/AutoPostulacion/DocumentosSubidos/" + RUT + "/" + ruta_ArchivoContrato.FileName,Ano,Periodo,"CON");
                    cuentaArchivos = cuentaArchivos + 1;
                }
                if ((ruta_ArchivoDetalle.PostedFile != null) && (ruta_ArchivoDetalle.PostedFile.ContentLength > 0))
                {
                    //subirArchivo(ruta_ArchivoDetalle, "ARCHIVO DETALLE FIRMADO");
                    subirArchivoFTP3(ruta_ArchivoDetalle, RUT);
                    Conexion.registroActividad(RUT, DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToLongTimeString(), "ARCHIVO DETALLE FIRMADO", "http://192.168.30.215/AutoPostulacion/DocumentosSubidos/" + RUT + "/" + ruta_ArchivoDetalle.FileName,Ano,Periodo,"DPA");
                    cuentaArchivos = cuentaArchivos + 1;

                }
                if ((ruta_ArchivoPagare.PostedFile != null) && (ruta_ArchivoPagare.PostedFile.ContentLength > 0))
                {
                    //subirArchivo(ruta_ArchivoPagare, "ARCHIVO PAGARE FIRMADO");
                    subirArchivoFTP3(ruta_ArchivoPagare, RUT);
                    Conexion.registroActividad(RUT, DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToLongTimeString(), "ARCHIVO PAGARE FIRMADO", "http://192.168.30.215/AutoPostulacion/DocumentosSubidos/" + RUT + "/" + ruta_ArchivoPagare.FileName,Ano,Periodo,"PAG");
                    cuentaArchivos = cuentaArchivos + 1;

                }
                if (cuentaArchivos >= 1)
                {
                    Session.Remove("RUTALUMNO");
                    Session.Remove("User");
                    string script = @"alert('Documentos guardados correctamente.');window.location = 'http://alumnosnet.usek.cl/';window.close(); ";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language = 'javascript'>alert('Error al Subir los archivos')</script>");
                return;
            }

        }

        protected void buscaarchivo()
        {
            string EstContrato = "";
            string EstAnexCon = "";
            string EstPagare = "";
            string ANO = "";
            string PERIODO = "";

            lbl_ArchivoContrato.Visible = true;
            lbl_ArchivoDetalle.Visible = true;
            lbl_ArchivoPagare.Visible = true;

            DataSet ds;
            ds = Conexion.BuscarDatos_ds("BUSCADOCUMENTO", txt_Rut.Text, "");

            if (ds.Tables[0].Rows.Count > 0)
            {
                txt_Rut.Text = ds.Tables[0].Rows[0]["RUTALUMNO"].ToString();
                EstContrato = ds.Tables[0].Rows[0]["EST_CONTRATO"].ToString();
                EstAnexCon = ds.Tables[0].Rows[0]["EST_ANXCOMPROMISO"].ToString();
                EstPagare = ds.Tables[0].Rows[0]["EST_PAGARE"].ToString();
                ANO = ds.Tables[0].Rows[0]["ANO"].ToString();
                PERIODO = ds.Tables[0].Rows[0]["PERIODO"].ToString();
            }
            if (EstContrato.Trim() != "" && EstAnexCon.Trim() != "" && EstPagare.Trim() != "")
            {
                if (EstContrato != "Rechazado")
                {
                    lbl_ArchivoContrato.Visible = true;
                    ruta_ArchivoContrato.Visible = false;
                    btn_subirArchivos.Visible = false;
                    lbl_hayArchivosCargados.Visible = true;
                    btn_subirArchivos.Visible = true;
                    lbl_hayArchivosCargados.Text = "Usted presenta archivos cargados en la plataforma los cuales están deshabilitados para subir";
                }
                if (EstAnexCon != "Rechazado")
                {
                    lbl_ArchivoDetalle.Visible = true;
                    ruta_ArchivoDetalle.Visible = false;
                    btn_subirArchivos.Visible = false;
                    lbl_hayArchivosCargados.Visible = true;
                    btn_subirArchivos.Visible = true;
                    lbl_hayArchivosCargados.Text = "Usted presenta archivos cargados en la plataforma los cuales están deshabilitados para subir";
                }
                if (EstPagare != "Rechazado")
                {
                    lbl_ArchivoPagare.Visible = true;
                    ruta_ArchivoPagare.Visible = false;
                    btn_subirArchivos.Visible = false;
                    lbl_hayArchivosCargados.Visible = true;
                    btn_subirArchivos.Visible = true;
                    lbl_hayArchivosCargados.Text = "Usted presenta archivos cargados en la plataforma los cuales están deshabilitados para subir";
                }
            }
            else
            {
                lbl_ArchivoContrato.Visible = true;
                ruta_ArchivoContrato.Visible = true;
                btn_subirArchivos.Visible = true;

                lbl_ArchivoDetalle.Visible = true;
                ruta_ArchivoDetalle.Visible = true;
                btn_subirArchivos.Visible = true;

                lbl_ArchivoPagare.Visible = true;
                ruta_ArchivoPagare.Visible = true;
                btn_subirArchivos.Visible = true;
            } 

        }

        //protected void bntBuscarRUT_Click(object sender, EventArgs e)
        //{
        //    bucadatos();
        //}

        //protected void bucadatos()
        //{
        //    //rutFormatear(txt_Rut.Text);
        //    RUT = txt_Rut.Text;
        //    CODCLI = CODCLI = RUT.Substring(0, RUT.IndexOf("-"));
        //    DataSet ds;
        //    sql = "";
        //    sql = sql + " select RutaArchivo from SEK_REGISTRO_POSTULACION_ONLINE ";
        //    sql = sql + " where Ano = '" + Ano + "' ";
        //    sql = sql + " and Periodo = '" + Periodo + "' ";
        //    sql = sql + " and Tipo in ('PAG','DPA','CON') ";
        //    sql = sql + " and RutAlumno = '" + RUT + "' ";

        //    //ds = Conexion.BuscarDatos_ds("DOC_GENERA_ALUMNOS", RUT, sql);
        //    ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", RUT, sql);

        //    //No esta la opcion doc_genera_alumnos
        //    if (ds.Tables[0].Rows.Count <= 0)
        //    {
        //        RUT = txt_Rut.Text;
        //        lbl_ArchivoContrato.Visible = true;
        //        ruta_ArchivoContrato.Visible = true;
        //        lbl_ArchivoDetalle.Visible = true;
        //        ruta_ArchivoDetalle.Visible = true;
        //        lbl_ArchivoPagare.Visible = true;
        //        ruta_ArchivoPagare.Visible = true;
        //        btn_subirArchivos.Visible = true;
        //    }
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        lbl_hayArchivosCargados.Visible = true;
        //        string script = @"alert('La información para este RUT ya fue cargada');window.opener.location.reload();window.close(); ";
        //        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
        //        txt_Rut.Text = "";
        //    }
        //}


        protected void btn_salir_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void subirArchivoFTP2(FileUpload rutaArchivo, string ftp, string ftpFolder, string loginName, string password)
        {
            if (rutaArchivo.HasFile)
            {
                string filename = Path.Combine(yourSuperSecretDirectory, rutaArchivo.FileName);
                rutaArchivo.SaveAs(filename); //actually save/upload the file

                string temp = ftp + ftpFolder + filename;


                try
                {
                    using (WebClient client = new WebClient())
                    {
                        client.Credentials = new NetworkCredential(loginName, password);
                        client.UploadFile(temp, "STOR", rutaArchivo.FileName); // ???
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.StackTrace);
                }
            }
        }

        protected void subirArchivo(FileUpload rutaArchivo, string evento)
        {
            string fn = System.IO.Path.GetFileName(rutaArchivo.PostedFile.FileName);
            getAnoPeriodo();

            LoginDb.Funciones.CrearDirFTP(RUT, "ftp://192.168.200.50/3_Universidades/contratos.usek.cl/DocumentosSubidos/", "luis.galindo", "luisG2018");
            //LoginDb.Funciones.subirArchivoFTP(fn, "ftp://192.168.200.50/3_Universidades/contratos.usek.cl/DocumentosSubidos/" + RUT + "/", "luis.galindo", "luisG2018");
            LoginDb.Funciones.subirArchivoFTP(rutaArchivo.UniqueID, "ftp://192.168.200.50/3_Universidades/contratos.usek.cl/DocumentosSubidos/" + RUT + "/", "luis.galindo", "luisG2018");

            Conexion.registroActividad(RUT, DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToLongTimeString(), evento, "http://contratos.usek.cl/DocumentosSubidos/" + RUT + "/" + rutaArchivo.FileName,Ano,Periodo,"");
            cuentaArchivos = cuentaArchivos + 1;
        }

        protected void subirArchivoFTP3(FileUpload file_upload, string RUT)
        {
            string strExtensionName = string.Empty;
            if (file_upload.HasFile)
            {
                if (file_upload.PostedFile.ContentType == "application/pdf")
                {
                    if (file_upload.FileBytes.Length <= 2048 * 1024)
                    {
                        string strFileNameWithPath = file_upload.PostedFile.FileName;
                        // get the extension name of the file
                        strExtensionName = System.IO.Path.GetExtension(strFileNameWithPath);
                        // get the filename of user file
                        string strFileName = System.IO.Path.GetFileName(strFileNameWithPath);

                        //path prueba
                        string pathrut = onServerPath(RUT); //+ RUT;

                        if (!Directory.Exists(pathrut))
                        {
                            Directory.CreateDirectory(pathrut);
                        }

                        string path = pathrut; //+ "\\" + RUT;
                        if (!Directory.Exists(path))
                        {
                            Directory.CreateDirectory(path);
                        }

                        //path funciona para ambos local y servidor por que arriba ya se establece el path 
                        string archivo = path + "\\" + file_upload.FileName;
                        //if (File.Exists(archivo))
                        //    System.IO.File.Delete(archivo);
                        file_upload.PostedFile.SaveAs(archivo);

                    }
                }
            }
        }

        private string onServerPath(string RUT)
        {
            string host = HttpContext.Current.Request.Url.Host.ToLower();
            string path = string.Empty;
            if (host == "localhost")
            {
                path = Server.MapPath("/DocumentosSubidos/" + RUT + "/");
            }
            else
            {
                path = Server.MapPath("~/DocumentosSubidos/" + RUT + "/");
            }
            return path;
        }

        private void getAnoPeriodo()
        {
            DataSet ds;
            try
            {
                ds = Conexion.BuscarDatos_ds("GET_ANO_PERIODO", RUT, "");
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
        //private string rutFormatear(string RUT)
        //{
        //    string rutFormateado = String.Empty;

        //    //obtengo la parte numerica del RUT
        //    string rutTemporal = RUT.Substring(0, RUT.Length - 1);

        //    //obtengo el Digito Verificador del RUT
        //    string dv = RUT.Substring(RUT.Length - 1, 1);

        //    Int64 rut;

        //    //aqui convierto a un numero el RUT si ocurre un error lo deja en CERO
        //    if (!Int64.TryParse(rutTemporal, out rut))
        //    {
        //        rut = 0;
        //    }

        //    //este comando es el que formatea con los separadores de miles
        //    //rutFormateado = rut.ToString("N0");
        //    rutFormateado = rut.ToString();

        //    if (rutFormateado.Equals("0"))
        //    {
        //        rutFormateado = string.Empty;
        //    }
        //    else
        //    {
        //        //si no hubo problemas con el formateo agrego el DV a la salida
        //        rutFormateado += "-" + dv;

        //        //y hago este replace por si el servidor tuviese configuracion anglosajona y reemplazo las comas por puntos
        //        rutFormateado = rutFormateado.Replace(",", ".");
        //    }
        //    //Response.Write("RUT Formateado: " + rutFormateado);
        //    return rutFormateado;
        //}

        //protected void txt_Rut_TextChanged(object sender, EventArgs e)
        //{
        //    txt_Rut.Text = txt_Rut.Text.Replace("-", "");
        //    txt_Rut.Text = txt_Rut.Text.Replace(".", "");
        //}
    }

}
