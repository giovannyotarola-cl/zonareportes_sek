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

' ASP Report Maker 3.0+ - Table level configuration (Detalle Reporte Autoevaluacion)
' Table Level Constants

Const EW_REPORT_TABLE_VAR = "Detalle_Reporte_Autoevaluacion"
Const EW_REPORT_TABLE_SESSION_GROUP_PER_PAGE = "Detalle_Reporte_Autoevaluacion_grpperpage"
Const EW_REPORT_TABLE_SESSION_START_GROUP = "Detalle_Reporte_Autoevaluacion_start"
Const EW_REPORT_TABLE_SESSION_SEARCH = "Detalle_Reporte_Autoevaluacion_search"
Const EW_REPORT_TABLE_SESSION_CHILD_USER_ID = "Detalle_Reporte_Autoevaluacion_childuserid"
Const EW_REPORT_TABLE_SESSION_ORDER_BY = "Detalle_Reporte_Autoevaluacion_orderby"

' Table Level SQL
Const EW_REPORT_TABLE_SQL_FROM = "[Vista_Autoevaglobal]"
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
Dim af_AF1oMat ' Advanced filter for AñoMat
Dim af_PERIODO_MAT ' Advanced filter for PERIODO_MAT
Dim af_AF1oIng ' Advanced filter for AñoIng
Dim af_MATRICULADO ' Advanced filter for MATRICULADO
Dim af_ESTACAD ' Advanced filter for ESTACAD
Dim af_DESCRIPCION ' Advanced filter for DESCRIPCION
Dim af_NOMBRE_C ' Advanced filter for NOMBRE_C
Dim af_JORNADA ' Advanced filter for JORNADA
Dim af_NACIONALIDAD ' Advanced filter for NACIONALIDAD
Dim af_CODCLI ' Advanced filter for CODCLI
Dim af_DIG ' Advanced filter for DIG
Dim af_PATERNO ' Advanced filter for PATERNO
Dim af_MATERNO ' Advanced filter for MATERNO
Dim af_NOMBRE ' Advanced filter for NOMBRE
Dim af_CODCARR ' Advanced filter for CODCARR
Dim af_COMUNA ' Advanced filter for COMUNA
Dim af_CIUDADACT ' Advanced filter for CIUDADACT
Dim af_SEXO ' Advanced filter for SEXO
Dim af_FECNAC ' Advanced filter for FECNAC
Dim af_PUNTAJE ' Advanced filter for PUNTAJE
Dim af_PAA ' Advanced filter for PAA
Dim af_ANOEEM ' Advanced filter for ANOEEM
Dim af_NOTAEM ' Advanced filter for NOTAEM
Dim af_NomColegio ' Advanced filter for NomColegio
Dim af_CiudColegio ' Advanced filter for CiudColegio
Dim af_ComunaCol ' Advanced filter for ComunaCol
Dim af_RegimenCol ' Advanced filter for RegimenCol
Dim af_ModaCol ' Advanced filter for ModaCol
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
Dim nDisplayGrps: nDisplayGrps = 100 ' Groups per page
Dim nGrpRange: nGrpRange = 10

' Clear field for ext filter
Dim sClearExtFilter
Dim sClearInputClass

' Non-Text Extended Filters
' Field MATRICULADO

Dim sv_MATRICULADO, svd_MATRICULADO
Dim sr_MATRICULADO

' Field ESTACAD
Dim sv_ESTACAD, svd_ESTACAD
Dim sr_ESTACAD

' Field DESCRIPCION
Dim sv_DESCRIPCION, svd_DESCRIPCION
Dim sr_DESCRIPCION

' Field NOMBRE_C
Dim sv_NOMBRE_C, svd_NOMBRE_C
Dim sr_NOMBRE_C

' Field JORNADA
Dim sv_JORNADA, svd_JORNADA
Dim sr_JORNADA

' Field NACIONALIDAD
Dim sv_NACIONALIDAD, svd_NACIONALIDAD
Dim sr_NACIONALIDAD

' Text Extended filters
' Field AñoMat

Dim sv1_AF1oMat, sv1d_AF1oMat
Dim sv2_AF1oMat, sv2d_AF1oMat
Dim so1_AF1oMat, so1d_AF1oMat
Dim so2_AF1oMat, so2d_AF1oMat
Dim sc_AF1oMat, scd_AF1oMat

' Field PERIODO_MAT
Dim sv1_PERIODO_MAT, sv1d_PERIODO_MAT
Dim sv2_PERIODO_MAT, sv2d_PERIODO_MAT
Dim so1_PERIODO_MAT, so1d_PERIODO_MAT
Dim so2_PERIODO_MAT, so2d_PERIODO_MAT
Dim sc_PERIODO_MAT, scd_PERIODO_MAT

' Field fecmat
Dim sv1_fecmat, sv1d_fecmat
Dim sv2_fecmat, sv2d_fecmat
Dim so1_fecmat, so1d_fecmat
Dim so2_fecmat, so2d_fecmat
Dim sc_fecmat, scd_fecmat

' Field AñoIng
Dim sv1_AF1oIng, sv1d_AF1oIng
Dim sv2_AF1oIng, sv2d_AF1oIng
Dim so1_AF1oIng, so1d_AF1oIng
Dim so2_AF1oIng, so2d_AF1oIng
Dim sc_AF1oIng, scd_AF1oIng

' Custom filters
Dim ewrpt_CustomFilters
%>
<%
%>
<%

' Field variables
Dim x_AF1oMat: x_AF1oMat = Null
Dim x_PERIODO_MAT: x_PERIODO_MAT = Null
Dim x_TIPOCARR: x_TIPOCARR = Null
Dim x_fecmat: x_fecmat = Null
Dim x_AF1oIng: x_AF1oIng = Null
Dim x_MATRICULADO: x_MATRICULADO = Null
Dim x_ESTACAD: x_ESTACAD = Null
Dim x_DESCRIPCION: x_DESCRIPCION = Null
Dim x_NOMBRE_C: x_NOMBRE_C = Null
Dim x_JORNADA: x_JORNADA = Null
Dim x_NACIONALIDAD: x_NACIONALIDAD = Null
Dim x_CODCLI: x_CODCLI = Null
Dim x_DIG: x_DIG = Null
Dim x_PATERNO: x_PATERNO = Null
Dim x_MATERNO: x_MATERNO = Null
Dim x_NOMBRE: x_NOMBRE = Null
Dim x_CODCARR: x_CODCARR = Null
Dim x_COMUNA: x_COMUNA = Null
Dim x_CIUDADACT: x_CIUDADACT = Null
Dim x_SEXO: x_SEXO = Null
Dim x_FECNAC: x_FECNAC = Null
Dim x_PUNTAJE: x_PUNTAJE = Null
Dim x_PAA: x_PAA = Null
Dim x_ANOEEM: x_ANOEEM = Null
Dim x_NOTAEM: x_NOTAEM = Null
Dim x_NomColegio: x_NomColegio = Null
Dim x_CiudColegio: x_CiudColegio = Null
Dim x_ComunaCol: x_ComunaCol = Null
Dim x_RegimenCol: x_RegimenCol = Null
Dim x_ModaCol: x_ModaCol = Null

