<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_alumnos_retirados_2013

	Public RootMenu As AspNetReportMaker4_alumnos_retirados_2013.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_alumnos_retirados_2013 Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_alumnos_retirados_2013)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_alumnos_retirados_2013.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(3, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("3", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Alumnos_Retiradossmry.aspx", -1, "", "", True)
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
