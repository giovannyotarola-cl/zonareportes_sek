Imports System.Data.SqlClient

Public Class seleccionarEvaluado
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsNothing(Session("user_id")) And Not IsNothing(Session("user_nivel"))) Then
            If (Session("user_id").ToString = "" Or Session("user_nivel").ToString = "") Then
                Response.Redirect("../Account/Login.aspx")
            End If
        Else
            Response.Redirect("../Account/Login.aspx")
        End If
        If Not Me.IsPostBack Then
            'Periodo en el cual el usuario realizó evaluaciones
            sqlPeriodos.SelectCommand = "SELECT distinct Cast(SEK_EvDes_Encuesta.ano as varchar(5)) + '-' + Cast(SEK_EvDes_Encuesta.semestre as varchar(5)) AS Periodo FROM SEK_EvDes_Encuesta inner join SEK_EvDes_Users on SEK_EvDes_Encuesta.id_evaluador = SEK_EvDes_Users.id WHERE (SEK_EvDes_Users.id = @id) order by Periodo desc"
            ddlPeriodos_EvReal.DataBind()
            ddlPeriodos_EvRec.DataBind()

            'Periodo an el cual el usuario recibió evaluaciones
            sqlPeriodosEvaluado.SelectCommand = "SELECT distinct Cast(SEK_EvDes_Encuesta.ano as varchar(5)) + '-' + Cast(SEK_EvDes_Encuesta.semestre as varchar(5)) AS Periodo FROM SEK_EvDes_Encuesta inner join SEK_EvDes_Users on SEK_EvDes_Encuesta.id_empleado = SEK_EvDes_Users.id WHERE (SEK_EvDes_Users.id = @id) order by Periodo desc"
            ddlPeriodos_EvRec.DataBind()
            ddlPeriodos_EvRec.DataBind()

            'Consulta de la grilla con el personal subordinado al usuario actual y que no ha recibido evaluación este periodo
            'consulta solo si esta habilitado
            If (encuestaHabilitada()) Then
                personal_por_evaluar.SelectCommand = "SELECT distinct dbo.SEK_EvDes_Users.id, dbo.SEK_EvDes_Users.username, dbo.SEK_EvDes_Users.nombre, dbo.SEK_EvDes_Jerarquia.id_empleado FROM dbo.SEK_EvDes_Users INNER JOIN dbo.SEK_EvDes_Jerarquia ON dbo.SEK_EvDes_Users.id = dbo.SEK_EvDes_Jerarquia.id_empleado WHERE (dbo.SEK_EvDes_Jerarquia.id_superior = " + Session("user_id").ToString + ") AND dbo.SEK_EvDes_Users.id NOT IN (SELECT dbo.SEK_EvDes_Encuesta.id_empleado FROM dbo.SEK_EvDes_Encuesta INNER JOIN dbo.SEK_EvDes_Users ON dbo.SEK_EvDes_Encuesta.id_empleado = dbo.SEK_EvDes_Users.id WHERE dbo.SEK_EvDes_Encuesta.ano = (SELECT TOP 1 ANO FROM SEK_EvDes_Parametros) AND dbo.SEK_EvDes_Encuesta.semestre = (SELECT TOP 1 SEMESTRE FROM SEK_EvDes_Parametros))"
            End If
            'Grilla con el personal ya evaluado
            personal_evaluado.SelectCommand = "SELECT dbo.SEK_EvDes_Users.nombre, dbo.SEK_EvDes_Encuesta.fecha, dbo.SEK_EvDes_Encuesta.ano, dbo.SEK_EvDes_Encuesta.semestre, dbo.SEK_EvDes_Encuesta.id, CASE dbo.SEK_EvDes_Encuesta.aceptada WHEN 0 THEN 'No' WHEN 1 THEN 'Si' ELSE '-' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.SEK_EvDes_Users INNER JOIN dbo.SEK_EvDes_Encuesta ON dbo.SEK_EvDes_Users.id = dbo.SEK_EvDes_Encuesta.id_empleado WHERE dbo.SEK_EvDes_Encuesta.id_evaluador = " + Session("user_id").ToString + " AND Cast(dbo.SEK_EvDes_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.SEK_EvDes_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvReal.SelectedValue.ToString + "'"
            'se comprueba si el usuario puede ver sus evaluaciones en el periodo actual
            If (Not habilitarRecepcion()) Then
                ddlPeriodos_EvRec.Items.Remove(periodoActual)
            End If
            'Grilla con las evaluaciones recibidas
            evaluaciones_recibidas.SelectCommand = "SELECT dbo.SEK_EvDes_Users.nombre as Evaluador, dbo.SEK_EvDes_Encuesta.fecha, dbo.SEK_EvDes_Encuesta.ano, dbo.SEK_EvDes_Encuesta.semestre, dbo.SEK_EvDes_Encuesta.id, CASE dbo.SEK_EvDes_Encuesta.aceptada WHEN 0 THEN 'No' WHEN 1 THEN 'Si' ELSE '-' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.SEK_EvDes_Users INNER JOIN dbo.SEK_EvDes_Encuesta ON dbo.SEK_EvDes_Users.id = dbo.SEK_EvDes_Encuesta.id_evaluador WHERE dbo.SEK_EvDes_Encuesta.id_empleado = " + Session("user_id").ToString + " AND Cast(dbo.SEK_EvDes_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.SEK_EvDes_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvRec.SelectedValue.ToString + "'"
            'Response.Write(evaluaciones_recibidas.SelectCommand)
        End If
        personal_evaluado.DeleteCommand = "delete dbo.SEK_EvDes_Encuesta where id=@id_evaluacion"
    End Sub
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grilla_evaluados.RowCommand

        If e.CommandName = "Delete" Then
            Dim cmd As New SqlCommand
            Dim conn As SqlConnection = New SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString())

            Dim id As String = e.CommandArgument.ToString()

            cmd.Connection = conn
            cmd.CommandText = "DELETE FROM SEK_EvDes_Encuesta WHERE id='" & id & "'"
            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
            personal_evaluado.SelectCommand = "SELECT dbo.SEK_EvDes_Users.nombre, dbo.SEK_EvDes_Encuesta.fecha, dbo.SEK_EvDes_Encuesta.ano, dbo.SEK_EvDes_Encuesta.semestre, dbo.SEK_EvDes_Encuesta.id, CASE dbo.SEK_EvDes_Encuesta.aceptada WHEN 0 THEN 'No' ELSE 'Si' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.SEK_EvDes_Users INNER JOIN dbo.SEK_EvDes_Encuesta ON dbo.SEK_EvDes_Users.id = dbo.SEK_EvDes_Encuesta.id_empleado WHERE dbo.SEK_EvDes_Encuesta.id_evaluador = " + Session("user_id").ToString + " AND Cast(dbo.SEK_EvDes_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.SEK_EvDes_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvReal.SelectedValue.ToString + "'"
            grilla_evaluados.DataBind()
            GridView1.DataBind()
        End If

    End Sub

    Protected Sub ddlPeriodos_EvReal_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPeriodos_EvReal.SelectedIndexChanged
        personal_evaluado.SelectCommand = "SELECT dbo.SEK_EvDes_Users.nombre, dbo.SEK_EvDes_Encuesta.fecha, dbo.SEK_EvDes_Encuesta.ano, dbo.SEK_EvDes_Encuesta.semestre, dbo.SEK_EvDes_Encuesta.id, CASE dbo.SEK_EvDes_Encuesta.aceptada WHEN 0 THEN 'No' ELSE 'Si' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.SEK_EvDes_Users INNER JOIN dbo.SEK_EvDes_Encuesta ON dbo.SEK_EvDes_Users.id = dbo.SEK_EvDes_Encuesta.id_empleado WHERE dbo.SEK_EvDes_Encuesta.id_evaluador = " + Session("user_id").ToString + " AND Cast(dbo.SEK_EvDes_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.SEK_EvDes_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvReal.SelectedValue.ToString() + "'"
        grilla_evaluados.DataBind()
    End Sub

    Protected Sub ddlPeriodos_EvRec_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPeriodos_EvRec.SelectedIndexChanged
        evaluaciones_recibidas.SelectCommand = "SELECT dbo.SEK_EvDes_Users.nombre as Evaluador, dbo.SEK_EvDes_Encuesta.fecha, dbo.SEK_EvDes_Encuesta.ano, dbo.SEK_EvDes_Encuesta.semestre, dbo.SEK_EvDes_Encuesta.id, CASE dbo.SEK_EvDes_Encuesta.aceptada WHEN 0 THEN 'No' ELSE 'Si' END as Aceptada, ISNULL(comentario_evaluado, '') as comentario_evaluado FROM dbo.SEK_EvDes_Users INNER JOIN dbo.SEK_EvDes_Encuesta ON dbo.SEK_EvDes_Users.id = dbo.SEK_EvDes_Encuesta.id_evaluador WHERE dbo.SEK_EvDes_Encuesta.id_empleado = " + Session("user_id").ToString + " AND Cast(dbo.SEK_EvDes_Encuesta.ano as varchar(5)) +'-'+Cast(dbo.SEK_EvDes_Encuesta.semestre as varchar(5)) ='" + ddlPeriodos_EvRec.SelectedValue.ToString + "'"
        grilla_ev_recibidas.DataBind()
    End Sub
