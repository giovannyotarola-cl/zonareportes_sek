<!--#include file="rptinc/ewrcfg5.asp"-->
<!--#include file="rptinc/ewrfn5.asp"-->
<!--#include file="rptinc/ewrusrfn.asp"-->
<%

' Variable for table object
Dim compromisos

' Define table class
Class crcompromisos
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "compromisos"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "compromisos"
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

	' CODCLI
	Private m_CODCLI

	Public Property Get CODCLI()
		Dim ar
		If Not IsObject(m_CODCLI) Then
			Set m_CODCLI = NewFldObj("compromisos", "compromisos", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			m_CODCLI.DateFilter = ""
			m_CODCLI.SqlSelect = ""
			m_CODCLI.SqlOrderBy = ""
		End If
		Set CODCLI = m_CODCLI
	End Property

	' MONTO2
	Private m_MONTO2

	Public Property Get MONTO2()
		Dim ar
		If Not IsObject(m_MONTO2) Then
			Set m_MONTO2 = NewFldObj("compromisos", "compromisos", "x_MONTO2", "MONTO2", "[MONTO2]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_MONTO2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_MONTO2.DateFilter = ""
			m_MONTO2.SqlSelect = ""
			m_MONTO2.SqlOrderBy = ""
		End If
		Set MONTO2 = m_MONTO2
	End Property

	' SALDO2
	Private m_SALDO2

	Public Property Get SALDO2()
		Dim ar
		If Not IsObject(m_SALDO2) Then
			Set m_SALDO2 = NewFldObj("compromisos", "compromisos", "x_SALDO2", "SALDO2", "[SALDO2]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_SALDO2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_SALDO2.DateFilter = ""
			m_SALDO2.SqlSelect = ""
			m_SALDO2.SqlOrderBy = ""
		End If
		Set SALDO2 = m_SALDO2
	End Property

	' FECVEN
	Private m_FECVEN

	Public Property Get FECVEN()
		Dim ar
		If Not IsObject(m_FECVEN) Then
			Set m_FECVEN = NewFldObj("compromisos", "compromisos", "x_FECVEN", "FECVEN", "[FECVEN]", 135, EWRPT_DATATYPE_DATE, 7)
			m_FECVEN.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateDMY"), "%s", "/")
			m_FECVEN.DateFilter = ""
			m_FECVEN.SqlSelect = "SELECT DISTINCT [FECVEN] FROM " & SqlFrom
			m_FECVEN.SqlOrderBy = "[FECVEN]"
		End If
		Set FECVEN = m_FECVEN
	End Property

	' FECDEUDA
	Private m_FECDEUDA

	Public Property Get FECDEUDA()
		Dim ar
		If Not IsObject(m_FECDEUDA) Then
			Set m_FECDEUDA = NewFldObj("compromisos", "compromisos", "x_FECDEUDA", "FECDEUDA", "[FECDEUDA]", 135, EWRPT_DATATYPE_DATE, 7)
			m_FECDEUDA.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateDMY"), "%s", "/")
			m_FECDEUDA.DateFilter = ""
			m_FECDEUDA.SqlSelect = "SELECT DISTINCT [FECDEUDA] FROM " & SqlFrom
			m_FECDEUDA.SqlOrderBy = "[FECDEUDA]"
		End If
		Set FECDEUDA = m_FECDEUDA
	End Property

	' descripcion
	Private m_descripcion

	Public Property Get descripcion()
		Dim ar
		If Not IsObject(m_descripcion) Then
			Set m_descripcion = NewFldObj("compromisos", "compromisos", "x_descripcion", "descripcion", "[descripcion]", 200, EWRPT_DATATYPE_STRING, -1)
			m_descripcion.DateFilter = ""
			m_descripcion.SqlSelect = ""
			m_descripcion.SqlOrderBy = ""
		End If
		Set descripcion = m_descripcion
	End Property

	' PATERNO
	Private m_PATERNO

	Public Property Get PATERNO()
		Dim ar
		If Not IsObject(m_PATERNO) Then
			Set m_PATERNO = NewFldObj("compromisos", "compromisos", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			m_PATERNO.DateFilter = ""
			m_PATERNO.SqlSelect = ""
			m_PATERNO.SqlOrderBy = ""
		End If
		Set PATERNO = m_PATERNO
	End Property

	' MATERNO
	Private m_MATERNO

	Public Property Get MATERNO()
		Dim ar
		If Not IsObject(m_MATERNO) Then
			Set m_MATERNO = NewFldObj("compromisos", "compromisos", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			m_MATERNO.DateFilter = ""
			m_MATERNO.SqlSelect = ""
			m_MATERNO.SqlOrderBy = ""
		End If
		Set MATERNO = m_MATERNO
	End Property

	' NOMBRE
	Private m_NOMBRE

	Public Property Get NOMBRE()
		Dim ar
		If Not IsObject(m_NOMBRE) Then
			Set m_NOMBRE = NewFldObj("compromisos", "compromisos", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE.DateFilter = ""
			m_NOMBRE.SqlSelect = ""
			m_NOMBRE.SqlOrderBy = ""
		End If
		Set NOMBRE = m_NOMBRE
	End Property

	' FECHA_PRESUNTA_PAGO
	Private m_FECHA_PRESUNTA_PAGO

	Public Property Get FECHA_PRESUNTA_PAGO()
		Dim ar
		If Not IsObject(m_FECHA_PRESUNTA_PAGO) Then
			Set m_FECHA_PRESUNTA_PAGO = NewFldObj("compromisos", "compromisos", "x_FECHA_PRESUNTA_PAGO", "FECHA_PRESUNTA_PAGO", "[FECHA_PRESUNTA_PAGO]", 135, EWRPT_DATATYPE_DATE, 7)
			m_FECHA_PRESUNTA_PAGO.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateDMY"), "%s", "/")
			m_FECHA_PRESUNTA_PAGO.DateFilter = ""
			m_FECHA_PRESUNTA_PAGO.SqlSelect = ""
			m_FECHA_PRESUNTA_PAGO.SqlOrderBy = ""
		End If
		Set FECHA_PRESUNTA_PAGO = m_FECHA_PRESUNTA_PAGO
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
		Call ewrpt_SetArObj(Fields, "CODCLI", CODCLI)
		Call ewrpt_SetArObj(Fields, "MONTO2", MONTO2)
		Call ewrpt_SetArObj(Fields, "SALDO2", SALDO2)
		Call ewrpt_SetArObj(Fields, "FECVEN", FECVEN)
		Call ewrpt_SetArObj(Fields, "FECDEUDA", FECDEUDA)
		Call ewrpt_SetArObj(Fields, "descripcion", descripcion)
		Call ewrpt_SetArObj(Fields, "PATERNO", PATERNO)
		Call ewrpt_SetArObj(Fields, "MATERNO", MATERNO)
		Call ewrpt_SetArObj(Fields, "NOMBRE", NOMBRE)
		Call ewrpt_SetArObj(Fields, "FECHA_PRESUNTA_PAGO", FECHA_PRESUNTA_PAGO)
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
		SqlFrom = "[SEK_compromisos_rotos]"
	End Property

	Public Property Get SqlSelect() ' Select
		SqlSelect = "SELECT [CODCLI], [MONTO2], [SALDO2], [FECVEN], [FECDEUDA], [descripcion], [PATERNO], [MATERNO], [NOMBRE], [FECHA_PRESUNTA_PAGO] FROM " & SqlFrom
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
		SqlOrderBy = ""
	End Property

	' Table Level Group SQL
	Public Property Get SqlFirstGroupField()
		SqlFirstGroupField = ""
	End Property

	Public Property Get SqlSelectGroup()
		SqlSelectGroup = "SELECT DISTINCT " & SqlFirstGroupField & " FROM " & SqlFrom
	End Property

	Public Property Get SqlOrderByGroup()
		SqlOrderByGroup = ""
	End Property

	Public Property Get SqlSelectAgg()
		SqlSelectAgg = "SELECT SUM([MONTO2]) AS [sum_monto2], SUM([SALDO2]) AS [sum_saldo2] FROM " & SqlFrom
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
Dim compromisos_summary
Set compromisos_summary = New crcompromisos_summary
Set Page = compromisos_summary

' Page init processing
Call compromisos_summary.Page_Init()

' Page main processing
Call compromisos_summary.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<script type="text/javascript">
// Create page object
var compromisos_summary = new ewrpt_Page("compromisos_summary");
// page properties
compromisos_summary.PageID = "summary"; // page ID
compromisos_summary.FormID = "fcompromisossummaryfilter"; // form ID
var EWRPT_PAGE_ID = compromisos_summary.PageID;
// extend page with Chart_Rendering function
compromisos_summary.Chart_Rendering =  
 function(chart, chartid) { // DO NOT CHANGE THIS LINE!
 	//alert(chartid);
 }
// extend page with Chart_Rendered function
compromisos_summary.Chart_Rendered =  
 function(chart, chartid) { // DO NOT CHANGE THIS LINE!
 	//alert(chartid);
 }
</script>
<% If compromisos.Export = "" Then %>
<script type="text/javascript">
<!--
// extend page with ValidateForm function
compromisos_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_FECVEN;
	if (elm && !ewrpt_CheckEuroDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(compromisos.FECVEN.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv2_FECVEN;
	if (elm && !ewrpt_CheckEuroDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(compromisos.FECVEN.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv1_FECDEUDA;
	if (elm && !ewrpt_CheckEuroDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(compromisos.FECDEUDA.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv2_FECDEUDA;
	if (elm && !ewrpt_CheckEuroDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(compromisos.FECDEUDA.FldErrMsg) %>"))
			return false;
	}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
compromisos_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If EWRPT_CLIENT_VALIDATE Then %>
compromisos_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
compromisos_summary.ValidateRequired = false; // no JavaScript validation
<% End If %>
//-->
</script>
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
<% If compromisos.Export = "" Then %>
<div id="ewrpt_PopupFilter"><div class="bd"></div></div>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
<% jsdata = ewrpt_GetJsData(compromisos.FECVEN, compromisos.FECVEN.FldType) %>
ewrpt_CreatePopup("compromisos_FECVEN", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(compromisos.FECDEUDA, compromisos.FECDEUDA.FldType) %>
ewrpt_CreatePopup("compromisos_FECDEUDA", [<%= jsdata %>]);
</script>
<% End If %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<p class="aspreportmaker ewTitle"><%= compromisos.TableCaption %>
&nbsp;&nbsp;<% compromisos_summary.ExportOptions.Render "body", "" %></p>
<% compromisos_summary.ShowPageHeader() %>
<% compromisos_summary.ShowMessage() %>
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
<% If compromisos.Export = "" Then %>
<%
If (compromisos.FilterPanelOption = 2) Or (compromisos.FilterPanelOption = 3 And compromisos_summary.FilterApplied) Or (compromisos_summary.Filter = "0=101") Then
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
<form name="fcompromisossummaryfilter" id="fcompromisossummaryfilter" action="<%= ewrpt_CurrentPage %>" class="ewForm" onsubmit="return compromisos_summary.ValidateForm(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr id="r_CODCLI">
		<td><span class="aspreportmaker"><%= compromisos.CODCLI.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CODCLI" id="sv_CODCLI"<%= ewrpt_IIf(compromisos_summary.ClearExtFilter = "compromisos_CODCLI", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(compromisos.CODCLI.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(compromisos.CODCLI.AdvancedFilters) Then
	cntf = UBound(compromisos.CODCLI.AdvancedFilters)+1
Else
	cntf = 0
End If
If IsArray(compromisos.CODCLI.DropDownList) Then
	cntd = UBound(compromisos.CODCLI.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If compromisos.CODCLI.AdvancedFilters(i).Enabled Then
%>
		<option value="<%= compromisos.CODCLI.AdvancedFilters(i).ID %>"<% If ewrpt_MatchedFilterValue(compromisos.CODCLI.DropDownValue, compromisos.CODCLI.AdvancedFilters(i).ID) Then Response.Write " selected=""selected""" %>><%= compromisos.CODCLI.AdvancedFilters(i).Name %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= compromisos.CODCLI.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(compromisos.CODCLI.DropDownValue, compromisos.CODCLI.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(compromisos.CODCLI.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr id="r_FECVEN">
		<td><span class="aspreportmaker"><%= compromisos.FECVEN.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("BETWEEN") %><input type="hidden" name="so1_FECVEN" id="so1_FECVEN" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_FECVEN" id="sv1_FECVEN" value="<%= ewrpt_HtmlEncode(compromisos.FECVEN.SearchValue) %>"<% If compromisos_summary.ClearExtFilter = "compromisos_FECVEN" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv1_FECVEN" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv1_FECVEN", // ID of the input field
	ifFormat : "%d/%m/%Y", // the date format
	button : "csv1_FECVEN" // ID of the button
})
</script>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw1_FECVEN" name="btw1_FECVEN">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
				<td><span class="aspreportmaker" id="btw1_FECVEN" name="btw1_FECVEN">
<input type="text" name="sv2_FECVEN" id="sv2_FECVEN" value="<%= ewrpt_HtmlEncode(compromisos.FECVEN.SearchValue2) %>"<% If compromisos_summary.ClearExtFilter = "compromisos_FECVEN" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv2_FECVEN" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv2_FECVEN", // ID of the input field
	ifFormat : "%d/%m/%Y", // the date format
	button : "csv2_FECVEN" // ID of the button
})
</script>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_FECDEUDA">
		<td><span class="aspreportmaker"><%= compromisos.FECDEUDA.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("BETWEEN") %><input type="hidden" name="so1_FECDEUDA" id="so1_FECDEUDA" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_FECDEUDA" id="sv1_FECDEUDA" value="<%= ewrpt_HtmlEncode(compromisos.FECDEUDA.SearchValue) %>"<% If compromisos_summary.ClearExtFilter = "compromisos_FECDEUDA" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv1_FECDEUDA" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv1_FECDEUDA", // ID of the input field
	ifFormat : "%d/%m/%Y", // the date format
	button : "csv1_FECDEUDA" // ID of the button
})
</script>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw1_FECDEUDA" name="btw1_FECDEUDA">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
				<td><span class="aspreportmaker" id="btw1_FECDEUDA" name="btw1_FECDEUDA">
<input type="text" name="sv2_FECDEUDA" id="sv2_FECDEUDA" value="<%= ewrpt_HtmlEncode(compromisos.FECDEUDA.SearchValue2) %>"<% If compromisos_summary.ClearExtFilter = "compromisos_FECDEUDA" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv2_FECDEUDA" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv2_FECDEUDA", // ID of the input field
	ifFormat : "%d/%m/%Y", // the date format
	button : "csv2_FECDEUDA" // ID of the button
})
</script>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_PATERNO">
		<td><span class="aspreportmaker"><%= compromisos.PATERNO.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_PATERNO" id="so1_PATERNO" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(compromisos.PATERNO.SearchValue) %>"<% If compromisos_summary.ClearExtFilter = "compromisos_PATERNO" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_MATERNO">
		<td><span class="aspreportmaker"><%= compromisos.MATERNO.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_MATERNO" id="so1_MATERNO" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(compromisos.MATERNO.SearchValue) %>"<% If compromisos_summary.ClearExtFilter = "compromisos_MATERNO" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_NOMBRE">
		<td><span class="aspreportmaker"><%= compromisos.NOMBRE.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_NOMBRE" id="so1_NOMBRE" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ewrpt_HtmlEncode(compromisos.NOMBRE.SearchValue) %>"<% If compromisos_summary.ClearExtFilter = "compromisos_NOMBRE" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
</table>
<table class="ewRptExtFilter">
	<tr>
		<td><span class="aspreportmaker">
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
<% If compromisos.ShowCurrentFilter Then %>
<div id="ewrptFilterList">
<% Call compromisos_summary.ShowFilterList() %>
</div>
<br>
<% End If %>
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<!-- Report Grid (Begin) -->
<div class="ewGridMiddlePanel">
<table class="<%= compromisos_summary.ReportTableClass %>" cellspacing="0">
<%

' Set the last group to display if not export all
If (compromisos.ExportAll And compromisos.Export <> "") Then
	compromisos_summary.StopGrp = compromisos_summary.TotalGrps
Else
	compromisos_summary.StopGrp = compromisos_summary.StartGrp + compromisos_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(compromisos_summary.StopGrp) > CLng(compromisos_summary.TotalGrps) Then
	compromisos_summary.StopGrp = compromisos_summary.TotalGrps
End If
compromisos_summary.RecCount = 0

' Init Summary Values
Call compromisos_summary.ResetLevelSummary(0)

' Get first row
If compromisos_summary.TotalGrps > 0 Then
	Call compromisos_summary.GetRow(1)
	compromisos_summary.GrpCount = 1
End If
Do While (Not rs.Eof And compromisos_summary.GrpCount <= compromisos_summary.DisplayGrps) Or (compromisos_summary.ShowFirstHeader)

	' Show Header
	If compromisos_summary.ShowFirstHeader Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.CODCLI.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.CODCLI) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.CODCLI.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.CODCLI) %>',0);"><%= compromisos.CODCLI.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.CODCLI.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.CODCLI.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.MONTO2.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.MONTO2) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.MONTO2.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.MONTO2) %>',0);"><%= compromisos.MONTO2.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.MONTO2.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.MONTO2.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.SALDO2.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.SALDO2) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.SALDO2.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.SALDO2) %>',0);"><%= compromisos.SALDO2.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.SALDO2.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.SALDO2.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.FECVEN.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.FECVEN) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.FECVEN.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.FECVEN) %>',0);"><%= compromisos.FECVEN.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.FECVEN.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.FECVEN.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'compromisos_FECVEN', false, '<%= compromisos.FECVEN.RangeFrom %>', '<%= compromisos.FECVEN.RangeTo %>');return false;" name="x_FECVEN<%= compromisos_summary.Cnt(0,0) %>" id="x_FECVEN<%= compromisos_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.FECDEUDA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.FECDEUDA) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.FECDEUDA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.FECDEUDA) %>',0);"><%= compromisos.FECDEUDA.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.FECDEUDA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.FECDEUDA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'compromisos_FECDEUDA', false, '<%= compromisos.FECDEUDA.RangeFrom %>', '<%= compromisos.FECDEUDA.RangeTo %>');return false;" name="x_FECDEUDA<%= compromisos_summary.Cnt(0,0) %>" id="x_FECDEUDA<%= compromisos_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.descripcion.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.descripcion) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.descripcion.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.descripcion) %>',0);"><%= compromisos.descripcion.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.descripcion.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.descripcion.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.PATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.PATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.PATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.PATERNO) %>',0);"><%= compromisos.PATERNO.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.PATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.PATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.MATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.MATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.MATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.MATERNO) %>',0);"><%= compromisos.MATERNO.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.MATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.MATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.NOMBRE.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.NOMBRE) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.NOMBRE.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.NOMBRE) %>',0);"><%= compromisos.NOMBRE.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.NOMBRE.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.NOMBRE.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If compromisos.Export <> "" Then %>
