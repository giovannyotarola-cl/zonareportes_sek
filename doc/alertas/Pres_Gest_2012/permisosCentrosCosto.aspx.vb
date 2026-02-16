Imports System.Data.SqlClient

Public Class permisosCentrosCosto
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("username") = "" Then
            Response.Redirect("Account/Login.aspx")
        End If
    End Sub

    Protected Sub Rellenar_CheckBox(ByVal sender As Object, ByVal e As EventArgs) Handles listado_centrosCosto.DataBound
        Dim sql_busqueda As String = ""
        Dim cad_conexion As String = ConfigurationManager.ConnectionStrings("UCHILEConnectionString").ConnectionString

        Dim conn As SqlConnection = New SqlConnection()
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter

        Try
            conn.ConnectionString = cad_conexion
            conn.Open()
            sql_busqueda = "SELECT name_area FROM dbo.SEK_Presupuestos_PermisosArea WHERE user_id = " + Request.QueryString("usuario").ToString + ";"
            'System.Diagnostics.Debug.WriteLine(sql_busqueda)
            da = New SqlDataAdapter(sql_busqueda, conn)
            da.Fill(ds)

            For Each Row As DataRow In ds.Tables(0).Rows
                For Each item In listado_centrosCosto.Items
                    'System.Diagnostics.Debug.WriteLine("Entra aqui")
                    'System.Diagnostics.Debug.WriteLine(item.Value)
                    If item.Value = Row.Item(0) Then
                        item.Selected = True
                    End If
                Next
            Next
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error al rellenar checkbox: " + ex.ToString)
			response.write(sql_busqueda)
        Finally
            da.Dispose()
            ds.Dispose()
            conn.Close()
        End Try

    End Sub

    Protected Sub boton_permisos_Click(ByVal sender As Object, ByVal e As EventArgs) Handles boton_permisos.Click
        Dim sql_busqueda As String = ""
        Dim sql_insert As String = ""
        Dim sql_delete As String = ""
        Dim cad_conexion As String = ConfigurationManager.ConnectionStrings("UCHILEConnectionString").ConnectionString

        Dim conn As SqlConnection = New SqlConnection()
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter
        Dim cmd As SqlCommand = New SqlCommand

        Dim filas_cambiadas As Integer = 0


        'Abrir conexión para modificaciones
        Try
            conn.ConnectionString = cad_conexion
            conn.Open()
            cmd.Connection = conn
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error es: " + ex.ToString)
        End Try

        For Each check_box In listado_centrosCosto.Items

            sql_busqueda = "SELECT distinct username FROM dbo.SEK_Presupuestos_PermisosArea WHERE user_id = " + Request.QueryString("usuario").ToString + " and name_area = '" + check_box.Value + "';"
            'System.Diagnostics.Debug.WriteLine(sql_busqueda)
            da = New SqlDataAdapter(sql_busqueda, conn)
            da.Fill(ds)

            If check_box.selected = True Then
                If ds.Tables(0).Rows.Count = 0 Then
                    sql_insert = "INSERT INTO dbo.SEK_Presupuestos_PermisosArea VALUES ('" + Session("username") + "', '" + check_box.value + "', " + Request.QueryString("usuario").ToString + ");"                
                    cmd.CommandText = sql_insert
                    filas_cambiadas = cmd.ExecuteNonQuery()
                    If filas_cambiadas = 1 Then
                        System.Diagnostics.Debug.WriteLine("Insercion permisos Ok")
                    Else
                        System.Diagnostics.Debug.WriteLine("Error insertar permisos")
                    End If
                End If
            Else
                If ds.Tables(0).Rows.Count > 0 Then
                    sql_delete = "DELETE FROM dbo.SEK_Presupuestos_PermisosArea WHERE (user_id = " + Request.QueryString("usuario").ToString + " AND name_area = '" + check_box.value + "');"
                    cmd.CommandText = sql_delete
                    filas_cambiadas = cmd.ExecuteNonQuery
                    If filas_cambiadas = 1 Then
                        System.Diagnostics.Debug.WriteLine("Borrado linea Ok")
                    Else
                        System.Diagnostics.Debug.WriteLine("Error borrado linea")
                    End If
                End If
            End If

            'Limpiamos elementos antes de la siguiente vuelta del bucle
            sql_delete = ""
            sql_insert = ""
            da.Dispose()
            ds.Clear()
            ds.Dispose()
        Next

        conn.Close()

    End Sub

End Class