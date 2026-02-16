using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using SelectPdf;
using System.Data;

namespace AutoPostulacion.Reports
{
    public partial class anexo_compromiso : System.Web.UI.Page
    {
        private bool startConversion = false;
        string RUT = string.Empty;
        string CODCLI = string.Empty;
        string Ano = string.Empty;
        string FechaLargaHoy = string.Format("{0:dd 'de' MMMM 'de' yyyy}", DateTime.Now);
        string FechaHoy = string.Empty;
        string Folio = string.Empty;

        string tablaFolioCuota = string.Empty;
        string tablaFecEmisionCuota = string.Empty;
        string tablaFecVencimientoCuota = string.Empty;
        string tablaMontoCuota = string.Empty;
        string tablaBancoCuota = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            RUT = Request.QueryString["user"];
            CODCLI = RUT.Substring(0, RUT.IndexOf("-"));
            Ano = string.Format("{0:yyyy}", DateTime.Now);
            FechaHoy = DateTime.Now.ToShortDateString();
            Folio = Request.QueryString["Folio"];
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("DETALLE_PAGO", RUT, "");
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblCarrera1.Text = ds.Tables[0].Rows[0]["Carrera"].ToString();
                lblComunaApoderado1.Text = ds.Tables[0].Rows[0]["ComunaAceptante"].ToString();
                lblDomicilioApoderado1.Text = ds.Tables[0].Rows[0]["DomicilioAceptante"].ToString();
                lblDomicilioApoderado2.Text = ds.Tables[0].Rows[0]["DomicilioAceptante"].ToString();
                lblFecha1.Text = ds.Tables[0].Rows[0]["fechaemision"].ToString();
                lblFonoApoderado1.Text = ds.Tables[0].Rows[0]["FonoAceptante"].ToString();
                lblNombreAlumno1.Text = ds.Tables[0].Rows[0]["NombreAlumno"].ToString();
                lblNombreApoderado1.Text = ds.Tables[0].Rows[0]["NombreAceptante"].ToString();
                lblNombreApoderado2.Text = ds.Tables[0].Rows[0]["NombreAceptante"].ToString();
                lblNumPagare1.Text = Folio;
                lblNumPagare2.Text = Folio;
                lblPeriodoAcademico.Text = "";
                lblRutAlumno1.Text = ds.Tables[0].Rows[0]["RutAlumno"].ToString();
                lblRutApoderado1.Text = ds.Tables[0].Rows[0]["RutAceptante"].ToString();
                lblRutApoderado2.Text = ds.Tables[0].Rows[0]["RutAceptante"].ToString();
            }
            ds = Conexion.BuscarDatos_ds("ARANCEL", CODCLI, Ano);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblFecEmisionMatricula.Text = FechaHoy;
                lblMontoMatricula.Text = ds.Tables[0].Rows[0]["Matricula"].ToString();
                //lblFolioArancel.Text = ds.Tables[0].Rows[0]["Folio"].ToString();
            }
            ds = Conexion.BuscarDatos_ds("TABLA_ARANCEL", CODCLI, Folio);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblFolioArancel.Text = ds.Tables[0].Rows[0]["FOLIO"].ToString();
                lblFecEmisionArancel.Text = ds.Tables[0].Rows[0]["HOY"].ToString();
                lblFecVencimientoArancel.Text = ds.Tables[0].Rows[0]["HOY"].ToString();
                lblMontoArancel.Text = ds.Tables[0].Rows[0]["MONTO"].ToString();
            }
            ds = Conexion.BuscarDatos_ds("TABLA_CUOTAS_ARANCEL", CODCLI, Folio);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            //foreach(DataRow dr in ds.Tables[0].Rows)
            {
                tablaFolioCuota = ds.Tables[0].Rows[i]["FOLIO"].ToString();
                tablaFecEmisionCuota = ds.Tables[0].Rows[i]["FEC_EMISION"].ToString();
                tablaFecVencimientoCuota = ds.Tables[0].Rows[i]["FEC_VENCIMIENTO"].ToString();
                tablaMontoCuota = ds.Tables[0].Rows[i]["MONTO"].ToString();
                tablaBancoCuota = ds.Tables[0].Rows[i]["BANCO"].ToString();
                llenarTablaCuotasArancel(i, tablaFolioCuota, tablaFecEmisionCuota, tablaFecVencimientoCuota, tablaMontoCuota, tablaBancoCuota);
            }

            crearPDF();
        }
        protected void crearPDF()
        {
            startConversion = true;
        }
        protected override void Render(HtmlTextWriter writer)
        {
            if (startConversion)
            {
                //obtiene html de la pagina
                TextWriter myWriter = new StringWriter();
                HtmlTextWriter htmlWriter = new HtmlTextWriter(myWriter);
                base.Render(htmlWriter);

                // crea una instancia de un objeto convertidor html a pdf
                HtmlToPdf converter = new HtmlToPdf();

                // crear un nuevo documento pdf convirtiendo el string html de la página
                PdfDocument doc = converter.ConvertHtmlString(
                    myWriter.ToString(), Request.Url.AbsoluteUri);

                // guardar documento pdf
                doc.Save(Response, false, RUT + "_" + string.Format("{0:ddMMyyyy}", DateTime.Now) + "_" + string.Format("{0:HHmmss}", DateTime.Now) + "Anexo_Compromiso.pdf");
                // cerrar documento pdf
                doc.Close();
            }
            else
            {
                // renderizar página web en el navegador
                base.Render(writer);
            }
        }
        protected void llenarTablaCuotasArancel(int i,string foliocuota,string fecemision,string fecvencimiento,string monto,string banco)
        {
            if (i == 0)
            {
                lblFolioCuotaArancel1.Text = foliocuota;
                lblFecEmisionCuotaArancel1.Text = fecemision;
                lblFecVencimientoCuotaArancel1.Text = fecvencimiento;
                lblMontoCuotaArancel1.Text = monto;
                lblBancoCuotaArancel1.Text = banco;
                lblTipoDocumentoCuotaPagare1.Text = "Cuota Pagaré";
            }
            if (i == 1)
            {
                lblFolioCuotaArancel2.Text = foliocuota;
                lblFecEmisionCuotaArancel2.Text = fecemision;
                lblFecVencimientoCuotaArancel2.Text = fecvencimiento;
                lblMontoCuotaArancel2.Text = monto;
                lblBancoCuotaArancel2.Text = banco;
                lblTipoDocumentoCuotaPagare2.Text = "Cuota Pagaré";
            }
            if (i == 2)
            {
                lblFolioCuotaArancel3.Text = foliocuota;
                lblFecEmisionCuotaArancel3.Text = fecemision;
                lblFecVencimientoCuotaArancel3.Text = fecvencimiento;
                lblMontoCuotaArancel3.Text = monto;
                lblBancoCuotaArancel3.Text = banco;
                lblTipoDocumentoCuotaPagare3.Text = "Cuota Pagaré";
            }
            if (i == 3)
            {
                lblFolioCuotaArancel4.Text = foliocuota;
                lblFecEmisionCuotaArancel4.Text = fecemision;
                lblFecVencimientoCuotaArancel4.Text = fecvencimiento;
                lblMontoCuotaArancel4.Text = monto;
                lblBancoCuotaArancel4.Text = banco;
                lblTipoDocumentoCuotaPagare4.Text = "Cuota Pagaré";
            }
            if (i == 4)
            {
                lblFolioCuotaArancel5.Text = foliocuota;
                lblFecEmisionCuotaArancel5.Text = fecemision;
                lblFecVencimientoCuotaArancel5.Text = fecvencimiento;
                lblMontoCuotaArancel5.Text = monto;
                lblBancoCuotaArancel5.Text = banco;
                lblTipoDocumentoCuotaPagare5.Text = "Cuota Pagaré";
            }
            if (i == 5)
            {
                lblFolioCuotaArancel6.Text = foliocuota;
                lblFecEmisionCuotaArancel6.Text = fecemision;
                lblFecVencimientoCuotaArancel6.Text = fecvencimiento;
                lblMontoCuotaArancel6.Text = monto;
                lblBancoCuotaArancel6.Text = banco;
                lblTipoDocumentoCuotaPagare6.Text = "Cuota Pagaré";
            }
        }
    }
}