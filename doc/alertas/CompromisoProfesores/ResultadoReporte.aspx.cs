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
        Docentes_TYPE datosDocentes = new Docentes_TYPE();
        DatosAsignatura_TYPE datosAsignatura = new DatosAsignatura_TYPE();

        List<DatosAsignatura_TYPE> infoAsignaturas = new List<DatosAsignatura_TYPE>();
        List<Docentes_TYPE> infoDocentes = new List<Docentes_TYPE>();
        List<DatosAsignatura_TYPE> infoCarrera = new List<DatosAsignatura_TYPE>();
		List<DatosFacultad_TYPE> infoFacultad = new List<DatosFacultad_TYPE>();

        Funciones func = new Funciones();

        datosAsignatura.CodigoFacultad = Request.Form["ctl00$MainContent$lb_facultad"];
        datosAsignatura.CodigoRamo = Request.Form["ctl00$MainContent$lb_asignatura"];
        datosAsignatura.CodigoCarrera = Request.Form["ctl00$MainContent$lb_carrera"];

        datosAsignatura.Anio = Request.Form["ctl00$MainContent$lb_anio"];
        datosAsignatura.CodigoSeccion = Request.Form["lb_seccion"];

        infoAsignaturas = func.Asignatura(datosAsignatura);		

        if (datosAsignatura.CodigoError == 0)
        {

            infoCarrera = func.datosCarrera(datosAsignatura.CodigoCarrera);
			infoFacultad = func.datosFacultad(datosAsignatura.CodigoFacultad);

            if (infoCarrera[0].CodigoError == 0)
            {
                lb_codcarr.InnerText = "(" + infoCarrera[0].CodigoCarrera + ") " + infoCarrera[0].NombreCarrera;
                lb_sede.InnerText = "(" + infoCarrera[0].CodigoSede + ") " + infoCarrera[0].NombreSede;
                lb_facultad.InnerText = "(" + infoCarrera[0].CodigoFacultad + ") " + infoCarrera[0].NombreFacultad;
            }
			
			if (infoFacultad[0].CodigoError == 0)
            {                
				lb_sede.InnerText = "(" + infoFacultad[0].CodigoSede + ") " + infoFacultad[0].NombreSede;
                lb_facultad.InnerText = "(" + infoFacultad[0].CodigoFacultad + ") " + infoFacultad[0].NombreFacultad;
            }
            else
            {
                lb_codcarr.InnerHtml = "No Seleciconado";
                lb_sede.InnerText = "No Seleciconado";
                lb_facultad.InnerText = "No Seleciconado";
            }

            datosDocentes.Codcarr = datosAsignatura.CodigoCarrera;
            datosDocentes.Codramo = datosAsignatura.CodigoRamo;
            datosDocentes.Anio = datosAsignatura.Anio;
            datosDocentes.Periodo = Request.Form["ctl00$MainContent$lb_periodo"];
            datosDocentes.Carrera = datosAsignatura.NombreCarrera;
            datosDocentes.Seccion = datosAsignatura.CodigoSeccion;
			datosDocentes.Codfac = datosAsignatura.CodigoFacultad;
            infoDocentes = func.Docentes(datosDocentes);

            Table tabla = new Table();
            tabla.CssClass = "table dataTable table-hover table-striped table-datos";
            TableHeaderRow headerRow = new TableHeaderRow();
            headerRow.CssClass = "thead-dark";
            headerRow.TableSection = TableRowSection.TableHeader;

            TableHeaderCell headerID = new TableHeaderCell();
            TableHeaderCell headerRut = new TableHeaderCell();
            TableHeaderCell headerNombre = new TableHeaderCell();
            TableHeaderCell headerAnio = new TableHeaderCell();
            TableHeaderCell headerPeriodo = new TableHeaderCell();
            TableHeaderCell headerSeccion = new TableHeaderCell();
            TableHeaderCell headerCodcarrera = new TableHeaderCell();
            TableHeaderCell headerCompromimso = new TableHeaderCell();

            headerID.Text = "N°";
            headerRut.Text = "Rut";
            headerNombre.Text = "Nombre";
            headerAnio.Text = "Año";
            headerPeriodo.Text = "Periodo";
            headerSeccion.Text = "Sección";
            headerCodcarrera.Text = "Carrera";
            headerCompromimso.Text = "Compromiso";

            headerRow.Cells.Add(headerID);
            headerRow.Cells.Add(headerRut);
            headerRow.Cells.Add(headerNombre);
            headerRow.Cells.Add(headerAnio);
            headerRow.Cells.Add(headerPeriodo);
            headerRow.Cells.Add(headerSeccion);
            headerRow.Cells.Add(headerCodcarrera);
            headerRow.Cells.Add(headerCompromimso);

            tabla.Rows.Add(headerRow);

            for (var i = 0; i < infoDocentes.Count(); i++)
            {
                TableRow rows = new TableRow();
                rows.TableSection = TableRowSection.TableBody;

                TableCell cellIdCol = new TableCell();
                TableCell cellRut = new TableCell();
                TableCell cellNombre = new TableCell();
                TableCell cellAnio = new TableCell();
                TableCell cellPeriodo = new TableCell();
                TableCell cellSeccion = new TableCell();
                TableCell cellCodcarrera = new TableCell();
                TableCell cellCompromiso = new TableCell();

                cellIdCol.Text = ((int)i + 1).ToString();
                cellRut.Text = infoDocentes[i].Codprof;
                cellNombre.Text = infoDocentes[i].Nombre;
                cellAnio.Text = infoDocentes[i].Anio;
                cellPeriodo.Text = infoDocentes[i].Periodo;
                cellSeccion.Text = infoDocentes[i].Seccion;
                cellCodcarrera.Text = infoDocentes[i].Carrera;
                cellCompromiso.Text = infoDocentes[i].Compromiso;
               
                rows.Cells.Add(cellIdCol);
                rows.Cells.Add(cellRut);
                rows.Cells.Add(cellNombre);
                rows.Cells.Add(cellAnio);
                rows.Cells.Add(cellPeriodo);
                rows.Cells.Add(cellSeccion);
                rows.Cells.Add(cellCodcarrera);
                rows.Cells.Add(cellCompromiso);
                
                tabla.Rows.Add(rows);
            }
            tbl_reporte.Controls.Add(tabla); 
        }
        else
        {
            Response.Write("(" + datosDocentes.Coderror + ") " + datosDocentes.Glosaerror);
        }
    }
}