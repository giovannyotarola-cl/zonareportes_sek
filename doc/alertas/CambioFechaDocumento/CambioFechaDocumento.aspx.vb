Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class CambioFechaDocumento
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        'Response.write("<h1>Aplicación en mantención</h1>")
		'MsgBox("Aplicación en Mantención")		
		'Response.End()
		Dim user as String

		  
		if (Request("user") = "") Then
			Response.Redirect("http://zonareportes.usek.cl")
		end if
		user= Request("user")
 
		If (Not Me.IsPostBack) Then
            getTipoDocumento()
			
        End If
    End Sub

    Protected Sub getTipoDocumento()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
		Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        Try
            strSQL = "select * from MT_DOCUM"
            
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            ddlTDocumento.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim nombreDoc As String = ds.Tables(0).Rows(i)("NOMBRE").ToString
                Dim Tipo As String = ds.Tables(0).Rows(i)("TIPODOC").ToString
                ddlTDocumento.Items.Add(New ListItem(nombreDoc, Tipo))
            Next
        Catch ex As Exception
           ' MsgBox("Error: " + ex.Message.ToString)
		Finally
            connString.Close()
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
        Dim frmTipoDoc As String = ddlTDocumento.SelectedValue.ToString


        Try
            '
            strSql = "select * from mt_ctadoc where  "
            'FILTRO RUT
            If (frmRutAlumno.ToString <> "") Then
                strSql = strSql + " (codcli = '" + frmRutAlumno + "')"

            End If
            'FILTRO FACULTAD
            If (frmTipoDoc.ToString <> "") Then
                strSql = strSql + "AND (ctadoc = '" + frmTipoDoc + "')"
                strSql = strSql + "AND (saldo > '0')"
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
                    Dim CellChekCuenta As New TableCell
                    Dim CellCodcli As New TableCell
                    Dim CellCtadoc As New TableCell
                    Dim CellCtadocnum As New TableCell

                    Dim CellCuota As New TableCell
                    Dim CellNumcuota As New TableCell
                    Dim CellSaldo As New TableCell
                    Dim CellFecven As New TableCell
                    Dim CellFecdeuda As New TableCell
                    Dim CellAño As New TableCell
                    Dim CellPeriodo As New TableCell
                    Dim CellVctoori As New TableCell

                    'crea varaible para las fechas
                    Dim fecven As Date = ds.Tables(0).Rows(i)("FECVEN").ToString()
                    Dim fecdeuda As New Date 
					if ds.Tables(0).Rows(i)("FECDEUDA").ToString() <> "" Then
					     fecdeuda = ds.Tables(0).Rows(i)("FECDEUDA").ToString()
					End If
                    Dim vctoori As New Date
                    If ds.Tables(0).Rows(i)("VCTOORI").ToString() <> "" Then
                        vctoori = ds.Tables(0).Rows(i)("VCTOORI").ToString()
                    End If
                    Dim chkcuenta As New RadioButton
                    chkcuenta.ID = "seleccuenta"
                    chkcuenta.Attributes.Add("OnCLick", "javascript:seleccuenta('" & ds.Tables(0).Rows(i)("CTADOCNUM").ToString() & "'," & fecven & ")")


                    '
                    CellCodcli.Text = ds.Tables(0).Rows(i)("CODCLI").ToString()
                    CellCtadoc.Text = ds.Tables(0).Rows(i)("CTADOC").ToString()
                    CellCtadocnum.Text = ds.Tables(0).Rows(i)("CTADOCNUM").ToString()
                    CellCuota.Text = ds.Tables(0).Rows(i)("CUOTA").ToString()
                    CellNumcuota.Text = ds.Tables(0).Rows(i)("NUMCUOT").ToString()
                    CellSaldo.Text = ds.Tables(0).Rows(i)("SALDO").ToString()
                    CellFecven.Text = fecven.ToString("dd/MM/yyyy")
                    CellFecdeuda.Text = fecdeuda.ToString("dd/MM/yyyy")
                    CellAño.Text = ds.Tables(0).Rows(i)("ANO").ToString()
                    CellPeriodo.Text = ds.Tables(0).Rows(i)("PERIODO").ToString()
                    CellVctoori.Text = vctoori.ToString("dd/MM/yyyy")
                    CellChekCuenta.Controls.Add(chkcuenta)

                    '

                    RowTableInforme.Controls.Add(CellChekCuenta)
                    RowTableInforme.Controls.Add(CellCodcli)
                    RowTableInforme.Controls.Add(CellCtadoc)
                    RowTableInforme.Controls.Add(CellCtadocnum)
                    RowTableInforme.Controls.Add(CellCuota)
                    RowTableInforme.Controls.Add(CellNumcuota)
                    RowTableInforme.Controls.Add(CellSaldo)
                    RowTableInforme.Controls.Add(CellFecven)
                    RowTableInforme.Controls.Add(CellFecdeuda)
                    RowTableInforme.Controls.Add(CellAño)
                    RowTableInforme.Controls.Add(CellPeriodo)
                    RowTableInforme.Controls.Add(CellVctoori)

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
		Finally
            connString.Close()
        End Try
 
    End Sub

    Protected Sub Exportar_Click(sender As Object, e As EventArgs) Handles Exportar.Click
        'Evento Boton Ver Informe
        Dim Fecha As String = txtFecha.Text
        Dim CtaDocnum As String = hctadocnum.Value

        If Fecha <> "" And CtaDocnum <> "" Then
            setDatos(CtaDocnum, Fecha)
            getDatos()
        Else
            Utilities.CreateMessageAlert(Me, "Debe seleccionar una fecha", "strKey1")
            getDatos()
        End If


    End Sub
    Private Sub setDatos(ByVal ctadocnum As String, ByVal fechaven As String)
        Dim Fn As New Funciones
        '
        Dim strSql As String
        Dim strSql2 As String
        Dim strSql3 As String
        Dim codcli As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim FechaVenc As Date
        Dim comm As SqlCommand
        Dim frmRutAlumno As String = txtRutAlumno.Text.ToString
        Dim Fecha As Date = fechaven
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
		Dim connStringSeg As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Seguridad").ConnectionString)
        Try
            ' formateo la fecha que llega por parametro
            Fecha = Fecha.ToString("dd/MM/yyyy")

            strSql = "select * from mt_ctadoc where CTADOCNUM='" & ctadocnum & "'"
            connString.Open()
            connStringSeg.Open()

            da = New SqlDataAdapter(strSql, connString)
            da.Fill(ds)
            'cargo la fecha actual de vencimiento para dejarla en vtoori
            If (ds.Tables(0).Rows.Count > 0) Then
                FechaVenc = ds.Tables(0).Rows(0)("FECVEN").ToString()
                codcli = ds.Tables(0).Rows(0)("CODCLI").ToString()
            End If
            ' formateo la fecha que quedara en vctoori
            FechaVenc = FechaVenc.ToString("dd/MM/yyyy")

            strSql2 = "update mt_ctadoc set VCTOORI = '" & FechaVenc & "', FECVEN = '" & Fecha & "' where CTADOCNUM = '" & ctadocnum & "' and codcli='" & frmRutAlumno & "'"
           ' Response.Write(strSql2)
			'Response.End()
			comm = New SqlCommand(strSql2, connString)
            comm.ExecuteNonQuery()
			
			
			strSql3 = "insert into seg_auditoria values ('" & Request("user") & "',getdate(),'Modificación','Cambio Fecha Documento','Se cambia fecha vencimiento a codcli=" & frmRutAlumno & " Vencimiento original=" & FechaVenc & " - nuevo vencimiento=" & fecha & " CTADOCNUM= " & ctadocnum & "','Zona Reportes')"
			comm = New SqlCommand(strSql3, connStringSeg)
            comm.ExecuteNonQuery()
		Catch ex As Exception
            Utilities.CreateMessageAlert(Me, "Error:" + ex.Message.ToString, "strKey1")
        Finally
            connString.Close()
            Utilities.CreateMessageAlert(Me, "Cambio realizado con exito", "strKey1")
        End Try

    End Sub


End Class
