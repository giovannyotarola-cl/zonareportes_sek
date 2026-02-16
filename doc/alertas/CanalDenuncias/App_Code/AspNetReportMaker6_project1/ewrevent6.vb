Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.Collections.Specialized
Imports System.Web
Imports System.Web.WebPages
Imports System.Web.Helpers
Imports System.Text
Imports System.Text.RegularExpressions
Imports System.Data
Imports System.Data.Common
Imports System.Xml
Imports System.IO
Imports System.Security.Cryptography
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D
Imports System.Reflection
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Linq
Imports System.Dynamic
Imports System.DirectoryServices
Imports Microsoft.VisualBasic
Imports Microsoft.Web.Helpers
Imports WebMatrix.Data
Imports Newtonsoft.Json
Imports System.Data.SqlClient
Imports ewConnection = System.Data.SqlClient.SqlConnection
Imports ewCommand = System.Data.SqlClient.SqlCommand
Imports ewDataReader = System.Data.SqlClient.SqlDataReader
Imports ewTransaction = System.Data.SqlClient.SqlTransaction
Imports ewDbType = System.Data.SqlDbType

'
' ASP.NET Report Maker 6 Project Class
'

Partial Public Class AspNetReportMaker6_project1
	Inherits AspNetReportMaker6_project1_base

	' Filter for "Last Month" (example)
	Public Function GetLastMonthFilter(FldExpression As String) As String
		Dim lastmonth = New DateTime(DateTime.Today.Year, DateTime.Today.Month, 1)
		Dim sVal = lastmonth.ToString("yyyy|MM")
		Dim sWrk = FldExpression & " BETWEEN " & _
			ewr_QuotedValue(ewr_DateVal("month", sVal, 1), EWR_DATATYPE_DATE) & _
			" AND " & _
			ewr_QuotedValue(ewr_DateVal("month", sVal, 2), EWR_DATATYPE_DATE)
		Return sWrk
	End Function

	' Filter for "Starts With A" (example)
	Public Function GetStartsWithAFilter(FldExpression As String) As String
		Return FldExpression & ewr_Like("'A%'")
	End Function

	'
	' Global user code
	'
	'
	' Global events
	'
	'
	' Connection
	'
	Public class crConnection
		Inherits cConnectionBase

		' Constructor		
		Public Sub New(ConnStr As String)
			MyBase.New(ConnStr)
		End Sub

		' Constructor
		Public Sub New()
			Me.New(EWR_DB_CONNECTION_STRING)
		End Sub
	End Class

	'
	' Advanced Security
	'
	Public Class cAdvancedSecurity
		Inherits cAdvancedSecurityBase
	End Class

	'
	' Menu
	'
	Public Class cMenu
		Inherits cMenuBase

		Public Sub New(MenuId As Object, Optional Mobile As Boolean = False)
			MyBase.New(MenuId, Mobile)
		End Sub

		Public Overrides Function Render(ret As Boolean) As String
			Dim m = Me
			If IsRoot Then
				Menu_Rendering(m)
			End If
			Return MyBase.Render(ret)
		End Function

		' Menu_Rendering event
		Public Sub Menu_Rendering(Menu As cMenu)

			' Change menu items here
		End Sub
	End Class

	' Execute SQL
	Public Shared Function ewr_Execute(Sql As String) As Integer
		Using c = New crConnection()
			Return c.ExecuteNonQuery(Sql)
		End Using
	End Function

	' Execute SQL and return first value of first row
	Public Shared Function ewr_ExecuteScalar(Sql As String) As Object
		Using c = New crConnection()
			Return c.ExecuteScalar(Sql)
		End Using
	End Function

	' Execute SQL and return first value of first row as string
	' for use with As<TValue>, As<TValue>(String, TValue) and Is<TValue>
	Public Shared Function ewr_ExecuteValue(Sql As String) As String
		Using c = New crConnection()
			Return Convert.ToString(c.ExecuteScalar(Sql))
		End Using
	End Function

	' Execute SQL and return first row as OrderedDictionary
	Public Shared Function ewr_ExecuteRow(Sql As String) As OrderedDictionary
		Using c = New crConnection()
			Return c.GetRow(Sql)
		End Using
	End Function

	' Execute SQL and return List<OrderedDictionary>
	Public Shared Function ewr_ExecuteRows(Sql As String) As List(Of OrderedDictionary)
		Using c = New crConnection()
			Return c.GetRows(Sql)
		End Using
	End Function

	' Execute SQL and return first row
	Public Shared Function ewr_ExecuteRecord(Sql As String) As DbDataRecord
		Using c = New crConnection()
			Return c.GetRecord(Sql)
		End Using
	End Function

	' Execute SQL and return List<DbDataRecord>
	Public Shared Function ewr_ExecuteRecords(Sql As String) As List(Of DbDataRecord)
		Using c = New crConnection()
			Return c.GetRecords(Sql)
		End Using
	End Function
End Class	
