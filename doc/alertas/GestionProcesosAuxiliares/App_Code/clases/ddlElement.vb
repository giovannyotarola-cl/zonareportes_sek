Imports Microsoft.VisualBasic

Public Class ddlElement
    Private id_ As String
    Private descripcion_ As String

    Public Sub New()
        Me.id_ = ""
        Me.descripcion_ = ""
    End Sub
    Public Property id() As String
        Get
            Return id_
        End Get
        Set(value As String)
            id_ = value
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
End Class
