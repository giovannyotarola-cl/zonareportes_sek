<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_dicomBajarPagareGarantia

	Public RootMenu As AspNetReportMaker4_dicomBajarPagareGarantia.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_dicomBajarPagareGarantia Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_dicomBajarPagareGarantia)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_dicomBajarPagareGarantia.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "bajar_pagareGtiasmry.aspx", -1, "", "", True)
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
