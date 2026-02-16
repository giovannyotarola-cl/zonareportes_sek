Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
            If (Session("Nivel") <> "0" And Session("Nivel") <> "1") Then
                Response.Redirect("Default")
            End If
        End If
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        cargarNivel1()
    End Sub


    Protected Sub cargarNivel1()
        Dim strSql As String
        Dim encuesta As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
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
                If ddlJornada.SelectedIndex = 0 Then
                    strSql = "select * from dbo.[AnalisisEvaluacionNivel1]('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "')"
                Else
                    strSql = "select * from dbo.[AnalisisEvaluacionNivel1_FiltroJornada]('" + encuesta + "','" + ddlAno.SelectedValue + "','" + ddlSemestre.SelectedValue + "','" + ddlJornada.SelectedValue + "')"
                End If
                da = New SqlDataAdapter(strSql, conn)
                da.Fill(ds)

                lblNumEncHechasDiur.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasDiur").ToString
                lblNumEncHechasVesp.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasVesp").ToString
                lblNumEncHechasTotal.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasTotal").ToString

                lblAlumnMatriculadosDiur.Text = ds.Tables(0).Rows(0)("rutMatriculadosDiur").ToString
                lblAlumnMatriculadosVesp.Text = ds.Tables(0).Rows(0)("rutMatriculadosVesp").ToString
                lblAlumnMatriculadosTotal.Text = ds.Tables(0).Rows(0)("rutMatriculadosTotal").ToString

                lblCoberturaDiur.Text = ds.Tables(0).Rows(0)("coberturaProcesoDiur").ToString
                lblCoberturaVesp.Text = ds.Tables(0).Rows(0)("coberturaProcesoVesp").ToString
                lblCoberturaTotal.Text = ds.Tables(0).Rows(0)("coberturaProcesoTotal").ToString

                lblPromGeneralDiur.Text = ds.Tables(0).Rows(0)("promedioGeneralDiur").ToString
                lblPromGeneralVesp.Text = ds.Tables(0).Rows(0)("promedioGeneralVesp").ToString
                lblPromGeneralTotal.Text = ds.Tables(0).Rows(0)("promedioGeneralTotal").ToString

                lblDesviacionEstandarDiur.Text = ds.Tables(0).Rows(0)("desviacionEstandarDiur").ToString
                lblDesviacionEstandarVesp.Text = ds.Tables(0).Rows(0)("desviacionEstandarVesp").ToString
                lblDesviacionEstandarTotal.Text = ds.Tables(0).Rows(0)("desviacionEstandarTotal").ToString

                lblEncuestasHechasPCultural.Text = ds.Tables(0).Rows(0)("numeroEncuestasPCultural").ToString
                lblEncuestasHechasCSJuridicas.Text = ds.Tables(0).Rows(0)("numeroEncuestasCSJuridicas").ToString
                lblEncuestasHechasIngenieria.Text = ds.Tables(0).Rows(0)("numeroEncuestasIng").ToString
                lblEncuestasHechasSalud.Text = ds.Tables(0).Rows(0)("numeroEncuestasSalud").ToString
                lblEncuestasHechasTotal.Text = ds.Tables(0).Rows(0)("numeroEncuestasTotal").ToString

                lblAlumnosMatriculadosPCultural.Text = ds.Tables(0).Rows(0)("rutMatriculadosPcultural").ToString
                lblAlumnosMatriculadosCSJuridicas.Text = ds.Tables(0).Rows(0)("rutMatriculadosCSJuridicas").ToString
                lblAlumnosMatriculadosIngenieria.Text = ds.Tables(0).Rows(0)("rutMatriculadosIng").ToString
                lblAlumnosMatriculadosSalud.Text = ds.Tables(0).Rows(0)("rutMatriculadosSalud").ToString
                lblAlumnosMatriculadosTotal.Text = ds.Tables(0).Rows(0)("rutMatriculadosUniversidad").ToString

                lblPorcentajeCoberturaPCultural.Text = ds.Tables(0).Rows(0)("coberturaProcesoPCultural").ToString
                lblPorcentajeCoberturaCSJuridicas.Text = ds.Tables(0).Rows(0)("coberturaProcesoCSJuridicas").ToString
                lblPorcentajeCoberturaIngenieria.Text = ds.Tables(0).Rows(0)("coberturaProcesoIng").ToString
                lblPorcentajeCoberturaSalud.Text = ds.Tables(0).Rows(0)("coberturaProcesoSalud").ToString
                lblPorcentajeCoberturaTotal.Text = ds.Tables(0).Rows(0)("coberturaProcesoUniversidad").ToString

                lblPromedioGeneralPCultural.Text = ds.Tables(0).Rows(0)("promedioGeneralPCultural").ToString
                lblPromedioGeneralCSJuridicas.Text = ds.Tables(0).Rows(0)("promedioGeneralCSJuridicas").ToString
                lblPromedioGeneralIngenieria.Text = ds.Tables(0).Rows(0)("promedioGeneralIng").ToString
                lblPromedioGeneralSalud.Text = ds.Tables(0).Rows(0)("promedioGeneralSalud").ToString
                lblPromedioGeneralTotal.Text = ds.Tables(0).Rows(0)("promedioGeneralUniversidad").ToString

                lblDesviacionPCultural.Text = ds.Tables(0).Rows(0)("desviacionEstandarPCultural").ToString
                lblDesviacionCSJuridicas.Text = ds.Tables(0).Rows(0)("desviacionEstandarCSJuridicas").ToString
                lblDesviacionIngenieria.Text = ds.Tables(0).Rows(0)("desviacionEstandarIng").ToString
                lblDesviacionSalud.Text = ds.Tables(0).Rows(0)("desviacionEstandarSalud").ToString
                lblDesviacionTotal.Text = ds.Tables(0).Rows(0)("desviacionEstandarUniversidad").ToString

                If encuesta = "docEst" Or encuesta = "autoDoc" Then
                    lblEvaluacionGeneralProm.Text = ds.Tables(0).Rows(0)("evaluacionGeneralProm").ToString
                    lblPlaneacionProm.Text = ds.Tables(0).Rows(0)("planeacionCursoProm").ToString
                    lblMetodologiaProm.Text = ds.Tables(0).Rows(0)("metodologiaEnsenanzaProm").ToString
                    lblContenidoProm.Text = ds.Tables(0).Rows(0)("contenidoProm").ToString
                    lblClimaProm.Text = ds.Tables(0).Rows(0)("climaProm").ToString
                    lblEvaluacionProm.Text = ds.Tables(0).Rows(0)("evaluacionCursoProm").ToString
                    lblDeberesProm.Text = ds.Tables(0).Rows(0)("deberesProm").ToString
                    lblAyudantiasProm.Text = ds.Tables(0).Rows(0)("ayudantiasProm").ToString

                    lblEvaluacionGeneralDesv.Text = ds.Tables(0).Rows(0)("evaluacionGeneralDesv").ToString
                    lblPlaneacionDesv.Text = ds.Tables(0).Rows(0)("planeacionCursoDesv").ToString
                    lblMetodologiaDesv.Text = ds.Tables(0).Rows(0)("metodologiaEnsenanzaDesv").ToString
                    lblContenidoDesv.Text = ds.Tables(0).Rows(0)("contenidoDesv").ToString
                    lblClimaDesv.Text = ds.Tables(0).Rows(0)("climaDesv").ToString
                    lblEvaluacionDesv.Text = ds.Tables(0).Rows(0)("evaluacionCursoDesv").ToString
                    lblDeberesDesv.Text = ds.Tables(0).Rows(0)("deberesDesv").ToString
                    lblAyudantiasDesv.Text = ds.Tables(0).Rows(0)("ayudantiasDesv").ToString

                    lblEvaluacionPCultural.Text = ds.Tables(0).Rows(0)("evaluacionGeneralPCultural").ToString
                    lblEvaluacionCSJuridicas.Text = ds.Tables(0).Rows(0)("evaluacionGeneralCSJuridicas").ToString
                    lblEvaluacionIngenieria.Text = ds.Tables(0).Rows(0)("evaluacionGeneralIng").ToString
                    lblEvaluacionSalud.Text = ds.Tables(0).Rows(0)("evaluacionGeneralSalud").ToString
                    lblEvaluacionUniversidad.Text = ds.Tables(0).Rows(0)("evaluacionGeneralUniversidad").ToString

                    lblPlaneacionPCultural.Text = ds.Tables(0).Rows(0)("planeacionPCultural").ToString
                    lblPlaneacionCSJuridicas.Text = ds.Tables(0).Rows(0)("planeacionCSJuridicas").ToString
                    lblPlaneacionIngenieria.Text = ds.Tables(0).Rows(0)("planeacionIng").ToString
                    lblPlaneacionSalud.Text = ds.Tables(0).Rows(0)("planeacionSalud").ToString
                    lblPlaneacionUniversidad.Text = ds.Tables(0).Rows(0)("planeacionUniversidad").ToString

                    lblMetodologiaPCultural.Text = ds.Tables(0).Rows(0)("metodologiaPCultural").ToString
                    lblMetodologiaCSJuridicas.Text = ds.Tables(0).Rows(0)("metodologiaCSJuridicas").ToString
                    lblMetodologiaIngenieria.Text = ds.Tables(0).Rows(0)("metodologiaIng").ToString
                    lblMetodologiaSalud.Text = ds.Tables(0).Rows(0)("metodologiaSalud").ToString
                    lblMetodologiaUniversidad.Text = ds.Tables(0).Rows(0)("metodologiaUniversidad").ToString

                    lblContenidoPCultural.Text = ds.Tables(0).Rows(0)("contenidosPCultural").ToString
                    lblContenidoCSJuridicas.Text = ds.Tables(0).Rows(0)("contenidosCSJuridicas").ToString
                    lblContenidoIngenieria.Text = ds.Tables(0).Rows(0)("contenidosIng").ToString
                    lblContenidoSalud.Text = ds.Tables(0).Rows(0)("contenidosSalud").ToString
                    lblContenidoUniversidad.Text = ds.Tables(0).Rows(0)("contenidosUniversidad").ToString

                    lblClimaPCultural.Text = ds.Tables(0).Rows(0)("climaPCultural").ToString
                    lblClimaCSJuridicas.Text = ds.Tables(0).Rows(0)("climaCSJuridicas").ToString
                    lblClimaIngenieria.Text = ds.Tables(0).Rows(0)("climaIng").ToString
                    lblClimaSalud.Text = ds.Tables(0).Rows(0)("climaSalud").ToString
                    lblClimaUniversidad.Text = ds.Tables(0).Rows(0)("climaUniversidad").ToString

                    lblEvaluacionCursoPCultural.Text = ds.Tables(0).Rows(0)("evaluacionPCultural").ToString
                    lblEvaluacionCursoCSJuridicas.Text = ds.Tables(0).Rows(0)("evaluacionCSJuridicas").ToString
                    lblEvaluacionCursoIngenieria.Text = ds.Tables(0).Rows(0)("evaluacionIng").ToString
                    lblEvaluacionCursoSalud.Text = ds.Tables(0).Rows(0)("evaluacionSalud").ToString
                    lblEvaluacionCursoUniversidad.Text = ds.Tables(0).Rows(0)("evaluacionUniversidad").ToString

                    lblDeberesPCultural.Text = ds.Tables(0).Rows(0)("deberesPCultural").ToString
                    lblDeberesCSJuridicas.Text = ds.Tables(0).Rows(0)("deberesCSJuridicas").ToString
                    lblDeberesIngenieria.Text = ds.Tables(0).Rows(0)("deberesIng").ToString
                    lblDeberesSalud.Text = ds.Tables(0).Rows(0)("deberesSalud").ToString
                    lblDeberesUniversidad.Text = ds.Tables(0).Rows(0)("deberesUniversidad").ToString

                    lblAyudantiasPCultural.Text = ds.Tables(0).Rows(0)("ayudantiasPCultural").ToString
                    lblAyudantiasCSJuridicas.Text = ds.Tables(0).Rows(0)("ayudantiasCSJuridicas").ToString
                    lblAyudantiasIngenieria.Text = ds.Tables(0).Rows(0)("ayudantiasIng").ToString
                    lblAyudantiasSalud.Text = ds.Tables(0).Rows(0)("ayudantiasSalud").ToString
                    lblAyudantiasUniversidad.Text = ds.Tables(0).Rows(0)("ayudantiasUniversidad").ToString

                    pnlResultadosGeneralesNivel1.Visible = True
                Else
                    pnlResultadosGeneralesNivel1.Visible = False
                End If
                estadisticasNivel1.Visible = True
            Catch ex As Exception
                Response.Write(ex.Message)
                Response.Write(strSql)
                'Response.Write("Error al cargar información")
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
        cargarNivel1_pe()

    End Sub


    Protected Sub cargarNivel1_pe()
        Dim strSql As String
        Dim encuesta As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
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
                If ddlJornada_pe.SelectedIndex = 0 Then
                    strSql = "select * from dbo.[AnalisisEvaluacionNivel1PE]('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "')"
                Else
                    strSql = "select * from dbo.[AnalisisEvaluacionNivel1_FiltroJornadaPE]('" + encuesta + "','" + ddlAno_pe.SelectedValue + "','" + ddlSemestre_pe.SelectedValue + "','" + ddlJornada_pe.SelectedValue + "')"
                End If
                da = New SqlDataAdapter(strSql, conn)
                da.Fill(ds)

                'lblNumEncHechasDiur_pe.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasDiur").ToString
                'lblNumEncHechasVesp_pe.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasVesp").ToString
                lblNumEncHechasTotal_pe.Text = ds.Tables(0).Rows(0)("numerosEncuestrasHechasTotal").ToString

                'lblAlumnMatriculadosDiur_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosDiur").ToString
                'lblAlumnMatriculadosVesp_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosVesp").ToString
                lblAlumnMatriculadosTotal_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosTotal").ToString

                'lblCoberturaDiur_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoDiur").ToString
                'lblCoberturaVesp_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoVesp").ToString
                lblCoberturaTotal_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoTotal").ToString

                'lblPromGeneralDiur_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralDiur").ToString
                'lblPromGeneralVesp_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralVesp").ToString
                lblPromGeneralTotal_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralTotal").ToString

                'lblDesviacionEstandarDiur_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarDiur").ToString
                'lblDesviacionEstandarVesp_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarVesp").ToString
                lblDesviacionEstandarTotal_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarTotal").ToString

                lblEncuestasHechasPCultural_pe.Text = ds.Tables(0).Rows(0)("numeroEncuestasPCultural").ToString
                lblEncuestasHechasElectivos_pe.Text = ds.Tables(0).Rows(0)("numeroEncuestaElectivos").ToString
                lblEncuestasHechasCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("numeroEncuestasCSJuridicas").ToString
                lblEncuestasHechasIngenieria_pe.Text = ds.Tables(0).Rows(0)("numeroEncuestasIng").ToString
                lblEncuestasHechasSalud_pe.Text = ds.Tables(0).Rows(0)("numeroEncuestasSalud").ToString
                lblEncuestasHechasTotal_pe.Text = ds.Tables(0).Rows(0)("numeroEncuestasTotal").ToString

                lblAlumnosMatriculadosPCultural_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosPcultural").ToString
                lblAlumnosMatriculadosElectivos_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosElectivos").ToString
                lblAlumnosMatriculadosCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosCSJuridicas").ToString
                lblAlumnosMatriculadosIngenieria_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosIng").ToString
                lblAlumnosMatriculadosSalud_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosSalud").ToString
                lblAlumnosMatriculadosTotal_pe.Text = ds.Tables(0).Rows(0)("rutMatriculadosUniversidad").ToString

                lblPorcentajeCoberturaPCultural_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoPCultural").ToString
                lblPorcentajeCoberturaElectivos_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoElectivos").ToString
                lblPorcentajeCoberturaCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoCSJuridicas").ToString
                lblPorcentajeCoberturaIngenieria_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoIng").ToString
                lblPorcentajeCoberturaSalud_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoSalud").ToString
                lblPorcentajeCoberturaTotal_pe.Text = ds.Tables(0).Rows(0)("coberturaProcesoUniversidad").ToString

                lblPromedioGeneralPCultural_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralPCultural").ToString
                lblPromedioGeneralElectivos_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralElectivos").ToString
                lblPromedioGeneralCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralCSJuridicas").ToString
                lblPromedioGeneralIngenieria_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralIng").ToString
                lblPromedioGeneralSalud_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralSalud").ToString
                lblPromedioGeneralTotal_pe.Text = ds.Tables(0).Rows(0)("promedioGeneralUniversidad").ToString

                lblDesviacionPCultural_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarPCultural").ToString
                lblDesviacionElectivos_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarElectivos").ToString
                lblDesviacionCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarCSJuridicas").ToString
                lblDesviacionIngenieria_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarIng").ToString
                lblDesviacionSalud_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarSalud").ToString
                lblDesviacionTotal_pe.Text = ds.Tables(0).Rows(0)("desviacionEstandarUniversidad").ToString

                If encuesta = "docEst" Or encuesta = "autoDoc" Then
                    lblEvaluacionGeneralProm_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralProm").ToString
                    lblPlaneacionProm_pe.Text = ds.Tables(0).Rows(0)("planeacionCursoProm").ToString
                    lblMetodologiaProm_pe.Text = ds.Tables(0).Rows(0)("metodologiaEnsenanzaProm").ToString
                    lblContenidoProm_pe.Text = ds.Tables(0).Rows(0)("contenidoProm").ToString
                    lblClimaProm_pe.Text = ds.Tables(0).Rows(0)("climaProm").ToString
                    lblEvaluacionProm_pe.Text = ds.Tables(0).Rows(0)("evaluacionCursoProm").ToString
                    lblDeberesProm_pe.Text = ds.Tables(0).Rows(0)("deberesProm").ToString
                    lblAyudantiasProm_pe.Text = ds.Tables(0).Rows(0)("ayudantiasProm").ToString

                    lblEvaluacionGeneralDesv_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralDesv").ToString
                    lblPlaneacionDesv_pe.Text = ds.Tables(0).Rows(0)("planeacionCursoDesv").ToString
                    lblMetodologiaDesv_pe.Text = ds.Tables(0).Rows(0)("metodologiaEnsenanzaDesv").ToString
                    lblContenidoDesv_pe.Text = ds.Tables(0).Rows(0)("contenidoDesv").ToString
                    lblClimaDesv_pe.Text = ds.Tables(0).Rows(0)("climaDesv").ToString
                    lblEvaluacionDesv_pe.Text = ds.Tables(0).Rows(0)("evaluacionCursoDesv").ToString
                    lblDeberesDesv_pe.Text = ds.Tables(0).Rows(0)("deberesDesv").ToString
                    lblAyudantiasDesv_pe.Text = ds.Tables(0).Rows(0)("ayudantiasDesv").ToString

                    lblEvaluacionPCultural_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralPCultural").ToString
                    lblEvaluacionElectivo_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralElectivos").ToString
                    lblEvaluacionCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralCSJuridicas").ToString
                    lblEvaluacionIngenieria_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralIng").ToString
                    lblEvaluacionSalud_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralSalud").ToString
                    lblEvaluacionUniversidad_pe.Text = ds.Tables(0).Rows(0)("evaluacionGeneralUniversidad").ToString

                    lblPlaneacionPCultural_pe.Text = ds.Tables(0).Rows(0)("planeacionPCultural").ToString
                    lblPlaneacionElectivo_pe.Text = ds.Tables(0).Rows(0)("planeacionElectivos").ToString
                    lblPlaneacionCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("planeacionCSJuridicas").ToString
                    lblPlaneacionIngenieria_pe.Text = ds.Tables(0).Rows(0)("planeacionIng").ToString
                    lblPlaneacionSalud_pe.Text = ds.Tables(0).Rows(0)("planeacionSalud").ToString
                    lblPlaneacionUniversidad_pe.Text = ds.Tables(0).Rows(0)("planeacionUniversidad").ToString

                    lblMetodologiaPCultural_pe.Text = ds.Tables(0).Rows(0)("metodologiaPCultural").ToString
                    lblMetodologiaElectivo_pe.Text = ds.Tables(0).Rows(0)("metodologiaElectivos").ToString
                    lblMetodologiaCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("metodologiaCSJuridicas").ToString
                    lblMetodologiaIngenieria_pe.Text = ds.Tables(0).Rows(0)("metodologiaIng").ToString
                    lblMetodologiaSalud_pe.Text = ds.Tables(0).Rows(0)("metodologiaSalud").ToString
                    lblMetodologiaUniversidad_pe.Text = ds.Tables(0).Rows(0)("metodologiaUniversidad").ToString

                    lblContenidoPCultural_pe.Text = ds.Tables(0).Rows(0)("contenidosPCultural").ToString
                    lblContenidoElectivo_pe.Text = ds.Tables(0).Rows(0)("contenidosElectivos").ToString
                    lblContenidoCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("contenidosCSJuridicas").ToString
                    lblContenidoIngenieria_pe.Text = ds.Tables(0).Rows(0)("contenidosIng").ToString
                    lblContenidoSalud_pe.Text = ds.Tables(0).Rows(0)("contenidosSalud").ToString
                    lblContenidoUniversidad_pe.Text = ds.Tables(0).Rows(0)("contenidosUniversidad").ToString

                    lblClimaPCultural_pe.Text = ds.Tables(0).Rows(0)("climaPCultural").ToString
                    lblClimaElectivo_pe.Text = ds.Tables(0).Rows(0)("climaElectivos").ToString
                    lblClimaCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("climaCSJuridicas").ToString
                    lblClimaIngenieria_pe.Text = ds.Tables(0).Rows(0)("climaIng").ToString
                    lblClimaSalud_pe.Text = ds.Tables(0).Rows(0)("climaSalud").ToString
                    lblClimaUniversidad_pe.Text = ds.Tables(0).Rows(0)("climaUniversidad").ToString

                    lblEvaluacionCursoPCultural_pe.Text = ds.Tables(0).Rows(0)("evaluacionPCultural").ToString
                    lblEvaluacionCursoElectivo_pe.Text = ds.Tables(0).Rows(0)("evaluacionElectivos").ToString
                    lblEvaluacionCursoCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("evaluacionCSJuridicas").ToString
                    lblEvaluacionCursoIngenieria_pe.Text = ds.Tables(0).Rows(0)("evaluacionIng").ToString
                    lblEvaluacionCursoSalud_pe.Text = ds.Tables(0).Rows(0)("evaluacionSalud").ToString
                    lblEvaluacionCursoUniversidad_pe.Text = ds.Tables(0).Rows(0)("evaluacionUniversidad").ToString

                    lblDeberesPCultural_pe.Text = ds.Tables(0).Rows(0)("deberesPCultural").ToString
                    lblDeberesElectivo_pe.Text = ds.Tables(0).Rows(0)("deberesElectivos").ToString
                    lblDeberesCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("deberesCSJuridicas").ToString
                    lblDeberesIngenieria_pe.Text = ds.Tables(0).Rows(0)("deberesIng").ToString
                    lblDeberesSalud_pe.Text = ds.Tables(0).Rows(0)("deberesSalud").ToString
                    lblDeberesUniversidad_pe.Text = ds.Tables(0).Rows(0)("deberesUniversidad").ToString

                    lblAyudantiasPCultural_pe.Text = ds.Tables(0).Rows(0)("ayudantiasPCultural").ToString
                    lblAyudantiasElectivo_pe.Text = ds.Tables(0).Rows(0)("ayudantiasElectivos").ToString
                    lblAyudantiasCSJuridicas_pe.Text = ds.Tables(0).Rows(0)("ayudantiasCSJuridicas").ToString
                    lblAyudantiasIngenieria_pe.Text = ds.Tables(0).Rows(0)("ayudantiasIng").ToString
                    lblAyudantiasSalud_pe.Text = ds.Tables(0).Rows(0)("ayudantiasSalud").ToString
                    lblAyudantiasUniversidad_pe.Text = ds.Tables(0).Rows(0)("ayudantiasUniversidad").ToString

                    pnlResultadosGeneralesNivel1_pe.Visible = True
                Else
                    pnlResultadosGeneralesNivel1_pe.Visible = False
                End If
                estadisticasNivel1_pe.Visible = True
            Catch ex As Exception
                Response.Write(ex.Message)
                Response.Write(strSql)
                'Response.Write("Error al cargar información")
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