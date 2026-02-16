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
        Dim seccion As String = Request.QueryString("SECCION")
        Dim carrera As String = Request.QueryString("CARRERA")

        Dim nomCarrera As String = Funciones.getNombreCarrera(carrera)
        Dim nomProfesor As String = Funciones.getNombreProfesor(profesor)
        Dim nomAsignatura As String = Funciones.getNombreAsignatura(asignatura)

        'Valores Totales
        lblEncHechas.Text = encuestasHechas(ano, periodo, profesor, asignatura, seccion)
        lblEncTotal.Text = encuestasPorHacer(ano, periodo, profesor, asignatura, seccion)

        'Encabezado
        lblCarrera.Text = nomCarrera
        lblCodAsignatura.Text = asignatura
        lblNomASignatura.Text = nomAsignatura
        lblNomProf.Text = nomProfesor
        lblSeccion.Text = seccion

        Dim decimales As Integer = 4

        Dim strSql As String = "SELECT AVG(CAST(P1 AS DECIMAL)) AS P1,AVG(CAST(P2 AS DECIMAL)) AS P2,AVG(CAST(P3 AS DECIMAL)) AS P3,AVG(CAST(P4 AS DECIMAL)) AS P4,AVG(CAST(P5 AS DECIMAL)) AS P5,AVG(CAST(P6 AS DECIMAL)) AS P6,AVG(CAST(P7 AS DECIMAL)) AS P7,AVG(CAST(P8 AS DECIMAL)) AS P8,AVG(CAST(P9 AS DECIMAL)) AS P9,AVG(CAST(P10 AS DECIMAL)) AS P10,AVG(CAST(P11 AS DECIMAL)) AS P11,AVG(CAST(P12 AS DECIMAL)) AS P12,AVG(CAST(P13 AS DECIMAL)) AS P13,AVG(CAST(P14 AS DECIMAL)) AS P14,AVG(CAST(P15 AS DECIMAL)) AS P15,AVG(CAST(P16 AS DECIMAL)) AS P16,AVG(CAST(P17 AS DECIMAL)) AS P17,AVG(CAST(P18 AS DECIMAL)) AS P18,AVG(CAST(P19 AS DECIMAL)) AS P19,AVG(CAST(P20 AS DECIMAL)) AS P20,AVG(CAST(P21 AS DECIMAL)) AS P21,AVG(CAST(P22 AS DECIMAL)) AS P22,AVG((CAST(P1 AS DECIMAL)+CAST(P2 AS DECIMAL))/2) AS PromPlaneacion,AVG((CAST(P3 AS DECIMAL)+CAST(P4 AS DECIMAL)+CAST(P5 AS DECIMAL))/3) AS PromMetodologia,AVG((CAST(P6 AS DECIMAL)+CAST(P7 AS DECIMAL)+CAST(P8 AS DECIMAL)+CAST(P9 AS DECIMAL))/4) AS PromContenidos,AVG((CAST(P10 AS DECIMAL)+CAST(P11 AS DECIMAL)+CAST(P12 AS DECIMAL))/3) AS PromClima,AVG((CAST(P13 AS DECIMAL)+CAST(P14 AS DECIMAL)+CAST(P15 AS DECIMAL)+CAST(P16 AS DECIMAL))/4) AS PromEvaluacion,AVG((CAST(P17 AS DECIMAL)+CAST(P18 AS DECIMAL)+CAST(P19 AS DECIMAL)+CAST(P20 AS DECIMAL)+CAST(P21 AS DECIMAL)+CAST(P22 AS DECIMAL))/6) AS PromDeberes FROM dbo.SEK_EPdocente2014 WHERE  CODPROF='" + profesor + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "' AND ASIGNATURA='" + asignatura + "' AND SECCION='" + seccion + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            lblPlan1.Text = Mid(ds.Tables(0).Rows(0)("p1").ToString(), 1, decimales)
            lblPlan2.Text = Mid(ds.Tables(0).Rows(0)("p2").ToString(), 1, decimales)

            lblMetodologia1.Text = Mid(ds.Tables(0).Rows(0)("p3").ToString(), 1, decimales)
            lblMetodologia2.Text = Mid(ds.Tables(0).Rows(0)("p4").ToString(), 1, decimales)
            lblMetodologia3.Text = Mid(ds.Tables(0).Rows(0)("p5").ToString(), 1, decimales)

            lblContenido1.Text = Mid(ds.Tables(0).Rows(0)("p6").ToString(), 1, decimales)
            lblContenido2.Text = Mid(ds.Tables(0).Rows(0)("p7").ToString(), 1, decimales)
            lblContenido3.Text = Mid(ds.Tables(0).Rows(0)("p8").ToString(), 1, decimales)
            lblContenido4.Text = Mid(ds.Tables(0).Rows(0)("p9").ToString(), 1, decimales)

            lblClima1.Text = Mid(ds.Tables(0).Rows(0)("p10").ToString(), 1, decimales)
            lblClima2.Text = Mid(ds.Tables(0).Rows(0)("p11").ToString(), 1, decimales)
            lblClima3.Text = Mid(ds.Tables(0).Rows(0)("p12").ToString(), 1, decimales)

            lblEval1.Text = Mid(ds.Tables(0).Rows(0)("p13").ToString(), 1, decimales)
            lblEval2.Text = Mid(ds.Tables(0).Rows(0)("p14").ToString(), 1, decimales)
            lblEval3.Text = Mid(ds.Tables(0).Rows(0)("p15").ToString(), 1, decimales)
            lblEval4.Text = Mid(ds.Tables(0).Rows(0)("p16").ToString(), 1, decimales)

            lblDeberes1.Text = Mid(ds.Tables(0).Rows(0)("p17").ToString(), 1, decimales)
            lblDeberes2.Text = Mid(ds.Tables(0).Rows(0)("p18").ToString(), 1, decimales)
            lblDeberes3.Text = Mid(ds.Tables(0).Rows(0)("p19").ToString(), 1, decimales)
            lblDeberes4.Text = Mid(ds.Tables(0).Rows(0)("p20").ToString(), 1, decimales)
            lblDeberes5.Text = Mid(ds.Tables(0).Rows(0)("p21").ToString(), 1, decimales)
            lblDeberes6.Text = Mid(ds.Tables(0).Rows(0)("p22").ToString(), 1, decimales)

            lblPlaneacionCursoProm.Text = Mid(ds.Tables(0).Rows(0)("PromPlaneacion").ToString(), 1, decimales)
            lblMetodologiaProm.Text = Mid(ds.Tables(0).Rows(0)("PromMetodologia").ToString(), 1, decimales)
            lblContenidosProm.Text = Mid(ds.Tables(0).Rows(0)("PromContenidos").ToString(), 1, decimales)
            lblClimaProm.Text = Mid(ds.Tables(0).Rows(0)("PromClima").ToString(), 1, decimales)
            lblEvaluacionProm.Text = Mid(ds.Tables(0).Rows(0)("PromEvaluacion").ToString(), 1, decimales)
            lblDeberesProm.Text = Mid(ds.Tables(0).Rows(0)("PromDeberes").ToString(), 1, decimales)

        Catch ex As Exception
            'Response.Write(ex.Message)
            Response.Write("Error al cargar datos del profesor")
        Finally
            conn.Close()
        End Try

        strSql = "SELECT AVG(CAST(P1 AS DECIMAL)) AS P1,AVG(CAST(P2 AS DECIMAL)) AS P2,AVG(CAST(P3 AS DECIMAL)) AS P3,AVG(CAST(P4 AS DECIMAL)) AS P4,AVG(CAST(P5 AS DECIMAL)) AS P5,AVG(CAST(P6 AS DECIMAL)) AS P6,AVG(CAST(P7 AS DECIMAL)) AS P7,AVG(CAST(P8 AS DECIMAL)) AS P8,AVG(CAST(P9 AS DECIMAL)) AS P9,AVG(CAST(P10 AS DECIMAL)) AS P10,AVG(CAST(P11 AS DECIMAL)) AS P11,AVG(CAST(P12 AS DECIMAL)) AS P12,AVG(CAST(P13 AS DECIMAL)) AS P13,AVG(CAST(P14 AS DECIMAL)) AS P14,AVG(CAST(P15 AS DECIMAL)) AS P15,AVG(CAST(P16 AS DECIMAL)) AS P16,AVG(CAST(P17 AS DECIMAL)) AS P17,AVG(CAST(P18 AS DECIMAL)) AS P18,AVG(CAST(P19 AS DECIMAL)) AS P19,AVG(CAST(P20 AS DECIMAL)) AS P20,AVG(CAST(P21 AS DECIMAL)) AS P21,AVG(CAST(P22 AS DECIMAL)) AS P22,AVG((CAST(P1 AS DECIMAL)+CAST(P2 AS DECIMAL))/2) AS PromPlaneacion,AVG((CAST(P3 AS DECIMAL)+CAST(P4 AS DECIMAL)+CAST(P5 AS DECIMAL))/3) AS PromMetodologia,AVG((CAST(P6 AS DECIMAL)+CAST(P7 AS DECIMAL)+CAST(P8 AS DECIMAL)+CAST(P9 AS DECIMAL))/4) AS PromContenidos,AVG((CAST(P10 AS DECIMAL)+CAST(P11 AS DECIMAL)+CAST(P12 AS DECIMAL))/3) AS PromClima,AVG((CAST(P13 AS DECIMAL)+CAST(P14 AS DECIMAL)+CAST(P15 AS DECIMAL)+CAST(P16 AS DECIMAL))/4) AS PromEvaluacion,AVG((CAST(P17 AS DECIMAL)+CAST(P18 AS DECIMAL)+CAST(P19 AS DECIMAL)+CAST(P20 AS DECIMAL)+CAST(P21 AS DECIMAL)+CAST(P22 AS DECIMAL))/6) AS PromDeberes FROM dbo.SEK_EPdocente2014 WHERE CARRERA='" + carrera + "' AND ANO='" + ano + "' AND PERIODO='" + periodo + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds2)

            lblPlan1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P1").ToString(), 1, decimales)
            lblPlan2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P2").ToString(), 1, decimales)

            lblMetodologia1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P3").ToString(), 1, decimales)
            lblMetodologia2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P4").ToString(), 1, decimales)
            lblMetodologia3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P5").ToString(), 1, decimales)

            lblContenido1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P6").ToString(), 1, decimales)
            lblContenido2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P7").ToString(), 1, decimales)
            lblContenido3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P8").ToString(), 1, decimales)
            lblContenido4Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P9").ToString(), 1, decimales)

            lblClima1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P10").ToString(), 1, decimales)
            lblClima2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P11").ToString(), 1, decimales)
            lblClima3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P12").ToString(), 1, decimales)

            lblEval1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P13").ToString(), 1, decimales)
            lblEval2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P14").ToString(), 1, decimales)
            lblEval3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P15").ToString(), 1, decimales)
            lblEval4Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P16").ToString(), 1, decimales)

            lblDeberes1Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P17").ToString(), 1, decimales)
            lblDeberes2Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P18").ToString(), 1, decimales)
            lblDeberes3Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P19").ToString(), 1, decimales)
            lblDeberes4Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P20").ToString(), 1, decimales)
            lblDeberes5Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P21").ToString(), 1, decimales)
            lblDeberes6Carrera.Text = Mid(ds2.Tables(0).Rows(0)("P22").ToString(), 1, decimales)

            lblPlaneacionCursoPromCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromPlaneacion").ToString(), 1, decimales)
            lblMetodologiaPromCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromMetodologia").ToString(), 1, decimales)
            lblContenidosPromCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromContenidos").ToString(), 1, decimales)
            lblClimaPromCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromClima").ToString(), 1, decimales)
            lblEvaluacionPromCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromEvaluacion").ToString(), 1, decimales)
            lblDeberesPromCarrera.Text = Mid(ds2.Tables(0).Rows(0)("PromDeberes").ToString(), 1, decimales)
        Catch ex As Exception
            Response.Write("Error al cargar datos de la Carrera")
        Finally
            conn.Close()
        End Try
    End Sub
    Protected Function encuestasHechas(ByVal ano As String, ByVal periodo As String, ByVal codProf As String, ByVal codRamo As String, ByVal seccion As String) As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String

        Dim total As String = "0"

        strSql = "Select count(*) as Total from dbo.SEK_EAdocente2014 where ano='" + ano + "' and periodo='" + periodo + "' and codRamo='" + codRamo + "' and CODPROF='" + codProf + "' and seccion='" + seccion + "'"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            total = ds.Tables(0).Rows(0)("Total").ToString
        Catch ex As Exception

        End Try
        Return total
    End Function

    Protected Function encuestasPorHacer(ByVal ano As String, ByVal periodo As String, ByVal codProf As String, ByVal codRamo As String, ByVal seccion As String) As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection =
            New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("conexion").ConnectionString)
        Dim strSql As String

        Dim total As String = "0"

        strSql = "SELECT COUNT(*) as Total FROM dbo.RA_NOTA INNER JOIN dbo.RA_SECCIO ON dbo.RA_NOTA.CODSECC = dbo.RA_SECCIO.CODSECC AND  dbo.RA_NOTA.RAMOEQUIV = dbo.RA_SECCIO.CODRAMO AND dbo.RA_NOTA.ANO = dbo.RA_SECCIO.ANO AND  dbo.RA_NOTA.PERIODO = dbo.RA_SECCIO.PERIODO INNER JOIN dbo.MT_CARRER ON dbo.RA_SECCIO.CODCARR = dbo.MT_CARRER.CODCARR WHERE (dbo.RA_NOTA.ANO = '" + ano + "') AND (dbo.RA_NOTA.PERIODO = '" + periodo + "') AND (dbo.RA_SECCIO.CODRAMO = '" + codRamo + "') AND(dbo.RA_SECCIO.CODPROF = '" + codProf + "') AND(dbo.RA_SECCIO.CODSECC = '" + seccion + "')"
        Try
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)

            total = ds.Tables(0).Rows(0)("Total").ToString
        Catch ex As Exception

        End Try
        Return total
    End Function
End Class
