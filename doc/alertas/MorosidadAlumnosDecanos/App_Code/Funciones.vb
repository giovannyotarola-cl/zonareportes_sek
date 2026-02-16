Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class Funciones
    Public Shared Function agregarUsuario(ByVal usuario As Usuario) As Boolean
        Dim strSql As String
        Dim comm As SqlCommand
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim salida As Boolean

        Dim username As String = usuario.propUsername
        Dim contrasena As String = usuario.propPassword
        Dim nombre As String = usuario.propNombre
        Dim nivel As String = usuario.propNivel.ToString
        Dim facultad As String = usuario.propFacultad

        strSql = "INSERT INTO SEK_MorosidadAlumnosDecanos_usuarios(USUARIO,CONTRASENA,NOMBRE,NIVEL,FACULTAD) VALUES('" + _
            username + "','" + _
            contrasena + "','" + _
            nombre + "','" + _
            nivel + "','" + _
            facultad + "')"
        Try
            conn.Open()
            comm = New SqlCommand(strSql, conn)
            comm.ExecuteNonQuery()
            salida = True
        Catch ex As Exception
            salida = False
        Finally
            conn.Close()
        End Try
        Return salida
    End Function

    Public Shared Function actualizarUsuario(ByVal usuario As Usuario, ByVal id As String) As Boolean
        Dim strSql As String
        Dim comm As SqlCommand
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        Dim salida As Boolean

        Dim username As String = usuario.propUsername
        Dim contrasena As String = usuario.propPassword
        Dim rut As String = usuario.propRut
        Dim nombre As String = usuario.propNombre
        Dim nivel As String = usuario.propNivel
        Dim facultad As String = usuario.propFacultad

        strSql = "UPDATE SEK_MorosidadAlumnosDecanos_usuarios SET " + _
            "USUARIO='" + username + "'," + _
            "CONTRASENA='" + contrasena + "'," + _
            "RUT='" + rut + "'," + _
            "NOMBRE='" + nombre + "'," + _
            "NIVEL='" + nivel.ToString + "'," + _
            "FACULTAD='" + facultad + "' WHERE ID='" + id + "'"
        Try
            conn.Open()
            comm = New SqlCommand(strSql, conn)
            comm.ExecuteNonQuery()
            salida = True
        Catch ex As Exception
            salida = False
        Finally
            conn.Close()
        End Try
        Return salida
    End Function

    Public Shared Function buscarInformeAlumnos(ByVal informacionAlumno As InformacionAlumno, ByVal tipo As String) As List(Of InformacionAlumno)
        Dim listaAlumnos As New List(Of InformacionAlumno)

        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        If (tipo = "todos") Then
            strSql = "SELECT DISTINCT CODCLI, NOMBRE,PATERNO,MATERNO,INGRESO,CODCARR,NOMBRE_C,[Deuda Total],ESTACAD FROM SEK_V_MorosidadAlumnos_Decanos WHERE 1=1 "
        Else
            If (Len(tipo) > 5) Then
                strSql = "SELECT DISTINCT CODCLI, NOMBRE,PATERNO,MATERNO,INGRESO,CODCARR,NOMBRE_C,[Deuda Total],ESTACAD FROM SEK_V_MorosidadAlumnos_Decanos where CODPROF ='" + tipo + "'"
            Else
				IF(tipo="HED" or tipo="EPC") Then
					strSql = "SELECT DISTINCT CODCLI, NOMBRE,PATERNO,MATERNO,INGRESO,CODCARR,NOMBRE_C,[Deuda Total],ESTACAD FROM SEK_V_MorosidadAlumnos_Decanos where CODFAC IN('HED','EPC')"
				Else
					strSql = "SELECT DISTINCT CODCLI, NOMBRE,PATERNO,MATERNO,INGRESO,CODCARR,NOMBRE_C,[Deuda Total],ESTACAD FROM SEK_V_MorosidadAlumnos_Decanos where CODFAC ='" + tipo + "'"
				End If
            End If
        End If
        If (informacionAlumno.propCodCarr <> "") Then
            strSql += " AND CODCARR LIKE '%" + informacionAlumno.propCodCarr + "%'"
        End If
        If (informacionAlumno.propAñoCorte <> 0) Then
            strSql += " AND INGRESO LIKE '%" + informacionAlumno.propAñoCorte.ToString + "%'"
        End If

        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim alumno As New InformacionAlumno()

                    alumno.propRut = ds.Tables(0).Rows(i)("CODCLI").ToString()
                    alumno.propNombres = ds.Tables(0).Rows(i)("NOMBRE").ToString()
                    alumno.propApellidoP = ds.Tables(0).Rows(i)("PATERNO").ToString()
                    alumno.propApellidoM = ds.Tables(0).Rows(i)("MATERNO").ToString()
                    alumno.propCodCarr = ds.Tables(0).Rows(i)("CODCARR").ToString()
                    alumno.propAñoCorte = ds.Tables(0).Rows(i)("INGRESO").ToString()
                    alumno.propNombreCarr = ds.Tables(0).Rows(i)("NOMBRE_C").ToString()
                    alumno.propDeuda = ds.Tables(0).Rows(i)("Deuda Total").ToString()
                    alumno.propEstAcad = ds.Tables(0).Rows(i)("ESTACAD").ToString()

                    listaAlumnos.Add(alumno)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try

        Return listaAlumnos
    End Function

    Public Shared Function buscarCarrerasRut(ByVal rutProfe As String) As List(Of Carrera)
        Dim listadoCarreras As New List(Of Carrera)
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSql = "SELECT DISTINCT CODCARR, (NOMBRE_C + '-'+ ISNULL(JORNADA,'')) as NOMBRE_C FROM SEK_V_MorosidadAlumnos_Decanos where CODPROF ='" + rutProfe + "' and LTRIM(NOMBRE_C) <>'' ORDER BY NOMBRE_C"

        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim carrera As New Carrera()

                    carrera.propCodCarr = ds.Tables(0).Rows(i)("CODCARR").ToString()
                    carrera.propNombreCarr = ds.Tables(0).Rows(i)("NOMBRE_C").ToString()

                    listadoCarreras.Add(carrera)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return listadoCarreras
    End Function

    Public Shared Function buscarCarrerasFacultad(ByVal codFac As String) As List(Of Carrera)
        Dim listadoCarreras As New List(Of Carrera)
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        If (codFac = "HED") Then
            strSql = "SELECT DISTINCT CODCARR,(NOMBRE_C + '-'+ ISNULL(JORNADA,'')) as NOMBRE_C FROM SEK_V_MorosidadAlumnos_Decanos where CODFAC IN ('EPC','HED') and LTRIM(NOMBRE_C) <>'' ORDER BY NOMBRE_C"
        Else
            strSql = "SELECT DISTINCT CODCARR,(NOMBRE_C + '-'+ ISNULL(JORNADA,'')) as NOMBRE_C FROM SEK_V_MorosidadAlumnos_Decanos where CODFAC ='" + codFac + "' and LTRIM(NOMBRE_C) <>'' ORDER BY NOMBRE_C"
        End If

        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1

                    Dim carrera As New Carrera()

                    carrera.propCodCarr = ds.Tables(0).Rows(i)("CODCARR").ToString()
                    carrera.propNombreCarr = ds.Tables(0).Rows(i)("NOMBRE_C").ToString()

                    listadoCarreras.Add(carrera)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return listadoCarreras
    End Function

    Public Shared Function buscarTodasCarreras() As List(Of Carrera)
        Dim listadoCarreras As New List(Of Carrera)
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)

        strSql = "SELECT DISTINCT CODCARR,(NOMBRE_C + '-'+ ISNULL(JORNADA,'')) as NOMBRE_C FROM SEK_V_MorosidadAlumnos_Decanos WHERE LTRIM(NOMBRE_C) <>'' ORDER BY NOMBRE_C"

        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            If (ds.Tables(0).Rows.Count > 0) Then
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1

                    Dim carrera As New Carrera()

                    carrera.propCodCarr = ds.Tables(0).Rows(i)("CODCARR").ToString()
                    carrera.propNombreCarr = ds.Tables(0).Rows(i)("NOMBRE_C").ToString()

                    listadoCarreras.Add(carrera)
                Next
            End If
        Catch ex As Exception
        Finally
            conn.Close()
        End Try
        Return listadoCarreras
    End Function
End Class
