<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_cargaCaeAnt2012

	Public RootMenu As AspNetReportMaker4_cargaCaeAnt2012.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_cargaCaeAnt2012 Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_cargaCaeAnt2012)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_cargaCaeAnt2012.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Carga_CAE_2012_Mat2E_Antes_2012smry.aspx", -1, "", "", True)
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
