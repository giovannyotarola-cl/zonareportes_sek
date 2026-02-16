
Partial Class _Default
    Inherits Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("USERID") = "" Or Session("USERNAME") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
            If (Session("USERID").ToString <> "") Then
                Dim procesosDisponibles As List(Of ProcesoAuxiliar) = Funciones.getAllProcesosDisponibles(Session("USERID").ToString)

                For i As Integer = 0 To procesosDisponibles.Count - 1
                    Dim lnkCambioUbicacion As New HyperLink
                    Dim li As New HtmlGenericControl("li")
                    Dim label As New Label

                    label.Text = procesosDisponibles(i).nombre + " - " + procesosDisponibles(i).descripcion + " "
                    lnkCambioUbicacion.NavigateUrl = "~/ProcesosAuxiliares/" + procesosDisponibles(i).ubicacion + ".aspx"
                    lnkCambioUbicacion.Text = "Ir"

                    li.Controls.Add(label)
                    li.Controls.Add(lnkCambioUbicacion)
                    ulDescripcionProcesos.Controls.Add(li)
                Next
            End If
        End If
    End Sub
End Class