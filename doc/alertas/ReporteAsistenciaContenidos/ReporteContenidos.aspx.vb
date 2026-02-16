Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class ReporteContenidos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Carga_Semestre()
        Carga_Profes()
        'Carga_Carreras()

    End Sub

    Protected Sub Carga_Semestre()
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        If (IsPostBack = False) Then
            Try
                strSQL = "SELECT DISTINCT CODSEMESTRE FROM SEK_Horario_Asistencia ORDER BY CODSEMESTRE"
                Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
                da = New SqlClient.SqlDataAdapter(strSQL, connString)
                da.Fill(ds, "SEK_Horario_Asistencia")

                CB_Semestre.Items.Add(New ListItem("", ""))
                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim codSemestre As String = Trim(ds.Tables(0).Rows(i)("CODSEMESTRE").ToString)
                    CB_Semestre.Items.Add(New ListItem(codSemestre, codSemestre))
                Next
                connString.Close()

                Exportar.Visible = False
            Catch ex As Exception
                MsgBox("Error: " + ex.Message.ToString)
            End Try
        End If
    End Sub

    Protected Sub CB_Semestre_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CB_Semestre.SelectedIndexChanged
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        Dim words As String() = CB_Semestre.Text.Split(New Char() {"-"c})

        Try
            strSQL = "SELECT DISTINCT rs.CODCARR, rs.JORNADA, mc.NOMBRE_C FROM RA_SECCIO rs INNER JOIN MT_CARRER mc ON mc.CODCARR = rs.CODCARR WHERE (rs.ANO = '" + words(0) + "') AND (rs.PERIODO = '" + words(1) + "')"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "RA_SECCIO")

            CB_Carrera.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim jornada As String = Trim(ds.Tables(0).Rows(i)("JORNADA").ToString)
                Dim codCarr As String = Trim(ds.Tables(0).Rows(i)("CODCARR").ToString)
                Dim nomCarr As String = ds.Tables(0).Rows(i)("NOMBRE_C").ToString
                nomCarr = IIf(nomCarr.Length > 70, Mid(nomCarr, 1, 70), nomCarr)
                CB_Carrera.Items.Add(New ListItem(jornada + " - " + nomCarr, codCarr))
            Next
            connString.Close()

            Exportar.Visible = False
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try
    End Sub

    Protected Sub Carga_Profes()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            strSQL = "SELECT CODPROF, AP_PATER + ' ' + AP_MATER + ', ' + NOMBRES AS PROFE FROM RA_PROFES ORDER BY AP_PATER ASC"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "RA_PROFES")


            CB_Profesor.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim codProf As String = Trim(ds.Tables(0).Rows(i)("CODPROF").ToString)
                Dim nomProf As String = ds.Tables(0).Rows(i)("PROFE").ToString
                nomProf = IIf(codProf.Length > 55, Mid(codProf, 1, 55), nomProf)
                CB_Profesor.Items.Add(New ListItem(nomProf, codProf))
            Next
            connString.Close()

            Exportar.Visible = False
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try

    End Sub

    Protected Sub Carga_Carreras()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        Try
            'strSQL = "SELECT NOMBRE_C, CODCARR FROM MT_CARRER WHERE (TIPOCARR = 1) AND (JORNADA IS NOT NULL) ORDER BY NOMBRE_C"
            strSQL = "SELECT NOMBRE_C, CODCARR FROM MT_CARRER WHERE (JORNADA IS NOT NULL) ORDER BY NOMBRE_C"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "MT_CARRER")


            CB_Carrera.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim codCarr As String = Trim(ds.Tables(0).Rows(i)("CODCARR").ToString)
                Dim nomCarr As String = ds.Tables(0).Rows(i)("NOMBRE_C").ToString
                nomCarr = IIf(nomCarr.Length > 70, Mid(nomCarr, 1, 70), nomCarr)
                CB_Carrera.Items.Add(New ListItem(Mid(codCarr, codCarr.Length, codCarr.Length) + " - " + nomCarr, codCarr))
            Next
            connString.Close()

            Exportar.Visible = False
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try

    End Sub


    Protected Sub CB_Carrera_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CB_Carrera.SelectedIndexChanged
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        CB_Asignatura.Items.Clear()
        Try
            strSQL = "SELECT DISTINCT rs.CODRAMO, rr.NOMBRE FROM RA_SECCIO rs INNER JOIN RA_RAMO rr ON rs.CODRAMO = rr.CODRAMO WHERE rs.CODCARR = '" + CB_Carrera.SelectedValue + "' AND rs.ANO = '2017' AND rs.PERIODO = '2' ORDER BY rr.NOMBRE"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "RA_SECCIO")


            CB_Asignatura.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim codRamo As String = Trim(ds.Tables(0).Rows(i)("CODRAMO").ToString)
                Dim nomRamo As String = ds.Tables(0).Rows(i)("NOMBRE").ToString
                CB_Asignatura.Items.Add(New ListItem(nomRamo, codRamo))
            Next
            connString.Close()

            Exportar.Visible = False
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try
    End Sub

    Protected Sub CB_Asignatura_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CB_Asignatura.SelectedIndexChanged
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String

        CB_Seccion.Items.Clear()
        Try
            strSQL = "SELECT CODSECC FROM RA_SECCIO WHERE CODRAMO = '" + CB_Asignatura.SelectedValue + "' AND CODCARR = '" + CB_Carrera.SelectedValue + "' AND ANO = '2017' AND PERIODO = '2'"
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "RA_SECCIO")


            CB_Seccion.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim codSecc As String = Trim(ds.Tables(0).Rows(i)("CODSECC").ToString)
                CB_Seccion.Items.Add(New ListItem(codSecc, codSecc))
            Next
            connString.Close()

            Exportar.Visible = False
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

            strSQL = "SELECT * FROM SEK_Horario_Asistencia WHERE CODHORARIO > 0 "

            If (TB_Rut.Text <> "") Then
                strSQL = strSQL + " AND CODPROF = '" + TB_Rut.Text + "'"
            End If

            If (CB_Asignatura.SelectedValue.ToString <> "") Then
                strSQL = strSQL + " AND CODRAMO = '" + CB_Asignatura.SelectedValue + "'"
            End If

            If (CB_Seccion.SelectedValue.ToString <> "") Then
                strSQL = strSQL + " AND CODPARALELO = '" + CB_Seccion.SelectedValue.ToString + "'"
            End If

            'Response.Write(strSQL)
            'Response.End()

            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "SEK_Horario_Asistencia")

            If (ds.Tables(0).Rows.Count > 0) Then

                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                    Dim RowTableInforme As New TableRow
                    RowTableInforme.TableSection = TableRowSection.TableBody
                    RowTableInforme.ID = "00" + i

                    Dim CellProfesor As New TableCell
                    Dim CellFecha As New TableCell
                    Dim CellContenido As New TableCell

                    Dim Contenido1 As String
                    Dim Contenido2 As String
                    Dim Contenido3 As String

                    Contenido1 = ds.Tables(0).Rows(i)("CODSILABUS1").ToString
                    Contenido2 = ds.Tables(0).Rows(i)("CODSILABUS2").ToString
                    Contenido3 = ds.Tables(0).Rows(i)("CODSILABUS3").ToString

                    If (Contenido1 = "") Then
                        Contenido1 = "Sín Contenido."
                    Else
                        Contenido1 = Silabus_Horario(Contenido1)
                    End If
                    If (Contenido2 = "") Then
                        Contenido2 = "Sín Contenido."
                    Else
                        Contenido2 = Silabus_Horario(Contenido2)
                    End If
                    If (Contenido3 = "") Then
                        Contenido3 = "Sín Contenido."
                    Else
                        Contenido3 = Silabus_Horario(Contenido3)
                    End If

                    CellProfesor.Text = Nombre_Profesor(ds.Tables(0).Rows(i)("CODPROF").ToString)
                    CellFecha.Text = ds.Tables(0).Rows(i)("FECHA").ToString
                    CellContenido.Text = "1.- " + Contenido1 + "<br>2.- " + Contenido2 + "<br>3.- " + Contenido3

                    RowTableInforme.Controls.Add(CellProfesor)
                    RowTableInforme.Controls.Add(CellFecha)
                    RowTableInforme.Controls.Add(CellContenido)

                    TBL_Aranceles.Controls.Add(RowTableInforme)
                Next
            End If
            connString.Close()

            Exportar.Visible = False
        Catch ex As Exception
            MsgBox("Error: " + ex.Message.ToString)
        End Try
    End Sub

    Public Function Silabus_Horario(ByVal codSilabus As String) As String
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        Dim result As String = ""
        Try
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)

            strSQL = "SELECT SILABUS FROM SEK_Silabus_Horarios WHERE ID = '" + codSilabus + "'"
            da = New SqlClient.SqlDataAdapter(strSQL, connString)

            da.Fill(ds, "SEK_Silabus_Horarios")

            If (ds.Tables(0).Rows.Count > 0) Then
                result = ds.Tables(0).Rows(0)("SILABUS").ToString
            End If
            connString.Close()
        Catch ex As Exception
            result = "Contenido no encontrado"
        End Try

        Return result
    End Function

    Public Function Nombre_Profesor(ByVal codProf As String) As String
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String
        Dim result As String = ""
        Try
            Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)

            strSQL = "SELECT AP_PATER, AP_MATER, NOMBRES FROM RA_PROFES WHERE CODPROF = '" + codProf + "'"
            da = New SqlClient.SqlDataAdapter(strSQL, connString)

            da.Fill(ds, "RA_PROFES")

            If (ds.Tables(0).Rows.Count > 0) Then
                result = ds.Tables(0).Rows(0)("AP_PATER").ToString + " " + ds.Tables(0).Rows(0)("AP_MATER").ToString + "  " + ds.Tables(0).Rows(0)("NOMBRES").ToString
            End If
            connString.Close()
        Catch ex As Exception
            result = "Contenido no encontrado"
        End Try

        Return result
    End Function
End Class
