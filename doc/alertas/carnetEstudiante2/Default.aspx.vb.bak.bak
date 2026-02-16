Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        curso_activo = "2013-1"
        'System.Diagnostics.Debug.WriteLine(origen_listado_alumnos.SelectCommand)
        Response.Write(origen_listado_alumnos.SelectCommand)
        Response.End()
    End Sub

    Protected curso_activo As String

    Protected Sub boton_busca_alumno_Click(ByVal sender As Object, ByVal e As EventArgs) Handles boton_busca_alumno.Click

        Dim filtro As String = ""
        Dim cadena As String = origen_listado_alumnos.SelectCommand
        Dim flag As Boolean = False

        cadena = cadena.Replace(" ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO ", "")
        'System.Diagnostics.Debug.WriteLine("Tras la resta: " + cadena)

        If busca_nombre.Text <> "" Then
            cadena += " AND matricula.MT_CLIENT.NOMBRE like '%" + busca_nombre.Text + "%'"
        End If

        If busca_paterno.Text <> "" Then
            cadena += " AND matricula.MT_CLIENT.PATERNO like '%" + busca_paterno.Text + "%'"
        End If

        If busca_materno.Text <> "" Then
            cadena += " AND matricula.MT_CLIENT.MATERNO like '%" + busca_materno.Text + "%'"
        End If

        If busca_cedula.Text <> "" Then
            cadena += " AND RUT like '%" + busca_cedula.Text + "%'"
        End If

        cadena += " ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO"
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

        origen_listado_alumnos.SelectCommand = "SELECT  
												matricula.MT_CLIENT.NOMBRE AS NOMBRE, 
												matricula.MT_CLIENT.PATERNO AS PATERNO, 
												matricula.MT_CLIENT.MATERNO AS MATERNO, 
												matricula.MT_CLIENT.CODCLI AS RUT,  
												matricula.MT_ALUMNO.ANO_MAT AS ANO_MAT,  
												matricula.MT_ALUMNO.PERIODO_MAT AS P_MAT,  
												matricula.MT_ALUMNO.CODCARPR AS C_MAT, 
												matricula.MT_ALUMNO.CODCLI AS CODCLI, 
												CASE WHEN Matricula.Foto_alumno.FOTO IS NULL THEN 'Sin Foto' ELSE 'Ok' END AS Foto
												FROM matricula.foto_alumno 
												RIGHT OUTER JOIN matricula.MT_CLIENT 
												ON matricula.foto_alumno.CODCLI COLLATE Modern_Spanish_CI_AS = matricula.MT_CLIENT.CODCLI 
												LEFT OUTER JOIN matricula.MT_ALUMNO 
												ON matricula.MT_CLIENT.CODCLI = matricula.MT_ALUMNO.RUT 
												WHERE NOMBRE IS NOT NULL
												AND NOMBRE <> ''
												AND PATERNO IS NOT NULL
												AND PATERNO <> ''
												ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO
												"
        listado_alumnos.DataBind()
        Response.Write("SELECT  
						matricula.MT_CLIENT.NOMBRE, 
						matricula.MT_CLIENT.PATERNO, 
						matricula.MT_CLIENT.MATERNO, 
						matricula.MT_CLIENT.CODCLI AS RUT,  
						matricula.MT_ALUMNO.ANO_MAT AS ANO_MAT,  
						matricula.MT_ALUMNO.PERIODO_MAT AS P_MAT,  
						matricula.MT_ALUMNO.CODCARPR AS C_MAT, 
						matricula.MT_ALUMNO.CODCLI AS CODCLI, 
						CASE WHEN Matricula.Foto_alumno.FOTO IS NULL THEN 'Sin Foto' ELSE 'Ok' END AS Foto
						FROM matricula.foto_alumno 
						RIGHT OUTER JOIN matricula.MT_CLIENT 
						ON matricula.foto_alumno.CODCLI COLLATE Modern_Spanish_CI_AS = matricula.MT_CLIENT.CODCLI 
						LEFT OUTER JOIN matricula.MT_ALUMNO 
						ON matricula.MT_CLIENT.CODCLI = matricula.MT_ALUMNO.RUT 
						WHERE matricula.MT_CLIENT.NOMBRE IS NOT NULL
						AND matricula.MT_CLIENT.NOMBRE <> ''
						AND matricula.MT_CLIENT.PATERNO IS NOT NULL
						AND matricula.MT_CLIENT.PATERNO <> ''
						ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO")
        Response.End()
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
            Session("umas") = res(1)
            Response.Write("<script>window.open('camFrame.aspx?alumno=" + res(0) + "', '_blank');</script>")
        End If
    End Sub

End Class