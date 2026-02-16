Imports System.Net.Mail
Imports System.Data.SqlClient

Public Class parametros
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsNothing(Session("user_id")) And Not IsNothing(Session("user_nivel"))) Then
            If (Session("user_id").ToString = "" Or Session("user_nivel").ToString = "") Then
                Response.Redirect("../Account/Login.aspx")
            End If
        Else
            Response.Redirect("../Account/Login.aspx")
        End If
        source_parametros.SelectCommand = "Select top 1 id, ano, semestre, habilitado,habilitarRecepcion FROM SEK_EvDes_Parametros"
        source_parametros.UpdateCommand = "UPDATE dbo.SEK_EvDes_Parametros set ano = @ano, semestre = @semestre, habilitado = @habilitado,habilitarRecepcion = @habilitarRecepcion WHERE id=@id"
    End Sub

    Protected Sub btnAlertaRealizar_Click(sender As Object, e As EventArgs) Handles btnAlertaRealizar.Click
        Dim mensaje As String = "prueba1"
        enviarCorreo(mensaje, correosPorRealizarEncuesta)
    End Sub

    Protected Sub btnAlertaRecibir_Click(sender As Object, e As EventArgs) Handles btnAlertaRecibir.Click
        Dim mensaje As String = "prueba2"
        enviarCorreo(mensaje, correosPorRevisarEncuesta)
    End Sub

    Protected Sub enviarCorreo(ByVal mensaje As String, ByVal correos As List(Of String))

        Dim destinatario As String = "envios.usek@usek.cl"
        Dim insMail As New MailMessage(New MailAddress("envios.usek@usek.cl"), New MailAddress(destinatario))
        With insMail
            .Subject = "Evaluación de desempeño"
            .IsBodyHtml = True 'envia el mensaje como html
            .Body = mensaje
            .From = New MailAddress("envios.usek@zonavirtual.uisek.cl", "Evaluación de desempeño")
            '.ReplyTo = New MailAddress (destinatarioCopia)
        End With
        For i As Integer = 0 To correos.Count - 1
            insMail.Bcc.Add(correos(i))
        Next
        Dim smtp As New System.Net.Mail.SmtpClient
        smtp.Host = "smtp.gmail.com"
        smtp.Port = 587
        smtp.EnableSsl = True
        smtp.UseDefaultCredentials = False
        smtp.Credentials = New System.Net.NetworkCredential("envios.usek@zonavirtual.uisek.cl", "Uisek171")
        Try
            smtp.Send(insMail)
        Catch ex As Exception

        End Try
    End Sub

    Protected Function correosPorRealizarEncuesta() As List(Of String)
        Dim correos As New List(Of String)
        Dim sqlStr As String
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString)
        Dim da As SqlDataAdapter
        Dim ds As New DataSet

        sqlStr = "SELECT us.correo FROM dbo.SEK_EvDes_Users us INNER JOIN dbo.SEK_EvDes_Jerarquia ON us.id = dbo.SEK_EvDes_Jerarquia.id_superior WHERE us.id NOT IN (SELECT SEK_EvDes_Encuesta.id_evaluador FROM SEK_EvDes_Encuesta WHERE SEK_EvDes_Encuesta.ano = (SELECT TOP 1 ANO FROM SEK_EvDes_Parametros) AND dbo.SEK_EvDes_Encuesta.semestre = (SELECT TOP 1 SEMESTRE FROM SEK_EvDes_Parametros)) group by us.correo,us.id having (select COUNT(*) from SEK_EvDes_Encuesta WHERE id_evaluador=us.id)<COUNT(us.correo)"

        Try
            conn.Open()
            da = New SqlDataAdapter(sqlStr, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    correos.Add(ds.Tables(0).Rows(i)("correo").ToString)
                Next
            End If
        Catch ex As Exception

        End Try
        Return correos
    End Function

    Protected Function correosPorRevisarEncuesta() As List(Of String)
        Dim correos As New List(Of String)
        Dim sqlStr As String
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString)
        Dim da As SqlDataAdapter
        Dim ds As New DataSet

        sqlStr = "select correo from SEK_EvDes_Users inner join SEK_EvDes_Encuesta on id_empleado= SEK_EvDes_Users.id WHERE aceptada='-1'"

        Try
            conn.Open()
            da = New SqlDataAdapter(sqlStr, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    correos.Add(ds.Tables(0).Rows(i)("correo").ToString)
                Next
            End If
        Catch ex As Exception

        End Try
        Return correos
    End Function
End Class