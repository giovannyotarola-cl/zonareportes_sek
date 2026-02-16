<%
If (Session("idusuario") = False) Then
	Response.Redirect("../../default.asp?s=out")
	
End If
Dim sExport, i, sTmp
%>
<!--#include file="rptinc/ewrcfg3.asp"-->
<!--#include file="rptinc/ewrfn3.asp"-->
<%
Response.Expires = 0
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "pragma", "no-cache"
Response.AddHeader "cache-control", "private, no-cache, no-store, must-revalidate"
%>
<%
Dim starttime
starttime = Timer

' Open connection to the database
Dim uPermiso 
Set conn = Server.CreateObject("ADODB.Connection")
Set uPermiso = Server.CreateObject ("ADODB.Recordset")
conn.Open EW_REPORT_CONNECTION_STRING

' ASP Report Maker 3.0+ - Table level configuration (Asignaturas Historicas)
' Table Level Constants
'uPermiso.Open "SELECT * FROM IF_USUARIO_ACCESO WHERE USERID = '" & Session("idusuario") & "' AND CODLINK = '" &Request("acc") & "'", conn

'If (uPermiso.EOF = true) then
'	Response.Redirect("../../report.asp?aut=false")
'End If	

Const EW_REPORT_TABLE_VAR = "HistoricoReprobados"
Const EW_REPORT_TABLE_SESSION_GROUP_PER_PAGE = "HistoricoReprobados_grpperpage"
Const EW_REPORT_TABLE_SESSION_START_GROUP = "HistoricoReprobados_start"
Const EW_REPORT_TABLE_SESSION_SEARCH = "HistoricoReprobados_search"
Const EW_REPORT_TABLE_SESSION_CHILD_USER_ID = "HistoricoReprobados_childuserid"
Const EW_REPORT_TABLE_SESSION_ORDER_BY = "HistoricoReprobados_orderby"

' Table Level SQL
Const EW_REPORT_TABLE_SQL_FROM = "[Vista_AlumnosReprobados]"
Dim EW_REPORT_TABLE_SQL_SELECT
EW_REPORT_TABLE_SQL_SELECT = "SELECT * FROM " & EW_REPORT_TABLE_SQL_FROM
Dim EW_REPORT_TABLE_SQL_WHERE
EW_REPORT_TABLE_SQL_WHERE = ""
Const EW_REPORT_TABLE_SQL_GROUPBY = ""
Const EW_REPORT_TABLE_SQL_HAVING = ""
Const EW_REPORT_TABLE_SQL_ORDERBY = ""
Const EW_REPORT_TABLE_SQL_USERID_FILTER = ""
Dim EW_REPORT_TABLE_SQL_CHART_BASE
EW_REPORT_TABLE_SQL_CHART_BASE = EW_REPORT_TABLE_SQL_FROM

' Table Level Group SQL
Const EW_REPORT_TABLE_FIRST_GROUP_FIELD = ""
Dim EW_REPORT_TABLE_SQL_SELECT_GROUP, EW_REPORT_TABLE_SQL_ORDERBY_GROUP
EW_REPORT_TABLE_SQL_SELECT_GROUP = "SELECT DISTINCT " & EW_REPORT_TABLE_FIRST_GROUP_FIELD & " FROM " & EW_REPORT_TABLE_SQL_FROM
EW_REPORT_TABLE_SQL_ORDERBY_GROUP = " "

' Table Level Aggregate SQL
Dim EW_REPORT_TABLE_SQL_SELECT_AGG
EW_REPORT_TABLE_SQL_SELECT_AGG = "SELECT * FROM " & EW_REPORT_TABLE_SQL_FROM
Const EW_REPORT_TABLE_SQL_AGG_PFX = ""
Const EW_REPORT_TABLE_SQL_AGG_SFX = ""
Dim EW_REPORT_TABLE_SQL_SELECT_COUNT
EW_REPORT_TABLE_SQL_SELECT_COUNT = "SELECT COUNT(*) FROM " & EW_REPORT_TABLE_SQL_FROM
Dim af_FACULTAD ' Advanced filter for FACULTAD
Dim af_CARRERA ' Advanced filter for CARRERA
Dim af_RAMO ' Advanced filter for RAMO
Dim af_RUT ' Advanced filter for RUT
Dim af_DIG ' Advanced filter for DIG
Dim af_PATERNO ' Advanced filter for PATERNO
Dim af_MATERNO ' Advanced filter for MATERNO
Dim af_NOMBRE ' Advanced filter for NOMBRE
Dim af_CODRAMO ' Advanced filter for CODRAMO
Dim af_CODSECC ' Advanced filter for CODSECC
Dim af_CODCLI ' Advanced filter for CODCLI
Dim af_ANO ' Advanced filter for ANO
Dim af_PERIODO ' Advanced filter for PERIODO
Dim af_NP ' Advanced filter for NP
Dim af_NE ' Advanced filter for NE
Dim af_NPR ' Advanced filter for NPR
Dim af_NER ' Advanced filter for NER
Dim af_NEP ' Advanced filter for NEP
Dim af_NERP ' Advanced filter for NERP
Dim af_NF ' Advanced filter for NF
Dim af_NFP ' Advanced filter for NFP
Dim af_ESTADO ' Advanced filter for ESTADO
Dim af_ASISTENCIA ' Advanced filter for ASISTENCIA
Dim af_NCERT1 ' Advanced filter for NCERT1
Dim af_NCERT2 ' Advanced filter for NCERT2
Dim af_NCERT3 ' Advanced filter for NCERT3
Dim af_NCERT4 ' Advanced filter for NCERT4
Dim af_NCERT5 ' Advanced filter for NCERT5
Dim af_NCERT6 ' Advanced filter for NCERT6
Dim af_NCERT7 ' Advanced filter for NCERT7
Dim af_NCERT8 ' Advanced filter for NCERT8
Dim af_NCERT9 ' Advanced filter for NCERT9
Dim af_NCERT10 ' Advanced filter for NCERT10
%>
<% Response.buffer = False %>
<% Server.ScriptTimeOut = 240 %>
<%
sExport = Request.QueryString("export") ' Load Export Request
If sExport = "excel" Then
	Response.ContentType = "application/vnd.ms-excel"
	Response.AddHeader "Content-Disposition", "attachment; filename=" & EW_REPORT_TABLE_VAR & ".xls"
End If
%>
<%

' Initialize common variables
' Paging variables

Dim nRecCount: nRecCount = 0       ' Record Count
Dim nStartGrp: nStartGrp = 0       ' Start Group
Dim nStopGrp: nStopGrp = 0         ' Stop Group
Dim nTotalGrps: nTotalGrps = 0     ' Total Groups
Dim nGrpCount: nGrpCount = 0       ' Group Count
Dim nDisplayGrps: nDisplayGrps = 40 ' Groups per page
Dim nGrpRange: nGrpRange = 10

' Clear field for ext filter
Dim sClearExtFilter
Dim sClearInputClass

' Non-Text Extended Filters
' Field FACULTAD

Dim sv_FACULTAD, svd_FACULTAD
Dim sr_FACULTAD

' Field CARRERA
Dim sv_CARRERA, svd_CARRERA
Dim sr_CARRERA

' Text Extended filters
' Field RUT

Dim sv1_RUT, sv1d_RUT
Dim sv2_RUT, sv2d_RUT
Dim so1_RUT, so1d_RUT
Dim so2_RUT, so2d_RUT
Dim sc_RUT, scd_RUT

' Field CODRAMO
Dim sv1_CODRAMO, sv1d_CODRAMO
Dim sv2_CODRAMO, sv2d_CODRAMO
Dim so1_CODRAMO, so1d_CODRAMO
Dim so2_CODRAMO, so2d_CODRAMO
Dim sc_CODRAMO, scd_CODRAMO

' Field CODSECC
Dim sv1_CODSECC, sv1d_CODSECC
Dim sv2_CODSECC, sv2d_CODSECC
Dim so1_CODSECC, so1d_CODSECC
Dim so2_CODSECC, so2d_CODSECC
Dim sc_CODSECC, scd_CODSECC

' Field ANO
Dim sv1_ANO, sv1d_ANO
Dim sv2_ANO, sv2d_ANO
Dim so1_ANO, so1d_ANO
Dim so2_ANO, so2d_ANO
Dim sc_ANO, scd_ANO

' Field PERIODO
Dim sv1_PERIODO, sv1d_PERIODO
Dim sv2_PERIODO, sv2d_PERIODO
Dim so1_PERIODO, so1d_PERIODO
Dim so2_PERIODO, so2d_PERIODO
Dim sc_PERIODO, scd_PERIODO

' Field NP
Dim sv1_NP, sv1d_NP
Dim sv2_NP, sv2d_NP
Dim so1_NP, so1d_NP
Dim so2_NP, so2d_NP
Dim sc_NP, scd_NP

' Field NF
Dim sv1_NF, sv1d_NF
Dim sv2_NF, sv2d_NF
Dim so1_NF, so1d_NF
Dim so2_NF, so2d_NF
Dim sc_NF, scd_NF

' Field ASISTENCIA
Dim sv1_ASISTENCIA, sv1d_ASISTENCIA
Dim sv2_ASISTENCIA, sv2d_ASISTENCIA
Dim so1_ASISTENCIA, so1d_ASISTENCIA
Dim so2_ASISTENCIA, so2d_ASISTENCIA
Dim sc_ASISTENCIA, scd_ASISTENCIA

' Custom filters
Dim ewrpt_CustomFilters
%>
<%
%>
<%

' Field variables
Dim x_FACULTAD: x_FACULTAD = Null
Dim x_CARRERA: x_CARRERA = Null
Dim x_RAMO: x_RAMO = Null
Dim x_RUT: x_RUT = Null
Dim x_DIG: x_DIG = Null
Dim x_PATERNO: x_PATERNO = Null
Dim x_MATERNO: x_MATERNO = Null
Dim x_NOMBRE: x_NOMBRE = Null
Dim x_CODRAMO: x_CODRAMO = Null
Dim x_CODSECC: x_CODSECC = Null
Dim x_CODCLI: x_CODCLI = Null
Dim x_ANO: x_ANO = Null
Dim x_PERIODO: x_PERIODO = Null
Dim x_NP: x_NP = Null
Dim x_NE: x_NE = Null
Dim x_NPR: x_NPR = Null
Dim x_NER: x_NER = Null
Dim x_NEP: x_NEP = Null
Dim x_NERP: x_NERP = Null
Dim x_NF: x_NF = Null
Dim x_NFP: x_NFP = Null
Dim x_ESTADO: x_ESTADO = Null
Dim x_ASISTENCIA: x_ASISTENCIA = Null
Dim x_NCERT1: x_NCERT1 = Null
Dim x_NCERT2: x_NCERT2 = Null
Dim x_NCERT3: x_NCERT3 = Null
Dim x_NCERT4: x_NCERT4 = Null
Dim x_NCERT5: x_NCERT5 = Null
Dim x_NCERT6: x_NCERT6 = Null
Dim x_NCERT7: x_NCERT7 = Null
Dim x_NCERT8: x_NCERT8 = Null
Dim x_NCERT9: x_NCERT9 = Null
Dim x_NCERT10: x_NCERT10 = Null

