using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.Common;
using System.Xml;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Reflection;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Globalization;
using Microsoft.VisualBasic;
using System.Data.SqlClient;

//
// ASP.NET Report Maker 4 - Functions
// (C) 2010 e.World Technology Ltd.
//
public partial class AspNetReportMaker4_project1 : System.Web.UI.Page
{

	//
	// Common base class
	//	
	public class AspNetReportMakerBase : AspNetMakerBase
	{

//		// Parent page (The ASP.NET page inherited from System.Web.UI.Page)
//		protected AspNetReportMaker4_project1 m_ParentPage;
		// Page (ASP.NET Report Maker page)

		protected AspNetReportMakerPage m_Page; 

//		// Parent page
//		public AspNetReportMaker4_project1 ParentPage { 
//			get { return m_ParentPage; }
//			set {	m_ParentPage = value; }	
//		}
		// Page
		public AspNetReportMakerPage Page { 
			get { return m_Page; }
			set {	m_Page = value; }						
		}

//		// Connection
//		public cConnection Conn {
//			get { return ParentPage.Conn; }
//			set { ParentPage.Conn = value; }
//		}
//		
//		// Security
//		public crAdvancedSecurity Security {
//			get { return ParentPage.Security; }
//			set { ParentPage.Security = value; }
//		}
		// Language
		public crLanguage ReportLanguage {
			get { return ParentPage.ReportLanguage; }
			set { ParentPage.ReportLanguage = value; }
		}
	}	

	//
	// Common page class
	//
	public class AspNetReportMakerPage : AspNetReportMakerBase
	{

		// Page ID
		protected string m_PageID = "";

		public string PageID {
			get { return m_PageID; }
		}

		// Table name
		protected string m_TableName = "";

		public string TableName {
			get { return m_TableName; }
		}

		// Page object name
		protected string m_PageObjName = "";

		public string PageObjName {
			get { return m_PageObjName; }
		}

		// Page object type name
		protected string m_PageObjTypeName = "";

		public string PageObjTypeName {
			get { return m_PageObjTypeName; }
		}

		// Page Name
		public string PageName {
			get { return ew_CurrentPage(); }
		}
	}

	//
	//  Language class (Report Maker)
	//
	public class crLanguage : AspNetReportMakerBase, IDisposable
	{
		string LanguageId;
		XmlDocument objDOM;
		StringDictionary Col;

		// Constructor
		public crLanguage(AspNetReportMakerPage APage)
		{
			m_Page = APage;
			m_ParentPage = APage.ParentPage;

			// Set up file list
			LoadFileList();

			// Set up language id
			if (ew_Get("language") != "") {
				LanguageId = ew_Get("language");
				ew_Session[EWRPT_SESSION_LANGUAGE_ID] = LanguageId;
			} else if (ew_NotEmpty(ew_Session[EWRPT_SESSION_LANGUAGE_ID])) {
				LanguageId = Convert.ToString(ew_Session[EWRPT_SESSION_LANGUAGE_ID]);
			}	else {
				LanguageId = EWRPT_LANGUAGE_DEFAULT_ID;
			}
			gsLanguage = LanguageId;
			Load(LanguageId);
		}

		// Terminate
		public void Dispose()
		{
			objDOM = null;
		}

		// Load language file list
		private void LoadFileList()
		{
			if (ewrpt_IsArray(EWRPT_LANGUAGE_FILE)) {
				for (int i = 0; i < EWRPT_LANGUAGE_FILE.GetLength(0); i++)
					EWRPT_LANGUAGE_FILE[i][1] = LoadFileDesc(HttpContext.Current.Server.MapPath(EWRPT_LANGUAGE_FOLDER + EWRPT_LANGUAGE_FILE[i][2]));
			}
		}

		// Load language file description
		private string LoadFileDesc(string File)
		{
			XmlTextReader xmlr = new XmlTextReader(File);
			xmlr.WhitespaceHandling = WhitespaceHandling.None;
			try {
				while (!xmlr.EOF) {
					xmlr.Read();
					if (xmlr.IsStartElement() && xmlr.Name == "ew-language")
						return xmlr.GetAttribute("desc");
				}
			}	finally {
				xmlr.Close();
			}
			return "";
		}

		// Load language file
		private void Load(string id)
		{
			string sFileName = GetFileName(id);
			if (sFileName == "")
				sFileName = GetFileName(EWRPT_LANGUAGE_DEFAULT_ID);
			if (sFileName == "") return; 
			if (EWRPT_USE_DOM_XML)	{
				objDOM = new XmlDocument();
				objDOM.Load(sFileName);
			}	else {
				if (ew_Session[EWRPT_PROJECT_NAME + "_" + sFileName] != null) {
					Col = (StringDictionary)ew_Session[EWRPT_PROJECT_NAME + "_" + sFileName];
				}	else {
					Col = new StringDictionary();
					XmlToCollection(sFileName);
					ew_Session[EWRPT_PROJECT_NAME + "_" + sFileName] = Col;
				}
			}
		}

		// Convert XML to Collection
		private void XmlToCollection(string File)
		{
			string Key = "/";
			string Id;
			string Name;
			int Index;
			XmlTextReader xmlr = new XmlTextReader(File);
			xmlr.WhitespaceHandling = WhitespaceHandling.None;
			try {
				while (!xmlr.EOF) {
					xmlr.Read();
					Name = xmlr.Name;
					Id = xmlr.GetAttribute("id");
					if (Name == "ew-language")
						continue; 
					switch (xmlr.NodeType) {
						case XmlNodeType.Element:
							if (xmlr.IsStartElement() && !xmlr.IsEmptyElement) {
								Key += Name + "/";
								if (Id != null)
									Key += Id + "/"; 
							}
							if (Id != null && xmlr.IsEmptyElement) {	// phrase
								Id = Name + "/" + Id;
								if (xmlr.GetAttribute("client") == "1")
									Id += "/1"; 
								if (Id != null)
									Col[Key + Id] = xmlr.GetAttribute("value"); 
							}
							break;
						case XmlNodeType.EndElement:
							Index = Key.LastIndexOf("/" + Name + "/");
							if (Index > -1)
								Key = Key.Substring(0, Index + 1); 
							break;
					}
				}
			}	finally {
				xmlr.Close();
			}
		}

		// Get language file name
		private string GetFileName(string Id)
		{
			if (ewrpt_IsArray(EWRPT_LANGUAGE_FILE)) {
				for (int i = 0; i < EWRPT_LANGUAGE_FILE.GetLength(0); i++) {
					if (EWRPT_LANGUAGE_FILE[i][0] == Id)
						return HttpContext.Current.Server.MapPath(EWRPT_LANGUAGE_FOLDER + EWRPT_LANGUAGE_FILE[i][2]);
				}
			}
			return "";
		}

		// Get node attribute
		private string GetNodeAtt(XmlNode Node, string Att)
		{
			if (Node != null)	{
				return ((XmlElement)Node).GetAttribute(Att);
			}	else {
				return "";
			}
		}

		// Get phrase
		public string Phrase(string Id)
		{
			if (EWRPT_USE_DOM_XML)	{
				return GetNodeAtt(objDOM.SelectSingleNode("//global/phrase[@id='" + Id.ToLower() + "']"), "value");
			}	else	{
				if (Col.ContainsKey("/global/phrase/" + Id.ToLower()))	{
					return Col["/global/phrase/" + Id.ToLower()];
				} else if (Col.ContainsKey("/global/phrase/" + Id.ToLower() + "/1")) {
					return Col["/global/phrase/" + Id.ToLower() + "/1"];
				}	else	{
					return "";
				}
			}
		}

		// Set phrase
		public void SetPhrase(string Id, string Value)
		{
			if (!EWRPT_USE_DOM_XML) {
				if (Col.ContainsKey("/global/phrase/" + Id.ToLower())) {
					Col["/global/phrase/" + Id.ToLower()] = Value;
				}	else if (Col.ContainsKey("/global/phrase/" + Id.ToLower() + "/1")) {
					Col["/global/phrase/" + Id.ToLower() + "/1"] = Value;
				}
			}
		}

		// Get project phrase
		public string ProjectPhrase(string Id)
		{
			if (EWRPT_USE_DOM_XML)	{
				return GetNodeAtt(objDOM.SelectSingleNode("//project/phrase[@id='" + Id.ToLower() + "']"), "value");
			}	else {
				return Col["/project/phrase/" + Id.ToLower()];
			}
		}

		// Set project phrase
		public void SetProjectPhrase(string Id, string Value)
		{
			if (!EWRPT_USE_DOM_XML)
				Col["/project/phrase/" + Id.ToLower()] = Value;
		}

		// Get menu phrase
		public string MenuPhrase(string MenuId, string Id)
		{
			if (EWRPT_USE_DOM_XML) {
				return GetNodeAtt(objDOM.SelectSingleNode("//project/menu[@id='" + MenuId + "']/phrase[@id='" + Id.ToLower() + "']"), "value");
			}	else	{
				return Col["/project/menu/" + MenuId + "/phrase/" + Id.ToLower()];
			}
		}

		// Set menu phrase
		public void SetMenuPhrase(string MenuId, string Id, string Value)
		{
			if (!EWRPT_USE_DOM_XML)
				Col["/project/menu/" + MenuId + "/phrase/" + Id.ToLower()] = Value;
		}

		// Get table phrase
		public string TablePhrase(string TblVar, string Id)
		{
			if (EWRPT_USE_DOM_XML)	{
				return GetNodeAtt(objDOM.SelectSingleNode("//project/table[@id='" + TblVar.ToLower() + "']/phrase[@id='" + Id.ToLower() + "']"), "value");
			}	else	{
				return Col["/project/table/" + TblVar.ToLower() + "/phrase/" + Id.ToLower()];
			}
		}

		// Set table phrase
		public void SetTablePhrase(string TblVar, string Id, string Value)
		{
			if (!EWRPT_USE_DOM_XML)
				Col["/project/table/" + TblVar.ToLower() + "/phrase/" + Id.ToLower()] = Value;
		}

		// Get chart phrase
		public string ChartPhrase(string TblVar, string ChtVar, string Id)
		{
			if (EWRPT_USE_DOM_XML) {
				return GetNodeAtt(objDOM.SelectSingleNode("//project/table[@id='" + TblVar.ToLower() + "']/chart[@id='" + ChtVar.ToLower() + "']/phrase[@id='" + Id.ToLower() + "']"), "value");
			}	else	{
				return Col["/project/table/" + TblVar.ToLower() + "/chart/" + ChtVar.ToLower() + "/phrase/" + Id.ToLower()];
			}
		}		

		// Set chart phrase
		public void SetChartPhrase(string TblVar, string ChtVar, string Id, string Value)
		{
			if (!EWRPT_USE_DOM_XML)
				Col["/project/table/" + TblVar.ToLower() + "/chart/" + ChtVar.ToLower() + "/phrase/" + Id.ToLower()] = Value;
		}

		// Get field phrase
		public string FieldPhrase(string TblVar, string FldVar, string Id)
		{
			if (EWRPT_USE_DOM_XML) {
				return GetNodeAtt(objDOM.SelectSingleNode("//project/table[@id='" + TblVar.ToLower() + "']/field[@id='" + FldVar.ToLower() + "']/phrase[@id='" + Id.ToLower() + "']"), "value");
			}	else	{
				return Col["/project/table/" + TblVar.ToLower() + "/field/" + FldVar.ToLower() + "/phrase/" + Id.ToLower()];
			}
		}		

		// Set field phrase
		public void SetFieldPhrase(string TblVar, string FldVar, string Id, string Value)
		{
			if (!EWRPT_USE_DOM_XML)
				Col["/project/table/" + TblVar.ToLower() + "/field/" + FldVar.ToLower() + "/phrase/" + Id.ToLower()] = Value;
		}

		// Output XML as JSON
		public string XmlToJSON(string XPath)
		{
			string Id;
			string Value;
			XmlNodeList NodeList = objDOM.SelectNodes(XPath);
			string Str = "{";
			foreach (XmlNode Node in NodeList) {
				Id = GetNodeAtt(Node, "id");
				Value = GetNodeAtt(Node, "value");
				Str += "\"" + ew_JsEncode2(Id) + "\":\"" + ew_JsEncode2(Value) + "\",";
			}
			if (Str.EndsWith(","))
				Str = Str.Substring(0, Str.Length - 1); 
			Str += "}\r\n";
			return Str;
		}

		// Output collection as JSON
		public string CollectionToJSON(string Prefix, string Suffix)
		{
			string Id;
			int Pos;
			string Str = "{";
			foreach (string Name in Col.Keys) {
				if (Name.StartsWith(Prefix))	{
					if (Suffix != "" && Name.EndsWith(Suffix))	{
						Pos = Name.LastIndexOf(Suffix);
						Id = Name.Substring(Prefix.Length, Pos - Prefix.Length);
					}	else	{
						Id = Name.Substring(Prefix.Length);
					}
					Str += "\"" + ew_JsEncode2(Id) + "\":\"" + ew_JsEncode2(Col[Name]) + "\",";
				}
			}
			if (Str.EndsWith(","))
				Str = Str.Substring(0, Str.Length - 1); 
			Str += "}\r\n";
			return Str;
		}

		// Output all phrases as JSON
		public string AllToJSON()
		{
			if (EWRPT_USE_DOM_XML)	{
				return "var ewLanguage = new ew_Language(" + XmlToJSON("//global/phrase") + ");";
			}	else	{
				return "var ewLanguage = new ew_Language(" + CollectionToJSON("/global/phrase/", "") + ");";
			}
		}

		// Output client phrases as JSON
		public string ToJSON()
		{
			if (EWRPT_USE_DOM_XML)	{
				return "var ewLanguage = new ew_Language(" + XmlToJSON("//global/phrase[@client='1']") + ");";
			}	else	{
				return "var ewLanguage = new ew_Language(" + CollectionToJSON("/global/phrase/", "/1") + ");";
			}
		}
	}

	// ViewValue
	// return "&nbsp;" if empty
	public static string ewrpt_ViewValue(object value) {
		if (ew_NotEmpty(value))
			return Convert.ToString(value);
		else
			return "&nbsp;";
	}

	//
	// Base class for AspNetReportMakerBase
	//
	public class AspNetMakerBase
	{

		// Parent page (The ASP.NET page inherited from System.Web.UI.Page)
		protected AspNetReportMaker4_project1 m_ParentPage;

		// Parent page
		public AspNetReportMaker4_project1 ParentPage { 
			get { return m_ParentPage; }
			set {	m_ParentPage = value; }	
		}		

		// Connection
		public cConnection Conn {
			get { return ParentPage.Conn; }
			set { ParentPage.Conn = value; }
		}

		// Security
		public cAdvancedSecurity Security {
			get { return ParentPage.Security; }
			set { ParentPage.Security = value; }
		}
	}

	//
	// Advanced Security class (Report Maker)
	//
	public class cAdvancedSecurity : AspNetReportMakerBase
	{

		private ArrayList m_ArUserLevel;

		private ArrayList m_ArUserLevelPriv;

		private int[] m_ArUserLevelID;

		// Current User Level ID / User Level
		public int CurrentUserLevelID;

		public int CurrentUserLevel;

		// Current User ID / Parent User ID / User ID array
		public object CurrentUserID;

		public object CurrentParentUserID;

		private object[] m_ArUserID;

		// Init
		public cAdvancedSecurity(AspNetMakerBase APage) {

			//m_Page = APage;
			m_ParentPage = APage.ParentPage;			
			m_ArUserLevel = new ArrayList();
			m_ArUserLevelPriv = new ArrayList();

			// Init User Level
			CurrentUserLevelID = SessionUserLevelID;
			if (Information.IsNumeric(CurrentUserLevelID)) {
				if (CurrentUserLevelID >= -1)	{
					Array.Resize(ref m_ArUserLevelID, 1);
					m_ArUserLevelID[0] = CurrentUserLevelID;
				}
			}

			// Init User ID
			CurrentUserID = SessionUserID;
			CurrentParentUserID = SessionParentUserID;

			// Load user level (for TablePermission_Loading event)
			LoadUserLevel();
		}		

		// Session User ID
		public object SessionUserID {
			get { return Convert.ToString(ew_Session[EWRPT_SESSION_USER_ID]); }
			set {
				ew_Session[EWRPT_SESSION_USER_ID] = value;
				CurrentUserID = value;
			}
		}

		// Session parent User ID
		public object SessionParentUserID {
			get { return Convert.ToString(ew_Session[EWRPT_SESSION_PARENT_USER_ID]); }
			set {
				ew_Session[EWRPT_SESSION_PARENT_USER_ID] = value;
				CurrentParentUserID = value;
			}
		}

		// Current user name
		public string CurrentUserName {
			get { return Convert.ToString(ew_Session[EWRPT_SESSION_USER_NAME]); }
			set { ew_Session[EWRPT_SESSION_USER_NAME] = value; }
		}

		// Session User Level ID		
		public int SessionUserLevelID {
			get { return Convert.ToInt32(ew_Session[EWRPT_SESSION_USER_LEVEL_ID]); }
			set {
				ew_Session[EWRPT_SESSION_USER_LEVEL_ID] = value;
				CurrentUserLevelID = value;
			}
		}

		// Session User Level value	
		public int SessionUserLevel {
			get { return Convert.ToInt32(ew_Session[EWRPT_SESSION_USER_LEVEL]); }
			set {
				ew_Session[EWRPT_SESSION_USER_LEVEL] = value;
				CurrentUserLevel = value;
			}
		}

		// Can list
		public bool CanList {
			get { return ((CurrentUserLevel & EWRPT_ALLOW_LIST) == EWRPT_ALLOW_LIST); }
			set {
				if (value)	{
					CurrentUserLevel = (CurrentUserLevel | EWRPT_ALLOW_LIST);
				}	else	{
					CurrentUserLevel = (CurrentUserLevel & (~EWRPT_ALLOW_LIST));
				}
			}
		}

		// Can report
		public bool CanReport {
			get { return ((CurrentUserLevel & EWRPT_ALLOW_REPORT) == EWRPT_ALLOW_REPORT); }
			set {
				if (value)	{
					CurrentUserLevel = (CurrentUserLevel | EWRPT_ALLOW_REPORT);
				}	else	{
					CurrentUserLevel = (CurrentUserLevel & (~EWRPT_ALLOW_REPORT));
				}
			}
		}

		// Last URL
		public string LastUrl {
			get { return ew_Cookie["lasturl"]; }
		}

		// Save last URL
		public void SaveLastUrl() {
			string s = HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"];
			string q = HttpContext.Current.Request.ServerVariables["QUERY_STRING"];
			if (q != "") s += "?" + q; 
			if (LastUrl == s) s = ""; 
			ew_Cookie["lasturl"] = s;
		}

		// Auto login
		public bool AutoLogin() {
			if (ew_SameStr(ew_Cookie["autologin"], "autologin"))	{
				string sUsr = ew_Cookie["username"];
				string sPwd = ew_Cookie["password"];
				sUsr = cTEA.Decrypt(sUsr, EWRPT_RANDOM_KEY);
				sPwd = cTEA.Decrypt(sPwd, EWRPT_RANDOM_KEY);
				bool bValid = ValidateUser(sUsr, sPwd, true);
				return bValid;
			}	else	{
				return false;
			}
		}		

		// Validate user (Report Maker)
		public bool ValidateUser(string usr, string pwd, bool autologin) {
			bool result = false;
			return result;
		}		

		// No user level security
		public void SetUpUserLevel() {
		}

		// Load current user level
		public void LoadCurrentUserLevel(string Table)
		{
			LoadUserLevel();
			SessionUserLevel = CurrentUserLevelPriv(Table);
		}

		// Get current user privilege
		private int CurrentUserLevelPriv(string TableName)
		{
			int result = 0;
			if (IsLoggedIn())	{
				result = 0;
				for (int i = 0; i <= m_ArUserLevelID.GetUpperBound(0); i++) {
					result = result | GetUserLevelPrivEx(TableName, m_ArUserLevelID[i]);
				}
			}	else	{
				return 0;
			}
			return result;
		}

		// Get user level ID by user level name
		public int GetUserLevelID(string UserLevelName)
		{
			if (ew_SameStr(UserLevelName, "Administrator"))	{
				return -1;
			} else if (UserLevelName != "") {
				if (ew_IsArrayList(m_ArUserLevel)) {
					foreach (OrderedDictionary Row in m_ArUserLevel) {
						if (ew_SameStr(Row[1], UserLevelName)) {
							return ew_ConvertToInt(Row[0]);
						}
					}
				}
			}
			return -2;	// Unknown
		}		

		// Get user privilege based on table name and user level
		public int GetUserLevelPrivEx(string TableName, int UserLevelID)
		{
			if (ew_SameStr(UserLevelID, "-1")) { // System Administrator				
				return 127;	// 1+2+4+8+16+32+64
			} else if (UserLevelID >= 0) {
				if (ew_IsArrayList(m_ArUserLevelPriv)) {
					foreach (OrderedDictionary Row in m_ArUserLevelPriv) {
						if (ew_SameStr(Row[0], TableName) && ew_SameStr(Row[1], UserLevelID)) {
							return ew_ConvertToInt(Row[2]);
						}
					}
				}
			}
			return 0;
		}

		// Get current user level name
		public string CurrentUserLevelName()
		{
			return GetUserLevelName(CurrentUserLevelID);
		}

		// Get user level name based on user level
		public string GetUserLevelName(int UserLevelID)
		{
			if (ew_SameStr(UserLevelID, "-1")) {
				return "Administrator";
			} else if (UserLevelID >= 0) {
				if (ew_IsArrayList(m_ArUserLevel)) {
					foreach (OrderedDictionary Row in m_ArUserLevel) {
						if (ew_SameStr(Row[0], UserLevelID))	{
							return Convert.ToString(Row[1]);
						}
					}
				}
			}
			return "";
		}

		// Display all the User Level settings (for debug only)
		public void ShowUserLevelInfo()
		{
			if (ew_IsArrayList(m_ArUserLevel)) {
				ew_Write("User Levels:<br>");
				ew_Write("UserLevelId, UserLevelName<br>");
				foreach (OrderedDictionary Row in m_ArUserLevel) {
					ew_Write("&nbsp;&nbsp;" + Row[0] + ", " + Row[1] + "<br>");
				}
			}	else {
				ew_Write("No User Level definitions." + "<br>");
			}
			if (ew_IsArrayList(m_ArUserLevelPriv)) {
				ew_Write("User Level Privs:<br>");
				ew_Write("TableName, UserLevelId, UserLevelPriv<br>");
				foreach (OrderedDictionary Row in m_ArUserLevelPriv) {
					ew_Write("&nbsp;&nbsp;" + Row[0] + ", " + Row[1] + ", " + Row[2] + "<br>");
				}
			}	else {
				ew_Write("No User Level privilege settings." + "<br>");
			}
			ew_Write("CurrentUserLevel = " + CurrentUserLevel + "<br>");
		}

		// Check privilege for List page (for menu items)
		public bool AllowList(string TableName)
		{
			return ew_ConvertToBool(CurrentUserLevelPriv(TableName) & EWRPT_ALLOW_LIST);
		}

		// Check if user is logged in
		public bool IsLoggedIn()
		{
			return ew_SameStr(ew_Session[EWRPT_SESSION_STATUS], "login");
		}

		// Check if user is system administrator
		public bool IsSysAdmin()
		{
			return (Convert.ToInt32(ew_Session[EWRPT_SESSION_SYSTEM_ADMIN]) == 1);
		}

		// Check if user is administrator
		public bool IsAdmin()
		{
			return (CurrentUserLevelID == -1 || IsSysAdmin());
		}

		// Save user level to session
		public void SaveUserLevel()
		{
			ew_Session[EWRPT_SESSION_AR_USER_LEVEL] = m_ArUserLevel;
			ew_Session[EWRPT_SESSION_AR_USER_LEVEL_PRIV] = m_ArUserLevelPriv;
		}

