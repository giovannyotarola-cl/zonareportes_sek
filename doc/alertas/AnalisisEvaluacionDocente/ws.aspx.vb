Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services
Imports System.Web.Script.Services

Partial Class ws
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Shared Function Observacion(ByVal comentario As String, ByVal profesor As String, ByVal asignatura As String, ByVal anio As String, _
                                       ByVal periodo As String, ByVal seccion As String, ByVal carrera As String) As String

        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = ""
        Dim result As String = ""

        Try
            strSql = "insert into SEK_AnalisisEncuestaDocentesCompromiso values ('" & profesor & "', '" & asignatura & "', '" & anio & "', '" & periodo & "', '" & seccion & "', '" & carrera & "', '" & comentario & "')"

            Dim objCommand As New SqlCommand(strSql, conn)
            conn.Open()
            objCommand.ExecuteNonQuery()

            result = "OK"
        Catch ex As Exception

            result = "Error"
        End Try

        Return result
    End Function

    <WebMethod()> _
    Public Shared Function cargarAsignaturasFiltro(ByVal anio As String, ByVal semestre As String, ByVal asignatura As String) As Dictionary(Of String, String)

        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = "select codsecc from dbo.ra_seccio WHERE (dbo.RA_SECCIO.ANO = '" + anio + "') AND (dbo.RA_SECCIO.PERIODO = '" + semestre + "') AND (dbo.RA_SECCIO.CODRAMO='" + asignatura + "')"

        ' HttpContext.Current.Response.Write(strSql)

        Dim lista As Dictionary(Of String, String) = New Dictionary(Of String, String)

        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            'lista.Add("", "")
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                lista.Add(ds.Tables(0).Rows(i)("codsecc").ToString, ds.Tables(0).Rows(i)("codsecc").ToString)
            Next
        Catch ex As Exception

        Finally
            conn.Close()
        End Try

        Return lista
    End Function

    <WebMethod()> _
    Public Shared Function cargarProfesoresFiltro(ByVal anio As String, ByVal semestre As String, ByVal asignatura As String, seccion As String) As Dictionary(Of String, String)

        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = "SELECT dbo.RA_PROFES.CODPROF, dbo.RA_PROFES.AP_PATER + ' ' + dbo.RA_PROFES.AP_MATER + ' ' + dbo.RA_PROFES.NOMBRES AS NOMBREPROFE FROM dbo.RA_SECCIO INNER JOIN dbo.RA_PROFES ON dbo.RA_SECCIO.CODPROF = dbo.RA_PROFES.CODPROF WHERE (dbo.RA_SECCIO.ANO = '" + anio + "') AND (dbo.RA_SECCIO.PERIODO = '" + semestre + "') AND (dbo.RA_SECCIO.CODRAMO='" + asignatura + "') AND (dbo.RA_SECCIO.CODSECC='" + seccion + "')"

        Dim lista As Dictionary(Of String, String) = New Dictionary(Of String, String)

        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                lista.Add(ds.Tables(0).Rows(i)("CODPROF").ToString, ds.Tables(0).Rows(i)("NOMBREPROFE").ToString)
            Next
        Catch ex As Exception

        Finally
            conn.Close()
        End Try

        Return lista

    End Function
End Class
