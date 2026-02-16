Imports System.Data.SqlClient

Public Class evaluacion_usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        id_empleado.Value = Request.QueryString("evaluado")
        fillEmpleado(Request.QueryString("evaluado"))

    End Sub

    Protected nombre_evaluado As String = ""
    Protected cargo_evaluado As String = ""

    Protected Sub fillEmpleado(ByVal evaluado As String)
        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim strSQL As String = ""
        Dim connString As SqlConnection = New SqlConnection()

        Try
            strSQL = "select * from dbo.Evaluacion_Users where id = " + evaluado + ";"
            'System.Diagnostics.Debug.WriteLine("Cadena: " + strSQL)
            connString.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds)
            nombre_evaluado = ds.Tables(0).Rows(0).Item(3) + " " + ds.Tables(0).Rows(0).Item(4)
            cargo_evaluado = ds.Tables(0).Rows(0).Item(5)
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error en la consulta: " + ex.ToString)
        Finally
            connString.Close()
        End Try

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click

        Dim cad_conexion As String = ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString
        Dim conn As SqlConnection = New SqlConnection
        Dim cmd As SqlCommand = New SqlCommand
        Dim SQLInsert As String = ""

        Try
            conn.ConnectionString = cad_conexion
            conn.Open()
            cmd.Connection = conn
            cmd.CommandType = CommandType.Text
            SQLInsert = "Insert into dbo.Evaluacion_Encuesta (id_evaluador, id_empleado, fecha, estado, ano, semestre, aceptada, G1_a1, G1_a2, G1_a3, G1_a, G1_b1, G1_b2, G1_b3, G1_b, G1_c1, G1_c2, G1_c3, G1_c, G2_a1, G2_a2, G2_a3, G2_a, G2_b1, G2_b2, G2_b3, G2_b, G2_c1, G2_c2, G2_c3, G2_c, G1_promedio, G2_promedio, observaciones, compromiso_mejora) values ('" + Session("user_id").ToString + "', '" + id_empleado.Value.ToString + "', '" + DateTime.Now.ToString("dd-MM-yyyy H:mm:ss") + "', '1', '" + Session("ano").ToString + "', '" + Session("semestre").ToString + "', 0, '" + Request.Form("g1_a1").ToString + "', '" + Request.Form("g1_a2").ToString + "', '" + Request.Form("g1_a3").ToString + "', '" + Request.Form("ctl00$MainContent$g1_a_nota").ToString + "', '" + Request.Form("g1_b1").ToString + "', '" + Request.Form("g1_b2").ToString + "', '" + Request.Form("g1_b3").ToString + "', '" + Request.Form("ctl00$MainContent$g1_b_nota").ToString + "', '" + Request.Form("g1_c1").ToString + "', '" + Request.Form("g1_c2").ToString + "', '" + Request.Form("g1_c3").ToString + "', '" + Request.Form("ctl00$MainContent$g1_c_nota").ToString + "', '" + Request.Form("g2_a1").ToString + "', '" + Request.Form("g2_a2").ToString + "', '" + Request.Form("g2_a3").ToString + "', '" + Request.Form("ctl00$MainContent$g2_a_nota").ToString + "', '" + Request.Form("g2_b1").ToString + "', '" + Request.Form("g2_b2").ToString + "', '" + Request.Form("g2_b3").ToString + "', '" + Request.Form("ctl00$MainContent$g2_b_nota").ToString + "', '" + Request.Form("g2_c1").ToString + "', '" + Request.Form("g2_c2").ToString + "', '" + Request.Form("g2_c3").ToString + "', '" + Request.Form("ctl00$MainContent$g2_c_nota").ToString + "', '" + Request.Form("ctl00$MainContent$g1_nota").ToString + "', '" + Request.Form("ctl00$MainContent$g2_nota").ToString + "', '" + Request.Form("ctl00$MainContent$observaciones").ToString + "', '" + Request.Form("ctl00$MainContent$compromiso_mejora").ToString + "')"
            cmd.CommandText = SQLInsert
            Dim filas As Integer = cmd.ExecuteNonQuery
            Response.Write(SQLInsert)

            If filas = 1 Then
                System.Diagnostics.Debug.WriteLine("Ok")
            Else
                System.Diagnostics.Debug.WriteLine("Error")
            End If

        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error es: " + ex.ToString)
        Finally
            conn.Close()
        End Try
        'Response.Redirect("seleccionarEvaluado.aspx")

    End Sub
End Class