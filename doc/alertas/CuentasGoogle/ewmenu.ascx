<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_CuentasGoogle

	Public RootMenu As AspNetReportMaker4_CuentasGoogle.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_CuentasGoogle Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_CuentasGoogle)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_CuentasGoogle.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Solicitud_Cuentas_Googlesmry.aspx", -1, "", "", True)
				RootMenu.AddMenuItem(3, ParentPage.ReportLanguage.Phrase("SimpleReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("3", "MenuText") & ParentPage.ReportLanguage.Phrase("SimpleReportMenuItemSuffix"), "Cuentas_Googlerpt.aspx", -1, "", "", True)
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
