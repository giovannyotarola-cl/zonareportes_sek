Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient

Public Class ClassUsuarios

    Private _ID As String
    Private _rut As String
    Private _nombre As String
    Private _apellidos As String
    Private _email As String
    Private _depto As Integer
    Private _lnkedit As String
    Private _lnkdelete As String
    Private _clave As String

    Public Property LinkEdit() As String
        Get
            Return _lnkedit
        End Get
        Set(ByVal value As String)
            _lnkedit = value
        End Set
    End Property

    Public Property LinkDelete() As String
        Get
            Return _lnkdelete
        End Get
        Set(ByVal value As String)
            _lnkdelete = value
        End Set
    End Property

    Public Property ID() As String
        Get
            Return _ID
        End Get
        Set(ByVal value As String)
            _ID = value
        End Set
    End Property

    Public Property Rut() As String
        Get
            Return _rut
        End Get
        Set(ByVal value As String)
            _rut = value
        End Set
    End Property

    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Public Property Apellidos() As String
        Get
            Return _apellidos
        End Get
        Set(ByVal value As String)
            _apellidos = value
        End Set
    End Property

    Public Property Email() As String
        Get
            Return _email
        End Get
        Set(ByVal value As String)
            _email = value
        End Set
    End Property

    Public Property Depto() As Integer
        Get
            Return _depto
        End Get
        Set(ByVal value As Integer)
            _depto = value
        End Set
    End Property

    Public Property Clave() As String
        Get
            Return _clave
        End Get
        Set(ByVal value As String)
            _clave = value
        End Set
    End Property


End Class
