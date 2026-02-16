Imports System.Data
Imports System.Data.SqlClient

Partial Class Account_Login
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Session("USERID") = ""
        Session("USERNAME") = ""
    End Sub
    Protected Sub Login(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles LoginForm.Authenticate
        Dim Autenticado As Boolean
        Autenticado = LoginCorrecto(LoginForm.UserName, LoginForm.Password)
        e.Authenticated = Autenticado
    End Sub
    Private Function LoginCorrecto(ByVal Usuario As String, ByVal Contrasena As String) As Boolean

        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim ingreso As Boolean
        Dim connString As SqlConnection = New SqlConnection()
        connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString

        strSQL = "SELECT USERID,USERNAME FROM IF_USUARIO_INFORMES WHERE USERNAME='" + Usuario + "' AND USERPASS='" + Contrasena + "'"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            If ds.Tables(0).Rows.Count = 0 Then
                ingreso = False
            Else
                Session("USERID") = ds.Tables(0).Rows(0)("USERID").ToString
                Session("USERNAME") = ds.Tables(0).Rows(0)("USERNAME").ToString
                ingreso = True
            End If
        Catch ex As Exception
            Response.Write(ex.Message)
            ingreso = False
        Finally
            connString.Close()
        End Try
        Funciones.GuardarLogAcceso(Request.ServerVariables("REMOTE_ADDR").ToString, ingreso, Usuario, Contrasena)
        LoginCorrecto = ingreso
    End Function
    
End Class
