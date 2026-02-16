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
' ASP.NET Report Maker 4 - Project Configuration
'
Public Partial Class AspNetReportMaker4_cargaCae2012
	Inherits System.Web.UI.Page

	' Debug
	Public Const EWRPT_DEBUG_ENABLED As Boolean = False ' Change to True to debug

	' Project
	Public Const EWRPT_PROJECT_NAME As String = "cargaCae2012" ' Project variable

	Public Const EWRPT_LANGUAGE_FOLDER As String = "aspxrptlang/"

	Public Shared EWRPT_LANGUAGE_FILE()() As String = New String()() { _
			New String() {"en", "", "english.xml"} _
	}

	Public Const EWRPT_LANGUAGE_DEFAULT_ID As String = "en"

	Public Const EWRPT_SESSION_LANGUAGE_ID As String = EWRPT_PROJECT_NAME & "_LanguageId" ' Language ID

	Public Const EWRPT_USE_DOM_XML As Boolean = False

	' Response.Buffer
	Public Const EWRPT_RESPONSE_BUFFER As Boolean = True

	' Date format
	Public Const EWRPT_DATE_SEPARATOR As String = "/"	

	Public Const EWRPT_DEFAULT_DATE_FORMAT As Short = 7

	' Common constants
	Public Const EWRPT_FILTER_PANEL_OPTION As Integer = 2 ' 1/2/3, 1 = always hide, 2 = always show, 3 = show when filtered		

	Public Const EWRPT_SHOW_CURRENT_FILTER As Boolean = False ' Change to true to show current filter

	Public Const EWRPT_RANDOM_KEY As String = "B04GbssY%7tY_25&" ' Random key for encryption

	Public Const EWRPT_PROJECT_STYLESHEET_FILENAME As String = "aspxrptcss/cargaCae2012.css" ' Project stylesheet file name

	Public Const EWRPT_CHART_WIDTH As Integer = 550

	Public Const EWRPT_CHART_HEIGHT As Integer = 440

	Public Const EWRPT_CHART_ALIGN As String = "middle"

	Public Const EWRPT_CHART_SHOW_BLANK_SERIES As Boolean = False ' Show blank series

	' Code Page
	Public Const EWRPT_CODEPAGE As Integer = 65001 ' Code page

	' Database
	Public Const EWRPT_DBMSNAME As String = "Microsoft SQL Server"

	Public Const EWRPT_DB_QUOTE_START As String = "["

	Public Const EWRPT_DB_QUOTE_END As String = "]"

	Public Shared EWRPT_DB_CONNECTION_STRING As String = "Persist Security Info=False;Data Source=192.168.100.226;Initial Catalog=Matricula;User Id=sa;Password=Sa070507"		

	' Database type		
	Public Const EWRPT_IS_MSACCESS As Boolean = False ' Access		

	Public Const EWRPT_IS_MSSQL As Boolean = True ' MS SQL		

	Public Const EWRPT_IS_MYSQL As Boolean = False ' MySQL

	Public Const EWRPT_IS_POSTGRESQL As Boolean = False ' PostgreSQL		

	Public Const EWRPT_IS_ORACLE As Boolean = False	' Oracle

	' Remove XSS
	Public Const EWRPT_REMOVE_XSS As Boolean = True

	' Note: Remove accepted elements in the following array at your own risk. 
	Public Shared EWRPT_REMOVE_XSS_KEYWORDS() As String = New string(){"javascript", "vbscript", "expression", "<applet", "<meta", "<xml", "<blink", "<link", "<style", "<script", "<embed", "<object", "<iframe", "<frame", "<frameset", "<ilayer", "<layer", "<bgsound", "<title", "<base", "onabort", "onactivate", "onafterprint", "onafterupdate", "onbeforeactivate", "onbeforecopy", "onbeforecut", "onbeforedeactivate", "onbeforeeditfocus", "onbeforepaste", "onbeforeprint", "onbeforeunload", "onbeforeupdate", "onblur", "onbounce", "oncellchange", "onchange", "onclick", "oncontextmenu", "oncontrolselect", "oncopy", "oncut", "ondataavailable", "ondatasetchanged", "ondatasetcomplete", "ondblclick", "ondeactivate", "ondrag", "ondragend", "ondragenter", "ondragleave", "ondragover", "ondragstart", "ondrop", "onerror", "onerrorupdate", "onfilterchange", "onfinish", "onfocus", "onfocusin", "onfocusout", "onhelp", "onkeydown", "onkeypress", "onkeyup", "onlayoutcomplete", "onload", "onlosecapture", "onmousedown", "onmouseenter", "onmouseleave", "onmousemove", "onmouseout", "onmouseover", "onmouseup", "onmousewheel", "onmove", "onmoveend", "onmovestart", "onpaste", "onpropertychange", "onreadystatechange", "onreset", "onresize", "onresizeend", "onresizestart", "onrowenter", "onrowexit", "onrowsdelete", "onrowsinserted", "onscroll", "onselect", "onselectionchange", "onselectstart", "onstart", "onstop", "onsubmit", "onunload"}

	' Data type (DO NOT CHANGE!)
	Public Const EWRPT_DATATYPE_NONE As Integer = 0

	Public Const EWRPT_DATATYPE_NUMBER As Integer = 1

	Public Const EWRPT_DATATYPE_DATE As Integer = 2

	Public Const EWRPT_DATATYPE_STRING As Integer = 3

	Public Const EWRPT_DATATYPE_BOOLEAN As Integer = 4

	Public Const EWRPT_DATATYPE_GUID As Integer = 5

	Public Const EWRPT_DATATYPE_OTHER As Integer = 6

	Public Const EWRPT_DATATYPE_TIME As Integer = 7

	Public Const EWRPT_DATATYPE_BLOB As Integer = 8

	Public Const EWRPT_DATATYPE_MEMO As Integer = 9

	' Empty/Null/Init/All values
	Public Const EWRPT_EMPTY_VALUE As String = "##empty##"

	Public Const EWRPT_NULL_VALUE As String = "##null##"

	Public Const EWRPT_INIT_VALUE As String = "##init##"

	Public Const EWRPT_ALL_VALUE As String = "##all##"

	Public Const EWRPT_BOOLEAN_YES As String = "1"

	Public Const EWRPT_BOOLEAN_NO As String = "0"

	' Export
	' Public Const EWRPT_EXPORT_ALL As Boolean = False ' Export 1 page only		
	Public Const EWRPT_EXPORT_ALL As Boolean = True	' Export all records

	' Session names
	Public Const EWRPT_SESSION_STATUS As String = EWRPT_PROJECT_NAME & "_Status" ' Login status	

	Public Const EWRPT_SESSION_USER_NAME As String = EWRPT_SESSION_STATUS & "_UserName"	' User name	

	Public Const EWRPT_SESSION_USER_ID As String = EWRPT_SESSION_STATUS & "_UserID"	' User ID	

	Public Const EWRPT_SESSION_USER_LEVEL_ID As String = EWRPT_SESSION_STATUS & "_UserLevel"	' User level ID		

	Public Const EWRPT_SESSION_USER_LEVEL As String = EWRPT_SESSION_STATUS & "_UserLevelValue" ' User level		

	Public Const EWRPT_SESSION_PARENT_USER_ID As String = EWRPT_SESSION_STATUS & "_ParentUserID"	' Parent user ID		

	Public Const EWRPT_SESSION_SYSTEM_ADMIN As String = EWRPT_PROJECT_NAME & "_SysAdmin"	' System admin	

	Public Const EWRPT_SESSION_AR_USER_LEVEL As String = EWRPT_PROJECT_NAME & "_arUserLevel"	' User level ArrayList	

	Public Const EWRPT_SESSION_AR_USER_LEVEL_PRIV As String = EWRPT_PROJECT_NAME & "_arUserLevelPriv"	' User level privilege ArrayList		

	Public Const EWRPT_SESSION_MESSAGE As String = EWRPT_PROJECT_NAME & "_Message"	' System message	

	' Security
	Public Const EWRPT_ADMIN_USER_NAME As String = ""

	Public Const EWRPT_ADMIN_PASSWORD As String = ""

	Public Const EWRPT_MD5_PASSWORD As Boolean = False ' MD5 password

	Public Const EWRPT_CASE_SENSITIVE_PASSWORD As Boolean = False ' Case-sensitive password

	' User admin
	Public Const EWRPT_LOGIN_SELECT_SQL As String = ""

