Public Class mostrarDetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'System.Diagnostics.Debug.WriteLine(DirectCast(vista_alumno.FindControl("cell_codcli"), TextBox).Text)
    End Sub

    Protected Sub boton_imprimir_Click(ByVal sender As Object, ByVal e As EventArgs) Handles boton_imprimir.Click
        If boton_imprimir.Text = "Vista de impresión" Then
            listado_asignaturas.AllowPaging = False
            listado_asignaturas.DataBind()
            boton_imprimir.Text = "Vista normal"
        Else
            listado_asignaturas.AllowPaging = True
            listado_asignaturas.DataBind()
            boton_imprimir.Text = "Vista de impresión"
        End If
    End Sub
End Class