' Detail variables
Dim o_FACULTAD, t_FACULTAD, ft_FACULTAD
o_FACULTAD = Null: t_FACULTAD = Null: ft_FACULTAD = 200
Dim rf_FACULTAD, rt_FACULTAD
Dim o_CARRERA, t_CARRERA, ft_CARRERA
o_CARRERA = Null: t_CARRERA = Null: ft_CARRERA = 200
Dim rf_CARRERA, rt_CARRERA
Dim o_RAMO, t_RAMO, ft_RAMO
o_RAMO = Null: t_RAMO = Null: ft_RAMO = 200
Dim rf_RAMO, rt_RAMO
Dim o_RUT, t_RUT, ft_RUT
o_RUT = Null: t_RUT = Null: ft_RUT = 200
Dim rf_RUT, rt_RUT
Dim o_DIG, t_DIG, ft_DIG
o_DIG = Null: t_DIG = Null: ft_DIG = 200
Dim rf_DIG, rt_DIG
Dim o_PATERNO, t_PATERNO, ft_PATERNO
o_PATERNO = Null: t_PATERNO = Null: ft_PATERNO = 200
Dim rf_PATERNO, rt_PATERNO
Dim o_MATERNO, t_MATERNO, ft_MATERNO
o_MATERNO = Null: t_MATERNO = Null: ft_MATERNO = 200
Dim rf_MATERNO, rt_MATERNO
Dim o_NOMBRE, t_NOMBRE, ft_NOMBRE
o_NOMBRE = Null: t_NOMBRE = Null: ft_NOMBRE = 200
Dim rf_NOMBRE, rt_NOMBRE
Dim o_CODRAMO, t_CODRAMO, ft_CODRAMO
o_CODRAMO = Null: t_CODRAMO = Null: ft_CODRAMO = 200
Dim rf_CODRAMO, rt_CODRAMO
Dim o_CODSECC, t_CODSECC, ft_CODSECC
o_CODSECC = Null: t_CODSECC = Null: ft_CODSECC = 131
Dim rf_CODSECC, rt_CODSECC
Dim o_CODCLI, t_CODCLI, ft_CODCLI
o_CODCLI = Null: t_CODCLI = Null: ft_CODCLI = 200
Dim rf_CODCLI, rt_CODCLI
Dim o_ANO, t_ANO, ft_ANO
o_ANO = Null: t_ANO = Null: ft_ANO = 200
Dim rf_ANO, rt_ANO
Dim o_PERIODO, t_PERIODO, ft_PERIODO
o_PERIODO = Null: t_PERIODO = Null: ft_PERIODO = 200
Dim rf_PERIODO, rt_PERIODO
Dim o_NP, t_NP, ft_NP
o_NP = Null: t_NP = Null: ft_NP = 131
Dim rf_NP, rt_NP
Dim o_NE, t_NE, ft_NE
o_NE = Null: t_NE = Null: ft_NE = 131
Dim rf_NE, rt_NE
Dim o_NPR, t_NPR, ft_NPR
o_NPR = Null: t_NPR = Null: ft_NPR = 131
Dim rf_NPR, rt_NPR
Dim o_NER, t_NER, ft_NER
o_NER = Null: t_NER = Null: ft_NER = 131
Dim rf_NER, rt_NER
Dim o_NEP, t_NEP, ft_NEP
o_NEP = Null: t_NEP = Null: ft_NEP = 200
Dim rf_NEP, rt_NEP
Dim o_NERP, t_NERP, ft_NERP
o_NERP = Null: t_NERP = Null: ft_NERP = 200
Dim rf_NERP, rt_NERP
Dim o_NF, t_NF, ft_NF
o_NF = Null: t_NF = Null: ft_NF = 131
Dim rf_NF, rt_NF
Dim o_NFP, t_NFP, ft_NFP
o_NFP = Null: t_NFP = Null: ft_NFP = 200
Dim rf_NFP, rt_NFP
Dim o_ESTADO, t_ESTADO, ft_ESTADO
o_ESTADO = Null: t_ESTADO = Null: ft_ESTADO = 200
Dim rf_ESTADO, rt_ESTADO
Dim o_ASISTENCIA, t_ASISTENCIA, ft_ASISTENCIA
o_ASISTENCIA = Null: t_ASISTENCIA = Null: ft_ASISTENCIA = 131
Dim rf_ASISTENCIA, rt_ASISTENCIA
Dim o_NCERT1, t_NCERT1, ft_NCERT1
o_NCERT1 = Null: t_NCERT1 = Null: ft_NCERT1 = 131
Dim rf_NCERT1, rt_NCERT1
Dim o_NCERT2, t_NCERT2, ft_NCERT2
o_NCERT2 = Null: t_NCERT2 = Null: ft_NCERT2 = 131
Dim rf_NCERT2, rt_NCERT2
Dim o_NCERT3, t_NCERT3, ft_NCERT3
o_NCERT3 = Null: t_NCERT3 = Null: ft_NCERT3 = 131
Dim rf_NCERT3, rt_NCERT3
Dim o_NCERT4, t_NCERT4, ft_NCERT4
o_NCERT4 = Null: t_NCERT4 = Null: ft_NCERT4 = 131
Dim rf_NCERT4, rt_NCERT4
Dim o_NCERT5, t_NCERT5, ft_NCERT5
o_NCERT5 = Null: t_NCERT5 = Null: ft_NCERT5 = 131
Dim rf_NCERT5, rt_NCERT5
Dim o_NCERT6, t_NCERT6, ft_NCERT6
o_NCERT6 = Null: t_NCERT6 = Null: ft_NCERT6 = 131
Dim rf_NCERT6, rt_NCERT6
Dim o_NCERT7, t_NCERT7, ft_NCERT7
o_NCERT7 = Null: t_NCERT7 = Null: ft_NCERT7 = 131
Dim rf_NCERT7, rt_NCERT7
Dim o_NCERT8, t_NCERT8, ft_NCERT8
o_NCERT8 = Null: t_NCERT8 = Null: ft_NCERT8 = 131
Dim rf_NCERT8, rt_NCERT8
Dim o_NCERT9, t_NCERT9, ft_NCERT9
o_NCERT9 = Null: t_NCERT9 = Null: ft_NCERT9 = 131
Dim rf_NCERT9, rt_NCERT9
Dim o_NCERT10, t_NCERT10, ft_NCERT10
o_NCERT10 = Null: t_NCERT10 = Null: ft_NCERT10 = 131
Dim rf_NCERT10, rt_NCERT10
%>
<%

' Filter
Dim sFilter: sFilter = ""
Dim bFilterApplied
Dim sButtonImage, sDivDisplay

' Aggregate variables
Dim ix, iy

' 1st dimension = no of groups (level 0 used for grand total)
' 2nd dimension = no of fields

Dim col(33), val(33), cnt(0,33)
Dim smry(0,33), mn(0,33), mx(0,33)
Dim grandsmry(33), grandmn(33), grandmx(33)

' Set up if accumulation required
col(1) = False
col(2) = False
col(3) = False
col(4) = False
col(5) = False
col(6) = False
col(7) = False
col(8) = False
col(9) = False
col(10) = False
col(11) = False
col(12) = False
col(13) = False
col(14) = False
col(15) = False
col(16) = False
col(17) = False
col(18) = False
col(19) = False
col(20) = False
col(21) = False
col(22) = False
col(23) = False
col(24) = False
col(25) = False
col(26) = False
col(27) = False
col(28) = False
col(29) = False
col(30) = False
col(31) = False
col(32) = False
col(33) = False

' Set up groups per page dynamically
SetUpDisplayGrps()

' Detail popup & selection values
' Load default filter values

Call LoadDefaultFilters()

' Set up popup filter
Call SetupPopup()

' Extended filter
Dim sExtendedFilter
sExtendedFilter = ""

' Get dropdown values
Call GetExtendedFilterValues()

' Set up custom filters
Call SetupCustomFilters()

' Build extended filter
sExtendedFilter = GetExtendedFilter()
If sExtendedFilter <> "" Then
	If sFilter <> "" Then
		sFilter = "(" & sFilter & ") AND (" & sExtendedFilter & ")"
	Else
		sFilter = sExtendedFilter
	End If
End If

' Build popup filter
Dim sPopupFilter
sPopupFilter = GetPopupFilter()

'Response.Write "popup filter: " & sPopupFilter & "<br>"
IF sPopupFilter <> "" Then
	If sFilter <> "" Then
		sFilter = "(" & sFilter & ") AND (" & sPopupFilter & ")"
	Else
		sFilter = sPopupFilter
	End If
End If

' Check if filter applied
bFilterApplied = CheckFilter()

' Get sort
Dim sSort
sSort = getSort()

' Get total count
sSql = ewrpt_BuildReportSql(EW_REPORT_TABLE_SQL_SELECT, EW_REPORT_TABLE_SQL_WHERE, EW_REPORT_TABLE_SQL_GROUPBY, EW_REPORT_TABLE_SQL_HAVING, EW_REPORT_TABLE_SQL_ORDERBY, sFilter, sSort)
nTotalGrps = ewrpt_LoadRecordCount(sSql)

' Display all records
If nDisplayGrps <= 0 Then
	nDisplayGrps = nTotalGrps
End If
nStartGrp = 1

' Show header
Dim bShowFirstHeader
bShowFirstHeader = (nTotalGrps > 0)

'bShowFirstHeader = True ' Uncomment to always show header
' Set up start position if not export all

If EW_REPORT_EXPORT_ALL And sExport <> "" Then
	nDisplayGrps = nTotalGrps
Else
	Call SetUpStartGroup()
End If 

