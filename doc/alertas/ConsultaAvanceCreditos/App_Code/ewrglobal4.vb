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
' ASP.NET Report Maker 4 - Global
' (C) 2010 e.World Technology Ltd.
'
Public Partial Class AspNetReportMaker4_consultaAvanceCreditos
	Inherits System.Web.UI.Page

	'
	' Global variables
	'
	' Connection
	Public Conn As cConnection

	' Security
	Public Security As cAdvancedSecurity

	' Language
	Public Shared gsLanguage As String = ""

	' Export
	Public Shared gsExport As String = ""

	Public Shared gsExportFile As String = ""

	' Email
	Public Shared gsEmailSender As String = ""

	Public Shared gsEmailRecipient As String = ""

	Public Shared gsEmailCc As String = ""

	Public Shared gsEmailBcc As String = ""

	Public Shared gsEmailSubject As String = ""

	Public Shared gsEmailContent As String = ""

	Public Shared gsEmailContentType As String = ""

	Public Shared gsEmailErrNo As String = ""

	Public Shared gsEmailErrDesc As String = ""

	' Used by extended filter
	Public Shared gsFormError As String = ""

	' Debug message
	Public Shared gsDebugMsg As String = ""

	' Timer
	Public StartTimer As Long

	' Page Loading event
	Public Sub Page_Loading()

		'ew_Write("Page Loading")
	End Sub

	' Page Unloaded event
	Public Sub Page_Unloaded()

		'ew_Write("Page Unloaded")
	End Sub

	' Language
	Public ReportLanguage As crLanguage

	' Runtime variables	
	Public sSql As String = ""

	Public ChartObj As object	

	Public SqlSelect As String = ""

	Public SqlChartSelect As String = ""

	Public SqlChartBase As String = ""

	Public chartxml As String = ""
End Class
