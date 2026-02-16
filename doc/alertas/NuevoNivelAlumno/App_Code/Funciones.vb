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

    Public Function MontoCliente(ByVal rut As String, ByVal tipo As String) As String
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        '
        strSql = "SELECT SUM(MONTO) AS TOTAL FROM MT_WEBPAY WHERE (RUT = '" + rut + "') "
        If (tipo = "A") Then
            '
            strSql = strSql + "AND (LEFT(OC,2) = 'OC') "
        ElseIf (tipo = "C") Then
            '
            strSql = strSql + "AND (LEFT(OC,2) = 'CE') "
        End If
        '
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        '
        MontoCliente = ds.Tables(0).Rows(0)("TOTAL").ToString
        connString.Close()
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

    Public Function NumeroPagosAceptados(ByVal rut As String, ByVal tipo As String, ByVal estado As String, ByVal fechaD As String, ByVal fechaH As String, carrera As String) As Integer
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet

        strSql = "SELECT COUNT(ID) AS TOTAL FROM MT_WEBPAY WHERE (OC <> '') "
        '
        If (rut <> "") Then
            '
            strSql = strSql + "AND (RUT = '" + rut + "') "
        End If
        '
        If (carrera <> "") Then
            '
            strSql = strSql + "AND (CODCARR = '" + carrera.ToString + "') "
        End If
        '
        If (tipo <> "Todo") Then
            '
            strSql = strSql + "AND (LEFT(OC,2) = '" + tipo + "') "
        End If
        '
        If (fechaD <> "" And fechaH <> "") Then
            '
            strSql = strSql + "AND (FECHA BETWEEN '" + fechaD + "' AND '" + fechaH + "') "
        End If
        '
        If (estado <> "Todo") Then
            '
            strSql = strSql + "AND (ESTADOFINAL = '" + estado + "')"
        End If
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        '
        NumeroPagosAceptados = ds.Tables(0).Rows(0)("TOTAL").ToString
        connString.Close()
    End Function
End Class
