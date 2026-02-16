<!-- Begin Main Menu -->
<div class="aspnetreportmaker">
@Code
	Dim RootMenu = New cMenu("RootMenu")
End Code
@Code

	' Generate all menu items
	RootMenu.IsRoot = True
	RootMenu.AddMenuItem(2, ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ReportLanguage.MenuPhrase("2", "MenuText") & ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "CanalDenunciassmry.vbhtml", -1, "", True, false)
	RootMenu.Render()
End Code
</div>
<!-- End Main Menu -->
