Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class Funciones
    Public Shared Function getNombreCarrera(ByVal carrera As String) As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        'Dim sqlStr As String = "SELECT NOMBRE_C FROM dbo.MT_CARRER WHERE CODCARR='" + carrera + "'" ---> Se comentó por el nombre de la carrera.
        Dim sqlStr As String = "SELECT NOMBRE_L FROM dbo.MT_CARRER WHERE CODCARR='" + carrera + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(sqlStr, conn)
            da.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                getNombreCarrera = ds.Tables(0).Rows(0)("NOMBRE_C")
            Else
                Return ""
            End If
        Catch ex As Exception
            Return ""
        Finally
            conn.Close()
        End Try
    End Function

    Public Shared Function getNombreAsignatura(ByVal asignatura As String) As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim sqlStr As String = "SELECT NOMBRE FROM dbo.RA_RAMO WHERE CODRAMO='" + asignatura + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(sqlStr, conn)
            da.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                getNombreAsignatura = ds.Tables(0).Rows(0)("NOMBRE")
            Else
                Return ""
            End If
        Catch ex As Exception
            Return ""
        Finally
            conn.Close()
        End Try
    End Function

    Public Shared Function getNombreProfesor(ByVal codProf As String) As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim sqlStr As String = "SELECT (NOMBRES + ' ' + AP_PATER + ' ' + AP_MATER) AS NOMBRECOMPLETO  FROM dbo.RA_PROFES WHERE RUT='" + codProf + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(sqlStr, conn)
            da.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                getNombreProfesor = ds.Tables(0).Rows(0)("NOMBRECOMPLETO")
            Else
                Return ""
            End If
        Catch ex As Exception
            Return ""
        Finally
            conn.Close()
        End Try
    End Function

End Class
