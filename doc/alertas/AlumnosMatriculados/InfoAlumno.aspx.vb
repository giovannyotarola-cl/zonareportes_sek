Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class InfoAlumno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        '
        Dim strSql As String
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("Reportes").ConnectionString)
        '
        strSql = "SELECT dbo.MT_ALUMNO.CODCLI AS CODCLI, dbo.MT_CLIENT.CODCLI + '-' + DIG AS RUT, PATERNO + ' ' + MATERNO + ', ' + NOMBRE AS NOMBRE, dbo.MT_CARRER.CODFAC, dbo.RA_FACULTAD.DESCRIPCION, CODCARPR, " + _
        "NOMBRE_C +' - '+ dbo.MT_ALUMNO.JORNADA AS CARRERA, dbo.MT_ALUMNO.ESTACAD AS ESTADO, TIPOSITU, dbo.RA_TIPOSITU.DESCRIPCION AS SITUACION, dbo.MT_ALUMNO.FEC_MAT, ANO_MAT AS MATRICULA, dbo.MT_ALUMNO.ANO AS INGRESO, " + _
        "DIRACTUAL, CELULARACT, Mail, FONOACT, SEXO, COMUNA, CIUDADACT, FECNAC FROM dbo.MT_ALUMNO " + _
        "INNER JOIN dbo.MT_CLIENT ON dbo.MT_ALUMNO.RUT = dbo.MT_CLIENT.CODCLI " + _
        "INNER JOIN dbo.MT_CARRER ON CODCARPR = CODCARR " + _
        "INNER JOIN dbo.RA_FACULTAD ON dbo.MT_CARRER.CODFAC = dbo.RA_FACULTAD.CODFAC " + _
        "INNER JOIN dbo.RA_TIPOSITU ON dbo.MT_ALUMNO.TIPOSITU = CODIGO WHERE (dbo.MT_CLIENT.CODCLI = '" + Request.QueryString("codcli") + "') "
        '
        da = New SqlDataAdapter(strSql, connString)
        da.Fill(ds)
        connString.Close()
        '
        If (ds.Tables(0).Rows.Count > 0) Then
            Dim fecha As Date = ds.Tables(0).Rows(0)("FECNAC")

            lb_rut.Text = ds.Tables(0).Rows(0)("RUT").ToString
            lb_nombre.Text = ds.Tables(0).Rows(0)("NOMBRE").ToString
            lb_fechanacimiento.Text = fecha.ToString("dd MMMM yyyy").ToString
            lb_direccion.Text = ds.Tables(0).Rows(0)("DIRACTUAL").ToString + ", " + ds.Tables(0).Rows(0)("COMUNA").ToString + ", " + ds.Tables(0).Rows(0)("CIUDADACT").ToString
            lb_celular.Text = ds.Tables(0).Rows(0)("CELULARACT").ToString
            lb_fono.Text = ds.Tables(0).Rows(0)("FONOACT").ToString
            lb_email.Text = ds.Tables(0).Rows(0)("Mail").ToString
        End If
    End Sub

End Class
