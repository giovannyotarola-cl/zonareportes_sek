Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class Funciones
#Region "FuncionesSistemaGeneral"
    Public Shared Sub GuardarLogAcceso(ByVal ipCliente As String, ByVal ingreso As Boolean, ByVal usuario As String, ByVal contraseña As String)
        Dim comm As SqlCommand
        Dim strSQL As String
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        Dim ip As String =
        ipCliente
        Dim fecha As String = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss")
        Dim strIngreso As String = IIf(ingreso, "1", "0")

        strSQL = "INSERT INTO SEK_GPA_LogAcceso(IP,FECHA,USUARIO,CONTRASEÑA,ACCESO) VALUES(" + _
            "'" + ip + "'," + _
            "'" + fecha + "'," + _
            "'" + usuario + "'," + _
            "'" + contraseña + "'," + _
            "'" + strIngreso + "'" + _
            ")"
        Try
            conn.Open()
            comm = New SqlCommand(strSQL, conn)
            comm.ExecuteNonQuery()
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
    End Sub
    
    Public Shared Function getAllProcesosDisponibles(ByVal idUsuario As String) As List(Of ProcesoAuxiliar)
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim lista As New List(Of ProcesoAuxiliar)
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "SELECT PROCESO, DESCRIPCION,UBICACION FROM SEK_GPA_Procesos INNER JOIN SEK_GPA_PermisosUsuarios ON SEK_GPA_Procesos.id=SEK_GPA_PermisosUsuarios.id_GPA WHERE id_usuario='" + idUsuario + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSQL, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim proceso As New ProcesoAuxiliar()
                    proceso.nombre = ds.Tables(0).Rows(i)("PROCESO").ToString()
                    proceso.descripcion = ds.Tables(0).Rows(i)("DESCRIPCION").ToString()
                    proceso.ubicacion = ds.Tables(0).Rows(i)("UBICACION").ToString()
                    lista.Add(proceso)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return lista
    End Function
    Public Shared Function tieneAccesoProceso(ByVal usuario As String, ByVal proceso As String) As Boolean
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "SELECT * FROM SEK_GPA_PermisosUsuarios INNER JOIN SEK_GPA_Procesos on SEK_GPA_PermisosUsuarios.ID_GPA=SEK_GPA_Procesos.id WHERE SEK_GPA_PermisosUsuarios.id_usuario='" + usuario + "' AND SEK_GPA_Procesos.ubicacion='" + proceso + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSQL, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        Finally
            conn.Close()
        End Try
        Return False
    End Function
    
    Public Shared Sub grabarLogProceso(ByVal ipCliente As String, ByVal idUsuario As String, ByVal proceso As String)
        Dim comm As SqlCommand
        Dim strSQL As String
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        Dim ip As String = ipCliente
        Dim fecha As String = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss")

        strSQL = "INSERT INTO SEK_GPA_LogProcesoAuxiliar(IP,FECHA,ID_USUARIO,PROCESO) VALUES(" + _
            "'" + ip + "'," + _
            "'" + fecha + "'," + _
            "'" + idUsuario + "'," + _
            "'" + proceso + "'" + _
            ")"
        Try
            conn.Open()
            comm = New SqlCommand(strSQL, conn)
            comm.ExecuteNonQuery()
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
    End Sub
    Public Shared Function getAllTipoDocumento() As List(Of ddlElement)
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim lista As New List(Of ddlElement)
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "SELECT TIPODOC,NOMBRE FROM MT_DOCUM ORDER BY NOMBRE"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSQL, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim ddlEle As New ddlElement()
                    ddlEle.id = ds.Tables(0).Rows(i)("TIPODOC").ToString()
                    ddlEle.descripcion = ds.Tables(0).Rows(i)("NOMBRE").ToString()
                    lista.Add(ddlEle)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return lista
    End Function
    Public Shared Function getAllUbicacion() As List(Of ddlElement)
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim lista As New List(Of ddlElement)
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "SELECT CODUBICACION,DESCRIPCION FROM MT_TIPOUBICACION ORDER BY DESCRIPCION"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSQL, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim ddlEle As New ddlElement()
                    ddlEle.id = ds.Tables(0).Rows(i)("CODUBICACION").ToString()
                    ddlEle.descripcion = ds.Tables(0).Rows(i)("DESCRIPCION").ToString()
                    lista.Add(ddlEle)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return lista
    End Function
#End Region
#Region "Administrador"
    Public Shared Function agregarProceso(ByVal nombreProceso As String, ByVal descripcion As String, ByVal ubicacion As String) As Boolean
        Dim comm As SqlCommand
        Dim strSQL As String
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "INSERT INTO SEK_GPA_Procesos(PROCESO,DESCRIPCION,UBICACION) VALUES(" + _
                "'" + nombreProceso + "'," + _
                "'" + descripcion + "'," + _
                "'" + ubicacion + "'" + _
                ")"
        Try
            conn.Open()
            comm = New SqlCommand(strSQL, conn)
            comm.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            Return False
        Finally
            conn.Close()
        End Try
    End Function
    Public Shared Function getAllUsuarios() As List(Of Usuario)
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim lista As New List(Of Usuario)
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "SELECT USERID,USERNAME,USERDES,USERCARR FROM IF_USUARIO_INFORMES"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSQL, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim usuario As New Usuario()
                    usuario.userId = ds.Tables(0).Rows(i)("USERID").ToString()
                    usuario.userName = ds.Tables(0).Rows(i)("USERNAME").ToString()
                    usuario.userDes = ds.Tables(0).Rows(i)("USERDES").ToString()
                    usuario.userCarr = ds.Tables(0).Rows(i)("USERCARR").ToString()
                    lista.Add(usuario)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return lista
    End Function
    Public Shared Function getAllProcesos() As List(Of ddlElement)
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim lista As New List(Of ddlElement)
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "SELECT ID,PROCESO FROM SEK_GPA_Procesos"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSQL, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim proceso As New ddlElement()
                    proceso.id = ds.Tables(0).Rows(i)("ID").ToString()
                    proceso.descripcion = ds.Tables(0).Rows(i)("PROCESO").ToString()
                    lista.Add(proceso)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return lista
    End Function
