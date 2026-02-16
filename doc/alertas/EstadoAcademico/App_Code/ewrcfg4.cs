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
// ASP.NET Report Maker 4 - Project Configuration
// (C) 2010 e.World Technology Ltd.
//
public partial class AspNetReportMaker4_project1: System.Web.UI.Page
{

	// Debug
	public const bool EWRPT_DEBUG_ENABLED = false; // Change to true to debug

	// Project
	public const string EWRPT_PROJECT_NAME = "project1"; // Project variable

	public const string EWRPT_LANGUAGE_FOLDER = "aspxrptlang/";

	public static string[][] EWRPT_LANGUAGE_FILE = new string[][] {
			new string[] {"en", "", "english.xml"}
	};

	public const string EWRPT_LANGUAGE_DEFAULT_ID = "en";

	public const string EWRPT_SESSION_LANGUAGE_ID = EWRPT_PROJECT_NAME + "_LanguageId"; // Language ID

	public const bool EWRPT_USE_DOM_XML = false;

	// Response.Buffer
	public const bool EWRPT_RESPONSE_BUFFER = true;

	// Date format
	public const string EWRPT_DATE_SEPARATOR = "/";	

	public const short EWRPT_DEFAULT_DATE_FORMAT = 7;

	// Common constants
	public const int EWRPT_FILTER_PANEL_OPTION = 2; // 1/2/3, 1 = always hide, 2 = always show, 3 = show when filtered		

	public const bool EWRPT_SHOW_CURRENT_FILTER = false; // Change to true to show current filter

	public const string EWRPT_RANDOM_KEY = "JPaFXBfa6f08sCt3"; // Random key for encryption

	public const string EWRPT_PROJECT_STYLESHEET_FILENAME = "aspxrptcss/project1.css"; // Project stylesheet file name

	public const int EWRPT_CHART_WIDTH = 550;

	public const int EWRPT_CHART_HEIGHT = 440;

	public const string EWRPT_CHART_ALIGN = "middle";

	public const bool EWRPT_CHART_SHOW_BLANK_SERIES = false; // Show blank series

	// Code Page
	public const int EWRPT_CODEPAGE = 65001; // Code page

	// Database
	public const string EWRPT_DBMSNAME = "Microsoft SQL Server";

	public const string EWRPT_DB_QUOTE_START = "[";

	public const string EWRPT_DB_QUOTE_END = "]";

	public static string EWRPT_DB_CONNECTION_STRING = "Persist Security Info=False;Data Source=192.168.100.226;Initial Catalog=Matricula;User Id=matricula;Password=dtb01s";		

	// Database type		
	public const bool EWRPT_IS_MSACCESS = false; // Access		

	public const bool EWRPT_IS_MSSQL = true; // MS SQL		

	public const bool EWRPT_IS_MYSQL = false; // MySQL

	public const bool EWRPT_IS_POSTGRESQL = false; // PostgreSQL		

	public const bool EWRPT_IS_ORACLE = false;	// Oracle

	// Remove XSS
	public const bool EWRPT_REMOVE_XSS = true;

	// Note: Remove accepted elements in the following array at your own risk. 
	public static string[] EWRPT_REMOVE_XSS_KEYWORDS = new string[]{"javascript", "vbscript", "expression", "<applet", "<meta", "<xml", "<blink", "<link", "<style", "<script", "<embed", "<object", "<iframe", "<frame", "<frameset", "<ilayer", "<layer", "<bgsound", "<title", "<base", "onabort", "onactivate", "onafterprint", "onafterupdate", "onbeforeactivate", "onbeforecopy", "onbeforecut", "onbeforedeactivate", "onbeforeeditfocus", "onbeforepaste", "onbeforeprint", "onbeforeunload", "onbeforeupdate", "onblur", "onbounce", "oncellchange", "onchange", "onclick", "oncontextmenu", "oncontrolselect", "oncopy", "oncut", "ondataavailable", "ondatasetchanged", "ondatasetcomplete", "ondblclick", "ondeactivate", "ondrag", "ondragend", "ondragenter", "ondragleave", "ondragover", "ondragstart", "ondrop", "onerror", "onerrorupdate", "onfilterchange", "onfinish", "onfocus", "onfocusin", "onfocusout", "onhelp", "onkeydown", "onkeypress", "onkeyup", "onlayoutcomplete", "onload", "onlosecapture", "onmousedown", "onmouseenter", "onmouseleave", "onmousemove", "onmouseout", "onmouseover", "onmouseup", "onmousewheel", "onmove", "onmoveend", "onmovestart", "onpaste", "onpropertychange", "onreadystatechange", "onreset", "onresize", "onresizeend", "onresizestart", "onrowenter", "onrowexit", "onrowsdelete", "onrowsinserted", "onscroll", "onselect", "onselectionchange", "onselectstart", "onstart", "onstop", "onsubmit", "onunload"};	

