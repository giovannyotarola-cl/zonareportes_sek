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
        Dim respuesta As Boolean

        Try
            strSQL = "select * from dbo.SEK_EvDes_Users Where username = '" + Replace(Trim(Usuario), "'", "''") + "' AND password = '" + Replace(Trim(Contrasena), "'", "''") + "'"
            connString = New SqlConnection()
            connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString

            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "dbo.Evaluacion_Users")

            If ds.Tables(0).Rows.Count = 0 Then
                respuesta = False
            Else
                respuesta = True
                Session("user_id") = ds.Tables(0).Rows(0)("id").ToString
                Session("user_nivel") = ds.Tables(0).Rows(0)("nivel").ToString
                Session("nombre") = ds.Tables(0).Rows(0)("nombre").ToString()

                If ds.Tables(0).Rows(0)("is_admin").ToString = "True" Then
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
        Catch ex As Exception
            respuesta = False
        End Try
        GuardarLog(respuesta, Usuario, Contrasena)
        Return respuesta
    End Function
    Private Sub GuardarLog(ByVal ingreso As Boolean, ByVal usuario As String, ByVal contraseña As String)
        Dim ds As New DataSet
        Dim comm As SqlCommand
        Dim strSQL As String
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString)

        Dim ip As String = Request.ServerVariables("REMOTE_ADDR").ToString
        Dim fecha As String = DateTime.Now.ToString("yyyy-MM-dd")
        Dim hora As String = DateTime.Now.ToString("HH:mm:ss")
        Dim strIngreso As String = IIf(ingreso, "1", "0")

        strSQL = "INSERT INTO SEK_EvDes_LogInicio(IP,FECHA,HORA,INGRESO,USUARIO,CONTRASEÑA) VALUES(" + _
            "'" + ip + "'," + _
            "'" + fecha + "'," + _
            "'" + hora + "'," + _
            "'" + strIngreso + "'," + _
            "'" + usuario + "'," + _
            "'" + contraseña + "'" + _
            ")"
        Try
            conn.Open()

            comm = New SqlCommand(strSQL, conn)
            comm.ExecuteNonQuery()
        Catch ex As Exception
        Finally
            conn.Close()
        End Try

    End Sub
    Private Sub GetParametros()
        Try
            Dim ds As New DataSet
            Dim da As SqlClient.SqlDataAdapter
            Dim strSQL As String
            Dim connString As SqlConnection

            strSQL = "Select * from dbo.SEK_EvDes_Parametros"

            connString = New SqlConnection()
            connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString

            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            Session("ano") = ds.Tables(0).Rows(0).Item(0)
            Session("semestre") = ds.Tables(0).Rows(0).Item(1)
        Catch ex As Exception

        End Try
    End Sub

End Class