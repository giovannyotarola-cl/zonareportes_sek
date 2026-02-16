<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>
<% If gsExport = "" Or gsExport = "print" Then %>
<% Else ' Export to Word/Excel/Email %>
<% If UCase(EWRPT_CHARSET) = "UTF-8" Then %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<% End If %>
<% End If %>
<% If gsExport = "" Then %>
<% End If %>
<% If gsExport = "" Then %>
<link rel="stylesheet" type="text/css" href="<%= ewrpt_YuiHost() %>build/button/assets/skins/sam/button.css">
<link rel="stylesheet" type="text/css" href="<%= ewrpt_YuiHost() %>build/container/assets/skins/sam/container.css">
<link rel="stylesheet" type="text/css" href="<%= ewrpt_YuiHost() %>build/resize/assets/skins/sam/resize.css">
<% End If %>
<% If gsExport = "" Or gsExport = "print" Then %>
<link rel="stylesheet" type="text/css" href="<%= EWRPT_PROJECT_STYLESHEET_FILENAME %>">
<% Else %>
<style type="text/css">
<%= ewrpt_LoadFile(EWRPT_PROJECT_STYLESHEET_FILENAME) %>
</style>
<% End If %>
<% If gsExport = "" Or gsExport = "print" Or gsExport = "email" Then %>
<script type="text/javascript" src="<%= ewrpt_YuiHost() %>build/utilities/utilities.js"></script>
<% End If %>
<% If gsExport = "" Then %>
<script type="text/javascript" src="<%= ewrpt_YuiHost() %>build/button/button-min.js"></script>
<script type="text/javascript">
<!--
var EWRPT_LANGUAGE_ID = "<%= gsLanguage %>";
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
//-->
</script>
<script type="text/javascript" src="<%= ewrpt_YuiHost() %>build/container/container-min.js"></script>
<script type="text/javascript" src="<%= ewrpt_YuiHost() %>build/resize/resize.js"></script>
<% End If %>
<% If gsExport = "" Or gsExport = "print" Or gsExport = "email" Then %>
<script type="text/javascript" src="rptjs/ewrpt.js"></script>
<script type="text/javascript" src="rptjs/ewvalidator.js"></script>
<% End If %>
<% If gsExport = "" Then %>
<script type="text/javascript">
<!--
<%= ReportLanguage.ToJSON %>
//-->
</script>
<script type="text/javascript">
var EWRPT_IMAGES_FOLDER = "rptimages";
</script>
<% End If %>
<meta name="generator" content="">
</head>
<body class="yui-skin-sam">
<% If gsExport = "" Then %>
<div class="ewLayout">
	<table cellspacing="0" class="ewContentTable">
		<tr>	
			<td class="ewContentColumn">
<% End If %>
