Imports System.Data.SqlClient
Imports System.Data

Partial Class AdminUsuarioEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Or Session("usuario") <> "admin" Then
            Response.Redirect("Account/Login.aspx")
        Else
            Dim idUsuario As Integer
            If (Integer.TryParse(Request.QueryString("usuario"), idUsuario)) Then
                If (Not Me.IsPostBack) Then
                    If (Not cargarUsuario(idUsuario)) Then
                        Response.Redirect("Administrador.aspx")
                    End If
                End If
            Else
                Response.Redirect("Administrador.aspx")
            End If

        End If
    End Sub
    Protected Function cargarUsuario(ByVal idUsuario As Integer) As Boolean
        Dim usuario As New Usuario
        If (usuario.buscarUsuarioID(idUsuario)) Then
            txtUsuario.Text = usuario.propUsername
            txtPass.Text = usuario.propPassword
            txtRut.Text = usuario.propRut
            txtNom.Text = usuario.propNombre
            ddlNivel.SelectedValue = usuario.propNivel
            ddlFacultad.SelectedValue = usuario.propFacultad
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim usuario As New Usuario
        Dim id As String = Request.QueryString("usuario")
        Dim Script As String

        usuario.propUsername = txtUsuario.Text
        usuario.propPassword = txtPass.Text
        usuario.propRut = txtRut.Text
        usuario.propNombre = txtNom.Text
        usuario.propNivel = ddlNivel.SelectedValue
        usuario.propFacultad = ddlFacultad.SelectedValue

        'If (Not usuario.existeUsuario(txtUsuario.Text)) 
        If (Funciones.actualizarUsuario(usuario, id)) Then
            Script = "alert('Usuario actualizado.');window.location= 'Administrador.aspx';"
        Else
            Script = "alert('Error al actualizar usuario.');"
        End If
        'Else
        'Script = "alert('Ya existe ese usuario.');"
        'End If
        ClientScript.RegisterStartupScript(Me.GetType(), "script", Script, True)
    End Sub
End Class
