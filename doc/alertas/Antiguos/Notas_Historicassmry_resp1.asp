<%
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
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open EW_REPORT_CONNECTION_STRING

' ASP Report Maker 3.0+ - Table level configuration (Notas Historicas)
' Table Level Constants

Const EW_REPORT_TABLE_VAR = "Notas_Historicas"
Const EW_REPORT_TABLE_SESSION_GROUP_PER_PAGE = "Notas_Historicas_grpperpage"
Const EW_REPORT_TABLE_SESSION_START_GROUP = "Notas_Historicas_start"
Const EW_REPORT_TABLE_SESSION_SEARCH = "Notas_Historicas_search"
Const EW_REPORT_TABLE_SESSION_CHILD_USER_ID = "Notas_Historicas_childuserid"
Const EW_REPORT_TABLE_SESSION_ORDER_BY = "Notas_Historicas_orderby"

' Table Level SQL
Const EW_REPORT_TABLE_SQL_FROM = "[Vista_NotasHistoricas]"
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
Dim af_CODRAMO ' Advanced filter for CODRAMO
Dim af_CODALU ' Advanced filter for CODALU
Dim af_RUT ' Advanced filter for RUT
Dim af_PATERNO ' Advanced filter for PATERNO
Dim af_MATERNO ' Advanced filter for MATERNO
Dim af_NOMBRE ' Advanced filter for NOMBRE
Dim af_SEXO ' Advanced filter for SEXO
Dim af_AD1OINGRESO ' Advanced filter for AÑOINGRESO
Dim af_AD1O_MAT ' Advanced filter for AÑO_MAT
Dim af_PER_MAT ' Advanced filter for PER_MAT
Dim af_NACIONALIDAD ' Advanced filter for NACIONALIDAD
Dim af_NP ' Advanced filter for NP
Dim af_NE ' Advanced filter for NE
Dim af_NPR ' Advanced filter for NPR
Dim af_NER ' Advanced filter for NER
Dim af_NEP ' Advanced filter for NEP
Dim af_NERP ' Advanced filter for NERP
Dim af_NFP ' Advanced filter for NFP
Dim af_NF ' Advanced filter for NF
Dim af_ASISTENCIA ' Advanced filter for ASISTENCIA
Dim af_ESTADO ' Advanced filter for ESTADO
Dim af_AD1O_RAMO ' Advanced filter for AÑO_RAMO
Dim af_PER_RAMO ' Advanced filter for PER_RAMO
Dim af_PAT_PROF ' Advanced filter for PAT_PROF
Dim af_MAT_PROF ' Advanced filter for MAT_PROF
Dim af_NOM_PROF ' Advanced filter for NOM_PROF
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
Dim nDisplayGrps: nDisplayGrps = 50 ' Groups per page
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
' Field CODRAMO

Dim sv1_CODRAMO, sv1d_CODRAMO
Dim sv2_CODRAMO, sv2d_CODRAMO
Dim so1_CODRAMO, so1d_CODRAMO
Dim so2_CODRAMO, so2d_CODRAMO
Dim sc_CODRAMO, scd_CODRAMO

' Field AÑOINGRESO
Dim sv1_AD1OINGRESO, sv1d_AD1OINGRESO
Dim sv2_AD1OINGRESO, sv2d_AD1OINGRESO
Dim so1_AD1OINGRESO, so1d_AD1OINGRESO
Dim so2_AD1OINGRESO, so2d_AD1OINGRESO
Dim sc_AD1OINGRESO, scd_AD1OINGRESO

' Field AÑO_MAT
Dim sv1_AD1O_MAT, sv1d_AD1O_MAT
Dim sv2_AD1O_MAT, sv2d_AD1O_MAT
Dim so1_AD1O_MAT, so1d_AD1O_MAT
Dim so2_AD1O_MAT, so2d_AD1O_MAT
Dim sc_AD1O_MAT, scd_AD1O_MAT

' Field PER_MAT
Dim sv1_PER_MAT, sv1d_PER_MAT
Dim sv2_PER_MAT, sv2d_PER_MAT
Dim so1_PER_MAT, so1d_PER_MAT
Dim so2_PER_MAT, so2d_PER_MAT
Dim sc_PER_MAT, scd_PER_MAT

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

' Field AÑO_RAMO
Dim sv1_AD1O_RAMO, sv1d_AD1O_RAMO
Dim sv2_AD1O_RAMO, sv2d_AD1O_RAMO
Dim so1_AD1O_RAMO, so1d_AD1O_RAMO
Dim so2_AD1O_RAMO, so2d_AD1O_RAMO
Dim sc_AD1O_RAMO, scd_AD1O_RAMO

