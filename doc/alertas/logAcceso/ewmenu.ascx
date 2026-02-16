<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_logAcceso

	Public RootMenu As AspNetReportMaker4_logAcceso.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_logAcceso Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_logAcceso)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_logAcceso.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Log_Accesosmry.aspx", -1, "", "", True)
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
