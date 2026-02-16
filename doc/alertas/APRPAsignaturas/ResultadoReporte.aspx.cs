using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using APRPAsignaturas;

public partial class ResultadoReporte : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DatosAsignatura_TYPE datosAsinatura = new DatosAsignatura_TYPE();
        List<DatosAsignatura_TYPE> infoAsignaturas = new List<DatosAsignatura_TYPE>();
        List<DatosAsignatura_TYPE> infoCarrera = new List<DatosAsignatura_TYPE>();

        Funciones func = new Funciones();
        
        datosAsinatura.CodigoFacultad = Request.Form["MainContent_lb_facultad"];
        datosAsinatura.CRamo = Request.Form["ctl00$MainContent$lb_asignatura"];
        datosAsinatura.CodigoCarrera = Request.Form["ctl00$MainContent$lb_carrera"];
        
        datosAsinatura.Anio = Request.Form["anioconsultado"];
        datosAsinatura.CodigoSeccion = "1";

        infoAsignaturas = func.Asignatura(datosAsinatura);
        
        if (datosAsinatura.CodigoError == 0)
        {
            infoCarrera = func.datosCarrera(datosAsinatura.CodigoCarrera.ToString());

            if (infoCarrera[0].CodigoError == 0)
            {
                lb_codcarr.InnerText = "(" + infoCarrera[0].CodigoCarrera + ") " + infoCarrera[0].NombreCarrera;
                lb_sede.InnerText = "(" + infoCarrera[0].CodigoSede + ") " + infoCarrera[0].NombreSede;
                lb_facultad.InnerText = "(" + infoCarrera[0].CodigoFacultad + ") " + infoCarrera[0].NombreFacultad;
            }

            Table tabla = new Table();
            tabla.CssClass = "table dataTable table-hover table-striped table-datos";
            TableHeaderRow headerRow = new TableHeaderRow();
            headerRow.CssClass = "thead-dark";
            headerRow.TableSection = TableRowSection.TableHeader;

            TableHeaderCell headerID = new TableHeaderCell();
            TableHeaderCell headerCodRamo = new TableHeaderCell();
            TableHeaderCell headerNombreRamo = new TableHeaderCell();
            TableHeaderCell headerCreditos = new TableHeaderCell();
            TableHeaderCell headerPorAprobados = new TableHeaderCell();
            TableHeaderCell headerPorReprobados = new TableHeaderCell();
            TableHeaderCell headerNumAprobados = new TableHeaderCell();
            TableHeaderCell headerNumReprobados = new TableHeaderCell();
            TableHeaderCell headerNumeroMatriculas = new TableHeaderCell();
            TableHeaderCell headerPromedioNf = new TableHeaderCell();
            TableHeaderCell headerNumeroAlumnos = new TableHeaderCell();
            TableHeaderCell headerPromAsistencia = new TableHeaderCell();
            //TableHeaderCell headerSeccion = new TableHeaderCell();
            //TableHeaderCell headerAnio = new TableHeaderCell();

            headerID.Text = "N°";
            headerCodRamo.Text = "Código";
            headerNombreRamo.Text = "Nombre Ramo";
            headerCreditos.Text = "Créditos";
            headerPorAprobados.Text = "% Aprob.";
            headerPorReprobados.Text = "% Reprob.";
            headerNumAprobados.Text = "N° Aprob.";
            headerNumReprobados.Text = "N° Reprob.";
            headerPromedioNf.Text = "Promedio";
            headerNumeroMatriculas.Text = "Matrículas";
            headerPromAsistencia.Text = "Asistencia";
            //headerSeccion.Text = "Sección";
            //headerAnio.Text = "Año";

            headerRow.Cells.Add(headerID);
            headerRow.Cells.Add(headerCodRamo);
            headerRow.Cells.Add(headerNombreRamo);
            headerRow.Cells.Add(headerCreditos);
            headerRow.Cells.Add(headerPorAprobados);
            headerRow.Cells.Add(headerPorReprobados);
            headerRow.Cells.Add(headerNumAprobados);
            headerRow.Cells.Add(headerNumReprobados);
            headerRow.Cells.Add(headerPromedioNf);
            headerRow.Cells.Add(headerNumeroMatriculas);
            headerRow.Cells.Add(headerPromAsistencia);
            //headerRow.Cells.Add(headerSeccion);
            //headerRow.Cells.Add(headerAnio);

            tabla.Rows.Add(headerRow);

            for (var i = 1; i < infoAsignaturas.Count(); i++)
            {
                TableRow rows = new TableRow();
                rows.TableSection = TableRowSection.TableBody;
                TableCell cellIdCol = new TableCell();
                TableCell cellCodigoRamo = new TableCell();
                TableCell cellNombreRamo = new TableCell();
                TableCell cellCreditos = new TableCell();
                TableCell cellPorAprobados = new TableCell();
                TableCell cellPorReprobados = new TableCell();
                TableCell cellNumAprobados = new TableCell();
                TableCell cellNumReprobados = new TableCell();
                TableCell cellPromedioNf = new TableCell();
                TableCell cellNumeroAlumnos = new TableCell();
                TableCell cellPromedioAsistencia = new TableCell();
                //TableCell cellCodigoSeccion = new TableCell();
                //TableCell cellAnio = new TableCell();

                cellIdCol.Text = ((int)i).ToString();
                cellCodigoRamo.Text = infoAsignaturas[i].CodigoRamo;
                cellNombreRamo.Text = infoAsignaturas[i].NombreRamo;
                cellCreditos.Text = infoAsignaturas[i].CreditoRamo;
                cellPorAprobados.Text = infoAsignaturas[i].PromAprobados;
                cellPorReprobados.Text = infoAsignaturas[i].PromReprobados;
                cellNumAprobados.Text = infoAsignaturas[i].NumAprobados;
                cellNumReprobados.Text = infoAsignaturas[i].NumReprobados;
                cellPromedioNf.Text = infoAsignaturas[i].PromNotasFinales;
                cellNumeroAlumnos.Text = infoAsignaturas[i].TotalAlumnos;
                cellPromedioAsistencia.Text = infoAsignaturas[i].PromAsistencia;
                //cellCodigoSeccion.Text = infoAsignaturas[i].CodigoSeccion;
                //cellAnio.Text = infoAsignaturas[i].Anio;

                rows.Cells.Add(cellIdCol);
                rows.Cells.Add(cellCodigoRamo);
                rows.Cells.Add(cellNombreRamo);
                rows.Cells.Add(cellCreditos);
                rows.Cells.Add(cellPorAprobados);
                rows.Cells.Add(cellPorReprobados);
                rows.Cells.Add(cellNumAprobados);
                rows.Cells.Add(cellNumReprobados);
                rows.Cells.Add(cellPromedioNf);
                rows.Cells.Add(cellNumeroAlumnos);
                rows.Cells.Add(cellPromedioAsistencia);
                //rows.Cells.Add(cellCodigoSeccion);
                //rows.Cells.Add(cellAnio);
                
                tabla.Rows.Add(rows);
            }
            tbl_reporte.Controls.Add(tabla); 
        }
        else
        {
            Response.Write("(" + datosAsinatura.CodigoError + ") " + datosAsinatura.GlosaError);
        }
    }
}