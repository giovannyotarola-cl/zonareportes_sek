Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class TotalMatriculados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        '
        Dim Fn As New Funciones
        '
        If IsPostBack = False Then
            '
            Carreras()
            AnioIngreso()
            AnioMatricula()
            EstadoAcademico()
        End If

        Dim RutAlumno As String = txt_rut.Text
        Dim Paterno As String = txt_paterno.Text
        Dim Materno As String = txt_materno.Text
        Dim Nombre As String = txt_nombre.Text
        Dim Carrera As String = txt_carrera.SelectedValue.ToString
        Dim Estado As String = txt_estado.SelectedValue.ToString

        LB_TotalAlumnos.Text = Fn.NumeroAlumnos(RutAlumno, Carrera, Estado).ToString
        LB_TotalVIgentes.Text = Fn.NumeroAlumnosPor("VIGENTE", RutAlumno, Carrera).ToString
        LB_TotalEliminados.Text = Fn.NumeroAlumnosPor("ELIMINADO", RutAlumno, Carrera).ToString
        LB_TotalSuspendidos.Text = Fn.NumeroAlumnosPor("SUSPENDIDO", RutAlumno, Carrera).ToString
        LB_TotalEgresados.Text = Fn.NumeroAlumnosPor("EGRESADO", RutAlumno, Carrera).ToString
        LB_TotalTitulados.Text = Fn.NumeroAlumnosPor("TITULADO", RutAlumno, Carrera).ToString
        LB_TotalSituaciones.Text = Fn.NumeroSituaciones(RutAlumno, Carrera, Estado).ToString

    End Sub

    Protected Sub Enviar_Click(sender As Object, e As EventArgs) Handles Enviar.Click
        'Evento Boton Ver Informe
        CargaAlumnos()
    End Sub

    Protected Sub Carreras()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT NOMBRE_C, CODCARR FROM MT_CARRER WHERE (TIPOCARR = 1) AND (JORNADA IS NOT NULL) ORDER BY NOMBRE_C"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_CARRER")
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            Dim codCarr As String = Trim(ds.Tables(0).Rows(i)("CODCARR").ToString)
            Dim nomCarr As String = ds.Tables(0).Rows(i)("NOMBRE_C").ToString
            nomCarr = IIf(nomCarr.Length > 55, Mid(nomCarr, 1, 55), nomCarr)
            txt_carrera.Items.Add(New ListItem(nomCarr + " - " + Mid(codCarr, codCarr.Length, codCarr.Length), codCarr))
        Next
        '
        connString.Close()

    End Sub

    Protected Sub AnioIngreso()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT ANO FROM MT_ALUMNO WHERE ANO IS NOT NULL"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_ALUMNO")
        '
        Dim anio As String
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            anio = Trim(ds.Tables(0).Rows(i)("ANO").ToString)
            txt_anioingresod.Items.Add(New ListItem(anio, anio))
            txt_anioingresoa.Items.Add(New ListItem(anio, anio))
        Next
        '
        connString.Close()

    End Sub

    Protected Sub AnioMatricula()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT ANO_MAT FROM MT_ALUMNO WHERE ANO_MAT IS NOT NULL"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_ALUMNO")
        '
        Dim anio As String
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            anio = Trim(ds.Tables(0).Rows(i)("ANO_MAT").ToString)
            txt_aniomatriculad.Items.Add(New ListItem(anio, anio))
            txt_aniomatriculaa.Items.Add(New ListItem(anio, anio))
        Next
        '
        connString.Close()
    End Sub

    Protected Sub EstadoAcademico()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT ESTACAD FROM dbo.MT_ALUMNO WHERE ESTACAD IS NOT NULL"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "ESTACAD")
        '
        Dim estado As String
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            estado = Trim(ds.Tables(0).Rows(i)("ESTACAD").ToString)
            txt_estado.Items.Add(New ListItem(estado, estado))
        Next
        '
        connString.Close()

    End Sub

    Protected Sub CargaAlumnos()
        '
        Dim Fn As New Funciones
        '
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        '
        Dim Rut As String = txt_rut.Text.ToString
        Dim Paterno As String = txt_paterno.Text
        Dim Materno As String = txt_materno.Text
        Dim Nombre As String = txt_nombre.Text
        Dim Estado As String = txt_estado.SelectedValue.ToString
        Dim AnioIngresoA As String = txt_anioingresoa.SelectedValue.ToString
        Dim AnioIngresoD As String = txt_anioingresod.SelectedValue.ToString
        Dim AnioMatriculaD As String = txt_aniomatriculad.SelectedValue.ToString
        Dim AnioMatriculaA As String = txt_aniomatriculaa.SelectedValue.ToString
        Dim Carrera As String = txt_carrera.SelectedValue.ToString

        strSql = "SELECT dbo.MT_ALUMNO.CODCLI AS CODCLI, dbo.MT_CLIENT.CODCLI + '-' + DIG AS RUT, PATERNO + ' ' + MATERNO + ', ' + NOMBRE AS NOMBRE, dbo.MT_CARRER.CODFAC, dbo.RA_FACULTAD.DESCRIPCION, CODCARPR, " + _
        "NOMBRE_C +' - '+ dbo.MT_ALUMNO.JORNADA AS CARRERA, dbo.MT_ALUMNO.ESTACAD AS ESTADO, TIPOSITU, dbo.RA_TIPOSITU.DESCRIPCION AS SITUACION, dbo.MT_ALUMNO.FEC_MAT, ANO_MAT AS MATRICULA, dbo.MT_ALUMNO.ANO AS INGRESO, " + _
        "DIRACTUAL, CELULARACT, Mail, FONOACT, SEXO, COMUNA, FECNAC FROM dbo.MT_ALUMNO " + _
        "INNER JOIN dbo.MT_CLIENT ON dbo.MT_ALUMNO.RUT = dbo.MT_CLIENT.CODCLI " + _
        "INNER JOIN dbo.MT_CARRER ON CODCARPR = CODCARR " + _
        "INNER JOIN dbo.RA_FACULTAD ON dbo.MT_CARRER.CODFAC = dbo.RA_FACULTAD.CODFAC " + _
        "INNER JOIN dbo.RA_TIPOSITU ON dbo.MT_ALUMNO.TIPOSITU = CODIGO WHERE (dbo.MT_CLIENT.CODCLI <> '') "
        '
        If (Rut <> "") Then
            strSql = strSql + "AND (dbo.MT_CLIENT.CODCLI = '" + Rut + "') "
        End If
        '
        If (Paterno <> "") Then
            strSql = strSql + "AND (PATERNO = '" + Paterno + "') "
        End If
        '
        If (Materno <> "") Then
            strSql = strSql + "AND (MATERNO = '" + Materno + "') "
        End If
        '
        If (Nombre <> "") Then
            strSql = strSql + "AND (NOMBRE = '" + Nombre + "') "
        End If
        '
        If (Estado <> "Todo") Then
            strSql = strSql + "AND (dbo.MT_ALUMNO.ESTACAD = '" + Estado + "') "
        End If
        '
        If (AnioIngresoD <> "Todo" And AnioIngresoA <> "Todo") Then
            strSql = strSql + "AND (dbo.MT_ALUMNO.ANO >= '" + AnioIngresoD + "') AND (dbo.MT_ALUMNO.ANO <= '" + AnioIngresoA + "') "
        End If
        '
        If (AnioMatriculaD <> "Todo" And AnioMatriculaA <> "Todo") Then
            strSql = strSql + "AND (dbo.MT_ALUMNO.ANO_MAT >= '" + AnioMatriculaD + "') AND (dbo.MT_ALUMNO.ANO_MAT <= '" + AnioMatriculaA + "') "
        End If
        '
        If (Carrera <> "Todo") Then
            strSql = strSql + "AND (CODCARPR = '" + Carrera + "') "
        End If
        '
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        connString.Close()
        '
        If (ds.Tables(0).Rows.Count > 0) Then
            '
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                '
                Dim RowTableInforme As New TableRow
                RowTableInforme.TableSection = TableRowSection.TableBody
                '
                Dim CellCodigo As New TableCell
                Dim CellRutalumno As New TableCell
                Dim CellNombre As New TableCell
                Dim CellCarrera As New TableCell
                Dim CellEstado As New TableCell
                Dim CellSituacion As New TableCell
                Dim CellIngreso As New TableCell
                Dim CellMatricula As New TableCell
                '
                CellCodigo.Text = "<a href='#' onclick='wOpen(""" + Left(ds.Tables(0).Rows(i)("RUT").ToString, Len(ds.Tables(0).Rows(i)("RUT").ToString) - 2) + """)'>" + ds.Tables(0).Rows(i)("CODCLI").ToString + "</a>"
                CellRutalumno.Text = ds.Tables(0).Rows(i)("RUT").ToString
                CellNombre.Text = ds.Tables(0).Rows(i)("NOMBRE").ToString
                CellCarrera.Text = ds.Tables(0).Rows(i)("CARRERA").ToString
                CellEstado.Text = ds.Tables(0).Rows(i)("ESTADO").ToString
                CellSituacion.Text = ds.Tables(0).Rows(i)("SITUACION").ToString
                CellIngreso.Text = ds.Tables(0).Rows(i)("INGRESO").ToString
                CellMatricula.Text = ds.Tables(0).Rows(i)("MATRICULA").ToString
                '
                RowTableInforme.Controls.Add(CellCodigo)
                RowTableInforme.Controls.Add(CellRutalumno)
                RowTableInforme.Controls.Add(CellNombre)
                RowTableInforme.Controls.Add(CellCarrera)
                RowTableInforme.Controls.Add(CellEstado)
                RowTableInforme.Controls.Add(CellSituacion)
                RowTableInforme.Controls.Add(CellIngreso)
                RowTableInforme.Controls.Add(CellMatricula)
                '
                TBL_Alumnos.Controls.Add(RowTableInforme)
            Next
        End If
    End Sub

    Protected Sub Exportar_Click(sender As Object, e As EventArgs) Handles Exportar.Click
        'Evento Boton Ver Informe
        CargaAlumnos()
        ExportarExcell()
    End Sub

    Private Sub ExportarExcell()
        '
        Dim FrmRut As String = txt_rut.Text
        '
        Try
            Response.Clear()
            Response.ContentType = "application/vnd.xls"
            Response.AddHeader("Content-Disposition", "attachment;filename=ReporteMatriculados.xls")
            Response.ContentEncoding = System.Text.Encoding.UTF8
            Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble)
            '
            Dim swriter As New StringWriter()
            Dim hwriter As New HtmlTextWriter(swriter)
            '
            'TBL_InfoAlumno.RenderControl(hwriter)
            TBL_Alumnos.RenderControl(hwriter)
            '
            Response.Write(swriter.ToString())
            Response.End()

        Catch ex As Exception

        End Try
    End Sub
End Class
