using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AutoPostulacion
{
    public partial class RevisionArchivos2 : System.Web.UI.Page
    {
        string Rut = string.Empty;
        string sql = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //llenarTabla();
        }
        protected void llenarTabla()
        {
            consultaSQL();
            DataSet ds;
            try
            {
                ds = Conexion.BuscarDatos_ds("EJECUTAR_SQL", Rut, sql);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DataRow currentDataRow = dt.Rows[i];
                        TableRow newRow = new TableRow();

                        for (int j = 0; j < currentDataRow.Table.Columns.Count; j++)
                        {
                            // Create a Cell (<td>)...
                            TableCell newCell = new TableCell();

                            //// Set some properties on the cell...
                            //newCell.BackColor = System.Drawing.Color.White;
                            //newCell.ForeColor = System.Drawing.Color.Black;

                            // Add the text from the DataRow...
                            newCell.Text = currentDataRow[j].ToString();

                            // Add the cell to the row...
                            newRow.Cells.Add(newCell);
                        }
                        // Add the row to the table:
                        //tabla_registros.Rows.Add(newRow);
                    }
                }
            }
            catch
            {
                return;
            }
            

        }
        protected void consultaSQL()
        {
            sql = "";
            sql = " exec SP_REGISTRO_CONTRATOS_ONLINE '' ";
        }
  
    }
}