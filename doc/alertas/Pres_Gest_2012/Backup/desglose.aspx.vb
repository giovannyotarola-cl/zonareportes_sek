Imports System.Web.UI.WebControls.SqlDataSource
Imports System.Data.SqlClient

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim tope_fecha As String = ""

        'Los administradores pueden ver los gastos
        'actualizados, el resto de usuarios solo con la fecha tope definida por ellos
        If ((Session("username") <> "y_feal") And (Session("username") <> "a_lillo")) Then
            tope_fecha = " (Fecha_orden < (SELECT fecha_tope from dbo.SEK_Presupuestos_Parametros)) AND "
        End If

        If Not Page.IsPostBack Then
            If Request.QueryString("mes") <> "" Then
                lista_sedes.DataSourceID = "CheckFill_SedeMes"
                Lista_Areas.DataSourceID = "CheckFill_AreaMes"
                If Session("filtro_area") <> "" Then
                    uchile_conmes.FilterExpression = " AREA IN (" + Session("filtro_area") + ") "
                    If Session("filtro_sede") <> "" Then
                        uchile_conmes.FilterExpression += " AND SEDE IN (" + Session("filtro_sede") + ") "
                    End If
                ElseIf Session("filtro_sede") <> "" Then
                    uchile_conmes.FilterExpression += " SEDE IN (" + Session("filtro_sede") + ") "
                End If
            Else
                lista_sedes.DataSourceID = "CheckFill_Sede"
                Lista_Areas.DataSourceID = "CheckFill_Area"
                If Session("filtro_area") <> "" Then
                    UCHILE_sinMes.FilterExpression = " AREA IN (" + Session("filtro_area") + ") "
                    If Session("filtro_sede") <> "" Then
                        UCHILE_sinMes.FilterExpression += " AND SEDE IN (" + Session("filtro_sede") + ") "
                    End If
                ElseIf Session("filtro_sede") <> "" Then
                    UCHILE_sinMes.FilterExpression += " SEDE IN (" + Session("filtro_sede") + ") "
                End If
            End If
        End If

        'Hay que quitarle las dobles comillas a los listados porque las consultas los generan así
        uchile_conmes.FilterExpression = Replace(uchile_conmes.FilterExpression, "''", "'")
        UCHILE_sinMes.FilterExpression = Replace(UCHILE_sinMes.FilterExpression, "''", "'")

        aplicar_filtros_desglose(sender, e)

        If Request.QueryString("mes") <> "" Then
            globalGrid.DataSourceID = "UCHILE_conMes"
            uchile_conmes.SelectCommand = "select * from dbo.v_sek_desglosegastos where " + tope_fecha + " numerocuenta = @cuenta and month(fecha) = @mes and (AREA IN (" + getPermisos(Session("username"), "area") + ") AND SEDE IN (" + getPermisos(Session("username"), "sede") + "))"
            boton_area.PostBackUrl = "Desglose.aspx?NumeroCuenta=" + Request.QueryString("NumeroCuenta") + "&mes=" + Request.QueryString("mes")
            boton_sede.PostBackUrl = "Desglose.aspx?NumeroCuenta=" + Request.QueryString("NumeroCuenta") + "&mes=" + Request.QueryString("mes")
            CheckFill_AreaMes.SelectCommand = "SELECT DISTINCT dbo.SEK_V_PermisosArea.name_area AS AREA, dbo.V_SEK_DimensionArea.Name FROM dbo.SEK_V_PermisosArea INNER JOIN dbo.V_SEK_DimensionArea ON dbo.SEK_V_PermisosArea.name_area = dbo.V_SEK_DimensionArea.Code WHERE (dbo.SEK_V_PermisosArea.username = '" + Session("username") + "')"
            CheckFill_SedeMes.SelectCommand = "SELECT DISTINCT dbo.SEK_V_PermisosSede.name_sede AS SEDE, dbo.V_SEK_DimensionSede.Name FROM dbo.SEK_V_PermisosSede INNER JOIN dbo.V_SEK_DimensionSede ON dbo.SEK_V_PermisosSede.name_sede = dbo.V_SEK_DimensionSede.Code WHERE (dbo.SEK_V_PermisosSede.username = '" + Session("username") + "')"
        Else
            globalGrid.DataSourceID = "UCHILE_sinMes"
            UCHILE_sinMes.SelectCommand = "SELECT * FROM dbo.V_SEK_DesgloseGastos where " + tope_fecha + " NumeroCuenta = @cuenta and (AREA IN (" + getPermisos(Session("username"), "area") + ") AND SEDE IN (" + getPermisos(Session("username"), "sede") + ")) ORDER BY CAST(Fecha AS datetime) asc"
            boton_area.PostBackUrl = "Desglose.aspx?NumeroCuenta=" + Request.QueryString("NumeroCuenta")
            boton_sede.PostBackUrl = "Desglose.aspx?NumeroCuenta=" + Request.QueryString("NumeroCuenta")
            CheckFill_Area.SelectCommand = "SELECT DISTINCT dbo.SEK_V_PermisosArea.name_area AS AREA, dbo.V_SEK_DimensionArea.Name FROM dbo.SEK_V_PermisosArea INNER JOIN dbo.V_SEK_DimensionArea ON dbo.SEK_V_PermisosArea.name_area = dbo.V_SEK_DimensionArea.Code WHERE (dbo.SEK_V_PermisosArea.username = '" + Session("username") + "')"
            CheckFill_Sede.SelectCommand = "SELECT DISTINCT dbo.SEK_V_PermisosSede.name_sede AS SEDE, dbo.V_SEK_DimensionSede.Name FROM dbo.SEK_V_PermisosSede INNER JOIN dbo.V_SEK_DimensionSede ON dbo.SEK_V_PermisosSede.name_sede = dbo.V_SEK_DimensionSede.Code WHERE (dbo.SEK_V_PermisosSede.username = '" + Session("username") + "')"
        End If

        Try
            globalGrid.DataBind()
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error en : " + ex.ToString)
        End Try

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

    Protected Sub aplicar_filtros_desglose(ByVal sender As Object, ByVal e As System.EventArgs)

        'Flag_null se usa para el primer parentesis de la expresión del filtro
        Dim flag_null As Boolean = False
        'Flag_sede indica si se ha marcado alguna sede, para poder abrir el
        'paréntesis de la expresión correctamente
        Dim flag_sede As Boolean = False
        'Los flag de área son para comprobar si se ha marcado el checkbox de
        'area y evitar problemas con la expresión de filtrado
        Dim flag_area As Boolean = False
        Dim flag_area2 As Boolean = False
        Dim flag_true_area As Boolean = False
        Dim flag_true_sede As Boolean = False

        'Si están todos desmarcados activamos esto
        For Each checkBox_sede In lista_sedes.Items
            If (checkBox_sede.Selected = True) Then
                flag_true_sede = True
            End If
        Next
        If flag_true_sede = False Then
            filtro += " ((SEDE in (null)) "
            flag_sede = True
            flag_null = True
        Else
            For Each checkBox_sede In lista_sedes.Items
                If (checkBox_sede.Selected = True) Then
                    If (Not String.IsNullOrEmpty(filtro)) Then
                        filtro += " OR "
                    End If
                    flag_sede = True
                    If flag_null = False Then
                        filtro += "( "
                        flag_null = True
                    End If
                    filtro += "(SEDE = '" + checkBox_sede.Value + "')"
                End If
            Next
        End If

        For Each checkBox_area In lista_areas.Items
            If (checkBox_area.Selected = True) Then
                flag_true_area = True
            End If
        Next
        If flag_true_area = False Then
            If flag_sede = True Then
                filtro += " ) AND ("
            End If
            filtro += " (AREA in (null)) "
            flag_null = True
        Else
            For Each checkBox_area In lista_areas.Items
                If (checkBox_area.Selected = True) Then
                    If (flag_sede = True And flag_area = False) Then
                        'Solo se pone el and si se ha marcado alguna sede y si 
                        'todavía no se ha marcado ningún filtro de área
                        filtro += " OR (SEDE = '')) AND ( (AREA = '') OR "
                        flag_area = True
                    End If
                    If (Not String.IsNullOrEmpty(filtro) And flag_area2 = True) Then
                        filtro += " OR "
                    End If
                    filtro += "(AREA = '" + checkBox_area.Value + "')"
                    'Se activa este flag para evitar repetir ORs
                    flag_area2 = True
                End If
            Next
        End If

        'Cerramos expresión de filtro si es que se ha aplicado alguno
        If flag_null = True Then
            filtro += " ) "
        End If

        If filtro = "" Then
            filtro = "null"
        End If

        If Request.QueryString("mes") <> "" Then
            uchile_conmes.FilterExpression = filtro
        Else
            UCHILE_sinMes.FilterExpression = filtro
        End If

        'Debug
        'System.Diagnostics.Debug.WriteLine("El filtro es:" + filtro)
    End Sub

    'Cadena para pasar variable del "code behind" a la vista
    Protected cadena As String
    'Al hacer postback no reconoce el filtro vacío si es variable local
    Protected filtro As String

    Protected Sub rellenar(ByVal sender As Object, ByVal e As EventArgs) Handles lista_areas.DataBound, lista_sedes.DataBound
        'Marca los checkbox de la página de acuerdo al filtro de la página anterior.
        Dim array_areas As String()
        Dim array_sedes As String()

        'Se generan arrays con los filtros que se pasan por variable de sesión, 
        'a los que les quitamos las comillas
        array_areas = Split(Replace(Session("filtro_area"), "''", ""), ", ")
        array_sedes = Split(Replace(Session("filtro_sede"), "''", ""), ", ")

        'System.Diagnostics.Debug.WriteLine(array_sedes)

        'Para cada valor de los filtros, se comprueban los checkboxes,
        If Session("filtro_area") <> "" Then
            For Each array_item In array_areas
                For Each check_box In lista_areas.Items
                    If check_box.value = array_item Then
                        check_box.Selected = True
                    End If
                Next
            Next
        Else
            For Each CheckBox In lista_areas.Items
                CheckBox.Selected = True
            Next
        End If

        If Session("filtro_sede") <> "" Then
            For Each array_item In array_sedes
                For Each check_box In lista_sedes.Items
                    If check_box.value = array_item Then
                        check_box.Selected = True
                    End If
                Next
            Next
        Else
            For Each CheckBox In lista_sedes.Items
                CheckBox.Selected = True
            Next
        End If

    End Sub

    Protected Sub marcarTodoSede(ByVal sender As Object, ByVal e As EventArgs) Handles boton_sede.Click

        If boton_sede.Text = "Marcar Todo" Then
            boton_sede.Text = "Desmarcar Todo"
            For Each CheckBox In lista_sedes.Items
                CheckBox.Selected = True
            Next
        Else
            boton_sede.Text = "Marcar Todo"
            For Each CheckBox In lista_sedes.Items
                CheckBox.Selected = False
            Next
        End If

        aplicar_filtros_desglose(sender, e)

    End Sub

    Protected Sub marcarTodoArea(ByVal sender As Object, ByVal e As EventArgs) Handles boton_area.Click

        If boton_area.Text = "Marcar Todo" Then
            boton_area.Text = "Desmarcar Todo"
            For Each CheckBox In Lista_Areas.Items
                CheckBox.Selected = True
            Next
        Else
            boton_area.Text = "Marcar Todo"
            For Each CheckBox In Lista_Areas.Items
                CheckBox.Selected = False
            Next
        End If

        aplicar_filtros_desglose(sender, e)

    End Sub

    Protected Sub boton_cerrar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles boton_cerrar.Click
        Response.Write("<script language='javascript'> { self.close() }</script>")
    End Sub

    Protected Sub desglose_aplicarfiltros_Click(ByVal sender As Object, ByVal e As EventArgs) Handles desglose_aplicarfiltros.Click
        Page_Load(sender, e)
    End Sub
End Class