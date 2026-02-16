Imports System.Data.SqlClient
Imports System.Data

Partial Class AdminUsuarioEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("USERID") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
            If (Session("USERNAME") <> "admin") Then
                Response.Redirect("Default.aspx")
            Else
                Dim idUsuario As Integer
                If (Integer.TryParse(Request.QueryString("usuario"), idUsuario)) Then
                    If (Not Me.IsPostBack) Then
                        cargarProcesos()
                    End If
                Else
                    Response.Redirect("Administrador.aspx")
                End If
            End If
        End If
    End Sub
    Protected Sub cargarProcesos()
        Dim procesos As List(Of ddlElement) = Funciones.getAllProcesos()
        For i As Integer = 0 To procesos.Count - 1
            Dim proceso As New ListItem(procesos(i).descripcion, procesos(i).id)
            proceso.Attributes.Add("OnClick", "cambiarPermiso()")
            chkListProcesos.Items.Add(proceso)
        Next
    End Sub
End Class
