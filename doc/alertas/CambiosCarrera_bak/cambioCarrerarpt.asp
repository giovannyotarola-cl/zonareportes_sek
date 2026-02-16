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
Dim cambioCarrera

' Define table class
Class crcambioCarrera
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "cambioCarrera"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "cambioCarrera"
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

	' Codigo Cliente
	Private m_Codigo_Cliente

	Public Property Get Codigo_Cliente()
		Dim ar
		If Not IsObject(m_Codigo_Cliente) Then
			Set m_Codigo_Cliente = NewFldObj("cambioCarrera", "cambioCarrera", "x_Codigo_Cliente", "Codigo Cliente", "cl.CODCLI", 200, EWRPT_DATATYPE_STRING, -1)
			m_Codigo_Cliente.DateFilter = ""
			m_Codigo_Cliente.SqlSelect = ""
			m_Codigo_Cliente.SqlOrderBy = ""
		End If
		Set Codigo_Cliente = m_Codigo_Cliente
	End Property

	' Nombre
	Private m_Nombre

	Public Property Get Nombre()
		Dim ar
		If Not IsObject(m_Nombre) Then
			Set m_Nombre = NewFldObj("cambioCarrera", "cambioCarrera", "x_Nombre", "Nombre", "cl.NOMBRE", 200, EWRPT_DATATYPE_STRING, -1)
			m_Nombre.DateFilter = ""
			m_Nombre.SqlSelect = ""
			m_Nombre.SqlOrderBy = ""
		End If
		Set Nombre = m_Nombre
	End Property

	' Paterno
	Private m_Paterno

	Public Property Get Paterno()
		Dim ar
		If Not IsObject(m_Paterno) Then
			Set m_Paterno = NewFldObj("cambioCarrera", "cambioCarrera", "x_Paterno", "Paterno", "cl.PATERNO", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_Materno = NewFldObj("cambioCarrera", "cambioCarrera", "x_Materno", "Materno", "cl.MATERNO", 200, EWRPT_DATATYPE_STRING, -1)
			m_Materno.DateFilter = ""
			m_Materno.SqlSelect = ""
			m_Materno.SqlOrderBy = ""
		End If
		Set Materno = m_Materno
	End Property

	' Código Carrera
	Private m_CF3digo_Carrera

	Public Property Get CF3digo_Carrera()
		Dim ar
		If Not IsObject(m_CF3digo_Carrera) Then
			Set m_CF3digo_Carrera = NewFldObj("cambioCarrera", "cambioCarrera", "x_CF3digo_Carrera", "Código Carrera", "al.CODCARPR", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_Jornada = NewFldObj("cambioCarrera", "cambioCarrera", "x_Jornada", "Jornada", "al.JORNADA", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_AF1o = NewFldObj("cambioCarrera", "cambioCarrera", "x_AF1o", "Año", "s.ANO", 131, EWRPT_DATATYPE_NUMBER, -1)
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
			Set m_Periodo = NewFldObj("cambioCarrera", "cambioCarrera", "x_Periodo", "Periodo", "s.PERIODO", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_Periodo.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_Periodo.DateFilter = ""
			m_Periodo.SqlSelect = ""
			m_Periodo.SqlOrderBy = ""
		End If
		Set Periodo = m_Periodo
	End Property

	' Cod Tipo Situación
	Private m_Cod_Tipo_SituaciF3n

	Public Property Get Cod_Tipo_SituaciF3n()
		Dim ar
		If Not IsObject(m_Cod_Tipo_SituaciF3n) Then
			Set m_Cod_Tipo_SituaciF3n = NewFldObj("cambioCarrera", "cambioCarrera", "x_Cod_Tipo_SituaciF3n", "Cod Tipo Situación", "t.CODIGO", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_Cod_Tipo_SituaciF3n.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_Cod_Tipo_SituaciF3n.DateFilter = ""
			m_Cod_Tipo_SituaciF3n.SqlSelect = ""
			m_Cod_Tipo_SituaciF3n.SqlOrderBy = ""
		End If
		Set Cod_Tipo_SituaciF3n = m_Cod_Tipo_SituaciF3n
	End Property

	' Descripción
	Private m_DescripciF3n

	Public Property Get DescripciF3n()
		Dim ar
		If Not IsObject(m_DescripciF3n) Then
			Set m_DescripciF3n = NewFldObj("cambioCarrera", "cambioCarrera", "x_DescripciF3n", "Descripción", "t.DESCRIPCION", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_ObservaciF3n = NewFldObj("cambioCarrera", "cambioCarrera", "x_ObservaciF3n", "Observación", "s.OBSERVACION", 200, EWRPT_DATATYPE_STRING, -1)
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
		Call ewrpt_SetArObj(Fields, "Codigo_Cliente", Codigo_Cliente)
		Call ewrpt_SetArObj(Fields, "Nombre", Nombre)
		Call ewrpt_SetArObj(Fields, "Paterno", Paterno)
		Call ewrpt_SetArObj(Fields, "Materno", Materno)
		Call ewrpt_SetArObj(Fields, "CF3digo_Carrera", CF3digo_Carrera)
		Call ewrpt_SetArObj(Fields, "Jornada", Jornada)
		Call ewrpt_SetArObj(Fields, "AF1o", AF1o)
		Call ewrpt_SetArObj(Fields, "Periodo", Periodo)
		Call ewrpt_SetArObj(Fields, "Cod_Tipo_SituaciF3n", Cod_Tipo_SituaciF3n)
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
		SqlSelect = "SELECT cl.CODCLI As [Codigo Cliente], cl.PATERNO As Paterno, cl.MATERNO As Materno, cl.NOMBRE As Nombre, al.CODCARPR As [Código Carrera], al.JORNADA As Jornada, s.PERIODO As Periodo, s.ANO As Año, t.CODIGO As [Cod Tipo Situación], t.DESCRIPCION As Descripción, s.OBSERVACION As Observación FROM " & SqlFrom
	End Property

	Public Property Get SqlWhere() ' Where
		SqlWhere = "cl.CODCLI = al.RUT And s.TIPOSITU = t.CODIGO And s.CODCLI = al.CODCLI And s.TIPOSITU = t.CODIGO And (s.PERIODO = 1 And s.ANO = 2011 And t.CAMBIOCARRERA = 'S')"
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
Dim cambioCarrera_rpt
Set cambioCarrera_rpt = New crcambioCarrera_rpt
Set Page = cambioCarrera_rpt

' Page init processing
Call cambioCarrera_rpt.Page_Init()

' Page main processing
Call cambioCarrera_rpt.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<% If cambioCarrera.Export = "" Then %>
<script type="text/javascript">
<!--
// Create page object
var cambioCarrera_rpt = new ewrpt_Page("cambioCarrera_rpt");
// page properties
cambioCarrera_rpt.PageID = "rpt"; // page ID
cambioCarrera_rpt.FormID = "fcambioCarrerarptfilter"; // form ID
var EWRPT_PAGE_ID = cambioCarrera_rpt.PageID;
// extend page with ValidateForm function
cambioCarrera_rpt.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
cambioCarrera_rpt.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If EWRPT_CLIENT_VALIDATE Then %>
cambioCarrera_rpt.ValidateRequired = true; // uses JavaScript validation
<% Else %>
cambioCarrera_rpt.ValidateRequired = false; // no JavaScript validation
<% End If %>
//-->
</script>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
//-->
</script>
<% End If %>
<% cambioCarrera_rpt.ShowPageHeader() %>
<% If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg() %>
<% cambioCarrera_rpt.ShowMessage() %>
<link rel="stylesheet" type="text/css" media="all" href="css/titles.css"/>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If cambioCarrera.Export = "" Then %>
<script src="rptjs/popup.js" type="text/javascript"></script>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
</script>
<% End If %>
<% If cambioCarrera.Export = "" Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline">
<h1><%= cambioCarrera.TableCaption %></h1>
</div>
<% If cambioCarrera.Export = "" Then %>
&nbsp;&nbsp;<a href="<%= cambioCarrera_rpt.ExportExcelUrl %>&acc=<%=Request("acc")%>"><img src="images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
<% End If %>
<br><br>
<% If cambioCarrera.Export = "" Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspreportmaker">
	<!-- Left slot -->
<% End If %>
<% If cambioCarrera.Export = "" Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If cambioCarrera.Export = "" Then %>
<%
If (cambioCarrera.FilterPanelOption = 2) Or (cambioCarrera.FilterPanelOption = 3 And cambioCarrera_rpt.FilterApplied) Or (cambioCarrera_rpt.Filter = "0=101") Then
	sButtonImage = "rptimages/collapse.gif"
	sDivDisplay = ""
Else
	sButtonImage = "rptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span>
<% If cambioCarrera_rpt.FilterApplied Then %>
&nbsp;&nbsp;<a href="cambioCarrerarpt.asp?cmd=reset&acc=<%=Request("acc")%>"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fcambioCarrerarptfilter" id="fcambioCarrerarptfilter" action="cambioCarrerarpt.asp?acc=<%=Request("acc")%>" class="ewForm" onsubmit="return cambioCarrera_rpt.ValidateForm(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr>
		<td><span class="aspreportmaker"><%= cambioCarrera.Codigo_Cliente.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Codigo_Cliente" id="so1_Codigo_Cliente" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Codigo_Cliente" id="sv1_Codigo_Cliente" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(cambioCarrera.Codigo_Cliente.SearchValue) %>"<% If cambioCarrera_rpt.ClearExtFilter = "cambioCarrera_Codigo_Cliente" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= cambioCarrera.Nombre.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Nombre" id="so1_Nombre" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Nombre" id="sv1_Nombre" size="30" maxlength="32" value="<%= ewrpt_HtmlEncode(cambioCarrera.Nombre.SearchValue) %>"<% If cambioCarrera_rpt.ClearExtFilter = "cambioCarrera_Nombre" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= cambioCarrera.Paterno.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Paterno" id="so1_Paterno" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Paterno" id="sv1_Paterno" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(cambioCarrera.Paterno.SearchValue) %>"<% If cambioCarrera_rpt.ClearExtFilter = "cambioCarrera_Paterno" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= cambioCarrera.Materno.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Materno" id="so1_Materno" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Materno" id="sv1_Materno" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(cambioCarrera.Materno.SearchValue) %>"<% If cambioCarrera_rpt.ClearExtFilter = "cambioCarrera_Materno" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= cambioCarrera.CF3digo_Carrera.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_CF3digo_Carrera" id="so1_CF3digo_Carrera" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_CF3digo_Carrera" id="sv1_CF3digo_Carrera" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(cambioCarrera.CF3digo_Carrera.SearchValue) %>"<% If cambioCarrera_rpt.ClearExtFilter = "cambioCarrera_CF3digo_Carrera" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= cambioCarrera.Jornada.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Jornada" id="sv_Jornada"<%= ewrpt_IIf(cambioCarrera_rpt.ClearExtFilter = "cambioCarrera_Jornada", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(cambioCarrera.Jornada.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(cambioCarrera.Jornada.CustomFilters) Then
	cntf = UBound(cambioCarrera.Jornada.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(cambioCarrera.Jornada.DropDownList) Then
	cntd = UBound(cambioCarrera.Jornada.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If cambioCarrera.Jornada.CustomFilters(i).FldName = "Jornada" Then
%>
		<option value="<%= "@@" & cambioCarrera.Jornada.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(cambioCarrera.Jornada.DropDownValue, "@@" & cambioCarrera.Jornada.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= cambioCarrera.Jornada.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= cambioCarrera.Jornada.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(cambioCarrera.Jornada.DropDownValue, cambioCarrera.Jornada.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(cambioCarrera.Jornada.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= cambioCarrera.AF1o.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AF1o" id="sv_AF1o"<%= ewrpt_IIf(cambioCarrera_rpt.ClearExtFilter = "cambioCarrera_AF1o", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(cambioCarrera.AF1o.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(cambioCarrera.AF1o.CustomFilters) Then
	cntf = UBound(cambioCarrera.AF1o.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(cambioCarrera.AF1o.DropDownList) Then
	cntd = UBound(cambioCarrera.AF1o.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If cambioCarrera.AF1o.CustomFilters(i).FldName = "Año" Then
%>
		<option value="<%= "@@" & cambioCarrera.AF1o.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(cambioCarrera.AF1o.DropDownValue, "@@" & cambioCarrera.AF1o.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= cambioCarrera.AF1o.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= cambioCarrera.AF1o.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(cambioCarrera.AF1o.DropDownValue, cambioCarrera.AF1o.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(cambioCarrera.AF1o.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= cambioCarrera.Periodo.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Periodo" id="sv_Periodo"<%= ewrpt_IIf(cambioCarrera_rpt.ClearExtFilter = "cambioCarrera_Periodo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(cambioCarrera.Periodo.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(cambioCarrera.Periodo.CustomFilters) Then
	cntf = UBound(cambioCarrera.Periodo.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(cambioCarrera.Periodo.DropDownList) Then
	cntd = UBound(cambioCarrera.Periodo.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If cambioCarrera.Periodo.CustomFilters(i).FldName = "Periodo" Then
%>
		<option value="<%= "@@" & cambioCarrera.Periodo.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(cambioCarrera.Periodo.DropDownValue, "@@" & cambioCarrera.Periodo.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= cambioCarrera.Periodo.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= cambioCarrera.Periodo.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(cambioCarrera.Periodo.DropDownValue, cambioCarrera.Periodo.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(cambioCarrera.Periodo.DropDownList(i), "", 0) %></option>
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
<% If cambioCarrera.ShowCurrentFilter Then %>
<div id="ewrptFilterList">
<% Call cambioCarrera_rpt.ShowFilterList() %>
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
If (cambioCarrera.ExportAll And cambioCarrera.Export <> "") Then
	cambioCarrera_rpt.StopGrp = cambioCarrera_rpt.TotalGrps
Else
	cambioCarrera_rpt.StopGrp = cambioCarrera_rpt.StartGrp + cambioCarrera_rpt.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(cambioCarrera_rpt.StopGrp) > CLng(cambioCarrera_rpt.TotalGrps) Then
	cambioCarrera_rpt.StopGrp = cambioCarrera_rpt.TotalGrps
End If
cambioCarrera_rpt.RecCount = 0

' Init Summary Values
Call cambioCarrera_rpt.ResetLevelSummary(0)

' Get first row
If cambioCarrera_rpt.TotalGrps > 0 Then
	Call cambioCarrera_rpt.GetRow(1)
	cambioCarrera_rpt.GrpCount = 1
End If
Do While (Not rs.Eof And cambioCarrera_rpt.GrpCount <= cambioCarrera_rpt.DisplayGrps) Or (cambioCarrera_rpt.ShowFirstHeader)

	' Show Header
	If cambioCarrera_rpt.ShowFirstHeader Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.Codigo_Cliente.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.Codigo_Cliente) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.Codigo_Cliente.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.Codigo_Cliente) %>',0);"><%= cambioCarrera.Codigo_Cliente.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.Codigo_Cliente.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.Codigo_Cliente.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.Nombre.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.Nombre) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.Nombre.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.Nombre) %>',0);"><%= cambioCarrera.Nombre.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.Nombre.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.Nombre.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.Paterno.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.Paterno) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.Paterno.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.Paterno) %>',0);"><%= cambioCarrera.Paterno.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.Paterno.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.Paterno.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.Materno.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.Materno) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.Materno.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.Materno) %>',0);"><%= cambioCarrera.Materno.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.Materno.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.Materno.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.CF3digo_Carrera.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.CF3digo_Carrera) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.CF3digo_Carrera.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.CF3digo_Carrera) %>',0);"><%= cambioCarrera.CF3digo_Carrera.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.CF3digo_Carrera.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.CF3digo_Carrera.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.Jornada.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.Jornada) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.Jornada.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.Jornada) %>',0);"><%= cambioCarrera.Jornada.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.Jornada.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.Jornada.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.AF1o.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.AF1o) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.AF1o.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.AF1o) %>',0);"><%= cambioCarrera.AF1o.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.AF1o.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.AF1o.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.Periodo.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.Periodo) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.Periodo.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.Periodo) %>',0);"><%= cambioCarrera.Periodo.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.Periodo.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.Periodo.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.Cod_Tipo_SituaciF3n.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.Cod_Tipo_SituaciF3n) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.Cod_Tipo_SituaciF3n.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.Cod_Tipo_SituaciF3n) %>',0);"><%= cambioCarrera.Cod_Tipo_SituaciF3n.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.Cod_Tipo_SituaciF3n.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.Cod_Tipo_SituaciF3n.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.DescripciF3n.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.DescripciF3n) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.DescripciF3n.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.DescripciF3n) %>',0);"><%= cambioCarrera.DescripciF3n.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.DescripciF3n.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.DescripciF3n.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If cambioCarrera.Export <> "" Then %>
<%= cambioCarrera.ObservaciF3n.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If cambioCarrera.SortUrl(cambioCarrera.ObservaciF3n) = "" Then %>
		<td style="vertical-align: bottom;"><%= cambioCarrera.ObservaciF3n.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= cambioCarrera.SortUrl(cambioCarrera.ObservaciF3n) %>',0);"><%= cambioCarrera.ObservaciF3n.FldCaption %></td><td style="width: 10px;">
		<% If cambioCarrera.ObservaciF3n.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf cambioCarrera.ObservaciF3n.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		cambioCarrera_rpt.ShowFirstHeader = False
	End If
	cambioCarrera_rpt.RecCount = cambioCarrera_rpt.RecCount + 1

		' Render detail row
		Call cambioCarrera.ResetCSS()
		cambioCarrera.RowType = EWRPT_ROWTYPE_DETAIL
		Call cambioCarrera_rpt.RenderRow()
%>
	<tr<%= cambioCarrera.RowAttributes %>>
		<td<%= cambioCarrera.Codigo_Cliente.CellAttributes %>>
<div<%= cambioCarrera.Codigo_Cliente.ViewAttributes %>><%= cambioCarrera.Codigo_Cliente.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.Nombre.CellAttributes %>>
<div<%= cambioCarrera.Nombre.ViewAttributes %>><%= cambioCarrera.Nombre.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.Paterno.CellAttributes %>>
<div<%= cambioCarrera.Paterno.ViewAttributes %>><%= cambioCarrera.Paterno.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.Materno.CellAttributes %>>
<div<%= cambioCarrera.Materno.ViewAttributes %>><%= cambioCarrera.Materno.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.CF3digo_Carrera.CellAttributes %>>
<div<%= cambioCarrera.CF3digo_Carrera.ViewAttributes %>><%= cambioCarrera.CF3digo_Carrera.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.Jornada.CellAttributes %>>
<div<%= cambioCarrera.Jornada.ViewAttributes %>><%= cambioCarrera.Jornada.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.AF1o.CellAttributes %>>
<div<%= cambioCarrera.AF1o.ViewAttributes %>><%= cambioCarrera.AF1o.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.Periodo.CellAttributes %>>
<div<%= cambioCarrera.Periodo.ViewAttributes %>><%= cambioCarrera.Periodo.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.Cod_Tipo_SituaciF3n.CellAttributes %>>
<div<%= cambioCarrera.Cod_Tipo_SituaciF3n.ViewAttributes %>><%= cambioCarrera.Cod_Tipo_SituaciF3n.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.DescripciF3n.CellAttributes %>>
<div<%= cambioCarrera.DescripciF3n.ViewAttributes %>><%= cambioCarrera.DescripciF3n.ListViewValue %></div>
</td>
		<td<%= cambioCarrera.ObservaciF3n.CellAttributes %>>
<div<%= cambioCarrera.ObservaciF3n.ViewAttributes %>><%= cambioCarrera.ObservaciF3n.ListViewValue %></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Call cambioCarrera_rpt.AccumulateSummary()

		' Get next record
		Call cambioCarrera_rpt.GetRow(2)
		cambioCarrera_rpt.GrpCount = cambioCarrera_rpt.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
	</tfoot>
</table>
</div>
<% If cambioCarrera.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="cambioCarrerarpt.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(cambioCarrera_rpt.StartGrp, cambioCarrera_rpt.DisplayGrps, cambioCarrera_rpt.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="cambioCarrerarpt.asp?start=<%= Pager.FirstButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="cambioCarrerarpt.asp?start=<%= Pager.PrevButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="cambioCarrerarpt.asp?start=<%= Pager.NextButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="cambioCarrerarpt.asp?start=<%= Pager.LastButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If cambioCarrera_rpt.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If cambioCarrera_rpt.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("RecordsPerPage") %>&nbsp;
<input type="hidden" name="acc" value="<%=Request("acc")%>">
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="15"<% If cambioCarrera_rpt.DisplayGrps = 15 Then Response.Write " selected=""selected""" %>>15</option>
<option value="20"<% If cambioCarrera_rpt.DisplayGrps = 20 Then Response.Write " selected=""selected""" %>>20</option>
<option value="50"<% If cambioCarrera_rpt.DisplayGrps = 50 Then Response.Write " selected=""selected""" %>>50</option>
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
<% If cambioCarrera.Export = "" Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspreportmaker">
	<!-- Right slot -->
<% End If %>
<% If cambioCarrera.Export = "" Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If cambioCarrera.Export = "" Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% cambioCarrera_rpt.ShowPageFooter() %>
<%

' Close recordset and connection
rs.Close
Set rs = Nothing
%>
<% If cambioCarrera.Export = "" Then %>
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
Set cambioCarrera_rpt = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crcambioCarrera_rpt

	' Page ID
	Public Property Get PageID()
		PageID = "rpt"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "cambioCarrera"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "cambioCarrera_rpt"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If cambioCarrera.UseTokenInUrl Then PageUrl = PageUrl & "t=" & cambioCarrera.TableVar & "&" ' add page token
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
		If cambioCarrera.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (cambioCarrera.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (cambioCarrera.TableVar = Request.QueryString("t"))
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
		Set cambioCarrera = New crcambioCarrera

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "rpt"

		' Initialize table name
		EWRPT_TABLE_NAME = "cambioCarrera"

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
			cambioCarrera.Export = Request.QueryString("export")
		End If
		gsExport = cambioCarrera.Export ' Get export parameter, used in header
		gsExportFile = cambioCarrera.TableVar ' Get export file, used in header
		If cambioCarrera.Export = "excel" Then
			Response.ContentType = "application/vnd.ms-excel"
			Response.AddHeader "Content-Disposition", "attachment; filename=" & gsExportFile & ".xls"
		End If

		' Global page loading event
		Call Page_Loading()

		' Page load event
		Call Page_Load()

		' Export to Email (Load content via XMLHttp)
		If cambioCarrera.Export = "email" Then
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

		'wrkstr = "&filter=" & cambioCarrera.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(cambioCarrera.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(cambioCarrera.StartGroup&""))
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
			cambioCarrera.OrderBy = GetQSValue(QS, "o")
			cambioCarrera.StartGroup = GetQSValue(QS, "s")
			cambioCarrera.RestoreSession = True
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
		Set cambioCarrera = Nothing

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
		nDtls = 11
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
		Call cambioCarrera.CustomFilters_Load()

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
		If cambioCarrera.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total count
		Dim sSql
		sSql = ewrpt_BuildReportSql(cambioCarrera.SqlSelect, cambioCarrera.SqlWhere, cambioCarrera.SqlGroupBy, cambioCarrera.SqlHaving, cambioCarrera.SqlOrderBy, Filter, Sort)
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

		If cambioCarrera.ExportAll And cambioCarrera.Export <> "" Then
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
			cambioCarrera.Codigo_Cliente.DbValue = ewrpt_GetValue(rs("Codigo Cliente"))
			cambioCarrera.Nombre.DbValue = ewrpt_GetValue(rs("Nombre"))
			cambioCarrera.Paterno.DbValue = ewrpt_GetValue(rs("Paterno"))
			cambioCarrera.Materno.DbValue = ewrpt_GetValue(rs("Materno"))
			cambioCarrera.CF3digo_Carrera.DbValue = ewrpt_GetValue(rs("Código Carrera"))
			cambioCarrera.Jornada.DbValue = ewrpt_GetValue(rs("Jornada"))
			cambioCarrera.AF1o.DbValue = ewrpt_GetValue(rs("Año"))
			cambioCarrera.Periodo.DbValue = ewrpt_GetValue(rs("Periodo"))
			cambioCarrera.Cod_Tipo_SituaciF3n.DbValue = ewrpt_GetValue(rs("Cod Tipo Situación"))
			cambioCarrera.DescripciF3n.DbValue = ewrpt_GetValue(rs("Descripción"))
			cambioCarrera.ObservaciF3n.DbValue = ewrpt_GetValue(rs("Observación"))
			Val(1) = cambioCarrera.Codigo_Cliente.CurrentValue
			Val(2) = cambioCarrera.Nombre.CurrentValue
			Val(3) = cambioCarrera.Paterno.CurrentValue
			Val(4) = cambioCarrera.Materno.CurrentValue
			Val(5) = cambioCarrera.CF3digo_Carrera.CurrentValue
			Val(6) = cambioCarrera.Jornada.CurrentValue
			Val(7) = cambioCarrera.AF1o.CurrentValue
			Val(8) = cambioCarrera.Periodo.CurrentValue
			Val(9) = cambioCarrera.Cod_Tipo_SituaciF3n.CurrentValue
			Val(10) = cambioCarrera.DescripciF3n.CurrentValue
			Val(11) = cambioCarrera.ObservaciF3n.CurrentValue
		Else
			cambioCarrera.Codigo_Cliente.DbValue = ""
			cambioCarrera.Nombre.DbValue = ""
			cambioCarrera.Paterno.DbValue = ""
			cambioCarrera.Materno.DbValue = ""
			cambioCarrera.CF3digo_Carrera.DbValue = ""
			cambioCarrera.Jornada.DbValue = ""
			cambioCarrera.AF1o.DbValue = ""
			cambioCarrera.Periodo.DbValue = ""
			cambioCarrera.Cod_Tipo_SituaciF3n.DbValue = ""
			cambioCarrera.DescripciF3n.DbValue = ""
			cambioCarrera.ObservaciF3n.DbValue = ""
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
			cambioCarrera.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				cambioCarrera.StartGroup = nStartGrp
			Else
				StartGrp = cambioCarrera.StartGroup
			End If
		Else
			StartGrp = cambioCarrera.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			cambioCarrera.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			cambioCarrera.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			cambioCarrera.StartGroup = StartGrp
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
		cambioCarrera.StartGroup = StartGrp
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
			cambioCarrera.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			cambioCarrera.StartGroup = nStartGrp
		Else
			If cambioCarrera.GroupPerPage <> "" Then
				DisplayGrps = cambioCarrera.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 15 ' Load Default
			End If
		End If
	End Sub

	' Render row
	Sub RenderRow()
		If cambioCarrera.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' Get total count from sql directly
			Dim sSql, rstot
			sSql = ewrpt_BuildReportSql(cambioCarrera.SqlSelectCount, cambioCarrera.SqlWhere, cambioCarreraSqlGroupBy, cambioCarrera.SqlHaving, "", Filter, "")
			If EWRPT_DEBUG_ENABLED Then Response.Write "(Total SQL): " & sSql & "<br>"
			Set rstot = ewrpt_LoadRs(sSql)
			If Not rstot.Eof Then
				TotCount = ewrpt_GetValue(rstot(0))
			Else
				TotCount = 0
			End If
		End If

		' Call Row_Rendering event
		Call cambioCarrera.Row_Rendering()

		' --------------------
		'  Render view codes
		' --------------------

		If cambioCarrera.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' Codigo Cliente
			cambioCarrera.Codigo_Cliente.ViewValue = cambioCarrera.Codigo_Cliente.Summary

			' Nombre
			cambioCarrera.Nombre.ViewValue = cambioCarrera.Nombre.Summary

			' Paterno
			cambioCarrera.Paterno.ViewValue = cambioCarrera.Paterno.Summary

			' Materno
			cambioCarrera.Materno.ViewValue = cambioCarrera.Materno.Summary

			' Código Carrera
			cambioCarrera.CF3digo_Carrera.ViewValue = cambioCarrera.CF3digo_Carrera.Summary

			' Jornada
			cambioCarrera.Jornada.ViewValue = cambioCarrera.Jornada.Summary

			' Año
			cambioCarrera.AF1o.ViewValue = cambioCarrera.AF1o.Summary

			' Periodo
			cambioCarrera.Periodo.ViewValue = cambioCarrera.Periodo.Summary

			' Cod Tipo Situación
			cambioCarrera.Cod_Tipo_SituaciF3n.ViewValue = cambioCarrera.Cod_Tipo_SituaciF3n.Summary

			' Descripción
			cambioCarrera.DescripciF3n.ViewValue = cambioCarrera.DescripciF3n.Summary

			' Observación
			cambioCarrera.ObservaciF3n.ViewValue = cambioCarrera.ObservaciF3n.Summary
		Else

			' Codigo Cliente
			cambioCarrera.Codigo_Cliente.ViewValue = cambioCarrera.Codigo_Cliente.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.Codigo_Cliente.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Nombre
			cambioCarrera.Nombre.ViewValue = cambioCarrera.Nombre.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.Nombre.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Paterno
			cambioCarrera.Paterno.ViewValue = cambioCarrera.Paterno.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.Paterno.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Materno
			cambioCarrera.Materno.ViewValue = cambioCarrera.Materno.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.Materno.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Código Carrera
			cambioCarrera.CF3digo_Carrera.ViewValue = cambioCarrera.CF3digo_Carrera.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.CF3digo_Carrera.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Jornada
			cambioCarrera.Jornada.ViewValue = cambioCarrera.Jornada.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.Jornada.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Año
			cambioCarrera.AF1o.ViewValue = cambioCarrera.AF1o.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.AF1o.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Periodo
			cambioCarrera.Periodo.ViewValue = cambioCarrera.Periodo.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.Periodo.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Cod Tipo Situación
			cambioCarrera.Cod_Tipo_SituaciF3n.ViewValue = cambioCarrera.Cod_Tipo_SituaciF3n.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.Cod_Tipo_SituaciF3n.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Descripción
			cambioCarrera.DescripciF3n.ViewValue = cambioCarrera.DescripciF3n.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.DescripciF3n.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Observación
			cambioCarrera.ObservaciF3n.ViewValue = cambioCarrera.ObservaciF3n.CurrentValue
			Call ewrpt_SetAttr(cambioCarrera.ObservaciF3n.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))
		End If

		' Codigo Cliente
		cambioCarrera.Codigo_Cliente.HrefValue = ""

		' Nombre
		cambioCarrera.Nombre.HrefValue = ""

		' Paterno
		cambioCarrera.Paterno.HrefValue = ""

		' Materno
		cambioCarrera.Materno.HrefValue = ""

		' Código Carrera
		cambioCarrera.CF3digo_Carrera.HrefValue = ""

		' Jornada
		cambioCarrera.Jornada.HrefValue = ""

		' Año
		cambioCarrera.AF1o.HrefValue = ""

		' Periodo
		cambioCarrera.Periodo.HrefValue = ""

		' Cod Tipo Situación
		cambioCarrera.Cod_Tipo_SituaciF3n.HrefValue = ""

		' Descripción
		cambioCarrera.DescripciF3n.HrefValue = ""

		' Observación
		cambioCarrera.ObservaciF3n.HrefValue = ""

		' Call Row_Rendered event
		Call cambioCarrera.Row_Rendered()
	End Sub

	' Get extended filter values
	Sub GetExtendedFilterValues()
		Dim sSelectFld, sSelect, sWhere, sOrderBy
		Dim wrkSql, wrkRs

		' Field Jornada
		sSelect = "SELECT DISTINCT al.JORNADA FROM " & cambioCarrera.SqlFrom
		sWhere = cambioCarrera.SqlWhere
		sOrderBy = "al.JORNADA ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		cambioCarrera.Jornada.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Año
		sSelect = "SELECT DISTINCT s.ANO FROM " & cambioCarrera.SqlFrom
		sWhere = cambioCarrera.SqlWhere
		sOrderBy = "s.ANO ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		cambioCarrera.AF1o.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Periodo
		sSelect = "SELECT DISTINCT s.PERIODO FROM " & cambioCarrera.SqlFrom
		sWhere = cambioCarrera.SqlWhere
		sOrderBy = "s.PERIODO ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		cambioCarrera.Periodo.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Cod Tipo Situación
		sSelect = "SELECT DISTINCT t.CODIGO FROM " & cambioCarrera.SqlFrom
		sWhere = cambioCarrera.SqlWhere
		sOrderBy = "t.CODIGO ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		cambioCarrera.Cod_Tipo_SituaciF3n.DropDownList = ewrpt_GetDistinctValues("", wrkSql)
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
			' Field Codigo Cliente

			Call SetSessionFilterValues(cambioCarrera.Codigo_Cliente.SearchValue, cambioCarrera.Codigo_Cliente.SearchOperator, cambioCarrera.Codigo_Cliente.SearchCondition, cambioCarrera.Codigo_Cliente.SearchValue2, cambioCarrera.Codigo_Cliente.SearchOperator2, "Codigo_Cliente")

			' Field Nombre
			Call SetSessionFilterValues(cambioCarrera.Nombre.SearchValue, cambioCarrera.Nombre.SearchOperator, cambioCarrera.Nombre.SearchCondition, cambioCarrera.Nombre.SearchValue2, cambioCarrera.Nombre.SearchOperator2, "Nombre")

			' Field Paterno
			Call SetSessionFilterValues(cambioCarrera.Paterno.SearchValue, cambioCarrera.Paterno.SearchOperator, cambioCarrera.Paterno.SearchCondition, cambioCarrera.Paterno.SearchValue2, cambioCarrera.Paterno.SearchOperator2, "Paterno")

			' Field Materno
			Call SetSessionFilterValues(cambioCarrera.Materno.SearchValue, cambioCarrera.Materno.SearchOperator, cambioCarrera.Materno.SearchCondition, cambioCarrera.Materno.SearchValue2, cambioCarrera.Materno.SearchOperator2, "Materno")

			' Field Código Carrera
			Call SetSessionFilterValues(cambioCarrera.CF3digo_Carrera.SearchValue, cambioCarrera.CF3digo_Carrera.SearchOperator, cambioCarrera.CF3digo_Carrera.SearchCondition, cambioCarrera.CF3digo_Carrera.SearchValue2, cambioCarrera.CF3digo_Carrera.SearchOperator2, "CF3digo_Carrera")

			' Field Jornada
			Call SetSessionDropDownValue(cambioCarrera.Jornada.DropDownValue, "Jornada")

			' Field Año
			Call SetSessionDropDownValue(cambioCarrera.AF1o.DropDownValue, "AF1o")

			' Field Periodo
			Call SetSessionDropDownValue(cambioCarrera.Periodo.DropDownValue, "Periodo")

			' Field Cod Tipo Situación
			Call SetSessionDropDownValue(cambioCarrera.Cod_Tipo_SituaciF3n.DropDownValue, "Cod_Tipo_SituaciF3n")
			bSetupFilter = True ' Set up filter required
		Else

			' Field Codigo Cliente
			If GetFilterValues(cambioCarrera.Codigo_Cliente) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Nombre
			If GetFilterValues(cambioCarrera.Nombre) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Paterno
			If GetFilterValues(cambioCarrera.Paterno) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Materno
			If GetFilterValues(cambioCarrera.Materno) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Código Carrera
			If GetFilterValues(cambioCarrera.CF3digo_Carrera) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Jornada
			If GetDropDownValue(cambioCarrera.Jornada) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(cambioCarrera.Jornada.DropDownValue) Then
				If cambioCarrera.Jornada.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_cambioCarrera_Jornada")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Año
			If GetDropDownValue(cambioCarrera.AF1o) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(cambioCarrera.AF1o.DropDownValue) Then
				If cambioCarrera.AF1o.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_cambioCarrera_AF1o")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Periodo
			If GetDropDownValue(cambioCarrera.Periodo) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(cambioCarrera.Periodo.DropDownValue) Then
				If cambioCarrera.Periodo.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_cambioCarrera_Periodo")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Cod Tipo Situación
			If GetDropDownValue(cambioCarrera.Cod_Tipo_SituaciF3n) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(cambioCarrera.Cod_Tipo_SituaciF3n.DropDownValue) Then
				If cambioCarrera.Cod_Tipo_SituaciF3n.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_cambioCarrera_Cod_Tipo_SituaciF3n")) Then
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

			' Field Codigo Cliente
			Call GetSessionFilterValues(cambioCarrera.Codigo_Cliente)

			' Field Nombre
			Call GetSessionFilterValues(cambioCarrera.Nombre)

			' Field Paterno
			Call GetSessionFilterValues(cambioCarrera.Paterno)

			' Field Materno
			Call GetSessionFilterValues(cambioCarrera.Materno)

			' Field Código Carrera
			Call GetSessionFilterValues(cambioCarrera.CF3digo_Carrera)

			' Field Jornada
			Call GetSessionDropDownValue(cambioCarrera.Jornada)

			' Field Año
			Call GetSessionDropDownValue(cambioCarrera.AF1o)

			' Field Periodo
			Call GetSessionDropDownValue(cambioCarrera.Periodo)

			' Field Cod Tipo Situación
			Call GetSessionDropDownValue(cambioCarrera.Cod_Tipo_SituaciF3n)
		End If

		' Call page filter validated event
		Call cambioCarrera.Page_FilterValidated()

		' Build sql
		' Field Codigo Cliente

		Call BuildExtendedFilter(cambioCarrera.Codigo_Cliente, sFilter)

		' Field Nombre
		Call BuildExtendedFilter(cambioCarrera.Nombre, sFilter)

		' Field Paterno
		Call BuildExtendedFilter(cambioCarrera.Paterno, sFilter)

		' Field Materno
		Call BuildExtendedFilter(cambioCarrera.Materno, sFilter)

		' Field Código Carrera
		Call BuildExtendedFilter(cambioCarrera.CF3digo_Carrera, sFilter)

		' Field Jornada
		Call BuildDropDownFilter(cambioCarrera.Jornada, sFilter, "")

		' Field Año
		Call BuildDropDownFilter(cambioCarrera.AF1o, sFilter, "")

		' Field Periodo
		Call BuildDropDownFilter(cambioCarrera.Periodo, sFilter, "")

		' Field Cod Tipo Situación
		Call BuildDropDownFilter(cambioCarrera.Cod_Tipo_SituaciF3n, sFilter, "")

		' Save parms to Session
		' Field Codigo Cliente

		Call SetSessionFilterValues(cambioCarrera.Codigo_Cliente.SearchValue, cambioCarrera.Codigo_Cliente.SearchOperator, cambioCarrera.Codigo_Cliente.SearchCondition, cambioCarrera.Codigo_Cliente.SearchValue2, cambioCarrera.Codigo_Cliente.SearchOperator2, "Codigo_Cliente")

		' Field Nombre
		Call SetSessionFilterValues(cambioCarrera.Nombre.SearchValue, cambioCarrera.Nombre.SearchOperator, cambioCarrera.Nombre.SearchCondition, cambioCarrera.Nombre.SearchValue2, cambioCarrera.Nombre.SearchOperator2, "Nombre")

		' Field Paterno
		Call SetSessionFilterValues(cambioCarrera.Paterno.SearchValue, cambioCarrera.Paterno.SearchOperator, cambioCarrera.Paterno.SearchCondition, cambioCarrera.Paterno.SearchValue2, cambioCarrera.Paterno.SearchOperator2, "Paterno")

		' Field Materno
		Call SetSessionFilterValues(cambioCarrera.Materno.SearchValue, cambioCarrera.Materno.SearchOperator, cambioCarrera.Materno.SearchCondition, cambioCarrera.Materno.SearchValue2, cambioCarrera.Materno.SearchOperator2, "Materno")

		' Field Código Carrera
		Call SetSessionFilterValues(cambioCarrera.CF3digo_Carrera.SearchValue, cambioCarrera.CF3digo_Carrera.SearchOperator, cambioCarrera.CF3digo_Carrera.SearchCondition, cambioCarrera.CF3digo_Carrera.SearchValue2, cambioCarrera.CF3digo_Carrera.SearchOperator2, "CF3digo_Carrera")

		' Field Jornada
		Call SetSessionDropDownValue(cambioCarrera.Jornada.DropDownValue, "Jornada")

		' Field Año
		Call SetSessionDropDownValue(cambioCarrera.AF1o.DropDownValue, "AF1o")

		' Field Periodo
		Call SetSessionDropDownValue(cambioCarrera.Periodo.DropDownValue, "Periodo")

		' Field Cod Tipo Situación
		Call SetSessionDropDownValue(cambioCarrera.Cod_Tipo_SituaciF3n.DropDownValue, "Cod_Tipo_SituaciF3n")

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
		If Not IsEmpty(Session("sv_cambioCarrera_" & parm)) Then fld.DropDownValue = Session("sv_cambioCarrera_" & parm)
	End Sub

	' Get filter values from Session
	Sub GetSessionFilterValues(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv1_cambioCarrera_" & parm)) Then fld.SearchValue = Session("sv1_cambioCarrera_" & parm)
		If Not IsEmpty(Session("so1_cambioCarrera_" & parm)) Then fld.SearchOperator = Session("so1_cambioCarrera_" & parm)
		If Not IsEmpty(Session("sc_cambioCarrera_" & parm)) Then fld.SearchCondition = Session("sc_cambioCarrera_" & parm)
		If Not IsEmpty(Session("sv2_cambioCarrera_" & parm)) Then fld.SearchValue2 = Session("sv2_cambioCarrera_" & parm)
		If Not IsEmpty(Session("so2_cambioCarrera_" & parm)) Then fld.SearchOperator2 = Session("so2_cambioCarrera_" & parm)
	End Sub

	' Set dropdown value to Session
	Sub SetSessionDropDownValue(sv, parm)
		Session("sv_cambioCarrera_" & parm) = sv
	End Sub

	' Set filter values to Session
	Sub SetSessionFilterValues(sv1, so1, sc, sv2, so2, parm)
		Session("sv1_cambioCarrera_" & parm) = sv1
		Session("so1_cambioCarrera_" & parm) = so1
		Session("sc_cambioCarrera_" & parm) = sc
		Session("sv2_cambioCarrera_" & parm) = sv2
		Session("so2_cambioCarrera_" & parm) = so2
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
		Session("sel_cambioCarrera_" & parm) = ""
		Session("rf_cambioCarrera_" & parm) = ""
		Session("rt_cambioCarrera_" & parm) = ""
	End Sub

	' Load selection from session
	Sub LoadSelectionFromSession(parm)
		Dim fld
		Set fld = cambioCarrera.GetField(parm)
		fld.SelectionList = Session("sel_cambioCarrera_" & parm)
		fld.RangeFrom = Session("rf_cambioCarrera_" & parm)
		fld.RangeTo = Session("rt_cambioCarrera_" & parm)
	End Sub

	' Load default value for filters
	Sub LoadDefaultFilters()
		Dim sWrk, sSql, arwrk

		' --------------------------------------------------
		'  Set up default values for dropdown filters
		'
		' Field Jornada

		cambioCarrera.Jornada.DefaultDropDownValue = EWRPT_INIT_VALUE
		cambioCarrera.Jornada.DropDownValue = cambioCarrera.Jornada.DefaultDropDownValue

		' Field Año
		cambioCarrera.AF1o.DefaultDropDownValue = EWRPT_INIT_VALUE
		cambioCarrera.AF1o.DropDownValue = cambioCarrera.AF1o.DefaultDropDownValue

		' Field Periodo
		cambioCarrera.Periodo.DefaultDropDownValue = EWRPT_INIT_VALUE
		cambioCarrera.Periodo.DropDownValue = cambioCarrera.Periodo.DefaultDropDownValue

		' Field Cod Tipo Situación
		cambioCarrera.Cod_Tipo_SituaciF3n.DefaultDropDownValue = EWRPT_INIT_VALUE
		cambioCarrera.Cod_Tipo_SituaciF3n.DropDownValue = cambioCarrera.Cod_Tipo_SituaciF3n.DefaultDropDownValue

		' --------------------------------------------------
		'  Set up default values for extended filters
		'
		' Field Codigo Cliente

		Call SetDefaultExtFilter(cambioCarrera.Codigo_Cliente, "=", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(cambioCarrera.Codigo_Cliente)

		' Field Nombre
		Call SetDefaultExtFilter(cambioCarrera.Nombre, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(cambioCarrera.Nombre)

		' Field Paterno
		Call SetDefaultExtFilter(cambioCarrera.Paterno, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(cambioCarrera.Paterno)

		' Field Materno
		Call SetDefaultExtFilter(cambioCarrera.Materno, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(cambioCarrera.Materno)

		' Field Código Carrera
		Call SetDefaultExtFilter(cambioCarrera.CF3digo_Carrera, "=", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(cambioCarrera.CF3digo_Carrera)

		' --------------------------------------------------
		'  Set up default values for popup filters
		'  - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Function CheckFilter()

		' Check Codigo Cliente Text filter
		If TextFilterApplied(cambioCarrera.Codigo_Cliente) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Nombre Text filter
		If TextFilterApplied(cambioCarrera.Nombre) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Paterno Text filter
		If TextFilterApplied(cambioCarrera.Paterno) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Materno Text filter
		If TextFilterApplied(cambioCarrera.Materno) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Código Carrera Text filter
		If TextFilterApplied(cambioCarrera.CF3digo_Carrera) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Jornada non-Text filter
		If NonTextFilterApplied(cambioCarrera.Jornada) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Año non-Text filter
		If NonTextFilterApplied(cambioCarrera.AF1o) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Periodo non-Text filter
		If NonTextFilterApplied(cambioCarrera.Periodo) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Cod Tipo Situación non-Text filter
		If NonTextFilterApplied(cambioCarrera.Cod_Tipo_SituaciF3n) Then
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

		' Field Codigo Cliente
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(cambioCarrera.Codigo_Cliente, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & cambioCarrera.Codigo_Cliente.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Nombre
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(cambioCarrera.Nombre, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & cambioCarrera.Nombre.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Paterno
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(cambioCarrera.Paterno, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & cambioCarrera.Paterno.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Materno
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(cambioCarrera.Materno, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & cambioCarrera.Materno.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Código Carrera
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(cambioCarrera.CF3digo_Carrera, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & cambioCarrera.CF3digo_Carrera.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Jornada
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(cambioCarrera.Jornada, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & cambioCarrera.Jornada.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Año
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(cambioCarrera.AF1o, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & cambioCarrera.AF1o.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Periodo
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(cambioCarrera.Periodo, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & cambioCarrera.Periodo.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Cod Tipo Situación
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(cambioCarrera.Cod_Tipo_SituaciF3n, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & cambioCarrera.Cod_Tipo_SituaciF3n.FldCaption & "<br>"
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
				cambioCarrera.OrderBy = ""
				cambioCarrera.StartGroup = 1
				cambioCarrera.Codigo_Cliente.Sort = ""
				cambioCarrera.Nombre.Sort = ""
				cambioCarrera.Paterno.Sort = ""
				cambioCarrera.Materno.Sort = ""
				cambioCarrera.CF3digo_Carrera.Sort = ""
				cambioCarrera.Jornada.Sort = ""
				cambioCarrera.AF1o.Sort = ""
				cambioCarrera.Periodo.Sort = ""
				cambioCarrera.Cod_Tipo_SituaciF3n.Sort = ""
				cambioCarrera.DescripciF3n.Sort = ""
				cambioCarrera.ObservaciF3n.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			cambioCarrera.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				cambioCarrera.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				cambioCarrera.CurrentOrderType = ""
			End If
			sSortSql = cambioCarrera.SortSql
			cambioCarrera.OrderBy = sSortSql
			cambioCarrera.StartGroup = 1
		End If
		GetSort = cambioCarrera.OrderBy
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
