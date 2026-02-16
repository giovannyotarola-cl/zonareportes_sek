<%

' Functions for ASP Report Maker 3.0+
' (C)2006-2009 e.World Technology Ltd.
' Last url
Function LastUrl()
	LastUrl = Request.Cookies(EW_REPORT_PROJECT_NAME)("lasturl")
End Function

' Save last url
Sub SaveLastUrl()
	Dim s, q
	s = Request.ServerVariables("SCRIPT_NAME")
	q = Request.ServerVariables("QUERY_STRING")
	If q <> "" Then s = s & "?" & q
	If LastUrl = s Then s = ""
	Response.Cookies(EW_REPORT_PROJECT_NAME)("lasturl") = s
End Sub

' Auto login
Function AutoLogin()
	Dim sUsr, sPwd
	If Request.Cookies(EW_REPORT_PROJECT_NAME)("autologin") = "autologin" Then
		sUsr = Request.Cookies(EW_REPORT_PROJECT_NAME)("username")
		sPwd = Request.Cookies(EW_REPORT_PROJECT_NAME)("password")
		sPwd = TEAdecrypt(ew_Decode(sPwd), EW_REPORT_RANDOM_KEY)
		AutoLogin = ValidateUser(sUsr, sPwd)
	Else
		AutoLogin = False
	End If
End Function

' Function to validate user
Function ValidateUser(Username, Password)
	ValidateUser = False
End Function

' Advanced User Level Security for ASP Report Maker 3.0+
Dim arUserLevel ' User Level definitions
Dim arUserLevelPriv ' User Level privileges

' Define User Level Variables
Dim ewCurLvl ' Current user level
ewCurLvl = CurrentUserLevel()
Dim ewCurSec

' No user level security
Sub SetUpUserLevel
End Sub

' Get current user privilege
Function CurrentUserLevelPriv(TableName)
	CurrentUserLevelPriv = GetUserLevelPrivEx(TableName, CurrentUserLevel)
End Function

' Get user privilege based on table name and user level
Function GetUserLevelPrivEx(TableName, UserLevel)
	GetUserLevelPrivEx = 0
	If CStr(UserLevel) = "-1" Then ' System Administrator
		GetUserLevelPrivEx = 31
	ElseIf UserLevel >= 0 Then
		If IsArray(arUserLevelPriv) Then
			Dim I
			For I = 0 to UBound(arUserLevelPriv, 2)
				If CStr(arUserLevelPriv(0, I)) = CStr(EW_REPORT_TABLE_PREFIX & TableName) And _
					CStr(arUserLevelPriv(1, I)) = CStr(UserLevel) Then
					GetUserLevelPrivEx = arUserLevelPriv(2, I)
					If IsNull(GetUserLevelPrivEx) Then GetUserLevelPrivEx = 0
					If Not IsNumeric(GetUserLevelPrivEx) Then GetUserLevelPrivEx = 0
					GetUserLevelPrivEx = CLng(GetUserLevelPrivEx)
					Exit For
				End If
			Next
		End If
	End If
End Function

' Get current user level name
Function CurrentUserLevelName
	GetUserLevelName(CurrentUserLevel)
End Function

' Get user level name based on user level
Function GetUserLevelName(UserLevel)
	GetUserLevelName = ""
	If CStr(UserLevel) = "-1" Then
		GetUserLevelName = "Administrator"
	ElseIf UserLevel >= 0 Then
		If IsArray(arUserLevel) Then
			Dim I
			For I = 0 to UBound(arUserLevel, 2)
				If CStr(arUserLevel(0, I)) = CStr(UserLevel) Then
					GetUserLevelName = arUserLevel(1, I)
					Exit For
				End If
			Next
		End If
	End If
End Function

' Sub to display all the User Level settings (for debug only)
Sub ShowUserLevelInfo
	Dim I
	If IsArray(arUserLevel) Then
		Response.Write "User Levels:<br>"
		Response.Write "UserLevelId, UserLevelName<br>"
		For I = 0 To UBound(arUserLevel, 2)
			Response.Write "&nbsp;&nbsp;" & arUserLevel(0, I) & ", " & _
				arUserLevel(1, I) & "<br>"
		Next
	Else
		Response.Write "No User Level definitions." & "<br>"
	End If
	If IsArray(arUserLevelPriv) Then
		Response.Write "User Level Privs:<br>"
		Response.Write "TableName, UserLevelId, UserLevelPriv<br>"
		For I = 0 To UBound(arUserLevelPriv, 2)
			Response.Write "&nbsp;&nbsp;" & arUserLevelPriv(0, I) & ", " & _
				arUserLevelPriv(1, I) & ", " & arUserLevelPriv(2, I) & "<br>"
		Next
	Else
		Response.Write "No User Level privilege settings." & "<br>"
	End If
	Response.Write "CurrentUserLevel = " & CurrentUserLevel & "<br>"
End Sub

' Function to check privilege for List page (for menu items)
Function AllowList(TableName)
	AllowList = CBool(CurrentUserLevelPriv(TableName) And EW_ALLOW_LIST)
End Function

' Get current user name from session
Function CurrentUserName
	CurrentUserName = Session(EW_REPORT_SESSION_USERNAME) & ""
End Function

' Get current user id from session
Function CurrentUserID
	CurrentUserID = CStr(Session(EW_REPORT_SESSION_USERID) & "")
End Function

' Get current parent user id from session
Function CurrentParentUserID
	CurrentParentUserID = Session(EW_REPORT_SESSION_PARENT_USERID) & ""
End Function

' Get current user level from session
Function CurrentUserLevel
	CurrentUserLevel = Session(EW_REPORT_SESSION_USERLEVEL)
End Function

' Check if user is logged in
Function IsLoggedIn
	IsLoggedIn = (Session(EW_REPORT_SESSION_STATUS) = "login")
End Function

' Check if user is system administrator
Function IsSysAdmin
	IsSysAdmin = (Session(EW_REPORT_SESSION_SYSTEM_ADMIN) = 1)
End Function

' Load user level from session
Sub LoadUserLevel
	SetupUserLevel
End Sub

' Check if valid operator
Function ewrpt_IsValidOpr(Opr, FldType)
	ewrpt_IsValidOpr = (Opr = "=" Or Opr = "<" Or Opr = "<=" Or _
		Opr = ">" Or Opr = ">=" Or Opr = "<>")
	If FldType = EW_REPORT_DATATYPE_STRING Then
		ewrpt_IsValidOpr = ewrpt_IsValidOpr Or Opr = "LIKE" Or Opr = "NOT LIKE" Or Opr = "STARTS WITH"
	End If
End Function

' Quoted value for field type
Function ewrpt_QuotedValue(Value, FldType) 
	Select Case FldType
	Case EW_REPORT_DATATYPE_STRING
		ewrpt_QuotedValue = "'" & ewrpt_AdjustSql(Value) & "'"
	Case EW_REPORT_DATATYPE_GUID
		If EW_REPORT_IS_MSACCESS Then
			ewrpt_QuotedValue = "{guid " & ewrpt_AdjustSql(Value) & "}"
		Else
			ewrpt_QuotedValue = "'" & ewrpt_AdjustSql(Value) & "'"
		End If
	Case EW_REPORT_DATATYPE_DATE
		If EW_REPORT_IS_MSACCESS Then
			ewrpt_QuotedValue = "#" & ewrpt_AdjustSql(Value) & "#"
		Else
			ewrpt_QuotedValue = "'" & ewrpt_AdjustSql(Value) & "'"
		End If
	Case Else
		ewrpt_QuotedValue = Value
	End Select
End Function

' Get distinct values
Function ewrpt_GetDistinctValues(FldOpr, sql)
	Dim wrkrs, ar, wrkval, wrkcnt
	ewrpt_GetDistinctValues = ""
	If IsNull(sql) Or sql = "" Then Exit Function
	Set wrkrs = conn.Execute(sql)
	If Not wrkrs.Eof Then
		Redim ar(0)
		wrkcnt = 0
		ar(0) = ewrpt_ConvertValue(FldOpr, ewrpt_GetValue(wrkrs(0)))
		wrkrs.MoveNext
		Do While Not wrkrs.Eof
			wrkval = ewrpt_ConvertValue(FldOpr, ewrpt_GetValue(wrkrs(0)))
			If wrkval <> ar(wrkcnt) Then
				wrkcnt = wrkcnt + 1
				Redim Preserve ar(wrkcnt)
				ar(wrkcnt) = wrkval
			End If
			wrkrs.MoveNext
		Loop
		ewrpt_GetDistinctValues = ar
	End If
	wrkrs.Close
	Set wrkrs = Nothing
End Function

' Get value
Function ewrpt_GetValue(val)
	If IsNull(val) Then
		ewrpt_GetValue = Null
	ElseIf VarType(val) = 14 Then
		ewrpt_GetValue = CDbl(val)
	ElseIf VarType(val) = 18 Or VarType(val) = 19 Then
		ewrpt_GetValue = CLng(val)
	Else
		ewrpt_GetValue = val
	End If
End Function

' Convert value
Function ewrpt_ConvertValue(FldOpr, val)
	If Not EW_REPORT_DEBUG_ENABLED Then On Error Resume Next
	If IsNull(val) Then
		ewrpt_ConvertValue = EW_REPORT_NULL_VALUE
		Exit Function
	ElseIf val = "" Then
		ewrpt_ConvertValue = EW_REPORT_EMPTY_VALUE
		Exit Function
	End If
	ewrpt_ConvertValue = val
	Select Case LCase(FldOpr)
	Case "year": ewrpt_ConvertValue = Year(val)
	Case "quarter": ewrpt_ConvertValue = Year(val) & "|" & DatePart("q", val)
	Case "month": ewrpt_ConvertValue = Year(val) & "|" & Month(val)
	Case "day": ewrpt_ConvertValue = Year(val) & "|" & Month(val) & "|" & Day(val)
	Case "date": ewrpt_ConvertValue = Year(val) & "/" & Month(val) & "/" & Day(val)
	End Select
End Function

' Dropdown display values
Function ewrpt_DropDownDisplayValue(v, t, fmt)
	If Not EW_REPORT_DEBUG_ENABLED Then On Error Resume Next
	Dim ar
	If v = EW_REPORT_NULL_VALUE Then
		ewrpt_DropDownDisplayValue = EW_REPORT_NULL_LABEL
		Exit Function
	ElseIf v = EW_REPORT_EMPTY_VALUE Then
		ewrpt_DropDownDisplayValue = EW_REPORT_EMPTY_LABEL
		Exit Function
	ElseIf LCase(t) = "boolean" Then
		ewrpt_DropDownDisplayValue = ewrpt_BooleanName(v)
		Exit Function
	End If
	ewrpt_DropDownDisplayValue = v
	ar = Split(v&"", "|")
	Select Case LCase(t)
	Case "year"
		ewrpt_DropDownDisplayValue = v
	Case "quarter"
		If UBound(ar) >= 1 Then
			ewrpt_DropDownDisplayValue = ewrpt_QuarterName(ar(1)) & " " & ar(0)
		End If
	Case "month"
		If UBound(ar) >= 1 Then
			ewrpt_DropDownDisplayValue = ewrpt_MonthName(ar(1)) & " " & ar(0)
		End If
	Case "day"
		If UBound(ar) >= 2 Then

			'ewrpt_DropDownDisplayValue = ar(2) & " " & MonthName(ar(1)) & " " & ar(0)
			ewrpt_DropDownDisplayValue = ewrpt_FormatDateTime(CDate(ar(0) & "/" & ar(1) & "/" & ar(2)), fmt)
		End If
	Case "date"
		If IsDate(v) Then
			ewrpt_DropDownDisplayvalue = ewrpt_FormatDateTime(v, fmt)
		End If
	End Select