#Region "combrobarParametros"
    Function encuestaHabilitada() As Boolean
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection = New SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString())
        Try
            strSql = "SELECT TOP 1 HABILITADO FROM SEK_EvDes_Parametros"
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                If (ds.Tables(0).Rows(0)("HABILITADO").ToString = "1") Then
                    Return True
                Else
                    Return False
                End If
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        Finally
            conn.Close()
        End Try
    End Function
    Function habilitarRecepcion() As Boolean
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection = New SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString())
        Try
            strSql = "SELECT TOP 1 habilitarRecepcion FROM SEK_EvDes_Parametros"
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                If (ds.Tables(0).Rows(0)("habilitarRecepcion").ToString = "1") Then
                    Return True
                Else
                    Return False
                End If
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        Finally
            conn.Close()
        End Try
    End Function
    Function periodoActual() As String
        Dim periodo As String = ""
        Dim strSql As String = ""
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim conn As SqlConnection = New SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings("cadenaConexion").ConnectionString())
        Try
            strSql = "SELECT CAST(ANO as VARCHAR(4))+'-'+CAST(SEMESTRE as VARCHAR(2)) as PERIODO FROM SEK_EvDes_Parametros"
            conn.Open()
            da = New SqlDataAdapter(strSql, conn)
            da.Fill(ds)
            If (ds.Tables(0).Rows.Count > 0) Then
                periodo = ds.Tables(0).Rows(0)("PERIODO").ToString
            End If
        Catch ex As Exception            
        Finally
            conn.Close()
        End Try
        Return periodo
    End Function
#End Region
End Class