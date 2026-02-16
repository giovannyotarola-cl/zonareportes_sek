Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
            If (Session("Nivel") <> "0" And Session("Nivel") <> "1" And Session("Nivel") <> "2" And Session("Nivel") <> "3") Then
                Response.Redirect("Default")
            End If
            If (Session("Nivel") <> "0" And Session("Nivel") <> "1") Then
                If Not Me.IsPostBack Then

                    If Session("FACULTAD") = "EPC" Or Session("FACULTAD") = "HED" Then
                        cargarCarreras("EPC','HED")
                        cargarCarreras_pe("EPC','HED")

                    Else
                        cargarCarreras(Session("FACULTAD"))
                        cargarCarreras_pe(Session("FACULTAD"))

                    End If
                End If
            End If
        End If
    End Sub





    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        cargarBtnBuscar()
    End Sub

    Protected Sub cargarBtnBuscar()
        cargarNivel3(ddlCarrerasFiltro.SelectedValue)
        cargarAsignaturasFiltro()
    End Sub

    Protected Sub cargarCarreras(ByVal codFac As String)
        'se eliminan todos los elementos de la lista
        ddlCarrerasFiltro.Items.Clear()

        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = "select codcarr,nombre_c,jornada from dbo.mt_carrer where codfac IN('" + codFac + "') and tipocarr IN(1,4) group by codcarr,nombre_c,jornada union select codcarr,nombre_c,jornada from dbo.mt_carrer where codfac IN('ele') and tipocarr IN(3) and codcarr in ('SCLELED','SCLELEV')group by codcarr,nombre_c,jornada"
        'Response.Write(strSql)
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            ddlCarrerasFiltro.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                Dim codCarr As String = Trim(ds.Tables(0).Rows(i)("codcarr").ToString)
                Dim nomCarr As String = ds.Tables(0).Rows(i)("nombre_c").ToString
                nomCarr = IIf(nomCarr.Length > 55, Mid(nomCarr, 1, 55), nomCarr)
                ddlCarrerasFiltro.Items.Add(New ListItem(Mid(codCarr, codCarr.Length, codCarr.Length) + " - " + nomCarr, codCarr))
            Next
        Catch ex As Exception
            'Response.Write(ex.message)
            Response.Write("Error al cargar Carreras")
        Finally
            conn.Close()
        End Try

    End Sub
    Protected Sub ddlFacultades_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlFacultades.SelectedIndexChanged
        If ddlFacultades.SelectedValue <> "" Then
            If ddlFacultades.SelectedValue = "EPC" Or ddlFacultades.SelectedValue = "HED" Then
                cargarCarreras("EPC','HED")
            Else
                cargarCarreras(ddlFacultades.SelectedValue)
            End If
        End If
    End Sub
    Protected Sub cargarNivel3(ByVal codCarr As String)
        Dim strSql As String

        Dim encuesta As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dsAsignaturas As New DataSet
        Dim dsProfesores As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        If rbtnEvalEst.Checked Then
            encuesta = "docEst"
            lblRutMatriculados.Text = "NÚMERO DE ENCUESTAS A REALIZAR"
        ElseIf rbtnAutoEval.Checked Then
            encuesta = "autoDoc"
            lblRutMatriculados.Text = "NÚMERO DE ASIGNATURAS"
        ElseIf rbtnEvalJefe.Checked Then
            encuesta = "jefe"
            lblRutMatriculados.Text = "NÚMERO DE ASIGNATURAS"
        Else
            encuesta = ""
        End If
        If encuesta <> "" Then
            Try
                conn.Open()
                strSql = "select * from dbo.[AnalisisEvaluacionNivel3]('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + codCarr + "')"
                da = New SqlDataAdapter(strSql, conn)
                da.Fill(ds)
                conn.Close()

                lblEncHechasDiur.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasDiur").ToString
                lblEncHechasVesp.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasVesp").ToString
                lblEncHechasTotal.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasTotal").ToString

                lblTotalMatricDiur.Text = ds.Tables(0).Rows(0)("rutMatriculadosDiur").ToString
                lblTotalMatricVesp.Text = ds.Tables(0).Rows(0)("rutMatriculadosVesp").ToString
                lblTotalMatricTotal.Text = ds.Tables(0).Rows(0)("rutMatriculadosTotal").ToString

                lblCoberDiur.Text = ds.Tables(0).Rows(0)("coberturaProcesoDiur").ToString
                lblCoberVesp.Text = ds.Tables(0).Rows(0)("coberturaProcesoVesp").ToString
                lblCoberTotal.Text = ds.Tables(0).Rows(0)("coberturaProcesoTotal").ToString

                lblPromGralDiur.Text = ds.Tables(0).Rows(0)("promedioGeneralDiur").ToString
                lblPromGralVesp.Text = ds.Tables(0).Rows(0)("promedioGeneralVesp").ToString
                lblPromGralTotal.Text = ds.Tables(0).Rows(0)("promedioGeneralTotal").ToString

                lblDesvEstDiur.Text = ds.Tables(0).Rows(0)("desviacionEstandarDiur").ToString
                lblDesvEstVesp.Text = ds.Tables(0).Rows(0)("desviacionEstandarVesp").ToString
                lblDesvEstTotal.Text = ds.Tables(0).Rows(0)("desviacionEstandarTotal").ToString

            Catch ex As Exception
				'Response.Write(ex.message)
                Response.Write("Error")
            End Try
            Try
                strSql = "SELECT dbo.RA_RAMO.CODRAMO, dbo.RA_RAMO.NOMBRE, dbo.RA_PROFES.CODPROF, dbo.RA_PROFES.AP_PATER + ' ' + dbo.RA_PROFES.AP_MATER + ' ' + dbo.RA_PROFES.NOMBRES AS NOMBREPROFE FROM dbo.RA_RAMO INNER JOIN dbo.RA_SECCIO ON dbo.RA_RAMO.CODRAMO = dbo.RA_SECCIO.CODRAMO INNER JOIN dbo.RA_PROFES ON dbo.RA_SECCIO.CODPROF = dbo.RA_PROFES.CODPROF WHERE (dbo.RA_SECCIO.ANO = '" + ddlAno.SelectedValue + "') AND (dbo.RA_SECCIO.PERIODO = '" + ddlSemestre.SelectedValue + "') AND (dbo.RA_SECCIO.CODCARR='" + ddlCarrerasFiltro.SelectedValue + "') GROUP BY dbo.RA_RAMO.CODRAMO, dbo.RA_RAMO.NOMBRE, dbo.RA_PROFES.CODPROF, dbo.RA_PROFES.AP_PATER,dbo.RA_PROFES.AP_MATER,dbo.RA_PROFES.NOMBRES ORDER BY dbo.RA_RAMO.NOMBRE"

                da = New SqlDataAdapter(strSql, conn)
                da.Fill(dsAsignaturas)
                conn.Close()

                If (dsAsignaturas.Tables(0).Rows.Count > 0) Then
                    For i As Integer = 0 To dsAsignaturas.Tables(0).Rows.Count - 1
                        Dim RowTable As New TableRow

                        Dim CellCodAsign As New TableCell
                        Dim CellNomAsign As New TableCell
                        Dim CellNomProfesor As New TableCell
                        Dim CellPromProfesor As New TableCell

                        CellPromProfesor.CssClass = "txt-prom"

                        CellCodAsign.Text = dsAsignaturas.Tables(0).Rows(i)("CODRAMO").ToString
                        CellNomAsign.Text = dsAsignaturas.Tables(0).Rows(i)("NOMBRE").ToString
                        CellNomProfesor.Text = dsAsignaturas.Tables(0).Rows(i)("NOMBREPROFE").ToString

                        Dim codProfST As String = dsAsignaturas.Tables(0).Rows(i)("CODPROF").ToString()
                        Dim anioST As String = ddlAno.SelectedValue
                        Dim periodoST As String = ddlSemestre.SelectedValue
                        Dim ramoST As String = dsAsignaturas.Tables(0).Rows(i)("CODRAMO").ToString()

                        'CellPromProfesor.Text = Mid(dsAsignaturas.Tables(0).Rows(i)("PromGeneral").ToString(), 1, 4)
                        CellPromProfesor.Text = Mid(calculaPromedioGeneral(codProfST, anioST, periodoST, ramoST,encuesta), 1, 4)

                        RowTable.Cells.Add(CellCodAsign)
                        RowTable.Cells.Add(CellNomAsign)
                        RowTable.Cells.Add(CellNomProfesor)
                        RowTable.Cells.Add(CellPromProfesor)

                        tablaAsignaturas.Rows.Add(RowTable)
                    Next
                End If
            Catch ex As Exception
                Response.Write("Error al cargar asignaturas")
            End Try

            'Try
            '    strSql = "SELECT DISTINCT dbo.RA_PROFES.CODPROF, dbo.RA_PROFES.RUT, dbo.RA_PROFES.AP_PATER + ' ' + dbo.RA_PROFES.AP_MATER + ' ' + dbo.RA_PROFES.NOMBRES AS NOMBREPROFE FROM dbo.RA_SECCIO INNER JOIN dbo.RA_PROFES ON dbo.RA_SECCIO.CODPROF = dbo.RA_PROFES.CODPROF WHERE (dbo.RA_SECCIO.ANO = '" + ddlAno.SelectedValue + "') AND (dbo.RA_SECCIO.PERIODO = '" + ddlSemestre.SelectedValue + "') AND (dbo.RA_SECCIO.CODCARR='" + ddlCarrerasFiltro.SelectedValue + "')"
            '    da = New SqlDataAdapter(strSql, conn)
            '    da.Fill(dsProfesores)
            '    conn.Close()

            '    If (dsProfesores.Tables(0).Rows.Count > 0) Then
            '        For i As Integer = 0 To dsProfesores.Tables(0).Rows.Count - 1
            '            Dim RowTable As New TableRow

            '            Dim CellCodProf As New TableCell
            '            Dim CellRutProf As New TableCell
            '            Dim CellNombreProf As New TableCell

            '            CellCodProf.Text = dsProfesores.Tables(0).Rows(i)("CODPROF").ToString
            '            CellRutProf.Text = dsProfesores.Tables(0).Rows(i)("RUT").ToString
            '            CellNombreProf.Text = dsProfesores.Tables(0).Rows(i)("NOMBREPROFE").ToString

            '            RowTable.Cells.Add(CellCodProf)
            '            RowTable.Cells.Add(CellRutProf)
            '            RowTable.Cells.Add(CellNombreProf)

            '            tablaProfesores.Rows.Add(RowTable)
            '        Next
            '    End If
            'Catch ex As Exception
            '    Response.Write("Error")
            'End Try

            estadisticasNivel3.Visible = True
        End If
    End Sub

    Protected Sub cargarAsignaturasFiltro()
        ddlAsignaturaInforme.Items.Clear()
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = "SELECT dbo.RA_RAMO.CODRAMO, dbo.RA_RAMO.NOMBRE FROM dbo.RA_RAMO INNER JOIN dbo.RA_SECCIO ON dbo.RA_RAMO.CODRAMO = dbo.RA_SECCIO.CODRAMO WHERE (dbo.RA_SECCIO.ANO = '" + ddlAno.SelectedValue + "') AND (dbo.RA_SECCIO.PERIODO = '" + ddlSemestre.SelectedValue + "') AND (dbo.RA_SECCIO.CODCARR='" + ddlCarrerasFiltro.SelectedValue + "') GROUP BY dbo.RA_RAMO.CODRAMO, dbo.RA_RAMO.NOMBRE ORDER BY dbo.RA_RAMO.NOMBRE"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()

            ddlAsignaturaInforme.Items.Add(New ListItem("", "0"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                ddlAsignaturaInforme.Items.Add(New ListItem(ds.Tables(0).Rows(i)("NOMBRE").ToString, ds.Tables(0).Rows(i)("CODRAMO").ToString))
            Next
        Catch ex As Exception
            Response.Write("Error al cargar ramos")
        Finally
            
        End Try
    End Sub

    Protected Sub ddlAsignaturaInforme_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlAsignaturaInforme.SelectedIndexChanged
        cargarNivel3(ddlCarrerasFiltro.SelectedValue)
        ddlSeccionInforme.Items.Clear()
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = "  select codsecc from dbo.ra_seccio WHERE (dbo.RA_SECCIO.ANO = '" + ddlAno.SelectedValue + "') AND (dbo.RA_SECCIO.PERIODO = '" + ddlSemestre.SelectedValue + "') AND (dbo.RA_SECCIO.CODRAMO='" + ddlAsignaturaInforme.SelectedValue + "')"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()

            ddlSeccionInforme.Items.Add(New ListItem("", "0"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                ddlSeccionInforme.Items.Add(New ListItem(ds.Tables(0).Rows(i)("codsecc").ToString, ds.Tables(0).Rows(i)("codsecc").ToString))
            Next
        Catch ex As Exception
            Response.Write("Error al cargar secciones")
        Finally
            
        End Try
    End Sub

    Protected Sub ddlSeccionInforme_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlSeccionInforme.SelectedIndexChanged
        cargarNivel3(ddlCarrerasFiltro.SelectedValue)
        ddlProfesorInforme.Items.Clear()
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = "SELECT dbo.RA_PROFES.CODPROF, dbo.RA_PROFES.AP_PATER + ' ' + dbo.RA_PROFES.AP_MATER + ' ' + dbo.RA_PROFES.NOMBRES AS NOMBREPROFE FROM dbo.RA_SECCIO INNER JOIN dbo.RA_PROFES ON dbo.RA_SECCIO.CODPROF = dbo.RA_PROFES.CODPROF WHERE (dbo.RA_SECCIO.ANO = '" + ddlAno.SelectedValue + "') AND (dbo.RA_SECCIO.PERIODO = '" + ddlSemestre.SelectedValue + "') AND (dbo.RA_SECCIO.CODRAMO='" + ddlAsignaturaInforme.SelectedValue + "') AND (dbo.RA_SECCIO.CODSECC='" + ddlSeccionInforme.SelectedValue + "')"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()

            ddlProfesorInforme.Items.Add(New ListItem("", "0"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                ddlProfesorInforme.Items.Add(New ListItem(ds.Tables(0).Rows(i)("NOMBREPROFE").ToString, ds.Tables(0).Rows(i)("CODPROF").ToString))
            Next
        Catch ex As Exception
            Response.Write("Error al cargar profesores")
        Finally
            
        End Try
    End Sub

    Protected Sub btnGenerar_Click(sender As Object, e As EventArgs) Handles btnGenerar.Click
        cargarNivel3(ddlCarrerasFiltro.SelectedValue)
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = ""
        Dim asignatura As String = ddlAsignaturaInforme.SelectedValue.Replace("'", "")
        Dim profesor As String = ddlProfesorInforme.SelectedValue.Replace("'", "")
        Dim ano As String = ddlAno.SelectedValue.Replace("'", "")
        Dim periodo As String = ddlSemestre.SelectedValue.Replace("'", "")
        Dim seccion As String = ddlSeccionInforme.SelectedValue.Replace("'", "")
        Dim carrera As String = ddlCarrerasFiltro.SelectedValue.Replace("'", "")
        Dim script As String = ""

        If ddlTipoEncuesta.SelectedValue = "docEst" Then
            strSql = "select * from dbo.SEK_EAdocente2014 WHERE  CODPROF='" + profesor + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "' AND CODRAMO='" + asignatura + "' AND SECCION='" + seccion + "'"

            script = "window.open('mostrarEvEstudianteDocente.aspx?ASIGNATURA=" + asignatura + "&PROFESOR=" + profesor + "&ANO=" + ano + "&PERIODO=" + periodo + "&SECCION=" + seccion + "&CARRERA=" + carrera + "');"
        ElseIf ddlTipoEncuesta.SelectedValue = "autoDoc" Then
            strSql = "select * FROM dbo.SEK_EPdocente2014 WHERE  CODPROF='" + profesor + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "' AND ASIGNATURA='" + asignatura + "' AND SECCION='" + seccion + "'"

            script = "window.open('mostrarAutoDocente.aspx?ASIGNATURA=" + asignatura + "&PROFESOR=" + profesor + "&ANO=" + ano + "&PERIODO=" + periodo + "&SECCION=" + seccion + "&CARRERA=" + carrera + "');"
        ElseIf ddlTipoEncuesta.SelectedValue = "jefe" Then
            strSql = "SELECT * FROM dbo.EN_jefecarrera WHERE  CODPROFESOR='" + profesor + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "' AND CODRAMO='" + asignatura + "'"

            script = "window.open('mostrarJefeCarrera.aspx?ASIGNATURA=" + asignatura + "&PROFESOR=" + profesor + "&ANO=" + ano + "&PERIODO=" + periodo + "&CARRERA=" + carrera + "');"
        End If
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()
            If (ds.Tables(0).Rows.Count = 0) Then
                script = "alert('No se ha encontrado información del profesor seleccionado para esa encuesta.');"
            End If
            ClientScript.RegisterStartupScript(Me.GetType(), "script", script, True)
        Catch ex As Exception

        End Try
    End Sub

    Protected Function calculaPromedioGeneral(ByVal codprof As String, ByVal anio As String, ByVal periodo As String, ByVal codramo As String, ByVal encuesta As String) As String
        Dim promerio As String = ""

        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = ""
		if(encuesta="docEst") Then
        strSql = "SELECT " + _
            "AVG(( " + _
            "((CAST(P1 AS DECIMAL)+CAST(P2 AS DECIMAL)+CAST(P3 AS DECIMAL)+CAST(P4 AS DECIMAL)) /4) + " + _
            "((CAST(P5 AS DECIMAL)+CAST(P6 AS DECIMAL)+CAST(P7 AS DECIMAL)+CAST(P8 AS DECIMAL)) /4) + " + _
            "((CAST(P9 AS DECIMAL)+CAST(P10 AS DECIMAL)+CAST(P11 AS DECIMAL)+CAST(P12 AS DECIMAL)) /4) + " + _
            "((CAST(P13 AS DECIMAL)+CAST(P14 AS DECIMAL)+CAST(P15 AS DECIMAL)+CAST(P16 AS DECIMAL)) /4) + " + _
            "((CAST(P17 AS DECIMAL)+CAST(P18 AS DECIMAL)+CAST(P19 AS DECIMAL)+CAST(P20 AS DECIMAL)) /4 ) +" + _
            "((CAST(P21 AS DECIMAL)+CAST(P22 AS DECIMAL)+CAST(P23 AS DECIMAL)) / 3) + " + _
            "((CAST(P24 AS DECIMAL)) / 1) ) / 7) As PromGeneral " + _
            "FROM dbo.SEK_EAdocente2014 " + _
            "WHERE CODPROF='" + codprof + "' AND ANO='" + anio + "' AND PERIODO='" + periodo + "' AND CODRAMO='" + codramo + "'"
		end if
		
		if(encuesta="autoDoc") Then
        strSql = "SELECT " + _
            "AVG(( " + _
            "((CAST(P1 AS DECIMAL)+CAST(P2 AS DECIMAL)+CAST(P3 AS DECIMAL)+CAST(P4 AS DECIMAL)) /4) + " + _
            "((CAST(P5 AS DECIMAL)+CAST(P6 AS DECIMAL)+CAST(P7 AS DECIMAL)+CAST(P8 AS DECIMAL)) /4) + " + _
            "((CAST(P9 AS DECIMAL)+CAST(P10 AS DECIMAL)+CAST(P11 AS DECIMAL)+CAST(P12 AS DECIMAL)) /4) + " + _
            "((CAST(P13 AS DECIMAL)+CAST(P14 AS DECIMAL)+CAST(P15 AS DECIMAL)+CAST(P16 AS DECIMAL)) /4) + " + _
            "((CAST(P17 AS DECIMAL)+CAST(P18 AS DECIMAL)+CAST(P19 AS DECIMAL)+CAST(P20 AS DECIMAL)) /4 ) +" + _
            "((CAST(P21 AS DECIMAL)+CAST(P22 AS DECIMAL)) / 2) )/6)  As PromGeneral " + _            
            "FROM dbo.SEK_EPdocente2014 " + _
            "WHERE CODPROF='" + codprof + "' AND ANO='" + anio + "' AND PERIODO='" + periodo + "' AND ASIGNATURA='" + codramo + "'"
		end if
		
		if(encuesta="jefe") Then
        strSql = "SELECT " + _
            "AVG(( " + _
            "((CAST(P1 AS DECIMAL)+CAST(P2 AS DECIMAL)+CAST(P3 AS DECIMAL)+CAST(P4 AS DECIMAL)) /4) + " + _
            "((CAST(P5 AS DECIMAL)+CAST(P6 AS DECIMAL)+CAST(P7 AS DECIMAL)+CAST(P8 AS DECIMAL)) /4) + " + _
            "((CAST(P9 AS DECIMAL)+CAST(P10 AS DECIMAL)+CAST(P11 AS DECIMAL)+CAST(P12 AS DECIMAL)) /4) + " + _
            "((CAST(P13 AS DECIMAL)+CAST(P14 AS DECIMAL)+CAST(P15 AS DECIMAL)+CAST(P16 AS DECIMAL)) /4) + " + _
            "((CAST(P17 AS DECIMAL)+CAST(P18 AS DECIMAL)+CAST(P19 AS DECIMAL)+CAST(P20 AS DECIMAL)) /4 ) +" + _
            "((CAST(P21 AS DECIMAL)+CAST(P22 AS DECIMAL)+CAST(P23 AS DECIMAL)) / 3)) /6 )  As PromGeneral " + _            
            "FROM dbo.EN_jefecarrera " + _
            "WHERE  CODPROFESOR='" +codprof + "' AND ANO='" + anio + "' AND PERIODO='" + periodo + "' AND CODRAMO='" + codramo + "'"
		end if
		'response.write(strSql)
		'response.end()
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()

            promerio = ds.Tables(0).Rows(0)("PromGeneral").ToString()
        Catch ex As Exception

            promerio = ""
        End Try

        Return promerio

    End Function

    Protected Sub cargarDropDownList()

        If DropDownList_selectPregrado.SelectedValue.Equals("PE") Then
            panelPE.Visible = True
            panelPN.Visible = False
        ElseIf DropDownList_selectPregrado.SelectedValue.Equals("PN") Then
            panelPN.Visible = True
            panelPE.Visible = False
        ElseIf DropDownList_selectPregrado.SelectedValue.Equals("-") Then
            panelPN.Visible = False
            panelPE.Visible = False
        End If
    End Sub

    Protected Sub DropDownList_selectPregrado_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList_selectPregrado.SelectedIndexChanged
        cargarDropDownList()
    End Sub





    Protected Sub btnBuscar_pe_Click(sender As Object, e As EventArgs) Handles btnBuscar_pe.Click
        cargarBtnBuscar_pe()
    End Sub

    Protected Sub cargarBtnBuscar_pe()
        cargarNivel3_pe(ddlCarrerasFiltro_pe.SelectedValue)
        cargarAsignaturasFiltro_pe()
    End Sub

    Protected Sub cargarCarreras_pe(ByVal codFac As String)
        'se eliminan todos los elementos de la lista
        ddlCarrerasFiltro_pe.Items.Clear()

        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)


        Dim strSql As String = ""
        If codFac.Equals("HED") Then

            strSql = "select codcarr,nombre_c,jornada " +
              " from dbo.mt_carrer " +
              " where codfac IN('" + codFac + "','EPC') and tipocarr =2 " +
              "and estado='vigente'"

        Else
            strSql = "select codcarr,nombre_c,jornada " +
                " from dbo.mt_carrer " +
                " where codfac IN('" + codFac + "') and tipocarr =2 " +
                "and estado='vigente'"
        End If


        'Response.Write(strSql)
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            ddlCarrerasFiltro_pe.Items.Add(New ListItem("", ""))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1


                Dim codCarr As String = Trim(ds.Tables(0).Rows(i)("codcarr").ToString)

                Dim nomCarr As String = ds.Tables(0).Rows(i)("nombre_c").ToString


                nomCarr = IIf(nomCarr.Length > 55, Mid(nomCarr, 1, 55), nomCarr)
                ddlCarrerasFiltro_pe.Items.Add(New ListItem(codCarr+ " - " + nomCarr, codCarr))
            Next
        Catch ex As Exception
            'Response.Write(ex.message)
            Response.Write("Error al cargar Carreras")
        Finally
            conn.Close()
        End Try

    End Sub
    Protected Sub ddlFacultades_SelectedIndexChanged_pe(sender As Object, e As EventArgs) Handles ddlFacultades_pe.SelectedIndexChanged
        If ddlFacultades_pe.SelectedValue <> "" Then
            If ddlFacultades_pe.SelectedValue = "EPC" Or ddlFacultades_pe.SelectedValue = "HED" Then
                cargarCarreras_pe("EPC','HED")
            Else
                cargarCarreras_pe(ddlFacultades_pe.SelectedValue)
            End If
        End If
    End Sub
    Protected Sub cargarNivel3_pe(ByVal codCarr As String)
        Dim strSql As String

        Dim encuesta As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dsAsignaturas As New DataSet
        Dim dsProfesores As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        If rbtnEvalEst_pe.Checked Then
            encuesta = "docEst"
            lblRutMatriculados_pe.Text = "NÚMERO DE ENCUESTAS A REALIZAR"
        ElseIf rbtnAutoEval_pe.Checked Then
            encuesta = "autoDoc"
            lblRutMatriculados_pe.Text = "NÚMERO DE ASIGNATURAS"
        ElseIf rbtnEvalJefe_pe.Checked Then
            encuesta = "jefe"
            lblRutMatriculados_pe.Text = "NÚMERO DE ASIGNATURAS"
        Else
            encuesta = ""
        End If
        If encuesta <> "" Then
            Try
                conn.Open()
                strSql = "select * from dbo.[AnalisisEvaluacionNivel3PE]('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + codCarr + "')"
                da = New SqlDataAdapter(strSql, conn)
                da.Fill(ds)
                conn.Close()

                'lblEncHechasDiur_pe.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasDiur").ToString
                'lblEncHechasVesp_pe.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasVesp").ToString
                lblEncHechasTotal_pe.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasTotal").ToString

                'lblTotalMatricDiur_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosDiur").ToString
                'lblTotalMatricVesp_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosVesp").ToString
                lblTotalMatricTotal_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosTotal").ToString

                'lblCoberDiur_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoDiur").ToString
                'lblCoberVesp_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoVesp").ToString
                lblCoberTotal_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoTotal").ToString

                'lblPromGralDiur_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralDiur").ToString
                'lblPromGralVesp_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralVesp").ToString
                lblPromGralTotal_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralTotal").ToString

                'lblDesvEstDiur_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarDiur").ToString
                'lblDesvEstVesp_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarVesp").ToString
                lblDesvEstTotal_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarTotal").ToString

            Catch ex As Exception
                'Response.Write(ex.message)
                Response.Write("Error")
            End Try
            Try
                strSql = "SELECT dbo.RA_RAMO.CODRAMO, dbo.RA_RAMO.NOMBRE," +
                    " dbo.RA_PROFES.CODPROF, dbo.RA_PROFES.AP_PATER + ' ' + " +
                    " dbo.RA_PROFES.AP_MATER + ' ' + " +
                    " dbo.RA_PROFES.NOMBRES AS NOMBREPROFE " +
                    " FROM dbo.RA_RAMO " +
                    "INNER JOIN dbo.RA_SECCIO " +
                    " ON dbo.RA_RAMO.CODRAMO = dbo.RA_SECCIO.CODRAMO " +
                    "INNER JOIN dbo.RA_PROFES " +
                    " ON dbo.RA_SECCIO.CODPROF = dbo.RA_PROFES.CODPROF " +
                    " WHERE (dbo.RA_SECCIO.ANO = '" + ddlAno_pe.SelectedValue + "')" +
                    " AND (dbo.RA_SECCIO.PERIODO = '" + ddlSemestre_pe.SelectedValue + "')" +
                    " AND (dbo.RA_SECCIO.CODCARR='" + ddlCarrerasFiltro_pe.SelectedValue + "')" +
                    " GROUP BY dbo.RA_RAMO.CODRAMO, dbo.RA_RAMO.NOMBRE, dbo.RA_PROFES.CODPROF, " +
                    "dbo.RA_PROFES.AP_PATER,dbo.RA_PROFES.AP_MATER,dbo.RA_PROFES.NOMBRES " +
                    "ORDER BY dbo.RA_RAMO.NOMBRE"

                da = New SqlDataAdapter(strSql, conn)
                da.Fill(dsAsignaturas)
                conn.Close()

                If (dsAsignaturas.Tables(0).Rows.Count > 0) Then
                    For i As Integer = 0 To dsAsignaturas.Tables(0).Rows.Count - 1
                        Dim RowTable As New TableRow

                        Dim CellCodAsign As New TableCell
                        Dim CellNomAsign As New TableCell
                        Dim CellNomProfesor As New TableCell
                        Dim CellPromProfesor As New TableCell

                        CellPromProfesor.CssClass = "txt-prom"

                        CellCodAsign.Text = dsAsignaturas.Tables(0).Rows(i)("CODRAMO").ToString
                        CellNomAsign.Text = dsAsignaturas.Tables(0).Rows(i)("NOMBRE").ToString
                        CellNomProfesor.Text = dsAsignaturas.Tables(0).Rows(i)("NOMBREPROFE").ToString

                        Dim codProfST As String = dsAsignaturas.Tables(0).Rows(i)("CODPROF").ToString()
                        Dim anioST As String = ddlAno_pe.SelectedValue
                        Dim periodoST As String = ddlSemestre_pe.SelectedValue
                        Dim ramoST As String = dsAsignaturas.Tables(0).Rows(i)("CODRAMO").ToString()

                        'CellPromProfesor_pe.Text = Mid(dsAsignaturas.Tables(0).Rows(i)("PromGeneral").ToString(), 1, 4)
                        CellPromProfesor.Text = Mid(calculaPromedioGeneral_pe(codProfST, anioST, periodoST, ramoST, encuesta), 1, 4)

                        RowTable.Cells.Add(CellCodAsign)
                        RowTable.Cells.Add(CellNomAsign)
                        RowTable.Cells.Add(CellNomProfesor)
                        RowTable.Cells.Add(CellPromProfesor)

                        tablaAsignaturas_pe.Rows.Add(RowTable)
                    Next
                End If
            Catch ex As Exception
                Response.Write("Error al cargar asignaturas")
            End Try

            'Try
            '    strSql = "SELECT DISTINCT dbo.RA_PROFES.CODPROF, dbo.RA_PROFES.RUT, dbo.RA_PROFES.AP_PATER + ' ' + dbo.RA_PROFES.AP_MATER + ' ' + dbo.RA_PROFES.NOMBRES AS NOMBREPROFE FROM dbo.RA_SECCIO INNER JOIN dbo.RA_PROFES ON dbo.RA_SECCIO.CODPROF = dbo.RA_PROFES.CODPROF WHERE (dbo.RA_SECCIO.ANO = '" + ddlAno.SelectedValue + "') AND (dbo.RA_SECCIO.PERIODO = '" + ddlSemestre.SelectedValue + "') AND (dbo.RA_SECCIO.CODCARR='" + ddlCarrerasFiltro.SelectedValue + "')"
            '    da = New SqlDataAdapter(strSql, conn)
            '    da.Fill(dsProfesores)
            '    conn.Close()

            '    If (dsProfesores.Tables(0).Rows.Count > 0) Then
            '        For i As Integer = 0 To dsProfesores.Tables(0).Rows.Count - 1
            '            Dim RowTable As New TableRow

            '            Dim CellCodProf As New TableCell
            '            Dim CellRutProf As New TableCell
            '            Dim CellNombreProf As New TableCell

            '            CellCodProf_pe.Text = dsProfesores.Tables(0).Rows(i)("CODPROF").ToString
            '            CellRutProf_pe.Text = dsProfesores.Tables(0).Rows(i)("RUT").ToString
            '            CellNombreProf_pe.Text = dsProfesores.Tables(0).Rows(i)("NOMBREPROFE").ToString

            '            RowTable.Cells.Add(CellCodProf)
            '            RowTable.Cells.Add(CellRutProf)
            '            RowTable.Cells.Add(CellNombreProf)

            '            tablaProfesores.Rows.Add(RowTable)
            '        Next
            '    End If
            'Catch ex As Exception
            '    Response.Write("Error")
            'End Try

            estadisticasNivel3_pe.Visible = True
        End If
    End Sub

    Protected Sub cargarAsignaturasFiltro_pe()
        ddlAsignaturaInforme_pe.Items.Clear()
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = " SELECT dbo.RA_RAMO.CODRAMO, dbo.RA_RAMO.NOMBRE " +
            " FROM dbo.RA_RAMO " +
            " INNER JOIN dbo.RA_SECCIO " +
            " ON dbo.RA_RAMO.CODRAMO = dbo.RA_SECCIO.CODRAMO " +
            " WHERE (dbo.RA_SECCIO.ANO = '" + ddlAno_pe.SelectedValue + "') " +
            " AND (dbo.RA_SECCIO.PERIODO = '" + ddlSemestre_pe.SelectedValue + "') " +
            " AND (dbo.RA_SECCIO.CODCARR='" + ddlCarrerasFiltro_pe.SelectedValue + "')" +
            " GROUP BY dbo.RA_RAMO.CODRAMO, dbo.RA_RAMO.NOMBRE " +
            " ORDER BY dbo.RA_RAMO.NOMBRE"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()

            ddlAsignaturaInforme_pe.Items.Add(New ListItem("", "0"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                ddlAsignaturaInforme_pe.Items.Add(New ListItem(ds.Tables(0).Rows(i)("NOMBRE").ToString, ds.Tables(0).Rows(i)("CODRAMO").ToString))
            Next
        Catch ex As Exception
            Response.Write("Error al cargar ramos")
        Finally

        End Try
    End Sub

    Protected Sub ddlAsignaturaInforme_pe_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlAsignaturaInforme_pe.SelectedIndexChanged
        cargarNivel3_pe(ddlCarrerasFiltro.SelectedValue)



        ddlProfesorInforme_pe.Items.Clear()
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = "SELECT dbo.RA_PROFES.CODPROF, dbo.RA_PROFES.AP_PATER + ' ' + dbo.RA_PROFES.AP_MATER + ' ' + dbo.RA_PROFES.NOMBRES AS NOMBREPROFE FROM dbo.RA_SECCIO INNER JOIN dbo.RA_PROFES ON dbo.RA_SECCIO.CODPROF = dbo.RA_PROFES.CODPROF WHERE (dbo.RA_SECCIO.ANO = '" + ddlAno_pe.SelectedValue + "') AND (dbo.RA_SECCIO.PERIODO = '" + ddlSemestre_pe.SelectedValue + "') AND (dbo.RA_SECCIO.CODRAMO='" + ddlAsignaturaInforme_pe.SelectedValue + "') "
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()

            ddlProfesorInforme_pe.Items.Add(New ListItem("", "0"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                ddlProfesorInforme_pe.Items.Add(New ListItem(ds.Tables(0).Rows(i)("NOMBREPROFE").ToString, ds.Tables(0).Rows(i)("CODPROF").ToString))
            Next
        Catch ex As Exception
            Response.Write("Error al cargar profesores")
        Finally

        End Try










    End Sub



    Protected Sub cargarseccion()

        ddlSeccionInforme_pe.Items.Clear()
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)


        Dim strSql As String = "  select codsecc from dbo.ra_seccio WHERE (dbo.RA_SECCIO.ANO = '" +
            ddlAno_pe.SelectedValue + "') AND (dbo.RA_SECCIO.PERIODO = '" +
            ddlSemestre_pe.SelectedValue + "') AND (dbo.RA_SECCIO.CODRAMO='" +
            ddlAsignaturaInforme_pe.SelectedValue + "') AND (dbo.RA_SECCIO.CODPROF='" + ddlProfesorInforme_pe.SelectedValue + "')"



        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()

            ddlSeccionInforme_pe.Items.Add(New ListItem("", "0"))
            For i As Integer = 0 To ds.Tables(0).Rows.Count - 1
                ddlSeccionInforme_pe.Items.Add(New ListItem(ds.Tables(0).Rows(i)("codsecc").ToString, ds.Tables(0).Rows(i)("codsecc").ToString))


            Next
        Catch ex As Exception
            Response.Write("Error al cargar secciones")
        Finally

        End Try



    End Sub

    Protected Sub btnGenerar_pe_Click(sender As Object, e As EventArgs) Handles btnGenerar_pe.Click
        cargarNivel3_pe(ddlCarrerasFiltro_pe.SelectedValue)
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = ""
        Dim asignatura As String = ddlAsignaturaInforme_pe.SelectedValue.Replace("'", "")
        Dim profesor As String = ddlProfesorInforme_pe.SelectedValue.Replace("'", "")
        Dim ano As String = ddlAno_pe.SelectedValue.Replace("'", "")
        Dim periodo As String = ddlSemestre_pe.SelectedValue.Replace("'", "")
        Dim seccion As String = ddlSeccionInforme_pe.SelectedValue.Replace("'", "")
        Dim carrera As String = ddlCarrerasFiltro_pe.SelectedValue.Replace("'", "")
        Dim script As String = ""

        If ddlTipoEncuesta_pe.SelectedValue = "docEst" Then
            strSql = "select * from dbo.SEK_EAdocentePE WHERE  CODPROF='" + profesor + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "' AND CODRAMO='" + asignatura + "' AND SECCION='" + seccion + "'"

            script = "window.open('mostrarEvEstudianteDocentePE.aspx?ASIGNATURA=" + asignatura + "&PROFESOR=" + profesor + "&ANO=" + ano + "&PERIODO=" + periodo + "&SECCION=" + seccion + "&CARRERA=" + carrera + "');"
        ElseIf ddlTipoEncuesta_pe.SelectedValue = "autoDoc" Then
            strSql = "select * FROM dbo.SEK_EPdocentePE WHERE  CODPROF='" + profesor + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "' AND ASIGNATURA='" + asignatura + "' AND SECCION='" + seccion + "'"

            script = "window.open('mostrarAutoDocentePE.aspx?ASIGNATURA=" + asignatura + "&PROFESOR=" + profesor + "&ANO=" + ano + "&PERIODO=" + periodo + "&SECCION=" + seccion + "&CARRERA=" + carrera + "');"
        ElseIf ddlTipoEncuesta_pe.SelectedValue = "jefe" Then
            strSql = "SELECT * FROM dbo.EN_jefecarreraPE WHERE  CODPROFESOR='" + profesor + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "' AND CODRAMO='" + asignatura + "'"

            script = "window.open('mostrarJefeCarreraPE.aspx?ASIGNATURA=" + asignatura + "&PROFESOR=" + profesor + "&ANO=" + ano + "&PERIODO=" + periodo + "&CARRERA=" + carrera + "');"
        End If
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()
            If (ds.Tables(0).Rows.Count = 0) Then
                script = "alert('No se ha encontrado información del profesor seleccionado para esa encuesta.');"
            End If
            ClientScript.RegisterStartupScript(Me.GetType(), "script", script, True)
        Catch ex As Exception

        End Try
    End Sub

    Protected Function calculaPromedioGeneral_pe(ByVal codprof As String, ByVal anio As String, ByVal periodo As String, ByVal codramo As String, ByVal encuesta As String) As String
        Dim promerio As String = ""

        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String = ""
        If (encuesta = "docEst") Then
            strSql = "SELECT " +
            "AVG(( " +
            "((CAST(P1 AS DECIMAL) + CAST(P2 AS DECIMAL) + CAST(P3 AS DECIMAL) + CAST(P4 AS DECIMAL)) /4) + " +
            "((CAST(P5 AS DECIMAL) + CAST(P6 AS DECIMAL) + CAST(P7 AS DECIMAL) + CAST(P8 AS DECIMAL)) /4) + " +
            "((CAST(P9 AS DECIMAL) + CAST(P10 AS DECIMAL) + CAST(P11 AS DECIMAL) + CAST(P12 AS DECIMAL)) /4) + " +
            "((CAST(P13 AS DECIMAL) + CAST(P14 AS DECIMAL) + CAST(P15 AS DECIMAL) + CAST(P16 AS DECIMAL)) /4) + " +
            "((CAST(P17 AS DECIMAL) + CAST(P18 AS DECIMAL) + CAST(P19 AS DECIMAL)) /3) +" +
            "((CAST(P20 AS DECIMAL) + CAST(P21 AS DECIMAL) + CAST(P22 AS DECIMAL)) /3) + " +
            "((CAST(P23 AS DECIMAL) + CAST(P24 AS DECIMAL) + CAST(P25 AS DECIMAL) + CAST(P26 AS DECIMAL))/4)" +
            ") / 7) As PromGeneral " +
            "FROM dbo.SEK_EAdocentePE " +
            "WHERE CODPROF='" + codprof + "' AND ANO='" + anio + "' AND PERIODO='" + periodo + "' AND CODRAMO='" + codramo + "'"
        End If

        If (encuesta = "autoDoc") Then
            strSql = "SELECT " +
            "AVG(( " +
            "((CAST(P1 AS DECIMAL) + CAST(P2 AS DECIMAL))/2) + " +
            "((CAST(P3 AS DECIMAL) + CAST(P4 AS DECIMAL) + CAST(P5 AS DECIMAL))/3) + " +
            "((CAST(P6 AS DECIMAL) + CAST(P7 AS DECIMAL) + CAST(P8 AS DECIMAL))/3) + " +
            "((CAST(P10 AS DECIMAL) + CAST(P11 AS DECIMAL) + CAST(P12 AS DECIMAL) + CAST(P13 AS DECIMAL))/4)  + " +
            "((CAST(P14 AS DECIMAL) + CAST(P15 AS DECIMAL) + CAST(P16 AS DECIMAL) + CAST(P17 AS DECIMAL))/4) " +
            ")/5)  As PromGeneral " +
            "FROM dbo.SEK_EPdocentePE " +
            "WHERE CODPROF='" + codprof + "' AND ANO='" + anio + "' AND PERIODO='" + periodo + "' AND ASIGNATURA='" + codramo + "'"
        End If

        If (encuesta = "jefe") Then
            strSql = "SELECT " +
            "AVG(( " +
            "((CAST(P1 AS DECIMAL) + CAST(P2 AS DECIMAL))/2) + " +
            "((CAST(P3 AS DECIMAL) + CAST(P4 AS DECIMAL) + CAST(P5 AS DECIMAL) + CAST(P6 AS DECIMAL) + CAST(P7 AS DECIMAL))/5) + " +
            "((CAST(P8 AS DECIMAL) + CAST(P9 AS DECIMAL) + CAST(P10 AS DECIMAL) + CAST(P11 AS DECIMAL) )/4) + " +
            "((CAST(P12 AS DECIMAL) + CAST(P13 AS DECIMAL) + CAST(P14 AS DECIMAL))/3) + " +
            "((CAST(P15 AS DECIMAL) + CAST(P16 AS DECIMAL) + CAST(P17 AS DECIMAL) + CAST(P18 AS DECIMAL))/4)" +
            ") /5 )  As PromGeneral " +
            "FROM dbo.EN_jefecarreraPE " +
            "WHERE  CODPROFESOR='" + codprof + "' AND ANO='" + anio + "' AND PERIODO='" + periodo + "' AND CODRAMO='" + codramo + "'"
        End If
        'response.write(strSql)
        'response.end()
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            conn.Close()

            promerio = ds.Tables(0).Rows(0)("PromGeneral").ToString()
        Catch ex As Exception

            promerio = ""
        End Try

        Return promerio

    End Function





    Protected Sub ddlProfesorInforme_pe_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlProfesorInforme_pe.SelectedIndexChanged
        cargarNivel3_pe(ddlCarrerasFiltro_pe.SelectedValue)

        cargarseccion()
    End Sub
End Class