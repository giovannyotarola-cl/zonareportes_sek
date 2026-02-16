Imports System.Data.SqlClient

Public Class ver_evaluacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        checkConfirmar()

    End Sub

    Private Sub checkConfirmar()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String = ""
        Dim connString As SqlConnection = New SqlConnection()

        Try
            strSQL = "select aceptada, id_evaluador, id_empleado from dbo.Evaluacion_Encuesta where id_empleado = " + Session("user_id").ToString + " and aceptada = 0;"
            connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)
            If ds.Tables(0).Rows.Count = 0 Then
                confirmable = False
            Else
                confirmable = True
            End If
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error en la consulta: " + ex.ToString)
        Finally
            connString.Close()
        End Try

    End Sub

    Protected confirmable As Boolean

End Class