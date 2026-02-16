<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_AlertasInasistencias

	Public RootMenu As AspNetReportMaker4_AlertasInasistencias.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_AlertasInasistencias Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_AlertasInasistencias)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_AlertasInasistencias.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(4, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("4", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Alertas_Inasistenciassmry.aspx", -1, "", "", True)
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
