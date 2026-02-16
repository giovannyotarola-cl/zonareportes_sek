<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
@Html.Raw("<html>")
<head>
	<title>@ReportLanguage.ProjectPhrase("BodyTitle")</title>
	<base href="@ewr_CurrentPath(false)">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
@If ewr_Empty(gsExport) Then
End If
@If ewr_Empty(gsExport) OrElse gsExport = "print" OrElse gsExport = "email" AndAlso giChartCnt > 0 Then
	@<script type="text/javascript">
	var EWR_YUI_HOST = "@ewr_YuiHost()";

	function ewr_GetScript(url) { document.write("<" + "script type=\"text/javascript\" src=\"" + url + "\"><" + "/script>"); }

	function ewr_GetCss(url) { document.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + url + "\" />"); }
	if (!window.YAHOO) ewr_GetScript(EWR_YUI_HOST + "build/utilities/utilities.js");
	</script>
End If
@If ewr_Empty(gsExport) Then
	@<script type="text/javascript">
	if (!YAHOO.env.getVersion("button")) ewr_GetCss(EWR_YUI_HOST + "build/button/assets/skins/sam/button.css");
	if (!YAHOO.env.getVersion("container")) ewr_GetCss(EWR_YUI_HOST + "build/container/assets/skins/sam/container.css");
	if (!YAHOO.env.getVersion("resize")) ewr_GetCss(EWR_YUI_HOST + "build/resize/assets/skins/sam/resize.css");
	</script>
End If
@If ewr_Empty(gsExport) OrElse gsExport = "print" Then
	@<link rel="stylesheet" type="text/css" href="@EWR_PROJECT_STYLESHEET_FILENAME" />
	If ewr_IsMobile() Then
	@<link rel="stylesheet" type="text/css" href="aspxrptcss/ewmobile.css" />
	End If
Else
	@<style type="text/css">
	@Code Dim cssfile = If(gsExport = "pdf", If(EWR_PDF_STYLESHEET_FILENAME = "", EWR_PROJECT_STYLESHEET_FILENAME, EWR_PDF_STYLESHEET_FILENAME), EWR_PROJECT_STYLESHEET_FILENAME) End Code
	@Html.Raw(ewr_LoadTxt(cssfile))
	</style>
End If
@If ewr_Empty(gsExport) Then
	@<script type="text/javascript">if (!YAHOO.env.getVersion("json")) ewr_GetScript(EWR_YUI_HOST + "build/json/json-min.js");</script>
	@<script type="text/javascript">if (!YAHOO.env.getVersion("button")) ewr_GetScript(EWR_YUI_HOST + "build/button/button-min.js");</script>
	@<script type="text/javascript">
	if (!window.Calendar)
		document.write("<link href=\"jscalendar/calendar-win2k-cold-1.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" title=\"win2k-1\">" +
			"<style type=\"text/css\">.ewCalendar {cursor: pointer;}</style>" +
			"<" + "script type=\"text/javascript\" src=\"jscalendar/calendar.js\"><" + "/script>" +
			"<" + "script type=\"text/javascript\" src=\"jscalendar/lang/calendar-en.js\"><" + "/script>" +
			"<" + "script type=\"text/javascript\" src=\"jscalendar/calendar-setup.js\"><" + "/script>" +
			"<" + "script type=\"text/javascript\">var ewSelectDateEvent = new YAHOO.util.CustomEvent(\"SelectDate\");<" + "/script>");
	// Create calendar

	function ewr_CreateCalendar(formid, id, format) {
		Calendar.setup({
			inputField: document.getElementById(formid).elements[id], // input field
			showsTime: / %H:%M:%S$/.test(format), // shows time
			ifFormat: format, // date format
			button: ewr_ConcatId(formid, id) // button ID
		});
	}
	// Custom event
	var ewSelectDateEvent = new YAHOO.util.CustomEvent("SelectDate");
	</script>
	@<script type="text/javascript">
	var EWR_LANGUAGE_ID = "@gsLanguage";
	var EWR_DATE_SEPARATOR = "/" || "/"; // Default date separator
	var EWR_DECIMAL_POINT = "@EWR_DECIMAL_POINT";
	var EWR_THOUSANDS_SEP = "@EWR_THOUSANDS_SEP";
	var EWR_DISABLE_BUTTON_ON_SUBMIT = true;
	var EWR_IMAGES_FOLDER = "aspxrptimages/"; // Image folder
	// Ajax settings
	var EWR_RECORD_DELIMITER = "@ewr_EscapeJs(EWR_RECORD_DELIMITER)";
	var EWR_FIELD_DELIMITER = "@ewr_EscapeJs(EWR_FIELD_DELIMITER)";
	var EWR_LOOKUP_FILE_NAME = "ewrajax6.vbhtml"; // Lookup file name
	var EWR_AUTO_SUGGEST_MAX_ENTRIES = @EWR_AUTO_SUGGEST_MAX_ENTRIES; // Auto-Suggest max entries
	</script>
	@<script type="text/javascript">
	if (!YAHOO.env.getVersion("container")) ewr_GetScript(EWR_YUI_HOST + "build/container/container-min.js");
	if (!YAHOO.env.getVersion("resize")) ewr_GetScript(EWR_YUI_HOST + "build/resize/resize-min.js");
	</script>			
