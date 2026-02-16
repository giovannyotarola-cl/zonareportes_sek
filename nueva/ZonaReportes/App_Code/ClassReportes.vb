Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient

Public Class ClassReportes

    Private _ID As String
    Private _nombre As String
    Private _descripcion As String
    Private _proyecto As String
    Private _depto As Integer
    Private _lnkedit As String
    Private _lnkdelete As String

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

    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Public Property Proyecto() As String
        Get
            Return _proyecto
        End Get
        Set(ByVal value As String)
            _proyecto = value
        End Set
    End Property

    Public Property Descripcion() As String
        Get
            Return _descripcion
        End Get
        Set(ByVal value As String)
            _descripcion = value
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
End Class
