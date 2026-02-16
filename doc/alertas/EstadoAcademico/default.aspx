<%@ Page ClassName="_default" Language="C#" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	public crrptdefault rptdefault;

	//
	// Page class
	//
	public class crrptdefault: AspNetReportMakerPage, IDisposable {

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
		public _default AspNetPage { 
			get { return (_default)m_ParentPage; }
		}

		//
		// Page class constructor
		//
		public crrptdefault(AspNetReportMaker4_project1 APage) {		
			m_ParentPage = APage;
			m_Page = this;
			m_PageID = "rptdefault";
			m_PageObjName = "rptdefault";
			m_PageObjTypeName = "crrptdefault";

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

		//
		// Page main
		//
		public void Page_Main() {
			Page_Terminate("EstadoAcademicosmry.aspx");
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
	}

	//
	// ASP.NET Page_Load event
	//

	protected void Page_Load(object sender, System.EventArgs e) {
		gsDebugMsg = "";

		// Page init
		rptdefault = new crrptdefault(this);
		rptdefault.Page_Init();

		// Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER;
		Response.Cache.SetCacheability(HttpCacheability.NoCache);

		// Page main processing
		rptdefault.Page_Main();
	}

	//
	// ASP.NET Page_Unload event
	//

	protected void Page_Unload(object sender, System.EventArgs e) {

		// Dispose page object
		if (rptdefault != null) rptdefault.Dispose();
	}
</script>
