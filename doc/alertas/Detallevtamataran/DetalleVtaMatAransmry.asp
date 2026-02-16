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

' ASP Report Maker 3.0+ - Table level configuration (DetalleVtaMatAran)
' Table Level Constants

Const EW_REPORT_TABLE_VAR = "DetalleVtaMatAran"
Const EW_REPORT_TABLE_SESSION_GROUP_PER_PAGE = "DetalleVtaMatAran_grpperpage"
Const EW_REPORT_TABLE_SESSION_START_GROUP = "DetalleVtaMatAran_start"
Const EW_REPORT_TABLE_SESSION_SEARCH = "DetalleVtaMatAran_search"
Const EW_REPORT_TABLE_SESSION_CHILD_USER_ID = "DetalleVtaMatAran_childuserid"
Const EW_REPORT_TABLE_SESSION_ORDER_BY = "DetalleVtaMatAran_orderby"

' Table Level SQL
Const EW_REPORT_TABLE_SQL_FROM = "[Vista_VentaMatyArancel]"
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
EW_REPORT_TABLE_SQL_SELECT_AGG = "SELECT SUM([MONTO]) AS SUM_MONTO FROM " & EW_REPORT_TABLE_SQL_FROM
Const EW_REPORT_TABLE_SQL_AGG_PFX = ""
Const EW_REPORT_TABLE_SQL_AGG_SFX = ""
Dim EW_REPORT_TABLE_SQL_SELECT_COUNT
EW_REPORT_TABLE_SQL_SELECT_COUNT = "SELECT COUNT(*) FROM " & EW_REPORT_TABLE_SQL_FROM
Dim af_FACULTAD ' Advanced filter for FACULTAD
Dim af_CARRERA ' Advanced filter for CARRERA
Dim af_ANO ' Advanced filter for ANO
Dim af_PERIODO ' Advanced filter for PERIODO
Dim af_DESCRIPCION ' Advanced filter for DESCRIPCION
Dim af_PAGO ' Advanced filter for PAGO
Dim af_CODCLI ' Advanced filter for CODCLI
Dim af_PATERNO ' Advanced filter for PATERNO
Dim af_MATERNO ' Advanced filter for MATERNO
Dim af_NOMBRE ' Advanced filter for NOMBRE
Dim af_TOTAL ' Advanced filter for TOTAL
Dim af_MONTO ' Advanced filter for MONTO
Dim af_FECREG ' Advanced filter for FECREG
Dim af_CTAPAG ' Advanced filter for CTAPAG
Dim af_CTAPAGNUM ' Advanced filter for CTAPAGNUM
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

' Field DESCRIPCION
Dim sv_DESCRIPCION, svd_DESCRIPCION
Dim sr_DESCRIPCION

' Field PAGO
Dim sv_PAGO, svd_PAGO
Dim sr_PAGO

' Text Extended filters
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

' Field CODCLI
Dim sv1_CODCLI, sv1d_CODCLI
Dim sv2_CODCLI, sv2d_CODCLI
Dim so1_CODCLI, so1d_CODCLI
Dim so2_CODCLI, so2d_CODCLI
Dim sc_CODCLI, scd_CODCLI

' Custom filters
Dim ewrpt_CustomFilters
%>
<%
%>
<%

' Field variables
Dim x_FACULTAD: x_FACULTAD = Null
Dim x_CARRERA: x_CARRERA = Null
Dim x_ANO: x_ANO = Null
Dim x_PERIODO: x_PERIODO = Null
Dim x_DESCRIPCION: x_DESCRIPCION = Null
Dim x_PAGO: x_PAGO = Null
Dim x_CODCLI: x_CODCLI = Null
Dim x_PATERNO: x_PATERNO = Null
Dim x_MATERNO: x_MATERNO = Null
Dim x_NOMBRE: x_NOMBRE = Null
Dim x_TOTAL: x_TOTAL = Null
Dim x_MONTO: x_MONTO = Null
Dim x_FECREG: x_FECREG = Null
Dim x_CTAPAG: x_CTAPAG = Null
Dim x_CTAPAGNUM: x_CTAPAGNUM = Null

