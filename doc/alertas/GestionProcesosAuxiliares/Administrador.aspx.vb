
Partial Class Administrador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("USERID") = "" Then
            Response.Redirect("Account/Login.aspx")
        Else
            If (Session("USERNAME") <> "admin") Then
                Response.Redirect("Default.aspx")
            Else
                If (Not Me.IsPostBack) Then
                    cargarUsuarios()
                End If
            End If
        End If
    End Sub

    Protected Sub cargarUsuarios()
        Dim usuarios As List(Of Usuario) = Funciones.getAllUsuarios()
        For i As Integer = 0 To usuarios.Count - 1
            Dim RowTableInforme As New TableRow
            RowTableInforme.TableSection = TableRowSection.TableBody
            '
            Dim CellUsuario As New TableCell
            Dim CellDescripcion As New TableCell
            Dim CellCarrera As New TableCell
            Dim CellLinkEdit As New TableCell

            Dim linkEdis As New HyperLink
            linkEdis.NavigateUrl = "AdminUsuarioEdit.aspx?usuario=" + usuarios(i).userId
            linkEdis.Text = "Editar Permisos"
            linkEdis.Target = "_blank"

            CellUsuario.Text = usuarios(i).userName
            CellDescripcion.Text = usuarios(i).userDes
            CellCarrera.Text = usuarios(i).userCarr
            CellLinkEdit.Controls.Add(linkEdis)

            RowTableInforme.Cells.Add(CellUsuario)
            RowTableInforme.Cells.Add(CellDescripcion)
            RowTableInforme.Cells.Add(CellCarrera)
            RowTableInforme.Cells.Add(CellLinkEdit)

            tblUsuarios.Rows.Add(RowTableInforme)
        Next
    End Sub
End Class
