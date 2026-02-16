Imports Microsoft.VisualBasic

Public Class InformacionAlumno
    Private rut As String
    Private nombres As String
    Private apellidoP As String
    Private apellidoM As String
    Private codCarr As String
    Private nombreCarr As String
    Private deuda As Integer
    Private añoCorte As Integer
    Private estAcad As String

    Public Sub InformacionAlumno()
        Me.rut = ""
        Me.nombres = ""
        Me.apellidoP = ""
        Me.apellidoM = ""
        Me.codCarr = ""
        Me.nombreCarr = ""
        Me.deuda = 0
        Me.añoCorte = 0
        Me.estAcad = ""
    End Sub

    Public Sub InformacionAlumno(ByVal rut As String, ByVal nombres As String, ByVal apellidoP As String, ByVal apellidoM As String, ByVal codCarr As String, ByVal nombreCarr As String, ByVal deuda As Integer, ByVal añoCorte As Integer, ByVal estAcad As String)
        Me.rut = ""
        Me.nombres = ""
        Me.apellidoP = ""
        Me.apellidoM = ""
        Me.codCarr = ""
        Me.nombreCarr = ""
        Me.deuda = 0
        Me.añoCorte = 0
        Me.estAcad = ""
    End Sub

    Public Property propRut() As String
        Get
            Return Me.rut
        End Get
        Set(ByVal Value As String)
            Me.rut = Value
        End Set
    End Property

    Public Property propNombres() As String
        Get
            Return Me.nombres
        End Get
        Set(ByVal Value As String)
            Me.nombres = Value
        End Set
    End Property

    Public Property propApellidoP() As String
        Get
            Return Me.apellidoP
        End Get
        Set(ByVal Value As String)
            Me.apellidoP = Value
        End Set
    End Property

    Public Property propApellidoM() As String
        Get
            Return Me.apellidoM
        End Get
        Set(ByVal Value As String)
            Me.apellidoM = Value
        End Set
    End Property

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
            Return Me.codCarr
        End Get
        Set(ByVal Value As String)
            Me.codCarr = Value
        End Set
    End Property

    Public Property propDeuda() As Integer
        Get
            Return Me.deuda
        End Get
        Set(ByVal Value As Integer)
            Me.deuda = Value
        End Set
    End Property

    Public Property propAñoCorte() As Integer
        Get
            Return Me.añoCorte
        End Get
        Set(ByVal Value As Integer)
            Me.añoCorte = Value
        End Set
    End Property

    Public Property propEstAcad() As String
        Get
            Return Me.estAcad
        End Get
        Set(ByVal Value As String)
            Me.estAcad = Value
        End Set
    End Property
End Class