<%= compromisos.FECHA_PRESUNTA_PAGO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If compromisos.SortUrl(compromisos.FECHA_PRESUNTA_PAGO) = "" Then %>
		<td style="vertical-align: bottom;"><%= compromisos.FECHA_PRESUNTA_PAGO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= compromisos.SortUrl(compromisos.FECHA_PRESUNTA_PAGO) %>',0);"><%= compromisos.FECHA_PRESUNTA_PAGO.FldCaption %></td><td style="width: 10px;">
		<% If compromisos.FECHA_PRESUNTA_PAGO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf compromisos.FECHA_PRESUNTA_PAGO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		compromisos_summary.ShowFirstHeader = False
	End If
	compromisos_summary.RecCount = compromisos_summary.RecCount + 1

		' Render detail row
		Call compromisos.ResetAttrs()
		compromisos.RowType = EWRPT_ROWTYPE_DETAIL
		Call compromisos_summary.RenderRow()
%>
	<tr<%= compromisos.RowAttributes %>>
		<td<%= compromisos.CODCLI.CellAttributes %>>
<span<%= compromisos.CODCLI.ViewAttributes %>><%= compromisos.CODCLI.ListViewValue %></span>
</td>
		<td<%= compromisos.MONTO2.CellAttributes %>>
<span<%= compromisos.MONTO2.ViewAttributes %>><%= compromisos.MONTO2.ListViewValue %></span>
</td>
		<td<%= compromisos.SALDO2.CellAttributes %>>
