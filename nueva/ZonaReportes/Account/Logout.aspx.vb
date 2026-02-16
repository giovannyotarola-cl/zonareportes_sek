
Partial Class Account_Logout
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Session.RemoveAll()
        Session.Abandon()
        Response.Redirect("Login.aspx")

    End Sub
End Class
