<!--#include file="rptinc/ewrcfg4.asp"-->
<!--#include file="rptinc/ewrfn4.asp"-->
<!--#include file="rptinc/ewrusrfn.asp"-->
<%

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

	' CODCLI
	Private m_CODCLI

	Public Property Get CODCLI()
		Dim ar
		If Not IsObject(m_CODCLI) Then
			Set m_CODCLI = NewFldObj("CustomView1", "CustomView1", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			m_CODCLI.DateFilter = ""
			m_CODCLI.SqlSelect = ""
			m_CODCLI.SqlOrderBy = ""
		End If
		Set CODCLI = m_CODCLI
	End Property

	' DIG
	Private m_DIG

	Public Property Get DIG()
		Dim ar
		If Not IsObject(m_DIG) Then
			Set m_DIG = NewFldObj("CustomView1", "CustomView1", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_PATERNO = NewFldObj("CustomView1", "CustomView1", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_MATERNO = NewFldObj("CustomView1", "CustomView1", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NOMBRE = NewFldObj("CustomView1", "CustomView1", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE.DateFilter = ""
			m_NOMBRE.SqlSelect = ""
			m_NOMBRE.SqlOrderBy = ""
		End If
		Set NOMBRE = m_NOMBRE
	End Property

	' fecmat
	Private m_fecmat

	Public Property Get fecmat()
		Dim ar
		If Not IsObject(m_fecmat) Then
			Set m_fecmat = NewFldObj("CustomView1", "CustomView1", "x_fecmat", "fecmat", "[fecmat]", 135, EWRPT_DATATYPE_DATE, 5)
			m_fecmat.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateYMD"), "%s", "/")
			m_fecmat.DateFilter = ""
			m_fecmat.SqlSelect = ""
			m_fecmat.SqlOrderBy = ""
		End If
		Set fecmat = m_fecmat
	End Property

	' JORNADA
	Private m_JORNADA

	Public Property Get JORNADA()
		Dim ar
		If Not IsObject(m_JORNADA) Then
			Set m_JORNADA = NewFldObj("CustomView1", "CustomView1", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			m_JORNADA.DateFilter = ""
			m_JORNADA.SqlSelect = ""
			m_JORNADA.SqlOrderBy = ""
		End If
		Set JORNADA = m_JORNADA
	End Property

	' CODCARR
	Private m_CODCARR

	Public Property Get CODCARR()
		Dim ar
		If Not IsObject(m_CODCARR) Then
			Set m_CODCARR = NewFldObj("CustomView1", "CustomView1", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			m_CODCARR.DateFilter = ""
			m_CODCARR.SqlSelect = ""
			m_CODCARR.SqlOrderBy = ""
		End If
		Set CODCARR = m_CODCARR
	End Property

	' NOMBRE_C
	Private m_NOMBRE_C

	Public Property Get NOMBRE_C()
		Dim ar
		If Not IsObject(m_NOMBRE_C) Then
			Set m_NOMBRE_C = NewFldObj("CustomView1", "CustomView1", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE_C.DateFilter = ""
			m_NOMBRE_C.SqlSelect = ""
			m_NOMBRE_C.SqlOrderBy = ""
		End If
		Set NOMBRE_C = m_NOMBRE_C
	End Property

	' EstadoAcad
	Private m_EstadoAcad

	Public Property Get EstadoAcad()
		Dim ar
		If Not IsObject(m_EstadoAcad) Then
			Set m_EstadoAcad = NewFldObj("CustomView1", "CustomView1", "x_EstadoAcad", "EstadoAcad", "[EstadoAcad]", 200, EWRPT_DATATYPE_STRING, -1)
			m_EstadoAcad.DateFilter = ""
			m_EstadoAcad.SqlSelect = ""
			m_EstadoAcad.SqlOrderBy = ""
		End If
		Set EstadoAcad = m_EstadoAcad
	End Property

	' COMUNA
	Private m_COMUNA

	Public Property Get COMUNA()
		Dim ar
		If Not IsObject(m_COMUNA) Then
			Set m_COMUNA = NewFldObj("CustomView1", "CustomView1", "x_COMUNA", "COMUNA", "[COMUNA]", 200, EWRPT_DATATYPE_STRING, -1)
			m_COMUNA.DateFilter = ""
			m_COMUNA.SqlSelect = ""
			m_COMUNA.SqlOrderBy = ""
		End If
		Set COMUNA = m_COMUNA
	End Property

	' CIUDADACT
	Private m_CIUDADACT

	Public Property Get CIUDADACT()
		Dim ar
		If Not IsObject(m_CIUDADACT) Then
			Set m_CIUDADACT = NewFldObj("CustomView1", "CustomView1", "x_CIUDADACT", "CIUDADACT", "[CIUDADACT]", 200, EWRPT_DATATYPE_STRING, -1)
			m_CIUDADACT.DateFilter = ""
			m_CIUDADACT.SqlSelect = ""
			m_CIUDADACT.SqlOrderBy = ""
		End If
		Set CIUDADACT = m_CIUDADACT
	End Property

	' ESTACAD
	Private m_ESTACAD

	Public Property Get ESTACAD()
		Dim ar
		If Not IsObject(m_ESTACAD) Then
			Set m_ESTACAD = NewFldObj("CustomView1", "CustomView1", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			m_ESTACAD.DateFilter = ""
			m_ESTACAD.SqlSelect = ""
			m_ESTACAD.SqlOrderBy = ""
		End If
		Set ESTACAD = m_ESTACAD
	End Property

	' AñoIng
	Private m_AF1oIng

	Public Property Get AF1oIng()
		Dim ar
		If Not IsObject(m_AF1oIng) Then
			Set m_AF1oIng = NewFldObj("CustomView1", "CustomView1", "x_AF1oIng", "AñoIng", "[AñoIng]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_AF1oIng.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_AF1oIng.DateFilter = ""
			m_AF1oIng.SqlSelect = ""
			m_AF1oIng.SqlOrderBy = ""
		End If
		Set AF1oIng = m_AF1oIng
	End Property

	' AñoMat
	Private m_AF1oMat

	Public Property Get AF1oMat()
		Dim ar
		If Not IsObject(m_AF1oMat) Then
			Set m_AF1oMat = NewFldObj("CustomView1", "CustomView1", "x_AF1oMat", "AñoMat", "[AñoMat]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_AF1oMat.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_AF1oMat.DateFilter = ""
			m_AF1oMat.SqlSelect = ""
			m_AF1oMat.SqlOrderBy = ""
		End If
		Set AF1oMat = m_AF1oMat
	End Property

	' TIPOCARR
	Private m_TIPOCARR

	Public Property Get TIPOCARR()
		Dim ar
		If Not IsObject(m_TIPOCARR) Then
			Set m_TIPOCARR = NewFldObj("CustomView1", "CustomView1", "x_TIPOCARR", "TIPOCARR", "[TIPOCARR]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_TIPOCARR.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_TIPOCARR.DateFilter = ""
			m_TIPOCARR.SqlSelect = ""
			m_TIPOCARR.SqlOrderBy = ""
		End If
		Set TIPOCARR = m_TIPOCARR
	End Property

	' MATRICULADO
	Private m_MATRICULADO

	Public Property Get MATRICULADO()
		Dim ar
		If Not IsObject(m_MATRICULADO) Then
			Set m_MATRICULADO = NewFldObj("CustomView1", "CustomView1", "x_MATRICULADO", "MATRICULADO", "[MATRICULADO]", 200, EWRPT_DATATYPE_STRING, -1)
			m_MATRICULADO.DateFilter = ""
			m_MATRICULADO.SqlSelect = ""
			m_MATRICULADO.SqlOrderBy = ""
		End If
		Set MATRICULADO = m_MATRICULADO
	End Property

	' PERIODO_MAT
	Private m_PERIODO_MAT

	Public Property Get PERIODO_MAT()
		Dim ar
		If Not IsObject(m_PERIODO_MAT) Then
			Set m_PERIODO_MAT = NewFldObj("CustomView1", "CustomView1", "x_PERIODO_MAT", "PERIODO_MAT", "[PERIODO_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PERIODO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PERIODO_MAT.DateFilter = ""
			m_PERIODO_MAT.SqlSelect = ""
			m_PERIODO_MAT.SqlOrderBy = ""
		End If
		Set PERIODO_MAT = m_PERIODO_MAT
	End Property

	' SEXO
	Private m_SEXO

	Public Property Get SEXO()
		Dim ar
		If Not IsObject(m_SEXO) Then
			Set m_SEXO = NewFldObj("CustomView1", "CustomView1", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NACIONALIDAD = NewFldObj("CustomView1", "CustomView1", "x_NACIONALIDAD", "NACIONALIDAD", "[NACIONALIDAD]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NACIONALIDAD.DateFilter = ""
			m_NACIONALIDAD.SqlSelect = ""
			m_NACIONALIDAD.SqlOrderBy = ""
		End If
		Set NACIONALIDAD = m_NACIONALIDAD
	End Property

	' FECNAC
	Private m_FECNAC

	Public Property Get FECNAC()
		Dim ar
		If Not IsObject(m_FECNAC) Then
			Set m_FECNAC = NewFldObj("CustomView1", "CustomView1", "x_FECNAC", "FECNAC", "[FECNAC]", 135, EWRPT_DATATYPE_DATE, 5)
			m_FECNAC.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateYMD"), "%s", "/")
			m_FECNAC.DateFilter = ""
			m_FECNAC.SqlSelect = ""
			m_FECNAC.SqlOrderBy = ""
		End If
		Set FECNAC = m_FECNAC
	End Property

	' PUNTAJE
	Private m_PUNTAJE

	Public Property Get PUNTAJE()
		Dim ar
		If Not IsObject(m_PUNTAJE) Then
			Set m_PUNTAJE = NewFldObj("CustomView1", "CustomView1", "x_PUNTAJE", "PUNTAJE", "[PUNTAJE]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PUNTAJE.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PUNTAJE.DateFilter = ""
			m_PUNTAJE.SqlSelect = ""
			m_PUNTAJE.SqlOrderBy = ""
		End If
		Set PUNTAJE = m_PUNTAJE
	End Property

	' PAA
	Private m_PAA

	Public Property Get PAA()
		Dim ar
		If Not IsObject(m_PAA) Then
			Set m_PAA = NewFldObj("CustomView1", "CustomView1", "x_PAA", "PAA", "[PAA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PAA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PAA.DateFilter = ""
			m_PAA.SqlSelect = ""
			m_PAA.SqlOrderBy = ""
		End If
		Set PAA = m_PAA
	End Property

	' ANOEEM
	Private m_ANOEEM

	Public Property Get ANOEEM()
		Dim ar
		If Not IsObject(m_ANOEEM) Then
			Set m_ANOEEM = NewFldObj("CustomView1", "CustomView1", "x_ANOEEM", "ANOEEM", "[ANOEEM]", 200, EWRPT_DATATYPE_STRING, -1)
			m_ANOEEM.DateFilter = ""
			m_ANOEEM.SqlSelect = ""
			m_ANOEEM.SqlOrderBy = ""
		End If
		Set ANOEEM = m_ANOEEM
	End Property

	' NOTAEM
	Private m_NOTAEM

	Public Property Get NOTAEM()
		Dim ar
		If Not IsObject(m_NOTAEM) Then
			Set m_NOTAEM = NewFldObj("CustomView1", "CustomView1", "x_NOTAEM", "NOTAEM", "[NOTAEM]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOTAEM.DateFilter = ""
			m_NOTAEM.SqlSelect = ""
			m_NOTAEM.SqlOrderBy = ""
		End If
		Set NOTAEM = m_NOTAEM
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
		Call ewrpt_SetArObj(Fields, "CODCLI", CODCLI)
		Call ewrpt_SetArObj(Fields, "DIG", DIG)
		Call ewrpt_SetArObj(Fields, "PATERNO", PATERNO)
		Call ewrpt_SetArObj(Fields, "MATERNO", MATERNO)
		Call ewrpt_SetArObj(Fields, "NOMBRE", NOMBRE)
		Call ewrpt_SetArObj(Fields, "fecmat", fecmat)
		Call ewrpt_SetArObj(Fields, "JORNADA", JORNADA)
		Call ewrpt_SetArObj(Fields, "CODCARR", CODCARR)
		Call ewrpt_SetArObj(Fields, "NOMBRE_C", NOMBRE_C)
		Call ewrpt_SetArObj(Fields, "EstadoAcad", EstadoAcad)
		Call ewrpt_SetArObj(Fields, "COMUNA", COMUNA)
		Call ewrpt_SetArObj(Fields, "CIUDADACT", CIUDADACT)
		Call ewrpt_SetArObj(Fields, "ESTACAD", ESTACAD)
		Call ewrpt_SetArObj(Fields, "AF1oIng", AF1oIng)
		Call ewrpt_SetArObj(Fields, "AF1oMat", AF1oMat)
		Call ewrpt_SetArObj(Fields, "TIPOCARR", TIPOCARR)
		Call ewrpt_SetArObj(Fields, "MATRICULADO", MATRICULADO)
		Call ewrpt_SetArObj(Fields, "PERIODO_MAT", PERIODO_MAT)
		Call ewrpt_SetArObj(Fields, "SEXO", SEXO)
		Call ewrpt_SetArObj(Fields, "NACIONALIDAD", NACIONALIDAD)
		Call ewrpt_SetArObj(Fields, "FECNAC", FECNAC)
		Call ewrpt_SetArObj(Fields, "PUNTAJE", PUNTAJE)
		Call ewrpt_SetArObj(Fields, "PAA", PAA)
		Call ewrpt_SetArObj(Fields, "ANOEEM", ANOEEM)
		Call ewrpt_SetArObj(Fields, "NOTAEM", NOTAEM)
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
		SqlFrom = "Vista_Autoevaglobal"
	End Property

	Public Property Get SqlSelect() ' Select
		SqlSelect = "SELECT Vista_Autoevaglobal.* FROM " & SqlFrom
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
<%= CustomView1.TableCaption %>
<% If CustomView1.Export = "" Then %>
&nbsp;&nbsp;<a href="<%= CustomView1_rpt.ExportExcelUrl %>"><%= ReportLanguage.Phrase("ExportToExcel") %></a>
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
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<% If CustomView1.Export = "" Then %>
<div class="ewGridUpperPanel">
<form action="CustomView1rpt.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(CustomView1_rpt.StartGrp, CustomView1_rpt.DisplayGrps, CustomView1_rpt.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="40"<% If CustomView1_rpt.DisplayGrps = 40 Then Response.Write " selected=""selected""" %>>40</option>
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
<%= CustomView1.CODCLI.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.CODCLI) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.CODCLI.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.CODCLI) %>',0);"><%= CustomView1.CODCLI.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.CODCLI.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.CODCLI.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.DIG.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.DIG) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.DIG.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.DIG) %>',0);"><%= CustomView1.DIG.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.DIG.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.DIG.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.PATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.PATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.PATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.PATERNO) %>',0);"><%= CustomView1.PATERNO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.PATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.PATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.MATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.MATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.MATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.MATERNO) %>',0);"><%= CustomView1.MATERNO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.MATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.MATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.NOMBRE.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.NOMBRE) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.NOMBRE.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.NOMBRE) %>',0);"><%= CustomView1.NOMBRE.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.NOMBRE.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.NOMBRE.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.fecmat.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.fecmat) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.fecmat.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.fecmat) %>',0);"><%= CustomView1.fecmat.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.fecmat.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.fecmat.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.JORNADA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.JORNADA) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.JORNADA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.JORNADA) %>',0);"><%= CustomView1.JORNADA.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.JORNADA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.JORNADA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.CODCARR.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.CODCARR) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.CODCARR.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.CODCARR) %>',0);"><%= CustomView1.CODCARR.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.CODCARR.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.CODCARR.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.NOMBRE_C.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.NOMBRE_C) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.NOMBRE_C.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.NOMBRE_C) %>',0);"><%= CustomView1.NOMBRE_C.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.NOMBRE_C.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.NOMBRE_C.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.EstadoAcad.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.EstadoAcad) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.EstadoAcad.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.EstadoAcad) %>',0);"><%= CustomView1.EstadoAcad.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.EstadoAcad.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.EstadoAcad.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.COMUNA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.COMUNA) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.COMUNA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.COMUNA) %>',0);"><%= CustomView1.COMUNA.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.COMUNA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.COMUNA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.CIUDADACT.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.CIUDADACT) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.CIUDADACT.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.CIUDADACT) %>',0);"><%= CustomView1.CIUDADACT.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.CIUDADACT.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.CIUDADACT.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.ESTACAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.ESTACAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.ESTACAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.ESTACAD) %>',0);"><%= CustomView1.ESTACAD.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.ESTACAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.ESTACAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.AF1oIng.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.AF1oIng) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.AF1oIng.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.AF1oIng) %>',0);"><%= CustomView1.AF1oIng.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.AF1oIng.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.AF1oIng.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.AF1oMat.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.AF1oMat) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.AF1oMat.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.AF1oMat) %>',0);"><%= CustomView1.AF1oMat.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.AF1oMat.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.AF1oMat.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.TIPOCARR.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.TIPOCARR) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.TIPOCARR.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.TIPOCARR) %>',0);"><%= CustomView1.TIPOCARR.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.TIPOCARR.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.TIPOCARR.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.MATRICULADO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.MATRICULADO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.MATRICULADO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.MATRICULADO) %>',0);"><%= CustomView1.MATRICULADO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.MATRICULADO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.MATRICULADO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.PERIODO_MAT.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.PERIODO_MAT) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.PERIODO_MAT.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.PERIODO_MAT) %>',0);"><%= CustomView1.PERIODO_MAT.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.PERIODO_MAT.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.PERIODO_MAT.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.SEXO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.SEXO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.SEXO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.SEXO) %>',0);"><%= CustomView1.SEXO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.SEXO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.SEXO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.NACIONALIDAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.NACIONALIDAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.NACIONALIDAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.NACIONALIDAD) %>',0);"><%= CustomView1.NACIONALIDAD.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.NACIONALIDAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.NACIONALIDAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.FECNAC.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.FECNAC) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.FECNAC.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.FECNAC) %>',0);"><%= CustomView1.FECNAC.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.FECNAC.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.FECNAC.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.PUNTAJE.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.PUNTAJE) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.PUNTAJE.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.PUNTAJE) %>',0);"><%= CustomView1.PUNTAJE.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.PUNTAJE.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.PUNTAJE.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.PAA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.PAA) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.PAA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.PAA) %>',0);"><%= CustomView1.PAA.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.PAA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.PAA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.ANOEEM.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.ANOEEM) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.ANOEEM.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.ANOEEM) %>',0);"><%= CustomView1.ANOEEM.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.ANOEEM.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.ANOEEM.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.NOTAEM.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.NOTAEM) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.NOTAEM.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.NOTAEM) %>',0);"><%= CustomView1.NOTAEM.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.NOTAEM.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.NOTAEM.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
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
		<td<%= CustomView1.CODCLI.CellAttributes %>>
<div<%= CustomView1.CODCLI.ViewAttributes %>><%= CustomView1.CODCLI.ListViewValue %></div>
</td>
		<td<%= CustomView1.DIG.CellAttributes %>>
<div<%= CustomView1.DIG.ViewAttributes %>><%= CustomView1.DIG.ListViewValue %></div>
</td>
		<td<%= CustomView1.PATERNO.CellAttributes %>>
<div<%= CustomView1.PATERNO.ViewAttributes %>><%= CustomView1.PATERNO.ListViewValue %></div>
</td>
		<td<%= CustomView1.MATERNO.CellAttributes %>>
<div<%= CustomView1.MATERNO.ViewAttributes %>><%= CustomView1.MATERNO.ListViewValue %></div>
</td>
		<td<%= CustomView1.NOMBRE.CellAttributes %>>
<div<%= CustomView1.NOMBRE.ViewAttributes %>><%= CustomView1.NOMBRE.ListViewValue %></div>
</td>
		<td<%= CustomView1.fecmat.CellAttributes %>>
<div<%= CustomView1.fecmat.ViewAttributes %>><%= CustomView1.fecmat.ListViewValue %></div>
</td>
		<td<%= CustomView1.JORNADA.CellAttributes %>>
<div<%= CustomView1.JORNADA.ViewAttributes %>><%= CustomView1.JORNADA.ListViewValue %></div>
</td>
		<td<%= CustomView1.CODCARR.CellAttributes %>>
<div<%= CustomView1.CODCARR.ViewAttributes %>><%= CustomView1.CODCARR.ListViewValue %></div>
</td>
		<td<%= CustomView1.NOMBRE_C.CellAttributes %>>
<div<%= CustomView1.NOMBRE_C.ViewAttributes %>><%= CustomView1.NOMBRE_C.ListViewValue %></div>
</td>
		<td<%= CustomView1.EstadoAcad.CellAttributes %>>
<div<%= CustomView1.EstadoAcad.ViewAttributes %>><%= CustomView1.EstadoAcad.ListViewValue %></div>
</td>
		<td<%= CustomView1.COMUNA.CellAttributes %>>
<div<%= CustomView1.COMUNA.ViewAttributes %>><%= CustomView1.COMUNA.ListViewValue %></div>
</td>
		<td<%= CustomView1.CIUDADACT.CellAttributes %>>
<div<%= CustomView1.CIUDADACT.ViewAttributes %>><%= CustomView1.CIUDADACT.ListViewValue %></div>
</td>
		<td<%= CustomView1.ESTACAD.CellAttributes %>>
<div<%= CustomView1.ESTACAD.ViewAttributes %>><%= CustomView1.ESTACAD.ListViewValue %></div>
</td>
		<td<%= CustomView1.AF1oIng.CellAttributes %>>
<div<%= CustomView1.AF1oIng.ViewAttributes %>><%= CustomView1.AF1oIng.ListViewValue %></div>
</td>
		<td<%= CustomView1.AF1oMat.CellAttributes %>>
<div<%= CustomView1.AF1oMat.ViewAttributes %>><%= CustomView1.AF1oMat.ListViewValue %></div>
</td>
		<td<%= CustomView1.TIPOCARR.CellAttributes %>>
<div<%= CustomView1.TIPOCARR.ViewAttributes %>><%= CustomView1.TIPOCARR.ListViewValue %></div>
</td>
		<td<%= CustomView1.MATRICULADO.CellAttributes %>>
<div<%= CustomView1.MATRICULADO.ViewAttributes %>><%= CustomView1.MATRICULADO.ListViewValue %></div>
</td>
		<td<%= CustomView1.PERIODO_MAT.CellAttributes %>>
<div<%= CustomView1.PERIODO_MAT.ViewAttributes %>><%= CustomView1.PERIODO_MAT.ListViewValue %></div>
</td>
		<td<%= CustomView1.SEXO.CellAttributes %>>
<div<%= CustomView1.SEXO.ViewAttributes %>><%= CustomView1.SEXO.ListViewValue %></div>
</td>
		<td<%= CustomView1.NACIONALIDAD.CellAttributes %>>
<div<%= CustomView1.NACIONALIDAD.ViewAttributes %>><%= CustomView1.NACIONALIDAD.ListViewValue %></div>
</td>
		<td<%= CustomView1.FECNAC.CellAttributes %>>
<div<%= CustomView1.FECNAC.ViewAttributes %>><%= CustomView1.FECNAC.ListViewValue %></div>
</td>
		<td<%= CustomView1.PUNTAJE.CellAttributes %>>
<div<%= CustomView1.PUNTAJE.ViewAttributes %>><%= CustomView1.PUNTAJE.ListViewValue %></div>
</td>
		<td<%= CustomView1.PAA.CellAttributes %>>
<div<%= CustomView1.PAA.ViewAttributes %>><%= CustomView1.PAA.ListViewValue %></div>
</td>
		<td<%= CustomView1.ANOEEM.CellAttributes %>>
<div<%= CustomView1.ANOEEM.ViewAttributes %>><%= CustomView1.ANOEEM.ListViewValue %></div>
</td>
		<td<%= CustomView1.NOTAEM.CellAttributes %>>
<div<%= CustomView1.NOTAEM.ViewAttributes %>><%= CustomView1.NOTAEM.ListViewValue %></div>
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
<% If CustomView1_rpt.TotalGrps > 0 Then %>
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
	<td><a href="CustomView1rpt.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="40"<% If CustomView1_rpt.DisplayGrps = 40 Then Response.Write " selected=""selected""" %>>40</option>
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
		nDtls = 25
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
		Col(20) = False
		Col(21) = False
		Col(22) = False
		Col(23) = False
		Col(24) = False
		Col(25) = False

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
			CustomView1.CODCLI.DbValue = ewrpt_GetValue(rs("CODCLI"))
			CustomView1.DIG.DbValue = ewrpt_GetValue(rs("DIG"))
			CustomView1.PATERNO.DbValue = ewrpt_GetValue(rs("PATERNO"))
			CustomView1.MATERNO.DbValue = ewrpt_GetValue(rs("MATERNO"))
			CustomView1.NOMBRE.DbValue = ewrpt_GetValue(rs("NOMBRE"))
			CustomView1.fecmat.DbValue = ewrpt_GetValue(rs("fecmat"))
			CustomView1.JORNADA.DbValue = ewrpt_GetValue(rs("JORNADA"))
			CustomView1.CODCARR.DbValue = ewrpt_GetValue(rs("CODCARR"))
			CustomView1.NOMBRE_C.DbValue = ewrpt_GetValue(rs("NOMBRE_C"))
			CustomView1.EstadoAcad.DbValue = ewrpt_GetValue(rs("EstadoAcad"))
			CustomView1.COMUNA.DbValue = ewrpt_GetValue(rs("COMUNA"))
			CustomView1.CIUDADACT.DbValue = ewrpt_GetValue(rs("CIUDADACT"))
			CustomView1.ESTACAD.DbValue = ewrpt_GetValue(rs("ESTACAD"))
			CustomView1.AF1oIng.DbValue = ewrpt_GetValue(rs("AñoIng"))
			CustomView1.AF1oMat.DbValue = ewrpt_GetValue(rs("AñoMat"))
			CustomView1.TIPOCARR.DbValue = ewrpt_GetValue(rs("TIPOCARR"))
			CustomView1.MATRICULADO.DbValue = ewrpt_GetValue(rs("MATRICULADO"))
			CustomView1.PERIODO_MAT.DbValue = ewrpt_GetValue(rs("PERIODO_MAT"))
			CustomView1.SEXO.DbValue = ewrpt_GetValue(rs("SEXO"))
			CustomView1.NACIONALIDAD.DbValue = ewrpt_GetValue(rs("NACIONALIDAD"))
			CustomView1.FECNAC.DbValue = ewrpt_GetValue(rs("FECNAC"))
			CustomView1.PUNTAJE.DbValue = ewrpt_GetValue(rs("PUNTAJE"))
			CustomView1.PAA.DbValue = ewrpt_GetValue(rs("PAA"))
			CustomView1.ANOEEM.DbValue = ewrpt_GetValue(rs("ANOEEM"))
			CustomView1.NOTAEM.DbValue = ewrpt_GetValue(rs("NOTAEM"))
			Val(1) = CustomView1.CODCLI.CurrentValue
			Val(2) = CustomView1.DIG.CurrentValue
			Val(3) = CustomView1.PATERNO.CurrentValue
			Val(4) = CustomView1.MATERNO.CurrentValue
			Val(5) = CustomView1.NOMBRE.CurrentValue
			Val(6) = CustomView1.fecmat.CurrentValue
			Val(7) = CustomView1.JORNADA.CurrentValue
			Val(8) = CustomView1.CODCARR.CurrentValue
			Val(9) = CustomView1.NOMBRE_C.CurrentValue
			Val(10) = CustomView1.EstadoAcad.CurrentValue
			Val(11) = CustomView1.COMUNA.CurrentValue
			Val(12) = CustomView1.CIUDADACT.CurrentValue
			Val(13) = CustomView1.ESTACAD.CurrentValue
			Val(14) = CustomView1.AF1oIng.CurrentValue
			Val(15) = CustomView1.AF1oMat.CurrentValue
			Val(16) = CustomView1.TIPOCARR.CurrentValue
			Val(17) = CustomView1.MATRICULADO.CurrentValue
			Val(18) = CustomView1.PERIODO_MAT.CurrentValue
			Val(19) = CustomView1.SEXO.CurrentValue
			Val(20) = CustomView1.NACIONALIDAD.CurrentValue
			Val(21) = CustomView1.FECNAC.CurrentValue
			Val(22) = CustomView1.PUNTAJE.CurrentValue
			Val(23) = CustomView1.PAA.CurrentValue
			Val(24) = CustomView1.ANOEEM.CurrentValue
			Val(25) = CustomView1.NOTAEM.CurrentValue
		Else
			CustomView1.CODCLI.DbValue = ""
			CustomView1.DIG.DbValue = ""
			CustomView1.PATERNO.DbValue = ""
			CustomView1.MATERNO.DbValue = ""
			CustomView1.NOMBRE.DbValue = ""
			CustomView1.fecmat.DbValue = ""
			CustomView1.JORNADA.DbValue = ""
			CustomView1.CODCARR.DbValue = ""
			CustomView1.NOMBRE_C.DbValue = ""
			CustomView1.EstadoAcad.DbValue = ""
			CustomView1.COMUNA.DbValue = ""
			CustomView1.CIUDADACT.DbValue = ""
			CustomView1.ESTACAD.DbValue = ""
			CustomView1.AF1oIng.DbValue = ""
			CustomView1.AF1oMat.DbValue = ""
			CustomView1.TIPOCARR.DbValue = ""
			CustomView1.MATRICULADO.DbValue = ""
			CustomView1.PERIODO_MAT.DbValue = ""
			CustomView1.SEXO.DbValue = ""
			CustomView1.NACIONALIDAD.DbValue = ""
			CustomView1.FECNAC.DbValue = ""
			CustomView1.PUNTAJE.DbValue = ""
			CustomView1.PAA.DbValue = ""
			CustomView1.ANOEEM.DbValue = ""
			CustomView1.NOTAEM.DbValue = ""
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
					DisplayGrps = 40 ' Non-numeric, Load Default
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
				DisplayGrps = 40 ' Load Default
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

			' CODCLI
			CustomView1.CODCLI.ViewValue = CustomView1.CODCLI.Summary

			' DIG
			CustomView1.DIG.ViewValue = CustomView1.DIG.Summary

			' PATERNO
			CustomView1.PATERNO.ViewValue = CustomView1.PATERNO.Summary

			' MATERNO
			CustomView1.MATERNO.ViewValue = CustomView1.MATERNO.Summary

			' NOMBRE
			CustomView1.NOMBRE.ViewValue = CustomView1.NOMBRE.Summary

			' fecmat
			CustomView1.fecmat.ViewValue = CustomView1.fecmat.Summary
			CustomView1.fecmat.ViewValue = ewrpt_FormatDateTime(CustomView1.fecmat.ViewValue, 5)

			' JORNADA
			CustomView1.JORNADA.ViewValue = CustomView1.JORNADA.Summary

			' CODCARR
			CustomView1.CODCARR.ViewValue = CustomView1.CODCARR.Summary

			' NOMBRE_C
			CustomView1.NOMBRE_C.ViewValue = CustomView1.NOMBRE_C.Summary

			' EstadoAcad
			CustomView1.EstadoAcad.ViewValue = CustomView1.EstadoAcad.Summary

			' COMUNA
			CustomView1.COMUNA.ViewValue = CustomView1.COMUNA.Summary

			' CIUDADACT
			CustomView1.CIUDADACT.ViewValue = CustomView1.CIUDADACT.Summary

			' ESTACAD
			CustomView1.ESTACAD.ViewValue = CustomView1.ESTACAD.Summary

			' AñoIng
			CustomView1.AF1oIng.ViewValue = CustomView1.AF1oIng.Summary

			' AñoMat
			CustomView1.AF1oMat.ViewValue = CustomView1.AF1oMat.Summary

			' TIPOCARR
			CustomView1.TIPOCARR.ViewValue = CustomView1.TIPOCARR.Summary

			' MATRICULADO
			CustomView1.MATRICULADO.ViewValue = CustomView1.MATRICULADO.Summary

			' PERIODO_MAT
			CustomView1.PERIODO_MAT.ViewValue = CustomView1.PERIODO_MAT.Summary

			' SEXO
			CustomView1.SEXO.ViewValue = CustomView1.SEXO.Summary

			' NACIONALIDAD
			CustomView1.NACIONALIDAD.ViewValue = CustomView1.NACIONALIDAD.Summary

			' FECNAC
			CustomView1.FECNAC.ViewValue = CustomView1.FECNAC.Summary
			CustomView1.FECNAC.ViewValue = ewrpt_FormatDateTime(CustomView1.FECNAC.ViewValue, 5)

			' PUNTAJE
			CustomView1.PUNTAJE.ViewValue = CustomView1.PUNTAJE.Summary

			' PAA
			CustomView1.PAA.ViewValue = CustomView1.PAA.Summary

			' ANOEEM
			CustomView1.ANOEEM.ViewValue = CustomView1.ANOEEM.Summary

			' NOTAEM
			CustomView1.NOTAEM.ViewValue = CustomView1.NOTAEM.Summary
		Else

			' CODCLI
			CustomView1.CODCLI.ViewValue = CustomView1.CODCLI.CurrentValue
			Call ewrpt_SetAttr(CustomView1.CODCLI.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' DIG
			CustomView1.DIG.ViewValue = CustomView1.DIG.CurrentValue
			Call ewrpt_SetAttr(CustomView1.DIG.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PATERNO
			CustomView1.PATERNO.ViewValue = CustomView1.PATERNO.CurrentValue
			Call ewrpt_SetAttr(CustomView1.PATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' MATERNO
			CustomView1.MATERNO.ViewValue = CustomView1.MATERNO.CurrentValue
			Call ewrpt_SetAttr(CustomView1.MATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE
			CustomView1.NOMBRE.ViewValue = CustomView1.NOMBRE.CurrentValue
			Call ewrpt_SetAttr(CustomView1.NOMBRE.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' fecmat
			CustomView1.fecmat.ViewValue = CustomView1.fecmat.CurrentValue
			CustomView1.fecmat.ViewValue = ewrpt_FormatDateTime(CustomView1.fecmat.ViewValue, 5)
			Call ewrpt_SetAttr(CustomView1.fecmat.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' JORNADA
			CustomView1.JORNADA.ViewValue = CustomView1.JORNADA.CurrentValue
			Call ewrpt_SetAttr(CustomView1.JORNADA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CODCARR
			CustomView1.CODCARR.ViewValue = CustomView1.CODCARR.CurrentValue
			Call ewrpt_SetAttr(CustomView1.CODCARR.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE_C
			CustomView1.NOMBRE_C.ViewValue = CustomView1.NOMBRE_C.CurrentValue
			Call ewrpt_SetAttr(CustomView1.NOMBRE_C.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' EstadoAcad
			CustomView1.EstadoAcad.ViewValue = CustomView1.EstadoAcad.CurrentValue
			Call ewrpt_SetAttr(CustomView1.EstadoAcad.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' COMUNA
			CustomView1.COMUNA.ViewValue = CustomView1.COMUNA.CurrentValue
			Call ewrpt_SetAttr(CustomView1.COMUNA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CIUDADACT
			CustomView1.CIUDADACT.ViewValue = CustomView1.CIUDADACT.CurrentValue
			Call ewrpt_SetAttr(CustomView1.CIUDADACT.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ESTACAD
			CustomView1.ESTACAD.ViewValue = CustomView1.ESTACAD.CurrentValue
			Call ewrpt_SetAttr(CustomView1.ESTACAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' AñoIng
			CustomView1.AF1oIng.ViewValue = CustomView1.AF1oIng.CurrentValue
			Call ewrpt_SetAttr(CustomView1.AF1oIng.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' AñoMat
			CustomView1.AF1oMat.ViewValue = CustomView1.AF1oMat.CurrentValue
			Call ewrpt_SetAttr(CustomView1.AF1oMat.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' TIPOCARR
			CustomView1.TIPOCARR.ViewValue = CustomView1.TIPOCARR.CurrentValue
			Call ewrpt_SetAttr(CustomView1.TIPOCARR.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' MATRICULADO
			CustomView1.MATRICULADO.ViewValue = CustomView1.MATRICULADO.CurrentValue
			Call ewrpt_SetAttr(CustomView1.MATRICULADO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PERIODO_MAT
			CustomView1.PERIODO_MAT.ViewValue = CustomView1.PERIODO_MAT.CurrentValue
			Call ewrpt_SetAttr(CustomView1.PERIODO_MAT.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' SEXO
			CustomView1.SEXO.ViewValue = CustomView1.SEXO.CurrentValue
			Call ewrpt_SetAttr(CustomView1.SEXO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NACIONALIDAD
			CustomView1.NACIONALIDAD.ViewValue = CustomView1.NACIONALIDAD.CurrentValue
			Call ewrpt_SetAttr(CustomView1.NACIONALIDAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' FECNAC
			CustomView1.FECNAC.ViewValue = CustomView1.FECNAC.CurrentValue
			CustomView1.FECNAC.ViewValue = ewrpt_FormatDateTime(CustomView1.FECNAC.ViewValue, 5)
			Call ewrpt_SetAttr(CustomView1.FECNAC.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PUNTAJE
			CustomView1.PUNTAJE.ViewValue = CustomView1.PUNTAJE.CurrentValue
			Call ewrpt_SetAttr(CustomView1.PUNTAJE.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PAA
			CustomView1.PAA.ViewValue = CustomView1.PAA.CurrentValue
			Call ewrpt_SetAttr(CustomView1.PAA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ANOEEM
			CustomView1.ANOEEM.ViewValue = CustomView1.ANOEEM.CurrentValue
			Call ewrpt_SetAttr(CustomView1.ANOEEM.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOTAEM
			CustomView1.NOTAEM.ViewValue = CustomView1.NOTAEM.CurrentValue
			Call ewrpt_SetAttr(CustomView1.NOTAEM.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))
		End If

		' CODCLI
		CustomView1.CODCLI.HrefValue = ""

		' DIG
		CustomView1.DIG.HrefValue = ""

		' PATERNO
		CustomView1.PATERNO.HrefValue = ""

		' MATERNO
		CustomView1.MATERNO.HrefValue = ""

		' NOMBRE
		CustomView1.NOMBRE.HrefValue = ""

		' fecmat
		CustomView1.fecmat.HrefValue = ""

		' JORNADA
		CustomView1.JORNADA.HrefValue = ""

		' CODCARR
		CustomView1.CODCARR.HrefValue = ""

		' NOMBRE_C
		CustomView1.NOMBRE_C.HrefValue = ""

		' EstadoAcad
		CustomView1.EstadoAcad.HrefValue = ""

		' COMUNA
		CustomView1.COMUNA.HrefValue = ""

		' CIUDADACT
		CustomView1.CIUDADACT.HrefValue = ""

		' ESTACAD
		CustomView1.ESTACAD.HrefValue = ""

		' AñoIng
		CustomView1.AF1oIng.HrefValue = ""

		' AñoMat
		CustomView1.AF1oMat.HrefValue = ""

		' TIPOCARR
		CustomView1.TIPOCARR.HrefValue = ""

		' MATRICULADO
		CustomView1.MATRICULADO.HrefValue = ""

		' PERIODO_MAT
		CustomView1.PERIODO_MAT.HrefValue = ""

		' SEXO
		CustomView1.SEXO.HrefValue = ""

		' NACIONALIDAD
		CustomView1.NACIONALIDAD.HrefValue = ""

		' FECNAC
		CustomView1.FECNAC.HrefValue = ""

		' PUNTAJE
		CustomView1.PUNTAJE.HrefValue = ""

		' PAA
		CustomView1.PAA.HrefValue = ""

		' ANOEEM
		CustomView1.ANOEEM.HrefValue = ""

		' NOTAEM
		CustomView1.NOTAEM.HrefValue = ""

		' Call Row_Rendered event
		Call CustomView1.Row_Rendered()
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
				CustomView1.CODCLI.Sort = ""
				CustomView1.DIG.Sort = ""
				CustomView1.PATERNO.Sort = ""
				CustomView1.MATERNO.Sort = ""
				CustomView1.NOMBRE.Sort = ""
				CustomView1.fecmat.Sort = ""
				CustomView1.JORNADA.Sort = ""
				CustomView1.CODCARR.Sort = ""
				CustomView1.NOMBRE_C.Sort = ""
				CustomView1.EstadoAcad.Sort = ""
				CustomView1.COMUNA.Sort = ""
				CustomView1.CIUDADACT.Sort = ""
				CustomView1.ESTACAD.Sort = ""
				CustomView1.AF1oIng.Sort = ""
				CustomView1.AF1oMat.Sort = ""
				CustomView1.TIPOCARR.Sort = ""
				CustomView1.MATRICULADO.Sort = ""
				CustomView1.PERIODO_MAT.Sort = ""
				CustomView1.SEXO.Sort = ""
				CustomView1.NACIONALIDAD.Sort = ""
				CustomView1.FECNAC.Sort = ""
				CustomView1.PUNTAJE.Sort = ""
				CustomView1.PAA.Sort = ""
				CustomView1.ANOEEM.Sort = ""
				CustomView1.NOTAEM.Sort = ""
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
