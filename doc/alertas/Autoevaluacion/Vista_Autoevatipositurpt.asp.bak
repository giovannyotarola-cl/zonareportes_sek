<!--#include file="rptinc/ewrcfg4.asp"-->
<!--#include file="rptinc/ewrfn4.asp"-->
<!--#include file="rptinc/ewrusrfn.asp"-->
<%

' Variable for table object
Dim Vista_Autoevatipositu

' Define table class
Class crVista_Autoevatipositu
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "Vista_Autoevatipositu"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "Vista_Autoevatipositu"
	End Property

	' Table type
	Public Property Get TableType()
		TableType = "VIEW"
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
			Set m_RUT = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_CODCARPR = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_CODCARPR", "CODCARPR", "[CODCARPR]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_JORNADA = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NOMBRE_C = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_ESTACAD = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_DESCRIPCION = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_DESCRIPCION", "DESCRIPCION", "[DESCRIPCION]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_DIG = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_PATERNO = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_MATERNO = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NOMBRE = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_ANO = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
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
			Set m_ESRETIRO = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_ESRETIRO", "ESRETIRO", "[ESRETIRO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_TIPOCARR = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_TIPOCARR", "TIPOCARR", "[TIPOCARR]", 131, EWRPT_DATATYPE_NUMBER, -1)
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
			Set m_CAMBIOCARRERA = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_CAMBIOCARRERA", "CAMBIOCARRERA", "[CAMBIOCARRERA]", 129, EWRPT_DATATYPE_STRING, -1)
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
			Set m_REINCORPORA = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_REINCORPORA", "REINCORPORA", "[REINCORPORA]", 129, EWRPT_DATATYPE_STRING, -1)
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
			Set m_OTORGATITULO = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_OTORGATITULO", "OTORGATITULO", "[OTORGATITULO]", 129, EWRPT_DATATYPE_STRING, -1)
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
			Set m_CONCEPTO = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_CONCEPTO", "CONCEPTO", "[CONCEPTO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_SEXO = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NACIONALIDAD = NewFldObj("Vista_Autoevatipositu", "Vista_Autoevatipositu", "x_NACIONALIDAD", "NACIONALIDAD", "[NACIONALIDAD]", 200, EWRPT_DATATYPE_STRING, -1)
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
		SqlFrom = "[matricula].[Vista_Autoevatipositu]"
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
Dim Vista_Autoevatipositu_rpt
Set Vista_Autoevatipositu_rpt = New crVista_Autoevatipositu_rpt
Set Page = Vista_Autoevatipositu_rpt

' Page init processing
Call Vista_Autoevatipositu_rpt.Page_Init()

' Page main processing
Call Vista_Autoevatipositu_rpt.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<% If Vista_Autoevatipositu.Export = "" Then %>
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
<% Vista_Autoevatipositu_rpt.ShowPageHeader() %>
<% If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg() %>
<% Vista_Autoevatipositu_rpt.ShowMessage() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If Vista_Autoevatipositu.Export = "" Then %>
<script src="rptjs/popup.js" type="text/javascript"></script>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
</script>
<% End If %>
<% If Vista_Autoevatipositu.Export = "" Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<%= Vista_Autoevatipositu.TableCaption %>
<% If Vista_Autoevatipositu.Export = "" Then %>
&nbsp;&nbsp;<a href="<%= Vista_Autoevatipositu_rpt.ExportExcelUrl %>"><%= ReportLanguage.Phrase("ExportToExcel") %></a>
<% End If %>
<br><br>
<% If Vista_Autoevatipositu.Export = "" Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspreportmaker">
	<!-- Left slot -->
<% End If %>
<% If Vista_Autoevatipositu.Export = "" Then %>
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
<% If Vista_Autoevatipositu.Export = "" Then %>
<div class="ewGridUpperPanel">
<form action="Vista_Autoevatipositurpt.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(Vista_Autoevatipositu_rpt.StartGrp, Vista_Autoevatipositu_rpt.DisplayGrps, Vista_Autoevatipositu_rpt.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="Vista_Autoevatipositurpt.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="Vista_Autoevatipositurpt.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="Vista_Autoevatipositurpt.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="Vista_Autoevatipositurpt.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If Vista_Autoevatipositu_rpt.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If Vista_Autoevatipositu_rpt.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("RecordsPerPage") %>&nbsp;
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="40"<% If Vista_Autoevatipositu_rpt.DisplayGrps = 40 Then Response.Write " selected=""selected""" %>>40</option>
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
If (Vista_Autoevatipositu.ExportAll And Vista_Autoevatipositu.Export <> "") Then
	Vista_Autoevatipositu_rpt.StopGrp = Vista_Autoevatipositu_rpt.TotalGrps
Else
	Vista_Autoevatipositu_rpt.StopGrp = Vista_Autoevatipositu_rpt.StartGrp + Vista_Autoevatipositu_rpt.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(Vista_Autoevatipositu_rpt.StopGrp) > CLng(Vista_Autoevatipositu_rpt.TotalGrps) Then
	Vista_Autoevatipositu_rpt.StopGrp = Vista_Autoevatipositu_rpt.TotalGrps
End If
Vista_Autoevatipositu_rpt.RecCount = 0

' Init Summary Values
Call Vista_Autoevatipositu_rpt.ResetLevelSummary(0)

' Get first row
If Vista_Autoevatipositu_rpt.TotalGrps > 0 Then
	Call Vista_Autoevatipositu_rpt.GetRow(1)
	Vista_Autoevatipositu_rpt.GrpCount = 1
End If
Do While (Not rs.Eof And Vista_Autoevatipositu_rpt.GrpCount <= Vista_Autoevatipositu_rpt.DisplayGrps) Or (Vista_Autoevatipositu_rpt.ShowFirstHeader)

	' Show Header
	If Vista_Autoevatipositu_rpt.ShowFirstHeader Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.RUT.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.RUT) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.RUT.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.RUT) %>',0);"><%= Vista_Autoevatipositu.RUT.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.RUT.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.RUT.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.CODCARPR.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.CODCARPR) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.CODCARPR.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.CODCARPR) %>',0);"><%= Vista_Autoevatipositu.CODCARPR.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.CODCARPR.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.CODCARPR.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.JORNADA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.JORNADA) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.JORNADA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.JORNADA) %>',0);"><%= Vista_Autoevatipositu.JORNADA.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.JORNADA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.JORNADA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.NOMBRE_C.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.NOMBRE_C) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.NOMBRE_C.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.NOMBRE_C) %>',0);"><%= Vista_Autoevatipositu.NOMBRE_C.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.NOMBRE_C.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.NOMBRE_C.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.ESTACAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.ESTACAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.ESTACAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.ESTACAD) %>',0);"><%= Vista_Autoevatipositu.ESTACAD.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.ESTACAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.ESTACAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.DESCRIPCION.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.DESCRIPCION) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.DESCRIPCION.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.DESCRIPCION) %>',0);"><%= Vista_Autoevatipositu.DESCRIPCION.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.DESCRIPCION.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.DESCRIPCION.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.DIG.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.DIG) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.DIG.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.DIG) %>',0);"><%= Vista_Autoevatipositu.DIG.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.DIG.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.DIG.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.PATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.PATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.PATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.PATERNO) %>',0);"><%= Vista_Autoevatipositu.PATERNO.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.PATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.PATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.MATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.MATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.MATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.MATERNO) %>',0);"><%= Vista_Autoevatipositu.MATERNO.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.MATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.MATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.NOMBRE.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.NOMBRE) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.NOMBRE.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.NOMBRE) %>',0);"><%= Vista_Autoevatipositu.NOMBRE.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.NOMBRE.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.NOMBRE.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.ANO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.ANO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.ANO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.ANO) %>',0);"><%= Vista_Autoevatipositu.ANO.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.ANO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.ANO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.ESRETIRO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.ESRETIRO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.ESRETIRO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.ESRETIRO) %>',0);"><%= Vista_Autoevatipositu.ESRETIRO.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.ESRETIRO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.ESRETIRO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.TIPOCARR.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.TIPOCARR) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.TIPOCARR.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.TIPOCARR) %>',0);"><%= Vista_Autoevatipositu.TIPOCARR.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.TIPOCARR.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.TIPOCARR.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.CAMBIOCARRERA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.CAMBIOCARRERA) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.CAMBIOCARRERA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.CAMBIOCARRERA) %>',0);"><%= Vista_Autoevatipositu.CAMBIOCARRERA.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.CAMBIOCARRERA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.CAMBIOCARRERA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.REINCORPORA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.REINCORPORA) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.REINCORPORA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.REINCORPORA) %>',0);"><%= Vista_Autoevatipositu.REINCORPORA.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.REINCORPORA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.REINCORPORA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.OTORGATITULO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.OTORGATITULO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.OTORGATITULO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.OTORGATITULO) %>',0);"><%= Vista_Autoevatipositu.OTORGATITULO.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.OTORGATITULO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.OTORGATITULO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.CONCEPTO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.CONCEPTO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.CONCEPTO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.CONCEPTO) %>',0);"><%= Vista_Autoevatipositu.CONCEPTO.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.CONCEPTO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.CONCEPTO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.SEXO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.SEXO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.SEXO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.SEXO) %>',0);"><%= Vista_Autoevatipositu.SEXO.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.SEXO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.SEXO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Vista_Autoevatipositu.Export <> "" Then %>
