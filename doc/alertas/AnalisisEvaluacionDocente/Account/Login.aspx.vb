Imports System.Data
Imports System.Data.SqlClient

Partial Class Account_Login
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Session("usuario") = ""
        Session("nivel") = ""
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
        Dim connString As SqlConnection = New SqlConnection()
        connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString

        strSQL = "SELECT USUARIO,NOMBRE + ' ' + APELLIDO AS NOMBRE,NIVEL,FACULTAD FROM SEK_ENCANALISIS_USUARIOS WHERE USUARIO='" + Usuario + "' AND CONTRASENA='" + Contrasena + "'"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            If ds.Tables(0).Rows.Count = 0 Then
                LoginCorrecto = False
            Else
                Session("usuario") = ds.Tables(0).Rows(0)("USUARIO").ToString
                Session("nombre") = ds.Tables(0).Rows(0)("NOMBRE").ToString
                Session("nivel") = ds.Tables(0).Rows(0)("NIVEL").ToString
                Session("FACULTAD") = ds.Tables(0).Rows(0)("FACULTAD").ToString
                LoginCorrecto = True
            End If
        Catch ex As Exception
            Response.Write(ex.Message)
            LoginCorrecto = False
        Finally
            connString.Close()
        End Try
    End Function
End Class
