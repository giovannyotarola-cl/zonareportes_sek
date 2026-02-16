Public Class SeleccionarAlumno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub mostrar_detalles(ByVal sender As Object, ByVal e As EventArgs) Handles listado_alumnos.SelectedIndexChanged
        'System.Diagnostics.Debug.WriteLine("Valor es:" + listado_alumnos.SelectedRow.Cells(5).Text)
        Response.Write("<script>window.open('mostrarDetalles.aspx?alumno=" + listado_alumnos.SelectedRow.Cells(9).Text + "', '_blank');</script>")
    End Sub

    Protected Sub boton_busca_alumno_Click(ByVal sender As Object, ByVal e As EventArgs) Handles boton_busca_alumno.Click
        Dim filtro As String = ""
        Dim cadena As String = origen_listado_alumnos.SelectCommand
        Dim flag As Boolean = False

        cadena = cadena.Replace(" ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO", "")
        'System.Diagnostics.Debug.WriteLine("Tras la resta: " + cadena)

        If busca_nombre.Text <> "" Then
            If flag = False Then
                cadena += " WHERE "
                flag = True
            Else
                cadena += " AND "
            End If
            cadena += " nombre like '%" + busca_nombre.Text + "%'"
        End If

        If busca_paterno.Text <> "" Then
            If flag = False Then
                cadena += " WHERE "
                flag = True
            Else
                cadena += " AND "
            End If
            cadena += " paterno like '%" + busca_paterno.Text + "%'"
        End If

        If busca_materno.Text <> "" Then
            If flag = False Then
                cadena += " WHERE "
                flag = True
            Else
                cadena += " AND "
            End If
            cadena += " materno like '%" + busca_materno.Text + "%'"
        End If

        If busca_cedula.Text <> "" Then
            If flag = False Then
                cadena += " WHERE "
                flag = True
            Else
                cadena += " AND "
            End If
            cadena += " matricula.MT_CLIENT.CODCLI like '%" + busca_cedula.Text + "%'"
        End If

        cadena += " ORDER BY PATERNO, MATERNO"
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

        origen_listado_alumnos.SelectCommand = "SELECT matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO, matricula.MT_CLIENT.NOMBRE, matricula.MT_CLIENT.CODCLI + '-' + matricula.MT_CLIENT.DIG AS RUT_alumno, matricula.MT_ALUMNO.CODCLI AS CodCliente, matricula.MT_CARRER.NOMBRE_C, matricula.MT_CARRER.CODCARR, CAST(matricula.MT_ALUMNO.ANO AS nvarchar(6)) + '-' + CAST(matricula.MT_ALUMNO.PERIODO AS nvarchar(2)) AS ingreso, CAST(matricula.MT_ALUMNO.ANO_MAT AS nvarchar(6)) + '-' + CAST(matricula.MT_ALUMNO.PERIODO_MAT AS nvarchar(2)) AS ultima_matricula FROM matricula.MT_CLIENT INNER JOIN matricula.MT_ALUMNO ON matricula.MT_CLIENT.CODCLI = matricula.MT_ALUMNO.RUT INNER JOIN matricula.MT_CARRER ON matricula.MT_ALUMNO.CODCARPR = matricula.MT_CARRER.CODCARR ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO"
        listado_alumnos.DataBind()
    End Sub
End Class