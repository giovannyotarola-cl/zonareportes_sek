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

        If IsPostBack = False Then
            '
            Semestres()
            Asignaturas()
            Secciones()
            Lugares()
        End If
    End Sub

    Protected Sub Enviar_Click(sender As Object, e As EventArgs) Handles Enviar.Click
        'Evento Boton Ver Informe
        CargaAlumnos()
    End Sub

    Protected Sub Asignaturas()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT Asignatura FROM SEK_V_LugarAsistencia ORDER BY Asignatura"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "SEK_V_LugarAsistencia")
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            Dim asignatura As String = Trim(ds.Tables(0).Rows(i)("Asignatura").ToString)
            ddl_asignatura.Items.Add(New ListItem(asignatura, asignatura))
        Next
        '
        connString.Close()

    End Sub

    Protected Sub Semestres()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT [Semestre] FROM SEK_V_LugarAsistencia ORDER BY [Semestre] "
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds)
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            Dim semestre As String = ds.Tables(0).Rows(i)("Semestre").ToString
            ddl_semestre.Items.Add(New ListItem(semestre, semestre))
        Next
        '
        connString.Close()

    End Sub

    Protected Sub Secciones()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT [Sección] FROM SEK_V_LugarAsistencia ORDER BY [Sección] "
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds)
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            Dim seccion As String = ds.Tables(0).Rows(i)("Sección").ToString
            ddl_seccion.Items.Add(New ListItem(seccion, seccion))
        Next
        '
        connString.Close()

    End Sub

    Protected Sub Lugares()
        '
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        '
        strSQL = "SELECT DISTINCT Lugar FROM SEK_V_LugarAsistencia ORDER BY Lugar"
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "SEK_V_LugarAsistencia")
        '
        For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
            Dim lugar As String = Trim(ds.Tables(0).Rows(i)("Lugar").ToString)
            ddl_lugar.Items.Add(New ListItem(lugar, lugar))
        Next
        '
        connString.Close()

    End Sub

    Protected Sub CargaAlumnos()
        '
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        '
        Dim CodigoProfesor As String = txt_codProf.Text.ToString
        Dim Paterno As String = txt_paterno.Text.ToString
        Dim Materno As String = txt_materno.Text.ToString
        Dim Nombres As String = txt_nombre.Text.ToString
        Dim CodigoAsignatura As String = txt_nombre.Text.ToString
        Dim Semestre As String = ddl_semestre.Text.ToString
        Dim Asignatura As String = ddl_asignatura.SelectedValue.ToString
        Dim Seccion As String = ddl_seccion.SelectedValue.ToString
        Dim Lugar As String = ddl_lugar.SelectedValue.ToString
        '
        strSql = "SELECT [Código Profesor],[Código Asignatura],[Asignatura],[Fecha Asistencia],[Horario],[Fecha Ingreso]" + _
                ",[Sección],[Semestre],[IP],[Número Asistencia],[Lugar]" + _
                ",[Nombres],[Apellido Paterno],[Apellido Materno] FROM [SEK_V_LugarAsistencia] WHERE ([Código Horario] <> 0 )"
        '
        If (CodigoProfesor <> "") Then
            strSql = strSql + "AND ([Código Profesor] = '" + CodigoProfesor + "') "
        End If
        '
        If (Paterno <> "") Then
            strSql = strSql + "AND ([Apellido Paterno] = '" + Paterno + "') "
        End If
        '
        If (Materno <> "") Then
            strSql = strSql + "AND ([Apellido Materno] = '" + Materno + "') "
        End If
        '
        If (Nombres <> "") Then
            strSql = strSql + "AND ([Nombres] = '" + Nombres + "') "
        End If
        '
        If (CodigoAsignatura <> "") Then
            strSql = strSql + "AND ([Código Asignatura] = '" + Nombres + "') "
        End If
        '
        If (Semestre <> "Todo") Then
            strSql = strSql + "AND ([Semestre] = '" + Semestre + "') "
        End If
        '
        If (Asignatura <> "Todo") Then
            strSql = strSql + "AND ([Asignatura] = '" + Asignatura + "') "
        End If
        '
        If (Seccion <> "Todo") Then
            strSql = strSql + "AND ([Sección] = '" + Seccion + "') "
        End If
        '
        If (Lugar <> "Todo") Then
            strSql = strSql + "AND ([Lugar] = '" + Lugar + "') "
        End If
        '
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        connString.Close()
        '
        If (ds.Tables(0).Rows.Count > 0) Then
            '
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                '
                TBL_Alumnos.DataSource = ds
                TBL_Alumnos.DataBind()
                '
                'TBL_Alumnos.Controls.Add(RowTableInforme)
            Next

        End If
    End Sub

    Protected Sub TBL_Alumnos_PageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs) Handles TBL_Alumnos.PageIndexChanging
        '
        TBL_Alumnos.PageIndex = e.NewPageIndex()
        TBL_Alumnos.DataBind()
        CargaAlumnos()
    End Sub

    Protected Sub ExportToExcel(sender As Object, e As EventArgs)
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            'To Export all pages
            TBL_Alumnos.AllowPaging = False
            CargaAlumnos()

            TBL_Alumnos.HeaderRow.BackColor = Color.White
            For Each cell As TableCell In TBL_Alumnos.HeaderRow.Cells
                cell.BackColor = TBL_Alumnos.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In TBL_Alumnos.Rows
                row.BackColor = Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = TBL_Alumnos.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = TBL_Alumnos.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next

            TBL_Alumnos.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style> .textmode { } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.[End]()
            TBL_Alumnos.AllowPaging = True
            CargaAlumnos()
        End Using
    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub
End Class