<span<%= compromisos.SALDO2.ViewAttributes %>><%= compromisos.SALDO2.ListViewValue %></span>
</td>
		<td<%= compromisos.FECVEN.CellAttributes %>>
<span<%= compromisos.FECVEN.ViewAttributes %>><%= compromisos.FECVEN.ListViewValue %></span>
</td>
		<td<%= compromisos.FECDEUDA.CellAttributes %>>
<span<%= compromisos.FECDEUDA.ViewAttributes %>><%= compromisos.FECDEUDA.ListViewValue %></span>
</td>
		<td<%= compromisos.descripcion.CellAttributes %>>
<span<%= compromisos.descripcion.ViewAttributes %>><%= compromisos.descripcion.ListViewValue %></span>
</td>
		<td<%= compromisos.PATERNO.CellAttributes %>>
<span<%= compromisos.PATERNO.ViewAttributes %>><%= compromisos.PATERNO.ListViewValue %></span>
</td>
		<td<%= compromisos.MATERNO.CellAttributes %>>
<span<%= compromisos.MATERNO.ViewAttributes %>><%= compromisos.MATERNO.ListViewValue %></span>
</td>
		<td<%= compromisos.NOMBRE.CellAttributes %>>
<span<%= compromisos.NOMBRE.ViewAttributes %>><%= compromisos.NOMBRE.ListViewValue %></span>
</td>
		<td<%= compromisos.FECHA_PRESUNTA_PAGO.CellAttributes %>>
<span<%= compromisos.FECHA_PRESUNTA_PAGO.ViewAttributes %>><%= compromisos.FECHA_PRESUNTA_PAGO.ListViewValue %></span>
</td>
	</tr>
<%

		' Accumulate page summary
		Call compromisos_summary.AccumulateSummary()

		' Get next record
		Call compromisos_summary.GetRow(2)
		compromisos_summary.GrpCount = compromisos_summary.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
<%
If compromisos_summary.TotalGrps > 0 Then
	Call compromisos.ResetAttrs()
	compromisos.RowType = EWRPT_ROWTYPE_TOTAL
	compromisos.RowTotalType = EWRPT_ROWTOTAL_GRAND
	compromisos.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	compromisos.RowAttrs.AddAttribute "class", "ewRptGrandSummary", True
	Call compromisos_summary.RenderRow()
%>
	<!-- tr><td colspan="10"><span class="aspreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= compromisos.RowAttributes %>><td colspan="10"><%= ReportLanguage.Phrase("RptGrandTotal") %>&nbsp;(<%= ewrpt_FormatNumber(compromisos_summary.TotCount,0,-2,-2,-2) %><%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<%
	Call compromisos.ResetAttrs()
	compromisos.MONTO2.Count = compromisos_summary.TotCount
	compromisos.MONTO2.SumValue = compromisos_summary.GrandSmry(2) ' Load SUM
	compromisos.RowTotalSubType = EWRPT_ROWTOTAL_SUM
	compromisos.SALDO2.Count = compromisos_summary.TotCount
	compromisos.SALDO2.SumValue = compromisos_summary.GrandSmry(3) ' Load SUM
	compromisos.RowTotalSubType = EWRPT_ROWTOTAL_SUM
	compromisos.RowAttrs.AddAttribute "class", "ewRptGrandSummary", True
	Call compromisos_summary.RenderRow()
