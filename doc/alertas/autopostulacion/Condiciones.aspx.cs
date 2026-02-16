using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using System.Text;
using System.IO;
using System.Collections;

using Microsoft.VisualBasic;


namespace AutoPostulacion
{
    public partial class _Condiciones : System.Web.UI.Page
    {
        string RutaEntrada = string.Empty;
        string NombreArchivoContrato = string.Empty;
        string NombreArchivoDetalle = string.Empty;
        string NombreArchivoPagare = string.Empty;
        string Servidor = string.Empty;
        string RutaContrato = string.Empty;
        string RutaDetalle = string.Empty;
        string RutaPagare = string.Empty;

        string RUT = string.Empty;

        string CODCLI = "-";

        string FechaHoy = string.Empty;
        string FechaLargaHoy = string.Empty;

        double CuentaArchivos = 0;

        string Deuda = string.Empty;

        string Documento = "TODOS";

        string Ano = string.Empty;
        double Semestre = 0;
        string Folio = string.Empty;

        bool AlumnoValido = true;

        string CodigoCarrera = string.Empty;

        string ultimaMatricula = string.Empty;
        int UltimaMatricula_Ano ;
        int UltimaMatricula_Periodo ;

        string AnoUmas = string.Empty;//SE AGREGA AL AÑO ADMISION U+
        string PeriodoUmas=string.Empty; //SE AGREGA AL PERIODO ADMISION U+

        bool generarDetalle = false;

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                RUT = Request.QueryString["user"];
                RUT = RUT.Substring(0, RUT.Length - 1) + "-" + RUT.Substring(RUT.Length - 1, 1);
                CODCLI = RUT.Substring(0, RUT.IndexOf("-"));
                Session["RUTALUMNO"] = RUT;
                FechaHoy = DateTime.Now.ToShortDateString();
                FechaLargaHoy = string.Format("{0:dd 'de' MMMM 'de' yyyy}", DateTime.Now);

                getAnoPeriodo();
                obtenerAnoPeriodo();
                mostrarCondiciones(false);

                DataSet ds;
                ds = Conexion.BuscarDatos_ds("CONTRATO", RUT, "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblRutAlumno.Text = "Rut: " + ds.Tables[0].Rows[0]["RutAlumno"].ToString();
                    lblNombreAlumno.Text = "Alumno: " + ds.Tables[0].Rows[0]["NombreAlumno"].ToString();
                    lblNombreCarrera.Text = "Carrera: " + ds.Tables[0].Rows[0]["Carrera"].ToString();
                    CodigoCarrera = ds.Tables[0].Rows[0]["CodigoCarrera"].ToString();
                }
                else
                {
                    //lblEstadoDeuda.Visible = true;
                    //lblEstadoDeuda.Text = "Alumno no existe";
                    //return;
                    Response.Redirect("error.aspx?error=Rut_No_Encontrado");
                }

