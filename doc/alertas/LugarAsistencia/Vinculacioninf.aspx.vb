Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web.Services
Imports System.Drawing
Imports System.Configuration


Partial Class MorososFuturos
    Inherits System.Web.UI.Page
    Private Shared PageSize As Integer = 10

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
   '      CargaAlumnos()  
    End Sub

    Protected Sub Enviar_Click(sender As Object, e As EventArgs) Handles Enviar.Click
        CargaAlumnos()
    End Sub

  Protected Sub CargaAlumnos()
        
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        
        'Dim CodigoProfesor As String = txt_codProf.Text.ToString
        'Dim Paterno As String = txt_paterno.Text.ToString
        'Dim Materno As String = txt_materno.Text.ToString
        'Dim Nombres As String = txt_nombre.Text.ToString
        'Dim CodigoAsignatura As String = txt_nombre.Text.ToString
        'Dim Semestre As String = ddl_semestre.Text.ToString
        'Dim Asignatura As String = ddl_asignatura.SelectedValue.ToString
        'Dim Seccion As String = ddl_seccion.SelectedValue.ToString
        'Dim Lugar As String = ddl_lugar.SelectedValue.ToString
        
        strSql = "SELECT DESCRIPCION,DURACION_INICIO,DURACION_FIN,FACULTAD FROM VCC_PROYECTO_REPORTE"
        
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        connString.Close()
        
        'If (ds.Tables(0).Rows.Count > 0) Then
        '    
        '    For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
        '        
        '        TBL_Alumnos.DataSource = ds
        '        TBL_Alumnos.DataBind()
        '        
        '        
        '    Next

        'End If
    End Sub

    'Protected Sub TBL_Alumnos_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs) Handles TBL_Alumnos.PageIndexChanging
    '    
    '    TBL_Alumnos.PageIndex = e.NewPageIndex()
    '    TBL_Alumnos.DataBind()
    '    CargaAlumnos()
    'End Sub


    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub
End Class
