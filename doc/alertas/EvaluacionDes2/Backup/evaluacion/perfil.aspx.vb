Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        source_perfil.SelectCommand = "Select top 1 username, password, nombre, apellidos, cargo from dbo.Evaluacion_Users where id = " + Session("user_id").ToString
        source_perfil.UpdateCommand = "UPDATE dbo.Evaluacion_Users set username = @username, nombre = @nombre, apellidos = @apellidos, password = @password, cargo = @cargo where id = " + Session("user_id").ToString
    End Sub

End Class