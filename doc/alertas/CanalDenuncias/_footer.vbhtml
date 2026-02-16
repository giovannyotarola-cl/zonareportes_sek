@If Not gbSkipHeaderFooter Then
	If ewr_Empty(gsExport) Then
					@<p>&nbsp;</p>
					@<!-- right column (end) -->
				@:</td>
			@:</tr>
		@:</table>
		@<!-- content (end) -->
		If Not ewr_IsMobile() Then
		End If
		@:</div>
	End If 
End If @* !gbSkipHeaderFooter *@
@If ewr_Empty(gsExport) OrElse gsExport = "print" Then
If ewr_IsMobile() Then
	@:</div>
	@<!-- footer (begin) -->@<!-- *** Note: Only licensed users are allowed to remove or change the following copyright statement. *** -->
	@<!-- *** Remove comment lines to show footer for mobile *** -->
	@*<div data-role="footer">
		<h4>&nbsp;@Html.Raw(ReportLanguage.ProjectPhrase("FooterText"))</h4>
	</div>*@
	@<!-- footer (end) -->	
@:</div>
End If
End If
@If ewr_Empty(gsExport) OrElse gsExport = "print" Then
	If ewr_IsMobile() Then
		@<script type="text/javascript">
		ewr_Select("#ewPageTitle")[0].innerHTML = ewr_Select("#ewPageCaption")[0].innerHTML;
		</script>
			If ewr_NotEmpty(ewr_Get("chart")) Then
		@<script type="text/javascript">
		ewrLang.later(500, null, function() {
			var el = document.getElementById("@ewr_Get("chart")");
			if (el) el.scrollIntoView();
		});
		</script>
			End If
	End If
End If
@If ewr_Empty(gsExport) OrElse gsExport = "print" OrElse gsExport = "email" AndAlso giChartCnt > 0 Then
@<script type="text/javascript">
ewr_Select("table." + EWR_TABLE_CLASSNAME, document, ewr_SetupTable); // Init tables
ewr_Select("table." + EWR_GRID_CLASSNAME, document, ewr_SetupGrid); // Init grids
</script>
End If
@If ewr_Empty(gsExport) Then
If Not gbDrillDownInPanel Then
@<div id="ewrLoadingDiv" style="visibility: hidden;"></div>
@<div id="ewrDrillDownDiv" style="visibility: hidden;"><div class="ft"></div></div>
@<script type="text/javascript">
ewr_InitLoadingPanels(); // Init loading panels / dialogs
</script>
End If
End If
@Html.Raw("</body>")
@Html.Raw("</html>")
