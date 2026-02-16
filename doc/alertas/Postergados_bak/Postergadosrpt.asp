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
Dim Postergados

' Define table class
Class crPostergados
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "Postergados"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "Postergados"
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

	' Rut
	Private m_Rut

	Public Property Get Rut()
		Dim ar
		If Not IsObject(m_Rut) Then
			Set m_Rut = NewFldObj("Postergados", "Postergados", "x_Rut", "Rut", "al.RUT", 200, EWRPT_DATATYPE_STRING, -1)
			m_Rut.DateFilter = ""
			m_Rut.SqlSelect = ""
			m_Rut.SqlOrderBy = ""
		End If
		Set Rut = m_Rut
	End Property

	' Nombre
	Private m_Nombre

	Public Property Get Nombre()
		Dim ar
		If Not IsObject(m_Nombre) Then
			Set m_Nombre = NewFldObj("Postergados", "Postergados", "x_Nombre", "Nombre", "c.NOMBRE", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_Paterno = NewFldObj("Postergados", "Postergados", "x_Paterno", "Paterno", "c.PATERNO", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_Materno = NewFldObj("Postergados", "Postergados", "x_Materno", "Materno", "c.MATERNO", 200, EWRPT_DATATYPE_STRING, -1)
			m_Materno.DateFilter = ""
			m_Materno.SqlSelect = ""
			m_Materno.SqlOrderBy = ""
		End If
		Set Materno = m_Materno
	End Property

	' Codigo Carrera
	Private m_Codigo_Carrera

	Public Property Get Codigo_Carrera()
		Dim ar
		If Not IsObject(m_Codigo_Carrera) Then
			Set m_Codigo_Carrera = NewFldObj("Postergados", "Postergados", "x_Codigo_Carrera", "Codigo Carrera", "al.CODCARPR", 200, EWRPT_DATATYPE_STRING, -1)
			m_Codigo_Carrera.DateFilter = ""
			m_Codigo_Carrera.SqlSelect = ""
			m_Codigo_Carrera.SqlOrderBy = ""
		End If
		Set Codigo_Carrera = m_Codigo_Carrera
	End Property

	' Año
	Private m_AF1o

	Public Property Get AF1o()
		Dim ar
		If Not IsObject(m_AF1o) Then
			Set m_AF1o = NewFldObj("Postergados", "Postergados", "x_AF1o", "Año", "s.ANO", 131, EWRPT_DATATYPE_NUMBER, -1)
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
			Set m_Periodo = NewFldObj("Postergados", "Postergados", "x_Periodo", "Periodo", "s.PERIODO", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_Periodo.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_Periodo.DateFilter = ""
			m_Periodo.SqlSelect = ""
			m_Periodo.SqlOrderBy = ""
		End If
		Set Periodo = m_Periodo
	End Property

	' Codigo
	Private m_Codigo

	Public Property Get Codigo()
		Dim ar
		If Not IsObject(m_Codigo) Then
			Set m_Codigo = NewFldObj("Postergados", "Postergados", "x_Codigo", "Codigo", "t.CODIGO", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_Codigo.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_Codigo.DateFilter = ""
			m_Codigo.SqlSelect = ""
			m_Codigo.SqlOrderBy = ""
		End If
		Set Codigo = m_Codigo
	End Property

	' Estado Academico
	Private m_Estado_Academico

	Public Property Get Estado_Academico()
		Dim ar
		If Not IsObject(m_Estado_Academico) Then
			Set m_Estado_Academico = NewFldObj("Postergados", "Postergados", "x_Estado_Academico", "Estado Academico", "al.ESTACAD", 200, EWRPT_DATATYPE_STRING, -1)
			m_Estado_Academico.DateFilter = ""
			m_Estado_Academico.SqlSelect = ""
			m_Estado_Academico.SqlOrderBy = ""
		End If
		Set Estado_Academico = m_Estado_Academico
	End Property

	' Estado Final
	Private m_Estado_Final

	Public Property Get Estado_Final()
		Dim ar
		If Not IsObject(m_Estado_Final) Then
			Set m_Estado_Final = NewFldObj("Postergados", "Postergados", "x_Estado_Final", "Estado Final", "t.ESTACAD", 200, EWRPT_DATATYPE_STRING, -1)
			m_Estado_Final.DateFilter = ""
			m_Estado_Final.SqlSelect = ""
			m_Estado_Final.SqlOrderBy = ""
		End If
		Set Estado_Final = m_Estado_Final
	End Property

	' Descripcion
	Private m_Descripcion

	Public Property Get Descripcion()
		Dim ar
		If Not IsObject(m_Descripcion) Then
			Set m_Descripcion = NewFldObj("Postergados", "Postergados", "x_Descripcion", "Descripcion", "t.DESCRIPCION", 200, EWRPT_DATATYPE_STRING, -1)
			m_Descripcion.DateFilter = ""
			m_Descripcion.SqlSelect = ""
			m_Descripcion.SqlOrderBy = ""
		End If
		Set Descripcion = m_Descripcion
	End Property

	' Fecha Resolución
	Private m_Fecha_ResoluciF3n

	Public Property Get Fecha_ResoluciF3n()
		Dim ar
		If Not IsObject(m_Fecha_ResoluciF3n) Then
			Set m_Fecha_ResoluciF3n = NewFldObj("Postergados", "Postergados", "x_Fecha_ResoluciF3n", "Fecha Resolución", "s.EMISION", 135, EWRPT_DATATYPE_DATE, 7)
			m_Fecha_ResoluciF3n.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateDMY"), "%s", "/")
			m_Fecha_ResoluciF3n.DateFilter = ""
			m_Fecha_ResoluciF3n.SqlSelect = ""
			m_Fecha_ResoluciF3n.SqlOrderBy = ""
		End If
		Set Fecha_ResoluciF3n = m_Fecha_ResoluciF3n
	End Property

	' Observación
	Private m_ObservaciF3n

	Public Property Get ObservaciF3n()
		Dim ar
		If Not IsObject(m_ObservaciF3n) Then
			Set m_ObservaciF3n = NewFldObj("Postergados", "Postergados", "x_ObservaciF3n", "Observación", "s.OBSERVACION", 200, EWRPT_DATATYPE_STRING, -1)
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
		Call ewrpt_SetArObj(Fields, "Rut", Rut)
		Call ewrpt_SetArObj(Fields, "Nombre", Nombre)
		Call ewrpt_SetArObj(Fields, "Paterno", Paterno)
		Call ewrpt_SetArObj(Fields, "Materno", Materno)
		Call ewrpt_SetArObj(Fields, "Codigo_Carrera", Codigo_Carrera)
		Call ewrpt_SetArObj(Fields, "AF1o", AF1o)
		Call ewrpt_SetArObj(Fields, "Periodo", Periodo)
		Call ewrpt_SetArObj(Fields, "Codigo", Codigo)
		Call ewrpt_SetArObj(Fields, "Estado_Academico", Estado_Academico)
		Call ewrpt_SetArObj(Fields, "Estado_Final", Estado_Final)
		Call ewrpt_SetArObj(Fields, "Descripcion", Descripcion)
		Call ewrpt_SetArObj(Fields, "Fecha_ResoluciF3n", Fecha_ResoluciF3n)
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
		SqlFrom = "ra_situ s, ra_tipositu t, mt_alumno al, mt_client c"
	End Property

	Public Property Get SqlSelect() ' Select
		SqlSelect = "SELECT al.RUT As Rut, c.PATERNO As Paterno, c.MATERNO As Materno, c.NOMBRE As Nombre, al.ESTACAD As [Estado Academico], t.ESTACAD As [Estado Final], s.ANO As Año, s.PERIODO As Periodo, al.CODCARPR As [Codigo Carrera], t.CODIGO As Codigo, t.DESCRIPCION As Descripcion, s.EMISION As [Fecha Resolución], s.OBSERVACION As Observación FROM " & SqlFrom
	End Property

	Public Property Get SqlWhere() ' Where
		SqlWhere = "s.CODCLI = al.CODCLI And s.TIPOSITU = t.CODIGO And c.CODCLI = al.RUT And (s.TIPOSITU = 48)"
	End Property

	Public Property Get SqlGroupBy() ' Group By
		SqlGroupBy = ""
	End Property

	Public Property Get SqlHaving() ' Having
		SqlHaving = ""
	End Property

	Public Property Get SqlOrderBy() ' Order By
		SqlOrderBy = "s.EMISION"
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
Dim Postergados_rpt
Set Postergados_rpt = New crPostergados_rpt
Set Page = Postergados_rpt

' Page init processing
Call Postergados_rpt.Page_Init()

' Page main processing
Call Postergados_rpt.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<% If Postergados.Export = "" Then %>
<script type="text/javascript">
<!--
// Create page object
var Postergados_rpt = new ewrpt_Page("Postergados_rpt");
// page properties
Postergados_rpt.PageID = "rpt"; // page ID
Postergados_rpt.FormID = "fPostergadosrptfilter"; // form ID
var EWRPT_PAGE_ID = Postergados_rpt.PageID;
// extend page with ValidateForm function
Postergados_rpt.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Postergados_rpt.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If EWRPT_CLIENT_VALIDATE Then %>
Postergados_rpt.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Postergados_rpt.ValidateRequired = false; // no JavaScript validation
<% End If %>
//-->
</script>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
//-->
</script>
<% End If %>
<% Postergados_rpt.ShowPageHeader() %>
<% If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg() %>
<% Postergados_rpt.ShowMessage() %>
<link rel="stylesheet" type="text/css" media="all" href="css/titles.css"/>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If Postergados.Export = "" Then %>
<script src="rptjs/popup.js" type="text/javascript"></script>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
</script>
<% End If %>
<% If Postergados.Export = "" Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline">
<h1><%= Postergados.TableCaption %></h1>
</div>
<% If Postergados.Export = "" Then %>
&nbsp;&nbsp;<a href="<%= Postergados_rpt.ExportExcelUrl %>&acc=<%=Request("acc")%>"><img src="images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
<% End If %>
<br><br>
<% If Postergados.Export = "" Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspreportmaker">
	<!-- Left slot -->
<% End If %>
<% If Postergados.Export = "" Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If Postergados.Export = "" Then %>
<%
If (Postergados.FilterPanelOption = 2) Or (Postergados.FilterPanelOption = 3 And Postergados_rpt.FilterApplied) Or (Postergados_rpt.Filter = "0=101") Then
	sButtonImage = "rptimages/collapse.gif"
	sDivDisplay = ""
Else
	sButtonImage = "rptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span>
<% If Postergados_rpt.FilterApplied Then %>
&nbsp;&nbsp;<a href="Postergadosrpt.asp?cmd=reset&acc=<%=Request("acc")%>"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fPostergadosrptfilter" id="fPostergadosrptfilter" action="Postergadosrpt.asp?acc=<%=Request("acc")%>" class="ewForm" onsubmit="return Postergados_rpt.ValidateForm(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.Rut.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Rut" id="so1_Rut" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Rut" id="sv1_Rut" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(Postergados.Rut.SearchValue) %>"<% If Postergados_rpt.ClearExtFilter = "Postergados_Rut" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.Nombre.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Nombre" id="so1_Nombre" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Nombre" id="sv1_Nombre" size="30" maxlength="32" value="<%= ewrpt_HtmlEncode(Postergados.Nombre.SearchValue) %>"<% If Postergados_rpt.ClearExtFilter = "Postergados_Nombre" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.Paterno.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Paterno" id="so1_Paterno" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Paterno" id="sv1_Paterno" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(Postergados.Paterno.SearchValue) %>"<% If Postergados_rpt.ClearExtFilter = "Postergados_Paterno" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.Materno.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_Materno" id="so1_Materno" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_Materno" id="sv1_Materno" size="30" maxlength="30" value="<%= ewrpt_HtmlEncode(Postergados.Materno.SearchValue) %>"<% If Postergados_rpt.ClearExtFilter = "Postergados_Materno" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.Codigo_Carrera.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Codigo_Carrera" id="sv_Codigo_Carrera"<%= ewrpt_IIf(Postergados_rpt.ClearExtFilter = "Postergados_Codigo_Carrera", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Postergados.Codigo_Carrera.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Postergados.Codigo_Carrera.CustomFilters) Then
	cntf = UBound(Postergados.Codigo_Carrera.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Postergados.Codigo_Carrera.DropDownList) Then
	cntd = UBound(Postergados.Codigo_Carrera.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Postergados.Codigo_Carrera.CustomFilters(i).FldName = "Codigo Carrera" Then
%>
		<option value="<%= "@@" & Postergados.Codigo_Carrera.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Postergados.Codigo_Carrera.DropDownValue, "@@" & Postergados.Codigo_Carrera.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Postergados.Codigo_Carrera.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Postergados.Codigo_Carrera.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Postergados.Codigo_Carrera.DropDownValue, Postergados.Codigo_Carrera.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Postergados.Codigo_Carrera.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.AF1o.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AF1o" id="sv_AF1o"<%= ewrpt_IIf(Postergados_rpt.ClearExtFilter = "Postergados_AF1o", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Postergados.AF1o.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Postergados.AF1o.CustomFilters) Then
	cntf = UBound(Postergados.AF1o.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Postergados.AF1o.DropDownList) Then
	cntd = UBound(Postergados.AF1o.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Postergados.AF1o.CustomFilters(i).FldName = "Año" Then
%>
		<option value="<%= "@@" & Postergados.AF1o.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Postergados.AF1o.DropDownValue, "@@" & Postergados.AF1o.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Postergados.AF1o.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Postergados.AF1o.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Postergados.AF1o.DropDownValue, Postergados.AF1o.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Postergados.AF1o.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.Periodo.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Periodo" id="sv_Periodo"<%= ewrpt_IIf(Postergados_rpt.ClearExtFilter = "Postergados_Periodo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Postergados.Periodo.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Postergados.Periodo.CustomFilters) Then
	cntf = UBound(Postergados.Periodo.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Postergados.Periodo.DropDownList) Then
	cntd = UBound(Postergados.Periodo.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Postergados.Periodo.CustomFilters(i).FldName = "Periodo" Then
%>
		<option value="<%= "@@" & Postergados.Periodo.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Postergados.Periodo.DropDownValue, "@@" & Postergados.Periodo.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Postergados.Periodo.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Postergados.Periodo.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Postergados.Periodo.DropDownValue, Postergados.Periodo.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Postergados.Periodo.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.Codigo.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Codigo" id="sv_Codigo"<%= ewrpt_IIf(Postergados_rpt.ClearExtFilter = "Postergados_Codigo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Postergados.Codigo.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Postergados.Codigo.CustomFilters) Then
	cntf = UBound(Postergados.Codigo.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Postergados.Codigo.DropDownList) Then
	cntd = UBound(Postergados.Codigo.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Postergados.Codigo.CustomFilters(i).FldName = "Codigo" Then
%>
		<option value="<%= "@@" & Postergados.Codigo.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Postergados.Codigo.DropDownValue, "@@" & Postergados.Codigo.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Postergados.Codigo.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Postergados.Codigo.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Postergados.Codigo.DropDownValue, Postergados.Codigo.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Postergados.Codigo.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.Estado_Academico.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Estado_Academico" id="sv_Estado_Academico"<%= ewrpt_IIf(Postergados_rpt.ClearExtFilter = "Postergados_Estado_Academico", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Postergados.Estado_Academico.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Postergados.Estado_Academico.CustomFilters) Then
	cntf = UBound(Postergados.Estado_Academico.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Postergados.Estado_Academico.DropDownList) Then
	cntd = UBound(Postergados.Estado_Academico.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Postergados.Estado_Academico.CustomFilters(i).FldName = "Estado Academico" Then
%>
		<option value="<%= "@@" & Postergados.Estado_Academico.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Postergados.Estado_Academico.DropDownValue, "@@" & Postergados.Estado_Academico.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Postergados.Estado_Academico.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Postergados.Estado_Academico.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Postergados.Estado_Academico.DropDownValue, Postergados.Estado_Academico.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Postergados.Estado_Academico.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Postergados.Estado_Final.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %></span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Estado_Final" id="sv_Estado_Final"<%= ewrpt_IIf(Postergados_rpt.ClearExtFilter = "Postergados_Estado_Final", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Postergados.Estado_Final.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Postergados.Estado_Final.CustomFilters) Then
	cntf = UBound(Postergados.Estado_Final.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Postergados.Estado_Final.DropDownList) Then
	cntd = UBound(Postergados.Estado_Final.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Postergados.Estado_Final.CustomFilters(i).FldName = "Estado Final" Then
%>
		<option value="<%= "@@" & Postergados.Estado_Final.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Postergados.Estado_Final.DropDownValue, "@@" & Postergados.Estado_Final.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Postergados.Estado_Final.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Postergados.Estado_Final.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Postergados.Estado_Final.DropDownValue, Postergados.Estado_Final.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Postergados.Estado_Final.DropDownList(i), "", 0) %></option>
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
<% If Postergados.ShowCurrentFilter Then %>
<div id="ewrptFilterList">
<% Call Postergados_rpt.ShowFilterList() %>
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
If (Postergados.ExportAll And Postergados.Export <> "") Then
	Postergados_rpt.StopGrp = Postergados_rpt.TotalGrps
Else
	Postergados_rpt.StopGrp = Postergados_rpt.StartGrp + Postergados_rpt.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(Postergados_rpt.StopGrp) > CLng(Postergados_rpt.TotalGrps) Then
	Postergados_rpt.StopGrp = Postergados_rpt.TotalGrps
End If
Postergados_rpt.RecCount = 0

' Init Summary Values
Call Postergados_rpt.ResetLevelSummary(0)

' Get first row
If Postergados_rpt.TotalGrps > 0 Then
	Call Postergados_rpt.GetRow(1)
	Postergados_rpt.GrpCount = 1
End If
Do While (Not rs.Eof And Postergados_rpt.GrpCount <= Postergados_rpt.DisplayGrps) Or (Postergados_rpt.ShowFirstHeader)

	' Show Header
	If Postergados_rpt.ShowFirstHeader Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Rut.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Rut) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Rut.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Rut) %>',0);"><%= Postergados.Rut.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Rut.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Rut.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Nombre.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Nombre) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Nombre.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Nombre) %>',0);"><%= Postergados.Nombre.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Nombre.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Nombre.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Paterno.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Paterno) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Paterno.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Paterno) %>',0);"><%= Postergados.Paterno.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Paterno.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Paterno.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Materno.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Materno) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Materno.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Materno) %>',0);"><%= Postergados.Materno.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Materno.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Materno.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Codigo_Carrera.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Codigo_Carrera) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Codigo_Carrera.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Codigo_Carrera) %>',0);"><%= Postergados.Codigo_Carrera.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Codigo_Carrera.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Codigo_Carrera.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.AF1o.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.AF1o) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.AF1o.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.AF1o) %>',0);"><%= Postergados.AF1o.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.AF1o.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.AF1o.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Periodo.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Periodo) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Periodo.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Periodo) %>',0);"><%= Postergados.Periodo.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Periodo.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Periodo.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Codigo.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Codigo) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Codigo.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Codigo) %>',0);"><%= Postergados.Codigo.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Codigo.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Codigo.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Estado_Academico.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Estado_Academico) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Estado_Academico.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Estado_Academico) %>',0);"><%= Postergados.Estado_Academico.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Estado_Academico.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Estado_Academico.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Estado_Final.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Estado_Final) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Estado_Final.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Estado_Final) %>',0);"><%= Postergados.Estado_Final.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Estado_Final.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Estado_Final.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Descripcion.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Descripcion) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Descripcion.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Descripcion) %>',0);"><%= Postergados.Descripcion.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Descripcion.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Descripcion.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.Fecha_ResoluciF3n.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.Fecha_ResoluciF3n) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.Fecha_ResoluciF3n.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.Fecha_ResoluciF3n) %>',0);"><%= Postergados.Fecha_ResoluciF3n.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.Fecha_ResoluciF3n.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.Fecha_ResoluciF3n.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Postergados.Export <> "" Then %>
<%= Postergados.ObservaciF3n.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Postergados.SortUrl(Postergados.ObservaciF3n) = "" Then %>
		<td style="vertical-align: bottom;"><%= Postergados.ObservaciF3n.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postergados.SortUrl(Postergados.ObservaciF3n) %>',0);"><%= Postergados.ObservaciF3n.FldCaption %></td><td style="width: 10px;">
		<% If Postergados.ObservaciF3n.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Postergados.ObservaciF3n.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Postergados_rpt.ShowFirstHeader = False
	End If
	Postergados_rpt.RecCount = Postergados_rpt.RecCount + 1

		' Render detail row
		Call Postergados.ResetCSS()
		Postergados.RowType = EWRPT_ROWTYPE_DETAIL
		Call Postergados_rpt.RenderRow()
%>
	<tr<%= Postergados.RowAttributes %>>
		<td<%= Postergados.Rut.CellAttributes %>>
<div<%= Postergados.Rut.ViewAttributes %>><%= Postergados.Rut.ListViewValue %></div>
</td>
		<td<%= Postergados.Nombre.CellAttributes %>>
<div<%= Postergados.Nombre.ViewAttributes %>><%= Postergados.Nombre.ListViewValue %></div>
</td>
		<td<%= Postergados.Paterno.CellAttributes %>>
<div<%= Postergados.Paterno.ViewAttributes %>><%= Postergados.Paterno.ListViewValue %></div>
</td>
		<td<%= Postergados.Materno.CellAttributes %>>
<div<%= Postergados.Materno.ViewAttributes %>><%= Postergados.Materno.ListViewValue %></div>
</td>
		<td<%= Postergados.Codigo_Carrera.CellAttributes %>>
<div<%= Postergados.Codigo_Carrera.ViewAttributes %>><%= Postergados.Codigo_Carrera.ListViewValue %></div>
</td>
		<td<%= Postergados.AF1o.CellAttributes %>>
<div<%= Postergados.AF1o.ViewAttributes %>><%= Postergados.AF1o.ListViewValue %></div>
</td>
		<td<%= Postergados.Periodo.CellAttributes %>>
<div<%= Postergados.Periodo.ViewAttributes %>><%= Postergados.Periodo.ListViewValue %></div>
</td>
		<td<%= Postergados.Codigo.CellAttributes %>>
<div<%= Postergados.Codigo.ViewAttributes %>><%= Postergados.Codigo.ListViewValue %></div>
</td>
		<td<%= Postergados.Estado_Academico.CellAttributes %>>
<div<%= Postergados.Estado_Academico.ViewAttributes %>><%= Postergados.Estado_Academico.ListViewValue %></div>
</td>
		<td<%= Postergados.Estado_Final.CellAttributes %>>
<div<%= Postergados.Estado_Final.ViewAttributes %>><%= Postergados.Estado_Final.ListViewValue %></div>
</td>
		<td<%= Postergados.Descripcion.CellAttributes %>>
<div<%= Postergados.Descripcion.ViewAttributes %>><%= Postergados.Descripcion.ListViewValue %></div>
</td>
		<td<%= Postergados.Fecha_ResoluciF3n.CellAttributes %>>
<div<%= Postergados.Fecha_ResoluciF3n.ViewAttributes %>><%= Postergados.Fecha_ResoluciF3n.ListViewValue %></div>
</td>
		<td<%= Postergados.ObservaciF3n.CellAttributes %>>
<div<%= Postergados.ObservaciF3n.ViewAttributes %>><%= Postergados.ObservaciF3n.ListViewValue %></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Call Postergados_rpt.AccumulateSummary()

		' Get next record
		Call Postergados_rpt.GetRow(2)
		Postergados_rpt.GrpCount = Postergados_rpt.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
	</tfoot>
</table>
</div>
<% If Postergados.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="Postergadosrpt.asp?acc=<%=Request("acc")%>" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(Postergados_rpt.StartGrp, Postergados_rpt.DisplayGrps, Postergados_rpt.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="Postergadosrpt.asp?start=<%= Pager.FirstButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="Postergadosrpt.asp?start=<%= Pager.PrevButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="Postergadosrpt.asp?start=<%= Pager.NextButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="Postergadosrpt.asp?start=<%= Pager.LastButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If Postergados_rpt.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If Postergados_rpt.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("RecordsPerPage") %>&nbsp;
<input type="hidden" name="acc" value="<%=Request("acc")%>">
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="10"<% If Postergados_rpt.DisplayGrps = 10 Then Response.Write " selected=""selected""" %>>10</option>
<option value="15"<% If Postergados_rpt.DisplayGrps = 15 Then Response.Write " selected=""selected""" %>>15</option>
<option value="20"<% If Postergados_rpt.DisplayGrps = 20 Then Response.Write " selected=""selected""" %>>20</option>
<option value="50"<% If Postergados_rpt.DisplayGrps = 50 Then Response.Write " selected=""selected""" %>>50</option>
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
<% If Postergados.Export = "" Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspreportmaker">
	<!-- Right slot -->
<% End If %>
<% If Postergados.Export = "" Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If Postergados.Export = "" Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Postergados_rpt.ShowPageFooter() %>
<%

' Close recordset and connection
rs.Close
Set rs = Nothing
%>
<% If Postergados.Export = "" Then %>
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
Set Postergados_rpt = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crPostergados_rpt

	' Page ID
	Public Property Get PageID()
		PageID = "rpt"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "Postergados"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "Postergados_rpt"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If Postergados.UseTokenInUrl Then PageUrl = PageUrl & "t=" & Postergados.TableVar & "&" ' add page token
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
		If Postergados.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (Postergados.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (Postergados.TableVar = Request.QueryString("t"))
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
		Set Postergados = New crPostergados

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "rpt"

		' Initialize table name
		EWRPT_TABLE_NAME = "Postergados"

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
			Postergados.Export = Request.QueryString("export")
		End If
		gsExport = Postergados.Export ' Get export parameter, used in header
		gsExportFile = Postergados.TableVar ' Get export file, used in header
		If Postergados.Export = "excel" Then
			Response.ContentType = "application/vnd.ms-excel"
			Response.AddHeader "Content-Disposition", "attachment; filename=" & gsExportFile & ".xls"
		End If

		' Global page loading event
		Call Page_Loading()

		' Page load event
		Call Page_Load()

		' Export to Email (Load content via XMLHttp)
		If Postergados.Export = "email" Then
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

		'wrkstr = "&filter=" & Postergados.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(Postergados.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(Postergados.StartGroup&""))
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
			Postergados.OrderBy = GetQSValue(QS, "o")
			Postergados.StartGroup = GetQSValue(QS, "s")
			Postergados.RestoreSession = True
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
		Set Postergados = Nothing

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
		nDtls = 13
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
		Call Postergados.CustomFilters_Load()

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
		If Postergados.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total count
		Dim sSql
		sSql = ewrpt_BuildReportSql(Postergados.SqlSelect, Postergados.SqlWhere, Postergados.SqlGroupBy, Postergados.SqlHaving, Postergados.SqlOrderBy, Filter, Sort)
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

		If Postergados.ExportAll And Postergados.Export <> "" Then
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
			Postergados.Rut.DbValue = ewrpt_GetValue(rs("Rut"))
			Postergados.Nombre.DbValue = ewrpt_GetValue(rs("Nombre"))
			Postergados.Paterno.DbValue = ewrpt_GetValue(rs("Paterno"))
			Postergados.Materno.DbValue = ewrpt_GetValue(rs("Materno"))
			Postergados.Codigo_Carrera.DbValue = ewrpt_GetValue(rs("Codigo Carrera"))
			Postergados.AF1o.DbValue = ewrpt_GetValue(rs("Año"))
			Postergados.Periodo.DbValue = ewrpt_GetValue(rs("Periodo"))
			Postergados.Codigo.DbValue = ewrpt_GetValue(rs("Codigo"))
			Postergados.Estado_Academico.DbValue = ewrpt_GetValue(rs("Estado Academico"))
			Postergados.Estado_Final.DbValue = ewrpt_GetValue(rs("Estado Final"))
			Postergados.Descripcion.DbValue = ewrpt_GetValue(rs("Descripcion"))
			Postergados.Fecha_ResoluciF3n.DbValue = ewrpt_GetValue(rs("Fecha Resolución"))
			Postergados.ObservaciF3n.DbValue = ewrpt_GetValue(rs("Observación"))
			Val(1) = Postergados.Rut.CurrentValue
			Val(2) = Postergados.Nombre.CurrentValue
			Val(3) = Postergados.Paterno.CurrentValue
			Val(4) = Postergados.Materno.CurrentValue
			Val(5) = Postergados.Codigo_Carrera.CurrentValue
			Val(6) = Postergados.AF1o.CurrentValue
			Val(7) = Postergados.Periodo.CurrentValue
			Val(8) = Postergados.Codigo.CurrentValue
			Val(9) = Postergados.Estado_Academico.CurrentValue
			Val(10) = Postergados.Estado_Final.CurrentValue
			Val(11) = Postergados.Descripcion.CurrentValue
			Val(12) = Postergados.Fecha_ResoluciF3n.CurrentValue
			Val(13) = Postergados.ObservaciF3n.CurrentValue
		Else
			Postergados.Rut.DbValue = ""
			Postergados.Nombre.DbValue = ""
			Postergados.Paterno.DbValue = ""
			Postergados.Materno.DbValue = ""
			Postergados.Codigo_Carrera.DbValue = ""
			Postergados.AF1o.DbValue = ""
			Postergados.Periodo.DbValue = ""
			Postergados.Codigo.DbValue = ""
			Postergados.Estado_Academico.DbValue = ""
			Postergados.Estado_Final.DbValue = ""
			Postergados.Descripcion.DbValue = ""
			Postergados.Fecha_ResoluciF3n.DbValue = ""
			Postergados.ObservaciF3n.DbValue = ""
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
			Postergados.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				Postergados.StartGroup = nStartGrp
			Else
				StartGrp = Postergados.StartGroup
			End If
		Else
			StartGrp = Postergados.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			Postergados.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			Postergados.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			Postergados.StartGroup = StartGrp
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
		Postergados.StartGroup = StartGrp
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
			Postergados.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			Postergados.StartGroup = nStartGrp
		Else
			If Postergados.GroupPerPage <> "" Then
				DisplayGrps = Postergados.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 15 ' Load Default
			End If
		End If
	End Sub

	' Render row
	Sub RenderRow()
		If Postergados.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' Get total count from sql directly
			Dim sSql, rstot
			sSql = ewrpt_BuildReportSql(Postergados.SqlSelectCount, Postergados.SqlWhere, PostergadosSqlGroupBy, Postergados.SqlHaving, "", Filter, "")
			If EWRPT_DEBUG_ENABLED Then Response.Write "(Total SQL): " & sSql & "<br>"
			Set rstot = ewrpt_LoadRs(sSql)
			If Not rstot.Eof Then
				TotCount = ewrpt_GetValue(rstot(0))
			Else
				TotCount = 0
			End If
		End If

		' Call Row_Rendering event
		Call Postergados.Row_Rendering()

		' --------------------
		'  Render view codes
		' --------------------

		If Postergados.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' Rut
			Postergados.Rut.ViewValue = Postergados.Rut.Summary

			' Nombre
			Postergados.Nombre.ViewValue = Postergados.Nombre.Summary

			' Paterno
			Postergados.Paterno.ViewValue = Postergados.Paterno.Summary

			' Materno
			Postergados.Materno.ViewValue = Postergados.Materno.Summary

			' Codigo Carrera
			Postergados.Codigo_Carrera.ViewValue = Postergados.Codigo_Carrera.Summary

			' Año
			Postergados.AF1o.ViewValue = Postergados.AF1o.Summary

			' Periodo
			Postergados.Periodo.ViewValue = Postergados.Periodo.Summary

			' Codigo
			Postergados.Codigo.ViewValue = Postergados.Codigo.Summary

			' Estado Academico
			Postergados.Estado_Academico.ViewValue = Postergados.Estado_Academico.Summary

			' Estado Final
			Postergados.Estado_Final.ViewValue = Postergados.Estado_Final.Summary

			' Descripcion
			Postergados.Descripcion.ViewValue = Postergados.Descripcion.Summary

			' Fecha Resolución
			Postergados.Fecha_ResoluciF3n.ViewValue = Postergados.Fecha_ResoluciF3n.Summary
			Postergados.Fecha_ResoluciF3n.ViewValue = ewrpt_FormatDateTime(Postergados.Fecha_ResoluciF3n.ViewValue, 7)

			' Observación
			Postergados.ObservaciF3n.ViewValue = Postergados.ObservaciF3n.Summary
		Else

			' Rut
			Postergados.Rut.ViewValue = Postergados.Rut.CurrentValue
			Call ewrpt_SetAttr(Postergados.Rut.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Nombre
			Postergados.Nombre.ViewValue = Postergados.Nombre.CurrentValue
			Call ewrpt_SetAttr(Postergados.Nombre.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Paterno
			Postergados.Paterno.ViewValue = Postergados.Paterno.CurrentValue
			Call ewrpt_SetAttr(Postergados.Paterno.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Materno
			Postergados.Materno.ViewValue = Postergados.Materno.CurrentValue
			Call ewrpt_SetAttr(Postergados.Materno.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Codigo Carrera
			Postergados.Codigo_Carrera.ViewValue = Postergados.Codigo_Carrera.CurrentValue
			Call ewrpt_SetAttr(Postergados.Codigo_Carrera.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Año
			Postergados.AF1o.ViewValue = Postergados.AF1o.CurrentValue
			Call ewrpt_SetAttr(Postergados.AF1o.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Periodo
			Postergados.Periodo.ViewValue = Postergados.Periodo.CurrentValue
			Call ewrpt_SetAttr(Postergados.Periodo.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Codigo
			Postergados.Codigo.ViewValue = Postergados.Codigo.CurrentValue
			Call ewrpt_SetAttr(Postergados.Codigo.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Estado Academico
			Postergados.Estado_Academico.ViewValue = Postergados.Estado_Academico.CurrentValue
			Call ewrpt_SetAttr(Postergados.Estado_Academico.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Estado Final
			Postergados.Estado_Final.ViewValue = Postergados.Estado_Final.CurrentValue
			Call ewrpt_SetAttr(Postergados.Estado_Final.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Descripcion
			Postergados.Descripcion.ViewValue = Postergados.Descripcion.CurrentValue
			Call ewrpt_SetAttr(Postergados.Descripcion.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Fecha Resolución
			Postergados.Fecha_ResoluciF3n.ViewValue = Postergados.Fecha_ResoluciF3n.CurrentValue
			Postergados.Fecha_ResoluciF3n.ViewValue = ewrpt_FormatDateTime(Postergados.Fecha_ResoluciF3n.ViewValue, 7)
			Call ewrpt_SetAttr(Postergados.Fecha_ResoluciF3n.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' Observación
			Postergados.ObservaciF3n.ViewValue = Postergados.ObservaciF3n.CurrentValue
			Call ewrpt_SetAttr(Postergados.ObservaciF3n.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))
		End If

		' Rut
		Postergados.Rut.HrefValue = ""

		' Nombre
		Postergados.Nombre.HrefValue = ""

		' Paterno
		Postergados.Paterno.HrefValue = ""

		' Materno
		Postergados.Materno.HrefValue = ""

		' Codigo Carrera
		Postergados.Codigo_Carrera.HrefValue = ""

		' Año
		Postergados.AF1o.HrefValue = ""

		' Periodo
		Postergados.Periodo.HrefValue = ""

		' Codigo
		Postergados.Codigo.HrefValue = ""

		' Estado Academico
		Postergados.Estado_Academico.HrefValue = ""

		' Estado Final
		Postergados.Estado_Final.HrefValue = ""

		' Descripcion
		Postergados.Descripcion.HrefValue = ""

		' Fecha Resolución
		Postergados.Fecha_ResoluciF3n.HrefValue = ""

		' Observación
		Postergados.ObservaciF3n.HrefValue = ""

		' Call Row_Rendered event
		Call Postergados.Row_Rendered()
	End Sub

	' Get extended filter values
	Sub GetExtendedFilterValues()
		Dim sSelectFld, sSelect, sWhere, sOrderBy
		Dim wrkSql, wrkRs

		' Field Codigo Carrera
		sSelect = "SELECT DISTINCT al.CODCARPR FROM " & Postergados.SqlFrom
		sWhere = Postergados.SqlWhere
		sOrderBy = "al.CODCARPR ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Postergados.Codigo_Carrera.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Año
		sSelect = "SELECT DISTINCT s.ANO FROM " & Postergados.SqlFrom
		sWhere = Postergados.SqlWhere
		sOrderBy = "s.ANO ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Postergados.AF1o.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Periodo
		sSelect = "SELECT DISTINCT s.PERIODO FROM " & Postergados.SqlFrom
		sWhere = Postergados.SqlWhere
		sOrderBy = "s.PERIODO ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Postergados.Periodo.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Codigo
		sSelect = "SELECT DISTINCT t.CODIGO FROM " & Postergados.SqlFrom
		sWhere = Postergados.SqlWhere
		sOrderBy = "t.CODIGO ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Postergados.Codigo.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Estado Academico
		sSelect = "SELECT DISTINCT al.ESTACAD FROM " & Postergados.SqlFrom
		sWhere = Postergados.SqlWhere
		sOrderBy = "al.ESTACAD ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Postergados.Estado_Academico.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field Estado Final
		sSelect = "SELECT DISTINCT t.ESTACAD FROM " & Postergados.SqlFrom
		sWhere = Postergados.SqlWhere
		sOrderBy = "t.ESTACAD ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Postergados.Estado_Final.DropDownList = ewrpt_GetDistinctValues("", wrkSql)
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
			' Field Rut

			Call SetSessionFilterValues(Postergados.Rut.SearchValue, Postergados.Rut.SearchOperator, Postergados.Rut.SearchCondition, Postergados.Rut.SearchValue2, Postergados.Rut.SearchOperator2, "Rut")

			' Field Nombre
			Call SetSessionFilterValues(Postergados.Nombre.SearchValue, Postergados.Nombre.SearchOperator, Postergados.Nombre.SearchCondition, Postergados.Nombre.SearchValue2, Postergados.Nombre.SearchOperator2, "Nombre")

			' Field Paterno
			Call SetSessionFilterValues(Postergados.Paterno.SearchValue, Postergados.Paterno.SearchOperator, Postergados.Paterno.SearchCondition, Postergados.Paterno.SearchValue2, Postergados.Paterno.SearchOperator2, "Paterno")

			' Field Materno
			Call SetSessionFilterValues(Postergados.Materno.SearchValue, Postergados.Materno.SearchOperator, Postergados.Materno.SearchCondition, Postergados.Materno.SearchValue2, Postergados.Materno.SearchOperator2, "Materno")

			' Field Codigo Carrera
			Call SetSessionDropDownValue(Postergados.Codigo_Carrera.DropDownValue, "Codigo_Carrera")

			' Field Año
			Call SetSessionDropDownValue(Postergados.AF1o.DropDownValue, "AF1o")

			' Field Periodo
			Call SetSessionDropDownValue(Postergados.Periodo.DropDownValue, "Periodo")

			' Field Codigo
			Call SetSessionDropDownValue(Postergados.Codigo.DropDownValue, "Codigo")

			' Field Estado Academico
			Call SetSessionDropDownValue(Postergados.Estado_Academico.DropDownValue, "Estado_Academico")

			' Field Estado Final
			Call SetSessionDropDownValue(Postergados.Estado_Final.DropDownValue, "Estado_Final")
			bSetupFilter = True ' Set up filter required
		Else

			' Field Rut
			If GetFilterValues(Postergados.Rut) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Nombre
			If GetFilterValues(Postergados.Nombre) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Paterno
			If GetFilterValues(Postergados.Paterno) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Materno
			If GetFilterValues(Postergados.Materno) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field Codigo Carrera
			If GetDropDownValue(Postergados.Codigo_Carrera) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Postergados.Codigo_Carrera.DropDownValue) Then
				If Postergados.Codigo_Carrera.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Postergados_Codigo_Carrera")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Año
			If GetDropDownValue(Postergados.AF1o) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Postergados.AF1o.DropDownValue) Then
				If Postergados.AF1o.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Postergados_AF1o")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Periodo
			If GetDropDownValue(Postergados.Periodo) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Postergados.Periodo.DropDownValue) Then
				If Postergados.Periodo.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Postergados_Periodo")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Codigo
			If GetDropDownValue(Postergados.Codigo) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Postergados.Codigo.DropDownValue) Then
				If Postergados.Codigo.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Postergados_Codigo")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Estado Academico
			If GetDropDownValue(Postergados.Estado_Academico) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Postergados.Estado_Academico.DropDownValue) Then
				If Postergados.Estado_Academico.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Postergados_Estado_Academico")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field Estado Final
			If GetDropDownValue(Postergados.Estado_Final) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Postergados.Estado_Final.DropDownValue) Then
				If Postergados.Estado_Final.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Postergados_Estado_Final")) Then
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

			' Field Rut
			Call GetSessionFilterValues(Postergados.Rut)

			' Field Nombre
			Call GetSessionFilterValues(Postergados.Nombre)

			' Field Paterno
			Call GetSessionFilterValues(Postergados.Paterno)

			' Field Materno
			Call GetSessionFilterValues(Postergados.Materno)

			' Field Codigo Carrera
			Call GetSessionDropDownValue(Postergados.Codigo_Carrera)

			' Field Año
			Call GetSessionDropDownValue(Postergados.AF1o)

			' Field Periodo
			Call GetSessionDropDownValue(Postergados.Periodo)

			' Field Codigo
			Call GetSessionDropDownValue(Postergados.Codigo)

			' Field Estado Academico
			Call GetSessionDropDownValue(Postergados.Estado_Academico)

			' Field Estado Final
			Call GetSessionDropDownValue(Postergados.Estado_Final)
		End If

		' Call page filter validated event
		Call Postergados.Page_FilterValidated()

		' Build sql
		' Field Rut

		Call BuildExtendedFilter(Postergados.Rut, sFilter)

		' Field Nombre
		Call BuildExtendedFilter(Postergados.Nombre, sFilter)

		' Field Paterno
		Call BuildExtendedFilter(Postergados.Paterno, sFilter)

		' Field Materno
		Call BuildExtendedFilter(Postergados.Materno, sFilter)

		' Field Codigo Carrera
		Call BuildDropDownFilter(Postergados.Codigo_Carrera, sFilter, "")

		' Field Año
		Call BuildDropDownFilter(Postergados.AF1o, sFilter, "")

		' Field Periodo
		Call BuildDropDownFilter(Postergados.Periodo, sFilter, "")

		' Field Codigo
		Call BuildDropDownFilter(Postergados.Codigo, sFilter, "")

		' Field Estado Academico
		Call BuildDropDownFilter(Postergados.Estado_Academico, sFilter, "")

		' Field Estado Final
		Call BuildDropDownFilter(Postergados.Estado_Final, sFilter, "")

		' Save parms to Session
		' Field Rut

		Call SetSessionFilterValues(Postergados.Rut.SearchValue, Postergados.Rut.SearchOperator, Postergados.Rut.SearchCondition, Postergados.Rut.SearchValue2, Postergados.Rut.SearchOperator2, "Rut")

		' Field Nombre
		Call SetSessionFilterValues(Postergados.Nombre.SearchValue, Postergados.Nombre.SearchOperator, Postergados.Nombre.SearchCondition, Postergados.Nombre.SearchValue2, Postergados.Nombre.SearchOperator2, "Nombre")

		' Field Paterno
		Call SetSessionFilterValues(Postergados.Paterno.SearchValue, Postergados.Paterno.SearchOperator, Postergados.Paterno.SearchCondition, Postergados.Paterno.SearchValue2, Postergados.Paterno.SearchOperator2, "Paterno")

		' Field Materno
		Call SetSessionFilterValues(Postergados.Materno.SearchValue, Postergados.Materno.SearchOperator, Postergados.Materno.SearchCondition, Postergados.Materno.SearchValue2, Postergados.Materno.SearchOperator2, "Materno")

		' Field Codigo Carrera
		Call SetSessionDropDownValue(Postergados.Codigo_Carrera.DropDownValue, "Codigo_Carrera")

		' Field Año
		Call SetSessionDropDownValue(Postergados.AF1o.DropDownValue, "AF1o")

		' Field Periodo
		Call SetSessionDropDownValue(Postergados.Periodo.DropDownValue, "Periodo")

		' Field Codigo
		Call SetSessionDropDownValue(Postergados.Codigo.DropDownValue, "Codigo")

		' Field Estado Academico
		Call SetSessionDropDownValue(Postergados.Estado_Academico.DropDownValue, "Estado_Academico")

		' Field Estado Final
		Call SetSessionDropDownValue(Postergados.Estado_Final.DropDownValue, "Estado_Final")

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
		If Not IsEmpty(Session("sv_Postergados_" & parm)) Then fld.DropDownValue = Session("sv_Postergados_" & parm)
	End Sub

	' Get filter values from Session
	Sub GetSessionFilterValues(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv1_Postergados_" & parm)) Then fld.SearchValue = Session("sv1_Postergados_" & parm)
		If Not IsEmpty(Session("so1_Postergados_" & parm)) Then fld.SearchOperator = Session("so1_Postergados_" & parm)
		If Not IsEmpty(Session("sc_Postergados_" & parm)) Then fld.SearchCondition = Session("sc_Postergados_" & parm)
		If Not IsEmpty(Session("sv2_Postergados_" & parm)) Then fld.SearchValue2 = Session("sv2_Postergados_" & parm)
		If Not IsEmpty(Session("so2_Postergados_" & parm)) Then fld.SearchOperator2 = Session("so2_Postergados_" & parm)
	End Sub

	' Set dropdown value to Session
	Sub SetSessionDropDownValue(sv, parm)
		Session("sv_Postergados_" & parm) = sv
	End Sub

	' Set filter values to Session
	Sub SetSessionFilterValues(sv1, so1, sc, sv2, so2, parm)
		Session("sv1_Postergados_" & parm) = sv1
		Session("so1_Postergados_" & parm) = so1
		Session("sc_Postergados_" & parm) = sc
		Session("sv2_Postergados_" & parm) = sv2
		Session("so2_Postergados_" & parm) = so2
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
		Session("sel_Postergados_" & parm) = ""
		Session("rf_Postergados_" & parm) = ""
		Session("rt_Postergados_" & parm) = ""
	End Sub

	' Load selection from session
	Sub LoadSelectionFromSession(parm)
		Dim fld
		Set fld = Postergados.GetField(parm)
		fld.SelectionList = Session("sel_Postergados_" & parm)
		fld.RangeFrom = Session("rf_Postergados_" & parm)
		fld.RangeTo = Session("rt_Postergados_" & parm)
	End Sub

	' Load default value for filters
	Sub LoadDefaultFilters()
		Dim sWrk, sSql, arwrk

		' --------------------------------------------------
		'  Set up default values for dropdown filters
		'
		' Field Codigo Carrera

		Postergados.Codigo_Carrera.DefaultDropDownValue = EWRPT_INIT_VALUE
		Postergados.Codigo_Carrera.DropDownValue = Postergados.Codigo_Carrera.DefaultDropDownValue

		' Field Año
		Postergados.AF1o.DefaultDropDownValue = EWRPT_INIT_VALUE
		Postergados.AF1o.DropDownValue = Postergados.AF1o.DefaultDropDownValue

		' Field Periodo
		Postergados.Periodo.DefaultDropDownValue = EWRPT_INIT_VALUE
		Postergados.Periodo.DropDownValue = Postergados.Periodo.DefaultDropDownValue

		' Field Codigo
		Postergados.Codigo.DefaultDropDownValue = EWRPT_INIT_VALUE
		Postergados.Codigo.DropDownValue = Postergados.Codigo.DefaultDropDownValue

		' Field Estado Academico
		Postergados.Estado_Academico.DefaultDropDownValue = EWRPT_INIT_VALUE
		Postergados.Estado_Academico.DropDownValue = Postergados.Estado_Academico.DefaultDropDownValue

		' Field Estado Final
		Postergados.Estado_Final.DefaultDropDownValue = EWRPT_INIT_VALUE
		Postergados.Estado_Final.DropDownValue = Postergados.Estado_Final.DefaultDropDownValue

		' --------------------------------------------------
		'  Set up default values for extended filters
		'
		' Field Rut

		Call SetDefaultExtFilter(Postergados.Rut, "=", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(Postergados.Rut)

		' Field Nombre
		Call SetDefaultExtFilter(Postergados.Nombre, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(Postergados.Nombre)

		' Field Paterno
		Call SetDefaultExtFilter(Postergados.Paterno, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(Postergados.Paterno)

		' Field Materno
		Call SetDefaultExtFilter(Postergados.Materno, "LIKE", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(Postergados.Materno)

		' --------------------------------------------------
		'  Set up default values for popup filters
		'  - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Function CheckFilter()

		' Check Rut Text filter
		If TextFilterApplied(Postergados.Rut) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Nombre Text filter
		If TextFilterApplied(Postergados.Nombre) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Paterno Text filter
		If TextFilterApplied(Postergados.Paterno) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Materno Text filter
		If TextFilterApplied(Postergados.Materno) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Codigo Carrera non-Text filter
		If NonTextFilterApplied(Postergados.Codigo_Carrera) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Año non-Text filter
		If NonTextFilterApplied(Postergados.AF1o) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Periodo non-Text filter
		If NonTextFilterApplied(Postergados.Periodo) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Codigo non-Text filter
		If NonTextFilterApplied(Postergados.Codigo) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Estado Academico non-Text filter
		If NonTextFilterApplied(Postergados.Estado_Academico) Then
			CheckFilter = True
			Exit Function
		End If

		' Check Estado Final non-Text filter
		If NonTextFilterApplied(Postergados.Estado_Final) Then
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

		' Field Rut
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(Postergados.Rut, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.Rut.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Nombre
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(Postergados.Nombre, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.Nombre.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Paterno
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(Postergados.Paterno, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.Paterno.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Materno
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(Postergados.Materno, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.Materno.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Codigo Carrera
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Postergados.Codigo_Carrera, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.Codigo_Carrera.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Año
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Postergados.AF1o, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.AF1o.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Periodo
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Postergados.Periodo, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.Periodo.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Codigo
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Postergados.Codigo, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.Codigo.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Estado Academico
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Postergados.Estado_Academico, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.Estado_Academico.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Estado Final
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Postergados.Estado_Final, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Postergados.Estado_Final.FldCaption & "<br>"
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
				Postergados.OrderBy = ""
				Postergados.StartGroup = 1
				Postergados.Rut.Sort = ""
				Postergados.Nombre.Sort = ""
				Postergados.Paterno.Sort = ""
				Postergados.Materno.Sort = ""
				Postergados.Codigo_Carrera.Sort = ""
				Postergados.AF1o.Sort = ""
				Postergados.Periodo.Sort = ""
				Postergados.Codigo.Sort = ""
				Postergados.Estado_Academico.Sort = ""
				Postergados.Estado_Final.Sort = ""
				Postergados.Descripcion.Sort = ""
				Postergados.Fecha_ResoluciF3n.Sort = ""
				Postergados.ObservaciF3n.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			Postergados.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				Postergados.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				Postergados.CurrentOrderType = ""
			End If
			sSortSql = Postergados.SortSql
			Postergados.OrderBy = sSortSql
			Postergados.StartGroup = 1
		End If
		GetSort = Postergados.OrderBy
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
