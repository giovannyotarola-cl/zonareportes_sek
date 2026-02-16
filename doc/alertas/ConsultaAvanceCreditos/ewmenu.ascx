<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_consultaAvanceCreditos

	Public RootMenu As AspNetReportMaker4_consultaAvanceCreditos.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_consultaAvanceCreditos Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_consultaAvanceCreditos)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_consultaAvanceCreditos.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Consulta_Avance_CrE9ditossmry.aspx", -1, "", "", True)
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
