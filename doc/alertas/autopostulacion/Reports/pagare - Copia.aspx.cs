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
    public partial class pagare : System.Web.UI.Page
    {
        private bool startConversion = false;
        string RUT = string.Empty;
        string FechaLargaHoy = string.Format("{0:dd 'de' MMMM 'de' yyyy}", DateTime.Now);
        protected void Page_Load(object sender, EventArgs e)
        {
            RUT = Request.QueryString["user"];
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("PAGARE", RUT, "");
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblCiudadAlumno1.Text = ds.Tables[0].Rows[0]["CiudadAlumno"].ToString();
                lblCiudadAlumno2.Text = ds.Tables[0].Rows[0]["CiudadAlumno"].ToString();
                lblCiudadApoderado1.Text = ds.Tables[0].Rows[0]["CiudadAceptante"].ToString();
                lblCiudadApoderado2.Text = ds.Tables[0].Rows[0]["CiudadAceptante"].ToString();
                lblComunaAlumno1.Text = ds.Tables[0].Rows[0]["ComunaAlumno"].ToString();
                lblComunaAlumno2.Text = ds.Tables[0].Rows[0]["ComunaAlumno"].ToString();
                lblComunaApoderado1.Text = ds.Tables[0].Rows[0]["ComunaAceptante"].ToString();
                lblComunaApoderado2.Text = ds.Tables[0].Rows[0]["ComunaAceptante"].ToString();
                lblDomicilioAlumno1.Text = ds.Tables[0].Rows[0]["DomicilioAlumno"].ToString();
                lblDomicilioAlumno2.Text = ds.Tables[0].Rows[0]["DomicilioAlumno"].ToString();
                lblDomicilioApoderado1.Text = ds.Tables[0].Rows[0]["DomicilioAceptante"].ToString();
                lblDomicilioApoderado2.Text = ds.Tables[0].Rows[0]["DomicilioAceptante"].ToString();
                lblFechaPagoPagare1.Text = "";
                lblFonoAlumno2.Text = ds.Tables[0].Rows[0]["FonoAlumno"].ToString();
                lblFonoApoderado1.Text = ds.Tables[0].Rows[0]["FonoAceptante"].ToString();
                lblFonoApoderado2.Text = ds.Tables[0].Rows[0]["FonoAceptante"].ToString();
                lblMailAlumno2.Text = ds.Tables[0].Rows[0]["MailAlumno"].ToString();
                lblMailApoderado1.Text = ds.Tables[0].Rows[0]["MailAceptante"].ToString();
                lblMailApoderado2.Text = ds.Tables[0].Rows[0]["MailAceptante"].ToString();
                lblMontoPagare1.Text = "";
                lblNombreAlumno1.Text = ds.Tables[0].Rows[0]["NombreAlumno"].ToString();
                lblNombreAlumno2.Text = ds.Tables[0].Rows[0]["NombreAlumno"].ToString();
                lblNombreApoderado1.Text = ds.Tables[0].Rows[0]["NombreAceptante"].ToString();
                lblNombreApoderado2.Text = ds.Tables[0].Rows[0]["NombreAceptante"].ToString();
                lblRutAlumno1.Text = ds.Tables[0].Rows[0]["RutAlumno"].ToString();
                lblRutAlumno2.Text = ds.Tables[0].Rows[0]["RutAlumno"].ToString();
                lblRutApoderado1.Text = ds.Tables[0].Rows[0]["RutAceptante"].ToString();
                lblRutApoderado2.Text = ds.Tables[0].Rows[0]["RutAceptante"].ToString();
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
                doc.Save(Response, false, RUT + "_" + string.Format("{0:ddMMyyyy}", DateTime.Now) + "_" + string.Format("{0:HHmmss}", DateTime.Now) + "Pagare.pdf");

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