<%= Vista_Autoevatipositu.NACIONALIDAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.NACIONALIDAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= Vista_Autoevatipositu.NACIONALIDAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Vista_Autoevatipositu.SortUrl(Vista_Autoevatipositu.NACIONALIDAD) %>',0);"><%= Vista_Autoevatipositu.NACIONALIDAD.FldCaption %></td><td style="width: 10px;">
		<% If Vista_Autoevatipositu.NACIONALIDAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Vista_Autoevatipositu.NACIONALIDAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Vista_Autoevatipositu_rpt.ShowFirstHeader = False
	End If
	Vista_Autoevatipositu_rpt.RecCount = Vista_Autoevatipositu_rpt.RecCount + 1

		' Render detail row
		Call Vista_Autoevatipositu.ResetCSS()
		Vista_Autoevatipositu.RowType = EWRPT_ROWTYPE_DETAIL
		Call Vista_Autoevatipositu_rpt.RenderRow()
%>
	<tr<%= Vista_Autoevatipositu.RowAttributes %>>
		<td<%= Vista_Autoevatipositu.RUT.CellAttributes %>>
<div<%= Vista_Autoevatipositu.RUT.ViewAttributes %>><%= Vista_Autoevatipositu.RUT.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.CODCARPR.CellAttributes %>>
<div<%= Vista_Autoevatipositu.CODCARPR.ViewAttributes %>><%= Vista_Autoevatipositu.CODCARPR.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.JORNADA.CellAttributes %>>
<div<%= Vista_Autoevatipositu.JORNADA.ViewAttributes %>><%= Vista_Autoevatipositu.JORNADA.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.NOMBRE_C.CellAttributes %>>
<div<%= Vista_Autoevatipositu.NOMBRE_C.ViewAttributes %>><%= Vista_Autoevatipositu.NOMBRE_C.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.ESTACAD.CellAttributes %>>
<div<%= Vista_Autoevatipositu.ESTACAD.ViewAttributes %>><%= Vista_Autoevatipositu.ESTACAD.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.DESCRIPCION.CellAttributes %>>
<div<%= Vista_Autoevatipositu.DESCRIPCION.ViewAttributes %>><%= Vista_Autoevatipositu.DESCRIPCION.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.DIG.CellAttributes %>>
<div<%= Vista_Autoevatipositu.DIG.ViewAttributes %>><%= Vista_Autoevatipositu.DIG.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.PATERNO.CellAttributes %>>
<div<%= Vista_Autoevatipositu.PATERNO.ViewAttributes %>><%= Vista_Autoevatipositu.PATERNO.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.MATERNO.CellAttributes %>>
<div<%= Vista_Autoevatipositu.MATERNO.ViewAttributes %>><%= Vista_Autoevatipositu.MATERNO.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.NOMBRE.CellAttributes %>>
<div<%= Vista_Autoevatipositu.NOMBRE.ViewAttributes %>><%= Vista_Autoevatipositu.NOMBRE.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.ANO.CellAttributes %>>
<div<%= Vista_Autoevatipositu.ANO.ViewAttributes %>><%= Vista_Autoevatipositu.ANO.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.ESRETIRO.CellAttributes %>>
<div<%= Vista_Autoevatipositu.ESRETIRO.ViewAttributes %>><%= Vista_Autoevatipositu.ESRETIRO.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.TIPOCARR.CellAttributes %>>
<div<%= Vista_Autoevatipositu.TIPOCARR.ViewAttributes %>><%= Vista_Autoevatipositu.TIPOCARR.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.CAMBIOCARRERA.CellAttributes %>>
<div<%= Vista_Autoevatipositu.CAMBIOCARRERA.ViewAttributes %>><%= Vista_Autoevatipositu.CAMBIOCARRERA.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.REINCORPORA.CellAttributes %>>
<div<%= Vista_Autoevatipositu.REINCORPORA.ViewAttributes %>><%= Vista_Autoevatipositu.REINCORPORA.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.OTORGATITULO.CellAttributes %>>
<div<%= Vista_Autoevatipositu.OTORGATITULO.ViewAttributes %>><%= Vista_Autoevatipositu.OTORGATITULO.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.CONCEPTO.CellAttributes %>>
<div<%= Vista_Autoevatipositu.CONCEPTO.ViewAttributes %>><%= Vista_Autoevatipositu.CONCEPTO.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.SEXO.CellAttributes %>>
<div<%= Vista_Autoevatipositu.SEXO.ViewAttributes %>><%= Vista_Autoevatipositu.SEXO.ListViewValue %></div>
</td>
		<td<%= Vista_Autoevatipositu.NACIONALIDAD.CellAttributes %>>
