Imports System.Data.SqlClient

Public Class confirmarEvaluacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsNothing(Session("user_id")) And Not IsNothing(Session("user_nivel"))) Then
            If (Session("user_id").ToString = "" Or Session("user_nivel").ToString = "") Then
                Response.Redirect("../Account/Login.aspx")
            End If
        Else
            Response.Redirect("../Account/Login.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click

        Guardar_Comentario(comentario_usuario.Text)
        Response.Redirect("seleccionarEvaluado.aspx")
    End Sub

    Protected Function Guardar_Comentario(ByVal comentario As String) As Boolean
        Dim cad_conexion As String = ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString
        Dim conn As SqlConnection = New SqlConnection
        Dim cmd As SqlCommand = New SqlCommand
        Dim SQLUpdate As String = ""

        Try
            conn.ConnectionString = cad_conexion
            conn.Open()
            cmd.Connection = conn
            cmd.CommandType = CommandType.Text
            SQLUpdate = "UPDATE dbo.SEK_EvDes_Encuesta set comentario_evaluado ='" + comentario + "', aceptada = 0 where id = " + Request.QueryString("evaluacion") + ";"
            cmd.CommandText = SQLUpdate
            Dim filas As Integer = cmd.ExecuteNonQuery

            If filas = 1 Then
                System.Diagnostics.Debug.WriteLine("Ok")
            Else
                System.Diagnostics.Debug.WriteLine("Error")
            End If

        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error es: " + ex.ToString)
        Finally
            conn.Close()
        End Try
    End Function
End Class