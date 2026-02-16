Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports ClassReporte
Partial Class Dashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If (Session("USERID") = "") Then
            Response.Redirect("Account/Login.aspx")
            Response.End()
        End If
        Menu_Top()

        Dim Tabs = Request.QueryString("tab")

        If (IsNumeric(Tabs) And Tabs <> "") Then
            Dim Lista = Funciones.ListaReportesByTabs(Tabs)
            Dim Html As Literal = New Literal

            Try
                For Each Listado As String In Lista

                    Dim Report = New ClassReporte
                    Report.getInfoReporte(Listado)

                    Dim Descripcion As String = ""
                    If (Report.Descripcion.Length > 70) Then
                        Descripcion = Report.Descripcion.Substring(0, 70) + "..."
                    Else
                        Descripcion = Report.Descripcion
                    End If

                    Html.Text += "" + _
                    "<div clas=""row""><div class=""col-lg-6""><div class=""card card-block"">" + _
                        "<h4 class=""card-title"">" + Report.Nombre + "</h4>" + _
                        "<p class=""card-text"">" + Descripcion + "</p>" + _
                        "<a href=""" + Report.Link + """ class=""card-link"">Abrir Reporte</a>" + _
                    "</div></div></div>"
                Next
                listaReportes.Controls.Add(Html)
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If

    End Sub

    Protected Sub Menu_Top()

        Dim Menues = Funciones.HeaderMenu()
        Dim Html As Literal = New Literal
        Dim Tabs = Request.QueryString("tab")
        Dim UrlID As String = ""
        Dim UrlName As String = ""

        Try
            Html.Text += "<ul class=""nav navbar-nav navbar-right"">"
            For Each Menu As String In Menues

                Dim MenuArray() As String
                MenuArray = Split(Menu, "/")

                Dim intCount As Integer
                Dim activeClass As String = ""

                For intCount = LBound(MenuArray) To UBound(MenuArray)
                    UrlID = MenuArray(1)
                    UrlName = MenuArray(0)
                    If (Request.QueryString("tab") = UrlID) Then
                        activeClass = "active"
                        If (IsNumeric(Tabs) And Tabs <> "") Then
                            literalLi.Text = "<li class=""active"">" + UrlName + "</li>"
                        Else
                            literalLi.Text = "<li class=""active"">Inicio</li>"
                        End If
                    End If
                Next

                Html.Text += "" + _
                "<li class=""" + activeClass + """><a href=""Dashboard.aspx?tab=" + UrlID + """>" + _
                    "" + UrlName + "</a>" + _
                "</li>"
            Next

            Html.Text += "" + _
            "<li class=""dropdown"">" + _
                "<a href=""#"" class=""dropdown-toggle"" data-toggle=""dropdown"" role=""button"">Mi Cuenta <span class=""caret""></span></a>" + _
                "<ul class=""dropdown-menu"">" + _
                    "<li><a href=""#""><i class=""fa fa-life-ring"" aria-hidden=""true""></i> Soporte</a></li>" + _
                    "<li><a href=""#""><i class=""fa fa-question-circle-o"" aria-hidden=""true""></i> Ayuda</a></li>" + _
                    "<li role=""separator"" class=""divider""></li>" + _
                    "<li><a href=""Account/Logout.aspx""><i class=""fa fa-times"" aria-hidden=""true""></i> Desconectar</a></li>" + _
                "</ul>" + _
            "</li>"
            Html.Text += "</ul>"

            MenuTop.Controls.Add(Html)
        Catch ex As Exception

        End Try

    End Sub

End Class
