Imports Microsoft.VisualBasic
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Data
Imports ClassUsuarios
Imports ClassReportes
Imports ClassDeptos
Imports Funciones

Partial Class MetodosWeb
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Shared Function getUserByid(ByVal IdUser As String) As List(Of ClassUsuarios)

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String

        strSQL = "SELECT * FROM SEK_ZR_USUARIO WHERE (ID ='" + IdUser + "')"

        Dim Usuario As New List(Of ClassUsuarios)()

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "SEK_ZR_USUARIO")

            Usuario.Add(New ClassUsuarios() With { _
                .Rut = ds.Tables(0).Rows(0)("RUT").ToString, _
                .Nombre = ds.Tables(0).Rows(0)("NOMBRES").ToString, _
                .Apellidos = ds.Tables(0).Rows(0)("APELLIDOS").ToString, _
                .Email = ds.Tables(0).Rows(0)("CORREO").ToString, _
                .Depto = ds.Tables(0).Rows(0)("ID_DEPARTAMENTO").ToString, _
                .Clave = ds.Tables(0).Rows(0)("CLAVE").ToString _
            })

        Catch ex As Exception
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try

        Return Usuario
    End Function

    <WebMethod()> _
    Public Shared Function getAllDeptos() As List(Of ClassDeptos)

        Dim constr As String = ConfigurationManager.ConnectionStrings("Connection").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT * FROM SEK_ZR_DEPARTAMENTO")
                cmd.Connection = con
                Dim Deptos As New List(Of ClassDeptos)()
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Deptos.Add(New ClassDeptos() With { _
                            .ID = sdr("ID").ToString(), _
                            .Nombre = sdr("NOMBRE").ToString() _
                        })
                    End While
                End Using
                con.Close()
                Return Deptos
            End Using
        End Using
    End Function

    <WebMethod()> _
    Public Shared Function getAllUsers() As List(Of ClassUsuarios)

        Dim constr As String = ConfigurationManager.ConnectionStrings("Connection").ConnectionString
        Using con As New SqlConnection(constr)
            Try
                Using cmd As New SqlCommand("SELECT * FROM SEK_ZR_USUARIO")
                    cmd.Connection = con
                    Dim Usuarios As New List(Of ClassUsuarios)()
                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()
                            Usuarios.Add(New ClassUsuarios() With { _
                                .ID = sdr("ID").ToString(), _
                                .Rut = sdr("RUT").ToString(), _
                                .Nombre = sdr("NOMBRES").ToString(), _
                                .Apellidos = sdr("APELLIDOS").ToString(), _
                                .Email = sdr("CORREO").ToString(), _
                                .Depto = sdr("ID_DEPARTAMENTO").ToString(), _
                                .LinkEdit = "<button id=" + sdr("ID").ToString() + " class='btn btn-info btn-edit btn-sm'> Editar </button>", _
                                .LinkDelete = "<button id=" + sdr("ID").ToString() + " class='btn btn-danger btn-delete btn-sm'> Editar </button>" _
                            })
                        End While
                    End Using
                    con.Close()
                    Return Usuarios
                End Using
            Catch ex As Exception
            End Try
        End Using
    End Function

    <WebMethod()> _
    Public Shared Function updateUser(ByVal rutUsuario As String, ByVal nombreusuario As String, ByVal apellidousuario As String, _
                                      ByVal claveusuario As String, ByVal emailusuario As String, ByVal deptousuario As String) As String

        If (Funciones.checkUser(rutUsuario) = 0) Then
            Return "Usuario no Existe"
        Else
            Dim constr As String = ConfigurationManager.ConnectionStrings("Connection").ConnectionString
            Dim strSql As String
            Using con As New SqlConnection(constr)
                Try
                    strSql = "UPDATE SEK_ZR_USUARIO SET NOMBRES = '" + nombreusuario + "', APELLIDOS = '" + apellidousuario + "'"

                    If (claveusuario <> "") Then
                        strSql += ", CLAVE = '" + claveusuario + "' "
                    End If

                    strSql += ", CORREO = '" + emailusuario + "', ID_DEPARTAMENTO = '" + deptousuario + "' WHERE (RUT = '" + rutUsuario + "')"

                    Using cmd As New SqlCommand(strSql)
                        cmd.Connection = con
                        Dim Deptos As New List(Of ClassDeptos)()
                        con.Open()
                        Using sdr As SqlDataReader = cmd.ExecuteReader()
                        End Using
                        con.Close()
                        Return "success"
                    End Using
                Catch ex As Exception
                    Return ex.Message
                End Try
            End Using

        End If
        
    End Function

    <WebMethod()> _
    Public Shared Function insertUser(ByVal rutUsuario As String, ByVal nombreusuario As String, ByVal apellidousuario As String, _
                                      ByVal claveusuario As String, ByVal emailusuario As String, ByVal deptousuario As String) As String

        Dim constr As String = ConfigurationManager.ConnectionStrings("Connection").ConnectionString
        Dim strSql As String
        Using con As New SqlConnection(constr)
            Try
                strSql = "INSERT INTO SEK_ZR_USUARIO VALUES('" + rutUsuario + "', '" + nombreusuario + "', '" + apellidousuario + "', '" + claveusuario + "', '" + emailusuario + "', '" + deptousuario + "')"
                Using cmd As New SqlCommand(strSql)
                    cmd.Connection = con
                    Dim Deptos As New List(Of ClassDeptos)()
                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                    End Using
                    con.Close()
                    Return "success"
                End Using
            Catch ex As Exception
                Return ex.Message
            End Try
        End Using
    End Function

    <WebMethod()> _
    Public Shared Function deleteUser(ByVal idusuario As String) As String

        Dim constr As String = ConfigurationManager.ConnectionStrings("Connection").ConnectionString
        Dim strSql As String
        Using con As New SqlConnection(constr)
            Try
                strSql = "DELETE FROM SEK_ZR_USUARIO WHERE (ID = '" + idusuario + "')"
                Using cmd As New SqlCommand(strSql)
                    cmd.Connection = con
                    Dim Deptos As New List(Of ClassDeptos)()
                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                    End Using
                    con.Close()
                    Return "success"
                End Using
            Catch ex As Exception
                Return ex.Message
            End Try
        End Using
    End Function

    <WebMethod()> _
    Public Shared Function getReportById(ByVal IdReporte As String) As List(Of ClassReportes)

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String

        strSQL = "SELECT * FROM SEK_ZR_REPORTE WHERE (ID ='" + IdReporte + "')"

        Dim Reporte As New List(Of ClassReportes)()

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "SEK_ZR_REPORTE")

            Reporte.Add(New ClassReportes() With { _
                .ID = ds.Tables(0).Rows(0)("ID").ToString, _
                .Nombre = ds.Tables(0).Rows(0)("NOMBRE").ToString, _
                .Descripcion = ds.Tables(0).Rows(0)("DESCRIPCION").ToString, _
                .Proyecto = ds.Tables(0).Rows(0)("PROYECTO").ToString, _
                .Depto = ds.Tables(0).Rows(0)("ID_DEPARTAMENTO").ToString _
            })

        Catch ex As Exception
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try

        Return Reporte
    End Function
End Class
