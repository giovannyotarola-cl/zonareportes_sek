<!--#include file="rptinc/ewrcfg4.asp"-->
<!--#include file="rptinc/ewrfn4.asp"-->
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
' Variable for table object
Dim CustomView1

' Define table class
Class crCustomView1
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "CustomView1"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "CustomView1"
	End Property

	' Table type
	Public Property Get TableType()
		TableType = "CUSTOMVIEW"
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

	' Código Cliente
	Private m_CF3digo_Cliente

	Public Property Get CF3digo_Cliente()
		Dim ar
		If Not IsObject(m_CF3digo_Cliente) Then
			Set m_CF3digo_Cliente = NewFldObj("CustomView1", "CustomView1", "x_CF3digo_Cliente", "Código Cliente", "cl.CODCLI", 200, EWRPT_DATATYPE_STRING, -1)
			m_CF3digo_Cliente.DateFilter = ""
			m_CF3digo_Cliente.SqlSelect = ""
			m_CF3digo_Cliente.SqlOrderBy = ""
		End If
		Set CF3digo_Cliente = m_CF3digo_Cliente
	End Property

	' Paterno
	Private m_Paterno

	Public Property Get Paterno()
		Dim ar
		If Not IsObject(m_Paterno) Then
			Set m_Paterno = NewFldObj("CustomView1", "CustomView1", "x_Paterno", "Paterno", "cl.PATERNO", 200, EWRPT_DATATYPE_STRING, -1)
			m_Paterno.DateFilter = ""
			m_Paterno.SqlSelect = ""
			m_Paterno.SqlOrderBy = ""
		End If
		Set Paterno = m_Paterno
	End Property

	' Materno
	Private m_Materno

	Public Property Get Materno()
		Dim ar
		If Not IsObject(m_Materno) Then
			Set m_Materno = NewFldObj("CustomView1", "CustomView1", "x_Materno", "Materno", "cl.MATERNO", 200, EWRPT_DATATYPE_STRING, -1)
			m_Materno.DateFilter = ""
			m_Materno.SqlSelect = ""
			m_Materno.SqlOrderBy = ""
		End If
		Set Materno = m_Materno
	End Property

	' Nombre
	Private m_Nombre

	Public Property Get Nombre()
		Dim ar
		If Not IsObject(m_Nombre) Then
			Set m_Nombre = NewFldObj("CustomView1", "CustomView1", "x_Nombre", "Nombre", "cl.NOMBRE", 200, EWRPT_DATATYPE_STRING, -1)
			m_Nombre.DateFilter = ""
			m_Nombre.SqlSelect = ""
			m_Nombre.SqlOrderBy = ""
		End If
		Set Nombre = m_Nombre
	End Property

	' Código Carrera
	Private m_CF3digo_Carrera

	Public Property Get CF3digo_Carrera()
		Dim ar
		If Not IsObject(m_CF3digo_Carrera) Then
			Set m_CF3digo_Carrera = NewFldObj("CustomView1", "CustomView1", "x_CF3digo_Carrera", "Código Carrera", "al.CODCARPR", 200, EWRPT_DATATYPE_STRING, -1)
			m_CF3digo_Carrera.DateFilter = ""
			m_CF3digo_Carrera.SqlSelect = ""
			m_CF3digo_Carrera.SqlOrderBy = ""
		End If
		Set CF3digo_Carrera = m_CF3digo_Carrera
	End Property

	' Jornada
	Private m_Jornada

	Public Property Get Jornada()
		Dim ar
		If Not IsObject(m_Jornada) Then
			Set m_Jornada = NewFldObj("CustomView1", "CustomView1", "x_Jornada", "Jornada", "al.JORNADA", 200, EWRPT_DATATYPE_STRING, -1)
			m_Jornada.DateFilter = ""
			m_Jornada.SqlSelect = ""
			m_Jornada.SqlOrderBy = ""
		End If
		Set Jornada = m_Jornada
	End Property

	' Año
	Private m_AF1o

	Public Property Get AF1o()
		Dim ar
		If Not IsObject(m_AF1o) Then
			Set m_AF1o = NewFldObj("CustomView1", "CustomView1", "x_AF1o", "Año", "s.ANO", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_AF1o.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_AF1o.DateFilter = ""
			m_AF1o.SqlSelect = ""
			m_AF1o.SqlOrderBy = ""
		End If
		Set AF1o = m_AF1o
	End Property

	' Periodo
	Private m_Periodo

	Public Property Get Periodo()
		Dim ar
		If Not IsObject(m_Periodo) Then
			Set m_Periodo = NewFldObj("CustomView1", "CustomView1", "x_Periodo", "Periodo", "s.PERIODO", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_Periodo.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_Periodo.DateFilter = ""
			m_Periodo.SqlSelect = ""
			m_Periodo.SqlOrderBy = ""
		End If
		Set Periodo = m_Periodo
	End Property

	' Emisión
	Private m_EmisiF3n

	Public Property Get EmisiF3n()
		Dim ar
		If Not IsObject(m_EmisiF3n) Then
			Set m_EmisiF3n = NewFldObj("CustomView1", "CustomView1", "x_EmisiF3n", "Emisión", "s.EMISION", 135, EWRPT_DATATYPE_DATE, 7)
			m_EmisiF3n.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateDMY"), "%s", "/")
			m_EmisiF3n.DateFilter = ""
			m_EmisiF3n.SqlSelect = ""
			m_EmisiF3n.SqlOrderBy = ""
		End If
		Set EmisiF3n = m_EmisiF3n
	End Property

	' Tipo Solicitud
	Private m_Tipo_Solicitud

	Public Property Get Tipo_Solicitud()
		Dim ar
		If Not IsObject(m_Tipo_Solicitud) Then
			Set m_Tipo_Solicitud = NewFldObj("CustomView1", "CustomView1", "x_Tipo_Solicitud", "Tipo Solicitud", "s.TIPOSITU", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_Tipo_Solicitud.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_Tipo_Solicitud.DateFilter = ""
			m_Tipo_Solicitud.SqlSelect = ""
			m_Tipo_Solicitud.SqlOrderBy = ""
		End If
		Set Tipo_Solicitud = m_Tipo_Solicitud
	End Property

	' Descripción
	Private m_DescripciF3n

	Public Property Get DescripciF3n()
		Dim ar
		If Not IsObject(m_DescripciF3n) Then
			Set m_DescripciF3n = NewFldObj("CustomView1", "CustomView1", "x_DescripciF3n", "Descripción", "t.DESCRIPCION", 200, EWRPT_DATATYPE_STRING, -1)
			m_DescripciF3n.DateFilter = ""
			m_DescripciF3n.SqlSelect = ""
			m_DescripciF3n.SqlOrderBy = ""
		End If
		Set DescripciF3n = m_DescripciF3n
	End Property

	' Observación
	Private m_ObservaciF3n

	Public Property Get ObservaciF3n()
		Dim ar
		If Not IsObject(m_ObservaciF3n) Then
			Set m_ObservaciF3n = NewFldObj("CustomView1", "CustomView1", "x_ObservaciF3n", "Observación", "s.OBSERVACION", 200, EWRPT_DATATYPE_STRING, -1)
			m_ObservaciF3n.DateFilter = ""
			m_ObservaciF3n.SqlSelect = ""
			m_ObservaciF3n.SqlOrderBy = ""
		End If
		Set ObservaciF3n = m_ObservaciF3n
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

	' Reset CSS styles for table object
	Sub ResetCSS()
		Call ewrpt_SetAttr(RowAttrs, "style", "")
		Call ewrpt_SetAttr(RowAttrs, "class", "")
		If IsArray(Fields) Then
			For i = 0 to UBound(Fields,2)
				Set fld = Fields(1,i)
				Call fld.ResetCSS()
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
		Set RowAttrs = Server.CreateObject("Scripting.Dictionary") ' Row attributes
		Call ewrpt_SetArObj(Fields, "CF3digo_Cliente", CF3digo_Cliente)
		Call ewrpt_SetArObj(Fields, "Paterno", Paterno)
		Call ewrpt_SetArObj(Fields, "Materno", Materno)
		Call ewrpt_SetArObj(Fields, "Nombre", Nombre)
		Call ewrpt_SetArObj(Fields, "CF3digo_Carrera", CF3digo_Carrera)
		Call ewrpt_SetArObj(Fields, "Jornada", Jornada)
		Call ewrpt_SetArObj(Fields, "AF1o", AF1o)
		Call ewrpt_SetArObj(Fields, "Periodo", Periodo)
		Call ewrpt_SetArObj(Fields, "EmisiF3n", EmisiF3n)
		Call ewrpt_SetArObj(Fields, "Tipo_Solicitud", Tipo_Solicitud)
		Call ewrpt_SetArObj(Fields, "DescripciF3n", DescripciF3n)
		Call ewrpt_SetArObj(Fields, "ObservaciF3n", ObservaciF3n)
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
		SqlFrom = "ra_situ s, ra_tipositu t, mt_alumno al, mt_client cl"
	End Property

	Public Property Get SqlSelect() ' Select
		SqlSelect = "SELECT cl.CODCLI As [Código Cliente], cl.PATERNO As Paterno, cl.MATERNO As Materno, cl.NOMBRE As Nombre, al.CODCARPR As [Código Carrera], al.JORNADA As Jornada, s.ANO As Año, s.PERIODO As Periodo, s.EMISION As Emisión, s.TIPOSITU As [Tipo Solicitud], t.DESCRIPCION As Descripción, s.OBSERVACION As Observación FROM " & SqlFrom
	End Property

	Public Property Get SqlWhere() ' Where
		SqlWhere = "cl.CODCLI = al.RUT And s.CODCLI = al.CODCLI And s.TIPOSITU = t.CODIGO And (s.ANO = 2011 And s.PERIODO = 1 And t.ESRETIRO = 'S')"
	End Property

	Public Property Get SqlGroupBy() ' Group By
		SqlGroupBy = ""
	End Property

	Public Property Get SqlHaving() ' Having
		SqlHaving = ""
	End Property

	Public Property Get SqlOrderBy() ' Order By
		SqlOrderBy = "al.CODCARPR, al.JORNADA"
	End Property

	' Sort URL
	Function SortUrl(fld)
		SortUrl = ""
	End Function

	' Row attributes
	Function RowAttributes()
		Dim sAtt, Attr
		sAtt = ""
		For Each Attr In RowAttrs
			If RowAttrs.Item(Attr) <> "" Then
				sAtt = sAtt & " " & Attr & "=""" & RowAttrs.Item(Attr) & """"
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

	' Row Rendered event
	Sub Row_Rendered()

		' To view properties of field class, use:
		' Response.Write <FieldName>.AsString

	End Sub

	' Load Custom Filters event
	Sub CustomFilters_Load()

		' Enter your code here	
		' ewrpt_RegisterCustomFilter <Field>, "LastMonth", "Last Month", "GetLastMonthFilter" ' Date example
		' ewrpt_RegisterCustomFilter <Field>, "StartsWithA", "Starts With A", "GetStartsWithAFilter" ' String example

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
<%
Response.Expires = 0
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "pragma", "no-cache"
Response.AddHeader "cache-control", "private, no-cache, no-store, must-revalidate"
%>
<%

' Define page object
Dim CustomView1_rpt
Set CustomView1_rpt = New crCustomView1_rpt
Set Page = CustomView1_rpt

' Page init processing
Call CustomView1_rpt.Page_Init()

' Page main processing
Call CustomView1_rpt.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<% If CustomView1.Export = "" Then %>
<script type="text/javascript">
<!--
// Create page object
var CustomView1_rpt = new ewrpt_Page("CustomView1_rpt");
// page properties
CustomView1_rpt.PageID = "rpt"; // page ID
CustomView1_rpt.FormID = "fCustomView1rptfilter"; // form ID
var EWRPT_PAGE_ID = CustomView1_rpt.PageID;
// extend page with ValidateForm function
CustomView1_rpt.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_EmisiF3n;
	if (elm && !ewrpt_CheckEuroDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(CustomView1.EmisiF3n.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv2_EmisiF3n;
	if (elm && !ewrpt_CheckEuroDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(CustomView1.EmisiF3n.FldErrMsg) %>"))
			return false;
	}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
CustomView1_rpt.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If EWRPT_CLIENT_VALIDATE Then %>
CustomView1_rpt.ValidateRequired = true; // uses JavaScript validation
<% Else %>
CustomView1_rpt.ValidateRequired = false; // no JavaScript validation
<% End If %>
//-->
</script>
<link rel="stylesheet" type="text/css" media="all" href="jscalendar/calendar-win2k-1.css" title="win2k-1" />
<script type="text/javascript" src="jscalendar/calendar.js"></script>
<script type="text/javascript" src="jscalendar/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar/calendar-setup.js"></script>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
//-->
</script>
<% End If %>
<% CustomView1_rpt.ShowPageHeader() %>
<% If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg() %>
<% CustomView1_rpt.ShowMessage() %>
<link rel="stylesheet" type="text/css" media="all" href="css/titles.css"/>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If CustomView1.Export = "" Then %>
<script src="rptjs/popup.js" type="text/javascript"></script>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
</script>
<% End If %>
<% If CustomView1.Export = "" Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline">
<h1><%= CustomView1.TableCaption %></h1>
</div>
<% If CustomView1.Export = "" Then %>
&nbsp;&nbsp;<a href="<%= CustomView1_rpt.ExportExcelUrl %>&acc=<%=Request("acc")%>"><img src="images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
<% End If %>
<br><br>
<% If CustomView1.Export = "" Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspreportmaker">
	<!-- Left slot -->
<% End If %>
<% If CustomView1.Export = "" Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If CustomView1.Export = "" Then %>
<%
If (CustomView1.FilterPanelOption = 2) Or (CustomView1.FilterPanelOption = 3 And CustomView1_rpt.FilterApplied) Or (CustomView1_rpt.Filter = "0=101") Then
	sButtonImage = "rptimages/collapse.gif"
	sDivDisplay = ""
Else
	sButtonImage = "rptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span>
<% If CustomView1_rpt.FilterApplied Then %>
&nbsp;&nbsp;<a href="CustomView1rpt.asp?cmd=reset&acc=<%=Request("acc")%>"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fCustomView1rptfilter" id="fCustomView1rptfilter" action="CustomView1rpt.asp" class="ewForm" onsubmit="return CustomView1_rpt.ValidateForm(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.CF3digo_Cliente.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_CF3digo_Cliente" id="so1_CF3digo_Cliente" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_CF3digo_Cliente" id="sv1_CF3digo_Cliente" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(CustomView1.CF3digo_Cliente.SearchValue) %>"<% If CustomView1_rpt.ClearExtFilter = "CustomView1_CF3digo_Cliente" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.Paterno.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Paterno" id="so1_Paterno" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Paterno" id="sv1_Paterno" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(CustomView1.Paterno.SearchValue) %>"<% If CustomView1_rpt.ClearExtFilter = "CustomView1_Paterno" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.Materno.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Materno" id="so1_Materno" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Materno" id="sv1_Materno" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(CustomView1.Materno.SearchValue) %>"<% If CustomView1_rpt.ClearExtFilter = "CustomView1_Materno" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.Nombre.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Nombre" id="so1_Nombre" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Nombre" id="sv1_Nombre" size="30" maxlength="32" value="<%= ewrpt_HtmlEncode(CustomView1.Nombre.SearchValue) %>"<% If CustomView1_rpt.ClearExtFilter = "CustomView1_Nombre" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.CF3digo_Carrera.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_CF3digo_Carrera" id="so1_CF3digo_Carrera" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_CF3digo_Carrera" id="sv1_CF3digo_Carrera" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(CustomView1.CF3digo_Carrera.SearchValue) %>"<% If CustomView1_rpt.ClearExtFilter = "CustomView1_CF3digo_Carrera" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.Jornada.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Jornada" id="sv_Jornada"<%= ewrpt_IIf(CustomView1_rpt.ClearExtFilter = "CustomView1_Jornada", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(CustomView1.Jornada.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(CustomView1.Jornada.CustomFilters) Then
	cntf = UBound(CustomView1.Jornada.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(CustomView1.Jornada.DropDownList) Then
	cntd = UBound(CustomView1.Jornada.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If CustomView1.Jornada.CustomFilters(i).FldName = "Jornada" Then
%>
		<option value="<%= "@@" & CustomView1.Jornada.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(CustomView1.Jornada.DropDownValue, "@@" & CustomView1.Jornada.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= CustomView1.Jornada.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= CustomView1.Jornada.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(CustomView1.Jornada.DropDownValue, CustomView1.Jornada.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(CustomView1.Jornada.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.AF1o.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AF1o" id="sv_AF1o"<%= ewrpt_IIf(CustomView1_rpt.ClearExtFilter = "CustomView1_AF1o", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(CustomView1.AF1o.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(CustomView1.AF1o.CustomFilters) Then
	cntf = UBound(CustomView1.AF1o.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(CustomView1.AF1o.DropDownList) Then
	cntd = UBound(CustomView1.AF1o.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If CustomView1.AF1o.CustomFilters(i).FldName = "Año" Then
%>
		<option value="<%= "@@" & CustomView1.AF1o.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(CustomView1.AF1o.DropDownValue, "@@" & CustomView1.AF1o.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= CustomView1.AF1o.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= CustomView1.AF1o.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(CustomView1.AF1o.DropDownValue, CustomView1.AF1o.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(CustomView1.AF1o.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.Periodo.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Periodo" id="sv_Periodo"<%= ewrpt_IIf(CustomView1_rpt.ClearExtFilter = "CustomView1_Periodo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(CustomView1.Periodo.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(CustomView1.Periodo.CustomFilters) Then
	cntf = UBound(CustomView1.Periodo.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(CustomView1.Periodo.DropDownList) Then
	cntd = UBound(CustomView1.Periodo.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If CustomView1.Periodo.CustomFilters(i).FldName = "Periodo" Then
%>
		<option value="<%= "@@" & CustomView1.Periodo.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(CustomView1.Periodo.DropDownValue, "@@" & CustomView1.Periodo.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= CustomView1.Periodo.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= CustomView1.Periodo.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(CustomView1.Periodo.DropDownValue, CustomView1.Periodo.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(CustomView1.Periodo.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.EmisiF3n.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_EmisiF3n" id="so1_EmisiF3n" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_EmisiF3n" id="sv1_EmisiF3n" value="<%= ewrpt_HtmlEncode(CustomView1.EmisiF3n.SearchValue) %>"<% If CustomView1_rpt.ClearExtFilter = "CustomView1_EmisiF3n" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv1_EmisiF3n" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv1_EmisiF3n", // ID of the input field
	ifFormat : "%d/%m/%Y", // the date format
	button : "csv1_EmisiF3n" // ID of the button
})
</script>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw1_EmisiF3n" name="btw1_EmisiF3n">&nbsp;<%= ReportLanguage.Phrase("y") %>&nbsp;</span></td>
				<td><span class="aspreportmaker" id="btw1_EmisiF3n" name="btw1_EmisiF3n">
<input type="text" name="sv2_EmisiF3n" id="sv2_EmisiF3n" value="<%= ewrpt_HtmlEncode(CustomView1.EmisiF3n.SearchValue2) %>"<% If CustomView1_rpt.ClearExtFilter = "CustomView1_EmisiF3n" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv2_EmisiF3n" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv2_EmisiF3n", // ID of the input field
	ifFormat : "%d/%m/%Y", // the date format
	button : "csv2_EmisiF3n" // ID of the button
})
</script>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.Tipo_Solicitud.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Tipo_Solicitud" id="sv_Tipo_Solicitud"<%= ewrpt_IIf(CustomView1_rpt.ClearExtFilter = "CustomView1_Tipo_Solicitud", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(CustomView1.Tipo_Solicitud.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(CustomView1.Tipo_Solicitud.CustomFilters) Then
	cntf = UBound(CustomView1.Tipo_Solicitud.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(CustomView1.Tipo_Solicitud.DropDownList) Then
	cntd = UBound(CustomView1.Tipo_Solicitud.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If CustomView1.Tipo_Solicitud.CustomFilters(i).FldName = "Tipo Solicitud" Then
%>
		<option value="<%= "@@" & CustomView1.Tipo_Solicitud.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(CustomView1.Tipo_Solicitud.DropDownValue, "@@" & CustomView1.Tipo_Solicitud.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= CustomView1.Tipo_Solicitud.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= CustomView1.Tipo_Solicitud.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(CustomView1.Tipo_Solicitud.DropDownValue, CustomView1.Tipo_Solicitud.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(CustomView1.Tipo_Solicitud.DropDownList(i), "", 0) %></option>
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
<% If CustomView1.ShowCurrentFilter Then %>
<div id="ewrptFilterList">
<% Call CustomView1_rpt.ShowFilterList() %>
</div>
<br>
<% End If %>
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<!-- Report Grid (Begin) -->
<div class="ewGridMiddlePanel">
<table class="ewTable ewTableSeparate" cellspacing="0">
<%

' Set the last group to display if not export all
If (CustomView1.ExportAll And CustomView1.Export <> "") Then
	CustomView1_rpt.StopGrp = CustomView1_rpt.TotalGrps
Else
	CustomView1_rpt.StopGrp = CustomView1_rpt.StartGrp + CustomView1_rpt.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(CustomView1_rpt.StopGrp) > CLng(CustomView1_rpt.TotalGrps) Then
	CustomView1_rpt.StopGrp = CustomView1_rpt.TotalGrps
End If
CustomView1_rpt.RecCount = 0

' Init Summary Values
Call CustomView1_rpt.ResetLevelSummary(0)

' Get first row
If CustomView1_rpt.TotalGrps > 0 Then
	Call CustomView1_rpt.GetRow(1)
	CustomView1_rpt.GrpCount = 1
End If
Do While (Not rs.Eof And CustomView1_rpt.GrpCount <= CustomView1_rpt.DisplayGrps) Or (CustomView1_rpt.ShowFirstHeader)

	' Show Header
	If CustomView1_rpt.ShowFirstHeader Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.CF3digo_Cliente.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.CF3digo_Cliente) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.CF3digo_Cliente.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.CF3digo_Cliente) %>',0);"><%= CustomView1.CF3digo_Cliente.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.CF3digo_Cliente.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.CF3digo_Cliente.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.Paterno.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.Paterno) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.Paterno.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.Paterno) %>',0);"><%= CustomView1.Paterno.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.Paterno.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.Paterno.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.Materno.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.Materno) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.Materno.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.Materno) %>',0);"><%= CustomView1.Materno.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.Materno.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.Materno.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.Nombre.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.Nombre) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.Nombre.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.Nombre) %>',0);"><%= CustomView1.Nombre.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.Nombre.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.Nombre.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.CF3digo_Carrera.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.CF3digo_Carrera) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.CF3digo_Carrera.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.CF3digo_Carrera) %>',0);"><%= CustomView1.CF3digo_Carrera.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.CF3digo_Carrera.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.CF3digo_Carrera.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.Jornada.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.Jornada) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.Jornada.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.Jornada) %>',0);"><%= CustomView1.Jornada.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.Jornada.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.Jornada.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.AF1o.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.AF1o) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.AF1o.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.AF1o) %>',0);"><%= CustomView1.AF1o.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.AF1o.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.AF1o.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.Periodo.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.Periodo) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.Periodo.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.Periodo) %>',0);"><%= CustomView1.Periodo.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.Periodo.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.Periodo.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.EmisiF3n.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.EmisiF3n) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.EmisiF3n.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.EmisiF3n) %>',0);"><%= CustomView1.EmisiF3n.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.EmisiF3n.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.EmisiF3n.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.Tipo_Solicitud.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.Tipo_Solicitud) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.Tipo_Solicitud.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.Tipo_Solicitud) %>',0);"><%= CustomView1.Tipo_Solicitud.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.Tipo_Solicitud.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.Tipo_Solicitud.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.DescripciF3n.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.DescripciF3n) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.DescripciF3n.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.DescripciF3n) %>',0);"><%= CustomView1.DescripciF3n.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.DescripciF3n.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.DescripciF3n.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.ObservaciF3n.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.ObservaciF3n) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.ObservaciF3n.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.ObservaciF3n) %>',0);"><%= CustomView1.ObservaciF3n.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.ObservaciF3n.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.ObservaciF3n.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		CustomView1_rpt.ShowFirstHeader = False
	End If
	CustomView1_rpt.RecCount = CustomView1_rpt.RecCount + 1

		' Render detail row
		Call CustomView1.ResetCSS()
		CustomView1.RowType = EWRPT_ROWTYPE_DETAIL
		Call CustomView1_rpt.RenderRow()
%>
	<tr<%= CustomView1.RowAttributes %>>
		<td<%= CustomView1.CF3digo_Cliente.CellAttributes %>>
<div<%= CustomView1.CF3digo_Cliente.ViewAttributes %>><%= CustomView1.CF3digo_Cliente.ListViewValue %></div>
</td>
		<td<%= CustomView1.Paterno.CellAttributes %>>
<div<%= CustomView1.Paterno.ViewAttributes %>><%= CustomView1.Paterno.ListViewValue %></div>
</td>
		<td<%= CustomView1.Materno.CellAttributes %>>
<div<%= CustomView1.Materno.ViewAttributes %>><%= CustomView1.Materno.ListViewValue %></div>
</td>
		<td<%= CustomView1.Nombre.CellAttributes %>>
<div<%= CustomView1.Nombre.ViewAttributes %>><%= CustomView1.Nombre.ListViewValue %></div>
</td>
		<td<%= CustomView1.CF3digo_Carrera.CellAttributes %>>
<div<%= CustomView1.CF3digo_Carrera.ViewAttributes %>><%= CustomView1.CF3digo_Carrera.ListViewValue %></div>
</td>
		<td<%= CustomView1.Jornada.CellAttributes %>>
<div<%= CustomView1.Jornada.ViewAttributes %>><%= CustomView1.Jornada.ListViewValue %></div>
</td>
		<td<%= CustomView1.AF1o.CellAttributes %>>
<div<%= CustomView1.AF1o.ViewAttributes %>><%= CustomView1.AF1o.ListViewValue %></div>
</td>
		<td<%= CustomView1.Periodo.CellAttributes %>>
<div<%= CustomView1.Periodo.ViewAttributes %>><%= CustomView1.Periodo.ListViewValue %></div>
</td>
		<td<%= CustomView1.EmisiF3n.CellAttributes %>>
<div<%= CustomView1.EmisiF3n.ViewAttributes %>><%= CustomView1.EmisiF3n.ListViewValue %></div>
</td>
		<td<%= CustomView1.Tipo_Solicitud.CellAttributes %>>
<div<%= CustomView1.Tipo_Solicitud.ViewAttributes %>><%= CustomView1.Tipo_Solicitud.ListViewValue %></div>
</td>
		<td<%= CustomView1.DescripciF3n.CellAttributes %>>
<div<%= CustomView1.DescripciF3n.ViewAttributes %>><%= CustomView1.DescripciF3n.ListViewValue %></div>
</td>
		<td<%= CustomView1.ObservaciF3n.CellAttributes %>>
<div<%= CustomView1.ObservaciF3n.ViewAttributes %>><%= CustomView1.ObservaciF3n.ListViewValue %></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Call CustomView1_rpt.AccumulateSummary()

		' Get next record
		Call CustomView1_rpt.GetRow(2)
		CustomView1_rpt.GrpCount = CustomView1_rpt.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
	</tfoot>
</table>
</div>
<% If CustomView1.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="CustomView1rpt.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(CustomView1_rpt.StartGrp, CustomView1_rpt.DisplayGrps, CustomView1_rpt.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.FirstButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.PrevButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.NextButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.LastButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If CustomView1_rpt.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If CustomView1_rpt.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("RecordsPerPage") %>&nbsp;
<input type="hidden" name="acc" value="<%=Request("acc")%>">
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="10"<% If CustomView1_rpt.DisplayGrps = 10 Then Response.Write " selected=""selected""" %>>10</option>
<option value="15"<% If CustomView1_rpt.DisplayGrps = 15 Then Response.Write " selected=""selected""" %>>15</option>
<option value="20"<% If CustomView1_rpt.DisplayGrps = 20 Then Response.Write " selected=""selected""" %>>20</option>
<option value="50"<% If CustomView1_rpt.DisplayGrps = 50 Then Response.Write " selected=""selected""" %>>50</option>
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
<% If CustomView1.Export = "" Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspreportmaker">
	<!-- Right slot -->
<% End If %>
<% If CustomView1.Export = "" Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If CustomView1.Export = "" Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% CustomView1_rpt.ShowPageFooter() %>
<%

' Close recordset and connection
rs.Close
Set rs = Nothing
%>
<% If CustomView1.Export = "" Then %>
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
Set CustomView1_rpt = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crCustomView1_rpt

	' Page ID
	Public Property Get PageID()
		PageID = "rpt"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "CustomView1"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "CustomView1_rpt"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If CustomView1.UseTokenInUrl Then PageUrl = PageUrl & "t=" & CustomView1.TableVar & "&" ' add page token
	End Property

	' Export URLs
	Dim ExportPrintUrl
	Dim ExportExcelUrl
	Dim ExportWordUrl

	' Message
	Public Property Get Message()
		Message = Session(EWRPT_SESSION_MESSAGE)
	End Property

	Public Property Let Message(v)
		If Session(EWRPT_SESSION_MESSAGE) <> "" Then ' Append
			Session(EWRPT_SESSION_MESSAGE) = Session(EWRPT_SESSION_MESSAGE) & "<br />" & v
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
		If CustomView1.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (CustomView1.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (CustomView1.TableVar = Request.QueryString("t"))
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
		Set CustomView1 = New crCustomView1

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "rpt"

		' Initialize table name
		EWRPT_TABLE_NAME = "CustomView1"

		' Open connection
		Call ewrpt_Connect()
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
			CustomView1.Export = Request.QueryString("export")
		End If
		gsExport = CustomView1.Export ' Get export parameter, used in header
		gsExportFile = CustomView1.TableVar ' Get export file, used in header
		If CustomView1.Export = "excel" Then
			Response.ContentType = "application/vnd.ms-excel"
			Response.AddHeader "Content-Disposition", "attachment; filename=" & gsExportFile & ".xls"
		End If

		' Global page loading event
		Call Page_Loading()

		' Page load event
		Call Page_Load()

		' Export to Email (Load content via XMLHttp)
		If CustomView1.Export = "email" Then
			Dim sContent, sPage, sParm
			sPage = ewrpt_CurrentPage
			sParm = "export=print&session=" & GetSessionValues()
			sContent = ewrpt_LoadContentFromUrl(ewrpt_ConvertFullUrl(sPage) & "?" & sParm)
			Call ExportEmail(sContent)
			Call Page_Terminate(sPage)
		End If
	End Sub

	Private Function GetSessionValues()
		Dim wrkstr, i, ar
		wrkstr = "cmd=restoresession"

		'wrkstr = "&filter=" & CustomView1.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(CustomView1.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(CustomView1.StartGroup&""))
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
			CustomView1.OrderBy = GetQSValue(QS, "o")
			CustomView1.StartGroup = GetQSValue(QS, "s")
			CustomView1.RestoreSession = True
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
		Set CustomView1 = Nothing

		' Go to url if specified
		Dim sRedirectUrl
		sReDirectUrl = url
		If sReDirectUrl <> "" Then
			If Response.Buffer Then Response.Clear
			Response.Redirect sReDirectUrl
		End If
	End Sub

	' Initialize common variables
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
		DisplayGrps = 15 ' Groups per page
		GrpRange = 10

		' Clear field for ext filter
		ClearExtFilter = ""

		' Filter
		UserIDFilter = ""
		Filter = ""

		' 1st dimension = no of groups (level 0 used for grand total)
		' 2nd dimension = no of fields

		Dim nDtls, nGrps
		nDtls = 12
		nGrps = 0
		ReDim Col(nDtls), Val(nDtls), Cnt(nGrps, nDtls)
		ReDim Smry(nGrps, nDtls), Mn(nGrps, nDtls), Mx(nGrps, nDtls)
		ReDim GrandSmry(nDtls), GrandMn(nDtls), GrandMx(nDtls)

		' Set up if accumulation required
		Col(1) = False
		Col(2) = False
		Col(3) = False
		Col(4) = False
		Col(5) = False
		Col(6) = False
		Col(7) = False
		Col(8) = False
		Col(9) = False
		Col(10) = False
		Col(11) = False
		Col(12) = False

		' Set up groups per page dynamically
		SetUpDisplayGrps()

		' Load default filter values
		Call LoadDefaultFilters()

		' Set up popup filter
		Call SetupPopup()

		' Extended filter
		Dim sExtendedFilter
		sExtendedFilter = ""

		' Get dropdown values
		Call GetExtendedFilterValues()

		' Load custom filters
		Call CustomView1.CustomFilters_Load()

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

		' Get sort
		Sort = GetSort()

		' Restore filter/sort from Session
		If CustomView1.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total count
		Dim sSql
		sSql = ewrpt_BuildReportSql(CustomView1.SqlSelect, CustomView1.SqlWhere, CustomView1.SqlGroupBy, CustomView1.SqlHaving, CustomView1.SqlOrderBy, Filter, Sort)
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

		If CustomView1.ExportAll And CustomView1.Export <> "" Then
			DisplayGrps = TotalGrps
		Else
			Call SetUpStartGroup()
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
			CustomView1.CF3digo_Cliente.DbValue = ewrpt_GetValue(rs("Código Cliente"))
			CustomView1.Paterno.DbValue = ewrpt_GetValue(rs("Paterno"))
			CustomView1.Materno.DbValue = ewrpt_GetValue(rs("Materno"))
			CustomView1.Nombre.DbValue = ewrpt_GetValue(rs("Nombre"))
			CustomView1.CF3digo_Carrera.DbValue = ewrpt_GetValue(rs("Código Carrera"))
			CustomView1.Jornada.DbValue = ewrpt_GetValue(rs("Jornada"))
			CustomView1.AF1o.DbValue = ewrpt_GetValue(rs("Año"))
			CustomView1.Periodo.DbValue = ewrpt_GetValue(rs("Periodo"))
			CustomView1.EmisiF3n.DbValue = ewrpt_GetValue(rs("Emisión"))
			CustomView1.Tipo_Solicitud.DbValue = ewrpt_GetValue(rs("Tipo Solicitud"))
			CustomView1.DescripciF3n.DbValue = ewrpt_GetValue(rs("Descripción"))
			CustomView1.ObservaciF3n.DbValue = ewrpt_GetValue(rs("Observación"))
			Val(1) = CustomView1.CF3digo_Cliente.CurrentValue
			Val(2) = CustomView1.Paterno.CurrentValue
			Val(3) = CustomView1.Materno.CurrentValue
			Val(4) = CustomView1.Nombre.CurrentValue
			Val(5) = CustomView1.CF3digo_Carrera.CurrentValue
			Val(6) = CustomView1.Jornada.CurrentValue
			Val(7) = CustomView1.AF1o.CurrentValue
			Val(8) = CustomView1.Periodo.CurrentValue
			Val(9) = CustomView1.EmisiF3n.CurrentValue
			Val(10) = CustomView1.Tipo_Solicitud.CurrentValue
			Val(11) = CustomView1.DescripciF3n.CurrentValue
			Val(12) = CustomView1.ObservaciF3n.CurrentValue
		Else
			CustomView1.CF3digo_Cliente.DbValue = ""
			CustomView1.Paterno.DbValue = ""
			CustomView1.Materno.DbValue = ""
			CustomView1.Nombre.DbValue = ""
			CustomView1.CF3digo_Carrera.DbValue = ""
			CustomView1.Jornada.DbValue = ""
			CustomView1.AF1o.DbValue = ""
			CustomView1.Periodo.DbValue = ""
			CustomView1.EmisiF3n.DbValue = ""
			CustomView1.Tipo_Solicitud.DbValue = ""
			CustomView1.DescripciF3n.DbValue = ""
			CustomView1.ObservaciF3n.DbValue = ""
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
			CustomView1.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				CustomView1.StartGroup = nStartGrp
			Else
				StartGrp = CustomView1.StartGroup
			End If
		Else
			StartGrp = CustomView1.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			CustomView1.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			CustomView1.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			CustomView1.StartGroup = StartGrp
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
		CustomView1.StartGroup = StartGrp
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
					DisplayGrps = 15 ' Non-numeric, Load Default
				End If
			End If
			CustomView1.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			CustomView1.StartGroup = nStartGrp
		Else
			If CustomView1.GroupPerPage <> "" Then
				DisplayGrps = CustomView1.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 15 ' Load Default
			End If
		End If
	End Sub

	' Render row
	Sub RenderRow()
		If CustomView1.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' Get total count from sql directly
			Dim sSql, rstot
			sSql = ewrpt_BuildReportSql(CustomView1.SqlSelectCount, CustomView1.SqlWhere, CustomView1SqlGroupBy, CustomView1.SqlHaving, "", Filter, "")
			If EWRPT_DEBUG_ENABLED Then Response.Write "(Total SQL): " & sSql & "<br>"
			Set rstot = ewrpt_LoadRs(sSql)
			If Not rstot.Eof Then
				TotCount = ewrpt_GetValue(rstot(0))
			Else
				TotCount = 0
			End If
		End If

		' Call Row_Rendering event
		Call CustomView1.Row_Rendering()

		' --------------------
		'  Render view codes
		' --------------------

		If CustomView1.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' Código Cliente
			CustomView1.CF3digo_Cliente.ViewValue = CustomView1.CF3digo_Cliente.Summary

			' Paterno
			CustomView1.Paterno.ViewValue = CustomView1.Paterno.Summary

			' Materno
			CustomView1.Materno.ViewValue = CustomView1.Materno.Summary

			' Nombre
			CustomView1.Nombre.ViewValue = CustomView1.Nombre.Summary

			' Código Carrera
			CustomView1.CF3digo_Carrera.ViewValue = CustomView1.CF3digo_Carrera.Summary

			' Jornada
			CustomView1.Jornada.ViewValue = CustomView1.Jornada.Summary

			' Año
			CustomView1.AF1o.ViewValue = CustomView1.AF1o.Summary

			' Periodo
			CustomView1.Periodo.ViewValue = CustomView1.Periodo.Summary

			' Emisión
			CustomView1.EmisiF3n.ViewValue = CustomView1.EmisiF3n.Summary
			CustomView1.EmisiF3n.ViewValue = ewrpt_FormatDateTime(CustomView1.EmisiF3n.ViewValue, 7)

			' Tipo Solicitud
			CustomView1.Tipo_Solicitud.ViewValue = CustomView1.Tipo_Solicitud.Summary

			' Descripción
			CustomView1.DescripciF3n.ViewValue = CustomView1.DescripciF3n.Summary

			' Observación
			CustomView1.ObservaciF3n.ViewValue = CustomView1.ObservaciF3n.Summary
		Else

			' Código Cliente
			CustomView1.CF3digo_Cliente.ViewValue = CustomView1.CF3digo_Cliente.CurrentValue
			Call ewrpt_SetAttr(CustomView1.CF3digo_Cliente.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Paterno
			CustomView1.Paterno.ViewValue = CustomView1.Paterno.CurrentValue
			Call ewrpt_SetAttr(CustomView1.Paterno.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Materno
			CustomView1.Materno.ViewValue = CustomView1.Materno.CurrentValue
			Call ewrpt_SetAttr(CustomView1.Materno.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Nombre
			CustomView1.Nombre.ViewValue = CustomView1.Nombre.CurrentValue
			Call ewrpt_SetAttr(CustomView1.Nombre.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Código Carrera
			CustomView1.CF3digo_Carrera.ViewValue = CustomView1.CF3digo_Carrera.CurrentValue
			Call ewrpt_SetAttr(CustomView1.CF3digo_Carrera.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Jornada
			CustomView1.Jornada.ViewValue = CustomView1.Jornada.CurrentValue
			Call ewrpt_SetAttr(CustomView1.Jornada.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Año
			CustomView1.AF1o.ViewValue = CustomView1.AF1o.CurrentValue
			Call ewrpt_SetAttr(CustomView1.AF1o.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Periodo
			CustomView1.Periodo.ViewValue = CustomView1.Periodo.CurrentValue
			Call ewrpt_SetAttr(CustomView1.Periodo.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Emisión
			CustomView1.EmisiF3n.ViewValue = CustomView1.EmisiF3n.CurrentValue
			CustomView1.EmisiF3n.ViewValue = ewrpt_FormatDateTime(CustomView1.EmisiF3n.ViewValue, 7)
			Call ewrpt_SetAttr(CustomView1.EmisiF3n.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Tipo Solicitud
			CustomView1.Tipo_Solicitud.ViewValue = CustomView1.Tipo_Solicitud.CurrentValue
			Call ewrpt_SetAttr(CustomView1.Tipo_Solicitud.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Descripción
			CustomView1.DescripciF3n.ViewValue = CustomView1.DescripciF3n.CurrentValue
			Call ewrpt_SetAttr(CustomView1.DescripciF3n.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Observación
			CustomView1.ObservaciF3n.ViewValue = CustomView1.ObservaciF3n.CurrentValue
			Call ewrpt_SetAttr(CustomView1.ObservaciF3n.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))
		End If

		' Código Cliente
		CustomView1.CF3digo_Cliente.HrefValue = ""

		' Paterno
		CustomView1.Paterno.HrefValue = ""

		' Materno
		CustomView1.Materno.HrefValue = ""

		' Nombre
		CustomView1.Nombre.HrefValue = ""

		' Código Carrera
		CustomView1.CF3digo_Carrera.HrefValue = ""

		' Jornada
		CustomView1.Jornada.HrefValue = ""

		' Año
		CustomView1.AF1o.HrefValue = ""

		' Periodo
		CustomView1.Periodo.HrefValue = ""

		' Emisión
		CustomView1.EmisiF3n.HrefValue = ""

		' Tipo Solicitud
		CustomView1.Tipo_Solicitud.HrefValue = ""

		' Descripción
		CustomView1.DescripciF3n.HrefValue = ""

		' Observación
		CustomView1.ObservaciF3n.HrefValue = ""

		' Call Row_Rendered event
		Call CustomView1.Row_Rendered()
	End Sub

	' Get extended filter values
	Sub GetExtendedFilterValues()
		Dim sSelectFld, sSelect, sWhere, sOrderBy
		Dim wrkSql, wrkRs

		' Field Jornada
		sSelect = "SELECT DISTINCT al.JORNADA FROM " & CustomView1.SqlFrom
		sWhere = CustomView1.SqlWhere
		sOrderBy = "al.JORNADA ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		CustomView1.Jornada.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Año
		sSelect = "SELECT DISTINCT s.ANO FROM " & CustomView1.SqlFrom
		sWhere = CustomView1.SqlWhere
		sOrderBy = "s.ANO ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		CustomView1.AF1o.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Periodo
		sSelect = "SELECT DISTINCT s.PERIODO FROM " & CustomView1.SqlFrom
		sWhere = CustomView1.SqlWhere
		sOrderBy = "s.PERIODO ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		CustomView1.Periodo.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Tipo Solicitud
		sSelect = "SELECT DISTINCT s.TIPOSITU FROM " & CustomView1.SqlFrom
		sWhere = CustomView1.SqlWhere
		sOrderBy = "s.TIPOSITU ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		CustomView1.Tipo_Solicitud.DropDownList = ewrpt_GetDistinctValues("", wrkSql)
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
			' Field Código Cliente

			Call SetSessionFilterValues(CustomView1.CF3digo_Cliente.SearchValue, CustomView1.CF3digo_Cliente.SearchOperator, CustomView1.CF3digo_Cliente.SearchCondition, CustomView1.CF3digo_Cliente.SearchValue2, CustomView1.CF3digo_Cliente.SearchOperator2, "CF3digo_Cliente")

			' Field Paterno
			Call SetSessionFilterValues(CustomView1.Paterno.SearchValue, CustomView1.Paterno.SearchOperator, CustomView1.Paterno.SearchCondition, CustomView1.Paterno.SearchValue2, CustomView1.Paterno.SearchOperator2, "Paterno")

			' Field Materno
			Call SetSessionFilterValues(CustomView1.Materno.SearchValue, CustomView1.Materno.SearchOperator, CustomView1.Materno.SearchCondition, CustomView1.Materno.SearchValue2, CustomView1.Materno.SearchOperator2, "Materno")

			' Field Nombre
			Call SetSessionFilterValues(CustomView1.Nombre.SearchValue, CustomView1.Nombre.SearchOperator, CustomView1.Nombre.SearchCondition, CustomView1.Nombre.SearchValue2, CustomView1.Nombre.SearchOperator2, "Nombre")

			' Field Código Carrera
			Call SetSessionFilterValues(CustomView1.CF3digo_Carrera.SearchValue, CustomView1.CF3digo_Carrera.SearchOperator, CustomView1.CF3digo_Carrera.SearchCondition, CustomView1.CF3digo_Carrera.SearchValue2, CustomView1.CF3digo_Carrera.SearchOperator2, "CF3digo_Carrera")

			' Field Jornada
			Call SetSessionDropDownValue(CustomView1.Jornada.DropDownValue, "Jornada")

			' Field Año
			Call SetSessionDropDownValue(CustomView1.AF1o.DropDownValue, "AF1o")

			' Field Periodo
			Call SetSessionDropDownValue(CustomView1.Periodo.DropDownValue, "Periodo")

			' Field Emisión
			Call SetSessionFilterValues(CustomView1.EmisiF3n.SearchValue, CustomView1.EmisiF3n.SearchOperator, CustomView1.EmisiF3n.SearchCondition, CustomView1.EmisiF3n.SearchValue2, CustomView1.EmisiF3n.SearchOperator2, "EmisiF3n")

			' Field Tipo Solicitud
			Call SetSessionDropDownValue(CustomView1.Tipo_Solicitud.DropDownValue, "Tipo_Solicitud")
			bSetupFilter = True ' Set up filter required
		Else

			' Field Código Cliente
			If GetFilterValues(CustomView1.CF3digo_Cliente) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Paterno
			If GetFilterValues(CustomView1.Paterno) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Materno
			If GetFilterValues(CustomView1.Materno) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Nombre
			If GetFilterValues(CustomView1.Nombre) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Código Carrera
			If GetFilterValues(CustomView1.CF3digo_Carrera) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Jornada
			If GetDropDownValue(CustomView1.Jornada) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(CustomView1.Jornada.DropDownValue) Then
				If CustomView1.Jornada.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_CustomView1_Jornada")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Año
			If GetDropDownValue(CustomView1.AF1o) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(CustomView1.AF1o.DropDownValue) Then
				If CustomView1.AF1o.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_CustomView1_AF1o")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Periodo
			If GetDropDownValue(CustomView1.Periodo) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(CustomView1.Periodo.DropDownValue) Then
				If CustomView1.Periodo.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_CustomView1_Periodo")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Emisión
			If GetFilterValues(CustomView1.EmisiF3n) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Tipo Solicitud
			If GetDropDownValue(CustomView1.Tipo_Solicitud) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(CustomView1.Tipo_Solicitud.DropDownValue) Then
				If CustomView1.Tipo_Solicitud.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_CustomView1_Tipo_Solicitud")) Then
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

			' Field Código Cliente
			Call GetSessionFilterValues(CustomView1.CF3digo_Cliente)

			' Field Paterno
			Call GetSessionFilterValues(CustomView1.Paterno)

			' Field Materno
			Call GetSessionFilterValues(CustomView1.Materno)

			' Field Nombre
			Call GetSessionFilterValues(CustomView1.Nombre)

			' Field Código Carrera
			Call GetSessionFilterValues(CustomView1.CF3digo_Carrera)

			' Field Jornada
			Call GetSessionDropDownValue(CustomView1.Jornada)

			' Field Año
			Call GetSessionDropDownValue(CustomView1.AF1o)

			' Field Periodo
			Call GetSessionDropDownValue(CustomView1.Periodo)

			' Field Emisión
			Call GetSessionFilterValues(CustomView1.EmisiF3n)

			' Field Tipo Solicitud
			Call GetSessionDropDownValue(CustomView1.Tipo_Solicitud)
		End If

		' Call page filter validated event
		Call CustomView1.Page_FilterValidated()

		' Build sql
		' Field Código Cliente

		Call BuildExtendedFilter(CustomView1.CF3digo_Cliente, sFilter)

		' Field Paterno
		Call BuildExtendedFilter(CustomView1.Paterno, sFilter)

		' Field Materno
		Call BuildExtendedFilter(CustomView1.Materno, sFilter)

		' Field Nombre
		Call BuildExtendedFilter(CustomView1.Nombre, sFilter)

		' Field Código Carrera
		Call BuildExtendedFilter(CustomView1.CF3digo_Carrera, sFilter)

		' Field Jornada
		Call BuildDropDownFilter(CustomView1.Jornada, sFilter, "")

		' Field Año
		Call BuildDropDownFilter(CustomView1.AF1o, sFilter, "")

		' Field Periodo
		Call BuildDropDownFilter(CustomView1.Periodo, sFilter, "")

		' Field Emisión
		Call BuildExtendedFilter(CustomView1.EmisiF3n, sFilter)

		' Field Tipo Solicitud
		Call BuildDropDownFilter(CustomView1.Tipo_Solicitud, sFilter, "")

		' Save parms to Session
		' Field Código Cliente

		Call SetSessionFilterValues(CustomView1.CF3digo_Cliente.SearchValue, CustomView1.CF3digo_Cliente.SearchOperator, CustomView1.CF3digo_Cliente.SearchCondition, CustomView1.CF3digo_Cliente.SearchValue2, CustomView1.CF3digo_Cliente.SearchOperator2, "CF3digo_Cliente")

		' Field Paterno
		Call SetSessionFilterValues(CustomView1.Paterno.SearchValue, CustomView1.Paterno.SearchOperator, CustomView1.Paterno.SearchCondition, CustomView1.Paterno.SearchValue2, CustomView1.Paterno.SearchOperator2, "Paterno")

		' Field Materno
		Call SetSessionFilterValues(CustomView1.Materno.SearchValue, CustomView1.Materno.SearchOperator, CustomView1.Materno.SearchCondition, CustomView1.Materno.SearchValue2, CustomView1.Materno.SearchOperator2, "Materno")

		' Field Nombre
		Call SetSessionFilterValues(CustomView1.Nombre.SearchValue, CustomView1.Nombre.SearchOperator, CustomView1.Nombre.SearchCondition, CustomView1.Nombre.SearchValue2, CustomView1.Nombre.SearchOperator2, "Nombre")

		' Field Código Carrera
		Call SetSessionFilterValues(CustomView1.CF3digo_Carrera.SearchValue, CustomView1.CF3digo_Carrera.SearchOperator, CustomView1.CF3digo_Carrera.SearchCondition, CustomView1.CF3digo_Carrera.SearchValue2, CustomView1.CF3digo_Carrera.SearchOperator2, "CF3digo_Carrera")

		' Field Jornada
		Call SetSessionDropDownValue(CustomView1.Jornada.DropDownValue, "Jornada")

		' Field Año
		Call SetSessionDropDownValue(CustomView1.AF1o.DropDownValue, "AF1o")

		' Field Periodo
		Call SetSessionDropDownValue(CustomView1.Periodo.DropDownValue, "Periodo")

		' Field Emisión
		Call SetSessionFilterValues(CustomView1.EmisiF3n.SearchValue, CustomView1.EmisiF3n.SearchOperator, CustomView1.EmisiF3n.SearchCondition, CustomView1.EmisiF3n.SearchValue2, CustomView1.EmisiF3n.SearchOperator2, "EmisiF3n")

		' Field Tipo Solicitud
		Call SetSessionDropDownValue(CustomView1.Tipo_Solicitud.DropDownValue, "Tipo_Solicitud")

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

	' Load selection from a filter clause
	Sub LoadSelectionFromFilter(fld, filter, sel)
		Dim sSql
		sel = ""
		If filter <> "" Then
			sSql = ewrpt_BuildReportSql(fld.SqlSelect, "", "", "", fld.SqlOrderBy, filter, "")
			Call ewrpt_LoadArrayFromSql(sSql, sel)
		End If
	End Sub

	' Get dropdown value from Session
	Sub GetSessionDropDownValue(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv_CustomView1_" & parm)) Then fld.DropDownValue = Session("sv_CustomView1_" & parm)
	End Sub

	' Get filter values from Session
	Sub GetSessionFilterValues(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv1_CustomView1_" & parm)) Then fld.SearchValue = Session("sv1_CustomView1_" & parm)
		If Not IsEmpty(Session("so1_CustomView1_" & parm)) Then fld.SearchOperator = Session("so1_CustomView1_" & parm)
		If Not IsEmpty(Session("sc_CustomView1_" & parm)) Then fld.SearchCondition = Session("sc_CustomView1_" & parm)
		If Not IsEmpty(Session("sv2_CustomView1_" & parm)) Then fld.SearchValue2 = Session("sv2_CustomView1_" & parm)
		If Not IsEmpty(Session("so2_CustomView1_" & parm)) Then fld.SearchOperator2 = Session("so2_CustomView1_" & parm)
	End Sub

	' Set dropdown value to Session
	Sub SetSessionDropDownValue(sv, parm)
		Session("sv_CustomView1_" & parm) = sv
	End Sub

	' Set filter values to Session
	Sub SetSessionFilterValues(sv1, so1, sc, sv2, so2, parm)
		Session("sv1_CustomView1_" & parm) = sv1
		Session("so1_CustomView1_" & parm) = so1
		Session("sc_CustomView1_" & parm) = sc
		Session("sv2_CustomView1_" & parm) = sv2
		Session("so2_CustomView1_" & parm) = so2
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
		Call BuildDropDownFilter(fld, sWrk, FldOpr)
		DropDownFilterExist = (sWrk <> "")
	End Function

	' Build dropdown filter
	Function BuildDropDownFilter(fld, FilterClause, FldOpr)
		Dim sSql, i, sWrk, FldVal
		sSql = ""
		FldVal = fld.DropDownValue
		If IsArray(FldVal) Then
			For i = 0 to UBound(FldVal)
				sWrk = GetDropDownfilter(fld, FldVal(i), FldOpr)
				If sWrk <> "" Then
					If sSql <> "" Then
						sSql = sSql & " OR " & sWrk
					Else
						sSql = sWrk
					End If
				End If
			Next
		Else
			sSql = GetDropDownfilter(fld, FldVal, FldOpr)
		End If
		If sSql <> "" Then
			If FilterClause <> "" Then FilterClause = "(" & FilterClause & ") AND "
			FilterClause = FilterClause & "(" & sSql & ")"
		End If
	End Function

	Function GetDropDownfilter(fld, FldVal, FldOpr)
		Dim sWrk, FldName, FldExpression, FldDataType
		sWrk = ""
		FldName = fld.FldName
		FldExpression = fld.FldExpression
		FldDataType = fld.FldDataType
		If FldVal = EWRPT_NULL_VALUE Then
			sWrk = FldExpression & " IS NULL"
		ElseIf FldVal = EWRPT_EMPTY_VALUE Then
			sWrk = FldExpression & " = ''"
		Else
			If Left(FldVal, 2) = "@@" Then
				sWrk = ewrpt_GetCustomFilter(fld, FldVal)
			Else
				If FldVal <> "" And FldVal <> EWRPT_INIT_VALUE And FldVal <> EWRPT_ALL_VALUE Then
					If FldDataType = EWRPT_DATATYPE_DATE And FldOpr <> "" Then
						sWrk = DateFilterString(FldOpr, FldVal, FldDataType)
					Else
						sWrk = FilterString("=", FldVal, FldDataType)
					End If
				End If
				If sWrk <> "" Then sWrk = FldExpression & sWrk
			End If
		End If
		GetDropDownFilter = sWrk
	End Function

	' Check if extended filter
	Function ExtendedFilterExist(fld)
		Dim sExtWrk
		sExtWrk = ""
		Call BuildExtendedFilter(fld, sExtWrk)
		ExtendedFilterExist = (sExtWrk <> "")
	End Function

	' Build extended filter
	Sub BuildExtendedFilter(fld, FilterClause)
		Dim FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal1, FldOpr1, FldCond, FldVal2, FldOpr2
		Dim IsValidValue, sWrk
		Dim wrkFldVal1, wrkFldVal2
		FldName = fld.FldName
		FldExpression = fld.FldExpression
		FldDataType = fld.FldDataType
		FldDateTimeFormat = fld.FldDateTimeFormat
		FldVal1 = fld.SearchValue
		FldOpr1 = fld.SearchOperator
		FldCond = fld.SearchCondition
		FldVal2 = fld.SearchValue2
		FldOpr2 = fld.SearchOperator2
		sWrk = ""
		FldOpr1 = UCase(Trim(FldOpr1))
		If (FldOpr1 = "") Then FldOpr1 = "="
		FldOpr2 = UCase(Trim(FldOpr2))
		If FldOpr2 = "" Then FldOpr2 = "="
		wrkFldVal1 = FldVal1
		wrkFldVal2 = FldVal2
		If FldDataType = EWRPT_DATATYPE_BOOLEAN Then
			If EWRPT_IS_MSACCESS Then
				If wrkFldVal1 <> "" Then wrkFldVal1 = ewrpt_IIf(wrkFldVal1="1", "True", "False")
				If wrkFldVal2 <> "" Then wrkFldVal2 = ewrpt_IIf(wrkFldVal2="1", "True", "False")
			Else
				If wrkFldVal1 <> "" Then wrkFldVal1 = ewrpt_IIf(wrkFldVal1="1", "1", "0")
				If wrkFldVal2 <> "" Then wrkFldVal2 = ewrpt_IIf(wrkFldVal2="1", "1", "0")
			End If
		ElseIf FldDataType = EWRPT_DATATYPE_DATE Then
			If wrkFldVal1 <> "" Then wrkFldVal1 = ewrpt_UnFormatDateTime(wrkFldVal1, FldDateTimeFormat)
			If wrkFldVal2 <> "" Then wrkFldVal2 = ewrpt_UnFormatDateTime(wrkFldVal2, FldDateTimeFormat)
		End If
		If FldOpr1 = "BETWEEN" Then
			IsValidValue = (FldDataType <> EWRPT_DATATYPE_NUMBER) Or _
				(FldDataType = EWRPT_DATATYPE_NUMBER And IsNumeric(wrkFldVal1) And IsNumeric(wrkFldVal2))
			If wrkFldVal1 <> "" And wrkFldVal2 <> "" And IsValidValue Then
				sWrk = FldExpression & " BETWEEN " & ewrpt_QuotedValue(wrkFldVal1, FldDataType) & _
					" AND " & ewrpt_QuotedValue(wrkFldVal2, FldDataType)
			End If
		ElseIf FldOpr1 = "IS NULL" Or FldOpr1 = "IS NOT NULL" Then
			sWrk = FldExpression & " " & wrkFldVal1
		Else
			IsValidValue = (FldDataType <> EWRPT_DATATYPE_NUMBER) Or _
				(FldDataType = EWRPT_DATATYPE_NUMBER And IsNumeric(wrkFldVal1))
			If wrkFldVal1 <> "" And IsValidValue And ewrpt_IsValidOpr(FldOpr1, FldDataType) Then
				sWrk = FldExpression & FilterString(FldOpr1, wrkFldVal1, FldDataType)
			End If
			IsValidValue = (FldDataType <> EWRPT_DATATYPE_NUMBER) Or _
				(FldDataType = EWRPT_DATATYPE_NUMBER And IsNumeric(wrkFldVal2))
			If wrkFldVal2 <> "" And IsValidValue And ewrpt_IsValidOpr(FldOpr2, FldDataType) Then
				If sWrk <> "" Then
					sWrk = sWrk & " " & ewrpt_IIf(FldCond="OR", "OR", "AND") & " "
				End If
				sWrk = sWrk & FldExpression & FilterString(FldOpr2, wrkFldVal2, FldDataType)
			End If
		End If
		If sWrk <> "" Then
			If FilterClause <> "" Then FilterClause = FilterClause & " AND "
			FilterClause = FilterClause & "(" & sWrk & ")"
		End If
	End Sub

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
		If Not ewrpt_CheckEuroDate(CustomView1.EmisiF3n.SearchValue) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & CustomView1.EmisiF3n.FldErrMsg
		End If
		If Not ewrpt_CheckEuroDate(CustomView1.EmisiF3n.SearchValue2) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & CustomView1.EmisiF3n.FldErrMsg
		End If

		' Return validate result
		ValidateForm = (gsFormError = "")

		' Call Form_CustomValidate event
		Dim sFormCustomError
		sFormCustomError = ""
		ValidateForm = ValidateForm And Form_CustomValidate(sFormCustomError)
		If sFormCustomError <> "" Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & sFormCustomError
		End If
	End Function

	' Return filter string
	Function FilterString(FldOpr, FldVal, FldType)
		If FldOpr = "LIKE" Or FldOpr = "NOT LIKE" Then
			FilterString = " " & FldOpr & " " & ewrpt_QuotedValue("%" & FldVal & "%", FldType)
		ElseIf FldOpr = "STARTS WITH" Then
			FilterString = " LIKE " & ewrpt_QuotedValue(FldVal & "%", FldType)
		Else
			FilterString = " " & FldOpr & " " & ewrpt_QuotedValue(FldVal, FldType)
		End If
	End Function

	' Return date search string
	Function DateFilterString(FldOpr, FldVal, FldType)
		Dim wrkVal1, wrkVal2
		wrkVal1 = ewrpt_DateVal(FldOpr, FldVal, 1)
		wrkVal2 = ewrpt_DateVal(FldOpr, FldVal, 2)
		If wrkVal1 <> "" And wrkVal2 <> "" Then
			DateFilterString = " BETWEEN " & ewrpt_QuotedValue(wrkVal1, FldType) & " AND " & ewrpt_QuotedValue(wrkVal2, FldType)
		Else
			DateFilterString = ""
		End If
	End Function

	' Clear selection stored in session
	Sub ClearSessionSelection(parm)
		Session("sel_CustomView1_" & parm) = ""
		Session("rf_CustomView1_" & parm) = ""
		Session("rt_CustomView1_" & parm) = ""
	End Sub

	' Load selection from session
	Sub LoadSelectionFromSession(parm)
		Dim fld
		Set fld = CustomView1.GetField(parm)
		fld.SelectionList = Session("sel_CustomView1_" & parm)
		fld.RangeFrom = Session("rf_CustomView1_" & parm)
		fld.RangeTo = Session("rt_CustomView1_" & parm)
	End Sub

	' Load default value for filters
	Sub LoadDefaultFilters()
		Dim sWrk, sSql, arwrk

		' --------------------------------------------------
		'  Set up default values for dropdown filters
		'
		' Field Jornada

		CustomView1.Jornada.DefaultDropDownValue = EWRPT_INIT_VALUE
		CustomView1.Jornada.DropDownValue = CustomView1.Jornada.DefaultDropDownValue

		' Field Año
		CustomView1.AF1o.DefaultDropDownValue = EWRPT_INIT_VALUE
		CustomView1.AF1o.DropDownValue = CustomView1.AF1o.DefaultDropDownValue

		' Field Periodo
		CustomView1.Periodo.DefaultDropDownValue = EWRPT_INIT_VALUE
		CustomView1.Periodo.DropDownValue = CustomView1.Periodo.DefaultDropDownValue

		' Field Tipo Solicitud
		CustomView1.Tipo_Solicitud.DefaultDropDownValue = EWRPT_INIT_VALUE
		CustomView1.Tipo_Solicitud.DropDownValue = CustomView1.Tipo_Solicitud.DefaultDropDownValue

		' --------------------------------------------------
		'  Set up default values for extended filters
		'
		' Field Código Cliente

		Call SetDefaultExtFilter(CustomView1.CF3digo_Cliente, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(CustomView1.CF3digo_Cliente)

		' Field Paterno
		Call SetDefaultExtFilter(CustomView1.Paterno, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(CustomView1.Paterno)

		' Field Materno
		Call SetDefaultExtFilter(CustomView1.Materno, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(CustomView1.Materno)

		' Field Nombre
		Call SetDefaultExtFilter(CustomView1.Nombre, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(CustomView1.Nombre)

		' Field Código Carrera
		Call SetDefaultExtFilter(CustomView1.CF3digo_Carrera, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(CustomView1.CF3digo_Carrera)

		' Field Emisión
		Call SetDefaultExtFilter(CustomView1.EmisiF3n, "BETWEEN", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(CustomView1.EmisiF3n)

		' --------------------------------------------------
		'  Set up default values for popup filters
		'  - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Function CheckFilter()

		' Check Código Cliente Text filter
		If TextFilterApplied(CustomView1.CF3digo_Cliente) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Paterno Text filter
		If TextFilterApplied(CustomView1.Paterno) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Materno Text filter
		If TextFilterApplied(CustomView1.Materno) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Nombre Text filter
		If TextFilterApplied(CustomView1.Nombre) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Código Carrera Text filter
		If TextFilterApplied(CustomView1.CF3digo_Carrera) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Jornada non-Text filter
		If NonTextFilterApplied(CustomView1.Jornada) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Año non-Text filter
		If NonTextFilterApplied(CustomView1.AF1o) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Periodo non-Text filter
		If NonTextFilterApplied(CustomView1.Periodo) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Emisión Text filter
		If TextFilterApplied(CustomView1.EmisiF3n) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Tipo Solicitud non-Text filter
		If NonTextFilterApplied(CustomView1.Tipo_Solicitud) Then
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

		' Field Código Cliente
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(CustomView1.CF3digo_Cliente, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.CF3digo_Cliente.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Paterno
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(CustomView1.Paterno, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.Paterno.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Materno
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(CustomView1.Materno, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.Materno.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Nombre
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(CustomView1.Nombre, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.Nombre.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Código Carrera
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(CustomView1.CF3digo_Carrera, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.CF3digo_Carrera.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Jornada
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(CustomView1.Jornada, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.Jornada.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Año
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(CustomView1.AF1o, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.AF1o.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Periodo
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(CustomView1.Periodo, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.Periodo.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Emisión
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(CustomView1.EmisiF3n, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.EmisiF3n.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Tipo Solicitud
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(CustomView1.Tipo_Solicitud, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.Tipo_Solicitud.FldCaption & "<br>"
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
				CustomView1.OrderBy = ""
				CustomView1.StartGroup = 1
				CustomView1.CF3digo_Cliente.Sort = ""
				CustomView1.Paterno.Sort = ""
				CustomView1.Materno.Sort = ""
				CustomView1.Nombre.Sort = ""
				CustomView1.CF3digo_Carrera.Sort = ""
				CustomView1.Jornada.Sort = ""
				CustomView1.AF1o.Sort = ""
				CustomView1.Periodo.Sort = ""
				CustomView1.EmisiF3n.Sort = ""
				CustomView1.Tipo_Solicitud.Sort = ""
				CustomView1.DescripciF3n.Sort = ""
				CustomView1.ObservaciF3n.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			CustomView1.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				CustomView1.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				CustomView1.CurrentOrderType = ""
			End If
			sSortSql = CustomView1.SortSql
			CustomView1.OrderBy = sSortSql
			CustomView1.StartGroup = 1
		End If
		GetSort = CustomView1.OrderBy
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
