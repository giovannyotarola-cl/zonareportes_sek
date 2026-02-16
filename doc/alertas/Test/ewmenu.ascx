<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_project1

	Public RootMenu As AspNetReportMaker4_project1.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_project1 Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_project1)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_project1.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Detalle_WebPaysmry.aspx", -1, "", "", True)
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
