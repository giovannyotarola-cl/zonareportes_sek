Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class AlumnosConvalidados
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If (Not Me.IsPostBack) Then
            getCarrera()
            getAñoIngreso()
            getUltimaMatricula()
            getEstadoAcademico()
        End If
    End Sub

    Protected Sub getCarrera()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT DISTINCT NOMBRE_C FROM SEK_V_CreditosAlumnos2016 order by NOMBRE_C"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlCarrera.Items.Add(New ListItem("Todo", "Todo"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim nomCarr As String = ds.Tables(0).Rows(i)("NOMBRE_C").ToString
                nomCarr = IIf(nomCarr.Length > 55, Mid(nomCarr, 1, 55), nomCarr)
                ddlCarrera.Items.Add(New ListItem(nomCarr, nomCarr))
            Next
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try
    End Sub
    Protected Sub getAñoIngreso()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT DISTINCT ANO FROM SEK_V_CreditosAlumnos2016 order by ANO"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlAnioIngreso.Items.Add(New ListItem("Todo", "Todo"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim añoIngreso As String = ds.Tables(0).Rows(i)("ANO").ToString
                ddlAnioIngreso.Items.Add(New ListItem(añoIngreso, añoIngreso))
            Next
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try
    End Sub
    Protected Sub getUltimaMatricula()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT DISTINCT ULTIMA_MATRICULA FROM SEK_V_CreditosAlumnos2016 order by ULTIMA_MATRICULA"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlUltimaMatricula.Items.Add(New ListItem("Todo", "Todo"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim ultMatricula As String = ds.Tables(0).Rows(i)("ULTIMA_MATRICULA").ToString
                ddlUltimaMatricula.Items.Add(New ListItem(ultMatricula, ultMatricula))
            Next
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try
    End Sub
    Protected Sub getEstadoAcademico()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT DISTINCT ESTACAD FROM SEK_V_CreditosAlumnos2016 order by ESTACAD"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlEstadoAcademico.Items.Add(New ListItem("Todo", "Todo"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim estAcad As String = ds.Tables(0).Rows(i)("ESTACAD").ToString
                ddlEstadoAcademico.Items.Add(New ListItem(estAcad, estAcad))
            Next
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try
    End Sub
    Protected Sub Enviar_Click(sender As Object, e As EventArgs) Handles Enviar.Click
        'Evento Boton Ver Informe
        getDatos()
    End Sub

    Protected Sub getDatos()
        '
        Dim Fn As New Funciones
        '
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        '
        'Variables de Formulario de Busqueda
        Dim frmRut As String = txtRut.Text
        Dim frmCarrera As String = ddlCarrera.SelectedValue.ToString
        Dim frmJornada As String = ddlJornada.SelectedValue.ToString
        Dim frmAñoIngreso As String = ddlAnioIngreso.SelectedValue.ToString
        Dim frmAñoMatricula As String = ddlUltimaMatricula.SelectedValue.ToString
        Dim frmEstadoAcademico As String = ddlEstadoAcademico.SelectedValue.ToString

        Try
            '
            strSql = "SELECT * FROM SEK_V_CreditosAlumnos2016 WHERE (1=1) "
            'FILTRO RUT
            If (frmRut <> "") Then
                strSql = strSql + "AND (CODCLI = '" + frmRut + "')"
            End If
            'FILTRO CARRERA
            If (frmCarrera.ToString <> "Todo") Then
                strSql = strSql + "AND (NOMBRE_C = '" + frmCarrera + "')"
            End If
            'FILTRO JORNADA
            If (frmJornada.ToString <> "Todo") Then
                strSql = strSql + "AND (JORNADA = '" + frmJornada + "')"
            End If
            'FILTRO Año ingreso
            If (frmAñoIngreso.ToString <> "Todo") Then
                strSql = strSql + "AND (ANO = '" + frmAñoIngreso + "')"
            End If
            'FILTRO JORNADA
            If (frmAñoMatricula.ToString <> "Todo") Then
                strSql = strSql + "AND (ULTIMA_MATRICULA = '" + frmAñoMatricula + "')"
            End If
            'FILTRO JORNADA
            If (frmEstadoAcademico.ToString <> "Todo") Then
                strSql = strSql + "AND (ESTACAD = '" + frmEstadoAcademico + "')"
            End If

            'Response.Write(strSql)

            connString.Open()
            da = New SqlDataAdapter(strSql, connString)
            da.Fill(ds)


            If (ds.Tables(0).Rows.Count > 0) Then

                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    '
                    Dim RowTableInforme As New TableRow
                    RowTableInforme.TableSection = TableRowSection.TableBody
                    RowTableInforme.ID = "00" + i
                    '
                    Dim CellRut As New TableCell
                    Dim CellApPaterno As New TableCell
                    Dim CellApMaterno As New TableCell
                    Dim CellNombre As New TableCell
                    Dim CellGenero As New TableCell
                    Dim CellFecNac As New TableCell
                    Dim CellCarrera As New TableCell
                    Dim CellJornada As New TableCell
                    Dim CellPlanEstudios As New TableCell
                    Dim CellAñoIngreso As New TableCell
                    Dim CellEstadoAcademico As New TableCell
                    Dim CellUltimaMatricula As New TableCell
                    Dim CellSituacion As New TableCell
                    Dim CellObservacion As New TableCell
                    Dim CellCreditosInscritos2016 As New TableCell
                    Dim CellCreditosAprobados2016 As New TableCell
                    Dim CellTotalCreditosInscritos As New TableCell
                    Dim CellTotalCreditosAprobados As New TableCell
                    '
                    CellRut.Text = ds.Tables(0).Rows(i)("CODCLI").ToString
                    CellApPaterno.Text = ds.Tables(0).Rows(i)("PATERNO").ToString
                    CellApMaterno.Text = ds.Tables(0).Rows(i)("MATERNO").ToString
                    CellNombre.Text = ds.Tables(0).Rows(i)("NOMBRE").ToString
                    CellGenero.Text = ds.Tables(0).Rows(i)("SEXO").ToString
                    CellFecNac.Text = ds.Tables(0).Rows(i)("FECNAC").ToString
                    CellCarrera.Text = ds.Tables(0).Rows(i)("NOMBRE_C").ToString
                    CellJornada.Text = ds.Tables(0).Rows(i)("JORNADA").ToString
                    CellPlanEstudios.Text = ds.Tables(0).Rows(i)("NOMPESTUD").ToString
                    CellAñoIngreso.Text = ds.Tables(0).Rows(i)("ANO").ToString
                    CellEstadoAcademico.Text = ds.Tables(0).Rows(i)("ESTACAD").ToString
                    CellUltimaMatricula.Text = ds.Tables(0).Rows(i)("ULTIMA_MATRICULA").ToString
                    CellSituacion.Text = ds.Tables(0).Rows(i)("SITUACIÓN").ToString
                    CellObservacion.Text = ds.Tables(0).Rows(i)("OBSERVACIÓN").ToString
                    CellCreditosInscritos2016.Text = ds.Tables(0).Rows(i)("CREDITOS INSCRITOS 2016").ToString
                    CellCreditosAprobados2016.Text = ds.Tables(0).Rows(i)("CREDITOS APROBADOS 2016").ToString
                    CellTotalCreditosInscritos.Text = ds.Tables(0).Rows(i)("TOTAL CREDITOS INSCRITOS").ToString
                    CellTotalCreditosAprobados.Text = ds.Tables(0).Rows(i)("TOTAL CREDITOS APROBADOS").ToString
                    '
                    RowTableInforme.Controls.Add(CellRut)
                    RowTableInforme.Controls.Add(CellApPaterno)
                    RowTableInforme.Controls.Add(CellApMaterno)
                    RowTableInforme.Controls.Add(CellNombre)
                    RowTableInforme.Controls.Add(CellGenero)
                    RowTableInforme.Controls.Add(CellFecNac)
                    RowTableInforme.Controls.Add(CellCarrera)
                    RowTableInforme.Controls.Add(CellJornada)
                    RowTableInforme.Controls.Add(CellPlanEstudios)
                    RowTableInforme.Controls.Add(CellAñoIngreso)
                    RowTableInforme.Controls.Add(CellEstadoAcademico)
                    RowTableInforme.Controls.Add(CellUltimaMatricula)
                    RowTableInforme.Controls.Add(CellSituacion)
                    RowTableInforme.Controls.Add(CellObservacion)
                    RowTableInforme.Controls.Add(CellCreditosInscritos2016)
                    RowTableInforme.Controls.Add(CellCreditosAprobados2016)
                    RowTableInforme.Controls.Add(CellTotalCreditosInscritos)
                    RowTableInforme.Controls.Add(CellTotalCreditosAprobados)

                    '
                    tblCreditosAlumnos2016.Controls.Add(RowTableInforme)
                Next
                '
                'Habilitar boton Exportar a Excell
                Exportar.Visible = True
            End If

        Catch ex As Exception
            'MsgBox("Error: " + ex.Message, MsgBoxStyle.Critical)
            Response.Write(ex.Message)
        End Try
    End Sub

    Protected Sub Exportar_Click(sender As Object, e As EventArgs) Handles Exportar.Click
        'Evento Boton Ver Informe
        getDatos()
        ExportarExcell()
    End Sub

    Private Sub ExportarExcell()
        Try

            Response.Clear()
            Response.ContentType = "application/vnd.xls"
            Response.AddHeader("Content-Disposition", "attachment;filename=ReporteAlumnosConvalidados.xls")
            Response.ContentEncoding = System.Text.Encoding.UTF8
            Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble)

            Dim swriter As New StringWriter()
            Dim hwriter As New HtmlTextWriter(swriter)
            tblCreditosAlumnos2016.RenderControl(hwriter)
            Response.Write(swriter.ToString())
            Response.End()

        Catch ex As Exception

        End Try
    End Sub

End Class