<div<%= Vista_Autoevatipositu.NACIONALIDAD.ViewAttributes %>><%= Vista_Autoevatipositu.NACIONALIDAD.ListViewValue %></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Call Vista_Autoevatipositu_rpt.AccumulateSummary()

		' Get next record
		Call Vista_Autoevatipositu_rpt.GetRow(2)
		Vista_Autoevatipositu_rpt.GrpCount = Vista_Autoevatipositu_rpt.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
	</tfoot>
</table>
</div>
<% If Vista_Autoevatipositu_rpt.TotalGrps > 0 Then %>
<% If Vista_Autoevatipositu.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="Vista_Autoevatipositurpt.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(Vista_Autoevatipositu_rpt.StartGrp, Vista_Autoevatipositu_rpt.DisplayGrps, Vista_Autoevatipositu_rpt.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="Vista_Autoevatipositurpt.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="Vista_Autoevatipositurpt.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="Vista_Autoevatipositurpt.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="Vista_Autoevatipositurpt.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If Vista_Autoevatipositu_rpt.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If Vista_Autoevatipositu_rpt.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("RecordsPerPage") %>&nbsp;
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="40"<% If Vista_Autoevatipositu_rpt.DisplayGrps = 40 Then Response.Write " selected=""selected""" %>>40</option>
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
<% If Vista_Autoevatipositu.Export = "" Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspreportmaker">
	<!-- Right slot -->
