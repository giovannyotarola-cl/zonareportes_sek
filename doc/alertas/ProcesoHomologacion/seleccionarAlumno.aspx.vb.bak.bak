Public Class seleccionarAlumno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub mostrar_detalles(ByVal sender As Object, ByVal e As EventArgs) Handles listadoAlumnos.SelectedIndexChanged
        ''Al hacer click en un alumno, oculta el listado completo y muestra un grid nuevo en el que 
        ''se debe seleccionar el expediente destino al que realizar la homologación.

        div_busca.Visible = False
        div_listado_alumnos.Visible = False

        origen_lista_carreras.SelectCommand = "SELECT matricula.MT_CLIENT.CODCLI + '-' + matricula.MT_CLIENT.DIG AS rut_alumno, matricula.MT_CLIENT.NOMBRE +' '+matricula.MT_CLIENT.PATERNO+' '+matricula.MT_CLIENT.MATERNO as alumno, matricula.MT_CARRER.CODCARR, matricula.MT_CARRER.NOMBRE_C, matricula.MT_ALUMNO.CODCLI FROM matricula.MT_ALUMNO INNER JOIN matricula.MT_CLIENT ON matricula.MT_ALUMNO.RUT = matricula.MT_CLIENT.CODCLI INNER JOIN matricula.MT_CARRER ON matricula.MT_ALUMNO.CODCARPR = matricula.MT_CARRER.CODCARR WHERE (matricula.MT_CLIENT.CODCLI = '" + listadoAlumnos.SelectedRow.Cells(8).Text + "') AND (matricula.MT_ALUMNO.CODCLI <> '" + listadoAlumnos.SelectedRow.Cells(1).Text + "')"
        'System.Diagnostics.Debug.WriteLine("Consulta es:" + origen_lista_carreras.SelectCommand)
        codCliElegido = listadoAlumnos.SelectedRow.Cells(1).Text
        alumno = listadoAlumnos.SelectedRow.Cells(2).Text
        carreraElegida = listadoAlumnos.SelectedRow.Cells(5).Text

        lista_carreras.DataBind()

        seleccionar_destino_div.Visible = True

        'System.Diagnostics.Debug.WriteLine("Valor es:" + listado_alumnos.SelectedRow.Cells(5).Text)
        'Response.Redirect("~/seleccionarDestino.aspx?cedula=" + listadoAlumnos.SelectedRow.Cells(8).Text + "&codcli=" + listadoAlumnos.SelectedRow.Cells(1).Text)
    End Sub

    Protected Sub boton_busca_alumno_Click(ByVal sender As Object, ByVal e As EventArgs) Handles boton_busca_alumno.Click
        Dim filtro As String = ""
        Dim cadena As String = origen_alumnos.SelectCommand
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
            cadena += " NOMBRE like '%" + busca_nombre.Text + "%'"
        End If

        If busca_paterno.Text <> "" Then
            If flag = False Then
                cadena += " WHERE "
                flag = True
            Else
                cadena += " AND "
            End If
            cadena += " PATERNO like '%" + busca_paterno.Text + "%'"
        End If

        If busca_materno.Text <> "" Then
            If flag = False Then
                cadena += " WHERE "
                flag = True
            Else
                cadena += " AND "
            End If
            cadena += " MATERNO like '%" + busca_materno.Text + "%'"
        End If

        If busca_cedula.Text <> "" Then
            If flag = False Then
                cadena += " WHERE "
                flag = True
            Else
                cadena += " AND "
            End If
            cadena += " rut_alumno like '%" + busca_cedula.Text + "%'"
        End If

        cadena += " ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO"
        origen_alumnos.SelectCommand = cadena
        'System.Diagnostics.Debug.WriteLine("Final: " + cadena)

        listadoAlumnos.DataBind()

    End Sub

    'Borra los campos del formulario de búsqueda y muestra todos los resultados
    Protected Sub reset_busqueda_Click(ByVal sender As Object, ByVal e As EventArgs) Handles reset_busqueda.Click

        busca_nombre.Text = ""
        busca_paterno.Text = ""
        busca_materno.Text = ""
        busca_cedula.Text = ""

        alumno = ""
        codCliElegido = ""
        carreraElegida = ""

        origen_alumnos.SelectCommand = "SELECT matricula.MT_CLIENT.CODCLI + '-' + matricula.MT_CLIENT.DIG AS rut_alumno, matricula.MT_CLIENT.CODCLI as cedula, matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO, matricula.MT_CLIENT.NOMBRE, matricula.MT_CARRER.NOMBRE_C, matricula.MT_ALUMNO.CODCLI, matricula.RA_PESTUD.NOMPESTUD, matricula.RA_PESTUD.CODPESTUD FROM matricula.MT_ALUMNO INNER JOIN matricula.MT_CARRER ON matricula.MT_ALUMNO.CODCARPR = matricula.MT_CARRER.CODCARR INNER JOIN matricula.MT_CLIENT ON matricula.MT_ALUMNO.RUT = matricula.MT_CLIENT.CODCLI INNER JOIN matricula.RA_PESTUD ON matricula.MT_ALUMNO.CODPESTUD = matricula.RA_PESTUD.CODPESTUD ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO"
        listadoAlumnos.DataBind()
    End Sub

    Protected Sub reset_proceso_Click(ByVal sender As Object, ByVal e As EventArgs) Handles reset_proceso.Click

        seleccionar_destino_div.Visible = False
        div_busca.Visible = True
        div_listado_alumnos.Visible = True

        reset_busqueda_Click(sender, e)

    End Sub

    Protected codCliElegido As String
    Protected alumno As String
    Protected carreraElegida As String

    Protected Sub lanzar_homologacion(ByVal sender As Object, ByVal e As EventArgs) Handles lista_carreras.SelectedIndexChanged

        If sel_repr.Checked = True Then

        Else

        End If

    End Sub

    Protected Sub confirmar_hom(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles lista_carreras.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim db As LinkButton
            db = e.Row.Cells(4).Controls(0)
            'Hay que comprobar el último caracter del ID porque si termina en 7 se refiere al botón 
            'cancelar que aparece al pulsar en Editar y pide también confirmación de borrado.
            'System.Diagnostics.Debug.WriteLine(e.Row.Cells(7).Controls(2).UniqueID)
            db.OnClientClick = "return confirm('Va a lanzar el proceso de homologación de ramos. ¿Está seguro?');"

        End If
    End Sub
End Class