' Get current page records
Dim rs
If EW_REPORT_DEBUG_ENABLED Then Response.Write "sql: " & sSql & "<br>"
Set rs = GetRs(sSql, nStartGrp, nDisplayGrps)
%>
<!--#include file="rptinc/header.asp"-->
<% If sExport = "" Then %>
<script type="text/javascript">
var EW_REPORT_DATE_SEPARATOR = "/";
if (EW_REPORT_DATE_SEPARATOR == "") EW_REPORT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="rptjs/ewrpt.js"></script>
<script type="text/javascript">
<!--
function ewrpt_ValidateExtFilter(form_obj) {
var elm = form_obj.sv1_CODSECC;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - CODSECC"))
		return false;
}
var elm = form_obj.sv1_NP;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - NP"))
		return false;
}
var elm = form_obj.sv1_NF;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - NF"))
		return false;
}
var elm = form_obj.sv1_ASISTENCIA;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - ASISTENCIA"))
		return false;
}
	return true;
}
//-->
</script>
<% End If %>
<% If sExport = "" Then %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="JavaScript" src="rptjs/popup.js" type="text/javascript"></script>
<script language="JavaScript" src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script language="JavaScript" src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
<!--
var EW_REPORT_POPUP_ALL = "(All)";
var EW_REPORT_POPUP_OK = "  OK  ";
var EW_REPORT_POPUP_CANCEL = "Cancel";
var EW_REPORT_POPUP_FROM = "From";
var EW_REPORT_POPUP_TO = "To";
var EW_REPORT_POPUP_PLEASE_SELECT = "Please Select";
var EW_REPORT_POPUP_NO_VALUE = "No value selected!";
<% Dim jsdata %>
// popup fields
//-->
</script>
<% End If %>
<% If sExport = "" Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline">
	<h1>Historico Alumnos Reprobados</h1>
</div>

<% If sExport = "" Then %>
&nbsp;&nbsp;<a href="HistoricoReprobadossmry.asp?export=excel&acc=<%=Request("acc")%>"><img src="images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
<% End If %>
<br><br>
<% If sExport = "" Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td valign="top"><div id="ewLeft" class="aspreportmaker">
	<!-- Left slot -->
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td valign="top" class="ewPadding"><div id="ewCenter" class="aspreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If sExport = "" Then %>
<%
If (EW_REPORT_FILTER_PANEL_OPTION = 2) Or (EW_REPORT_FILTER_PANEL_OPTION = 3 And bFilterApplied) Or (sFilter = "0=101") Then
	sButtonImage = "rptimages/collapse.gif"
	sDivDisplay = ""
Else
	sButtonImage = "rptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspreportmaker">&nbsp;Filtros</span>
<% If bFilterApplied Then %>
&nbsp;&nbsp;<a href="HistoricoReprobadossmry.asp?cmd=reset&acc=<%=Request("acc")%>">Resetear Filtros</a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fHistoricoReprobadossummaryfilter" id="fHistoricoReprobadossummaryfilter" action="HistoricoReprobadossmry.asp?acc=<%=Request("acc")%>" class="ewForm" onSubmit="return ewrpt_ValidateExtFilter(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr>
		<td><span class="aspreportmaker">FACULTAD</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FACULTAD" id="sv_FACULTAD"<% If sClearExtFilter = "HistoricoReprobados_FACULTAD" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
		<option value="<%= EW_REPORT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(sv_FACULTAD, EW_REPORT_ALL_VALUE) Then Response.Write " selected" %>></option>
<%

' Extended Filter
If IsArray(ewrpt_CustomFilters) Then
	cntf = UBound(ewrpt_CustomFilters,2)+1
Else
	cntf = 0
End If
If IsArray(sr_FACULTAD) Then
	cntd = UBound(sr_FACULTAD)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If ewrpt_CustomFilters(0,i) = "FACULTAD" Then
%>
		<option value="<%= "@@" & ewrpt_CustomFilters(1,i) %>"<% If ewrpt_MatchedFilterValue(sv_FACULTAD, "@@" & ewrpt_CustomFilters(1,i)) Then Response.Write " selected" %>><%= ewrpt_CustomFilters(2,i) %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= sr_FACULTAD(i) %>"<% If ewrpt_MatchedFilterValue(sv_FACULTAD, sr_FACULTAD(i)) Then Response.Write " selected" %>><%= ewrpt_DropDownDisplayValue(sr_FACULTAD(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker">CARRERA</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CARRERA" id="sv_CARRERA"<% If sClearExtFilter = "HistoricoReprobados_CARRERA" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
		<option value="<%= EW_REPORT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(sv_CARRERA, EW_REPORT_ALL_VALUE) Then Response.Write " selected" %>></option>
<%

' Extended Filter
If IsArray(ewrpt_CustomFilters) Then
	cntf = UBound(ewrpt_CustomFilters,2)+1
Else
	cntf = 0
End If
If IsArray(sr_CARRERA) Then
	cntd = UBound(sr_CARRERA)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If ewrpt_CustomFilters(0,i) = "CARRERA" Then
%>
		<option value="<%= "@@" & ewrpt_CustomFilters(1,i) %>"<% If ewrpt_MatchedFilterValue(sv_CARRERA, "@@" & ewrpt_CustomFilters(1,i)) Then Response.Write " selected" %>><%= ewrpt_CustomFilters(2,i) %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= sr_CARRERA(i) %>"<% If ewrpt_MatchedFilterValue(sv_CARRERA, sr_CARRERA(i)) Then Response.Write " selected" %>><%= ewrpt_DropDownDisplayValue(sr_CARRERA(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
<% If sClearExtFilter = "HistoricoReprobados_RUT" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">RUT</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_RUT" id="so1_RUT" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="30" value="<%= Server.HTMLEncode(sv1_RUT&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "HistoricoReprobados_CODRAMO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">CODIGO RAMO</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_CODRAMO" id="so1_CODRAMO" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_CODRAMO" id="sv1_CODRAMO" size="30" maxlength="30" value="<%= Server.HTMLEncode(sv1_CODRAMO&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "HistoricoReprobados_CODSECC" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">CODIGO SECCI&Oacute;N</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_CODSECC" id="so1_CODSECC" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_CODSECC" id="sv1_CODSECC" size="30" value="<%= Server.HTMLEncode(sv1_CODSECC&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "HistoricoReprobados_ANO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">A&Ntilde;O</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_ANO" id="so1_ANO" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_ANO" id="sv1_ANO" size="30" maxlength="4" value="<%= Server.HTMLEncode(sv1_ANO&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "HistoricoReprobados_PERIODO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">PERIODO</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_PERIODO" id="so1_PERIODO" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_PERIODO" id="sv1_PERIODO" size="30" maxlength="1" value="<%= Server.HTMLEncode(sv1_PERIODO&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "HistoricoReprobados_NP" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">NOTA PRESINTACI&Oacute;N</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_NP" id="so1_NP" value=">="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_NP" id="sv1_NP" size="30" value="<%= Server.HTMLEncode(sv1_NP&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "HistoricoReprobados_NF" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">NOTA FINAL</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_NF" id="so1_NF" value=">="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_NF" id="sv1_NF" size="30" value="<%= Server.HTMLEncode(sv1_NF&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "HistoricoReprobados_ASISTENCIA" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">ASISTENCIA</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_ASISTENCIA" id="so1_ASISTENCIA" value=">="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_ASISTENCIA" id="sv1_ASISTENCIA" size="30" value="<%= Server.HTMLEncode(sv1_ASISTENCIA&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
</table>
<table class="ewRptExtFilter">
	<tr>
		<td><span class="aspreportmaker">
        	<input type="hidden" name="acc" value="<%=Request("acc")%>">
			<input type="Submit" name="Submit" id="Submit" value="Buscar">&nbsp;
			<input type="Reset" name="Reset" id="Reset" value="Cancelar">&nbsp;
		</span></td>
	</tr>
</table>
</form>
<!-- Search form (end) -->
</div>
<br>
<% End If %>
<% If EW_REPORT_SHOW_CURRENT_FILTER Then %>
<div id="ewrptFilterList">
<% Call ShowFilterList() %>
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
If (EW_REPORT_EXPORT_ALL And sExport <> "") Then
	nStopGrp = nTotalGrps
Else
	nStopGrp = nStartGrp + nDisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(nStopGrp) > CLng(nTotalGrps) Then
	nStopGrp = nTotalGrps
End If
nRecCount = 0

' Init Summary Values
Call ResetLevelSummary(0)

' Get first row
If nTotalGrps > 0 Then
	Call GetRow(1)
	nGrpCount = 1
End If
Do While (Not rs.Eof And nGrpCount <= nDisplayGrps) Or (bShowFirstHeader)

	' Show Header
	If bShowFirstHeader Then
%>
	<thead>
	<tr>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		FACULTAD
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>FACULTAD</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		CARRERA
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CARRERA</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		RAMO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>RAMO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		RUT
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>RUT</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		DV
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>DV</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		APELLIDO PATERNO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>APELLIDO PATERNO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		APELLIDO MATERNO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>APELLIDO MATERNO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOMBRE
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOMBRE</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		CODIGO RAMO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CODIGO RAMO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		CODIGO SECCI&Oacute;N
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CODIGO SECCI&Oacute;N</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		CODIGO REGISTRO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CODIGO REGISTRO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		A&Ntilde;O
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>A&Ntilde;O</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		PERIODO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PERIODO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NP
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NP</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NE
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NE</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NPR
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NPR</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NER
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NER</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NEP
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NEP</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NERP
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NERP</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NF
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NF</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NFP
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NFP</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		ESTADO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>ESTADO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		ASISTENCIA
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>ASISTENCIA</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 1
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 1</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 2
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 2</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 3
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 3</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 4
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 4</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 5
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 5</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 6
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 6</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 7
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 7</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 8
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 8</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 9
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 9</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA CERT 10
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA CERT 10</td>
			</tr></table>
		</td>
<% End If %>
	</tr>
	</thead>
	<tbody>
<%
		bShowFirstHeader = False
	End If
	nRecCount = nRecCount + 1

		' Set row color
		Dim sItemRowClass
		sItemRowClass = " class=""ewTableRow"""

		' Display alternate color for rows
		If nRecCount Mod 2 <> 1 Then
			sItemRowClass = " class=""ewTableAltRow"""
		End If
%>
	<tr>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_FACULTAD) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CARRERA) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_RAMO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_RUT) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_DIG) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PATERNO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_MATERNO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NOMBRE) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CODRAMO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CODSECC) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CODCLI) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ANO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PERIODO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NP) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NE) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NPR) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NER) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NEP) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NERP) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NF) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NFP) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ESTADO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ASISTENCIA) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT1) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT2) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT3) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT4) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT5) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT6) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT7) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT8) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT9) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NCERT10) %>
