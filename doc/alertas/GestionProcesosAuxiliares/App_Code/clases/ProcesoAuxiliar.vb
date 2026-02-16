Imports Microsoft.VisualBasic

Public Class ProcesoAuxiliar
    Private id_ As String
    Private nombre_ As String
    Private descripcion_ As String
    Private ubicacion_ As String

    Public Sub New()
        id_ = ""
        nombre_ = ""
        descripcion_ = ""
        ubicacion_ = ""
    End Sub

    Public Sub New(ByVal id As String, ByVal nombre As String, ByVal descripcion As String, ByVal ubicacion As String)
        id_ = id
        nombre_ = nombre
        descripcion_ = descripcion
        ubicacion_ = ubicacion
    End Sub

    Public Property id() As String
        Get
            Return id_
        End Get
        Set(value As String)
            id_ = value
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
    Public Property descripcion() As String
        Get
            Return descripcion_
        End Get
        Set(value As String)
            descripcion_ = value
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