End Function

' Get Boolean Value
Function ewrpt_BooleanValue(v)
	If LCase(CStr(v)) = "true" Or LCase(Cstr(v)) = "yes" Or LCase(CStr(v)) = "1" Then
		ewrpt_BooleanValue = EW_REPORT_BOOLEAN_YES
	Else
		ewrpt_BooleanValue = EW_REPORT_BOOLEAN_NO
	End If
End Function

' Get Boolean Name
' - Treat "True" / "Yes" / "1" As True
Function ewrpt_BooleanName(v)
	If IsNull(v) Then
		ewrpt_BooleanName = EW_REPORT_NULL_LABEL
	ElseIf LCase(CStr(v)) = "true" Or LCase(Cstr(v)) = "yes" Or LCase(CStr(v)) = "1" Then
		ewrpt_BooleanName = EW_REPORT_BOOLEAN_YES_LABEL
	Else
		ewrpt_BooleanName = EW_REPORT_BOOLEAN_NO_LABEL
	End If
End Function

' Quarter name
Function ewrpt_QuarterName(q)
	Select Case q
		Case 1: ewrpt_QuarterName = EW_REPORT_QUARTER_1
		Case 2: ewrpt_QuarterName = EW_REPORT_QUARTER_2
		Case 3: ewrpt_QuarterName = EW_REPORT_QUARTER_3
		Case 4: ewrpt_QuarterName = EW_REPORT_QUARTER_4
	End Select
End Function

' Month name
Function ewrpt_MonthName(m)
	Select Case m
		Case 1: ewrpt_MonthName = EW_REPORT_MONTH_JAN
		Case 2: ewrpt_MonthName = EW_REPORT_MONTH_FEB
		Case 3: ewrpt_MonthName = EW_REPORT_MONTH_MAR
		Case 4: ewrpt_MonthName = EW_REPORT_MONTH_APR
		Case 5: ewrpt_MonthName = EW_REPORT_MONTH_MAY
		Case 6: ewrpt_MonthName = EW_REPORT_MONTH_JUN
		Case 7: ewrpt_MonthName = EW_REPORT_MONTH_JUL
		Case 8: ewrpt_MonthName = EW_REPORT_MONTH_AUG
		Case 9: ewrpt_MonthName = EW_REPORT_MONTH_SEP
		Case 10: ewrpt_MonthName = EW_REPORT_MONTH_OCT
		Case 11: ewrpt_MonthName = EW_REPORT_MONTH_NOV
		Case 12: ewrpt_MonthName = EW_REPORT_MONTH_DEC
	End Select
End Function

' Join array
Function ewrpt_JoinArray(ar, sep, ft)
	Dim arwrk, i
	If Not IsArray(ar) Then
		ewrpt_JoinArray = ""
		Exit Function
	End If
	arwrk = ar
	For i = 0 to UBound(arwrk)
		arwrk(i) = ewrpt_QuotedValue(arwrk(i), ft)
	Next
	ewrpt_JoinArray = Join(arwrk, sep)
End Function

'-------------------------------------------------------------------------------
' Functions for default date format
' ANamedFormat = 0-8, where 0-4 same as VBScript
' 5 = yyyy/mm/dd format
' 6 = mm/dd/yyyy format
' 7 = dd/mm/yyyy format
' 8 = Short Date & " " & Short Time
' 99 = "yyyy/mm/dd HH:MM:SS" - date for SQL
' (where "/" is project date separator)
Function ewrpt_FormatDateTime(ADate, ANamedFormat)
	If IsDate(ADate) Then
		If ANamedFormat >= 0 And ANamedFormat <= 4 Then
			ewrpt_FormatDateTime = FormatDateTime(ADate, ANamedFormat)
		ElseIf ANamedFormat = 5 Then
			ewrpt_FormatDateTime = Year(ADate) & EW_REPORT_DATE_SEPARATOR & Month(ADate) & EW_REPORT_DATE_SEPARATOR & Day(ADate)
		ElseIf ANamedFormat = 6 Then
			ewrpt_FormatDateTime = Month(ADate) & EW_REPORT_DATE_SEPARATOR & Day(ADate) & EW_REPORT_DATE_SEPARATOR & Year(ADate)
		ElseIf ANamedFormat = 7 Then
			ewrpt_FormatDateTime = Day(ADate) & EW_REPORT_DATE_SEPARATOR & Month(ADate) & EW_REPORT_DATE_SEPARATOR & Year(ADate)
		ElseIf ANamedFormat = 8 Then
			ewrpt_FormatDateTime = FormatDateTime(ADate, 2)
			If Hour(ADate) <> 0 Or Minute(ADate) <> 0 Or Second(ADate) <> 0 Then
				ewrpt_FormatDateTime = ewrpt_FormatDateTime & " " & FormatDateTime(ADate, 4) & ":" & ewrpt_ZeroPad(Second(ADate), 2)
			End If
		ElseIf ANamedFormat = 99 Then
			ewrpt_FormatDateTime = Year(ADate) & "/" & Month(ADate) & "/" & Day(ADate)
			If Hour(ADate) <> 0 Or Minute(ADate) <> 0 Or Second(ADate) <> 0 Then
				ewrpt_FormatDateTime = ewrpt_FormatDateTime & " " & ewrpt_ZeroPad(Hour(ADate), 2) & ":" & ewrpt_ZeroPad(Minute(ADate), 2) & ":" & ewrpt_ZeroPad(Second(ADate), 2)
			End If
		Else
			ewrpt_FormatDateTime = ADate
		End If
	Else
		ewrpt_FormatDateTime = ADate
	End If
End Function

Function ewrpt_UnFormatDateTime(ADate, ANamedFormat)
	Dim arDateTime, arDate
	ADate = Trim(ADate & "")
	While Instr(ADate, "  ") > 0
		ADate = Replace(ADate, "  ", " ")
	Wend
	arDateTime = Split(ADate, " ")
	If UBound(arDateTime) < 0 Then
		ewrpt_UnFormatDateTime = ADate
		Exit Function
	End If
	arDate = Split(arDateTime(0), EW_REPORT_DATE_SEPARATOR)
	If UBound(arDate) = 2 Then
		If ANamedFormat = 6 Then
			ewrpt_UnFormatDateTime = arDate(2) & "/" & arDate(0) & "/" & arDate(1)
		ElseIf ANamedFormat = 7 Then
			ewrpt_UnFormatDateTime = arDate(2) & "/" & arDate(1) & "/" & arDate(0)
		ElseIf ANamedFormat = 5 Then
			ewrpt_UnFormatDateTime = arDate(0) & "/" & arDate(1) & "/" & arDate(2)
		Else
			ewrpt_UnFormatDateTime = arDateTime(0)
		End If
		If UBound(arDateTime) > 0 Then
			If IsDate(arDateTime(1)) Then ' Is time
				ewrpt_UnFormatDateTime = ewrpt_UnFormatDateTime & " " & arDateTime(1)
			End If
		End If
	Else
		ewrpt_UnFormatDateTime = ADate
	End If
End Function

' ViewValue
' - return &nbsp; if empty
Function ewrpt_ViewValue(value)
	If (value&"" <> "") Then
		ewrpt_ViewValue = value
	Else
		ewrpt_ViewValue = "&nbsp;"
	End If
End Function

