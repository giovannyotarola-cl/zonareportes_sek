@Code
	Conn = new crConnection()
	ReportLanguage = New crLanguage()
End Code
<!DOCTYPE html>
<html>
<head>
<title>@ReportLanguage.Phrase("MobileMenu")</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="@EWR_PROJECT_STYLESHEET_FILENAME" />
<link rel="stylesheet" type="text/css" href="aspxrptcss/ewmobile.css" />
<link rel="stylesheet" type="text/css" href="@ewr_jQueryFile("jquery.mobile-%v.min.css")" />
<script type="text/javascript" src="@ewr_jQueryFile("jquery-%v.min.js")"></script>
<script type="text/javascript">
	$(document).bind("mobileinit", function() {
		jQuery.mobile.ajaxEnabled = false;
		jQuery.mobile.ignoreContentEnabled = true;
	});
</script>
<script type="text/javascript" src="@ewr_jQueryFile("jquery.mobile-%v.min.js")"></script>
<meta name="generator" content="ASP.NET Report Maker v6.0.0" />
</head>
<body>
<div data-role="page">
	<div data-role="header">
		<h1>@Html.Raw(ReportLanguage.ProjectPhrase("BodyTitle"))</h1>
	</div>
	<div data-role="content">
@Code
	Dim RootMenu = New cMenu("RootMenu", True)
End Code
@Code

	' Generate all menu items
	RootMenu.IsRoot = True
	RootMenu.AddMenuItem(2, ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ReportLanguage.MenuPhrase("2", "MenuText") & ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "CanalDenunciassmry.vbhtml", -1, "", True, false)
	RootMenu.Render()
End Code
	</div> @* content *@
</div> @* page *@
</body>
</html>
@Code
	Conn.Close() ' Close connection
End Code
