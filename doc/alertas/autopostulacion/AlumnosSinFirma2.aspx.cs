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
    public partial class AlumnosSinFirma2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string rut = string.Empty;
            string nombre = string.Empty;
            string paterno = string.Empty;
            string materno = string.Empty;
            int estado = 0;
            string sql = " select c.*, cli.nombre, cli.paterno, cli.materno  from Sek_Moodle_Firma_Contrato c, mt_client cli where estado=0 and cli.codcli=c.user_login";


            TableHeaderRow RowTableHead = new TableHeaderRow();
            RowTableHead.TableSection = TableRowSection.TableHeader;

            TableHeaderCell CellHeadRut = new TableHeaderCell();
            TableHeaderCell CellHeadNombre = new TableHeaderCell();
            TableHeaderCell CellHeadPaterno = new TableHeaderCell();
            TableHeaderCell CellHeadMaterno = new TableHeaderCell();
            TableHeaderCell CellHeadEstado = new TableHeaderCell();

            CellHeadRut.Text = "RUT";
            CellHeadNombre.Text = "NOMBRE";
            CellHeadPaterno.Text = "APELLIDO PATERNO";
            CellHeadMaterno.Text = "APELLIDO MATERNO";
            CellHeadEstado.Text = "ESTADO";

            RowTableHead.Cells.Add(CellHeadRut);
            RowTableHead.Cells.Add(CellHeadNombre);
            RowTableHead.Cells.Add(CellHeadPaterno);
            RowTableHead.Cells.Add(CellHeadMaterno);
            RowTableHead.Cells.Add(CellHeadEstado);

            sinFirma.Rows.Add(RowTableHead);

            DataSet ds;
            ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", "", sql);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                TableRow RowTable = new TableRow();
                TableCell CellRut = new TableCell();
                TableCell CellNombre = new TableCell();
                TableCell CellPaterno = new TableCell();
                TableCell CellMaterno = new TableCell();
                TableCell CellEstado = new TableCell();

                rut = ds.Tables[0].Rows[i]["user_login"].ToString();
                nombre = ds.Tables[0].Rows[i]["nombre"].ToString();
                paterno = ds.Tables[0].Rows[i]["paterno"].ToString();
                materno = ds.Tables[0].Rows[i]["materno"].ToString();
                estado = Convert.ToInt32(ds.Tables[0].Rows[i]["estado"].ToString());

                CellRut.Text = rut;
                CellNombre.Text = nombre;
                CellPaterno.Text = paterno;
                CellMaterno.Text = materno;

                if (estado == 0)
                {
                    CellEstado.Text = "<a href='cambiarEstado.aspx?rut=" + rut + "&estado=1'>DESBLOQUEAR</a>";
                }
                else
                {
                    CellEstado.Text = "<a href='cambiarEstado.aspx?rut=" + rut + "&estado=0'>BLOQUEAR</a>";
                }

                RowTable.Cells.Add(CellRut);
                RowTable.Cells.Add(CellNombre);
                RowTable.Cells.Add(CellPaterno);
                RowTable.Cells.Add(CellMaterno);
                RowTable.Cells.Add(CellEstado);
                sinFirma.Rows.Add(RowTable);
            }

        }
    }
}