Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient

Public Class Funciones

    Public Shared Function HeaderMenu() As List(Of String)

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String
        Dim Lista As New List(Of String)()

        strSQL = "SELECT TABSID FROM dbo.IF_ACCESOS_TABS WHERE (TABSID NOT IN (4,7,10))"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "IF_INFORME_TABS")

            For xs = 0 To ds.Tables(0).Rows.Count
                Lista.Add(TabName(ds.Tables(0).Rows(xs)("TABSID")))
            Next
        Catch ex As Exception
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try
        Return Lista

    End Function

    Public Shared Function TabName(ByVal idTabs As String) As String

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String
        Dim TabsName As String

        strSQL = "SELECT TABSID, TABSNAME FROM dbo.IF_ACCESOS_TABS WHERE (TABSID = '" + idTabs + "')"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "IF_ACCESOS_TABS")

            TabsName = ds.Tables(0).Rows(0)("TABSNAME").ToString + "/" + ds.Tables(0).Rows(0)("TABSID").ToString
        Catch ex As Exception
            TabsName = ""
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try
        Return TabsName

    End Function

    Public Shared Function ListaReportesByTabs(ByVal IdTabs As String) As List(Of String)

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String
        Dim Lista As New List(Of String)()

        strSQL = "SELECT CODLINK FROM dbo.IF_INFORME_TABS WHERE (TABSID = '" + IdTabs + "')"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "IF_INFORME_TABS")

            For xs = 0 To ds.Tables(0).Rows.Count
                Lista.Add(ds.Tables(0).Rows(xs)("CODLINK").ToString)
            Next
        Catch ex As Exception
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try
        Return Lista
    End Function

    Public Shared Function ReportName(ByVal IdReporte As String) As String

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String
        Dim TabsName As String

        strSQL = "SELECT TABSID, TABSNAME FROM dbo.IF_ACCESOS_TABS WHERE (TABSID = '" + IdReporte + "')"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "IF_ACCESOS_TABS")

            TabsName = ds.Tables(0).Rows(0)("TABSNAME").ToString + "/" + ds.Tables(0).Rows(0)("TABSID").ToString
        Catch ex As Exception
            TabsName = ""
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try
        Return TabsName

    End Function

    Public Shared Function checkUser(ByVal rutUsuario As String) As Integer

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String
        Dim rowCount As Integer
        Try
            strSQL = "SELECT * FROM SEK_ZR_USUARIO WHERE (RUT = '" + rutUsuario + "')"
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "SEK_ZR_USUARIO")

            If (ds.Tables(0).Rows.Count > 0) Then
                rowCount = 1
            End If
        Catch ex As Exception
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try
        Return rowCount
    End Function

    Public Shared Function nomDepto(ByVal idDepto As String) As String

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String
        Dim rowDepto As String = ""
        Try
            strSQL = "SELECT NOMBRE FROM SEK_ZR_DEPARTAMENTO WHERE (ID = '" + idDepto + "')"
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "SEK_ZR_DEPARTAMENTO")

            If (ds.Tables(0).Rows.Count > 0) Then
                rowDepto = ds.Tables(0).Rows(0)("NOMBRE")
            End If
        Catch ex As Exception
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try
        Return rowDepto
    End Function
End Class
