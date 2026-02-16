<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_detalleFormasPago

	Public RootMenu As AspNetReportMaker4_detalleFormasPago.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_detalleFormasPago Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_detalleFormasPago)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_detalleFormasPago.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Detalle_Formas_de_Pagosmry.aspx", -1, "", "", True)
		End If		
	End Sub
</script>
<!-- Begin Main Menu -->
<div class="aspnetreportmaker">
<%
RootMenu.Render()
%>
</div>
<!-- End Main Menu -->