</td>
	</tr>
<%

		' Accumulate page summary
		Call AccumulateSummary()

		' Get next record
		Call GetRow(2)
		nGrpCount = nGrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
<%

	' Get total count from sql directly
	sSql = ewrpt_BuildReportSql(EW_REPORT_TABLE_SQL_SELECT_COUNT, EW_REPORT_TABLE_SQL_WHERE, EW_REPORT_TABLE_SQL_GROUPBY, EW_REPORT_TABLE_SQL_HAVING, "", sFilter, "")
	Dim rstot, rstotcnt
	Set rstot = ewrpt_LoadRs(sSql)
	If Not rstot.Eof Then
		rstotcnt = ewrpt_GetValue(rstot(0))
	Else
		rstotcnt = 0
	End If
%>
<% If nTotalGrps > 0 Then %>
	<!-- tr><td colspan="33"><span class="aspreportmaker">&nbsp;<br></span></td></tr -->
	<tr class="ewRptGrandSummary"><td colspan="33">Total General (<%= FormatNumber(rstotcnt,0) %> Registros)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If sExport = "" Then %>
<div class="ewGridLowerPanel">
<form action="HistoricoReprobadossmry.asp?acc=<%=Request("acc")%>" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td nowrap>
<% If Not IsObject(Pager) Then Set Pager = ew_NewPrevNextPager(nStartGrp, nDisplayGrps, nTotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr>
	  <td><span class="aspreportmaker">P&aacute;gina&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="HistoricoReprobadossmry.asp?start=<%= Pager.FirstButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/first.gif" alt="First" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="First" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="HistoricoReprobadossmry.asp?start=<%= Pager.PrevButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/prev.gif" alt="Previous" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="Previous" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="HistoricoReprobadossmry.asp?start=<%= Pager.NextButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/next.gif" alt="Next" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="Next" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="HistoricoReprobadossmry.asp?start=<%= Pager.LastButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/last.gif" alt="Last" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/lastdisab.gif" alt="Last" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspreportmaker">&nbsp;de <%= Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspreportmaker"> <%= Pager.FromIndex %> a <%= Pager.ToIndex %> de <%=  Pager.RecordCount %></span>
<% Else %>
	<% If sFilter = "0=101" Then %>
	<span class="aspreportmaker">Ingrese un Criterio de Busqueda</span>
	<% Else %>
	<span class="aspreportmaker">Registro no Encontrados</span>
	<% End If %>
<% End If %>
		</td>
<% If nTotalGrps > 0 Then %>
		<td nowrap>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" valign="top" nowrap><span class="aspreportmaker">Resultados por P&aacute;gina&nbsp;
<input type="hidden" name="acc" value="<%=Request("acc")%>"> 
<select name="<%= EW_REPORT_TABLE_GROUP_PER_PAGE %>" onChange="this.form.submit();" class="aspreportmaker">
<option value="40"<% If nDisplayGrps = 40 Then Response.Write " selected" %>>40</option>
<option value="50"<% If nDisplayGrps = 50 Then Response.Write " selected" %>>50</option>
<option value="ALL"<% If Session(EW_REPORT_TABLE_SESSION_GROUP_PER_PAGE) = -1 Then Response.Write " selected" %>>All</option>
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
<% If sExport = "" Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td valign="top"><div id="ewRight" class="aspreportmaker">
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
<% End If %>
<%

' Close recordset and connection
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing

' display elapsed time
If EW_REPORT_DEBUG_ENABLED Then Response.Write ewrpt_calcElapsedTime(starttime)
%>
<script type="text/javascript">
<!--
//ewrpt_ToggleFilterPanel(); // uncomment to init Extended Filter panel as collapsed
//-->
</script> 
<!--#include file="rptinc/footer.asp"-->
<%

' Accummulate summary
Sub AccumulateSummary()
	Dim valwrk
	For ix = 0 to UBound(smry,1)
		For iy = 1 to UBound(smry,2)
			cnt(ix,iy) = cnt(ix,iy) + 1
			If col(iy) Then
				valwrk = val(iy)
				If IsNull(valwrk) Or Not IsNumeric(valwrk) Then

					' skip
				Else
					smry(ix,iy) = smry(ix,iy) + valwrk
					If IsNull(mn(ix,iy)) Then
						mn(ix,iy) = valwrk
						mx(ix,iy) = valwrk
					Else
						If mn(ix,iy) > valwrk Then mn(ix,iy) = valwrk
						If mx(ix,iy) < valwrk Then mx(ix,iy) = valwrk
					End If
				End If
			End If
		Next
	Next
	For ix = 1 to UBound(smry,1)
		cnt(ix,0) = cnt(ix,0) + 1
	Next
End Sub

' Reset level summary
Sub ResetLevelSummary(lvl)

	' Clear summary values
	For ix = lvl to UBound(smry,1)
		For iy = 1 to UBound(smry,2)
			cnt(ix,iy) = 0
			If col(iy) Then
				smry(ix,iy) = 0
				mn(ix,iy) = Null
				mx(ix,iy) = Null
			End If
		Next
	Next
	For ix = lvl to UBound(smry,1)
		cnt(ix,0) = 0
	Next

	' Clear old values
	' Reset record count

	nRecCount = 0
End Sub

' Accummulate grand summary
Sub AccumulateGrandSummary()
	Dim valwrk
	cnt(0,0) = cnt(0,0) + 1
	For iy = 1 to UBound(grandsmry)
		If col(iy) Then
			valwrk = val(iy)
			If IsNull(valwrk) Or Not IsNumeric(valwrk) Then

				' skip
			Else
				grandsmry(iy) = grandsmry(iy) + valwrk
				If IsNull(grandmn(iy)) Then
					grandmn(iy) = valwrk
					grandmx(iy) = valwrk
				Else
					If grandmn(iy) > valwrk Then grandmn(iy) = valwrk
					If grandmx(iy) < valwrk Then grandmx(iy) = valwrk
				End If
			End If
		End If
	Next
End Sub

' Get rs
Function GetRs(sql, start, grps)
	Dim rswrk
	Set rswrk = ewrpt_LoadRs(sql)
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
		x_FACULTAD = ewrpt_GetValue(rs("FACULTAD"))
		x_CARRERA = ewrpt_GetValue(rs("CARRERA"))
		x_RAMO = ewrpt_GetValue(rs("RAMO"))
		x_RUT = ewrpt_GetValue(rs("RUT"))
		x_DIG = ewrpt_GetValue(rs("DIG"))
		x_PATERNO = ewrpt_GetValue(rs("PATERNO"))
		x_MATERNO = ewrpt_GetValue(rs("MATERNO"))
		x_NOMBRE = ewrpt_GetValue(rs("NOMBRE"))
		x_CODRAMO = ewrpt_GetValue(rs("CODRAMO"))
		x_CODSECC = ewrpt_GetValue(rs("CODSECC"))
		If Not IsNull(x_CODSECC) Then x_CODSECC = CDbl(x_CODSECC)
		x_CODCLI = ewrpt_GetValue(rs("CODCLI"))
		x_ANO = ewrpt_GetValue(rs("ANO"))
		x_PERIODO = ewrpt_GetValue(rs("PERIODO"))
		x_NP = ewrpt_GetValue(rs("NP"))
		If Not IsNull(x_NP) Then x_NP = CDbl(x_NP)
		x_NE = ewrpt_GetValue(rs("NE"))
		If Not IsNull(x_NE) Then x_NE = CDbl(x_NE)
		x_NPR = ewrpt_GetValue(rs("NPR"))
		If Not IsNull(x_NPR) Then x_NPR = CDbl(x_NPR)
		x_NER = ewrpt_GetValue(rs("NER"))
		If Not IsNull(x_NER) Then x_NER = CDbl(x_NER)
		x_NEP = ewrpt_GetValue(rs("NEP"))
		x_NERP = ewrpt_GetValue(rs("NERP"))
		x_NF = ewrpt_GetValue(rs("NF"))
		If Not IsNull(x_NF) Then x_NF = CDbl(x_NF)
		x_NFP = ewrpt_GetValue(rs("NFP"))
		x_ESTADO = ewrpt_GetValue(rs("ESTADO"))
		x_ASISTENCIA = ewrpt_GetValue(rs("ASISTENCIA"))
		If Not IsNull(x_ASISTENCIA) Then x_ASISTENCIA = CDbl(x_ASISTENCIA)
		x_NCERT1 = ewrpt_GetValue(rs("NCERT1"))
		If Not IsNull(x_NCERT1) Then x_NCERT1 = CDbl(x_NCERT1)
		x_NCERT2 = ewrpt_GetValue(rs("NCERT2"))
		If Not IsNull(x_NCERT2) Then x_NCERT2 = CDbl(x_NCERT2)
		x_NCERT3 = ewrpt_GetValue(rs("NCERT3"))
		If Not IsNull(x_NCERT3) Then x_NCERT3 = CDbl(x_NCERT3)
		x_NCERT4 = ewrpt_GetValue(rs("NCERT4"))
		If Not IsNull(x_NCERT4) Then x_NCERT4 = CDbl(x_NCERT4)
		x_NCERT5 = ewrpt_GetValue(rs("NCERT5"))
		If Not IsNull(x_NCERT5) Then x_NCERT5 = CDbl(x_NCERT5)
		x_NCERT6 = ewrpt_GetValue(rs("NCERT6"))
		If Not IsNull(x_NCERT6) Then x_NCERT6 = CDbl(x_NCERT6)
		x_NCERT7 = ewrpt_GetValue(rs("NCERT7"))
		If Not IsNull(x_NCERT7) Then x_NCERT7 = CDbl(x_NCERT7)
		x_NCERT8 = ewrpt_GetValue(rs("NCERT8"))
		If Not IsNull(x_NCERT8) Then x_NCERT8 = CDbl(x_NCERT8)
		x_NCERT9 = ewrpt_GetValue(rs("NCERT9"))
		If Not IsNull(x_NCERT9) Then x_NCERT9 = CDbl(x_NCERT9)
		x_NCERT10 = ewrpt_GetValue(rs("NCERT10"))
		If Not IsNull(x_NCERT10) Then x_NCERT10 = CDbl(x_NCERT10)
		val(1) = x_FACULTAD
		val(2) = x_CARRERA
		val(3) = x_RAMO
		val(4) = x_RUT
		val(5) = x_DIG
		val(6) = x_PATERNO
		val(7) = x_MATERNO
		val(8) = x_NOMBRE
		val(9) = x_CODRAMO
		val(10) = x_CODSECC
		val(11) = x_CODCLI
		val(12) = x_ANO
		val(13) = x_PERIODO
		val(14) = x_NP
		val(15) = x_NE
		val(16) = x_NPR
		val(17) = x_NER
		val(18) = x_NEP
		val(19) = x_NERP
		val(20) = x_NF
		val(21) = x_NFP
		val(22) = x_ESTADO
		val(23) = x_ASISTENCIA
		val(24) = x_NCERT1
		val(25) = x_NCERT2
		val(26) = x_NCERT3
		val(27) = x_NCERT4
		val(28) = x_NCERT5
		val(29) = x_NCERT6
		val(30) = x_NCERT7
		val(31) = x_NCERT8
		val(32) = x_NCERT9
		val(33) = x_NCERT10
	Else
		x_FACULTAD = ""
		x_CARRERA = ""
		x_RAMO = ""
		x_RUT = ""
		x_DIG = ""
		x_PATERNO = ""
		x_MATERNO = ""
		x_NOMBRE = ""
		x_CODRAMO = ""
		x_CODSECC = ""
		x_CODCLI = ""
		x_ANO = ""
		x_PERIODO = ""
		x_NP = ""
		x_NE = ""
		x_NPR = ""
		x_NER = ""
		x_NEP = ""
		x_NERP = ""
		x_NF = ""
		x_NFP = ""
		x_ESTADO = ""
		x_ASISTENCIA = ""
		x_NCERT1 = ""
		x_NCERT2 = ""
		x_NCERT3 = ""
		x_NCERT4 = ""
		x_NCERT5 = ""
		x_NCERT6 = ""
		x_NCERT7 = ""
		x_NCERT8 = ""
		x_NCERT9 = ""
		x_NCERT10 = ""
	End If
End Sub

'-------------------------------------------------------------------------------
' Function SetUpStartGroup
' - Set up Starting Record parameters based on Pager Navigation
' - Variables setup: nStartGrp
Sub SetUpStartGroup()
	Dim nPageNo

	' Exit if nDisplayGrps = 0
	If nDisplayGrps = 0 Then Exit Sub

	' Check for a START parameter
	If Request.QueryString(EW_REPORT_TABLE_START_GROUP).Count > 0 Then
		nStartGrp = Request.QueryString(EW_REPORT_TABLE_START_GROUP)
		Session(EW_REPORT_TABLE_SESSION_START_GROUP) = nStartGrp
	ElseIf Request.QueryString("pageno").Count > 0 Then
		nPageNo = Request.QueryString("pageno")
		If IsNumeric(nPageNo) Then
			nStartGrp = (nPageNo-1)*nDisplayGrps+1
			If nStartGrp <= 0 Then
				nStartGrp = 1
			ElseIf nStartGrp >= ((nTotalGrps-1)\nDisplayGrps)*nDisplayGrps+1 Then
				nStartGrp = ((nTotalGrps-1)\nDisplayGrps)*nDisplayGrps+1
			End If
			Session(EW_REPORT_TABLE_SESSION_START_GROUP) = nStartGrp
		Else
			nStartGrp = Session(EW_REPORT_TABLE_SESSION_START_GROUP)
		End If
	Else
		nStartGrp = Session(EW_REPORT_TABLE_SESSION_START_GROUP)
	End If

	' Check if correct start group counter
	If Not IsNumeric(nStartGrp) Or nStartGrp = "" Then ' Avoid invalid start group counter
		nStartGrp = 1 ' Reset start group counter
		Session(EW_REPORT_TABLE_SESSION_START_GROUP) = nStartGrp
	ElseIf CLng(nStartGrp) > CLng(nTotalGrps) Then ' Avoid starting group > total groups
		nStartGrp = ((nTotalGrps-1)\nDisplayGrps)*nDisplayGrps+1 ' Point to last page first group
		Session(EW_REPORT_TABLE_SESSION_START_GROUP) = nStartGrp
	ElseIf (nStartGrp-1) Mod nDisplayGrps <> 0 Then
		nStartGrp = ((nStartGrp-1)\nDisplayGrps)*nDisplayGrps+1 ' Point to page boundary
		Session(EW_REPORT_TABLE_SESSION_START_GROUP) = nStartGrp
	End If
End Sub

' Set up popup
Sub SetupPopup()
	Dim sName, arValues, cntValues
	Dim i
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
					arValues = EW_REPORT_INIT_VALUE
				End If
				If Not ewrpt_MatchedArray(arValues, Session("sel_" & sName)) Then
					If HasSessionFilterValues(sName) Then
						sClearExtFilter = sName ' Clear extended filter for this field
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
	nStartGrp = 1
	Session(EW_REPORT_TABLE_SESSION_START_GROUP) = nStartGrp
End Sub
%>
<%

'-------------------------------------------------------------------------------
' Function SetUpDisplayGrps
' - Set up Number of Groups displayed per page based on Form element GrpPerPage
' - Variables setup: nDisplayGrps
Sub SetUpDisplayGrps()
	Dim sWrk
	sWrk = Request.QueryString(EW_REPORT_TABLE_GROUP_PER_PAGE)
	If sWrk <> "" Then
		If IsNumeric(sWrk) Then
			nDisplayGrps = CInt(sWrk)
		Else
			If UCase(sWrk) = "ALL" Then ' Display All Records
				nDisplayGrps = -1
			Else
				nDisplayGrps = 40 ' Non-numeric, Load Default
			End If
		End If
		Session(EW_REPORT_TABLE_SESSION_GROUP_PER_PAGE) = nDisplayGrps ' Save to Session

		' Reset Start Position (Reset Command)
		nStartGrp = 1
		Session(EW_REPORT_TABLE_SESSION_START_GROUP) = nStartGrp
	Else
		If Session(EW_REPORT_TABLE_SESSION_GROUP_PER_PAGE) <> "" Then
			nDisplayGrps = Session(EW_REPORT_TABLE_SESSION_GROUP_PER_PAGE) ' Restore from Session
		Else
			nDisplayGrps = 40 ' Load Default
		End If
	End If
End Sub
%>
<%

' Get extended filter values
Sub GetExtendedFilterValues()
	Dim sSelectFld, sSelect, sWhere, sOrderBy
	Dim wrkSql, wrkRs

	' Field FACULTAD
	sSelect = "SELECT DISTINCT [FACULTAD] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[FACULTAD] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_FACULTAD = ewrpt_GetDistinctValues("", wrkSql)

	' Field CARRERA
	sSelect = "SELECT DISTINCT [CARRERA] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[CARRERA] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_CARRERA = ewrpt_GetDistinctValues("", wrkSql)
End Sub

' Return extended filter
Function GetExtendedFilter()
	Dim sFilter, sWrk
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
		' Field FACULTAD

		Call SetSessionDropDownValue(sv_FACULTAD, "HistoricoReprobados_FACULTAD")

		' Field CARRERA
		Call SetSessionDropDownValue(sv_CARRERA, "HistoricoReprobados_CARRERA")

		' Field RUT
		Call SetSessionFilterValues(sv1_RUT, so1_RUT, sc_RUT, sv2_RUT, so2_RUT, "HistoricoReprobados_RUT")

		' Field CODRAMO
		Call SetSessionFilterValues(sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO, "HistoricoReprobados_CODRAMO")

		' Field CODSECC
		Call SetSessionFilterValues(sv1_CODSECC, so1_CODSECC, sc_CODSECC, sv2_CODSECC, so2_CODSECC, "HistoricoReprobados_CODSECC")

		' Field ANO
		Call SetSessionFilterValues(sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO, "HistoricoReprobados_ANO")

		' Field PERIODO
		Call SetSessionFilterValues(sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO, "HistoricoReprobados_PERIODO")

		' Field NP
		Call SetSessionFilterValues(sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP, "HistoricoReprobados_NP")

		' Field NF
		Call SetSessionFilterValues(sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF, "HistoricoReprobados_NF")

		' Field ASISTENCIA
		Call SetSessionFilterValues(sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA, "HistoricoReprobados_ASISTENCIA")
		bSetupFilter = True ' Set up filter required
	Else

		' Field FACULTAD
		If GetDropDownValue(sv_FACULTAD, "FACULTAD") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_FACULTAD) Then
			If sv_FACULTAD <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_HistoricoReprobados_FACULTAD")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field CARRERA
		If GetDropDownValue(sv_CARRERA, "CARRERA") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_CARRERA) Then
			If sv_CARRERA <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_HistoricoReprobados_CARRERA")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field RUT
		If GetFilterValues(sv1_RUT, so1_RUT, sc_RUT, sv2_RUT, so2_RUT, "RUT") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field CODRAMO
		If GetFilterValues(sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO, "CODRAMO") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field CODSECC
		If GetFilterValues(sv1_CODSECC, so1_CODSECC, sc_CODSECC, sv2_CODSECC, so2_CODSECC, "CODSECC") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field ANO
		If GetFilterValues(sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO, "ANO") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field PERIODO
		If GetFilterValues(sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO, "PERIODO") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field NP
		If GetFilterValues(sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP, "NP") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field NF
		If GetFilterValues(sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF, "NF") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field ASISTENCIA
		If GetFilterValues(sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA, "ASISTENCIA") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If
	End If

	' Restore session
	If bRestoreSession Then

		' Field FACULTAD
		Call GetSessionDropDownValue(sv_FACULTAD, "HistoricoReprobados_FACULTAD")

		' Field CARRERA
		Call GetSessionDropDownValue(sv_CARRERA, "HistoricoReprobados_CARRERA")

		' Field RUT
		Call GetSessionFilterValues(sv1_RUT, so1_RUT, sc_RUT, sv2_RUT, so2_RUT, "HistoricoReprobados_RUT")

		' Field CODRAMO
		Call GetSessionFilterValues(sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO, "HistoricoReprobados_CODRAMO")

		' Field CODSECC
		Call GetSessionFilterValues(sv1_CODSECC, so1_CODSECC, sc_CODSECC, sv2_CODSECC, so2_CODSECC, "HistoricoReprobados_CODSECC")

		' Field ANO
		Call GetSessionFilterValues(sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO, "HistoricoReprobados_ANO")

		' Field PERIODO
		Call GetSessionFilterValues(sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO, "HistoricoReprobados_PERIODO")

		' Field NP
		Call GetSessionFilterValues(sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP, "HistoricoReprobados_NP")

		' Field NF
		Call GetSessionFilterValues(sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF, "HistoricoReprobados_NF")

		' Field ASISTENCIA
		Call GetSessionFilterValues(sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA, "HistoricoReprobados_ASISTENCIA")
	End If

	' Build sql
	' Field FACULTAD

	Call BuildDropDownFilter(sFilter, "FACULTAD", "[FACULTAD]", EW_REPORT_DATATYPE_STRING, 0, sv_FACULTAD, "")

	' Field CARRERA
	Call BuildDropDownFilter(sFilter, "CARRERA", "[CARRERA]", EW_REPORT_DATATYPE_STRING, 0, sv_CARRERA, "")

	' Field RUT
	Call BuildExtendedFilter(sFilter, "RUT", "[RUT]", EW_REPORT_DATATYPE_STRING, 0, sv1_RUT, so1_RUT, sc_RUT, sv2_RUT, so2_RUT)

	' Field CODRAMO
	Call BuildExtendedFilter(sFilter, "CODRAMO", "[CODRAMO]", EW_REPORT_DATATYPE_STRING, 0, sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO)

	' Field CODSECC
	Call BuildExtendedFilter(sFilter, "CODSECC", "[CODSECC]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_CODSECC, so1_CODSECC, sc_CODSECC, sv2_CODSECC, so2_CODSECC)

	' Field ANO
	Call BuildExtendedFilter(sFilter, "ANO", "[ANO]", EW_REPORT_DATATYPE_STRING, 0, sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO)

	' Field PERIODO
	Call BuildExtendedFilter(sFilter, "PERIODO", "[PERIODO]", EW_REPORT_DATATYPE_STRING, 0, sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO)

	' Field NP
	Call BuildExtendedFilter(sFilter, "NP", "[NP]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP)

	' Field NF
	Call BuildExtendedFilter(sFilter, "NF", "[NF]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF)

	' Field ASISTENCIA
	Call BuildExtendedFilter(sFilter, "ASISTENCIA", "[ASISTENCIA]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA)

	' Save parms to Session
	' Field FACULTAD

	Call SetSessionDropDownValue(sv_FACULTAD, "HistoricoReprobados_FACULTAD")

	' Field CARRERA
	Call SetSessionDropDownValue(sv_CARRERA, "HistoricoReprobados_CARRERA")

	' Field RUT
	Call SetSessionFilterValues(sv1_RUT, so1_RUT, sc_RUT, sv2_RUT, so2_RUT, "HistoricoReprobados_RUT")

	' Field CODRAMO
	Call SetSessionFilterValues(sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO, "HistoricoReprobados_CODRAMO")

	' Field CODSECC
	Call SetSessionFilterValues(sv1_CODSECC, so1_CODSECC, sc_CODSECC, sv2_CODSECC, so2_CODSECC, "HistoricoReprobados_CODSECC")

	' Field ANO
	Call SetSessionFilterValues(sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO, "HistoricoReprobados_ANO")

	' Field PERIODO
	Call SetSessionFilterValues(sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO, "HistoricoReprobados_PERIODO")

	' Field NP
	Call SetSessionFilterValues(sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP, "HistoricoReprobados_NP")

	' Field NF
	Call SetSessionFilterValues(sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF, "HistoricoReprobados_NF")

	' Field ASISTENCIA
	Call SetSessionFilterValues(sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA, "HistoricoReprobados_ASISTENCIA")

	' Setup filter
	If bSetupFilter Then
	End If
	GetExtendedFilter = sFilter
End Function

' Get drop down value from querystring
Function GetDropDownValue(sv, parm)
	GetDropDownValue = False
	If Request.Form.Count > 0 Then Exit Function ' Skip post back
	If Request.QueryString("sv_" & parm).Count > 0 Then
		Dim nParm, i
		nParm = Request.QueryString("sv_" & parm).Count
		If nParm = 1 Then
			sv = Request.QueryString("sv_" & parm)
		Else
			ReDim sv(nParm-1)
			For i = 1 to nParm
				sv(i-1) = Request.QueryString("sv_" & parm)(i)
			Next
		End If
		GetDropDownValue = True
	End If
End Function

' Get filter values from querystring
Function GetFilterValues(sv1, so1, sc, sv2, so2, parm)
	GetFilterValues = False
	If Request.Form.Count > 0 Then Exit Function ' Skip post back
	If Request.QueryString("sv1_" & parm).Count > 0 Then
		sv1 = Request.QueryString("sv1_" & parm)
		GetFilterValues = True
	End If
	If Request.QueryString("so1_" & parm).Count > 0 Then
		so1 = Request.QueryString("so1_" & parm)
		GetFilterValues = True
	End If
	If Request.QueryString("sc_" & parm).Count > 0 Then
		sc = Request.QueryString("sc_" & parm)
		GetFilterValues = True
	End If
	If Request.QueryString("sv2_" & parm).Count > 0 Then
		sv2 = Request.QueryString("sv2_" & parm)
		GetFilterValues = True
	End If
	If Request.QueryString("so2_" & parm).Count > 0 Then
		so2 = Request.QueryString("so2_" & parm)
		GetFilterValues = True
	End If
End Function

' Check if Text Filter applied
Function TextFilterApplied(sv1, sv2, so1, so2, sc, sv1d, sv2d, so1d, so2d, scd)
	TextFilterApplied = (sv1&"" <> sv1d&"") Or (sv2&"" <> sv2d&"") Or (sv1&"" <> "" And so1&"" <> so1d&"") Or (sv2&"" <> "" And so2&"" <> so2d&"") Or (sc&"" <> scd&"")
End Function

' Check if Non-Text Filter applied
Function NonTextFilterApplied(sv, svd)
	If IsArray(sv) And IsArray(svd) Then
		If UBound(sv) <> Ubound(svd) Then
			NonTextFilterApplied = True
			Exit Function
		Else
			Dim ar1, ar2
			ar1 = sv
			ar2 = svd
			Call ewrpt_SortArray(ar1)
			Call ewrpt_SortArray(ar2)
			NonTextFilterApplied = Not ewrpt_MatchedArray(ar1, ar2)
		End If
	ElseIf IsArray(sv) Or IsArray(svd) Then
		NonTextFilterApplied = True
	Else
		NonTextFilterApplied = (sv&"" <> svd&"")
	End If
End Function

' Get dropdown value from Session
Sub GetSessionDropDownValue(sv, parm)
	Call GetSessionValue(sv, "sv_" & parm)
End Sub

' Get filter values from Session
Sub GetSessionFilterValues(sv1, so1, sc, sv2, so2, parm)
	Call GetSessionValue(sv1, "sv1_" & parm)
	Call GetSessionValue(so1, "so1_" & parm)
	Call GetSessionValue(sc, "sc_" & parm)
	Call GetSessionValue(sv2, "sv2_" & parm)
	Call GetSessionValue(so2, "so2_" & parm)
End Sub

' Get value from Session
Sub GetSessionValue(sv, sn)
	If Not IsEmpty(Session(sn)) Then
		sv = Session(sn)
	End If
End Sub

' Set dropdown value to Session
Sub SetSessionDropDownValue(sv, parm)
	Session("sv_" & parm) = sv
End Sub

' Set filter values to Session
Sub SetSessionFilterValues(sv1, so1, sc, sv2, so2, parm)
		Session("sv1_" & parm) = sv1
		Session("so1_" & parm) = so1
		Session("sc_" & parm) = sc
		Session("sv2_" & parm) = sv2
		Session("so2_" & parm) = so2
End Sub

' Check if has Session filter values
Function HasSessionFilterValues(parm)
	HasSessionFilterValues = _
		(Session("sv_" & parm) <> "" And Session("sv_" & parm) <> EW_REPORT_INIT_VALUE) Or _
		(Session("sv1_" & parm) <> "" And Session("sv1_" & parm) <> EW_REPORT_INIT_VALUE) Or _
		(Session("sv2_" & parm) <> "" And Session("sv2_" & parm) <> EW_REPORT_INIT_VALUE)
End Function

' Check if dropdown filter
Function DropDownFilterExist(FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal, FldOpr)
	Dim sWrk
	sWrk = ""
	Call BuildDropDownFilter(sWrk, FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal, FldOpr)
	DropDownFilterExist = (sWrk <> "")
End Function

' Build dropdown filter
Function BuildDropDownFilter(FilterClause, FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal, FldOpr)
	Dim sSql, i, sWrk
	sSql = ""
	If IsArray(FldVal) Then
		For i = 0 to UBound(FldVal)
			sWrk = getDropDownfilter(FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal(i), FldOpr)
			If sWrk <> "" Then
				If sSql <> "" Then
					sSql = sSql & " OR " & sWrk
				Else
					sSql = sWrk
				End If
			End If
		Next
	Else
		sSql = getDropDownfilter(FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal, FldOpr)
	End If
	If sSql <> "" Then
		If FilterClause <> "" Then FilterClause = "(" & FilterClause & ") AND "
		FilterClause = FilterClause & "(" & sSql & ")"
	End If
End Function

Function getDropDownfilter(FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal, FldOpr)
	Dim sWrk
	sWrk = ""
	If FldVal = EW_REPORT_NULL_VALUE Then
		sWrk = FldExpression & " IS NULL"
	ElseIf FldVal = EW_REPORT_EMPTY_VALUE Then
		sWrk = FldExpression & " = ''"
	Else
		If Left(FldVal, 2) = "@@" Then
			sWrk = CustomFilter(FldName, FldExpression, FldVal)
		Else
			If FldVal <> "" And FldVal <> EW_REPORT_INIT_VALUE And FldVal <> EW_REPORT_ALL_VALUE Then
				If FldDataType = EW_REPORT_DATATYPE_DATE And FldOpr <> "" Then
					sWrk = DateFilterString(FldOpr, FldVal, FldDataType)
				Else
					sWrk = FilterString("=", FldVal, FldDataType)
				End If
			End If
			If sWrk <> "" Then sWrk = FldExpression & sWrk
		End If
	End If
	getDropDownFilter = sWrk
End Function

' Setup custom filters
Sub SetupCustomFilters()

	' 1. Register your custom filter below (see example)
	' 2. Write your custom filter function (see GetLastMonthFilter, GetStartsWithAFilter)
	' FACULTAD
	'Call RegisterCustomFilter("FACULTAD", "StartsWithA", "Starts With A", "[FACULTAD]", "GetStartsWithAFilter")
	' CARRERA
	'Call RegisterCustomFilter("CARRERA", "StartsWithA", "Starts With A", "[CARRERA]", "GetStartsWithAFilter")

End Sub

' Register custom filter
Sub RegisterCustomFilter(FldName, FilterName, DisplayName, FldExpression, FunctionName)
	Dim i
	If Not IsArray(ewrpt_CustomFilters) Then
		i = 0
		Redim ewrpt_CustomFilters(4, i)
	Else
		i = UBound(ewrpt_CustomFilters, 2) + 1
		Redim Preserve ewrpt_CustomFilters(4, i)
	End If
	ewrpt_CustomFilters(0, i) = FldName
	ewrpt_CustomFilters(1, i) = FilterName
	ewrpt_CustomFilters(2, i) = DisplayName
	ewrpt_CustomFilters(3, i) = FldExpression
	ewrpt_CustomFilters(4, i) = FunctionName
End Sub

' Custom filter
Function CustomFilter(FldName, FldExpression, FldVal)
	On Error Resume Next
	Dim i, sWrk, sParm, sFld, sFn
	sWrk = ""
	sParm = Mid(FldVal, 3)
	If IsArray(ewrpt_CustomFilters) Then
		For i = 0 to UBound(ewrpt_CustomFilters, 2)
			If ewrpt_CustomFilters(0, i) = FldName And ewrpt_CustomFilters(1, i) = sParm Then
				sFld = ewrpt_CustomFilters(3, i)
				sFn = ewrpt_CustomFilters(4, i)
				sWrk = Eval(sFn & "(""" & sFld & """)")
				Exit For
			End If
		Next
	End If
	CustomFilter = sWrk
End Function

' ------------------------------------
'  Write your Custom filters here
'
' Get Last Month
Function GetLastMonthFilter(FldExpression)
	Dim sVal, sWrk
	sVal = DateAdd("m", -1, Date)
	sVal = Year(sVal) & "|" & Month(sVal)
	sWrk = FldExpression & " BETWEEN " & _
		ewrpt_QuotedValue(DateVal("month", sVal, 1), EW_REPORT_DATATYPE_DATE) & _
		" AND " & _
		ewrpt_QuotedValue(DateVal("month", sVal, 2), EW_REPORT_DATATYPE_DATE)
	GetLastMonthFilter = sWrk
End Function

' Get Starts With A
Function GetStartsWithAFilter(FldExpression)
	GetStartsWithAFilter = FldExpression & " LIKE 'A%'"
End Function

'  End Custom Filters
' ------------------------------------
' Check if extended filter
Function ExtendedFilterExist(FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal1, FldOpr1, FldCond, FldVal2, FldOpr2)
	Dim sExtWrk
	sExtWrk = ""
	Call BuildExtendedFilter(sExtWrk, FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal1, FldOpr1, FldCond, FldVal2, FldOpr2)
	ExtendedFilterExist = (sExtWrk <> "")
End Function

' Build extended filter
Sub BuildExtendedFilter(FilterClause, FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal1, FldOpr1, FldCond, FldVal2, FldOpr2)
	Dim IsValidValue, sWrk
	Dim wrkFldVal1, wrkFldVal2
	sWrk = ""
	FldOpr1 = UCase(Trim(FldOpr1))
	If (FldOpr1 = "") Then FldOpr1 = "="
	FldOpr2 = UCase(Trim(FldOpr2))
	If FldOpr2 = "" Then FldOpr2 = "="
	wrkFldVal1 = FldVal1
	wrkFldVal2 = FldVal2
	If FldDataType = EW_REPORT_DATATYPE_BOOLEAN Then
		If wrkFldVal1 <> "" Then wrkFldVal1 = ewrpt_IIf(wrkFldVal1="1", "True", "False")
		If wrkFldVal2 <> "" Then wrkFldVal2 = ewrpt_IIf(wrkFldVal2="1", "True", "False")
	ElseIf FldDataType = EW_REPORT_DATATYPE_DATE Then
		If wrkFldVal1 <> "" Then wrkFldVal1 = ewrpt_UnFormatDateTime(wrkFldVal1, FldDateTimeFormat)
		If wrkFldVal2 <> "" Then wrkFldVal2 = ewrpt_UnFormatDateTime(wrkFldVal2, FldDateTimeFormat)
	End If
	If FldOpr1 = "BETWEEN" Then
		IsValidValue = (FldDataType <> EW_REPORT_DATATYPE_NUMBER) Or _
			(FldDataType = EW_REPORT_DATATYPE_NUMBER And IsNumeric(wrkFldVal1) And IsNumeric(wrkFldVal2))
		If wrkFldVal1 <> "" And wrkFldVal2 <> "" And IsValidValue Then
			sWrk = FldExpression & " BETWEEN " & ewrpt_QuotedValue(wrkFldVal1, FldDataType) & _
				" AND " & ewrpt_QuotedValue(wrkFldVal2, FldDataType)
		End If
	ElseIf FldOpr1 = "IS NULL" Or FldOpr1 = "IS NOT NULL" Then
		sWrk = FldExpression & " " & wrkFldVal1
	Else
		IsValidValue = (FldDataType <> EW_REPORT_DATATYPE_NUMBER) Or _
			(FldDataType = EW_REPORT_DATATYPE_NUMBER And IsNumeric(wrkFldVal1))
		If wrkFldVal1 <> "" And IsValidValue And ewrpt_IsValidOpr(FldOpr1, FldDataType) Then
			sWrk = FldExpression & FilterString(FldOpr1, wrkFldVal1, FldDataType)
		End If
		IsValidValue = (FldDataType <> EW_REPORT_DATATYPE_NUMBER) Or _
			(FldDataType = EW_REPORT_DATATYPE_NUMBER And IsNumeric(wrkFldVal2))
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
	wrkVal1 = DateVal(FldOpr, FldVal, 1)
	wrkVal2 = DateVal(FldOpr, FldVal, 2)
	If wrkVal1 <> "" And wrkVal2 <> "" Then
		DateFilterString = " BETWEEN " & ewrpt_QuotedValue(wrkVal1, FldType) & " AND " & ewrpt_QuotedValue(wrkVal2, FldType)
	Else
		DateFilterString = ""
	End If
End Function

' Return date value
Function DateVal(FldOpr, FldVal, ValType)
	On Error Resume Next
	Dim wrkVal, arWrk, yr, mth, dy

	' Compose date string
	Select Case LCase(FldOpr)
	Case "year"
		If ValType = 1 Then
			wrkVal = CDate(FldVal & "/1/1")
		ElseIf ValType = 2 Then
			wrkVal = CDate(FldVal & "/12/31")
		End If
	Case "quarter"
		arWrk = Split(FldVal, "|")
		wrkVal = CDate(arWrk(0) & "/" & ((arWrk(1)-1)*3+1) & "/1")
		If ValType = 2 Then
			wrkVal = DateAdd("m", 3, wrkVal) ' + three months
			wrkVal = DateAdd("d", -1, wrkVal) ' - one day
		End If
	Case "month"
		wrkVal = CDate(Replace(FldVal, "|", "/") & "/1")
		If ValType = 2 Then
			wrkVal = DateAdd("m", 1, wrkVal) ' + one month
			wrkVal = DateAdd("d", -1, wrkVal) ' - one day
		End If
	Case "day"
		wrkVal = CDate(Replace(FldVal, "|", "/"))
	End Select

	' Add time if necessary
	wrkVal = Year(wrkVal) & "/" & Month(wrkVal) & "/" & Day(wrkVal)
	If True Then ' Always return time
		If ValType = 1 Then wrkVal = wrkVal & " 00:00:00"
		If ValType = 2 Then wrkVal = wrkval & " 23:59:59"
	End If

	' Check if date
	If IsDate(wrkVal) Then
		DateVal = wrkVal
	Else
		DateVal = ""
	End If
End Function
%>
<%

' Load default value for filters
Sub LoadDefaultFilters()
	Dim sWrk, sSql

	' --------------------------------------------------
	'  Set up default values for dropdown filters
	'
	' Field FACULTAD

	svd_FACULTAD = EW_REPORT_INIT_VALUE
	sv_FACULTAD = svd_FACULTAD

	' Field CARRERA
	svd_CARRERA = EW_REPORT_INIT_VALUE
	sv_CARRERA = svd_CARRERA

	' --------------------------------------------------
	'  Set up default values for extended filters
	'
	' Field RUT
	' sv1d_RUT = Date ' Default value is today
	' so1d_RUT = "<=" ' Default operator is "<="

	sv1d_RUT = Null ' Default ext filter value 1
	sv2d_RUT = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_RUT = "=" ' Default search operator 1
	so2d_RUT = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_RUT = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_RUT = sv1d_RUT
	sv2_RUT = sv2d_RUT
	so1_RUT = so1d_RUT
	so2_RUT = so2d_RUT
	sc_RUT = scd_RUT

	' Field CODRAMO
	' sv1d_CODRAMO = Date ' Default value is today
	' so1d_CODRAMO = "<=" ' Default operator is "<="

	sv1d_CODRAMO = Null ' Default ext filter value 1
	sv2d_CODRAMO = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_CODRAMO = "=" ' Default search operator 1
	so2d_CODRAMO = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_CODRAMO = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_CODRAMO = sv1d_CODRAMO
	sv2_CODRAMO = sv2d_CODRAMO
	so1_CODRAMO = so1d_CODRAMO
	so2_CODRAMO = so2d_CODRAMO
	sc_CODRAMO = scd_CODRAMO

	' Field CODSECC
	' sv1d_CODSECC = Date ' Default value is today
	' so1d_CODSECC = "<=" ' Default operator is "<="

	sv1d_CODSECC = Null ' Default ext filter value 1
	sv2d_CODSECC = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_CODSECC = "=" ' Default search operator 1
	so2d_CODSECC = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_CODSECC = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_CODSECC = sv1d_CODSECC
	sv2_CODSECC = sv2d_CODSECC
	so1_CODSECC = so1d_CODSECC
	so2_CODSECC = so2d_CODSECC
	sc_CODSECC = scd_CODSECC

	' Field ANO
	' sv1d_ANO = Date ' Default value is today
	' so1d_ANO = "<=" ' Default operator is "<="

	sv1d_ANO = Null ' Default ext filter value 1
	sv2d_ANO = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_ANO = "=" ' Default search operator 1
	so2d_ANO = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_ANO = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_ANO = sv1d_ANO
	sv2_ANO = sv2d_ANO
	so1_ANO = so1d_ANO
	so2_ANO = so2d_ANO
	sc_ANO = scd_ANO

	' Field PERIODO
	' sv1d_PERIODO = Date ' Default value is today
	' so1d_PERIODO = "<=" ' Default operator is "<="

	sv1d_PERIODO = Null ' Default ext filter value 1
	sv2d_PERIODO = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_PERIODO = "=" ' Default search operator 1
	so2d_PERIODO = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_PERIODO = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_PERIODO = sv1d_PERIODO
	sv2_PERIODO = sv2d_PERIODO
	so1_PERIODO = so1d_PERIODO
	so2_PERIODO = so2d_PERIODO
	sc_PERIODO = scd_PERIODO

	' Field NP
	' sv1d_NP = Date ' Default value is today
	' so1d_NP = "<=" ' Default operator is "<="

	sv1d_NP = Null ' Default ext filter value 1
	sv2d_NP = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_NP = ">=" ' Default search operator 1
	so2d_NP = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_NP = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_NP = sv1d_NP
	sv2_NP = sv2d_NP
	so1_NP = so1d_NP
	so2_NP = so2d_NP
	sc_NP = scd_NP

	' Field NF
	' sv1d_NF = Date ' Default value is today
	' so1d_NF = "<=" ' Default operator is "<="

	sv1d_NF = Null ' Default ext filter value 1
	sv2d_NF = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_NF = ">=" ' Default search operator 1
	so2d_NF = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_NF = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_NF = sv1d_NF
	sv2_NF = sv2d_NF
	so1_NF = so1d_NF
	so2_NF = so2d_NF
	sc_NF = scd_NF

	' Field ASISTENCIA
	' sv1d_ASISTENCIA = Date ' Default value is today
	' so1d_ASISTENCIA = "<=" ' Default operator is "<="

	sv1d_ASISTENCIA = Null ' Default ext filter value 1
	sv2d_ASISTENCIA = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_ASISTENCIA = ">=" ' Default search operator 1
	so2d_ASISTENCIA = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_ASISTENCIA = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_ASISTENCIA = sv1d_ASISTENCIA
	sv2_ASISTENCIA = sv2d_ASISTENCIA
	so1_ASISTENCIA = so1d_ASISTENCIA
	so2_ASISTENCIA = so2d_ASISTENCIA
	sc_ASISTENCIA = scd_ASISTENCIA

	' --------------------------------------------------
	'  Set up default values for popup filters
	'  - NOTE: if extended filter is enabled, use default values in extended filter instead

End Sub

' Check if filter applied
Function CheckFilter()

	' Check FACULTAD non-Text filter
	If NonTextFilterApplied(sv_FACULTAD, svd_FACULTAD) Then
		CheckFilter = True
		Exit Function
	End If

	' Check CARRERA non-Text filter
	If NonTextFilterApplied(sv_CARRERA, svd_CARRERA) Then
		CheckFilter = True
		Exit Function
	End If

	' Check RUT Text filter
	If TextFilterApplied(sv1_RUT, sv2_RUT, so1_RUT, so2_RUT, sc_RUT, _
		sv1d_RUT, sv2d_RUT, so1d_RUT, so2d_RUT, scd_RUT) Then
		CheckFilter = True
		Exit Function
	End If

	' Check CODRAMO Text filter
	If TextFilterApplied(sv1_CODRAMO, sv2_CODRAMO, so1_CODRAMO, so2_CODRAMO, sc_CODRAMO, _
		sv1d_CODRAMO, sv2d_CODRAMO, so1d_CODRAMO, so2d_CODRAMO, scd_CODRAMO) Then
		CheckFilter = True
		Exit Function
	End If

	' Check CODSECC Text filter
	If TextFilterApplied(sv1_CODSECC, sv2_CODSECC, so1_CODSECC, so2_CODSECC, sc_CODSECC, _
		sv1d_CODSECC, sv2d_CODSECC, so1d_CODSECC, so2d_CODSECC, scd_CODSECC) Then
		CheckFilter = True
		Exit Function
	End If

	' Check ANO Text filter
	If TextFilterApplied(sv1_ANO, sv2_ANO, so1_ANO, so2_ANO, sc_ANO, _
		sv1d_ANO, sv2d_ANO, so1d_ANO, so2d_ANO, scd_ANO) Then
		CheckFilter = True
		Exit Function
	End If

	' Check PERIODO Text filter
	If TextFilterApplied(sv1_PERIODO, sv2_PERIODO, so1_PERIODO, so2_PERIODO, sc_PERIODO, _
		sv1d_PERIODO, sv2d_PERIODO, so1d_PERIODO, so2d_PERIODO, scd_PERIODO) Then
		CheckFilter = True
		Exit Function
	End If

	' Check NP Text filter
	If TextFilterApplied(sv1_NP, sv2_NP, so1_NP, so2_NP, sc_NP, _
		sv1d_NP, sv2d_NP, so1d_NP, so2d_NP, scd_NP) Then
		CheckFilter = True
		Exit Function
	End If

	' Check NF Text filter
	If TextFilterApplied(sv1_NF, sv2_NF, so1_NF, so2_NF, sc_NF, _
		sv1d_NF, sv2d_NF, so1d_NF, so2d_NF, scd_NF) Then
		CheckFilter = True
		Exit Function
	End If

	' Check ASISTENCIA Text filter
	If TextFilterApplied(sv1_ASISTENCIA, sv2_ASISTENCIA, so1_ASISTENCIA, so2_ASISTENCIA, sc_ASISTENCIA, _
		sv1d_ASISTENCIA, sv2d_ASISTENCIA, so1d_ASISTENCIA, so2d_ASISTENCIA, scd_ASISTENCIA) Then
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

	' Field FACULTAD
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "FACULTAD", "[FACULTAD]", EW_REPORT_DATATYPE_STRING, 0, sv_FACULTAD, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "FACULTAD<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field CARRERA
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "CARRERA", "[CARRERA]", EW_REPORT_DATATYPE_STRING, 0, sv_CARRERA, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "CARRERA<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field RUT
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "RUT", "[RUT]", EW_REPORT_DATATYPE_STRING, 0, sv1_RUT, so1_RUT, sc_RUT, sv2_RUT, so2_RUT)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "RUT<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field CODRAMO
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "CODRAMO", "[CODRAMO]", EW_REPORT_DATATYPE_STRING, 0, sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "CODRAMO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field CODSECC
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "CODSECC", "[CODSECC]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_CODSECC, so1_CODSECC, sc_CODSECC, sv2_CODSECC, so2_CODSECC)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "CODSECC<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field ANO
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "ANO", "[ANO]", EW_REPORT_DATATYPE_STRING, 0, sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "ANO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field PERIODO
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "PERIODO", "[PERIODO]", EW_REPORT_DATATYPE_STRING, 0, sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "PERIODO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field NP
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "NP", "[NP]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "NP<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field NF
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "NF", "[NF]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "NF<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field ASISTENCIA
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "ASISTENCIA", "[ASISTENCIA]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "ASISTENCIA<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Show Filters
	If sFilterList <> "" Then
		Response.Write "CURRENT FILTERS:<br>"
		Response.Write sFilterList
	End If
End Sub
%>
<%

' Return poup filter
Function GetPopupFilter()
	Dim sWrk
	sWrk = ""
	GetPopupFilter = sWrk
End Function
%>
<%

' -------------------------------------------------------------------------------
' Function getSort
' - Return Sort parameters based on Sort Links clicked
' - Variables setup: Session[EW_REPORT_TABLE_SESSION_ORDER_BY], Session["sort_Table_Field"]
Function getSort()
	Dim sOrder, sOrderType, sOrderBy
	Dim sSortSql, sSortField, sLastSort, sThisSort
	Dim bCtrl, sCmd

	' Check for a resetsort command
	If Request.QueryString("cmd").Count > 0 Then
		sCmd = Request.QueryString("cmd")
		If sCmd = "resetsort" Then
			Session(EW_REPORT_TABLE_SESSION_ORDER_BY) = ""
			Session(EW_REPORT_TABLE_SESSION_START_GROUP) = 1
			Session("sort_HistoricoReprobados_FACULTAD") = ""
			Session("sort_HistoricoReprobados_CARRERA") = ""
			Session("sort_HistoricoReprobados_RAMO") = ""
			Session("sort_HistoricoReprobados_RUT") = ""
			Session("sort_HistoricoReprobados_DIG") = ""
			Session("sort_HistoricoReprobados_PATERNO") = ""
			Session("sort_HistoricoReprobados_MATERNO") = ""
			Session("sort_HistoricoReprobados_NOMBRE") = ""
			Session("sort_HistoricoReprobados_CODRAMO") = ""
			Session("sort_HistoricoReprobados_CODSECC") = ""
			Session("sort_HistoricoReprobados_CODCLI") = ""
			Session("sort_HistoricoReprobados_ANO") = ""
			Session("sort_HistoricoReprobados_PERIODO") = ""
			Session("sort_HistoricoReprobados_NP") = ""
			Session("sort_HistoricoReprobados_NE") = ""
			Session("sort_HistoricoReprobados_NPR") = ""
			Session("sort_HistoricoReprobados_NER") = ""
			Session("sort_HistoricoReprobados_NEP") = ""
			Session("sort_HistoricoReprobados_NERP") = ""
			Session("sort_HistoricoReprobados_NF") = ""
			Session("sort_HistoricoReprobados_NFP") = ""
			Session("sort_HistoricoReprobados_ESTADO") = ""
			Session("sort_HistoricoReprobados_ASISTENCIA") = ""
			Session("sort_HistoricoReprobados_NCERT1") = ""
			Session("sort_HistoricoReprobados_NCERT2") = ""
			Session("sort_HistoricoReprobados_NCERT3") = ""
			Session("sort_HistoricoReprobados_NCERT4") = ""
			Session("sort_HistoricoReprobados_NCERT5") = ""
			Session("sort_HistoricoReprobados_NCERT6") = ""
			Session("sort_HistoricoReprobados_NCERT7") = ""
			Session("sort_HistoricoReprobados_NCERT8") = ""
			Session("sort_HistoricoReprobados_NCERT9") = ""
			Session("sort_HistoricoReprobados_NCERT10") = ""
		End If

	' Check for an Order parameter
	ElseIf Request.QueryString(EW_REPORT_TABLE_ORDER_BY).Count > 0 Then
		sSortSql = ""
		sSortField = ""
		sOrder = Request.QueryString(EW_REPORT_TABLE_ORDER_BY)
		If Request.QueryString(EW_REPORT_TABLE_ORDER_BY_TYPE).Count > 0 Then
			sOrderType = Request.QueryString(EW_REPORT_TABLE_ORDER_BY_TYPE)
		Else
			sOrderType = ""
		End If
	End If
	getSort = Session(EW_REPORT_TABLE_SESSION_ORDER_BY)
End Function
%>
