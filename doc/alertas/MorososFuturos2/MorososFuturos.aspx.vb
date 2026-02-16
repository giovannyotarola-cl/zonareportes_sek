Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web.Services
Imports System.Drawing
Imports System.Configuration


Partial Class MorososFuturos
    Inherits System.Web.UI.Page
    Private Shared PageSize As Integer = 10

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If IsPostBack = False Then
            '
            Carreras()
            TipoCarrera()
            EstadoAcademico()
            Facultad()
            AnoCarga()
            PeriodoCarga()
            TipoDocumento()
            SituAcademica()

        End If
    End Sub

    Protected Sub Enviar_Click(sender As Object, e As EventArgs) Handles Enviar.Click
        'Evento Boton Ver Informe
        CargaAlumnos()
    End Sub

    Protected Sub TipoCarrera()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT(TIPOCARRERA) AS TIPO FROM SEK_Morosos_Futuros"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "SEK_Morosos_Futuros")
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            Dim tipoCarrera As String = Trim(ds.Tables(0).Rows(i)("TIPO").ToString)
            txt_tipocarrera.Items.Add(New ListItem(tipoCarrera, tipoCarrera))
        Next
        '
        connString.Close()

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

    Protected Sub Facultad()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT CODFAC, DESCRIPCION FROM RA_FACULTAD"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "RA_FACULTAD")
        '
        Dim codfac As String
        Dim facultad As String
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            codfac = Trim(ds.Tables(0).Rows(i)("CODFAC").ToString)
            facultad = Trim(ds.Tables(0).Rows(i)("DESCRIPCION").ToString)
            txt_facultad.Items.Add(New ListItem(facultad, codfac))
        Next
        '
        connString.Close()
    End Sub

    Protected Sub AnoCarga()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT(ANO) AS ANIO FROM SEK_Morosos_Futuros"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "SEK_Morosos_Futuros")
        '
        Dim anio As String
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            anio = Trim(ds.Tables(0).Rows(i)("ANIO").ToString)
            txt_anio.Items.Add(New ListItem(anio, anio))
        Next
        '
        connString.Close()
    End Sub

    Protected Sub PeriodoCarga()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT(PERIODO) AS PERIODO FROM SEK_Morosos_Futuros"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "SEK_Morosos_Futuros")
        '
        Dim poriodo As String
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            poriodo = Trim(ds.Tables(0).Rows(i)("PERIODO").ToString)
            txt_periodo.Items.Add(New ListItem(poriodo, poriodo))
        Next
        '
        connString.Close()
    End Sub

    Protected Sub TipoDocumento()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT TIPODOC, NOMBRE FROM MT_DOCUM"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_DOCUM")
        '
        Dim codigo As String
        Dim documento As String
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            codigo = Trim(ds.Tables(0).Rows(i)("TIPODOC").ToString)
            documento = Trim(ds.Tables(0).Rows(i)("NOMBRE").ToString)
            txt_documento.Items.Add(New ListItem(documento, codigo))
        Next
        '
        connString.Close()
    End Sub

    Protected Sub SituAcademica()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT CODIGO, DESCRIPCION FROM RA_TIPOSITU"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "RA_TIPOSITU")
        '
        Dim codigo As String
        Dim situacion As String
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            codigo = Trim(ds.Tables(0).Rows(i)("CODIGO").ToString)
            situacion = Trim(ds.Tables(0).Rows(i)("DESCRIPCION").ToString)
            txt_situacion.Items.Add(New ListItem(situacion, codigo))
        Next
        '
        connString.Close()
    End Sub

    Protected Sub CargaAlumnos()
        '
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        '
        Dim Rut As String = txt_rut.Text.ToString
        Dim Paterno As String = txt_paterno.Text.ToString
        Dim Materno As String = txt_materno.Text.ToString
        Dim Nombres As String = txt_nombre.Text.ToString
        Dim Carrera As String = txt_carrera.SelectedValue.ToString
        Dim TipoCarrera As String = txt_tipocarrera.SelectedValue.ToString
        Dim Facultad As String = txt_facultad.SelectedValue.ToString
        Dim Anio As String = txt_anio.SelectedValue.ToString
        Dim Periodo As String = txt_periodo.SelectedValue.ToString
        Dim Estado As String = txt_estado.SelectedValue.ToString
        Dim NumPagare As String = txt_numpagare.Text.ToString
        Dim FechaVencimiento As String = txt_vencimiento.Text.ToString
        Dim Situacion As String = txt_situacion.SelectedValue.ToString
        '
        strSql = "SELECT rut AS RUT, PATERNO + ' ' + MATERNO +', '+ Nombre_alumno AS NOMBRE, CARRERA, tipocarr, " +
            "ANO_MATRICULA, FACULTAD, ESTACAD, ANO, PERIODO, numero_pagare, DOCUMENTO, CUOTA, NumCuotas, " +
            "MONTO, SALDO, FECVEN, FECDEUDA, DESCRIPCION, USUARIO, MAIL, DIRPROC, " +
            "COMUNAPRO, CIUPROC, FONOACT, CODAPOD FROM SEK_V_Morosos_Futuros WHERE (rut <> '')"
        '
        If (Rut <> "") Then
            strSql = strSql + "AND (rut = '" + Rut + "') "
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
        If (Nombres <> "") Then
            strSql = strSql + "AND (Nombre_alumno = '" + Nombres + "') "
        End If
        '
        If (Carrera <> "Todo") Then
            strSql = strSql + "AND (CODCARR = '" + Carrera + "') "
        End If
        '
        If (TipoCarrera <> "Todo") Then
            strSql = strSql + "AND (TIPOCARR = '" + TipoCarrera + "') "
        End If
        '
        If (Facultad <> "Todo") Then
            strSql = strSql + "AND (CODFAC = '" + Facultad + "') "
        End If
        '
        If (Anio <> "Todo") Then
            strSql = strSql + "AND (ANO = '" + Anio + "') "
        End If
        '
        If (Periodo <> "Todo") Then
            strSql = strSql + "AND (PERIODO = '" + Periodo + "') "
        End If
        '
        If (Estado <> "Todo") Then
            strSql = strSql + "AND (ESTACAD = '" + Estado + "') "
        End If
        '
        If (NumPagare <> "") Then
            strSql = strSql + "AND (numero_pagare = '" + NumPagare + "') "
        End If
        '
        If (Situacion <> "Todo") Then
            strSql = strSql + "AND (TIPOSITU = '" + Situacion + "') "
        End If
        '
        If (FechaVencimiento <> "") Then
            strSql = strSql + "AND (FECVEN = '" + FechaVencimiento + "')"
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
                'TBL_Alumnos.DataSource = ds
                'TBL_Alumnos.DataBind()
                '
                Dim RowTableInforme As New TableRow
                RowTableInforme.TableSection = TableRowSection.TableBody
                RowTableInforme.ID = "00" + i
                '
                Dim CellNumeroPagare As New TableCell
                Dim CellRutalumno As New TableCell
                Dim CellNombre As New TableCell
                Dim CellCarrera As New TableCell
                Dim CellTipoCarrera As New TableCell
                Dim CellFacultad As New TableCell
                Dim CellAnioMatricula As New TableCell
                Dim CellEstado As New TableCell
                Dim CellSituacionAcad As New TableCell
                Dim CellAnio As New TableCell
                Dim CellPeriodo As New TableCell
                Dim CellCuota As New TableCell
                Dim CellNumeroCutas As New TableCell
                Dim CellMonto As New TableCell
                Dim CellSaldo As New TableCell
                Dim CellFechaVenc As New TableCell
                Dim CellEmail As New TableCell
                Dim CellDireccion As New TableCell
                Dim CellComuna As New TableCell
                Dim CellFono As New TableCell
                Dim CellUsuario As New TableCell
                Dim CellRutApoderado As New TableCell
                '
                CellNumeroPagare.Text = ds.Tables(0).Rows(i)("numero_pagare").ToString
                CellRutalumno.Text = ds.Tables(0).Rows(i)("RUT").ToString
                CellNombre.Text = ds.Tables(0).Rows(i)("NOMBRE").ToString
                CellCarrera.Text = ds.Tables(0).Rows(i)("CARRERA").ToString
                CellTipoCarrera.Text = ds.Tables(0).Rows(i)("TIPOCARR").ToString
                CellFacultad.Text = ds.Tables(0).Rows(i)("FACULTAD").ToString
                CellAnioMatricula.Text = ds.Tables(0).Rows(i)("ANO_MATRICULA").ToString
                CellEstado.Text = ds.Tables(0).Rows(i)("ESTACAD").ToString
                CellAnio.Text = ds.Tables(0).Rows(i)("ANO").ToString
                CellPeriodo.Text = ds.Tables(0).Rows(i)("PERIODO").ToString
                CellCuota.Text = ds.Tables(0).Rows(i)("CUOTA").ToString
                CellNumeroCutas.Text = ds.Tables(0).Rows(i)("NumCuotas").ToString
                CellMonto.Text = ds.Tables(0).Rows(i)("MONTO").ToString
                CellSaldo.Text = ds.Tables(0).Rows(i)("SALDO").ToString
                CellFechaVenc.Text = ds.Tables(0).Rows(i)("FECVEN").ToString
                CellEmail.Text = ds.Tables(0).Rows(i)("MAIL").ToString
                CellDireccion.Text = ds.Tables(0).Rows(i)("DIRPROC").ToString
                CellComuna.Text = ds.Tables(0).Rows(i)("COMUNAPRO").ToString
                CellFono.Text = ds.Tables(0).Rows(i)("FONOACT").ToString
                CellUsuario.Text = ds.Tables(0).Rows(i)("USUARIO").ToString
                CellRutApoderado.Text = ds.Tables(0).Rows(i)("CODAPOD").ToString
                '
                RowTableInforme.Controls.Add(CellNumeroPagare)
                RowTableInforme.Controls.Add(CellRutalumno)
                RowTableInforme.Controls.Add(CellNombre)
                RowTableInforme.Controls.Add(CellCarrera)
                RowTableInforme.Controls.Add(CellTipoCarrera)
                RowTableInforme.Controls.Add(CellFacultad)
                RowTableInforme.Controls.Add(CellEstado)
                RowTableInforme.Controls.Add(CellAnioMatricula)
                RowTableInforme.Controls.Add(CellAnio)
                RowTableInforme.Controls.Add(CellPeriodo)
                RowTableInforme.Controls.Add(CellCuota)
                RowTableInforme.Controls.Add(CellNumeroCutas)
                RowTableInforme.Controls.Add(CellMonto)
                RowTableInforme.Controls.Add(CellSaldo)
                RowTableInforme.Controls.Add(CellFechaVenc)
                RowTableInforme.Controls.Add(CellEmail)
                RowTableInforme.Controls.Add(CellDireccion)
                RowTableInforme.Controls.Add(CellComuna)
                RowTableInforme.Controls.Add(CellFono)
                RowTableInforme.Controls.Add(CellUsuario)
                RowTableInforme.Controls.Add(CellRutApoderado)
                '
                TBL_Alumnos.Controls.Add(RowTableInforme)
            Next

        End If
    End Sub

    Protected Sub ExportToExcel(sender As Object, e As EventArgs)

        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        '
        Dim Rut As String = txt_rut.Text.ToString
        Dim Paterno As String = txt_paterno.Text.ToString
        Dim Materno As String = txt_materno.Text.ToString
        Dim Nombres As String = txt_nombre.Text.ToString
        Dim Carrera As String = txt_carrera.SelectedValue.ToString
        Dim TipoCarrera As String = txt_tipocarrera.SelectedValue.ToString
        Dim Facultad As String = txt_facultad.SelectedValue.ToString
        Dim Anio As String = txt_anio.SelectedValue.ToString
        Dim Periodo As String = txt_periodo.SelectedValue.ToString
        Dim Estado As String = txt_estado.SelectedValue.ToString
        Dim NumPagare As String = txt_numpagare.Text.ToString
        Dim FechaVencimiento As String = txt_vencimiento.Text.ToString
        Dim Situacion As String = txt_situacion.SelectedValue.ToString
        '
        strSql = "SELECT rut AS RUT, PATERNO + ' ' + MATERNO +', '+ Nombre_alumno AS NOMBRE, CARRERA, tipocarr, " +
            "ANO_MATRICULA, FACULTAD, ESTACAD, ANO, PERIODO, numero_pagare, DOCUMENTO, CUOTA, NumCuotas, " +
            "MONTO, SALDO, FECVEN, FECDEUDA, DESCRIPCION, USUARIO, MAIL, DIRPROC, " +
            "COMUNAPRO, CIUPROC, FONOACT, CODAPOD FROM SEK_V_Morosos_Futuros WHERE (rut <> '')"
        '
        If (Rut <> "") Then
            strSql = strSql + "AND (rut = '" + Rut + "') "
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
        If (Nombres <> "") Then
            strSql = strSql + "AND (Nombre_alumno = '" + Nombres + "') "
        End If
        '
        If (Carrera <> "Todo") Then
            strSql = strSql + "AND (CODCARR = '" + Carrera + "') "
        End If
        '
        If (TipoCarrera <> "Todo") Then
            strSql = strSql + "AND (TIPOCARR = '" + TipoCarrera + "') "
        End If
        '
        If (Facultad <> "Todo") Then
            strSql = strSql + "AND (CODFAC = '" + Facultad + "') "
        End If
        '
        If (Anio <> "Todo") Then
            strSql = strSql + "AND (ANO = '" + Anio + "') "
        End If
        '
        If (Periodo <> "Todo") Then
            strSql = strSql + "AND (PERIODO = '" + Periodo + "') "
        End If
        '
        If (Estado <> "Todo") Then
            strSql = strSql + "AND (ESTACAD = '" + Estado + "') "
        End If
        '
        If (NumPagare <> "") Then
            strSql = strSql + "AND (numero_pagare = '" + NumPagare + "') "
        End If
        '
        If (Situacion <> "Todo") Then
            strSql = strSql + "AND (TIPOSITU = '" + Situacion + "') "
        End If
        '
        If (FechaVencimiento <> "") Then
            strSql = strSql + "AND (FECVEN = '" + FechaVencimiento + "')"
        End If

        Response.Clear()
        Response.ContentType = "application/vnd.xls"
        Response.AddHeader("Content-Disposition", "attachment;filename=ReporteWebPay.xls")
        Response.ContentEncoding = System.Text.Encoding.UTF8
        Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble)

        Dim swriter As New StringWriter()
        Dim hwriter As New HtmlTextWriter(swriter)
        TBL_Alumnos.RenderControl(hwriter)
        Response.Write(swriter.ToString())
        Response.End()

    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub
End Class
