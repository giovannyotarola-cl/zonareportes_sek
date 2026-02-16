
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim user = Trim(username.Text)
        Dim pass = Trim(password.Text)


        'Response.Write(user.ToString + " " + pass.ToString)
        'Response.End()

    End Sub

End Class
