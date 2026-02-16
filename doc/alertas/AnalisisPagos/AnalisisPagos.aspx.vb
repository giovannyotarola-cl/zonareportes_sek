Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports Excel = Microsoft.Office.Interop.Excel

Partial Class AnalisisPagos
    Inherits System.Web.UI.Page
    Public connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If (IsPostBack = False) Then
            ListaFacultades()
            ListaCarreras()
            ListaDocumentos()
            ListaPagos()
            ListaAnios()
        End If
        
        TBL_InfoAlumno.Visible = False

    End Sub

    Public Sub ListaFacultades()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT CODFAC, DESCRIPCION FROM RA_FACULTAD ORDER BY DESCRIPCION"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_CARRER")

        connString.Close()

        'Listar Facultades
        CB_Facultad.Items.Add(New ListItem("", ""))
        If (ds.Tables(0).Rows.Count > 0) Then
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim CodFacultad As String = Trim(ds.Tables(0).Rows(i)("CODFAC").ToString)
                Dim NomFacultad As String = Trim(ds.Tables(0).Rows(i)("DESCRIPCION").ToString)

                CB_Facultad.Items.Add(New ListItem(NomFacultad, CodFacultad))
            Next
        End If

    End Sub

    Public Sub ListaCarreras()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT NOMBRE_C, CODCARR FROM MT_CARRER WHERE (TIPOCARR = 1) AND (JORNADA IS NOT NULL) ORDER BY NOMBRE_C"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_CARRER")

        connString.Close()

        'Listar Carreras
        CB_Carrera.Items.Add(New ListItem("", ""))
        If (ds.Tables(0).Rows.Count > 0) Then
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim CodCarrera As String = Trim(ds.Tables(0).Rows(i)("CODCARR").ToString)
                Dim NomCarrera As String = ds.Tables(0).Rows(i)("NOMBRE_C").ToString
                NomCarrera = IIf(NomCarrera.Length > 55, Mid(NomCarrera, 1, 55), NomCarrera)

                CB_Carrera.Items.Add(New ListItem(Mid(CodCarrera, CodCarrera.Length, CodCarrera.Length) + " - " + NomCarrera, CodCarrera))
            Next
        End If

    End Sub

    Public Sub ListaDocumentos()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT TIPODOC, NOMBRE FROM MT_DOCUM ORDER BY NOMBRE"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_DOCUM")

        connString.Close()

        'Listar Documentos
        CB_Documento.Items.Add(New ListItem("", ""))
        If (ds.Tables(0).Rows.Count > 0) Then
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim CodDocumento As String = Trim(ds.Tables(0).Rows(i)("TIPODOC").ToString)
                Dim NomDocumento As String = Trim(ds.Tables(0).Rows(i)("NOMBRE").ToString)

                CB_Documento.Items.Add(New ListItem(NomDocumento, CodDocumento))
            Next
        End If
    End Sub

    Public Sub ListaPagos()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT TIPODOC, NOMBRE FROM MT_DOCPAG ORDER BY NOMBRE"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_DOCPAG")

        connString.Close()

        'Listar Pagos
        CB_Pago.Items.Add(New ListItem("", ""))
        If (ds.Tables(0).Rows.Count > 0) Then
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim CodPago As String = Trim(ds.Tables(0).Rows(i)("TIPODOC").ToString)
                Dim NomPago As String = Trim(ds.Tables(0).Rows(i)("NOMBRE").ToString)

                CB_Pago.Items.Add(New ListItem(NomPago, CodPago))
            Next
        End If
    End Sub

    Public Sub ListaAnios()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT DISTINCT ANO FROM MT_CTADOC WHERE (ANO > 1000)"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_CTADOC")

        connString.Close()

        'Listar Años
        CB_Anio.Items.Add(New ListItem("", ""))
        If (ds.Tables(0).Rows.Count > 0) Then
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim Anio As String = Trim(ds.Tables(0).Rows(i)("ANO").ToString)

                CB_Anio.Items.Add(New ListItem(Anio, Anio))
            Next
        End If

    End Sub

    Protected Sub Enviar_Click(sender As Object, e As EventArgs) Handles Enviar.Click
        Pagos()
    End Sub

    Public Sub Pagos()
        '
        Dim Fn As New Funciones
        '
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dsPagos As New DataSet
        '
        'Variables de Formulario de Busqueda
        Dim FrmRut As String = TB_Rut.Text
        Dim FrmFacultad As String = CB_Facultad.SelectedItem.ToString
        Dim FrmCarrera As String = CB_Carrera.SelectedItem.ToString
        'Dim FrmDocumento As String = CB_Documento.SelectedValue.ToString
        Dim FrmDocumento As String = CB_Documento.SelectedItem.ToString
        Dim FrmPago As String = CB_Pago.SelectedValue.ToString
        Dim FrmAnio As String = CB_Anio.SelectedValue.ToString

        'Try
        '
        strSql = "SELECT  CARRERA, RUT, DIG, PATERNO, MATERNO, NOMBRES, DOCUMENTO, CTADOCNUM, CTAPAGNUM, [MONTO CTADOC] AS MONTOCTADOC, CONVERT(varchar(10), FECVEN , 105) AS FECVEN, ANO, CONVERT(varchar(10), FECCANCEL , 105) AS FECCANCEL, [AÑO MOVIMIENTO] AS ANIOMOV FROM VISTA_ANALISISPAGOS WHERE (RUT <> '') "
        '
        If (FrmRut.ToString <> "") Then
            '
            strSql = strSql + "AND (RUT = '" + FrmRut.ToString + "') "
        End If
        '
        If (FrmFacultad.ToString <> "") Then
            '
            strSql = strSql + "AND (FACULTAD = '" + FrmFacultad.ToString + "') "
        End If
        '
        If (FrmCarrera.ToString <> "") Then
            '
            strSql = strSql + "AND (CARRERA = '" + Trim(Right(FrmCarrera.ToString, Len(FrmCarrera.ToString) - 3)) + "') "
        End If
        '
        If (FrmDocumento.ToString <> "") Then
            '
            strSql = strSql + "AND (DOCUMENTO = '" + FrmDocumento.ToString + "') "
        End If

        If (FrmAnio.ToString <> "") Then
            '
            strSql = strSql + "AND (ANO = '" + FrmAnio.ToString + "') "
        End If

        '
        strSql = strSql + "ORDER BY FECVEN ASC"
        '
        '
        'Response.Write(strSql)
        'Si se ha ingresado un Rut
        'Generar Tabla de Resultados para el Alumno requerido
        If (TB_Rut.Text.ToString <> "") Then
            '
            TBL_InfoAlumno.Visible = True
            '
            LB_NombreAlumno.Text = Fn.NombreAlumno(TB_Rut.Text)
            LB_CodigoCliente.Text = Fn.CodigoCliente(TB_Rut.Text)
            LB_CarreraAlumno.Text = Fn.CarreraAlumno(TB_Rut.Text)
            '
        End If

        da = New SqlDataAdapter(strSql, connString)
        da.Fill(dsPagos, "VISTA_ANALISISPAGOS")
        connString.Close()

        If (dsPagos.Tables(0).Rows.Count > 0) Then

            For i As Integer = 0 To dsPagos.Tables(0).Rows.Count - 1
                '
                Dim RowTableInforme As New TableRow
                RowTableInforme.TableSection = TableRowSection.TableBody
                RowTableInforme.ID = "00" + i
                '
                'Dim CellCarrera As New TableCell
                Dim CellRutAlumno As New TableCell
                'Dim CellNombre As New TableCell
                Dim CellDocumento As New TableCell
                Dim CellCtaDocNum As New TableCell
                Dim CellMontoCtaDoc As New TableCell
                Dim CellVencimiento As New TableCell
                Dim CellAnio As New TableCell
                Dim CellFechaPago As New TableCell
                Dim CellAnioMovimiento As New TableCell
                '
                'CellCarrera.Text = dsPagos.Tables(0).Rows(i)("CARRERA").ToString
                CellRutAlumno.Text = dsPagos.Tables(0).Rows(i)("RUT").ToString + "-" + dsPagos.Tables(0).Rows(i)("DIG").ToString
                'CellNombre.Text = dsPagos.Tables(0).Rows(i)("PATERNO").ToString + " " + dsPagos.Tables(0).Rows(i)("MATERNO").ToString + ", " + dsPagos.Tables(0).Rows(i)("NOMBRES").ToString
                CellDocumento.Text = dsPagos.Tables(0).Rows(i)("DOCUMENTO").ToString
                CellCtaDocNum.Text = dsPagos.Tables(0).Rows(i)("CTADOCNUM").ToString
                CellMontoCtaDoc.Text = "$" + dsPagos.Tables(0).Rows(i)("MONTOCTADOC").ToString
                CellVencimiento.Text = dsPagos.Tables(0).Rows(i)("FECVEN").ToString
                CellAnio.Text = dsPagos.Tables(0).Rows(i)("ANO").ToString
                CellFechaPago.Text = dsPagos.Tables(0).Rows(i)("FECCANCEL").ToString
                CellAnioMovimiento.Text = dsPagos.Tables(0).Rows(i)("ANIOMOV").ToString
                '
                'RowTableInforme.Controls.Add(CellCarrera)
                RowTableInforme.Controls.Add(CellRutAlumno)
                'RowTableInforme.Controls.Add(CellNombre)
                RowTableInforme.Controls.Add(CellDocumento)
                RowTableInforme.Controls.Add(CellCtaDocNum)
                RowTableInforme.Controls.Add(CellMontoCtaDoc)
                RowTableInforme.Controls.Add(CellVencimiento)
                RowTableInforme.Controls.Add(CellAnio)
                RowTableInforme.Controls.Add(CellFechaPago)
                RowTableInforme.Controls.Add(CellAnioMovimiento)
                '
                TBL_Pagos.Controls.Add(RowTableInforme)
            Next
            '
            'Habilitar boton Exportar a Excell
            Exportar.Visible = True
        End If

        'Catch ex As Exception
        'MsgBox("Error: " + ex.Message, MsgBoxStyle.Critical)
        'End Try
    End Sub

    Protected Sub Exportar_Click(sender As Object, e As EventArgs) Handles Exportar.Click
        'Evento Boton Ver Informe
        Pagos()
        ExportarExcell()
    End Sub

    Private Sub ExportarExcell()

        Dim FrmRut As String = TB_Rut.Text

        Try
            Response.Clear()
            Response.ContentType = "application/vnd.xls"
            Response.AddHeader("Content-Disposition", "attachment;filename=ReporteWebPay.xls")
            Response.ContentEncoding = System.Text.Encoding.UTF8
            Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble)

            Dim swriter As New StringWriter()
            Dim hwriter As New HtmlTextWriter(swriter)
            If (FrmRut.ToString <> "") Then
                TBL_InfoAlumno.RenderControl(hwriter)
            End If
            TBL_Pagos.RenderControl(hwriter)
            Response.Write(swriter.ToString())
            Response.End()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            'Make Connection ' Ammar
            ' Variable ' Ammar
            Dim i, j As Integer
            'Excel WorkBook object ' Ammar
            Dim xlApp As Microsoft.Office.Interop.Excel.Application
            Dim xlWorkBook As Microsoft.Office.Interop.Excel.Workbook
            Dim xlWorkSheet As Microsoft.Office.Interop.Excel.Worksheet
            Dim misValue As Object = System.Reflection.Missing.Value
            xlApp = New Microsoft.Office.Interop.Excel.ApplicationClass
            xlWorkBook = xlApp.Workbooks.Add(misValue)
            ' Sheet Name or Number ' Ammar
            xlWorkSheet = xlWorkBook.Sheets("Hoja1")
            ' Sql QUery ' Ammar
            '  xlWorkBook.Sheets.Select("A1:A2")

            Dim sql As String = "SELECT CARRERA, RUT, DIG, PATERNO, MATERNO, NOMBRES, DOCUMENTO, CTADOCNUM, CTAPAGNUM, [MONTO CTADOC] AS MONTOCTADOC, FECVEN, ANO, FECCANCEL, [AÑO MOVIMIENTO] AS ANIOMOV FROM VISTA_ANALISISPAGOS WHERE (RUT <> '') "
            ' SqlAdapter
            Dim dscmd As New SqlDataAdapter(sql, connString)
            ' DataSet
            Dim ds As New DataSet
            dscmd.Fill(ds)
            'COLUMN NAME ADD IN EXCEL SHEET OR HEADING 
            xlWorkSheet.Cells(1, 1).Value = "CARRERA"
            xlWorkSheet.Cells(1, 2).Value = "RUT"
            xlWorkSheet.Cells(1, 3).Value = "DIG"
            xlWorkSheet.Cells(1, 4).Value = "PATERNO"
            ' SQL Table Transfer to Excel
            For i = 0 To ds.Tables(0).Rows.Count - 1
                'Column
                For j = 0 To ds.Tables(0).Columns.Count - 1
                    ' this i change to header line cells >>>
                    xlWorkSheet.Cells(i + 3, j + 1) = _
                    ds.Tables(0).Rows(i).Item(j)
                Next
            Next
            'HardCode in Excel sheet
            ' this i change to footer line cells  >>>
            xlWorkSheet.Cells(i + 3, 7) = "Total"
            xlWorkSheet.Cells.Item(i + 3, 8) = "=SUM(H2:H18)"
            ' Save as path of excel sheet
            xlWorkSheet.SaveAs("D:\vbexcel1.xlsx")
            xlWorkBook.Close()
            xlApp.Quit()
            releaseObject(xlApp)
            releaseObject(xlWorkBook)
            releaseObject(xlWorkSheet)
            'Msg Box of Excel Sheet Path
            MsgBox("You can find the file D:\vbexcel1.xlsx")
        Catch ex As Exception

        End Try

    End Sub
    ' Function of Realease Object in Excel Sheet
    Private Sub releaseObject(ByVal obj As Object)
        Try
            System.Runtime.InteropServices.Marshal.ReleaseComObject(obj)
            obj = Nothing
        Catch ex As Exception
            obj = Nothing
        Finally
            GC.Collect()
        End Try
    End Sub
End Class
