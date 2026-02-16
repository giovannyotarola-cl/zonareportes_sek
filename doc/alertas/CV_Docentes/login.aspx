<%@ Page ClassName="login" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_CVTotal" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Collections.Specialized" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.Common" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>
<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.Drawing.Imaging" %>
<%@ Import Namespace="System.Drawing.Drawing2D" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net.Mime" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Microsoft.VisualBasic" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

	' Page object
	Public rptlogin As crrptlogin

	'
	' Page class
	'
	Public Class crrptlogin
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			Return sUrl
		End Function

		' Message
		Public Property Message As String
			Get
				Return Convert.ToString(ew_Session(EWRPT_SESSION_MESSAGE))
			End Get	
			Set(ByVal Value As String)
				If (ew_NotEmpty(ew_Session(EWRPT_SESSION_MESSAGE))) Then ' Append
					ew_Session(EWRPT_SESSION_MESSAGE) &= "<br>" & value
				Else
					ew_Session(EWRPT_SESSION_MESSAGE) = Value
				End If
			End Set
		End Property

		' Show message
		Public Sub ShowMessage()
			Dim sMessage As String = Message
			Message_Showing(sMessage)
			If (ew_NotEmpty(sMessage)) Then ' Message in Session, display
				ew_Write("<div class=""ewMessage"">" & sMessage & "</div>")
				ew_Session(EWRPT_SESSION_MESSAGE) = "" ' Clear message in Session
			End If
		End Sub

		' Validate page request
		Public Function IsPageRequest() As Boolean
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As login 
			Get
				Return CType(m_ParentPage, login)
			End Get
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_CVTotal)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "rptlogin"
			m_PageObjName = "rptlogin"
			m_PageObjTypeName = "crrptlogin"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Open connection
			Conn = New cConnection()
		End Sub

		' 
		'  Page_Init
		'
		Public Sub Page_Init()

			' Global Page Loading event (in userfn*.aspx)
			ParentPage.Page_Loading()

			' Page Load event
			Page_Load()
		End Sub

		'
		'  Class terminate
		'
		Public Sub Dispose() Implements IDisposable.Dispose
			Page_Terminate("")
		End Sub

		'
		' Page_Terminate
		'
		Public Sub Page_Terminate(url As String)

			' Page Unload event
			Page_Unload()

			' Global Page Unloaded event (in userfn*.aspx)
			ParentPage.Page_Unloaded()

			' Close connection
			Conn.Dispose()

			' Go to URL if specified
			If (ew_NotEmpty(url)) Then
				HttpContext.Current.Response.Clear()
				HttpContext.Current.Response.Redirect(url)
			End If			
		End Sub

		Public Username As String = ""

		Public LoginType As String = ""

		Public sFilter As String = ""

		Private sPassword As String = ""

		Private sWhere As String = ""

		Private sGroupBy As String = ""

		Private sHaving As String = ""

		Private sOrderBy As String = ""

		'
		' Page Main
		'
		Public Sub Page_Main()
			Dim bValidPwd As Boolean = False

			' Auto login
			If Not Security.IsLoggedIn() Then
				Security.AutoLogin()
			End If
			Dim sLastUrl As String = Security.LastUrl
			If ew_Empty(sLastUrl) Then
				sLastUrl = "default.aspx"
			End If
			If HttpContext.Current.Request.RequestType = "POST" Then
				bValidPwd = False

				' Setup variables
				Username = ew_Post("Username")
				sPassword = ew_Post("Password")
				LoginType = ew_Post("rememberme").ToLower()
				Dim bValidate As Boolean = ValidateForm(Username, sPassword)
				If Not bValidate Then
					Message = gsFormError
				End If
				If bValidate Then
					If Security.ValidateUser(Username, sPassword, False) Then	' Write cookies
						If LoginType = "a" Then
							ew_Cookie("autologin") = "autologin"
							ew_Cookie("username") = cTEA.Encrypt(Username, EWRPT_RANDOM_KEY)
							ew_Cookie("Password") = cTEA.Encrypt(sPassword, EWRPT_RANDOM_KEY)
							ew_Cookie("checksum") = Convert.ToString(CRC32(MD5(EWRPT_RANDOM_KEY)))
