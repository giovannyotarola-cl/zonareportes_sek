Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class AlumnosConvalidados
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If (Not Me.IsPostBack) Then
            getFacultad()
            getCarrera()
            getAñoIngreso()
            getUltimaMatricula()
            getEstadoAcademico()
        End If
    End Sub

    Protected Sub getFacultad()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT DISTINCT Facultad FROM SEK_V_AlumnosConvalidados order by facultad"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlFacultad.Items.Add(New ListItem("Todo", "Todo"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim nomFac As String = ds.Tables(0).Rows(i)("FACULTAD").ToString
                nomFac = IIf(nomFac.Length > 55, Mid(nomFac, 1, 55), nomFac)
                ddlFacultad.Items.Add(New ListItem(nomFac, nomFac))
            Next
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try
    End Sub

    Protected Sub getCarrera()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT DISTINCT Carrera FROM SEK_V_AlumnosConvalidados order by carrera"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlCarrera.Items.Add(New ListItem("Todo", "Todo"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim nomCarr As String = ds.Tables(0).Rows(i)("Carrera").ToString
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
            strSQL = "SELECT DISTINCT [Año Ingreso] FROM SEK_V_AlumnosConvalidados order by [Año Ingreso]"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlAnioIngreso.Items.Add(New ListItem("Todo", "Todo"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim añoIngreso As String = ds.Tables(0).Rows(i)("Año Ingreso").ToString
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
            strSQL = "SELECT DISTINCT [Última Matrícula] FROM SEK_V_AlumnosConvalidados order by [Última Matrícula]"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlUltimaMatricula.Items.Add(New ListItem("Todo", "Todo"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim ultMatricula As String = ds.Tables(0).Rows(i)("Última Matrícula").ToString
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
            strSQL = "SELECT DISTINCT [Estado Académico Actual] FROM SEK_V_AlumnosConvalidados order by [Estado Académico Actual]"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlEstadoAcademico.Items.Add(New ListItem("Todo", "Todo"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim estAcad As String = ds.Tables(0).Rows(i)("Estado Académico Actual").ToString
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
        Dim frmRutAlumno As String = txtRutAlumno.Text.ToString
        Dim frmFacultad As String = ddlFacultad.SelectedValue.ToString
        Dim frmCarrera As String = ddlCarrera.SelectedValue.ToString
        Dim frmJornada As String = ddlJornada.SelectedValue.ToString
        Dim frmAñoIngreso As String = ddlAnioIngreso.SelectedValue.ToString
        Dim frmAñoMatricula As String = ddlUltimaMatricula.SelectedValue.ToString
        Dim frmEstadoAcademico As String = ddlEstadoAcademico.SelectedValue.ToString

        Try
            '
            strSql = "SELECT * FROM SEK_V_AlumnosConvalidados WHERE (1=1) "
            'FILTRO RUT
            If (frmRutAlumno.ToString <> "") Then
                strSql = strSql + "AND (Rut = '" + frmRutAlumno + "')"
            End If
            'FILTRO FACULTAD
            If (frmFacultad.ToString <> "Todo") Then
                strSql = strSql + "AND (Facultad = '" + frmFacultad + "')"
            End If
            'FILTRO CARRERA
            If (frmCarrera.ToString <> "Todo") Then
                strSql = strSql + "AND (Carrera = '" + frmCarrera + "')"
            End If
            'FILTRO JORNADA
            If (frmJornada.ToString <> "Todo") Then
                strSql = strSql + "AND (Jornada = '" + frmJornada + "')"
            End If
            'FILTRO Año ingreso
            If (frmAñoIngreso.ToString <> "Todo") Then
                strSql = strSql + "AND ([Año Ingreso] = '" + frmAñoIngreso + "')"
            End If
            'FILTRO JORNADA
            If (frmAñoMatricula.ToString <> "Todo") Then
                strSql = strSql + "AND ([Última Matrícula] = '" + frmAñoMatricula + "')"
            End If
            'FILTRO JORNADA
            If (frmEstadoAcademico.ToString <> "Todo") Then
                strSql = strSql + "AND ([Estado Académico Actual] = '" + frmEstadoAcademico + "')"
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
                    Dim CellCodCliente As New TableCell
                    Dim CellApPaterno As New TableCell
                    Dim CellApMaterno As New TableCell
                    Dim CellNombre As New TableCell
                    Dim CellRut As New TableCell
                    Dim CellGenero As New TableCell
                    Dim CellCodCarrera As New TableCell
                    Dim CellCarrera As New TableCell
                    Dim CellJornada As New TableCell
                    Dim CellCodFacultad As New TableCell
                    Dim CellFacultad As New TableCell
                    Dim CellAñoIngreso As New TableCell
                    Dim CellUltimaMatricula As New TableCell
                    Dim CellEstadoAcademico As New TableCell
                    '
                    CellCodCliente.Text = ds.Tables(0).Rows(i)("Cód. Cliente").ToString
                    CellApPaterno.Text = ds.Tables(0).Rows(i)("Apellido Paterno").ToString
                    CellApMaterno.Text = ds.Tables(0).Rows(i)("Apellido Materno").ToString
                    CellNombre.Text = ds.Tables(0).Rows(i)("Nombre").ToString
                    CellRut.Text = ds.Tables(0).Rows(i)("Rut").ToString
                    CellGenero.Text = ds.Tables(0).Rows(i)("Género").ToString
                    CellCodCarrera.Text = ds.Tables(0).Rows(i)("Cód. Carrera").ToString
                    CellCarrera.Text = ds.Tables(0).Rows(i)("Carrera").ToString
                    CellJornada.Text = ds.Tables(0).Rows(i)("Jornada").ToString
                    CellCodFacultad.Text = ds.Tables(0).Rows(i)("Cód. Facultad").ToString
                    CellFacultad.Text = ds.Tables(0).Rows(i)("Facultad").ToString
                    CellAñoIngreso.Text = ds.Tables(0).Rows(i)("Año Ingreso").ToString
                    CellUltimaMatricula.Text = ds.Tables(0).Rows(i)("Última Matrícula").ToString
                    CellEstadoAcademico.Text = ds.Tables(0).Rows(i)("Estado Académico Actual").ToString
                    '
                    RowTableInforme.Controls.Add(CellCodCliente)
                    RowTableInforme.Controls.Add(CellApPaterno)
                    RowTableInforme.Controls.Add(CellApMaterno)
                    RowTableInforme.Controls.Add(CellNombre)
                    RowTableInforme.Controls.Add(CellRut)
                    RowTableInforme.Controls.Add(CellGenero)
                    RowTableInforme.Controls.Add(CellCodCarrera)
                    RowTableInforme.Controls.Add(CellCarrera)
                    RowTableInforme.Controls.Add(CellJornada)
                    RowTableInforme.Controls.Add(CellCodFacultad)
                    RowTableInforme.Controls.Add(CellFacultad)
                    RowTableInforme.Controls.Add(CellAñoIngreso)
                    RowTableInforme.Controls.Add(CellUltimaMatricula)
                    RowTableInforme.Controls.Add(CellEstadoAcademico)
                    '
                    tblAlumnosConvalidados.Controls.Add(RowTableInforme)
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
            tblAlumnosConvalidados.RenderControl(hwriter)
            Response.Write(swriter.ToString())
            Response.End()

        Catch ex As Exception

        End Try
    End Sub

End Class
