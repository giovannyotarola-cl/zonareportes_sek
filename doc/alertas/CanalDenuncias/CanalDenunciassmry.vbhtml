@Functions

	' CanalDenuncias
	Public Shared Property CanalDenuncias As crCanalDenuncias
		Get
			Return CType(ewr_PageData("CanalDenuncias"), crCanalDenuncias)
		End Get
		Set(ByVal Value As crCanalDenuncias)
			 ewr_PageData("CanalDenuncias") = Value
		End Set
	End Property

	'
	' Page class for CanalDenuncias
	'	
	Public Class crCanalDenuncias_summary(Of C As {crConnection, New}, S As {cAdvancedSecurity, New})
		Inherits crCanalDenuncias_summary_base(Of C, S)

		' DefaultDropDownValue (TipoDelito)
		Public Function Get_TipoDelito_DefaultDropDownValue() As Object
			Return EWR_INIT_VALUE
		End Function		

		' DefaultDropDownValue (tipoUsuario)
		Public Function Get_tipoUsuario_DefaultDropDownValue() As Object
			Return EWR_INIT_VALUE
		End Function		
	End Class

	' CanalDenuncias_summary	
	Public Shared Property CanalDenuncias_summary As crCanalDenuncias_summary(Of crConnection, cAdvancedSecurity) 
		Get
			Return CType(ewr_PageData("CanalDenuncias_summary"), crCanalDenuncias_summary(Of crConnection, cAdvancedSecurity))
		End Get
		Set(ByVal Value As crCanalDenuncias_summary(Of crConnection, cAdvancedSecurity))
			ewr_PageData("CanalDenuncias_summary") = Value
		End Set
	End Property

	' CurrentPage	
	Public Shared Property CurrentPage As crCanalDenuncias_summary(Of crConnection, cAdvancedSecurity) 
		Get
			Return CType(ewr_PageData("CurrentPage"), crCanalDenuncias_summary(Of crConnection, cAdvancedSecurity))
		End Get
		Set(ByVal Value As crCanalDenuncias_summary(Of crConnection, cAdvancedSecurity))
			ewr_PageData("CurrentPage") = Value
		End Set
	End Property

	' CurrentTable	
	Public Shared Property CurrentTable As crCanalDenuncias_summary(Of crConnection, cAdvancedSecurity) 
		Get
			Return CurrentPage
		End Get
		Set(ByVal Value As crCanalDenuncias_summary(Of crConnection, cAdvancedSecurity))
			CurrentPage = Value
		End Set
	End Property
End Functions
@Code

	' Header
	ewr_Header(False)

	' Create page object
	If CanalDenuncias_summary Is Nothing Then
		CanalDenuncias_summary = New crCanalDenuncias_summary(Of crConnection, cAdvancedSecurity)()
	End If
	CurrentPage = CanalDenuncias_summary

	' Page init
	CurrentPage.Page_Init()

	' Page main
	CurrentPage.Page_Main()
End Code
@RenderPage("_header.vbhtml")
@If ewr_Empty(CurrentPage.Export) Then
@<script type="text/javascript">
// Create page object
var CanalDenuncias_summary = new ewr_Page("CanalDenuncias_summary");
// page properties
CanalDenuncias_summary.PageID = "summary"; // page ID
var EWR_PAGE_ID = CanalDenuncias_summary.PageID;
// extend page with Chart_Rendering function
CanalDenuncias_summary.Chart_Rendering = 
 function(chart, chartid) { // DO NOT CHANGE THIS LINE!
 	//alert(chartid);
 }
// extend page with Chart_Rendered function
CanalDenuncias_summary.Chart_Rendered = 
 function(chart, chartid) { // DO NOT CHANGE THIS LINE!
 	//alert(chartid);
 }
</script>
End If
@If ewr_Empty(CurrentPage.Export) AndAlso Not CurrentPage.DrillDown Then
@<script type="text/javascript">
// Form object
var fCanalDenunciassummary = new ewr_Form("fCanalDenunciassummary");
// Validate method
fCanalDenunciassummary.Validate = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	this.PostAutoSuggest();
	var elm = fobj.sv_fecha;
	if (elm && !ewr_CheckEuroDate(elm.value)) {
		if (!ewr_OnError(elm, "@ewr_JsEncode2(CurrentPage.fecha.FldErrMsg)"))
			return false;
	}
	var elm = fobj.sv2_fecha;
	if (elm && !ewr_CheckEuroDate(elm.value)) {
		if (!ewr_OnError(elm, "@ewr_JsEncode2(CurrentPage.fecha.FldErrMsg)"))
			return false;
	}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// Form_CustomValidate method
