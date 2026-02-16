Imports System.Data.SqlClient
Imports System.Data

Partial Class AdminUsuarioEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
            Dim idUsuario As Integer
            If (Integer.TryParse(Request.QueryString("usuario"), idUsuario)) Then
                If (Not Me.IsPostBack) Then
                    cargarUsuario(idUsuario)
                End If
            Else
                Response.Redirect("Administrador.aspx")
            End If

        End If
    End Sub
    Protected Sub cargarUsuario(ByVal idUsuario As Integer)
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        strSql = "SELECT * FROM dbo.SEK_EncAnalisis_usuarios where id ='" + idUsuario.ToString + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            If (ds.Tables(0).Rows.Count > 0) Then
                txtUsuario.Text = ds.Tables(0).Rows(0)("usuario").ToString()
                txtPass.Text = ds.Tables(0).Rows(0)("contrasena").ToString()
                txtNom.Text = ds.Tables(0).Rows(0)("nombre").ToString()
                txtApellido.Text = ds.Tables(0).Rows(0)("apellido").ToString()
                txtCargo.Text = ds.Tables(0).Rows(0)("cargo").ToString()
                ddlNivel.SelectedValue = ds.Tables(0).Rows(0)("nivel").ToString()
                ddlFacultad.SelectedValue = ds.Tables(0).Rows(0)("facultad").ToString()
            End If
        Catch ex As Exception
            'Response.Write(ex.Message)
            Response.Write("Error al cargar Usuario")
        Finally
            conn.Close()
        End Try

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
        Dim nivel As String = ddlNivel.SelectedValue.ToString
        Dim facultad As String = ddlFacultad.SelectedValue.ToString

        strSql = "UPDATE SEK_EncAnalisis_usuarios SET " + _
            "USUARIO='" + usuario + "'," + _
            "CONTRASENA='" + contrasena + "'," + _
            "NOMBRE='" + nombre + "'," + _
            "APELLIDO='" + apellido + "'," + _
            "CARGO='" + cargo + "'," + _
            "NIVEL='" + nivel + "'," + _
            "FACULTAD='" + facultad + "' WHERE ID='" + Request.QueryString("usuario") + "'"
        Try
            conn.Open()
            comm = New SqlCommand(strSql, conn)
            comm.ExecuteNonQuery()
            Dim Script As String = "alert('Registro Actualizado.');"
            ClientScript.RegisterStartupScript(Me.GetType(), "script", Script, True)
        Catch ex As Exception
            Response.Write(ex.Message)
            Response.Write("Error al guardar información del usuario.")
        Finally
            conn.Close()
        End Try
    End Sub
End Class
