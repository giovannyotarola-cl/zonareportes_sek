<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_postul_cae_2012_mat_anterior

	Public RootMenu As AspNetReportMaker4_postul_cae_2012_mat_anterior.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_postul_cae_2012_mat_anterior Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_postul_cae_2012_mat_anterior)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_postul_cae_2012_mat_anterior.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Postulantes_CAE_20122C_Matr2E_Anterior_2012smry.aspx", -1, "", "", True)
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
