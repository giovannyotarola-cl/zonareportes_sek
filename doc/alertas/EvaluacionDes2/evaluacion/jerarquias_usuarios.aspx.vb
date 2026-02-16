Public Class jerarquias_usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsNothing(Session("user_id")) And Not IsNothing(Session("user_nivel"))) Then
            If (Session("user_id").ToString = "" Or Session("user_nivel").ToString = "") Then
                Response.Redirect("../Account/Login.aspx")
            End If
        Else
            Response.Redirect("../Account/Login.aspx")
        End If
        seleccionar_empleado_jerarquia.SelectCommand = "SELECT distinct dbo.SEK_EvDes_Users.id, dbo.SEK_EvDes_Users.nombre as Empleado, dbo.SEK_EvDes_Users.cargo, dbo.SEK_EvDes_Users.nivel FROM dbo.SEK_EvDes_Users"
    End Sub

End Class