fCanalDenunciassummary.Form_CustomValidate = 
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
fCanalDenunciassummary.ValidateRequired = @(If(EWR_CLIENT_VALIDATE, "true", "false"));
// Use Ajax
fCanalDenunciassummary.Lists["sv_TipoDelito"] = {"LinkField":"sv_TipoDelito","DisplayFields":["sv_TipoDelito","","",""],"ParentFields":[],"FilterFields":[],"Options":[]};
fCanalDenunciassummary.Lists["sv_tipoUsuario"] = {"LinkField":"sv_tipoUsuario","DisplayFields":["sv_tipoUsuario","","",""],"ParentFields":[],"FilterFields":[],"Options":[]};
</script>
@<script type="text/javascript">
// Write your client script here, no need to add script tags.
</script>
End If
@If ewr_Empty(CurrentPage.Export) AndAlso Not CurrentPage.DrillDown Then
@<div id="ewrPopupFilterDiv"><div class="bd"></div></div>
@<script type="text/javascript">
ewr_InitPopupFilter(); // Init popup filter
</script>
End If
@If ewr_Empty(CurrentPage.Export) Then
@<!-- Table Container (Begin) -->
@:<table id="ewContainer" class="ewStdTable">
@<!-- Top Container (Begin) -->
@:<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
@<a id="top"></a>
End If
<!-- top slot -->
@If Not CurrentPage.DrillDownInPanel Then
@<p class="ewSpacer"><a href="CanalDenunciassmry.vbhtml?export=excel"><img src="~/aspxrptimages/excel.png" /></a>@Code CurrentPage.ExportOptions.Render("body") End Code</p>
End If
@Code
	CurrentPage.ShowPageHeader()
End Code
@Code
	CurrentPage.ShowMessage()
End Code
@If ewr_Empty(CurrentPage.Export) Then
@:</div></td></tr>
@<!-- Top Container (End) -->
@:<tr>
	@<!-- Left Container (Begin) -->
	@:<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
End If
	<!-- Left slot -->
@If ewr_Empty(CurrentPage.Export) Then
	@:</div></td>
	@<!-- Left Container (End) -->
	@<!-- Center Container - Report (Begin) -->
	@:<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
End If
	<!-- center slot -->
<!-- Summary Report (begin) -->
@Code
@:<div id="report_summary">
@* report_extfilter (begin) *@
@If ewr_Empty(CurrentPage.Export) AndAlso Not CurrentPage.DrillDown Then
@<!-- Search form (begin) -->
@<form name="fCanalDenunciassummary" id="fCanalDenunciassummary" class="ewForm ewExtFilterForm" action="@ewr_CurrentPage()" onsubmit="return ewrForms[this.id].Submit();">
<input type="hidden" name="cmd" value="search" />
<a href="javascript:fCanalDenunciassummary.ToggleSearchPanel();" style="text-decoration: none;"><img id="fCanalDenunciassummary_SearchImage" src="aspxrptimages/collapse.gif" width="9" height="9" alt="" style="border: 0;" /></a><span class="aspnetreportmaker">&nbsp;@Html.Raw(ReportLanguage.Phrase("Filters"))</span>
<div id="fCanalDenunciassummary_SearchPanel">
<table class="ewRptExtFilter">
	<tr id="r_rut">
		<td><span class="ewSearchCaption">@Html.Raw(CurrentPage.rut.FldCaption)</span></td>
		<td><span class="ewSearchOperator">@ReportLanguage.Phrase("LIKE")<input type="hidden" name="so_rut" id="so_rut" value="LIKE"></span></td>
		<td>
			<table class="ewItemTable"><tr>
				<td><span class="ewSearchField">
<input type="text" id="sv_rut" name="sv_rut" size="30" maxlength="10" value="@(CurrentPage.rut.SearchValue)" @(Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias_rut", " class=""ewInputCleared""", ""))) @(Html.Raw(CurrentPage.rut.EditAttributes)) />
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_nombre">
		<td><span class="ewSearchCaption">@Html.Raw(CurrentPage.nombre.FldCaption)</span></td>
		<td><span class="ewSearchOperator">@ReportLanguage.Phrase("LIKE")<input type="hidden" name="so_nombre" id="so_nombre" value="LIKE"></span></td>
		<td>
			<table class="ewItemTable"><tr>
				<td><span class="ewSearchField">
<input type="text" id="sv_nombre" name="sv_nombre" size="30" maxlength="50" value="@(CurrentPage.nombre.SearchValue)" @(Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias_nombre", " class=""ewInputCleared""", ""))) @(Html.Raw(CurrentPage.nombre.EditAttributes)) />
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_apellido_P">
		<td><span class="ewSearchCaption">@Html.Raw(CurrentPage.apellido_P.FldCaption)</span></td>
		<td><span class="ewSearchOperator">@ReportLanguage.Phrase("LIKE")<input type="hidden" name="so_apellido_P" id="so_apellido_P" value="LIKE"></span></td>
		<td>
			<table class="ewItemTable"><tr>
				<td><span class="ewSearchField">
