<%@ Control Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_EncuestaDocenteAlumnos

	Public RootMenu As AspNetReportMaker4_EncuestaDocenteAlumnos.cMenu	

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_EncuestaDocenteAlumnos Then
			ParentPage = CType(Me.Page, AspNetReportMaker4_EncuestaDocenteAlumnos)

			' Generate all menu items
			RootMenu = New AspNetReportMaker4_EncuestaDocenteAlumnos.cMenu("RootMenu", True)		
				RootMenu.AddMenuItem(3, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ParentPage.ReportLanguage.MenuPhrase("3", "MenuText") & ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Encuesta_Docente_Alumnosssmry.aspx", -1, "", "", True)
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
