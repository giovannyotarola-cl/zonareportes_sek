Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
            If (Session("Nivel") <> "0" And Session("Nivel") <> "1" And Session("Nivel") <> "2") Then
                Response.Redirect("Default")
            End If
        End If



    End Sub




    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        cargarNivel2()
    End Sub



    Protected Sub cargarNivel2()
        Dim strSql As String
        Dim encuesta As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dsEstCarr As New DataSet
        Dim dsResCarr As New DataSet
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
        If ddlJornada.SelectedIndex = 0 Then
            volverColorDiur()
            volverColorVesp()
        ElseIf ddlJornada.SelectedIndex = 1 Then
            cambiarColorDiur()
            volverColorVesp()
        ElseIf ddlJornada.SelectedIndex = 2 Then
            volverColorDiur()
            cambiarColorVesp()
        End If
        If encuesta <> "" Then
            Try
                conn.Open()
                If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then
                    If (ddlJornada.SelectedIndex = 0) Then
                        strSql = "select * from dbo.[AnalisisEvaluacionNivel2]('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + ddlFacultades.SelectedValue + "')"
                    Else
                        strSql = "select * from dbo.[AnalisisEvaluacionNivel2_FiltroJornada]('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + ddlFacultades.SelectedValue + "','" + ddlJornada.SelectedValue + "')"
                    End If
                Else
                    If (ddlJornada.SelectedIndex = 0) Then
                        strSql = "select * from dbo.[AnalisisEvaluacionNivel2]('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + Session("FACULTAD") + "')"
                    Else
                        strSql = "select * from dbo.[AnalisisEvaluacionNivel2_FiltroJornada]('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + Session("FACULTAD") + "','" + ddlJornada.SelectedValue + "')"
                    End If
                End If
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

                Try
                    conn.Open()
                    If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then
                        strSql = "select * from dbo.AnalisisEvaluacionNivel2_EstadisticasCarreras('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + ddlFacultades.SelectedValue + "','" + ddlJornada.SelectedValue + "')"
                    Else
                        strSql = "select * from dbo.AnalisisEvaluacionNivel2_EstadisticasCarreras('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + Session("FACULTAD") + "','" + ddlJornada.SelectedValue + "')"
                    End If
                    da = New SqlDataAdapter(strSql, conn)
                    da.Fill(dsEstCarr)
                    conn.Close()

                    If (dsEstCarr.Tables(0).Rows.Count > 0) Then
                        For i As Integer = 0 To dsEstCarr.Tables(0).Rows.Count - 1
                            Dim RowTable As New TableRow

                            Dim CellCodCarr As New TableCell
                            Dim CellEncHech As New TableCell
                            Dim CellRutMat As New TableCell
                            Dim CellCobertura As New TableCell
                            Dim CellPromedio As New TableCell
                            Dim CellDesv As New TableCell

                            CellCodCarr.Text = dsEstCarr.Tables(0).Rows(i)("codCarr").ToString
                            CellEncHech.Text = dsEstCarr.Tables(0).Rows(i)("NumerosEncuestasHechas").ToString

                            CellRutMat.Text = dsEstCarr.Tables(0).Rows(i)("rutMatriculados").ToString

                            CellCobertura.Text = dsEstCarr.Tables(0).Rows(i)("coberturaProceso").ToString
                            CellPromedio.Text = dsEstCarr.Tables(0).Rows(i)("promedioGeneral").ToString
                            CellDesv.Text = dsEstCarr.Tables(0).Rows(i)("desviacionEstandar").ToString

                            RowTable.Cells.Add(CellCodCarr)
                            RowTable.Cells.Add(CellEncHech)
                            RowTable.Cells.Add(CellRutMat)
                            RowTable.Cells.Add(CellCobertura)
                            RowTable.Cells.Add(CellPromedio)
                            RowTable.Cells.Add(CellDesv)

                            tablaResultadosCarreras.Rows.Add(RowTable)
                        Next
                    End If
                Catch ex As Exception
                    'Response.Write(ex.Message)
                    Response.Write("Error al cargar la información")
                Finally
                    conn.Close()
                End Try
                If encuesta = "docEst" Or encuesta = "autoDoc" Then

                    lblEvGenProm.Text = ds.Tables(0).Rows(0)("evaluacionGeneralPromedio").ToString
                    lblPlanProm.Text = ds.Tables(0).Rows(0)("planeacionPromedio").ToString
                    lblMetProm.Text = ds.Tables(0).Rows(0)("metodologiaPromedio").ToString
                    lblContProm.Text = ds.Tables(0).Rows(0)("contenidosPromedio").ToString
                    lblClimProm.Text = ds.Tables(0).Rows(0)("climaPromedio").ToString
                    lblEvProm.Text = ds.Tables(0).Rows(0)("evaluacionPromedio").ToString
                    lblDebProm.Text = ds.Tables(0).Rows(0)("deberesPromedio").ToString
                    lblAyudProm.Text = ds.Tables(0).Rows(0)("ayudantiasPromedio").ToString

                    lblEvGenDesv.Text = ds.Tables(0).Rows(0)("evaluacionGeneralDesvEst").ToString
                    lblPlamDesv.Text = ds.Tables(0).Rows(0)("planeacionDesvEst").ToString
                    lblMetDesv.Text = ds.Tables(0).Rows(0)("metodologiaDesvEst").ToString
                    lblContDesv.Text = ds.Tables(0).Rows(0)("contenidosDesvEst").ToString
                    lblClimDesv.Text = ds.Tables(0).Rows(0)("climaDesvEst").ToString
                    lblEvDesv.Text = ds.Tables(0).Rows(0)("evaluacionDesvEst").ToString
                    lblDebDesv.Text = ds.Tables(0).Rows(0)("deberesDesvEst").ToString
                    lblAyudDesv.Text = ds.Tables(0).Rows(0)("ayudantiasDesvEst").ToString

                    Try
                        conn.Open()
                        If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then
                            strSql = "select * from dbo.AnalisisEvaluacionNivel2_ResultadosCarrera('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + ddlFacultades.SelectedValue + "','" + ddlJornada.SelectedValue + "')"
                        Else
                            strSql = "select * from dbo.AnalisisEvaluacionNivel2_ResultadosCarrera('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + Session("FACULTAD") + "','" + ddlJornada.SelectedValue + "')"
                        End If

                        da = New SqlDataAdapter(strSql, conn)
                        da.Fill(dsResCarr)
                        conn.Close()

                        If (dsEstCarr.Tables(0).Rows.Count > 0) Then
                            For i As Integer = 0 To dsResCarr.Tables(0).Rows.Count - 1
                                Dim RowTable As New TableRow

                                Dim CellCodCarr As New TableCell
                                Dim CellEvGeneral As New TableCell
                                Dim CellPlaneacion As New TableCell
                                Dim CellMetodologia As New TableCell
                                Dim CellContenidos As New TableCell
                                Dim CellClima As New TableCell
                                Dim CellEvCurso As New TableCell
                                Dim CellDeberes As New TableCell
                                Dim CellAyudantias As New TableCell

                                CellCodCarr.Text = dsResCarr.Tables(0).Rows(i)("codCarr").ToString
                                CellEvGeneral.Text = dsResCarr.Tables(0).Rows(i)("evaluacionGeneral").ToString
                                CellPlaneacion.Text = dsResCarr.Tables(0).Rows(i)("planeacionCurso").ToString
                                CellMetodologia.Text = dsResCarr.Tables(0).Rows(i)("metodologiaEnsenanza").ToString
                                CellContenidos.Text = dsResCarr.Tables(0).Rows(i)("contenidosAsignaturas").ToString
                                CellClima.Text = dsResCarr.Tables(0).Rows(i)("climaEducativo").ToString
                                CellEvCurso.Text = dsResCarr.Tables(0).Rows(i)("evaluacionCurso").ToString
                                CellDeberes.Text = dsResCarr.Tables(0).Rows(i)("deberesDocentes").ToString
                                CellAyudantias.Text = dsResCarr.Tables(0).Rows(i)("ayudantias").ToString

                                RowTable.Cells.Add(CellCodCarr)
                                RowTable.Cells.Add(CellEvGeneral)
                                RowTable.Cells.Add(CellPlaneacion)
                                RowTable.Cells.Add(CellMetodologia)
                                RowTable.Cells.Add(CellContenidos)
                                RowTable.Cells.Add(CellClima)
                                RowTable.Cells.Add(CellEvCurso)
                                RowTable.Cells.Add(CellDeberes)
                                RowTable.Cells.Add(CellAyudantias)

                                tablaResultadosGeneralesCarreras.Rows.Add(RowTable)
                            Next
                        End If
                    Catch ex As Exception
                        'Response.Write(ex.Message)
                        Response.Write("Error al cargar la información")
                    Finally
                        conn.Close()
                    End Try
                    pnlResultadosGeneralesNivel2.Visible = True
                Else
                    pnlResultadosGeneralesNivel2.Visible = False
                End If
                estadisticasNivel2.Visible = True
            Catch ex As Exception
                'Response.Write(ex.Message)
                Response.Write("Error al cargar la información")
            Finally
                conn.Close()
            End Try
        End If
    End Sub
    Protected Sub cambiarColorDiur()
        tdDiurAlumMat.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdDiurCob.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdDiurDesv.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdDiurEncHec.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdDiurProm.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
    End Sub
    Protected Sub volverColorDiur()
        tdDiurAlumMat.Attributes.Remove("Style")
        tdDiurCob.Attributes.Remove("Style")
        tdDiurDesv.Attributes.Remove("Style")
        tdDiurEncHec.Attributes.Remove("Style")
        tdDiurProm.Attributes.Remove("Style")
    End Sub
    Protected Sub cambiarColorVesp()
        tdVespAlumMat.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdVespCob.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdVespDesv.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdVespEncHec.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdVespProm.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
    End Sub
    Protected Sub volverColorVesp()
        tdVespAlumMat.Attributes.Remove("Style")
        tdVespCob.Attributes.Remove("Style")
        tdVespDesv.Attributes.Remove("Style")
        tdVespEncHec.Attributes.Remove("Style")
        tdVespProm.Attributes.Remove("Style")
    End Sub

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
        cargarNivel2_pe()
    End Sub
    Protected Sub cargarNivel2_pe()
        Dim strSql As String
        Dim encuesta As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dsEstCarr As New DataSet
        Dim dsResCarr As New DataSet
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
        If ddlJornada_pe.SelectedIndex = 0 Then
            volverColorDiur_pe()
            volverColorVesp_pe()
        ElseIf ddlJornada_pe.SelectedIndex = 1 Then
            cambiarColorDiur_pe()
            volverColorVesp_pe()
        ElseIf ddlJornada_pe.SelectedIndex = 2 Then
            volverColorDiur_pe()
            cambiarColorVesp_pe()
        End If
        If encuesta <> "" Then
            Try
                conn.Open()
                If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then
                    If (ddlJornada_pe.SelectedIndex = 0) Then
                        strSql = "select * from dbo.[AnalisisEvaluacionNivel2PE]('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + ddlFacultades_pe.SelectedValue + "')"
                    Else
                        strSql = "select * from dbo.[AnalisisEvaluacionNivel2_FiltroJornadaPE]('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + ddlFacultades_pe.SelectedValue + "','" + ddlJornada_pe.SelectedValue + "')"
                    End If
                Else
                    If (ddlJornada_pe.SelectedIndex = 0) Then
                        strSql = "select * from dbo.[AnalisisEvaluacionNivel2PE]('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + Session("FACULTAD") + "')"
                    Else
                        strSql = "select * from dbo.[AnalisisEvaluacionNivel2_FiltroJornadaPE]('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + Session("FACULTAD") + "','" + ddlJornada_pe.SelectedValue + "')"
                    End If
                End If
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

                Try
                    conn.Open()
                    If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then
                        strSql = "select * from dbo.AnalisisEvaluacionNivel2_EstadisticasCarrerasPE('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + ddlFacultades_pe.SelectedValue + "','" + ddlJornada_pe.SelectedValue + "')"
                    Else
                        strSql = "select * from dbo.AnalisisEvaluacionNivel2_EstadisticasCarrerasPE('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + Session("FACULTAD") + "','" + ddlJornada_pe.SelectedValue + "')"
                    End If
                    da = New SqlDataAdapter(strSql, conn)
                    da.Fill(dsEstCarr)
                    conn.Close()

                    If (dsEstCarr.Tables(0).Rows.Count > 0) Then
                        For i As Integer = 0 To dsEstCarr.Tables(0).Rows.Count - 1
                            Dim RowTable As New TableRow

                            Dim CellCodCarr As New TableCell
                            Dim CellEncHech As New TableCell
                            Dim CellRutMat As New TableCell
                            Dim CellCobertura As New TableCell
                            Dim CellPromedio As New TableCell
                            Dim CellDesv As New TableCell


                            'Filtro VISUAL DE CARRERAS DESABILITADAS'

                            If dsEstCarr.Tables(0).Rows(i)("rutMatriculados").ToString <> "0" Then




                                CellCodCarr.Text = dsEstCarr.Tables(0).Rows(i)("codCarr").ToString
                                CellEncHech.Text = dsEstCarr.Tables(0).Rows(i)("NumerosEncuestasHechas").ToString
                                CellRutMat.Text = dsEstCarr.Tables(0).Rows(i)("rutMatriculados").ToString

                                CellRutMat.Text = dsEstCarr.Tables(0).Rows(i)("rutMatriculados").ToString

                                CellCobertura.Text = dsEstCarr.Tables(0).Rows(i)("coberturaProceso").ToString
                                CellPromedio.Text = dsEstCarr.Tables(0).Rows(i)("promedioGeneral").ToString
                                CellDesv.Text = dsEstCarr.Tables(0).Rows(i)("desviacionEstandar").ToString

                                RowTable.Cells.Add(CellCodCarr)
                                RowTable.Cells.Add(CellEncHech)
                                RowTable.Cells.Add(CellRutMat)
                                RowTable.Cells.Add(CellCobertura)
                                RowTable.Cells.Add(CellPromedio)
                                RowTable.Cells.Add(CellDesv)

                                tablaResultadosCarreras_pe.Rows.Add(RowTable)
                            End If
                        Next
                    End If
                Catch ex As Exception
                    'Response.Write(ex.Message)
                    Response.Write("Error al cargar la información")
                Finally
                    conn.Close()
                End Try
                If encuesta = "docEst" Or encuesta = "autoDoc" Then

                    lblEvGenProm_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralPromedio").ToString
                    lblPlanProm_pe.Text = ds.Tables(0).Rows(0)("planeacionPromedio").ToString
                    lblMetProm_pe.Text = ds.Tables(0).Rows(0)("metodologiaPromedio").ToString
                    lblContProm_pe.Text = ds.Tables(0).Rows(0)("contenidosPromedio").ToString
                    lblClimProm_pe.Text = ds.Tables(0).Rows(0)("climaPromedio").ToString
                    lblEvProm_pe.Text = ds.Tables(0).Rows(0)("evaluacionPromedio").ToString
                    lblDebProm_pe.Text = ds.Tables(0).Rows(0)("deberesPromedio").ToString
                    lblAyudProm_pe.Text = ds.Tables(0).Rows(0)("ayudantiasPromedio").ToString

                    lblEvGenDesv_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralDesvEst").ToString
                    lblPlamDesv_pe.Text = ds.Tables(0).Rows(0)("planeacionDesvEst").ToString
                    lblMetDesv_pe.Text = ds.Tables(0).Rows(0)("metodologiaDesvEst").ToString
                    lblContDesv_pe.Text = ds.Tables(0).Rows(0)("contenidosDesvEst").ToString
                    lblClimDesv_pe.Text = ds.Tables(0).Rows(0)("climaDesvEst").ToString
                    lblEvDesv_pe.Text = ds.Tables(0).Rows(0)("evaluacionDesvEst").ToString
                    lblDebDesv_pe.Text = ds.Tables(0).Rows(0)("deberesDesvEst").ToString
                    lblAyudDesv_pe.Text = ds.Tables(0).Rows(0)("ayudantiasDesvEst").ToString

                    Try
                        conn.Open()
                        If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then
                            strSql = "select * from dbo.AnalisisEvaluacionNivel2_ResultadosCarreraPE('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + ddlFacultades_pe.SelectedValue + "','" + ddlJornada_pe.SelectedValue + "')"
                        Else
                            strSql = "select * from dbo.AnalisisEvaluacionNivel2_ResultadosCarreraPE('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + Session("FACULTAD") + "','" + ddlJornada_pe.SelectedValue + "')"
                        End If

                        da = New SqlDataAdapter(strSql, conn)
                        da.Fill(dsResCarr)
                        conn.Close()

                        If (dsEstCarr.Tables(0).Rows.Count > 0) Then
                            For i As Integer = 0 To dsResCarr.Tables(0).Rows.Count - 1
                                Dim RowTable As New TableRow

                                Dim CellCodCarr As New TableCell
                                Dim CellEvGeneral As New TableCell
                                Dim CellPlaneacion As New TableCell
                                Dim CellMetodologia As New TableCell
                                Dim CellContenidos As New TableCell
                                Dim CellClima As New TableCell
                                Dim CellEvCurso As New TableCell
                                Dim CellDeberes As New TableCell
                                Dim CellAyudantias As New TableCell

                                CellCodCarr.Text = dsResCarr.Tables(0).Rows(i)("codCarr").ToString
                                CellEvGeneral.Text = dsResCarr.Tables(0).Rows(i)("evaluacionGeneral").ToString
                                CellPlaneacion.Text = dsResCarr.Tables(0).Rows(i)("planeacionCurso").ToString
                                CellMetodologia.Text = dsResCarr.Tables(0).Rows(i)("metodologiaEnsenanza").ToString
                                CellContenidos.Text = dsResCarr.Tables(0).Rows(i)("contenidosAsignaturas").ToString
                                CellClima.Text = dsResCarr.Tables(0).Rows(i)("climaEducativo").ToString
                                CellEvCurso.Text = dsResCarr.Tables(0).Rows(i)("evaluacionCurso").ToString
                                CellDeberes.Text = dsResCarr.Tables(0).Rows(i)("deberesDocentes").ToString
                                CellAyudantias.Text = dsResCarr.Tables(0).Rows(i)("ayudantias").ToString

                                RowTable.Cells.Add(CellCodCarr)
                                RowTable.Cells.Add(CellEvGeneral)
                                RowTable.Cells.Add(CellPlaneacion)
                                RowTable.Cells.Add(CellMetodologia)
                                RowTable.Cells.Add(CellContenidos)
                                RowTable.Cells.Add(CellClima)
                                RowTable.Cells.Add(CellEvCurso)
                                RowTable.Cells.Add(CellDeberes)
                                RowTable.Cells.Add(CellAyudantias)

                                tablaResultadosGeneralesCarreras_pe.Rows.Add(RowTable)
                            Next
                        End If
                    Catch ex As Exception
                        'Response.Write(ex.Message)
                        Response.Write("Error al cargar la información")
                    Finally
                        conn.Close()
                    End Try
                    pnlResultadosGeneralesNivel2_pe.Visible = True
                Else
                    pnlResultadosGeneralesNivel2_pe.Visible = False
                End If
                estadisticasNivel2_pe.Visible = True
            Catch ex As Exception
                'Response.Write(ex.Message)
                Response.Write("Error al cargar la información")
            Finally
                conn.Close()
            End Try
        End If
    End Sub
    Protected Sub cambiarColorDiur_pe()
        tdDiurAlumMat_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdDiurCob_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdDiurDesv_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdDiurEncHec_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdDiurProm_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
    End Sub
    Protected Sub volverColorDiur_pe()
        tdDiurAlumMat_pe.Attributes.Remove("Style")
        tdDiurCob_pe.Attributes.Remove("Style")
        tdDiurDesv_pe.Attributes.Remove("Style")
        tdDiurEncHec_pe.Attributes.Remove("Style")
        tdDiurProm_pe.Attributes.Remove("Style")
    End Sub
    Protected Sub cambiarColorVesp_pe()
        tdVespAlumMat_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdVespCob_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdVespDesv_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdVespEncHec_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
        tdVespProm_pe.Attributes.Add("Style", "background-color:#7AC0DA;Color:#fff;font-weight:bold")
    End Sub
    Protected Sub volverColorVesp_pe()
        tdVespAlumMat_pe.Attributes.Remove("Style")
        tdVespCob_pe.Attributes.Remove("Style")
        tdVespDesv_pe.Attributes.Remove("Style")
        tdVespEncHec_pe.Attributes.Remove("Style")
        tdVespProm_pe.Attributes.Remove("Style")
    End Sub










End Class