<!--#include file="rptinc/ewrcfg5.asp"-->
<!--#include file="rptinc/ewrfn5.asp"-->
<!--#include file="rptinc/ewrusrfn.asp"-->
<%
Session.CodePage = 65001
If (Session("idusuario") = False) Then
	Response.Redirect("../../default.asp?s=out")
	
End If
' Open connection to the database
Dim uPermiso 
Set conn = Server.CreateObject("ADODB.Connection")
Set uPermiso = Server.CreateObject ("ADODB.Recordset")
conn.Open EWRPT_DB_CONNECTION_STRING

' ASP Report Maker 3.0+ - Table level configuration (Asignaturas Historicas)
'Table Level Constants
uPermiso.Open "SELECT * FROM IF_USUARIO_ACCESO WHERE USERID = '" & Session("idusuario") & "' AND CODLINK = '" &Request("acc") & "'", conn

If (uPermiso.EOF = true) then
	Response.Redirect("../../report.asp?aut=false")
End If

'response.Write "SELECT * FROM IF_USUARIO_ACCESO WHERE USERID = '" & Session("idusuario") & "' AND CODLINK = '" &Request("acc") & "'"
' Variable for table object
Dim Report1

' Define table class
Class crReport1
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "Report1"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "Report1"
	End Property

	' Table type
	Public Property Get TableType()
		TableType = "REPORT"
	End Property

	' Table caption
	Public Property Get TableCaption()
		TableCaption = ReportLanguage.TablePhrase(TableVar, "TblCaption")
	End Property

	' Session Group Per Page
	Public Property Get GroupPerPage()
		GroupPerPage = Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_grpperpage")
	End Property

	Public Property Let GroupPerPage(v)
		Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_grpperpage") = v
	End Property

	' Session Start Group
	Public Property Get StartGroup()
		StartGroup = Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_start")
	End Property

	Public Property Let StartGroup(v)
		Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_start") = v
	End Property

	' Session Order By
	Public Property Get OrderBy()
		OrderBy = Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_orderby")
	End Property

	Public Property Let OrderBy(v)
		Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_orderby") = v
	End Property

	' Create new chart object
	Private Function NewChtObj(tblvar, tblname, chtvar, chtname, xfldname, yfldname, sfldname, chttype, chtsmrytype, width, height)
		Dim cht
		Set cht = New crChart
		cht.TblVar = tblvar
		cht.TblName = tblname
		cht.ChartVar = chtvar
		cht.ChartName = chtname
		cht.ChartXFldName = xfldname
		cht.ChartYFldName = yfldname
		cht.ChartSFldName = sfldname
		cht.ChartType = chttype
		cht.ChartSummaryType = chtsmrytype
		cht.ChartWidth = width
		cht.ChartHeight = height
		Set NewChtObj = cht
	End Function

	' USERNAME
	Private m_USERNAME

	Public Property Get USERNAME()
		Dim ar
		If Not IsObject(m_USERNAME) Then
			Set m_USERNAME = NewFldObj("Report1", "Report1", "x_USERNAME", "USERNAME", "[USERNAME]", 200, EWRPT_DATATYPE_STRING, -1)
			m_USERNAME.GroupingFieldId = 2
			m_USERNAME.DateFilter = ""
			m_USERNAME.SqlSelect = ""
			m_USERNAME.SqlOrderBy = ""
			m_USERNAME.FldGroupByType = ""
			m_USERNAME.FldGroupInt = "0"
			m_USERNAME.FldGroupSql = ""
		End If
		Set USERNAME = m_USERNAME
	End Property

	' USERCARR
	Private m_USERCARR

	Public Property Get USERCARR()
		Dim ar
		If Not IsObject(m_USERCARR) Then
			Set m_USERCARR = NewFldObj("Report1", "Report1", "x_USERCARR", "USERCARR", "[USERCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			m_USERCARR.DateFilter = ""
			m_USERCARR.SqlSelect = ""
			m_USERCARR.SqlOrderBy = ""
		End If
		Set USERCARR = m_USERCARR
	End Property

	' USERDES
	Private m_USERDES

	Public Property Get USERDES()
		Dim ar
		If Not IsObject(m_USERDES) Then
			Set m_USERDES = NewFldObj("Report1", "Report1", "x_USERDES", "USERDES", "[USERDES]", 200, EWRPT_DATATYPE_STRING, -1)
			m_USERDES.GroupingFieldId = 1
			m_USERDES.DateFilter = ""
			m_USERDES.SqlSelect = ""
			m_USERDES.SqlOrderBy = ""
			m_USERDES.FldGroupByType = ""
			m_USERDES.FldGroupInt = "0"
			m_USERDES.FldGroupSql = ""
		End If
		Set USERDES = m_USERDES
	End Property

	' USERRUT
	Private m_USERRUT

	Public Property Get USERRUT()
		Dim ar
		If Not IsObject(m_USERRUT) Then
			Set m_USERRUT = NewFldObj("Report1", "Report1", "x_USERRUT", "USERRUT", "[USERRUT]", 200, EWRPT_DATATYPE_STRING, -1)
			m_USERRUT.DateFilter = ""
			m_USERRUT.SqlSelect = ""
			m_USERRUT.SqlOrderBy = ""
		End If
		Set USERRUT = m_USERRUT
	End Property

	' fecha
	Private m_fecha

	Public Property Get fecha()
		Dim ar
		If Not IsObject(m_fecha) Then
			Set m_fecha = NewFldObj("Report1", "Report1", "x_fecha", "fecha", "[fecha]", 135, EWRPT_DATATYPE_DATE, 7)
			m_fecha.GroupingFieldId = 3
			m_fecha.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateDMY"), "%s", "/")
			m_fecha.DateFilter = ""
			m_fecha.SqlSelect = ""
			m_fecha.SqlOrderBy = ""
			m_fecha.FldGroupByType = ""
			m_fecha.FldGroupInt = "0"
			m_fecha.FldGroupSql = ""
		End If
		Set fecha = m_fecha
	End Property

	' codReporte
	Private m_codReporte

	Public Property Get codReporte()
		Dim ar
		If Not IsObject(m_codReporte) Then
			Set m_codReporte = NewFldObj("Report1", "Report1", "x_codReporte", "codReporte", "[codReporte]", 200, EWRPT_DATATYPE_STRING, -1)
			m_codReporte.DateFilter = ""
			m_codReporte.SqlSelect = ""
			m_codReporte.SqlOrderBy = ""
		End If
		Set codReporte = m_codReporte
	End Property

	' documento
	Private m_documento

	Public Property Get documento()
		Dim ar
		If Not IsObject(m_documento) Then
			Set m_documento = NewFldObj("Report1", "Report1", "x_documento", "documento", "[documento]", 200, EWRPT_DATATYPE_STRING, -1)
			m_documento.DateFilter = ""
			m_documento.SqlSelect = ""
			m_documento.SqlOrderBy = ""
		End If
		Set documento = m_documento
	End Property

	' ip
	Private m_ip

	Public Property Get ip()
		Dim ar
		If Not IsObject(m_ip) Then
			Set m_ip = NewFldObj("Report1", "Report1", "x_ip", "ip", "[ip]", 200, EWRPT_DATATYPE_STRING, -1)
			m_ip.DateFilter = ""
			m_ip.SqlSelect = ""
			m_ip.SqlOrderBy = ""
		End If
		Set ip = m_ip
	End Property

	' Create new field object
	Private Function NewFldObj(tblvar, tblname, fldvar, fldname, fldexpression, fldtype, flddatatype, flddtformat)
		Dim fld
		Set fld = New crField
		fld.TblVar = tblvar
		fld.TblName = tblname
		fld.FldVar = fldvar
		fld.FldName = fldname
		fld.FldExpression = fldexpression
		fld.FldType = fldtype
		fld.FldDataType = flddatatype
		fld.FldDateTimeFormat = flddtformat
		Set NewFldObj = fld
	End Function
	Dim Fields ' Fields
	Dim Export ' Export
	Dim ExportAll
	Dim UseTokenInUrl
	Dim RowType ' Row type
	Dim RowTotalType ' Row total type
	Dim RowTotalSubType ' Row total subtype
	Dim RowGroupLevel ' Row group level
	Dim RowAttrs  ' Row attributes

	' Reset attributes for table object
	Sub ResetAttrs()
		RowAttrs.Clear()
		If IsArray(Fields) Then
			For i = 0 to UBound(Fields,2)
				Set fld = Fields(1,i)
				Call fld.ResetAttrs()
			Next
		End If
	End Sub

	'
	' Class Initialize
	'
	Private Sub Class_Initialize()
		RestoreSession = False
		ExportAll = True
		UseTokenInUrl = EWRPT_USE_TOKEN_IN_URL
		ShowCurrentFilter = EWRPT_SHOW_CURRENT_FILTER
		FilterPanelOption = EWRPT_FILTER_PANEL_OPTION
		Set RowAttrs = New crAttributes ' Row attributes
		Call ewrpt_SetArObj(Fields, "USERNAME", USERNAME)
		Call ewrpt_SetArObj(Fields, "USERCARR", USERCARR)
		Call ewrpt_SetArObj(Fields, "USERDES", USERDES)
		Call ewrpt_SetArObj(Fields, "USERRUT", USERRUT)
		Call ewrpt_SetArObj(Fields, "fecha", fecha)
		Call ewrpt_SetArObj(Fields, "codReporte", codReporte)
		Call ewrpt_SetArObj(Fields, "documento", documento)
		Call ewrpt_SetArObj(Fields, "ip", ip)
	End Sub

	' Terminate
	Private Sub Class_Terminate()
		Set RowAttrs = Nothing
	End Sub

	' Single column sort
	Public Sub UpdateSort(ofld)
		Dim sLastSort, sThisSort
		If (CurrentOrder = ofld.FldName) Then
			sLastSort = ofld.Sort
			If CurrentOrderType = "ASC" Or CurrentOrderType = "DESC" Then
				sThisSort = CurrentOrderType
			Else
				sThisSort = ewrpt_IIf(sLastSort = "ASC", "DESC", "ASC")
			End If
			ofld.Sort = sThisSort
		Else
			If ofld.GroupingFieldId = 0 Then ofld.Sort = ""
		End If
	End Sub

	' Get Sort SQL
	Public Function SortSql()
		Dim sSortSql
		sSortSql = ""
		Dim i, fld
		If IsArray(Fields) Then
			For i = 0 to UBound(Fields,2)
				Set fld = Fields(1,i)
				If fld.Sort <> "" Then
					If sSortSql <> "" Then sSortSql = sSortSql & ", "
					If (fld.FldGroupSql <> "") Then
						sSortSql = sSortSql & Replace(fld.FldGroupSql, "%s", fld.FldExpression) & " " & fld.Sort
					Else
						sSortSql = sSortSql & fld.FldExpression & " " & fld.Sort
					End If
				End If
			Next
		End If
		SortSql = sSortSql
	End Function

	' Table level SQL
	Public Property Get SqlFrom() ' From
		SqlFrom = "[View2]"
	End Property

	Public Property Get SqlSelect() ' Select
		SqlSelect = "SELECT [USERNAME], [USERCARR], [USERDES], [USERRUT], [fecha], [codReporte], [documento], [ip] FROM " & SqlFrom
	End Property

	Public Property Get SqlWhere() ' Where
		SqlWhere = ""
	End Property

	Public Property Get SqlGroupBy() ' Group By
		SqlGroupBy = ""
	End Property

	Public Property Get SqlHaving() ' Having
		SqlHaving = ""
	End Property

	Public Property Get SqlOrderBy() ' Order By
		SqlOrderBy = "[USERDES] ASC, [USERNAME] ASC, [fecha] ASC"
	End Property

	' Table Level Group SQL
	Public Property Get SqlFirstGroupField()
		SqlFirstGroupField = "[USERDES]"
	End Property

	Public Property Get SqlSelectGroup()
		SqlSelectGroup = "SELECT DISTINCT " & SqlFirstGroupField & " FROM " & SqlFrom
	End Property

	Public Property Get SqlOrderByGroup()
		SqlOrderByGroup = "[USERDES] ASC"
	End Property

	Public Property Get SqlSelectAgg()
		SqlSelectAgg = "SELECT * FROM " & SqlFrom
	End Property

	Public Property Get SqlAggPfx()
		SqlAggPfx = ""
	End Property

	Public Property Get SqlAggSfx()
		SqlAggSfx = ""
	End Property

	Public Property Get SqlSelectCount()
		SqlSelectCount = "SELECT COUNT(*) FROM " & SqlFrom
	End Property

	' Sort URL
	Function SortUrl(fld)
		SortUrl = ""
	End Function

	' Row attributes
	Function RowAttributes()
		Dim sAtt, Attr, Value, i
		sAtt = ""
		For i = 0 to UBound(RowAttrs.Attributes)
			Attr = RowAttrs.Attributes(i)(0)
			Value = RowAttrs.Attributes(i)(1)
			If Attr <> "" And Value <> "" Then
				sAtt = sAtt & " " & Attr & "=""" & Value & """"
			End If
		Next
		RowAttributes = sAtt
	End Function

	' Field object by fldvar
	Function GetField(fldvar)
		Dim i
		If IsArray(Fields) Then
			For i = 0 to UBound(Fields,2)
				If Fields(0,i) = fldvar Then
					Set GetField = Fields(1,i)
					Exit Function
				End If
			Next
		End If
		Set GetField = Nothing
	End Function

	' Table level events
	' Row Rendering event
	Sub Row_Rendering()

		' Enter your code here	
	End Sub

	' Cell Rendered event
	Sub Cell_Rendered(Field, CurrentValue, ViewValue, ViewAttrs, CellAttrs, HrefValue)

		' ViewValue = "xxx"
		' ViewAttrs.AddAttribute "style", "xxx", True

	End Sub

	' Row Rendered event
	Sub Row_Rendered()

		' To view properties of field class, use:
		' Response.Write <FieldName>.AsString

	End Sub

	' Load Filters event
	Sub Filters_Load()

		' Enter your code here
		' Example: Register/Unregister Custom Extended Filter
		'ewrpt_RegisterFilter <Field>, "StartsWithA", "Starts With A", "GetStartsWithAFilter"
		'ewrpt_UnregisterFilter <Field>, "StartsWithA"

	End Sub

	' Page Filter Validated event
	Sub Page_FilterValidated()

		' Example:
		'Table.Field.SearchValue = "your search criteria" ' Search value

	End Sub

	' Chart Rendering event
	Sub Chart_Rendering(chart)

		' To view properties of chart class, use:
		' Response.Write chart.AsString

	End Sub

	' Chart Rendered event
	Sub Chart_Rendered(chart, chartxml)

		' To view properties of chart class, use:
		' Response.Write chart.AsString
		' Example:
		' Dim doc
		' Set doc = chart.XmlDoc ' Get the DOMDocument object
		' Enter your code to manipulate the DOMDocument object here
		' chartxml = doc.XML ' Output the XML

	End Sub

	' Email Sending event
	Function Email_Sending(Email, Args)

		'Response.Write Email.AsString
		'Response.Write "Keys of Args: " & Join(Args.Keys, ", ")
		'Response.End

		Email_Sending = True
	End Function
End Class
%>
<% Call ewrpt_Header(False, EWRPT_CHARSET) %>
<% Server.ScriptTimeOut = 240 %>
<%

' Define page object
Dim Report1_summary
Set Report1_summary = New crReport1_summary
Set Page = Report1_summary

' Page init processing
Call Report1_summary.Page_Init()

' Page main processing
Call Report1_summary.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<script type="text/javascript">
// Create page object
var Report1_summary = new ewrpt_Page("Report1_summary");
// page properties
Report1_summary.PageID = "summary"; // page ID
Report1_summary.FormID = "fReport1summaryfilter"; // form ID
var EWRPT_PAGE_ID = Report1_summary.PageID;
// extend page with Chart_Rendering function
Report1_summary.Chart_Rendering =  
 function(chart, chartid) { // DO NOT CHANGE THIS LINE!
 	//alert(chartid);
 }
// extend page with Chart_Rendered function
Report1_summary.Chart_Rendered =  
 function(chart, chartid) { // DO NOT CHANGE THIS LINE!
 	//alert(chartid);
 }
</script>
<% If Report1.Export = "" Then %>
<script type="text/javascript">
<!--
// extend page with ValidateForm function
Report1_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_fecha;
	if (elm && !ewrpt_CheckEuroDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(Report1.fecha.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv2_fecha;
	if (elm && !ewrpt_CheckEuroDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(Report1.fecha.FldErrMsg) %>"))
			return false;
	}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Report1_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If EWRPT_CLIENT_VALIDATE Then %>
Report1_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Report1_summary.ValidateRequired = false; // no JavaScript validation
<% End If %>
//-->
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" media="all" href="css/titles.css"/>
<link rel="stylesheet" type="text/css" media="all" href="jscalendar/calendar-win2k-1.css" title="win2k-1">
<script type="text/javascript" src="jscalendar/calendar.js"></script>
<script type="text/javascript" src="jscalendar/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar/calendar-setup.js"></script>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
//-->
</script>
<% End If %>
<script src="<%= EWRPT_FUSIONCHARTS_FREE_JSCLASS_FILE %>" type="text/javascript"></script>
<% If Report1.Export = "" Then %>
<div id="ewrpt_PopupFilter"><div class="bd"></div></div>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
</script>
<% End If %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<div id="underline">
	<h1><%= Report1.TableCaption %></h1>
</div>
<% If sExport = "" Then %>
&nbsp;&nbsp;<a href="Report1smry.asp?export=excel&acc=<%=Request("acc")%>"><img src="images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
<% End If %>
<% Report1_summary.ShowPageHeader() %>
<% Report1_summary.ShowMessage() %>
<br><br>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspreportmaker">
	<!-- Left slot -->
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspreportmaker">
	<!-- center slot -->
<!-- summary report starts -->
<div id="report_summary">
<% If Report1.Export = "" Then %>
<%
If (Report1.FilterPanelOption = 2) Or (Report1.FilterPanelOption = 3 And Report1_summary.FilterApplied) Or (Report1_summary.Filter = "0=101") Then
	sButtonImage = "rptimages/collapse.gif"
	sDivDisplay = ""
Else
	sButtonImage = "rptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span><br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fReport1summaryfilter" id="fReport1summaryfilter" action="<%= ewrpt_CurrentPage%>?acc=<%=Request("acc")%>" class="ewForm" onsubmit="return Report1_summary.ValidateForm(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr id="r_USERNAME">
		<td><span class="aspreportmaker"><%= Report1.USERNAME.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_USERNAME" id="sv_USERNAME"<%= ewrpt_IIf(Report1_summary.ClearExtFilter = "Report1_USERNAME", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Report1.USERNAME.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Report1.USERNAME.AdvancedFilters) Then
	cntf = UBound(Report1.USERNAME.AdvancedFilters)+1
Else
	cntf = 0
End If
If IsArray(Report1.USERNAME.DropDownList) Then
	cntd = UBound(Report1.USERNAME.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Report1.USERNAME.AdvancedFilters(i).Enabled Then
%>
		<option value="<%= Report1.USERNAME.AdvancedFilters(i).ID %>"<% If ewrpt_MatchedFilterValue(Report1.USERNAME.DropDownValue, Report1.USERNAME.AdvancedFilters(i).ID) Then Response.Write " selected=""selected""" %>><%= Report1.USERNAME.AdvancedFilters(i).Name %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Report1.USERNAME.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Report1.USERNAME.DropDownValue, Report1.USERNAME.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Report1.USERNAME.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr id="r_USERCARR">
		<td><span class="aspreportmaker"><%= Report1.USERCARR.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_USERCARR" id="sv_USERCARR"<%= ewrpt_IIf(Report1_summary.ClearExtFilter = "Report1_USERCARR", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Report1.USERCARR.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Report1.USERCARR.AdvancedFilters) Then
	cntf = UBound(Report1.USERCARR.AdvancedFilters)+1
Else
	cntf = 0
End If
If IsArray(Report1.USERCARR.DropDownList) Then
	cntd = UBound(Report1.USERCARR.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Report1.USERCARR.AdvancedFilters(i).Enabled Then
%>
		<option value="<%= Report1.USERCARR.AdvancedFilters(i).ID %>"<% If ewrpt_MatchedFilterValue(Report1.USERCARR.DropDownValue, Report1.USERCARR.AdvancedFilters(i).ID) Then Response.Write " selected=""selected""" %>><%= Report1.USERCARR.AdvancedFilters(i).Name %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Report1.USERCARR.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Report1.USERCARR.DropDownValue, Report1.USERCARR.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Report1.USERCARR.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr id="r_USERDES">
		<td><span class="aspreportmaker"><%= Report1.USERDES.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_USERDES" id="sv_USERDES"<%= ewrpt_IIf(Report1_summary.ClearExtFilter = "Report1_USERDES", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Report1.USERDES.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Report1.USERDES.AdvancedFilters) Then
	cntf = UBound(Report1.USERDES.AdvancedFilters)+1
Else
	cntf = 0
End If
If IsArray(Report1.USERDES.DropDownList) Then
	cntd = UBound(Report1.USERDES.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Report1.USERDES.AdvancedFilters(i).Enabled Then
%>
		<option value="<%= Report1.USERDES.AdvancedFilters(i).ID %>"<% If ewrpt_MatchedFilterValue(Report1.USERDES.DropDownValue, Report1.USERDES.AdvancedFilters(i).ID) Then Response.Write " selected=""selected""" %>><%= Report1.USERDES.AdvancedFilters(i).Name %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Report1.USERDES.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Report1.USERDES.DropDownValue, Report1.USERDES.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Report1.USERDES.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr id="r_USERRUT">
		<td><span class="aspreportmaker"><%= Report1.USERRUT.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_USERRUT" id="so1_USERRUT" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_USERRUT" id="sv1_USERRUT" size="30" maxlength="50" value="<%= ewrpt_HtmlEncode(Report1.USERRUT.SearchValue) %>"<% If Report1_summary.ClearExtFilter = "Report1_USERRUT" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_fecha">
		<td><span class="aspreportmaker"><%= Report1.fecha.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_fecha" id="so1_fecha" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_fecha" id="sv1_fecha" value="<%= ewrpt_HtmlEncode(Report1.fecha.SearchValue) %>"<% If Report1_summary.ClearExtFilter = "Report1_fecha" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv1_fecha" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv1_fecha", // ID of the input field
	ifFormat : "%d/%m/%Y", // the date format
	button : "csv1_fecha" // ID of the button
})
</script>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw1_fecha" name="btw1_fecha">&nbsp;&nbsp;</span></td>
				<td><span class="aspreportmaker" id="btw1_fecha" name="btw1_fecha">
<input type="text" name="sv2_fecha" id="sv2_fecha" value="<%= ewrpt_HtmlEncode(Report1.fecha.SearchValue2) %>"<% If Report1_summary.ClearExtFilter = "Report1_fecha" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv2_fecha" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv2_fecha", // ID of the input field
	ifFormat : "%d/%m/%Y", // the date format
	button : "csv2_fecha" // ID of the button
})
</script>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_documento">
		<td><span class="aspreportmaker"><%= Report1.documento.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_documento" id="sv_documento"<%= ewrpt_IIf(Report1_summary.ClearExtFilter = "Report1_documento", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Report1.documento.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Report1.documento.AdvancedFilters) Then
	cntf = UBound(Report1.documento.AdvancedFilters)+1
