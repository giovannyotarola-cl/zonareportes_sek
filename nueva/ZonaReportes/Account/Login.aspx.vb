Imports System.Data.SqlClient
Imports System.IO
Imports System
Imports System.Math
Imports System.Data
Imports System.Web.UI.WebControls
Partial Class Account_Login
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Session("UserID") = ""
        Session("UserName") = ""
        Session("UserDes") = ""
        Session("UserCarr") = ""

    End Sub

    Protected Sub Login(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles LoginForm.Authenticate
        Dim Autenticado As Boolean

        Autenticado = LoginCorrecto(LoginForm.UserName, LoginForm.Password)
        If (Autenticado = True) Then
            Response.Redirect("../Dashboard.aspx")
        End If
        e.Authenticated = Autenticado
    End Sub

    Private Function LoginCorrecto(ByVal Usuario As String, ByVal Password As String) As Boolean

        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String
        Dim Response = False

        strSQL = "SELECT * FROM dbo.IF_USUARIO_INFORMES WHERE (USERNAME = '" + Usuario + "') AND (USERPASS = '" + Password + "')"

        Try
            connString.Open()
            Dim da As New SqlDataAdapter(strSQL, connString)
            Dim ds As New DataSet
            da.Fill(ds, "IF_USUARIO_INFORMES")

            If (ds.Tables(0).Rows.Count > 0) Then
                Session("UserID") = ds.Tables(0).Rows(0)("USERID").ToString
                Session("UserName") = ds.Tables(0).Rows(0)("USERNAME")
                Session("UserDes") = ds.Tables(0).Rows(0)("USERDES")
                Session("UserCarr") = ds.Tables(0).Rows(0)("USERCARR")
                Response = True
            Else
                Response = False
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            Response = False
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try
        Return Response
    End Function

End Class