<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_EvaluacionJefeCarrera

	Public RootMenu As AspNetReportMaker4_EvaluacionJefeCarrera.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_EvaluacionJefeCarrera Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_EvaluacionJefeCarrera)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_EvaluacionJefeCarrera.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "EvaluaciF3n_Jefes_de_Carrerasmry.aspx", -1, "", "", True)
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