<% End If %>
<% If Vista_Autoevatipositu.Export = "" Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If Vista_Autoevatipositu.Export = "" Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Vista_Autoevatipositu_rpt.ShowPageFooter() %>
<%

' Close recordset and connection
rs.Close
Set rs = Nothing
%>
<% If Vista_Autoevatipositu.Export = "" Then %>
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
Set Vista_Autoevatipositu_rpt = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crVista_Autoevatipositu_rpt

	' Page ID
	Public Property Get PageID()
		PageID = "rpt"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "Vista_Autoevatipositu"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "Vista_Autoevatipositu_rpt"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If Vista_Autoevatipositu.UseTokenInUrl Then PageUrl = PageUrl & "t=" & Vista_Autoevatipositu.TableVar & "&" ' add page token
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
		If Vista_Autoevatipositu.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (Vista_Autoevatipositu.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (Vista_Autoevatipositu.TableVar = Request.QueryString("t"))
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
		Set Vista_Autoevatipositu = New crVista_Autoevatipositu

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "rpt"

		' Initialize table name
		EWRPT_TABLE_NAME = "Vista_Autoevatipositu"

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
			Vista_Autoevatipositu.Export = Request.QueryString("export")
		End If
		gsExport = Vista_Autoevatipositu.Export ' Get export parameter, used in header
		gsExportFile = Vista_Autoevatipositu.TableVar ' Get export file, used in header
		If Vista_Autoevatipositu.Export = "excel" Then
			Response.ContentType = "application/vnd.ms-excel"
			Response.AddHeader "Content-Disposition", "attachment; filename=" & gsExportFile & ".xls"
		End If

		' Global page loading event
		Call Page_Loading()

		' Page load event
		Call Page_Load()

		' Export to Email (Load content via XMLHttp)
		If Vista_Autoevatipositu.Export = "email" Then
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

		'wrkstr = "&filter=" & Vista_Autoevatipositu.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(Vista_Autoevatipositu.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(Vista_Autoevatipositu.StartGroup&""))
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
			Vista_Autoevatipositu.OrderBy = GetQSValue(QS, "o")
			Vista_Autoevatipositu.StartGroup = GetQSValue(QS, "s")
			Vista_Autoevatipositu.RestoreSession = True
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
		Set Vista_Autoevatipositu = Nothing

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
		If Vista_Autoevatipositu.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total count
		Dim sSql
		sSql = ewrpt_BuildReportSql(Vista_Autoevatipositu.SqlSelect, Vista_Autoevatipositu.SqlWhere, Vista_Autoevatipositu.SqlGroupBy, Vista_Autoevatipositu.SqlHaving, Vista_Autoevatipositu.SqlOrderBy, Filter, Sort)
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

		If Vista_Autoevatipositu.ExportAll And Vista_Autoevatipositu.Export <> "" Then
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
			Vista_Autoevatipositu.RUT.DbValue = ewrpt_GetValue(rs("RUT"))
			Vista_Autoevatipositu.CODCARPR.DbValue = ewrpt_GetValue(rs("CODCARPR"))
			Vista_Autoevatipositu.JORNADA.DbValue = ewrpt_GetValue(rs("JORNADA"))
			Vista_Autoevatipositu.NOMBRE_C.DbValue = ewrpt_GetValue(rs("NOMBRE_C"))
			Vista_Autoevatipositu.ESTACAD.DbValue = ewrpt_GetValue(rs("ESTACAD"))
			Vista_Autoevatipositu.DESCRIPCION.DbValue = ewrpt_GetValue(rs("DESCRIPCION"))
			Vista_Autoevatipositu.DIG.DbValue = ewrpt_GetValue(rs("DIG"))
			Vista_Autoevatipositu.PATERNO.DbValue = ewrpt_GetValue(rs("PATERNO"))
			Vista_Autoevatipositu.MATERNO.DbValue = ewrpt_GetValue(rs("MATERNO"))
			Vista_Autoevatipositu.NOMBRE.DbValue = ewrpt_GetValue(rs("NOMBRE"))
			Vista_Autoevatipositu.ANO.DbValue = ewrpt_GetValue(rs("ANO"))
			Vista_Autoevatipositu.ESRETIRO.DbValue = ewrpt_GetValue(rs("ESRETIRO"))
			Vista_Autoevatipositu.TIPOCARR.DbValue = ewrpt_GetValue(rs("TIPOCARR"))
			Vista_Autoevatipositu.CAMBIOCARRERA.DbValue = ewrpt_GetValue(rs("CAMBIOCARRERA"))
			Vista_Autoevatipositu.REINCORPORA.DbValue = ewrpt_GetValue(rs("REINCORPORA"))
			Vista_Autoevatipositu.OTORGATITULO.DbValue = ewrpt_GetValue(rs("OTORGATITULO"))
			Vista_Autoevatipositu.CONCEPTO.DbValue = ewrpt_GetValue(rs("CONCEPTO"))
			Vista_Autoevatipositu.SEXO.DbValue = ewrpt_GetValue(rs("SEXO"))
			Vista_Autoevatipositu.NACIONALIDAD.DbValue = ewrpt_GetValue(rs("NACIONALIDAD"))
			Val(1) = Vista_Autoevatipositu.RUT.CurrentValue
			Val(2) = Vista_Autoevatipositu.CODCARPR.CurrentValue
			Val(3) = Vista_Autoevatipositu.JORNADA.CurrentValue
			Val(4) = Vista_Autoevatipositu.NOMBRE_C.CurrentValue
			Val(5) = Vista_Autoevatipositu.ESTACAD.CurrentValue
			Val(6) = Vista_Autoevatipositu.DESCRIPCION.CurrentValue
			Val(7) = Vista_Autoevatipositu.DIG.CurrentValue
			Val(8) = Vista_Autoevatipositu.PATERNO.CurrentValue
			Val(9) = Vista_Autoevatipositu.MATERNO.CurrentValue
			Val(10) = Vista_Autoevatipositu.NOMBRE.CurrentValue
			Val(11) = Vista_Autoevatipositu.ANO.CurrentValue
			Val(12) = Vista_Autoevatipositu.ESRETIRO.CurrentValue
			Val(13) = Vista_Autoevatipositu.TIPOCARR.CurrentValue
			Val(14) = Vista_Autoevatipositu.CAMBIOCARRERA.CurrentValue
			Val(15) = Vista_Autoevatipositu.REINCORPORA.CurrentValue
			Val(16) = Vista_Autoevatipositu.OTORGATITULO.CurrentValue
			Val(17) = Vista_Autoevatipositu.CONCEPTO.CurrentValue
			Val(18) = Vista_Autoevatipositu.SEXO.CurrentValue
			Val(19) = Vista_Autoevatipositu.NACIONALIDAD.CurrentValue
		Else
			Vista_Autoevatipositu.RUT.DbValue = ""
			Vista_Autoevatipositu.CODCARPR.DbValue = ""
			Vista_Autoevatipositu.JORNADA.DbValue = ""
			Vista_Autoevatipositu.NOMBRE_C.DbValue = ""
			Vista_Autoevatipositu.ESTACAD.DbValue = ""
			Vista_Autoevatipositu.DESCRIPCION.DbValue = ""
			Vista_Autoevatipositu.DIG.DbValue = ""
			Vista_Autoevatipositu.PATERNO.DbValue = ""
			Vista_Autoevatipositu.MATERNO.DbValue = ""
			Vista_Autoevatipositu.NOMBRE.DbValue = ""
			Vista_Autoevatipositu.ANO.DbValue = ""
			Vista_Autoevatipositu.ESRETIRO.DbValue = ""
			Vista_Autoevatipositu.TIPOCARR.DbValue = ""
			Vista_Autoevatipositu.CAMBIOCARRERA.DbValue = ""
			Vista_Autoevatipositu.REINCORPORA.DbValue = ""
			Vista_Autoevatipositu.OTORGATITULO.DbValue = ""
			Vista_Autoevatipositu.CONCEPTO.DbValue = ""
			Vista_Autoevatipositu.SEXO.DbValue = ""
			Vista_Autoevatipositu.NACIONALIDAD.DbValue = ""
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
			Vista_Autoevatipositu.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				Vista_Autoevatipositu.StartGroup = nStartGrp
			Else
				StartGrp = Vista_Autoevatipositu.StartGroup
			End If
		Else
			StartGrp = Vista_Autoevatipositu.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			Vista_Autoevatipositu.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			Vista_Autoevatipositu.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			Vista_Autoevatipositu.StartGroup = StartGrp
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
		Vista_Autoevatipositu.StartGroup = StartGrp
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
			Vista_Autoevatipositu.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			Vista_Autoevatipositu.StartGroup = nStartGrp
		Else
			If Vista_Autoevatipositu.GroupPerPage <> "" Then
				DisplayGrps = Vista_Autoevatipositu.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 40 ' Load Default
			End If
		End If
	End Sub

	' Render row
	Sub RenderRow()
		If Vista_Autoevatipositu.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' Get total count from sql directly
			Dim sSql, rstot
			sSql = ewrpt_BuildReportSql(Vista_Autoevatipositu.SqlSelectCount, Vista_Autoevatipositu.SqlWhere, Vista_AutoevatiposituSqlGroupBy, Vista_Autoevatipositu.SqlHaving, "", Filter, "")
			If EWRPT_DEBUG_ENABLED Then Response.Write "(Total SQL): " & sSql & "<br>"
			Set rstot = ewrpt_LoadRs(sSql)
			If Not rstot.Eof Then
				TotCount = ewrpt_GetValue(rstot(0))
			Else
				TotCount = 0
			End If
		End If

		' Call Row_Rendering event
		Call Vista_Autoevatipositu.Row_Rendering()

		' --------------------
		'  Render view codes
		' --------------------

		If Vista_Autoevatipositu.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' RUT
			Vista_Autoevatipositu.RUT.ViewValue = Vista_Autoevatipositu.RUT.Summary

			' CODCARPR
			Vista_Autoevatipositu.CODCARPR.ViewValue = Vista_Autoevatipositu.CODCARPR.Summary

			' JORNADA
			Vista_Autoevatipositu.JORNADA.ViewValue = Vista_Autoevatipositu.JORNADA.Summary

			' NOMBRE_C
			Vista_Autoevatipositu.NOMBRE_C.ViewValue = Vista_Autoevatipositu.NOMBRE_C.Summary

			' ESTACAD
			Vista_Autoevatipositu.ESTACAD.ViewValue = Vista_Autoevatipositu.ESTACAD.Summary

			' DESCRIPCION
			Vista_Autoevatipositu.DESCRIPCION.ViewValue = Vista_Autoevatipositu.DESCRIPCION.Summary

			' DIG
			Vista_Autoevatipositu.DIG.ViewValue = Vista_Autoevatipositu.DIG.Summary

			' PATERNO
			Vista_Autoevatipositu.PATERNO.ViewValue = Vista_Autoevatipositu.PATERNO.Summary

			' MATERNO
			Vista_Autoevatipositu.MATERNO.ViewValue = Vista_Autoevatipositu.MATERNO.Summary

			' NOMBRE
			Vista_Autoevatipositu.NOMBRE.ViewValue = Vista_Autoevatipositu.NOMBRE.Summary

			' ANO
			Vista_Autoevatipositu.ANO.ViewValue = Vista_Autoevatipositu.ANO.Summary

			' ESRETIRO
			Vista_Autoevatipositu.ESRETIRO.ViewValue = Vista_Autoevatipositu.ESRETIRO.Summary

			' TIPOCARR
			Vista_Autoevatipositu.TIPOCARR.ViewValue = Vista_Autoevatipositu.TIPOCARR.Summary

			' CAMBIOCARRERA
			Vista_Autoevatipositu.CAMBIOCARRERA.ViewValue = Vista_Autoevatipositu.CAMBIOCARRERA.Summary

			' REINCORPORA
			Vista_Autoevatipositu.REINCORPORA.ViewValue = Vista_Autoevatipositu.REINCORPORA.Summary

			' OTORGATITULO
			Vista_Autoevatipositu.OTORGATITULO.ViewValue = Vista_Autoevatipositu.OTORGATITULO.Summary

			' CONCEPTO
			Vista_Autoevatipositu.CONCEPTO.ViewValue = Vista_Autoevatipositu.CONCEPTO.Summary

			' SEXO
			Vista_Autoevatipositu.SEXO.ViewValue = Vista_Autoevatipositu.SEXO.Summary

			' NACIONALIDAD
			Vista_Autoevatipositu.NACIONALIDAD.ViewValue = Vista_Autoevatipositu.NACIONALIDAD.Summary
		Else

			' RUT
			Vista_Autoevatipositu.RUT.ViewValue = Vista_Autoevatipositu.RUT.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.RUT.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CODCARPR
			Vista_Autoevatipositu.CODCARPR.ViewValue = Vista_Autoevatipositu.CODCARPR.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.CODCARPR.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' JORNADA
			Vista_Autoevatipositu.JORNADA.ViewValue = Vista_Autoevatipositu.JORNADA.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.JORNADA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE_C
			Vista_Autoevatipositu.NOMBRE_C.ViewValue = Vista_Autoevatipositu.NOMBRE_C.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.NOMBRE_C.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ESTACAD
			Vista_Autoevatipositu.ESTACAD.ViewValue = Vista_Autoevatipositu.ESTACAD.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.ESTACAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' DESCRIPCION
			Vista_Autoevatipositu.DESCRIPCION.ViewValue = Vista_Autoevatipositu.DESCRIPCION.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.DESCRIPCION.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' DIG
			Vista_Autoevatipositu.DIG.ViewValue = Vista_Autoevatipositu.DIG.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.DIG.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PATERNO
			Vista_Autoevatipositu.PATERNO.ViewValue = Vista_Autoevatipositu.PATERNO.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.PATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' MATERNO
			Vista_Autoevatipositu.MATERNO.ViewValue = Vista_Autoevatipositu.MATERNO.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.MATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE
			Vista_Autoevatipositu.NOMBRE.ViewValue = Vista_Autoevatipositu.NOMBRE.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.NOMBRE.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ANO
			Vista_Autoevatipositu.ANO.ViewValue = Vista_Autoevatipositu.ANO.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.ANO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ESRETIRO
			Vista_Autoevatipositu.ESRETIRO.ViewValue = Vista_Autoevatipositu.ESRETIRO.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.ESRETIRO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' TIPOCARR
			Vista_Autoevatipositu.TIPOCARR.ViewValue = Vista_Autoevatipositu.TIPOCARR.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.TIPOCARR.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CAMBIOCARRERA
			Vista_Autoevatipositu.CAMBIOCARRERA.ViewValue = Vista_Autoevatipositu.CAMBIOCARRERA.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.CAMBIOCARRERA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' REINCORPORA
			Vista_Autoevatipositu.REINCORPORA.ViewValue = Vista_Autoevatipositu.REINCORPORA.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.REINCORPORA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' OTORGATITULO
			Vista_Autoevatipositu.OTORGATITULO.ViewValue = Vista_Autoevatipositu.OTORGATITULO.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.OTORGATITULO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CONCEPTO
			Vista_Autoevatipositu.CONCEPTO.ViewValue = Vista_Autoevatipositu.CONCEPTO.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.CONCEPTO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' SEXO
			Vista_Autoevatipositu.SEXO.ViewValue = Vista_Autoevatipositu.SEXO.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.SEXO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NACIONALIDAD
			Vista_Autoevatipositu.NACIONALIDAD.ViewValue = Vista_Autoevatipositu.NACIONALIDAD.CurrentValue
			Call ewrpt_SetAttr(Vista_Autoevatipositu.NACIONALIDAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))
		End If

		' RUT
		Vista_Autoevatipositu.RUT.HrefValue = ""

		' CODCARPR
		Vista_Autoevatipositu.CODCARPR.HrefValue = ""

		' JORNADA
		Vista_Autoevatipositu.JORNADA.HrefValue = ""

		' NOMBRE_C
		Vista_Autoevatipositu.NOMBRE_C.HrefValue = ""

		' ESTACAD
		Vista_Autoevatipositu.ESTACAD.HrefValue = ""

		' DESCRIPCION
		Vista_Autoevatipositu.DESCRIPCION.HrefValue = ""

		' DIG
		Vista_Autoevatipositu.DIG.HrefValue = ""

		' PATERNO
		Vista_Autoevatipositu.PATERNO.HrefValue = ""

		' MATERNO
		Vista_Autoevatipositu.MATERNO.HrefValue = ""

		' NOMBRE
		Vista_Autoevatipositu.NOMBRE.HrefValue = ""

		' ANO
		Vista_Autoevatipositu.ANO.HrefValue = ""

		' ESRETIRO
		Vista_Autoevatipositu.ESRETIRO.HrefValue = ""

		' TIPOCARR
		Vista_Autoevatipositu.TIPOCARR.HrefValue = ""

		' CAMBIOCARRERA
		Vista_Autoevatipositu.CAMBIOCARRERA.HrefValue = ""

		' REINCORPORA
		Vista_Autoevatipositu.REINCORPORA.HrefValue = ""

		' OTORGATITULO
		Vista_Autoevatipositu.OTORGATITULO.HrefValue = ""

		' CONCEPTO
		Vista_Autoevatipositu.CONCEPTO.HrefValue = ""

		' SEXO
		Vista_Autoevatipositu.SEXO.HrefValue = ""

		' NACIONALIDAD
		Vista_Autoevatipositu.NACIONALIDAD.HrefValue = ""

		' Call Row_Rendered event
		Call Vista_Autoevatipositu.Row_Rendered()
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
				Vista_Autoevatipositu.OrderBy = ""
				Vista_Autoevatipositu.StartGroup = 1
				Vista_Autoevatipositu.RUT.Sort = ""
				Vista_Autoevatipositu.CODCARPR.Sort = ""
				Vista_Autoevatipositu.JORNADA.Sort = ""
				Vista_Autoevatipositu.NOMBRE_C.Sort = ""
				Vista_Autoevatipositu.ESTACAD.Sort = ""
				Vista_Autoevatipositu.DESCRIPCION.Sort = ""
				Vista_Autoevatipositu.DIG.Sort = ""
				Vista_Autoevatipositu.PATERNO.Sort = ""
				Vista_Autoevatipositu.MATERNO.Sort = ""
				Vista_Autoevatipositu.NOMBRE.Sort = ""
				Vista_Autoevatipositu.ANO.Sort = ""
				Vista_Autoevatipositu.ESRETIRO.Sort = ""
				Vista_Autoevatipositu.TIPOCARR.Sort = ""
				Vista_Autoevatipositu.CAMBIOCARRERA.Sort = ""
				Vista_Autoevatipositu.REINCORPORA.Sort = ""
				Vista_Autoevatipositu.OTORGATITULO.Sort = ""
				Vista_Autoevatipositu.CONCEPTO.Sort = ""
				Vista_Autoevatipositu.SEXO.Sort = ""
				Vista_Autoevatipositu.NACIONALIDAD.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			Vista_Autoevatipositu.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				Vista_Autoevatipositu.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				Vista_Autoevatipositu.CurrentOrderType = ""
			End If
			sSortSql = Vista_Autoevatipositu.SortSql
			Vista_Autoevatipositu.OrderBy = sSortSql
			Vista_Autoevatipositu.StartGroup = 1
		End If
		GetSort = Vista_Autoevatipositu.OrderBy
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