' User table filters
	' User level permission
	Public Const EWRPT_ALLOW_LIST As Integer = 8 ' Report

	Public Const EWRPT_ALLOW_REPORT As Integer = 8 ' Summary/Crosstab Report

	Public Const EWRPT_ALLOW_ADMIN As Integer = 16 ' Admin	

	' Hierarchical User ID		
	Public Const EWRPT_USER_ID_IS_HIERARCHICAL As Boolean = True ' Change to False to show one level

	' Table level constants
	Public Const EWRPT_TABLE_PREFIX = "||ASPNETReportMaker||" ' ASPX

	Public Const EWRPT_TABLE_GROUP_PER_PAGE As String = "grpperpage"

	Public Const EWRPT_TABLE_START_GROUP As String = "start"

	Public Const EWRPT_TABLE_ORDER_BY As String = "order"

	Public Const EWRPT_TABLE_ORDER_BY_TYPE As String = "ordertype"

	Public Const EWRPT_TABLE_SORT As String = "sort" ' Table sort

	' Row types
	Public Const EWRPT_ROWTYPE_DETAIL As Integer = 1 ' Row type detail

	Public Const EWRPT_ROWTYPE_TOTAL As Integer = 2 ' Row type group summary

	' Row total types
	Public Const EWRPT_ROWTOTAL_GROUP As Integer = 1 ' Page summary

	Public Const EWRPT_ROWTOTAL_PAGE As Integer = 2 ' Page summary

	Public Const EWRPT_ROWTOTAL_GRAND As Integer = 3 ' Grand summary

	' Row total sub types
	Public Const EWRPT_ROWTOTAL_FOOTER As Integer = 1 ' Footer

	Public Const EWRPT_ROWTOTAL_SUM As Integer = 2 ' SUM

	Public Const EWRPT_ROWTOTAL_AVG As Integer = 3 ' AVG

	Public Const EWRPT_ROWTOTAL_MIN As Integer = 4 ' MIN

	Public Const EWRPT_ROWTOTAL_MAX As Integer = 5 ' MAX

	' Boolean values for ENUM('Y'/'N') or ENUM(1/0)
	Public Const EWRPT_TRUE_STRING As String = "'Y'"

	Public Const EWRPT_FALSE_STRING As String = "'N'"

	' Use token in URL (reserved, not used, do NOT change!)
	Public Const EWRPT_USE_TOKEN_IN_URL As Boolean = false

	' Email
	Public Const EWRPT_SMTP_SERVER As String = "localhost" ' SMTP server

	Public Const EWRPT_SMTP_SERVER_PORT As Integer = 25 ' SMTP server port

	Public Const EWRPT_SMTP_SERVER_USERNAME As String = "" ' SMTP server user name

	Public Const EWRPT_SMTP_SERVER_PASSWORD As String = "" ' SMTP server password

	Public Const EWRPT_MAX_EMAIL_RECIPIENT As Integer = 3

	Public Const EWRPT_MAX_EMAIL_SENT_COUNT As Integer = 3

	Public Const EWRPT_MAX_EMAIL_SENT_PERIOD As Integer = 20

	Public Const EWRPT_EXPORT_EMAIL_COUNTER As String = EWRPT_SESSION_STATUS + "_EmailCounter"

	Public Const EWRPT_EMAIL_CHARSET As String = "utf-8" ' Email charset

	Public Const EWRPT_EMAIL_WRITE_LOG As Boolean = True ' Write to log file

	Public Const EWRPT_EMAIL_LOG_SIZE_LIMIT As Integer = 20 ' Email log field size limit

	Public Const EWRPT_EMAIL_WRITE_LOG_TO_DATABASE As Boolean = False ' Write email log to database

	Public Const EWRPT_EMAIL_LOG_TABLE_NAME As String = "" ' Email log table name

	Public Const EWRPT_EMAIL_LOG_FIELD_NAME_DATETIME As String = "" ' Email log DateTime field name

	Public Const EWRPT_EMAIL_LOG_FIELD_NAME_IP As String = "" ' Email log IP field name

	Public Const EWRPT_EMAIL_LOG_FIELD_NAME_SENDER As String = "" ' Email log Sender field name

	Public Const EWRPT_EMAIL_LOG_FIELD_NAME_RECIPIENT As String = "" ' Email log Recipient field name

	Public Const EWRPT_EMAIL_LOG_FIELD_NAME_SUBJECT As String = "" ' Email log Subject field name

	Public Const EWRPT_EMAIL_LOG_FIELD_NAME_MESSAGE As String = "" ' Email log Message field name

	' Image resize
	Public Const EWRPT_UPLOAD_TMP_PATH As String = "" ' User upload temp path (relative to app root) e.g. "tmp/"

	Public Const EWRPT_UPLOAD_DEST_PATH As String = "" ' Upload destination path (relative to app root)

	Public Const EWRPT_THUMBNAIL_DEFAULT_WIDTH As Integer = 0 ' Thumbnail default width

	Public Const EWRPT_THUMBNAIL_DEFAULT_HEIGHT As Integer = 0 ' Thumbnail default height

	Public Const EWRPT_THUMBNAIL_DEFAULT_INTERPOLATION As Integer = 1 ' Thumbnail default interpolation

	' Validate option
	Public Const EWRPT_CLIENT_VALIDATE As Boolean = False

	Public Const EWRPT_SERVER_VALIDATE As Boolean = False

	' Checkbox and radio button groups
	Public Const EWRPT_ITEM_TEMPLATE_CLASSNAME As String = "ewTemplate"

	Public Const EWRPT_ITEM_TABLE_CLASSNAME As String = "ewItemTable"

	Public Shared EWRPT_COOKIE_EXPIRY_TIME As DateTime = DateTime.Now.AddYears(1) ' Change cookie expiry time here

	' Menu
	Public Const EWRPT_MENUBAR_CLASSNAME As String = "ewMenuBarVertical"

	Public Const EWRPT_MENUBAR_SUBMENU_CLASSNAME As String = ""

	Public Const EWRPT_MENUBAR_RIGHTHOVER_IMAGE As String = ""
End Class
