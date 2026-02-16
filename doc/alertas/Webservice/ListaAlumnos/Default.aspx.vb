Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim cs As ALWS.Alumnos = New ALWS.Alumnos
        Dim ds As DataSet = cs.CallAlumnos
        gvAlumnos.DataSource = ds.Tables(0)
        gvAlumnos.DataBind()
    End Sub
End Class
