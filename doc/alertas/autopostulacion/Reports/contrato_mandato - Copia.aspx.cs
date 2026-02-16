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
    public partial class contrato_mandato : System.Web.UI.Page
    {
        private bool startConversion = false;
        string RUT = string.Empty;
        string FechaLargaHoy = string.Format("{0:dd 'de' MMMM 'de' yyyy}", DateTime.Now);
        protected void Page_Load(object sender, EventArgs e)
        {
            RUT = Request.QueryString["user"];
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("CONTRATO", RUT, "");
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblCarrera1.Text = ds.Tables[0].Rows[0]["Carrera"].ToString();
                lblCarrera2.Text = ds.Tables[0].Rows[0]["Carrera"].ToString();
                lblDomicilioAceptante1.Text = ds.Tables[0].Rows[0]["DomicilioAceptante"].ToString();
                lblDomicilioAlumno1.Text = ds.Tables[0].Rows[0]["DomicilioAlumno"].ToString();
                lblEstadoCivilAceptante1.Text = ds.Tables[0].Rows[0]["EstadoCivilAceptante"].ToString();
                lblFacultad1.Text = ds.Tables[0].Rows[0]["Facultad"].ToString();
                lblFecha1.Text = ds.Tables[0].Rows[0]["FechaHoy"].ToString();
                lblJornada1.Text = ds.Tables[0].Rows[0]["Jornada"].ToString();
                lblNombreAceptante1.Text = ds.Tables[0].Rows[0]["NombreAceptante"].ToString();
                lblNombreAlumno1.Text = ds.Tables[0].Rows[0]["NombreAlumno"].ToString();
                lblPagare1.Text = "";//ds.Tables[0].Rows[0]["Pagare"].ToString();
                lblRutAceptante1.Text = ds.Tables[0].Rows[0]["RutAceptante"].ToString();
                lblRutAceptante2.Text = ds.Tables[0].Rows[0]["RutAceptante"].ToString();
                lblRutAlumno1.Text = ds.Tables[0].Rows[0]["RutAlumno"].ToString();
                lblRutAlumno2.Text = ds.Tables[0].Rows[0]["RutAlumno"].ToString();
                lblRutAlumno3.Text = ds.Tables[0].Rows[0]["RutAlumno"].ToString();
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
                // get html of the page
                TextWriter myWriter = new StringWriter();
                HtmlTextWriter htmlWriter = new HtmlTextWriter(myWriter);
                base.Render(htmlWriter);

                // instantiate a html to pdf converter object
                HtmlToPdf converter = new HtmlToPdf();

                // create a new pdf document converting the html string of the page
                PdfDocument doc = converter.ConvertHtmlString(
                    myWriter.ToString(), Request.Url.AbsoluteUri);
                // save pdf document
                doc.Save(Response, false, RUT + "_" + string.Format("{0:ddMMyyyy}", DateTime.Now) + "_" + string.Format("{0:HHmmss}", DateTime.Now) + "Contrato_Mandato.pdf");

                // close pdf document
                doc.Close();
            }
            else
            {
                // render web page in browser
                base.Render(writer);
            }
        }
    }
}