ElseIf LoginType = "u" Then
							ew_Cookie("autologin") = "rememberusername"
							ew_Cookie("username") = cTEA.Encrypt(Username, EWRPT_RANDOM_KEY)
							ew_Cookie("checksum") = Convert.ToString(CRC32(MD5(EWRPT_RANDOM_KEY)))
						Else
							ew_Cookie("autologin") = ""
						End If
						ew_Session(EWRPT_SESSION_STATUS) = "login" ' Return to last accessed page
						Page_Terminate(sLastUrl)
					Else
						Message = ReportLanguage.Phrase("InvalidUidPwd")
					End If
				End If
			Else
				If Security.IsLoggedIn() Then
					If Message = "" Then
						Page_Terminate(sLastUrl)

						' Return to last accessed page
					End If
				End If

				' Restore settings
				If ew_SameStr(ew_Cookie("checksum"), CRC32(MD5(EWRPT_RANDOM_KEY))) Then
					Username = cTEA.Decrypt(ew_Cookie("username"), EWRPT_RANDOM_KEY)
				End If
				If ew_Cookie("autologin") = "autologin" Then
					LoginType = "a"
				ElseIf ew_Cookie("autologin") = "rememberusername" Then
					LoginType = "u"
				Else
					LoginType = ""
				End If
			End If
		End Sub		

		'
		' Validate form
		'
		Public Function ValidateForm(ByVal usr As String, ByVal pwd As String) As Boolean

			' Initialize form error message
			gsFormError = ""

			' Check if validation required
			If Not EWRPT_SERVER_VALIDATE Then
				Return True
			End If
			If ew_Empty(usr) Then
				gsFormError += IIf(ew_NotEmpty(gsFormError), "<br>", "")
				gsFormError += ReportLanguage.Phrase("EnterUid")
			End If
			If ew_Empty(pwd) Then
				gsFormError += IIf(ew_NotEmpty(gsFormError), "<br>", "")
				gsFormError += ReportLanguage.Phrase("EnterPwd")
			End If

			' Return validate result
			Dim valid As Boolean = (ew_Empty(gsFormError))

			' Call Form Custom Validate event
			Dim sFormCustomError As String = ""
			valid = valid AndAlso Form_CustomValidate(sFormCustomError)
			If ew_NotEmpty(sFormCustomError) Then
				gsFormError += IIf(ew_NotEmpty(gsFormError), "<br>" ,"")
				gsFormError += sFormCustomError
			End If
			Return valid
		End Function

		' Page Load event
		Public Sub Page_Load()

			'ew_Write("Page Load")
		End Sub

		' Page Unload event
		Public Sub Page_Unload()

			'ew_Write("Page Unload")
		End Sub

		' Message Showing event
		Public Sub Message_Showing(ByRef msg As String)

			'msg = newmsg
		End Sub

		' Form Custom Validate event
		Public Function Form_CustomValidate(ByRef CustomError As String) As Boolean

			'Return error message in CustomError
			Return True
		End Function
	End Class

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		gsDebugMsg = ""

		' Page init
		rptlogin = New crrptlogin(Me)
		rptlogin.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		rptlogin.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (rptlogin IsNot Nothing) Then rptlogin.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
// To include another .js script, use:
// ew_ClientScriptInclude("my_javascript.js"); 
//-->
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
<!--
var rptlogin = new ewrpt_Page("rptlogin");
// extend page with ValidateForm function
rptlogin.ValidateForm = function(fobj)
{
	if (!this.ValidateRequired)
		return true; // ignore validation
	if (!ewrpt_HasValue(fobj.username))
		return ewrpt_OnError(fobj.username, ewLanguage.Phrase("EnterUid"));
	if (!ewrpt_HasValue(fobj.password))
		return ewrpt_OnError(fobj.password, ewLanguage.Phrase("EnterPwd"));
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
rptlogin.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
// requires js validation
<% If (EWRPT_CLIENT_VALIDATE) Then %>
rptlogin.ValidateRequired = true;
<% Else %>
rptlogin.ValidateRequired = false;
<% End If %>
//-->
</script>
<table><tr><td class="ewPadding">
<div class="ewTitle"><%= ReportLanguage.Phrase("LoginPage") %></div><br><br>
<% rptlogin.ShowMessage() %>
<form action="" method="post" onSubmit="return rptlogin.ValidateForm(this);">
<table border="0" cellspacing="0" cellpadding="4">
	<tr>
		<td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Username") %></span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="username" size="20" value="<%= rptlogin.Username %>" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Password") %></span></td>
		<td><span class="aspnetreportmaker"><input type="password" name="password" size="20" /></span></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><span class="aspnetreportmaker"><input type="submit" name="submit" value="<%= ReportLanguage.Phrase("Login") %>" /></span></td>
	</tr>
</table>
</form>
<br>
</td></tr></table>
<script language="JavaScript" type="text/javascript">
<!--
// Write your startup script here
// document.write("page loaded");
//-->
</script>
</asp:Content>
