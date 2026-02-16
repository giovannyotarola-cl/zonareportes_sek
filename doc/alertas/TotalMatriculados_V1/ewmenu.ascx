<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_TotalMatriculados

	Public RootMenu As AspNetReportMaker4_TotalMatriculados.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_TotalMatriculados Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_TotalMatriculados)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_TotalMatriculados.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(3, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("3", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Total_Matriculadossmry.aspx", -1, "", "", True)
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