'-------------------------------------------------------------------------------
' Function to format currency
Function ewrpt_FormatCurrency(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	If IsNumeric(Expression) Then
		ewrpt_FormatCurrency = FormatCurrency(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	Else
		ewrpt_FormatCurrency = Expression
	End If
End Function

'-------------------------------------------------------------------------------
' Function to format number
Function ewrpt_FormatNumber(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	If IsNumeric(Expression) Then
		ewrpt_FormatNumber = FormatNumber(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	Else
		ewrpt_FormatNumber = Expression
	End If
End Function

'-------------------------------------------------------------------------------
' Function to format percent
Function ewrpt_FormatPercent(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	On Error Resume Next
	If IsNumeric(Expression) Then
		ewrpt_FormatPercent = FormatPercent(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
		If Err.Number <> 0 Then
			ewrpt_FormatPercent = FormatNumber(Expression*100, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits) & "%"
		End If
	Else
		ewrpt_FormatPercent = Expression
	End If
End Function

'-------------------------------------------------------------------------------
' Function to Adjust SQL
Function ewrpt_AdjustSql(str)
	Dim sWrk
	sWrk = Trim(str & "")
	sWrk = Replace(sWrk, "'", "''") ' Adjust for Single Quote
	If EW_REPORT_DB_START_QUOTE = "[" Then
		sWrk = Replace(sWrk, "[", "[[]") ' Adjust for Open Square Bracket
	End If
	ewrpt_AdjustSql = sWrk
End Function

'-------------------------------------------------------------------------------
' Function to Build Report SQL
Function ewrpt_BuildReportSql(sSelect, sWhere, sGroupBy, sHaving, sOrderBy, sFilter, sSort)
	Dim sSql, sDbWhere, sDbOrderBy
	sDbWhere = sWhere
	If sDbWhere <> "" Then
		sDbWhere = "(" & sDbWhere & ")"
	End If
	If sFilter <> "" Then
		If sDbWhere <> "" Then sDbWhere = sDbWhere & " AND "
		sDbWhere = sDbWhere & "(" & sFilter & ")"
	End If	
	sDbOrderBy = sOrderBy
	sDbOrderBy = ewrpt_UpdateSortFields(sOrderBy, sSort, 1)
	sSql = sSelect
	If sDbWhere <> "" Then sSql = sSql & " WHERE " & sDbWhere
	If sGroupBy <> "" Then sSql = sSql & " GROUP BY " & sGroupBy
	If sHaving <> "" Then sSql = sSql & " HAVING " & sHaving
	If sDbOrderBy <> "" Then sSql = sSql & " ORDER BY " & sDbOrderBy
	ewrpt_BuildReportSql = sSql
End Function

' Update sort fields
' opt = 1, merge all sort fields
' opt = 2, merge sOrderBy fields only
Function ewrpt_UpdateSortFields(sOrderBy, sSort, opt)
	If sOrderBy = "" Then
		If opt = 1 Then
			ewrpt_UpdateSortFields = sSort
		Else
			ewrpt_UpdateSortFields = ""
		End If
		Exit Function
	ElseIf sSort = "" Then
		ewrpt_UpdateSortFields = sOrderBy
		Exit Function
	Else

		' Merge sort field list
		Dim arorderby, arsort, i, j, sortfld, orderfld
		arorderby = ewrpt_GetSortFlds(sOrderBy)
		arsort = ewrpt_GetSortFlds(sSort)
		For i = 0 to UBound(arsort)

			' Get sort field
			sortfld = Trim(arsort(i))
			If UCase(Right(sortfld,4)) = " ASC" Then
				sortfld = Trim(Mid(sortfld,1,Len(sortfld)-4))
			ElseIf UCase(Right(sortfld,5)) = " DESC" Then
				sortfld = Trim(MId(sortfld,1,Len(sortfld)-5))
			End If
			For j = 0 to UBound(arorderby)

				' Get orderby field
				orderfld = Trim(arorderby(j))
				If UCase(Right(orderfld,4)) = " ASC" Then
					orderfld = Trim(Mid(orderfld,1,Len(orderfld)-4))
				ElseIf UCase(Right(orderfld,5)) = " DESC" Then
					orderfld = Trim(Mid(orderfld,1,Len(orderfld)-5))
				End If

				' Replace field
				If orderfld = sortfld Then
					arorderby(j) = arsort(i)
					Exit For
				End If
			Next

			' Append field
			If opt = 1 Then
				If orderfld <> sortfld Then
					ReDim Preserve arorderby(UBound(arorderby)+1)
					arorderby(UBound(arorderby)) = arsort(i)
				End If
			End If
		Next
		ewrpt_UpdateSortFields = Join(arorderby, ", ")
	End If
End Function

' Get sort fields
Function ewrpt_GetSortFlds(flds)
	Dim offset, fldpos, ar, orderfld
	fldpos = 1
	offset = InStr(1,flds,",",vbTextCompare)
	Do While (offset > 0)
		orderfld = Mid(flds,fldpos,offset-fldpos)
		If UCase(Right(orderfld,4)) = " ASC" Or UCase(Right(orderfld,5)) = " DESC" Then
			fldpos = offset+1
			If IsArray(ar) Then
				ReDim Preserve ar(UBound(ar)+1)
			Else
				ReDim ar(0)
			End If
			ar(UBound(ar)) = orderfld
		End If
		offset = InStr(offset+1,flds,",",vbTextCompare)
	Loop
	If IsArray(ar) Then
		ReDim Preserve ar(UBound(ar)+1)
	Else
		ReDim ar(0)
	End If
	ar(UBound(ar)) = Mid(flds,fldpos)
	ewrpt_GetSortFlds = ar
End Function

' Get reverse sort
Function ewrpt_ReverseSort(sorttype)
	If sorttype = "ASC" Then
		ewrpt_ReverseSort = "DESC"
	Else
		ewrpt_ReverseSort = "ASC"
	End If
End Function

'-------------------------------------------------------------------------------
' Function to Load Recordset based on Sql
Function ewrpt_LoadRs(sSql)
	On Error Resume Next
	Dim rs
	Err.Clear
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.CursorLocation = EW_REPORT_CURSOR_LOCATION
	rs.Open sSql, conn, 3, 1, 1 ' adOpenStatic, adLockReadOnly, adCmdText
	If Err.Number = 0 Then
		Set ewrpt_LoadRs = rs
		Set rs = Nothing
	Else
		Response.Write "ewrpt_LoadRs SQL Error: " & Err.Description & "<br>Problem SQL: " & sSql & "<br>"
	End If
End Function

'-------------------------------------------------------------------------------
' Function to Load Record Count based on Sql
Function ewrpt_LoadRecordCount(sSql)
	On Error Resume Next
	Dim rs
	Err.Clear
	Set rs = conn.Execute("SELECT COUNT(*) FROM (" & sSql & ") AS EWRPT_TEMP_TABLE")
	If Err.Number = 0 Then
		ewrpt_LoadRecordCount = ewrpt_GetValue(rs(0))
		Set rs = Nothing
	Else
		Err.Clear
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.CursorLocation = EW_REPORT_CURSOR_LOCATION
		rs.Open sSql, conn, 3, 1, 1 ' adOpenStatic, adLockReadOnly, adCmdText
		If Err.Number = 0 Then
			ewrpt_LoadRecordCount = rs.RecordCount
			Set rs = Nothing
		Else
			Response.Write "ewrpt_LoadRecordCount SQL Error: " & Err.Description & "<br>Problem SQL: " & sSql & "<br>"
		End If
	End If
End Function

'-------------------------------------------------------------------------------
' Function to Construct a crosstab field name
Function ewrpt_CrossTabField(smrytype, smryfld, colfld, datetype, val, qc, alias)
	Dim wrkval, wrkqc, fld
	If val = EW_REPORT_NULL_VALUE Then
		wrkval = "NULL": wrkqc = ""
	ElseIf val = EW_REPORT_EMPTY_VALUE Then
		wrkval = "": wrkqc = qc
	Else
		wrkval = val: wrkqc = qc
	End If
	Select Case smrytype
	Case "SUM"
		fld = smrytype & "(" & smryfld & "*" & _
			ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
	Case "COUNT"
		fld = "SUM(" & _
			ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
	Case "MIN","MAX"
		Dim aggwrk
		aggwrk = ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc)
		If EW_REPORT_IS_MSACCESS Then
			fld = smrytype & "(IIf(" & aggwrk & "=0,NULL," & smryfld & "))"
		ElseIf EW_REPORT_IS_MSSQL Or EW_REPORT_IS_ORACLE Then
			fld = smrytype & "(CASE " & aggwrk & " WHEN 0 THEN NULL ELSE " & smryfld & " END)"
		ElseIf EW_REPORT_IS_MYSQL Then
			fld = smrytype & "(IF(" & aggwrk & "=0,NULL," & smryfld & "))"
		End If
	Case "AVG"
		Dim sumwrk, cntwrk
		sumwrk = "SUM(" & smryfld & "*" & _
			ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
		cntwrk = "SUM(" &_
			ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
		If alias <> "" Then
			sumwrk = sumwrk & " AS SUM_" & alias
			cntwrk = cntwrk & " AS CNT_" & alias
		End If
		ewrpt_CrossTabField = sumwrk & ", " & cntwrk
		Exit Function
	End Select
	If alias <> "" Then fld = fld & " AS " & alias
	ewrpt_CrossTabField = fld
End Function

'-------------------------------------------------------------------------------
' Function to construct SQL Distinct factor
' - ACCESS
' y: IIf(Year(FieldName)=1996,1,0)
' q: IIf(DatePart(""q"",FieldName,1,0)=1,1,0))
' m: (IIf(DatePart(""m"",FieldName,1,0)=1,1,0)))
' others: (IIf(FieldName=val,1,0)))
' - MS SQL
' y: (1-ABS(SIGN(Year(FieldName)-1996)))
' q: (1-ABS(SIGN(DatePart(q,FieldName)-1)))
' m: (1-ABS(SIGN(DatePart(m,FieldName)-1)))
' d: (CASE Convert(VarChar(10),FieldName,111) WHEN '1996/1/1' THEN 1 ELSE 0 END)
' - MySQL
' y: IF(YEAR(`OrderDate`)=1996,1,0))
' q: IF(QUARTER(`OrderDate`)=1,1,0))
' m: IF(MONTH(`OrderDate`)=1,1,0))
' - Oracle
Function ewrpt_SQLDistinctFactor(sFld, dateType, val, qc)

	' ACCESS
	If EW_REPORT_IS_MSACCESS Then
		If dateType = "y" Then
			ewrpt_SQLDistinctFactor = "IIf(Year(" & sFld & ")=" & val & ",1,0)"
		ElseIf dateType = "q" Or dateType = "m" Then
			ewrpt_SQLDistinctFactor = "IIf(DatePart(""" & dateType & """," & sFld & ")=" & val & ",1,0)"
		Else
			If val = "NULL" Then
				ewrpt_SQLDistinctFactor = "IIf(" & sFld & " IS NULL,1,0)"
			Else
				ewrpt_SQLDistinctFactor = "IIf(" & sFld & "=" & qc & ewrpt_AdjustSql(val) & qc & ",1,0)"
			End If
		End If

	' MS SQL
	ElseIf EW_REPORT_IS_MSSQL Then
		If dateType = "y" Then
			ewrpt_SQLDistinctFactor = "(1-ABS(SIGN(Year(" & sFld & ")-" & val & ")))"
		ElseIf dateType = "q" Or dateType = "m" Then
			ewrpt_SQLDistinctFactor = "(1-ABS(SIGN(DatePart(" & dateType & "," & sFld & ")-" & val & ")))"
		ElseIf dateType = "d" Then
			ewrpt_SQLDistinctFactor = "(CASE Convert(VarChar(10)," & sFld & ",111) WHEN " & qc & ewrpt_AdjustSql(val) & qc & " THEN 1 ELSE 0 END)"
		ElseIf dateType = "dt" Then
			ewrpt_SQLDistinctFactor = "(CASE Convert(VarChar(10)," & sFld & ",120) WHEN " & qc & ewrpt_AdjustSql(val) & qc & " THEN 1 ELSE 0 END)"
		Else
			If val = "NULL" Then
				ewrpt_SQLDistinctFactor = "(CASE WHEN " & sFld & " IS NULL THEN 1 ELSE 0 END)"
			Else
				ewrpt_SQLDistinctFactor = "(CASE " & sFld & " WHEN " & qc & ewrpt_AdjustSql(val) & qc & " THEN 1 ELSE 0 END)"
			End If
		End If

	' MySQL
	ElseIf EW_REPORT_IS_MYSQL Then
		If dateType = "y" Then
			ewrpt_SQLDistinctFactor = "IF(YEAR(" & sFld & ")=" & val & ",1,0)"
		ElseIf dateType = "q" Then
			ewrpt_SQLDistinctFactor = "IF(QUARTER(" & sFld & ")=" & val & ",1,0)"
		ElseIf dateType = "m" Then
			ewrpt_SQLDistinctFactor = "IF(MONTH(" & sFld & ")=" & val & ",1,0)"
		Else
			If val = "NULL" Then
				ewrpt_SQLDistinctFactor = "IF(" & sFld & " IS NULL,1,0)"
			Else
				ewrpt_SQLDistinctFactor = "IF(" & sFld & "=" & qc & ewrpt_AdjustSql(val) & qc & ",1,0)"
			End If
		End If

	' Oracle
	ElseIf EW_REPORT_IS_ORACLE Then
		If dateType = "y" Then
			ewrpt_SQLDistinctFactor = "DECODE(TO_CHAR(" & sFld & ",'YYYY'),'" & val & "',1,0)"
		ElseIf dateType = "q" Then
			ewrpt_SQLDistinctFactor = "DECODE(TO_CHAR(" & sFld & ",'Q'),'" & val & "',1,0)"
		ElseIf dateType = "m" Then
			ewrpt_SQLDistinctFactor = "DECODE(TO_CHAR(" & sFld & ",'MM'),LPAD('" & val & "',2,'0'),1,0)"
		ElseIf dateType = "d" Then
			ewrpt_SQLDistinctFactor = "DECODE(" & sFld & ",TO_DATE(" & qc & ewrpt_AdjustSql(val) & qc & ",'YYYY/MM/DD'),1,0)"
		ElseIf dateType = "dt" Then
			ewrpt_SQLDistinctFactor = "DECODE(" & sFld & ",TO_DATE(" & qc & ewrpt_AdjustSql(val) & qc & ",'YYYY/MM/DD HH24:MI:SS'),1,0)"
		Else
			If val = "NULL" Then
				ewrpt_SQLDistinctFactor = "(CASE WHEN " & sFld & " IS NULL THEN 1 ELSE 0 END)"
			Else
				ewrpt_SQLDistinctFactor = "DECODE(" & sFld & "," & qc & ewrpt_AdjustSql(val) & qc & ",1,0)"
			End If
		End If
	End If
End Function

'-------------------------------------------------------------------------------
' Function to evaluate summary value
'
Function ewrpt_SummaryValue(val1, val2, ityp)
	Select Case ityp
	Case "SUM", "COUNT", "AVG"
		If IsNull(val2) Or Not IsNumeric(val2) Then
			ewrpt_SummaryValue = val1
		Else
			ewrpt_SummaryValue = val1 + val2
		End if
	Case "MIN"
		If IsNull(val2) Or Not IsNumeric(val2) Then
			ewrpt_SummaryValue = val1 ' Skip null and non-numeric
		ElseIf IsNull(val1) Then
			ewrpt_SummaryValue = val2 ' Initialize for first valid value
		ElseIf val1 < val2 Then
			ewrpt_SummaryValue = val1
		Else
			ewrpt_SummaryValue = val2
		End If
	Case "MAX"
		If IsNull(val2) Or Not IsNumeric(val2) Then
			ewrpt_SummaryValue = val1 ' Skip null and non-numeric
		ElseIf IsNull(val1) Then
			ewrpt_SummaryValue = val2 ' Initialize for first valid value
		ElseIf val1 > val2 Then
			ewrpt_SummaryValue = val1
		Else
			ewrpt_SummaryValue = val2
		End If
	End Select
End Function

' Match filter value
Function ewrpt_MatchedFilterValue(ar, value)
	If Not IsArray(ar) Then
		ewrpt_MatchedFilterValue = (ar&"" = value&"")
	Else
		Dim i
		For i = 0 to UBound(ar)
			If ar(i)&"" = value&"" Then
				ewrpt_MatchedFilterValue = True
				Exit Function
			End If
		Next
		ewrpt_MatchedFilterValue = False
	End If
End Function

' Render repeat column table
' rowcnt - zero based row count
Function ewrpt_RepeatColumnTable(totcnt, rowcnt, repeatcnt, rendertype)
	Dim sWrk, i
	sWrk = ""

	' Render control start
	If rendertype = 1 Then
		If rowcnt = 0 Then sWrk = sWrk & "<table class=""" & EW_REPORT_ITEM_TABLE_CLASSNAME & """>"
		If (rowcnt mod repeatcnt = 0) Then sWrk = sWrk & "<tr>"
		sWrk = sWrk & "<td>"

	' Render control end
	ElseIf rendertype = 2 Then
		sWrk = sWrk & "</td>"
		If (rowcnt mod repeatcnt = repeatcnt-1) Then
			sWrk = sWrk & "</tr>"
		ElseIf rowcnt = totcnt-1 Then
			For i = ((rowcnt mod repeatcnt) + 1) to repeatcnt - 1
				sWrk = sWrk & "<td>&nbsp;</td>"
			Next
			sWrk = sWrk & "</tr>"
		End If
		If rowcnt = totcnt-1 Then sWrk = sWrk & "</table>"
	End If
	ewrpt_RepeatColumnTable = sWrk
End Function

'-------------------------------------------------------------------------------
' Function to check if the value is selected
' sName: popup name
' value: supplied value
Function ewrpt_IsSelectedValue(ar, value, ft)
	If Not IsArray(ar) Then ewrpt_IsSelectedValue = True: Exit Function
	For i = 0 To Ubound(ar)
		If Left(value,2) = "@@" Or Left(ar(i),2) = "@@" Then ' advanced filters
			If ar(i) = value Then
				ewrpt_IsSelectedValue = True
				Exit Function
			End If
		ElseIf ewrpt_CompareValue(ar(i), value, ft) Then
			ewrpt_IsSelectedValue = True
			Exit Function
		End If
	Next
	ewrpt_IsSelectedValue = False
End Function

'-------------------------------------------------------------------------------
' Function to set up distinct values
' ar: array for distinct values
' val: value
' label: display value
' dup: check duplicate
Sub ewrpt_SetupDistinctValues(ar, val, label, dup)
	Dim pos, i
	If dup Then ' check duplicate
		If IsArray(ar) Then
			For i = 0 to UBound(ar,2)
				If ar(0,i) = val Then Exit Sub
			Next
		End If
	End If
	If Not IsArray(ar) Then
		Redim ar(1,0): pos = 0
	ElseIf val = EW_REPORT_EMPTY_VALUE Or val = EW_REPORT_NULL_VALUE Then ' null/empty
		pos = 0 ' insert at top
		Redim Preserve ar(1, UBound(ar,2)+1)
		For i = UBound(ar,2) to 1 Step -1
			ar(0,i) = ar(0,i-1): ar(1,i) = ar(1,i-1)
		Next
	Else
		pos = UBound(ar,2)+1 ' default insert at end
		Redim Preserve ar(1, pos)
	End If
	ar(0,pos) = val: ar(1,pos) = label
End Sub

'-------------------------------------------------------------------------------
' Function to compare values based on field type
Function ewrpt_CompareValue(v1, v2, ft)
	On Error Resume Next
	Select Case ft

	' Case adBigInt, adInteger, adSmallInt, adTinyInt, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt
	Case 20, 3, 2, 16, 17, 18, 19, 21
		If IsNumeric(v1) And IsNumeric(v2) Then
			ewrpt_CompareValue = (CLng(v1) = CLng(v2))
			Exit Function
		End If

	' Case adSingle, adDouble, adNumeric, adCurrency
	Case 4, 5, 131, 6
		If IsNumeric(v1) And IsNumeric(v2) Then
			ewrpt_CompareValue = (CDbl(v1) = CDbl(v2))
			Exit Function
		End If

	' Case adDate, adDBDate, adDBTime, adDBTimeStamp
	Case 7, 133, 134, 135
		If IsDate(v1) And IsDate(v2) Then
			ewrpt_CompareValue = (CDate(v1) = CDate(v2))
			Exit Function
		End If

	' Case adBoolean
	Case 11
		ewrpt_CompareValue = (CBool(v1) = CBool(v2))
		Exit Function
	End Select
	ewrpt_CompareValue = (CStr(v1&"") = CStr(v2&"")) ' treat as string
End Function

' "Past"
Function ewrpt_IsPast()
	ewrpt_IsPast = "(@@fld@@ < " & ewrpt_FormatDateTimeSql(Now) & ")"
End Function

' "Future"
Function ewrpt_IsFuture()
	ewrpt_IsFuture = "(@@fld@@ > " & ewrpt_FormatDateTimeSql(Now) & ")"
End Function

' "Last 30 days"
Function ewrpt_IsLast30Days()
	Dim dt1, dt2
	dt1 = DateAdd("d", -29, Date)
	dt2 = DateAdd("d", 1, Date)
	ewrpt_IsLast30Days = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Last 14 days"
Function ewrpt_IsLast14Days()
	Dim dt1, dt2
	dt1 = DateAdd("d", -13, Date)
	dt2 = DateAdd("d", 1, Date)
	ewrpt_IsLast14Days = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Last 7 days"
Function ewrpt_IsLast7Days()
	Dim dt1, dt2
	dt1 = DateAdd("d", -6, Date)
	dt2 = DateAdd("d", 1, Date)
	ewrpt_IsLast7Days = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Next 30 days"
Function ewrpt_IsNext30Days()
	Dim dt1, dt2
	dt1 = Date
	dt2 = DateAdd("d", 30, Date)
	ewrpt_IsNext30Days = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Next 14 days"
Function ewrpt_IsNext14Days()
	Dim dt1, dt2
	dt1 = Date
	dt2 = DateAdd("d", 14, Date)
	ewrpt_IsNext14Days = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Next 7 days"
Function ewrpt_IsNext7Days()
	Dim dt1, dt2
	dt1 = Date
	dt2 = DateAdd("d", 7, Date)
	ewrpt_IsNext7Days = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Yesterday"
Function ewrpt_IsYesterday()
	Dim dt1, dt2
	dt1 = DateAdd("d", -1, Date)
	dt2 = Date
	ewrpt_IsYesterday = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Today"
Function ewrpt_IsToday()
	Dim dt1, dt2
	dt1 = Date
	dt2 = DateAdd("d", 1, Date)
	ewrpt_IsToday = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Tomorrow"
Function ewrpt_IsTomorrow()
	Dim dt1, dt2
	dt1 = DateAdd("d", 1, Date)
	dt2 = DateAdd("d", 2, Date)
	ewrpt_IsTomorrow = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Last month"
Function ewrpt_IsLastMonth()
	Dim dt1, dt2
	dt1 = DateAdd("m", -1, Date)
	dt1 = CDate(Year(dt1)&"/"&Month(dt1)&"/01")
	dt2 = Date
	dt2 = CDate(Year(dt2)&"/"&Month(dt2)&"/01")
	ewrpt_IsLastMonth = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "This month"
Function ewrpt_IsThisMonth()
	Dim dt1, dt2
	dt1 = Date
	dt1 = CDate(Year(dt1)&"/"&Month(dt1)&"/01")
	dt2 = DateAdd("m", 1, Date)
	dt2 = CDate(Year(dt2)&"/"&Month(dt2)&"/01")
	ewrpt_IsThisMonth = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Next month"
Function ewrpt_IsNextMonth()
	Dim dt1, dt2
	dt1 = DateAdd("m", 1, Date)
	dt1 = CDate(Year(dt1)&"/"&Month(dt1)&"/01")
	dt2 = DateAdd("m", 2, Date)
	dt2 = CDate(Year(dt2)&"/"&Month(dt2)&"/01")
	ewrpt_IsNextMonth = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Last two weeks"
Function ewrpt_IsLast2Weeks()
	Dim dt1, dt2
	dt1 = DateAdd("d", -14-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 0-Weekday(Date)+1, Date)
	ewrpt_IsLast2Weeks = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Last week"
Function ewrpt_IsLastWeek()
	Dim dt1, dt2
	dt1 = DateAdd("d", -7-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 0-Weekday(Date)+1, Date)
	ewrpt_IsLastWeek = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "This week"
Function ewrpt_IsThisWeek()
	Dim dt1, dt2
	dt1 = DateAdd("d", 0-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 7-Weekday(Date)+1, Date)
	ewrpt_IsThisWeek = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Next week"
Function ewrpt_IsNextWeek()
	Dim dt1, dt2
	dt1 = DateAdd("d", 7-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 14-Weekday(Date)+1, Date)
	ewrpt_IsNextWeek = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Next two week"
Function ewrpt_IsNext2Weeks()
	Dim dt1, dt2
	dt1 = DateAdd("d", 7-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 21-Weekday(Date)+1, Date)
	ewrpt_IsNext2Weeks = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Last year"
Function ewrpt_IsLastYear()
	Dim dt1, dt2
	dt1 = DateAdd("yyyy", -1, Date)
	dt1 = CDate(Year(dt1)&"/01/01")
	dt2 = Date
	dt2 = CDate(Year(dt2)&"/01/01")
	ewrpt_IsLastYear = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "This year"
Function ewrpt_IsThisYear()
	Dim dt1, dt2
	dt1 = Date
	dt1 = CDate(Year(dt1)&"/01/01")
	dt2 = DateAdd("yyyy", 1, Date)
	dt2 = CDate(Year(dt2)&"/01/01")
	ewrpt_IsThisYear = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' "Next year"
Function ewrpt_IsNextYear()
	Dim dt1, dt2
	dt1 = DateAdd("yyyy", 1, Date)
	dt1 = CDate(Year(dt1)&"/01/01")
	dt2 = DateAdd("yyyy", 2, Date)
	dt2 = CDate(Year(dt2)&"/01/01")
	ewrpt_IsNextYear = "(@@fld@@ >= " & ewrpt_FormatDateSql(dt1) & " AND @@fld@@ < " & ewrpt_FormatDateSql(dt2) & ")"
End Function

' Format date for SQL
Function ewrpt_FormatDateSql(dt)
	Dim sWrk
	sWrk = Year(dt) & "/" & Month(dt) & "/" & Day(dt)
	If EW_REPORT_IS_MSACCESS Then
		sWrk = "#" & sWrk & "#"
	Else
		sWrk = "'" & sWrk & "'"
	End If
	ewrpt_FormatDateSql = sWrk
End Function

' Format datetime for SQL
Function ewrpt_FormatDateTimeSql(dt)
	Dim sWrk
	sWrk = Year(dt) & "/" & Month(dt) & "/" & Day(dt) & " " & Hour(dt) & ":" & Minute(dt) & ":" & Second(dt)
	If EW_REPORT_IS_MSACCESS Then
		sWrk = "#" & sWrk & "#"
	Else
		sWrk = "'" & sWrk & "'"
	End If
	ewrpt_FormatDateTimeSql = sWrk
End Function

'-------------------------------------------------------------------------------
' Function to set up distinct values from advanced filter
Sub ewrpt_SetupDistinctValuesFromFilter(ar, af)
	Dim i, val, label
	If IsArray(af) Then
		For i = 0 to UBound(af,2)
			val = af(0,i)
			label = af(1,i)
			Call ewrpt_SetupDistinctValues(ar, val, label, False)
		Next
	End If
End Sub

'-------------------------------------------------------------------------------
' Function to get group value
' - Get the group value based on field type, group type and interval
' - ft: field type
' * 1: numeric, 2: date, 3: string
' - gt: group type
' * numeric: i = interval, n = normal
' * date: d = Day, w = Week, m = Month, q = Quarter, y = Year
' * string: f = first nth character, n = normal
' - intv: interval
Function ewrpt_GroupValue(val, ft, grp, intv)
	Dim ww, q, wrkIntv
	Select Case ft

	' Case adBigInt, adInteger, adSmallInt, adTinyInt, adSingle, adDouble, adNumeric, adCurrency, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt ' numeric
	Case 20, 3, 2, 16, 4, 5, 131, 6, 17, 18, 19, 21 ' numeric
		If Not IsNumeric(val) Then
			ewrpt_GroupVal = val
			Exit Function
		End If
		wrkIntv = CInt(intv)
		If wrkIntv <= 0 Then wrkIntv = 10
		Select Case grp
			Case "i": ewrpt_GroupValue = Int(val/wrkIntv)
			Case Else: ewrpt_GroupValue = val
		End Select

	' Case adDate, adDBDate, adDBTime, adDBTimeStamp ' date
	Case 7, 133, 134, 135 ' date
		If Not IsDate(val) Then
			ewrpt_GroupValue = val
			Exit Function
		End If
		Select Case grp
		Case "y": ewrpt_GroupValue = Year(val)
		Case "q": q = DatePart("q", val): ewrpt_GroupValue = Year(val)& "|" & q
		Case "m": ewrpt_GroupValue = Year(val) & "|" & ewrpt_ZeroPad(Month(val), 2)
		Case "w": ww = DatePart("ww", val): ewrpt_GroupValue = Year(val) & "|" & ewrpt_ZeroPad(ww, 2)
		Case "d": ewrpt_GroupValue = Year(val) & "|" & ewrpt_ZeroPad(Month(val), 2) & "|" & ewrpt_ZeroPad(Day(val), 2)
		Case "h": ewrpt_GroupValue = Hour(val)
		Case "min": ewrpt_GroupValue = Minute(val)
		Case Else: ewrpt_GroupValue = val
		End Select

	' Case adLongVarChar, adLongVarWChar, adChar, adWChar, adVarChar, adVarWChar ' string
	Case 201, 203, 129, 130, 200, 202 ' string
		wrkIntv = CInt(intv)
		If wrkIntv <= 0 Then wrkIntv = 1
		Select Case grp
			Case "f": ewrpt_GroupValue = Mid(val, 1, wrkIntv)
			Case Else: ewrpt_GroupValue = val
		End Select
	Case Else
		ewrpt_GroupValue = val ' ignore
	End Select
End Function

'-------------------------------------------------------------------------------
' Functions to display group value
Function ewrpt_DisplayGroupValue(val, ft, grp, intv)
	Dim ar, wrkIntv
	If IsNull(val) Then
			ewrpt_DisplayGroupValue = val
			Exit Function
	End If
	Select Case ft

	' Case adBigInt, adInteger, adSmallInt, adTinyInt, adSingle, adDouble, adNumeric, adCurrency, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt ' numeric
	Case 20, 3, 2, 16, 4, 5, 131, 6, 17, 18, 19, 21 ' numeric
		wrkIntv = CInt(intv)
		If wrkIntv <= 0 Then wrkIntv = 10
		Select Case grp
		Case "i": ewrpt_DisplayGroupValue = CStr(val*wrkIntv) & " - " & CStr((val+1)*wrkIntv)
		Case Else: ewrpt_DisplayGroupValue = val
		End Select

	' Case adDate, adDBDate, adDBTime, adDBTimeStamp ' date
	Case 7, 133, 134, 135 ' date
		ar = Split(val, "|")
		Select Case grp
		Case "y": ewrpt_DisplayGroupValue = ar(0)
		Case "q": ewrpt_DisplayGroupValue = ewrpt_FormatQuarter(ar(0), ar(1))
		Case "m": ewrpt_DisplayGroupValue = ewrpt_FormatMonth(ar(0), ar(1))
		Case "w": ewrpt_DisplayGroupValue = ewrpt_FormatWeek(ar(0), ar(1))
		Case "d": ewrpt_DisplayGroupValue = ewrpt_FormatDay(ar(0), ar(1), ar(2))
		Case "h": ewrpt_DisplayGroupValue = ewrpt_FormatHour(ar(0))
		Case "min": ewrpt_DisplayGroupValue = ewrpt_FormatMinute(ar(0))
		Case Else: ewrpt_DisplayGroupValue = val
		End Select

	' Case adLongVarChar, adLongVarWChar, adChar, adWChar, adVarChar, adVarWChar ' string
	Case 201, 203, 129, 130, 200, 202 ' string
		ewrpt_DisplayGroupValue = val
	Case Else
		ewrpt_DisplayGroupValue = val ' ignore
	End Select
End Function

Function ewrpt_FormatQuarter(y, q)
	ewrpt_FormatQuarter = "Q" & q & "/" & y
End Function

Function ewrpt_FormatMonth(y, m)
	ewrpt_FormatMonth = m & "/" & y
End Function

Function ewrpt_FormatWeek(y, w)
	ewrpt_FormatWeek = "WK" & w & "/" & y
End Function

Function ewrpt_FormatDay(y, m, d)
	ewrpt_FormatDay = y & "/" & m & "/" & d
End Function

Function ewrpt_FormatHour(h)
	If CInt(h) = 0 Then
		ewrpt_FormatHour = "12 AM"
	ElseIf CInt(h) < 12 Then
		ewrpt_FormatHour = h & " AM"
	ElseIf CInt(h) = 12 Then
		ewrpt_FormatHour = "12 PM"
	Else
		ewrpt_FormatHour = (h-12) & " PM"
	End If
End Function

Function ewrpt_FormatMinute(n)
	ewrpt_FormatMinute = n & " MIN"
End Function

'-------------------------------------------------------------------------------
' Function to pad zeros before number
' - m: number
' - t: length
Function ewrpt_ZeroPad(m, t)
  ewrpt_ZeroPad = String(t - Len(m), "0") & m
End Function

' IIf function
Function ewrpt_IIf(cond, v1, v2)
	On Error Resume Next
	If CBool(cond) Then
		ewrpt_IIf = v1
	Else
		ewrpt_IIf = v2
	End If
End Function

'-------------------------------------------------------------------------------
' Function to get Js data in the form of:
' [value1, text1, selected], [value2, text2, selected], ...
' - value1: "value 1", text1: "text 1": selected: true|false
' name: popup name
' list: comma separated list
Function ewrpt_GetJsData(arv, ars, ft)
	Dim i
	Dim value, jsselect, bSelected
	Dim jsdata: jsdata = ""
	If IsArray(arv) Then
		For i = 0 to UBound(arv,2)
			value = arv(0,i)
			If ft = 11 Then ' Boolean
				If value = EW_REPORT_NULL_VALUE Then
					label = EW_REPORT_NULL_LABEL
				Else
					value = ewrpt_BooleanValue(value)
					label = ewrpt_BooleanName(value)
				End If
			Else
				label = arv(1,i)
			End If
			bSelected = ewrpt_IsSelectedValue(ars, value, ft)
			If bSelected Then
				jsselect = "true"
			Else
				jsselect = "false"
			End If
			If jsdata <> "" Then jsdata = jsdata & ", "
			jsdata = jsdata & "[""" & ewrpt_EscapeJs(value) & """, """ & ewrpt_EscapeJs(label) & """, " & jsselect & "]"
		Next
	End If
	ewrpt_GetJsData = jsdata
End Function

'-------------------------------------------------------------------------------
' Function to check if selected value
Function ewrpt_SelectedValue(ar, val, ft, af)
	Dim i
	If Not IsArray(ar) Then
		ewrpt_SelectedValue = True
		Exit Function
	Else
		For i = 0 to UBound(ar)
			If ar(i) = EW_REPORT_EMPTY_VALUE And val = "" Then ' empty string
				ewrpt_SelectedValue = True
				Exit Function
			ElseIf ar(i) = EW_REPORT_NULL_VALUE And IsNull(val) Then ' null value
				ewrpt_SelectedValue = True
				Exit Function
			ElseIf Left(val,2) = "@@" Or Left(ar(i),2) = "@@" Then ' advanced filter
				If IsArray(af) Then
					ewrpt_SelectedValue = ewrpt_SelectedFilter(af, ar(i), val) ' process advanced filter
					If ewrpt_SelectedValue Then Exit Function
				End If
			ElseIf ewrpt_CompareValue(ar(i), val, ft) Then
				ewrpt_SelectedValue = True
				Exit Function
			End If
		Next
	End If
	ewrpt_SelectedValue = False
End Function

' Return detail filter SQL
Function ewrpt_DetailFilterSQL(fn, val, ft, gt, gi, sql)
	Dim sqlwrk
	sqlwrk = fn
	If sql <> "" Then
		sqlwrk = Replace(sql, "%s", fn) & " = " & Replace(sql, "%s", ewrpt_QuotedValue(val, ft))
	Else
		If IsNull(val) Or (ft = EW_REPORT_DATATYPE_NUMBER And Trim(val&"") = "") Then
			sqlwrk = sqlwrk & " IS NULL"
		Else
			sqlwrk = sqlwrk & " = " & ewrpt_QuotedValue(val, ft)
		End If
	End If
	ewrpt_DetailFilterSQL = sqlwrk
End Function

' Return popup filter SQL
Function ewrpt_FilterSQL(ar, fn, ft, af, gt, gi, sql)
	If Not IsArray(ar) Then
		ewrpt_FilterSQL = ""
		Exit Function
	Else
		Dim sqlwrk, i, afsql
		sqlwrk = ""
		For i = 0 to UBound(ar)
			If ar(i) = EW_REPORT_EMPTY_VALUE Then ' Empty string
				sqlwrk = sqlwrk & fn & " = '' OR "
			ElseIf ar(i) = EW_REPORT_NULL_VALUE Then ' Null value
				sqlwrk = sqlwrk & fn & " IS NULL OR "
			ElseIf Left(ar(i), 2) = "@@" Then ' Advanced filter
				If IsArray(af) Then
					afsql = ewrpt_AdvancedFilterSQL(af, ar(i)) ' Process popup filter
					If Not IsNull(afsql) Then
						sqlwrk = sqlwrk & Replace(afsql, "@@fld@@", fn) & " OR "
					End If
				End If
			ElseIf sql <> "" Then
				sqlwrk = sqlwrk & Replace(sql, "%s", fn) & " = '" & ar(i) & "' OR "
			Else
				Dim arwrk, j

				' Copy to new array
				ReDim arwrk(UBound(ar)-i)
				For j = i to UBound(ar)
					arwrk(j-i) = ar(j)
				Next
				sqlwrk = sqlwrk & fn & " IN (" & ewrpt_JoinArray(arwrk, ", ", ft) & ") OR "
				Exit For
			End If
		Next
	End If
	If sqlwrk <> "" Then
		sqlwrk = "(" & Mid(sqlwrk, 1, Len(sqlwrk)-4) & ")"
	End If
	ewrpt_FilterSQL = sqlwrk
End Function

' Return Advanced Filter SQL
Function ewrpt_AdvancedFilterSQL(ar, val)
	If Not IsArray(ar) Then
		ewrpt_AdvancedFilterSQL = Null
		Exit Function
	ElseIf IsNull(val) Then
		ewrpt_AdvancedFilterSQL = Null
		Exit Function
	Else
		Dim i
		For i = 0 to UBound(ar,2)
			If ar(0,i)&"" = val&"" Then
				ewrpt_AdvancedFilterSQL = ar(2,i)
				Exit Function
			End If
		Next
		ewrpt_AdvancedFilterSQL = Null
	End If
End Function

'-------------------------------------------------------------------------------
' Function to check for advanced filter
Function ewrpt_SelectedFilter(ar, sel, val)
	On Error Resume Next
	Dim i, sEvalStr
	If Not IsArray(ar) Then
		ewrpt_SelectedFilter = True
	ElseIf IsNull(val) Then
		ewrpt_SelectedFilter = False
	Else
		For i = 0 to UBound(ar,1)
			If CStr(sel) = CStr(ar(i,0)) Then
				sEvalStr = Replace(ar(i,2), "@@Date", val)
				ewrpt_SelectedFilter = Eval(sEvalStr)
				If Err Then

' Response.Write "sEvalStr: " & sEvalStr & ", Err: " & Err.Descrption & "<br>"
					Err.Clear
					ewrpt_SelectedFilter = True ' assume True for this filter
				Else
					Exit Function
				End If
			End If
		Next
		ewrpt_SelectedFilter = True
	End If
End Function

'-------------------------------------------------------------------------------
' Function to truncate Memo Field based on specified length, string truncated to nearest space or CrLf
Function ewrpt_TruncateMemo(str, ln)
	Dim i, j, k
	If Len(str) > 0 And Len(str) > ln Then
		k = 1
		Do While k > 0 And k < Len(str)
			i = InStr(k, str, " ", 1)
			j = InStr(k, str, vbCrLf, 1)
			If i < 0 And j < 0 Then ' Not able to truncate
				ewrpt_TruncateMemo = str
				Exit Function
			Else

				' Get nearest space or CrLf
				If i > 0 And j > 0 Then
					If i < j Then
						k = i
					Else
						k = j
					End If
				ElseIf i > 0 Then
					k = i
				ElseIf j > 0 Then
					k = j
				End If

				' Get truncated text
				If k >= ln Then
					ewrpt_TruncateMemo = Mid(str, 1, k-1) & "..."
					Exit Function
				Else
					k = k + 1
				End If
			End If
		Loop
	Else
		ewrpt_TruncateMemo = str
	End If
End Function

'-------------------------------------------------------------------------------
' Function to escape Js
Function ewrpt_EscapeJs(str)
	ewrpt_EscapeJs = Replace(str & "", "\", "\\")
	ewrpt_EscapeJs = Replace(ewrpt_EscapeJs, """", "\""")
	ewrpt_EscapeJs = Replace(ewrpt_EscapeJs, vbCr, "\r")
	ewrpt_EscapeJs = Replace(ewrpt_EscapeJs, vbLf, "\n")
End Function

'-------------------------------------------------------------------------------
' Function to set chart parameters
Sub ewrpt_SetChartParam(Params, Index, Name, Value, Output)
	Params(0, Index) = Name
	Params(1, Index) = Value
	Params(2, Index) = Output
End Sub

'-------------------------------------------------------------------------------
' Function to show chart (FusionCharts Free)
' typ: chart type (1/2/3/4/...)
' id: chart id
' parms: "bgcolor=FFFFFF|..."
' trends: trend lines
Function ewrpt_ShowChartFCF(typ, id, parms, trends, data, series, width, height, align)
	Dim arParms, i
	Dim url, wrk, wrkwidth, wrkheight, wrkalign
	Dim chartswf
	If typ = "" Then typ = 1

	' Get chart swf
	Select Case typ

	' Single Series
	Case 1: chartswf = "FCF_Column2D.swf" ' Column 2D
	Case 2: chartswf = "FCF_Pie2D.swf" ' Pie 2D
	Case 3: chartswf = "FCF_Bar2D.swf" ' Bar 2D
	Case 4: chartswf = "FCF_Line.swf" ' Line 2D
	Case 5: chartswf = "FCF_Column3D.swf" ' Column 3D
	Case 6: chartswf = "FCF_Pie3D.swf" ' Pie 3D
	Case 7: chartswf = "FCF_Area2D.swf" ' Area 2D
	Case 8: chartswf = "FCF_Doughnut2D.swf" ' Doughnut 2D

	' Multi Series
	Case 9: chartswf = "FCF_MSColumn2D.swf" ' Multi-series Column 2D
	Case 10: chartswf = "FCF_MSColumn3D.swf" ' Multi-series Column 3D
	Case 11: chartswf = "FCF_MSLine.swf" ' Multi-series Line 2D
	Case 12: chartswf = "FCF_MSArea2D.swf" ' Multi-series Area 2D
	Case 13: chartswf = "FCF_MSBar2D.swf" ' Multi-series Bar 2D

	' Stacked
	Case 14: chartswf = "FCF_StackedColumn2D.swf" ' Stacked Column 2D
	Case 15: chartswf = "FCF_StackedColumn3D.swf" ' Stacked Column 3D
	Case 16: chartswf = "FCF_StackedArea2D.swf" ' Stacked Area 2D
	Case 17: chartswf = "FCF_StackedBar2D.swf" ' Stacked Bar 2D

	' Combination (Not yet supported)
	' Case 18: chartswf = "FCF_MSColumn3DLineDY.swf" ' Multi-series Column 3D Line Dual Y Chart
	' Case 19: chartswf = "FCF_MSColumn2DLineDY.swf" ' Multi-series Column 2D Line Dual Y Chart
	' Default

	Case Else: chartswf = "FCF_Column2D.swf" ' Default = Column 2D
	End Select
	url = "ewchartfcf.asp?id=" & id

	' Save parms/trends to session
	Session(id & "_parms") = parms
	Session(id & "_trends") = trends

	' Save chart data to session
	Session(id & "_data") = data

	' Save chart series to session
	Session(id & "_series") = series

	' Set width, height and align
	If IsNumeric(width) And IsNumeric(height) Then
		wrkwidth = width: wrkheight = height
	Else
		wrkwidth = 550: wrkheight = 440 ' default
	End If
	If LCase(align) = "left" Or LCase(align)= "right" Then
		wrkalign = LCase(align)
	Else
		wrkalign = "middle" ' default
	End If

	' Output Javascript for FCF
	wrk = wrk & "<script language=""JavaScript"" type=""text/javascript"">" & vbCrLf
	wrk = wrk & "<!--" & vbCrLf
	wrk = wrk & "var chartwidth = """ & wrkwidth & """;" & vbCrLf
	wrk = wrk & "var chartheight = """ & wrkheight & """;" & vbCrLf
	wrk = wrk & "var chartalign = """ & wrkalign & """;" & vbCrLf
	wrk = wrk & "var charturl = """ & url & """;" & vbCrLf
	wrk = wrk & "var chartid = ""div_" & id & """;" & vbCrLf
	wrk = wrk & "var chartswf = ""FusionChartsFree/Charts/" & chartswf & """;" & vbCrLf
	wrk = wrk & "var chart = new FusionCharts(chartswf, ""ewchart"", chartwidth, chartheight);" & vbCrLf
	wrk = wrk & "chart.addParam(""wmode"", ""transparent"");" & vbCrLf
	wrk = wrk & "chart.setDataURL(charturl);" & vbCrLf
	wrk = wrk & "chart.render(chartid);" & vbCrLf
	wrk = wrk & "//-->" & vbCrLf
	wrk = wrk & "</script>" & vbCrLf

	' Add debug url
	If EW_REPORT_DEBUG_CHART_ENABLED Then
		wrk = wrk & "<p><b>For debugging only</b>: View <a href=""" & url & """ target=""_blank"">XML</a> or <a href=""" + url + "&text=1"" target=""_blank"">text</a> data for above chart</p>"
	End If
	ewrpt_ShowChartFCF = wrk

' Call ewrpt_Trace(ewrpt_ShowChartFCF)
End Function

' Add chart parameter to array
Sub ewrpt_AddChartParam(Params, Name, Value, Output)
	Dim Index
	If IsArray(Params) And UBound(Params,1) >= 2 Then
		Index = UBound(Params,2) + 1
		ReDim Preserve Params(UBound(Params,1), Index)
	Else
		Index = 0
		ReDim Params(2, Index)
	End If
	Params(0, Index) = Name
	Params(1, Index) = Value
	Params(2, Index) = Output
End Sub

' Load Chart Series
Function ewrpt_LoadChartSeries(sSql, ar, dt)
	Dim rscht
	Set rscht = conn.Execute(sSql)
	Do While Not rscht.Eof
		If Not IsArray(ar) Then
			ReDim ar(0)
		Else
			ReDim Preserve ar(UBound(ar)+1)
		End If
		ar(UBound(ar)) = ewrpt_ChartSeriesValue(ewrpt_GetValue(rscht(0)), dt) ' Series value
		rscht.MoveNext
	Loop
	rscht.Close
	Set rscht = Nothing
End Function

' Load Chart Data
Function ewrpt_LoadChartData(sSql, ar, dt)
	Dim rscht, temp(2)
	Set rscht = conn.Execute(sSql)
	Do While Not rscht.Eof
		temp(0) = ewrpt_ChartXValue(ewrpt_GetValue(rscht(0)), dt) ' X value

'Response.Write "0: " & rscht(0) & "<br>"
		temp(1) = ewrpt_ChartSeriesValue(ewrpt_GetValue(rscht(1)), dt) ' Series value
		temp(2) = ewrpt_GetValue(rscht(2)) ' Y value

'Response.Write "1: " & rscht(1) & "<br>"
		If Not IsArray(ar) Then
			ReDim ar(2,0)
		Else
			ReDim Preserve ar(2,UBound(ar,2)+1)
		End If
		ar(0,UBound(ar,2)) = temp(0)
		ar(1,UBound(ar,2)) = temp(1)
		ar(2,UBound(ar,2)) = temp(2)
		rscht.MoveNext
	Loop
	rscht.Close
	Set rscht = Nothing
End Function

' Get Chart X value
Function ewrpt_ChartXValue(val, dt)
	Dim ar, sWrk
	If IsNull(val) Then
		sWrk = EW_REPORT_NULL_LABEL
	ElseIf val = "" Then
		sWrk = EW_REPORT_EMPTY_LABEL
	ElseIf dt = "xyq" Then
		ar = Split(val, "|")
		If UBound(ar) >= 1 Then
			sWrk = ar(0) & " " & ewrpt_QuarterName(ar(1))
		Else
			sWrk = val
		End If
	ElseIf dt = "xym" Then
		ar = Split(val, "|")
		If UBound(ar) >= 1 Then
			sWrk = ar(0) & " " & ewrpt_MonthName(ar(1))
		Else
			sWrk = val
		End If
	ElseIf dt = "xq" Then
		sWrk = ewrpt_QuarterName(val)
	ElseIf dt = "xm" Then
		sWrk = ewrpt_MonthName(val)
	Else
		sWrk = val
	End If
	ewrpt_ChartXValue = sWrk
End Function

' Get Chart Series value
Function ewrpt_ChartSeriesValue(val, dt)
	Dim ar, sWrk
	If dt = "syq" Then
		ar = Split(val, "|")
		If UBound(ar) >= 1 Then
			sWrk = ar(0) & " " & ewrpt_QuarterName(ar(1))
		Else
			sWrk = val
		End If
	ElseIf dt = "sym" Then
		ar = Split(val, "|")
		If UBound(ar) >= 1 Then
			sWrk = ar(0) & " " & ewrpt_MonthName(ar(1))
		Else
			sWrk = val
		End If
	ElseIf dt = "sq" Then
		sWrk = ewrpt_QuarterName(val)
	ElseIf dt = "sm" Then
		sWrk = ewrpt_MonthName(val)
	Else
		sWrk = val
	End If
	ewrpt_ChartSeriesValue = sWrk
End Function

'-------------------------------------------------------------------------------
' Function to sort chart data
Sub ewrpt_SortChartData(ar, opt)
	Dim i, j, tmpname1, tmpname2, tmpval, bSwap
	If opt < 1 Or opt > 4 Then Exit Sub
	If IsArray(ar) Then
		For i = 0 to UBound(ar,2) - 1
			For j = i+1 to UBound(ar,2)
				Select Case opt
				Case 1 ' X values ascending
					bSwap = (ar(0,i) > ar(0,j)) Or (ar(0,i) = ar(0,j) And ar(1,i) > ar(1,j))
				Case 2 ' X values descending
					bSwap = (ar(0,i) < ar(0,j)) Or (ar(0,i) = ar(0,j) And ar(1,i) < ar(1,j))
				Case 3 ' Y values ascending
					bSwap = (ar(2,i) > ar(2,j))
				Case 4 ' Y values descending
					bSwap = (ar(2,i) < ar(2,j))
				End Select
				If bSwap Then
				   	tmpname1 = ar(0,i): tmpname2 = ar(1,i): tmpval = ar(2,i)
				   	ar(0,i) = ar(0,j): ar(1,i) = ar(1,j): ar(2,i) = ar(2,j)
			   		ar(0,j) = tmpname1: ar(1,j) = tmpname2: ar(2,j) = tmpval
				End If
			Next
		Next
	End If
End Sub

'-------------------------------------------------------------------------------
' Function to sort chart multi series data
Sub ewrpt_SortMultiChartData(ar, opt, n)
	Dim i, j, tmpname1, tmpname2, tmpval, bSwap
	Dim k, tmpY1, tmpY2, nCat
	If opt < 1 Or opt > 4 Then Exit Sub
	If n <= 0 Then Exit Sub
	If IsArray(ar) Then
		nCat = (UBound(ar,2)+1)\n
		If (UBound(ar,2)+1) Mod n = 0 Then
			For i = 0 to nCat-2
				For j = i+1 to nCat-1
					Select Case opt
					Case 1 ' X values ascending
						bSwap = (ar(0,i*n) > ar(0,j*n))
					Case 2 ' X values descending
						bSwap = (ar(0,i*n) < ar(0,j*n))
					Case 3, 4 ' Y values
						tmpY1 = 0
						tmpY2 = 0
						For k = 0 to n-1
							tmpY1 = tmpY1 + ar(2,i*n+k)
							tmpY2 = tmpY2 + ar(2,j*n+k)
						Next
						If opt = 3 Then
							bSwap = (tmpY1 > tmpY2)
						ElseIf opt = 4 Then
							bSwap = (tmpY1 < tmpY2)
						End If
					End Select
					If bSwap Then
						For k = 0 to n-1
							tmpname1 = ar(0,i*n+k): tmpname2 = ar(1,i*n+k): tmpval = ar(2,i*n+k)
							ar(0,i*n+k) = ar(0,j*n+k): ar(1,i*n+k) = ar(1,j*n+k): ar(2,i*n+k) = ar(2,j*n+k)
							ar(0,j*n+k) = tmpname1: ar(1,j*n+k) = tmpname2: ar(2,j*n+k) = tmpval
						Next
					End If
				Next
			Next
		End If
	End If
End Sub

'-------------------------------------------------------------------------------
' Function to Resize Array
Sub ewrpt_ResizeAr(ar, nx, ny)
	Dim ywrk
	If Not IsArray(ar) Then
		Redim ar(nx, ny-1)
	Else
		If UBound(ar, 1) = nx Then
			ywrk = UBound(ar, 2) + ny
			Redim Preserve ar(nx, ywrk)
		End If
	End If
End Sub

'-------------------------------------------------------------------------------
' Function to Load array from sql
Sub ewrpt_LoadArrayFromSql(sql, ar)
	If Not EW_REPORT_DEBUG_ENABLED Then On Error Resume Next
	Dim rswrk, v
	If IsNull(sql) Or sql = "" Then Exit Sub
	Set rswrk = conn.Execute(sql)
	Do While Not rswrk.Eof
		v = ewrpt_GetValue(rswrk(0))
		If IsNull(v) Then
			v = EW_REPORT_NULL_VALUE
		ElseIf v = "" Then
			v = EW_REPORT_EMPTY_VALUE
		End If
		If Not IsArray(ar) Then
			Redim ar(0)
			ar(0) = v
		Else
			Redim Preserve ar(UBound(ar)+1)
			ar(UBound(ar)) = v
		End If
		rswrk.MoveNext
	Loop
	rswrk.Close
	Set rswrk = Nothing
End Sub

'-------------------------------------------------------------------------------
' Function to Match array
Function ewrpt_MatchedArray(ar1, ar2)
	ewrpt_MatchedArray = False
	If Not IsArray(ar1) And Not IsArray(ar2) Then
		ewrpt_MatchedArray = True
	ElseIf IsArray(ar1) And IsArray(ar2) Then
		ewrpt_MatchedArray = (Join(ar1, ",") = Join(ar2, ","))
	End If
End Function

'-------------------------------------------------------------------------------
' Function to Sort array
Sub ewrpt_SortArray(ar)
	Dim i, j, temp
	If IsArray(ar) Then
		For i = 0 to UBound(ar)-1
			For j = i+1 to UBound(ar)
				If ar(i) > ar(j) Then
					temp = ar(i)
					ar(i) = ar(j)
					ar(j) = temp
				End if
			Next
		Next
	End If
End Sub

' add db group field
Function ewrpt_AddDbGrpFld(dict, fldval, grpval)
	If Not IsObject(dict) Then Set dict = Server.CreateObject("Scripting.Dictionary")
	dict.Add fldval, grpval
End Function

' display elapsed time (in seconds)
Function ewrpt_calcElapsedTime(tm)
	Dim endtime
	endtime = Timer
	ewrpt_calcElapsedTime = "page processing time: " & FormatNumber((endtime - tm),2) & " seconds"
End Function

'-------------------------------------------------------------------------------
' Function to encode chart value
Function ewrpt_Encode(val)
	ewrpt_Encode = Replace(val, ",", "%2C") ' encode comma
End Function

'-------------------------------------------------------------------------------
' Function for debug
Sub ewrpt_Trace(aMsg)
	If Not EW_REPORT_DEBUG_ENABLED Then On Error Resume Next
	Dim fso, ts
	Set fso = Server.Createobject("Scripting.FileSystemObject")
	Set ts = fso.OpenTextFile(Server.MapPath("debug.txt"), 8, True)
	ts.writeline(aMsg)
	ts.Close
	Set ts = Nothing
	Set fso = Nothing
End Sub

' Function to create numeric pager
Function ew_NewNumericPager(FromIndex, PageSize, RecordCount, Range)
	Set ew_NewNumericPager = New cNumericPager
	ew_NewNumericPager.FromIndex = CLng(FromIndex)
	ew_NewNumericPager.PageSize = CLng(PageSize)
	ew_NewNumericPager.RecordCount = CLng(RecordCount)
	ew_NewNumericPager.Range = CLng(Range)
	ew_NewNumericPager.Init
End Function

' Function to create next prev pager
Function ew_NewPrevNextPager(FromIndex, PageSize, RecordCount)
	Set ew_NewPrevNextPager = New cPrevNextPager
	ew_NewPrevNextPager.FromIndex = CLng(FromIndex)
	ew_NewPrevNextPager.PageSize = CLng(PageSize)
	ew_NewPrevNextPager.RecordCount = CLng(RecordCount)
	ew_NewPrevNextPager.Init
End Function

' Class for Pager item
Class cPagerItem
	Dim Start, Text, Enabled
End Class

' Class for Numeric pager
Class cNumericPager
	Dim Items()
	Dim Count, FromIndex, ToIndex, RecordCount, PageSize, Range
	Dim FirstButton, PrevButton, NextButton, LastButton, ButtonCount
	Dim Visible

	' Class Initialize
	Private Sub Class_Initialize()
		Set FirstButton = New cPagerItem
		Set PrevButton = New cPagerItem
		Set NextButton = New cPagerItem
		Set LastButton = New cPagerItem
		Visible = True
	End Sub

	' Method to init pager
	Public Sub Init()
		If FromIndex > RecordCount Then FromIndex = RecordCount
		ToIndex = FromIndex + PageSize - 1
		If ToIndex > RecordCount Then ToIndex = RecordCount
		Count = -1
		ReDim Items(0)
		SetupNumericPager()
		Redim Preserve Items(Count)

		' Update button count
		ButtonCount = Count + 1
		If FirstButton.Enabled Then ButtonCount = ButtonCount + 1
		If PrevButton.Enabled Then ButtonCount = ButtonCount + 1
		If NextButton.Enabled Then ButtonCount = ButtonCount + 1
		If LastButton.Enabled Then ButtonCount = ButtonCount + 1
	End Sub

	' Add pager item
	Private Sub AddPagerItem(StartIndex, Text, Enabled)
		Count = Count + 1
		If Count > UBound(Items) Then
			Redim Preserve Items(UBound(Items)+10)
		End If
		Dim Item
		Set Item = New cPagerItem
		Item.Start = StartIndex
		Item.Text = Text
		Item.Enabled = Enabled
		Set Items(Count) = Item
	End Sub

	' Setup pager items
	Private Sub SetupNumericPager()
		Dim Eof, x, y, dx1, dx2, dy1, dy2, ny, HasPrev, TempIndex
		If RecordCount > PageSize Then
			Eof = (RecordCount < (FromIndex + PageSize))
			HasPrev = (FromIndex > 1)

			' First Button
			TempIndex = 1
			FirstButton.Start = TempIndex
			FirstButton.Enabled = (FromIndex > TempIndex)

			' Prev Button
			TempIndex = FromIndex - PageSize
			If TempIndex < 1 Then TempIndex = 1
			PrevButton.Start = TempIndex
			PrevButton.Enabled = HasPrev

			' Page links
			If HasPrev Or Not Eof Then
				x = 1
				y = 1
				dx1 = ((FromIndex-1)\(PageSize*Range))*PageSize*Range + 1
				dy1 = ((FromIndex-1)\(PageSize*Range))*Range + 1
				If (dx1+PageSize*Range-1) > RecordCount Then
					dx2 = (RecordCount\PageSize)*PageSize + 1
					dy2 = (RecordCount\PageSize) + 1
				Else
					dx2 = dx1 + PageSize*Range - 1
					dy2 = dy1 + Range - 1
				End If
				While x <= RecordCount
					If x >= dx1 And x <= dx2 Then
						Call AddPagerItem(x, y, FromIndex<>x)
						x = x + PageSize
						y = y + 1
					ElseIf x >= (dx1-PageSize*Range) And x <= (dx2+PageSize*Range) Then
						If x+Range*PageSize < RecordCount Then
							Call AddPagerItem(x, y & "-" & (y+Range-1), True)
						Else
							ny = (RecordCount-1)\PageSize + 1
							If ny = y Then
								Call AddPagerItem(x, y, True)
							Else
								Call AddPagerItem(x, y & "-" & ny, True)
							End If
						End If
						x = x + Range*PageSize
						y = y + Range
					Else
						x = x + Range*PageSize
						y = y + Range
					End If
				Wend
			End If

			' Next Button
			NextButton.Start = FromIndex + PageSize
			TempIndex = FromIndex + PageSize
			NextButton.Start = TempIndex
			NextButton.Enabled = Not Eof

			' Last Button
			TempIndex = ((RecordCount-1)\PageSize)*PageSize + 1
			LastButton.Start = TempIndex
			LastButton.Enabled = (FromIndex < TempIndex)
		End If
	End Sub

    ' Terminate
	Private Sub Class_Terminate()
		Set FirstButton = Nothing
		Set PrevButton = Nothing
		Set NextButton = Nothing
		Set LastButton = Nothing
		For Each Item In Items
			Set Item = Nothing
		Next
		Erase Items
	End Sub
End Class

' Class for PrevNext pager
Class cPrevNextPager
	Dim FirstButton, PrevButton, NextButton, LastButton
	Dim CurrentPage, PageSize, PageCount, FromIndex, ToIndex, RecordCount
	Dim Visible

	' Class Initialize
	Private Sub Class_Initialize()
		Set FirstButton = New cPagerItem
		Set PrevButton = New cPagerItem
		Set NextButton = New cPagerItem
		Set LastButton = New cPagerItem
		Visible = True
	End Sub

	' Method to init pager
	Public Sub Init()
		Dim TempIndex
		If PageSize > 0 Then
			CurrentPage = (FromIndex-1)\PageSize + 1
			PageCount = (RecordCount-1)\PageSize + 1
			If FromIndex > RecordCount Then FromIndex = RecordCount
			ToIndex = FromIndex + PageSize - 1
			If ToIndex > RecordCount Then ToIndex = RecordCount

			' First Button
			TempIndex = 1
			FirstButton.Start = TempIndex
			FirstButton.Enabled = (TempIndex <> FromIndex)

			' Prev Button
			TempIndex = FromIndex - PageSize
			If TempIndex < 1 Then TempIndex = 1
			PrevButton.Start = TempIndex
			PrevButton.Enabled = (TempIndex <> FromIndex)

			' Next Button
			TempIndex = FromIndex + PageSize
			If TempIndex > RecordCount Then TempIndex = FromIndex
			NextButton.Start = TempIndex
			NextButton.Enabled = (TempIndex <> FromIndex)

			' Last Button
			TempIndex = ((RecordCount-1)\PageSize)*PageSize + 1
			LastButton.Start = TempIndex
			LastButton.Enabled = (TempIndex <> FromIndex)
		End If
	End Sub

	' Terminate
	Private Sub Class_Terminate()
		Set FirstButton = Nothing
		Set PrevButton = Nothing
		Set NextButton = Nothing
		Set LastButton = Nothing
	End Sub
End Class
%>
<script language="JScript" runat="server">
// Server-side JScript functions for ASP Report Maker 3+ (Requires script engine 5.5.+)
function ew_Encode(str) {	
	return encodeURIComponent(str);
}
function ew_Decode(str) {	
	return decodeURIComponent(str);	
}
// JavaScript implementation of Block TEA by Chris Veness
// http://www.movable-type.co.uk/scripts/TEAblock.html
//
// TEAencrypt: Use Corrected Block TEA to encrypt plaintext using password
//            (note plaintext & password must be strings not string objects)
//
// Return encrypted text as string
//
function TEAencrypt(plaintext, password)
{
    if (plaintext.length == 0) return('');  // nothing to encrypt
    // 'escape' plaintext so chars outside ISO-8859-1 work in single-byte packing, but  
    // keep spaces as spaces (not '%20') so encrypted text doesn't grow too long, and 
    // convert result to longs
    var v = strToLongs(escape(plaintext).replace(/%20/g,' '));
    if (v.length == 1) v[1] = 0;  // algorithm doesn't work for n<2 so fudge by adding nulls
    var k = strToLongs(password.slice(0,16));  // simply convert first 16 chars of password as key
    var n = v.length;
    var z = v[n-1], y = v[0], delta = 0x9E3779B9;
    var mx, e, q = Math.floor(6 + 52/n), sum = 0;
    while (q-- > 0) {  // 6 + 52/n operations gives between 6 & 32 mixes on each word
        sum += delta;
        e = sum>>>2 & 3;
        for (var p = 0; p < n-1; p++) {
            y = v[p+1];
            mx = (z>>>5 ^ y<<2) + (y>>>3 ^ z<<4) ^ (sum^y) + (k[p&3 ^ e] ^ z)
            z = v[p] += mx;
        }
        y = v[0];
        mx = (z>>>5 ^ y<<2) + (y>>>3 ^ z<<4) ^ (sum^y) + (k[p&3 ^ e] ^ z)
        z = v[n-1] += mx;
    }
    // note use of >>> in place of >> due to lack of 'unsigned' type in JavaScript 
    return escCtrlCh(longsToStr(v));
}
//
// TEAdecrypt: Use Corrected Block TEA to decrypt ciphertext using password
//
function TEAdecrypt(ciphertext, password)
{
    if (ciphertext.length == 0) return('');
    var v = strToLongs(unescCtrlCh(ciphertext));
    var k = strToLongs(password.slice(0,16)); 
    var n = v.length;
    var z = v[n-1], y = v[0], delta = 0x9E3779B9;
    var mx, e, q = Math.floor(6 + 52/n), sum = q*delta;
    while (sum != 0) {
        e = sum>>>2 & 3;
        for (var p = n-1; p > 0; p--) {
            z = v[p-1];
            mx = (z>>>5 ^ y<<2) + (y>>>3 ^ z<<4) ^ (sum^y) + (k[p&3 ^ e] ^ z)
            y = v[p] -= mx;
        }
        z = v[n-1];
        mx = (z>>>5 ^ y<<2) + (y>>>3 ^ z<<4) ^ (sum^y) + (k[p&3 ^ e] ^ z)
        y = v[0] -= mx;
        sum -= delta;
    }
    var plaintext = longsToStr(v);
    // strip trailing null chars resulting from filling 4-char blocks:
    if (plaintext.search(/\0/) != -1) plaintext = plaintext.slice(0, plaintext.search(/\0/));
    return unescape(plaintext);
}
// supporting functions
function strToLongs(s) {  // convert string to array of longs, each containing 4 chars
    // note chars must be within ISO-8859-1 (with Unicode code-point < 256) to fit 4/long
    var l = new Array(Math.ceil(s.length/4))
    for (var i=0; i<l.length; i++) {
        // note little-endian encoding - endianness is irrelevant as long as 
        // it is the same in longsToStr() 
        l[i] = s.charCodeAt(i*4) + (s.charCodeAt(i*4+1)<<8) + 
               (s.charCodeAt(i*4+2)<<16) + (s.charCodeAt(i*4+3)<<24);
    }
    return l;  // note running off the end of the string generates nulls since 
}              // bitwise operators treat NaN as 0
function longsToStr(l) {  // convert array of longs back to string
    var a = new Array(l.length);
    for (var i=0; i<l.length; i++) {
        a[i] = String.fromCharCode(l[i] & 0xFF, l[i]>>>8 & 0xFF, 
                                   l[i]>>>16 & 0xFF, l[i]>>>24 & 0xFF);
    }
    return a.join('');  // use Array.join() rather than repeated string appends for efficiency
}
function escCtrlCh(str) {  // escape control chars which might cause problems with encrypted texts
    return str.replace(/[\0\n\v\f\r!]/g, function(c) { return '!' + c.charCodeAt(0) + '!'; });
}
function unescCtrlCh(str) {  // unescape potentially problematic nulls and control characters
    return str.replace(/!\d\d?!/g, function(c) { return String.fromCharCode(c.slice(1,-1)); });
}
</script>