' Field PER_RAMO
Dim sv1_PER_RAMO, sv1d_PER_RAMO
Dim sv2_PER_RAMO, sv2d_PER_RAMO
Dim so1_PER_RAMO, so1d_PER_RAMO
Dim so2_PER_RAMO, so2d_PER_RAMO
Dim sc_PER_RAMO, scd_PER_RAMO

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
Dim x_CODRAMO: x_CODRAMO = Null
Dim x_CODALU: x_CODALU = Null
Dim x_RUT: x_RUT = Null
Dim x_PATERNO: x_PATERNO = Null
Dim x_MATERNO: x_MATERNO = Null
Dim x_NOMBRE: x_NOMBRE = Null
Dim x_SEXO: x_SEXO = Null
Dim x_AD1OINGRESO: x_AD1OINGRESO = Null
Dim x_AD1O_MAT: x_AD1O_MAT = Null
Dim x_PER_MAT: x_PER_MAT = Null
Dim x_NACIONALIDAD: x_NACIONALIDAD = Null
Dim x_NP: x_NP = Null
Dim x_NE: x_NE = Null
Dim x_NPR: x_NPR = Null
Dim x_NER: x_NER = Null
Dim x_NEP: x_NEP = Null
Dim x_NERP: x_NERP = Null
Dim x_NFP: x_NFP = Null
Dim x_NF: x_NF = Null
Dim x_ASISTENCIA: x_ASISTENCIA = Null
Dim x_ESTADO: x_ESTADO = Null
Dim x_AD1O_RAMO: x_AD1O_RAMO = Null
Dim x_PER_RAMO: x_PER_RAMO = Null
Dim x_PAT_PROF: x_PAT_PROF = Null
Dim x_MAT_PROF: x_MAT_PROF = Null
Dim x_NOM_PROF: x_NOM_PROF = Null

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
Dim o_CODRAMO, t_CODRAMO, ft_CODRAMO
o_CODRAMO = Null: t_CODRAMO = Null: ft_CODRAMO = 200
Dim rf_CODRAMO, rt_CODRAMO
Dim o_CODALU, t_CODALU, ft_CODALU
o_CODALU = Null: t_CODALU = Null: ft_CODALU = 200
Dim rf_CODALU, rt_CODALU
Dim o_RUT, t_RUT, ft_RUT
o_RUT = Null: t_RUT = Null: ft_RUT = 200
Dim rf_RUT, rt_RUT
Dim o_PATERNO, t_PATERNO, ft_PATERNO
o_PATERNO = Null: t_PATERNO = Null: ft_PATERNO = 200
Dim rf_PATERNO, rt_PATERNO
Dim o_MATERNO, t_MATERNO, ft_MATERNO
o_MATERNO = Null: t_MATERNO = Null: ft_MATERNO = 200
Dim rf_MATERNO, rt_MATERNO
Dim o_NOMBRE, t_NOMBRE, ft_NOMBRE
o_NOMBRE = Null: t_NOMBRE = Null: ft_NOMBRE = 200
Dim rf_NOMBRE, rt_NOMBRE
Dim o_SEXO, t_SEXO, ft_SEXO
o_SEXO = Null: t_SEXO = Null: ft_SEXO = 200
Dim rf_SEXO, rt_SEXO
Dim o_AD1OINGRESO, t_AD1OINGRESO, ft_AD1OINGRESO
o_AD1OINGRESO = Null: t_AD1OINGRESO = Null: ft_AD1OINGRESO = 131
Dim rf_AD1OINGRESO, rt_AD1OINGRESO
Dim o_AD1O_MAT, t_AD1O_MAT, ft_AD1O_MAT
o_AD1O_MAT = Null: t_AD1O_MAT = Null: ft_AD1O_MAT = 131
Dim rf_AD1O_MAT, rt_AD1O_MAT
Dim o_PER_MAT, t_PER_MAT, ft_PER_MAT
o_PER_MAT = Null: t_PER_MAT = Null: ft_PER_MAT = 131
Dim rf_PER_MAT, rt_PER_MAT
Dim o_NACIONALIDAD, t_NACIONALIDAD, ft_NACIONALIDAD
o_NACIONALIDAD = Null: t_NACIONALIDAD = Null: ft_NACIONALIDAD = 200
Dim rf_NACIONALIDAD, rt_NACIONALIDAD
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
Dim o_NFP, t_NFP, ft_NFP
o_NFP = Null: t_NFP = Null: ft_NFP = 200
Dim rf_NFP, rt_NFP
Dim o_NF, t_NF, ft_NF
o_NF = Null: t_NF = Null: ft_NF = 131
Dim rf_NF, rt_NF
Dim o_ASISTENCIA, t_ASISTENCIA, ft_ASISTENCIA
o_ASISTENCIA = Null: t_ASISTENCIA = Null: ft_ASISTENCIA = 131
Dim rf_ASISTENCIA, rt_ASISTENCIA
Dim o_ESTADO, t_ESTADO, ft_ESTADO
o_ESTADO = Null: t_ESTADO = Null: ft_ESTADO = 200
Dim rf_ESTADO, rt_ESTADO
Dim o_AD1O_RAMO, t_AD1O_RAMO, ft_AD1O_RAMO
o_AD1O_RAMO = Null: t_AD1O_RAMO = Null: ft_AD1O_RAMO = 200
Dim rf_AD1O_RAMO, rt_AD1O_RAMO
Dim o_PER_RAMO, t_PER_RAMO, ft_PER_RAMO
o_PER_RAMO = Null: t_PER_RAMO = Null: ft_PER_RAMO = 200
Dim rf_PER_RAMO, rt_PER_RAMO
Dim o_PAT_PROF, t_PAT_PROF, ft_PAT_PROF
o_PAT_PROF = Null: t_PAT_PROF = Null: ft_PAT_PROF = 200
Dim rf_PAT_PROF, rt_PAT_PROF
Dim o_MAT_PROF, t_MAT_PROF, ft_MAT_PROF
o_MAT_PROF = Null: t_MAT_PROF = Null: ft_MAT_PROF = 200
Dim rf_MAT_PROF, rt_MAT_PROF
Dim o_NOM_PROF, t_NOM_PROF, ft_NOM_PROF
o_NOM_PROF = Null: t_NOM_PROF = Null: ft_NOM_PROF = 200
Dim rf_NOM_PROF, rt_NOM_PROF
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