                //validarCarrera(CodigoCarrera);
                if (AlumnoValido == false)
                {
                    lblEstadoDeuda.Visible = true;
                    lblEstadoDeuda.Text = "Para esta Carrera no se encuentra disponible esta opción.";
                    return;
                }
                else
                {
                    validarAlumno(CODCLI); //validar deudas y si está matriculado o no
                    if (AlumnoValido == false)
                    {
                        return;
                    }
                    else
                    {
                        validarUltimaMatricula(CODCLI);
                        if (AlumnoValido == false)
                        {
                            lblUltimaMatricula.Visible = true;
                            lblUltimaMatricula.Text = "Última Matricula Registrada es previa al semestre Anterior. Favor regularizar situación";
                        }
                        else
                        {
                            mostrarCondiciones(true);
                        }
                    }

                    if (!IsPostBack)
                    {
                        Conexion.registroActividad(RUT, DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString(), "INGRESO A PAGINA", "", AnoUmas, PeriodoUmas, "");
                    }
                }
            }
            catch
            {
                Response.Redirect("error.aspx?error=Error");
            }


        }

        protected void chk_aceptar_CheckedChanged(object sender, EventArgs e)
        {
            mostrarControlesCondiciones();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            //DataSet ds;
            //ds = Conexion.BuscarDatos_ds("DOC_GENERA_ALUMNOS", RUT, "GENERADO");
            //if (ds.Tables[0].Rows.Count <= 0)
            //{
            if (!IsPostBack)
            {
                btnAceptar.Enabled = false;
               
            }

            if (drpFormaPago.SelectedValue.ToString() == "Pagaré")
            {
                if (Documento == "DETALLE")
                {
                    generarDetallePago();
                }
                if (Documento == "CONTRATO")
                {
                    generarContrato();
                }
                if (Documento == "PAGARE")
                {
                    generarPagare();
                }
                if (Documento == "TODOS")
                {
                    generarDetallePago();
                    generarContrato();
                    generarPagare();
                }
                

                if (CuentaArchivos >= 1)
                {
                    string script = @"alert('Estimado(a) Alumno(a): La documentación solicitada se ha generado correctamente.');window.opener.location.reload();window.close(); ";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
                //}

            }
            //else
            //{
            //string script = @"alert('Estimado(a) Alumno(a): Según nuestros registros, usted ya generó su documentación.');window.opener.location.reload();window.close(); ";
            //ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            //}
        }

        protected void btn_salir_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://alumnosnet.usek.cl/");
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SubirArchivos.aspx");
        }


        protected void mostrarControlesCondiciones()
        {
            lbl_FormaPago.Visible = chk_aceptar.Checked;
            drpFormaPago.Visible = chk_aceptar.Checked;
            btnContrato.Visible = chk_aceptar.Checked;
            btnDetalle.Visible = chk_aceptar.Checked;
            btnPagare.Visible = chk_aceptar.Checked;
            //btnSubir.Visible = chk_aceptar.Checked;
        }

        protected void generarDetallePago()
        {
            Conexion.registroActividad(RUT, DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString(), "ARCHIVO DETALLE PAGO GENERADO", "", AnoUmas, PeriodoUmas, "");
            Response.Redirect("~/Reports/anexo_compromiso.aspx?user=" + RUT + "&Folio=" + Folio);
        }

        protected void generarContrato()
        {
            Conexion.registroActividad(RUT, DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString(), "ARCHIVO CONTRATO GENERADO", "", AnoUmas, PeriodoUmas, "");
            
            Response.Redirect("~/Reports/contrato_mandato.aspx?user=" + RUT + "");
        }

        protected void generarPagare()
        {
            Conexion.registroActividad(RUT, DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString(), "ARCHIVO PAGARE GENERADO", "", AnoUmas, PeriodoUmas, "");
            Response.Redirect("~/Reports/pagare.aspx?user=" + RUT + "");
        }

        protected void btnContrato_Click(object sender, EventArgs e)
        {
            Documento = "CONTRATO";
            btnAceptar_Click(sender, e);
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            Documento = "DETALLE";
            crearDetalleArancel();
            if (generarDetalle == true)
            {
                btnAceptar_Click(sender, e);
            }
            else
            {
                //lblUltimaMatricula.Visible = true;
                //lblUltimaMatricula.Text = "Error al generar este documento";
                MsgBox("Error al generar documento de Detalle de Pago");
            }

        }

        protected void btnPagare_Click(object sender, EventArgs e)
        {          
            Documento = "PAGARE";
            btnAceptar_Click(sender, e);
        }
        protected void crearDetalleArancel()
        {
            obtenerAnoPeriodo();

            int AnoActual = Convert.ToInt32(AnoUmas);
            int PeriodoActual = Convert.ToInt32(PeriodoUmas);

            if (PeriodoActual == 1)
            {
                Folio = AnoActual + "01";
            }
            if (PeriodoActual == 2)
            {
                Folio = AnoActual + "02";
            }
            DataSet ds;

            ds = Conexion.BuscarDatos_ds("FOLIO", CODCLI, Folio);

            Folio = ds.Tables[0].Rows[0]["Folio"].ToString();

            //if (ds.Tables[0].Rows[0]["Folio"].ToString() == "")
            //{

            //    Folio = Folio + "00001";
            //}
            //else
            //{
            //    Folio = ds.Tables[0].Rows[0]["Folio"].ToString();
            //}
            string FecEmision = string.Empty;
            string FecVencimiento = string.Empty;
            double monto = 0;
            string banco = string.Empty;

            FecEmision = FechaHoy;
            FecVencimiento = FechaHoy;
            banco = "";

            ds = Conexion.BuscarDatos_ds("ARANCEL", CODCLI, Ano);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //FecEmision = FechaHoy;
                //FecVencimiento = FechaHoy; //cambiar a fecha plazo para vencimiento
                monto = Convert.ToDouble(ds.Tables[0].Rows[0]["Monto"].ToString());
                //banco = "";
                Conexion.crearFolio(Folio, CODCLI, FecEmision, FecVencimiento, monto, banco, AnoActual, PeriodoActual);
                crearDetalleCuotasArancel(Folio, FecEmision, monto);
                generarDetalle = true;
            }
            //Conexion.crearFolio(Folio, CODCLI, FecEmision, FecVencimiento, monto, banco);
            //crearDetalleCuotasArancel(Folio, FecEmision, monto);
            else
            {
                MsgBox("No se encuentra la información relacionada");
                return;
            }
        }
        protected void crearDetalleCuotasArancel(string Folio, string FecEmision, double monto)
        {
            double cuotaNum = 1;
            //double cantCuotas = 6;
            double cantCuotas = 0;
            string FolioCuota = string.Empty;
            var FecVencimiento = Convert.ToDateTime(FecEmision);
            DateTime FecMaxUltimaCuota = new DateTime();

            DataSet ds;
            ds = Conexion.BuscarDatos_ds("FECHA_MAXIMA_ULTIMA_CUOTA", "", "");
            if (ds.Tables[0].Rows.Count > 0)
            {
                FecMaxUltimaCuota = Convert.ToDateTime(ds.Tables[0].Rows[0]["FECHA_MAX_ULTIMA_CUOTA"].ToString());
            }

            cantCuotas = FecMaxUltimaCuota.Month - (Convert.ToDateTime(FecVencimiento)).Month + 1;

            if (cantCuotas >= 6)
            {
                cantCuotas = 6;
            }

            while (cuotaNum <= cantCuotas)
            {
                FolioCuota = Folio + "0" + cuotaNum;
                FecVencimiento = new DateTime(FecVencimiento.Year, FecVencimiento.Month + 1, 1).AddDays(-1);
                Conexion.crearCuotaArancel(Folio, FolioCuota, "", FecEmision, FecVencimiento.ToShortDateString(), Convert.ToInt64(monto / cantCuotas), "");
                FecVencimiento = FecVencimiento.AddMonths(1);
                cuotaNum++;
            }
        }
        protected void validarAlumno(string Rut)
        {
            DataSet dsdeuda;
            dsdeuda = Conexion.BuscarDatos_ds("REVISA_DEUDA", CODCLI, "");
            Deuda = dsdeuda.Tables[0].Rows[0]["ESTADO"].ToString();
            if (Deuda == "DEUDA-NO/MATRICULADO-NO")
            {
                //mostrarCondiciones(true);
            }
            else if (Deuda == "DEUDA-SI/MATRICULADO-NO")
            {
                lblEstadoDeuda.Visible = true;
                lblEstadoDeuda.Text = "Alumno con deuda. Favor regularizar situación";
                AlumnoValido = false;
            }
            else if (Deuda == "DEUDA-NO/MATRICULADO-SI")
            {
                lblEstadoMatricula.Visible = true;
                lblEstadoMatricula.Text = "Alumno ya se encuentra matriculado";
                AlumnoValido = false;
            }
            else
            {
                lblEstadoMatricula.Visible = true;
                lblEstadoMatricula.Text = "Error";
                AlumnoValido = false;
            }
        }

        private void mostrarCondiciones(bool Mostrar)
        {
            txt_Condiciones.Visible = Mostrar;
            chk_aceptar.Visible = Mostrar;
        }

        private void validarCarrera(string Carrera)
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("VALIDA_CARRERA", "", Carrera);
            if (ds.Tables[0].Rows.Count <= 0)
            {
                string script = @"alert('Estimado(a) Alumno(a): Para esta Carrera no se encuentra disponible esta opción.');window.opener.location.reload();window.close(); ";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                AlumnoValido = false;
            }

        }
        private void validarUltimaMatricula(string Rut)
        {
            try
            {
                obtenerAnoPeriodo();
                DataSet ds;
                ds = Conexion.BuscarDatos_ds("VALIDA_ULTIMA_MATRICULA", CODCLI, "");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    UltimaMatricula_Ano = Convert.ToInt32(ds.Tables[0].Rows[0]["ANO_MAT"].ToString());
                    UltimaMatricula_Periodo = Convert.ToInt32(ds.Tables[0].Rows[0]["PERIODO_MAT"].ToString());

                    int AnoActual = Convert.ToInt32(AnoUmas);
                    int PeriodoActual = Convert.ToInt32(PeriodoUmas);


                    if (PeriodoActual == 2)
                    {
                        PeriodoActual = PeriodoActual - 1;
                    }
                    else
                    {
                        AnoActual = AnoActual - 1;
                        PeriodoActual = PeriodoActual + 1;
                    }

                    if (AnoActual == UltimaMatricula_Ano && PeriodoActual== UltimaMatricula_Periodo)
                    {
                        return;
                    }
                    else
                    {
                        AlumnoValido = false;
                    }
                }

            }
            catch
            {
                return;
            }
        }
        private void getAnoPeriodo()
        {
            try
            {
                Ano = string.Format("{0:yyyy}", DateTime.Now);
                Semestre = DateTime.Now.Month;
                if (Semestre <= 6)
                {
                    Folio = Convert.ToString(Convert.ToInt64(Ano) - 1) + "02";
                }
                if (Semestre > 6)
                {
                    //Folio = Convert.ToString(Convert.ToInt64(Ano) - 1) + "01";
                    Folio = Convert.ToString(Convert.ToInt64(Ano)) + "01";
                }
            }
            catch
            {
                return;
            }

        }

        private void obtenerAnoPeriodo()
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("ANOPERIODO", CODCLI, "");

            AnoUmas = ds.Tables[0].Rows[0]["ANO"].ToString();
            PeriodoUmas = ds.Tables[0].Rows[0]["PERIODO"].ToString();

        }
        public void MsgBox(String msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language = 'javascript'>alert('" + msg + "')</script>");
        }


  
    }
}