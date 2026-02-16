using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Services.Protocols;

namespace AutoPostulacion
{
    public partial class AlumnosSinFirma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["mostrar_menu"] = "1";
            
            string rut = string.Empty;
            int estado = 0;
            string sql = "select * from Sek_Moodle_Firma_Contrato where estado=0";


            TableHeaderRow RowTableHead = new TableHeaderRow();
            RowTableHead.TableSection = TableRowSection.TableHeader;

            TableHeaderCell CellHeadRut = new TableHeaderCell();
            TableHeaderCell CellHeadEstado = new TableHeaderCell();

            CellHeadRut.Text = "RUT";
            CellHeadEstado.Text = "ESTADO";

            RowTableHead.Cells.Add(CellHeadRut);
            RowTableHead.Cells.Add(CellHeadEstado);

            sinFirma.Rows.Add(RowTableHead);

            DataSet ds;
            ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", "", sql);
            for(int i=0;i< ds.Tables[0].Rows.Count;i++)
            {
                TableRow RowTable = new TableRow();
                TableCell CellRut = new TableCell();
                TableCell CellEstado = new TableCell();

                rut = ds.Tables[0].Rows[i]["user_login"].ToString();
                estado = Convert.ToInt32(ds.Tables[0].Rows[i]["estado"].ToString());

                CellRut.Text = rut;
                
                if (estado == 0)
                {
                    CellEstado.Text = "<a href='cambiarEstado.aspx?rut=" + rut + "&estado=1'>DESBLOQUEAR</a>";
                }
                else
                {
                    CellEstado.Text = "<a href='cambiarEstado.aspx?rut=" + rut + "&estado=0'>BLOQUEAR</a>";
                }

                RowTable.Cells.Add(CellRut);
                RowTable.Cells.Add(CellEstado);
                sinFirma.Rows.Add(RowTable);
            }

        }
    }
}