Else
	cntf = 0
End If
If IsArray(Report1.documento.DropDownList) Then
	cntd = UBound(Report1.documento.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Report1.documento.AdvancedFilters(i).Enabled Then
%>
		<option value="<%= Report1.documento.AdvancedFilters(i).ID %>"<% If ewrpt_MatchedFilterValue(Report1.documento.DropDownValue, Report1.documento.AdvancedFilters(i).ID) Then Response.Write " selected=""selected""" %>><%= Report1.documento.AdvancedFilters(i).Name %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Report1.documento.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Report1.documento.DropDownValue, Report1.documento.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Report1.documento.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
</table>
<table class="ewRptExtFilter">
	<tr>
		<td><span class="aspreportmaker">
        	<input type="hidden" name="acc" value="<%=Request("acc")%>">
			<input type="Submit" name="Submit" id="Submit" value="<%= ReportLanguage.Phrase("Search") %>">&nbsp;
			<input type="Reset" name="Reset" id="Reset" value="<%= ReportLanguage.Phrase("Reset") %>">&nbsp;
		</span></td>
	</tr>
</table>
</form>
<!-- Search form (end) -->
</div>
<br>
<% End If %>
<% If Report1.ShowCurrentFilter Then %>
<div id="ewrptFilterList">
<% Call Report1_summary.ShowFilterList() %>
</div>
<br>
<% End If %>
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<!-- Report Grid (Begin) -->
<div class="ewGridMiddlePanel">
<table class="<%= Report1_summary.ReportTableClass %>" cellspacing="0">
<%

' Set the last group to display if not export all
If (Report1.ExportAll And Report1.Export <> "") Then
	Report1_summary.StopGrp = Report1_summary.TotalGrps
Else
	Report1_summary.StopGrp = Report1_summary.StartGrp + Report1_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(Report1_summary.StopGrp) > CLng(Report1_summary.TotalGrps) Then
	Report1_summary.StopGrp = Report1_summary.TotalGrps
End If
Report1_summary.RecCount = 0

' Init Summary Values
Call Report1_summary.ResetLevelSummary(0)

' Get first row
If Report1_summary.TotalGrps > 0 Then
	Call Report1_summary.GetGrpRow(1)
	Report1_summary.GrpCount = 1
End If
Do While (Not rsgrp.Eof And Report1_summary.GrpCount <= Report1_summary.DisplayGrps) Or (Report1_summary.ShowFirstHeader)

	' Show Header
	If Report1_summary.ShowFirstHeader Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.USERDES.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.USERDES) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.USERDES.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.USERDES) %>',0);"><%= Report1.USERDES.FldCaption %></td><td style="width: 10px;">
		<% If Report1.USERDES.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.USERDES.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.USERNAME.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.USERNAME) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.USERNAME.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.USERNAME) %>',0);"><%= Report1.USERNAME.FldCaption %></td><td style="width: 10px;">
		<% If Report1.USERNAME.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.USERNAME.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.fecha.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.fecha) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.fecha.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.fecha) %>',0);"><%= Report1.fecha.FldCaption %></td><td style="width: 10px;">
		<% If Report1.fecha.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.fecha.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.USERCARR.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.USERCARR) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.USERCARR.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.USERCARR) %>',0);"><%= Report1.USERCARR.FldCaption %></td><td style="width: 10px;">
		<% If Report1.USERCARR.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.USERCARR.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.USERRUT.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.USERRUT) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.USERRUT.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.USERRUT) %>',0);"><%= Report1.USERRUT.FldCaption %></td><td style="width: 10px;">
		<% If Report1.USERRUT.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.USERRUT.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.codReporte.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.codReporte) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.codReporte.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.codReporte) %>',0);"><%= Report1.codReporte.FldCaption %></td><td style="width: 10px;">
		<% If Report1.codReporte.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.codReporte.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.documento.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.documento) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.documento.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.documento) %>',0);"><%= Report1.documento.FldCaption %></td><td style="width: 10px;">
		<% If Report1.documento.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.documento.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.ip.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.ip) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.ip.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.ip) %>',0);"><%= Report1.ip.FldCaption %></td><td style="width: 10px;">
		<% If Report1.ip.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.ip.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Report1_summary.ShowFirstHeader = False
	End If

	' Build detail SQL
	sWhere = ewrpt_DetailFilterSQL(Report1.USERDES, Report1.SqlFirstGroupField, Report1.USERDES.GroupValue)
	If Report1_summary.Filter <> "" Then
		sWhere = "(" & Report1_summary.Filter & ") AND (" & sWhere & ")"
	End If
	sSql = ewrpt_BuildReportSql(Report1.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.SqlOrderBy, sWhere, Report1_summary.Sort)
	Call ewrpt_SetDebugMsg("(Detail SQL): " & sSql)
	Set rs = ewrpt_LoadRs(sSql)
	If Not rs.Eof Then Call Report1_summary.GetRow(1)
	Do While Not rs.Eof  ' Loop detail records
		Report1_summary.RecCount = Report1_summary.RecCount + 1

		' Render detail row
		Call Report1.ResetAttrs()
		Report1.RowType = EWRPT_ROWTYPE_DETAIL
		Call Report1_summary.RenderRow()