' Detail variables
Dim o_AF1oMat, t_AF1oMat, ft_AF1oMat
o_AF1oMat = Null: t_AF1oMat = Null: ft_AF1oMat = 131
Dim rf_AF1oMat, rt_AF1oMat
Dim o_PERIODO_MAT, t_PERIODO_MAT, ft_PERIODO_MAT
o_PERIODO_MAT = Null: t_PERIODO_MAT = Null: ft_PERIODO_MAT = 131
Dim rf_PERIODO_MAT, rt_PERIODO_MAT
Dim o_AF1oIng, t_AF1oIng, ft_AF1oIng
o_AF1oIng = Null: t_AF1oIng = Null: ft_AF1oIng = 131
Dim rf_AF1oIng, rt_AF1oIng
Dim o_MATRICULADO, t_MATRICULADO, ft_MATRICULADO
o_MATRICULADO = Null: t_MATRICULADO = Null: ft_MATRICULADO = 200
Dim rf_MATRICULADO, rt_MATRICULADO
Dim o_ESTACAD, t_ESTACAD, ft_ESTACAD
o_ESTACAD = Null: t_ESTACAD = Null: ft_ESTACAD = 200
Dim rf_ESTACAD, rt_ESTACAD
Dim o_DESCRIPCION, t_DESCRIPCION, ft_DESCRIPCION
o_DESCRIPCION = Null: t_DESCRIPCION = Null: ft_DESCRIPCION = 200
Dim rf_DESCRIPCION, rt_DESCRIPCION
Dim o_NOMBRE_C, t_NOMBRE_C, ft_NOMBRE_C
o_NOMBRE_C = Null: t_NOMBRE_C = Null: ft_NOMBRE_C = 200
Dim rf_NOMBRE_C, rt_NOMBRE_C
Dim o_JORNADA, t_JORNADA, ft_JORNADA
o_JORNADA = Null: t_JORNADA = Null: ft_JORNADA = 200
Dim rf_JORNADA, rt_JORNADA
Dim o_NACIONALIDAD, t_NACIONALIDAD, ft_NACIONALIDAD
o_NACIONALIDAD = Null: t_NACIONALIDAD = Null: ft_NACIONALIDAD = 200
Dim rf_NACIONALIDAD, rt_NACIONALIDAD
Dim o_CODCLI, t_CODCLI, ft_CODCLI
o_CODCLI = Null: t_CODCLI = Null: ft_CODCLI = 200
Dim rf_CODCLI, rt_CODCLI
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
Dim o_CODCARR, t_CODCARR, ft_CODCARR
o_CODCARR = Null: t_CODCARR = Null: ft_CODCARR = 200
Dim rf_CODCARR, rt_CODCARR
Dim o_COMUNA, t_COMUNA, ft_COMUNA
o_COMUNA = Null: t_COMUNA = Null: ft_COMUNA = 200
Dim rf_COMUNA, rt_COMUNA
Dim o_CIUDADACT, t_CIUDADACT, ft_CIUDADACT
o_CIUDADACT = Null: t_CIUDADACT = Null: ft_CIUDADACT = 200
Dim rf_CIUDADACT, rt_CIUDADACT
Dim o_SEXO, t_SEXO, ft_SEXO
o_SEXO = Null: t_SEXO = Null: ft_SEXO = 200
Dim rf_SEXO, rt_SEXO
Dim o_FECNAC, t_FECNAC, ft_FECNAC
o_FECNAC = Null: t_FECNAC = Null: ft_FECNAC = 135
Dim rf_FECNAC, rt_FECNAC
Dim o_PUNTAJE, t_PUNTAJE, ft_PUNTAJE
o_PUNTAJE = Null: t_PUNTAJE = Null: ft_PUNTAJE = 131
Dim rf_PUNTAJE, rt_PUNTAJE
Dim o_PAA, t_PAA, ft_PAA
o_PAA = Null: t_PAA = Null: ft_PAA = 131
Dim rf_PAA, rt_PAA
Dim o_ANOEEM, t_ANOEEM, ft_ANOEEM
o_ANOEEM = Null: t_ANOEEM = Null: ft_ANOEEM = 200
Dim rf_ANOEEM, rt_ANOEEM
Dim o_NOTAEM, t_NOTAEM, ft_NOTAEM
o_NOTAEM = Null: t_NOTAEM = Null: ft_NOTAEM = 200
Dim rf_NOTAEM, rt_NOTAEM
Dim o_NomColegio, t_NomColegio, ft_NomColegio
o_NomColegio = Null: t_NomColegio = Null: ft_NomColegio = 200
Dim rf_NomColegio, rt_NomColegio
Dim o_CiudColegio, t_CiudColegio, ft_CiudColegio
o_CiudColegio = Null: t_CiudColegio = Null: ft_CiudColegio = 200
Dim rf_CiudColegio, rt_CiudColegio
Dim o_ComunaCol, t_ComunaCol, ft_ComunaCol
o_ComunaCol = Null: t_ComunaCol = Null: ft_ComunaCol = 200
Dim rf_ComunaCol, rt_ComunaCol
Dim o_RegimenCol, t_RegimenCol, ft_RegimenCol
o_RegimenCol = Null: t_RegimenCol = Null: ft_RegimenCol = 200
Dim rf_RegimenCol, rt_RegimenCol
Dim o_ModaCol, t_ModaCol, ft_ModaCol
o_ModaCol = Null: t_ModaCol = Null: ft_ModaCol = 200
Dim rf_ModaCol, rt_ModaCol
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