<input type="text" id="sv_apellido_P" name="sv_apellido_P" size="30" maxlength="50" value="@(CurrentPage.apellido_P.SearchValue)" @(Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias_apellido_P", " class=""ewInputCleared""", ""))) @(Html.Raw(CurrentPage.apellido_P.EditAttributes)) />
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_apellido_M">
		<td><span class="ewSearchCaption">@Html.Raw(CurrentPage.apellido_M.FldCaption)</span></td>
		<td><span class="ewSearchOperator">@ReportLanguage.Phrase("LIKE")<input type="hidden" name="so_apellido_M" id="so_apellido_M" value="LIKE"></span></td>
		<td>
			<table class="ewItemTable"><tr>
				<td><span class="ewSearchField">
<input type="text" id="sv_apellido_M" name="sv_apellido_M" size="30" maxlength="50" value="@(CurrentPage.apellido_M.SearchValue)" @(Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias_apellido_M", " class=""ewInputCleared""", ""))) @(Html.Raw(CurrentPage.apellido_M.EditAttributes)) />
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r__EMAIL">
		<td><span class="ewSearchCaption">@Html.Raw(CurrentPage._EMAIL.FldCaption)</span></td>
		<td><span class="ewSearchOperator">@ReportLanguage.Phrase("LIKE")<input type="hidden" name="so__EMAIL" id="so__EMAIL" value="LIKE"></span></td>
		<td>
			<table class="ewItemTable"><tr>
				<td><span class="ewSearchField">
<input type="text" id="sv__EMAIL" name="sv__EMAIL" size="30" maxlength="50" value="@(CurrentPage._EMAIL.SearchValue)" @(Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias__EMAIL", " class=""ewInputCleared""", ""))) @(Html.Raw(CurrentPage._EMAIL.EditAttributes)) />
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_CIUDAD">
		<td><span class="ewSearchCaption">@Html.Raw(CurrentPage.CIUDAD.FldCaption)</span></td>
		<td><span class="ewSearchOperator">@ReportLanguage.Phrase("LIKE")<input type="hidden" name="so_CIUDAD" id="so_CIUDAD" value="LIKE"></span></td>
		<td>
			<table class="ewItemTable"><tr>
				<td><span class="ewSearchField">
<input type="text" id="sv_CIUDAD" name="sv_CIUDAD" size="30" maxlength="50" value="@(CurrentPage.CIUDAD.SearchValue)" @(Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias_CIUDAD", " class=""ewInputCleared""", ""))) @(Html.Raw(CurrentPage.CIUDAD.EditAttributes)) />
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_TipoDelito">
		<td><span class="ewSearchCaption">@Html.Raw(CurrentPage.TipoDelito.FldCaption)</span></td>
		<td></td>
		<td colspan="4">
<select id="sv_TipoDelito" name="sv_TipoDelito"@Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias_TipoDelito", " class=""ewInputCleared""", "")) @Html.Raw(CurrentPage.TipoDelito.EditAttributes)>
<option value="">@Html.Raw(ReportLanguage.Phrase("PleaseSelect"))</option>
@Code
	cntf = If(ewr_IsList(CurrentPage.TipoDelito.AdvancedFilters), CurrentPage.TipoDelito.AdvancedFilters.Count, 0)
	cntd = If(ewr_IsList(CurrentPage.TipoDelito.DropDownList), CurrentPage.TipoDelito.DropDownList.Count, 0)
	totcnt = cntf + cntd
	wrkcnt = 0
	If cntf > 0 Then
		For Each kvp In CurrentPage.TipoDelito.AdvancedFilters
			Dim filter = kvp.Value
			If filter.Enabled Then
				selwrk = If(ewr_MatchedFilterValue(CurrentPage.TipoDelito.DropDownValue, filter.ID), " selected=""selected""", "")
@<option value="@filter.ID" @Html.Raw(selwrk)>@Html.Raw(filter.Name)</option>
				wrkcnt += 1
			End If
		Next
	End If
	For i = 0 To cntd - 1
		selwrk = " selected=""selected"""
@<option value="@CurrentPage.TipoDelito.DropDownList(i)" @Html.Raw(selwrk)>@Html.Raw(ewr_DropDownDisplayValue(CurrentPage.TipoDelito.DropDownList(i), "", 0))</option>
		wrkcnt += 1
	Next
