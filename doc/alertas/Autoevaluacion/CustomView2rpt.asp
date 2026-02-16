<!--#include file="rptinc/ewrcfg4.asp"-->
<!--#include file="rptinc/ewrfn4.asp"-->
<!--#include file="rptinc/ewrusrfn.asp"-->
<%

' Variable for table object
Dim CustomView2

' Define table class
Class crCustomView2
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "CustomView2"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "CustomView2"
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

	' RUT
	Private m_RUT

	Public Property Get RUT()
		Dim ar
		If Not IsObject(m_RUT) Then
			Set m_RUT = NewFldObj("CustomView2", "CustomView2", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			m_RUT.DateFilter = ""
			m_RUT.SqlSelect = ""
			m_RUT.SqlOrderBy = ""
		End If
		Set RUT = m_RUT
	End Property

	' CODCARPR
	Private m_CODCARPR

	Public Property Get CODCARPR()
		Dim ar
		If Not IsObject(m_CODCARPR) Then
			Set m_CODCARPR = NewFldObj("CustomView2", "CustomView2", "x_CODCARPR", "CODCARPR", "[CODCARPR]", 200, EWRPT_DATATYPE_STRING, -1)
			m_CODCARPR.DateFilter = ""
			m_CODCARPR.SqlSelect = ""
			m_CODCARPR.SqlOrderBy = ""
		End If
		Set CODCARPR = m_CODCARPR
	End Property

	' JORNADA
	Private m_JORNADA

	Public Property Get JORNADA()
		Dim ar
		If Not IsObject(m_JORNADA) Then
			Set m_JORNADA = NewFldObj("CustomView2", "CustomView2", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			m_JORNADA.DateFilter = ""
			m_JORNADA.SqlSelect = ""
			m_JORNADA.SqlOrderBy = ""
		End If
		Set JORNADA = m_JORNADA
	End Property

	' NOMBRE_C
	Private m_NOMBRE_C

	Public Property Get NOMBRE_C()
		Dim ar
		If Not IsObject(m_NOMBRE_C) Then
			Set m_NOMBRE_C = NewFldObj("CustomView2", "CustomView2", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE_C.DateFilter = ""
			m_NOMBRE_C.SqlSelect = ""
			m_NOMBRE_C.SqlOrderBy = ""
		End If
		Set NOMBRE_C = m_NOMBRE_C
	End Property

	' ESTACAD
	Private m_ESTACAD

	Public Property Get ESTACAD()
		Dim ar
		If Not IsObject(m_ESTACAD) Then
			Set m_ESTACAD = NewFldObj("CustomView2", "CustomView2", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			m_ESTACAD.DateFilter = ""
			m_ESTACAD.SqlSelect = ""
			m_ESTACAD.SqlOrderBy = ""
		End If
		Set ESTACAD = m_ESTACAD
	End Property

	' DESCRIPCION
	Private m_DESCRIPCION

	Public Property Get DESCRIPCION()
		Dim ar
		If Not IsObject(m_DESCRIPCION) Then
			Set m_DESCRIPCION = NewFldObj("CustomView2", "CustomView2", "x_DESCRIPCION", "DESCRIPCION", "[DESCRIPCION]", 200, EWRPT_DATATYPE_STRING, -1)
			m_DESCRIPCION.DateFilter = ""
			m_DESCRIPCION.SqlSelect = ""
			m_DESCRIPCION.SqlOrderBy = ""
		End If
		Set DESCRIPCION = m_DESCRIPCION
	End Property

	' DIG
	Private m_DIG

	Public Property Get DIG()
		Dim ar
		If Not IsObject(m_DIG) Then
			Set m_DIG = NewFldObj("CustomView2", "CustomView2", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
			m_DIG.DateFilter = ""
			m_DIG.SqlSelect = ""
			m_DIG.SqlOrderBy = ""
		End If
		Set DIG = m_DIG
	End Property

	' PATERNO
	Private m_PATERNO

	Public Property Get PATERNO()
		Dim ar
		If Not IsObject(m_PATERNO) Then
			Set m_PATERNO = NewFldObj("CustomView2", "CustomView2", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_MATERNO = NewFldObj("CustomView2", "CustomView2", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NOMBRE = NewFldObj("CustomView2", "CustomView2", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE.DateFilter = ""
			m_NOMBRE.SqlSelect = ""
			m_NOMBRE.SqlOrderBy = ""
		End If
		Set NOMBRE = m_NOMBRE
	End Property

	' ANO
	Private m_ANO

	Public Property Get ANO()
		Dim ar
		If Not IsObject(m_ANO) Then
			Set m_ANO = NewFldObj("CustomView2", "CustomView2", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_ANO.DateFilter = ""
			m_ANO.SqlSelect = ""
			m_ANO.SqlOrderBy = ""
		End If
		Set ANO = m_ANO
	End Property

	' ESRETIRO
	Private m_ESRETIRO

	Public Property Get ESRETIRO()
		Dim ar
		If Not IsObject(m_ESRETIRO) Then
			Set m_ESRETIRO = NewFldObj("CustomView2", "CustomView2", "x_ESRETIRO", "ESRETIRO", "[ESRETIRO]", 200, EWRPT_DATATYPE_STRING, -1)
			m_ESRETIRO.DateFilter = ""
			m_ESRETIRO.SqlSelect = ""
			m_ESRETIRO.SqlOrderBy = ""
		End If
		Set ESRETIRO = m_ESRETIRO
	End Property

	' TIPOCARR
	Private m_TIPOCARR

	Public Property Get TIPOCARR()
		Dim ar
		If Not IsObject(m_TIPOCARR) Then
			Set m_TIPOCARR = NewFldObj("CustomView2", "CustomView2", "x_TIPOCARR", "TIPOCARR", "[TIPOCARR]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_TIPOCARR.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_TIPOCARR.DateFilter = ""
			m_TIPOCARR.SqlSelect = ""
			m_TIPOCARR.SqlOrderBy = ""
		End If
		Set TIPOCARR = m_TIPOCARR
	End Property

	' CAMBIOCARRERA
	Private m_CAMBIOCARRERA

	Public Property Get CAMBIOCARRERA()
		Dim ar
		If Not IsObject(m_CAMBIOCARRERA) Then
			Set m_CAMBIOCARRERA = NewFldObj("CustomView2", "CustomView2", "x_CAMBIOCARRERA", "CAMBIOCARRERA", "[CAMBIOCARRERA]", 129, EWRPT_DATATYPE_STRING, -1)
			m_CAMBIOCARRERA.DateFilter = ""
			m_CAMBIOCARRERA.SqlSelect = ""
			m_CAMBIOCARRERA.SqlOrderBy = ""
		End If
		Set CAMBIOCARRERA = m_CAMBIOCARRERA
	End Property

	' REINCORPORA
	Private m_REINCORPORA

	Public Property Get REINCORPORA()
		Dim ar
		If Not IsObject(m_REINCORPORA) Then
			Set m_REINCORPORA = NewFldObj("CustomView2", "CustomView2", "x_REINCORPORA", "REINCORPORA", "[REINCORPORA]", 129, EWRPT_DATATYPE_STRING, -1)
			m_REINCORPORA.DateFilter = ""
			m_REINCORPORA.SqlSelect = ""
			m_REINCORPORA.SqlOrderBy = ""
		End If
		Set REINCORPORA = m_REINCORPORA
	End Property

	' OTORGATITULO
	Private m_OTORGATITULO

	Public Property Get OTORGATITULO()
		Dim ar
		If Not IsObject(m_OTORGATITULO) Then
			Set m_OTORGATITULO = NewFldObj("CustomView2", "CustomView2", "x_OTORGATITULO", "OTORGATITULO", "[OTORGATITULO]", 129, EWRPT_DATATYPE_STRING, -1)
			m_OTORGATITULO.DateFilter = ""
			m_OTORGATITULO.SqlSelect = ""
			m_OTORGATITULO.SqlOrderBy = ""
		End If
		Set OTORGATITULO = m_OTORGATITULO
	End Property

	' CONCEPTO
	Private m_CONCEPTO

	Public Property Get CONCEPTO()
		Dim ar
		If Not IsObject(m_CONCEPTO) Then
			Set m_CONCEPTO = NewFldObj("CustomView2", "CustomView2", "x_CONCEPTO", "CONCEPTO", "[CONCEPTO]", 200, EWRPT_DATATYPE_STRING, -1)
			m_CONCEPTO.DateFilter = ""
			m_CONCEPTO.SqlSelect = ""
			m_CONCEPTO.SqlOrderBy = ""
		End If
		Set CONCEPTO = m_CONCEPTO
	End Property

	' SEXO
	Private m_SEXO

	Public Property Get SEXO()
		Dim ar
		If Not IsObject(m_SEXO) Then
			Set m_SEXO = NewFldObj("CustomView2", "CustomView2", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1)
			m_SEXO.DateFilter = ""
			m_SEXO.SqlSelect = ""
			m_SEXO.SqlOrderBy = ""
		End If
		Set SEXO = m_SEXO
	End Property

	' NACIONALIDAD
	Private m_NACIONALIDAD

	Public Property Get NACIONALIDAD()
		Dim ar
		If Not IsObject(m_NACIONALIDAD) Then
			Set m_NACIONALIDAD = NewFldObj("CustomView2", "CustomView2", "x_NACIONALIDAD", "NACIONALIDAD", "[NACIONALIDAD]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NACIONALIDAD.DateFilter = ""
			m_NACIONALIDAD.SqlSelect = ""
			m_NACIONALIDAD.SqlOrderBy = ""
		End If
		Set NACIONALIDAD = m_NACIONALIDAD
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
		Call ewrpt_SetArObj(Fields, "RUT", RUT)
		Call ewrpt_SetArObj(Fields, "CODCARPR", CODCARPR)
		Call ewrpt_SetArObj(Fields, "JORNADA", JORNADA)
		Call ewrpt_SetArObj(Fields, "NOMBRE_C", NOMBRE_C)
		Call ewrpt_SetArObj(Fields, "ESTACAD", ESTACAD)
		Call ewrpt_SetArObj(Fields, "DESCRIPCION", DESCRIPCION)
		Call ewrpt_SetArObj(Fields, "DIG", DIG)
		Call ewrpt_SetArObj(Fields, "PATERNO", PATERNO)
		Call ewrpt_SetArObj(Fields, "MATERNO", MATERNO)
		Call ewrpt_SetArObj(Fields, "NOMBRE", NOMBRE)
		Call ewrpt_SetArObj(Fields, "ANO", ANO)
		Call ewrpt_SetArObj(Fields, "ESRETIRO", ESRETIRO)
		Call ewrpt_SetArObj(Fields, "TIPOCARR", TIPOCARR)
		Call ewrpt_SetArObj(Fields, "CAMBIOCARRERA", CAMBIOCARRERA)
		Call ewrpt_SetArObj(Fields, "REINCORPORA", REINCORPORA)
		Call ewrpt_SetArObj(Fields, "OTORGATITULO", OTORGATITULO)
		Call ewrpt_SetArObj(Fields, "CONCEPTO", CONCEPTO)
		Call ewrpt_SetArObj(Fields, "SEXO", SEXO)
		Call ewrpt_SetArObj(Fields, "NACIONALIDAD", NACIONALIDAD)
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
		SqlFrom = "Vista_Autoevatipositu"
	End Property

	Public Property Get SqlSelect() ' Select
		SqlSelect = "SELECT * FROM " & SqlFrom
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
Dim CustomView2_rpt
Set CustomView2_rpt = New crCustomView2_rpt
Set Page = CustomView2_rpt

' Page init processing
Call CustomView2_rpt.Page_Init()

' Page main processing
Call CustomView2_rpt.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<% If CustomView2.Export = "" Then %>
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
<% CustomView2_rpt.ShowPageHeader() %>
<% If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg() %>
<% CustomView2_rpt.ShowMessage() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If CustomView2.Export = "" Then %>
<script src="rptjs/popup.js" type="text/javascript"></script>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
</script>
<% End If %>
<% If CustomView2.Export = "" Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<%= CustomView2.TableCaption %>
<% If CustomView2.Export = "" Then %>
&nbsp;&nbsp;<a href="<%= CustomView2_rpt.ExportExcelUrl %>"><%= ReportLanguage.Phrase("ExportToExcel") %></a>
<% End If %>
<br><br>
<% If CustomView2.Export = "" Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspreportmaker">
	<!-- Left slot -->
<% End If %>
<% If CustomView2.Export = "" Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<% If CustomView2.Export = "" Then %>
<div class="ewGridUpperPanel">
<form action="CustomView2rpt.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(CustomView2_rpt.StartGrp, CustomView2_rpt.DisplayGrps, CustomView2_rpt.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="CustomView2rpt.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="CustomView2rpt.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="CustomView2rpt.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="CustomView2rpt.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If CustomView2_rpt.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If CustomView2_rpt.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("RecordsPerPage") %>&nbsp;
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="40"<% If CustomView2_rpt.DisplayGrps = 40 Then Response.Write " selected=""selected""" %>>40</option>
</select>
		</span></td>
<% End If %>
	</tr>
</table>
</form>
</div>
<% End If %>
<!-- Report Grid (Begin) -->
<div class="ewGridMiddlePanel">
<table class="ewTable ewTableSeparate" cellspacing="0">
<%

' Set the last group to display if not export all
If (CustomView2.ExportAll And CustomView2.Export <> "") Then
	CustomView2_rpt.StopGrp = CustomView2_rpt.TotalGrps
Else
	CustomView2_rpt.StopGrp = CustomView2_rpt.StartGrp + CustomView2_rpt.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(CustomView2_rpt.StopGrp) > CLng(CustomView2_rpt.TotalGrps) Then
	CustomView2_rpt.StopGrp = CustomView2_rpt.TotalGrps
End If
CustomView2_rpt.RecCount = 0

' Init Summary Values
Call CustomView2_rpt.ResetLevelSummary(0)

' Get first row
If CustomView2_rpt.TotalGrps > 0 Then
	Call CustomView2_rpt.GetRow(1)
	CustomView2_rpt.GrpCount = 1
End If
Do While (Not rs.Eof And CustomView2_rpt.GrpCount <= CustomView2_rpt.DisplayGrps) Or (CustomView2_rpt.ShowFirstHeader)

	' Show Header
	If CustomView2_rpt.ShowFirstHeader Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.RUT.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.RUT) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.RUT.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.RUT) %>',0);"><%= CustomView2.RUT.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.RUT.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.RUT.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.CODCARPR.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.CODCARPR) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.CODCARPR.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.CODCARPR) %>',0);"><%= CustomView2.CODCARPR.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.CODCARPR.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.CODCARPR.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.JORNADA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.JORNADA) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.JORNADA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.JORNADA) %>',0);"><%= CustomView2.JORNADA.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.JORNADA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.JORNADA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.NOMBRE_C.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.NOMBRE_C) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.NOMBRE_C.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.NOMBRE_C) %>',0);"><%= CustomView2.NOMBRE_C.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.NOMBRE_C.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.NOMBRE_C.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.ESTACAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.ESTACAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.ESTACAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.ESTACAD) %>',0);"><%= CustomView2.ESTACAD.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.ESTACAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.ESTACAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.DESCRIPCION.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.DESCRIPCION) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.DESCRIPCION.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.DESCRIPCION) %>',0);"><%= CustomView2.DESCRIPCION.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.DESCRIPCION.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.DESCRIPCION.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.DIG.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.DIG) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.DIG.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.DIG) %>',0);"><%= CustomView2.DIG.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.DIG.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.DIG.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.PATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.PATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.PATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.PATERNO) %>',0);"><%= CustomView2.PATERNO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.PATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.PATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.MATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.MATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.MATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.MATERNO) %>',0);"><%= CustomView2.MATERNO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.MATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.MATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.NOMBRE.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.NOMBRE) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.NOMBRE.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.NOMBRE) %>',0);"><%= CustomView2.NOMBRE.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.NOMBRE.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.NOMBRE.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.ANO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.ANO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.ANO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.ANO) %>',0);"><%= CustomView2.ANO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.ANO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.ANO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.ESRETIRO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.ESRETIRO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.ESRETIRO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.ESRETIRO) %>',0);"><%= CustomView2.ESRETIRO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.ESRETIRO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.ESRETIRO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.TIPOCARR.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.TIPOCARR) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.TIPOCARR.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.TIPOCARR) %>',0);"><%= CustomView2.TIPOCARR.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.TIPOCARR.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.TIPOCARR.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.CAMBIOCARRERA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.CAMBIOCARRERA) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.CAMBIOCARRERA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.CAMBIOCARRERA) %>',0);"><%= CustomView2.CAMBIOCARRERA.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.CAMBIOCARRERA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.CAMBIOCARRERA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.REINCORPORA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.REINCORPORA) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.REINCORPORA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.REINCORPORA) %>',0);"><%= CustomView2.REINCORPORA.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.REINCORPORA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.REINCORPORA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.OTORGATITULO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.OTORGATITULO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.OTORGATITULO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.OTORGATITULO) %>',0);"><%= CustomView2.OTORGATITULO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.OTORGATITULO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.OTORGATITULO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.CONCEPTO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.CONCEPTO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.CONCEPTO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.CONCEPTO) %>',0);"><%= CustomView2.CONCEPTO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.CONCEPTO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.CONCEPTO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.SEXO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.SEXO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.SEXO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.SEXO) %>',0);"><%= CustomView2.SEXO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.SEXO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.SEXO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView2.Export <> "" Then %>