		// Load user level from session
		public void LoadUserLevel()
		{
			if (!ew_IsArrayList(ew_Session[EWRPT_SESSION_AR_USER_LEVEL]))	{
				SetUpUserLevel();
				SaveUserLevel();
			}	else	{
				m_ArUserLevel = (ArrayList)ew_Session[EWRPT_SESSION_AR_USER_LEVEL];
				m_ArUserLevelPriv = (ArrayList)ew_Session[EWRPT_SESSION_AR_USER_LEVEL_PRIV];
			}
		}

		// UserID Loading event
		public void UserID_Loading() {

			//ew_Write("UserID Loading: " + CurrentUserID + "<br>");
		}

		// UserID Loaded event
		public void UserID_Loaded() {

			//ew_Write("UserID Loaded: " + UserIDList() + "<br>");
		}

		// User Level Loaded event
		public void UserLevel_Loaded() {

			//AddUserPermission(<UserLevelName>, <TableName>, <UserPermission>);
			//DeleteUserPermission(<UserLevelName>, <TableName>, <UserPermission>);

		}
	}	

	// Trace (for debug only)
	public static void ew_Trace(object Msg)
	{
		try {
			string FileName = HttpContext.Current.Server.MapPath("debug.txt");
			StreamWriter sw = File.AppendText(FileName);
			sw.WriteLine(Convert.ToString(Msg));
			sw.Close();
		}	catch {
			if (EWRPT_DEBUG_ENABLED)
				throw; 
		}
	}

	// Encode HTML
	public static string ew_HtmlEncode(object Expression)
	{
		return HttpContext.Current.Server.HtmlEncode(Convert.ToString(Expression));
	}

	// Encode URL
	public static string ew_UrlEncode(object Expression)
	{
		return HttpContext.Current.Server.UrlEncode(Convert.ToString(Expression));
	}

	// Adjust SQL for special characters
	public static string ew_AdjustSql(object value)
	{
		string sWrk = Convert.ToString(value).Trim();
		sWrk = sWrk.Replace("'", "''");	// Adjust for single quote
		if (EWRPT_DB_QUOTE_START == "[")
			sWrk = sWrk.Replace("[", "[[]"); // Adjust for open square bracket
		return sWrk;
	}

	// Compare object as string
	public static bool ew_SameStr(object v1, object v2)
	{
		return string.Equals(Convert.ToString(v1).Trim(), Convert.ToString(v2).Trim());
	}

	// Compare object as string (case insensitive)
	public static bool ew_SameText(object v1, object v2)
	{
		return string.Equals(Convert.ToString(v1).Trim().ToLower(), Convert.ToString(v2).Trim().ToLower());
	}

	// Check if empty string
	public static bool ew_Empty(object value)
	{
		return string.Equals(Convert.ToString(value).Trim(), string.Empty);
	}

	// Check if not empty string
	public static bool ew_NotEmpty(object value)
	{
		return !ew_Empty(value);
	}

	// Convert object to integer
	public static int ew_ConvertToInt(object value)
	{
		try {
			return Convert.ToInt32(value);
		}	catch {
			return 0;
		}
	}

	// Convert object to double
	public static double ew_ConvertToDouble(object value)
	{
		try {
			return Convert.ToDouble(value);
		}	catch {
			return 0;
		}
	}

	// Convert object to bool
	public static bool ew_ConvertToBool(object value)
	{
		try {
			if (Information.IsNumeric(value)) {
				return Convert.ToBoolean(ew_ConvertToDouble(value));
			} else {
				return Convert.ToBoolean(value);
			}
		}	catch {
			return false;
		}
	}	

	//
	// Security shortcut functions
	//
	// Get current user name
	public static string CurrentUserName() {
		return Convert.ToString(ew_Session[EWRPT_SESSION_USER_NAME]);
	}

	// Get current user ID
	public static object CurrentUserID()
	{
		return Convert.ToString(ew_Session[EWRPT_SESSION_USER_ID]);
	}

	// Get current parent user ID
	public static object CurrentParentUserID()
	{
		return Convert.ToString(ew_Session[EWRPT_SESSION_PARENT_USER_ID]);
	}

	// Get current user level
	public static int CurrentUserLevel()
	{
		return Convert.ToInt32(ew_Session[EWRPT_SESSION_USER_LEVEL_ID]);
	}

	// Is Logged In
	public static bool IsLoggedIn()
	{
		return ew_SameStr(ew_Session[EWRPT_SESSION_STATUS], "login");
	}

	// Is System Admin
	public static bool IsSysAdmin()
	{
		return (Convert.ToInt32(ew_Session[EWRPT_SESSION_SYSTEM_ADMIN]) == 1);
	}

	// Is Admin
	public static bool IsAdmin()
	{
		return (Convert.ToInt32(ew_Session[EWRPT_SESSION_USER_LEVEL_ID]) == -1 || Convert.ToInt32(ew_Session[EWRPT_SESSION_SYSTEM_ADMIN]) == 1);
	}