End Code
</select>
<text>@Code
	sSqlWrk = "SELECT DISTINCT [TipoDelito], [TipoDelito] AS [DispFld] FROM [dbo].[SEK_CanalDenuncias]"
	sWhereWrk = ""
	sLookupTblFilter = Convert.ToString(CurrentPage.GetCustomValue("FldSelectFilter", "TipoDelito"))
	If ewr_NotEmpty(sLookupTblFilter) Then
		ewr_AddFilter(sWhereWrk, sLookupTblFilter)
	End If
	If ewr_NotEmpty(sWhereWrk) Then
		sSqlWrk &= " WHERE " & sWhereWrk
	End If
	sSqlWrk &= " ORDER BY [TipoDelito]"
End Code</text>
<input type="hidden" name="s_sv_TipoDelito" id="s_sv_TipoDelito" value="s=@(Html.Raw(ewr_Encrypt(sSqlWrk)))&f0=@(Html.Raw(ewr_Encrypt("[TipoDelito] = {filter_value}")))&t0=200&ds=&df=0&dlm=@(Html.Raw(ewr_Encrypt(CurrentPage.TipoDelito.FldDelimiter)))" /></td>
	</tr>
	<tr id="r_fecha">
		<td><span class="ewSearchCaption">@Html.Raw(CurrentPage.fecha.FldCaption)</span></td>
		<td><span class="ewSearchOperator">@ReportLanguage.Phrase("BETWEEN")<input type="hidden" name="so_fecha" id="so_fecha" value="BETWEEN"></span></td>
		<td>
			<table class="ewItemTable"><tr>
				<td><span class="ewSearchField">
<input type="text" id="sv_fecha" name="sv_fecha" value="@(CurrentPage.fecha.SearchValue)" @(Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias_fecha", " class=""ewInputCleared""", ""))) @(Html.Raw(CurrentPage.fecha.EditAttributes)) />
<img src="aspxrptimages/calendar.png" id="fCanalDenunciassummary$sv_fecha$" name="fCanalDenunciassummary$sv_fecha$" alt="@ReportLanguage.Phrase("PickDate")" title="@ReportLanguage.Phrase("PickDate")" class="ewCalendar" />
<script type="text/javascript">
ewr_CreateCalendar("fCanalDenunciassummary", "sv_fecha", "%d-%m-%Y");
</script>
</span></td>
				<td><span class="ewSearchCond btw1_fecha">&nbsp;@Html.Raw(ReportLanguage.Phrase("AND"))&nbsp;</span></td>
				<td><span class="ewSearchOperator btw1_fecha">
<input type="text" id="sv2_fecha" name="sv2_fecha" value="@(CurrentPage.fecha.SearchValue2)" @(Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias_fecha", " class=""ewInputCleared""", ""))) @(Html.Raw(CurrentPage.fecha.EditAttributes)) />
<img src="aspxrptimages/calendar.png" id="fCanalDenunciassummary$sv2_fecha$" name="fCanalDenunciassummary$sv2_fecha$" alt="@ReportLanguage.Phrase("PickDate")" title="@ReportLanguage.Phrase("PickDate")" class="ewCalendar" />
<script type="text/javascript">
ewr_CreateCalendar("fCanalDenunciassummary", "sv2_fecha", "%d-%m-%Y");
</script>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr id="r_tipoUsuario">
		<td><span class="ewSearchCaption">@Html.Raw(CurrentPage.tipoUsuario.FldCaption)</span></td>
		<td></td>
		<td colspan="4">
<select id="sv_tipoUsuario" name="sv_tipoUsuario"@Html.Raw(IIf(CurrentPage.ClearExtFilter = "CanalDenuncias_tipoUsuario", " class=""ewInputCleared""", "")) @Html.Raw(CurrentPage.tipoUsuario.EditAttributes)>
<option value="">@Html.Raw(ReportLanguage.Phrase("PleaseSelect"))</option>
@Code
	cntf = If(ewr_IsList(CurrentPage.tipoUsuario.AdvancedFilters), CurrentPage.tipoUsuario.AdvancedFilters.Count, 0)
	cntd = If(ewr_IsList(CurrentPage.tipoUsuario.DropDownList), CurrentPage.tipoUsuario.DropDownList.Count, 0)
	totcnt = cntf + cntd
	wrkcnt = 0
	If cntf > 0 Then
		For Each kvp In CurrentPage.tipoUsuario.AdvancedFilters
			Dim filter = kvp.Value
			If filter.Enabled Then
				selwrk = If(ewr_MatchedFilterValue(CurrentPage.tipoUsuario.DropDownValue, filter.ID), " selected=""selected""", "")
@<option value="@filter.ID" @Html.Raw(selwrk)>@Html.Raw(filter.Name)</option>
				wrkcnt += 1
			End If
		Next
	End If
	For i = 0 To cntd - 1
		selwrk = " selected=""selected"""