%>
	<tr<%= Report1.RowAttributes %>>
		<td<%= Report1.USERDES.CellAttributes %>>
<span<%= Report1.USERDES.ViewAttributes %>><%= Report1.USERDES.GroupViewValue %></span></td>
		<td<%= Report1.USERNAME.CellAttributes %>>
<span<%= Report1.USERNAME.ViewAttributes %>><%= Report1.USERNAME.GroupViewValue %></span></td>
		<td<%= Report1.fecha.CellAttributes %>>
<span<%= Report1.fecha.ViewAttributes %>><%= Report1.fecha.GroupViewValue %></span></td>
		<td<%= Report1.USERCARR.CellAttributes %>>
<span<%= Report1.USERCARR.ViewAttributes %>><%= Report1.USERCARR.ListViewValue %></span>
</td>
		<td<%= Report1.USERRUT.CellAttributes %>>
<span<%= Report1.USERRUT.ViewAttributes %>><%= Report1.USERRUT.ListViewValue %></span>
</td>
		<td<%= Report1.codReporte.CellAttributes %>>
<span<%= Report1.codReporte.ViewAttributes %>><%= Report1.codReporte.ListViewValue %></span>
</td>
		<td<%= Report1.documento.CellAttributes %>>
<span<%= Report1.documento.ViewAttributes %>><%= Report1.documento.ListViewValue %></span>
</td>
		<td<%= Report1.ip.CellAttributes %>>
<span<%= Report1.ip.ViewAttributes %>><%= Report1.ip.ListViewValue %></span>
</td>
	</tr>
<%

		' Accumulate page summary
		Call Report1_summary.AccumulateSummary()

		' Get next record
		Call Report1_summary.GetRow(2)

		' Show Footers
%>
<%
	Loop ' End detail records loop
	rs.Close
	Set rs = Nothing
%>
<%
%>
<%
			Call Report1.ResetAttrs()
			Report1.RowType = EWRPT_ROWTYPE_TOTAL
			Report1.RowTotalType = EWRPT_ROWTOTAL_GROUP
			Report1.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
			Report1.RowGroupLevel = 1
			Call Report1_summary.RenderRow()