Dim col(28), val(28), cnt(0,28)
Dim smry(0,28), mn(0,28), mx(0,28)
Dim grandsmry(28), grandmn(28), grandmx(28)

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
var elm = form_obj.sv1_AF1oMat;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - AÑO MAT"))
		return false;
}
var elm = form_obj.sv1_PERIODO_MAT;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - PERIODO MAT"))
		return false;
}
var elm = form_obj.sv1_fecmat;
if (elm && !ewrpt_CheckDate(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect date, format = yyyy/mm/dd - FECHA DE MATRICULA"))
		return false;
}
var elm = form_obj.sv2_fecmat;
if (elm && !ewrpt_CheckDate(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect date, format = yyyy/mm/dd - FECHA DE MATRICULA"))
		return false;
}
var elm = form_obj.sv1_AF1oIng;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - AÑO DE INGRESO"))
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
	<h1>Detalle Informe Autoevaluaci&oacute;n</h1>
</div>
<% If sExport = "" Then %>
&nbsp;&nbsp;<a href="Detalle_Reporte_Autoevaluacionsmry.asp?export=excel"><img src="../../images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
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
&nbsp;&nbsp;<a href="Detalle_Reporte_Autoevaluacionsmry.asp?cmd=reset">Resetear Filtros</a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fDetalle_Reporte_Autoevaluacionsummaryfilter" id="fDetalle_Reporte_Autoevaluacionsummaryfilter" action="Detalle_Reporte_Autoevaluacionsmry.asp" class="ewForm" onSubmit="return ewrpt_ValidateExtFilter(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
<% If sClearExtFilter = "Detalle_Reporte_Autoevaluacion_AF1oMat" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">AÑO MATRICULA</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_AF1oMat" id="so1_AF1oMat" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_AF1oMat" id="sv1_AF1oMat" size="30" value="<%= Server.HTMLEncode(sv1_AF1oMat&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Detalle_Reporte_Autoevaluacion_PERIODO_MAT" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">PERIODO MATRICULA</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_PERIODO_MAT" id="so1_PERIODO_MAT" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_PERIODO_MAT" id="sv1_PERIODO_MAT" size="30" value="<%= Server.HTMLEncode(sv1_PERIODO_MAT&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Detalle_Reporte_Autoevaluacion_fecmat" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">FECHA DE MATRICULA</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_fecmat" id="so1_fecmat" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_fecmat" id="sv1_fecmat" value="<%= Server.HTMLEncode(sv1_fecmat&"") %>"<%= sClearInputClass %>>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw1_fecmat" name="btw1_fecmat">&nbsp;a&nbsp;</span></td>
				<td><span class="aspreportmaker" id="btw1_fecmat" name="btw1_fecmat">
<input type="text" name="sv2_fecmat" id="sv2_fecmat" value="<%= Server.HTMLEncode(sv2_fecmat&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "Detalle_Reporte_Autoevaluacion_AF1oIng" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">AÑO DE INGRESO</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_AF1oIng" id="so1_AF1oIng" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_AF1oIng" id="sv1_AF1oIng" size="30" value="<%= Server.HTMLEncode(sv1_AF1oIng&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker">MATRICULADO</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filter
If IsArray(ewrpt_CustomFilters) Then
	cntf = UBound(ewrpt_CustomFilters,2)+1
Else
	cntf = 0
End If
If IsArray(sr_MATRICULADO) Then
	cntd = UBound(sr_MATRICULADO)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If ewrpt_CustomFilters(0,i) = "MATRICULADO" Then
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_MATRICULADO" id="sv_MATRICULADO" value="<%= "@@" & ewrpt_CustomFilters(1,i) %>"<% If ewrpt_MatchedFilterValue(sv_MATRICULADO, "@@" & ewrpt_CustomFilters(1,i)) Then Response.Write " checked" %>><%= ewrpt_CustomFilters(2,i) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_MATRICULADO" id="sv_MATRICULADO" value="<%= sr_MATRICULADO(i) %>"<% If ewrpt_MatchedFilterValue(sv_MATRICULADO, sr_MATRICULADO(i)) Then Response.Write " checked" %>><%= ewrpt_DropDownDisplayValue(sr_MATRICULADO(i), "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker">ESTADO ACADEMICO</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filter
If IsArray(ewrpt_CustomFilters) Then
	cntf = UBound(ewrpt_CustomFilters,2)+1
Else
	cntf = 0
End If
If IsArray(sr_ESTACAD) Then
	cntd = UBound(sr_ESTACAD)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If ewrpt_CustomFilters(0,i) = "ESTACAD" Then
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTACAD" id="sv_ESTACAD" value="<%= "@@" & ewrpt_CustomFilters(1,i) %>"<% If ewrpt_MatchedFilterValue(sv_ESTACAD, "@@" & ewrpt_CustomFilters(1,i)) Then Response.Write " checked" %>><%= ewrpt_CustomFilters(2,i) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTACAD" id="sv_ESTACAD" value="<%= sr_ESTACAD(i) %>"<% If ewrpt_MatchedFilterValue(sv_ESTACAD, sr_ESTACAD(i)) Then Response.Write " checked" %>><%= ewrpt_DropDownDisplayValue(sr_ESTACAD(i), "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker">TIPO CARRERA</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_DESCRIPCION" id="sv_DESCRIPCION"<% If sClearExtFilter = "Detalle_Reporte_Autoevaluacion_DESCRIPCION" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
		<option value="<%= EW_REPORT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(sv_DESCRIPCION, EW_REPORT_ALL_VALUE) Then Response.Write " selected" %>></option>
<%

' Extended Filter
If IsArray(ewrpt_CustomFilters) Then
	cntf = UBound(ewrpt_CustomFilters,2)+1
Else
	cntf = 0
End If
If IsArray(sr_DESCRIPCION) Then
	cntd = UBound(sr_DESCRIPCION)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If ewrpt_CustomFilters(0,i) = "DESCRIPCION" Then
%>
		<option value="<%= "@@" & ewrpt_CustomFilters(1,i) %>"<% If ewrpt_MatchedFilterValue(sv_DESCRIPCION, "@@" & ewrpt_CustomFilters(1,i)) Then Response.Write " selected" %>><%= ewrpt_CustomFilters(2,i) %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= sr_DESCRIPCION(i) %>"<% If ewrpt_MatchedFilterValue(sv_DESCRIPCION, sr_DESCRIPCION(i)) Then Response.Write " selected" %>><%= ewrpt_DropDownDisplayValue(sr_DESCRIPCION(i), "", 0) %></option>
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
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<% If sClearExtFilter = "Detalle_Reporte_Autoevaluacion_NOMBRE_C" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
		<option value="<%= EW_REPORT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(sv_NOMBRE_C, EW_REPORT_ALL_VALUE) Then Response.Write " selected" %>></option>
<%

' Extended Filter
If IsArray(ewrpt_CustomFilters) Then
	cntf = UBound(ewrpt_CustomFilters,2)+1
Else
	cntf = 0
End If
If IsArray(sr_NOMBRE_C) Then
	cntd = UBound(sr_NOMBRE_C)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If ewrpt_CustomFilters(0,i) = "NOMBRE_C" Then
%>
		<option value="<%= "@@" & ewrpt_CustomFilters(1,i) %>"<% If ewrpt_MatchedFilterValue(sv_NOMBRE_C, "@@" & ewrpt_CustomFilters(1,i)) Then Response.Write " selected" %>><%= ewrpt_CustomFilters(2,i) %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= sr_NOMBRE_C(i) %>"<% If ewrpt_MatchedFilterValue(sv_NOMBRE_C, sr_NOMBRE_C(i)) Then Response.Write " selected" %>><%= ewrpt_DropDownDisplayValue(sr_NOMBRE_C(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker">JORNADA</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filter
If IsArray(ewrpt_CustomFilters) Then
	cntf = UBound(ewrpt_CustomFilters,2)+1
Else
	cntf = 0
End If
If IsArray(sr_JORNADA) Then
	cntd = UBound(sr_JORNADA)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If ewrpt_CustomFilters(0,i) = "JORNADA" Then
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_JORNADA" id="sv_JORNADA" value="<%= "@@" & ewrpt_CustomFilters(1,i) %>"<% If ewrpt_MatchedFilterValue(sv_JORNADA, "@@" & ewrpt_CustomFilters(1,i)) Then Response.Write " checked" %>><%= ewrpt_CustomFilters(2,i) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_JORNADA" id="sv_JORNADA" value="<%= sr_JORNADA(i) %>"<% If ewrpt_MatchedFilterValue(sv_JORNADA, sr_JORNADA(i)) Then Response.Write " checked" %>><%= ewrpt_DropDownDisplayValue(sr_JORNADA(i), "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker">NACIONALIDAD</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filter
If IsArray(ewrpt_CustomFilters) Then
	cntf = UBound(ewrpt_CustomFilters,2)+1
Else
	cntf = 0
End If
If IsArray(sr_NACIONALIDAD) Then
	cntd = UBound(sr_NACIONALIDAD)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If ewrpt_CustomFilters(0,i) = "NACIONALIDAD" Then
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_NACIONALIDAD" id="sv_NACIONALIDAD" value="<%= "@@" & ewrpt_CustomFilters(1,i) %>"<% If ewrpt_MatchedFilterValue(sv_NACIONALIDAD, "@@" & ewrpt_CustomFilters(1,i)) Then Response.Write " checked" %>><%= ewrpt_CustomFilters(2,i) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_NACIONALIDAD" id="sv_NACIONALIDAD" value="<%= sr_NACIONALIDAD(i) %>"<% If ewrpt_MatchedFilterValue(sv_NACIONALIDAD, sr_NACIONALIDAD(i)) Then Response.Write " checked" %>><%= ewrpt_DropDownDisplayValue(sr_NACIONALIDAD(i), "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</span></td>
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
		PERIODO MATRICULA
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PERIODO MATRICULA</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		AÑO DE INGRESO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>AÑO DE INGRESO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		MATRICULADO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>MATRICULADO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		ESTADO ACADEMICO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>ESTADO ACADEMICO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		TIPO CARRERA
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>TIPO CARRERA</td>
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
		JORNADA
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>JORNADA</td>
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
		CODIGO CLIENTE
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CODIGO CLIENTE</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">DV</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>DV</td>
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
		CODIGO CARRERA
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CODIGO CARRERA</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		COMUNA
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>COMUNA</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		CIUDAD
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CIUDAD</td>
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
		FECHA NACIMIENTO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>FECHA NACIMIENTO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		PUNTAJE
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PUNTAJE</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		PAA
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PAA</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		A&Ntilde;O EM
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>A&Ntilde;O EM</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOTA EM
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOTA EM</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		NOMBRE COLEGIO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>NOMBRE COLEGIO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		CIUDAD COLEGIO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CIUDAD COLEGIO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		COMUNA COLEGIO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>COMUNA COLEGIOl</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		REGIMEN COLEGIO</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>REGIMEN COLEGIO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		MODALIDAD COLEGIO</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>MODALIDAD COLEGIO</td>
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
<%= ewrpt_ViewValue(x_AF1oMat) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PERIODO_MAT) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_AF1oIng) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_MATRICULADO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ESTACAD) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_DESCRIPCION) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NOMBRE_C) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_JORNADA) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NACIONALIDAD) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CODCLI) %>
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
<%= ewrpt_ViewValue(x_CODCARR) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_COMUNA) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CIUDADACT) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_SEXO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(ewrpt_FormatDateTime(x_FECNAC,5)) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PUNTAJE) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PAA) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ANOEEM) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NOTAEM) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_NomColegio) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CiudColegio) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ComunaCol) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_RegimenCol) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ModaCol) %>
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
	<!-- tr><td colspan="28"><span class="aspreportmaker">&nbsp;<br></span></td></tr -->
	<tr class="ewRptGrandSummary">
	  <td colspan="28">Total General (<%= FormatNumber(rstotcnt,0) %> Registros)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If sExport = "" Then %>
