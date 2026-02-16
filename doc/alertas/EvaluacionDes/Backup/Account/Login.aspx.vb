Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles LoginUser.Authenticate
        Dim Autenticado As Boolean

        Autenticado = LoginCorrecto(LoginUser.UserName, LoginUser.Password)
        e.Authenticated = Autenticado
        Session("username") = LoginUser.UserName
    End Sub

    Private Function LoginCorrecto(ByVal Usuario As String, ByVal Contrasena As String) As Boolean
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        Dim connString As SqlConnection

        strSQL = "select * from dbo.Evaluacion_Users Where username = '" + Replace(Trim(Usuario), "'", "''") + "' AND password = '" + Replace(Trim(Contrasena), "'", "''") + "'"

        connString = New SqlConnection()
        connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString

        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "dbo.Evaluacion_Users")

        If ds.Tables(0).Rows.Count = 0 Then
            LoginCorrecto = False
        Else
            LoginCorrecto = True
            Session("user_id") = ds.Tables(0).Rows(0).Item(0)
            Session("user_nivel") = ds.Tables(0).Rows(0).Item(6)

            If ds.Tables(0).Rows(0).Item(7) = "True" Then
                If Not Roles.RoleExists("admin") Then
                    Roles.CreateRole("admin")
                End If
                If Not Roles.IsUserInRole(ds.Tables(0).Rows(0).Item(1), "admin") Then
                    Roles.AddUserToRole(ds.Tables(0).Rows(0).Item(1), "admin")
                End If
            Else
                If Not Roles.RoleExists("user") Then
                    Roles.CreateRole("user")
                End If
                If Not Roles.IsUserInRole(ds.Tables(0).Rows(0).Item(1), "user") Then
                    Roles.AddUserToRole(ds.Tables(0).Rows(0).Item(1), "user")
                End If
            End If

            GetParametros()
        End If

    End Function

    Private Sub GetParametros()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        Dim connString As SqlConnection

        strSQL = "Select * from dbo.Evaluacion_Parametros"

        connString = New SqlConnection()
        connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString

        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds)

        Session("ano") = ds.Tables(0).Rows(0).Item(0)
        Session("semestre") = ds.Tables(0).Rows(0).Item(1)
    End Sub

End Class