' Detail variables
Dim o_FACULTAD, t_FACULTAD, ft_FACULTAD
o_FACULTAD = Null: t_FACULTAD = Null: ft_FACULTAD = 200
Dim rf_FACULTAD, rt_FACULTAD
Dim o_CARRERA, t_CARRERA, ft_CARRERA
o_CARRERA = Null: t_CARRERA = Null: ft_CARRERA = 200
Dim rf_CARRERA, rt_CARRERA
Dim o_ANO, t_ANO, ft_ANO
o_ANO = Null: t_ANO = Null: ft_ANO = 131
Dim rf_ANO, rt_ANO
Dim o_PERIODO, t_PERIODO, ft_PERIODO
o_PERIODO = Null: t_PERIODO = Null: ft_PERIODO = 131
Dim rf_PERIODO, rt_PERIODO
Dim o_DESCRIPCION, t_DESCRIPCION, ft_DESCRIPCION
o_DESCRIPCION = Null: t_DESCRIPCION = Null: ft_DESCRIPCION = 200
Dim rf_DESCRIPCION, rt_DESCRIPCION
Dim o_PAGO, t_PAGO, ft_PAGO
o_PAGO = Null: t_PAGO = Null: ft_PAGO = 200
Dim rf_PAGO, rt_PAGO
Dim o_CODCLI, t_CODCLI, ft_CODCLI
o_CODCLI = Null: t_CODCLI = Null: ft_CODCLI = 200
Dim rf_CODCLI, rt_CODCLI
Dim o_PATERNO, t_PATERNO, ft_PATERNO
o_PATERNO = Null: t_PATERNO = Null: ft_PATERNO = 200
Dim rf_PATERNO, rt_PATERNO
Dim o_MATERNO, t_MATERNO, ft_MATERNO
o_MATERNO = Null: t_MATERNO = Null: ft_MATERNO = 200
Dim rf_MATERNO, rt_MATERNO
Dim o_NOMBRE, t_NOMBRE, ft_NOMBRE
o_NOMBRE = Null: t_NOMBRE = Null: ft_NOMBRE = 200
Dim rf_NOMBRE, rt_NOMBRE
Dim o_TOTAL, t_TOTAL, ft_TOTAL
o_TOTAL = Null: t_TOTAL = Null: ft_TOTAL = 131
Dim rf_TOTAL, rt_TOTAL
Dim o_MONTO, t_MONTO, ft_MONTO
o_MONTO = Null: t_MONTO = Null: ft_MONTO = 131
Dim rf_MONTO, rt_MONTO
Dim o_FECREG, t_FECREG, ft_FECREG
o_FECREG = Null: t_FECREG = Null: ft_FECREG = 135
Dim rf_FECREG, rt_FECREG
Dim o_CTAPAG, t_CTAPAG, ft_CTAPAG
o_CTAPAG = Null: t_CTAPAG = Null: ft_CTAPAG = 131
Dim rf_CTAPAG, rt_CTAPAG
Dim o_CTAPAGNUM, t_CTAPAGNUM, ft_CTAPAGNUM
o_CTAPAGNUM = Null: t_CTAPAGNUM = Null: ft_CTAPAGNUM = 131
Dim rf_CTAPAGNUM, rt_CTAPAGNUM
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

Dim col(15), val(15), cnt(0,15)
Dim smry(0,15), mn(0,15), mx(0,15)
Dim grandsmry(15), grandmn(15), grandmx(15)

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
col(12) = True
col(13) = False
col(14) = False
col(15) = False

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
var elm = form_obj.sv1_ANO;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - ANO"))
		return false;
}
var elm = form_obj.sv1_PERIODO;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "Incorrect floating point number - PERIODO"))
		return false;
}
	return true;
}
//-->
</script>
<% End If %>
<% If sExport = "" Then %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" media="all" href="css/titles.css"/>
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
	<h1>Detalle de Venta Matricula y Arancel</h1>
