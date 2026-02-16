Imports System.Data.SqlClient

Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("username") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else

            Dim areas As String
            Dim sedes As String
            Dim tope_fecha As String = ""
            Dim cadena = ""

            If Not Page.IsPostBack Then
                listado_areas.DataSourceID = Global_Area.ID
                listado_sedes.DataSourceID = Global_Sede.ID
            End If

            If Session("username") <> "" Then
                areas = getPermisos(Session("username"), "area")
                sedes = getPermisos(Session("username"), "sede")
            Else
                areas = "null"
                sedes = "null"
            End If
			
			Call Anio()
			
			lblPresupuestos.Text = "Presupuestos "

            Global_Area.SelectCommand = "SELECT DISTINCT dbo.SEK_V_PermisosArea.name_area AS AREA, dbo.V_SEK_DimensionArea.Name FROM dbo.SEK_V_PermisosArea INNER JOIN dbo.V_SEK_DimensionArea ON dbo.SEK_V_PermisosArea.name_area = dbo.V_SEK_DimensionArea.Code INNER JOIN dbo.SEK_Presupuestos_Users on dbo.SEK_V_PermisosArea.user_id=dbo.SEK_Presupuestos_Users.id where (SEK_Presupuestos_Users.username= '" + Session("username") + "')"
            Global_Sede.SelectCommand = "SELECT DISTINCT dbo.SEK_V_PermisosSede.name_sede AS SEDE, dbo.V_SEK_DimensionSede.Name FROM dbo.SEK_V_PermisosSede INNER JOIN dbo.V_SEK_DimensionSede ON dbo.SEK_V_PermisosSede.name_sede = dbo.V_SEK_DimensionSede.Code "

            leer_filtros_checkbox(sender, e)

            'Los administradores pueden ver los gastos
            'actualizados, el resto de usuarios solo con la fecha tope definida por ellos
            If ((Session("username") <> "y_feal") And (Session("username") <> "a_lillo") And (Session("username") <> "a_ormeno")) Or (usar_fecha_tope.Checked) Then
                tope_fecha = " (Fecha_orden <= (SELECT fecha_tope from dbo.SEK_Presupuestos_Parametros)) AND "
                cadena = UCHILE.SelectCommand
                'cadena.Insert(InStr(1, cadena, " WHERE gastos.SEDE") + 5, tope_fecha)
                cadena = cadena.Replace(" WHERE gastos.SEDE", " WHERE (left(NumeroCuenta, 2) <> '64') AND " + tope_fecha + " gastos.SEDE")
                'System.Diagnostics.Debug.WriteLine("La cadena cambia a :" + cadena)
                UCHILE.SelectCommand = cadena
            End If

            Try
                globalGrid.DataBind()
            Catch ex As Exception
                System.Diagnostics.Debug.WriteLine("Error en : " + ex.ToString)
            End Try
            'System.Diagnostics.Debug.WriteLine(UCHILE.SelectCommand)
        End If
    End Sub

    Protected Function getPermisos(ByVal user As String, ByVal tipo As String) As String
        'Hay que pasarle el nombre de usuario y la cadena "area" o "sede"
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String = ""
        Dim connString As SqlConnection

        If tipo = "area" Then
            strSQL = "SELECT dbo.getPermisosArea('" + user + "')"
        ElseIf tipo = "sede" Then
            strSQL = "SELECT dbo.getPermisosSede('" + user + "')"
        End If

        connString = New SqlConnection()
        connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("UCHILEConnectionString").ConnectionString

        da = New SqlClient.SqlDataAdapter(strSQL, connString)
        da.Fill(ds)

        If IsDBNull(ds.Tables(0).Rows(0).Item(0)) Then
            Return "null"
        Else
            Return ds.Tables(0).Rows(0).Item(0)
        End If


    End Function

    Protected Sub leer_filtros_checkbox(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim flag_null_sede As Boolean = True
        Dim flag_null_area As Boolean = True
        Dim filtro_sede As String = ""
        Dim filtro_area As String = ""

        For Each checkBox_sede In listado_sedes.Items
            If (checkBox_sede.Selected = True) Then
                If flag_null_sede = False Then
                    filtro_sede += ", "
                End If
                flag_null_sede = False
                filtro_sede += "''" + checkBox_sede.Value + "''"
            End If
        Next

        For Each checkBox_area In listado_areas.Items
            If (checkBox_area.Selected = True) Then
                If flag_null_area = False Then
                    filtro_area += ", "
                End If
                flag_null_area = False
                filtro_area += "''" + checkBox_area.Value + "''"
            End If
        Next

        If filtro_area = "" Then
            filtro_area = "null"
        End If
        If filtro_sede = "" Then
            filtro_sede = "null"
        End If

        Session("filtro_area") = filtro_area
        Session("filtro_sede") = filtro_sede

        ejecutarQueryGlobal(filtro_area, filtro_sede)

        'Debug
        'System.Diagnostics.Debug.WriteLine("El filtro sede es:" + filtro_sede)
        'System.Diagnostics.Debug.WriteLine("El filtro area es:" + filtro_area)
        'System.Diagnostics.Debug.WriteLine("La consulta es: " + UCHILE.SelectCommand)
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As EventArgs) Handles globalGrid.RowDataBound
        For Each row In globalGrid.Rows

            If CLng(row.Cells(4).controls(0).text) < 0 Then
                row.Cells(4).Forecolor = Drawing.Color.Red
                row.Cells(5).Forecolor = Drawing.Color.Red
            Else
                row.Cells(4).Forecolor = Drawing.Color.Green
                row.Cells(5).Forecolor = Drawing.Color.Green
            End If
        Next
    End Sub

    Protected Sub ejecutarQueryGlobal(ByVal areas As String, ByVal sedes As String)
        Dim sql As String = ""
        Dim conn As SqlConnection = New SqlConnection()
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter

        sql = "select dbo.getDetalleAreaSede2('" + areas + "', '" + sedes + "')"
        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("UCHILEConnectionString").ConnectionString
        da = New SqlClient.SqlDataAdapter(sql, conn)
        da.Fill(ds)

        'System.Diagnostics.Debug.WriteLine("Se ejecuta la query")
        UCHILE.SelectCommand = ds.Tables(0).Rows(0).Item(0)
        'System.Diagnostics.Debug.WriteLine(UCHILE.SelectCommand)
    End Sub

    Protected Sub rellenar(ByVal sender As Object, ByVal e As EventArgs) Handles listado_sedes.DataBound, listado_areas.DataBound
        'Marca todos los checkbox en la carga de la página
        For Each CheckBox In listado_sedes.Items
            CheckBox.Selected = True
        Next
        For Each CheckBox In listado_areas.Items
            CheckBox.Selected = True
        Next
    End Sub

    Protected Sub marcarTodoSede(ByVal sender As Object, ByVal e As EventArgs) Handles boton_sede.Click

        If boton_sede.Text = "Marcar Todo" Then
            boton_sede.Text = "Desmarcar Todo"
            For Each CheckBox In listado_sedes.Items
                CheckBox.Selected = True
            Next
        Else
            boton_sede.Text = "Marcar Todo"
            For Each CheckBox In listado_sedes.Items
                CheckBox.Selected = False
            Next
        End If

        leer_filtros_checkbox(sender, e)

    End Sub

    Protected Sub marcarTodoArea(ByVal sender As Object, ByVal e As EventArgs) Handles boton_area.Click

        If boton_area.Text = "Marcar Todo" Then
            boton_area.Text = "Desmarcar Todo"
            For Each CheckBox In listado_areas.Items
                CheckBox.Selected = True
            Next
        Else
            boton_area.Text = "Marcar Todo"
            For Each CheckBox In listado_areas.Items
                CheckBox.Selected = False
            Next
        End If

        leer_filtros_checkbox(sender, e)

    End Sub

    Protected Sub aplicar_filtros_Click(ByVal sender As Object, ByVal e As EventArgs) Handles aplicar_filtros.Click
        Page_Load(sender, e)
    End Sub
	
    Protected Sub Anio() as String
        Dim sql As String = ""
        Dim conn As SqlConnection = New SqlConnection()
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter

        sql = "SELECT year(fecha_tope) as anio from dbo.SEK_Presupuestos_Parametros"
        conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("UCHILEConnectionString").ConnectionString
        da = New SqlClient.SqlDataAdapter(sql, conn)
        da.Fill(ds)

        'System.Diagnostics.Debug.WriteLine("Se ejecuta la query")
        'UCHILE.SelectCommand = ds.Tables(0).Rows(0).Item(0)
        'System.Diagnostics.Debug.WriteLine(UCHILE.SelectCommand)
		Anio = ds.Tables(0).Rows(0).Item(0)
    End Sub	
	
End Class