
Partial Class Administrador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Or Session("usuario") <> "admin" Then
            Response.Redirect("Account/Login.aspx")
        Else
            dsUsuarios.SelectCommand = "SELECT * FROM [SEK_MorosidadAlumnosDecanos_usuarios]"
        End If
    End Sub

    Protected Sub gvUsuarios_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvUsuarios.RowCommand
        If (e.CommandName = "Select") Then
            Response.Redirect("AdminUsuarioEdit.aspx?usuario=" + gvUsuarios.Rows(e.CommandArgument).Cells(0).Text)
        End If
    End Sub

End Class
