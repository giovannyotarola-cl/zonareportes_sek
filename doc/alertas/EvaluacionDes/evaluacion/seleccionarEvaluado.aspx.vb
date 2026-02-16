Imports System.Data.SqlClient

Public Class seleccionarEvaluado
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("user_id").ToString() = "") Then
            Response.Redirect("~/Account/Login.aspx")
        End If
        If Not Me.IsPostBack Then
            'Periodo al cual se va a consultar
            sqlPeriodos.SelectCommand = "SELECT distinct Cast(Evaluacion_Encuesta.ano as varchar(5)) + '-' + Cast(Evaluacion_Encuesta.semestre as varchar(5)) AS Periodo FROM Evaluacion_Encuesta inner join Evaluacion_users on Evaluacion_Encuesta.id_evaluador = Evaluacion_users.id WHERE (Evaluacion_users.id = @id) order by Periodo desc"
            ddlPeriodos_EvReal.DataBind()
            ddlPeriodos_EvRec.DataBind()

            'Consulta de la grilla con el personal subordinado al usuario actual y que no ha recibido evaluación este periodo
            personal_por_evaluar.SelectCommand = "SELECT distinct dbo.Evaluacion_Users.id, dbo.Evaluacion_Users.username, dbo.Evaluacion_Users.nombre, dbo.Evaluacion_Users.apellidos, dbo.Evaluacion_Jerarquia.id_empleado FROM dbo.Evaluacion_Users INNER JOIN dbo.Evaluacion_Jerarquia ON dbo.Evaluacion_Users.id = dbo.Evaluacion_Jerarquia.id_empleado WHERE (dbo.Evaluacion_Jerarquia.id_superior = " + Session("user_id").ToString + ") AND dbo.Evaluacion_Users.id NOT IN (SELECT dbo.Evaluacion_Encuesta.id_empleado FROM dbo.Evaluacion_Encuesta INNER JOIN dbo.Evaluacion_Users ON dbo.Evaluacion_Encuesta.id_empleado = dbo.Evaluacion_Users.id WHERE dbo.Evaluacion_Encuesta.ano = " + Session("ano").ToString + " AND dbo.Evaluacion_Encuesta.semestre = " + Session("semestre").ToString + ")"
            'Grilla con el personal ya evaluado
            personal_evaluado.SelectCommand = "SELECT dbo.Evaluacion_Users.nombre, dbo.Evaluacion_Users.apellidos, dbo.Evaluacion_Encuesta.fecha, dbo.Evaluacion_Encuesta.ano, dbo.Evaluacion_Encuesta.semestre, dbo.Evaluacion_Encuesta.id, CASE dbo.Evaluacion_Encuesta.aceptada WHEN 0 THEN 'No' ELSE 'Si' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.Evaluacion_Users INNER JOIN dbo.Evaluacion_Encuesta ON dbo.Evaluacion_Users.id = dbo.Evaluacion_Encuesta.id_empleado WHERE dbo.Evaluacion_Encuesta.id_evaluador = " + Session("user_id").ToString + " AND Cast(dbo.Evaluacion_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.Evaluacion_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvReal.SelectedValue.ToString + "'"
            'Grilla con las evaluaciones recibidas
            evaluaciones_recibidas.SelectCommand = "SELECT dbo.Evaluacion_Users.nombre+' '+dbo.Evaluacion_Users.apellidos as Evaluador, dbo.Evaluacion_Encuesta.fecha, dbo.Evaluacion_Encuesta.ano, dbo.Evaluacion_Encuesta.semestre, dbo.Evaluacion_Encuesta.id, CASE dbo.Evaluacion_Encuesta.aceptada WHEN 0 THEN 'No' ELSE 'Si' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.Evaluacion_Users INNER JOIN dbo.Evaluacion_Encuesta ON dbo.Evaluacion_Users.id = dbo.Evaluacion_Encuesta.id_evaluador WHERE dbo.Evaluacion_Encuesta.id_empleado = " + Session("user_id").ToString + " AND Cast(dbo.Evaluacion_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.Evaluacion_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvReal.SelectedValue.ToString + "'"
        End If
        personal_evaluado.DeleteCommand = "delete dbo.Evaluacion_Encuesta where id=@id_evaluacion"
    End Sub
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grilla_evaluados.RowCommand

        If e.CommandName = "Delete" Then
            Dim cmd As New SqlCommand
            Dim conn As SqlConnection = New SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString())

            Dim id As String = e.CommandArgument.ToString()

            cmd.Connection = conn
            cmd.CommandText = "DELETE FROM Evaluacion_Encuesta WHERE id='" & id & "'"
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
            personal_evaluado.SelectCommand = "SELECT dbo.Evaluacion_Users.nombre, dbo.Evaluacion_Users.apellidos, dbo.Evaluacion_Encuesta.fecha, dbo.Evaluacion_Encuesta.ano, dbo.Evaluacion_Encuesta.semestre, dbo.Evaluacion_Encuesta.id, CASE dbo.Evaluacion_Encuesta.aceptada WHEN 0 THEN 'No' ELSE 'Si' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.Evaluacion_Users INNER JOIN dbo.Evaluacion_Encuesta ON dbo.Evaluacion_Users.id = dbo.Evaluacion_Encuesta.id_empleado WHERE dbo.Evaluacion_Encuesta.id_evaluador = " + Session("user_id").ToString + " AND Cast(dbo.Evaluacion_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.Evaluacion_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvReal.SelectedValue.ToString + "'"
            grilla_evaluados.DataBind()
            GridView1.DataBind()
        End If

    End Sub

    Protected Sub ddlPeriodos_EvReal_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPeriodos_EvReal.SelectedIndexChanged
        personal_evaluado.SelectCommand = "SELECT dbo.Evaluacion_Users.nombre, dbo.Evaluacion_Users.apellidos, dbo.Evaluacion_Encuesta.fecha, dbo.Evaluacion_Encuesta.ano, dbo.Evaluacion_Encuesta.semestre, dbo.Evaluacion_Encuesta.id, CASE dbo.Evaluacion_Encuesta.aceptada WHEN 0 THEN 'No' ELSE 'Si' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.Evaluacion_Users INNER JOIN dbo.Evaluacion_Encuesta ON dbo.Evaluacion_Users.id = dbo.Evaluacion_Encuesta.id_empleado WHERE dbo.Evaluacion_Encuesta.id_evaluador = " + Session("user_id").ToString + " AND Cast(dbo.Evaluacion_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.Evaluacion_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvReal.SelectedValue.ToString() + "'"
        grilla_evaluados.DataBind()
    End Sub

    Protected Sub ddlPeriodos_EvRec_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPeriodos_EvRec.SelectedIndexChanged
        evaluaciones_recibidas.SelectCommand = "SELECT dbo.Evaluacion_Users.nombre+' '+dbo.Evaluacion_Users.apellidos as Evaluador, dbo.Evaluacion_Encuesta.fecha, dbo.Evaluacion_Encuesta.ano, dbo.Evaluacion_Encuesta.semestre, dbo.Evaluacion_Encuesta.id, CASE dbo.Evaluacion_Encuesta.aceptada WHEN 0 THEN 'No' ELSE 'Si' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.Evaluacion_Users INNER JOIN dbo.Evaluacion_Encuesta ON dbo.Evaluacion_Users.id = dbo.Evaluacion_Encuesta.id_evaluador WHERE dbo.Evaluacion_Encuesta.id_empleado = " + Session("user_id").ToString + " AND Cast(dbo.Evaluacion_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.Evaluacion_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvRec.SelectedValue.ToString + "'"
        grilla_ev_recibidas.DataBind()
    End Sub
End Class