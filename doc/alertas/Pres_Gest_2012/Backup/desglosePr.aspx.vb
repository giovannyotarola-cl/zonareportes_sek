Imports System.Web.UI.WebControls.SqlDataSource
Imports System.Data.SqlClient

Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            If Request.QueryString("mes") <> "" Then
                Lista_Areas.DataSourceID = "CheckFill_AreaMes"
            Else
                Lista_Areas.DataSourceID = "CheckFill_Area"
            End If
        End If

        If Request.QueryString("mes") <> "" Then
            globalGrid.DataSourceID = "UCHILE_conMes"
            uchile_conmes.SelectCommand = "select * from dbo.v_sek_Presupuestos where Cuenta = @cuenta and month(fecha) = @mes and AREA IN ('', " + getPermisos(Session("username"), "area") + ") "
            CheckFill_AreaMes.SelectCommand = "SELECT DISTINCT dbo.SEK_V_PermisosArea.name_area AS AREA, dbo.V_SEK_DimensionArea.Name FROM dbo.SEK_V_PermisosArea INNER JOIN dbo.V_SEK_DimensionArea ON dbo.SEK_V_PermisosArea.name_area = dbo.V_SEK_DimensionArea.Code WHERE (dbo.SEK_V_PermisosArea.username = '" + Session("username") + "')"
            If Session("filtro_area") <> "" Then
                uchile_conmes.FilterExpression += " SEDE IN (" + Session("filtro_sede") + ") "
            End If
        Else
            globalGrid.DataSourceID = "UCHILE_sinMes"
            UCHILE_sinMes.SelectCommand = "select * from dbo.v_sek_Presupuestos where Cuenta = @cuenta and AREA IN ('', " + getPermisos(Session("username"), "area") + ") "
            CheckFill_Area.SelectCommand = "SELECT DISTINCT dbo.SEK_V_PermisosArea.name_area AS AREA, dbo.V_SEK_DimensionArea.Name FROM dbo.SEK_V_PermisosArea INNER JOIN dbo.V_SEK_DimensionArea ON dbo.SEK_V_PermisosArea.name_area = dbo.V_SEK_DimensionArea.Code WHERE (dbo.SEK_V_PermisosArea.username = '" + Session("username") + "')"
            If Session("filtro_area") <> "" Then
                'System.Diagnostics.Debug.WriteLine(Replace(Session("filtro_area"), "''", "'"))
                UCHILE_sinMes.FilterExpression += " AREA IN (" + Replace(Session("filtro_area"), "''", "'") + ") "
            End If
        End If

        'System.Diagnostics.Debug.WriteLine(UCHILE_sinMes.SelectCommand)

        CheckBoxList_SelectedIndexChanged(sender, e)

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

    Protected Sub CheckBoxList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        'Flag_null se usa para el primer parentesis de la expresión del filtro
        Dim flag_null As Boolean = False
        'Los flag de área son para comprobar si se ha marcado el checkbox de
        'area y evitar problemas con la expresión de filtrado
        Dim flag_area As Boolean = False
        Dim flag_area2 As Boolean = False
        'Se aplica un filtro por ahora "" a la conexión

        For Each checkBox_area In Lista_Areas.Items
            If (checkBox_area.Selected = True) Then
                If (Not String.IsNullOrEmpty(filtroPr) And flag_area2 = True) Then
                    filtroPr += " OR "
                End If
                filtroPr += "(AREA = '" + checkBox_area.Value + "')"
                'Se activa este flag para evitar repetir ORs
                flag_area2 = True
            End If
        Next

        'Cerramos expresión de filtro si es que se ha aplicado alguno
        If flag_null = True Then
            filtroPr += " ) "
        End If

        If filtroPr = "" Then
            filtroPr = "null"
        End If

        If Request.QueryString("mes") <> "" Then
            uchile_conmes.FilterExpression = filtroPr
        Else
            UCHILE_sinMes.FilterExpression = filtroPr
        End If

        'Debug
        'System.Diagnostics.Debug.WriteLine("El filtro es:" + filtroPr)
    End Sub

    'Cadena para pasar variable del "code behind" a la vista
    Protected cadenaPr As String
    'Al hacer postback no reconoce el filtro vacío si es variable local
    Protected filtroPr As String

    Protected Sub rellenar(ByVal sender As Object, ByVal e As EventArgs) Handles Lista_Areas.DataBound
        'Marca los checkbox de la página de acuerdo al filtro de la página anterior.
        Dim array_areas As String()

        'Se generan arrays con los filtros que se pasan por variable de sesión, 
        'a los que les quitamos las comillas
        array_areas = Split(Replace(Session("filtro_area"), "''", ""), ", ")

        'System.Diagnostics.Debug.WriteLine(array_sedes)

        'Para cada valor de los filtros, se comprueban los checkboxes,
        If Session("filtro_area") <> "" Then
            For Each array_item In array_areas
                For Each check_box In Lista_Areas.Items
                    If check_box.value = array_item Then
                        check_box.Selected = True
                    End If
                Next
            Next
        Else
            For Each CheckBox In Lista_Areas.Items
                CheckBox.Selected = True
            Next
        End If
    End Sub

    Protected Sub marcarTodoArea(ByVal sender As Object, ByVal e As EventArgs) Handles boton_area.Click

        If boton_area.Text = "Marcar Todo" Then
            boton_area.Text = "Desmarcar Todo"
            For Each CheckBox In Lista_Areas.Items()
                CheckBox.Selected = True
            Next
        Else
            boton_area.Text = "Marcar Todo"
            For Each CheckBox In Lista_Areas.Items
                CheckBox.Selected = False
            Next
        End If

        CheckBoxList_SelectedIndexChanged(sender, e)

    End Sub

    Protected Sub boton_cerrar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles boton_cerrar.Click
        Response.Write("<script language='javascript'> { self.close() }</script>")
    End Sub

    Protected Sub desglosepr_aplicar_filtros_Click(ByVal sender As Object, ByVal e As EventArgs) Handles desglosepr_aplicar_filtros.Click
        Page_Load(sender, e)
    End Sub
End Class