</div>
<% If sExport = "" Then %>
&nbsp;&nbsp;<a href="DetalleVtaMatAransmry.asp?export=excel&acc=<%=Request("acc")%>"><img src="images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
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
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspreportmaker">&nbsp;Fitros</span>
<% If bFilterApplied Then %>
&nbsp;&nbsp;<a href="DetalleVtaMatAransmry.asp?cmd=reset">Resetear Filtros</a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fDetalleVtaMatAransummaryfilter" id="fDetalleVtaMatAransummaryfilter" action="DetalleVtaMatAransmry.asp" class="ewForm" onSubmit="return ewrpt_ValidateExtFilter(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr>
		<td><span class="aspreportmaker">FACULTAD</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FACULTAD" id="sv_FACULTAD"<% If sClearExtFilter = "DetalleVtaMatAran_FACULTAD" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
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
		<select name="sv_CARRERA" id="sv_CARRERA"<% If sClearExtFilter = "DetalleVtaMatAran_CARRERA" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
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
<% If sClearExtFilter = "DetalleVtaMatAran_ANO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">A&Ntilde;O</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_ANO" id="so1_ANO" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_ANO" id="sv1_ANO" size="30" value="<%= Server.HTMLEncode(sv1_ANO&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
<% If sClearExtFilter = "DetalleVtaMatAran_PERIODO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">PERIODO</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_PERIODO" id="so1_PERIODO" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_PERIODO" id="sv1_PERIODO" size="30" value="<%= Server.HTMLEncode(sv1_PERIODO&"") %>"<%= sClearInputClass %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker">PRODUCTO</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_DESCRIPCION" id="sv_DESCRIPCION"<% If sClearExtFilter = "DetalleVtaMatAran_DESCRIPCION" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
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
		<td><span class="aspreportmaker">PAGO</span></td>
		<td><span class="ewrptSearchOpr">:</span></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PAGO" id="sv_PAGO"<% If sClearExtFilter = "DetalleVtaMatAran_PAGO" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>>
		<option value="<%= EW_REPORT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(sv_PAGO, EW_REPORT_ALL_VALUE) Then Response.Write " selected" %>></option>
<%

' Extended Filter
If IsArray(ewrpt_CustomFilters) Then
	cntf = UBound(ewrpt_CustomFilters,2)+1
Else
	cntf = 0
End If
If IsArray(sr_PAGO) Then
	cntd = UBound(sr_PAGO)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If ewrpt_CustomFilters(0,i) = "PAGO" Then
%>
		<option value="<%= "@@" & ewrpt_CustomFilters(1,i) %>"<% If ewrpt_MatchedFilterValue(sv_PAGO, "@@" & ewrpt_CustomFilters(1,i)) Then Response.Write " selected" %>><%= ewrpt_CustomFilters(2,i) %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= sr_PAGO(i) %>"<% If ewrpt_MatchedFilterValue(sv_PAGO, sr_PAGO(i)) Then Response.Write " selected" %>><%= ewrpt_DropDownDisplayValue(sr_PAGO(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
<% If sClearExtFilter = "DetalleVtaMatAran_CODCLI" Then sClearInputClass = " class=""ewInputCleared""" Else sClearInputClass = "" %>
	<tr>
		<td><span class="aspreportmaker">RUT</span></td>
		<td><span class="ewrptSearchOpr">:
		    <input type="hidden" name="so1_CODCLI" id="so1_CODCLI" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_CODCLI" id="sv1_CODCLI" size="30" maxlength="30" value="<%= Server.HTMLEncode(sv1_CODCLI&"") %>"<%= sClearInputClass %>>
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
		<td valign="bottom" class="ewTableHeader">&nbsp;</td>
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
		PRODUCTO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PRODUCTO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		PAGO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>PAGO</td>
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
		APELLIDO PATERNO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>APELIDO PATERNO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		APLLIDO MATERNO
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
		TOTAL
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>TOTAL</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		MONTO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>MONTO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		FECHA REGISTRO
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>FECHA REGISTRO</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		CTA PAG
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CTA PAG</td>
			</tr></table>
		</td>
<% End If %>
<% If sExport <> "" Then %>
		<td valign="bottom" class="ewTableHeader">
		CTA PAG NUM
		</td>
<% Else %>
		<td class="ewTableHeader">
			<table cellspacing="0" class="ewTableHeaderBtn"><tr>
			<td>CTA PAG NUM</td>
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
		<td>&nbsp;</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_FACULTAD) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CARRERA) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_ANO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PERIODO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_DESCRIPCION) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_PAGO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CODCLI) %>
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
<%= ewrpt_ViewValue(x_TOTAL) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_MONTO) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(ewrpt_FormatDateTime(x_FECREG,5)) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CTAPAG) %>
</td>
		<td<%= sItemRowClass %>>
