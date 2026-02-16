Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class ReporteWebpay
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT NOMBRE_C, CODCARR FROM MT_CARRER WHERE (TIPOCARR = 1) AND (JORNADA IS NOT NULL) ORDER BY NOMBRE_C"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "MT_CARRER")


            CB_Carrera.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim codCarr As String = Trim(ds.Tables(0).Rows(i)("CODCARR").ToString)
                Dim nomCarr As String = ds.Tables(0).Rows(i)("NOMBRE_C").ToString
                nomCarr = IIf(nomCarr.Length > 55, Mid(nomCarr, 1, 55), nomCarr)
                CB_Carrera.Items.Add(New ListItem(Mid(codCarr, codCarr.Length, codCarr.Length) + " - " + nomCarr, codCarr))
            Next
            connString.Close()

            TBL_InfoAlumno.Visible = False
            TBL_MontoAlumno.Visible = False
            TBL_Aranceles.Visible = False
            Exportar.Visible = False
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try

    End Sub

    Protected Sub Enviar_Click(sender As Object, e As EventArgs) Handles Enviar.Click
        'Evento Boton Ver Informe
        Aranceles()
    End Sub

    Protected Sub Aranceles()
        '
        Dim Fn As New Funciones
        '
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dsWebpay As New DataSet
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)

        Dim command As Object = connString.CreateCommand
        '
        'Variables de Formulario de Busqueda
        Dim FrmRut As String = TB_Rut.Text
        Dim FrmInforme As String = CB_TipoInforme.SelectedValue.ToString
        Dim FrmEstado As String = CB_Estado.SelectedValue.ToString
        Dim FrmCarrera As String = CB_Carrera.SelectedValue.ToString
        Dim FrmFechaDesde As String = TB_FechaDesde.Text
        Dim FrmFechaHasta As String = TB_FechaHasta.Text
        Dim FrmOrdenCompra As String = TB_OrdenCompra.Text

        Try

            'strSql = "SELECT ID, RUT, '$' + STR(MONTO) as MONTO, CUOTA, FECHA, CODCARR, OC, ESTADOFINAL FROM MT_WEBPAY WHERE (ID <> 0) "
            'strSql = "SELECT ID,CODCLI AS RUT,MONTO,CUOTA,FECHA,CODCARR,OC,ESTADOFINAL FROM TMP_REPORTE_WEBPAY_ZONAREPORTES WHERE (ID <> 0)"
            strSql = consultaDatosWebPay()
			
			'Response.Write(strSQL)

            If (FrmRut.ToString <> "") Then
                strSql = strSql + "AND (RUT = '" + FrmRut.ToString + "') "
            End If

            If (FrmInforme.ToString = "OC") Then 'ARANCELES
                strSql = strSql + " AND TIPO = 'ASIG' "
            ElseIf (FrmInforme.ToString = "CE") Then 'CERTIFICADOS
                strSql = strSql + " AND TIPO = 'MAT' "
            End If

            If (FrmCarrera.ToString <> "") Then
                strSql = strSql + " AND (CODCARR = '" + FrmCarrera.ToString + "') "
            End If

            If (FrmFechaDesde <> "" And FrmFechaHasta <> "") Then
                strSql = strSql + "AND (CAST(FECHA AS DATE) BETWEEN '" + FrmFechaDesde + "' AND '" + FrmFechaHasta + "') "
            End If

            If (TB_OrdenCompra.Text.ToString <> "") Then
                TBL_MontoAlumno.Visible = False
                strSql = strSql + "AND (OC = '" + TB_OrdenCompra.Text.ToString + "') "
            Else
                TBL_MontoAlumno.Visible = True
            End If

            If (FrmEstado.ToString <> "Todo") Then
                '
                strSql = strSql + "AND (ESTADOFINAL = '" + FrmEstado.ToString + "') "
            End If

            strSql = strSql + "ORDER BY FECHA DESC"

            '
            '        If (FrmInforme.ToString <> "Todo") Then
            '            '
            '            strSql = strSql + "And (LEFT(OC,2) = '" + FrmInforme.ToString + "') "
            '        End If
            '        '
            '        If (FrmRut.ToString <> "") Then
            '            '
            '            strSql = strSql + "AND (RUT = '" + FrmRut.ToString + "') "
            '        End If
            '        '
            '        If (FrmCarrera.ToString <> "") Then
            '            '
            '            strSql = strSql + "AND (CODCARR = '" + FrmCarrera.ToString + "') "
            '        End If
            '        '
            '        If (FrmFechaDesde <> "" And FrmFechaHasta <> "") Then
            ''strSql = strSql + "AND (FECHA >= '" + FrmFechaDesde + "') AND (FECHA <= '" + FrmFechaHasta + "') "
            '            strSql = strSql + "AND (CAST(FECHA AS DATE) BETWEEN '" + FrmFechaDesde + "' AND '" + FrmFechaHasta + "') "

            '        End If
            '        '
            '        If (FrmEstado.ToString <> "Todo") Then
            '            '
            '            strSql = strSql + "AND (ESTADOFINAL = '" + FrmEstado.ToString + "') "
            '        End If
            '        '
            '        If (TB_OrdenCompra.Text.ToString <> "") Then
            '            '
            '            TBL_MontoAlumno.Visible = False
            '            strSql = strSql + "AND (OC = '" + TB_OrdenCompra.Text.ToString + "') "
            '        Else
            '            '
            '            TBL_MontoAlumno.Visible = True
            '        End If
            '        '
            '        strSql = strSql + "ORDER BY FECHA DESC"

            'Response.Write(strSql)
            '
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

            '
            If (FrmInforme.ToString = "OC" Or FrmInforme.ToString = "Todo") Then
                'Numero de transacciones en Blanco, Aprobados y Rechazadas para Aranceles
                LB_ArancelAceptado.Text = Fn.NumeroPagosAceptados(FrmRut, "OC", "Aceptado", FrmFechaDesde, FrmFechaHasta, FrmCarrera)
                LB_ArancelRechazado.Text = Fn.NumeroPagosAceptados(FrmRut, "OC", "Rechazado", FrmFechaDesde, FrmFechaHasta, FrmCarrera)
                LB_ArancelBlanco.Text = Fn.NumeroPagosAceptados(FrmRut, "OC", "", FrmFechaDesde, FrmFechaHasta, FrmCarrera)
            Else
                LB_ArancelAceptado.Text = 0
                LB_ArancelRechazado.Text = 0
                LB_ArancelBlanco.Text = 0
            End If
            '
            LB_ArancelTotal.Text = CInt(LB_ArancelAceptado.Text) + CInt(LB_ArancelRechazado.Text) + CInt(LB_ArancelBlanco.Text)
            '
            If (FrmInforme.ToString = "CE" Or FrmInforme.ToString = "Todo") Then
                'Numero de transacciones en Blanco, Aprobados y Rechazadas para Aranceles
                LB_CertificadoAceptado.Text = Fn.NumeroPagosAceptados(FrmRut, "CE", "Aceptado", FrmFechaDesde, FrmFechaHasta, FrmCarrera)
                LB_CertificadoRechazado.Text = Fn.NumeroPagosAceptados(FrmRut, "CE", "Rechazado", FrmFechaDesde, FrmFechaHasta, FrmCarrera)
                LB_CertificadoBlanco.Text = Fn.NumeroPagosAceptados(FrmRut, "CE", "", FrmFechaDesde, FrmFechaHasta, FrmCarrera)
            Else
                LB_CertificadoAceptado.Text = 0
                LB_CertificadoRechazado.Text = 0
                LB_CertificadoBlanco.Text = 0
            End If
            '
            LB_CertificadoTotal.Text = CInt(LB_CertificadoAceptado.Text) + CInt(LB_CertificadoRechazado.Text) + CInt(LB_CertificadoBlanco.Text)
            '
            'Totales para cada columna
            LB_TotalAceptados.Text = CInt(LB_ArancelAceptado.Text) + CInt(LB_CertificadoAceptado.Text)
            LB_TotalRechazados.Text = CInt(LB_ArancelRechazado.Text) + CInt(LB_CertificadoRechazado.Text)
            LB_TotalBlancos.Text = CInt(LB_ArancelBlanco.Text) + CInt(LB_CertificadoBlanco.Text)
            LB_TotalFinal.Text = CInt(LB_ArancelTotal.Text) + CInt(LB_CertificadoTotal.Text)
            '
            da = New SqlDataAdapter(strSql, connString)
			'response.write(strSql)
            da.Fill(dsWebpay)
            connString.Close()
            '

            TBL_Aranceles.Visible = True

            If (dsWebpay.Tables(0).Rows.Count > 0) Then

                For i As Integer = 0 To dsWebpay.Tables(0).Rows.Count - 1
                    '
                    Dim RowTableInforme As New TableRow
                    RowTableInforme.TableSection = TableRowSection.TableBody
                    RowTableInforme.ID = "00" + i
                    '
                    Dim CellRutalumno As New TableCell
                    Dim CellOrdencompra As New TableCell
                    Dim CellCuota As New TableCell
                    Dim CellFecha As New TableCell
                    Dim CellMonto As New TableCell
                    Dim CellCodcarrera As New TableCell
                    Dim CellEstado As New TableCell
                    '
                    CellRutalumno.Text = dsWebpay.Tables(0).Rows(i)("RUT").ToString
                    CellOrdencompra.Text = dsWebpay.Tables(0).Rows(i)("OC").ToString
                    CellCuota.Text = dsWebpay.Tables(0).Rows(i)("CUOTA").ToString
                    CellFecha.Text = dsWebpay.Tables(0).Rows(i)("FECHA").ToString
                    CellMonto.Text = dsWebpay.Tables(0).Rows(i)("MONTO").ToString
                    CellCodcarrera.Text = dsWebpay.Tables(0).Rows(i)("CODCARR").ToString
                    If (dsWebpay.Tables(0).Rows(i)("ESTADOFINAL").ToString = "Aceptado") Then
                        CellEstado.Text = "Aprobado"
                    Else
                        CellEstado.Text = dsWebpay.Tables(0).Rows(i)("ESTADOFINAL").ToString
                    End If

                    '
                    RowTableInforme.Controls.Add(CellRutalumno)
                    RowTableInforme.Controls.Add(CellOrdencompra)
                    RowTableInforme.Controls.Add(CellCuota)
                    RowTableInforme.Controls.Add(CellFecha)
                    RowTableInforme.Controls.Add(CellMonto)
                    RowTableInforme.Controls.Add(CellCodcarrera)
                    RowTableInforme.Controls.Add(CellEstado)
                    '
                    TBL_Aranceles.Controls.Add(RowTableInforme)
                Next
                '
                'Habilitar boton Exportar a Excell
                Exportar.Visible = True
            End If

        Catch ex As Exception
            MsgBox("Error: " + ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Protected Sub Exportar_Click(sender As Object, e As EventArgs) Handles Exportar.Click
        'Evento Boton Ver Informe
        Aranceles()
        ExportarExcell()
    End Sub

    Private Sub ExportarExcell()
        '
        Dim Fn As New Funciones
        '
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dsWebpay As New DataSet
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        '
        'Variables de Formulario de Busqueda
        Dim FrmRut As String = TB_Rut.Text
        Dim FrmInforme As String = CB_TipoInforme.SelectedValue.ToString
        Dim FrmEstado As String = CB_Estado.SelectedValue.ToString
        Dim FrmCarrera As String = CB_Carrera.SelectedValue.ToString
        Dim FrmFechaDesde As String = TB_FechaDesde.Text
        Dim FrmFechaHasta As String = TB_FechaHasta.Text
        Dim FrmOrdenCompra As String = TB_OrdenCompra.Text

        Try
            '
            strSql = "SELECT ID, RUT, '$' + STR(MONTO) as MONTO, FECHA, CODCARR, OC, ESTADOFINAL FROM MT_WEBPAY WHERE (ID <> 0) "
            '
            If (FrmInforme.ToString <> "Todo") Then
                '
                strSql = strSql + "AND (LEFT(OC,2) = '" + FrmInforme.ToString + "') "
            End If
            '
            If (FrmRut.ToString <> "") Then
                '
                strSql = strSql + "AND (RUT = '" + FrmRut.ToString + "') "
            End If
            '
            If (FrmCarrera.ToString <> "") Then
                '
                strSql = strSql + "AND (CODCARR = '" + FrmCarrera.ToString + "') "
            End If
            '
            If (FrmFechaDesde <> "" And FrmFechaHasta <> "") Then
                '
                strSql = strSql + "AND (FECHA BETWEEN '" + FrmFechaDesde + "' AND '" + FrmFechaHasta + "') "
            End If
            '
            If (FrmEstado.ToString <> "Todo") Then
                '
                strSql = strSql + "AND (ESTADOFINAL = '" + FrmEstado.ToString + "') "
            End If
            '
            If (TB_OrdenCompra.Text.ToString <> "") Then
                '
                TBL_MontoAlumno.Visible = False
                strSql = strSql + "AND (OC = '" + TB_OrdenCompra.Text.ToString + "') "
            Else
                '
                TBL_MontoAlumno.Visible = True
            End If
            '
            strSql = strSql + "ORDER BY FECHA DESC"

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
            TBL_Aranceles.RenderControl(hwriter)
            Response.Write(swriter.ToString())
            Response.End()

        Catch ex As Exception

        End Try
    End Sub
    Private Function consultaDatosWebPay() As String
        consultaDatosWebPay = "SELECT ID,RUT,MONTO,CUOTA,FECHA,CODCARR,OC,ESTADOFINAL FROM "
        consultaDatosWebPay = consultaDatosWebPay + "(SELECT * FROM "
        consultaDatosWebPay = consultaDatosWebPay + "(SELECT  "
        consultaDatosWebPay = consultaDatosWebPay + "E.ID, "
        consultaDatosWebPay = consultaDatosWebPay + "T.CODCLI AS RUT, "
        consultaDatosWebPay = consultaDatosWebPay + "CASE "
        consultaDatosWebPay = consultaDatosWebPay + "WHEN TIPO = 'MAT' THEN '$' + '3600' "
        consultaDatosWebPay = consultaDatosWebPay + "WHEN TIPO = 'ASIG' THEN '$' + '0' "
        consultaDatosWebPay = consultaDatosWebPay + "WHEN TIPO = 'RPE' THEN '$' + '1100' "
        consultaDatosWebPay = consultaDatosWebPay + "WHEN TIPO = 'NPE' THEN '$' + '2700' "
        consultaDatosWebPay = consultaDatosWebPay + "END AS MONTO, "
        consultaDatosWebPay = consultaDatosWebPay + "/*'$' + '0' AS MONTO,*/ "
        consultaDatosWebPay = consultaDatosWebPay + "'1' AS CUOTA, "
        consultaDatosWebPay = consultaDatosWebPay + "FECHAPAGO AS FECHA, "
        consultaDatosWebPay = consultaDatosWebPay + "T.CODCARR, "
        consultaDatosWebPay = consultaDatosWebPay + "CONVERT(VARCHAR(300),UID) AS OC, "
        consultaDatosWebPay = consultaDatosWebPay + "OBSERVACION AS ESTADOFINAL, "
        consultaDatosWebPay = consultaDatosWebPay + "TIPO AS TIPO  "
        consultaDatosWebPay = consultaDatosWebPay + "FROM EMISIONCERTIFICADOS E LEFT JOIN (SELECT DISTINCT * FROM  "
        consultaDatosWebPay = consultaDatosWebPay + "(SELECT DISTINCT CODCLI,CONTRATO,CODCARR  "
        consultaDatosWebPay = consultaDatosWebPay + "FROM MT_CTADOC WHERE CONTRATO IN  "
        consultaDatosWebPay = consultaDatosWebPay + "(SELECT DISTINCT CODCLI FROM EMISIONCERTIFICADOS) "
        consultaDatosWebPay = consultaDatosWebPay + "UNION ALL  "
        consultaDatosWebPay = consultaDatosWebPay + "SELECT DISTINCT RUT AS CODCLI,CODCLI AS CONTRATO, "
        consultaDatosWebPay = consultaDatosWebPay + "CODCARPR AS CODCARR  "
        consultaDatosWebPay = consultaDatosWebPay + "FROM MT_ALUMNO  "
        consultaDatosWebPay = consultaDatosWebPay + "WHERE CODCLI IN  "
        consultaDatosWebPay = consultaDatosWebPay + "(SELECT DISTINCT CODCLI FROM EMISIONCERTIFICADOS)) W)T  "
        consultaDatosWebPay = consultaDatosWebPay + "ON T.CONTRATO = E.CODCLI)X "
        consultaDatosWebPay = consultaDatosWebPay + "WHERE FECHA >= '2018-01-01' "
        consultaDatosWebPay = consultaDatosWebPay + "UNION ALL "
        consultaDatosWebPay = consultaDatosWebPay + "SELECT  "
        consultaDatosWebPay = consultaDatosWebPay + "ID,  "
        consultaDatosWebPay = consultaDatosWebPay + "RUT,  "
        consultaDatosWebPay = consultaDatosWebPay + "'$' + STR(MONTO) as MONTO,  "
        consultaDatosWebPay = consultaDatosWebPay + "CUOTA,  "
        consultaDatosWebPay = consultaDatosWebPay + "FECHA,  "
        consultaDatosWebPay = consultaDatosWebPay + "CODCARR,  "
        consultaDatosWebPay = consultaDatosWebPay + "OC,  "
        consultaDatosWebPay = consultaDatosWebPay + "ESTADOFINAL, "
        consultaDatosWebPay = consultaDatosWebPay + "CASE "
        consultaDatosWebPay = consultaDatosWebPay + "WHEN LEFT(OC,2) = 'OC' THEN 'MAT' "
        consultaDatosWebPay = consultaDatosWebPay + "WHEN LEFT(OC,2) = 'CE' THEN 'ASIG' "
        consultaDatosWebPay = consultaDatosWebPay + "END AS TIPO "
        consultaDatosWebPay = consultaDatosWebPay + "FROM MT_WEBPAY  "
        consultaDatosWebPay = consultaDatosWebPay + "WHERE (ID <> 0) "
        consultaDatosWebPay = consultaDatosWebPay + "AND FECHA < '2018-01-01')AA "
        consultaDatosWebPay = consultaDatosWebPay + "WHERE ID <> 0 "
		'response.write(consultaDatosWebPay)
		'response.end()
    End Function

End Class
