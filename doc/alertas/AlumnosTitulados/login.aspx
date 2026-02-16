<%@ Page ClassName="login" Language="C#" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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

	// Page object
	public crrptlogin rptlogin;

	//
	// Page class
	//
	public class crrptlogin: AspNetReportMakerPage, IDisposable {

		// Page URL
		public string PageUrl() {
			string sUrl = ew_CurrentPage() + "?";
			return sUrl;
		}

		// Message
		public string Message {
			get {
				return Convert.ToString(ew_Session[EWRPT_SESSION_MESSAGE]);
			}	
			set {
				if (ew_NotEmpty(ew_Session[EWRPT_SESSION_MESSAGE])) { // Append
					ew_Session[EWRPT_SESSION_MESSAGE] += "<br>" + value;
				} else {
					ew_Session[EWRPT_SESSION_MESSAGE] = value;
				}
			}
		}

		// Show message
		public void ShowMessage() {
			string sMessage = Message;
			Message_Showing(ref sMessage);
			if (ew_NotEmpty(sMessage)) { // Message in Session, display
				ew_Write("<div class=\"ewMessage\">" + sMessage + "</div><br><br>");
				ew_Session[EWRPT_SESSION_MESSAGE] = ""; // Clear message in Session
			}
		}

		// Validate page request
		public bool IsPageRequest() {
			return true;
		}

		// ASP.NET page object
		public login AspNetPage { 
			get { return (login)m_ParentPage; }
		}

		//
		// Page class constructor
		//
		public crrptlogin(AspNetReportMaker4_project1 APage) {		
			m_ParentPage = APage;
			m_Page = this;
			m_PageID = "rptlogin";
			m_PageObjName = "rptlogin";
			m_PageObjTypeName = "crrptlogin";

			// Language object
			ReportLanguage = new crLanguage(this);

			// Open connection
			Conn = new cConnection();
		}

		// 
		//  Page_Init
		//
		public void Page_Init() {

			// Global Page Loading event (in userfn*.aspx)
			ParentPage.Page_Loading();

			// Page Load event
			Page_Load();
		}

		//
		//  Class terminate
		//  - clean up page object
		//
		public void Dispose()	{
			Page_Terminate("");
		}

		//
		// Page_Terminate
		//
		public void Page_Terminate(string url) {

			// Page Unload event
			Page_Unload();

			// Global Page Unloaded event (in userfn*.aspx)
			ParentPage.Page_Unloaded();

			 // Close connection
			Conn.Dispose();

			// Go to URL if specified
			if (ew_NotEmpty(url)) {
				HttpContext.Current.Response.Clear();
				HttpContext.Current.Response.Redirect(url);
			}			
		}

		public string Username = "";

		public string LoginType = "";

		private string sFilter = ""; 

		private string sPassword = ""; 

		private string sWhere = ""; 

		private string sGroupBy = ""; 

		private string sHaving = ""; 

		private string sOrderBy = "";			

		//
		// Page Main
		//
		public void Page_Main() {
			bool bValidPwd = false;
			if (!Security.IsLoggedIn())
				Security.AutoLogin(); // Auto login
			string sLastUrl = Security.LastUrl;
			if (ew_Empty(sLastUrl))
				sLastUrl = "default.aspx";
			if (HttpContext.Current.Request.RequestType == "POST") {
				bValidPwd = false;

				// Setup variables
				Username = ew_Post("Username");
				sPassword = ew_Post("Password");
				LoginType = ew_Post("rememberme").ToLower();				
				bool bValidate = ValidateForm(Username, sPassword);
				if (!bValidate)
					Message = gsFormError;
				if (bValidate) {
					if (Security.ValidateUser(Username, sPassword, false)) {

						// Write cookies
						if (LoginType == "a") {
							ew_Cookie["autologin"] = "autologin";
							ew_Cookie["username"] = cTEA.Encrypt(Username, EWRPT_RANDOM_KEY);
							ew_Cookie["Password"] = cTEA.Encrypt(sPassword, EWRPT_RANDOM_KEY);
							ew_Cookie["checksum"] = Convert.ToString(CRC32(MD5(EWRPT_RANDOM_KEY)));
						} else if (LoginType == "u") { 
							ew_Cookie["autologin"] = "rememberusername";
							ew_Cookie["username"] = cTEA.Encrypt(Username, EWRPT_RANDOM_KEY);
							ew_Cookie["checksum"] = Convert.ToString(CRC32(MD5(EWRPT_RANDOM_KEY)));
						} else {
							ew_Cookie["autologin"] = "";
						}
						ew_Session[EWRPT_SESSION_STATUS] = "login";
						Page_Terminate(sLastUrl); // Return to last accessed page
					} else {
						Message = ReportLanguage.Phrase("InvalidUidPwd");
					}
				}			
			}	else	{
				if (Security.IsLoggedIn()) {
					if (Message == "")
						Page_Terminate(sLastUrl); // Return to last accessed page
				}

				// Restore settings
				if (ew_SameStr(ew_Cookie["checksum"], CRC32(MD5(EWRPT_RANDOM_KEY))))
					Username = cTEA.Decrypt(ew_Cookie["username"], EWRPT_RANDOM_KEY);
				if (ew_Cookie["autologin"] == "autologin")	{
					LoginType = "a";
				} else if (ew_Cookie["autologin"] == "rememberusername") {
					LoginType = "u";
				}	else	{
					LoginType = "";
				}
			}	
		}	

		//
		// Validate form
		//
		public bool ValidateForm(string usr, string pwd) {

			// Initialize form error message
			gsFormError = "";

			// Check if validation required
			if (!EWRPT_SERVER_VALIDATE)
				return true;
			if (ew_Empty(usr)) {
				gsFormError += (ew_NotEmpty(gsFormError)) ? "<br>" : "";
				gsFormError += ReportLanguage.Phrase("EnterUid");
			}
			if (ew_Empty(pwd)) {
				gsFormError += (ew_NotEmpty(gsFormError)) ? "<br>" : "";
				gsFormError += ReportLanguage.Phrase("EnterPwd");
			}

			// Return validate result
			bool valid = (ew_Empty(gsFormError));

			// Call Form Custom Validate event
			string sFormCustomError = "";
			valid = valid && Form_CustomValidate(ref sFormCustomError);
			if (ew_NotEmpty(sFormCustomError)) {
				gsFormError += (ew_NotEmpty(gsFormError)) ? "<br>" : "";
				gsFormError += sFormCustomError;
			}
			return valid;
		}

		// Page Load event
		public void Page_Load() {

			//ew_Write("Page Load");
		}

		// Page Unload event
		public void Page_Unload() {

			//ew_Write("Page Unload");
		}

		// Message Showing event
		public void Message_Showing(ref string msg) {

			// Example:
			//msg = "your new message";

		}

		// Form Custom Validate event
		public bool Form_CustomValidate(ref string CustomError) {

			// Return error message in CustomError
			return true;
		}
	}

	//
	// ASP.NET Page_Load event
	//

	protected void Page_Load(object sender, System.EventArgs e) {
		gsDebugMsg = "";

		// Page init
		rptlogin = new crrptlogin(this);
		rptlogin.Page_Init();

		// Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER;
		Response.Cache.SetCacheability(HttpCacheability.NoCache);

		// Page main processing
		rptlogin.Page_Main();
	}

	//
	// ASP.NET Page_Unload event
	//

	protected void Page_Unload(object sender, System.EventArgs e) {

		// Dispose page object
		if (rptlogin != null) rptlogin.Dispose();
	}
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
<% if (EWRPT_CLIENT_VALIDATE) { %>
rptlogin.ValidateRequired = true;
<% } else { %>
rptlogin.ValidateRequired = false;
<% } %>

//-->
</script>
<table><tr><td class="ewPadding">
<div class="ewTitle"><%= ReportLanguage.Phrase("LoginPage") %></div><br><br>
<% rptlogin.ShowMessage(); %>
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
