Imports Microsoft.VisualBasic

Public Class LogInicio
    Private fecha As DateTime
    Private ip As String
    Private acceso As String

    Public Sub logInicio()
        Me.fecha = ""
        Me.ip = ""
        Me.acceso = ""
    End Sub
    Public Sub carrera(ByVal fecha As DateTime, ByVal ip As String, ByVal acceso As String)
        Me.fecha = fecha
        Me.ip = ip
        Me.acceso = acceso
    End Sub

    Public Property propFecha() As DateTime
        Get
            Return Me.fecha
        End Get
        Set(ByVal Value As DateTime)
            Me.fecha = Value
        End Set
    End Property

    Public Property propIP() As String
        Get
            Return Me.ip
        End Get
        Set(ByVal Value As String)
            Me.ip = Value
        End Set
    End Property

    Public Property propAcceso() As String
        Get
            Return Me.acceso
        End Get
        Set(ByVal Value As String)
            Me.acceso = Value
        End Set
    End Property
End Class
