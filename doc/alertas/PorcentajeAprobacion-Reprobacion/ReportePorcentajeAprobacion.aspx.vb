Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class ReporteWebpay
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
		If(Not Me.isPostBack) Then
			getFacultad()
			getCarrera()
		End If
    End Sub

    Protected Sub getFacultad()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT DISTINCT FACULTAD FROM SEK_V_PorcentajeAprobaciónCarrera"
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
            strSQL = "SELECT DISTINCT NOMBRE_C FROM SEK_V_PorcentajeAprobaciónCarrera"
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
        Dim frmFacultad As String = ddlFacultad.SelectedValue.ToString
        Dim frmCarrera As String = ddlCarrera.SelectedValue.ToString
        Dim frmJornada As String = ddlJornada.SelectedValue.ToString

        Try
            '
            strSql = "SELECT CODFAC, FACULTAD, CODCARR, NOMBRE_C,JORNADA, ANO, APROBACION, REPROBACION FROM SEK_V_PorcentajeAprobaciónCarrera WHERE (1=1) "
            'FILTRO FACULTAD
            If (frmFacultad.ToString <> "Todo") Then
                strSql = strSql + "AND (FACULTAD = '" + frmFacultad + "')"
            End If
            'FILTRO CARRERA
            If (frmCarrera.ToString <> "Todo") Then
                strSql = strSql + "AND (NOMBRE_C = '" + frmCarrera + "')"
            End If
            'FILTRO JORNADA
            If (frmJornada.ToString <> "Todo") Then
                strSql = strSql + "AND (JORNADA = '" + frmJornada + "')"
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
                    Dim CellCodFac As New TableCell
                    Dim CellFacultad As New TableCell
                    Dim CellCodCarr As New TableCell
                    Dim CellNombreC As New TableCell
                    Dim CellJornada As New TableCell
                    Dim CellAño As New TableCell
                    Dim CellAprobacion As New TableCell
                    Dim CellReprobacion As New TableCell
                    '
                    CellCodFac.Text = ds.Tables(0).Rows(i)("CODFAC").ToString
                    CellFacultad.Text = ds.Tables(0).Rows(i)("FACULTAD").ToString
                    CellCodCarr.Text = ds.Tables(0).Rows(i)("CODCARR").ToString
                    CellNombreC.Text = ds.Tables(0).Rows(i)("NOMBRE_C").ToString
                    CellJornada.Text = ds.Tables(0).Rows(i)("JORNADA").ToString
                    CellAño.Text = ds.Tables(0).Rows(i)("ANO").ToString
                    CellAprobacion.Text = ds.Tables(0).Rows(i)("APROBACION").ToString
                    CellReprobacion.Text = ds.Tables(0).Rows(i)("REPROBACION").ToString
                    '
                    RowTableInforme.Controls.Add(CellCodFac)
                    RowTableInforme.Controls.Add(CellFacultad)
                    RowTableInforme.Controls.Add(CellCodCarr)
                    RowTableInforme.Controls.Add(CellNombreC)
                    RowTableInforme.Controls.Add(CellJornada)
                    RowTableInforme.Controls.Add(CellAño)
                    RowTableInforme.Controls.Add(CellAprobacion)
                    RowTableInforme.Controls.Add(CellReprobacion)
                    '
                    tblPorcentajeAR.Controls.Add(RowTableInforme)
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
            Response.AddHeader("Content-Disposition", "attachment;filename=ReportPorcentajeAprobacion-Reprobacion.xls")
            Response.ContentEncoding = System.Text.Encoding.UTF8
            Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble)

            Dim swriter As New StringWriter()
            Dim hwriter As New HtmlTextWriter(swriter)
            tblPorcentajeAR.RenderControl(hwriter)
            Response.Write(swriter.ToString())
            Response.End()

        Catch ex As Exception

        End Try
    End Sub

End Class
