Imports System.Data.SqlClient

Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        id_empleado = vbNull
        nivel_empleado = vbNull

        getEmpleado()

        origen_sql_jerarquias.SelectCommand = "SELECT distinct dbo.Evaluacion_Users.username, dbo.Evaluacion_Users.nombre, dbo.Evaluacion_Users.apellidos, dbo.Evaluacion_Jerarquia.id FROM dbo.Evaluacion_Users INNER JOIN dbo.Evaluacion_Jerarquia ON dbo.Evaluacion_Users.id = dbo.Evaluacion_Jerarquia.id_empleado WHERE (dbo.Evaluacion_Jerarquia.id_superior ='" + id_empleado.ToString + "')"
        'System.Diagnostics.Debug.WriteLine(origen_sql_jerarquias.SelectCommand)
        origen_sql_jerarquias.DeleteCommand = "Delete from dbo.Evaluacion_Jerarquia where id = @id"

        'Obtener lista de usuarios jerarquizables
        fill_dropdown.SelectCommand = "SELECT username, nombre +' '+ apellidos as nombre_empleado, cargo, nivel, id FROM dbo.Evaluacion_Users WHERE (id <> '" + id_empleado.ToString + "') AND (nivel > " + nivel_empleado.ToString + " AND id not in (SELECT dbo.Evaluacion_Users.id FROM dbo.Evaluacion_Users INNER JOIN dbo.Evaluacion_Jerarquia ON dbo.Evaluacion_Users.id = dbo.Evaluacion_Jerarquia.id_empleado WHERE (dbo.Evaluacion_Jerarquia.id_superior = " + id_empleado.ToString + ") ))"

    End Sub

    Protected Sub getEmpleado()
        Dim cad_conexion As String = ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString
        Dim conn As New SqlConnection
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        Dim strSQL As String = ""

        Try
            strSQL = "select id, nivel from dbo.Evaluacion_Users where id = " + Request.QueryString("empleado").ToString + ";"
            'System.Diagnostics.Debug.WriteLine("Cadena: " + strSQL)
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString
            da = New SqlClient.SqlDataAdapter(strSQL, conn)
            da.Fill(ds)
            id_empleado = ds.Tables(0).Rows(0).Item(0)
            nivel_empleado = ds.Tables(0).Rows(0).Item(1)
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error en la consulta: " + ex.ToString)
        Finally
            conn.Close()
        End Try

    End Sub

    Protected id_empleado As Integer
    Protected nivel_empleado As Integer

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
            SQLInsert = "Insert into dbo.Evaluacion_Jerarquia values(" + id_empleado.ToString + ", " + lista_empleados.SelectedValue.ToString + ")"
            cmd.CommandText = SQLInsert
            Dim filas As Integer = cmd.ExecuteNonQuery

            If filas = 1 Then
                System.Diagnostics.Debug.WriteLine("Ok")
            Else
                System.Diagnostics.Debug.WriteLine("Error")
            End If

        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error es: " + ex.ToString)
        Finally
            conn.Close()
            grilla_jerarquias.DataBind()
            lista_empleados.DataBind()
        End Try
    End Sub

    Protected Sub fila_borrada(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles grilla_jerarquias.RowDeleted
        grilla_jerarquias.DataBind()
        lista_empleados.DataBind()
    End Sub
End Class