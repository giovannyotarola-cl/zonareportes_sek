<%@ Control Language="C#" %>
<script runat="server">

	public AspNetReportMaker4_project1 ParentPage;

	public AspNetReportMaker4_project1.cMenu RootMenu;

	//
	// ASP.NET Page_Load event
	//

	protected void Page_Load(object sender, System.EventArgs e) {
		if (Page is AspNetReportMaker4_project1) {
			ParentPage = (AspNetReportMaker4_project1)Page;			
			RootMenu = new AspNetReportMaker4_project1.cMenu("RootMenu", true);
			RootMenu.ParentPage = ParentPage;
			if (ParentPage.ReportLanguage == null)
				ParentPage.ReportLanguage = new AspNetReportMaker4_project1.crLanguage(new AspNetReportMaker4_project1.AspNetReportMakerPage());

			// Generate all menu items
			RootMenu = new AspNetReportMaker4_project1.cMenu("RootMenu", true);		
			RootMenu.AddMenuItem(2, ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") + ParentPage.ReportLanguage.MenuPhrase("2", "MenuText") + ParentPage.ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "EstadoAcademicosmry.aspx", -1, "", "", true);
		}			
	}
</script>
<!-- Begin Main Menu -->
<div class="aspnetreportmaker">
<%
RootMenu.Render();
%>
</div>
<!-- End Main Menu -->
