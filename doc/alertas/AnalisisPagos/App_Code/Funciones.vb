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

    Public Function ListaFacultades() As DataSet

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT CODFAC, DESCRIPCION FROM RA_FACULTAD ORDER BY DESCRIPCION"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_CARRER")

        ListaFacultades = ds
        connString.Close()

    End Function

    Public Function ListaCarreras() As DataSet

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT NOMBRE_C, CODCARR FROM MT_CARRER WHERE (TIPOCARR = 1) AND (JORNADA IS NOT NULL) ORDER BY NOMBRE_C"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_CARRER")

        ListaCarreras = ds
        connString.Close()

    End Function

    Public Function ListaDocumentos() As DataSet

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT TIPODOC, NOMBRE FROM MT_DOCUM ORDER BY NOMBRE"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_DOCUM")

        ListaDocumentos = ds
        connString.Close()

    End Function

    Public Function ListaPagos() As DataSet

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT TIPODOC, NOMBRE FROM MT_DOCPAG ORDER BY NOMBRE"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_DOCPAG")

        ListaPagos = ds
        connString.Close()

    End Function

    Public Function ListaAnios() As DataSet

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        strSQL = "SELECT DISTINCT ANO FROM MT_CTADOC WHERE (ANO > 1000)"
        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds, "MT_CTADOC")

        ListaAnios = ds
        connString.Close()

    End Function

End Class
