<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<% If gsExport = "" Then %>
<% End If %>
<% If gsExport = "" Or gsExport = "print" Or gsExport = "email" Then %>
<link rel="stylesheet" type="text/css" href="<%= EWRPT_PROJECT_STYLESHEET_FILENAME %>" />
<% End If %>
<meta name="generator" content="Zona Reportes" />
</head>
<body class="yui-skin-sam">
<% If gsExport = "" Or gsExport = "print" Or gsExport = "email" Then %>
<script type="text/javascript" src="http://yui.yahooapis.com/2.8.0/build/utilities/utilities.js"></script>
<% End If %>
<% If gsExport = "" Then %>
<% End If %>
<% If gsExport = "" Or gsExport = "print" Or gsExport = "email" Then %>
<script type="text/javascript" src="rptjs/ewrpt.js"></script>
<script type="text/javascript" src="rptjs/ewvalidator.js"></script>
<script src="rptjs/x.js" type="text/javascript"></script>
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
<div class="ewLayout">
	<div class="ewHeaderRow"><img src="rptimages/asprptmkrlogo4.png" alt="" border="0" /></div>
	<table cellspacing="0" class="ewContentTable">
		<tr>	
			<td class="ewContentColumn">
<% End If %>
