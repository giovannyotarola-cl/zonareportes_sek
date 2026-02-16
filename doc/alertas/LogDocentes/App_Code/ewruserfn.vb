Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.Collections.Specialized
Imports System.Web
Imports System.Web.UI
Imports System.Data
Imports System.Data.Common
Imports System.Xml
Imports System.IO
Imports System.Security.Cryptography
Imports System.Text
Imports System.Text.RegularExpressions
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D
Imports System.Reflection
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Globalization
Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

'
' ASP.NET Report Maker 4 - User Functions
' (C) 2010 e.World Technology Ltd.
'
Public Partial Class AspNetReportMaker4_Log_Docentes
	Inherits System.Web.UI.Page

	' Global user functions
	' Filter for 'Last Month' (example)
	Public Function GetLastMonthFilter(FldExpression As String) As String
		Dim lastmonth As New DateTime(DateTime.Today.Year, DateTime.Today.Month, 1)
		Dim sVal As String = lastmonth.ToString("yyyy|MM")
		Dim sWrk As String = FldExpression & " BETWEEN " & ew_QuotedValue(ewrpt_DateVal("month", sVal, 1), EWRPT_DATATYPE_DATE) & " AND " & ew_QuotedValue(ewrpt_DateVal("month", sVal, 2), EWRPT_DATATYPE_DATE)
		Return sWrk
	End Function

	' Filter for 'Starts With A' (example)
	Public Function GetStartsWithAFilter(FldExpression As String) As String
		Return FldExpression + " LIKE 'A%'"
	End Function
End Class