#End Region
#Region "CambioUbicacionDocumento"
    Public Shared Function CUDbuscarRegistros(ByVal rut As String, ByVal fecVenIni As String, ByVal fecVenFin As String, ByVal tipoDoc As String, ByVal origenDoc As String) As List(Of CUDVista)
        Dim lista As New List(Of CUDVista)
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "SELECT RUT,NOMBRE_COMPLETO,TIPO_DOCUMENTO,NUMERO_DOCUMENTO,FECHA_VENCIMIENTO,AÑO_DEUDA,SEDE,TIPO_CARRERA,UBICACION FROM SEK_V_GPA_CambioUbicacionDocumentoPreVisualizacion WHERE 1=1"
        If (rut <> "") Then
            strSQL = strSQL + " AND CODCLI='" + rut + "'"
        End If
        If (fecVenIni <> "") Then
            strSQL = strSQL + " AND FECHA_VENCIMIENTO>='" + fecVenIni + "'"
        End If
        If (fecVenFin <> "") Then
            strSQL = strSQL + " AND FECHA_VENCIMIENTO<='" + fecVenFin + "'"
        End If
        If (tipoDoc <> "-") Then
            strSQL = strSQL + " AND TIPO_DOCUMENTO='" + tipoDoc + "'"
        End If
        If (origenDoc <> "-") Then
            strSQL = strSQL + " AND UBICACION='" + origenDoc + "'"
        End If
        Try
            conn.Open()
            da = New SqlDataAdapter(strSQL, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim CUDvista As New CUDVista()
                    CUDvista.rut = ds.Tables(0).Rows(i)("RUT").ToString()
                    CUDvista.nombre = ds.Tables(0).Rows(i)("NOMBRE_COMPLETO").ToString()
                    CUDvista.tipoDoc = ds.Tables(0).Rows(i)("TIPO_DOCUMENTO").ToString()
                    CUDvista.numDoc = ds.Tables(0).Rows(i)("NUMERO_DOCUMENTO").ToString()
                    CUDvista.fechaVen = ds.Tables(0).Rows(i)("FECHA_VENCIMIENTO").ToString()
                    CUDvista.añoDeuda = ds.Tables(0).Rows(i)("AÑO_DEUDA").ToString()
                    CUDvista.sede = ds.Tables(0).Rows(i)("SEDE").ToString()
                    CUDvista.tipoCarr = ds.Tables(0).Rows(i)("TIPO_CARRERA").ToString()
                    CUDvista.ubicacion = ds.Tables(0).Rows(i)("UBICACION").ToString()
                    lista.Add(CUDvista)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return lista
    End Function
    Public Shared Function CUDcantidadCambios(ByVal rut As String, ByVal fecVenIni As String, ByVal fecVenFin As String, ByVal tipoDoc As String, ByVal origenDoc As String, ByVal destinoDoc As String) As Integer
        Dim ds As New DataSet
        Dim da As SqlDataAdapter
        Dim strSQL As String
        Dim cantidad As Integer = 0
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "SELECT COUNT(*) as cantidad FROM MT_CTADOC WHERE " + _
                 "CODCLI='" + rut + "' AND " + _
                 "FECVEN >= '" + fecVenIni + "' AND " + _
                 "FECVEN <= '" + fecVenFin + "' AND " + _
                 "CTADOC ='" + tipoDoc + "' AND " + _
                 "UBICACION ='" + origenDoc + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSQL, conn)
            da.Fill(ds)
            cantidad = Integer.Parse(ds.Tables(0).Rows(0)("cantidad").ToString)
            If (cantidad > 0) Then
                If (Not CUDrealizarCambio(rut, fecVenIni, fecVenFin, tipoDoc, origenDoc, destinoDoc)) Then
                    cantidad = 0
                End If
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return cantidad
    End Function
    Public Shared Function CUDrealizarCambio(ByVal rut As String, ByVal fecVenIni As String, ByVal fecVenFin As String, ByVal tipoDoc As String, ByVal origenDoc As String, ByVal destinoDoc As String) As Boolean
        Dim comm As SqlCommand
        Dim strSQL As String
        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSQL = "UPDATE MT_CTADOC SET UBICACION = '" + destinoDoc + "' WHERE " + _
                 "CODCLI='" + rut + "' AND " + _
                 "FECVEN >= '" + fecVenIni + "' AND " + _
                 "FECVEN <= '" + fecVenFin + "' AND " + _
                 "CTADOC ='" + tipoDoc + "' AND " + _
                 "UBICACION ='" + origenDoc + "'"
        Try
            conn.Open()
            comm = New SqlCommand(strSQL, conn)
            comm.ExecuteNonQuery()
            Return True
        Catch ex As Exception
            Return False
        Finally
            conn.Close()
        End Try
    End Function
#End Region
End Class
