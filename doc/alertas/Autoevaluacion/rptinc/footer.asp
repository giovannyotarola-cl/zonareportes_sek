<% If gsExport = "" Then %>
			<!-- right column (end) -->
<%

		' Display elapsed time
		If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_CalcElapsedTime(StartTimer)
%>
		</td></tr>
	</table>
	<!-- content (end) -->
	<!-- footer (begin) --><!-- *** Note: Only licensed users are allowed to remove or change the following copyright statement. *** -->
	<div class="ewFooterRow">
		<div class="ewFooterText">&nbsp;Universidad Internacional SEK Chile</div>
		<!-- Place other links, for example, disclaimer, here -->
	</div>
	<!-- footer (end) -->	
</div>
<% End If %>
<% If gsExport = "" Or gsExport = "print" Or gsExport = "email" Then %>
<script type="text/javascript">
<!--
xGetElementsByClassName(EWRPT_TABLE_CLASS, null, "TABLE", ewrpt_SetupTable); // init the table
//-->
</script>
<% End If %>
</body>
</html>