<%= ewrpt_ViewValue(x_CTAPAGNUM) %>
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

	' Get total from sql directly
	sSql = ewrpt_BuildReportSql(EW_REPORT_TABLE_SQL_SELECT_AGG, EW_REPORT_TABLE_SQL_WHERE, EW_REPORT_TABLE_SQL_GROUPBY, EW_REPORT_TABLE_SQL_HAVING, "", sFilter, "")
	sSql = EW_REPORT_TABLE_SQL_AGG_PFX & sSql & EW_REPORT_TABLE_SQL_AGG_SFX
	If EW_REPORT_DEBUG_ENABLED Then Response.Write "aggregate sql: " & sSql & "<br>"
	Set rsagg = ewrpt_LoadRs(sSql)
	If Not rsagg.Eof Then
		grandsmry(12) = ewrpt_GetValue(rsagg("SUM_MONTO"))
	Else

		' Accumulate grand summary from detail records
		sSql = ewrpt_BuildReportSql(EW_REPORT_TABLE_SQL_SELECT, EW_REPORT_TABLE_SQL_WHERE, EW_REPORT_TABLE_SQL_GROUPBY, EW_REPORT_TABLE_SQL_HAVING, EW_REPORT_TABLE_SQL_ORDERBY, sFilter, "")
		Set rs = ewrpt_LoadRs(sSql)
		If Not rs.Eof Then GetRow(1)
		Do While Not rs.Eof
			Call AccumulateGrandSummary()
			GetRow(2)
		Loop
	End If
%>
<% If nTotalGrps > 0 Then %>
	<!-- tr><td colspan="16"><span class="aspreportmaker">&nbsp;<br></span></td></tr -->
	<tr class="ewRptGrandSummary">
	  <td colspan="16">Total General (<%= FormatNumber(rstotcnt,0) %> Registros)</td></tr>
	<tr class="ewRptGrandSummary">
		<td colspan="1" class="ewRptGrpAggregate">SUMA</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>
		<% t_MONTO = x_MONTO %>
		<% x_MONTO = grandsmry(12) ' Load SUM %>
<%= ewrpt_ViewValue(x_MONTO) %>
		<% x_MONTO = t_MONTO %>
		</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If sExport = "" Then %>
