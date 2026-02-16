Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsNothing(Session("user_id")) And Not IsNothing(Session("user_nivel"))) Then
            If (Session("user_id").ToString = "" Or Session("user_nivel").ToString = "") Then
                Response.Redirect("../Account/Login.aspx")
            End If
        Else
            Response.Redirect("../Account/Login.aspx")
        End If
        source_perfil.SelectCommand = "Select top 1 username, password, nombre, cargo, correo, rut from dbo.SEK_EvDes_Users where id = " + Session("user_id").ToString
        source_perfil.UpdateCommand = "UPDATE dbo.SEK_EvDes_Users set username = @username, password = @password, correo=@correo where id = " + Session("user_id").ToString
    End Sub

End Class