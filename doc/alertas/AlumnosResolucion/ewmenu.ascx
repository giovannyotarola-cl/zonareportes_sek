<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_AlumnosResolucion

	Public RootMenu As AspNetReportMaker4_AlumnosResolucion.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_AlumnosResolucion Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_AlumnosResolucion)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_AlumnosResolucion.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(3, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("3", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Alumnos_con_resolucionessmry.aspx", -1, "", "", True)
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