End If
@If ewr_Empty(gsExport) OrElse gsExport = "print" OrElse gsExport = "email" AndAlso giChartCnt > 0 Then
	@<script type="text/javascript">if (!window.jQuery) ewr_GetScript("@ewr_jQueryFile("jquery-%v.min.js")");</script>
	If ewr_IsMobile() Then
	@<link rel="stylesheet" type="text/css" href="@ewr_jQueryFile("jquery.mobile-%v.min.css")" />
	@<script type="text/javascript">
	if (!window._jQuery && window.jQuery && !window.jQuery.mobile) {
		jQuery(document).bind("mobileinit", function() {
			jQuery.mobile.ajaxEnabled = false;
			jQuery.mobile.ignoreContentEnabled = true;
		});
		ewr_GetScript("@ewr_jQueryFile("jquery.mobile-%v.min.js")");
	}
	</script>
	End If
	@<script type="text/javascript" src="aspxrptjs/ewr6.js"></script>
End If
@If ewr_Empty(gsExport) Then
	@<script type="text/javascript" src=""></script>
	@<script type="text/javascript">
	@Html.Raw(ReportLanguage.ToJSON())
	</script>
End If
@If ewr_Empty(gsExport) OrElse gsExport = "print" OrElse gsExport = "email" AndAlso giChartCnt > 0 Then
@<script src="@EWR_FUSIONCHARTS_FREE_JSCLASS_FILE" type="text/javascript"></script>
End If
<meta name="generator" content="ASP.NET Report Maker v6.0.0" />
</head>
@Html.Raw("<body class=""yui-skin-sam"">")
@If ewr_Empty(gsExport) OrElse gsExport = "print" Then
If ewr_IsMobile() Then
@:<div data-role="page">
	@<div data-role="header">
		<a href="rmobilemenu.vbhtml">@Html.Raw(ReportLanguage.Phrase("MobileMenu"))</a>
		<h1 id="ewPageTitle"></h1>
	</div>
End If
End If
@If Not gbSkipHeaderFooter Then
	If ewr_Empty(gsExport) Then
		@:<div class="ewLayout">
		If Not ewr_IsMobile() Then
		End If
		If ewr_IsMobile() Then
			@:<div data-role="content" data-enhance="false">
			@:<table class="ewContentTable">
				@:<tr>
		Else
			@<!-- content (begin) -->
			@<!-- navigation -->
			@:<table class="ewContentTable">
				@:<tr>
		End If
					@:<td class="ewContentColumn">
					@<p class="ewSpacer"><span class="ewSiteTitle">@Html.Raw(ReportLanguage.ProjectPhrase("BodyTitle"))</span></p>
	End If
End If @* !gbSkipHeaderFooter *@
