using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AutoPostulacion
{
    public partial class archivos : System.Web.UI.Page
    {
        string rutaContrato;
        string rutaAnx_contrato;
        string rutaPagare;
        string EstHistContrato;
        string EstHistAnexCon;
        string EstHistPagare;
        string ANO;
        string PERIODO;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                BuscaDatos();
                try
                {
                    DataSet ds1;
                    ds1 = Conexion.BuscarDatos_ds("COMBOBOX", Session["Tipo_Usuario"].ToString(), "");
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                  
                        DropEstContrato.DataSource = ds1;
                        DropEstContrato.DataTextField = "NOM_ESTADO";
                        DropEstContrato.DataValueField = "ID_ESTADO";
                        DropEstContrato.DataBind();

                        DropEstContrato.SelectedIndex = -1;

                        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                        {
                            if (ds1.Tables[0].Rows[i]["HABILITADO"].ToString()=="0")
                            {
                                //DropEstContrato.Items.FindByText(ds1.Tables[0].Rows[i]["NOM_ESTADO"].ToString()).Selected = true;
                                foreach (ListItem item in DropEstContrato.Items)
                                {
                                    if (item.Text == ds1.Tables[0].Rows[i]["NOM_ESTADO"].ToString())
                                    {
                                        item.Attributes.Add("disabled", "disabled");
                                    }
                                }
                            }
                        }
                        DropEstContrato.Items.FindByText(EstHistContrato).Selected = true;


                        DropEstAnexCon.DataSource = ds1;
                        DropEstAnexCon.DataTextField = "NOM_ESTADO";
                        DropEstAnexCon.DataValueField = "ID_ESTADO";
                        DropEstAnexCon.DataBind();

                        DropEstAnexCon.SelectedIndex = -1;

                        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                        {
                            if (ds1.Tables[0].Rows[i]["HABILITADO"].ToString() == "0")
                            {
                                //DropEstContrato.Items.FindByText(ds1.Tables[0].Rows[i]["NOM_ESTADO"].ToString()).Selected = true;
                                foreach (ListItem item in DropEstAnexCon.Items)
                                {
                                    if (item.Text == ds1.Tables[0].Rows[i]["NOM_ESTADO"].ToString())
                                    {
                                        item.Attributes.Add("disabled", "disabled");
                                    }
                                }
                            }
                        }
                        DropEstAnexCon.Items.FindByText(EstHistAnexCon).Selected = true;

                        DropEstPagare.DataSource = ds1;
                        DropEstPagare.DataTextField = "NOM_ESTADO";
                        DropEstPagare.DataValueField = "ID_ESTADO";
                        DropEstPagare.DataBind();

                        DropEstPagare.SelectedIndex = -1;

                        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                        {
                            if (ds1.Tables[0].Rows[i]["HABILITADO"].ToString() == "0")
                            {
                                //DropEstContrato.Items.FindByText(ds1.Tables[0].Rows[i]["NOM_ESTADO"].ToString()).Selected = true;
                                foreach (ListItem item in DropEstPagare.Items)
                                {
                                    if (item.Text == ds1.Tables[0].Rows[i]["NOM_ESTADO"].ToString())
                                    {
                                        item.Attributes.Add("disabled", "disabled");
                                    }
                                }
                            }
                        }
                        DropEstPagare.Items.FindByText(EstHistPagare).Selected = true;
                    }
                }
                catch
                {

                }
            }
        }

        protected void BuscaDatos()
        {
            string rut = Request.QueryString["t"];
            //Session["Tipo_Usuario"] = "2";

            DataSet ds;
            ds = Conexion.BuscarDatos_ds("BUSCADOCUMENTO", rut, "");
            if (ds.Tables[0].Rows.Count > 0)
            {
                txt_Rut.Text = ds.Tables[0].Rows[0]["RUTALUMNO"].ToString();
                txtNombre.Text = ds.Tables[0].Rows[0]["NOMBRE"].ToString();
                rutaContrato = ds.Tables[0].Rows[0]["CONTRATO"].ToString();
                rutaAnx_contrato = ds.Tables[0].Rows[0]["ANX_COMPROMISO"].ToString();
                rutaPagare = ds.Tables[0].Rows[0]["PAGARE"].ToString();
                EstHistContrato = ds.Tables[0].Rows[0]["EST_CONTRATO"].ToString();
                EstHistAnexCon = ds.Tables[0].Rows[0]["EST_ANXCOMPROMISO"].ToString();
                EstHistPagare = ds.Tables[0].Rows[0]["EST_PAGARE"].ToString();
                ANO = ds.Tables[0].Rows[0]["ANO"].ToString();
                PERIODO = ds.Tables[0].Rows[0]["PERIODO"].ToString();
            }

        }

        protected void btoVerContrato_Click(object sender, EventArgs e)
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("BUSCADOCUMENTO", txt_Rut.Text, "");
            rutaContrato = ds.Tables[0].Rows[0]["CONTRATO"].ToString();
            Response.Write("<script> window.open('" + rutaContrato + "','_blank'); </script>");
        }

        protected void btoVerAnexContra_Click(object sender, EventArgs e)
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("BUSCADOCUMENTO", txt_Rut.Text, "");
            rutaAnx_contrato = ds.Tables[0].Rows[0]["ANX_COMPROMISO"].ToString();
            Response.Write("<script> window.open('" + rutaAnx_contrato + "','_blank'); </script>");
        }

        protected void btoVerPagare_Click(object sender, EventArgs e)
        {
            DataSet ds;
            ds = Conexion.BuscarDatos_ds("BUSCADOCUMENTO", txt_Rut.Text, "");
            rutaPagare = ds.Tables[0].Rows[0]["PAGARE"].ToString();
            Response.Write("<script> window.open('" + rutaPagare + "','_blank'); </script>");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            BuscaDatos();

            string mensaje = "";
            string rut = "";
            string estActualContrato = "";
            string estActualAnxcontrato = "";
            string estActualPagare = "";
            string estadoPostul = "";

            rut = txt_Rut.Text;
            estActualContrato =DropEstContrato.SelectedItem.ToString();
            estActualAnxcontrato = DropEstAnexCon.SelectedItem.ToString();
            estActualPagare = DropEstPagare.SelectedItem.ToString();
            try
            {
                if (EstHistContrato != estActualContrato)
                {
                    mensaje = Conexion.GuardarEstados(rut, ANO, PERIODO, "CON", "CAMBIO ESTADO CONTRATO", rutaContrato, EstHistContrato, estActualContrato, estadoPostul);
                }
            }
            catch
            {
                string script = @"alert('Error Cambio de Estado Contrato');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }

            try
            {
                if (EstHistAnexCon != estActualAnxcontrato)
                {
                    mensaje = Conexion.GuardarEstados(rut, ANO, PERIODO, "DPA", "CAMBIO ESTADO ANEXO CONTRATO", rutaAnx_contrato, EstHistAnexCon, estActualAnxcontrato, estadoPostul);
                }
            }
            catch
            {
                string script = @"alert('Error Cambio de Estado Anexo Contrato');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
            try
            {
                if (EstHistPagare != estActualPagare)
                {
                    mensaje = Conexion.GuardarEstados(rut, ANO, PERIODO, "PAG", "CAMBIO ESTADO PAGARE", rutaPagare, EstHistPagare, estActualPagare, estadoPostul);
                }
            }
            catch
            {
                string script = @"alert('Error Cambio de Estado Pagare');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }

            //EstPagare = DropEstPagare.SelectedValue;         
            if (mensaje == "NO")
            {
                string script = @"alert('Error al realizar cambios');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);

            }
            else
            {
                string script = @"alert('Estado Cambiado con Exito');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }

        }
    }
}