Imports System.Data.SqlClient
Imports System.Data

Partial Class mostrarEvEstudianteDocente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("usuario") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
            cargarEncuestaProfe()
        End If
    End Sub
    Protected Sub cargarEncuestaProfe()
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim ds2 As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim asignatura As String = Request.QueryString("ASIGNATURA")
        Dim profesor As String = Request.QueryString("PROFESOR")
        Dim ano As String = Request.QueryString("ANO")
        Dim periodo As String = Request.QueryString("PERIODO")
        Dim carrera As String = Request.QueryString("CARRERA")
        'Elementos por Función
        Dim nomCarrera As String = Funciones.getNombreCarrera(carrera)
        Dim nomProfesor As String = Funciones.getNombreProfesor(profesor)
        Dim nomAsignatura As String = Funciones.getNombreAsignatura(asignatura)

        'Encabezado
        lblCarrera.Text = nomCarrera
        lblCodAsignatura.Text = asignatura
        lblNomASignatura.Text = nomAsignatura
        lblNomProf.Text = nomProfesor

        Dim decimales As Integer = 4

        Dim strSql As String = "SELECT AVG(CAST(P1 AS DECIMAL)) AS P1,AVG(CAST(P2 AS DECIMAL)) AS P2,AVG(CAST(P3 AS DECIMAL)) AS P3,AVG(CAST(P4 AS DECIMAL)) AS P4,AVG(CAST(P5 AS DECIMAL)) AS P5,AVG(CAST(P6 AS DECIMAL)) AS P6,AVG(CAST(P7 AS DECIMAL)) AS P7,AVG(CAST(P8 AS DECIMAL)) AS P8,AVG(CAST(P9 AS DECIMAL)) AS P9,AVG(CAST(P10 AS DECIMAL)) AS P10,AVG(CAST(P11 AS DECIMAL)) AS P11,AVG(CAST(P12 AS DECIMAL)) AS P12,AVG(CAST(P13 AS DECIMAL)) AS P13,AVG(CAST(P14 AS DECIMAL)) AS P14,AVG(CAST(P15 AS DECIMAL)) AS P15,AVG(CAST(P16 AS DECIMAL)) AS P16,AVG(CAST(P17 AS DECIMAL)) AS P17,AVG(CAST(P18 AS DECIMAL)) AS P18,AVG(CAST(P19 AS DECIMAL)) AS P19,AVG(CAST(P20 AS DECIMAL)) AS P20,AVG(CAST(P21 AS DECIMAL)) AS P21,AVG(CAST(P22 AS DECIMAL)) AS P22,AVG(CAST(P23 AS DECIMAL)) AS P23,AVG((CAST(P1 AS DECIMAL)+CAST(P2 AS DECIMAL)+CAST(P3 AS DECIMAL)+CAST(P4 AS DECIMAL)+CAST(P5 AS DECIMAL))/5) AS PromEvaluacionAdministrativa,AVG((CAST(P6 AS DECIMAL)+CAST(P7 AS DECIMAL)+CAST(P8 AS DECIMAL)+CAST(P9 AS DECIMAL)+CAST(P10 AS DECIMAL))/5) AS PromPlaneacion,AVG((CAST(P11 AS DECIMAL)+CAST(P12 AS DECIMAL)+CAST(P13 AS DECIMAL)+CAST(P15 AS DECIMAL)+CAST(P15 AS DECIMAL))/5) AS PromMetodologia,AVG((CAST(P16 AS DECIMAL)+CAST(P17 AS DECIMAL)+CAST(P18 AS DECIMAL)+CAST(P19 AS DECIMAL))/4) AS PromClima,AVG((CAST(P20 AS DECIMAL)+CAST(P21 AS DECIMAL)+CAST(P22 AS DECIMAL)+CAST(P23 AS DECIMAL))/4) AS PromEvaluacion FROM dbo.EN_jefecarrera WHERE  CODPROFESOR='" + profesor + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "' AND CODRAMO='" + asignatura + "'"
        
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            If ds.Tables(0).Rows.Count > 0 Then
                lblEvaluacion1.Text = Mid(ds.Tables(0).Rows(0)("p1").ToString(), 1, decimales)
                lblEvaluacion2.Text = Mid(ds.Tables(0).Rows(0)("p2").ToString(), 1, decimales)
                lblEvaluacion3.Text = Mid(ds.Tables(0).Rows(0)("p3").ToString(), 1, decimales)
                lblEvaluacion4.Text = Mid(ds.Tables(0).Rows(0)("p4").ToString(), 1, decimales)
                lblEvaluacion5.Text = Mid(ds.Tables(0).Rows(0)("p5").ToString(), 1, decimales)

                lblPlaneacion1.Text = Mid(ds.Tables(0).Rows(0)("p6").ToString(), 1, decimales)
                lblPlaneacion2.Text = Mid(ds.Tables(0).Rows(0)("p7").ToString(), 1, decimales)
                lblPlaneacion3.Text = Mid(ds.Tables(0).Rows(0)("p8").ToString(), 1, decimales)
                lblPlaneacion4.Text = Mid(ds.Tables(0).Rows(0)("p9").ToString(), 1, decimales)
                lblPlaneacion5.Text = Mid(ds.Tables(0).Rows(0)("p10").ToString(), 1, decimales)

                lblMetodologia1.Text = Mid(ds.Tables(0).Rows(0)("p11").ToString(), 1, decimales)
                lblMetodologia2.Text = Mid(ds.Tables(0).Rows(0)("p12").ToString(), 1, decimales)
                lblMetodologia3.Text = Mid(ds.Tables(0).Rows(0)("p13").ToString(), 1, decimales)
                lblMetodologia4.Text = Mid(ds.Tables(0).Rows(0)("p14").ToString(), 1, decimales)
                lblMetodologia5.Text = Mid(ds.Tables(0).Rows(0)("p15").ToString(), 1, decimales)

                lblClima1.Text = Mid(ds.Tables(0).Rows(0)("p16").ToString(), 1, decimales)
                lblClima2.Text = Mid(ds.Tables(0).Rows(0)("p17").ToString(), 1, decimales)
                lblClima3.Text = Mid(ds.Tables(0).Rows(0)("p18").ToString(), 1, decimales)
                lblClima4.Text = Mid(ds.Tables(0).Rows(0)("p19").ToString(), 1, decimales)

                lblEval1.Text = Mid(ds.Tables(0).Rows(0)("p20").ToString(), 1, decimales)
                lblEval2.Text = Mid(ds.Tables(0).Rows(0)("p21").ToString(), 1, decimales)
                lblEval3.Text = Mid(ds.Tables(0).Rows(0)("p22").ToString(), 1, decimales)
                lblEval4.Text = Mid(ds.Tables(0).Rows(0)("p23").ToString(), 1, decimales)

                lblPromEvaluacionAdminitrativa.Text = Mid(ds.Tables(0).Rows(0)("PromEvaluacionAdministrativa").ToString(), 1, decimales)
                lblPromPlaneacion.Text = Mid(ds.Tables(0).Rows(0)("PromPlaneacion").ToString(), 1, decimales)
                lblPromMetodologia.Text = Mid(ds.Tables(0).Rows(0)("PromMetodologia").ToString(), 1, decimales)
                lblPromClima.Text = Mid(ds.Tables(0).Rows(0)("PromClima").ToString(), 1, decimales)
                lblPromEvaluacion.Text = Mid(ds.Tables(0).Rows(0)("PromEvaluacion").ToString(), 1, decimales)
            Else
                Response.Redirect("Default")
            End If
        Catch ex As Exception
            'Response.Write(ex.Message)
            Response.Write("Error al cargar datos del profesor")
        Finally
            conn.Close()
        End Try

        strSql = "SELECT AVG(CAST(P1 AS DECIMAL)) AS P1,AVG(CAST(P2 AS DECIMAL)) AS P2,AVG(CAST(P3 AS DECIMAL)) AS P3,AVG(CAST(P4 AS DECIMAL)) AS P4,AVG(CAST(P5 AS DECIMAL)) AS P5,AVG(CAST(P6 AS DECIMAL)) AS P6,AVG(CAST(P7 AS DECIMAL)) AS P7,AVG(CAST(P8 AS DECIMAL)) AS P8,AVG(CAST(P9 AS DECIMAL)) AS P9,AVG(CAST(P10 AS DECIMAL)) AS P10,AVG(CAST(P11 AS DECIMAL)) AS P11,AVG(CAST(P12 AS DECIMAL)) AS P12,AVG(CAST(P13 AS DECIMAL)) AS P13,AVG(CAST(P14 AS DECIMAL)) AS P14,AVG(CAST(P15 AS DECIMAL)) AS P15,AVG(CAST(P16 AS DECIMAL)) AS P16,AVG(CAST(P17 AS DECIMAL)) AS P17,AVG(CAST(P18 AS DECIMAL)) AS P18,AVG(CAST(P19 AS DECIMAL)) AS P19,AVG(CAST(P20 AS DECIMAL)) AS P20,AVG(CAST(P21 AS DECIMAL)) AS P21,AVG(CAST(P22 AS DECIMAL)) AS P22,AVG(CAST(P23 AS DECIMAL)) AS P23,AVG((CAST(P1 AS DECIMAL)+CAST(P2 AS DECIMAL)+CAST(P3 AS DECIMAL)+CAST(P4 AS DECIMAL)+CAST(P5 AS DECIMAL))/5) AS PromEvaluacionAdministrativa,AVG((CAST(P6 AS DECIMAL)+CAST(P7 AS DECIMAL)+CAST(P8 AS DECIMAL)+CAST(P9 AS DECIMAL)+CAST(P10 AS DECIMAL))/5) AS PromPlaneacion,AVG((CAST(P11 AS DECIMAL)+CAST(P12 AS DECIMAL)+CAST(P13 AS DECIMAL)+CAST(P15 AS DECIMAL)+CAST(P15 AS DECIMAL))/5) AS PromMetodologia,AVG((CAST(P16 AS DECIMAL)+CAST(P17 AS DECIMAL)+CAST(P18 AS DECIMAL)+CAST(P19 AS DECIMAL))/4) AS PromClima,AVG((CAST(P20 AS DECIMAL)+CAST(P21 AS DECIMAL)+CAST(P22 AS DECIMAL)+CAST(P23 AS DECIMAL))/4) AS PromEvaluacion FROM dbo.EN_jefecarrera WHERE  CODCARRERA='" + carrera + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds2)

            If ds.Tables(0).Rows.Count > 0 Then
                lblEvaluacion1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p1").ToString(), 1, decimales)
                lblEvaluacion2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p2").ToString(), 1, decimales)
                lblEvaluacion3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p3").ToString(), 1, decimales)
                lblEvaluacion4Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p4").ToString(), 1, decimales)
                lblEvaluacion5Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p5").ToString(), 1, decimales)

                lblPlaneacion1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p6").ToString(), 1, decimales)
                lblPlaneacion2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p7").ToString(), 1, decimales)
                lblPlaneacion3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p8").ToString(), 1, decimales)
                lblPlaneacion4Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p9").ToString(), 1, decimales)
                lblPlaneacion5Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p10").ToString(), 1, decimales)

                lblMetodologia1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p11").ToString(), 1, decimales)
                lblMetodologia2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p12").ToString(), 1, decimales)
                lblMetodologia3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p13").ToString(), 1, decimales)
                lblMetodologia4Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p14").ToString(), 1, decimales)
                lblMetodologia5Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p15").ToString(), 1, decimales)

                lblClima1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p16").ToString(), 1, decimales)
                lblClima2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p17").ToString(), 1, decimales)
                lblClima3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p18").ToString(), 1, decimales)
                lblClima4Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p19").ToString(), 1, decimales)

                lblEval1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p20").ToString(), 1, decimales)
                lblEval2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p21").ToString(), 1, decimales)
                lblEval3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p22").ToString(), 1, decimales)
                lblEval4Carrera.Text = Mid(ds2.Tables(0).Rows(0)("p23").ToString(), 1, decimales)

                lblPromEvaluacionAdminitrativaCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromEvaluacionAdministrativa").ToString(), 1, decimales)
                lblPromPlaneacionCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromPlaneacion").ToString(), 1, decimales)
                lblPromMetodologiaCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromMetodologia").ToString(), 1, decimales)
                lblPromClimaCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromClima").ToString(), 1, decimales)
                lblPromEvaluacionCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromEvaluacion").ToString(), 1, decimales)
            Else
                Response.Redirect("Default")
            End If
        Catch ex As Exception
            'Response.Write(ex.Message)
            Response.Write("Error al cargar datos de la carrera")
        Finally
            conn.Close()
        End Try
    End Sub
End Class
