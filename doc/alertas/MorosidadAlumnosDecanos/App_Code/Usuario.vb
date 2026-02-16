Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class Usuario
    Private username As String
    Private password As String
    Private rut As String
    Private nombre As String
    Private nivel As Integer
    Private facultad As String

    Public Sub usuario()
        Me.username = ""
        Me.password = ""
        Me.nombre = ""
        Me.nivel = 0
        Me.facultad = ""
    End Sub
    Public Sub usuario(ByVal username As String, ByVal password As String, ByVal rut As String, ByVal nombre As String, ByVal nivel As Integer, ByVal facultad As String)
        Me.username = username
        Me.password = password
        Me.rut = rut
        Me.nombre = nombre
        Me.nivel = nivel
        Me.facultad = facultad
    End Sub

    Public Property propUsername() As String
        Get
            Return Me.username
        End Get
        Set(ByVal Value As String)
            Me.username = Value
        End Set
    End Property

    Public Property propPassword() As String
        Get
            Return Me.password
        End Get
        Set(ByVal Value As String)
            Me.password = Value
        End Set
    End Property

    Public Property propNombre() As String
        Get
            Return Me.nombre
        End Get
        Set(ByVal Value As String)
            Me.nombre = Value
        End Set
    End Property

    Public Property propRut() As String
        Get
            Return Me.rut
        End Get
        Set(ByVal Value As String)
            Me.rut = Value
        End Set
    End Property

    Public Property propNivel() As Integer
        Get
            Return Me.nivel
        End Get
        Set(ByVal Value As Integer)
            Me.nivel = Value
        End Set
    End Property

    Public Property propFacultad() As String
        Get
            Return Me.facultad
        End Get
        Set(ByVal Value As String)
            Me.facultad = Value
        End Set
    End Property

    Public Function buscarUsuario(ByVal username As String, ByVal password As String) As Boolean
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim connString As SqlConnection = New SqlConnection()
        connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString

        strSQL = "SELECT USUARIO,RUT,NOMBRE,NIVEL,FACULTAD FROM SEK_MorosidadAlumnosDecanos_usuarios WHERE USUARIO='" + username + "' AND CONTRASENA='" + password + "'"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            If ds.Tables(0).Rows.Count = 0 Then
                Return False
            Else
                Me.username = ds.Tables(0).Rows(0)("USUARIO").ToString
                Me.nombre = ds.Tables(0).Rows(0)("NOMBRE").ToString
                Me.rut = ds.Tables(0).Rows(0)("RUT").ToString
                Me.nivel = ds.Tables(0).Rows(0)("NIVEL").ToString
                Me.facultad = ds.Tables(0).Rows(0)("FACULTAD").ToString
                Return True
            End If
        Catch ex As Exception
            Return False
        Finally
            connString.Close()
        End Try
    End Function

    Public Function existeUsuario(ByVal username As String) As Boolean
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim salida As Boolean
        Dim connString As SqlConnection = New SqlConnection()
        connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString

        strSQL = "SELECT USUARIO FROM SEK_MorosidadAlumnosDecanos_usuarios WHERE USUARIO='" + username + "'"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)

            If ds.Tables(0).Rows.Count > 0 Then
                salida = True
            Else
                salida = False
            End If
        Catch ex As Exception
            salida = False
        Finally
            connString.Close()
        End Try
        Return salida
    End Function

    Public Function buscarUsuarioID(ByVal idUsuario As Integer) As Boolean
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim salida As Boolean
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        strSql = "SELECT * FROM SEK_MorosidadAlumnosDecanos_usuarios where id ='" + idUsuario.ToString + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            If (ds.Tables(0).Rows.Count > 0) Then
                Me.username = ds.Tables(0).Rows(0)("usuario").ToString()
                Me.password = ds.Tables(0).Rows(0)("contrasena").ToString()
                Me.rut = ds.Tables(0).Rows(0)("rut").ToString()
                Me.nombre = ds.Tables(0).Rows(0)("nombre").ToString()
                Me.nivel = ds.Tables(0).Rows(0)("nivel").ToString()
                Me.facultad = ds.Tables(0).Rows(0)("facultad").ToString()
                salida = True
            Else
                salida = False
            End If
        Catch ex As Exception
            salida = False
        Finally
            conn.Close()
        End Try
        Return salida
    End Function
End Class