@<option value="@CurrentPage.tipoUsuario.DropDownList(i)" @Html.Raw(selwrk)>@Html.Raw(ewr_DropDownDisplayValue(CurrentPage.tipoUsuario.DropDownList(i), "", 0))</option>
		wrkcnt += 1
	Next
End Code
</select>
<text>@Code
	sSqlWrk = "SELECT DISTINCT [tipoUsuario], [tipoUsuario] AS [DispFld] FROM [dbo].[SEK_CanalDenuncias]"
	sWhereWrk = ""
	sLookupTblFilter = Convert.ToString(CurrentPage.GetCustomValue("FldSelectFilter", "tipoUsuario"))
	If ewr_NotEmpty(sLookupTblFilter) Then
		ewr_AddFilter(sWhereWrk, sLookupTblFilter)
	End If
	If ewr_NotEmpty(sWhereWrk) Then
		sSqlWrk &= " WHERE " & sWhereWrk
	End If
	sSqlWrk &= " ORDER BY [tipoUsuario]"
End Code</text>
<input type="hidden" name="s_sv_tipoUsuario" id="s_sv_tipoUsuario" value="s=@(Html.Raw(ewr_Encrypt(sSqlWrk)))&f0=@(Html.Raw(ewr_Encrypt("[tipoUsuario] = {filter_value}")))&t0=130&ds=&df=0&dlm=@(Html.Raw(ewr_Encrypt(CurrentPage.tipoUsuario.FldDelimiter)))" /></td>
	</tr>
</table>
<table class="ewRptExtFilter">
	<tr>
		<td><span class="aspnetreportmaker">
			<input type="Submit" name="Submit" id="Submit" value="@Html.Raw(ReportLanguage.Phrase("Search"))" />&nbsp;
			<input type="Reset" name="Reset" id="Reset" value="@Html.Raw(ReportLanguage.Phrase("Reset"))" style="display:none;" />&nbsp;
		</span></td>
	</tr>
</table>
</div>
</form>
@<script type="text/javascript">
fCanalDenunciassummary.Init();
</script>
@<!-- Search form (end) -->
End If
If CurrentPage.ShowCurrentFilter Then
	@<table><tr><td><div id="ewrFilterList">@Code CurrentPage.ShowFilterList() End Code</div></td></tr></table>
End If
@* report_extfilter (end) *@
End Code
@Code

	' Set the last group to display if not export all
	If CurrentPage.ExportAll AndAlso ewr_NotEmpty(CurrentPage.Export) Then
		CurrentPage.StopGrp = CurrentPage.TotalGrps
	Else
		CurrentPage.StopGrp = CurrentPage.StartGrp + CurrentPage.DisplayGrps - 1
	End If

	' Stop group <= total number of groups
	If CurrentPage.StopGrp > CurrentPage.TotalGrps Then
		CurrentPage.StopGrp = CurrentPage.TotalGrps
	End If
	CurrentPage.RecCount = 0

	' Get first row
	If CurrentPage.TotalGrps > 0 Then
		CurrentPage.GetRow() ' AXR
		CurrentPage.GrpCount = 1
	End If