Dim col(29), val(29), cnt(0,29)
Dim smry(0,29), mn(0,29), mx(0,29)
Dim grandsmry(29), grandmn(29), grandmx(29)

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
var elm = form_obj.sv1_AD1OINGRESO;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - AÑOINGRESO"))
		return false;
}
var elm = form_obj.sv1_AD1O_MAT;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - AÑO MAT"))
		return false;
}
var elm = form_obj.sv1_PER_MAT;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - PER MAT"))
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
<link rel="stylesheet" type="text/css" media="all" href="../../css/titles.css"/>
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
	<h1>Notas Historicas</h1>
</div>
<% If sExport = "" Then %>
&nbsp;&nbsp;<a href="Notas_Historicassmry.asp?export=excel"><img src="../../images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
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
&nbsp;&nbsp;<a href="Notas_Historicassmry.asp?cmd=reset">Resetear Filtros</a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fNotas_Historicassummaryfilter" id="fNotas_Historicassummaryfilter" action="Notas_Historicassmry.asp" class="ewForm" onSubmit="return ewrpt_ValidateExtFilter(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr>
		<td><span class="aspreportmaker">FACULTAD</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FACULTAD" id="sv_FACULTAD"<% If sClearExtFilter = "Notas_Historicas_FACULTAD" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
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
		<select name="sv_CARRERA" id="sv_CARRERA"<% If sClearExtFilter = "Notas_Historicas_CARRERA" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
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
<% If sClearExtFilter = "Notas_Historicas_CODRAMO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">CODIGO RAMO</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_CODRAMO" id="so1_CODRAMO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_CODRAMO" id="sv1_CODRAMO" size="30" maxlength="30" value="<%= Server.HTMLEncode(sv1_CODRAMO&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Notas_Historicas_AD1OINGRESO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">AÑO INGRESO</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_AD1OINGRESO" id="so1_AD1OINGRESO" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_AD1OINGRESO" id="sv1_AD1OINGRESO" size="30" value="<%= Server.HTMLEncode(sv1_AD1OINGRESO&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Notas_Historicas_AD1O_MAT" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">AÑO MATRICULA</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_AD1O_MAT" id="so1_AD1O_MAT" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_AD1O_MAT" id="sv1_AD1O_MAT" size="30" value="<%= Server.HTMLEncode(sv1_AD1O_MAT&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Notas_Historicas_PER_MAT" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">PERIODO MATRICULA</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_PER_MAT" id="so1_PER_MAT" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_PER_MAT" id="sv1_PER_MAT" size="30" value="<%= Server.HTMLEncode(sv1_PER_MAT&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Notas_Historicas_NP" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">NP</span></td>
		<td><span class="ewrptSearchOpr">>=<input type="hidden" name="so1_NP" id="so1_NP" value=">="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_NP" id="sv1_NP" size="30" value="<%= Server.HTMLEncode(sv1_NP&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Notas_Historicas_NF" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">NF</span></td>
		<td><span class="ewrptSearchOpr">>=<input type="hidden" name="so1_NF" id="so1_NF" value=">="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_NF" id="sv1_NF" size="30" value="<%= Server.HTMLEncode(sv1_NF&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Notas_Historicas_ASISTENCIA" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">ASISTENCIA</span></td>
		<td><span class="ewrptSearchOpr">>=<input type="hidden" name="so1_ASISTENCIA" id="so1_ASISTENCIA" value=">="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_ASISTENCIA" id="sv1_ASISTENCIA" size="30" value="<%= Server.HTMLEncode(sv1_ASISTENCIA&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Notas_Historicas_AD1O_RAMO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">AÑO RAMO</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_AD1O_RAMO" id="so1_AD1O_RAMO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_AD1O_RAMO" id="sv1_AD1O_RAMO" size="30" maxlength="4" value="<%= Server.HTMLEncode(sv1_AD1O_RAMO&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Notas_Historicas_PER_RAMO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">PERIODO RAMO</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_PER_RAMO" id="so1_PER_RAMO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_PER_RAMO" id="sv1_PER_RAMO" size="30" maxlength="1" value="<%= Server.HTMLEncode(sv1_PER_RAMO&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
</table>
<table class="ewRptExtFilter">
	<tr>
		<td><span class="aspreportmaker">
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
		CODIGO ALUMNO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CODIGO ALUMNO</td>
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
		PATERNO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PATERNO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		MATERNO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>MATERNO</td>
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
		SEXO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>SEXO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		AÑO INGRESO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>AÑO INGRESO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		AÑO MATRICULA
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>AÑO MATRICULA</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		PERIODO MATRICULA</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PERIODO MATRICULA</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NACIONALIDAD
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NACIONALIDAD</td>
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
		AÑO RAMO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>AÑO RAMO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		PERIODO RAMO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PERIODO RAMO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		PAT PROFESOR
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PAT PROFESOR</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		MAT PROFESOR
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>MAT PROFESOR</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOMBRE PROFESOR
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOMBRE PROFESOR</td>
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
<%= ewrpt_ViewValue(x_CODRAMO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CODALU) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_RUT) %>
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
<%= ewrpt_ViewValue(x_SEXO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_AD1OINGRESO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_AD1O_MAT) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PER_MAT) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NACIONALIDAD) %>
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
<%= ewrpt_ViewValue(x_NFP) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NF) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ASISTENCIA) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ESTADO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_AD1O_RAMO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PER_RAMO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PAT_PROF) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_MAT_PROF) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NOM_PROF) %>
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
	<!-- tr><td colspan="29"><span class="aspreportmaker">&nbsp;<br></span></td></tr -->
	<tr class="ewRptGrandSummary">
	  <td colspan="29">Total General (<%= FormatNumber(rstotcnt,0) %> Registros)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If sExport = "" Then %>
