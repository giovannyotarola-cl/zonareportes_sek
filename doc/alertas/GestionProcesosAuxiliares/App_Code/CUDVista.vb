Imports Microsoft.VisualBasic

Public Class CUDVista
    Private rut_ As String
    Private nombre_ As String
    Private tipoDoc_ As String
    Private numDoc_ As String
    Private fechaVen_ As String
    Private añoDeuda_ As String
    Private sede_ As String
    Private tipoCarr_ As String
    Private ubicacion_ As String

    Public Sub New()
        rut_ = ""
        nombre_ = ""
        tipoDoc_ = ""
        numDoc_ = ""
        fechaVen_ = ""
        añoDeuda_ = ""
        sede_ = ""
        tipoCarr_ = ""
        ubicacion_ = ""
    End Sub

    Public Property rut() As String
        Get
            Return rut_
        End Get
        Set(value As String)
            rut_ = value
        End Set
    End Property
    Public Property nombre() As String
        Get
            Return nombre_
        End Get
        Set(value As String)
            nombre_ = value
        End Set
    End Property
    Public Property tipoDoc() As String
        Get
            Return tipoDoc_
        End Get
        Set(value As String)
            tipoDoc_ = value
        End Set
    End Property
    Public Property numDoc() As String
        Get
            Return numDoc_
        End Get
        Set(value As String)
            numDoc_ = value
        End Set
    End Property
    Public Property fechaVen() As String
        Get
            Return fechaVen_
        End Get
        Set(value As String)
            fechaVen_ = value
        End Set
    End Property
    Public Property añoDeuda() As String
        Get
            Return añoDeuda_
        End Get
        Set(value As String)
            añoDeuda_ = value
        End Set
    End Property
    Public Property sede() As String
        Get
            Return sede_
        End Get
        Set(value As String)
            sede_ = value
        End Set
    End Property
    Public Property tipoCarr() As String
        Get
            Return tipoCarr_
        End Get
        Set(value As String)
            tipoCarr_ = value
        End Set
    End Property
    Public Property ubicacion() As String
        Get
            Return ubicacion_
        End Get
        Set(value As String)
            ubicacion_ = value
        End Set
    End Property
End Class
