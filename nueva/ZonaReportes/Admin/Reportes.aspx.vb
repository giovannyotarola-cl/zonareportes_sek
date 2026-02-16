Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports Funciones

Partial Class Admin_Reportes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        getAllReports()
    End Sub

    Public Sub getAllReports()

        Dim ds As New DataSet
        Dim da As SqlClient.SqlDataAdapter
        Dim connString As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings().Item("Connection"))
        Dim strSQL As String

        strSQL = "SELECT * FROM SEK_ZR_REPORTE"

        Try
            connString.Open()
            da = New SqlClient.SqlDataAdapter(strSQL, connString)
            da.Fill(ds, "SEK_ZR_REPORTE")

            Dim xs As Integer = 0

            Dim HeaderRow As New TableHeaderRow
            HeaderRow.TableSection = TableRowSection.TableHeader

            Dim IdHeaderCell As New TableHeaderCell
            Dim NombreHeaderCell As New TableHeaderCell
            Dim DescHeaderCell As New TableHeaderCell
            Dim ProyHeaderCell As New TableHeaderCell
            Dim DeptoHeaderCell As New TableHeaderCell
            Dim AccionHeaderCell As New TableHeaderCell

            IdHeaderCell.Text = "ID"
            IdHeaderCell.Scope = TableHeaderScope.Column
            NombreHeaderCell.Text = "Nombres"
            NombreHeaderCell.Scope = TableHeaderScope.Column
            DescHeaderCell.Text = "Descripción"
            DescHeaderCell.Scope = TableHeaderScope.Column
            ProyHeaderCell.Text = "Proyecto"
            ProyHeaderCell.Scope = TableHeaderScope.Column
            DeptoHeaderCell.Text = "Departamento"
            DeptoHeaderCell.Scope = TableHeaderScope.Column
            AccionHeaderCell.Text = ""
            AccionHeaderCell.Scope = TableHeaderScope.Column

            HeaderRow.Cells.Add(IdHeaderCell)
            HeaderRow.Cells.Add(NombreHeaderCell)
            HeaderRow.Cells.Add(DescHeaderCell)
            HeaderRow.Cells.Add(ProyHeaderCell)
            HeaderRow.Cells.Add(DeptoHeaderCell)
            HeaderRow.Cells.Add(AccionHeaderCell)

            Tbl_reportes.Rows.AddAt(0, HeaderRow)

            While xs < (ds.Tables(0).Rows.Count)

                Dim Row As New TableRow

                Dim IdCell As New TableCell
                Dim NombreCell As New TableCell
                Dim DescCell As New TableCell
                Dim ProyCell As New TableCell
                Dim DeptoCell As New TableCell
                Dim AccionCell As New TableCell

                IdCell.Text = ds.Tables(0).Rows(xs)("ID").ToString
                NombreCell.Text = ds.Tables(0).Rows(xs)("NOMBRE")
                DescCell.Text = ds.Tables(0).Rows(xs)("DESCRIPCION")
                ProyCell.Text = ds.Tables(0).Rows(xs)("PROYECTO")
                DeptoCell.Text = Funciones.nomDepto(ds.Tables(0).Rows(xs)("ID_DEPARTAMENTO"))

                AccionCell.HorizontalAlign = HorizontalAlign.Right
                AccionCell.Text = "<span id=" + ds.Tables(0).Rows(xs)("ID").ToString() + " class='btn btn-danger btn-delete btn-sm'> Eliminar </span> <span id=" + ds.Tables(0).Rows(xs)("ID").ToString() + " class='btn btn-info btn-edit btn-sm'> Editar </span>"

                Row.Cells.Add(IdCell)
                Row.Cells.Add(NombreCell)
                Row.Cells.Add(DescCell)
                Row.Cells.Add(ProyCell)
                Row.Cells.Add(DeptoCell)
                Row.Cells.Add(AccionCell)

                Tbl_reportes.Rows.Add(Row)

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
