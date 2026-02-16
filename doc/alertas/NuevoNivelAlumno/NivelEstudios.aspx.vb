Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class NivelEstudios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Carga_Carreras()

    End Sub

    Protected Sub Carga_Carreras()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT NOMBRE_C, CODCARR FROM MT_CARRER WHERE (TIPOCARR = 1) AND (JORNADA IS NOT NULL) ORDER BY NOMBRE_C"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "MT_CARRER")


            CB_Carrera.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim codCarr As String = Trim(ds.Tables(0).Rows(i)("CODCARR").ToString)
                Dim nomCarr As String = ds.Tables(0).Rows(i)("NOMBRE_C").ToString
                nomCarr = IIf(nomCarr.Length > 55, Mid(nomCarr, 1, 55), nomCarr)
                CB_Carrera.Items.Add(New ListItem(Mid(codCarr, codCarr.Length, codCarr.Length) + " - " + nomCarr, codCarr))
            Next
            connString.Close()

        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try

    End Sub

    Protected Sub Enviar_Click(sender As Object, e As EventArgs) Handles Enviar.Click
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)

            strSQL = "SELECT mtc.CODCLI, mtc.CODCLI, mtc.DIG, mtc.NOMBRE, mtc.PATERNO, mtc.MATERNO, mtca.NOMBRE_C, mta.ESTACAD, mta.ANO, "

            If (TB_Anio.Text <> "") Then
                strSQL += "dbo.SEK_NivelEstudiosCAE(mta.CODCLI,'" + TB_Anio.Text + "') as Nivel "
            Else
                strSQL += "dbo.SEK_NivelAlumno(mta.CODCLI) as Nivel "
            End If

            strSQL += "FROM MT_ALUMNO mta INNER JOIN MT_CLIENT mtc on mtc.CODCLI = mta.RUT INNER JOIN MT_CARRER mtca ON mta.CODCARPR = mtca.CODCARR WHERE (mta.RUT <> '') "

            If (TB_Rut.Text <> "") Then
                strSQL += "AND (mta.RUT = '" + TB_Rut.Text + "') "
            End If

            If (TB_Nombre.Text <> "") Then
                strSQL += "AND (mtc.NOMBRE LIKE '%" + TB_Nombre.Text + "%') "
            End If

            If (TB_ApellidoP.Text <> "") Then
                strSQL += "AND (mtc.PATERNO LIKE '%" + TB_ApellidoP.Text + "%') "
            End If

            If (TB_ApellidoM.Text <> "") Then
                strSQL += "AND (mtc.MATERNO LIKE '%" + TB_ApellidoM.Text + "%') "
            End If

            If (CB_Carrera.SelectedValue.ToString() <> "") Then
                strSQL += "AND (mta.CODCARPR = '" + CB_Carrera.SelectedValue.ToString() + "') "
            End If

            If (TB_AnioMatricula.Text <> "") Then
                strSQL += "AND (mta.ANO = '" + TB_AnioMatricula.Text + "') "
            End If

            If (CH_eliminado.Checked = True) Then
                strSQL += "AND (mta.ESTACAD = 'ELIMINADO') "
            End If

            If (CH_suspendido.Checked = True) Then
                strSQL += "AND (mta.ESTACAD = 'SUSPENDIDO') "
            End If

            If (CH_vigente.Checked = True) Then
                strSQL += "AND (mta.ESTACAD = 'VIGENTE') "
            End If

            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "MT_ALUMNO")

            If (ds.Tables(0).Rows.Count > 0) Then

                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim RowTableInforme As New TableRow
                    RowTableInforme.TableSection = TableRowSection.TableBody
                    RowTableInforme.ID = "00" + i

                    Dim CellRut As New TableCell
                    Dim CellDv As New TableCell
                    Dim CelNombre As New TableCell
                    Dim CellPaterno As New TableCell
                    Dim CellMaterno As New TableCell
                    Dim CellCarrera As New TableCell
                    Dim CellEstado As New TableCell
                    Dim CellAnio As New TableCell
                    Dim CellAnioNivel As New TableCell
                    Dim CellNivel As New TableCell

                    CellRut.Text = ds.Tables(0).Rows(i)("CODCLI").ToString()
                    CellDv.Text = ds.Tables(0).Rows(i)("DIG").ToString()
                    CelNombre.Text = ds.Tables(0).Rows(i)("NOMBRE").ToString()
                    CellPaterno.Text = ds.Tables(0).Rows(i)("PATERNO").ToString()
                    CellMaterno.Text = ds.Tables(0).Rows(i)("MATERNO").ToString()
                    CellCarrera.Text = ds.Tables(0).Rows(i)("NOMBRE_C").ToString()
                    CellEstado.Text = ds.Tables(0).Rows(i)("ESTACAD").ToString()
                    CellAnio.Text = ds.Tables(0).Rows(i)("ANO").ToString()
                    CellAnioNivel.Text = TB_Anio.Text.ToString()
                    CellNivel.Text = ds.Tables(0).Rows(i)("Nivel").ToString()

                    RowTableInforme.Controls.Add(CellRut)
                    RowTableInforme.Controls.Add(CellDv)
                    RowTableInforme.Controls.Add(CelNombre)
                    RowTableInforme.Controls.Add(CellPaterno)
                    RowTableInforme.Controls.Add(CellMaterno)
                    RowTableInforme.Controls.Add(CellCarrera)
                    RowTableInforme.Controls.Add(CellEstado)
                    RowTableInforme.Controls.Add(CellAnio)
                    RowTableInforme.Controls.Add(CellAnioNivel)
                    RowTableInforme.Controls.Add(CellNivel)

                    TBL_Aranceles.Controls.Add(RowTableInforme)
                Next
            End If
            connString.Close()

        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try
    End Sub

End Class
