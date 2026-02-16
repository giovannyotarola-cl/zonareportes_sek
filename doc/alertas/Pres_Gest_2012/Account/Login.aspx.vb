Imports System.Data.SqlClient
Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("username") = ""
    End Sub

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs)
        Dim Autenticado As Boolean

        Autenticado = LoginCorrecto(LoginUser.UserName, LoginUser.Password)
        e.Authenticated = Autenticado
    End Sub

    Private Function LoginCorrecto(ByVal Usuario As String, ByVal Contrasena As String) As Boolean
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        Dim connString As SqlConnection

        strSQL = "select * from dbo.SEK_Presupuestos_Users Where username = '" + Replace(Usuario, "'", "''") + "' AND password = '" + Replace(Contrasena, "'", "''") + "'"

        connString = New SqlConnection()
        connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("UCHILEConnectionString").ConnectionString

        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds)

        If ds.Tables(0).Rows.Count = 0 Then
            LoginCorrecto = False
        Else
            Session("username") = ds.Tables(0).Rows(0).Item(1)
            LoginCorrecto = True
            'System.Diagnostics.Debug.WriteLine(Session("username"))
            'Crear usuario en la sesión y aplicar el rol admin si corresponde
            If ds.Tables(0).Rows(0).Item(3) = "True" Then
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
        End If

    End Function

End Class