<%= CustomView2.NACIONALIDAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView2.SortUrl(CustomView2.NACIONALIDAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView2.NACIONALIDAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView2.SortUrl(CustomView2.NACIONALIDAD) %>',0);"><%= CustomView2.NACIONALIDAD.FldCaption %></td><td style="width: 10px;">
		<% If CustomView2.NACIONALIDAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView2.NACIONALIDAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		CustomView2_rpt.ShowFirstHeader = False
	End If
	CustomView2_rpt.RecCount = CustomView2_rpt.RecCount + 1

		' Render detail row
		Call CustomView2.ResetCSS()
		CustomView2.RowType = EWRPT_ROWTYPE_DETAIL
		Call CustomView2_rpt.RenderRow()
%>
	<tr<%= CustomView2.RowAttributes %>>
		<td<%= CustomView2.RUT.CellAttributes %>>
<div<%= CustomView2.RUT.ViewAttributes %>><%= CustomView2.RUT.ListViewValue %></div>
</td>
		<td<%= CustomView2.CODCARPR.CellAttributes %>>
<div<%= CustomView2.CODCARPR.ViewAttributes %>><%= CustomView2.CODCARPR.ListViewValue %></div>
</td>
		<td<%= CustomView2.JORNADA.CellAttributes %>>
<div<%= CustomView2.JORNADA.ViewAttributes %>><%= CustomView2.JORNADA.ListViewValue %></div>
</td>
		<td<%= CustomView2.NOMBRE_C.CellAttributes %>>
<div<%= CustomView2.NOMBRE_C.ViewAttributes %>><%= CustomView2.NOMBRE_C.ListViewValue %></div>
</td>
		<td<%= CustomView2.ESTACAD.CellAttributes %>>
<div<%= CustomView2.ESTACAD.ViewAttributes %>><%= CustomView2.ESTACAD.ListViewValue %></div>
</td>
		<td<%= CustomView2.DESCRIPCION.CellAttributes %>>
<div<%= CustomView2.DESCRIPCION.ViewAttributes %>><%= CustomView2.DESCRIPCION.ListViewValue %></div>
</td>
		<td<%= CustomView2.DIG.CellAttributes %>>
<div<%= CustomView2.DIG.ViewAttributes %>><%= CustomView2.DIG.ListViewValue %></div>
</td>
		<td<%= CustomView2.PATERNO.CellAttributes %>>
<div<%= CustomView2.PATERNO.ViewAttributes %>><%= CustomView2.PATERNO.ListViewValue %></div>
</td>
		<td<%= CustomView2.MATERNO.CellAttributes %>>
<div<%= CustomView2.MATERNO.ViewAttributes %>><%= CustomView2.MATERNO.ListViewValue %></div>
</td>
		<td<%= CustomView2.NOMBRE.CellAttributes %>>
<div<%= CustomView2.NOMBRE.ViewAttributes %>><%= CustomView2.NOMBRE.ListViewValue %></div>
</td>
		<td<%= CustomView2.ANO.CellAttributes %>>
<div<%= CustomView2.ANO.ViewAttributes %>><%= CustomView2.ANO.ListViewValue %></div>
</td>
		<td<%= CustomView2.ESRETIRO.CellAttributes %>>
<div<%= CustomView2.ESRETIRO.ViewAttributes %>><%= CustomView2.ESRETIRO.ListViewValue %></div>
</td>
		<td<%= CustomView2.TIPOCARR.CellAttributes %>>
<div<%= CustomView2.TIPOCARR.ViewAttributes %>><%= CustomView2.TIPOCARR.ListViewValue %></div>
</td>
		<td<%= CustomView2.CAMBIOCARRERA.CellAttributes %>>
<div<%= CustomView2.CAMBIOCARRERA.ViewAttributes %>><%= CustomView2.CAMBIOCARRERA.ListViewValue %></div>
</td>
		<td<%= CustomView2.REINCORPORA.CellAttributes %>>
<div<%= CustomView2.REINCORPORA.ViewAttributes %>><%= CustomView2.REINCORPORA.ListViewValue %></div>
</td>
		<td<%= CustomView2.OTORGATITULO.CellAttributes %>>
<div<%= CustomView2.OTORGATITULO.ViewAttributes %>><%= CustomView2.OTORGATITULO.ListViewValue %></div>
</td>
		<td<%= CustomView2.CONCEPTO.CellAttributes %>>
<div<%= CustomView2.CONCEPTO.ViewAttributes %>><%= CustomView2.CONCEPTO.ListViewValue %></div>
</td>
		<td<%= CustomView2.SEXO.CellAttributes %>>
<div<%= CustomView2.SEXO.ViewAttributes %>><%= CustomView2.SEXO.ListViewValue %></div>
</td>
		<td<%= CustomView2.NACIONALIDAD.CellAttributes %>>
<div<%= CustomView2.NACIONALIDAD.ViewAttributes %>><%= CustomView2.NACIONALIDAD.ListViewValue %></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Call CustomView2_rpt.AccumulateSummary()

		' Get next record
		Call CustomView2_rpt.GetRow(2)
		CustomView2_rpt.GrpCount = CustomView2_rpt.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
	</tfoot>
</table>
</div>
<% If CustomView2_rpt.TotalGrps > 0 Then %>
<% If CustomView2.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="CustomView2rpt.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(CustomView2_rpt.StartGrp, CustomView2_rpt.DisplayGrps, CustomView2_rpt.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="CustomView2rpt.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="CustomView2rpt.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="CustomView2rpt.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="CustomView2rpt.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If CustomView2_rpt.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If CustomView2_rpt.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("RecordsPerPage") %>&nbsp;
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="40"<% If CustomView2_rpt.DisplayGrps = 40 Then Response.Write " selected=""selected""" %>>40</option>
</select>
		</span></td>
<% End If %>
	</tr>
</table>
</form>
</div>
<% End If %>
<% End If %>
</td></tr></table>
</div>
<!-- Summary Report Ends -->
<% If CustomView2.Export = "" Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspreportmaker">
	<!-- Right slot -->
<% End If %>
<% If CustomView2.Export = "" Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If CustomView2.Export = "" Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% CustomView2_rpt.ShowPageFooter() %>
<%

' Close recordset and connection
rs.Close
Set rs = Nothing
%>
<% If CustomView2.Export = "" Then %>
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
Set CustomView2_rpt = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crCustomView2_rpt

	' Page ID
	Public Property Get PageID()
		PageID = "rpt"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "CustomView2"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "CustomView2_rpt"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If CustomView2.UseTokenInUrl Then PageUrl = PageUrl & "t=" & CustomView2.TableVar & "&" ' add page token
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
		If CustomView2.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (CustomView2.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (CustomView2.TableVar = Request.QueryString("t"))
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
		Set CustomView2 = New crCustomView2

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "rpt"

		' Initialize table name
		EWRPT_TABLE_NAME = "CustomView2"

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
			CustomView2.Export = Request.QueryString("export")
		End If
		gsExport = CustomView2.Export ' Get export parameter, used in header
		gsExportFile = CustomView2.TableVar ' Get export file, used in header
		If CustomView2.Export = "excel" Then
			Response.ContentType = "application/vnd.ms-excel"
			Response.AddHeader "Content-Disposition", "attachment; filename=" & gsExportFile & ".xls"
		End If

		' Global page loading event
		Call Page_Loading()

		' Page load event
		Call Page_Load()

		' Export to Email (Load content via XMLHttp)
		If CustomView2.Export = "email" Then
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

		'wrkstr = "&filter=" & CustomView2.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(CustomView2.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(CustomView2.StartGroup&""))
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
			CustomView2.OrderBy = GetQSValue(QS, "o")
			CustomView2.StartGroup = GetQSValue(QS, "s")
			CustomView2.RestoreSession = True
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
		Set CustomView2 = Nothing

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
		DisplayGrps = 40 ' Groups per page
		GrpRange = 10

		' Clear field for ext filter
		ClearExtFilter = ""

		' Filter
		UserIDFilter = ""
		Filter = ""

		' 1st dimension = no of groups (level 0 used for grand total)
		' 2nd dimension = no of fields

		Dim nDtls, nGrps
		nDtls = 19
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
		Col(13) = False
		Col(14) = False
		Col(15) = False
		Col(16) = False
		Col(17) = False
		Col(18) = False
		Col(19) = False

		' Set up groups per page dynamically
		SetUpDisplayGrps()

		' Set up popup filter
		Call SetupPopup()

		' Extended filter
		Dim sExtendedFilter
		sExtendedFilter = ""

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

		' No filter
		FilterApplied = False

		' Get sort
		Sort = GetSort()

		' Restore filter/sort from Session
		If CustomView2.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total count
		Dim sSql
		sSql = ewrpt_BuildReportSql(CustomView2.SqlSelect, CustomView2.SqlWhere, CustomView2.SqlGroupBy, CustomView2.SqlHaving, CustomView2.SqlOrderBy, Filter, Sort)
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

		If CustomView2.ExportAll And CustomView2.Export <> "" Then
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
			CustomView2.RUT.DbValue = ewrpt_GetValue(rs("RUT"))
			CustomView2.CODCARPR.DbValue = ewrpt_GetValue(rs("CODCARPR"))
			CustomView2.JORNADA.DbValue = ewrpt_GetValue(rs("JORNADA"))
			CustomView2.NOMBRE_C.DbValue = ewrpt_GetValue(rs("NOMBRE_C"))
			CustomView2.ESTACAD.DbValue = ewrpt_GetValue(rs("ESTACAD"))
			CustomView2.DESCRIPCION.DbValue = ewrpt_GetValue(rs("DESCRIPCION"))
			CustomView2.DIG.DbValue = ewrpt_GetValue(rs("DIG"))
			CustomView2.PATERNO.DbValue = ewrpt_GetValue(rs("PATERNO"))
			CustomView2.MATERNO.DbValue = ewrpt_GetValue(rs("MATERNO"))
			CustomView2.NOMBRE.DbValue = ewrpt_GetValue(rs("NOMBRE"))
			CustomView2.ANO.DbValue = ewrpt_GetValue(rs("ANO"))
			CustomView2.ESRETIRO.DbValue = ewrpt_GetValue(rs("ESRETIRO"))
			CustomView2.TIPOCARR.DbValue = ewrpt_GetValue(rs("TIPOCARR"))
			CustomView2.CAMBIOCARRERA.DbValue = ewrpt_GetValue(rs("CAMBIOCARRERA"))
			CustomView2.REINCORPORA.DbValue = ewrpt_GetValue(rs("REINCORPORA"))
			CustomView2.OTORGATITULO.DbValue = ewrpt_GetValue(rs("OTORGATITULO"))
			CustomView2.CONCEPTO.DbValue = ewrpt_GetValue(rs("CONCEPTO"))
			CustomView2.SEXO.DbValue = ewrpt_GetValue(rs("SEXO"))
			CustomView2.NACIONALIDAD.DbValue = ewrpt_GetValue(rs("NACIONALIDAD"))
			Val(1) = CustomView2.RUT.CurrentValue
			Val(2) = CustomView2.CODCARPR.CurrentValue
			Val(3) = CustomView2.JORNADA.CurrentValue
			Val(4) = CustomView2.NOMBRE_C.CurrentValue
			Val(5) = CustomView2.ESTACAD.CurrentValue
			Val(6) = CustomView2.DESCRIPCION.CurrentValue
			Val(7) = CustomView2.DIG.CurrentValue
			Val(8) = CustomView2.PATERNO.CurrentValue
			Val(9) = CustomView2.MATERNO.CurrentValue
			Val(10) = CustomView2.NOMBRE.CurrentValue
			Val(11) = CustomView2.ANO.CurrentValue
			Val(12) = CustomView2.ESRETIRO.CurrentValue
			Val(13) = CustomView2.TIPOCARR.CurrentValue
			Val(14) = CustomView2.CAMBIOCARRERA.CurrentValue
			Val(15) = CustomView2.REINCORPORA.CurrentValue
			Val(16) = CustomView2.OTORGATITULO.CurrentValue
			Val(17) = CustomView2.CONCEPTO.CurrentValue
			Val(18) = CustomView2.SEXO.CurrentValue
			Val(19) = CustomView2.NACIONALIDAD.CurrentValue
		Else
			CustomView2.RUT.DbValue = ""
			CustomView2.CODCARPR.DbValue = ""
			CustomView2.JORNADA.DbValue = ""
			CustomView2.NOMBRE_C.DbValue = ""
			CustomView2.ESTACAD.DbValue = ""
			CustomView2.DESCRIPCION.DbValue = ""
			CustomView2.DIG.DbValue = ""
			CustomView2.PATERNO.DbValue = ""
			CustomView2.MATERNO.DbValue = ""
			CustomView2.NOMBRE.DbValue = ""
			CustomView2.ANO.DbValue = ""
			CustomView2.ESRETIRO.DbValue = ""
			CustomView2.TIPOCARR.DbValue = ""
			CustomView2.CAMBIOCARRERA.DbValue = ""
			CustomView2.REINCORPORA.DbValue = ""
			CustomView2.OTORGATITULO.DbValue = ""
			CustomView2.CONCEPTO.DbValue = ""
			CustomView2.SEXO.DbValue = ""
			CustomView2.NACIONALIDAD.DbValue = ""
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
			CustomView2.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				CustomView2.StartGroup = nStartGrp
			Else
				StartGrp = CustomView2.StartGroup
			End If
		Else
			StartGrp = CustomView2.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			CustomView2.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			CustomView2.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			CustomView2.StartGroup = StartGrp
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
		CustomView2.StartGroup = StartGrp
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
					DisplayGrps = 40 ' Non-numeric, Load Default
				End If
			End If
			CustomView2.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			CustomView2.StartGroup = nStartGrp
		Else
			If CustomView2.GroupPerPage <> "" Then
				DisplayGrps = CustomView2.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 40 ' Load Default
			End If
		End If
	End Sub

	' Render row
	Sub RenderRow()
		If CustomView2.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' Get total count from sql directly
			Dim sSql, rstot
			sSql = ewrpt_BuildReportSql(CustomView2.SqlSelectCount, CustomView2.SqlWhere, CustomView2SqlGroupBy, CustomView2.SqlHaving, "", Filter, "")
			If EWRPT_DEBUG_ENABLED Then Response.Write "(Total SQL): " & sSql & "<br>"
			Set rstot = ewrpt_LoadRs(sSql)
			If Not rstot.Eof Then
				TotCount = ewrpt_GetValue(rstot(0))
			Else
				TotCount = 0
			End If
		End If

		' Call Row_Rendering event
		Call CustomView2.Row_Rendering()

		' --------------------
		'  Render view codes
		' --------------------

		If CustomView2.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' RUT
			CustomView2.RUT.ViewValue = CustomView2.RUT.Summary

			' CODCARPR
			CustomView2.CODCARPR.ViewValue = CustomView2.CODCARPR.Summary

			' JORNADA
			CustomView2.JORNADA.ViewValue = CustomView2.JORNADA.Summary

			' NOMBRE_C
			CustomView2.NOMBRE_C.ViewValue = CustomView2.NOMBRE_C.Summary

			' ESTACAD
			CustomView2.ESTACAD.ViewValue = CustomView2.ESTACAD.Summary

			' DESCRIPCION
			CustomView2.DESCRIPCION.ViewValue = CustomView2.DESCRIPCION.Summary

			' DIG
			CustomView2.DIG.ViewValue = CustomView2.DIG.Summary

			' PATERNO
			CustomView2.PATERNO.ViewValue = CustomView2.PATERNO.Summary

			' MATERNO
			CustomView2.MATERNO.ViewValue = CustomView2.MATERNO.Summary

			' NOMBRE
			CustomView2.NOMBRE.ViewValue = CustomView2.NOMBRE.Summary

			' ANO
			CustomView2.ANO.ViewValue = CustomView2.ANO.Summary

			' ESRETIRO
			CustomView2.ESRETIRO.ViewValue = CustomView2.ESRETIRO.Summary

			' TIPOCARR
			CustomView2.TIPOCARR.ViewValue = CustomView2.TIPOCARR.Summary

			' CAMBIOCARRERA
			CustomView2.CAMBIOCARRERA.ViewValue = CustomView2.CAMBIOCARRERA.Summary

			' REINCORPORA
			CustomView2.REINCORPORA.ViewValue = CustomView2.REINCORPORA.Summary

			' OTORGATITULO
			CustomView2.OTORGATITULO.ViewValue = CustomView2.OTORGATITULO.Summary

			' CONCEPTO
			CustomView2.CONCEPTO.ViewValue = CustomView2.CONCEPTO.Summary

			' SEXO
			CustomView2.SEXO.ViewValue = CustomView2.SEXO.Summary

			' NACIONALIDAD
			CustomView2.NACIONALIDAD.ViewValue = CustomView2.NACIONALIDAD.Summary
		Else

			' RUT
			CustomView2.RUT.ViewValue = CustomView2.RUT.CurrentValue
			Call ewrpt_SetAttr(CustomView2.RUT.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CODCARPR
			CustomView2.CODCARPR.ViewValue = CustomView2.CODCARPR.CurrentValue
			Call ewrpt_SetAttr(CustomView2.CODCARPR.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' JORNADA
			CustomView2.JORNADA.ViewValue = CustomView2.JORNADA.CurrentValue
			Call ewrpt_SetAttr(CustomView2.JORNADA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE_C
			CustomView2.NOMBRE_C.ViewValue = CustomView2.NOMBRE_C.CurrentValue
			Call ewrpt_SetAttr(CustomView2.NOMBRE_C.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ESTACAD
			CustomView2.ESTACAD.ViewValue = CustomView2.ESTACAD.CurrentValue
			Call ewrpt_SetAttr(CustomView2.ESTACAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' DESCRIPCION
			CustomView2.DESCRIPCION.ViewValue = CustomView2.DESCRIPCION.CurrentValue
			Call ewrpt_SetAttr(CustomView2.DESCRIPCION.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' DIG
			CustomView2.DIG.ViewValue = CustomView2.DIG.CurrentValue
			Call ewrpt_SetAttr(CustomView2.DIG.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PATERNO
			CustomView2.PATERNO.ViewValue = CustomView2.PATERNO.CurrentValue
			Call ewrpt_SetAttr(CustomView2.PATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' MATERNO
			CustomView2.MATERNO.ViewValue = CustomView2.MATERNO.CurrentValue
			Call ewrpt_SetAttr(CustomView2.MATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE
			CustomView2.NOMBRE.ViewValue = CustomView2.NOMBRE.CurrentValue
			Call ewrpt_SetAttr(CustomView2.NOMBRE.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ANO
			CustomView2.ANO.ViewValue = CustomView2.ANO.CurrentValue
			Call ewrpt_SetAttr(CustomView2.ANO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ESRETIRO
			CustomView2.ESRETIRO.ViewValue = CustomView2.ESRETIRO.CurrentValue
			Call ewrpt_SetAttr(CustomView2.ESRETIRO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' TIPOCARR
			CustomView2.TIPOCARR.ViewValue = CustomView2.TIPOCARR.CurrentValue
			Call ewrpt_SetAttr(CustomView2.TIPOCARR.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CAMBIOCARRERA
			CustomView2.CAMBIOCARRERA.ViewValue = CustomView2.CAMBIOCARRERA.CurrentValue
			Call ewrpt_SetAttr(CustomView2.CAMBIOCARRERA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' REINCORPORA
			CustomView2.REINCORPORA.ViewValue = CustomView2.REINCORPORA.CurrentValue
			Call ewrpt_SetAttr(CustomView2.REINCORPORA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' OTORGATITULO
			CustomView2.OTORGATITULO.ViewValue = CustomView2.OTORGATITULO.CurrentValue
			Call ewrpt_SetAttr(CustomView2.OTORGATITULO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CONCEPTO
			CustomView2.CONCEPTO.ViewValue = CustomView2.CONCEPTO.CurrentValue
			Call ewrpt_SetAttr(CustomView2.CONCEPTO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' SEXO
			CustomView2.SEXO.ViewValue = CustomView2.SEXO.CurrentValue
			Call ewrpt_SetAttr(CustomView2.SEXO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NACIONALIDAD
			CustomView2.NACIONALIDAD.ViewValue = CustomView2.NACIONALIDAD.CurrentValue
			Call ewrpt_SetAttr(CustomView2.NACIONALIDAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))
		End If

		' RUT
		CustomView2.RUT.HrefValue = ""

		' CODCARPR
		CustomView2.CODCARPR.HrefValue = ""

		' JORNADA
		CustomView2.JORNADA.HrefValue = ""

		' NOMBRE_C
		CustomView2.NOMBRE_C.HrefValue = ""

		' ESTACAD
		CustomView2.ESTACAD.HrefValue = ""

		' DESCRIPCION
		CustomView2.DESCRIPCION.HrefValue = ""

		' DIG
		CustomView2.DIG.HrefValue = ""

		' PATERNO
		CustomView2.PATERNO.HrefValue = ""

		' MATERNO
		CustomView2.MATERNO.HrefValue = ""

		' NOMBRE
		CustomView2.NOMBRE.HrefValue = ""

		' ANO
		CustomView2.ANO.HrefValue = ""

		' ESRETIRO
		CustomView2.ESRETIRO.HrefValue = ""

		' TIPOCARR
		CustomView2.TIPOCARR.HrefValue = ""

		' CAMBIOCARRERA
		CustomView2.CAMBIOCARRERA.HrefValue = ""

		' REINCORPORA
		CustomView2.REINCORPORA.HrefValue = ""

		' OTORGATITULO
		CustomView2.OTORGATITULO.HrefValue = ""

		' CONCEPTO
		CustomView2.CONCEPTO.HrefValue = ""

		' SEXO
		CustomView2.SEXO.HrefValue = ""

		' NACIONALIDAD
		CustomView2.NACIONALIDAD.HrefValue = ""

		' Call Row_Rendered event
		Call CustomView2.Row_Rendered()
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
				CustomView2.OrderBy = ""
				CustomView2.StartGroup = 1
				CustomView2.RUT.Sort = ""
				CustomView2.CODCARPR.Sort = ""
				CustomView2.JORNADA.Sort = ""
				CustomView2.NOMBRE_C.Sort = ""
				CustomView2.ESTACAD.Sort = ""
				CustomView2.DESCRIPCION.Sort = ""
				CustomView2.DIG.Sort = ""
				CustomView2.PATERNO.Sort = ""
				CustomView2.MATERNO.Sort = ""
				CustomView2.NOMBRE.Sort = ""
				CustomView2.ANO.Sort = ""
				CustomView2.ESRETIRO.Sort = ""
				CustomView2.TIPOCARR.Sort = ""
				CustomView2.CAMBIOCARRERA.Sort = ""
				CustomView2.REINCORPORA.Sort = ""
				CustomView2.OTORGATITULO.Sort = ""
				CustomView2.CONCEPTO.Sort = ""
				CustomView2.SEXO.Sort = ""
				CustomView2.NACIONALIDAD.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			CustomView2.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				CustomView2.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				CustomView2.CurrentOrderType = ""
			End If
			sSortSql = CustomView2.SortSql
			CustomView2.OrderBy = sSortSql
			CustomView2.StartGroup = 1
		End If
		GetSort = CustomView2.OrderBy
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
