Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web.Services
Imports System.Drawing
Imports System.Configuration


Partial Class AnalisisPagosVentas
    Inherits System.Web.UI.Page
    Private Shared PageSize As Integer = 10

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If IsPostBack = False Then
            '
            Carreras()
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
        strSQL = "SELECT DISTINCT(ANO) AS ANIO FROM SEK_V_Analisis_Pago_Num_Operacion_Plus_Pagos"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "SEK_V_Analisis_Pago_Num_Operacion_Plus_Pagos")
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
        strSQL = "SELECT DISTINCT(PERIODO) AS PERIODO FROM SEK_V_Analisis_Pago_Num_Operacion_Plus_Pagos"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "SEK_V_Analisis_Pago_Num_Operacion_Plus_Pagos")
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
        Dim Facultad As String = txt_facultad.SelectedValue.ToString
        Dim Anio As String = txt_anio.SelectedValue.ToString
        Dim Periodo As String = txt_periodo.SelectedValue.ToString
        Dim Estado As String = txt_estado.SelectedValue.ToString
        Dim NumPagare As String = txt_numpagare.Text.ToString
        Dim FechaVencimiento As String = txt_vencimiento.Text.ToString
        Dim Situacion As String = txt_situacion.SelectedValue.ToString
        '
        strSql = "SELECT * FROM SEK_V_Analisis_Pago_Num_Operacion_Plus_Pagos WHERE (rut <> '') "
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
                Dim CellDig As New TableCell
                Dim CellCodCarr As New TableCell
                Dim CellCarrera As New TableCell
                Dim CellFechaVen As New TableCell
                Dim CellPaterno As New TableCell
                Dim CellMaterno As New TableCell
                Dim CellNombre As New TableCell
                Dim CellMail As New TableCell
                Dim CellDireccion As New TableCell
                Dim CellCiudad As New TableCell
                Dim CellComuna As New TableCell
                Dim CellTelefonoProc As New TableCell
                Dim CellTelefonoAct As New TableCell
                Dim CellCodFac As New TableCell
                Dim CellFacultad As New TableCell
                Dim CellCodigoDoc As New TableCell
                Dim CellDoc As New TableCell
                Dim CellAño As New TableCell
                Dim CellPeriodo As New TableCell
                Dim CellCuota As New TableCell
                Dim CellNumeroCuotas As New TableCell
                Dim CellMonto As New TableCell
                Dim CellSaldo As New TableCell
                Dim CellFechaDeuda As New TableCell
                Dim CellEstadoAcademico As New TableCell
                Dim CellTipoSituacion As New TableCell
                Dim CellSituacion As New TableCell
                Dim CellAnioMat As New TableCell
                Dim CellSede As New TableCell
                Dim CellCodigoPago As New TableCell
                Dim CellTipoPago As New TableCell
                Dim CellNumeroPago As New TableCell
                Dim CellMontoPago As New TableCell
                '
                CellNumeroPagare.Text = ds.Tables(0).Rows(i)("numero_pagare").ToString
                CellRutalumno.Text = ds.Tables(0).Rows(i)("rut").ToString
                CellDig.Text = ds.Tables(0).Rows(i)("DIG").ToString
                CellCodCarr.Text = ds.Tables(0).Rows(i)("CODCARR").ToString
                CellCarrera.Text = ds.Tables(0).Rows(i)("CARRERA").ToString
                CellFechaVen.Text = ds.Tables(0).Rows(i)("FECVEN").ToString
                CellPaterno.Text = ds.Tables(0).Rows(i)("PATERNO").ToString
                CellMaterno.Text = ds.Tables(0).Rows(i)("MATERNO").ToString
                CellNombre.Text = ds.Tables(0).Rows(i)("NOMBRE_ALUMNO").ToString
                CellMail.Text = ds.Tables(0).Rows(i)("MAIL").ToString
                CellDireccion.Text = ds.Tables(0).Rows(i)("DIRPROC").ToString
                CellCiudad.Text = ds.Tables(0).Rows(i)("CIUPROC").ToString
                CellComuna.Text = ds.Tables(0).Rows(i)("COMUNAPRO").ToString
                CellTelefonoProc.Text = ds.Tables(0).Rows(i)("FONOPROC").ToString
                CellTelefonoAct.Text = ds.Tables(0).Rows(i)("FONOACT").ToString
                CellCodFac.Text = ds.Tables(0).Rows(i)("CODFAC").ToString
                CellFacultad.Text = ds.Tables(0).Rows(i)("FACULTAD").ToString
                CellCodigoDoc.Text = ds.Tables(0).Rows(i)("CODDOC").ToString
                CellDoc.Text = ds.Tables(0).Rows(i)("DOCUMENTO").ToString
                CellAño.Text = ds.Tables(0).Rows(i)("ANO").ToString
                CellPeriodo.Text = ds.Tables(0).Rows(i)("PERIODO").ToString
                CellCuota.Text = ds.Tables(0).Rows(i)("CUOTA").ToString
                CellNumeroCuotas.Text = ds.Tables(0).Rows(i)("NUMCUOTAS").ToString
                CellMonto.Text = ds.Tables(0).Rows(i)("MONTO").ToString
                CellSaldo.Text = ds.Tables(0).Rows(i)("SALDO").ToString
                CellFechaDeuda.Text = ds.Tables(0).Rows(i)("FECDEUDA").ToString
                CellEstadoAcademico.Text = ds.Tables(0).Rows(i)("ESTACAD").ToString
                CellTipoSituacion.Text = ds.Tables(0).Rows(i)("TIPOSITU").ToString
                CellSituacion.Text = ds.Tables(0).Rows(i)("DESCRIPCION").ToString
                CellAnioMat.Text = ds.Tables(0).Rows(i)("ANO_MATRICULA").ToString
                CellSede.Text = ds.Tables(0).Rows(i)("SEDE").ToString
                CellCodigoPago.Text = ds.Tables(0).Rows(i)("CTAPAG").ToString
                CellTipoPago.Text = ds.Tables(0).Rows(i)("TIPO PAGO").ToString
                CellNumeroPago.Text = ds.Tables(0).Rows(i)("NUMERO_PAGO").ToString
                CellMontoPago.Text = ds.Tables(0).Rows(i)("MONTO_PAGO").ToString
                '
                RowTableInforme.Controls.Add(CellNumeroPagare)
                RowTableInforme.Controls.Add(CellRutalumno)
                RowTableInforme.Controls.Add(CellDig)
                RowTableInforme.Controls.Add(CellCodCarr)
                RowTableInforme.Controls.Add(CellCarrera)
                RowTableInforme.Controls.Add(CellFechaVen)
                RowTableInforme.Controls.Add(CellPaterno)
                RowTableInforme.Controls.Add(CellMaterno)
                RowTableInforme.Controls.Add(CellNombre)
                RowTableInforme.Controls.Add(CellMail)
                RowTableInforme.Controls.Add(CellDireccion)
                RowTableInforme.Controls.Add(CellCiudad)
                RowTableInforme.Controls.Add(CellComuna)
                RowTableInforme.Controls.Add(CellTelefonoProc)
                RowTableInforme.Controls.Add(CellTelefonoAct)
                RowTableInforme.Controls.Add(CellCodFac)
                RowTableInforme.Controls.Add(CellFacultad)
                RowTableInforme.Controls.Add(CellCodigoDoc)
                RowTableInforme.Controls.Add(CellDoc)
                RowTableInforme.Controls.Add(CellAño)
                RowTableInforme.Controls.Add(CellPeriodo)
                RowTableInforme.Controls.Add(CellCuota)
                RowTableInforme.Controls.Add(CellNumeroCuotas)
                RowTableInforme.Controls.Add(CellMonto)
                RowTableInforme.Controls.Add(CellSaldo)
                RowTableInforme.Controls.Add(CellFechaDeuda)
                RowTableInforme.Controls.Add(CellEstadoAcademico)
                RowTableInforme.Controls.Add(CellTipoSituacion)
                RowTableInforme.Controls.Add(CellSituacion)
                RowTableInforme.Controls.Add(CellAnioMat)
                RowTableInforme.Controls.Add(CellSede)
                RowTableInforme.Controls.Add(CellCodigoPago)
                RowTableInforme.Controls.Add(CellTipoPago)
                RowTableInforme.Controls.Add(CellNumeroPago)
                RowTableInforme.Controls.Add(CellMontoPago)
                '
                TBL_Alumnos.Controls.Add(RowTableInforme)
            Next

        End If
    End Sub

    Protected Sub ExportToExcel(sender As Object, e As EventArgs)
        Response.Clear()
        CargaAlumnos()
        Response.ContentType = "application/vnd.xls"
        Response.AddHeader("Content-Disposition", "attachment;filename=ReporteAnalisisPagoVentas.xls")
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
