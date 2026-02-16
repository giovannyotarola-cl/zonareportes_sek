Public Class gestion_usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("username") = "" Then
            Response.Redirect("Account/Login.aspx")
        End If
    End Sub

    Protected Sub confirmar_borrar(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grilla_usuarios.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim db As LinkButton
            db = e.Row.Cells(2).Controls(2)
            'Hay que comprobar el último caracter del ID porque si termina en 7 se refiere al botón 
            'cancelar que aparece al pulsar en Editar y pide también confirmación de borrado.
            'System.Diagnostics.Debug.WriteLine(e.Row.Cells(7).Controls(2).UniqueID)
            If Right(e.Row.Cells(2).Controls(2).UniqueID, 1) = 1 Then
                db.OnClientClick = "return confirm('¿Está seguro de querer borrar el usuario seleccionado?');"
            End If
        End If
    End Sub

    Protected Sub actualizar_tabla_usuarios(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles agregar_user.ItemInserted
        grilla_usuarios.DataBind()
    End Sub

End Class