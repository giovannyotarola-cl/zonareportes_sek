Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient

Public Class ClassReporte

    Private _IdReporte As String
    Private _Proyecto As String
    Private _Nombre As String
    Private _Link As String
    Private _Enlace As String
    Private _Descripcion As String
    Private _Extencion As String

    Public Property IdReporte As String
        Get
            Return _IdReporte
        End Get
        Set(value As String)
            _IdReporte = value
        End Set
    End Property

    Public Property Proyecto As String
        Get
            Return _Proyecto
        End Get
        Set(value As String)
            _Proyecto = value
        End Set
    End Property

    Public Property Nombre As String
        Get
            Return _Nombre
        End Get
        Set(value As String)
            _Nombre = value
        End Set
    End Property

    Public Property Link As String
        Get
            Return _Link
        End Get
        Set(value As String)
            _Link = value
        End Set
    End Property

    Public Property Enlace As String
        Get
            Return _Enlace
        End Get
        Set(value As String)
            _Enlace = value
        End Set
    End Property

    Public Property Descripcion As String
        Get
            Return _Descripcion
        End Get
        Set(value As String)
            _Descripcion = value
        End Set
    End Property

    Public Property Extencion As String
        Get
            Return _Extencion
        End Get
        Set(value As String)
            _Extencion = value
        End Set
    End Property


    Public Sub getInfoReporte(ByVal idReporte As String)

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String

        strSQL = "SELECT * FROM dbo.IF_ACCESOS_DESC WHERE (CODLINK = '" + idReporte + "')"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "IF_ACCESOS_DESC")

            idReporte = ds.Tables(0).Rows(0)("CODLINK")
            Nombre = ds.Tables(0).Rows(0)("ENLACE")
            Proyecto = ds.Tables(0).Rows(0)("PROYECTO")
            Link = ds.Tables(0).Rows(0)("LINK")
            Enlace = ds.Tables(0).Rows(0)("ENLACE")
            Descripcion = ds.Tables(0).Rows(0)("LINKDESC")
            Extencion = ds.Tables(0).Rows(0)("EXTENCION")

        Catch ex As Exception
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try

    End Sub
End Class