	// Data type (DO NOT CHANGE!)
	public const int EWRPT_DATATYPE_NONE = 0;

	public const int EWRPT_DATATYPE_NUMBER = 1;

	public const int EWRPT_DATATYPE_DATE = 2;

	public const int EWRPT_DATATYPE_STRING = 3;

	public const int EWRPT_DATATYPE_BOOLEAN = 4;

	public const int EWRPT_DATATYPE_GUID = 5;

	public const int EWRPT_DATATYPE_OTHER = 6;

	public const int EWRPT_DATATYPE_TIME = 7;

	public const int EWRPT_DATATYPE_BLOB = 8;

	public const int EWRPT_DATATYPE_MEMO = 9;

	// Empty/Null/Init/All values
	public const string EWRPT_EMPTY_VALUE = "##empty##";

	public const string EWRPT_NULL_VALUE = "##null##";

	public const string EWRPT_INIT_VALUE = "##init##";

	public const string EWRPT_ALL_VALUE = "##all##";

	public const string EWRPT_BOOLEAN_YES = "1";

	public const string EWRPT_BOOLEAN_NO = "0";

	// Export
	// public const bool EWRPT_EXPORT_ALL = false; // Export 1 page only		
	public const bool EWRPT_EXPORT_ALL = true; // Export all records

	// Session names
	public const string EWRPT_SESSION_STATUS = EWRPT_PROJECT_NAME + "_Status"; // Login status	

	public const string EWRPT_SESSION_USER_NAME = EWRPT_SESSION_STATUS + "_UserName";	// User name	

	public const string EWRPT_SESSION_USER_ID = EWRPT_SESSION_STATUS + "_UserID";	// User ID	

	public const string EWRPT_SESSION_USER_LEVEL_ID = EWRPT_SESSION_STATUS + "_UserLevel"; // User level ID		

	public const string EWRPT_SESSION_USER_LEVEL = EWRPT_SESSION_STATUS + "_UserLevelValue"; // User level		

	public const string EWRPT_SESSION_PARENT_USER_ID = EWRPT_SESSION_STATUS + "_ParentUserID"; // Parent user ID		

	public const string EWRPT_SESSION_SYSTEM_ADMIN = EWRPT_PROJECT_NAME + "_SysAdmin"; // System admin	

	public const string EWRPT_SESSION_AR_USER_LEVEL = EWRPT_PROJECT_NAME + "_arUserLevel"; // User level ArrayList	

	public const string EWRPT_SESSION_AR_USER_LEVEL_PRIV = EWRPT_PROJECT_NAME + "_arUserLevelPriv"; // User level privilege ArrayList		

	public const string EWRPT_SESSION_MESSAGE = EWRPT_PROJECT_NAME + "_Message"; // System message	

	// Security
	public const string EWRPT_ADMIN_USER_NAME = "";

	public const string EWRPT_ADMIN_PASSWORD = "";

	public const bool EWRPT_MD5_PASSWORD = false; // MD5 password

	public const bool EWRPT_CASE_SENSITIVE_PASSWORD = false; // Case-sensitive password

	// User admin
// User admin
	public const string EWRPT_LOGIN_SELECT_SQL = "";

// User table filters
	// User level permission
	public const short EWRPT_ALLOW_LIST = 8; // Report

	public const short EWRPT_ALLOW_REPORT = 8; // Summary/Crosstab Report

	public const short EWRPT_ALLOW_ADMIN = 16; // Admin	

	// Hierarchical User ID		
	public const bool EWRPT_USER_ID_IS_HIERARCHICAL = true; // Change to False to show one level

	// Table level constants
	public const string EWRPT_TABLE_PREFIX = "||ASPNETReportMaker||"; // ASPX

	public const string EWRPT_TABLE_GROUP_PER_PAGE = "grpperpage";

	public const string EWRPT_TABLE_START_GROUP = "start";

	public const string EWRPT_TABLE_ORDER_BY = "order";

	public const string EWRPT_TABLE_ORDER_BY_TYPE = "ordertype";

	public const string EWRPT_TABLE_SORT = "sort"; // Table sort

	// Row types
	public const int EWRPT_ROWTYPE_DETAIL = 1; // Row type detail

