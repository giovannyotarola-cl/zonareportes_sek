Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        curso_activo = "2013-2"
        'System.Diagnostics.Debug.WriteLine(origen_listado_alumnos.SelectCommand)
    End Sub

    Protected curso_activo As String

    Protected Sub boton_busca_alumno_Click(ByVal sender As Object, ByVal e As EventArgs) Handles boton_busca_alumno.Click
        Dim filtro As String = ""
        Dim cadena As String = origen_listado_alumnos.SelectCommand
        Dim flag As Boolean = False

        cadena = cadena.Replace(" ORDER BY PATERNO, MATERNO", "")
        'System.Diagnostics.Debug.WriteLine("Tras la resta: " + cadena)

        If busca_nombre.Text <> "" Then
            cadena += " AND NOMBRE like '%" + busca_nombre.Text + "%'"
        End If

        If busca_paterno.Text <> "" Then
            cadena += " AND [Apellido 1] like '%" + busca_paterno.Text + "%'"
        End If

        If busca_materno.Text <> "" Then
            cadena += " AND [Apellido 2] like '%" + busca_materno.Text + "%'"
        End If

        If busca_cedula.Text <> "" Then
            cadena += " AND [VAT Registration No_] like '%" + busca_cedula.Text + "%'"
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

        origen_listado_alumnos.SelectCommand = "SELECT TOP (100) PERCENT dbo.Customer.[VAT Registration No_] AS RUT_alumno, " + _
                                                    " dbo.Customer.Nombre AS NOMBRE, " + _
                                                    " dbo.Customer.[Apellido 1] AS PATERNO," + _
                                                    " dbo.Customer.[Apellido 2] AS MATERNO," + _
                                                    " dbo.[Curso escolar alumno].[CODCLIU+] AS ID, " + _
                                                    " CASE WHEN dbo.[Fotos Alumnos].Picture IS NULL THEN 'Sin foto' ELSE 'Ok' END AS Foto, " + _
                                                    " dbo.[UISEK_ECUADOR$CarrerasU+].Carrera, CASE WHEN YEAR(dbo.[Curso escolar alumno].[Fecha Baja])> 2000 THEN 'Baja en ' + CAST(dbo.[Curso escolar alumno].[Fecha Baja] AS nvarchar) ELSE 'Activo' END AS Estado, " + _
                                                    " dbo.Customer.No_ " + _
                                                " FROM  dbo.Customer INNER JOIN" + _
                                                        " dbo.[Curso escolar alumno] ON dbo.Customer.No_ = dbo.[Curso escolar alumno].[Cód_ Alumno] INNER JOIN" + _
                                                        " dbo.Curso ON dbo.[Curso escolar alumno].[Cód_ Curso] = dbo.Curso.[Cód_ curso] INNER JOIN" + _
                                                        " dbo.[UISEK_ECUADOR$CarrerasU+] ON dbo.Curso.[CarreraU+] = dbo.[UISEK_ECUADOR$CarrerasU+].CodCarrera LEFT OUTER JOIN" + _
                                                        " dbo.[Fotos Alumnos] ON dbo.Customer.No_ = dbo.[Fotos Alumnos].No_" + _
                                                " WHERE (dbo.Customer.Nombre IS NOT NULL) AND " + _
                                                        " (dbo.Customer.Nombre <> '') AND " + _
                                                        " (dbo.Customer.[Apellido 1] IS NOT NULL) AND " + _
                                                        " (dbo.Customer.[Apellido 1] <> '') AND " + _
                                                        " (dbo.Customer.[Apellido 2] IS NOT NULL) AND " + _
                                                        " (dbo.Customer.[Apellido 2] <> '') AND " + _
                                                        " (dbo.[Curso escolar alumno].[Cód_ Curso Escolar] = '2014-1') AND" + _
                                                        " (dbo.[Curso escolar alumno].[Estado] = '2') AND " + _
                                                        " (dbo.Curso.CodCentro IN ('45', '55', '130')) " + _
                                                " ORDER BY PATERNO, MATERNO"
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
            Session("umas") = res(1)
            Response.Write("<script>window.open('camFrame.aspx?alumno=" + res(0) + "', '_blank');</script>")
        End If
    End Sub

End Class