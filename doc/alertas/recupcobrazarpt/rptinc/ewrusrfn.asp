<%

' Global user functions
' Filter for 'Last Month' (example)
Function GetLastMonthFilter(FldExpression)
	Dim sVal, sWrk
	sVal = DateAdd("m", -1, Date)
	sVal = Year(sVal) & "|" & Month(sVal)
	sWrk = FldExpression & " BETWEEN " & _
		ewrpt_QuotedValue(ewrpt_DateVal("month", sVal, 1), EWRPT_DATATYPE_DATE) & _
		" AND " & _
		ewrpt_QuotedValue(ewrpt_DateVal("month", sVal, 2), EWRPT_DATATYPE_DATE)
	GetLastMonthFilter = sWrk
End Function

' Filter for 'Starts With A' (example)
Function GetStartsWithAFilter(FldExpression)
	GetStartsWithAFilter = FldExpression & " LIKE 'A%'"
End Function

' Page Loading event
Sub Page_Loading()

	'Response.Write "Page Loading"
End Sub

' Page Unloaded event
Sub Page_Unloaded()

	'Response.Write "Page Unloaded"
End Sub
%>