<div class="ewGridLowerPanel">
<form action="Notas_Historicassmry.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td nowrap>
<% If Not IsObject(Pager) Then Set Pager = ew_NewPrevNextPager(nStartGrp, nDisplayGrps, nTotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr>
	  <td><span class="aspreportmaker">P&aacute;gina&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="Notas_Historicassmry.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="First" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="First" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="Notas_Historicassmry.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="Previous" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="Previous" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="Notas_Historicassmry.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="Next" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="Next" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="Notas_Historicassmry.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="Last" width="16" height="16" border="0"></a></td>	
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
	<span class="aspreportmaker">Ingrese una palabra a buscar</span>
	<% Else %>
	<span class="aspreportmaker">Registros no encontrados</span>
	<% End If %>
<% End If %>
		</td>
<% If nTotalGrps > 0 Then %>
		<td nowrap>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" valign="top" nowrap><span class="aspreportmaker">Registros por P&aacute;gina&nbsp;
<select name="<%= EW_REPORT_TABLE_GROUP_PER_PAGE %>" onChange="this.form.submit();" class="aspreportmaker">
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
		x_CODRAMO = ewrpt_GetValue(rs("CODRAMO"))
		x_CODALU = ewrpt_GetValue(rs("CODALU"))
		x_RUT = ewrpt_GetValue(rs("RUT"))
		x_PATERNO = ewrpt_GetValue(rs("PATERNO"))
		x_MATERNO = ewrpt_GetValue(rs("MATERNO"))
		x_NOMBRE = ewrpt_GetValue(rs("NOMBRE"))
		x_SEXO = ewrpt_GetValue(rs("SEXO"))
		x_AD1OINGRESO = ewrpt_GetValue(rs("AÑOINGRESO"))
		If Not IsNull(x_AD1OINGRESO) Then x_AD1OINGRESO = CDbl(x_AD1OINGRESO)
		x_AD1O_MAT = ewrpt_GetValue(rs("AÑO_MAT"))
		If Not IsNull(x_AD1O_MAT) Then x_AD1O_MAT = CDbl(x_AD1O_MAT)
		x_PER_MAT = ewrpt_GetValue(rs("PER_MAT"))
		If Not IsNull(x_PER_MAT) Then x_PER_MAT = CDbl(x_PER_MAT)
		x_NACIONALIDAD = ewrpt_GetValue(rs("NACIONALIDAD"))
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
		x_NFP = ewrpt_GetValue(rs("NFP"))
		x_NF = ewrpt_GetValue(rs("NF"))
		If Not IsNull(x_NF) Then x_NF = CDbl(x_NF)
		x_ASISTENCIA = ewrpt_GetValue(rs("ASISTENCIA"))
		If Not IsNull(x_ASISTENCIA) Then x_ASISTENCIA = CDbl(x_ASISTENCIA)
		x_ESTADO = ewrpt_GetValue(rs("ESTADO"))
		x_AD1O_RAMO = ewrpt_GetValue(rs("AÑO_RAMO"))
		x_PER_RAMO = ewrpt_GetValue(rs("PER_RAMO"))
		x_PAT_PROF = ewrpt_GetValue(rs("PAT_PROF"))
		x_MAT_PROF = ewrpt_GetValue(rs("MAT_PROF"))
		x_NOM_PROF = ewrpt_GetValue(rs("NOM_PROF"))
		val(1) = x_FACULTAD
		val(2) = x_CARRERA
		val(3) = x_RAMO
		val(4) = x_CODRAMO
		val(5) = x_CODALU
		val(6) = x_RUT
		val(7) = x_PATERNO
		val(8) = x_MATERNO
		val(9) = x_NOMBRE
		val(10) = x_SEXO
		val(11) = x_AD1OINGRESO
		val(12) = x_AD1O_MAT
		val(13) = x_PER_MAT
		val(14) = x_NACIONALIDAD
		val(15) = x_NP
		val(16) = x_NE
		val(17) = x_NPR
		val(18) = x_NER
		val(19) = x_NEP
		val(20) = x_NERP
		val(21) = x_NFP
		val(22) = x_NF
		val(23) = x_ASISTENCIA
		val(24) = x_ESTADO
		val(25) = x_AD1O_RAMO
		val(26) = x_PER_RAMO
		val(27) = x_PAT_PROF
		val(28) = x_MAT_PROF
		val(29) = x_NOM_PROF
	Else
		x_FACULTAD = ""
		x_CARRERA = ""
		x_RAMO = ""
		x_CODRAMO = ""
		x_CODALU = ""
		x_RUT = ""
		x_PATERNO = ""
		x_MATERNO = ""
		x_NOMBRE = ""
		x_SEXO = ""
		x_AD1OINGRESO = ""
		x_AD1O_MAT = ""
		x_PER_MAT = ""
		x_NACIONALIDAD = ""
		x_NP = ""
		x_NE = ""
		x_NPR = ""
		x_NER = ""
		x_NEP = ""
		x_NERP = ""
		x_NFP = ""
		x_NF = ""
		x_ASISTENCIA = ""
		x_ESTADO = ""
		x_AD1O_RAMO = ""
		x_PER_RAMO = ""
		x_PAT_PROF = ""
		x_MAT_PROF = ""
		x_NOM_PROF = ""
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
				nDisplayGrps = 50 ' Non-numeric, Load Default
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
			nDisplayGrps = 50 ' Load Default
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

		Call SetSessionDropDownValue(sv_FACULTAD, "Notas_Historicas_FACULTAD")

		' Field CARRERA
		Call SetSessionDropDownValue(sv_CARRERA, "Notas_Historicas_CARRERA")

		' Field CODRAMO
		Call SetSessionFilterValues(sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO, "Notas_Historicas_CODRAMO")

		' Field AÑOINGRESO
		Call SetSessionFilterValues(sv1_AD1OINGRESO, so1_AD1OINGRESO, sc_AD1OINGRESO, sv2_AD1OINGRESO, so2_AD1OINGRESO, "Notas_Historicas_AD1OINGRESO")

		' Field AÑO_MAT
		Call SetSessionFilterValues(sv1_AD1O_MAT, so1_AD1O_MAT, sc_AD1O_MAT, sv2_AD1O_MAT, so2_AD1O_MAT, "Notas_Historicas_AD1O_MAT")

		' Field PER_MAT
		Call SetSessionFilterValues(sv1_PER_MAT, so1_PER_MAT, sc_PER_MAT, sv2_PER_MAT, so2_PER_MAT, "Notas_Historicas_PER_MAT")

		' Field NP
		Call SetSessionFilterValues(sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP, "Notas_Historicas_NP")

		' Field NF
		Call SetSessionFilterValues(sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF, "Notas_Historicas_NF")

		' Field ASISTENCIA
		Call SetSessionFilterValues(sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA, "Notas_Historicas_ASISTENCIA")

		' Field AÑO_RAMO
		Call SetSessionFilterValues(sv1_AD1O_RAMO, so1_AD1O_RAMO, sc_AD1O_RAMO, sv2_AD1O_RAMO, so2_AD1O_RAMO, "Notas_Historicas_AD1O_RAMO")

		' Field PER_RAMO
		Call SetSessionFilterValues(sv1_PER_RAMO, so1_PER_RAMO, sc_PER_RAMO, sv2_PER_RAMO, so2_PER_RAMO, "Notas_Historicas_PER_RAMO")
		bSetupFilter = True ' Set up filter required
	Else

		' Field FACULTAD
		If GetDropDownValue(sv_FACULTAD, "FACULTAD") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_FACULTAD) Then
			If sv_FACULTAD <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_Notas_Historicas_FACULTAD")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field CARRERA
		If GetDropDownValue(sv_CARRERA, "CARRERA") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_CARRERA) Then
			If sv_CARRERA <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_Notas_Historicas_CARRERA")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field CODRAMO
		If GetFilterValues(sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO, "CODRAMO") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field AÑOINGRESO
		If GetFilterValues(sv1_AD1OINGRESO, so1_AD1OINGRESO, sc_AD1OINGRESO, sv2_AD1OINGRESO, so2_AD1OINGRESO, "AD1OINGRESO") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field AÑO_MAT
		If GetFilterValues(sv1_AD1O_MAT, so1_AD1O_MAT, sc_AD1O_MAT, sv2_AD1O_MAT, so2_AD1O_MAT, "AD1O_MAT") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field PER_MAT
		If GetFilterValues(sv1_PER_MAT, so1_PER_MAT, sc_PER_MAT, sv2_PER_MAT, so2_PER_MAT, "PER_MAT") Then
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

		' Field AÑO_RAMO
		If GetFilterValues(sv1_AD1O_RAMO, so1_AD1O_RAMO, sc_AD1O_RAMO, sv2_AD1O_RAMO, so2_AD1O_RAMO, "AD1O_RAMO") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field PER_RAMO
		If GetFilterValues(sv1_PER_RAMO, so1_PER_RAMO, sc_PER_RAMO, sv2_PER_RAMO, so2_PER_RAMO, "PER_RAMO") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If
	End If

	' Restore session
	If bRestoreSession Then

		' Field FACULTAD
		Call GetSessionDropDownValue(sv_FACULTAD, "Notas_Historicas_FACULTAD")

		' Field CARRERA
		Call GetSessionDropDownValue(sv_CARRERA, "Notas_Historicas_CARRERA")

		' Field CODRAMO
		Call GetSessionFilterValues(sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO, "Notas_Historicas_CODRAMO")

		' Field AÑOINGRESO
		Call GetSessionFilterValues(sv1_AD1OINGRESO, so1_AD1OINGRESO, sc_AD1OINGRESO, sv2_AD1OINGRESO, so2_AD1OINGRESO, "Notas_Historicas_AD1OINGRESO")

		' Field AÑO_MAT
		Call GetSessionFilterValues(sv1_AD1O_MAT, so1_AD1O_MAT, sc_AD1O_MAT, sv2_AD1O_MAT, so2_AD1O_MAT, "Notas_Historicas_AD1O_MAT")

		' Field PER_MAT
		Call GetSessionFilterValues(sv1_PER_MAT, so1_PER_MAT, sc_PER_MAT, sv2_PER_MAT, so2_PER_MAT, "Notas_Historicas_PER_MAT")

		' Field NP
		Call GetSessionFilterValues(sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP, "Notas_Historicas_NP")

		' Field NF
		Call GetSessionFilterValues(sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF, "Notas_Historicas_NF")

		' Field ASISTENCIA
		Call GetSessionFilterValues(sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA, "Notas_Historicas_ASISTENCIA")

		' Field AÑO_RAMO
		Call GetSessionFilterValues(sv1_AD1O_RAMO, so1_AD1O_RAMO, sc_AD1O_RAMO, sv2_AD1O_RAMO, so2_AD1O_RAMO, "Notas_Historicas_AD1O_RAMO")

		' Field PER_RAMO
		Call GetSessionFilterValues(sv1_PER_RAMO, so1_PER_RAMO, sc_PER_RAMO, sv2_PER_RAMO, so2_PER_RAMO, "Notas_Historicas_PER_RAMO")
	End If

	' Build sql
	' Field FACULTAD

	Call BuildDropDownFilter(sFilter, "FACULTAD", "[FACULTAD]", EW_REPORT_DATATYPE_STRING, 0, sv_FACULTAD, "")

	' Field CARRERA
	Call BuildDropDownFilter(sFilter, "CARRERA", "[CARRERA]", EW_REPORT_DATATYPE_STRING, 0, sv_CARRERA, "")

	' Field CODRAMO
	Call BuildExtendedFilter(sFilter, "CODRAMO", "[CODRAMO]", EW_REPORT_DATATYPE_STRING, 0, sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO)

	' Field AÑOINGRESO
	Call BuildExtendedFilter(sFilter, "AÑOINGRESO", "[AÑOINGRESO]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_AD1OINGRESO, so1_AD1OINGRESO, sc_AD1OINGRESO, sv2_AD1OINGRESO, so2_AD1OINGRESO)

	' Field AÑO_MAT
	Call BuildExtendedFilter(sFilter, "AÑO_MAT", "[AÑO_MAT]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_AD1O_MAT, so1_AD1O_MAT, sc_AD1O_MAT, sv2_AD1O_MAT, so2_AD1O_MAT)

	' Field PER_MAT
	Call BuildExtendedFilter(sFilter, "PER_MAT", "[PER_MAT]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_PER_MAT, so1_PER_MAT, sc_PER_MAT, sv2_PER_MAT, so2_PER_MAT)

	' Field NP
	Call BuildExtendedFilter(sFilter, "NP", "[NP]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP)

	' Field NF
	Call BuildExtendedFilter(sFilter, "NF", "[NF]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF)

	' Field ASISTENCIA
	Call BuildExtendedFilter(sFilter, "ASISTENCIA", "[ASISTENCIA]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA)

	' Field AÑO_RAMO
	Call BuildExtendedFilter(sFilter, "AÑO_RAMO", "[AÑO_RAMO]", EW_REPORT_DATATYPE_STRING, 0, sv1_AD1O_RAMO, so1_AD1O_RAMO, sc_AD1O_RAMO, sv2_AD1O_RAMO, so2_AD1O_RAMO)

	' Field PER_RAMO
	Call BuildExtendedFilter(sFilter, "PER_RAMO", "[PER_RAMO]", EW_REPORT_DATATYPE_STRING, 0, sv1_PER_RAMO, so1_PER_RAMO, sc_PER_RAMO, sv2_PER_RAMO, so2_PER_RAMO)

	' Save parms to Session
	' Field FACULTAD

	Call SetSessionDropDownValue(sv_FACULTAD, "Notas_Historicas_FACULTAD")

	' Field CARRERA
	Call SetSessionDropDownValue(sv_CARRERA, "Notas_Historicas_CARRERA")

	' Field CODRAMO
	Call SetSessionFilterValues(sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO, "Notas_Historicas_CODRAMO")

	' Field AÑOINGRESO
	Call SetSessionFilterValues(sv1_AD1OINGRESO, so1_AD1OINGRESO, sc_AD1OINGRESO, sv2_AD1OINGRESO, so2_AD1OINGRESO, "Notas_Historicas_AD1OINGRESO")

	' Field AÑO_MAT
	Call SetSessionFilterValues(sv1_AD1O_MAT, so1_AD1O_MAT, sc_AD1O_MAT, sv2_AD1O_MAT, so2_AD1O_MAT, "Notas_Historicas_AD1O_MAT")

	' Field PER_MAT
	Call SetSessionFilterValues(sv1_PER_MAT, so1_PER_MAT, sc_PER_MAT, sv2_PER_MAT, so2_PER_MAT, "Notas_Historicas_PER_MAT")

	' Field NP
	Call SetSessionFilterValues(sv1_NP, so1_NP, sc_NP, sv2_NP, so2_NP, "Notas_Historicas_NP")

	' Field NF
	Call SetSessionFilterValues(sv1_NF, so1_NF, sc_NF, sv2_NF, so2_NF, "Notas_Historicas_NF")

	' Field ASISTENCIA
	Call SetSessionFilterValues(sv1_ASISTENCIA, so1_ASISTENCIA, sc_ASISTENCIA, sv2_ASISTENCIA, so2_ASISTENCIA, "Notas_Historicas_ASISTENCIA")

	' Field AÑO_RAMO
	Call SetSessionFilterValues(sv1_AD1O_RAMO, so1_AD1O_RAMO, sc_AD1O_RAMO, sv2_AD1O_RAMO, so2_AD1O_RAMO, "Notas_Historicas_AD1O_RAMO")

	' Field PER_RAMO
	Call SetSessionFilterValues(sv1_PER_RAMO, so1_PER_RAMO, sc_PER_RAMO, sv2_PER_RAMO, so2_PER_RAMO, "Notas_Historicas_PER_RAMO")

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
	' Field CODRAMO
	' sv1d_CODRAMO = Date ' Default value is today
	' so1d_CODRAMO = "<=" ' Default operator is "<="

	sv1d_CODRAMO = Null ' Default ext filter value 1
	sv2d_CODRAMO = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_CODRAMO = "LIKE" ' Default search operator 1
	so2d_CODRAMO = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_CODRAMO = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_CODRAMO = sv1d_CODRAMO
	sv2_CODRAMO = sv2d_CODRAMO
	so1_CODRAMO = so1d_CODRAMO
	so2_CODRAMO = so2d_CODRAMO
	sc_CODRAMO = scd_CODRAMO

	' Field AÑOINGRESO
	' sv1d_AD1OINGRESO = Date ' Default value is today
	' so1d_AD1OINGRESO = "<=" ' Default operator is "<="

	sv1d_AD1OINGRESO = Null ' Default ext filter value 1
	sv2d_AD1OINGRESO = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_AD1OINGRESO = "=" ' Default search operator 1
	so2d_AD1OINGRESO = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_AD1OINGRESO = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_AD1OINGRESO = sv1d_AD1OINGRESO
	sv2_AD1OINGRESO = sv2d_AD1OINGRESO
	so1_AD1OINGRESO = so1d_AD1OINGRESO
	so2_AD1OINGRESO = so2d_AD1OINGRESO
	sc_AD1OINGRESO = scd_AD1OINGRESO

	' Field AÑO_MAT
	' sv1d_AD1O_MAT = Date ' Default value is today
	' so1d_AD1O_MAT = "<=" ' Default operator is "<="

	sv1d_AD1O_MAT = Null ' Default ext filter value 1
	sv2d_AD1O_MAT = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_AD1O_MAT = "=" ' Default search operator 1
	so2d_AD1O_MAT = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_AD1O_MAT = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_AD1O_MAT = sv1d_AD1O_MAT
	sv2_AD1O_MAT = sv2d_AD1O_MAT
	so1_AD1O_MAT = so1d_AD1O_MAT
	so2_AD1O_MAT = so2d_AD1O_MAT
	sc_AD1O_MAT = scd_AD1O_MAT

	' Field PER_MAT
	' sv1d_PER_MAT = Date ' Default value is today
	' so1d_PER_MAT = "<=" ' Default operator is "<="

	sv1d_PER_MAT = Null ' Default ext filter value 1
	sv2d_PER_MAT = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_PER_MAT = "=" ' Default search operator 1
	so2d_PER_MAT = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_PER_MAT = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_PER_MAT = sv1d_PER_MAT
	sv2_PER_MAT = sv2d_PER_MAT
	so1_PER_MAT = so1d_PER_MAT
	so2_PER_MAT = so2d_PER_MAT
	sc_PER_MAT = scd_PER_MAT

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

	' Field AÑO_RAMO
	' sv1d_AD1O_RAMO = Date ' Default value is today
	' so1d_AD1O_RAMO = "<=" ' Default operator is "<="

	sv1d_AD1O_RAMO = Null ' Default ext filter value 1
	sv2d_AD1O_RAMO = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_AD1O_RAMO = "LIKE" ' Default search operator 1
	so2d_AD1O_RAMO = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_AD1O_RAMO = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_AD1O_RAMO = sv1d_AD1O_RAMO
	sv2_AD1O_RAMO = sv2d_AD1O_RAMO
	so1_AD1O_RAMO = so1d_AD1O_RAMO
	so2_AD1O_RAMO = so2d_AD1O_RAMO
	sc_AD1O_RAMO = scd_AD1O_RAMO

	' Field PER_RAMO
	' sv1d_PER_RAMO = Date ' Default value is today
	' so1d_PER_RAMO = "<=" ' Default operator is "<="

	sv1d_PER_RAMO = Null ' Default ext filter value 1
	sv2d_PER_RAMO = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_PER_RAMO = "LIKE" ' Default search operator 1
	so2d_PER_RAMO = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_PER_RAMO = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_PER_RAMO = sv1d_PER_RAMO
	sv2_PER_RAMO = sv2d_PER_RAMO
	so1_PER_RAMO = so1d_PER_RAMO
	so2_PER_RAMO = so2d_PER_RAMO
	sc_PER_RAMO = scd_PER_RAMO

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

	' Check CODRAMO Text filter
	If TextFilterApplied(sv1_CODRAMO, sv2_CODRAMO, so1_CODRAMO, so2_CODRAMO, sc_CODRAMO, _
		sv1d_CODRAMO, sv2d_CODRAMO, so1d_CODRAMO, so2d_CODRAMO, scd_CODRAMO) Then
		CheckFilter = True
		Exit Function
	End If

	' Check AÑOINGRESO Text filter
	If TextFilterApplied(sv1_AD1OINGRESO, sv2_AD1OINGRESO, so1_AD1OINGRESO, so2_AD1OINGRESO, sc_AD1OINGRESO, _
		sv1d_AD1OINGRESO, sv2d_AD1OINGRESO, so1d_AD1OINGRESO, so2d_AD1OINGRESO, scd_AD1OINGRESO) Then
		CheckFilter = True
		Exit Function
	End If

	' Check AÑO_MAT Text filter
	If TextFilterApplied(sv1_AD1O_MAT, sv2_AD1O_MAT, so1_AD1O_MAT, so2_AD1O_MAT, sc_AD1O_MAT, _
		sv1d_AD1O_MAT, sv2d_AD1O_MAT, so1d_AD1O_MAT, so2d_AD1O_MAT, scd_AD1O_MAT) Then
		CheckFilter = True
		Exit Function
	End If

	' Check PER_MAT Text filter
	If TextFilterApplied(sv1_PER_MAT, sv2_PER_MAT, so1_PER_MAT, so2_PER_MAT, sc_PER_MAT, _
		sv1d_PER_MAT, sv2d_PER_MAT, so1d_PER_MAT, so2d_PER_MAT, scd_PER_MAT) Then
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

	' Check AÑO_RAMO Text filter
	If TextFilterApplied(sv1_AD1O_RAMO, sv2_AD1O_RAMO, so1_AD1O_RAMO, so2_AD1O_RAMO, sc_AD1O_RAMO, _
		sv1d_AD1O_RAMO, sv2d_AD1O_RAMO, so1d_AD1O_RAMO, so2d_AD1O_RAMO, scd_AD1O_RAMO) Then
		CheckFilter = True
		Exit Function
	End If

	' Check PER_RAMO Text filter
	If TextFilterApplied(sv1_PER_RAMO, sv2_PER_RAMO, so1_PER_RAMO, so2_PER_RAMO, sc_PER_RAMO, _
		sv1d_PER_RAMO, sv2d_PER_RAMO, so1d_PER_RAMO, so2d_PER_RAMO, scd_PER_RAMO) Then
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

	' Field CODRAMO
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "CODRAMO", "[CODRAMO]", EW_REPORT_DATATYPE_STRING, 0, sv1_CODRAMO, so1_CODRAMO, sc_CODRAMO, sv2_CODRAMO, so2_CODRAMO)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "CODRAMO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field AÑOINGRESO
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "AÑOINGRESO", "[AÑOINGRESO]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_AD1OINGRESO, so1_AD1OINGRESO, sc_AD1OINGRESO, sv2_AD1OINGRESO, so2_AD1OINGRESO)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "AÑOINGRESO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field AÑO_MAT
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "AÑO_MAT", "[AÑO_MAT]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_AD1O_MAT, so1_AD1O_MAT, sc_AD1O_MAT, sv2_AD1O_MAT, so2_AD1O_MAT)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "AÑO MAT<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field PER_MAT
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "PER_MAT", "[PER_MAT]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_PER_MAT, so1_PER_MAT, sc_PER_MAT, sv2_PER_MAT, so2_PER_MAT)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "PER MAT<br>"
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

	' Field AÑO_RAMO
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "AÑO_RAMO", "[AÑO_RAMO]", EW_REPORT_DATATYPE_STRING, 0, sv1_AD1O_RAMO, so1_AD1O_RAMO, sc_AD1O_RAMO, sv2_AD1O_RAMO, so2_AD1O_RAMO)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "AÑO RAMO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field PER_RAMO
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "PER_RAMO", "[PER_RAMO]", EW_REPORT_DATATYPE_STRING, 0, sv1_PER_RAMO, so1_PER_RAMO, sc_PER_RAMO, sv2_PER_RAMO, so2_PER_RAMO)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "PER RAMO<br>"
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
			Session("sort_Notas_Historicas_FACULTAD") = ""
			Session("sort_Notas_Historicas_CARRERA") = ""
			Session("sort_Notas_Historicas_RAMO") = ""
			Session("sort_Notas_Historicas_CODRAMO") = ""
			Session("sort_Notas_Historicas_CODALU") = ""
			Session("sort_Notas_Historicas_RUT") = ""
			Session("sort_Notas_Historicas_PATERNO") = ""
			Session("sort_Notas_Historicas_MATERNO") = ""
			Session("sort_Notas_Historicas_NOMBRE") = ""
			Session("sort_Notas_Historicas_SEXO") = ""
			Session("sort_Notas_Historicas_AD1OINGRESO") = ""
			Session("sort_Notas_Historicas_AD1O_MAT") = ""
			Session("sort_Notas_Historicas_PER_MAT") = ""
			Session("sort_Notas_Historicas_NACIONALIDAD") = ""
			Session("sort_Notas_Historicas_NP") = ""
			Session("sort_Notas_Historicas_NE") = ""
			Session("sort_Notas_Historicas_NPR") = ""
			Session("sort_Notas_Historicas_NER") = ""
			Session("sort_Notas_Historicas_NEP") = ""
			Session("sort_Notas_Historicas_NERP") = ""
			Session("sort_Notas_Historicas_NFP") = ""
			Session("sort_Notas_Historicas_NF") = ""
			Session("sort_Notas_Historicas_ASISTENCIA") = ""
			Session("sort_Notas_Historicas_ESTADO") = ""
			Session("sort_Notas_Historicas_AD1O_RAMO") = ""
			Session("sort_Notas_Historicas_PER_RAMO") = ""
			Session("sort_Notas_Historicas_PAT_PROF") = ""
			Session("sort_Notas_Historicas_MAT_PROF") = ""
			Session("sort_Notas_Historicas_NOM_PROF") = ""
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
