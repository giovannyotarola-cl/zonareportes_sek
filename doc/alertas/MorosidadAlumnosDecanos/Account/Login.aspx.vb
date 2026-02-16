Imports System.Data
Imports System.Data.SqlClient

Partial Class Account_Login
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Session("usuario") = ""
        Session("nombre") = ""
        Session("nivel") = ""
        Session("rut") = ""
        Session("facultad") = ""
    End Sub
    Protected Sub Login(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles LoginForm.Authenticate
        Dim Autenticado As Boolean
        Autenticado = LoginCorrecto(LoginForm.UserName, LoginForm.Password)
        e.Authenticated = Autenticado
    End Sub
    Private Function LoginCorrecto(ByVal Usuario As String, ByVal Contrasena As String) As Boolean
        Dim existe As Boolean
        Dim user As New Usuario
        existe = user.buscarUsuario(Usuario, Contrasena)
        If (existe) Then
            Session("usuario") = user.propUsername
            Session("nombre") = user.propNombre
            Session("nivel") = user.propNivel
            Session("rut") = user.propRut
            Session("facultad") = user.propFacultad
        End If
        Return existe
    End Function
End Class
