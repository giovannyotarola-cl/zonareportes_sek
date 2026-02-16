<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_dicomBajarPagare

	Public RootMenu As AspNetReportMaker4_dicomBajarPagare.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_dicomBajarPagare Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_dicomBajarPagare)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_dicomBajarPagare.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "BajarDicomPagaresmry.aspx", -1, "", "", True)
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
