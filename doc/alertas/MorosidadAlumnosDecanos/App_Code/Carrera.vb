Imports Microsoft.VisualBasic

Public Class Carrera
    Private codCarr As String
    Private nombreCarr As String

    Public Sub carrera()
        Me.codCarr = ""
        Me.nombreCarr = ""
    End Sub
    Public Sub carrera(ByVal codCarr As String, ByVal nombreCarr As String)
        Me.codCarr = codCarr
        Me.nombreCarr = nombreCarr
    End Sub

    Public Property propCodCarr() As String
        Get
            Return Me.codCarr
        End Get
        Set(ByVal Value As String)
            Me.codCarr = Value
        End Set
    End Property

    Public Property propNombreCarr() As String
        Get
            Return Me.nombreCarr
        End Get
        Set(ByVal Value As String)
            Me.nombreCarr = Value
        End Set
    End Property
End Class