<div class="ewGridLowerPanel">
<form action="Detalle_Reporte_Autoevaluacionsmry.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td nowrap>
<% If Not IsObject(Pager) Then Set Pager = ew_NewPrevNextPager(nStartGrp, nDisplayGrps, nTotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr>
	  <td><span class="aspreportmaker">P&aacute;gina&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="Detalle_Reporte_Autoevaluacionsmry.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="First" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="First" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="Detalle_Reporte_Autoevaluacionsmry.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="Previous" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="Previous" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="Detalle_Reporte_Autoevaluacionsmry.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="Next" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="Next" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="Detalle_Reporte_Autoevaluacionsmry.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="Last" width="16" height="16" border="0"></a></td>	
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
<option value="100"<% If nDisplayGrps = 100 Then Response.Write " selected" %>>100</option>
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
		x_AF1oMat = ewrpt_GetValue(rs("AñoMat"))
		If Not IsNull(x_AF1oMat) Then x_AF1oMat = CDbl(x_AF1oMat)
		x_PERIODO_MAT = ewrpt_GetValue(rs("PERIODO_MAT"))
		If Not IsNull(x_PERIODO_MAT) Then x_PERIODO_MAT = CDbl(x_PERIODO_MAT)
		x_TIPOCARR = ewrpt_GetValue(rs("TIPOCARR"))
		If Not IsNull(x_TIPOCARR) Then x_TIPOCARR = CDbl(x_TIPOCARR)
		x_fecmat = ewrpt_GetValue(rs("fecmat"))
		x_AF1oIng = ewrpt_GetValue(rs("AñoIng"))
		If Not IsNull(x_AF1oIng) Then x_AF1oIng = CDbl(x_AF1oIng)
		x_MATRICULADO = ewrpt_GetValue(rs("MATRICULADO"))
		x_ESTACAD = ewrpt_GetValue(rs("ESTACAD"))
		x_DESCRIPCION = ewrpt_GetValue(rs("DESCRIPCION"))
		x_NOMBRE_C = ewrpt_GetValue(rs("NOMBRE_C"))
		x_JORNADA = ewrpt_GetValue(rs("JORNADA"))
		x_NACIONALIDAD = ewrpt_GetValue(rs("NACIONALIDAD"))
		x_CODCLI = ewrpt_GetValue(rs("CODCLI"))
		x_DIG = ewrpt_GetValue(rs("DIG"))
		x_PATERNO = ewrpt_GetValue(rs("PATERNO"))
		x_MATERNO = ewrpt_GetValue(rs("MATERNO"))
		x_NOMBRE = ewrpt_GetValue(rs("NOMBRE"))
		x_CODCARR = ewrpt_GetValue(rs("CODCARR"))
		x_COMUNA = ewrpt_GetValue(rs("COMUNA"))
		x_CIUDADACT = ewrpt_GetValue(rs("CIUDADACT"))
		x_SEXO = ewrpt_GetValue(rs("SEXO"))
		x_FECNAC = ewrpt_GetValue(rs("FECNAC"))
		x_PUNTAJE = ewrpt_GetValue(rs("PUNTAJE"))
		If Not IsNull(x_PUNTAJE) Then x_PUNTAJE = CDbl(x_PUNTAJE)
		x_PAA = ewrpt_GetValue(rs("PAA"))
		If Not IsNull(x_PAA) Then x_PAA = CDbl(x_PAA)
		x_ANOEEM = ewrpt_GetValue(rs("ANOEEM"))
		x_NOTAEM = ewrpt_GetValue(rs("NOTAEM"))
		x_NomColegio = ewrpt_GetValue(rs("NomColegio"))
		x_CiudColegio = ewrpt_GetValue(rs("CiudColegio"))
		x_ComunaCol = ewrpt_GetValue(rs("ComunaCol"))
		x_RegimenCol = ewrpt_GetValue(rs("RegimenCol"))
		x_ModaCol = ewrpt_GetValue(rs("ModaCol"))
		val(1) = x_AF1oMat
		val(2) = x_PERIODO_MAT
		val(3) = x_AF1oIng
		val(4) = x_MATRICULADO
		val(5) = x_ESTACAD
		val(6) = x_DESCRIPCION
		val(7) = x_NOMBRE_C
		val(8) = x_JORNADA
		val(9) = x_NACIONALIDAD
		val(10) = x_CODCLI
		val(11) = x_DIG
		val(12) = x_PATERNO
		val(13) = x_MATERNO
		val(14) = x_NOMBRE
		val(15) = x_CODCARR
		val(16) = x_COMUNA
		val(17) = x_CIUDADACT
		val(18) = x_SEXO
		val(19) = x_FECNAC
		val(20) = x_PUNTAJE
		val(21) = x_PAA
		val(22) = x_ANOEEM
		val(23) = x_NOTAEM
		val(24) = x_NomColegio
		val(25) = x_CiudColegio
		val(26) = x_ComunaCol
		val(27) = x_RegimenCol
		val(28) = x_ModaCol
	Else
		x_AF1oMat = ""
		x_PERIODO_MAT = ""
		x_TIPOCARR = ""
		x_fecmat = ""
		x_AF1oIng = ""
		x_MATRICULADO = ""
		x_ESTACAD = ""
		x_DESCRIPCION = ""
		x_NOMBRE_C = ""
		x_JORNADA = ""
		x_NACIONALIDAD = ""
		x_CODCLI = ""
		x_DIG = ""
		x_PATERNO = ""
		x_MATERNO = ""
		x_NOMBRE = ""
		x_CODCARR = ""
		x_COMUNA = ""
		x_CIUDADACT = ""
		x_SEXO = ""
		x_FECNAC = ""
		x_PUNTAJE = ""
		x_PAA = ""
		x_ANOEEM = ""
		x_NOTAEM = ""
		x_NomColegio = ""
		x_CiudColegio = ""
		x_ComunaCol = ""
		x_RegimenCol = ""
		x_ModaCol = ""
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
				nDisplayGrps = 100 ' Non-numeric, Load Default
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
			nDisplayGrps = 100 ' Load Default
		End If
	End If
End Sub
%>
<%

' Get extended filter values
Sub GetExtendedFilterValues()
	Dim sSelectFld, sSelect, sWhere, sOrderBy
	Dim wrkSql, wrkRs

	' Field MATRICULADO
	sSelect = "SELECT DISTINCT [MATRICULADO] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[MATRICULADO] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_MATRICULADO = ewrpt_GetDistinctValues("", wrkSql)

	' Field ESTACAD
	sSelect = "SELECT DISTINCT [ESTACAD] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[ESTACAD] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_ESTACAD = ewrpt_GetDistinctValues("", wrkSql)

	' Field DESCRIPCION
	sSelect = "SELECT DISTINCT [DESCRIPCION] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[DESCRIPCION] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_DESCRIPCION = ewrpt_GetDistinctValues("", wrkSql)

	' Field NOMBRE_C
	sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[NOMBRE_C] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_NOMBRE_C = ewrpt_GetDistinctValues("", wrkSql)

	' Field JORNADA
	sSelect = "SELECT DISTINCT [JORNADA] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[JORNADA] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_JORNADA = ewrpt_GetDistinctValues("", wrkSql)

	' Field NACIONALIDAD
	sSelect = "SELECT DISTINCT [NACIONALIDAD] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[NACIONALIDAD] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_NACIONALIDAD = ewrpt_GetDistinctValues("", wrkSql)
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
		' Field AñoMat

		Call SetSessionFilterValues(sv1_AF1oMat, so1_AF1oMat, sc_AF1oMat, sv2_AF1oMat, so2_AF1oMat, "Detalle_Reporte_Autoevaluacion_AF1oMat")

		' Field PERIODO_MAT
		Call SetSessionFilterValues(sv1_PERIODO_MAT, so1_PERIODO_MAT, sc_PERIODO_MAT, sv2_PERIODO_MAT, so2_PERIODO_MAT, "Detalle_Reporte_Autoevaluacion_PERIODO_MAT")

		' Field fecmat
		Call SetSessionFilterValues(sv1_fecmat, so1_fecmat, sc_fecmat, sv2_fecmat, so2_fecmat, "Detalle_Reporte_Autoevaluacion_fecmat")

		' Field AñoIng
		Call SetSessionFilterValues(sv1_AF1oIng, so1_AF1oIng, sc_AF1oIng, sv2_AF1oIng, so2_AF1oIng, "Detalle_Reporte_Autoevaluacion_AF1oIng")

		' Field MATRICULADO
		Call SetSessionDropDownValue(sv_MATRICULADO, "Detalle_Reporte_Autoevaluacion_MATRICULADO")

		' Field ESTACAD
		Call SetSessionDropDownValue(sv_ESTACAD, "Detalle_Reporte_Autoevaluacion_ESTACAD")

		' Field DESCRIPCION
		Call SetSessionDropDownValue(sv_DESCRIPCION, "Detalle_Reporte_Autoevaluacion_DESCRIPCION")

		' Field NOMBRE_C
		Call SetSessionDropDownValue(sv_NOMBRE_C, "Detalle_Reporte_Autoevaluacion_NOMBRE_C")

		' Field JORNADA
		Call SetSessionDropDownValue(sv_JORNADA, "Detalle_Reporte_Autoevaluacion_JORNADA")

		' Field NACIONALIDAD
		Call SetSessionDropDownValue(sv_NACIONALIDAD, "Detalle_Reporte_Autoevaluacion_NACIONALIDAD")
		bSetupFilter = True ' Set up filter required
	Else

		' Field AñoMat
		If GetFilterValues(sv1_AF1oMat, so1_AF1oMat, sc_AF1oMat, sv2_AF1oMat, so2_AF1oMat, "AF1oMat") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field PERIODO_MAT
		If GetFilterValues(sv1_PERIODO_MAT, so1_PERIODO_MAT, sc_PERIODO_MAT, sv2_PERIODO_MAT, so2_PERIODO_MAT, "PERIODO_MAT") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field fecmat
		If GetFilterValues(sv1_fecmat, so1_fecmat, sc_fecmat, sv2_fecmat, so2_fecmat, "fecmat") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field AñoIng
		If GetFilterValues(sv1_AF1oIng, so1_AF1oIng, sc_AF1oIng, sv2_AF1oIng, so2_AF1oIng, "AF1oIng") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If

		' Field MATRICULADO
		If GetDropDownValue(sv_MATRICULADO, "MATRICULADO") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_MATRICULADO) Then
			If sv_MATRICULADO <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_Detalle_Reporte_Autoevaluacion_MATRICULADO")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field ESTACAD
		If GetDropDownValue(sv_ESTACAD, "ESTACAD") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_ESTACAD) Then
			If sv_ESTACAD <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_Detalle_Reporte_Autoevaluacion_ESTACAD")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field DESCRIPCION
		If GetDropDownValue(sv_DESCRIPCION, "DESCRIPCION") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_DESCRIPCION) Then
			If sv_DESCRIPCION <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_Detalle_Reporte_Autoevaluacion_DESCRIPCION")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field NOMBRE_C
		If GetDropDownValue(sv_NOMBRE_C, "NOMBRE_C") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_NOMBRE_C) Then
			If sv_NOMBRE_C <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_Detalle_Reporte_Autoevaluacion_NOMBRE_C")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field JORNADA
		If GetDropDownValue(sv_JORNADA, "JORNADA") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_JORNADA) Then
			If sv_JORNADA <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_Detalle_Reporte_Autoevaluacion_JORNADA")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field NACIONALIDAD
		If GetDropDownValue(sv_NACIONALIDAD, "NACIONALIDAD") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_NACIONALIDAD) Then
			If sv_NACIONALIDAD <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_Detalle_Reporte_Autoevaluacion_NACIONALIDAD")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If
	End If

	' Restore session
	If bRestoreSession Then

		' Field AñoMat
		Call GetSessionFilterValues(sv1_AF1oMat, so1_AF1oMat, sc_AF1oMat, sv2_AF1oMat, so2_AF1oMat, "Detalle_Reporte_Autoevaluacion_AF1oMat")

		' Field PERIODO_MAT
		Call GetSessionFilterValues(sv1_PERIODO_MAT, so1_PERIODO_MAT, sc_PERIODO_MAT, sv2_PERIODO_MAT, so2_PERIODO_MAT, "Detalle_Reporte_Autoevaluacion_PERIODO_MAT")

		' Field fecmat
		Call GetSessionFilterValues(sv1_fecmat, so1_fecmat, sc_fecmat, sv2_fecmat, so2_fecmat, "Detalle_Reporte_Autoevaluacion_fecmat")

		' Field AñoIng
		Call GetSessionFilterValues(sv1_AF1oIng, so1_AF1oIng, sc_AF1oIng, sv2_AF1oIng, so2_AF1oIng, "Detalle_Reporte_Autoevaluacion_AF1oIng")

		' Field MATRICULADO
		Call GetSessionDropDownValue(sv_MATRICULADO, "Detalle_Reporte_Autoevaluacion_MATRICULADO")

		' Field ESTACAD
		Call GetSessionDropDownValue(sv_ESTACAD, "Detalle_Reporte_Autoevaluacion_ESTACAD")

		' Field DESCRIPCION
		Call GetSessionDropDownValue(sv_DESCRIPCION, "Detalle_Reporte_Autoevaluacion_DESCRIPCION")

		' Field NOMBRE_C
		Call GetSessionDropDownValue(sv_NOMBRE_C, "Detalle_Reporte_Autoevaluacion_NOMBRE_C")

		' Field JORNADA
		Call GetSessionDropDownValue(sv_JORNADA, "Detalle_Reporte_Autoevaluacion_JORNADA")

		' Field NACIONALIDAD
		Call GetSessionDropDownValue(sv_NACIONALIDAD, "Detalle_Reporte_Autoevaluacion_NACIONALIDAD")
	End If

	' Build sql
	' Field AñoMat

	Call BuildExtendedFilter(sFilter, "AñoMat", "[AñoMat]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_AF1oMat, so1_AF1oMat, sc_AF1oMat, sv2_AF1oMat, so2_AF1oMat)

	' Field PERIODO_MAT
	Call BuildExtendedFilter(sFilter, "PERIODO_MAT", "[PERIODO_MAT]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_PERIODO_MAT, so1_PERIODO_MAT, sc_PERIODO_MAT, sv2_PERIODO_MAT, so2_PERIODO_MAT)

	' Field fecmat
	Call BuildExtendedFilter(sFilter, "fecmat", "[fecmat]", EW_REPORT_DATATYPE_DATE, 5, sv1_fecmat, so1_fecmat, sc_fecmat, sv2_fecmat, so2_fecmat)

	' Field AñoIng
	Call BuildExtendedFilter(sFilter, "AñoIng", "[AñoIng]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_AF1oIng, so1_AF1oIng, sc_AF1oIng, sv2_AF1oIng, so2_AF1oIng)

	' Field MATRICULADO
	Call BuildDropDownFilter(sFilter, "MATRICULADO", "[MATRICULADO]", EW_REPORT_DATATYPE_STRING, 0, sv_MATRICULADO, "")

	' Field ESTACAD
	Call BuildDropDownFilter(sFilter, "ESTACAD", "[ESTACAD]", EW_REPORT_DATATYPE_STRING, 0, sv_ESTACAD, "")

	' Field DESCRIPCION
	Call BuildDropDownFilter(sFilter, "DESCRIPCION", "[DESCRIPCION]", EW_REPORT_DATATYPE_STRING, 0, sv_DESCRIPCION, "")

	' Field NOMBRE_C
	Call BuildDropDownFilter(sFilter, "NOMBRE_C", "[NOMBRE_C]", EW_REPORT_DATATYPE_STRING, 0, sv_NOMBRE_C, "")

	' Field JORNADA
	Call BuildDropDownFilter(sFilter, "JORNADA", "[JORNADA]", EW_REPORT_DATATYPE_STRING, 0, sv_JORNADA, "")

	' Field NACIONALIDAD
	Call BuildDropDownFilter(sFilter, "NACIONALIDAD", "[NACIONALIDAD]", EW_REPORT_DATATYPE_STRING, 0, sv_NACIONALIDAD, "")

	' Save parms to Session
	' Field AñoMat

	Call SetSessionFilterValues(sv1_AF1oMat, so1_AF1oMat, sc_AF1oMat, sv2_AF1oMat, so2_AF1oMat, "Detalle_Reporte_Autoevaluacion_AF1oMat")

	' Field PERIODO_MAT
	Call SetSessionFilterValues(sv1_PERIODO_MAT, so1_PERIODO_MAT, sc_PERIODO_MAT, sv2_PERIODO_MAT, so2_PERIODO_MAT, "Detalle_Reporte_Autoevaluacion_PERIODO_MAT")

	' Field fecmat
	Call SetSessionFilterValues(sv1_fecmat, so1_fecmat, sc_fecmat, sv2_fecmat, so2_fecmat, "Detalle_Reporte_Autoevaluacion_fecmat")

	' Field AñoIng
	Call SetSessionFilterValues(sv1_AF1oIng, so1_AF1oIng, sc_AF1oIng, sv2_AF1oIng, so2_AF1oIng, "Detalle_Reporte_Autoevaluacion_AF1oIng")

	' Field MATRICULADO
	Call SetSessionDropDownValue(sv_MATRICULADO, "Detalle_Reporte_Autoevaluacion_MATRICULADO")

	' Field ESTACAD
	Call SetSessionDropDownValue(sv_ESTACAD, "Detalle_Reporte_Autoevaluacion_ESTACAD")

	' Field DESCRIPCION
	Call SetSessionDropDownValue(sv_DESCRIPCION, "Detalle_Reporte_Autoevaluacion_DESCRIPCION")

	' Field NOMBRE_C
	Call SetSessionDropDownValue(sv_NOMBRE_C, "Detalle_Reporte_Autoevaluacion_NOMBRE_C")

	' Field JORNADA
	Call SetSessionDropDownValue(sv_JORNADA, "Detalle_Reporte_Autoevaluacion_JORNADA")

	' Field NACIONALIDAD
	Call SetSessionDropDownValue(sv_NACIONALIDAD, "Detalle_Reporte_Autoevaluacion_NACIONALIDAD")

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
	' MATRICULADO
	'Call RegisterCustomFilter("MATRICULADO", "StartsWithA", "Starts With A", "[MATRICULADO]", "GetStartsWithAFilter")
	' ESTACAD
	'Call RegisterCustomFilter("ESTACAD", "StartsWithA", "Starts With A", "[ESTACAD]", "GetStartsWithAFilter")
	' DESCRIPCION
	'Call RegisterCustomFilter("DESCRIPCION", "StartsWithA", "Starts With A", "[DESCRIPCION]", "GetStartsWithAFilter")
	' NOMBRE_C
	'Call RegisterCustomFilter("NOMBRE_C", "StartsWithA", "Starts With A", "[NOMBRE_C]", "GetStartsWithAFilter")
	' JORNADA
	'Call RegisterCustomFilter("JORNADA", "StartsWithA", "Starts With A", "[JORNADA]", "GetStartsWithAFilter")
	' NACIONALIDAD
	'Call RegisterCustomFilter("NACIONALIDAD", "StartsWithA", "Starts With A", "[NACIONALIDAD]", "GetStartsWithAFilter")

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
	' Field MATRICULADO

	svd_MATRICULADO = EW_REPORT_INIT_VALUE
	sv_MATRICULADO = svd_MATRICULADO

	' Field ESTACAD
	svd_ESTACAD = EW_REPORT_INIT_VALUE
	sv_ESTACAD = svd_ESTACAD

	' Field DESCRIPCION
	svd_DESCRIPCION = EW_REPORT_INIT_VALUE
	sv_DESCRIPCION = svd_DESCRIPCION

	' Field NOMBRE_C
	svd_NOMBRE_C = EW_REPORT_INIT_VALUE
	sv_NOMBRE_C = svd_NOMBRE_C

	' Field JORNADA
	svd_JORNADA = EW_REPORT_INIT_VALUE
	sv_JORNADA = svd_JORNADA

	' Field NACIONALIDAD
	svd_NACIONALIDAD = EW_REPORT_INIT_VALUE
	sv_NACIONALIDAD = svd_NACIONALIDAD

	' --------------------------------------------------
	'  Set up default values for extended filters
	'
	' Field AñoMat
	' sv1d_AF1oMat = Date ' Default value is today
	' so1d_AF1oMat = "<=" ' Default operator is "<="

	sv1d_AF1oMat = Null ' Default ext filter value 1
	sv2d_AF1oMat = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_AF1oMat = "=" ' Default search operator 1
	so2d_AF1oMat = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_AF1oMat = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_AF1oMat = sv1d_AF1oMat
	sv2_AF1oMat = sv2d_AF1oMat
	so1_AF1oMat = so1d_AF1oMat
	so2_AF1oMat = so2d_AF1oMat
	sc_AF1oMat = scd_AF1oMat

	' Field PERIODO_MAT
	' sv1d_PERIODO_MAT = Date ' Default value is today
	' so1d_PERIODO_MAT = "<=" ' Default operator is "<="

	sv1d_PERIODO_MAT = Null ' Default ext filter value 1
	sv2d_PERIODO_MAT = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_PERIODO_MAT = "=" ' Default search operator 1
	so2d_PERIODO_MAT = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_PERIODO_MAT = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_PERIODO_MAT = sv1d_PERIODO_MAT
	sv2_PERIODO_MAT = sv2d_PERIODO_MAT
	so1_PERIODO_MAT = so1d_PERIODO_MAT
	so2_PERIODO_MAT = so2d_PERIODO_MAT
	sc_PERIODO_MAT = scd_PERIODO_MAT

	' Field fecmat
	' sv1d_fecmat = Date ' Default value is today
	' so1d_fecmat = "<=" ' Default operator is "<="

	sv1d_fecmat = Null ' Default ext filter value 1
	sv2d_fecmat = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_fecmat = "BETWEEN" ' Default search operator 1
	so2d_fecmat = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_fecmat = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_fecmat = sv1d_fecmat
	sv2_fecmat = sv2d_fecmat
	so1_fecmat = so1d_fecmat
	so2_fecmat = so2d_fecmat
	sc_fecmat = scd_fecmat

	' Field AñoIng
	' sv1d_AF1oIng = Date ' Default value is today
	' so1d_AF1oIng = "<=" ' Default operator is "<="

	sv1d_AF1oIng = Null ' Default ext filter value 1
	sv2d_AF1oIng = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_AF1oIng = "=" ' Default search operator 1
	so2d_AF1oIng = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_AF1oIng = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_AF1oIng = sv1d_AF1oIng
	sv2_AF1oIng = sv2d_AF1oIng
	so1_AF1oIng = so1d_AF1oIng
	so2_AF1oIng = so2d_AF1oIng
	sc_AF1oIng = scd_AF1oIng

	' --------------------------------------------------
	'  Set up default values for popup filters
	'  - NOTE: if extended filter is enabled, use default values in extended filter instead

End Sub

' Check if filter applied
Function CheckFilter()

	' Check AñoMat Text filter
	If TextFilterApplied(sv1_AF1oMat, sv2_AF1oMat, so1_AF1oMat, so2_AF1oMat, sc_AF1oMat, _
		sv1d_AF1oMat, sv2d_AF1oMat, so1d_AF1oMat, so2d_AF1oMat, scd_AF1oMat) Then
		CheckFilter = True
		Exit Function
	End If

	' Check PERIODO_MAT Text filter
	If TextFilterApplied(sv1_PERIODO_MAT, sv2_PERIODO_MAT, so1_PERIODO_MAT, so2_PERIODO_MAT, sc_PERIODO_MAT, _
		sv1d_PERIODO_MAT, sv2d_PERIODO_MAT, so1d_PERIODO_MAT, so2d_PERIODO_MAT, scd_PERIODO_MAT) Then
		CheckFilter = True
		Exit Function
	End If

	' Check fecmat Text filter
	If TextFilterApplied(sv1_fecmat, sv2_fecmat, so1_fecmat, so2_fecmat, sc_fecmat, _
		sv1d_fecmat, sv2d_fecmat, so1d_fecmat, so2d_fecmat, scd_fecmat) Then
		CheckFilter = True
		Exit Function
	End If

	' Check AñoIng Text filter
	If TextFilterApplied(sv1_AF1oIng, sv2_AF1oIng, so1_AF1oIng, so2_AF1oIng, sc_AF1oIng, _
		sv1d_AF1oIng, sv2d_AF1oIng, so1d_AF1oIng, so2d_AF1oIng, scd_AF1oIng) Then
		CheckFilter = True
		Exit Function
	End If

	' Check MATRICULADO non-Text filter
	If NonTextFilterApplied(sv_MATRICULADO, svd_MATRICULADO) Then
		CheckFilter = True
		Exit Function
	End If

	' Check ESTACAD non-Text filter
	If NonTextFilterApplied(sv_ESTACAD, svd_ESTACAD) Then
		CheckFilter = True
		Exit Function
	End If

	' Check DESCRIPCION non-Text filter
	If NonTextFilterApplied(sv_DESCRIPCION, svd_DESCRIPCION) Then
		CheckFilter = True
		Exit Function
	End If

	' Check NOMBRE_C non-Text filter
	If NonTextFilterApplied(sv_NOMBRE_C, svd_NOMBRE_C) Then
		CheckFilter = True
		Exit Function
	End If

	' Check JORNADA non-Text filter
	If NonTextFilterApplied(sv_JORNADA, svd_JORNADA) Then
		CheckFilter = True
		Exit Function
	End If

	' Check NACIONALIDAD non-Text filter
	If NonTextFilterApplied(sv_NACIONALIDAD, svd_NACIONALIDAD) Then
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

	' Field AñoMat
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "AñoMat", "[AñoMat]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_AF1oMat, so1_AF1oMat, sc_AF1oMat, sv2_AF1oMat, so2_AF1oMat)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "AÑO MAT<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field PERIODO_MAT
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "PERIODO_MAT", "[PERIODO_MAT]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_PERIODO_MAT, so1_PERIODO_MAT, sc_PERIODO_MAT, sv2_PERIODO_MAT, so2_PERIODO_MAT)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "PERIODO MAT<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field fecmat
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "fecmat", "[fecmat]", EW_REPORT_DATATYPE_DATE, 5, sv1_fecmat, so1_fecmat, sc_fecmat, sv2_fecmat, so2_fecmat)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "FECHA DE MATRICULA<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field AñoIng
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "AñoIng", "[AñoIng]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_AF1oIng, so1_AF1oIng, sc_AF1oIng, sv2_AF1oIng, so2_AF1oIng)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "AÑO DE INGRESO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field MATRICULADO
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "MATRICULADO", "[MATRICULADO]", EW_REPORT_DATATYPE_STRING, 0, sv_MATRICULADO, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "MATRICULADO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field ESTACAD
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "ESTACAD", "[ESTACAD]", EW_REPORT_DATATYPE_STRING, 0, sv_ESTACAD, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "ESTADO ACADEMICO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field DESCRIPCION
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "DESCRIPCION", "[DESCRIPCION]", EW_REPORT_DATATYPE_STRING, 0, sv_DESCRIPCION, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "TIPO CARRERA<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field NOMBRE_C
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "NOMBRE_C", "[NOMBRE_C]", EW_REPORT_DATATYPE_STRING, 0, sv_NOMBRE_C, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "CARRERA<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field JORNADA
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "JORNADA", "[JORNADA]", EW_REPORT_DATATYPE_STRING, 0, sv_JORNADA, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "JORNADA<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field NACIONALIDAD
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "NACIONALIDAD", "[NACIONALIDAD]", EW_REPORT_DATATYPE_STRING, 0, sv_NACIONALIDAD, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "NACIONALIDAD<br>"
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
			Session("sort_Detalle_Reporte_Autoevaluacion_AF1oMat") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_PERIODO_MAT") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_AF1oIng") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_MATRICULADO") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_ESTACAD") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_DESCRIPCION") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_NOMBRE_C") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_JORNADA") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_NACIONALIDAD") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_CODCLI") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_DIG") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_PATERNO") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_MATERNO") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_NOMBRE") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_CODCARR") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_COMUNA") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_CIUDADACT") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_SEXO") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_FECNAC") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_PUNTAJE") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_PAA") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_ANOEEM") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_NOTAEM") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_NomColegio") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_CiudColegio") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_ComunaCol") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_RegimenCol") = ""
			Session("sort_Detalle_Reporte_Autoevaluacion_ModaCol") = ""
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
