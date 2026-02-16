Imports ClassUsuarios
Imports Funciones
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class Admin_Usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        getAllSuers()
    End Sub

    Public Sub getAllSuers()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String

        strSQL = "SELECT * FROM SEK_ZR_USUARIO"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "SEK_ZR_USUARIO")

            Dim xs As Integer = 0

            Dim HeaderRow As New TableHeaderRow
            HeaderRow.TableSection = TableRowSection.TableHeader

            Dim IdHeaderCell As New TableHeaderCell
            Dim RutHeaderCell As New TableHeaderCell
            Dim NombreHeaderCell As New TableHeaderCell
            Dim ApellidoHeaderCell As New TableHeaderCell
            Dim CorreoheaderCell As New TableHeaderCell
            Dim DeptoHeaderCell As New TableHeaderCell
            Dim AccionHeaderCell As New TableHeaderCell

            IdHeaderCell.Text = "ID"
            IdHeaderCell.Scope = TableHeaderScope.Column
            RutHeaderCell.Text = "Rut"
            RutHeaderCell.Scope = TableHeaderScope.Column
            NombreHeaderCell.Text = "Nombres"
            NombreHeaderCell.Scope = TableHeaderScope.Column
            ApellidoHeaderCell.Text = "Apellidos"
            ApellidoHeaderCell.Scope = TableHeaderScope.Column
            CorreoheaderCell.Text = "Email"
            CorreoheaderCell.Scope = TableHeaderScope.Column
            DeptoHeaderCell.Text = "Departamento"
            DeptoHeaderCell.Scope = TableHeaderScope.Column
            AccionHeaderCell.Text = ""
            AccionHeaderCell.Scope = TableHeaderScope.Column

            HeaderRow.Cells.Add(IdHeaderCell)
            HeaderRow.Cells.Add(RutHeaderCell)
            HeaderRow.Cells.Add(NombreHeaderCell)
            HeaderRow.Cells.Add(ApellidoHeaderCell)
            HeaderRow.Cells.Add(CorreoheaderCell)
            HeaderRow.Cells.Add(DeptoHeaderCell)
            HeaderRow.Cells.Add(AccionHeaderCell)

            Tbl_usuarios.Rows.AddAt(0, HeaderRow)

            While xs < (ds.Tables(0).Rows.Count)


                Dim Row As New TableRow

                Dim IdCell As New TableCell
                Dim RutCell As New TableCell
                Dim NombreCell As New TableCell
                Dim ApellidoCell As New TableCell
                Dim CorreoCell As New TableCell
                Dim DeptoCell As New TableCell
                Dim AccionCell As New TableCell

                IdCell.Text = ds.Tables(0).Rows(xs)("ID").ToString
                RutCell.Text = ds.Tables(0).Rows(xs)("RUT").ToString
                NombreCell.Text = ds.Tables(0).Rows(xs)("NOMBRES")
                ApellidoCell.Text = ds.Tables(0).Rows(xs)("APELLIDOS")
                CorreoCell.Text = ds.Tables(0).Rows(xs)("CORREO")
                DeptoCell.Text = Funciones.nomDepto(ds.Tables(0).Rows(xs)("ID_DEPARTAMENTO"))

                AccionCell.HorizontalAlign = HorizontalAlign.Right
                AccionCell.Text = "<span id=" + ds.Tables(0).Rows(xs)("ID").ToString() + " class='btn btn-danger btn-delete btn-sm'> Eliminar </span> <span id=" + ds.Tables(0).Rows(xs)("ID").ToString() + " class='btn btn-info btn-edit btn-sm'> Editar </span>"

                Row.Cells.Add(IdCell)
                Row.Cells.Add(RutCell)
                Row.Cells.Add(NombreCell)
                Row.Cells.Add(ApellidoCell)
                Row.Cells.Add(CorreoCell)
                Row.Cells.Add(DeptoCell)
                Row.Cells.Add(AccionCell)

                Tbl_usuarios.Rows.Add(Row)

                xs = xs + 1
            End While
           
        Catch ex As Exception
            Console.Write(ex.Message)
        Finally
            connString.Close()
            SqlConnection.ClearAllPools()
        End Try
    End Sub

End Class