%>
	<tr<%= Report1.RowAttributes %>>
		<td colspan="8"<%= Report1.USERDES.CellAttributes %>><%= ReportLanguage.Phrase("RptSumHead") %>&nbsp;<%= Report1.USERDES.FldCaption %>:&nbsp;<%= Report1.USERDES.GroupViewValue %>&nbsp;(<%= ewrpt_FormatNumber(Report1_summary.Cnt(1,0),0,-2,-2,-2) %><%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<%

			' Reset level 1 summary
			Call Report1_summary.ResetLevelSummary(1)
%>
<%

	' Next group
	Call Report1_summary.GetGrpRow(2)
	Report1_summary.GrpCount = Report1_summary.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
<%
If Report1_summary.TotalGrps > 0 Then
	Call Report1.ResetAttrs()
	Report1.RowType = EWRPT_ROWTYPE_TOTAL
	Report1.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Report1.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Report1.RowAttrs.AddAttribute "class", "ewRptGrandSummary", True
	Call Report1_summary.RenderRow()
%>
	<!-- tr><td colspan="8"><span class="aspreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Report1.RowAttributes %>><td colspan="8"><%= ReportLanguage.Phrase("RptGrandTotal") %>&nbsp;(<%= ewrpt_FormatNumber(Report1_summary.TotCount,0,-2,-2,-2) %><%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If Report1.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="<%= ewrpt_CurrentPage %>?acc=<%=Request("acc")%>" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(Report1_summary.StartGrp, Report1_summary.DisplayGrps, Report1_summary.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="<%= ewrpt_CurrentPage %>?start=<%= Pager.FirstButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="<%= ewrpt_CurrentPage %>?start=<%= Pager.PrevButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="<%= ewrpt_CurrentPage %>?start=<%= Pager.NextButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="<%= ewrpt_CurrentPage %>?start=<%= Pager.LastButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %>&nbsp;<%= Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("Record") %>&nbsp;<%= Pager.FromIndex %>&nbsp;<%= ReportLanguage.Phrase("To") %>&nbsp;<%= Pager.ToIndex %>&nbsp;<%= ReportLanguage.Phrase("Of") %>&nbsp;<%=  Pager.RecordCount %></span>
<% Else %>
	<% If Report1_summary.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If Report1_summary.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<input type="hidden" name="acc" value="<%=Request("acc")%>">
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="10"<% If Report1_summary.DisplayGrps = 10 Then Response.Write " selected=""selected""" %>>10</option>
<option value="20"<% If Report1_summary.DisplayGrps = 20 Then Response.Write " selected=""selected""" %>>20</option>
<option value="50"<% If Report1_summary.DisplayGrps = 50 Then Response.Write " selected=""selected""" %>>50</option>
<option value="ALL"<% If Report1.GroupPerPage = -1 Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("AllRecords") %></option>
</select>
		</span></td>
<% End If %>
	</tr>
</table>
</form>
</div>
<% End If %>
</td></tr></table>
</div>
<!-- Summary Report Ends -->
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspreportmaker">
	<!-- Right slot -->
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspreportmaker">
	<!-- Bottom slot -->
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<%
Report1_summary.ShowPageFooter()
If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg()
%>
<%

' Close recordset and connection
rsgrp.Close
Set rsgrp = Nothing
%>
<% If Report1.Export = "" Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
<!--#include file="rptinc/footer.asp"-->
<%

' Drop page object
Set Report1_summary = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crReport1_summary

	' Page ID
	Public Property Get PageID()
		PageID = "summary"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "Report1"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "Report1_summary"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If Report1.UseTokenInUrl Then PageUrl = PageUrl & "t=" & Report1.TableVar & "&" ' add page token
	End Property

	' Export URLs
	Dim ExportPrintUrl
	Dim ExportExcelUrl
	Dim ExportWordUrl
	Dim ReportTableClass

	' Message
	Public Property Get Message()
		Message = Session(EWRPT_SESSION_MESSAGE)
	End Property

	Public Property Let Message(v)
		If Session(EWRPT_SESSION_MESSAGE) <> "" Then ' Append
			Session(EWRPT_SESSION_MESSAGE) = Session(EWRPT_SESSION_MESSAGE) & "<br>" & v
		Else
			Session(EWRPT_SESSION_MESSAGE) = v
		End If
	End Property

	' Show Message
	Public Sub ShowMessage()
		Dim sMessage
		sMessage = Message
		Call Message_Showing(sMessage)
		If sMessage <> "" Then Response.Write "<p><span class=""ewMessage"">" & sMessage & "</span></p>"
		Session(EWRPT_SESSION_MESSAGE) = "" ' Clear message in Session
	End Sub
	Dim PageHeader
	Dim PageFooter

	' Show Page Header
	Sub ShowPageHeader()
		Dim sHeader
		sHeader = PageHeader
		Call Page_DataRendering(sHeader)
		If sHeader <> "" Then ' Header exists, display
			Response.Write "<p><span class=""aspreportmaker"">" & sHeader & "</span></p>"
		End If
	End Sub

	' Show Page Footer
	Sub ShowPageFooter()
		sFooter = PageFooter
		Call Page_DataRendered(sFooter)
		If sFooter <> "" Then ' Fotoer exists, display
			Response.Write "<p><span class=""aspreportmaker"">" & sFooter & "</span></p>"
		End If
	End Sub

	' Validate page request
	Public Function IsPageRequest()
		If Report1.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (Report1.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (Report1.TableVar = Request.QueryString("t"))
			End If
		Else
			IsPageRequest = True
		End If
	End Function

	' -----------------------------------------------------------------
	'  Class initialize
	'  - init objects
	'  - open ADO connection
	'
	Private Sub Class_Initialize()
		StartTimer = Timer ' Init start time

		' Language object
		Set ReportLanguage = New crLanguage

		' Initialize table object
		Set Report1 = New crReport1
		Set Table = Report1

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "summary"

		' Initialize table name
		EWRPT_TABLE_NAME = "Report1"

		' Open connection
		Call ewrpt_Connect()

		' Export options
		Set ExportOptions = New crListOptions
		ExportOptions.Tag = "span"
		ExportOptions.Separator = "&nbsp;&nbsp;"
	End Sub

	' 
	'  Page_Init
	'
	Sub Page_Init()

		' Restore session
		If Request.QueryString("session").Count > 0 Then
			Call RestoreFromSession()
		End If

		' Get export parameters
		If Request.QueryString("export").Count > 0 Then
			Report1.Export = Request.QueryString("export")
		End If
		gsExport = Report1.Export ' Get export parameter, used in header
		gsExportFile = Report1.TableVar ' Get export file, used in header
		If Report1.Export = "excel" Then
			Response.ContentType = "application/vnd.ms-excel"
			Response.AddHeader "Content-Disposition", "attachment; filename=" & gsExportFile & ".xls"
		End If

		' Setup export options
		Call SetupExportOptions()

		' Global page loading event
		Call Page_Loading()

		' Page load event
		Call Page_Load()

		' Export to Email (Load content via XMLHttp)
		If Report1.Export = "email" Then
			Dim sContent, sPage, sParm
			sPage = ewrpt_CurrentPage
			sParm = "export=print&session=" & GetSessionValues()
			If Request.QueryString("contenttype") = "html" Then
				sParm = sParm & "&html5=1"
			End If
			sContent = ewrpt_LoadContentFromUrl(ewrpt_ConvertFullUrl(sPage) & "?" & sParm)
			Call ExportEmail(sContent)
			Call Page_Terminate(sPage)
		End If
	End Sub

	Private Function GetSessionValues()
		Dim wrkstr, i, ar
		wrkstr = "cmd=restoresession"

		'wrkstr = "&filter=" & Report1.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(Report1.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(Report1.StartGroup&""))
		wrkstr = ew_Encode(TEAencrypt(wrkstr, EWRPT_RANDOM_KEY))
		GetSessionValues = wrkstr
	End Function

	Private Sub RestoreFromSession()
		Dim QS, wrkstr, cmd, usr, pwd
		QS = Split(Request.Querystring, "&")
		wrkstr = GetQSValue(QS, "session")
		wrkstr = TEAdecrypt(wrkstr, EWRPT_RANDOM_KEY)
		QS = Split(wrkstr, "&")
		cmd = GetQSValue(QS, "cmd")
		If cmd = "restoresession" Then
			usr = GetQSValue(QS, "u")
			usr = TEAdecrypt(usr, EWRPT_RANDOM_KEY)
			pwd = GetQSValue(QS, "p")
			pwd = TEAdecrypt(pwd, EWRPT_RANDOM_KEY)
			Call Security.ValidateUser(usr, pwd, True)
			Session(EWRPT_SESSION_FILTER) = GetQSValue(QS, "f")
			Session(EWRPT_SESSION_COLUMN_SELECTION) = GetQSArray(QS, "c")
			Report1.OrderBy = GetQSValue(QS, "o")
			Report1.StartGroup = GetQSValue(QS, "s")
			Report1.RestoreSession = True
		End If
	End Sub

	Private Function GetQSValue(QS, Key)
		Dim kv, i
		If IsArray(QS) Then
			For i = 0 To UBound(QS)
				kv = Split(QS(i), "=")
				If kv(0) = Key And UBound(kv) >= 1 Then
					GetQSValue = ew_Decode(kv(1))
					Exit Function
				End If
			Next
		End If
		GetQSValue = ""
	End Function

	Private Function GetQSArray(QS, Key)
		Dim kv, i, ar, val
		ar = ""
		If IsArray(QS) Then
			For i = 0 To UBound(QS)
				kv = Split(QS(i), "=")
				If kv(0) = Key And UBound(kv) >= 1 Then
					val = ew_Decode(kv(1))
					If IsArray(ar) Then
						ReDim Preserve ar(UBound(ar)+1)
					Else
						ReDim ar(0)
					End If
					ar(UBound(ar)) = val
				End If
			Next
		End If
		GetQSArray = ar
	End Function

	' Set up export options
	Sub SetupExportOptions()
		Dim item

		' Printer friendly
		ExportOptions.Add("print")
		Set item = ExportOptions.GetItem("print")
		item.Body = "<a href=""" & ExportPrintUrl & """>" & ReportLanguage.Phrase("PrinterFriendly") & "</a>"
		item.Visible = False

		' Export to Excel
		ExportOptions.Add("excel")
		Set item = ExportOptions.GetItem("excel")
		item.Body = "<a href=""" & ExportExcelUrl & """>" & ReportLanguage.Phrase("ExportToExcel") & "</a>"
		item.Visible = True

		' Export to Word
		ExportOptions.Add("word")
		Set item = ExportOptions.GetItem("word")
		item.Body = "<a href=""" & ExportWordUrl & """>" & ReportLanguage.Phrase("ExportToWord") & "</a>"
		item.Visible = False

		' Export to Email
		ExportOptions.Add("email")
		Set item = ExportOptions.GetItem("email")
		item.Body = "<a name=""emf_Report1"" id=""emf_Report1"" href=""javascript:void(0);"" onclick=""ewrpt_EmailDialogShow({lnk:'emf_Report1',hdr:ewLanguage.Phrase('ExportToEmail')});"">" & ReportLanguage.Phrase("ExportToEmail") & "</a>"
		item.Visible = False

		' Reset filter
		ExportOptions.Add("resetfilter")
		Set item = ExportOptions.GetItem("resetfilter")
		item.Body = "<a href=""" & ewrpt_CurrentPage & "?cmd=reset"">" & ReportLanguage.Phrase("ResetAllFilter") & "</a>"
		item.Visible = True
		Call SetupExportOptionsExt()

		' Hide options for export
		If Report1.Export <> "" Then
			ExportOptions.HideAllOptions()
		End If

		' Set up table class
		If Report1.Export = "word" Or Report1.Export = "excel" Then
			ReportTableClass = "ewTable"
		Else
			ReportTableClass = "ewTable ewTableSeparate"
		End If
	End Sub

	'
	' Class_Terminate
	'
	Private Sub Class_Terminate()
		Call Page_Terminate("")
	End Sub

	'
	' Page_Terminate
	'
	Sub Page_Terminate(url)

		' Page unload event
		Call Page_Unload()

		' Global page unloaded event
		Call Page_Unloaded()

		' Close connection
		If Not (conn Is Nothing) Then conn.Close
		Set conn = Nothing
		Set Report1 = Nothing

		' Go to url if specified
		Dim sRedirectUrl
		sReDirectUrl = url
		If sReDirectUrl <> "" Then
			If Response.Buffer Then Response.Clear
			Response.Redirect sReDirectUrl
		End If
	End Sub

	' Initialize common variables
	Dim ExportOptions ' Export options

	' Paging variables
	Dim RecCount ' Record count
	Dim StartGrp ' Start group
	Dim StopGrp ' Stop group
	Dim TotalGrps ' Total groups
	Dim GrpCount ' Group count
	Dim DisplayGrps ' Groups per page
	Dim GrpRange
	Dim Sort
	Dim Filter
	Dim UserIDFilter

	' Clear field for ext filter
	Dim ClearExtFilter
	Dim FilterApplied
	Dim ShowFirstHeader
	Dim Cnt, Col, Val, Smry, Mn, Mx, GrandSmry, GrandMn, GrandMx
	Dim TotCount

	'
	' Page main
	'
	Sub Page_Main()
		RecCount = 0 ' Record count
		StartGrp = 0 ' Start group
		StopGrp = 0 ' Stop group
		TotalGrps = 0 ' Total groups
		GrpCount = 0 ' Group count
		DisplayGrps = 20 ' Groups per page
		GrpRange = 10

		' Clear field for ext filter
		ClearExtFilter = ""

		' Filter
		UserIDFilter = ""
		Filter = ""

		' 1st dimension = no of groups (level 0 used for grand total)
		' 2nd dimension = no of fields

		Dim nDtls, nGrps
		nDtls = 5
		nGrps = 3
		ReDim Col(nDtls), Val(nDtls), Cnt(nGrps, nDtls)
		ReDim Smry(nGrps, nDtls), Mn(nGrps, nDtls), Mx(nGrps, nDtls)
		ReDim GrandSmry(nDtls), GrandMn(nDtls), GrandMx(nDtls)

		' Set up if accumulation required
		Col(1) = False
		Col(2) = False
		Col(3) = False
		Col(4) = False
		Col(5) = False

		' Set up groups per page dynamically
		SetUpDisplayGrps()

		' Load default filter values
		Call LoadDefaultFilters()

		' Load custom filters
		Call Report1.Filters_Load()

		' Set up popup filter
		Call SetupPopup()

		' Extended filter
		Dim sExtendedFilter
		sExtendedFilter = ""

		' Get dropdown values
		Call GetExtendedFilterValues()

		' Build extended filter
		sExtendedFilter = GetExtendedFilter()
		If sExtendedFilter <> "" Then
			If Filter <> "" Then
				Filter = "(" & Filter & ") AND (" & sExtendedFilter & ")"
			Else
				Filter = sExtendedFilter
			End If
		End If

		' Build popup filter
		Dim sPopupFilter
		sPopupFilter = GetPopupFilter()
		IF sPopupFilter <> "" Then
			If Filter <> "" Then
				Filter = "(" & Filter & ") AND (" & sPopupFilter & ")"
			Else
				Filter = sPopupFilter
			End If
		End If

		' Check if filter applied
		FilterApplied = CheckFilter()
		ExportOptions.GetItem("resetfilter").Visible = FilterApplied

		' Get sort
		Sort = GetSort()

		' Restore filter/sort from Session
		If Report1.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total group count
		Dim sSql, sGrpSort
		sGrpSort = ewrpt_UpdateSortFields(Report1.SqlOrderByGroup, Sort, 2) ' Get grouping field only
		sSql = ewrpt_BuildReportSql(Report1.SqlSelectGroup, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.SqlOrderByGroup, Filter, sGrpSort)
		Call ewrpt_SetDebugMsg("(Group SQL): " & sSql)
		TotalGrps = GetGrpCnt(sSql)

		' Display all records
		If DisplayGrps <= 0 Then
			DisplayGrps = TotalGrps
		End If
		StartGrp = 1

		' Show header
		ShowFirstHeader = (TotalGrps > 0)

		'ShowFirstHeader = True ' Uncomment to always show header
		' Set up start position if not export all

		If Report1.ExportAll And Report1.Export <> "" Then
			DisplayGrps = TotalGrps
		Else
			Call SetUpStartGroup()
		End If

		' Hide all options if export
		If Report1.Export <> "" Then
			Call ExportOptions.HideAllOptions()
		End If

		' Get current page groups
		Set rsgrp = GetGrpRs(sSql, StartGrp, DisplayGrps)

		' Init detail recordset
		Set rs = Nothing
	End Sub

	' Check level break
	Function ChkLvlBreak(lvl)
		Select Case lvl
			Case 1: ChkLvlBreak = _
				(IsNull(Report1.USERDES.CurrentValue) And Not IsNull(Report1.USERDES.OldValue)) Or _
				(Not IsNull(Report1.USERDES.CurrentValue) And IsNull(Report1.USERDES.OldValue)) Or _
				(Report1.USERDES.GroupValue <> Report1.USERDES.GroupOldValue)
			Case 2: ChkLvlBreak = _
				(IsNull(Report1.USERNAME.CurrentValue) And Not IsNull(Report1.USERNAME.OldValue)) Or _
				(Not IsNull(Report1.USERNAME.CurrentValue) And IsNull(Report1.USERNAME.OldValue)) Or _
				(Report1.USERNAME.GroupValue <> Report1.USERNAME.GroupOldValue) Or ChkLvlBreak(1) ' Recurse upper level
			Case 3: ChkLvlBreak = _
				(IsNull(Report1.fecha.CurrentValue) And Not IsNull(Report1.fecha.OldValue)) Or _
				(Not IsNull(Report1.fecha.CurrentValue) And IsNull(Report1.fecha.OldValue)) Or _
				(Report1.fecha.GroupValue <> Report1.fecha.GroupOldValue) Or ChkLvlBreak(2) ' Recurse upper level
		End Select
	End Function

	' Accummulate summary
	Sub AccumulateSummary()
		Dim valwrk, ix, iy
		For ix = 0 to UBound(Smry,1)
			For iy = 1 to UBound(Smry,2)
				Cnt(ix,iy) = Cnt(ix,iy) + 1
				If Col(iy) Then
					valwrk = Val(iy)
					If IsNull(valwrk) Or Not IsNumeric(valwrk) Then

						' skip
					Else
						Smry(ix,iy) = Smry(ix,iy) + valwrk
						If IsNull(Mn(ix,iy)) Then
							Mn(ix,iy) = valwrk
							Mx(ix,iy) = valwrk
						Else
							If Mn(ix,iy) > valwrk Then Mn(ix,iy) = valwrk
							If Mx(ix,iy) < valwrk Then Mx(ix,iy) = valwrk
						End If
					End If
				End If
			Next
		Next
		For ix = 1 to UBound(Smry,1)
			Cnt(ix,0) = Cnt(ix,0) + 1
		Next
	End Sub

	' Reset level summary
	Sub ResetLevelSummary(lvl)
		Dim ix, iy

		' Clear summary values
		For ix = lvl to UBound(Smry,1)
			For iy = 1 to UBound(Smry,2)
				Cnt(ix,iy) = 0
				If Col(iy) Then
					Smry(ix,iy) = 0
					Mn(ix,iy) = Null
					Mx(ix,iy) = Null
				End If
			Next
		Next
		For ix = lvl to UBound(Smry,1)
			Cnt(ix,0) = 0
		Next

		' Reset record count
		RecCount = 0
	End Sub

	' Accummulate grand summary
	Sub AccumulateGrandSummary()
		Dim iy, valwrk
		Cnt(0,0) = Cnt(0,0) + 1
		For iy = 1 to UBound(GrandSmry)
			If Col(iy) Then
				valwrk = Val(iy)
				If IsNull(valwrk) Or Not IsNumeric(valwrk) Then

					' skip
				Else
					GrandSmry(iy) = GrandSmry(iy) + valwrk
					If IsNull(GrandMn(iy)) Then
						GrandMn(iy) = valwrk
						GrandMx(iy) = valwrk
					Else
						If GrandMn(iy) > valwrk Then GrandMn(iy) = valwrk
						If GrandMx(iy) < valwrk Then GrandMx(iy) = valwrk
					End If
				End If
			End If
		Next
	End Sub

	' Get group count
	Function GetGrpCnt(sql)
		Dim grpcnt, grpval, nextgrpval, bNewGroup

		'Response.Write "sql (GetGrpCnt): " & sql & "<br>"
		Set rsgrpcnt = ewrpt_LoadRs(sql)
		grpcnt = rsgrpcnt.RecordCount
		rsgrpcnt.Close
		Set rsgrpcnt = Nothing
		GetGrpCnt = grpcnt
	End Function

	' Get group rs
	Function GetGrpRs(sql, start, grps)
		Dim wrksql, rswrk
		Dim grpcnt, grpval, nextgrpval, bNewGroup
		wrksql = sql
		Set rswrk = ewrpt_LoadRs(sql)
		If Not rswrk.Eof And start > 1 Then rswrk.Move (start-1)
		Set GetGrpRs = rswrk
	End Function

	' Get group row values
	Function GetGrpRow(opt)
		Dim grpval, nextgrpval
		If Not IsObject(rsgrp) Then Exit Function
		If opt = 1 Then ' Get first group

			'rsgrp.MoveFirst ' NOTE: no need to move position
			Report1.USERDES.DbValue = "" ' Init first value
		Else ' Get next group
			If Not rsgrp.Eof Then rsgrp.MoveNext
		End If
		If Not rsgrp.Eof Then Report1.USERDES.DbValue = ewrpt_GetValue(rsgrp(0))
		If rsgrp.Eof Then
			Report1.USERDES.DbValue = ""
		End If
	End Function

	' Get row values
	Sub GetRow(opt)
		If opt = 1 Then ' Get first row

			'If Not rs.Eof Then rs.MoveFirst ' NOTE: no need to move position
		Else ' Get next row
			If Not rs.Eof Then rs.MoveNext
		End If
		If Not rs.Eof Then
			Report1.USERNAME.DbValue = ewrpt_GetValue(rs("USERNAME"))
			Report1.USERCARR.DbValue = ewrpt_GetValue(rs("USERCARR"))
			If (opt <> 1) Then Report1.USERDES.DbValue = ewrpt_GroupValue(Report1.USERDES, ewrpt_GetValue(rs("USERDES")))
			Report1.USERRUT.DbValue = ewrpt_GetValue(rs("USERRUT"))
			Report1.fecha.DbValue = ewrpt_GetValue(rs("fecha"))
			Report1.codReporte.DbValue = ewrpt_GetValue(rs("codReporte"))
			Report1.documento.DbValue = ewrpt_GetValue(rs("documento"))
			Report1.ip.DbValue = ewrpt_GetValue(rs("ip"))
			Val(1) = Report1.USERCARR.CurrentValue
			Val(2) = Report1.USERRUT.CurrentValue
			Val(3) = Report1.codReporte.CurrentValue
			Val(4) = Report1.documento.CurrentValue
			Val(5) = Report1.ip.CurrentValue
		Else
			Report1.USERNAME.DbValue = ""
			Report1.USERCARR.DbValue = ""
			Report1.USERDES.DbValue = ""
			Report1.USERRUT.DbValue = ""
			Report1.fecha.DbValue = ""
			Report1.codReporte.DbValue = ""
			Report1.documento.DbValue = ""
			Report1.ip.DbValue = ""
		End If
	End Sub

	'-------------------------------------------------------------------------------
	' Function SetUpStartGroup
	' - Set up Starting Record parameters based on Pager Navigation
	' - Variables setup: StartGrp
	Sub SetUpStartGroup()
		Dim nPageNo

		' Exit if DisplayGrps = 0
		If DisplayGrps = 0 Then Exit Sub

		' Check for a START parameter
		If Request.QueryString(EWRPT_TABLE_START_GROUP).Count > 0 Then
			StartGrp = Request.QueryString(EWRPT_TABLE_START_GROUP)
			Report1.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				Report1.StartGroup = nStartGrp
			Else
				StartGrp = Report1.StartGroup
			End If
		Else
			StartGrp = Report1.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			Report1.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			Report1.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			Report1.StartGroup = StartGrp
		End If
	End Sub

	' Set up popup
	Sub SetupPopup()
		Dim sName, arValues, cntValues
		Dim i, ar
		Dim sSql, rswrk
		Dim bNullValue, bEmptyValue
		Dim grpval

		' Initialize popup
		' Process post back form

		If Request.Form.Count > 0 Then
			sName = Request.Form("popup") ' Get popup form name
			If sName <> "" Then
				cntValues = Request.Form("sel_" & sName).Count
				If cntValues > 0 Then
					Redim arValues(cntValues-1)
					For i = 1 to cntValues
						arValues(i-1) = Request.Form("sel_" & sName)(i)
					Next
					If Trim(arValues(0)) = "" Then ' Select all
						arValues = EWRPT_INIT_VALUE
					End If
					If Not ewrpt_MatchedArray(arValues, Session("sel_" & sName)) Then
						If HasSessionFilterValues(sName) Then
							ClearExtFilter = sName ' Clear extended filter for this field
						End If
					End If
					Session("sel_" & sName) = arValues
					Session("rf_" & sName) = Request.Form("rf_" & sName)
					Session("rt_" & sName) = Request.Form("rt_" & sName)
					Call ResetPager()
				End If
			End If

		' Get Reset Cmd
		ElseIf Request.QueryString("cmd").Count > 0 Then
			Dim sCmd
			sCmd = Request.QueryString("cmd")
			If LCase(sCmd) = "reset" Then
				Call ResetPager()
			End If
		End If

		' Load selection criteria to array
	End Sub

	' Reset pager to starting position
	Sub ResetPager()
		StartGrp = 1
		Report1.StartGroup = StartGrp
	End Sub

	'-------------------------------------------------------------------------------
	' Function SetUpDisplayGrps
	' - Set up Number of Groups displayed per page based on Form element GrpPerPage
	' - Variables setup: nDisplayGrps
	Sub SetUpDisplayGrps()
		Dim sWrk
		sWrk = Request.QueryString(EWRPT_TABLE_GROUP_PER_PAGE)
		If sWrk <> "" Then
			If IsNumeric(sWrk) Then
				DisplayGrps = CInt(sWrk)
			Else
				If UCase(sWrk) = "ALL" Then ' Display All Records
					DisplayGrps = -1
				Else
					DisplayGrps = 20 ' Non-numeric, Load Default
				End If
			End If
			Report1.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			Report1.StartGroup = nStartGrp
		Else
			If Report1.GroupPerPage <> "" Then
				DisplayGrps = Report1.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 20 ' Load Default
			End If
		End If
	End Sub

	' Render row
	Sub RenderRow()
		If Report1.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' Get total count from sql directly
			Dim sSql, rstot
			sSql = ewrpt_BuildReportSql(Report1.SqlSelectCount, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, "", Filter, "")
			Call ewrpt_SetDebugMsg("(Total SQL): " & sSql)
			Set rstot = ewrpt_LoadRs(sSql)
			If Not rstot.Eof Then
				TotCount = ewrpt_GetValue(rstot(0))
			Else
				TotCount = 0
			End If
		End If

		' Call Row_Rendering event
		Call Report1.Row_Rendering()

		' --------------------
		'  Render view codes
		' --------------------

		If Report1.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' USERDES
			Report1.USERDES.GroupViewValue = Report1.USERDES.GroupOldValue
			Report1.USERDES.CellAttrs.UpdateAttribute "class", ewrpt_IIf(Report1.RowGroupLevel = 1, "ewRptGrpSummary1", "ewRptGrpField1")
			Report1.USERDES.GroupViewValue = ewrpt_DisplayGroupValue(Report1.USERDES, Report1.USERDES.GroupViewValue)
			Report1.USERDES.GroupSummaryOldValue = Report1.USERDES.GroupSummaryValue
			Report1.USERDES.GroupSummaryValue = Report1.USERDES.GroupViewValue
			Report1.USERDES.GroupSummaryViewValue = ewrpt_IIf(Report1.USERDES.GroupSummaryOldValue <> Report1.USERDES.GroupSummaryValue, Report1.USERDES.GroupSummaryValue, "&nbsp;")

			' USERNAME
			Report1.USERNAME.GroupViewValue = Report1.USERNAME.GroupOldValue
			Report1.USERNAME.CellAttrs.UpdateAttribute "class", ewrpt_IIf(Report1.RowGroupLevel = 2, "ewRptGrpSummary2", "ewRptGrpField2")
			Report1.USERNAME.GroupViewValue = ewrpt_DisplayGroupValue(Report1.USERNAME, Report1.USERNAME.GroupViewValue)
			Report1.USERNAME.GroupSummaryOldValue = Report1.USERNAME.GroupSummaryValue
			Report1.USERNAME.GroupSummaryValue = Report1.USERNAME.GroupViewValue
			Report1.USERNAME.GroupSummaryViewValue = ewrpt_IIf(Report1.USERNAME.GroupSummaryOldValue <> Report1.USERNAME.GroupSummaryValue, Report1.USERNAME.GroupSummaryValue, "&nbsp;")

			' fecha
			Report1.fecha.GroupViewValue = Report1.fecha.GroupOldValue
			Report1.fecha.GroupViewValue = ewrpt_FormatDateTime(Report1.fecha.GroupViewValue, 7)
			Report1.fecha.CellAttrs.UpdateAttribute "class", ewrpt_IIf(Report1.RowGroupLevel = 3, "ewRptGrpSummary3", "ewRptGrpField3")
			Report1.fecha.GroupViewValue = ewrpt_DisplayGroupValue(Report1.fecha, Report1.fecha.GroupViewValue)
			Report1.fecha.GroupSummaryOldValue = Report1.fecha.GroupSummaryValue
			Report1.fecha.GroupSummaryValue = Report1.fecha.GroupViewValue
			Report1.fecha.GroupSummaryViewValue = ewrpt_IIf(Report1.fecha.GroupSummaryOldValue <> Report1.fecha.GroupSummaryValue, Report1.fecha.GroupSummaryValue, "&nbsp;")

			' USERDES
			Report1.USERDES.HrefValue = ""

			' USERNAME
			Report1.USERNAME.HrefValue = ""

			' fecha
			Report1.fecha.HrefValue = ""
		Else

			' USERDES
			Report1.USERDES.GroupViewValue = Report1.USERDES.GroupValue
			Report1.USERDES.CellAttrs.UpdateAttribute "class", "ewRptGrpField1"
			Report1.USERDES.GroupViewValue = ewrpt_DisplayGroupValue(Report1.USERDES, Report1.USERDES.GroupViewValue)
			If Report1.USERDES.GroupValue = Report1.USERDES.GroupOldValue And Not ChkLvlBreak(1) Then
				Report1.USERDES.GroupViewValue = "&nbsp;"
			End If

			' USERNAME
			Report1.USERNAME.GroupViewValue = Report1.USERNAME.GroupValue
			Report1.USERNAME.CellAttrs.UpdateAttribute "class", "ewRptGrpField2"
			Report1.USERNAME.GroupViewValue = ewrpt_DisplayGroupValue(Report1.USERNAME, Report1.USERNAME.GroupViewValue)
			If Report1.USERNAME.GroupValue = Report1.USERNAME.GroupOldValue And Not ChkLvlBreak(2) Then
				Report1.USERNAME.GroupViewValue = "&nbsp;"
			End If

			' fecha
			Report1.fecha.GroupViewValue = Report1.fecha.GroupValue
			Report1.fecha.GroupViewValue = ewrpt_FormatDateTime(Report1.fecha.GroupViewValue, 7)
			Report1.fecha.CellAttrs.UpdateAttribute "class", "ewRptGrpField3"
			Report1.fecha.GroupViewValue = ewrpt_DisplayGroupValue(Report1.fecha, Report1.fecha.GroupViewValue)
			If Report1.fecha.GroupValue = Report1.fecha.GroupOldValue And Not ChkLvlBreak(3) Then
				Report1.fecha.GroupViewValue = "&nbsp;"
			End If

			' USERCARR
			Report1.USERCARR.ViewValue = Report1.USERCARR.CurrentValue
			Report1.USERCARR.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' USERRUT
			Report1.USERRUT.ViewValue = Report1.USERRUT.CurrentValue
			Report1.USERRUT.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' codReporte
			Report1.codReporte.ViewValue = Report1.codReporte.CurrentValue
			Report1.codReporte.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' documento
			Report1.documento.ViewValue = Report1.documento.CurrentValue
			Report1.documento.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' ip
			Report1.ip.ViewValue = Report1.ip.CurrentValue
			Report1.ip.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' USERDES
			Report1.USERDES.HrefValue = ""

			' USERNAME
			Report1.USERNAME.HrefValue = ""

			' fecha
			Report1.fecha.HrefValue = ""

			' USERCARR
			Report1.USERCARR.HrefValue = ""

			' USERRUT
			Report1.USERRUT.HrefValue = ""

			' codReporte
			Report1.codReporte.HrefValue = ""

			' documento
			Report1.documento.HrefValue = ""

			' ip
			Report1.ip.HrefValue = ""
		End If

		' Call Cell_Rendered event
		If Report1.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' USERDES
			Call Report1.Cell_Rendered(Report1.USERDES, Report1.USERDES.GroupViewValue, Report1.USERDES.GroupViewValue, Report1.USERDES.ViewAttrs, Report1.USERDES.CellAttrs, Report1.USERDES.HrefValue)

			' USERNAME
			Call Report1.Cell_Rendered(Report1.USERNAME, Report1.USERNAME.GroupViewValue, Report1.USERNAME.GroupViewValue, Report1.USERNAME.ViewAttrs, Report1.USERNAME.CellAttrs, Report1.USERNAME.HrefValue)

			' fecha
			Call Report1.Cell_Rendered(Report1.fecha, Report1.fecha.GroupViewValue, Report1.fecha.GroupViewValue, Report1.fecha.ViewAttrs, Report1.fecha.CellAttrs, Report1.fecha.HrefValue)
		Else

			' USERDES
			Call Report1.Cell_Rendered(Report1.USERDES, Report1.USERDES.GroupValue, Report1.USERDES.GroupViewValue, Report1.USERDES.ViewAttrs, Report1.USERDES.CellAttrs, Report1.USERDES.HrefValue)

			' USERNAME
			Call Report1.Cell_Rendered(Report1.USERNAME, Report1.USERNAME.GroupValue, Report1.USERNAME.GroupViewValue, Report1.USERNAME.ViewAttrs, Report1.USERNAME.CellAttrs, Report1.USERNAME.HrefValue)

			' fecha
			Call Report1.Cell_Rendered(Report1.fecha, Report1.fecha.GroupValue, Report1.fecha.GroupViewValue, Report1.fecha.ViewAttrs, Report1.fecha.CellAttrs, Report1.fecha.HrefValue)

			' USERCARR
			Call Report1.Cell_Rendered(Report1.USERCARR, Report1.USERCARR.CurrentValue, Report1.USERCARR.ViewValue, Report1.USERCARR.ViewAttrs, Report1.USERCARR.CellAttrs, Report1.USERCARR.HrefValue)

			' USERRUT
			Call Report1.Cell_Rendered(Report1.USERRUT, Report1.USERRUT.CurrentValue, Report1.USERRUT.ViewValue, Report1.USERRUT.ViewAttrs, Report1.USERRUT.CellAttrs, Report1.USERRUT.HrefValue)

			' codReporte
			Call Report1.Cell_Rendered(Report1.codReporte, Report1.codReporte.CurrentValue, Report1.codReporte.ViewValue, Report1.codReporte.ViewAttrs, Report1.codReporte.CellAttrs, Report1.codReporte.HrefValue)

			' documento
			Call Report1.Cell_Rendered(Report1.documento, Report1.documento.CurrentValue, Report1.documento.ViewValue, Report1.documento.ViewAttrs, Report1.documento.CellAttrs, Report1.documento.HrefValue)

			' ip
			Call Report1.Cell_Rendered(Report1.ip, Report1.ip.CurrentValue, Report1.ip.ViewValue, Report1.ip.ViewAttrs, Report1.ip.CellAttrs, Report1.ip.HrefValue)
		End If

		' Call Row_Rendered event
		Call Report1.Row_Rendered()
	End Sub

	Function SetupExportOptionsExt()
	End Function

	' Get extended filter values
	Sub GetExtendedFilterValues()
		Dim sSelectFld, sSelect, sWhere, sOrderBy
		Dim wrkSql, wrkRs

		' Field USERNAME
		sSelect = "SELECT DISTINCT [USERNAME] FROM " & Report1.SqlFrom
		sWhere = Report1.SqlWhere
		sOrderBy = "[USERNAME] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Report1.USERNAME.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field USERCARR
		sSelect = "SELECT DISTINCT [USERCARR] FROM " & Report1.SqlFrom
		sWhere = Report1.SqlWhere
		sOrderBy = "[USERCARR] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Report1.USERCARR.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field USERDES
		sSelect = "SELECT DISTINCT [USERDES] FROM " & Report1.SqlFrom
		sWhere = Report1.SqlWhere
		sOrderBy = "[USERDES] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Report1.USERDES.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field documento
		sSelect = "SELECT DISTINCT [documento] FROM " & Report1.SqlFrom
		sWhere = Report1.SqlWhere
		sOrderBy = "[documento] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Report1.documento.DropDownList = ewrpt_GetDistinctValues("", wrkSql)
	End Sub

	' Return extended filter
	Function GetExtendedFilter()
		Dim sFilter, sWrk, arwrk
		sFilter = ""
		Dim bPostBack, bRestoreSession, bSetupFilter
		bPostBack = (Request.Form.Count > 0)
		bRestoreSession = True
		bSetupFilter = False

		' Reset extended filter if filter changed
		If bPostBack Then

		' Reset search command
		ElseIf Request.QueryString("cmd") = "reset" Then

			' Load default values
			' (already loaded) Call LoadDefaultFilters()
			' Field USERNAME

			Call SetSessionDropDownValue(Report1.USERNAME.DropDownValue, "USERNAME")

			' Field USERCARR
			Call SetSessionDropDownValue(Report1.USERCARR.DropDownValue, "USERCARR")

			' Field USERDES
			Call SetSessionDropDownValue(Report1.USERDES.DropDownValue, "USERDES")

			' Field USERRUT
			Call SetSessionFilterValues(Report1.USERRUT.SearchValue, Report1.USERRUT.SearchOperator, Report1.USERRUT.SearchCondition, Report1.USERRUT.SearchValue2, Report1.USERRUT.SearchOperator2, "USERRUT")

			' Field fecha
			Call SetSessionFilterValues(Report1.fecha.SearchValue, Report1.fecha.SearchOperator, Report1.fecha.SearchCondition, Report1.fecha.SearchValue2, Report1.fecha.SearchOperator2, "fecha")

			' Field documento
			Call SetSessionDropDownValue(Report1.documento.DropDownValue, "documento")
			bSetupFilter = True ' Set up filter required
		Else

			' Field USERNAME
			If GetDropDownValue(Report1.USERNAME) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Report1.USERNAME.DropDownValue) Then
				If Report1.USERNAME.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Report1_USERNAME")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field USERCARR
			If GetDropDownValue(Report1.USERCARR) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Report1.USERCARR.DropDownValue) Then
				If Report1.USERCARR.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Report1_USERCARR")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field USERDES
			If GetDropDownValue(Report1.USERDES) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Report1.USERDES.DropDownValue) Then
				If Report1.USERDES.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Report1_USERDES")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field USERRUT
			If GetFilterValues(Report1.USERRUT) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field fecha
			If GetFilterValues(Report1.fecha) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field documento
			If GetDropDownValue(Report1.documento) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Report1.documento.DropDownValue) Then
				If Report1.documento.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Report1_documento")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Validate form
			If Not ValidateForm() Then
				Message = gsFormError
				GetExtendedFilter = sFilter
				Exit Function
			End If
		End If

		' Restore session
		If bRestoreSession Then

			' Field USERNAME
			Call GetSessionDropDownValue(Report1.USERNAME)

			' Field USERCARR
			Call GetSessionDropDownValue(Report1.USERCARR)

			' Field USERDES
			Call GetSessionDropDownValue(Report1.USERDES)

			' Field USERRUT
			Call GetSessionFilterValues(Report1.USERRUT)

			' Field fecha
			Call GetSessionFilterValues(Report1.fecha)

			' Field documento
			Call GetSessionDropDownValue(Report1.documento)
		End If

		' Call page filter validated event
		Call Report1.Page_FilterValidated()

		' Build sql
		' Field USERNAME

		Call ewrpt_BuildDropDownFilter(Report1.USERNAME, sFilter, "")

		' Field USERCARR
		Call ewrpt_BuildDropDownFilter(Report1.USERCARR, sFilter, "")

		' Field USERDES
		Call ewrpt_BuildDropDownFilter(Report1.USERDES, sFilter, "")

		' Field USERRUT
		Call ewrpt_BuildExtendedFilter(Report1.USERRUT, sFilter)

		' Field fecha
		Call ewrpt_BuildExtendedFilter(Report1.fecha, sFilter)

		' Field documento
		Call ewrpt_BuildDropDownFilter(Report1.documento, sFilter, "")

		' Save parms to Session
		' Field USERNAME

		Call SetSessionDropDownValue(Report1.USERNAME.DropDownValue, "USERNAME")

		' Field USERCARR
		Call SetSessionDropDownValue(Report1.USERCARR.DropDownValue, "USERCARR")

		' Field USERDES
		Call SetSessionDropDownValue(Report1.USERDES.DropDownValue, "USERDES")

		' Field USERRUT
		Call SetSessionFilterValues(Report1.USERRUT.SearchValue, Report1.USERRUT.SearchOperator, Report1.USERRUT.SearchCondition, Report1.USERRUT.SearchValue2, Report1.USERRUT.SearchOperator2, "USERRUT")

		' Field fecha
		Call SetSessionFilterValues(Report1.fecha.SearchValue, Report1.fecha.SearchOperator, Report1.fecha.SearchCondition, Report1.fecha.SearchValue2, Report1.fecha.SearchOperator2, "fecha")

		' Field documento
		Call SetSessionDropDownValue(Report1.documento.DropDownValue, "documento")

		' Setup filter
		If bSetupFilter Then
		End If
		GetExtendedFilter = sFilter
	End Function

	' Get drop down value from querystring
	Function GetDropDownValue(fld)
		Dim parm, arwrk
		GetDropDownValue = False
		If Request.Form.Count > 0 Then Exit Function ' Skip post back
		parm = Mid(fld.FldVar,3)
		If Request.QueryString("sv_" & parm).Count > 0 Then
			Dim nParm, i
			nParm = Request.QueryString("sv_" & parm).Count
			If nParm = 1 Then
				arwrk = Request.QueryString("sv_" & parm)
			Else
				ReDim arwrk(nParm-1)
				For i = 1 to nParm
					arwrk(i-1) = Request.QueryString("sv_" & parm)(i)
				Next
			End If
			fld.DropDownValue = arwrk
			GetDropDownValue = True
		End If
	End Function

	' Get filter values from querystring
	Function GetFilterValues(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		GetFilterValues = False
		If Request.Form.Count > 0 Then Exit Function ' Skip post back
		If Request.QueryString("sv1_" & parm).Count > 0 Then
			fld.SearchValue = Request.QueryString("sv1_" & parm)
			GetFilterValues = True
		End If
		If Request.QueryString("so1_" & parm).Count > 0 Then
			fld.SearchOperator = Request.QueryString("so1_" & parm)
			GetFilterValues = True
		End If
		If Request.QueryString("sc_" & parm).Count > 0 Then
			fld.SearchCondition = Request.QueryString("sc_" & parm)
			GetFilterValues = True
		End If
		If Request.QueryString("sv2_" & parm).Count > 0 Then
			fld.SearchValue2 = Request.QueryString("sv2_" & parm)
			GetFilterValues = True
		End If
		If Request.QueryString("so2_" & parm).Count > 0 Then
			fld.SearchOperator2 = Request.QueryString("so2_" & parm)
			GetFilterValues = True
		End If
	End Function

	' Set default ext filter
	Sub SetDefaultExtFilter(fld, so1, sv1, sc, so2, sv2)
		fld.DefaultSearchValue = sv1 ' Default ext filter value 1
		fld.DefaultSearchValue2 = sv2 ' Default ext filter value 2 (if operator 2 is enabled)
		fld.DefaultSearchOperator = so1 ' Default search operator 1
		fld.DefaultSearchOperator2 = so2 ' Default search operator 2 (if operator 2 is enabled)
		fld.DefaultSearchCondition = sc ' Default search condition (if operator 2 is enabled)
	End Sub

	' Apply default ext filter
	Sub ApplyDefaultExtFilter(fld)
		fld.SearchValue = fld.DefaultSearchValue
		fld.SearchValue2 = fld.DefaultSearchValue2
		fld.SearchOperator = fld.DefaultSearchOperator
		fld.SearchOperator2 = fld.DefaultSearchOperator2
		fld.SearchCondition = fld.DefaultSearchCondition
	End Sub

	' Check if Text Filter applied
	Function TextFilterApplied(fld)
		TextFilterApplied = (fld.SearchValue&"" <> fld.DefaultSearchValue&"") Or _
			(fld.SearchValue2&"" <> fld.DefaultSearchValue2&"") Or _
			(fld.SearchValue&"" <> "" And fld.SearchOperator&"" <> fld.DefaultSearchOperator&"") Or _
			(fld.SearchValue2&"" <> "" And fld.SearchOperator2&"" <> fld.DefaultSearchOperator2&"") Or _
			(fld.SearchCondition&"" <> fld.DefaultSearchCondition&"")
	End Function

	' Check if Non-Text Filter applied
	Function NonTextFilterApplied(fld)
		If IsArray(fld.DropDownValue) And IsArray(fld.DefaultDropDownValue) Then
			If UBound(fld.DropDownValue) <> Ubound(fld.DefaultDropDownValue) Then
				NonTextFilterApplied = True
				Exit Function
			Else
				Dim ar1, ar2
				ar1 = fld.DropDownValue
				ar2 = fld.DefaultDropDownValue
				Call ewrpt_SortArray(ar1)
				Call ewrpt_SortArray(ar2)
				NonTextFilterApplied = Not ewrpt_MatchedArray(ar1, ar2)
			End If
		ElseIf IsArray(fld.DropDownValue) Or IsArray(fld.DefaultDropDownValue) Then
			NonTextFilterApplied = True
		Else
			NonTextFilterApplied = (fld.DropDownValue&"" <> fld.DefaultDropDownValue&"")
		End If
	End Function

	' Get dropdown value from Session
	Sub GetSessionDropDownValue(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv_Report1_" & parm)) Then fld.DropDownValue = Session("sv_Report1_" & parm)
	End Sub

	' Get filter values from Session
	Sub GetSessionFilterValues(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv1_Report1_" & parm)) Then fld.SearchValue = Session("sv1_Report1_" & parm)
		If Not IsEmpty(Session("so1_Report1_" & parm)) Then fld.SearchOperator = Session("so1_Report1_" & parm)
		If Not IsEmpty(Session("sc_Report1_" & parm)) Then fld.SearchCondition = Session("sc_Report1_" & parm)
		If Not IsEmpty(Session("sv2_Report1_" & parm)) Then fld.SearchValue2 = Session("sv2_Report1_" & parm)
		If Not IsEmpty(Session("so2_Report1_" & parm)) Then fld.SearchOperator2 = Session("so2_Report1_" & parm)
	End Sub

	' Set dropdown value to Session
	Sub SetSessionDropDownValue(sv, parm)
		Session("sv_Report1_" & parm) = sv
	End Sub

	' Set filter values to Session
	Sub SetSessionFilterValues(sv1, so1, sc, sv2, so2, parm)
		Session("sv1_Report1_" & parm) = sv1
		Session("so1_Report1_" & parm) = so1
		Session("sc_Report1_" & parm) = sc
		Session("sv2_Report1_" & parm) = sv2
		Session("so2_Report1_" & parm) = so2
	End Sub

	' Check if has Session filter values
	Function HasSessionFilterValues(parm)
		HasSessionFilterValues = _
			(Session("sv_" & parm) <> "" And Session("sv_" & parm) <> EWRPT_INIT_VALUE) Or _
			(Session("sv1_" & parm) <> "" And Session("sv1_" & parm) <> EWRPT_INIT_VALUE) Or _
			(Session("sv2_" & parm) <> "" And Session("sv2_" & parm) <> EWRPT_INIT_VALUE)
	End Function

	' Check if dropdown filter
	Function DropDownFilterExist(fld, FldOpr)
		Dim sWrk
		sWrk = ""
		Call ewrpt_BuildDropDownFilter(fld, sWrk, FldOpr)
		DropDownFilterExist = (sWrk <> "")
	End Function

	' Check if extended filter
	Function ExtendedFilterExist(fld)
		Dim sExtWrk
		sExtWrk = ""
		Call ewrpt_BuildExtendedFilter(fld, sExtWrk)
		ExtendedFilterExist = (sExtWrk <> "")
	End Function

	' Validate form
	Function ValidateForm()

		' Initialize form error message
		gsFormError = ""

		' Check if validation required
		If Not EWRPT_SERVER_VALIDATE Then
			ValidateForm = (gsFormError = "")
			Exit Function
		End If

		' Validate fields
		If Not ewrpt_CheckEuroDate(Report1.fecha.SearchValue) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br>"
			gsFormError = gsFormError & Report1.fecha.FldErrMsg
		End If
		If Not ewrpt_CheckEuroDate(Report1.fecha.SearchValue2) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br>"
			gsFormError = gsFormError & Report1.fecha.FldErrMsg
		End If

		' Return validate result
		ValidateForm = (gsFormError = "")

		' Call Form_CustomValidate event
		Dim sFormCustomError
		sFormCustomError = ""
		ValidateForm = ValidateForm And Form_CustomValidate(sFormCustomError)
		If sFormCustomError <> "" Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br>"
			gsFormError = gsFormError & sFormCustomError
		End If
	End Function

	' Clear selection stored in session
	Sub ClearSessionSelection(parm)
		Session("sel_Report1_" & parm) = ""
		Session("rf_Report1_" & parm) = ""
		Session("rt_Report1_" & parm) = ""
	End Sub

	' Load selection from session
	Sub LoadSelectionFromSession(parm)
		Dim fld
		Set fld = Report1.GetField(parm)
		fld.SelectionList = Session("sel_Report1_" & parm)
		fld.RangeFrom = Session("rf_Report1_" & parm)
		fld.RangeTo = Session("rt_Report1_" & parm)
	End Sub

	' Load default value for filters
	Sub LoadDefaultFilters()
		Dim sWrk, sSql, arwrk

		' --------------------------------------------------
		'  Set up default values for dropdown filters
		'
		' Field USERNAME

		Report1.USERNAME.DefaultDropDownValue = EWRPT_INIT_VALUE
		Report1.USERNAME.DropDownValue = Report1.USERNAME.DefaultDropDownValue

		' Field USERCARR
		Report1.USERCARR.DefaultDropDownValue = EWRPT_INIT_VALUE
		Report1.USERCARR.DropDownValue = Report1.USERCARR.DefaultDropDownValue

		' Field USERDES
		Report1.USERDES.DefaultDropDownValue = EWRPT_INIT_VALUE
		Report1.USERDES.DropDownValue = Report1.USERDES.DefaultDropDownValue

		' Field documento
		Report1.documento.DefaultDropDownValue = EWRPT_INIT_VALUE
		Report1.documento.DropDownValue = Report1.documento.DefaultDropDownValue

		' --------------------------------------------------
		'  Set up default values for extended filters
		'
		' Field USERRUT

		Call SetDefaultExtFilter(Report1.USERRUT, "=", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(Report1.USERRUT)

		' Field fecha
		Call SetDefaultExtFilter(Report1.fecha, "BETWEEN", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(Report1.fecha)

		' --------------------------------------------------
		'  Set up default values for popup filters
		'  - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Function CheckFilter()

		' Check USERNAME non-Text filter
		If NonTextFilterApplied(Report1.USERNAME) Then
			CheckFilter = True
			Exit Function
		End If

		' Check USERCARR non-Text filter
		If NonTextFilterApplied(Report1.USERCARR) Then
			CheckFilter = True
			Exit Function
		End If

		' Check USERDES non-Text filter
		If NonTextFilterApplied(Report1.USERDES) Then
			CheckFilter = True
			Exit Function
		End If

		' Check USERRUT Text filter
		If TextFilterApplied(Report1.USERRUT) Then
			CheckFilter = True
			Exit Function
		End If

		' Check fecha Text filter
		If TextFilterApplied(Report1.fecha) Then
			CheckFilter = True
			Exit Function
		End If

		' Check documento non-Text filter
		If NonTextFilterApplied(Report1.documento) Then
			CheckFilter = True
			Exit Function
		End If
		CheckFilter = False
	End Function

	' Show list of filters
	Sub ShowFilterList()
		Dim sFilterList
		Dim sExtWrk, sWrk

		' Initialize
		sFilterList = ""

		' Field USERNAME
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildDropDownFilter(Report1.USERNAME, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.USERNAME.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field USERCARR
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildDropDownFilter(Report1.USERCARR, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.USERCARR.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field USERDES
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildDropDownFilter(Report1.USERDES, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.USERDES.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field USERRUT
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildExtendedFilter(Report1.USERRUT, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.USERRUT.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field fecha
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildExtendedFilter(Report1.fecha, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.fecha.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field documento
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildDropDownFilter(Report1.documento, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.documento.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Show Filters
		If sFilterList <> "" Then
			Response.Write ReportLanguage.Phrase("CurrentFilters") & "<br>"
			Response.Write sFilterList
		End If
	End Sub

	' Return poup filter
	Function GetPopupFilter()
		Dim sWrk
		sWrk = ""
		GetPopupFilter = sWrk
	End Function

	' -------------------------------------------------------------------------------
	' Function getSort
	' - Return Sort parameters based on Sort Links clicked
	' - Variables setup: Session[EWRPT_TABLE_SESSION_ORDER_BY], Session["sort_Table_Field"]
	Function GetSort()
		Dim sOrderBy
		Dim sSortSql
		Dim bCtrl, sCmd

		' Check for a resetsort command
		If Request.QueryString("cmd").Count > 0 Then
			sCmd = Request.QueryString("cmd")
			If sCmd = "resetsort" Then
				Report1.OrderBy = ""
				Report1.StartGroup = 1
				Report1.USERDES.Sort = ""
				Report1.USERNAME.Sort = ""
				Report1.fecha.Sort = ""
				Report1.USERCARR.Sort = ""
				Report1.USERRUT.Sort = ""
				Report1.codReporte.Sort = ""
				Report1.documento.Sort = ""
				Report1.ip.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			Report1.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				Report1.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				Report1.CurrentOrderType = ""
			End If
			sSortSql = Report1.SortSql
			Report1.OrderBy = sSortSql
			Report1.StartGroup = 1
		End If
		GetSort = Report1.OrderBy
	End Function

	' Page Load event
	Sub Page_Load()

		'Response.Write "Page Load"
	End Sub

	' Page Unload event
	Sub Page_Unload()

		'Response.Write "Page Unload"
	End Sub

	' Message Showing event
	Sub Message_Showing(msg)

		'msg = newmsg
	End Sub

	' Page Data Rendering event
	Sub Page_DataRendering(header)

		' Example:
		'header = "your header"

	End Sub

	' Page Data Rendered event
	Sub Page_DataRendered(footer)

		' Example:
		'footer = "your footer"

	End Sub

	' Form Custom Validate event
	Function Form_CustomValidate(CustomError)

		'Return error message in CustomError
		Form_CustomValidate = True
	End Function
End Class
%>