	// MD5
	public static string MD5(string InputStr)
	{
		MD5CryptoServiceProvider Md5Hasher = new MD5CryptoServiceProvider();
		byte[] Data = Md5Hasher.ComputeHash(Encoding.Unicode.GetBytes(InputStr));
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i <= Data.Length - 1; i++) {
			sBuilder.Append(Data[i].ToString("x2"));
		}
		return sBuilder.ToString();
	}

	// CRC32
	public static uint CRC32(string InputStr) {
		byte[] bytes = Encoding.Unicode.GetBytes(InputStr);
		uint crc = 0xffffffff;
		uint poly	=	0xedb88320;
		uint[] table = new uint[256];
		uint temp = 0;
		for (uint i = 0; i < table.Length; ++i) {
			temp = i;
			for (int j = 8; j > 0; --j) {
				if ((temp & 1) == 1) {
					temp = (uint)((temp >> 1) ^ poly);
				} else {
					temp >>= 1;
				}
			}
			table[i] = temp;
		}
		for (int i = 0; i < bytes.Length; ++i) {
			byte index = (byte)(((crc) & 0xff) ^ bytes[i]);
			crc = (uint)((crc >> 8) ^ table[index]);
		}
		return ~crc;
	}

	// Load a text file
	public static string ew_LoadTxt(string fn)
	{
		string sTxt = "";
		if (ew_NotEmpty(fn))	{
			StreamReader sw = File.OpenText(fn);
			sTxt = sw.ReadToEnd();
			sw.Close();
		}
		return sTxt;
	}	

	//
	// Email class
	//
	public class cEmail
	{

		public string Sender = ""; // Sender		

		public string Recipient = ""; // Recipient		

		public string Cc = ""; // Cc		

		public string Bcc = ""; // Bcc		

		public string Subject = ""; // Subject		

		public string Format = ""; // Format		

		public string Content = ""; // Content		

		public string Charset = ""; // Charset

		public string SendErrNumber = ""; // Send error number

		public string SendErrDescription = ""; // Send error description		

		// Load email from template
		public void Load(string fn)
		{
			string sHeader;
			string[] arrHeader;
			string sName;
			string sValue;
			int i, j;
			string sWrk = ew_LoadTxt(fn);

			// Load text file content
			sWrk = sWrk.Replace("\r\n", "\n");

			// Convert to Lf
			sWrk = sWrk.Replace("\r", "\n");

			// Convert to Lf
			if (sWrk != "") {
				i = sWrk.IndexOf("\n" + "\n");

				// Locate header and mail content
				if (i > 0) {
					sHeader = sWrk.Substring(0, i + 1);
					Content = sWrk.Substring(i + 2);
					arrHeader = sHeader.Split(new char[] {'\n'});
					for (j = 0; j <= arrHeader.GetUpperBound(0); j++) {
						i = arrHeader[j].IndexOf(":");
						if (i > 0)
						{
							sName = arrHeader[j].Substring(0, i).Trim();
							sValue = arrHeader[j].Substring(i + 1).Trim();
							switch (sName.ToLower()) {
								case "subject":
									Subject = sValue;
									break;
								case "from":
									Sender = sValue;
									break;
								case "to":
									Recipient = sValue;
									break;
								case "cc":
									Cc = sValue;
									break;
								case "bcc":
									Bcc = sValue;
									break;
								case "format":
									Format = sValue;
									break;
							}
						}
					}
				}
			}
		}

		// Replace sender
		public void ReplaceSender(string ASender)
		{
			Sender = Sender.Replace("<!--$From-->", ASender);
		}

		// Replace recipient
		public void ReplaceRecipient(string ARecipient)
		{
			Recipient = Recipient.Replace("<!--$To-->", ARecipient);
		}

		// Add cc email
		public void AddCc(string ACc)
		{
			if (ACc != "") {
				if (Cc != "") Cc = Cc + ";"; 
				Cc = Cc + ACc;
			}
		}

		// Add bcc email
		public void AddBcc(string ABcc)
		{
			if (ABcc != "")	{
				if (Bcc != "") Bcc = Bcc + ";"; 
				Bcc = Bcc + ABcc;
			}
		}

		// Replace subject
		public void ReplaceSubject(string ASubject)
		{
			Subject = Subject.Replace("<!--$Subject-->", ASubject);
		}

		// Replace content
		public void ReplaceContent(string Find, string ReplaceWith)
		{
			Content = Content.Replace(Find, ReplaceWith);
		}

		// Send email
		public bool Send()
		{
			bool bSend = ewrpt_SendEmail(Sender, Recipient, Cc, Bcc, Subject, Content, "", "", Format, Charset);
			if (!bSend)
				SendErrDescription = gsEmailErrDesc; // Send error description
			return bSend;
		}

		// Display as string
		public string AsString()
		{
			return "{Sender: " + Sender + ", Recipient: " + Recipient + ", Cc: " + Cc + ", Bcc: " + Bcc + ", Subject: " + Subject + ", Format: " + Format + ", Content: " + Content + ", Charset: " + Charset + "}";
		}
	}

	//
	// Class for Pager item
	//
	public class cPagerItem
	{

		public string Text;

		public int Start;

		public bool Enabled;

		// Constructor
		public cPagerItem(int AStart, string AText, bool AEnabled)
		{
			Text = AText;
			Start = AStart;
			Enabled = AEnabled;
		}

		// Constructor
		public cPagerItem()
		{

			// Do nothing
		}
	}

	//
	// Class for Numeric pager
	//	
	public class cNumericPager
	{

		public ArrayList Items = new ArrayList();

		public int PageSize;

		public int ToIndex;

		public int Count;

		public int FromIndex;

		public int RecordCount;

		public int Range;

		public cPagerItem LastButton;

		public cPagerItem PrevButton;

		public cPagerItem FirstButton;

		public cPagerItem NextButton;

		public int ButtonCount;

		public bool Visible;

		// Constructor
		public cNumericPager(int AFromIndex, int APageSize, int ARecordCount, int ARange)
		{
			FromIndex = AFromIndex;
			PageSize = APageSize;
			RecordCount = ARecordCount;
			Range = ARange;
			FirstButton = new cPagerItem();
			PrevButton = new cPagerItem();
			NextButton = new cPagerItem();
			LastButton = new cPagerItem();
			Visible = true;
			Init();
		}

		// Init pager
		public void Init()
		{
			if (FromIndex > RecordCount) FromIndex = RecordCount; 
			ToIndex = FromIndex + PageSize - 1;
			if (ToIndex > RecordCount) ToIndex = RecordCount; 
			Count = 0;
			SetupNumericPager();

			// Update button count
			ButtonCount = Count + 1;
			if (FirstButton.Enabled) ButtonCount = ButtonCount + 1; 
			if (PrevButton.Enabled) ButtonCount = ButtonCount + 1; 
			if (NextButton.Enabled) ButtonCount = ButtonCount + 1; 
			if (LastButton.Enabled) ButtonCount = ButtonCount + 1; 
		}

		// Add pager item
		private void AddPagerItem(int StartIndex, string Text, bool Enabled)
		{
			Items.Add(new cPagerItem(StartIndex, Text, Enabled));
			Count = Items.Count;
		}

		// Setup pager items
		private void SetupNumericPager()
		{
			bool HasPrev;
			bool NoNext;
			int dy2;
			int dx2;
			int y;
			int x;
			int dx1;
			int dy1;
			int ny;
			int TempIndex;
			if (RecordCount > PageSize)	{
				NoNext = (RecordCount < (FromIndex + PageSize));
				HasPrev = (FromIndex > 1);

				// First Button
				TempIndex = 1;
				FirstButton.Start = TempIndex;
				FirstButton.Enabled = (FromIndex > TempIndex);

				// Prev Button
				TempIndex = FromIndex - PageSize;
				if (TempIndex < 1) TempIndex = 1; 
				PrevButton.Start = TempIndex;
				PrevButton.Enabled = HasPrev;

				// Page links
				if (HasPrev | !NoNext) {
					x = 1;
					y = 1;
					dx1 = ((FromIndex - 1) / (PageSize * Range)) * PageSize * Range + 1;
					dy1 = ((FromIndex - 1) / (PageSize * Range)) * Range + 1;
					if ((dx1 + PageSize * Range - 1) > RecordCount)	{
						dx2 = (RecordCount / PageSize) * PageSize + 1;
						dy2 = (RecordCount / PageSize) + 1;
					}	else {
						dx2 = dx1 + PageSize * Range - 1;
						dy2 = dy1 + Range - 1;
					}
					while (x <= RecordCount) {
						if (x >= dx1 & x <= dx2) {
							AddPagerItem(x, Convert.ToString(y), FromIndex != x);
							x = x + PageSize;
							y = y + 1;
						}
else if (x >= (dx1 - PageSize * Range) & x <= (dx2 + PageSize * Range)) {
							if (x + Range * PageSize < RecordCount)	{
								AddPagerItem(x, y + "-" + (y + Range - 1), true);
							}	else {
								ny = (RecordCount - 1) / PageSize + 1;
								if (ny == y) {
									AddPagerItem(x, Convert.ToString(y), true);
								}	else {
									AddPagerItem(x, y + "-" + ny, true);
								}
							}
							x = x + Range * PageSize;
							y = y + Range;
						}	else {
							x = x + Range * PageSize;
							y = y + Range;
						}
					}
				}

				// Next Button
				NextButton.Start = FromIndex + PageSize;
				TempIndex = FromIndex + PageSize;
				NextButton.Start = TempIndex;
				NextButton.Enabled = !NoNext;

				// Last Button
				TempIndex = ((RecordCount - 1) / PageSize) * PageSize + 1;
				LastButton.Start = TempIndex;
				LastButton.Enabled = (FromIndex < TempIndex);
			}
		}
	}

	//
	// Class for PrevNext pager
	//
	public class cPrevNextPager
	{

		public cPagerItem NextButton;

		public cPagerItem FirstButton;

		public cPagerItem PrevButton;

		public cPagerItem LastButton;

		public int ToIndex;

		public int PageCount;

		public int CurrentPage;

		public int PageSize;

		public int FromIndex;

		public int RecordCount;

		public bool Visible;

		// Constructor
		public cPrevNextPager(int AFromIndex, int APageSize, int ARecordCount)
		{
			FromIndex = AFromIndex;
			PageSize = APageSize;
			RecordCount = ARecordCount;
			FirstButton = new cPagerItem();
			PrevButton = new cPagerItem();
			NextButton = new cPagerItem();
			LastButton = new cPagerItem();
			Visible = true;
			Init();
		}

		// Method to init pager
		public void Init()
		{
			int TempIndex;
			if (PageSize > 0) {
				CurrentPage = (FromIndex - 1) / PageSize + 1;
				PageCount = (RecordCount - 1) / PageSize + 1;
				if (FromIndex > RecordCount) FromIndex = RecordCount; 
				ToIndex = FromIndex + PageSize - 1;
				if (ToIndex > RecordCount) ToIndex = RecordCount; 

				// First Button
				TempIndex = 1;
				FirstButton.Start = TempIndex;
				FirstButton.Enabled = (TempIndex != FromIndex);

				// Prev Button
				TempIndex = FromIndex - PageSize;
				if (TempIndex < 1) TempIndex = 1; 
				PrevButton.Start = TempIndex;
				PrevButton.Enabled = (TempIndex != FromIndex);

				// Next Button
				TempIndex = FromIndex + PageSize;
				if (TempIndex > RecordCount) TempIndex = FromIndex; 
				NextButton.Start = TempIndex;
				NextButton.Enabled = (TempIndex != FromIndex);

				// Last Button
				TempIndex = ((RecordCount - 1) / PageSize) * PageSize + 1;
				LastButton.Start = TempIndex;
				LastButton.Enabled = (TempIndex != FromIndex);
			}
		}
	}

	// Menu class
	public class cMenu : AspNetReportMakerBase
	{

		public object Id;

		public bool IsRoot;

		public ArrayList ItemData = new ArrayList(); // ArrayList of cMenuItem

		// Constructor
		public cMenu(object AId, bool ARoot)
		{
			Id = AId;
			IsRoot = ARoot;
		}

		// Add a menu item
		public void AddMenuItem(int id, string text, string url, int parentid, string src, string target, bool allowed)
		{
			cMenuItem oParentMenu = null;
			cMenuItem item = new cMenuItem(id, text, url, parentid, src, target, allowed);
			if (!MenuItem_Adding(ref item))
				return;
			if (item.ParentId < 0) {
				AddItem(ref item);
			}	else {
				if (FindItem(item.ParentId, ref oParentMenu))
					oParentMenu.AddItem(ref item);
			}
		}

		// Add item to internal ArrayList
		public void AddItem(ref cMenuItem item)
		{
			ItemData.Add(item);
		}

		// Find item
		public bool FindItem(int id, ref cMenuItem outitem)
		{
			bool result = false;
			cMenuItem item;
			result = false;
			for (int i = 0; i <= ItemData.Count - 1; i++) {
				item = (cMenuItem)ItemData[i];
				if (item.Id == id) {
					outitem = item;
					return true;
				} else if (item.SubMenu != null) {
					if (item.SubMenu.FindItem(id, ref outitem))
						return true;
				}
			}
			return result;
		}

		// Check if a menu item should be shown
		public bool RenderItem(cMenuItem item) {
			if (item.SubMenu != null) {
				foreach (cMenuItem subitem in item.SubMenu.ItemData) {
					if (item.SubMenu.RenderItem(subitem))
						return true;
				}
			}
			return (item.Allowed && ew_NotEmpty(item.Url));
		}

		// Check if this menu should be rendered
		public bool RenderMenu() {
			foreach (cMenuItem item in ItemData) {
				if (RenderItem(item))
					return true;
			}
			return false;
		}

		// Render the menu
		public void Render()
		{
			if (!RenderMenu())
				return;			
			ew_Write("<ul");
			if (ew_NotEmpty(Id))	{
				if (Information.IsNumeric(Id))	{
					ew_Write(" id=\"menu_" + Id + "\"");
				}	else {
					ew_Write(" id=\"" + Id + "\"");
				}
			}
			if (IsRoot)
				ew_Write(" class=\"" + EWRPT_MENUBAR_CLASSNAME + "\"");
			ew_Write(">" + "\r\n");
			int itemcnt = ItemData.Count;
			for (int i = 0; i <= itemcnt - 1; i++) {
				cMenuItem item = (cMenuItem)ItemData[i];
				if (RenderItem(item)) {
					ew_Write("<li><a");
					if (item.SubMenu != null)
						ew_Write(" class=\"" + EWRPT_MENUBAR_SUBMENU_CLASSNAME + "\"");
					if (item.Url != "")
						ew_Write(" href=\"" + ew_HtmlEncode(item.Url) + "\"");
					if (item.Target != "")
						ew_Write(" target=\"" + ew_HtmlEncode(item.Target) + "\"");
					ew_Write(">" + item.Text + "</a>" + "\r\n");
					if (item.SubMenu != null)					
						((cMenu)item.SubMenu).Render();
					ew_Write("</li>" + "\r\n");
				}
			}
			ew_Write("</ul>" + "\r\n");
		}

		// Report MenuItem Adding event
		public bool MenuItem_Adding(ref cMenuItem Item) {

			//ew_Write(Item.AsString());
			// Return False if menu item not allowed

			return true;
		}
	}

	// Menu item class
	public class cMenuItem : AspNetReportMakerBase
	{

		public int Id;

		public string Text = "";

		public string Url = "";

		public int ParentId;

		public cMenu SubMenu = null;

		public string Source = "";

		public bool Allowed = true;

		public string Target = "";

		public cMenuItem(int AId, string AText, string AUrl, int AParentId, string ASource, string ATarget, bool AAllowed)
		{
			Id = AId;
			Text = AText;
			Url = AUrl;
			ParentId = AParentId;
			Source = ASource;
			Target = ATarget;
			Allowed = AAllowed;			
		}

		public void AddItem(ref cMenuItem item)
		{
			if (SubMenu == null)	{
				SubMenu = new cMenu(Id, false);				
			}
			SubMenu.AddItem(ref item);
		}

		public string AsString()	{
			string OutStr = "{ Id: " + Id + ", Text: " + Text + ", Url: " + Url + ", ParentId: " + ParentId;
			if (SubMenu == null)	{
				OutStr = OutStr + ", SubMenu: (Null)";
			}	else	{
				OutStr = OutStr + ", SubMenu: (Object)";
			}
			OutStr = OutStr + ", Source: " + Source;
			return OutStr + " }" + "<br>";
		}
	}

	// Allow list
	public bool AllowList(string TableName)
	{
		if (Security != null)	{
			return Security.AllowList(TableName);
		}	else {
			return true;
		}
	}

	//
	// Connection object (for Report Maker)
	//
	public class cConnection : IDisposable
	{

		public string ConnectionString = EWRPT_DB_CONNECTION_STRING;

		public SqlConnection Conn;

		public SqlTransaction Trans;

		private SqlConnection TempConn; 

		private SqlCommand TempCommand; 

		private SqlDataReader TempDataReader; 

		// Constructor
		public cConnection(string ConnStr)
		{
			ConnectionString = ConnStr;			
			Database_Connecting(ref ConnectionString);
			Conn = new SqlConnection(ConnectionString);			
			Conn.Open();
			OnConnected();
		}

		// Constructor
		public cConnection()
		{
			Database_Connecting(ref ConnectionString);
			Conn = new SqlConnection(ConnectionString);
			Conn.Open();
			OnConnected();
		}

		public void OnConnected()
		{
		}

		// Execute SQL
		public int Execute(string Sql)
		{
			try {
				SqlCommand Cmd = GetCommand(Sql);
				if (EWRPT_DEBUG_ENABLED)
					ew_SetDebugMsg("SQL: " + Sql + "<br>");					
				return Cmd.ExecuteNonQuery();
			}	catch {
				if (EWRPT_DEBUG_ENABLED)					
				 	throw;
				return -1;
			}
		}

		// Execute SQL and return first value of first row
		public object ExecuteScalar(string Sql)
		{
			try {
				SqlCommand Cmd = GetCommand(Sql);
				if (EWRPT_DEBUG_ENABLED)
					ew_SetDebugMsg("SQL: " + Sql + "<br>");
				return Cmd.ExecuteScalar();
			}	catch {
				if (EWRPT_DEBUG_ENABLED)					
				 	throw;
				return null;
			}
		}

		// Get data reader
		public SqlDataReader GetDataReader(string Sql)
		{
			try {
				SqlCommand Cmd = new SqlCommand();
				Cmd = GetCommand(Sql);
				if (EWRPT_DEBUG_ENABLED)
					ew_SetDebugMsg("SQL: " + Sql + "<br>");
				return Cmd.ExecuteReader();
			}	catch {
				if (EWRPT_DEBUG_ENABLED)					
				 	throw;
				return null;
			}
		}

		// Get temporary data reader
		public SqlDataReader GetTempDataReader(string Sql)
		{ 
			try {
				if (TempConn == null) {
					TempConn = new SqlConnection(ConnectionString);
					TempConn.Open();
				}
				if (TempCommand == null) {
					TempCommand = new SqlCommand(Sql, TempConn);
				}
				CloseTempDataReader();
				TempCommand.CommandText = Sql;
				if (EWRPT_DEBUG_ENABLED)
					ew_SetDebugMsg("SQL: " + Sql + "<br>");
				TempDataReader = TempCommand.ExecuteReader();			
				return TempDataReader;
			} catch {
				if (EWRPT_DEBUG_ENABLED)					
				 	throw;
				return null;
			}
		}

		// Close temporary data reader
		public void CloseTempDataReader()
		{
			if (TempDataReader != null)	{
				TempDataReader.Close();
				TempDataReader.Dispose();
			}			
		}

		// Get OrderedDictionary from data reader
		public OrderedDictionary GetRow(ref SqlDataReader dr)
		{
			OrderedDictionary od = new OrderedDictionary();
			for (int i = 0; i <= dr.FieldCount - 1; i++) {
				string name = dr.GetName(i);
				if (name == "")
					name = Convert.ToString(i);
				od[name] = dr[i];
			}
			return od;
		}

		// Get rows
		public ArrayList GetRows(ref SqlDataReader dr)
		{
			ArrayList Rows = new ArrayList();
			while (dr.Read()) {
				Rows.Add(GetRow(ref dr));
			}
			return Rows;
		}

		// Get rows by SQL
		public ArrayList GetRows(string Sql)
		{
			SqlDataReader dr = GetTempDataReader(Sql);
			try {
				ArrayList Rows = GetRows(ref dr); 
				if (EWRPT_DEBUG_ENABLED)
					ew_SetDebugMsg("RecordCount: " + Rows.Count + "<br>");
				return Rows;
			} catch {
				if (EWRPT_DEBUG_ENABLED)					
				 	throw;			
			} finally {
				CloseTempDataReader();
			}
			return new ArrayList();
		}

		// Get dataset
		public DataSet GetDataSet(string Sql)
		{
			try {
				SqlDataAdapter Adapter = new SqlDataAdapter(Sql, Conn);
				if (EWRPT_DEBUG_ENABLED)
					ew_SetDebugMsg("SQL: " + Sql + "<br>");
				DataSet DS = new DataSet();
				Adapter.Fill(DS);
				return DS;
			}	catch {
				if (EWRPT_DEBUG_ENABLED)					
				 	throw;
				return null;
			}
		}

		// Get command
		public SqlCommand GetCommand(string Sql)
		{
			SqlCommand Cmd = new SqlCommand(Sql, Conn);
			if (Trans != null)
				Cmd.Transaction = Trans; 
			return Cmd;
		}

		// Dispose
		public void Dispose()
		{
			if (Conn != null) {
				Conn.Close();
				Conn.Dispose();
			}
			if (TempCommand != null)
				TempCommand.Dispose();
			if (TempConn != null) {
				TempConn.Close();
				TempConn.Dispose();
			}
		}

		// Database Connecting event
		public void Database_Connecting(ref string Connstr) {

			//ew_Write("Database Connecting");
		}
	}

	// Execute SQL
	public static int ew_Execute(string Sql)
	{
		cConnection c = new cConnection();
		try {
			return c.Execute(Sql);
		}	finally {
			c.Dispose();
		}
	}

	// Execute SQL and return first value of first row
	public static object ew_ExecuteScalar(string Sql)
	{
		cConnection c = new cConnection();
		try {
			return c.ExecuteScalar(Sql);
		}	finally {
			c.Dispose();
		}
	}

	// Execute SQL and return first row
	public static OrderedDictionary ew_ExecuteRow(string Sql)
	{
		SqlDataReader dr = null;
		cConnection c = new cConnection();
		try {
			dr = c.GetDataReader(Sql);
			if (dr != null && dr.Read()) {
				return c.GetRow(ref dr);
			} else {
				return null;
			}			
		}	finally {
			if (dr != null) {
				dr.Close();
				dr.Dispose();
			}
			c.Dispose();
		}
	}	

	// Functions for default date format
	// ANamedFormat = 0-8, where 0-4 same as VBScript
	// 5 = "yyyymmdd"
	// 6 = "mmddyyyy"
	// 7 = "ddmmyyyy"
	// 8 = Short Date + Short Time
	// 9 = "yyyymmdd HH:MM:SS"
	// 10 = "mmddyyyy HH:MM:SS"
	// 11 = "ddmmyyyy HH:MM:SS"
	// 12 = "HH:MM:SS"
	// Format date time based on format type
	public static string ew_FormatDateTime(object ADate, int ANamedFormat)
	{
		string sDT;
		if (Information.IsDate(ADate)) {
			DateTime DT = Convert.ToDateTime(ADate);
			if (ANamedFormat >= 0 && ANamedFormat <= 4)	{
				sDT = Strings.FormatDateTime(DT, (DateFormat)Enum.ToObject(typeof(DateFormat), ANamedFormat));
			} else if (ANamedFormat == 5 || ANamedFormat == 9) {
				sDT = DT.Year + EWRPT_DATE_SEPARATOR  + DT.Month + EWRPT_DATE_SEPARATOR  + DT.Day;
			} else if (ANamedFormat == 6 || ANamedFormat == 10) {
				sDT = DT.Month + EWRPT_DATE_SEPARATOR  + DT.Day + EWRPT_DATE_SEPARATOR  + DT.Year;
			} else if (ANamedFormat == 7 || ANamedFormat == 11) {
				sDT = DT.Day + EWRPT_DATE_SEPARATOR  + DT.Month + EWRPT_DATE_SEPARATOR  + DT.Year;
			} else if (ANamedFormat == 8) {
				sDT = Strings.FormatDateTime(DT, (DateFormat)Enum.ToObject(typeof(DateFormat), 2));
				if (DT.Hour != 0 || DT.Minute != 0 || DT.Second != 0)	{
					sDT = sDT + " " + DT.ToString("HH:mm:ss");
				}
			} else if (ANamedFormat == 12) {
				sDT = DT.ToString("HH:mm:ss");
			}	else	{
				return Convert.ToString(DT);
			}
			if (ANamedFormat >= 9 && ANamedFormat <= 11)	{
				sDT = sDT + " " + DT.ToString("HH:mm:ss");
			}
			return sDT;
		}	else	{
			return Convert.ToString(ADate);
		}
	}

	// Unformat date time based on format type
	public static string ew_UnFormatDateTime(object ADate, int ANamedFormat)
	{
		string[] arDate;
		string[] arDateTime;
		DateTime d;
		string sDT;
		string sDate = Convert.ToString(ADate).Trim();
		while (sDate.Contains("  ")) {
			sDate = sDate.Replace("  ", " ");
		}
		arDateTime = sDate.Split(new char[] {' '});
		if (ANamedFormat == 0 && Information.IsDate(sDate))	{
			d = Convert.ToDateTime(arDateTime[0]);
			sDT = d.ToString("yyyy/MM/dd");
			if (arDateTime.GetUpperBound(0) > 0)	{
				for (int i = 1; i <= arDateTime.GetUpperBound(0); i++) {
					sDT = sDT + " " + arDateTime[i];
				}
			}
			return sDT;
		}	else	{
			arDate = arDateTime[0].Split(new char[] {Convert.ToChar(EWRPT_DATE_SEPARATOR )});
			if (arDate.GetUpperBound(0) == 2)	{
				sDT = arDateTime[0];
				if (ANamedFormat == 6 || ANamedFormat == 10)	{	// mmddyyyy
					if (arDate[0].Length <= 2 && arDate[1].Length <= 2 && arDate[2].Length <= 4)	{
						sDT = arDate[2] + "/" + arDate[0] + "/" + arDate[1];
					}
				} else if (ANamedFormat == 7 || ANamedFormat == 11) {	// ddmmyyyy
					if (arDate[0].Length <= 2 && arDate[1].Length <= 2 && arDate[2].Length <= 4)	{
						sDT = arDate[2] + "/" + arDate[1] + "/" + arDate[0];
					}
				} else if (ANamedFormat == 5 || ANamedFormat == 9) { // yyyymmdd
					if (arDate[0].Length <= 4 && arDate[1].Length <= 2 && arDate[2].Length <= 2) {
						sDT = arDate[0] + "/" + arDate[1] + "/" + arDate[2];
					}
				}
				if (arDateTime.GetUpperBound(0) > 0)	{
					if (Information.IsDate(arDateTime[1]))	{	// Is time
						sDT = sDT + " " + arDateTime[1];
					}
				}
				return sDT;
			}	else {
				return sDate;
			}
		}
	}

	// Format currency
	public static string ew_FormatCurrency(object Expression, int NumDigitsAfterDecimal, TriState IncludeLeadingDigit, TriState UseParensForNegativeNumbers, TriState GroupDigits)
	{
		if (!Information.IsNumeric(Expression))
			return Convert.ToString(Expression);
		if (Convert.IsDBNull(Expression)) return String.Empty;
		return Strings.FormatCurrency(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits);
	}

	// Format number
	public static string ew_FormatNumber(object Expression, int NumDigitsAfterDecimal, TriState IncludeLeadingDigit, TriState UseParensForNegativeNumbers, TriState GroupDigits)
	{
		if (!Information.IsNumeric(Expression))
			return Convert.ToString(Expression);
		if (Convert.IsDBNull(Expression)) return String.Empty;
		return Strings.FormatNumber(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits);
	}	

	// Format percent
	public static string ew_FormatPercent(object Expression, int NumDigitsAfterDecimal, TriState IncludeLeadingDigit, TriState UseParensForNegativeNumbers, TriState GroupDigits)
	{
		if (!Information.IsNumeric(Expression))
			return Convert.ToString(Expression);
		if (Convert.IsDBNull(Expression)) return String.Empty;
		return Strings.FormatPercent(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits);
	}

	// Truncate memo field based on specified length, string truncated to nearest space or CrLf
	public static string ew_TruncateMemo(string memostr, int ln, bool removehtml)
	{
		int i, j, k;
		string str;
		if (removehtml) {
			str = ew_RemoveHtml(memostr); // Remove HTML
		} else {
			str = memostr;
		}
		if (str.Length > 0 && str.Length > ln)	{
			k = 0;
			while (k >= 0 && k < str.Length) {
				i = str.IndexOf(" ", k);
				j = str.IndexOf("\r\n", k);
				if (i < 0 && j < 0)	{	// Unable to truncate
					return str;
				}	else	{	// Get nearest space or CrLf
					if (i > 0 && j > 0)	{
						k = (i < j) ? i : j; 
					} else if (i > 0) {
						k = i;
					} else if (j > 0) {
						k = j;
					}

					// Get truncated text
					if (k >= ln) {
						return str.Substring(0, k) + "...";
					}	else {
						k = k + 1;
					}
				}
			}
		}
		return str;
	}

	// Remove Html tags from text
	public static string ew_RemoveHtml(string str)
	{
		return Regex.Replace(str, "<[^>]*>", string.Empty);
	}

	public static bool ew_IsValidOpr(string Opr, int FldType)
	{
		bool Valid = (Opr == "=" || Opr == "<" || Opr == "<=" || Opr == ">" || Opr == ">=" || Opr == "<>");
		if (FldType == EWRPT_DATATYPE_STRING || FldType == EWRPT_DATATYPE_MEMO)	{
			Valid = Valid || Opr == "LIKE" || Opr == "NOT LIKE" || Opr == "STARTS WITH";
		}
		return Valid;
	}

	// Quoted name for table/field
	public static string ew_QuotedName(string Name)
	{
		return EWRPT_DB_QUOTE_START + Name.Replace(EWRPT_DB_QUOTE_END, EWRPT_DB_QUOTE_END + EWRPT_DB_QUOTE_END) + EWRPT_DB_QUOTE_END;
	}

	// Quoted value for field type
	public static string ew_QuotedValue(object Value, int FldType)
	{
		switch (FldType) {
			case EWRPT_DATATYPE_STRING:
			case EWRPT_DATATYPE_MEMO:
				return "'" + ew_AdjustSql(Value) + "'";
			case EWRPT_DATATYPE_GUID:
				if (EWRPT_IS_MSACCESS)	{
					if (Convert.ToString(Value).StartsWith("{"))	{
						return Convert.ToString(Value);
					}	else	{
						return "{" + ew_AdjustSql(Value) + "}";
					}
				}	else	{
					return "'" + ew_AdjustSql(Value) + "'";
				}
				break;
			case EWRPT_DATATYPE_DATE:
			case EWRPT_DATATYPE_TIME:
				if (EWRPT_IS_MSACCESS)	{
					return "#" + ew_AdjustSql(Value) + "#";
				}	else	{
					return "'" + ew_AdjustSql(Value) + "'";
				}
				break;
			default:
				return Convert.ToString(Value);
		}
	}

	// Invoke method with no parameter
	public object ew_InvokeMethod(string name, object[] parameters) {
		MethodInfo mi = typeof(AspNetReportMaker4_project1).GetMethod(name);
		if (mi != null)	{
			return mi.Invoke(this, parameters);
		}	else {
			return false;
		}
	}	

	// Get field value
	public object ew_GetFieldValue(string name)
	{
		FieldInfo fi = typeof(AspNetReportMaker4_project1).GetField(name);
		return (fi != null) ? fi.GetValue(null) : null;		
	}

	// Check if object is ArrayList
	public static bool ew_IsArrayList(object obj)
	{
		return (obj != null) && (obj.GetType().ToString() == "System.Collections.ArrayList");
	}

	// Global random
	private static Random GlobalRandom = new Random();

	// Get a random number
	public static int ew_Random()
	{	
		lock (GlobalRandom) {
			Random NewRandom = new Random(GlobalRandom.Next());
			return NewRandom.Next();
		}
	}

	// Get query string value
	public static string ew_Get(string name)
	{
		if (HttpContext.Current.Request.QueryString[name] != null)	{
			return HttpContext.Current.Request.QueryString[name];
		}	else	{
			return "";
		}
	}

	// Get form value
	public static string ew_Post(string name)
	{
		if (HttpContext.Current.Request.Form[name] != null)	{
			return HttpContext.Current.Request.Form[name];
		}	else	{
			return "";
		}
	}

	// Get/set session values
	public static cSession ew_Session = new cSession();

	public class cSession
	{

		public object this[string name] {
			get { return HttpContext.Current.Session[name]; }
			set { HttpContext.Current.Session[name] = value; }
		}
	}

	// Get/set project cookie (for Report Maker)
	public static cCookie ew_Cookie = new cCookie();

	public class cCookie
	{

		public string this[string name] {
			get {
				if (HttpContext.Current.Request.Cookies[EWRPT_PROJECT_NAME] != null)		{
					return HttpContext.Current.Request.Cookies[EWRPT_PROJECT_NAME][name];
				}	else	{
					return "";
				}
			}
			set {
				HttpCookie c;
				if (HttpContext.Current.Request.Cookies[EWRPT_PROJECT_NAME] != null)	{
					c = HttpContext.Current.Request.Cookies[EWRPT_PROJECT_NAME];
				}	else {
					c = new HttpCookie(EWRPT_PROJECT_NAME);
				}
				c.Values[name] = value;
				c.Path = ew_AppPath();
				c.Expires = EWRPT_COOKIE_EXPIRY_TIME;
				HttpContext.Current.Response.Cookies.Add(c);				
			}
		}
	}

	// Response.Write
	public static void ew_Write(object value)
	{
		HttpContext.Current.Response.Write(value);
	}

	// Response.End
	public static void ew_End()
	{
		HttpContext.Current.Response.End();
	}

	//
	// TEA encrypt/decrypt class
	//
	public class cTEA
	{

		public static string Encrypt(string Data, string Key)
		{
			try
			{
				if (Data.Length == 0)
					throw new ArgumentException("Data must be at least 1 character in length.");
				uint[] formattedKey = FormatKey(Key);
				if (Data.Length % 2 != 0) Data += '\0'; // Make sure array is even in length.		
				byte[] dataBytes = Encoding.Unicode.GetBytes(Data);
				string cipher = string.Empty;
				uint[] tempData = new uint[2];
				for (int i=0; i<dataBytes.Length; i+=2)
				{
					tempData[0] = dataBytes[i];
					tempData[1] = dataBytes[i+1];
					code(tempData, formattedKey);
					cipher += ConvertUIntToString(tempData[0]) + ConvertUIntToString(tempData[1]);
				}
				return UrlEncode(cipher);
			} catch {
				return Data;
			}
		}

		public static string Decrypt(string Data, string Key)
		{
			try
			{
				Data = UrlDecode(Data);
				uint[] formattedKey = FormatKey(Key);
				int x = 0;
				uint[] tempData = new uint[2];
				byte[] dataBytes = new byte[Data.Length / 8 * 2];
				for (int i=0; i<Data.Length; i+=8)
				{
					tempData[0] = ConvertStringToUInt(Data.Substring(i, 4));
					tempData[1] = ConvertStringToUInt(Data.Substring(i+4, 4));
					decode(tempData, formattedKey);
					dataBytes[x++] = (byte)tempData[0];
					dataBytes[x++] = (byte)tempData[1];
				}
				string decipheredString = Encoding.Unicode.GetString(dataBytes, 0, dataBytes.Length);
				if (decipheredString[decipheredString.Length - 1] == '\0')
					decipheredString = decipheredString.Substring(0, decipheredString.Length - 1);
				return decipheredString;
			} catch {
				return Data;
			}
		}

		private static uint[] FormatKey(string Key)
		{
			if (Key.Length == 0)
				throw new ArgumentException("Key must be between 1 and 16 characters in length");
			Key = Key.PadRight(16, ' ').Substring(0, 16); // Ensure that the key is 16 chars in length.
			uint[] formattedKey = new uint[4];

			// Get the key into the correct format for TEA usage.
			int j = 0;
			for (int i=0; i<Key.Length; i+=4)
				formattedKey[j++] = ConvertStringToUInt(Key.Substring(i, 4));
			return formattedKey;
		}

		private static void code(uint[] v, uint[] k)
		{
			uint y = v[0];
			uint z = v[1];
			uint sum = 0;
			uint delta=0x9E3779B9;
			uint n=32;
			while (n-->0)
			{
				y += (z << 4 ^ z >> 5) + z ^ sum + k[sum & 3];
				sum += delta;
				z += (y << 4 ^ y >> 5) + y ^ sum + k[sum >> 11 & 3];
			}
			v[0]=y;
			v[1]=z;
		}

		private static void decode(uint[] v, uint[] k)
		{
			uint y=v[0];
			uint z=v[1];
			uint sum=0xC6EF3720;
			uint delta=0x9E3779B9;
			uint n=32;
			while (n-->0)
			{
				z -= (y << 4 ^ y >> 5) + y ^ sum + k[sum >> 11 & 3];
				sum -= delta;
				y -= (z << 4 ^ z >> 5) + z ^ sum + k[sum & 3];
			}
			v[0]=y;
			v[1]=z;
		}

		private static uint ConvertStringToUInt(string Input)
		{
			uint output;
			output =  ((uint)Input[0]);
			output += ((uint)Input[1] << 8);
			output += ((uint)Input[2] << 16);
			output += ((uint)Input[3] << 24);
			return output;
		}

		private static string ConvertUIntToString(uint Input)
		{
			StringBuilder output = new StringBuilder();
			output.Append((char)((Input & 0xFF)));
			output.Append((char)((Input >> 8) & 0xFF));
			output.Append((char)((Input >> 16) & 0xFF));
			output.Append((char)((Input >> 24) & 0xFF));
			return output.ToString();
		}

		private static string UrlEncode(string str)
		{
			UnicodeEncoding encoding = new UnicodeEncoding();
			str = Convert.ToBase64String(encoding.GetBytes(str));
			str = str.Replace('+', '-');
			str = str.Replace('/', '_');
			str = str.Replace('=', '.');
			return str;
		}

		private static string UrlDecode(string str)
		{
			str = str.Replace('-', '+');
			str = str.Replace('_', '/');
			str = str.Replace('.', '=');
			byte[] dataBytes = Convert.FromBase64String(str);
			UnicodeEncoding encoding = new UnicodeEncoding();
			return encoding.GetString(dataBytes);
		}
	}

		// Encode value for double-quoted JavaScript string
	public static string ew_JsEncode2(object val)
	{
		string outstr = Convert.ToString(val).Replace("\\", "\\\\");
		outstr = outstr.Replace("\"", "\\\"");
		outstr = outstr.Replace("\r\n", "<br>");
		outstr = outstr.Replace("\r", "<br>");
		outstr = outstr.Replace("\n", "<br>");
		return outstr;
	}

	// Get current page name
	public static string ew_CurrentPage()
	{
		return ew_GetPageName(HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"]);
	}

	// Calculate elapsed time
	public static string ew_CalcElapsedTime(long tm)
	{
		double endTimer = Environment.TickCount;
		return "<div>page processing time: " + Convert.ToString((endTimer - tm) / 1000) + " seconds</div>";
	}

	// Get page name
	public static string ew_GetPageName(string url)
	{
		if (ew_NotEmpty(url)) {
			if (url.Contains("?"))
				url = url.Substring(0, url.LastIndexOf("?"));	// Remove querystring first
			return url.Substring(url.LastIndexOf("/") + 1);	// Remove path
		}	else	{
			return "";
		}
	}

	// Adjust text for caption
	public static string ew_BtnCaption(string Caption)
	{
		int Min = 10;
		int Ln = Caption.Length;
		if (Ln < Min) {
			int Pad = Math.Abs(Convert.ToInt32((Min - Ln) / 2 * -1));
			return Caption.PadLeft(Ln + Pad).PadRight(Ln + Pad * 2);
		}	else {
			return Caption;
		}
	}

	// Get domain URL
	public static string ew_DomainUrl()
	{
		bool bSSL = !ew_SameText(HttpContext.Current.Request.ServerVariables["HTTPS"], "off") &&
			!ew_Empty(HttpContext.Current.Request.ServerVariables["HTTPS"]);
		string sUrl = (bSSL) ? "https": "http";
		string sPort = HttpContext.Current.Request.ServerVariables["SERVER_PORT"];
		string defPort = (bSSL) ? "443" : "80";
		sPort = (sPort == defPort) ? "" : ":" + sPort; 
		return sUrl + "://" + HttpContext.Current.Request.ServerVariables["SERVER_NAME"] + sPort;
	}

	// Get full URL
	public static string ew_FullUrl()
	{
		return ew_DomainUrl() + HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"];
	}

	// Get current URL
	public static string ew_CurrentUrl()
	{
		string s = HttpContext.Current.Request.ServerVariables["SCRIPT_NAME"];
		string q = HttpContext.Current.Request.ServerVariables["QUERY_STRING"];
		if (q != "")
			s += "?" + q;
		return s;
	}

	// Convert to full URL
	public static string ew_ConvertFullUrl(string url)
	{
		if (url == "")	{
			return "";
		} else if (url.Contains("://")) {
			return url;
		}	else	{
			string sUrl = ew_FullUrl();
			return sUrl.Substring(0, sUrl.LastIndexOf("/") + 1) + url;
		}
	}

	// Remove XSS
	public static string ew_RemoveXSS(object val)
	{
		string val_before;
		string pattern;
		string replacement;

		// Handle null value
		if (Convert.IsDBNull(val)) return Convert.ToString(val);

		// Remove all non-printable characters. CR(0a) and LF(0b) and TAB(9) are allowed 
		// This prevents some character re-spacing such as <java\0script> 
		// Note that you have to handle splits with \n, \r, and \t later since they *are* allowed in some inputs

		Regex regEx = new Regex("([\\x00-\\x08][\\x0b-\\x0c][\\x0e-\\x20])", RegexOptions.IgnoreCase);

		// Create regular expression.
		val = regEx.Replace(Convert.ToString(val), "");

		// Straight replacements, the user should never need these since they're normal characters 
		// This prevents like <IMG SRC=&#X40&#X61&#X76&#X61&#X73&#X63&#X72&#X69&#X70&#X74&#X3A&#X61&#X6C&#X65&#X72&#X74&#X28&#X27&#X58&#X53&#X53&#X27&#X29> 

		string search = "abcdefghijklmnopqrstuvwxyz";
		search = search + "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		search = search + "1234567890!@#$%^&*()";
		search = search + "~`\";:?+/={}[]-_|'\\";
		for (int i = 0; i <= search.Length - 1; i++) {

			// ;? matches the ;, which is optional 
			// 0{0,7} matches any padded zeros, which are optional and go up to 8 chars 
			// &#x0040 @ search for the hex values

			regEx = new Regex("(&#[x|X]0{0,8}" + Conversion.Hex(Strings.Asc(search[i])) + ";?)");

			// With a ;
			val = regEx.Replace(Convert.ToString(val), Convert.ToString(search[i]));

			// &#00064 @ 0{0,7} matches '0' zero to seven times
			regEx = new Regex("(&#0{0,8}" + Strings.Asc(search[i]) + ";?)");

			// With a ;
			val = regEx.Replace(Convert.ToString(val), Convert.ToString(search[i]));
		}

		// Now the only remaining whitespace attacks are \t, \n, and \r
		bool Found = true;

		// Keep replacing as long as the previous round replaced something 
		while (Found) {
			val_before = Convert.ToString(val);
			for (int i = 0; i <= EWRPT_REMOVE_XSS_KEYWORDS.GetUpperBound(0); i++) {
				pattern = "";
				for (int j = 0; j <= EWRPT_REMOVE_XSS_KEYWORDS[i].Length - 1; j++) {
					if (j > 0) {
						pattern = pattern + "(";
						pattern = pattern + "(&#[x|X]0{0,8}([9][a][b]);?)?";
						pattern = pattern + "|(&#0{0,8}([9][10][13]);?)?";
						pattern = pattern + ")?";
					}
					pattern = pattern + EWRPT_REMOVE_XSS_KEYWORDS[i][j];
				}
				replacement = EWRPT_REMOVE_XSS_KEYWORDS[i].Substring(0, 2) + "<x>" + EWRPT_REMOVE_XSS_KEYWORDS[i].Substring(2);

				// Add in <> to nerf the tag
				regEx = new Regex(pattern);
				val = regEx.Replace(Convert.ToString(val), replacement);

				// Filter out the hex tags
				if (ew_SameStr(val_before, val)) {

					// No replacements were made, so exit the loop
					Found = false;
				}
			}
		}
		return Convert.ToString(val);
	}

	// Return path of the uploaded file
	//	Parameter: If PhyPath is true(1), return physical path on the server
	//	           If PhyPath is false(0), return relative URL
	public static string ew_UploadPathEx(bool PhyPath, string DestPath)
	{
		int pos;
		string Path;
		if (DestPath.StartsWith("~/")) DestPath = DestPath.Substring(2); 
		if (PhyPath) {
			Path = HttpContext.Current.Request.ServerVariables["APPL_PHYSICAL_PATH"];
			Path = ew_PathCombine(Path, DestPath.Replace("/", "\\"), PhyPath); 
		}	else	{
			Path = ew_AppPath();
			Path = ew_PathCombine(Path, DestPath, PhyPath); 
		}
		return ew_IncludeTrailingDelimiter(Path, PhyPath);
	}

	// Get application root path (relative to domain)
	public static string ew_AppPath()
	{
		string Path = HttpContext.Current.Request.ServerVariables["APPL_MD_PATH"];
		int pos = Path.IndexOf("Root", StringComparison.InvariantCultureIgnoreCase);
		if (pos > 0)
			Path = Path.Substring(pos + 4); 
		return Path;
	}

	// Get path relative to application root
	public static string ew_ServerMapPath(string Path)
	{
		return ew_PathCombine(HttpContext.Current.Request.ServerVariables["APPL_PHYSICAL_PATH"], Path, true);
	}

	// Get path relative to a base path
	public static string ew_PathCombine(string BasePath, string RelPath, bool PhyPath)
	{
		int p2;
		int p1;
		string Path2;
		string Path;
		string Delimiter;
		BasePath = ew_RemoveTrailingDelimiter(BasePath, PhyPath);
		if (PhyPath) {
			Delimiter = "\\";
			RelPath = RelPath.Replace("/", "\\");
		}	else	{
			Delimiter = "/";
			RelPath = RelPath.Replace("\\", "/");
		}
		if (RelPath == "." | RelPath == "..") RelPath = RelPath + Delimiter; 
		p1 = RelPath.IndexOf(Delimiter);
		Path2 = "";
		while (p1 > -1) {
			Path = RelPath.Substring(0, p1 + 1);
			if (Path == Delimiter || Path == "." + Delimiter)	{

					// Skip
			} else if (Path == ".." + Delimiter) {
				p2 = BasePath.LastIndexOf(Delimiter);
				if (p2 > -1) BasePath = BasePath.Substring(0, p2); 
			}	else {
				Path2 += Path;
			}
			RelPath = RelPath.Substring(p1 + 1);
			p1 = RelPath.IndexOf(Delimiter);
		}
		return ew_IncludeTrailingDelimiter(BasePath, PhyPath) + Path2 + RelPath; 
	}

	// Remove the last delimiter for a path
	public static string ew_RemoveTrailingDelimiter(string Path, bool PhyPath)
	{
		string Delimiter;
		if (PhyPath) Delimiter = "\\"; 		else Delimiter = "/"; 
		while (Path.EndsWith(Delimiter)) {
			Path = Path.Substring(0, Path.Length - 1);
		}
		return Path;
	}

	// Include the last delimiter for a path
	public static string ew_IncludeTrailingDelimiter(string Path, bool PhyPath)
	{
		string Delimiter;
		Path = ew_RemoveTrailingDelimiter(Path, PhyPath);
		 Delimiter = (PhyPath) ? "\\" : "/"; 
		return Path + Delimiter;
	}

	// Create folder
	public static bool ew_CreateFolder(string folder)
	{
		try {
			DirectoryInfo di = Directory.CreateDirectory(folder);
			return (di != null);
		}	catch {
			return false;
		}
	}

	// Convert numeric value
	public static object ew_Conv(object v, int t)
	{
		if (Convert.IsDBNull(v)) return System.DBNull.Value; 
		switch (t) {
			case 20: // adBigInt
				return Convert.ToInt64(v);
			case 21: // adUnsignedBigInt
				return Convert.ToUInt64(v);
			case 2:
			case 16: // adSmallInt/adTinyInt
				return Convert.ToInt16(v);
			case 3: // adInteger
				return Convert.ToInt32(v);
			case 17:
			case 18: // adUnsignedTinyInt/adUnsignedSmallInt
				return Convert.ToUInt16(v);
			case 19: // adUnsignedInt
				return Convert.ToUInt32(v);
			case 4: // adSingle
				return Convert.ToSingle(v);
			case 5:
			case 6:
			case 131:
			case 139: // adDouble/adCurrency/adNumeric/adVarNumeric
				return Convert.ToDouble(v);
			default:
				return v;
		}
	}

	// Get script name
	public static string ew_ScriptName() {
		string sn = ew_ServerVar("SCRIPT_NAME");
		if (ew_Empty(sn)) sn = ew_ServerVar("PATH_INFO");
		if (ew_Empty(sn)) sn = ew_ServerVar("URL");
		if (ew_Empty(sn)) sn = "UNKNOWN";
		return sn;
	}

	// Get server variable by name
	public static string ew_ServerVar(string Name) {
		string str = HttpContext.Current.Request.ServerVariables[Name];
		if (ew_Empty(str))
			str = "";
		return str;
	}

	// Read global debug message
	public static string ew_DebugMsg() {
		return (ew_NotEmpty(gsDebugMsg)) ? "<p>" + gsDebugMsg + "</p>" : "";
	}

	// Write global debug message
	public static void ew_SetDebugMsg(string v) {
		if (ew_NotEmpty(gsDebugMsg))
			gsDebugMsg += "<br>";
		gsDebugMsg +=  v;
	}

	// Get distinct values
	public ArrayList ewrpt_GetDistinctValues(string FldOpr, string sql)
	{
		if (sql == "")
			return null;
		ArrayList ar = new ArrayList();
		ArrayList rswrk = Conn.GetRows(sql);
		if (rswrk.Count > 0) {
			ar.Add(ewrpt_ConvertValue(FldOpr, ((OrderedDictionary)rswrk[0])[0]));
			foreach (OrderedDictionary Row in rswrk) {				
				object wrkval = ewrpt_ConvertValue(FldOpr, Row[0]);
				if (!ew_SameStr(wrkval, ar[ar.Count - 1]))
					ar.Add(wrkval);
			}		
			return ar;
		}
		return null;
	}

	// Convert value
	public object ewrpt_ConvertValue(string FldOpr, object val)
	{
		if (Convert.IsDBNull(val)) {
			return EWRPT_NULL_VALUE;
		} else if (Convert.ToString(val) == "") {
			return EWRPT_EMPTY_VALUE;			
		}
		if (val.GetType().ToString() == "System.Double")
			val = Convert.ToDouble(val);
		DateTime DT;
		switch (FldOpr.ToLower()) {
			case "year":
				return Convert.ToDateTime(val).Year;
			case "quarter":
				DT = Convert.ToDateTime(val);
				return DT.Year + "|" + ewrpt_DatePart(DateInterval.Quarter, DT);
			case "month":
				DT = Convert.ToDateTime(val);
				return DT.Year + "|" + DT.Month;
			case "day":
				DT = Convert.ToDateTime(val);
				return DT.Year + "|" + DT.Month + "|" + DT.Day;
			case "date":
				DT = Convert.ToDateTime(val);
				return DT.Year + "/" + DT.Month + "/" + DT.Day;
		}
		return val;
	}

	// Dropdown display values
	public object ewrpt_DropDownDisplayValue(object v, string t, int fmt)
	{
		if (Convert.ToString(v) == EWRPT_NULL_VALUE) {
			return ReportLanguage.Phrase("NullLabel");			
		} else if (Convert.ToString(v) == EWRPT_EMPTY_VALUE) {
			return ReportLanguage.Phrase("EmptyLabel");
		} else if (ew_SameText(t, "boolean")) {
			return ewrpt_BooleanName(v);
		}
		string[] ar = Convert.ToString(v).Split(new char[] {'|'});
		switch (t.ToLower()) {
			case "year":
				return v;
			case "quarter":
				if (ar.GetUpperBound(0) >= 1)
					return ewrpt_QuarterName(ar[1]) + " " + ar[0];
				break;
			case "month":
				if (ar.GetUpperBound(0) >= 1)
					return ewrpt_MonthName(ar[1]) + " " + ar[0];
				break;
			case "day":
				if (ar.GetUpperBound(0) >= 2)
					return ew_FormatDateTime(Convert.ToDateTime(ar[0] + "/" + ar[1] + "/" + ar[2]), fmt);
				break;
			case "date":
				if (ewrpt_IsDate(v))
					return ew_FormatDateTime(v, fmt);
				break;
		}
		return v;
	}

	// Get Boolean Value
	public string ewrpt_BooleanValue(object v) {
		if (ew_SameText(v, "true") || ew_SameText(v, "yes") ||
			ew_SameText(v, "t") || ew_SameText(v, "y") || ew_SameText(v, "1")) {
			return EWRPT_BOOLEAN_YES;
		} else {
			return EWRPT_BOOLEAN_NO;
		}
	}

	// Get Boolean Name
	// - Treat "True" / "Yes" / "1" As True
	public string ewrpt_BooleanName(object v) {
		if (Convert.IsDBNull(v)) {
			return ReportLanguage.Phrase("NullLabel");
		} else if (ew_SameText(v, "true") || ew_SameText(v, "yes") ||
			ew_SameText(v, "t") || ew_SameText(v, "y") || ew_SameText(v, "1")) {
			return ReportLanguage.Phrase("BooleanYes");
		} else {
			return ReportLanguage.Phrase("BooleanNo");
		}
	}

	// Quarter name
	public string ewrpt_QuarterName(object q) {
		switch (Convert.ToInt32(q)) {
			case 1:
				return ReportLanguage.Phrase("Qtr1");
			case 2:
				return ReportLanguage.Phrase("Qtr2");
			case 3:
				return ReportLanguage.Phrase("Qtr3");
			case 4:
				return ReportLanguage.Phrase("Qtr4");
		}
		return "";
	}

	// Month name
	public string ewrpt_MonthName(object m)
	{
		switch (Convert.ToInt32(m)) {
			case 1:
				return ReportLanguage.Phrase("MonthJan");				
			case 2:
				return ReportLanguage.Phrase("MonthFeb");				
			case 3:
				return ReportLanguage.Phrase("MonthMar");				
			case 4:
				return ReportLanguage.Phrase("MonthApr");				
			case 5:
				return ReportLanguage.Phrase("MonthMay");				
			case 6:
				return ReportLanguage.Phrase("MonthJun");				
			case 7:
				return ReportLanguage.Phrase("MonthJul");				
			case 8:
				return ReportLanguage.Phrase("MonthAug");				
			case 9:
				return ReportLanguage.Phrase("MonthSep");				
			case 10:
				return ReportLanguage.Phrase("MonthOct");				
			case 11:
				return ReportLanguage.Phrase("MonthNov");				
			case 12:
				return ReportLanguage.Phrase("MonthDec");				
		}
		return "";
	}

	// Join array
	public static string ewrpt_JoinArray(object ar, string sep, int ft, int pos)
	{
		if (!ewrpt_IsArray(ar) && !ew_IsArrayList(ar))
			return "";
		string str = "";
		object[] arwrk = null;
		if (ew_IsArrayList(ar)) {
			arwrk = ((ArrayList)ar).ToArray();
		} else if (ewrpt_IsArray(ar)) {
			arwrk = (object[])ar;
		}
		int arwrkcnt = arwrk.Length;
		for (int i = pos; i < arwrkcnt; i++) {
			if (str != "") str += ", ";
			str += ew_QuotedValue(arwrk[i], ft);
		}
		return str;
	}

	// Join array
	public static string ewrpt_JoinArray(object ar, string sep, int ft)
	{
		return ewrpt_JoinArray(ar, sep, ft, 0);
	}

	// Build Report SQL
	public static string ewrpt_BuildReportSql(string sSelect, string sWhere, string sGroupBy, string sHaving, string sOrderBy, string sFilter, string sSort)
	{
		string sDbWhere = sWhere;
		if (ew_NotEmpty(sDbWhere))
			sDbWhere = "(" + sDbWhere + ")";
		if (ew_NotEmpty(sFilter))	{
			if (ew_NotEmpty(sDbWhere))
				sDbWhere = sDbWhere + " AND ";
			sDbWhere = sDbWhere + "(" + sFilter + ")";
		}
		string sDbOrderBy = ewrpt_UpdateSortFields(sOrderBy, sSort, 1);
		string sSql = sSelect;
		if (ew_NotEmpty(sDbWhere))
			sSql = sSql + " WHERE " + sDbWhere;
		if (ew_NotEmpty(sGroupBy))
			sSql = sSql + " GROUP BY " + sGroupBy;
		if (ew_NotEmpty(sHaving))
			sSql = sSql + " HAVING " + sHaving;
		if (ew_NotEmpty(sDbOrderBy))
			sSql = sSql + " ORDER BY " + sDbOrderBy;		
		return sSql;
	}

	// Update sort fields
	public static string ewrpt_UpdateSortFields(string sOrderBy, string sSort, int opt) {
		if (ew_Empty(sOrderBy)) {
			return (opt == 1) ? sSort : "";
		} else if (ew_Empty(sSort)) {
			return sOrderBy;
		} else { // Merge sort field list
			ArrayList arorderby = ewrpt_GetSortFlds(sOrderBy);
			int cntorderby = arorderby.Count;
			ArrayList arsort = ewrpt_GetSortFlds(sSort);
			int cntsort = arsort.Count;
			for (int i = 0; i < cntsort; i++) {

				// Get sort field				
				string sortfld = Convert.ToString(arsort[i]).Trim();				
				if (sortfld.ToUpper().EndsWith(" ASC")) {
					sortfld = sortfld.Substring(0, sortfld.Length - 4).Trim();
				} else if (sortfld.ToUpper().EndsWith(" DESC")) {
					sortfld = sortfld.Substring(0, sortfld.Length - 4).Trim();
				}
				string orderfld = "";
				for (int j = 0; j < cntorderby; j++) {

					// Get orderby field
					orderfld = Convert.ToString(arorderby[j]).Trim();
					if (orderfld.ToUpper().EndsWith(" ASC")) {
						orderfld = orderfld.Substring(0, orderfld.Length - 4).Trim();
					} else if (orderfld.ToUpper().EndsWith(" DESC")) {
						orderfld = orderfld.Substring(0, orderfld.Length - 4).Trim();
					}

					// Replace field
					if (ew_SameStr(orderfld, sortfld)) {
						arorderby[j] = arsort[i];
						break;
					}
				}

				// Append field
				if (opt == 1 && !ew_SameStr(orderfld, sortfld))
					arorderby.Add(arsort[i]);
			}
			return String.Join(", ", (string[])arorderby.ToArray(typeof(string)));
		}
	}

	// Get sort fields
	public static ArrayList ewrpt_GetSortFlds(string flds) {
		int offset = -1;
		int fldpos = 0;
		string orderfld;
		ArrayList ar = new ArrayList();
		offset = flds.IndexOf(",", offset + 1);
		while (offset > -1) {
			orderfld = flds.Substring(fldpos, offset - fldpos);
			if (orderfld.ToUpper().EndsWith(" ASC") || orderfld.ToUpper().EndsWith(" DESC")) {
				fldpos = offset + 1;
				ar.Add(orderfld);
			}
			offset = flds.IndexOf(",", offset + 1);
		}
		ar.Add(flds.Substring(fldpos));
		return ar;
	}

	// Get reverse sort
	public static string ewrpt_ReverseSort(object sorttype) {
		return (ew_SameText(sorttype, "ASC")) ? "DESC" : "ASC";
	}

	// Construct a crosstab field name
	public static string ewrpt_CrossTabField(string smrytype, object smryfld, object colfld, string datetype, object val, object qc, string alias)
	{
		string ReturnValue = "";
		string wrkval;
		string wrkqc;
		if (ew_SameStr(val, EWRPT_NULL_VALUE)) {
			wrkval = "NULL";
			wrkqc = "";
		} else if (ew_SameStr(val, EWRPT_EMPTY_VALUE)) {
			wrkval = "";
			wrkqc = Convert.ToString(qc);
		}	else {
			wrkval = Convert.ToString(val);
			wrkqc = Convert.ToString(qc);
		}
		switch (smrytype) {
			case "SUM":
				ReturnValue = smrytype + "(" + smryfld + "*" + ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) + ")";
				break;
			case "COUNT":
				ReturnValue = "SUM(" + ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) + ")";
				break;
			case "MIN":
			case "MAX":
				string aggwrk = ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc);
				if (EWRPT_IS_MSACCESS) {
					ReturnValue = smrytype + "(IIf(" + aggwrk + "=0,NULL," + smryfld + "))";
				} else if (EWRPT_IS_MSSQL || EWRPT_IS_ORACLE) {
					ReturnValue = smrytype + "(CASE " + aggwrk + " WHEN 0 THEN NULL ELSE " + smryfld + " END)";
				} else if (EWRPT_IS_MYSQL) {
					ReturnValue = smrytype + "(IF(" + aggwrk + "=0,NULL," + smryfld + "))";				
				}
				break;
			case "AVG":
				string sumwrk = "SUM(" + smryfld + "*" + ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) + ")";
				if (ew_NotEmpty(alias))
					sumwrk += " AS SUM_" + alias;
				string cntwrk = "SUM(" + ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) + ")";
				if (ew_NotEmpty(alias))
					cntwrk += " AS CNT_" + alias;
				return sumwrk + ", " + cntwrk;
				break;
		}
		if (ew_NotEmpty(alias))
			ReturnValue += " AS " + alias;
		return ReturnValue;
	}

	// Construct a crosstab field name
	public static string ewrpt_CrossTabField(string smrytype, object smryfld, object colfld, string datetype, object val, object qc)
	{
		return ewrpt_CrossTabField(smrytype, smryfld, colfld, datetype, val, qc, "");
	}

	// Construct SQL Distinct factor
	// - ACCESS
	// y: IIf(Year(FieldName)=1996,1,0)
	// q: IIf(DatePart(""q"",FieldName,1,0)=1,1,0))
	// m: (IIf(DatePart(""m"",FieldName,1,0)=1,1,0)))
	// others: (IIf(FieldName=val,1,0)))
	// - MS SQL
	// y: (1-ABS(SIGN(Year(FieldName)-1996)))
	// q: (1-ABS(SIGN(DatePart(q,FieldName)-1)))
	// m: (1-ABS(SIGN(DatePart(m,FieldName)-1)))
	// d: (CASE Convert(VarChar(10),FieldName,111) WHEN ' 1996/1/1'  THEN 1 ELSE 0 END)
	// - MySQL
	// y: IF(YEAR(OrderDate)=1996,1,0))
	// q: IF(QUARTER(OrderDate)=1,1,0))
	// m: IF(MONTH(OrderDate)=1,1,0))
	public static string ewrpt_SQLDistinctFactor(object sFld, string dateType, string val, string qc)
	{
		string ReturnValue = "";
		if (EWRPT_IS_MSACCESS) {
			if (dateType == "y" && Information.IsNumeric(val)) {
				ReturnValue = "IIf(Year(" + sFld + ")=" + val + ",1,0)";
			} else if ((dateType == "q" || dateType == "m") && Information.IsNumeric(val)) {
				ReturnValue = "IIf(DatePart(\"" + dateType + "\"," + sFld + ",1,0)=" + val + ",1,0)";
			}	else {
				if (val == "NULL") {
					ReturnValue = "IIf(" + sFld + " IS NULL,1,0)";
				}	else {
					ReturnValue = "IIf(" + sFld + "=" + qc + ew_AdjustSql(val) + qc + ",1,0)";
				}
			}
		} else if (EWRPT_IS_MSSQL) {
			if (dateType == "y" && Information.IsNumeric(val)) {
				ReturnValue = "(1-ABS(SIGN(Year(" + sFld + ")-" + val + ")))";
			} else if ((dateType == "q" || dateType == "m") && Information.IsNumeric(val)) {
				ReturnValue = "(1-ABS(SIGN(DatePart(" + dateType + "," + sFld + ")-" + val + ")))";
			} else if (dateType == "d") {
				ReturnValue = "(CASE Convert(VarChar(10)," + sFld + ",111) WHEN " + qc + ew_AdjustSql(val) + qc + " THEN 1 ELSE 0 END)";
			} else if (dateType == "dt") {
				ReturnValue = "(CASE Convert(VarChar(10)," + sFld + ",120) WHEN " + qc + ew_AdjustSql(val) + qc + " THEN 1 ELSE 0 END)";
			}	else {
				if (val == "NULL") {
					ReturnValue = "(CASE WHEN " + sFld + " IS NULL THEN 1 ELSE 0 END)";
				}	else {
					ReturnValue = "(CASE " + sFld + " WHEN " + qc + ew_AdjustSql(val) + qc + " THEN 1 ELSE 0 END)";
				}
			}
		} else if (EWRPT_IS_MYSQL) {
			if (dateType == "y" && Information.IsNumeric(val)) {
				ReturnValue = "IF(YEAR(" + sFld + ")=" + val + ",1,0)";
			} else if (dateType == "q" && Information.IsNumeric(val)) {
				ReturnValue = "IF(QUARTER(" + sFld + ")=" + val + ",1,0)";
			} else if (dateType == "m" && Information.IsNumeric(val)) {
				ReturnValue = "IF(MONTH(" + sFld + ")=" + val + ",1,0)";
			}	else {
				if (val == "NULL") {
					ReturnValue = "IF(" + sFld + " IS NULL,1,0)";
				}	else {
					ReturnValue = "IF(" + sFld + "=" + qc + ew_AdjustSql(val) + qc + ",1,0)";
				}
			}		
		} else if (EWRPT_IS_POSTGRESQL) {
			if (dateType == "y" && Information.IsNumeric(val)) {
				return "CASE WHEN EXTRACT(YEAR FROM " + sFld + ")=" + val + " THEN 1 ELSE 0 END";
			} else if (dateType == "q" && Information.IsNumeric(val)) {
				return "CASE WHEN EXTRACT(QUARTER FROM " + sFld + ")=" + val + " THEN 1 ELSE 0 END";
			} else if (dateType == "m" && Information.IsNumeric(val)) {
				return "CASE WHEN EXTRACT(MONTH FROM " + sFld + ")=" + val + " THEN 1 ELSE 0 END";
			} else {
				if (val == "NULL") {
					return "CASE WHEN " + sFld + " IS NULL THEN 1 ELSE 0 END";
				} else {
					return "CASE WHEN " + sFld + "=" + qc + ew_AdjustSql(val) + qc + " THEN 1 ELSE 0 END";
				}
			}
		} else if (EWRPT_IS_ORACLE) {
			if (dateType == "y" && Information.IsNumeric(val)) {
				ReturnValue = "DECODE(TO_CHAR(" + sFld + ",'YYYY'),'" + val + "',1,0)";
			} else if (dateType == "q" && Information.IsNumeric(val)) {
				ReturnValue = "DECODE(TO_CHAR(" + sFld + ",'Q'),'" + val + "',1,0)";
			} else if (dateType == "m" && Information.IsNumeric(val)) {
				ReturnValue = "DECODE(TO_CHAR(" + sFld + ",'MM'),LPAD('" + val + "',2,'0'),1,0)";
			} else if (dateType == "d") {
				ReturnValue = "DECODE(" + sFld + ",TO_DATE(" + qc + ew_AdjustSql(val) + qc + ",'YYYY/MM/DD'),1,0)";
			} else if (dateType == "dt") {
				ReturnValue = "DECODE(" + sFld + ",TO_DATE(" + qc + ew_AdjustSql(val) + qc + ",'YYYY/MM/DD HH24:MI:SS'),1,0)";
			}	else {
				if (val == "NULL") {
					ReturnValue = "(CASE WHEN " + sFld + " IS NULL THEN 1 ELSE 0 END)";
				}	else {
					ReturnValue = "DECODE(" + sFld + "," + qc + ew_AdjustSql(val) + qc + ",1,0)";
				}
			}
		}
		return ReturnValue;
	}

	// Evaluate summary value
	public static object ewrpt_SummaryValue(object val1, object val2, string ityp)
	{
		switch (ityp) {
			case "SUM":
			case "COUNT":
			case "AVG":
				if (Convert.IsDBNull(val2) || !ewrpt_IsNumeric(val2))	{
					return val1;
				}	else {
					return ew_ConvertToDouble(val1) + ew_ConvertToDouble(val2);
				}
				break;
			case "MIN":
				if (Convert.IsDBNull(val2) || !ewrpt_IsNumeric(val2))	{	// Skip null and non-numeric
					return val1;
				} else if (val1 == null) { // Initialize for first valid value
					return val2;
				} else if (ew_ConvertToDouble(val1) < ew_ConvertToDouble(val2)) {
					return val1;
				}	else {
					return val2;
				}
				break;
			case "MAX":
				if (Convert.IsDBNull(val2) || !ewrpt_IsNumeric(val2))	{	// Skip null and non-numeric
					return val1;
				} else if (val1 == null) { // Initialize for first valid value
					return val2;
				} else if (ew_ConvertToDouble(val1) > ew_ConvertToDouble(val2)) {
					return val1;
				}	else {
					return val2;
				}
				break;
		}
		return null;
	}

	// Match filter value
	public bool ewrpt_MatchedFilterValue(object ar, object value) {
		if (!ewrpt_IsArray(ar)) {
			return ew_SameStr(ar, value);
		} else {
			foreach (object val in (string[])ar) {
				if (ew_SameStr(val, value))
					return true;
			}
			return false;
		}
	}

	// Render repeat column table
	// rowcnt - zero based row count
	public string ewrpt_RepeatColumnTable(int totcnt, int rowcnt, int repeatcnt, int rendertype) {
		string sWrk = "";
		if (rendertype == 1) { // Render control start
			if (rowcnt == 0) sWrk += "<table class=\"" + EWRPT_ITEM_TABLE_CLASSNAME + "\">";
			if (rowcnt % repeatcnt == 0) sWrk += "<tr>";
			sWrk += "<td>";
		} else if (rendertype == 2) { // Render control end
			sWrk += "</td>";
			if (rowcnt % repeatcnt == repeatcnt - 1) {
				sWrk += "</tr>";
			} else if (rowcnt == totcnt - 1) {
				for (int i = (rowcnt % repeatcnt) + 1; i < repeatcnt; i++) {
					sWrk += "<td>&nbsp;</td>";
				}
				sWrk += "</tr>";
			}
			if (rowcnt == totcnt - 1) sWrk += "</table>";
		}
		return sWrk;
	}

	// Check if the value is selected
	// sName: popup name
	// value: supplied value
	public bool ewrpt_IsSelectedValue(object[] ar, object value, int ft)
	{
		if (ar != null && ar.Length > 0) {		
			foreach (object val in ar) {
				if (Convert.ToString(value).StartsWith("@@") || Convert.ToString(val).StartsWith("@@"))	{	// Popup filters			
					if (ew_SameStr(val, value))
						return true;
				} else if (ewrpt_CompareValue(val, value, ft)) {
					return true;				
				}
			}
		} else {
    	return true;
    }
		return false;
	}

	public static void ewrpt_SetupDistinctValues(ref OrderedDictionary ar, object val, object label, bool dup) {
		if (dup && ar != null && ar.Contains(val))
			return;
		if (ar == null)
			ar = new OrderedDictionary();
		if (ew_SameStr(val, EWRPT_EMPTY_VALUE) || ew_SameStr(val, EWRPT_NULL_VALUE)) { // Null/Empty
			ar.Insert(0, val, label);
		} else {
			ar.Add(val, label); // Default insert at end
		}
	}	

	// Compare values based on field type
	public static bool ewrpt_CompareValue(object v1, object v2, int ft)
	{
		switch (ft) {
			case 20:
			case 3:
			case 2:
			case 16:
			case 17:
			case 18:
			case 19:
			case 21: // adBigInt, adInteger, adSmallInt, adTinyInt, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt
				if (ewrpt_IsNumeric(v1) && ewrpt_IsNumeric(v2))
					return (ew_ConvertToInt(v1) == ew_ConvertToInt(v2));
				break;
			case 4:
			case 5:
			case 131:
			case 6:	// adSingle, adDouble, adNumeric, adCurrency
				if (ewrpt_IsNumeric(v1) && ewrpt_IsNumeric(v2))
					return (ew_ConvertToDouble(v1) == ew_ConvertToDouble(v2));					
				break;
			case 7:
			case 133:
			case 134:
			case 135:	// adDate, adDBDate, adDBTime, adDBTimeStamp
				if (ewrpt_IsDate(v1) && ewrpt_IsDate(v2))
					return (Convert.ToDateTime(v1) == Convert.ToDateTime(v2));
				break;
			case 11:
				return (ew_ConvertToBool(v1) == ew_ConvertToBool(v2));
		}
		return (Convert.ToString(v1) == Convert.ToString(v2)); // Treat as string
	}

	// Set up distinct values from ext. filter
	public static void ewrpt_SetupDistinctValuesFromFilter(ref OrderedDictionary ar, ref ArrayList af)
	{
		if (af != null) {
			foreach (object[] afwrk in af)
				ewrpt_SetupDistinctValues(ref ar, afwrk[0], afwrk[1], false);
		}
	}

	// Get group value
	// - Get the group value based on field type, group type and interval
	// - ft: field type
	// * 1: numeric, 2: date, 3: string
	// - gt: group type
	// * numeric: i = interval, n = normal
	// * date: d = Day, w = Week, m = Month, q = Quarter, y = Year
	// * string: f = first nth character, n = normal
	// - intv: interval
	public static object ewrpt_GroupValue(crField fld, object val)
	{
		int ft = fld.FldType;
		string grp = fld.FldGroupByType;
		string intv = fld.FldGroupInt;
		int ww;
		int q;
		int wrkIntv;
		switch (ft) {
			case 20:
			case 3:
			case 2:
			case 16:
			case 4:
			case 5:
			case 131:
			case 6:
			case 17:
			case 18:
			case 19:
			case 21: // adBigInt, adInteger, adSmallInt, adTinyInt, adSingle, adDouble, adNumeric, adCurrency, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt // Numeric
				if (!ewrpt_IsNumeric(val))
					return val;					
				wrkIntv = Convert.ToInt32(intv);
				if (wrkIntv <= 0)
					wrkIntv = 10;
				switch (grp) {
					case "i":
						return Convert.ToInt32(Convert.ToDouble(val) / wrkIntv);
					default:
						return val;
				}

				//break;
			case 7:
			case 133:
			case 134:
			case 135:	// adDate, adDBDate, adDBTime, adDBTimeStamp // Date
				if (!ewrpt_IsDate(val))
					return val;
				DateTime DT = Convert.ToDateTime(val); 					
				switch (grp) {
					case "y":
						return DT.Year;
					case "q":
						q = ewrpt_DatePart(DateInterval.Quarter, DT);
						return DT.Year + "|" + q;
					case "m":
						return DT.Year + "|" + ewrpt_ZeroPad(DT.Month, 2);
					case "w":
						ww = ewrpt_DatePart(DateInterval.WeekOfYear, Convert.ToDateTime(val));
						return DT.Year + "|" + ewrpt_ZeroPad(ww, 2);
					case "d":
						return DT.Year + "|" + ewrpt_ZeroPad(DT.Month, 2) + "|" + ewrpt_ZeroPad(DT.Day, 2);
					case "h":
						return DT.Hour;
					case "min":
						return DT.Minute;
					default:
						return val;
				}

				//break;
			case 201:
			case 203:
			case 129:
			case 130:
			case 200:
			case 202:	// adLongVarChar, adLongVarWChar, adChar, adWChar, adVarChar, adVarWChar // String
				wrkIntv = Convert.ToInt32(intv);
				if (wrkIntv <= 0)
					wrkIntv = 1;
				switch (grp) {
					case "f":
						string wrkstr = Convert.ToString(val);
						return wrkstr.Substring(0, Math.Min(wrkIntv, wrkstr.Length));
					default:
						return val;
				}

				//break;
			default:
				return val;
		}
	}

	// Display group value
	public string ewrpt_DisplayGroupValue(crField fld, object val)
	{
		int ft = fld.FldType;
		string grp = fld.FldGroupByType;
		string intv = fld.FldGroupInt;
		if (Convert.IsDBNull(val))
			return ReportLanguage.Phrase("NullLabel");
		if (ew_Empty(val))
			return ReportLanguage.Phrase("EmptyLabel");
		string[] ar;
		int wrkIntv;
		switch (ft) {
			case 20:
			case 3:
			case 2:
			case 16:
			case 4:
			case 5:
			case 131:
			case 6:
			case 17:
			case 18:
			case 19:
			case 21: // adBigInt, adInteger, adSmallInt, adTinyInt, adSingle, adDouble, adNumeric, adCurrency, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt // numeric
				wrkIntv = Convert.ToInt32(intv);
				if (wrkIntv <= 0)
					wrkIntv = 10;
				switch (grp) {
					case "i":
						return Convert.ToString(Convert.ToDouble(val) * wrkIntv) + " - " + Convert.ToString((Convert.ToDouble(val) + 1) * wrkIntv - 1);
					default:
						return Convert.ToString(val);
				}

				//break;
			case 7:
			case 133:
			case 134:
			case 135:	// adDate, adDBDate, adDBTime, adDBTimeStamp // Date
				ar = Convert.ToString(val).Split(new char[] {'|'});
				switch (grp) {
					case "y":
						return ar[0];
					case "q":
						if (ar.Length < 2) return Convert.ToString(val);
						return ewrpt_FormatQuarter(ar[0], ar[1]);
					case "m":
						if (ar.Length < 2) return Convert.ToString(val);
						return ewrpt_FormatMonth(ar[0], ar[1]);
					case "w":
						if (ar.Length < 2) return Convert.ToString(val);
						return ewrpt_FormatWeek(ar[0], ar[1]);
					case "d":
						if (ar.Length < 3) return Convert.ToString(val);
						return ewrpt_FormatDay(ar[0], ar[1], ar[2]);
					case "h":
						return ewrpt_FormatHour(ar[0]);
					case "min":
						return ewrpt_FormatMinute(ar[0]);
					default:
						return Convert.ToString(val);
				}

				//break;
			case 201:
			case 203:
			case 129:
			case 130:
			case 200:
			case 202:	// adLongVarChar, adLongVarWChar, adChar, adWChar, adVarChar, adVarWChar // String
				return Convert.ToString(val);
			default:
				return Convert.ToString(val);				
		}
	}

	public string ewrpt_FormatQuarter(object y, object q)
	{
		return "Q" + q + "/" + y;
	}

	public string ewrpt_FormatMonth(object y, object m)
	{
		return m + "/" + y;
	}

	public string ewrpt_FormatWeek(object y, object w)
	{
		return "WK" + w + "/" + y;
	}

	public string ewrpt_FormatDay(object y, object m, object d)
	{
		return y + "/" + m + "/" + d;
	}

	public string ewrpt_FormatHour(object h)
	{
		string ReturnValue = "";
		if (Convert.ToInt32(h) == 0) {
			ReturnValue = "12 AM";
		} else if (Convert.ToInt32(h) < 12) {
			ReturnValue = h + " AM";
		} else if (Convert.ToInt32(h) == 12) {
			ReturnValue = "12 PM";
		}	else {
			ReturnValue = (Convert.ToInt32(h) - 12) + " PM";
		}
		return ReturnValue;
	}

	public string ewrpt_FormatMinute(object n)
	{
		return Convert.ToString(n) + " MIN";
	}

	// Pad zeros before number
	// - m: number
	// - t: length
	public static string ewrpt_ZeroPad(int m, int t)
	{
		return Convert.ToString(m).PadLeft(t, '0');
	}

	// Get JavaScript data in the form of:
	// - [value1, text1, selected], [value2, text2, selected] ...
	// - value1: "value 1", text1: "text 1": selected: true|false
	// name: popup name
	// list: comma separated list
	public string ewrpt_GetJsData(crField fld, int ft)
	{
		object value, label;
		string jsselect;
		bool bSelected;
		string jsdata = "";
		OrderedDictionary arv = fld.ValueList;
		string[] ars = fld.SelectionList;
		foreach (DictionaryEntry d in arv) {
			jsselect = (ewrpt_IsSelectedValue(ars, d.Key, ft)) ? "true" : "false";
			if (jsdata != "")
				jsdata += ", ";
			jsdata += "[\"" + ewrpt_EscapeJs(d.Key) + "\", \"" + ewrpt_EscapeJs(d.Value) + "\", " + jsselect + "]";
		}
		return jsdata;
	}

	// Return detail filter SQL
	public static string ewrpt_DetailFilterSQL(crField fld, string fn, object val) {
		int ft = fld.FldDataType;
		if (ew_NotEmpty(fld.FldGroupSql))
			ft = EWRPT_DATATYPE_STRING;
		string sqlwrk = fn;
		if (Convert.IsDBNull(val)) {
			sqlwrk += " IS NULL";
		} else {
			sqlwrk += " = " + ew_QuotedValue(val, ft);
		}
		return sqlwrk;
	}

	// Return popup filter SQL
	public static string ewrpt_FilterSQL(crField fld, string fn, int ft) {
		string[] ar = fld.SelectionList;
		ArrayList af = fld.AdvancedFilters;
		string gt = fld.FldGroupByType;
		string gi = fld.FldGroupInt;
		string sql = fld.FldGroupSql;
		string sqlwrk = "";
		if (ewrpt_IsArray(ar)) {
			for (int i = 0; i < ar.Length; i++) {
				string value = ar[i]; 
				if (ew_SameStr(value, EWRPT_EMPTY_VALUE)) { // Empty string
					sqlwrk += fn + " = '' OR ";
				} else if (ew_SameStr(value, EWRPT_NULL_VALUE)) { // Null value
					sqlwrk += fn + " IS NULL OR ";
				} else if (value.StartsWith("@@")) { // Advanced filter
					if (ew_IsArrayList(af)) {
						object afsql = ewrpt_AdvancedFilterSQL(ref af, value); // Process popup filter
						if (afsql != null)
							sqlwrk += Convert.ToString(afsql).Replace("@@fld@@", fn) + " OR ";
					}
				} else if (ew_NotEmpty(sql)) {
					sqlwrk += sql.Replace("%s", fn) + " = '" + value + "' OR ";
				} else {
					sqlwrk += fn + " IN (" + ewrpt_JoinArray(ar, ", ", ft, i) + ") OR ";
					break;
				}
			}
		}
		if (ew_NotEmpty(sqlwrk))
			sqlwrk = "(" + sqlwrk.Substring(0, sqlwrk.Length-4) + ")";
		return sqlwrk;
	}

	// Return Advanced Filter SQL
	public static object ewrpt_AdvancedFilterSQL(ref ArrayList ar, object val) {
		if (!ew_IsArrayList(ar)) {
			return null;
		} else if (Convert.IsDBNull(val)) {
			return null;
		} else {
			foreach (string[] arwrk in ar) {				
				if (ew_SameStr(val, arwrk[0]))
					return arwrk[2];
			}			
			return null;
		}
	}

	// Escape object for JavaScript
	public static string ewrpt_EscapeJs(object str)
	{
		string val = Convert.ToString(str);
		val = val.Replace("\\", "\\\\");
		val = val.Replace("\"", "\\\"");
		val = val.Replace("\r", "\\r");
		val = val.Replace("\n", "\\n");
		return val;
	}	

	// Load Chart Series
	public void ewrpt_LoadChartSeries(string sSql, ref crChart cht) {
		ArrayList rscht = Conn.GetRows(sSql);
		string sdt = cht.SeriesDateType;
		for (int i = 0; i < rscht.Count; i++) {
			OrderedDictionary Row = (OrderedDictionary)rscht[i];	
			cht.Series.Add(ewrpt_ChartSeriesValue(Row[0], sdt));
		}
	}

	// Load Chart Data
	public void ewrpt_LoadChartData(string sSql, ref crChart cht) {
		ArrayList rscht = Conn.GetRows(sSql);
		string sdt = cht.SeriesDateType;
		string xdt = cht.XAxisDateFormat;
		string ndt = (cht.ChartType == 20) ? cht.NameDateFormat : "";
		if (ew_NotEmpty(sdt))
			xdt = sdt;
		cht.Data.Clear();
		for (int i = 0; i < rscht.Count; i++) {
			OrderedDictionary Row = (OrderedDictionary)rscht[i];
			OrderedDictionary d = new OrderedDictionary();
			d.Add(0, ewrpt_ChartXValue(Row[0], xdt)); // X value
			d.Add(1, ewrpt_ChartSeriesValue(Row[1], sdt)); // Series value
			for (int j = 2; j < Row.Count; j++) {
				if (ew_NotEmpty(ndt) && j == Row.Count - 1)
					d.Add(j, ewrpt_ChartXValue(Row[j], ndt)); // Name value
				else
					d.Add(j, Row[j]); // Y values
			}
			cht.Data.Add(d);
		}
	}

	// Get Chart X value
	public string ewrpt_ChartXValue(object val, string dt) {
		if (Convert.IsDBNull(val)) {
			return ReportLanguage.Phrase("NullLabel");
		} else if (ew_Empty(val)) {
			return ReportLanguage.Phrase("EmptyLabel");
		} else if (Information.IsNumeric(dt)) {
			return ew_FormatDateTime(val, ew_ConvertToInt(dt));
		} else if (dt == "xyq") {
			string[] ar = Convert.ToString(val).Split(new char[] {'|'});
			if (ar.Length >= 2)
				return ar[0] + " " + ewrpt_QuarterName(ar[1]);
			else
				return Convert.ToString(val);
		} else if (dt == "xym") {
			string[] ar = Convert.ToString(val).Split(new char[] {'|'});
			if (ar.Length >= 2)
				return ar[0] + " " + ewrpt_MonthName(ar[1]);
			else
				return Convert.ToString(val);
		} else if (dt == "xq") {
			return ewrpt_QuarterName(val);
		} else if (dt == "xm") {
			return ewrpt_MonthName(val);
		} else {
			return Convert.ToString(val).Trim();
		}
	}

	// Get Chart Series value
	public string ewrpt_ChartSeriesValue(object val, string dt) {
		if (dt == "syq") {
			string[] ar = Convert.ToString(val).Split(new char[] {'|'});
			if (ar.Length >= 2)
				return ar[0] + " " + ewrpt_QuarterName(ar[1]);
			else
				return Convert.ToString(val);
		} else if (dt == "sym") {
			string[] ar = Convert.ToString(val).Split(new char[] {'|'});
			if (ar.Length >= 2)
				return ar[0] + " " + ewrpt_MonthName(ar[1]);
			else
				return Convert.ToString(val);
		} else if (dt == "sq") {
			return ewrpt_QuarterName(val);
		} else if (dt == "sm") {
			return ewrpt_MonthName(val);
		} else {
			return Convert.ToString(val).Trim();
		}
	}

	// Sort chart data
	public void ewrpt_SortChartData(ref ArrayList ar, int opt, string seq)
	{
		if (!ew_IsArrayList(ar) || ((opt < 3 || opt > 4) && ew_Empty(seq)) || ((opt < 1 || opt > 4) && ew_NotEmpty(seq)))
			return;
		if ((opt == 3 || opt == 4) && ew_Empty(seq))
			seq = "_number";
		switch (opt) {
			case 1:	// X values ascending
				ar.Sort(new ewrpt_ChartDataComparer(0, seq, "ASC"));
				break;
			case 2:	// X values descending
				ar.Sort(new ewrpt_ChartDataComparer(0, seq, "DESC"));
				break;
			case 3:	// Y values ascending					
				ar.Sort(new ewrpt_ChartDataComparer(2, seq, "ASC"));
				break;
			case 4:	// Y values descending
				ar.Sort(new ewrpt_ChartDataComparer(2, seq, "DESC"));	
				break;
		}
	}

	// Sort chart multi series data
	public void ewrpt_SortMultiChartData(ref ArrayList ar, int opt, string seq) {
		if (!ew_IsArrayList(ar) || ((opt < 3 || opt > 4) && ew_Empty(seq)) || ((opt < 1 || opt > 4) && ew_NotEmpty(seq)))
			return;
		if ((opt == 3 || opt == 4) && ew_Empty(seq))
			seq = "_number";

		// Obtain a list of columns
		Hashtable xsums = new Hashtable();
		for (int i=0; i < ar.Count; i++) {
			OrderedDictionary d = (OrderedDictionary)ar[i];
			if (xsums.Contains(d[0])) {
				xsums[d[0]] = ew_ConvertToDouble(xsums[d[0]]) + ew_ConvertToDouble(d[2]);
			} else {
				xsums[d[0]] = d[2];
			}
		}

		// Set up Y sum
		int idx = -1;
		if (opt == 3 || opt == 4) {
			for (int i=0; i < ar.Count; i++) {
				OrderedDictionary d = (OrderedDictionary)ar[i];
				if (idx == -1)
					idx = d.Count; 
				d.Add(idx, xsums[d[0]]); 				
			}		
		}
		switch (opt) {
			case 1: // X values ascending
				ar.Sort(new ewrpt_ChartDataComparer(0, seq, "ASC"));
				break;
			case 2: // X values descending
				ar.Sort(new ewrpt_ChartDataComparer(0, seq, "DESC"));
				break;
			case 3:
				ar.Sort(new ewrpt_ChartDataComparer(idx, seq, "ASC"));
				break;
			case 4: // Y values
				ar.Sort(new ewrpt_ChartDataComparer(idx, seq, "DESC"));
				break;
		}	
	}

	// Chart data comparer
	public class ewrpt_ChartDataComparer: IComparer {
		int Index = 0;
		object Seq = ""; // Empty (Default)
		string Order = "ASC"; // ASC/DESC

		public ewrpt_ChartDataComparer(int aindex, object aseq, string aorder) {
			if (aindex > 0)
				Index = aindex;
			Seq = aseq;
			Order = ew_SameText(aorder, "ASC") ? "ASC" : "DESC";
		}
		int IComparer.Compare(object x, object y) {
			x = ((OrderedDictionary)x)[Index];
			y = ((OrderedDictionary)y)[Index];
			if (ew_Empty(Seq)) { // Default	
				if (Information.IsNumeric(x) && Information.IsNumeric(y)) {	
					Seq = "_number";
				} else if (Information.IsDate(x) && Information.IsDate(y)) {
					Seq = "_date";
				} else {
					Seq = "_string";
				}			
			}
			if (ew_SameText(Seq, "_string") && Order == "ASC") { // String, ASC		
				return String.Compare(Convert.ToString(x), Convert.ToString(y));
			} else if (ew_SameText(Seq, "_string") && Order == "DESC") { // String, DESC
				return String.Compare(Convert.ToString(y), Convert.ToString(x));
			} else if (ew_SameText(Seq, "_number") && Order == "ASC") { // Number, ASC
				if (Information.IsNumeric(x) && Information.IsNumeric(y))
					return Convert.ToDouble(x).CompareTo(Convert.ToDouble(y));
			} else if (ew_SameText(Seq, "_number") && Order == "DESC") { // Number, DESC
				if (Information.IsNumeric(x) && Information.IsNumeric(y))
					return Convert.ToDouble(y).CompareTo(Convert.ToDouble(x));
			} else if (ew_SameText(Seq, "_date") && Order == "ASC") { // Date, ASC
				if (Information.IsDate(x) && Information.IsDate(y))
					return DateTime.Compare(Convert.ToDateTime(x), Convert.ToDateTime(y));
			} else if (ew_SameText(Seq, "_date") && Order == "DESC") { // Date, DESC
				if (Information.IsDate(x) && Information.IsDate(y))
					return DateTime.Compare(Convert.ToDateTime(y), Convert.ToDateTime(x));
			} else if (ew_NotEmpty(Seq) && Convert.ToString(Seq).Contains("|")) { // Custom sequence by delimited string
				string[] ar = Convert.ToString(Seq).Split(new Char[] {'|'});
				if (Array.IndexOf(ar, Convert.ToString(x)) > -1 && Array.IndexOf(ar, Convert.ToString(y)) > -1)
					return (Array.IndexOf(ar, Convert.ToString(x)) - Array.IndexOf(ar, Convert.ToString(y)));
			}
			return 0;			
		}	
  }

	// Resize 1-dimension array
	public static void ewrpt_ReDim(ref object[] ar, int ubound) {
		Array.Resize(ref ar, ubound+1);
	}

	// Resize 2nd dimension of a 2-dimension array
	public static void ewrpt_ReDim(ref object[,] ar, int ubound) {
		ewrpt_ReDimByLen(ref ar, ar.GetLength(0), ubound+1);
	}

	// Resize a 2-dimension array by lengths
	public static void ewrpt_ReDimByLen(ref object[,] OldArray, int arr1stDimLength, int arr2ndDimLength) {
			object[,] NewArray = new object[arr1stDimLength, arr2ndDimLength];
			int xMax = 0;
			int yMax = 0;
			if (ewrpt_IsArray(OldArray)) { 			
				if (OldArray.GetLength(0) < arr1stDimLength)
					xMax = OldArray.GetLength(0);
				else
					xMax = arr1stDimLength;
				if (OldArray.GetLength(1) < arr2ndDimLength)
					yMax = OldArray.GetLength(1);
				else
					yMax = arr2ndDimLength;			
				for (int x = 0; x < xMax; x++) {
					for(int y = 0; y < yMax; y++)
						NewArray[x, y] = OldArray[x, y];
				}
			}			
			OldArray = NewArray;
	}

	// Resize array (nx: UpperBound(0) to check, ny: additional size for 2nd dimension)
	public static void ewrpt_ResizeAr(ref object[,] ar, int nx, int ny)
	{
		int ywrk;
		if (!ewrpt_IsArray(ar))	{
			 ar = new object[nx + 1, ny];		
		}	else {
			if (ar.GetUpperBound(0) == nx) {
				ywrk = ar.GetUpperBound(1) + ny;
				ewrpt_ReDim(ref ar, ywrk);
			}
		}
	}

	// Load array from SQL
	public void ewrpt_LoadArrayFromSql(string sql, ref string[] ar)
	{
		SqlDataReader rswrk;
		object v;
		if (sql == "")
			return;
		rswrk = Conn.GetTempDataReader(sql);
		List<string> al = new List<string>();
		if (rswrk != null) {
			while (rswrk.Read()) {
				v = rswrk[0];
				if (Convert.IsDBNull(v)) {
					v = EWRPT_NULL_VALUE;
				} else if (ew_Empty(v)) {
					v = EWRPT_EMPTY_VALUE;
				} else if (v.GetType().ToString() == "System.Double") {
					v = Convert.ToDouble(v);
				}
				al.Add(Convert.ToString(v));
			}
		}
		Conn.CloseTempDataReader();
		ar = al.ToArray();
	}

	// Load ArrayList from SQL
	public void ewrpt_LoadArrayListFromSql(string sql, ref ArrayList ar)
	{
		SqlDataReader rswrk;
		object v;
		if (sql == "")
			return;
		rswrk = Conn.GetTempDataReader(sql);
		ar = new ArrayList();
		if (rswrk != null) {
			while (rswrk.Read()) {
				v = rswrk[0];
				if (Convert.IsDBNull(v)) {
					v = EWRPT_NULL_VALUE;
				} else if (ew_Empty(v)) {
					v = EWRPT_EMPTY_VALUE;
				} else if (v.GetType().ToString() == "System.Double") {
					v = Convert.ToDouble(v);
				}
				ar.Add(Convert.ToString(v));
			}
		}
		Conn.CloseTempDataReader();
	}

	// Match array
	public static bool ewrpt_MatchedArray(object ar1, object ar2)
	{     
		if (!ewrpt_IsArray(ar1) && !ewrpt_IsArray(ar2))	{
			return true;
		} else if (ewrpt_IsArray(ar1) && ewrpt_IsArray(ar2)) {
			return ew_SameStr(String.Join(",", (string[])ar1), String.Join(",", (string[])ar2));
		}
		return false;
	}

	// Encode chart value
	public string ewrpt_Encode(string val)
	{
		return val.Replace(",", "%2C"); // Encode comma
	}

	// Eval
	public object Eval(string AName, object AValue)
	{
		MethodInfo Mi = this.GetType().GetMethod(AName);
		if (Mi != null)	{
			return Mi.Invoke(this, new object[] {AValue});
		}	else {
			return false;
		}
	}

	// DateDiff
	public static long ewrpt_DateDiff(DateInterval Interval, DateTime Date1, DateTime Date2)
	{
		return DateAndTime.DateDiff(Interval, Date1, Date2, FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1);
	}

	// DatePart
	public static int ewrpt_DatePart(DateInterval Interval, DateTime DateValue)
	{
		return DateAndTime.DatePart(Interval, DateValue, FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1);
	}	

	// DateAdd
	public static DateTime ewrpt_DateAdd(string Interval, double Number, DateTime DateValue)
	{
		switch (Interval) {
			case "d":
				return DateAndTime.DateAdd(DateInterval.Day, Number, DateValue); // Truncated to integral value 
			case "y":
				return DateAndTime.DateAdd(DateInterval.DayOfYear, Number, DateValue); // Truncated to integral value 
 			case "h":
				return DateAndTime.DateAdd(DateInterval.Hour, Number, DateValue); // Rounded to nearest millisecond 
 			case "n":
				return DateAndTime.DateAdd(DateInterval.Minute, Number, DateValue); // Rounded to nearest millisecond 
 			case "m":
				return DateAndTime.DateAdd(DateInterval.Month, Number, DateValue); // Truncated to integral value 
 			case "q":
				return DateAndTime.DateAdd(DateInterval.Quarter, Number, DateValue); // Truncated to integral value 
 			case "s":
				return DateAndTime.DateAdd(DateInterval.Second, Number, DateValue); // Rounded to nearest millisecond 
 			case "w":
				return DateAndTime.DateAdd(DateInterval.Weekday, Number, DateValue); // Truncated to integral value 
 			case "ww":
				return DateAndTime.DateAdd(DateInterval.WeekOfYear, Number, DateValue); // Truncated to integral value 
 			case "yyyy":
				return DateAndTime.DateAdd(DateInterval.Year, Number, DateValue);
			default:
				return DateValue;
		}		
	}

	// DateAdd
	public static DateTime ewrpt_DateAdd(DateInterval Interval, double Number, DateTime DateValue)
	{
		return DateAndTime.DateAdd(Interval, Number, DateValue);
	}

	// Format number
	public static string ewrpt_FormatNumber(object Expression, int NumDigitsAfterDecimal)
	{
		if (Convert.IsDBNull(Expression)) return String.Empty;
		return Strings.FormatNumber(Expression, NumDigitsAfterDecimal, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault);
	}

	// Is array
	public static bool ewrpt_IsArray(object obj)
	{
		return Information.IsArray(obj);
	}

	// Is date
	public static bool ewrpt_IsDate(object obj)
	{
		return Information.IsDate(obj);
	}

	// Is DateTime
	public static bool ewrpt_IsDateTime(object obj)
	{
		return (obj != null) && (obj.GetType().ToString() == "System.DateTime");
	}

	// Is numeric
	public static bool ewrpt_IsNumeric(object obj)
	{
		return Information.IsNumeric(obj);
	}

	// Register custom filter
	public static void ewrpt_RegisterCustomFilter(crField fld, string FilterName, string DisplayName, string FunctionName) {
		string FldName = fld.FldName;
		string FldExpression = fld.FldExpression;
		fld.CustomFilters.Add(new crCustomFilter(FldName, FilterName, DisplayName, FldExpression, FunctionName));
	}

	// Get custom filter
	public string ewrpt_GetCustomFilter(ref crField fld, string FldVal) {
		string sWrk = "";
		string sParm = FldVal.Substring(2);		
		int cntf = fld.CustomFilters.Count;
		for (int i = 0; i < cntf; i++) {
			if (fld.CustomFilters[i].FilterName == sParm) {
				string sFld = fld.CustomFilters[i].FldExpression;
				string sFn = fld.CustomFilters[i].FunctionName;
				MethodInfo mi = this.GetType().GetMethod(sFn); 
				if (mi != null)
					sWrk = Convert.ToString(mi.Invoke(this, new object[] {sFld}));
				break;
			}
		}
		return sWrk;
	}

	// Return date value 
	public static object ewrpt_DateVal(string FldOpr, object FldVal, int ValType) 
	{ 
		if (ew_Empty(FldVal))
			return "";
		object wrkVal = "";
		string[] arWrk; 
		object yr; 
		object mth; 
		object dy; 

		// Compose date string 
		switch (FldOpr.ToLower()) { 
			case "year": 
				if (ValType == 1) { 
					wrkVal = Convert.ToDateTime(FldVal + "/1/1"); 
				} else if (ValType == 2) { 
					wrkVal = Convert.ToDateTime(FldVal + "/12/31"); 
				}
				break; 
			case "quarter": 
				arWrk = Convert.ToString(FldVal).Split(new char[] {'|'}); 
				wrkVal = Convert.ToDateTime(arWrk[0] + "/" + ((Convert.ToInt32(arWrk[1]) - 1) * 3 + 1) + "/1"); 
				if (ValType == 2) { 
					wrkVal = ewrpt_DateAdd("m", 3, Convert.ToDateTime(wrkVal)); // + three months 
					wrkVal = ewrpt_DateAdd("d", -1, Convert.ToDateTime(wrkVal)); // - one day 
				}
				break; 
			case "month": 
				wrkVal = Convert.ToDateTime(Convert.ToString(FldVal).Replace("|", "/") + "/1"); 
				if (ValType == 2) { 
					wrkVal = ewrpt_DateAdd("m", 1, Convert.ToDateTime(wrkVal)); // + one month 
					wrkVal = ewrpt_DateAdd("d", -1, Convert.ToDateTime(wrkVal)); // - one day 
				}
				break; 
			case "day": 
				wrkVal = Convert.ToDateTime(Convert.ToString(FldVal).Replace("|", "/")); 
				break; 
		} 

		// Add time if necessary 
		wrkVal = Convert.ToDateTime(wrkVal).Year + "/" + Convert.ToDateTime(wrkVal).Month + "/" + Convert.ToDateTime(wrkVal).Day; 
		if (true) { // Always return time 
			if (ValType == 1) { 
				wrkVal = wrkVal + " 00:00:00"; 
			} else if (ValType == 2) { 
				wrkVal = wrkVal + " 23:59:59"; 
			} 
		} 

		// Check if date
		return (ewrpt_IsDate(wrkVal)) ? wrkVal : ""; 
	} 

	// Is past
	public static string ewrpt_IsPast()
	{
		return "(@@fld@@ < " + ew_QuotedValue(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is future
	public static string ewrpt_IsFuture()
	{
		return "(@@fld@@ > " + ew_QuotedValue(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is last 30 days
	public static string ewrpt_IsLast30Days()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, -29, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, +1, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is last 14 days
	public static string ewrpt_IsLast14Days()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, -13, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, +1, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is last 7 days
	public static string ewrpt_IsLast7Days()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, -6, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, +1, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is next 7 days
	public static string ewrpt_IsNext7Days()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = dt;
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, +7, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is next 14 days
	public static string ewrpt_IsNext14Days()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = dt;
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, +14, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is next 30 days
	public static string ewrpt_IsNext30Days()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = dt;
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, +30, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is yesterday
	public static string ewrpt_IsYesterday()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, -1, dt);
		DateTime dt2 = dt;
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is DT
	public static string ewrpt_IsToday()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = dt;
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, +1, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is tomorrow
	public static string ewrpt_IsTomorrow()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, +1, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, +2, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is last month
	public static string ewrpt_IsLastMonth()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Month, -1, dt);
		DateTime dt2 = dt;
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) + ")";		
	}

	// Is this month
	public static string ewrpt_IsThisMonth()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = dt;
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Month, +1, dt);	
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) + ")";	
	}

	// Is next month
	public static string ewrpt_IsNextMonth()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Month, +1, dt);	
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Month, +2, dt);	
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) + ")";	
	}

	// Is last 2 weeks
	public static string ewrpt_IsLast2Weeks()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek - 14, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek, dt);		
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is last week
	public static string ewrpt_IsLastWeek()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek - 7, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek, dt);			
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is this week
	public static string ewrpt_IsThisWeek()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek + 7, dt);	
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is next week
	public static string ewrpt_IsNextWeek()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek + 7, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek + 14, dt);	
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is next 2 weeks
	public static string ewrpt_IsNext2Weeks()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek + 7, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Day, -1*(int)dt.DayOfWeek + 21, dt);	
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is last year
	public static string ewrpt_IsLastYear()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Year, -1, dt);
		DateTime dt2 = dt;	
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is this year
	public static string ewrpt_IsThisYear()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = dt;
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Year, 1, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Is next year
	public static string ewrpt_IsNextYear()
	{
		DateTime dt = DateTime.Today;
		DateTime dt1 = DateAndTime.DateAdd(DateInterval.Year, 1, dt);
		DateTime dt2 = DateAndTime.DateAdd(DateInterval.Year, 2, dt);
		return "(@@fld@@ >= " + ew_QuotedValue(dt1.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) +
			" AND @@fld@@ < " + ew_QuotedValue(dt2.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) + ")";
	}

	// Get number of days in a month
	public static int ewrpt_DaysInMonth(int y, int m) {
		if ((new List<int>(new int[] {1, 3, 5, 7, 8, 10, 12})).Contains(m)) {
			return 31;
		} else if ((new List<int>(new int[] {4, 6, 9, 11})).Contains(m)) {
			return 30;
		} else if (m == 2) {
			return (y % 4 == 0) ? 29 : 28;
		}
		return 0;
	}	

	/**
	 * Field class
	 */

	public class crField : AspNetReportMakerBase {

		public string TblName; // Table name

		public string TblVar; // Table variable name

		public string FldName; // Field name

		public string FldVar; // Field variable name

		public string FldExpression; // Field expression (used in SQL)

		public string FldDefaultErrMsg; // Default error message

		public int FldType; // Field type

		public int FldDataType; // ASP.NET Maker Field type

		public int FldDateTimeFormat; // Date time format

		public int Count; // Count

		public object Summary; // Summary

		public object OldValue; // Old Value

		public object CurrentValue; // Current value

		public string ViewValue; // View value

		public string HrefValue; // Href value

		public string m_FormValue; // Form value

		public string m_QueryStringValue; // QueryString value

		public object m_DbValue; // Database value

		public int ImageWidth = 0; // Image width

		public int ImageHeight = 0; // Image height

		public bool ImageResize = false; // Image resize

		public bool Sortable = true; // Sortable

		public int GroupingFieldId = 0; // Grouping field id

		public string UploadPath = EWRPT_UPLOAD_DEST_PATH; // Upload path

		public Hashtable CellAttrs = new Hashtable(); // Cell custom attributes

		public Hashtable ViewAttrs = new Hashtable(); // View custom attributes

		public string FldGroupByType; // Group By Type

		public string FldGroupInt; // Group Interval

		public string FldGroupSql; // Group SQL

		public Hashtable GroupDbValues =  new Hashtable(); // Group DB Values

		public string GroupViewValue; // Group View Value

		public string SqlSelect; // Field SELECT

		public string SqlGroupBy; // Field GROUP BY

		public string SqlOrderBy; // Field ORDER BY

		public OrderedDictionary ValueList = new OrderedDictionary(); // Value List

		public string[] SelectionList = new string[0]; // Selection List

		public ArrayList DefaultSelectionList = new ArrayList(); // Default Selection List

		public List<crCustomFilter> CustomFilters = new List<crCustomFilter>(); // Custom Filters

		public ArrayList AdvancedFilters = new ArrayList(); // Advanced Filters

		public string RangeFrom; // Range From

		public string RangeTo; // Range To

		public ArrayList DropDownList = new ArrayList(); // Dropdown List

		public object DropDownValue; // Dropdown Value

		public object DefaultDropDownValue; // Default Dropdown Value

		public string DateFilter; // Date Filter

		public object SearchValue = ""; // Search Value 1

		public object SearchValue2 = ""; // Search Value 2

		public string SearchOperator = "="; // Search Operator 1

		public string SearchOperator2 = "="; // Search Operator 2

		public string SearchCondition = "AND"; // Search Condition

		public object DefaultSearchValue = ""; // Default Search Value 1

		public object DefaultSearchValue2 = ""; // Default Search Value 2

		public string DefaultSearchOperator = "="; // Default Search Operator 1

		public string DefaultSearchOperator2 = "="; // Default Search Operator 2

		public string DefaultSearchCondition = "AND"; // Default Search Condition

		public bool TruncateMemoRemoveHtml = false; // Remove HTML from memo field

		// Constructor
		public crField(string atblvar, string atblname, string afldvar, string afldname, string afldexpression, int afldtype, int aflddatatype, int aflddtfmt) {
			TblVar = atblvar;
			TblName = atblname;
			FldVar = afldvar;
			FldName = afldname;
			FldExpression = afldexpression;
			FldType = afldtype;
			FldDataType = aflddatatype;
			FldDateTimeFormat = aflddtfmt;
		}

		// Field caption
		public string FldCaption() {
			return ReportLanguage.FieldPhrase(TblVar, FldVar.Substring(2), "FldCaption");
		}

		// Field title
		public string FldTitle() {
			return ReportLanguage.FieldPhrase(TblVar, FldVar.Substring(2), "FldTitle");
		}

		// Field image alt
		public string FldAlt() {
			return ReportLanguage.FieldPhrase(TblVar, FldVar.Substring(2), "FldAlt");
		}

		// Field error message
		public string FldErrMsg() {
			string ErrMsg = ReportLanguage.FieldPhrase(TblVar, FldVar.Substring(2), "FldErrMsg");
			if (ew_Empty(ErrMsg))
				ErrMsg = FldDefaultErrMsg + " - " + FldCaption();
			return ErrMsg;
		}

		// Reset CSS styles for field object
		public void ResetCSS() {
			CellAttrs["style"] = "";
			CellAttrs["class"] = "";
			ViewAttrs["style"] = "";
			ViewAttrs["class"] = "";
		}

		// View Attributes
		public string ViewAttributes {
			get {
				string sAtt = "";
				if (ew_ConvertToInt(ImageWidth) > 0 && (!ImageResize || (ImageResize && ew_ConvertToInt(ImageHeight) <= 0)))
					sAtt += " width=\"" + ew_ConvertToInt(ImageWidth) + "\"";
				if (ew_ConvertToInt(ImageHeight) > 0 && (!ImageResize || (ImageResize && ew_ConvertToInt(ImageWidth) <= 0)))
					sAtt += " height=\"" + ew_ConvertToInt(ImageHeight) + "\"";
				foreach (DictionaryEntry d in ViewAttrs) {
					if (ew_NotEmpty(d.Value))
						sAtt += " " + d.Key + "=\"" + Convert.ToString(d.Value).Trim() + "\"";
				}
				return sAtt;
			}
		}

		// Cell attributes
		public string CellAttributes {
			get {
				string sAtt = "";
				foreach (DictionaryEntry d in CellAttrs) {
					if (ew_NotEmpty(d.Value))
						sAtt += " " + d.Key + "=\"" + Convert.ToString(d.Value).Trim() + "\"";
				}
				return sAtt;
			}
		}

		// Sort
		public string Sort {
			get { return Convert.ToString(ew_Session[EWRPT_PROJECT_NAME + "_" + TblVar + "_" + EWRPT_TABLE_SORT + "_" + FldVar]); }
			set {
				if (ew_Session[EWRPT_PROJECT_NAME + "_" + TblVar + "_" + EWRPT_TABLE_SORT + "_" + FldVar] != value)	{
					ew_Session[EWRPT_PROJECT_NAME + "_" + TblVar + "_" + EWRPT_TABLE_SORT + "_" + FldVar] = value;
				}
			}
		}

		public string ReverseSort {
			get { 
				return (Sort == "ASC") ? "DESC" : "ASC";
			}
		}

		// List view value
		public string ListViewValue {
			get {
				if (ew_Empty(ViewValue)) {
					return "&nbsp;";
				} else {
					string Result = Convert.ToString(ViewValue);
					string Result2 = Regex.Replace(Result, "<[^img][^>]*>" , String.Empty); // Remove all except non-empty image tag
					return (Result2.Trim().Equals(String.Empty)) ? "&nbsp;" : Result;	
				}
			}
		}

		// Form value
		public string FormValue {
			get { return m_FormValue; }
			set {
				m_FormValue = value;
				CurrentValue = m_FormValue;
			}
		}

		public string QueryStringValue {
			get { return m_QueryStringValue; }
			set {
				m_QueryStringValue = value;
				CurrentValue = m_QueryStringValue;
			}
		}

		// Database value
		public object DbValue {
			get { return m_DbValue; }
			set {
				if (FldType == 131)
					value = ew_ConvertToDouble(value);
				OldValue = m_DbValue;
				m_DbValue = value;
				CurrentValue = m_DbValue;
			}
		}

		// Group value
		public object GroupValue() {
			return GetGroupValue(CurrentValue);
		}

		// Group old value
		public object GroupOldValue() {
			return GetGroupValue(OldValue);
		}

		// Get group value
		public object GetGroupValue(object v) {
			if (GroupingFieldId == 1) {
				return v;
			} else if (GroupDbValues.Count > 0) {
				return GroupDbValues[v];
			} else if (ew_NotEmpty(FldGroupByType) && !ew_SameStr(FldGroupByType, "n")) {
				return ewrpt_GroupValue(this, v);
			} else {
				return v;
			}
		}
	}

	/**
	 * Chart parameter class
	 */

	public class crChartParm {

		public string Key = "";

		public object Value = null;

		public bool Output;

		public crChartParm(string k, object v, bool o) {
			Key = k;
			Value = v;
			Output = o;		
		}
	} 

	/**
	 * Chart class
	 */

	public class crChart : AspNetReportMakerBase {

		public string TblName = ""; // Table name

		public string TblVar = ""; // Table variable name

		public string ChartName = ""; // Chart name

		public string ChartVar = ""; // Chart variable name

		public string ChartXFldName = ""; // Chart X Field name

		public string ChartYFldName = ""; // Chart Y Field name

		public string ChartSFldName = ""; // Chart Series Field name

		public int ChartType; // Chart Type

		public string ChartSummaryType = ""; // Chart Summary Type

		public int ChartWidth; // Chart Width

		public int ChartHeight; // Chart Height

		public string ChartAlign = ""; // Chart Align

		public string SqlSelect = "";

		public string SqlGroupBy = "";

		public string SqlOrderBy = "";

		public string XAxisDateFormat = "";

		public string NameDateFormat = "";

		public string SeriesDateType = "";

		public string SqlSelectSeries = "";

		public string SqlGroupBySeries = "";

		public string SqlOrderBySeries = "";

		public string ID = "";

		public Dictionary<string, crChartParm> Parms = new Dictionary<string, crChartParm>();

		public ArrayList Trends = new ArrayList();

		public ArrayList Data = new ArrayList();

		public ArrayList Series = new ArrayList();

		public Regex RegexColor = new Regex("^#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$");

		public System.Globalization.CultureInfo ci = new System.Globalization.CultureInfo("en-us"); // DO NOT CHANGE!

		// Constructor
		public crChart(string stblvar, string stblname, string schartvar, string schartname, string xfld, string yfld, string sfld, int type, string smrytype, int width, int height, string align) {
			TblVar = stblvar;
			TblName = stblname;
			ChartVar = schartvar;
			ChartName = schartname;
			ChartXFldName = xfld;
			ChartYFldName = yfld;
			ChartSFldName = sfld;
			ChartType = type;
			ChartSummaryType = smrytype;
			ChartWidth = width;
			ChartHeight = height;
			ChartAlign = align;
		}

		// Chart caption
		public string ChartCaption() {
			return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartCaption");
		}

		// xaxisname
		public string ChartXAxisName() {
			return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartXAxisName");
		}

		// yaxisname
		public string ChartYAxisName() {
			return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartYAxisName");
		}

		// PYAxisName
		public string ChartPYAxisName() {
			return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartPYAxisName");
		}

		// SYAxisName
		public string ChartSYAxisName() {
			return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartSYAxisName");
		}

		// Set chart parameters
		public void SetChartParam(string key, object value, bool output) {
			Parms[key] = new crChartParm(key, value, output);
		}

		// Set up default chart parm
		public void SetupDefaultChartParm(string key, object value) {
			object parm = LoadParm(key);
			if (parm == null) {
				Parms[key] = new crChartParm(key, value, true);
			} else if (parm == "") {
				SaveParm(key, value);
			}
		}

		// Load chart parm
		public object LoadParm(string key) {
			if (Parms.ContainsKey(key))
				return Parms[key].Value;
			return null;
		}

		// Save chart parm
		public void SaveParm(string key, object value) {
			if (Parms.ContainsKey(key))
				Parms[key].Value = value;
		}

		// Chart Xml
		public string ChartXml() {

			// Initialize default values
			SetupDefaultChartParm("caption", "Chart");

			// Show names/values/hover
			SetupDefaultChartParm("shownames", "1"); // Default show names
			SetupDefaultChartParm("showvalues", "1"); // Default show values
			SetupDefaultChartParm("showhover", "1"); // Default show hover

			// Get showvalues/showhovercap
			string cht_showValues = Convert.ToString(LoadParm("showvalues"));
			string cht_showHoverCap = Convert.ToString(LoadParm("showhovercap"));

			// Format percent for Pie charts
			string cht_showPercentageValues = Convert.ToString(LoadParm("showPercentageValues"));
			string cht_showPercentageInLabel = Convert.ToString(LoadParm("showPercentageInLabel"));
			int cht_type = ew_ConvertToInt(LoadParm("type"));
			if (cht_type == 2 || cht_type == 6 || cht_type == 8) {
				if ((cht_showHoverCap == "1" && cht_showPercentageValues == "1") ||
				(cht_showValues == "1" && cht_showPercentageInLabel == "1")) {
					SetupDefaultChartParm("formatNumber", "1");
					SaveParm("formatNumber", "1");
				}
			} else if (cht_type == 20) {
				SetupDefaultChartParm("bearBorderColor", "E33C3C");
				SetupDefaultChartParm("bearFillColor", "E33C3C");
			}
			ArrayList chartseries = Series;
			ArrayList chartdata = Data;
			int cht_series = (cht_type >= 9 && cht_type <= 19) ? 1 : 0; // $cht_series = 1 (Multi series charts)
			string cht_series_type = Convert.ToString(LoadParm("seriestype"));
			int cht_alpha = ew_ConvertToInt(LoadParm("alpha"));
			string wrk = "";
			if (ew_IsArrayList(chartdata)) {
				wrk += ChartHeader(1); // Get chart header

				// Candlestick
				if (cht_type == 20) {

					// Write candlestick cat
					int xindex;
					if (((OrderedDictionary)chartdata[0]).Count >= 7) {
						string catwrk = "";
						int cntcat = chartdata.Count;
						for (int i = 0; i < cntcat; i++) {
							xindex = i + 1;
							string name = Convert.ToString(((OrderedDictionary)chartdata[i])[6]);
							if (name != "")
								catwrk += ChartCandlestickCatContent(xindex, name);
						}
						if (catwrk != "")
							wrk += ChartCatHeader(1) + catwrk + ChartCatHeader(2);
					}

					// Write candlestick data
					wrk += ChartCandlestickContentHeader(1);
					double open, high, low, close;
					for (int i = 0; i < chartdata.Count; i++) {
						OrderedDictionary temp = (OrderedDictionary)chartdata[i];
						open = ew_ConvertToDouble(temp[2]);
						high = ew_ConvertToDouble(temp[3]);
						low = ew_ConvertToDouble(temp[4]);
						close = ew_ConvertToDouble(temp[5]);
						xindex = i + 1;
						wrk += ChartCandlestickContent(open, high, low, close, xindex);
					}
					wrk += ChartCandlestickContentHeader(2);

				// Multi series
				} else if (cht_series == 1) {

					// Multi-Y values
					if (cht_series_type == "1") {

						// Write cat
						wrk += ChartCatHeader(1);
						int cntcat = chartdata.Count;
						for (int i = 0; i < cntcat; i++) {
							string name = Convert.ToString(((OrderedDictionary)chartdata[i])[0]);
							wrk += ChartCatContent(name);
						}
						wrk += ChartCatHeader(2);

						// Write series
						if (cntcat > 0) {
							OrderedDictionary temp = (OrderedDictionary)chartdata[0];
							int cntseries = chartseries.Count;
							if (cntseries > temp.Count - 2)
								cntseries = temp.Count - 2;
							double val;
							for (int i = 0; i < cntseries; i++) {
								string color = GetPaletteColor(i);
								bool bShowSeries = EWRPT_CHART_SHOW_BLANK_SERIES;
								string serieswrk = ChartSeriesHeader(1, chartseries[i], color, cht_alpha);							
								for (int j = 0; j < chartdata.Count; j++) {
									val = ew_ConvertToDouble(((OrderedDictionary)chartdata[j])[i+2]);
									if (val != 0)
										bShowSeries = true;
									serieswrk += ChartSeriesContent(val);
								}
								serieswrk += ChartSeriesHeader(2, chartseries[i], color, cht_alpha);
								if (bShowSeries)
									wrk += serieswrk;
							}
						}

					// Series field
					} else {

						// Get series names
						int nSeries = 0;
						if (ew_IsArrayList(chartseries))
							nSeries = chartseries.Count;

						// Write cat
						wrk += ChartCatHeader(1);
						List<string> chartcats = new List<string>();
						int cntdata = chartdata.Count;
						string name;
						for (int i = 0; i < cntdata; i++) {
							name = Convert.ToString(((OrderedDictionary)chartdata[i])[0]);
							if (chartcats.IndexOf(name) == -1) {
								wrk += ChartCatContent(name);
								chartcats.Add(name);
							}
						}
						wrk += ChartCatHeader(2);

						// Write series
						double val;
						for (int i = 0; i < nSeries; i++) {
							string seriesname = (ewrpt_IsArray(chartseries[i])) ? Convert.ToString(((string[])chartseries[i])[0]) : Convert.ToString(chartseries[i]);
							string color = GetPaletteColor(i);
							bool bShowSeries = EWRPT_CHART_SHOW_BLANK_SERIES;
							string serieswrk = ChartSeriesHeader(1, chartseries[i], color, cht_alpha);			
							for (int j = 0; j < chartcats.Count; j++) {
								val = 0;
								for (int k = 0; k < chartdata.Count; k++) {
									OrderedDictionary temp = (OrderedDictionary)chartdata[k];
									if (ew_SameStr(temp[0], chartcats[j]) && ew_SameStr(temp[1], seriesname)) {
										val = 0;
										if (temp.Count > 2)
											val = ew_ConvertToDouble(temp[2]);
										if (val != 0)
											bShowSeries = true;
										break;
									}
								}
								serieswrk += ChartSeriesContent(val);
							}
							serieswrk += ChartSeriesHeader(2, chartseries[i], color, cht_alpha);
							if (bShowSeries)
								wrk += serieswrk;
						}
					}

				// Single series
				} else {
					double val;
					string link = "";
					for (int i = 0; i < chartdata.Count; i++) {
						OrderedDictionary temp = (OrderedDictionary)chartdata[i];
						string name = Convert.ToString(temp[0]);
						if (name == null) {
							name = ReportLanguage.Phrase("NullLabel");
						} else if (ew_Empty(name)) {
							name = ReportLanguage.Phrase("EmptyLabel");
						}
						string color = GetPaletteColor(i);
						if (ew_NotEmpty(temp[1])) 
							name += ", " + temp[1];
						val = 0;
						if (temp.Count > 2)
							val = ew_ConvertToDouble(temp[2]);
						wrk += ChartContent(name, val, color, cht_alpha, link); // Get chart content
					}
				}

				// Get trend lines
				wrk += ChartTrendLines();

				// Get chart footer
				wrk += ChartHeader(2);
			}
			return wrk;

			// ewrpt_Trace($wrk);
		}

		// Show chart (FusionCharts Free)
		// typ: chart type (1/2/3/4/...)
		// id: chart id
		// parms: "bgcolor=FFFFFF|..."
		// trends: trend lines
		public string ShowChartFCF(string xml) {
			int typ = ChartType;
			int width = ChartWidth;
			int height = ChartHeight;
			string align = ChartAlign;
			if (ew_ConvertToInt(typ) <= 0)
				typ = 1;
			string chartswf = "";

			// Get chart swf
			switch (typ) {

				// Single Series
				case 1:	chartswf = "FCF_Column2D.swf"; break; // Column 2D
				case 2:	chartswf = "FCF_Pie2D.swf"; break; // Pie 2D
				case 3:	chartswf = "FCF_Bar2D.swf"; break; // Bar 2D
				case 4: chartswf = "FCF_Line.swf"; break; // Line 2D
				case 5: chartswf = "FCF_Column3D.swf"; break; // Column 3D
				case 6: chartswf = "FCF_Pie3D.swf"; break; // Pie 3D
				case 7: chartswf = "FCF_Area2D.swf"; break; // Area 2D
				case 8: chartswf = "FCF_Doughnut2D.swf"; break; // Doughnut 2D

				// Multi Series
				case 9: chartswf = "FCF_MSColumn2D.swf"; break; // Multi-series Column 2D
				case 10: chartswf = "FCF_MSColumn3D.swf"; break; // Multi-series Column 3D
				case 11: chartswf = "FCF_MSLine.swf"; break; // Multi-series Line 2D
				case 12: chartswf = "FCF_MSArea2D.swf"; break; // Multi-series Area 2D
				case 13: chartswf = "FCF_MSBar2D.swf"; break; // Multi-series Bar 2D

				// Stacked
				case 14: chartswf = "FCF_StackedColumn2D.swf"; break; // Stacked Column 2D
				case 15: chartswf = "FCF_StackedColumn3D.swf"; break; // Stacked Column 3D
				case 16: chartswf = "FCF_StackedArea2D.swf"; break; // Stacked Area 2D
				case 17: chartswf = "FCF_StackedBar2D.swf"; break; // Stacked Bar 2D

				// Combination
				case 18: chartswf = "FCF_MSColumn2DLineDY.swf"; break; // Multi-series Column 2D Line Dual Y Chart
				case 19: chartswf = "FCF_MSColumn3DLineDY.swf"; break; // Multi-series Column 3D Line Dual Y Chart

				// Financial
				case 20: chartswf = "FCF_Candlestick.swf"; break; // Candlestick

				// Other
				case 21: chartswf = "FCF_Gantt.swf"; break; // Gantt
				case 22: chartswf = "FCF_Funnel.swf"; break; // Funnel

				// Default
				default: chartswf = "FCF_Column2D.swf"; break; // Default = Column 2D
			}

			// Set width, height and align
			int wrkwidth;
			int wrkheight;
			string wrkalign;
			if (Information.IsNumeric(width) && Information.IsNumeric(height)) {
				wrkwidth = width;
				wrkheight = height;
			} else { // default
				wrkwidth = EWRPT_CHART_WIDTH;
				wrkheight = EWRPT_CHART_HEIGHT;
			}
			if (ew_SameStr(align, "left") || ew_SameStr(align, "right")) {
				wrkalign = align.ToLower();
			} else {
				wrkalign = EWRPT_CHART_ALIGN; // default
			}

			// Output JavaScript for FCF
			string chartxml = xml;
			string wrk = "<script type=\"text/javascript\">\n";
			wrk += "var chartwidth = \"" + wrkwidth + "\";\n";
			wrk += "var chartheight = \"" + wrkheight + "\";\n";
			wrk += "var chartalign = \"" + wrkalign + "\";\n";
			wrk += "var chartxml = \"" + ewrpt_EscapeJs(chartxml) + "\";\n";
			wrk += "var chartid = \"div_" + ID + "\";\n";
			wrk += "var chartswf = \"FusionChartsFree/Charts/" + chartswf + "\";\n";
			wrk += "var chart = new FusionCharts(chartswf, \"ewchart\", chartwidth, chartheight);\n";
			wrk += "chart.addParam(\"wmode\", \"transparent\");\n";
			wrk += "chart.setDataXML(chartxml);\n";
			wrk += "chart.render(chartid);\n";
			wrk += "</script>\n";

			// Add debug xml
			if (EWRPT_DEBUG_ENABLED)
				wrk += "<p>(Chart XML): " + ew_HtmlEncode(chartxml) + "</p>";
			return wrk;
		}

		// Show Chart Xml
		public void ShowChartXml() {

			// Build chart content
			string sChartContent = ChartXml();
			HttpContext.Current.Response.AddHeader("Content-Type", "text/xml; charset=UTF-8");

			// Write utf-8 BOM
			HttpContext.Current.Response.BinaryWrite(new byte[]{0xEF, 0xBB, 0xBF});

			// Write utf-8 encoding
			ew_Write("<?xml version=\"1.0\" encoding=\"utf-8\" ?>");

			// Write content
			ew_Write(sChartContent);
		}

		// Show Chart Text
		public void ShowChartText() {

			// Build chart content
			string sChartContent = ChartXml();
			HttpContext.Current.Response.AddHeader("Content-Type", "text/xml; charset=UTF-8");

			// Write content
			ew_Write(sChartContent);
		}

		// Get color
		public string GetPaletteColor(int i) {
			string colorpalette = Convert.ToString(LoadParm("colorpalette"));
			string[] ar_cht_colorpalette = colorpalette.Split(new char[] {'|'});
			int cntar = ar_cht_colorpalette.Length;
			return ar_cht_colorpalette[i % cntar];
		}

		// Convert to HTML color
		public string ColorCode(string c) {
			if (ew_NotEmpty(c)) {

				// remove #
				string color = c.Replace("#", "");

				// fill to 6 digits
				return color.PadLeft(6, '0');
			} else {
				return "";
			}
		}

		// Output chart header
		public string ChartHeader(int typ) {
			string wrk;
			if (typ == 1) {
				wrk = "<graph";
				foreach (KeyValuePair<string, crChartParm> p in Parms) {
					crChartParm parm = p.Value;
					if (parm.Output)
						WriteAtt(ref wrk, parm.Key, parm.Value);
				}
				wrk += ">";
			} else {
				wrk = "</graph>";
			}
			return wrk;
		}

		// Get TrendLine XML
		// <trendlines>
		//    <line startvalue='0.8' displayValue='Good' color='FF0000' thickness='1' isTrendZone='0'/>
		//    <line startvalue='-0.4' displayValue='Bad' color='009999' thickness='1' isTrendZone='0'/>
		// </trendlines>
		public string ChartTrendLines() {
			string wrk = "";
			foreach (object[] trend in Trends) { // Get all trend lines
				wrk += "<trendlines>";					
				wrk += ChartTrendLine(trend[0], trend[1], trend[2], trend[3], trend[4], trend[5], trend[6], trend[7]);
				wrk += "</trendlines>";
			}
			return wrk;
		}

		// Output trend line
		public string ChartTrendLine(object startval, object endval, object color, object dispval, object thickness, object trendzone, object showontop, object alpha) {
			string wrk = "<line";
			WriteAtt(ref wrk, "startValue", startval); // Starting y value
			if (ew_ConvertToDouble(endval) != 0)
				WriteAtt(ref wrk, "endValue", endval); // Ending y value
			WriteAtt(ref wrk, "color", CheckColorCode(color)); // Color
			if (ew_NotEmpty(dispval))
				WriteAtt(ref wrk, "displayValue", dispval); // Display value
			if (ew_ConvertToInt(thickness) > 0)
				WriteAtt(ref wrk, "thickness", thickness); // Thickness
			WriteAtt(ref wrk, "isTrendZone", trendzone); // Display trend as zone or line
			WriteAtt(ref wrk, "showOnTop", showontop); // Show on top
			if (ew_ConvertToInt(alpha) > 0)
				WriteAtt(ref wrk, "alpha", alpha); // Alpha
			wrk += "/>";
			return wrk;
		}

		// Category header/footer XML (multi series)
		public string ChartCatHeader(int typ) {
			return (typ == 1) ? "<categories>" : "</categories>";
		}

		// Category content XML (multi series)
		public string ChartCatContent(string name) {
			string wrk = "<category";
			WriteAtt(ref wrk, "name", name);
			wrk += "/>";
			return wrk;
		}

		// Series header/footer XML (multi series)
		public string ChartSeriesHeader(int typ, object series, string color, int alpha) {
			string wrk = "";
			if (typ == 1) {
				wrk = "<dataset";
				object seriesname = (ewrpt_IsArray(series)) ? ((object[])series)[0] : series;
				if (Convert.IsDBNull(seriesname)) {
					seriesname = ReportLanguage.Phrase("NullLabel");
				} else if (ew_Empty(seriesname)) {
					seriesname = ReportLanguage.Phrase("EmptyLabel");
				}
				WriteAtt(ref wrk, "seriesname", seriesname);
				WriteAtt(ref wrk, "color", ColorCode(color));
				WriteAtt(ref wrk, "alpha", alpha);
				if (ewrpt_IsArray(series))
					WriteAtt(ref wrk, "parentYAxis", ((object[])series)[1]);
				wrk += ">";
			} else {
				wrk = "</dataset>";
			}
			return wrk;
		}

		// Series content XML (multi series)
		public string ChartSeriesContent(double val) {
			string wrk = "<set";
			WriteAtt(ref wrk, "value", ChartFormatNumber(val));
			wrk += "/>";
			return wrk;
		}

		// Chart content XML
		public string ChartContent(string name, double val, string color, int alpha, string lnk) {
			string cht_shownames = Convert.ToString(LoadParm("shownames"));
			string wrk = "<set";
			WriteAtt(ref wrk, "name", name);
			WriteAtt(ref wrk, "value", ChartFormatNumber(val));
			WriteAtt(ref wrk, "color", ColorCode(color));
			WriteAtt(ref wrk, "alpha", alpha);
			WriteAtt(ref wrk, "link", lnk);
			if (cht_shownames == "1")
				WriteAtt(ref wrk, "showName", "1");
			wrk += " />";
			return wrk;
		}

		// Category content XML (Candlestick category)
		public string ChartCandlestickCatContent(int xindex, string name) {
			string wrk = "<category";
			WriteAtt(ref wrk, "name", name);
			WriteAtt(ref wrk, "xindex", xindex);
			WriteAtt(ref wrk, "showline", "1");
			wrk += "/>";
			return wrk;
		}

		// Chart content header XML (Candlestick)
		public string ChartCandlestickContentHeader(int typ) {
			return (typ == 1) ? "<data>" : "</data>";
		}

		// Chart content XML (Candlestick)
		public string ChartCandlestickContent(double open, double high, double low, double close, int xindex) {
			string wrk = "<set";
			WriteAtt(ref wrk, "open", ChartFormatNumber(open));
			WriteAtt(ref wrk, "high", ChartFormatNumber(high));
			WriteAtt(ref wrk, "low", ChartFormatNumber(low));
			WriteAtt(ref wrk, "close", ChartFormatNumber(close));
			if (ew_NotEmpty(xindex))
				WriteAtt(ref wrk, "xindex", xindex);
			wrk += " />";
			return wrk;
		}

		// Format number for chart
		public string ChartFormatNumber(double v) {
			object cht_decimalprecision = LoadParm("decimalPrecision");
			if (cht_decimalprecision == null) {
				return Convert.ToString(v);
			} else {
				return v.ToString("F" + Convert.ToString(cht_decimalprecision), ci);
			}
		}

		// Write attribute
		public void WriteAtt(ref string str, string name, object val) {
			val = CheckColorCode(val);
			val = ChartEncode(val);
			if (ew_NotEmpty(val))
				str += " " + name + "=\"" + ew_HtmlEncode(val) + "\"";
		}

		// Check color code
		public object CheckColorCode(object val) {
			string value = Convert.ToString(val);
			if (RegexColor.IsMatch(value)) {
				return value.Substring(1);
			} else {
				return value;
			}
		}

		// Encode special characters for FusionChartsFree
		// + => %2B
		public object ChartEncode(object val) {
			string value = Convert.ToString(val);
			value = value.Replace("+", "%2B");
			return value;
		}
	}

	//
	// Column class
	//
	public class crCrosstabColumn {

		public string Caption = "";

		public object Value;

		public bool Visible = true;

		public crCrosstabColumn(object val, string cap, bool vis) {
			Caption = cap;
			Value = val;
			Visible = vis;
		}
	}

	//
	// Custom filter class
	//
	public class crCustomFilter {

		public string FldName = "";

		public string FilterName = "";

		public string DisplayName = "";

		public string FldExpression = "";

		public string FunctionName = "";

		public crCustomFilter(string fld, string filter, string display, string exp, string fn) {
			FldName = fld;
			FilterName = filter;
			DisplayName = display;
			FldExpression = exp;
			FunctionName = fn;
		}
	}

	// Load email count
	public static int ewrpt_LoadEmailCount() {

		// Read from log
		if (EWRPT_EMAIL_WRITE_LOG) {
			string ip = ew_ServerVar("REMOTE_ADDR");

			// Load from database
			if (EWRPT_EMAIL_WRITE_LOG_TO_DATABASE) {
				string dt1 = DateTime.Now.AddMinutes(EWRPT_MAX_EMAIL_SENT_PERIOD * -1).ToString("yyyyMMdd HH:mm:ss");
				string dt2 = DateTime.Now.ToString("yyyyMMdd HH:mm:ss");
				string sEmailSql = "SELECT COUNT(*) FROM " + ew_QuotedName(EWRPT_EMAIL_LOG_TABLE_NAME) +
					" WHERE " + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_DATETIME) +
					" BETWEEN " + ew_QuotedValue(dt1, EWRPT_DATATYPE_DATE) + " AND " + ew_QuotedValue(dt2, EWRPT_DATATYPE_DATE) +
					" AND " + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_IP) + 
					" = " + ew_QuotedValue(ip, EWRPT_DATATYPE_STRING);
				int cnt = ew_ConvertToInt(ew_ExecuteScalar(sEmailSql));
				if (cnt > -1) {
					ew_Session[EWRPT_EXPORT_EMAIL_COUNTER] = cnt;
				} else {
					ew_Session[EWRPT_EXPORT_EMAIL_COUNTER] = 0;
				}

			// Load from log file
			} else {
				string pfx = "email";
				string sTab = "\t";
				string sFolder = EWRPT_UPLOAD_DEST_PATH;
				string randomkey = cTEA.Encrypt(DateTime.Today.ToString("yyyyMMdd"), EWRPT_RANDOM_KEY);
				randomkey = randomkey.Replace("_", "").Replace("-", "").Replace(".", "").Substring(0, 32);
				string sFn = pfx + "_" + DateTime.Today.ToString("yyyyMMdd") + "_" + randomkey + ".txt";
				string filename = ew_UploadPathEx(true, sFolder) + sFn;
				if (File.Exists(filename)) {
					string[] arLines = File.ReadAllLines(filename);
					int cnt = 0;
					foreach (string line in arLines) {
						if (ew_NotEmpty(line)) {
							string[] arwrk = line.Split(new Char[] {Convert.ToChar(sTab)});
							DateTime dtwrk;
							if (DateTime.TryParse(arwrk[0], out dtwrk)) {
								string ipwrk = arwrk[1];
								if (ipwrk == ip && dtwrk.AddMinutes(EWRPT_MAX_EMAIL_SENT_PERIOD) > DateTime.Now)
									cnt++;
							}
						}
					}
					ew_Session[EWRPT_EXPORT_EMAIL_COUNTER] = cnt;
				} else {
					ew_Session[EWRPT_EXPORT_EMAIL_COUNTER] = 0;
				}
			}
		}
		if (ew_Session[EWRPT_EXPORT_EMAIL_COUNTER] == null)
			ew_Session[EWRPT_EXPORT_EMAIL_COUNTER] = 0;
		return ew_ConvertToInt(ew_Session[EWRPT_EXPORT_EMAIL_COUNTER]);
	}

	// Add email log
	public void ewrpt_AddEmailLog(string sender, string recipient, string subject, string message) {
		int cnt = ew_ConvertToInt(ew_Session[EWRPT_EXPORT_EMAIL_COUNTER]);
		ew_Session[EWRPT_EXPORT_EMAIL_COUNTER] = cnt++;

		// Save to email log
		if (EWRPT_EMAIL_WRITE_LOG) {
			string dt = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
			string ip = ew_ServerVar("REMOTE_ADDR");
			string senderwrk = ewrpt_TruncateText(sender);
			string recipientwrk = ewrpt_TruncateText(recipient);
			string subjectwrk = ewrpt_TruncateText(subject);
			string messagewrk = ewrpt_TruncateText(message);

			// Save to database
			if (EWRPT_EMAIL_WRITE_LOG_TO_DATABASE) {
				string sEmailSql = "INSERT INTO " + ew_QuotedName(EWRPT_EMAIL_LOG_TABLE_NAME) +
					" (" + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_DATETIME) + ", " +
					ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_IP) + ", " +
					ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_SENDER) + ", " +
					ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_RECIPIENT) + ", " +
					ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_SUBJECT) + ", " +
					ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_MESSAGE) + ") VALUES (" +
					ew_QuotedValue(dt, EWRPT_DATATYPE_DATE) + ", " +
					ew_QuotedValue(ip, EWRPT_DATATYPE_STRING) + ", " +
					ew_QuotedValue(senderwrk, EWRPT_DATATYPE_STRING) + ", " +
					ew_QuotedValue(recipientwrk, EWRPT_DATATYPE_STRING) + ", " +
					ew_QuotedValue(subjectwrk, EWRPT_DATATYPE_STRING) + ", " +
					ew_QuotedValue(messagewrk, EWRPT_DATATYPE_STRING) + ")";
				Conn.Execute(sEmailSql);

			// Save to log file
			} else {
				string pfx = "email";
				string sTab = "\t";
				string sHeader = "date/time" + sTab + "ip" + sTab + "sender" + sTab + "recipient" + sTab + "subject" + sTab + "message";
				string sMsg = dt + sTab + ip + sTab + senderwrk + sTab + recipientwrk + sTab + subjectwrk + sTab + messagewrk;
				string sFolder = EWRPT_UPLOAD_DEST_PATH;
				string randomkey = cTEA.Encrypt(DateTime.Today.ToString("yyyyMMdd"), EWRPT_RANDOM_KEY);
				randomkey = randomkey.Replace("_", "").Replace("-", "").Replace(".", "").Substring(0, 32);
				string sFn = pfx + "_" + DateTime.Today.ToString("yyyyMMdd") + "_" + randomkey + ".txt";
				string filename = ew_UploadPathEx(true, sFolder) + sFn;
				StreamWriter sw;
				if (File.Exists(filename)) {
					sw = File.AppendText(filename);
				} else {
					sw = File.CreateText(filename);
					sw.WriteLine(sHeader);
				}
				sw.WriteLine(sMsg);
				sw.Close();
			}
		}
	}

	public string ewrpt_TruncateText(string v) {
		int maxlen = EWRPT_EMAIL_LOG_SIZE_LIMIT;
		v = v.Replace("\r\n", " ");
		v = v.Replace("\t", " ");
		if (v.Length > maxlen)
			v = v.Substring(0, maxlen-3) + "...";
		return v;
	}

	// Check if object is Hashtable
	public static bool ewrpt_IsHashtable(object obj) {
		return (obj != null) && (obj.GetType().ToString() == "System.Collections.Hashtable");
	}	

	// Validation functions
	// Check date format
	// format: std/us/euro
	public static bool ewrpt_CheckDateEx(string value, string format, string sep)
	{
		if (value == "") return true; 
		while (value.Contains("  ")) {
			value = value.Replace("  ", " ");
		}
		value = value.Trim();
		string[] arDT;
		string[] arD;
		string pattern = "";
		string sYear = "";
		string sMonth = "";
		string sDay = "";
		arDT = value.Split(new char[] {' '});
		if (arDT.Length > 0)	{
			sep = "\\" + sep;
			switch (format) {
				case "std":
					pattern = "^([0-9]{4})" + sep + "([0]?[1-9]|[1][0-2])" + sep + "([0]?[1-9]|[1|2][0-9]|[3][0|1])";
					break;
				case "us":
					pattern = "^([0]?[1-9]|[1][0-2])" + sep + "([0]?[1-9]|[1|2][0-9]|[3][0|1])" + sep + "([0-9]{4})";
					break;
				case "euro":
					pattern = "^([0]?[1-9]|[1|2][0-9]|[3][0|1])" + sep + "([0]?[1-9]|[1][0-2])" + sep + "([0-9]{4})";
					break;
			}
			Regex re = new Regex(pattern);
			if (!re.IsMatch(arDT[0])) return false; 
			arD = arDT[0].Split(new char[] {Convert.ToChar(EWRPT_DATE_SEPARATOR)});
			switch (format) {
				case "std":
					sYear = arD[0];
					sMonth = arD[1];
					sDay = arD[2];
					break;
				case "us":
					sYear = arD[2];
					sMonth = arD[0];
					sDay = arD[1];
					break;
				case "euro":
					sYear = arD[2];
					sMonth = arD[1];
					sDay = arD[0];
					break;
			}
			if (!ewrpt_CheckDay(ew_ConvertToInt(sYear), ew_ConvertToInt(sMonth), ew_ConvertToInt(sDay))) return false; 
		}
		if (arDT.Length > 1 && !ewrpt_CheckTime(arDT[1])) return false; 
		return true;
	}

	// Check Date format (yyyy/mm/dd)
	public static bool ewrpt_CheckDate(string value)
	{
		return ewrpt_CheckDateEx(value, "std", EWRPT_DATE_SEPARATOR);
	}

	// Check US Date format (mm/dd/yyyy)
	public static bool ewrpt_CheckUSDate(string value)
	{
		return ewrpt_CheckDateEx(value, "us", EWRPT_DATE_SEPARATOR);
	}

	// Check Euro Date format (dd/mm/yyyy)
	public static bool ewrpt_CheckEuroDate(string value)
	{
		return ewrpt_CheckDateEx(value, "euro", EWRPT_DATE_SEPARATOR);
	}

	// Check day
	public static bool ewrpt_CheckDay(int checkYear, int checkMonth, int checkDay)
	{
		int maxDay = 31;
		if (checkMonth == 4 || checkMonth == 6 || checkMonth == 9 || checkMonth == 11) {
			maxDay = 30;
		} else if (checkMonth == 2) {
			if (checkYear % 4 > 0)	{
				maxDay = 28;
			} else if (checkYear % 100 == 0 && checkYear % 400 > 0) {
				maxDay = 28;
			}	else	{
				maxDay = 29;
			}
		}
		return ewrpt_CheckRange(Convert.ToString(checkDay), 1, maxDay);
	}

	// Check integer
	public static bool ewrpt_CheckInteger(string value)
	{
		if (value == "") return true; 
		Regex re = new Regex("^\\-?\\+?[0-9]+");
		return re.IsMatch(value);
	}

	// Check number range
	public static bool ewrpt_NumberRange(string value, object min, object max)
	{
		if ((min != null && Convert.ToDouble(value) < Convert.ToDouble(min)) || (max != null && Convert.ToDouble(value) > Convert.ToDouble(max)))	{
			return false;
		}
		return true;
	}

	// Check number
	public static bool ewrpt_CheckNumber(string value)
	{
		if (value == "") return true; 
		return Information.IsNumeric(Strings.Trim(value));
	}

	// Check range
	public static bool ewrpt_CheckRange(string value, object min, object max)
	{
		if (value == "") return true; 
		if (!ewrpt_CheckNumber(value)) return false; 
		return ewrpt_NumberRange(value, min, max);
	}

	// Check time
	public static bool ewrpt_CheckTime(string value)
	{
		if (value == "") return true;
		string[] Values = value.Split(new Char[] {'.', ' '}); 
		Regex re = new Regex("^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]");
		return re.IsMatch(Values[0]);
	}

	// Check US phone number
	public static bool ewrpt_CheckPhone(string value)
	{
		if (value == "") return true; 
		Regex re = new Regex("^\\(\\d{3}\\) ?\\d{3}( |-)?\\d{4}|^\\d{3}( |-)?\\d{3}( |-)?\\d{4}");
		return re.IsMatch(value);
	}

	// Check US zip code
	public static bool ewrpt_CheckZip(string value)
	{
		if (value == "") return true; 
		Regex re = new Regex("^\\d{5}|^\\d{5}-\\d{4}");
		return re.IsMatch(value);
	}

	// Check credit card
	public static bool ewrpt_CheckCreditCard(string value)
	{
		if (value == "") return true; 
		Hashtable creditcard = new Hashtable();
		bool match = false;
		creditcard.Add("visa", "^4\\d{3}[ -]?\\d{4}[ -]?\\d{4}[ -]?\\d{4}");
		creditcard.Add("mastercard", "^5[1-5]\\d{2}[ -]?\\d{4}[ -]?\\d{4}[ -]?\\d{4}");
		creditcard.Add("discover", "^6011[ -]?\\d{4}[ -]?\\d{4}[ -]?\\d{4}");
		creditcard.Add("amex", "^3[4,7]\\d{13}");
		creditcard.Add("diners", "^3[0,6,8]\\d{12}");
		creditcard.Add("bankcard", "^5610[ -]?\\d{4}[ -]?\\d{4}[ -]?\\d{4}");
		creditcard.Add("jcb", "^[3088|3096|3112|3158|3337|3528]\\d{12}");
		creditcard.Add("enroute", "^[2014|2149]\\d{11}");
		creditcard.Add("switch", "^[4903|4911|4936|5641|6333|6759|6334|6767]\\d{12}");
		Regex re;
		foreach (DictionaryEntry de in creditcard) {
			re = new Regex(Convert.ToString(de.Value));
			if (re.IsMatch(value))
				return ewrpt_CheckSum(value);
		}
		return false;
	}

	// Check sum
	public static bool ewrpt_CheckSum(string value)
	{
		int checksum;
		byte digit;
		value = value.Replace("-", "");
		value = value.Replace(" ", "");
		checksum = 0;
		for (int i = 2 - (value.Length % 2); i <= value.Length; i += 2) {
			checksum = checksum + Convert.ToByte(value[i - 1]);
		}
		for (int i = (value.Length % 2) + 1; i <= value.Length; i += 2) {
			digit = Convert.ToByte(Convert.ToByte(value[i - 1]) * 2);
			checksum = checksum + ((digit < 10) ? digit : (digit - 9));
		}
		return (checksum % 10 == 0);
	}

	// Check US social security number
	public static bool ewrpt_CheckSSC(string value)
	{
		if (value == "") return true; 
		Regex re = new Regex("^(?!000)([0-6]\\d{2}|7([0-6]\\d|7[012]))([ -]?)(?!00)\\d\\d\\3(?!0000)\\d{4}");
		return re.IsMatch(value);
	}

	// Check email
	public static bool ewrpt_CheckEmail(string value)
	{
		if (value == "") return true; 
		Regex re = new Regex("^[A-Za-z0-9\\._\\-+]+@[A-Za-z0-9_\\-+]+(\\.[A-Za-z0-9_\\-+]+)+");
		return re.IsMatch(value);
	}

	// Check emails
	public static bool ewrpt_CheckEmailList(string value, int cnt)
	{
		if (value == "") return true; 
		string emailList = value.Replace(",", ";");
		string[] arEmails = emailList.Split(new char[] {';'});
		if (arEmails.Length > cnt && cnt > 0)
			return false;
		foreach (string email in arEmails) {
			if (!ewrpt_CheckEmail(email))
				return false;
		}
		return true;
	}

	// Check GUID
	public static bool ewrpt_CheckGUID(string value)
	{
		if (value == "") return true; 
		Regex re1 = new Regex("^{{1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}}{1}");
		Regex re2 = new Regex("^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}");
		return re1.IsMatch(value) || re2.IsMatch(value);
	}

	// Check by regular expression
	public static bool ewrpt_CheckByRegEx(string value, string pattern)
	{
		if (value == "") return true; 
		return Regex.IsMatch(value, pattern);
	}

	// Check by regular expression
	public static bool ewrpt_CheckByRegEx(string value, string pattern, RegexOptions options)
	{
		if (value == "") return true; 
		return Regex.IsMatch(value, pattern, options);
	}	

	// Save string to file
	public static bool ewrpt_SaveFile(string folder, string fn, string filedata)
	{
		if (ew_CreateFolder(folder)) {
			try {
				FileStream fs = new FileStream(folder + fn, FileMode.Create);
				Encoding enc;
				try {
					enc = Encoding.GetEncoding(EWRPT_EMAIL_CHARSET);
				}	catch {
					enc = Encoding.UTF8; // Default	
				}
				byte[] data = enc.GetBytes(filedata);
				fs.Write(data, 0, data.Length);
				fs.Close();
				return true;
			}	catch {
				if (EWRPT_DEBUG_ENABLED) throw; 
				return false;
			}
		}
		return false;
	}

	// Send email
	public static bool ewrpt_SendEmail(string sFrEmail, string sToEmail, string sCcEmail, string sBccEmail, string sSubject, string sMail, string sAttachmentFileName, string sAttachmentContent, string sFormat, string sCharset)
	{
		MailMessage mail = new MailMessage();
		if (ew_NotEmpty(sFrEmail))
			mail.From = new MailAddress(sFrEmail);
		if (ew_NotEmpty(sToEmail))	{
			sToEmail = sToEmail.Replace(',', ';');
			string[] arTo = sToEmail.Split(new char[] {';'});
			foreach (string strTo in arTo)
				mail.To.Add(strTo);
		}
		if (ew_NotEmpty(sCcEmail))	{
			sCcEmail = sCcEmail.Replace(',', ';');
			string[] arCC = sCcEmail.Split(new char[] {';'});
			foreach (string strCC in arCC)
				mail.CC.Add(strCC);
		}
		if (ew_NotEmpty(sBccEmail)){
			sBccEmail = sBccEmail.Replace(',', ';');
			string[] arBcc = sBccEmail.Split(new char[] {';'});
			foreach (string strBcc in arBcc)
				mail.Bcc.Add(strBcc);
		}
		mail.Subject = sSubject;
		mail.Body = sMail;
		mail.IsBodyHtml = ew_SameText(sFormat, "html");
		if (ew_NotEmpty(sCharset))
			mail.BodyEncoding = Encoding.GetEncoding(sCharset); 
		SmtpClient smtp = new SmtpClient();
		smtp.Host = (ew_NotEmpty(EWRPT_SMTP_SERVER)) ? EWRPT_SMTP_SERVER : "localhost";
		if (EWRPT_SMTP_SERVER_PORT > 0)
			smtp.Port = EWRPT_SMTP_SERVER_PORT;
		if (ew_NotEmpty(EWRPT_SMTP_SERVER_USERNAME) && ew_NotEmpty(EWRPT_SMTP_SERVER_PASSWORD))	{
			NetworkCredential smtpuser = new NetworkCredential();
			smtpuser.UserName = EWRPT_SMTP_SERVER_USERNAME;
			smtpuser.Password = EWRPT_SMTP_SERVER_PASSWORD;
			smtp.UseDefaultCredentials = false;
			smtp.Credentials = smtpuser;
		}
		if (ew_NotEmpty(sAttachmentFileName) && ew_NotEmpty(sAttachmentContent)) { // HTML
			byte[] arByte = mail.BodyEncoding.GetBytes(sAttachmentContent);
			MemoryStream stream = new MemoryStream(arByte); 
			Attachment data = new Attachment(stream, new ContentType(MediaTypeNames.Text.Html));
			ContentDisposition disposition = data.ContentDisposition;
			disposition.FileName = sAttachmentFileName;		
			mail.Attachments.Add(data);
		} else if (ew_NotEmpty(sAttachmentFileName)) { // URL
			Attachment data = new Attachment(sAttachmentFileName, new ContentType(MediaTypeNames.Text.Html));			
			mail.Attachments.Add(data);	
		}
		try {			
			smtp.Send(mail);
			return true;
		}	catch (Exception e) {
			gsEmailErrDesc = e.ToString();
			if (EWRPT_DEBUG_ENABLED) throw; 
			return false;
		}
	}

	//
	// Email class (Report Maker)
	//
	public class crEmail : cEmail
	{

		public string AttachmentFileName = ""; // Attachment file name

		public string AttachmentContent = ""; // Attachement content		

		// Send email
		public bool Send()
		{
			gsEmailErrDesc = ""; // Reset
			bool bSend = ewrpt_SendEmail(Sender, Recipient, Cc, Bcc, Subject, Content, AttachmentFileName, AttachmentContent, Format, Charset);
			if (!bSend)
				SendErrDescription = gsEmailErrDesc; // Send error description
			return bSend;
		}		

		// Display as string
		public string AsString()
		{
			return "{Sender: " + Sender + ", Recipient: " + Recipient + ", Cc: " + Cc + ", Bcc: " + Bcc + ", Subject: " + Subject + ", Format: " + Format + ", Content: " + Content + ", Charset: " + Charset + ", AttachmentFileName: " + AttachmentFileName + ", AttachmentContent: " + AttachmentContent + "}";
		}
	}

	//
	//  XML document class
	//
	public class crXMLDocument : IDisposable {

		public string Encoding = "";

		public string RootTagName = "table";

		public string RowTagName = "row";

		public XmlDocument XmlDoc;

		public XmlElement XmlTbl;

		public XmlElement XmlRow;

		public XmlElement XmlFld;

		// Constructor
		public crXMLDocument() {
			XmlDoc = new XmlDocument();
		}

		// Add root
		public void AddRoot(string name) {
			XmlTbl = XmlDoc.CreateElement(name);
			XmlDoc.AppendChild(XmlTbl);
		}

		// Add row
		public void AddRow() {
			AddRowEx(RowTagName);
		}

		// Add row by name
		public void AddRowEx(string Name) {
			XmlRow = XmlDoc.CreateElement(Name);
			XmlTbl.AppendChild(XmlRow);
		}

		// Add field
		public void AddField(string Name, string Value) {
			XmlFld = XmlDoc.CreateElement(Name);
			XmlRow.AppendChild(XmlFld);
			XmlFld.AppendChild(XmlDoc.CreateTextNode(Value + ""));
		}

		// XML
		public string XML() {
			return XmlDoc.OuterXml;
		}

		// Output
		public void Output() {
			if (HttpContext.Current.Response.Buffer)
				HttpContext.Current.Response.Clear(); 
			HttpContext.Current.Response.ContentType = "text/xml";
			string PI = "<?xml version=\"1.0\"";
			if (Encoding != "")
				PI += " encoding=\"" + Encoding + "\"";
			PI += " ?>";
			HttpContext.Current.Response.Write(PI + XmlDoc.OuterXml);
		}

		// Output XML for debug
		public void Print() {
			if (HttpContext.Current.Response.Buffer)
				HttpContext.Current.Response.Clear(); 
			HttpContext.Current.Response.ContentType = "text/plain";
			HttpContext.Current.Response.Write(HttpContext.Current.Server.HtmlEncode(XmlDoc.OuterXml));
		}

		// Load XML
		public void LoadXML(string source) {
			XmlDoc.LoadXml(source);
		}

		// Create XML element
		public XmlElement CreateElement(string name) {
			return XmlDoc.CreateElement(name);
		}

		// getelement
		public XmlNodeList GetElementsByTagName(string name) {
			return XmlDoc.GetElementsByTagName(name);
		}

		// Append XML element to target element
		public void AppendChild(ref XmlElement parent, ref XmlElement child) {
			if (parent == null || child == null)
				return;
			parent.AppendChild(child);
		}

		// Append XML element to root
		public void AppendChildToRoot(ref XmlElement child) {
			AppendChild(ref XmlTbl, ref child);
		}

		// Set attribute
		public void SetAttribute(ref XmlElement element, object name, object value) {
			if (element == null)
				return;
			element.SetAttribute(Convert.ToString(name), Convert.ToString(value));
		}

		// Set attribute // ASPXRPT
		public void SetAttribute(ref XmlElement element, DictionaryEntry de) {
			if (element == null)
				return;
			element.SetAttribute(Convert.ToString(de.Key), Convert.ToString(de.Value));
		}

		// Terminate
		public void Dispose() {
			XmlFld = null;
			XmlRow = null;
			XmlTbl = null;
			XmlDoc = null;
		}		
	}

	// Resize binary to thumbnail
	public static bool ewrpt_ResizeBinary(ref byte[] filedata, ref int width, ref int height, int interpolation)
	{
		return true; // No resize
	}

	// Resize file to thumbnail file
	public static bool ewtpy_ResizeFile(string fn, string tn, ref int width, ref int height, int interpolation)
	{
		try {
			if (File.Exists(fn)) {
				File.Copy(fn, tn); // Copy only
				return true;
			}
			return false;
		}	catch {
			if (EWRPT_DEBUG_ENABLED) throw; 
			return false;
		}
	}

	// Resize file to binary
	public static byte[] ewrpt_ResizeFileToBinary(string fn, ref int width, ref int height, int interpolation)
	{
		try {
			if (File.Exists(fn)) {
				FileInfo oFile = new FileInfo(fn);
				FileStream fs = oFile.OpenRead();
				long lBytes = fs.Length;
				if (lBytes > 0)	{
					byte[] fileData = new byte[lBytes];
					fs.Read(fileData, 0, (int)lBytes); // Read the file into a byte array
					fs.Close();
					fs.Dispose();
					return fileData;
				}
			}
			return null;
		}	catch {
			if (EWRPT_DEBUG_ENABLED) throw; 
			return null;
		}
	}
}