<div class="ewGridLowerPanel">
<form action="DetalleVtaMatAransmry.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td nowrap>
<% If Not IsObject(Pager) Then Set Pager = ew_NewPrevNextPager(nStartGrp, nDisplayGrps, nTotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr>
<td><span class="aspreportmaker">P&aacute;gina&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="DetalleVtaMatAransmry.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="First" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="First" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="DetalleVtaMatAransmry.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="Previous" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="Previous" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="DetalleVtaMatAransmry.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="Next" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="Next" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="DetalleVtaMatAransmry.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="Last" width="16" height="16" border="0"></a></td>	
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
		x_ANO = ewrpt_GetValue(rs("ANO"))
		If Not IsNull(x_ANO) Then x_ANO = CDbl(x_ANO)
		x_PERIODO = ewrpt_GetValue(rs("PERIODO"))
		If Not IsNull(x_PERIODO) Then x_PERIODO = CDbl(x_PERIODO)
		x_DESCRIPCION = ewrpt_GetValue(rs("DESCRIPCION"))
		x_PAGO = ewrpt_GetValue(rs("PAGO"))
		x_CODCLI = ewrpt_GetValue(rs("CODCLI"))
		x_PATERNO = ewrpt_GetValue(rs("PATERNO"))
		x_MATERNO = ewrpt_GetValue(rs("MATERNO"))
		x_NOMBRE = ewrpt_GetValue(rs("NOMBRE"))
		x_TOTAL = ewrpt_GetValue(rs("TOTAL"))
		If Not IsNull(x_TOTAL) Then x_TOTAL = CDbl(x_TOTAL)
		x_MONTO = ewrpt_GetValue(rs("MONTO"))
		If Not IsNull(x_MONTO) Then x_MONTO = CDbl(x_MONTO)
		x_FECREG = ewrpt_GetValue(rs("FECREG"))
		x_CTAPAG = ewrpt_GetValue(rs("CTAPAG"))
		If Not IsNull(x_CTAPAG) Then x_CTAPAG = CDbl(x_CTAPAG)
		x_CTAPAGNUM = ewrpt_GetValue(rs("CTAPAGNUM"))
		If Not IsNull(x_CTAPAGNUM) Then x_CTAPAGNUM = CDbl(x_CTAPAGNUM)
		val(1) = x_FACULTAD
		val(2) = x_CARRERA
		val(3) = x_ANO
		val(4) = x_PERIODO
		val(5) = x_DESCRIPCION
		val(6) = x_PAGO
		val(7) = x_CODCLI
		val(8) = x_PATERNO
		val(9) = x_MATERNO
		val(10) = x_NOMBRE
		val(11) = x_TOTAL
		val(12) = x_MONTO
		val(13) = x_FECREG
		val(14) = x_CTAPAG
		val(15) = x_CTAPAGNUM
	Else
		x_FACULTAD = ""
		x_CARRERA = ""
		x_ANO = ""
		x_PERIODO = ""
		x_DESCRIPCION = ""
		x_PAGO = ""
		x_CODCLI = ""
		x_PATERNO = ""
		x_MATERNO = ""
		x_NOMBRE = ""
		x_TOTAL = ""
		x_MONTO = ""
		x_FECREG = ""
		x_CTAPAG = ""
		x_CTAPAGNUM = ""
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

	' Field DESCRIPCION
	sSelect = "SELECT DISTINCT [DESCRIPCION] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[DESCRIPCION] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_DESCRIPCION = ewrpt_GetDistinctValues("", wrkSql)

	' Field PAGO
	sSelect = "SELECT DISTINCT [PAGO] FROM " & EW_REPORT_TABLE_SQL_FROM
	sWhere = EW_REPORT_TABLE_SQL_WHERE
	sOrderBy = "[PAGO] ASC"
	wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, "", "")
	sr_PAGO = ewrpt_GetDistinctValues("", wrkSql)
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

		Call SetSessionDropDownValue(sv_FACULTAD, "DetalleVtaMatAran_FACULTAD")

		' Field CARRERA
		Call SetSessionDropDownValue(sv_CARRERA, "DetalleVtaMatAran_CARRERA")

		' Field ANO
		Call SetSessionFilterValues(sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO, "DetalleVtaMatAran_ANO")

		' Field PERIODO
		Call SetSessionFilterValues(sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO, "DetalleVtaMatAran_PERIODO")

		' Field DESCRIPCION
		Call SetSessionDropDownValue(sv_DESCRIPCION, "DetalleVtaMatAran_DESCRIPCION")

		' Field PAGO
		Call SetSessionDropDownValue(sv_PAGO, "DetalleVtaMatAran_PAGO")

		' Field CODCLI
		Call SetSessionFilterValues(sv1_CODCLI, so1_CODCLI, sc_CODCLI, sv2_CODCLI, so2_CODCLI, "DetalleVtaMatAran_CODCLI")
		bSetupFilter = True ' Set up filter required
	Else

		' Field FACULTAD
		If GetDropDownValue(sv_FACULTAD, "FACULTAD") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_FACULTAD) Then
			If sv_FACULTAD <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_DetalleVtaMatAran_FACULTAD")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field CARRERA
		If GetDropDownValue(sv_CARRERA, "CARRERA") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_CARRERA) Then
			If sv_CARRERA <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_DetalleVtaMatAran_CARRERA")) Then
				bSetupFilter = True ' Set up filter required
			End If
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

		' Field DESCRIPCION
		If GetDropDownValue(sv_DESCRIPCION, "DESCRIPCION") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_DESCRIPCION) Then
			If sv_DESCRIPCION <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_DetalleVtaMatAran_DESCRIPCION")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field PAGO
		If GetDropDownValue(sv_PAGO, "PAGO") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		ElseIf Not IsArray(sv_PAGO) Then
			If sv_PAGO <> EW_REPORT_INIT_VALUE And IsEmpty(Session("sv_DetalleVtaMatAran_PAGO")) Then
				bSetupFilter = True ' Set up filter required
			End If
		End If

		' Field CODCLI
		If GetFilterValues(sv1_CODCLI, so1_CODCLI, sc_CODCLI, sv2_CODCLI, so2_CODCLI, "CODCLI") Then
			bSetupFilter = True ' Set up filter required
			bRestoreSession = False ' Do not restore from session
		End If
	End If

	' Restore session
	If bRestoreSession Then

		' Field FACULTAD
		Call GetSessionDropDownValue(sv_FACULTAD, "DetalleVtaMatAran_FACULTAD")

		' Field CARRERA
		Call GetSessionDropDownValue(sv_CARRERA, "DetalleVtaMatAran_CARRERA")

		' Field ANO
		Call GetSessionFilterValues(sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO, "DetalleVtaMatAran_ANO")

		' Field PERIODO
		Call GetSessionFilterValues(sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO, "DetalleVtaMatAran_PERIODO")

		' Field DESCRIPCION
		Call GetSessionDropDownValue(sv_DESCRIPCION, "DetalleVtaMatAran_DESCRIPCION")

		' Field PAGO
		Call GetSessionDropDownValue(sv_PAGO, "DetalleVtaMatAran_PAGO")

		' Field CODCLI
		Call GetSessionFilterValues(sv1_CODCLI, so1_CODCLI, sc_CODCLI, sv2_CODCLI, so2_CODCLI, "DetalleVtaMatAran_CODCLI")
	End If

	' Build sql
	' Field FACULTAD

	Call BuildDropDownFilter(sFilter, "FACULTAD", "[FACULTAD]", EW_REPORT_DATATYPE_STRING, 0, sv_FACULTAD, "")

	' Field CARRERA
	Call BuildDropDownFilter(sFilter, "CARRERA", "[CARRERA]", EW_REPORT_DATATYPE_STRING, 0, sv_CARRERA, "")

	' Field ANO
	Call BuildExtendedFilter(sFilter, "ANO", "[ANO]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO)

	' Field PERIODO
	Call BuildExtendedFilter(sFilter, "PERIODO", "[PERIODO]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO)

	' Field DESCRIPCION
	Call BuildDropDownFilter(sFilter, "DESCRIPCION", "[DESCRIPCION]", EW_REPORT_DATATYPE_STRING, 0, sv_DESCRIPCION, "")

	' Field PAGO
	Call BuildDropDownFilter(sFilter, "PAGO", "[PAGO]", EW_REPORT_DATATYPE_STRING, 0, sv_PAGO, "")

	' Field CODCLI
	Call BuildExtendedFilter(sFilter, "CODCLI", "[CODCLI]", EW_REPORT_DATATYPE_STRING, 0, sv1_CODCLI, so1_CODCLI, sc_CODCLI, sv2_CODCLI, so2_CODCLI)

	' Save parms to Session
	' Field FACULTAD

	Call SetSessionDropDownValue(sv_FACULTAD, "DetalleVtaMatAran_FACULTAD")

	' Field CARRERA
	Call SetSessionDropDownValue(sv_CARRERA, "DetalleVtaMatAran_CARRERA")

	' Field ANO
	Call SetSessionFilterValues(sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO, "DetalleVtaMatAran_ANO")

	' Field PERIODO
	Call SetSessionFilterValues(sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO, "DetalleVtaMatAran_PERIODO")

	' Field DESCRIPCION
	Call SetSessionDropDownValue(sv_DESCRIPCION, "DetalleVtaMatAran_DESCRIPCION")

	' Field PAGO
	Call SetSessionDropDownValue(sv_PAGO, "DetalleVtaMatAran_PAGO")

	' Field CODCLI
	Call SetSessionFilterValues(sv1_CODCLI, so1_CODCLI, sc_CODCLI, sv2_CODCLI, so2_CODCLI, "DetalleVtaMatAran_CODCLI")

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
	' DESCRIPCION
	'Call RegisterCustomFilter("DESCRIPCION", "StartsWithA", "Starts With A", "[DESCRIPCION]", "GetStartsWithAFilter")
	' PAGO
	'Call RegisterCustomFilter("PAGO", "StartsWithA", "Starts With A", "[PAGO]", "GetStartsWithAFilter")

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

	' Field DESCRIPCION
	svd_DESCRIPCION = EW_REPORT_INIT_VALUE
	sv_DESCRIPCION = svd_DESCRIPCION

	' Field PAGO
	svd_PAGO = EW_REPORT_INIT_VALUE
	sv_PAGO = svd_PAGO

	' --------------------------------------------------
	'  Set up default values for extended filters
	'
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

	' Field CODCLI
	' sv1d_CODCLI = Date ' Default value is today
	' so1d_CODCLI = "<=" ' Default operator is "<="

	sv1d_CODCLI = Null ' Default ext filter value 1
	sv2d_CODCLI = Null ' Default ext filter value 2 (if operator 2 is enabled)
	so1d_CODCLI = "=" ' Default search operator 1
	so2d_CODCLI = "=" ' Default search operator 2 (if operator 2 is enabled)
	scd_CODCLI = "AND" ' Default search condition (if operator 2 is enabled)
	sv1_CODCLI = sv1d_CODCLI
	sv2_CODCLI = sv2d_CODCLI
	so1_CODCLI = so1d_CODCLI
	so2_CODCLI = so2d_CODCLI
	sc_CODCLI = scd_CODCLI

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

	' Check DESCRIPCION non-Text filter
	If NonTextFilterApplied(sv_DESCRIPCION, svd_DESCRIPCION) Then
		CheckFilter = True
		Exit Function
	End If

	' Check PAGO non-Text filter
	If NonTextFilterApplied(sv_PAGO, svd_PAGO) Then
		CheckFilter = True
		Exit Function
	End If

	' Check CODCLI Text filter
	If TextFilterApplied(sv1_CODCLI, sv2_CODCLI, so1_CODCLI, so2_CODCLI, sc_CODCLI, _
		sv1d_CODCLI, sv2d_CODCLI, so1d_CODCLI, so2d_CODCLI, scd_CODCLI) Then
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

	' Field ANO
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "ANO", "[ANO]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_ANO, so1_ANO, sc_ANO, sv2_ANO, so2_ANO)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "ANO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field PERIODO
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "PERIODO", "[PERIODO]", EW_REPORT_DATATYPE_NUMBER, 0, sv1_PERIODO, so1_PERIODO, sc_PERIODO, sv2_PERIODO, so2_PERIODO)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "PERIODO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field DESCRIPCION
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "DESCRIPCION", "[DESCRIPCION]", EW_REPORT_DATATYPE_STRING, 0, sv_DESCRIPCION, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "PRODUCTO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field PAGO
	sExtWrk = ""
	sWrk = ""
	Call BuildDropDownFilter(sExtWrk, "PAGO", "[PAGO]", EW_REPORT_DATATYPE_STRING, 0, sv_PAGO, "")
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "PAGO<br>"
	If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
	If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

	' Field CODCLI
	sExtWrk = ""
	sWrk = ""
	Call BuildExtendedFilter(sExtWrk, "CODCLI", "[CODCLI]", EW_REPORT_DATATYPE_STRING, 0, sv1_CODCLI, so1_CODCLI, sc_CODCLI, sv2_CODCLI, so2_CODCLI)
	If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & "RUT<br>"
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
			Session("sort_DetalleVtaMatAran_FACULTAD") = ""
			Session("sort_DetalleVtaMatAran_CARRERA") = ""
			Session("sort_DetalleVtaMatAran_ANO") = ""
			Session("sort_DetalleVtaMatAran_PERIODO") = ""
			Session("sort_DetalleVtaMatAran_DESCRIPCION") = ""
			Session("sort_DetalleVtaMatAran_PAGO") = ""
			Session("sort_DetalleVtaMatAran_CODCLI") = ""
			Session("sort_DetalleVtaMatAran_PATERNO") = ""
			Session("sort_DetalleVtaMatAran_MATERNO") = ""
			Session("sort_DetalleVtaMatAran_NOMBRE") = ""
			Session("sort_DetalleVtaMatAran_TOTAL") = ""
			Session("sort_DetalleVtaMatAran_MONTO") = ""
			Session("sort_DetalleVtaMatAran_FECREG") = ""
			Session("sort_DetalleVtaMatAran_CTAPAG") = ""
			Session("sort_DetalleVtaMatAran_CTAPAGNUM") = ""
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
