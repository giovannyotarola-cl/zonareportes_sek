Imports Microsoft.VisualBasic

Public Class Usuario
    Private userId_ As String
    Private userName_ As String
    Private userDes_ As String
    Private userCarr_ As String

    Public Sub New()
        userId_ = ""
        userName_ = ""
        userDes_ = ""
        userCarr_ = ""
    End Sub
    Public Sub New(ByVal userId As String, ByVal userName As String, ByVal userDes As String, ByVal userCarr As String)
        userId_ = userId
        userName_ = userName
        userDes_ = userDes
        userCarr_ = userCarr
    End Sub

    Public Property userId() As String
        Get
            Return userId_
        End Get
        Set(value As String)
            userId_ = value
        End Set
    End Property

    Public Property userName() As String
        Get
            Return userName_
        End Get
        Set(value As String)
            userName_ = value
        End Set
    End Property

    Public Property userDes() As String
        Get
            Return userDes_
        End Get
        Set(value As String)
            userDes_ = value
        End Set
    End Property

    Public Property userCarr() As String
        Get
            Return userCarr_
        End Get
        Set(value As String)
            userCarr_ = value
        End Set
    End Property
End Class
