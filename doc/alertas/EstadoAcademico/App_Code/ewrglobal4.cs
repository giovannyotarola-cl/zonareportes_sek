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
// ASP.NET Report Maker 4 - Global
// (C) 2010 e.World Technology Ltd.
//
public partial class AspNetReportMaker4_project1: System.Web.UI.Page
{

	/**
	 * Global variables
	 */

	// Connection
	public cConnection Conn;

	// Language
	public static string gsLanguage = "";

	// Security
	public cAdvancedSecurity Security;

	// Export
	public static string gsExport = "";

	public static string gsExportFile = "";

	// Email
	public static string gsEmailSender = "";

	public static string gsEmailRecipient = "";

	public static string gsEmailCc = "";

	public static string gsEmailBcc = "";

	public static string gsEmailSubject = "";

	public static string gsEmailContent = "";

	public static string gsEmailContentType = "";

	public static string gsEmailErrNo = "";

	public static string gsEmailErrDesc = "";

	// Used by extended filter
	public static string gsFormError = "";

	// Debug message
	public static string gsDebugMsg = "";

	// Timer
	public long StartTimer;

	// Page Loading event
	public void Page_Loading() {

		//ew_Write("Page Loading");
	}

	// Page Unloaded event
	public void Page_Unloaded() {

		//ew_Write("Page Unloaded");
	}

	// Language
	public crLanguage ReportLanguage;

	// Runtime variables	
	public string sSql = "";

	public object ChartObj;	

	public string SqlSelect = "";

	public string SqlChartSelect = "";

	public string SqlChartBase = "";

	public string chartxml = "";
}
