Imports System.Data.SqlClient
Public Class mostrarCarnet
    Inherits System.Web.UI.Page

    Protected id_alumno As String
    Protected cedula As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim id_lab As Label = FormView1.FindControl("ID_Label")
        'System.Diagnostics.Debug.WriteLine(id_lab.CssClass)
        id_alumno = id_lab.CssClass

        Dim etiq As Label = FormView1.FindControl("RUT_COD_BARRA")
        cedula = "  *" + etiq.Text + "*  "
        'System.Diagnostics.Debug.WriteLine("Cedula es" + cedula)

    End Sub

End Class