Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class Funciones

    Public connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)

    Public Function NombreAlumno(ByVal rut As String) As String
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        '
        strSql = "SELECT PATERNO, MATERNO, NOMBRE FROM MT_CLIENT WHERE CODCLI = '" + rut + "'"
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        '
        NombreAlumno = ds.Tables(0).Rows(0)("PATERNO").ToString + " " + ds.Tables(0).Rows(0)("MATERNO").ToString + " " + ds.Tables(0).Rows(0)("NOMBRE").ToString
        connString.Close()
        '
    End Function

    Public Function CodigoCliente(ByVal rut As String) As String
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        '
        strSql = "SELECT CODCLI FROM MT_ALUMNO WHERE RUT = '" + rut + "'"
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        '
        CodigoCliente = ds.Tables(0).Rows(0)("CODCLI").ToString
        connString.Close()
        '
    End Function

    Public Function CarreraAlumno(ByVal rut As String) As String
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        '
        strSql = "SELECT MT_CARRER.NOMBRE_C FROM MT_CARRER INNER JOIN MT_ALUMNO ON MT_CARRER.CODCARR = MT_ALUMNO.CODCARPR WHERE (MT_ALUMNO.CODCLI = '" + CodigoCliente(rut) + "')"
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        '
        CarreraAlumno = ds.Tables(0).Rows(0)("NOMBRE_C").ToString
        connString.Close()
    End Function

    Public Function NumeroAlumnos(ByVal Rut As String, ByVal Carrera As String, ByVal Estado As String) As String
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        '
        strSql = "SELECT COUNT(DISTINCT RUT) AS TOTAL FROM MT_ALUMNO WHERE (RUT <> '') "
        '
        If (Rut <> "") Then
            strSql = strSql + "AND (RUT = '" + Rut + "')"
        End If
        '
        If (Carrera <> "Todo") Then
            strSql = strSql + "AND (CODCARPR = '" + Carrera + "')"
        End If
        '
        If (Estado <> "Todo") Then
            strSql = strSql + "AND (ESTACAD = '" + Estado + "')"
        End If
        '
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        '
        NumeroAlumnos = ds.Tables(0).Rows(0)("TOTAL").ToString
        connString.Close()
    End Function

    Public Function NumeroSituaciones(ByVal Rut As String, ByVal Carrera As String, ByVal Estado As String) As String
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        '
        strSql = "SELECT COUNT(RUT) AS TOTAL FROM MT_ALUMNO WHERE (RUT <> '')"
        '
        If (Rut <> "") Then
            strSql = strSql + "AND (RUT = '" + Rut + "')"
        End If
        '
        If (Carrera <> "Todo") Then
            strSql = strSql + "AND (CODCARPR = '" + Carrera + "')"
        End If
        '
        If (Estado <> "Todo") Then
            strSql = strSql + "AND (ESTACAD = '" + Estado + "')"
        End If
        '
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        '
        NumeroSituaciones = ds.Tables(0).Rows(0)("TOTAL").ToString
        connString.Close()
    End Function

    Public Function NumeroAlumnosPor(ByVal estado As String, ByVal Rut As String, ByVal Carrera As String) As String
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        '
        strSql = "SELECT COUNT(RUT) AS TOTAL FROM MT_ALUMNO WHERE (ESTACAD = '" + estado + "')"
        '
        If (Rut <> "") Then
            strSql = strSql + "AND (RUT = '" + Rut + "')"
        End If
        '
        If (Carrera <> "Todo") Then
            strSql = strSql + "AND (CODCARPR = '" + Carrera + "')"
        End If
        '
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        '
        NumeroAlumnosPor = ds.Tables(0).Rows(0)("TOTAL").ToString
        connString.Close()
    End Function

End Class