End Code
@While CurrentPage.HasRow AndAlso CurrentPage.GrpCount <= CurrentPage.DisplayGrps OrElse CurrentPage.ShowHeader

	' Show header
	If CurrentPage.ShowHeader Then
	@Code
	@Html.Raw("<table cellspacing=""0"" class=""ewGrid""><tr>")
	@Html.Raw("<td class=""ewGridContent"">")
	End Code
	@<!-- Report grid (begin) -->
	@Code
	@Html.Raw("<div class=""ewGridMiddlePanel"">")
	End Code
	@Html.Raw("<table cellspacing=""0"" class=""" & CurrentPage.ReportTableClass & """>")
@<thead>
	<!-- Table header -->
	<tr>
@If CurrentPage.rut.Visible Then
@<td data-field="rut" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.rut.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.rut)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.rut.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.rut)',0);">@Html.Raw(CurrentPage.rut.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.rut.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.rut.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.rut.Visible *@
@If CurrentPage.nombre.Visible Then
@<td data-field="nombre" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn"><tr><td>@Html.Raw(CurrentPage.nombre.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.nombre)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.nombre.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.nombre)',0);">@Html.Raw(CurrentPage.nombre.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.nombre.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.nombre.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.nombre.Visible *@
@If CurrentPage.apellido_P.Visible Then
@<td data-field="apellido_P" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.apellido_P.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.apellido_P)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.apellido_P.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.apellido_P)',0);">@Html.Raw(CurrentPage.apellido_P.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.apellido_P.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.apellido_P.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.apellido_P.Visible *@
@If CurrentPage.apellido_M.Visible Then
@<td data-field="apellido_M" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.apellido_M.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.apellido_M)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.apellido_M.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.apellido_M)',0);">@Html.Raw(CurrentPage.apellido_M.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.apellido_M.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.apellido_M.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.apellido_M.Visible *@
@If CurrentPage._EMAIL.Visible Then
@<td data-field="_EMAIL" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage._EMAIL.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage._EMAIL)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage._EMAIL.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage._EMAIL)',0);">@Html.Raw(CurrentPage._EMAIL.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage._EMAIL.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage._EMAIL.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage._EMAIL.Visible *@
@If CurrentPage.DIRECCION.Visible Then
@<td data-field="DIRECCION" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: justify;"><tr><td>@Html.Raw(CurrentPage.DIRECCION.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: justify;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.DIRECCION)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.DIRECCION.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.DIRECCION)',0);">@Html.Raw(CurrentPage.DIRECCION.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.DIRECCION.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.DIRECCION.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.DIRECCION.Visible *@
@If CurrentPage.COMUNA.Visible Then
@<td data-field="COMUNA" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.COMUNA.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.COMUNA)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.COMUNA.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.COMUNA)',0);">@Html.Raw(CurrentPage.COMUNA.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.COMUNA.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.COMUNA.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.COMUNA.Visible *@
@If CurrentPage.CIUDAD.Visible Then
@<td data-field="CIUDAD" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.CIUDAD.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.CIUDAD)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.CIUDAD.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.CIUDAD)',0);">@Html.Raw(CurrentPage.CIUDAD.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.CIUDAD.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.CIUDAD.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.CIUDAD.Visible *@
@If CurrentPage.TelefonoContacto.Visible Then
@<td data-field="TelefonoContacto" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.TelefonoContacto.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.TelefonoContacto)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.TelefonoContacto.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.TelefonoContacto)',0);">@Html.Raw(CurrentPage.TelefonoContacto.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.TelefonoContacto.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.TelefonoContacto.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.TelefonoContacto.Visible *@
@If CurrentPage.TipoDelito.Visible Then
@<td data-field="TipoDelito" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: justify;"><tr><td>@Html.Raw(CurrentPage.TipoDelito.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: justify;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.TipoDelito)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.TipoDelito.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.TipoDelito)',0);">@Html.Raw(CurrentPage.TipoDelito.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.TipoDelito.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.TipoDelito.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.TipoDelito.Visible *@
@If CurrentPage.detalle.Visible Then
@<td data-field="detalle" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: justify;"><tr><td>@Html.Raw(CurrentPage.detalle.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: justify;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.detalle)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.detalle.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.detalle)',0);">@Html.Raw(CurrentPage.detalle.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.detalle.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.detalle.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.detalle.Visible *@
@If CurrentPage.adjunto.Visible Then
@<td data-field="adjunto" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.adjunto.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.adjunto)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.adjunto.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.adjunto)',0);">@Html.Raw(CurrentPage.adjunto.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.adjunto.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.adjunto.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.adjunto.Visible *@
@If CurrentPage.ip.Visible Then
@<td data-field="ip" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.ip.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.ip)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.ip.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.ip)',0);">@Html.Raw(CurrentPage.ip.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.ip.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.ip.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.ip.Visible *@
@If CurrentPage.fecha.Visible Then
@<td data-field="fecha" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.fecha.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.fecha)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.fecha.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.fecha)',0);">@Html.Raw(CurrentPage.fecha.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.fecha.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.fecha.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.fecha.Visible *@
@If CurrentPage.tipoUsuario.Visible Then
@<td data-field="tipoUsuario" class="ewTableHeader">
	@If ewr_NotEmpty(CurrentPage.Export) OrElse CurrentPage.DrillDown Then
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr><td>@Html.Raw(CurrentPage.tipoUsuario.FldCaption)</td></tr></table>
	Else
	@<table class="ewTableHeaderBtn" style="text-align: center;"><tr>
		@If ewr_Empty(CurrentPage.SortUrl(CurrentPage.tipoUsuario)) Then
		@<td style="vertical-align: bottom;">@Html.Raw(CurrentPage.tipoUsuario.FldCaption)</td>
		Else
		@<td class="ewTableHeaderCaption" onmousedown="ewr_Sort(event,'@CurrentPage.SortUrl(CurrentPage.tipoUsuario)',0);">@Html.Raw(CurrentPage.tipoUsuario.FldCaption)</td>@<td class="ewTableHeaderSort">
		@If CurrentPage.tipoUsuario.Sort = "ASC" Then @<img src="aspxrptimages/sortup.gif" width="10" height="9" alt="" style="border: 0;" />ElseIf CurrentPage.tipoUsuario.Sort = "DESC" Then @<img src="aspxrptimages/sortdown.gif" width="10" height="9" alt="" style="border: 0;" />End If</td>
	End If
	</tr></table>
	End If
</td>
End If @* CurrentPage.tipoUsuario.Visible *@
	</tr>
</thead>
@:<tbody>
		If CurrentPage.TotalGrps = 0 Then
			Exit While ' Show header only
		End If
		CurrentPage.ShowHeader = False
	End If
	CurrentPage.RecCount += 1

		' Render detail row
		CurrentPage.ResetAttrs()
		CurrentPage.RowType = EWR_ROWTYPE_DETAIL
		CurrentPage.RenderRow()
	@<tr @Html.Raw(CurrentPage.RowAttributes)>
@If CurrentPage.rut.Visible Then
		@<td data-field="rut" @Html.Raw(CurrentPage.rut.CellAttributes)>
<span @Html.Raw(CurrentPage.rut.ViewAttributes)>@Html.Raw(CurrentPage.rut.ListViewValue)</span></td>
End If
@If CurrentPage.nombre.Visible Then
		@<td data-field="nombre" @Html.Raw(CurrentPage.nombre.CellAttributes)>
<span @Html.Raw(CurrentPage.nombre.ViewAttributes)>@Html.Raw(CurrentPage.nombre.ListViewValue)</span></td>
End If
@If CurrentPage.apellido_P.Visible Then
		@<td data-field="apellido_P" @Html.Raw(CurrentPage.apellido_P.CellAttributes)>
<span @Html.Raw(CurrentPage.apellido_P.ViewAttributes)>@Html.Raw(CurrentPage.apellido_P.ListViewValue)</span></td>
End If
@If CurrentPage.apellido_M.Visible Then
		@<td data-field="apellido_M" @Html.Raw(CurrentPage.apellido_M.CellAttributes)>
<span @Html.Raw(CurrentPage.apellido_M.ViewAttributes)>@Html.Raw(CurrentPage.apellido_M.ListViewValue)</span></td>
End If
@If CurrentPage._EMAIL.Visible Then
		@<td data-field="_EMAIL" @Html.Raw(CurrentPage._EMAIL.CellAttributes)>
<span @Html.Raw(CurrentPage._EMAIL.ViewAttributes)>@Html.Raw(CurrentPage._EMAIL.ListViewValue)</span></td>
End If
@If CurrentPage.DIRECCION.Visible Then
		@<td data-field="DIRECCION" @Html.Raw(CurrentPage.DIRECCION.CellAttributes)>
<span @Html.Raw(CurrentPage.DIRECCION.ViewAttributes)>@Html.Raw(CurrentPage.DIRECCION.ListViewValue)</span></td>
End If
@If CurrentPage.COMUNA.Visible Then
		@<td data-field="COMUNA" @Html.Raw(CurrentPage.COMUNA.CellAttributes)>
<span @Html.Raw(CurrentPage.COMUNA.ViewAttributes)>@Html.Raw(CurrentPage.COMUNA.ListViewValue)</span></td>
End If
@If CurrentPage.CIUDAD.Visible Then
		@<td data-field="CIUDAD" @Html.Raw(CurrentPage.CIUDAD.CellAttributes)>
<span @Html.Raw(CurrentPage.CIUDAD.ViewAttributes)>@Html.Raw(CurrentPage.CIUDAD.ListViewValue)</span></td>
End If
@If CurrentPage.TelefonoContacto.Visible Then
		@<td data-field="TelefonoContacto" @Html.Raw(CurrentPage.TelefonoContacto.CellAttributes)>
<span @Html.Raw(CurrentPage.TelefonoContacto.ViewAttributes)>@Html.Raw(CurrentPage.TelefonoContacto.ListViewValue)</span></td>
End If
@If CurrentPage.TipoDelito.Visible Then
		@<td data-field="TipoDelito" @Html.Raw(CurrentPage.TipoDelito.CellAttributes)>
<span @Html.Raw(CurrentPage.TipoDelito.ViewAttributes)>@Html.Raw(CurrentPage.TipoDelito.ListViewValue)</span></td>
End If
@If CurrentPage.detalle.Visible Then
		@<td data-field="detalle" @Html.Raw(CurrentPage.detalle.CellAttributes)>
<span @Html.Raw(CurrentPage.detalle.ViewAttributes)>@Html.Raw(CurrentPage.detalle.ListViewValue)</span></td>
End If
@If CurrentPage.adjunto.Visible Then
		@<td data-field="adjunto" @Html.Raw(CurrentPage.adjunto.CellAttributes)>
<span @Html.Raw(CurrentPage.adjunto.ViewAttributes)>@Html.Raw(CurrentPage.adjunto.ListViewValue)</span></td>
End If
@If CurrentPage.ip.Visible Then
		@<td data-field="ip" @Html.Raw(CurrentPage.ip.CellAttributes)>
<span @Html.Raw(CurrentPage.ip.ViewAttributes)>@Html.Raw(CurrentPage.ip.ListViewValue)</span></td>
End If
@If CurrentPage.fecha.Visible Then
		@<td data-field="fecha" @Html.Raw(CurrentPage.fecha.CellAttributes)>
<span @Html.Raw(CurrentPage.fecha.ViewAttributes)>@Html.Raw(CurrentPage.fecha.ListViewValue)</span></td>
End If
@If CurrentPage.tipoUsuario.Visible Then
		@<td data-field="tipoUsuario" @Html.Raw(CurrentPage.tipoUsuario.CellAttributes)>
<span @Html.Raw(CurrentPage.tipoUsuario.ViewAttributes)>@Html.Raw(CurrentPage.tipoUsuario.ListViewValue)</span></td>
End If
	</tr>

		' Accumulate page summary
		CurrentPage.AccumulateSummary()

		' Get next record
		CurrentPage.GetRow() ' AXR
		CurrentPage.GrpCount += 1
End While @* End while *@
@If CurrentPage.TotalGrps > 0 Then
	@:</tbody>
	@<tfoot>
@Code
	CurrentPage.ResetAttrs()
	CurrentPage.RowType = EWR_ROWTYPE_TOTAL
	CurrentPage.RowTotalType = EWR_ROWTOTAL_GRAND
	CurrentPage.RowTotalSubType = EWR_ROWTOTAL_FOOTER
	CurrentPage.RowAttrs("class") = "ewRptGrandSummary"
	CurrentPage.RenderRow()
End Code
	<tr @Html.Raw(CurrentPage.RowAttributes)><td colspan="@(CurrentPage.GrpFldCount + CurrentPage.DtlFldCount)">@Html.Raw(ReportLanguage.Phrase("RptGrandTotal")) (@Html.Raw(ewr_FormatNumber(CurrentPage.TotCount,0,-2,-2,-2))@Html.Raw(ReportLanguage.Phrase("RptDtlRec")))</td></tr>
	</tfoot>
ElseIf Not CurrentPage.ShowHeader Then ' No header displayed
	@Code
	@Html.Raw("<table cellspacing=""0"" class=""ewGrid""><tr>")
	@Html.Raw("<td class=""ewGridContent"">")
	End Code
	@<!-- Report grid (begin) -->
	@Code
	@Html.Raw("<div class=""ewGridMiddlePanel"">")
	End Code
	@Html.Raw("<table cellspacing=""0"" class=""" & CurrentPage.ReportTableClass & """>")
End If @* No header displayed *@
	@Html.Raw("</table>")
	@Code
	@Html.Raw("</div>")
	End Code
	@If ewr_Empty(CurrentPage.Export) AndAlso Not (CurrentPage.DrillDown AndAlso CurrentPage.TotalGrps > 0) Then
	@<div class="ewGridLowerPanel">
	@RenderPage("aspxrptinc/CanalDenunciaspager.vbhtml")
	</div>
	End If
	@Code
	@Html.Raw("</td>")
	@Html.Raw("</tr></table>")
	End Code
@Code
@:</div> @* id="report_summary" *@
End Code
<!-- Summary Report (End) -->
@If ewr_Empty(CurrentPage.Export) Then
	@:</div></td>
	@<!-- Center Container - Report (End) -->
	@<!-- Right Container (Begin) -->
	@:<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
End If
	<!-- Right slot -->
@If ewr_Empty(CurrentPage.Export) Then
	@:</div></td>
	@<!-- Right Container (End) -->
@:</tr>
@<!-- Bottom Container (Begin) -->
@:<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
End If
	<!-- Bottom slot -->
@If ewr_Empty(CurrentPage.Export) Then
	@:</div></td></tr>
@<!-- Bottom Container (End) -->
@:</table>
@<!-- Table Container (End) -->
End If
@Code
	CurrentPage.ShowPageFooter()
	If EWR_DEBUG_ENABLED Then
		ewr_Write(ewr_DebugMsg())
		ewr_Write(ewr_ElapsedTime(StartTime))
	End If
End Code
@If ewr_Empty(CurrentPage.Export) AndAlso Not CurrentPage.DrillDown Then
@<script type="text/javascript">
// Write your table-specific startup script here
// document.write("page loaded");
</script>
End If
@RenderPage("_footer.vbhtml")
@Code
	CurrentPage.Page_Terminate()
End Code
