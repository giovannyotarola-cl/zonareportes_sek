
Partial Class AdminCrearProceso
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("USERID") = "" Or Session("USERNAME") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
        End If
    End Sub

    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        If (Funciones.agregarProceso(txtNombreProceso.Text, txtDescripcion.Text, txtUbicacion.Text)) Then
            Response.Write("<script type='text/javascript'>alert('Proceso auxiliar agregado correctamente');</script>")
        Else
            Response.Write("<script type='text/javascript'>alert('Problema al agregar proceso auxiliar');</script>")
        End If
    End Sub
End Class