	public const int EWRPT_ROWTYPE_TOTAL = 2; // Row type group summary

	// Row total types
	public const int EWRPT_ROWTOTAL_GROUP = 1; // Page summary

	public const int EWRPT_ROWTOTAL_PAGE = 2; // Page summary

	public const int EWRPT_ROWTOTAL_GRAND = 3; // Grand summary

	// Row total sub types
	public const int EWRPT_ROWTOTAL_FOOTER = 1; // Footer

	public const int EWRPT_ROWTOTAL_SUM = 2; // SUM

	public const int EWRPT_ROWTOTAL_AVG = 3; // AVG

	public const int EWRPT_ROWTOTAL_MIN = 4; // MIN

	public const int EWRPT_ROWTOTAL_MAX = 5; // MAX

	// Boolean values for ENUM('Y'/'N') or ENUM(1/0)
	public const string EWRPT_TRUE_STRING = "'Y'";

	public const string EWRPT_FALSE_STRING = "'N'";

	// Use token in URL (reserved, not used, do NOT change!)
	public const bool EWRPT_USE_TOKEN_IN_URL = false;

	// Email
	public const string EWRPT_SMTP_SERVER = "localhost"; // SMTP server

	public const int EWRPT_SMTP_SERVER_PORT = 25; // SMTP server port

	public const string EWRPT_SMTP_SERVER_USERNAME = ""; // SMTP server user name

	public const string EWRPT_SMTP_SERVER_PASSWORD = ""; // SMTP server password

	public const int EWRPT_MAX_EMAIL_RECIPIENT = 3;

	public const int EWRPT_MAX_EMAIL_SENT_COUNT = 3;

	public const int EWRPT_MAX_EMAIL_SENT_PERIOD = 20;

	public const string EWRPT_EXPORT_EMAIL_COUNTER = EWRPT_SESSION_STATUS + "_EmailCounter";

	public const string EWRPT_EMAIL_CHARSET = "utf-8"; // Email charset

	public const bool EWRPT_EMAIL_WRITE_LOG = true; // Write to log file

	public const int EWRPT_EMAIL_LOG_SIZE_LIMIT = 20; // Email log field size limit

	public const bool EWRPT_EMAIL_WRITE_LOG_TO_DATABASE = false; // Write email log to database

	public const string EWRPT_EMAIL_LOG_TABLE_NAME = ""; // Email log table name

	public const string EWRPT_EMAIL_LOG_FIELD_NAME_DATETIME = ""; // Email log DateTime field name

	public const string EWRPT_EMAIL_LOG_FIELD_NAME_IP = ""; // Email log IP field name

	public const string EWRPT_EMAIL_LOG_FIELD_NAME_SENDER = ""; // Email log Sender field name

	public const string EWRPT_EMAIL_LOG_FIELD_NAME_RECIPIENT = ""; // Email log Recipient field name

	public const string EWRPT_EMAIL_LOG_FIELD_NAME_SUBJECT = ""; // Email log Subject field name

	public const string EWRPT_EMAIL_LOG_FIELD_NAME_MESSAGE = ""; // Email log Message field name

	// Image resize
	public const string EWRPT_UPLOAD_TMP_PATH = ""; // User upload temp path (relative to app root) e.g. "tmp/"

	public const string EWRPT_UPLOAD_DEST_PATH = ""; // Upload destination path (relative to app root)

	public const int EWRPT_THUMBNAIL_DEFAULT_WIDTH = 0; // Thumbnail default width

	public const int EWRPT_THUMBNAIL_DEFAULT_HEIGHT = 0; // Thumbnail default height

	public const int EWRPT_THUMBNAIL_DEFAULT_INTERPOLATION = 1; // Thumbnail default interpolation

	// Validate option
	public const bool EWRPT_CLIENT_VALIDATE = false;

	public const bool EWRPT_SERVER_VALIDATE = false;

	// Checkbox and radio button groups
	public const string EWRPT_ITEM_TEMPLATE_CLASSNAME = "ewTemplate";

	public const string EWRPT_ITEM_TABLE_CLASSNAME = "ewItemTable";

	public static DateTime EWRPT_COOKIE_EXPIRY_TIME = DateTime.Now.AddYears(1); // Change cookie expiry time here

	// Menu
	public const string EWRPT_MENUBAR_CLASSNAME = "ewMenuBarVertical";

	public const string EWRPT_MENUBAR_SUBMENU_CLASSNAME = "";

	public const string EWRPT_MENUBAR_RIGHTHOVER_IMAGE = "";
}
