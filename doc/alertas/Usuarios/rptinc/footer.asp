<% If gsExport = "" Then %>
			<!-- right column (end) -->
<%

		' Display elapsed time
		If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_CalcElapsedTime(StartTimer)
%>
		</td></tr>
	</table>
</div>
<% End If %>
<% If gsExport = "" Or gsExport = "print" Or gsExport = "email" Then %>
<script type="text/javascript">
<!--
ewrptDom.getElementsByClassName(EWRPT_TABLE_CLASS, "TABLE", null, ewrpt_SetupTable); // init the table
//-->
</script>
<% End If %>
</body>
</html>
