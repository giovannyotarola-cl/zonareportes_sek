Imports System.Data.SqlClient

Public Class ver_evaluacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsNothing(Session("user_id")) And Not IsNothing(Session("user_nivel"))) Then
            If (Session("user_id").ToString = "" Or Session("user_nivel").ToString = "") Then
                Response.Redirect("../Account/Login.aspx")
            End If
        Else
            Response.Redirect("../Account/Login.aspx")
        End If
        If (IsNothing(Request.QueryString("evaluacion"))) Then
            Response.Redirect("../Default.aspx")
        Else
            btnRechazarEv.PostBackUrl = "confirmarEvaluacion.aspx?evaluacion=" + Request.QueryString("evaluacion").ToString()
        End If
        checkConfirmar()
    End Sub

    Private Sub checkConfirmar()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String = ""
        Dim connString As SqlConnection = New SqlConnection()

        Try
            strSQL = "select aceptada, id_evaluador, id_empleado from dbo.SEK_EvDes_Encuesta where id_empleado = " + Session("user_id").ToString + " and aceptada NOT IN (0,1);"
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

    Protected Sub btnAceptarEv_Click(sender As Object, e As EventArgs) Handles btnAceptarEv.Click
        aceptarEvaluacion()
        Response.Redirect("seleccionarEvaluado.aspx")
    End Sub
    Protected Sub aceptarEvaluacion()
        Dim cad_conexion As String = ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString
        Dim conn As SqlConnection = New SqlConnection
        Dim cmd As SqlCommand = New SqlCommand
        Dim SQLUpdate As String = ""

        Try
            conn.ConnectionString = cad_conexion
            conn.Open()
            cmd.Connection = conn
            cmd.CommandType = CommandType.Text
            SQLUpdate = "UPDATE dbo.SEK_EvDes_Encuesta set aceptada = 1 where id = " + Request.QueryString("evaluacion") + ";"
            cmd.CommandText = SQLUpdate
            Dim filas As Integer = cmd.ExecuteNonQuery

            If filas = 1 Then
                System.Diagnostics.Debug.WriteLine("Ok")
            Else
                System.Diagnostics.Debug.WriteLine("Error")
            End If

        Catch ex As Exception
            'System.Diagnostics.Debug.WriteLine("Error es: " + ex.ToString)
            System.Diagnostics.Debug.WriteLine("Error al guardar información, intente nuevamente mas tarde")
        Finally
            conn.Close()
        End Try
    End Sub
End Class