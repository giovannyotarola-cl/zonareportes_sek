Imports System.Data.SqlClient
Imports System.Data

Partial Class AdminUsuarioEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Then
            Response.Redirect("Account/Login.aspx")
        End If
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim strSql As String
        Dim comm As SqlCommand
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        Dim usuario As String = txtUsuario.Text
        Dim contrasena As String = txtPass.Text
        Dim nombre As String = txtNom.Text
        Dim apellido As String = txtApellido.Text
        Dim cargo As String = txtCargo.Text
        Dim nivel As String = ddlNivel.SelectedValue
        Dim facultad As String = ddlFacultad.SelectedValue

        strSql = "INSERT INTO SEK_EncAnalisis_usuarios(USUARIO,CONTRASENA,NOMBRE,APELLIDO,CARGO,NIVEL,FACULTAD) VALUES('" + _
            usuario + "','" + _
            contrasena + "','" + _
            nombre + "','" + _
            apellido + "','" + _
            cargo + "','" + _
            nivel + "','" + _
            facultad + "')"
        Try
            conn.Open()
            comm = New SqlCommand(strSql, conn)
            comm.ExecuteNonQuery()
            Dim Script As String = "alert('Registro Ingresado.');"
            ClientScript.RegisterStartupScript(Me.GetType(), "script", Script, True)
            Response.Redirect("Administrador.aspx")
        Catch ex As Exception
            Response.Write(ex.Message)
            Response.Write("Error al Ingresar usuario.")
        Finally
            conn.Close()
        End Try
    End Sub
End Class
