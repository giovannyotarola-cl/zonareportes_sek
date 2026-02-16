<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_E_Percepcion

	Public RootMenu As AspNetReportMaker4_E_Percepcion.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_E_Percepcion Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_E_Percepcion)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_E_Percepcion.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Encuesta_percepciF3n_a_Alumnossmry.aspx", -1, "", "", True)
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
