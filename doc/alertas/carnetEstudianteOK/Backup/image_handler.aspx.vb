Imports System.Data.SqlClient
Public Class image_handler
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CreateImage(Request.QueryString("alumno"))
        End If
    End Sub

    Protected Sub CreateImage(ByVal id_alumno As String)

        Dim strSQL As String = ""
        Dim conn As SqlConnection
        Dim cmd As SqlCommand
        Dim _buf As Byte()

        strSQL = "SELECT Picture from dbo.[Fotos Alumnos] WHERE No_ = '" + id_alumno + "';"
        'System.Diagnostics.Debug.WriteLine(strSQL)

        conn = New SqlConnection()
        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("NAV_UISEK_ECUADORConnectionString").ConnectionString
        conn.Open()
        cmd = New SqlCommand(strSQL, conn)
        _buf = cmd.ExecuteScalar


        'NO CONTROLA LOS NULOS
        If Not (_buf Is Nothing) Then
            Response.ContentType = "image/jpeg"
            Response.BinaryWrite(_buf)
        Else
            Response.Write("")
        End If

        
    End Sub
End Class