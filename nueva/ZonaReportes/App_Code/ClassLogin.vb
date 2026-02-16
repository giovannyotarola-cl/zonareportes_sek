Imports System.Data.SqlClient
Imports System.IO
Imports System
Imports System.Math
Imports System.Data
Imports System.Web.UI.WebControls

Public Class ClassLogin

    Public Function UserLoogin(ByVal username As String, ByVal password As String) As Boolean

        Dim LoginCorrecto = True

        Dim ds As New DataSet
        Dim connString As SqlConnection
        Dim retorno As String

        connString = New SqlConnection()
        connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("Connection").ConnectionString

        Try
            connString.Open()
            Using cmd As New SqlCommand("SELECT Santiago.dbo.RUT_Titular(@Rut)", connString)
                cmd.Parameters.AddWithValue("@Rut", Replace(username, "'", "''"))

                retorno = CStr(cmd.ExecuteScalar())
                LoginCorrecto = True

            End Using
        Catch ex As Exception
            LoginCorrecto = False
        Finally
            connString.Close()
        End Try

        Return LoginCorrecto
    End Function

End Class
