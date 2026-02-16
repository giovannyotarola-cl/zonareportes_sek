Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        curso_activo = "2019-1"
        'System.Diagnostics.Debug.WriteLine(origen_listado_alumnos.SelectCommand)
    End Sub

    Protected curso_activo As String

    Protected Sub boton_busca_alumno_Click(ByVal sender As Object, ByVal e As EventArgs) Handles boton_busca_alumno.Click
        Dim filtro As String = ""
        Dim cadena As String = origen_listado_alumnos.SelectCommand
        Dim flag As Boolean = False

        cadena = cadena.Replace(") T UNION SELECT SEK_CREDENCIALES.NOMBRE, SEK_CREDENCIALES.PATERNO, SEK_CREDENCIALES.MATERNO, SEK_CREDENCIALES.RUT, SEK_CREDENCIALES.ANO_MAT, SEK_CREDENCIALES.P_MAT, SEK_CREDENCIALES.C_MAT, CASE WHEN FOTO_ALUMNO.FOTO IS NULL THEN 'Sin Foto' ELSE 'Ok' END AS Foto FROM  FOTO_ALUMNO RIGHT OUTER JOIN SEK_CREDENCIALES ON FOTO_ALUMNO.CODCLI =  SEK_CREDENCIALES.RUT WHERE 1=1", "")
        'System.Diagnostics.Debug.WriteLine("Tras la resta: " + cadena)

        If busca_nombre.Text <> "" Then
            cadena += " AND NOMBRES like '%" + busca_nombre.Text + "%'"
        End If

        If busca_paterno.Text <> "" Then
            cadena += " AND AP_PATER like '%" + busca_paterno.Text + "%'"
        End If

        If busca_materno.Text <> "" Then
            cadena += " AND AP_MATER like '%" + busca_materno.Text + "%'"
        End If

        If busca_cedula.Text <> "" Then
            cadena += " AND RUT like '%" + busca_cedula.Text + "%'"
        End If

        cadena += ") T UNION SELECT SEK_CREDENCIALES.NOMBRE, SEK_CREDENCIALES.PATERNO, SEK_CREDENCIALES.MATERNO, SEK_CREDENCIALES.RUT, SEK_CREDENCIALES.ANO_MAT, SEK_CREDENCIALES.P_MAT, SEK_CREDENCIALES.C_MAT, CASE WHEN FOTO_ALUMNO.FOTO IS NULL THEN 'Sin Foto' ELSE 'Ok' END AS Foto FROM  FOTO_ALUMNO RIGHT OUTER JOIN SEK_CREDENCIALES ON FOTO_ALUMNO.CODCLI =  SEK_CREDENCIALES.RUT WHERE 1=1"
        If busca_nombre.Text <> "" Then
            cadena += " AND NOMBRE like '%" + busca_nombre.Text + "%'"
        End If

        If busca_paterno.Text <> "" Then
            cadena += " AND PATERNO like '%" + busca_paterno.Text + "%'"
        End If

        If busca_materno.Text <> "" Then
            cadena += " AND MATERNO like '%" + busca_materno.Text + "%'"
        End If

        If busca_cedula.Text <> "" Then
            cadena += " AND RUT like '%" + busca_cedula.Text + "%'"
        End If
		
		origen_listado_alumnos.SelectCommand = cadena
        'System.Diagnostics.Debug.WriteLine("Final: " + cadena)

        listado_alumnos.DataBind()

    End Sub

    'Borra los campos del formulario de búsqueda y muestra todos los resultados
    Protected Sub reset_busqueda_Click(ByVal sender As Object, ByVal e As EventArgs) Handles reset_busqueda.Click

        busca_nombre.Text = ""
        busca_paterno.Text = ""
        busca_materno.Text = ""
        busca_cedula.Text = ""

        origen_listado_alumnos.SelectCommand = "SELECT * FROM (SELECT A.NOMBRES AS NOMBRE, A.AP_PATER AS PATERNO, A.AP_MATER AS MATERNO, A.RUT, (SELECT MAX(VALOR) FROM MT_PARAME_DET WHERE IDPARAMETRO='ANO') AS ANO_MAT, '1' AS  P_MAT, (SELECT TOP 1 CODCARR AS CODCARR FROM RA_HORPROF WHERE CODPROF = A.CODPROF AND ANO IN (SELECT MAX(VALOR) FROM MT_PARAME_DET WHERE IDPARAMETRO='ANO')) AS C_MAT, CASE WHEN B.FOTO IS NULL THEN 'Sin Foto' ELSE 'Ok' END AS Foto FROM dbo.foto_alumno B RIGHT OUTER JOIN dbo.RA_PROFES A ON B.CODCLI = A.CODPROF WHERE A.CODPROF IN (SELECT PROFES FROM SEK_PROFES_FCSALU)) T UNION SELECT SEK_CREDENCIALES.NOMBRE, SEK_CREDENCIALES.PATERNO, SEK_CREDENCIALES.MATERNO, SEK_CREDENCIALES.RUT, SEK_CREDENCIALES.ANO_MAT, SEK_CREDENCIALES.P_MAT, SEK_CREDENCIALES.C_MAT, CASE WHEN FOTO_ALUMNO.FOTO IS NULL THEN 'Sin Foto' ELSE 'Ok' END AS Foto FROM  FOTO_ALUMNO RIGHT OUTER JOIN SEK_CREDENCIALES ON FOTO_ALUMNO.CODCLI = SEK_CREDENCIALES.RUT  "
        listado_alumnos.DataBind()
    End Sub

    Protected Sub bot_reverso_Click(ByVal sender As Object, ByVal e As EventArgs) Handles bot_reverso.Click
        Response.Write("<script>window.open('reverso.aspx', '_blank');</script>")
    End Sub

    Protected Sub listado_alumnos_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles listado_alumnos.SelectedIndexChanged
        Response.Write("<script>window.open('mostrarCarnet.aspx?alumno=" + listado_alumnos.SelectedRow.Cells(10).Text + "', '_blank');</script>")
    End Sub

    Protected Sub tomarFoto(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles listado_alumnos.RowCommand
        'System.Diagnostics.Debug.WriteLine(e.CommandArgument)
        Dim res() As String
        res = Split(e.CommandArgument, ";")
        'System.Diagnostics.Debug.WriteLine(res(0))
        'System.Diagnostics.Debug.WriteLine(res(1))

        If e.CommandName = "tomarFoto" Then
            Session("alumno") = ""
            Session("umas") = ""
            Session("alumno") = res(0)
            Session("umas") = res(0)
            Response.Write("<script>window.open('camFrame.aspx?alumno=" + res(0) + "', '_blank');</script>")
        End If
    End Sub

End Class