Imports System.IO

Partial Class InformeMorosidadAlumnos
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
            If (Me.IsPostBack = False) Then
                cargarCarreras()
            End If
        End If
    End Sub
    Protected Sub cargarCarreras()
        Dim listCarreras As List(Of Carrera)
        If (Session("nivel").ToString = "1" Or Session("nivel").ToString = "2") Then
            listCarreras = Funciones.buscarCarrerasFacultad(Session("facultad").ToString)
        ElseIf (Session("nivel").ToString = "3") Then
            listCarreras = Funciones.buscarTodasCarreras()
        Else
            listCarreras = Funciones.buscarCarrerasRut(Session("RUT").ToString)
        End If
        ddlCarreras.Items.Add(New ListItem("", ""))
        For i As Integer = 0 To listCarreras.Count - 1
            ddlCarreras.Items.Add(New ListItem(listCarreras(i).propNombreCarr, listCarreras(i).propCodCarr))
        Next
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        CargarAlumnos()
    End Sub
    Protected Sub CargarAlumnos()
        Dim alumno As New InformacionAlumno
        alumno.propCodCarr = ddlCarreras.SelectedValue
        If (txtAño.Text <> "") Then
            alumno.propAñoCorte = txtAño.Text
        End If
        Dim listAlumnos As List(Of InformacionAlumno)
        If (Session("nivel").ToString = "1" Or Session("nivel").ToString = "2") Then
            listAlumnos = Funciones.buscarInformeAlumnos(alumno, Session("facultad").ToString)
        ElseIf (Session("nivel").ToString = "3") Then
            listAlumnos = Funciones.buscarInformeAlumnos(alumno, "todos")
        Else
            listAlumnos = Funciones.buscarInformeAlumnos(alumno, Session("RUT").ToString)
        End If
        For i As Integer = 0 To listAlumnos.Count - 1
            Dim RowTableInforme As New TableRow
            RowTableInforme.TableSection = TableRowSection.TableBody
            '
            Dim CellRut As New TableCell
            Dim CellNombre As New TableCell
            Dim CellPaterno As New TableCell
            Dim CellMaterno As New TableCell
            Dim CellAñoIngreso As New TableCell
            Dim CellCodCarr As New TableCell
            Dim CellNombreCarr As New TableCell
            Dim CellDeuda As New TableCell
            Dim CellEstAcad As New TableCell
            '
            CellRut.Text = listAlumnos(i).propRut
            CellNombre.Text = listAlumnos(i).propNombres
            CellPaterno.Text = listAlumnos(i).propApellidoP
            CellMaterno.Text = listAlumnos(i).propApellidoM
            CellAñoIngreso.Text = listAlumnos(i).propAñoCorte
            CellCodCarr.Text = listAlumnos(i).propCodCarr
            CellNombreCarr.Text = listAlumnos(i).propNombreCarr
            CellDeuda.Text = listAlumnos(i).propDeuda.ToString
            CellEstAcad.Text = listAlumnos(i).propEstAcad
            '
            RowTableInforme.Controls.Add(CellRut)
            RowTableInforme.Controls.Add(CellNombre)
            RowTableInforme.Controls.Add(CellPaterno)
            RowTableInforme.Controls.Add(CellMaterno)
            RowTableInforme.Controls.Add(CellAñoIngreso)
            RowTableInforme.Controls.Add(CellCodCarr)
            RowTableInforme.Controls.Add(CellNombreCarr)
            RowTableInforme.Controls.Add(CellDeuda)
            RowTableInforme.Controls.Add(CellEstAcad)

            tblAlumnos.Controls.Add(RowTableInforme)
        Next
        '
    End Sub
    Protected Sub ExportToExcel(sender As Object, e As EventArgs) Handles Exportar.Click
        Response.Clear()
        CargarAlumnos()
        Response.ContentType = "application/vnd.xls"
        Response.AddHeader("Content-Disposition", "attachment;filename=InformeMorosidadAlumnos.xls")
        Response.ContentEncoding = System.Text.Encoding.UTF8
        Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble)

        Dim swriter As New StringWriter()
        Dim hwriter As New HtmlTextWriter(swriter)
        tblAlumnos.RenderControl(hwriter)
        Response.Write(swriter.ToString())
        Response.End()
    End Sub
End Class
