
Partial Class ProcesosAuxiliares_CambioUbicacionDocumento
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("USERID") = "" Or Session("USERNAME") = "" Then
            Response.Redirect("../Account/Login.aspx")
        Else
            Dim nombrePagina As String = Request.Url.Segments(Request.Url.Segments.Length - 1)
            nombrePagina = nombrePagina.Replace(".aspx", "")
            If (Funciones.tieneAccesoProceso(Session("USERID"), nombrePagina)) Then
                If (Not Me.IsPostBack) Then
                    cargarTipoDoc()
                    cargarUbicacionOrigen()
                    cargarUbicacionDestino()
                End If
            Else
                Response.Redirect("../Default.aspx")
            End If
        End If
    End Sub
    Protected Sub limpiar()
        txtRut.Text = ""
        txtFecVenInicial.Text = ""
        txtFecVenFinal.Text = ""
        ddlTipoDoc.SelectedIndex = 0
        ddlOrigenDoc.SelectedIndex = 0
        ddlDestinoDoc.SelectedIndex = 0
    End Sub
    Protected Sub soloLectura()
        txtRut.ReadOnly = True
        txtFecVenInicial.ReadOnly = True
        txtFecVenFinal.ReadOnly = True
        ddlTipoDoc.Enabled = False
        ddlOrigenDoc.Enabled = False
        ddlDestinoDoc.Enabled = False
    End Sub
    Protected Sub desbloquearSoloLectura()
        txtRut.ReadOnly = False
        txtFecVenInicial.ReadOnly = False
        txtFecVenFinal.ReadOnly = False
        ddlTipoDoc.Enabled = True
        ddlOrigenDoc.Enabled = True
        ddlDestinoDoc.Enabled = True
    End Sub

#Region "Cargar ddl"
    Protected Sub cargarTipoDoc()
        Dim elementos As List(Of ddlElement) = Funciones.getAllTipoDocumento()
        ddlTipoDoc.Items.Add(New ListItem("-"))
        For i As Integer = 0 To elementos.Count - 1
            ddlTipoDoc.Items.Add(New ListItem(elementos(i).descripcion, elementos(i).id))
        Next
    End Sub
    Protected Sub cargarUbicacionOrigen()
        Dim elementos As List(Of ddlElement) = Funciones.getAllUbicacion()
        ddlOrigenDoc.Items.Add(New ListItem("-"))
        For i As Integer = 0 To elementos.Count - 1
            ddlOrigenDoc.Items.Add(New ListItem(elementos(i).descripcion, elementos(i).id))
        Next
    End Sub
    Protected Sub cargarUbicacionDestino()
        Dim elementos As List(Of ddlElement) = Funciones.getAllUbicacion()
        ddlDestinoDoc.Items.Add(New ListItem("-"))
        For i As Integer = 0 To elementos.Count - 1
            ddlDestinoDoc.Items.Add(New ListItem(elementos(i).descripcion, elementos(i).id))
        Next
    End Sub
#End Region
#Region "Funciones Botones"
    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs) Handles btnFiltrar.Click
        Dim rut As String = txtRut.Text
        Dim fecVenIni As String = txtFecVenInicial.Text
        Dim fecVenFinal As String = txtFecVenFinal.Text
        Dim tipoDoc As String = ddlTipoDoc.SelectedItem.Text
        Dim origenDoc As String = ddlOrigenDoc.SelectedItem.Text
        Dim vistaPrev As List(Of CUDVista) = Funciones.CUDbuscarRegistros(rut, fecVenIni, fecVenFinal, tipoDoc, origenDoc)

        If (vistaPrev.Count > 0) Then
            For i As Integer = 0 To vistaPrev.Count - 1
                Dim RowTableInforme As New TableRow
                RowTableInforme.TableSection = TableRowSection.TableBody
                '
                Dim CellRut As New TableCell
                Dim CellNombre As New TableCell
                Dim CellTipoDoc As New TableCell
                Dim CellNumDoc As New TableCell
                Dim CellFecVen As New TableCell
                Dim CellAñoDeuda As New TableCell
                Dim CellSede As New TableCell
                Dim CellTipoCarr As New TableCell
                Dim CellUbicacion As New TableCell
                '
                CellRut.Text = vistaPrev(i).rut
                CellNombre.Text = vistaPrev(i).nombre
                CellTipoDoc.Text = vistaPrev(i).tipoDoc
                CellNumDoc.Text = vistaPrev(i).numDoc
                CellFecVen.Text = vistaPrev(i).fechaVen
                CellAñoDeuda.Text = vistaPrev(i).añoDeuda
                CellSede.Text = vistaPrev(i).sede
                CellTipoCarr.Text = vistaPrev(i).tipoCarr
                CellUbicacion.Text = vistaPrev(i).ubicacion

                RowTableInforme.Controls.Add(CellRut)
                RowTableInforme.Controls.Add(CellNombre)
                RowTableInforme.Controls.Add(CellTipoDoc)
                RowTableInforme.Controls.Add(CellNumDoc)
                RowTableInforme.Controls.Add(CellFecVen)
                RowTableInforme.Controls.Add(CellAñoDeuda)
                RowTableInforme.Controls.Add(CellSede)
                RowTableInforme.Controls.Add(CellTipoCarr)
                RowTableInforme.Controls.Add(CellUbicacion)

                tblPreCarga.Controls.Add(RowTableInforme)
            Next
        End If
        pnlPreCarga.Visible = True
        soloLectura()
    End Sub
    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        'limpiar()
        desbloquearSoloLectura()
        pnlPreCarga.Visible = False
    End Sub
    Protected Sub btnConfirmar_Click(sender As Object, e As EventArgs) Handles btnConfirmar.Click
        Dim cantidadCambios As String = Funciones.CUDcantidadCambios(txtRut.Text, txtFecVenInicial.Text, txtFecVenFinal.Text, ddlTipoDoc.SelectedValue, ddlOrigenDoc.SelectedValue, ddlDestinoDoc.SelectedValue).ToString
        Dim proceso As String = Request.Url.Segments(Request.Url.Segments.Length - 1).Replace(".aspx", "")
        Funciones.grabarLogProceso(Request.ServerVariables("REMOTE_ADDR").ToString, Session("USERID").ToString, proceso)
        Response.Write("<script type='text/javascript'>alert('Cambios realizados: " + cantidadCambios + "');</script>")
        limpiar()
        pnlPreCarga.Visible = False
    End Sub
#End Region
End Class