%>
	<tr<%= compromisos.RowAttributes %>>
		<td<%= compromisos.CODCLI.CellAttributes %>>&nbsp;</td>
		<td<%= compromisos.MONTO2.CellAttributes %>><%= ReportLanguage.Phrase("RptSum") %><%= ReportLanguage.Phrase("RptSeparator") %>
<span<%= compromisos.MONTO2.ViewAttributes %>><%= compromisos.MONTO2.SumViewValue %></span></td>
		<td<%= compromisos.SALDO2.CellAttributes %>><%= ReportLanguage.Phrase("RptSum") %><%= ReportLanguage.Phrase("RptSeparator") %>
<span<%= compromisos.SALDO2.ViewAttributes %>><%= compromisos.SALDO2.SumViewValue %></span></td>
		<td<%= compromisos.FECVEN.CellAttributes %>>&nbsp;</td>
		<td<%= compromisos.FECDEUDA.CellAttributes %>>&nbsp;</td>
		<td<%= compromisos.descripcion.CellAttributes %>>&nbsp;</td>
		<td<%= compromisos.PATERNO.CellAttributes %>>&nbsp;</td>
		<td<%= compromisos.MATERNO.CellAttributes %>>&nbsp;</td>
		<td<%= compromisos.NOMBRE.CellAttributes %>>&nbsp;</td>
		<td<%= compromisos.FECHA_PRESUNTA_PAGO.CellAttributes %>>&nbsp;</td>
	</tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If compromisos.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="<%= ewrpt_CurrentPage %>" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(compromisos_summary.StartGrp, compromisos_summary.DisplayGrps, compromisos_summary.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="<%= ewrpt_CurrentPage %>?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="<%= ewrpt_CurrentPage %>?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="<%= ewrpt_CurrentPage %>?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="<%= ewrpt_CurrentPage %>?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If compromisos_summary.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If compromisos_summary.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="1"<% If compromisos_summary.DisplayGrps = 1 Then Response.Write " selected=""selected""" %>>1</option>
<option value="2"<% If compromisos_summary.DisplayGrps = 2 Then Response.Write " selected=""selected""" %>>2</option>
<option value="3"<% If compromisos_summary.DisplayGrps = 3 Then Response.Write " selected=""selected""" %>>3</option>
<option value="4"<% If compromisos_summary.DisplayGrps = 4 Then Response.Write " selected=""selected""" %>>4</option>
<option value="5"<% If compromisos_summary.DisplayGrps = 5 Then Response.Write " selected=""selected""" %>>5</option>
<option value="10"<% If compromisos_summary.DisplayGrps = 10 Then Response.Write " selected=""selected""" %>>10</option>
<option value="20"<% If compromisos_summary.DisplayGrps = 20 Then Response.Write " selected=""selected""" %>>20</option>
<option value="50"<% If compromisos_summary.DisplayGrps = 50 Then Response.Write " selected=""selected""" %>>50</option>
<option value="ALL"<% If compromisos.GroupPerPage = -1 Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("AllRecords") %></option>
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
compromisos_summary.ShowPageFooter()
If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg()
%>
<%

' Close recordset and connection
rs.Close
Set rs = Nothing
%>
<% If compromisos.Export = "" Then %>
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
Set compromisos_summary = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crcompromisos_summary

	' Page ID
	Public Property Get PageID()
		PageID = "summary"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "compromisos"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "compromisos_summary"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If compromisos.UseTokenInUrl Then PageUrl = PageUrl & "t=" & compromisos.TableVar & "&" ' add page token
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
		If compromisos.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (compromisos.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (compromisos.TableVar = Request.QueryString("t"))
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
		Set compromisos = New crcompromisos
		Set Table = compromisos

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "summary"

		' Initialize table name
		EWRPT_TABLE_NAME = "compromisos"

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
			compromisos.Export = Request.QueryString("export")
		End If
		gsExport = compromisos.Export ' Get export parameter, used in header
		gsExportFile = compromisos.TableVar ' Get export file, used in header
		If compromisos.Export = "excel" Then
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
		If compromisos.Export = "email" Then
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

		'wrkstr = "&filter=" & compromisos.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(compromisos.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(compromisos.StartGroup&""))
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
			compromisos.OrderBy = GetQSValue(QS, "o")
			compromisos.StartGroup = GetQSValue(QS, "s")
			compromisos.RestoreSession = True
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
		item.Body = "<a name=""emf_compromisos"" id=""emf_compromisos"" href=""javascript:void(0);"" onclick=""ewrpt_EmailDialogShow({lnk:'emf_compromisos',hdr:ewLanguage.Phrase('ExportToEmail')});"">" & ReportLanguage.Phrase("ExportToEmail") & "</a>"
		item.Visible = False

		' Reset filter
		ExportOptions.Add("resetfilter")
		Set item = ExportOptions.GetItem("resetfilter")
		item.Body = "<a href=""" & ewrpt_CurrentPage & "?cmd=reset"">" & ReportLanguage.Phrase("ResetAllFilter") & "</a>"
		item.Visible = True
		Call SetupExportOptionsExt()

		' Hide options for export
		If compromisos.Export <> "" Then
			ExportOptions.HideAllOptions()
		End If

		' Set up table class
		If compromisos.Export = "word" Or compromisos.Export = "excel" Then
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
		Set compromisos = Nothing

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
		nDtls = 10
		nGrps = 0
		ReDim Col(nDtls), Val(nDtls), Cnt(nGrps, nDtls)
		ReDim Smry(nGrps, nDtls), Mn(nGrps, nDtls), Mx(nGrps, nDtls)
		ReDim GrandSmry(nDtls), GrandMn(nDtls), GrandMx(nDtls)

		' Set up if accumulation required
		Col(1) = False
		Col(2) = True
		Col(3) = True
		Col(4) = False
		Col(5) = False
		Col(6) = False
		Col(7) = False
		Col(8) = False
		Col(9) = False
		Col(10) = False

		' Set up groups per page dynamically
		SetUpDisplayGrps()
		compromisos.FECVEN.SelectionList = ""
		compromisos.FECVEN.DefaultSelectionList = ""
		compromisos.FECVEN.ValueList = ""
		compromisos.FECDEUDA.SelectionList = ""
		compromisos.FECDEUDA.DefaultSelectionList = ""
		compromisos.FECDEUDA.ValueList = ""

		' Load default filter values
		Call LoadDefaultFilters()

		' Load custom filters
		Call compromisos.Filters_Load()

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
		If compromisos.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total count
		Dim sSql
		sSql = ewrpt_BuildReportSql(compromisos.SqlSelect, compromisos.SqlWhere, compromisos.SqlGroupBy, compromisos.SqlHaving, compromisos.SqlOrderBy, Filter, Sort)
		Call ewrpt_SetDebugMsg("(SQL): " & sSql)
		TotalGrps = ewrpt_LoadRecordCount(sSql)

		' Display all records
		If DisplayGrps <= 0 Then
			DisplayGrps = TotalGrps
		End If
		StartGrp = 1

		' Show header
		ShowFirstHeader = (TotalGrps > 0)

		'ShowFirstHeader = True ' Uncomment to always show header
		' Set up start position if not export all

		If compromisos.ExportAll And compromisos.Export <> "" Then
			DisplayGrps = TotalGrps
		Else
			Call SetUpStartGroup()
		End If

		' Hide all options if export
		If compromisos.Export <> "" Then
			Call ExportOptions.HideAllOptions()
		End If

		' Get current page records
		Set rs = GetRs(sSql, StartGrp, DisplayGrps)
	End Sub

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

	' Get rs
	Function GetRs(sql, start, grps)
		Dim rswrk, wrksql
		wrksql = sql
		Set rswrk = ewrpt_LoadRs(wrksql)
		If Not rswrk.Eof And start > 1 Then rswrk.Move (start-1)
		Set GetRs = rswrk
	End Function

	' Get row values
	Sub GetRow(opt)
		If opt = 1 Then ' Get first row

			'If Not rs.Eof Then rs.MoveFirst ' NOTE: no need to move position
		Else ' Get next row
			If Not rs.Eof Then rs.MoveNext
		End If
		If Not rs.Eof Then
			compromisos.CODCLI.DbValue = ewrpt_GetValue(rs("CODCLI"))
			compromisos.MONTO2.DbValue = ewrpt_GetValue(rs("MONTO2"))
			compromisos.SALDO2.DbValue = ewrpt_GetValue(rs("SALDO2"))
			compromisos.FECVEN.DbValue = ewrpt_GetValue(rs("FECVEN"))
			compromisos.FECDEUDA.DbValue = ewrpt_GetValue(rs("FECDEUDA"))
			compromisos.descripcion.DbValue = ewrpt_GetValue(rs("descripcion"))
			compromisos.PATERNO.DbValue = ewrpt_GetValue(rs("PATERNO"))
			compromisos.MATERNO.DbValue = ewrpt_GetValue(rs("MATERNO"))
			compromisos.NOMBRE.DbValue = ewrpt_GetValue(rs("NOMBRE"))
			compromisos.FECHA_PRESUNTA_PAGO.DbValue = ewrpt_GetValue(rs("FECHA_PRESUNTA_PAGO"))
			Val(1) = compromisos.CODCLI.CurrentValue
			Val(2) = compromisos.MONTO2.CurrentValue
			Val(3) = compromisos.SALDO2.CurrentValue
			Val(4) = compromisos.FECVEN.CurrentValue
			Val(5) = compromisos.FECDEUDA.CurrentValue
			Val(6) = compromisos.descripcion.CurrentValue
			Val(7) = compromisos.PATERNO.CurrentValue
			Val(8) = compromisos.MATERNO.CurrentValue
			Val(9) = compromisos.NOMBRE.CurrentValue
			Val(10) = compromisos.FECHA_PRESUNTA_PAGO.CurrentValue
		Else
			compromisos.CODCLI.DbValue = ""
			compromisos.MONTO2.DbValue = ""
			compromisos.SALDO2.DbValue = ""
			compromisos.FECVEN.DbValue = ""
			compromisos.FECDEUDA.DbValue = ""
			compromisos.descripcion.DbValue = ""
			compromisos.PATERNO.DbValue = ""
			compromisos.MATERNO.DbValue = ""
			compromisos.NOMBRE.DbValue = ""
			compromisos.FECHA_PRESUNTA_PAGO.DbValue = ""
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
			compromisos.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				compromisos.StartGroup = nStartGrp
			Else
				StartGrp = compromisos.StartGroup
			End If
		Else
			StartGrp = compromisos.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			compromisos.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			compromisos.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			compromisos.StartGroup = StartGrp
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
		' Build distinct values for FECVEN

		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(compromisos.FECVEN.SqlSelect, compromisos.SqlWhere, compromisos.SqlGroupBy, compromisos.SqlHaving, compromisos.FECVEN.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			compromisos.FECVEN.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(compromisos.FECVEN.CurrentValue) Then
				bNullValue = True
			ElseIf compromisos.FECVEN.CurrentValue = "" Then
				bEmptyValue = True
			Else
				compromisos.FECVEN.ViewValue = ewrpt_FormatDateTime(compromisos.FECVEN.CurrentValue, 7)
				compromisos.FECVEN.CurrentValue = ewrpt_FormatDateTime(compromisos.FECVEN.CurrentValue,98) ' Format date for SQL (yyyy/mm/dd hh:mm:ss)
				Call ewrpt_SetupDistinctValues(ar, compromisos.FECVEN.CurrentValue, compromisos.FECVEN.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		compromisos.FECVEN.ValueList = ar

		' Build distinct values for FECDEUDA
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(compromisos.FECDEUDA.SqlSelect, compromisos.SqlWhere, compromisos.SqlGroupBy, compromisos.SqlHaving, compromisos.FECDEUDA.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			compromisos.FECDEUDA.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(compromisos.FECDEUDA.CurrentValue) Then
				bNullValue = True
			ElseIf compromisos.FECDEUDA.CurrentValue = "" Then
				bEmptyValue = True
			Else
				compromisos.FECDEUDA.ViewValue = ewrpt_FormatDateTime(compromisos.FECDEUDA.CurrentValue, 7)
				compromisos.FECDEUDA.CurrentValue = ewrpt_FormatDateTime(compromisos.FECDEUDA.CurrentValue,98) ' Format date for SQL (yyyy/mm/dd hh:mm:ss)
				Call ewrpt_SetupDistinctValues(ar, compromisos.FECDEUDA.CurrentValue, compromisos.FECDEUDA.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		compromisos.FECDEUDA.ValueList = ar

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
				Call ClearSessionSelection("FECVEN")
				Call ClearSessionSelection("FECDEUDA")
				Call ResetPager()
			End If
		End If

		' Load selection criteria to array
		' Get FECHA VENCIMIENTO selected values

		If IsArray(Session("sel_compromisos_FECVEN")) Then
			Call LoadSelectionFromSession("FECVEN")
		ElseIf Session("sel_compromisos_FECVEN") = EWRPT_INIT_VALUE Then ' Select all
			compromisos.FECVEN.SelectionList = ""
		End If

		' Get FECHA DEUDA selected values
		If IsArray(Session("sel_compromisos_FECDEUDA")) Then
			Call LoadSelectionFromSession("FECDEUDA")
		ElseIf Session("sel_compromisos_FECDEUDA") = EWRPT_INIT_VALUE Then ' Select all
			compromisos.FECDEUDA.SelectionList = ""
		End If
	End Sub

	' Reset pager to starting position
	Sub ResetPager()
		StartGrp = 1
		compromisos.StartGroup = StartGrp
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
			compromisos.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			compromisos.StartGroup = nStartGrp
		Else
			If compromisos.GroupPerPage <> "" Then
				DisplayGrps = compromisos.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 20 ' Load Default
			End If
		End If
	End Sub

	' Render row
	Sub RenderRow()
		If compromisos.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' Get total count from sql directly
			Dim sSql, rstot
			sSql = ewrpt_BuildReportSql(compromisos.SqlSelectCount, compromisos.SqlWhere, compromisos.SqlGroupBy, compromisos.SqlHaving, "", Filter, "")
			Call ewrpt_SetDebugMsg("(Total SQL): " & sSql)
			Set rstot = ewrpt_LoadRs(sSql)
			If Not rstot.Eof Then
				TotCount = ewrpt_GetValue(rstot(0))
			Else
				TotCount = 0
			End If

			' Get total from sql directly
			Dim rsagg
			sSql = ewrpt_BuildReportSql(compromisos.SqlSelectAgg, compromisos.SqlWhere, compromisos.SqlGroupBy, compromisos.SqlHaving, "", Filter, "")
			sSql = compromisos.SqlAggPfx & sSql & compromisos.SqlAggSfx
			Call ewrpt_SetDebugMsg("(Aggregate SQL): " & sSql)
			Set rsagg = ewrpt_LoadRs(sSql)
			If Not rsagg.Eof Then
				GrandSmry(2) = ewrpt_GetValue(rsagg("sum_monto2"))
				GrandSmry(3) = ewrpt_GetValue(rsagg("sum_saldo2"))
				Set rsagg = Nothing
			Else

				' Accumulate grand summary from detail records
				sSql = ewrpt_BuildReportSql(compromisos.SqlSelect, compromisos.SqlWhere, compromisos.SqlGroupBy, compromisos.SqlHaving, "", Filter, "")
				If EWRPT_DEBUG_ENABLED Then Response.Write "(Aggregate SQL): " & sSql & "<br>"
				Dim rs
				Set rs = ewrpt_LoadRs(sSql)
				If Not rs.Eof Then GetRow(1)
				Do While Not rs.Eof
					Call AccumulateGrandSummary()
					GetRow(2)
				Loop
				Set rs = Nothing
			End If
		End If

		' Call Row_Rendering event
		Call compromisos.Row_Rendering()

		' --------------------
		'  Render view codes
		' --------------------

		If compromisos.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' MONTO2
			compromisos.MONTO2.SumViewValue = compromisos.MONTO2.SumValue
			compromisos.MONTO2.CellAttrs.UpdateAttribute "class", ewrpt_IIf(compromisos.RowTotalType = EWRPT_ROWTOTAL_PAGE Or compromisos.RowTotalType = EWRPT_ROWTOTAL_GRAND, "ewRptGrpAggregate", "ewRptGrpSummary" & compromisos.RowGroupLevel)

			' SALDO2
			compromisos.SALDO2.SumViewValue = compromisos.SALDO2.SumValue
			compromisos.SALDO2.CellAttrs.UpdateAttribute "class", ewrpt_IIf(compromisos.RowTotalType = EWRPT_ROWTOTAL_PAGE Or compromisos.RowTotalType = EWRPT_ROWTOTAL_GRAND, "ewRptGrpAggregate", "ewRptGrpSummary" & compromisos.RowGroupLevel)
		Else

			' CODCLI
			compromisos.CODCLI.ViewValue = compromisos.CODCLI.CurrentValue
			compromisos.CODCLI.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' MONTO2
			compromisos.MONTO2.ViewValue = compromisos.MONTO2.CurrentValue
			compromisos.MONTO2.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' SALDO2
			compromisos.SALDO2.ViewValue = compromisos.SALDO2.CurrentValue
			compromisos.SALDO2.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' FECVEN
			compromisos.FECVEN.ViewValue = compromisos.FECVEN.CurrentValue
			compromisos.FECVEN.ViewValue = ewrpt_FormatDateTime(compromisos.FECVEN.ViewValue, 7)
			compromisos.FECVEN.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' FECDEUDA
			compromisos.FECDEUDA.ViewValue = compromisos.FECDEUDA.CurrentValue
			compromisos.FECDEUDA.ViewValue = ewrpt_FormatDateTime(compromisos.FECDEUDA.ViewValue, 7)
			compromisos.FECDEUDA.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' descripcion
			compromisos.descripcion.ViewValue = compromisos.descripcion.CurrentValue
			compromisos.descripcion.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' PATERNO
			compromisos.PATERNO.ViewValue = compromisos.PATERNO.CurrentValue
			compromisos.PATERNO.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' MATERNO
			compromisos.MATERNO.ViewValue = compromisos.MATERNO.CurrentValue
			compromisos.MATERNO.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' NOMBRE
			compromisos.NOMBRE.ViewValue = compromisos.NOMBRE.CurrentValue
			compromisos.NOMBRE.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' FECHA_PRESUNTA_PAGO
			compromisos.FECHA_PRESUNTA_PAGO.ViewValue = compromisos.FECHA_PRESUNTA_PAGO.CurrentValue
			compromisos.FECHA_PRESUNTA_PAGO.ViewValue = ewrpt_FormatDateTime(compromisos.FECHA_PRESUNTA_PAGO.ViewValue, 7)
			compromisos.FECHA_PRESUNTA_PAGO.CellAttrs.UpdateAttribute "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

			' CODCLI
			compromisos.CODCLI.HrefValue = ""

			' MONTO2
			compromisos.MONTO2.HrefValue = ""

			' SALDO2
			compromisos.SALDO2.HrefValue = ""

			' FECVEN
			compromisos.FECVEN.HrefValue = ""

			' FECDEUDA
			compromisos.FECDEUDA.HrefValue = ""

			' descripcion
			compromisos.descripcion.HrefValue = ""

			' PATERNO
			compromisos.PATERNO.HrefValue = ""

			' MATERNO
			compromisos.MATERNO.HrefValue = ""

			' NOMBRE
			compromisos.NOMBRE.HrefValue = ""

			' FECHA_PRESUNTA_PAGO
			compromisos.FECHA_PRESUNTA_PAGO.HrefValue = ""
		End If

		' Call Cell_Rendered event
		If compromisos.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' MONTO2
			Call compromisos.Cell_Rendered(compromisos.MONTO2, compromisos.MONTO2.SumValue, compromisos.MONTO2.SumViewValue, compromisos.MONTO2.ViewAttrs, compromisos.MONTO2.CellAttrs, compromisos.MONTO2.HrefValue)

			' SALDO2
			Call compromisos.Cell_Rendered(compromisos.SALDO2, compromisos.SALDO2.SumValue, compromisos.SALDO2.SumViewValue, compromisos.SALDO2.ViewAttrs, compromisos.SALDO2.CellAttrs, compromisos.SALDO2.HrefValue)
		Else

			' CODCLI
			Call compromisos.Cell_Rendered(compromisos.CODCLI, compromisos.CODCLI.CurrentValue, compromisos.CODCLI.ViewValue, compromisos.CODCLI.ViewAttrs, compromisos.CODCLI.CellAttrs, compromisos.CODCLI.HrefValue)

			' MONTO2
			Call compromisos.Cell_Rendered(compromisos.MONTO2, compromisos.MONTO2.CurrentValue, compromisos.MONTO2.ViewValue, compromisos.MONTO2.ViewAttrs, compromisos.MONTO2.CellAttrs, compromisos.MONTO2.HrefValue)

			' SALDO2
			Call compromisos.Cell_Rendered(compromisos.SALDO2, compromisos.SALDO2.CurrentValue, compromisos.SALDO2.ViewValue, compromisos.SALDO2.ViewAttrs, compromisos.SALDO2.CellAttrs, compromisos.SALDO2.HrefValue)

			' FECVEN
			Call compromisos.Cell_Rendered(compromisos.FECVEN, compromisos.FECVEN.CurrentValue, compromisos.FECVEN.ViewValue, compromisos.FECVEN.ViewAttrs, compromisos.FECVEN.CellAttrs, compromisos.FECVEN.HrefValue)

			' FECDEUDA
			Call compromisos.Cell_Rendered(compromisos.FECDEUDA, compromisos.FECDEUDA.CurrentValue, compromisos.FECDEUDA.ViewValue, compromisos.FECDEUDA.ViewAttrs, compromisos.FECDEUDA.CellAttrs, compromisos.FECDEUDA.HrefValue)

			' descripcion
			Call compromisos.Cell_Rendered(compromisos.descripcion, compromisos.descripcion.CurrentValue, compromisos.descripcion.ViewValue, compromisos.descripcion.ViewAttrs, compromisos.descripcion.CellAttrs, compromisos.descripcion.HrefValue)

			' PATERNO
			Call compromisos.Cell_Rendered(compromisos.PATERNO, compromisos.PATERNO.CurrentValue, compromisos.PATERNO.ViewValue, compromisos.PATERNO.ViewAttrs, compromisos.PATERNO.CellAttrs, compromisos.PATERNO.HrefValue)

			' MATERNO
			Call compromisos.Cell_Rendered(compromisos.MATERNO, compromisos.MATERNO.CurrentValue, compromisos.MATERNO.ViewValue, compromisos.MATERNO.ViewAttrs, compromisos.MATERNO.CellAttrs, compromisos.MATERNO.HrefValue)

			' NOMBRE
			Call compromisos.Cell_Rendered(compromisos.NOMBRE, compromisos.NOMBRE.CurrentValue, compromisos.NOMBRE.ViewValue, compromisos.NOMBRE.ViewAttrs, compromisos.NOMBRE.CellAttrs, compromisos.NOMBRE.HrefValue)

			' FECHA_PRESUNTA_PAGO
			Call compromisos.Cell_Rendered(compromisos.FECHA_PRESUNTA_PAGO, compromisos.FECHA_PRESUNTA_PAGO.CurrentValue, compromisos.FECHA_PRESUNTA_PAGO.ViewValue, compromisos.FECHA_PRESUNTA_PAGO.ViewAttrs, compromisos.FECHA_PRESUNTA_PAGO.CellAttrs, compromisos.FECHA_PRESUNTA_PAGO.HrefValue)
		End If

		' Call Row_Rendered event
		Call compromisos.Row_Rendered()
	End Sub

	Function SetupExportOptionsExt()
	End Function

	' Get extended filter values
	Sub GetExtendedFilterValues()
		Dim sSelectFld, sSelect, sWhere, sOrderBy
		Dim wrkSql, wrkRs

		' Field CODCLI
		sSelect = "SELECT DISTINCT [CODCLI] FROM " & compromisos.SqlFrom
		sWhere = compromisos.SqlWhere
		sOrderBy = "[CODCLI] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		compromisos.CODCLI.DropDownList = ewrpt_GetDistinctValues("", wrkSql)
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

			' Clear extended filter for field FECVEN
			If ClearExtFilter = "compromisos_FECVEN" Then
				Call SetSessionFilterValues("", "=", "AND", "", "=", "FECVEN")
			End If

			' Clear extended filter for field FECDEUDA
			If ClearExtFilter = "compromisos_FECDEUDA" Then
				Call SetSessionFilterValues("", "=", "AND", "", "=", "FECDEUDA")
			End If

		' Reset search command
		ElseIf Request.QueryString("cmd") = "reset" Then

			' Load default values
			' (already loaded) Call LoadDefaultFilters()
			' Field CODCLI

			Call SetSessionDropDownValue(compromisos.CODCLI.DropDownValue, "CODCLI")

			' Field FECVEN
			Call SetSessionFilterValues(compromisos.FECVEN.SearchValue, compromisos.FECVEN.SearchOperator, compromisos.FECVEN.SearchCondition, compromisos.FECVEN.SearchValue2, compromisos.FECVEN.SearchOperator2, "FECVEN")

			' Field FECDEUDA
			Call SetSessionFilterValues(compromisos.FECDEUDA.SearchValue, compromisos.FECDEUDA.SearchOperator, compromisos.FECDEUDA.SearchCondition, compromisos.FECDEUDA.SearchValue2, compromisos.FECDEUDA.SearchOperator2, "FECDEUDA")

			' Field PATERNO
			Call SetSessionFilterValues(compromisos.PATERNO.SearchValue, compromisos.PATERNO.SearchOperator, compromisos.PATERNO.SearchCondition, compromisos.PATERNO.SearchValue2, compromisos.PATERNO.SearchOperator2, "PATERNO")

			' Field MATERNO
			Call SetSessionFilterValues(compromisos.MATERNO.SearchValue, compromisos.MATERNO.SearchOperator, compromisos.MATERNO.SearchCondition, compromisos.MATERNO.SearchValue2, compromisos.MATERNO.SearchOperator2, "MATERNO")

			' Field NOMBRE
			Call SetSessionFilterValues(compromisos.NOMBRE.SearchValue, compromisos.NOMBRE.SearchOperator, compromisos.NOMBRE.SearchCondition, compromisos.NOMBRE.SearchValue2, compromisos.NOMBRE.SearchOperator2, "NOMBRE")
			bSetupFilter = True ' Set up filter required
		Else

			' Field CODCLI
			If GetDropDownValue(compromisos.CODCLI) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(compromisos.CODCLI.DropDownValue) Then
				If compromisos.CODCLI.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_compromisos_CODCLI")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field FECVEN
			If GetFilterValues(compromisos.FECVEN) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field FECDEUDA
			If GetFilterValues(compromisos.FECDEUDA) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field PATERNO
			If GetFilterValues(compromisos.PATERNO) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field MATERNO
			If GetFilterValues(compromisos.MATERNO) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field NOMBRE
			If GetFilterValues(compromisos.NOMBRE) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
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

			' Field CODCLI
			Call GetSessionDropDownValue(compromisos.CODCLI)

			' Field FECVEN
			Call GetSessionFilterValues(compromisos.FECVEN)

			' Field FECDEUDA
			Call GetSessionFilterValues(compromisos.FECDEUDA)

			' Field PATERNO
			Call GetSessionFilterValues(compromisos.PATERNO)

			' Field MATERNO
			Call GetSessionFilterValues(compromisos.MATERNO)

			' Field NOMBRE
			Call GetSessionFilterValues(compromisos.NOMBRE)
		End If

		' Call page filter validated event
		Call compromisos.Page_FilterValidated()

		' Build sql
		' Field CODCLI

		Call ewrpt_BuildDropDownFilter(compromisos.CODCLI, sFilter, "")

		' Field FECVEN
		Call ewrpt_BuildExtendedFilter(compromisos.FECVEN, sFilter)

		' Field FECDEUDA
		Call ewrpt_BuildExtendedFilter(compromisos.FECDEUDA, sFilter)

		' Field PATERNO
		Call ewrpt_BuildExtendedFilter(compromisos.PATERNO, sFilter)

		' Field MATERNO
		Call ewrpt_BuildExtendedFilter(compromisos.MATERNO, sFilter)

		' Field NOMBRE
		Call ewrpt_BuildExtendedFilter(compromisos.NOMBRE, sFilter)

		' Save parms to Session
		' Field CODCLI

		Call SetSessionDropDownValue(compromisos.CODCLI.DropDownValue, "CODCLI")

		' Field FECVEN
		Call SetSessionFilterValues(compromisos.FECVEN.SearchValue, compromisos.FECVEN.SearchOperator, compromisos.FECVEN.SearchCondition, compromisos.FECVEN.SearchValue2, compromisos.FECVEN.SearchOperator2, "FECVEN")

		' Field FECDEUDA
		Call SetSessionFilterValues(compromisos.FECDEUDA.SearchValue, compromisos.FECDEUDA.SearchOperator, compromisos.FECDEUDA.SearchCondition, compromisos.FECDEUDA.SearchValue2, compromisos.FECDEUDA.SearchOperator2, "FECDEUDA")

		' Field PATERNO
		Call SetSessionFilterValues(compromisos.PATERNO.SearchValue, compromisos.PATERNO.SearchOperator, compromisos.PATERNO.SearchCondition, compromisos.PATERNO.SearchValue2, compromisos.PATERNO.SearchOperator2, "PATERNO")

		' Field MATERNO
		Call SetSessionFilterValues(compromisos.MATERNO.SearchValue, compromisos.MATERNO.SearchOperator, compromisos.MATERNO.SearchCondition, compromisos.MATERNO.SearchValue2, compromisos.MATERNO.SearchOperator2, "MATERNO")

		' Field NOMBRE
		Call SetSessionFilterValues(compromisos.NOMBRE.SearchValue, compromisos.NOMBRE.SearchOperator, compromisos.NOMBRE.SearchCondition, compromisos.NOMBRE.SearchValue2, compromisos.NOMBRE.SearchOperator2, "NOMBRE")

		' Setup filter
		If bSetupFilter Then

			' Field FECVEN
			sWrk = ""
			Call ewrpt_BuildExtendedFilter(compromisos.FECVEN, sWrk)
			Call ewrpt_LoadSelectionFromFilter(compromisos.FECVEN, sWrk, arwrk)
			If IsArray(arwrk) Then
				Session("sel_compromisos_FECVEN") = arwrk
			ElseIf arwrk = "" Then
				Session("sel_compromisos_FECVEN") = EWRPT_INIT_VALUE
			End If
			compromisos.FECVEN.SelectionList = arwrk

			' Field FECDEUDA
			sWrk = ""
			Call ewrpt_BuildExtendedFilter(compromisos.FECDEUDA, sWrk)
			Call ewrpt_LoadSelectionFromFilter(compromisos.FECDEUDA, sWrk, arwrk)
			If IsArray(arwrk) Then
				Session("sel_compromisos_FECDEUDA") = arwrk
			ElseIf arwrk = "" Then
				Session("sel_compromisos_FECDEUDA") = EWRPT_INIT_VALUE
			End If
			compromisos.FECDEUDA.SelectionList = arwrk
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
		If Not IsEmpty(Session("sv_compromisos_" & parm)) Then fld.DropDownValue = Session("sv_compromisos_" & parm)
	End Sub

	' Get filter values from Session
	Sub GetSessionFilterValues(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv1_compromisos_" & parm)) Then fld.SearchValue = Session("sv1_compromisos_" & parm)
		If Not IsEmpty(Session("so1_compromisos_" & parm)) Then fld.SearchOperator = Session("so1_compromisos_" & parm)
		If Not IsEmpty(Session("sc_compromisos_" & parm)) Then fld.SearchCondition = Session("sc_compromisos_" & parm)
		If Not IsEmpty(Session("sv2_compromisos_" & parm)) Then fld.SearchValue2 = Session("sv2_compromisos_" & parm)
		If Not IsEmpty(Session("so2_compromisos_" & parm)) Then fld.SearchOperator2 = Session("so2_compromisos_" & parm)
	End Sub

	' Set dropdown value to Session
	Sub SetSessionDropDownValue(sv, parm)
		Session("sv_compromisos_" & parm) = sv
	End Sub

	' Set filter values to Session
	Sub SetSessionFilterValues(sv1, so1, sc, sv2, so2, parm)
		Session("sv1_compromisos_" & parm) = sv1
		Session("so1_compromisos_" & parm) = so1
		Session("sc_compromisos_" & parm) = sc
		Session("sv2_compromisos_" & parm) = sv2
		Session("so2_compromisos_" & parm) = so2
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
		If Not ewrpt_CheckEuroDate(compromisos.FECVEN.SearchValue) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br>"
			gsFormError = gsFormError & compromisos.FECVEN.FldErrMsg
		End If
		If Not ewrpt_CheckEuroDate(compromisos.FECVEN.SearchValue2) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br>"
			gsFormError = gsFormError & compromisos.FECVEN.FldErrMsg
		End If
		If Not ewrpt_CheckEuroDate(compromisos.FECDEUDA.SearchValue) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br>"
			gsFormError = gsFormError & compromisos.FECDEUDA.FldErrMsg
		End If
		If Not ewrpt_CheckEuroDate(compromisos.FECDEUDA.SearchValue2) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br>"
			gsFormError = gsFormError & compromisos.FECDEUDA.FldErrMsg
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
		Session("sel_compromisos_" & parm) = ""
		Session("rf_compromisos_" & parm) = ""
		Session("rt_compromisos_" & parm) = ""
	End Sub

	' Load selection from session
	Sub LoadSelectionFromSession(parm)
		Dim fld
		Set fld = compromisos.GetField(parm)
		fld.SelectionList = Session("sel_compromisos_" & parm)
		fld.RangeFrom = Session("rf_compromisos_" & parm)
		fld.RangeTo = Session("rt_compromisos_" & parm)
	End Sub

	' Load default value for filters
	Sub LoadDefaultFilters()
		Dim sWrk, sSql, arwrk

		' --------------------------------------------------
		'  Set up default values for dropdown filters
		'
		' Field CODCLI

		compromisos.CODCLI.DefaultDropDownValue = EWRPT_INIT_VALUE
		compromisos.CODCLI.DropDownValue = compromisos.CODCLI.DefaultDropDownValue

		' --------------------------------------------------
		'  Set up default values for extended filters
		'
		' Field FECVEN

		Call SetDefaultExtFilter(compromisos.FECVEN, "BETWEEN", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(compromisos.FECVEN)
		sWrk = ""
		Call ewrpt_BuildExtendedFilter(compromisos.FECVEN, sWrk)
		Call ewrpt_LoadSelectionFromFilter(compromisos.FECVEN, sWrk, arwrk)
		compromisos.FECVEN.DefaultSelectionList = arwrk
		compromisos.FECVEN.SelectionList = compromisos.FECVEN.DefaultSelectionList

		' Field FECDEUDA
		Call SetDefaultExtFilter(compromisos.FECDEUDA, "BETWEEN", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(compromisos.FECDEUDA)
		sWrk = ""
		Call ewrpt_BuildExtendedFilter(compromisos.FECDEUDA, sWrk)
		Call ewrpt_LoadSelectionFromFilter(compromisos.FECDEUDA, sWrk, arwrk)
		compromisos.FECDEUDA.DefaultSelectionList = arwrk
		compromisos.FECDEUDA.SelectionList = compromisos.FECDEUDA.DefaultSelectionList

		' Field PATERNO
		Call SetDefaultExtFilter(compromisos.PATERNO, "=", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(compromisos.PATERNO)

		' Field MATERNO
		Call SetDefaultExtFilter(compromisos.MATERNO, "=", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(compromisos.MATERNO)

		' Field NOMBRE
		Call SetDefaultExtFilter(compromisos.NOMBRE, "=", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(compromisos.NOMBRE)

		' --------------------------------------------------
		'  Set up default values for popup filters
		'  - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Function CheckFilter()

		' Check CODCLI non-Text filter
		If NonTextFilterApplied(compromisos.CODCLI) Then
			CheckFilter = True
			Exit Function
		End If

		' Check FECVEN Text filter
		If TextFilterApplied(compromisos.FECVEN) Then
			CheckFilter = True
			Exit Function
		End If

		' Check FECVEN popup filter
		If Not ewrpt_MatchedArray(compromisos.FECVEN.DefaultSelectionList, compromisos.FECVEN.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check FECDEUDA Text filter
		If TextFilterApplied(compromisos.FECDEUDA) Then
			CheckFilter = True
			Exit Function
		End If

		' Check FECDEUDA popup filter
		If Not ewrpt_MatchedArray(compromisos.FECDEUDA.DefaultSelectionList, compromisos.FECDEUDA.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check PATERNO Text filter
		If TextFilterApplied(compromisos.PATERNO) Then
			CheckFilter = True
			Exit Function
		End If

		' Check MATERNO Text filter
		If TextFilterApplied(compromisos.MATERNO) Then
			CheckFilter = True
			Exit Function
		End If

		' Check NOMBRE Text filter
		If TextFilterApplied(compromisos.NOMBRE) Then
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

		' Field CODCLI
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildDropDownFilter(compromisos.CODCLI, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & compromisos.CODCLI.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECVEN
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildExtendedFilter(compromisos.FECVEN, sExtWrk)
		If IsArray(compromisos.FECVEN.SelectionList) Then
			sWrk = ewrpt_JoinArray(compromisos.FECVEN.SelectionList, ", ", EWRPT_DATATYPE_DATE)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & compromisos.FECVEN.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECDEUDA
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildExtendedFilter(compromisos.FECDEUDA, sExtWrk)
		If IsArray(compromisos.FECDEUDA.SelectionList) Then
			sWrk = ewrpt_JoinArray(compromisos.FECDEUDA.SelectionList, ", ", EWRPT_DATATYPE_DATE)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & compromisos.FECDEUDA.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildExtendedFilter(compromisos.PATERNO, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & compromisos.PATERNO.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildExtendedFilter(compromisos.MATERNO, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & compromisos.MATERNO.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		Call ewrpt_BuildExtendedFilter(compromisos.NOMBRE, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & compromisos.NOMBRE.FldCaption & "<br>"
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
		If Not ExtendedFilterExist(compromisos.FECVEN) Then
			If IsArray(compromisos.FECVEN.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(compromisos.FECVEN, "[FECVEN]", EWRPT_DATATYPE_DATE)
			End If
		End If
		If Not ExtendedFilterExist(compromisos.FECDEUDA) Then
			If IsArray(compromisos.FECDEUDA.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(compromisos.FECDEUDA, "[FECDEUDA]", EWRPT_DATATYPE_DATE)
			End If
		End If
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
				compromisos.OrderBy = ""
				compromisos.StartGroup = 1
				compromisos.CODCLI.Sort = ""
				compromisos.MONTO2.Sort = ""
				compromisos.SALDO2.Sort = ""
				compromisos.FECVEN.Sort = ""
				compromisos.FECDEUDA.Sort = ""
				compromisos.descripcion.Sort = ""
				compromisos.PATERNO.Sort = ""
				compromisos.MATERNO.Sort = ""
				compromisos.NOMBRE.Sort = ""
				compromisos.FECHA_PRESUNTA_PAGO.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			compromisos.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				compromisos.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				compromisos.CurrentOrderType = ""
			End If
			sSortSql = compromisos.SortSql
			compromisos.OrderBy = sSortSql
			compromisos.StartGroup = 1
		End If
		GetSort = compromisos.OrderBy
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
