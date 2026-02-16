Public Class jerarquias_usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        seleccionar_empleado_jerarquia.SelectCommand = "SELECT distinct dbo.Evaluacion_Users.id, dbo.Evaluacion_Users.nombre+' '+dbo.Evaluacion_Users.apellidos as Empleado, dbo.Evaluacion_Users.cargo, dbo.Evaluacion_Users.nivel FROM dbo.Evaluacion_Users"
    End Sub

End Class