Imports System.Data.SqlClient
Imports System.Data

Partial Class AdminUsuarioEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Or Session("usuario") <> "admin" Then
            Response.Redirect("Account/Login.aspx")
        End If
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim usuario As New Usuario
        Dim Script As String
        Dim existeUsuario As Boolean
        Dim ingresado As Boolean

        existeUsuario = usuario.existeUsuario(txtUsuario.Text)

        If (Not existeUsuario) Then
            usuario.propUsername = txtUsuario.Text
            usuario.propPassword = txtPass.Text
            usuario.propRut = txtRut.Text
            usuario.propNombre = txtNom.Text
            usuario.propNivel = ddlNivel.SelectedValue
            usuario.propFacultad = ddlFacultad.SelectedValue

            ingresado = Funciones.agregarUsuario(usuario)


            If (ingresado) Then
                Script = "alert('Registro Ingresado.');"
            Else
                Script = "alert('Error al ingresar Registro.');"
            End If
        Else
            Script = "alert('Ya existe ese usuario.');"
        End If
        ClientScript.RegisterStartupScript(Me.GetType(), "script", Script, True)
    End Sub
End Class
