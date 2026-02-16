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
' ASP.NET Report Maker 4 - Functions
' (C) 2010 e.World Technology Ltd.
'
Public Partial Class AspNetReportMaker4_postergados
	Inherits System.Web.UI.Page

	'
	' Common base class
	'
	Public Class AspNetReportMakerBase
		Inherits AspNetMakerBase

		' Parent page (The ASP.NET page inherited from System.Web.UI.Page)		
'		Protected m_ParentPage As AspNetReportMaker4_postergados
		' Page (ASP.NET Report Maker page)

		Protected m_Page As AspNetReportMakerPage

		' Parent page
'		Public Property ParentPage() As AspNetReportMaker4_postergados
'			Get
'				Return m_ParentPage
'			End Get
'			Set
'				m_ParentPage = value
'			End Set
'		End Property
		' Page
		Public Property Page() As AspNetReportMakerPage
			Get
				Return m_Page
			End Get
			Set
				m_Page = value
			End Set
		End Property

		' Connection
'		Public Property Conn() As cConnection
'			Get
'				Return ParentPage.Conn
'			End Get
'			Set
'				ParentPage.Conn = value
'			End Set
'		End Property
		' Security
'		Public Property Security() As cAdvancedSecurity
'			Get
'				Return ParentPage.Security
'			End Get
'			Set
'				ParentPage.Security = value
'			End Set
'		End Property
		' Language
		Public Property ReportLanguage() As crLanguage
			Get
				Return ParentPage.ReportLanguage
			End Get
			Set
				ParentPage.ReportLanguage = value
			End Set
		End Property
	End Class

	'
	' Common page class
	'
	Public Class AspNetReportMakerPage
		Inherits AspNetReportMakerBase

		' Page ID
		Protected m_PageID As String = ""

		Public ReadOnly Property PageID() As String
			Get
				Return m_PageID
			End Get
		End Property

		' Table name
		Protected m_TableName As String = ""

		Public ReadOnly Property TableName() As String
			Get
				Return m_TableName
			End Get
		End Property

		' Page object name
		Protected m_PageObjName As String = ""

		Public ReadOnly Property PageObjName() As String
			Get
				Return m_PageObjName
			End Get
		End Property

		' Page object type name
		Protected m_PageObjTypeName As String = ""

		Public ReadOnly Property PageObjTypeName() As String
			Get
				Return m_PageObjTypeName
			End Get
		End Property

		' Page Name
		Public ReadOnly Property PageName() As String
			Get
				Return ew_CurrentPage()
			End Get
		End Property
	End Class

	'
	'  Language class (Report Maker)
	'
	Public Class crLanguage
		Inherits AspNetReportMakerBase
		Implements IDisposable

		Private LanguageId As String

		Private objDOM As XmlDocument

		Private Col As StringDictionary

		' Constructor
		Public Sub New(ByVal APage As AspNetReportMakerPage)
			m_Page = APage
			m_ParentPage = APage.ParentPage

			' Set up file list
			LoadFileList()

			' Set up language id
			If ew_Get("language") <> "" Then
				LanguageId = ew_Get("language")
				ew_Session(EWRPT_SESSION_LANGUAGE_ID) = LanguageId
			ElseIf ew_NotEmpty(ew_Session(EWRPT_SESSION_LANGUAGE_ID)) Then
				LanguageId = Convert.ToString(ew_Session(EWRPT_SESSION_LANGUAGE_ID))
			Else
				LanguageId = EWRPT_LANGUAGE_DEFAULT_ID
			End If
			gsLanguage = LanguageId
			Load(LanguageId)
		End Sub

		' Terminate
		Public Sub Dispose() Implements IDisposable.Dispose
			objDOM = Nothing
		End Sub

		' Load language file list
		Private Sub LoadFileList()
			If ewrpt_IsArray(EWRPT_LANGUAGE_FILE) Then
				For i As Integer = 0 To EWRPT_LANGUAGE_FILE.GetLength(0) - 1
					EWRPT_LANGUAGE_FILE(i)(1) = LoadFileDesc(HttpContext.Current.Server.MapPath(EWRPT_LANGUAGE_FOLDER + EWRPT_LANGUAGE_FILE(i)(2)))
				Next
			End If
		End Sub

		' Load language file description
		Private Function LoadFileDesc(ByVal File As String) As String
			Dim xmlr As New XmlTextReader(File)
			xmlr.WhitespaceHandling = WhitespaceHandling.None
			Try
				While Not xmlr.EOF
					xmlr.Read()
					If xmlr.IsStartElement() AndAlso xmlr.Name = "ew-language" Then
						Return xmlr.GetAttribute("desc")
					End If
				End While
			Finally
				xmlr.Close()
			End Try
			Return ""
		End Function

		' Load language file
		Private Sub Load(ByVal id As String)
			Dim sFileName As String = GetFileName(id)
			If sFileName = "" Then
				sFileName = GetFileName(EWRPT_LANGUAGE_DEFAULT_ID)
			End If
			If sFileName = "" Then
				Return
			End If
			If EWRPT_USE_DOM_XML Then
				objDOM = New XmlDocument()
				objDOM.Load(sFileName)
			Else
				If ew_Session(EWRPT_PROJECT_NAME + "_" + sFileName) IsNot Nothing Then
					Col = DirectCast(ew_Session(EWRPT_PROJECT_NAME + "_" + sFileName), StringDictionary)
				Else
					Col = New StringDictionary()
					XmlToCollection(sFileName)
					ew_Session(EWRPT_PROJECT_NAME + "_" + sFileName) = Col
				End If
			End If
		End Sub

		' Convert XML to Collection
		Private Sub XmlToCollection(ByVal File As String)
			Dim Key As String = "/"
			Dim Id As String
			Dim Name As String
			Dim Index As Integer
			Dim xmlr As New XmlTextReader(File)
			xmlr.WhitespaceHandling = WhitespaceHandling.None
			Try
				While Not xmlr.EOF
					xmlr.Read()
					Name = xmlr.Name
					Id = xmlr.GetAttribute("id")
					If Name = "ew-language" Then
						Continue While
					End If
					Select Case xmlr.NodeType
						Case XmlNodeType.Element
							If xmlr.IsStartElement() AndAlso Not xmlr.IsEmptyElement Then
								Key += Name + "/"
								If Id IsNot Nothing Then
									Key += Id + "/"
								End If
							End If
							If Id IsNot Nothing AndAlso xmlr.IsEmptyElement Then

								' phrase
								Id = Name + "/" + Id
								If xmlr.GetAttribute("client") = "1" Then
									Id += "/1"
								End If
								If Id IsNot Nothing Then
									Col(Key + Id) = xmlr.GetAttribute("value")
								End If
							End If
							Exit Select
						Case XmlNodeType.EndElement
							Index = Key.LastIndexOf("/" + Name + "/")
							If Index > -1 Then
								Key = Key.Substring(0, Index + 1)
							End If
							Exit Select
					End Select
				End While
			Finally
				xmlr.Close()
			End Try
		End Sub

		' Get language file name
		Private Function GetFileName(ByVal Id As String) As String
			If ewrpt_IsArray(EWRPT_LANGUAGE_FILE) Then
				For i As Integer = 0 To EWRPT_LANGUAGE_FILE.GetLength(0) - 1
					If EWRPT_LANGUAGE_FILE(i)(0) = Id Then
						Return HttpContext.Current.Server.MapPath(EWRPT_LANGUAGE_FOLDER + EWRPT_LANGUAGE_FILE(i)(2))
					End If
				Next
			End If
			Return ""
		End Function

		' Get node attribute
		Private Function GetNodeAtt(ByVal Node As XmlNode, ByVal Att As String) As String
			If Node IsNot Nothing Then
				Return DirectCast(Node, XmlElement).GetAttribute(Att)
			Else
				Return ""
			End If
		End Function

		' Get phrase
		Public Function Phrase(ByVal Id As String) As String
			If EWRPT_USE_DOM_XML Then
				Return GetNodeAtt(objDOM.SelectSingleNode("//global/phrase[@id='" + Id.ToLower() + "']"), "value")
			Else
				If Col.ContainsKey("/global/phrase/" + Id.ToLower()) Then
					Return Col("/global/phrase/" + Id.ToLower())
				ElseIf Col.ContainsKey("/global/phrase/" + Id.ToLower() + "/1") Then
					Return Col("/global/phrase/" + Id.ToLower() + "/1")
				Else
					Return ""
				End If
			End If
		End Function

		' Set phrase
		Public Sub SetPhrase(ByVal Id As String, ByVal Value As String)
			If Not EWRPT_USE_DOM_XML Then
				If Col.ContainsKey("/global/phrase/" + Id.ToLower()) Then
					Col("/global/phrase/" + Id.ToLower()) = Value
				ElseIf Col.ContainsKey("/global/phrase/" + Id.ToLower() + "/1") Then
					Col("/global/phrase/" + Id.ToLower() + "/1") = Value
				End If
			End If
		End Sub

		' Get project phrase
		Public Function ProjectPhrase(ByVal Id As String) As String
			If EWRPT_USE_DOM_XML Then
				Return GetNodeAtt(objDOM.SelectSingleNode("//project/phrase[@id='" + Id.ToLower() + "']"), "value")
			Else
				Return Col("/project/phrase/" + Id.ToLower())
			End If
		End Function

		' Set project phrase
		Public Sub SetProjectPhrase(ByVal Id As String, ByVal Value As String)
			If Not EWRPT_USE_DOM_XML Then
				Col("/project/phrase/" + Id.ToLower()) = Value
			End If
		End Sub

		' Get menu phrase
		Public Function MenuPhrase(ByVal MenuId As String, ByVal Id As String) As String
			If EWRPT_USE_DOM_XML Then
				Return GetNodeAtt(objDOM.SelectSingleNode("//project/menu[@id='" + MenuId + "']/phrase[@id='" + Id.ToLower() + "']"), "value")
			Else
				Return Col("/project/menu/" + MenuId + "/phrase/" + Id.ToLower())
			End If
		End Function

		' Set menu phrase
		Public Sub SetMenuPhrase(ByVal MenuId As String, ByVal Id As String, ByVal Value As String)
			If Not EWRPT_USE_DOM_XML Then
				Col("/project/menu/" + MenuId + "/phrase/" + Id.ToLower()) = Value
			End If
		End Sub

		' Get table phrase
		Public Function TablePhrase(ByVal TblVar As String, ByVal Id As String) As String
			If EWRPT_USE_DOM_XML Then
				Return GetNodeAtt(objDOM.SelectSingleNode("//project/table[@id='" + TblVar.ToLower() + "']/phrase[@id='" + Id.ToLower() + "']"), "value")
			Else
				Return Col("/project/table/" + TblVar.ToLower() + "/phrase/" + Id.ToLower())
			End If
		End Function

		' Set table phrase
		Public Sub SetTablePhrase(ByVal TblVar As String, ByVal Id As String, ByVal Value As String)
			If Not EWRPT_USE_DOM_XML Then
				Col("/project/table/" + TblVar.ToLower() + "/phrase/" + Id.ToLower()) = Value
			End If
		End Sub

		' Get chart phrase
		Public Function ChartPhrase(ByVal TblVar As String, ByVal ChtVar As String, ByVal Id As String) As String
			If EWRPT_USE_DOM_XML Then
				Return GetNodeAtt(objDOM.SelectSingleNode("//project/table[@id='" + TblVar.ToLower() + "']/chart[@id='" + ChtVar.ToLower() + "']/phrase[@id='" + Id.ToLower() + "']"), "value")
			Else
				Return Col("/project/table/" + TblVar.ToLower() + "/chart/" + ChtVar.ToLower() + "/phrase/" + Id.ToLower())
			End If
		End Function

		' Set chart phrase
		Public Sub SetChartPhrase(ByVal TblVar As String, ByVal ChtVar As String, ByVal Id As String, ByVal Value As String)
			If Not EWRPT_USE_DOM_XML Then
				Col("/project/table/" + TblVar.ToLower() + "/chart/" + ChtVar.ToLower() + "/phrase/" + Id.ToLower()) = Value
			End If
		End Sub

		' Get field phrase
		Public Function FieldPhrase(ByVal TblVar As String, ByVal FldVar As String, ByVal Id As String) As String
			If EWRPT_USE_DOM_XML Then
				Return GetNodeAtt(objDOM.SelectSingleNode("//project/table[@id='" + TblVar.ToLower() + "']/field[@id='" + FldVar.ToLower() + "']/phrase[@id='" + Id.ToLower() + "']"), "value")
			Else
				Return Col("/project/table/" + TblVar.ToLower() + "/field/" + FldVar.ToLower() + "/phrase/" + Id.ToLower())
			End If
		End Function

		' Set field phrase
		Public Sub SetFieldPhrase(ByVal TblVar As String, ByVal FldVar As String, ByVal Id As String, ByVal Value As String)
			If Not EWRPT_USE_DOM_XML Then
				Col("/project/table/" + TblVar.ToLower() + "/field/" + FldVar.ToLower() + "/phrase/" + Id.ToLower()) = Value
			End If
		End Sub

		' Output XML as JSON
		Public Function XmlToJSON(ByVal XPath As String) As String
			Dim Id As String
			Dim Value As String
			Dim NodeList As XmlNodeList = objDOM.SelectNodes(XPath)
			Dim Str As String = "{"
			For Each Node As XmlNode In NodeList
				Id = GetNodeAtt(Node, "id")
				Value = GetNodeAtt(Node, "value")
				Str += """" + ew_JsEncode2(Id) + """:""" + ew_JsEncode2(Value) + ""","
			Next
			If Str.EndsWith(",") Then
				Str = Str.Substring(0, Str.Length - 1)
			End If
			Str += "}" & Chr(13) & "" & Chr(10) & ""
			Return Str
		End Function

		' Output collection as JSON
		Public Function CollectionToJSON(ByVal Prefix As String, ByVal Suffix As String) As String
			Dim Id As String
			Dim Pos As Integer
			Dim Str As String = "{"
			For Each Name As String In Col.Keys
				If Name.StartsWith(Prefix) Then
					If Suffix <> "" AndAlso Name.EndsWith(Suffix) Then
						Pos = Name.LastIndexOf(Suffix)
						Id = Name.Substring(Prefix.Length, Pos - Prefix.Length)
					Else
						Id = Name.Substring(Prefix.Length)
					End If
					Str += """" + ew_JsEncode2(Id) + """:""" + ew_JsEncode2(Col(Name)) + ""","
				End If
			Next
			If Str.EndsWith(",") Then
				Str = Str.Substring(0, Str.Length - 1)
			End If
			Str += "}" & Chr(13) & "" & Chr(10) & ""
			Return Str
		End Function

		' Output all phrases as JSON
		Public Function AllToJSON() As String
			If EWRPT_USE_DOM_XML Then
				Return "var ewLanguage = new ew_Language(" + XmlToJSON("//global/phrase") + ");"
			Else
				Return "var ewLanguage = new ew_Language(" + CollectionToJSON("/global/phrase/", "") + ");"
			End If
		End Function

		' Output client phrases as JSON
		Public Function ToJSON() As String
			If EWRPT_USE_DOM_XML Then
				Return "var ewLanguage = new ew_Language(" + XmlToJSON("//global/phrase[@client='1']") + ");"
			Else
				Return "var ewLanguage = new ew_Language(" + CollectionToJSON("/global/phrase/", "/1") + ");"
			End If
		End Function
	End Class

	' ViewValue (returns "&nbsp;" if empty)
	Public Shared Function ewrpt_ViewValue(ByVal value As Object) As String
		If ew_NotEmpty(value) Then
			Return Convert.ToString(value)
		Else
			Return "&nbsp;"
		End If
	End Function

	Class AspNetMakerBase

		' Parent page (The ASP.NET page inherited from System.Web.UI.Page)
		Protected m_ParentPage As AspNetReportMaker4_postergados		

		' Parent page
		Public Property ParentPage() As AspNetReportMaker4_postergados
			Get				
				Return m_ParentPage
			End Get
			Set(ByVal v As AspNetReportMaker4_postergados)
				m_ParentPage = v	
			End Set					
		End Property

		' Connection
		Public Property Conn() As cConnection
			Get				
				Return ParentPage.Conn
			End Get
			Set(ByVal v As cConnection)
				ParentPage.Conn = v	
			End Set			
		End Property

		' Security
		Public Property Security() As cAdvancedSecurity
			Get				
				Return ParentPage.Security
			End Get
			Set(ByVal v As cAdvancedSecurity)
				ParentPage.Security = v	
			End Set	
		End Property
	End Class

	'
	' Advanced Security class (Report Maker)
	'
	Public Class cAdvancedSecurity
		Inherits AspNetReportMakerBase

		Private m_ArUserLevel As ArrayList

		Private m_ArUserLevelPriv As ArrayList

		Private m_ArUserLevelID As Integer()

		' Current User Level ID / User Level
		Public CurrentUserLevelID As Integer

		Public CurrentUserLevel As Integer

		' Current User ID / Parent User ID / User ID array
		Public CurrentUserID As Object

		Public CurrentParentUserID As Object

		Private m_ArUserID() As Object

		' Init
		Public Sub New(ByVal APage As AspNetMakerBase)
			m_Page = APage
			m_ParentPage = APage.ParentPage
			m_ArUserLevel = New ArrayList()
			m_ArUserLevelPriv = New ArrayList()

			' Init User Level
			CurrentUserLevelID = SessionUserLevelID
			If Information.IsNumeric(CurrentUserLevelID) Then
				If CurrentUserLevelID >= -1 Then
					Array.Resize(m_ArUserLevelID, 1)
					m_ArUserLevelID(0) = CurrentUserLevelID
				End If
			End If

			' Init User ID
			CurrentUserID = SessionUserID
			CurrentParentUserID = SessionParentUserID

			' Load user level (for TablePermission_Loading event)
			LoadUserLevel()
		End Sub

		' Session User ID
		Public Property SessionUserID() As Object
			Get
				Return Convert.ToString(ew_Session(EWRPT_SESSION_USER_ID))
			End Get
			Set
				ew_Session(EWRPT_SESSION_USER_ID) = value
				CurrentUserID = value
			End Set
		End Property

		' Session parent User ID
		Public Property SessionParentUserID() As Object
			Get
				Return Convert.ToString(ew_Session(EWRPT_SESSION_PARENT_USER_ID))
			End Get
			Set
				ew_Session(EWRPT_SESSION_PARENT_USER_ID) = value
				CurrentParentUserID = value
			End Set
		End Property

		' Current user name
		Public Property CurrentUserName() As String
			Get
				Return Convert.ToString(ew_Session(EWRPT_SESSION_USER_NAME))
			End Get
			Set
				ew_Session(EWRPT_SESSION_USER_NAME) = value
			End Set
		End Property

		' Session User Level ID		
		Public Property SessionUserLevelID() As Integer
			Get
				Return Convert.ToInt32(ew_Session(EWRPT_SESSION_USER_LEVEL_ID))
			End Get
			Set
				ew_Session(EWRPT_SESSION_USER_LEVEL_ID) = value
				CurrentUserLevelID = value
			End Set
		End Property

		' Session User Level value	
		Public Property SessionUserLevel() As Integer
			Get
				Return Convert.ToInt32(ew_Session(EWRPT_SESSION_USER_LEVEL))
			End Get
			Set
				ew_Session(EWRPT_SESSION_USER_LEVEL) = value
				CurrentUserLevel = value
			End Set
		End Property

		' Can list
		Public Property CanList() As Boolean
			Get
				Return ((CurrentUserLevel And EWRPT_ALLOW_LIST) = EWRPT_ALLOW_LIST)
			End Get
			Set
				If value Then
					CurrentUserLevel = (CurrentUserLevel Or EWRPT_ALLOW_LIST)
				Else
					CurrentUserLevel = (CurrentUserLevel And (Not EWRPT_ALLOW_LIST))
				End If
			End Set
		End Property

		' Can report
		Public Property CanReport() As Boolean
			Get
				Return ((CurrentUserLevel And EWRPT_ALLOW_REPORT) = EWRPT_ALLOW_REPORT)
			End Get
			Set
				If value Then
					CurrentUserLevel = (CurrentUserLevel Or EWRPT_ALLOW_REPORT)
				Else
					CurrentUserLevel = (CurrentUserLevel And (Not EWRPT_ALLOW_REPORT))
				End If
			End Set
		End Property

		' Last URL
		Public ReadOnly Property LastUrl() As String
			Get
				Return ew_Cookie("lasturl")
			End Get
		End Property

		' Save last URL
		Public Sub SaveLastUrl()
			Dim s As String = HttpContext.Current.Request.ServerVariables("SCRIPT_NAME")
			Dim q As String = HttpContext.Current.Request.ServerVariables("QUERY_STRING")
			If q <> "" Then
				s = s & "?" & q
			End If
			If LastUrl = s Then
				s = ""
			End If
			ew_Cookie("lasturl") = s
		End Sub

		' Auto login
		Public Function AutoLogin() As Boolean
			If ew_SameStr(ew_Cookie("autologin"), "autologin") Then
				Dim sUsr As String = ew_Cookie("username")
				Dim sPwd As String = ew_Cookie("password")
				sUsr = cTEA.Decrypt(sUsr, EWRPT_RANDOM_KEY)
				sPwd = cTEA.Decrypt(sPwd, EWRPT_RANDOM_KEY)
				Dim bValid As Boolean = ValidateUser(sUsr, sPwd, True)
				Return bValid
			Else
				Return False
			End If
		End Function

		' Validate user (Report Maker)
		Public Function ValidateUser(ByVal usr As String, ByVal pwd As String, ByVal autologin As Boolean) As Boolean
			Dim result As Boolean = False
			Return result
		End Function		

		' No user level security			
		Public Sub SetUpUserLevel()
		End Sub

		' Load current user level
		Public Sub LoadCurrentUserLevel(ByVal Table As String)
			LoadUserLevel()
			SessionUserLevel = CurrentUserLevelPriv(Table)
		End Sub

		' Get current user privilege
		Private Function CurrentUserLevelPriv(ByVal TableName As String) As Integer
			Dim result As Integer = 0
			If IsLoggedIn() Then
				result = 0
				For i As Integer = 0 To m_ArUserLevelID.GetUpperBound(0)
					result = result Or GetUserLevelPrivEx(TableName, m_ArUserLevelID(i))
				Next
			Else
				Return 0
			End If
			Return result
		End Function

		' Get user level ID by user level name
		Public Function GetUserLevelID(ByVal UserLevelName As String) As Integer
			If ew_SameStr(UserLevelName, "Administrator") Then
				Return -1
			ElseIf UserLevelName <> "" Then
				If ew_IsArrayList(m_ArUserLevel) Then
					For Each Row As OrderedDictionary In m_ArUserLevel
						If ew_SameStr(Row(1), UserLevelName) Then
							Return ew_ConvertToInt(Row(0))
						End If
					Next
				End If
			End If
			Return -2

			' Unknown
		End Function

		' Get user privilege based on table name and user level
		Public Function GetUserLevelPrivEx(ByVal TableName As String, ByVal UserLevelID As Integer) As Integer
			If ew_SameStr(UserLevelID, "-1") Then ' System Administrator					
				Return 127 ' 1+2+4+8+16+32+64
			ElseIf UserLevelID >= 0 Then
				If ew_IsArrayList(m_ArUserLevelPriv) Then
					For Each Row As OrderedDictionary In m_ArUserLevelPriv
						If ew_SameStr(Row(0), TableName) AndAlso ew_SameStr(Row(1), UserLevelID) Then
							Return ew_ConvertToInt(Row(2))
						End If
					Next
				End If
			End If
			Return 0
		End Function

		' Get current user level name
		Public Function CurrentUserLevelName() As String
			Return GetUserLevelName(CurrentUserLevelID)
		End Function

		' Get user level name based on user level
		Public Function GetUserLevelName(ByVal UserLevelID As Integer) As String
			If ew_SameStr(UserLevelID, "-1") Then
				Return "Administrator"
			ElseIf UserLevelID >= 0 Then
				If ew_IsArrayList(m_ArUserLevel) Then
					For Each Row As OrderedDictionary In m_ArUserLevel
						If ew_SameStr(Row(0), UserLevelID) Then
							Return Convert.ToString(Row(1))
						End If
					Next
				End If
			End If
			Return ""
		End Function

		' Display all the User Level settings (for debug only)
		Public Sub ShowUserLevelInfo()
			If ew_IsArrayList(m_ArUserLevel) Then
				ew_Write("User Levels:<br>")
				ew_Write("UserLevelId, UserLevelName<br>")
				For Each Row As OrderedDictionary In m_ArUserLevel
					ew_Write("&nbsp;&nbsp;" & Row(0) & ", " & Row(1) & "<br>")
				Next
			Else
				ew_Write("No User Level definitions." & "<br>")
			End If
			If ew_IsArrayList(m_ArUserLevelPriv) Then
				ew_Write("User Level Privs:<br>")
				ew_Write("TableName, UserLevelId, UserLevelPriv<br>")
				For Each Row As OrderedDictionary In m_ArUserLevelPriv
					ew_Write("&nbsp;&nbsp;" & Row(0) & ", " & Row(1) & ", " & Row(2) & "<br>")
				Next
			Else
				ew_Write("No User Level privilege settings." & "<br>")
			End If
			ew_Write("CurrentUserLevel = " & CurrentUserLevel & "<br>")
		End Sub

		' Check privilege for List page (for menu items)
		Public Function AllowList(ByVal TableName As String) As Boolean
			Return ew_ConvertToBool(CurrentUserLevelPriv(TableName) And EWRPT_ALLOW_LIST)
		End Function

		' Check if user is logged in
		Public Function IsLoggedIn() As Boolean
			Return ew_SameStr(ew_Session(EWRPT_SESSION_STATUS), "login")
		End Function

		' Check if user is system administrator
		Public Function IsSysAdmin() As Boolean
			Return (Convert.ToInt32(ew_Session(EWRPT_SESSION_SYSTEM_ADMIN)) = 1)
		End Function

		' Check if user is administrator
		Public Function IsAdmin() As Boolean
			Return (CurrentUserLevelID = -1 OrElse IsSysAdmin())
		End Function

		' Save user level to session
		Public Sub SaveUserLevel()
			ew_Session(EWRPT_SESSION_AR_USER_LEVEL) = m_ArUserLevel
			ew_Session(EWRPT_SESSION_AR_USER_LEVEL_PRIV) = m_ArUserLevelPriv
		End Sub

		' Load user level from session
		Public Sub LoadUserLevel()
			If Not ew_IsArrayList(ew_Session(EWRPT_SESSION_AR_USER_LEVEL)) Then
				SetUpUserLevel()
				SaveUserLevel()
			Else
				m_ArUserLevel = DirectCast(ew_Session(EWRPT_SESSION_AR_USER_LEVEL), ArrayList)
				m_ArUserLevelPriv = DirectCast(ew_Session(EWRPT_SESSION_AR_USER_LEVEL_PRIV), ArrayList)
			End If
		End Sub

		' UserID Loading event
		Public Sub UserID_Loading()

			'ew_Write("UserID Loading: " & CurrentUserID & "<br>")
		End Sub

		' UserID Loaded event
		Public Sub UserID_Loaded()

			'ew_Write("UserID Loaded: " & UserIDList & "<br>")
		End Sub

		' User Level Loaded event
		Public Sub UserLevel_Loaded()

			'AddUserPermission(<UserLevelName>, <TableName>, <UserPermission>)
			'DeleteUserPermission(<UserLevelName>, <TableName>, <UserPermission>)

		End Sub
	End Class	

	' Public Shared Function for debug
	Public Shared Sub ew_Trace(Msg As Object)
		Try
			Dim FileName as String = HttpContext.Current.Server.MapPath("debug.txt")   
	    Dim sw as StreamWriter = File.AppendText(FileName)   
	    sw.WriteLine(Convert.ToString(Msg))   
	    sw.Close()
		Catch
			If EWRPT_DEBUG_ENABLED Then Throw		
		End Try       
	End Sub	

	' Encode HTML
	Public Shared Function ew_HtmlEncode(Expression As Object) As String
		Return HttpContext.Current.Server.HtmlEncode(Convert.ToString(Expression))
	End Function

	' Encode URL
	Public Shared Function ew_UrlEncode(Expression As Object) As String
		Return HttpContext.Current.Server.UrlEncode(Convert.ToString(Expression))
	End Function

	' Adjust SQL for special characters
	Public Shared Function ew_AdjustSql(value As Object) As String
		Dim sWrk As String = Convert.ToString(value).Trim()
		sWrk = sWrk.Replace("'", "''") ' Adjust for Single Quote
		If (EWRPT_DB_QUOTE_START = "[") Then
			sWrk = sWrk.Replace("[", "[[]") ' Adjust for Open Square Bracket
		End If
		Return sWrk
	End Function	

	' Compare object as string
	Public Shared Function ew_SameStr(v1 As Object, v2 As Object) As Boolean
		Return String.Equals(Convert.ToString(v1).Trim(), Convert.ToString(v2).Trim())
	End Function

	' Compare object as string (case insensitive)
	Public Shared Function ew_SameText(v1 As Object, v2 As Object) As Boolean
		Return String.Equals(Convert.ToString(v1).Trim().ToLower(), Convert.ToString(v2).Trim().ToLower())
	End Function

	' Check if empty string
	Public Shared Function ew_Empty(value As Object) As Boolean
		Return String.Equals(Convert.ToString(value).Trim(), String.Empty)
	End Function

	' Check if not empty string
	Public Shared Function ew_NotEmpty(value As Object) As Boolean
		Return Not ew_Empty(value)
	End Function	

	' Convert object to integer
	Public Shared Function ew_ConvertToInt(value As Object) As Integer
		Try
			Return Convert.ToInt32(value)
		Catch
			Return 0
		End Try
	End Function

	' Convert object to double
	Public Shared Function ew_ConvertToDouble(value As Object) As Double
		Try
			Return Convert.ToDouble(value)
		Catch
			Return 0
		End Try
	End Function

	' Convert object to bool
	Public Shared Function ew_ConvertToBool(ByVal value As Object) As Boolean
		Try
			If Information.IsNumeric(value) Then
				Return Convert.ToBoolean(ew_ConvertToDouble(value))
			Else
				Return Convert.ToBoolean(value)
			End If
		Catch
			Return False
		End Try
	End Function	

	'
	' Security shortcut functions
	'
	' Get current user name
	Public Shared Function CurrentUserName() As String
		Return Convert.ToString(ew_Session(EWRPT_SESSION_USER_NAME))
	End Function

	' Get current user ID
	Public Shared Function CurrentUserID() As Object
		Return Convert.ToString(ew_Session(EWRPT_SESSION_USER_ID))
	End Function

	' Get current parent user ID
	Public Shared Function CurrentParentUserID() As Object
		Return Convert.ToString(ew_Session(EWRPT_SESSION_PARENT_USER_ID))
	End Function

	' Get current user level
	Public Shared Function CurrentUserLevel() As Integer
		Return Convert.ToInt32(ew_Session(EWRPT_SESSION_USER_LEVEL_ID))
	End Function

	' Is Logged In
	Public Shared Function IsLoggedIn() As Boolean
		Return ew_SameStr(ew_Session(EWRPT_SESSION_STATUS), "login")
	End Function

	' Is System Admin
	Public Shared Function IsSysAdmin() As Boolean
		Return (Convert.ToInt32(ew_Session(EWRPT_SESSION_SYSTEM_ADMIN)) = 1)
	End Function

	' Is Admin
	Public Shared Function IsAdmin() As Boolean
		Return (Convert.ToInt32(ew_Session(EWRPT_SESSION_USER_LEVEL_ID)) = -1 OrElse Convert.ToInt32(ew_Session(EWRPT_SESSION_SYSTEM_ADMIN)) = 1)
	End Function

	' MD5
	Public Shared Function MD5(InputStr As String) As String
		Dim Md5Hasher As New MD5CryptoServiceProvider()
		Dim Data As Byte() = Md5Hasher.ComputeHash(Encoding.Unicode.GetBytes(InputStr))
		Dim sBuilder As New StringBuilder()
		For i As Integer = 0 To Data.Length - 1
			sBuilder.Append(Data(i).ToString("x2"))
		Next i
		Return sBuilder.ToString()	
	End Function

	' CRC32
	Public Shared Function CRC32(ByVal InputStr As String) As UInteger
		Dim bytes As Byte() = Encoding.Unicode.GetBytes(InputStr)
		Dim crc As UInteger = 4294967295
		Dim poly As UInteger = 3988292384
		Dim table As UInteger() = New UInteger(255) {}
		Dim temp As UInteger = 0
		For i As UInteger = 0 To table.Length - 1
			temp = i
			For j As Integer = 8 To 1 Step -1
				If (temp And 1) = 1 Then
					temp = CType((temp >> 1) Xor poly, UInteger)
				Else
					temp >>= 1
				End If
			Next
			table(i) = temp
		Next
		For i As Integer = 0 To bytes.Length - 1
			Dim index As Byte = CByte((crc And &HFF) Xor bytes(i))
			crc = CType((crc >> 8) Xor table(index), UInteger)
		Next
		Return Not crc
	End Function

	' Load a text file
	Public Shared Function ew_LoadTxt(ByVal fn As String) As String
		Dim sTxt As String = ""
		If ew_NotEmpty(fn) Then
			Dim sw As StreamReader = File.OpenText(fn)
			sTxt = sw.ReadToEnd()
			sw.Close()
		End If
		Return sTxt
	End Function

	'
	' Email class
	'
	Public Class cEmail

		Public Sender As String = ""	' Sender		

		Public Recipient As String = ""	' Recipient		

		Public Cc As String = ""	' Cc		

		Public Bcc As String = ""	' Bcc		

		Public Subject As String = ""	' Subject		

		Public Format As String = ""	' Format		

		Public Content As String = ""	' Content		

		Public Charset As String = ""	' Charset

		Public SendErrNumber As String = ""	' Send error number

		Public SendErrDescription As String = ""	' Send error description

		' Load email from template
		Public Sub Load(ByVal fn As String)
			Dim sHeader As String
			Dim arrHeader As String()
			Dim sName As String
			Dim sValue As String
			Dim i As Integer, j As Integer
			Dim sWrk As String = ew_LoadTxt(fn)	' Load text file content
			sWrk = sWrk.Replace("" & Chr(13) & "" & Chr(10) & "", "" & Chr(10) & "")	' Convert to Lf
			sWrk = sWrk.Replace("" & Chr(13) & "", "" & Chr(10) & "")	' Convert to Lf
			If sWrk <> "" Then
				i = sWrk.IndexOf("" & Chr(10) & "" + "" & Chr(10) & "")	' Locate header and mail content
				If i > 0 Then
					sHeader = sWrk.Substring(0, i + 1)
					Content = sWrk.Substring(i + 2)
					arrHeader = sHeader.Split(New Char() {Chr(10)})
					For j = 0 To arrHeader.GetUpperBound(0)
						i = arrHeader(j).IndexOf(":")
						If i > 0 Then
							sName = arrHeader(j).Substring(0, i).Trim()
							sValue = arrHeader(j).Substring(i + 1).Trim()
							Select Case sName.ToLower()
								Case "subject"
									Subject = sValue
									Exit Select
								Case "from"
									Sender = sValue
									Exit Select
								Case "to"
									Recipient = sValue
									Exit Select
								Case "cc"
									Cc = sValue
									Exit Select
								Case "bcc"
									Bcc = sValue
									Exit Select
								Case "format"
									Format = sValue
									Exit Select
							End Select
						End If
					Next
				End If
			End If
		End Sub

		' Replace sender
		Public Sub ReplaceSender(ByVal ASender As String)
			Sender = Sender.Replace("<!--$From-->", ASender)
		End Sub

		' Replace recipient
		Public Sub ReplaceRecipient(ByVal ARecipient As String)
			Recipient = Recipient.Replace("<!--$To-->", ARecipient)
		End Sub

		' Add cc email
		Public Sub AddCc(ByVal ACc As String)
			If ACc <> "" Then
				If Cc <> "" Then
					Cc = Cc + ";"
				End If
				Cc = Cc + ACc
			End If
		End Sub

		' Add bcc email
		Public Sub AddBcc(ByVal ABcc As String)
			If ABcc <> "" Then
				If Bcc <> "" Then
					Bcc = Bcc + ";"
				End If
				Bcc = Bcc + ABcc
			End If
		End Sub

		' Replace subject
		Public Sub ReplaceSubject(ByVal ASubject As String)
			Subject = Subject.Replace("<!--$Subject-->", ASubject)
		End Sub

		' Replace content
		Public Sub ReplaceContent(ByVal Find As String, ByVal ReplaceWith As String)
			Content = Content.Replace(Find, ReplaceWith)
		End Sub

		' Send email
		Public Function Send() As Boolean
			Dim bSend As Boolean = ewrpt_SendEmail(Sender, Recipient, Cc, Bcc, Subject, Content, _
				"", "", Format, Charset)
			If Not bSend Then
				SendErrDescription = gsEmailErrDesc
			End If

			' Send error description
			Return bSend
		End Function

		' Display as string
		Public Function AsString() As String
			Return "{Sender: " + Sender + ", Recipient: " + Recipient + ", Cc: " + Cc + ", Bcc: " + Bcc + ", Subject: " + Subject + ", Format: " + Format + ", Content: " + Content + ", Charset: " + Charset + "}"
		End Function
	End Class

	'
	' Class for Pager item
	'	
	Class cPagerItem

		Public Text As String

		Public Start As Integer

		Public Enabled As Boolean

		' Constructor
		Public Sub New(AStart As Integer, AText As String, AEnabled As Boolean)
			Text = AText
			Start = AStart
			Enabled = AEnabled
		End Sub

		' Constructor
		Public Sub New()

			' Do nothing
		End Sub	
	End Class	

	'
	' Class for Numeric pager
	'	
	Class cNumericPager

		Public Items As New ArrayList

		Public PageSize As Integer, ToIndex As Integer, Count As Integer, FromIndex As Integer, RecordCount As Integer, Range As Integer

		Public LastButton As cPagerItem, PrevButton As cPagerItem, FirstButton As cPagerItem, NextButton As cPagerItem

		Public ButtonCount As Integer

		Public Visible As Boolean

		' Constructor
		Public Sub New(AFromIndex As Integer, APageSize As Integer, ARecordCount As Integer, ARange As Integer)
			FromIndex = AFromIndex
			PageSize = APageSize
			RecordCount = ARecordCount
			Range = ARange
			FirstButton = New cPagerItem
			PrevButton = New cPagerItem
			NextButton = New cPagerItem
			LastButton = New cPagerItem
			Visible = True
			Init()
		End Sub

		' Init pager
		Public Sub Init()
			If FromIndex > RecordCount Then FromIndex = RecordCount
			ToIndex = FromIndex + PageSize - 1
			If ToIndex > RecordCount Then ToIndex = RecordCount
			Count = 0
			SetupNumericPager()

			' Update button count
			ButtonCount = Count + 1
			If FirstButton.Enabled Then ButtonCount = ButtonCount + 1
			If PrevButton.Enabled Then ButtonCount = ButtonCount + 1
			If NextButton.Enabled Then ButtonCount = ButtonCount + 1
			If LastButton.Enabled Then ButtonCount = ButtonCount + 1
		End Sub

		' Add pager item
		Private Sub AddPagerItem(StartIndex As Integer, Text As String, Enabled As Boolean)
			Items.Add(New cPagerItem(StartIndex, Text, Enabled))
			Count = Items.Count
		End Sub

		' Setup pager items
		Private Sub SetupNumericPager()
			Dim HasPrev As Boolean, NoNext As Boolean
			Dim dy2 As Integer, dx2 As Integer, y As Integer, x As Integer, dx1 As Integer, dy1 As Integer, ny As Integer, TempIndex As Integer
			If RecordCount > PageSize Then
				NoNext = (RecordCount < (FromIndex + PageSize))
				HasPrev = (FromIndex > 1)

				' First Button
				TempIndex = 1
				FirstButton.Start = TempIndex
				FirstButton.Enabled = (FromIndex > TempIndex)

				' Prev Button
				TempIndex = FromIndex - PageSize
				If TempIndex < 1 Then TempIndex = 1
				PrevButton.Start = TempIndex
				PrevButton.Enabled = HasPrev

				' Page links
				If HasPrev Or Not NoNext Then
					x = 1
					y = 1
					dx1 = ((FromIndex - 1) \ (PageSize * Range)) * PageSize * Range + 1
					dy1 = ((FromIndex - 1) \ (PageSize * Range)) * Range + 1
					If (dx1 + PageSize * Range - 1) > RecordCount Then
						dx2 = (RecordCount \ PageSize) * PageSize + 1
						dy2 = (RecordCount \ PageSize) + 1
					Else
						dx2 = dx1 + PageSize * Range - 1
						dy2 = dy1 + Range - 1
					End If
					While x <= RecordCount
						If x >= dx1 And x <= dx2 Then
							AddPagerItem(x, y, FromIndex <> x)
							x = x + PageSize
							y = y + 1
						ElseIf x >= (dx1 - PageSize * Range) And x <= (dx2 + PageSize * Range) Then 
							If x + Range * PageSize < RecordCount Then
								AddPagerItem(x, y & "-" & (y + Range - 1), True)
							Else
								ny = (RecordCount - 1) \ PageSize + 1
								If ny = y Then
									AddPagerItem(x, y, True)
								Else
									AddPagerItem(x, y & "-" & ny, True)
								End If
							End If
							x = x + Range * PageSize
							y = y + Range
						Else
							x = x + Range * PageSize
							y = y + Range
						End If
					End While
				End If

				' Next Button
				NextButton.Start = FromIndex + PageSize
				TempIndex = FromIndex + PageSize
				NextButton.Start = TempIndex
				NextButton.Enabled = Not NoNext

				' Last Button
				TempIndex = ((RecordCount - 1) \ PageSize) * PageSize + 1
				LastButton.Start = TempIndex
				LastButton.Enabled = (FromIndex < TempIndex)
			End If
		End Sub
	End Class	

	'
	' Class for PrevNext pager
	'	
	Class cPrevNextPager

		Public NextButton As cPagerItem, FirstButton As cPagerItem, PrevButton As cPagerItem, LastButton As cPagerItem

		Public ToIndex As Integer, PageCount As Integer, CurrentPage As Integer, PageSize As Integer, FromIndex As Integer, RecordCount As Integer

		Public Visible As Boolean

		' Constructor
		Public Sub New(AFromIndex As Integer, APageSize As Integer, ARecordCount As Integer)
			FromIndex = AFromIndex
			PageSize = APageSize
			RecordCount = ARecordCount
			FirstButton = New cPagerItem
			PrevButton = New cPagerItem
			NextButton = New cPagerItem
			LastButton = New cPagerItem
			Visible = True
			Init()
		End Sub

		' Method to init pager
		Public Sub Init()
			Dim TempIndex As Integer
			If PageSize > 0 Then
				CurrentPage = (FromIndex - 1) \ PageSize + 1
				PageCount = (RecordCount - 1) \ PageSize + 1
				If FromIndex > RecordCount Then FromIndex = RecordCount
				ToIndex = FromIndex + PageSize - 1
				If ToIndex > RecordCount Then ToIndex = RecordCount

				' First Button
				TempIndex = 1
				FirstButton.Start = TempIndex
				FirstButton.Enabled = (TempIndex <> FromIndex)

				' Prev Button
				TempIndex = FromIndex - PageSize
				If TempIndex < 1 Then TempIndex = 1
				PrevButton.Start = TempIndex
				PrevButton.Enabled = (TempIndex <> FromIndex)

				' Next Button
				TempIndex = FromIndex + PageSize
				If TempIndex > RecordCount Then TempIndex = FromIndex
				NextButton.Start = TempIndex
				NextButton.Enabled = (TempIndex <> FromIndex)

				' Last Button
				TempIndex = ((RecordCount - 1) \ PageSize) * PageSize + 1
				LastButton.Start = TempIndex
				LastButton.Enabled = (TempIndex <> FromIndex)
			End If
		End Sub
	End Class

	' Menu class
	Public Class cMenu
		Inherits AspNetReportMakerBase

		Public Id As Object

		Public IsRoot As Boolean

		Public ItemData As New ArrayList() ' ArrayList of cMenuItem

		' Constructor
		Public Sub New(ByVal AId As Object, ByVal ARoot As Boolean)
			Id = AId
			IsRoot = ARoot
		End Sub

		' Add a menu item
		Public Sub AddMenuItem(ByVal id As Integer, ByVal text As String, ByVal url As String, ByVal parentid As Integer, ByVal src As String, ByVal target As String, ByVal allowed As Boolean)
			Dim oParentMenu As cMenuItem = Nothing
			Dim item As New cMenuItem(id, text, url, parentid, src, target, allowed)
			If Not MenuItem_Adding(item) Then
				Return
			End If
			If item.ParentId < 0 Then
				AddItem(item)
			Else
				If FindItem(item.ParentId, oParentMenu) Then
					oParentMenu.AddItem(item)
				End If
			End If
		End Sub

		' Add item to internal ArrayList
		Public Sub AddItem(ByRef item As cMenuItem)
			ItemData.Add(item)
		End Sub

		' Find item
		Public Function FindItem(ByVal id As Integer, ByRef outitem As cMenuItem) As Boolean
			Dim result As Boolean = False
			Dim item As cMenuItem
			result = False
			For i As Integer = 0 To ItemData.Count - 1
				item = DirectCast(ItemData(i), cMenuItem)
				If item.Id = id Then
					outitem = item
					Return True
				ElseIf item.SubMenu IsNot Nothing Then
					If item.SubMenu.FindItem(id, outitem) Then
						Return True
					End If
				End If
			Next
			Return result
		End Function

		' Check if a menu item should be shown
		Public Function RenderItem(ByVal item As cMenuItem) As Boolean
			If item.SubMenu IsNot Nothing Then
				For Each subitem As cMenuItem In item.SubMenu.ItemData
					If item.SubMenu.RenderItem(subitem) Then
						Return True
					End If
				Next
			End If
			Return (item.Allowed AndAlso ew_NotEmpty(item.Url))
		End Function

		' Check if this menu should be rendered
		Public Function RenderMenu() As Boolean
			For Each item As cMenuItem In ItemData
				If RenderItem(item) Then
					Return True
				End If
			Next
			Return False
		End Function

		' Render the menu
		Public Sub Render()
			If Not RenderMenu() Then Return
			ew_Write("<ul")
			If ew_NotEmpty(Id) Then
				If Information.IsNumeric(Id) Then
					ew_Write(" id=""menu_" & Id & """")
				Else
					ew_Write(" id=""" & Id & """")
				End If
			End If
			If IsRoot Then ew_Write(" class=""" & EWRPT_MENUBAR_CLASSNAME & """")
			ew_Write(">" & "" & Chr(13) & "" & Chr(10) & "")
			Dim itemcnt As Integer = ItemData.Count
			For i As Integer = 0 To itemcnt - 1
				Dim item As cMenuItem = DirectCast(ItemData(i), cMenuItem)
				If RenderItem(item) Then
					ew_Write("<li><a")
					If item.SubMenu IsNot Nothing Then
						ew_Write(" class=""" & EWRPT_MENUBAR_SUBMENU_CLASSNAME & """")
					End If
					If item.Url <> "" Then
						ew_Write(" href=""" & ew_HtmlEncode(item.Url) & """")
					End If
					If item.Target <> "" Then
						ew_Write(" target=""" & ew_HtmlEncode(item.Target) & """")
					End If
					ew_Write(">" & item.Text & "</a>" & "" & Chr(13) & "" & Chr(10) & "")
					If item.SubMenu IsNot Nothing Then
						DirectCast(item.SubMenu, cMenu).Render()
					End If
					ew_Write("</li>" & "" & Chr(13) & "" & Chr(10) & "")
				End If
			Next
			ew_Write("</ul>" & "" & Chr(13) & "" & Chr(10) & "")			
		End Sub

		' Report MenuItem Adding event
		Public Function MenuItem_Adding(ByRef Item As cMenuItem) As Boolean

			'ew_Write(Item.AsString())
			' Return False if menu item not allowed

			Return True
		End Function
	End Class

	' Menu item class
	Public Class cMenuItem

		Public Id As Integer

		Public Text As String = ""

		Public Url As String = ""

		Public ParentId As Integer

		Public SubMenu As cMenu = Nothing

		Public Source As String = ""

		Public Allowed As Boolean = True

		Public Target As String = ""

		Public Sub New(ByVal AId As Integer, ByVal AText As String, ByVal AUrl As String, ByVal AParentId As Integer, ByVal ASource As String, ByVal ATarget As String, ByVal AAllowed As Boolean)
			Id = AId
			Text = AText
			Url = AUrl
			ParentId = AParentId
			Source = ASource
			Target = ATarget
			Allowed = AAllowed
		End Sub

		Public Sub AddItem(ByRef item As cMenuItem)
			If SubMenu Is Nothing Then
				SubMenu = New cMenu(Id, False)
			End If
			SubMenu.AddItem(item)
		End Sub

		Public Function AsString() As String
			Dim OutStr As String = "{ Id: " & Id & ", Text: " & Text & ", Url: " & Url & ", ParentId: " & ParentId
			If SubMenu Is Nothing Then
				OutStr = OutStr & ", SubMenu: (Null)"
			Else
				OutStr = OutStr & ", SubMenu: (Object)"
			End If
			OutStr = OutStr & ", Source: " & Source
			Return OutStr & " }" & "<br>"
		End Function
	End Class

	' Allow list
	Public Function AllowList(ByVal TableName As String) As Boolean
		If Security IsNot Nothing Then
			Return Security.AllowList(TableName)
		Else
			Return True
		End If
	End Function

	'
	' Connection object
	'
	Public Class cConnection
		Implements IDisposable

		Public ConnectionString As String = EWRPT_DB_CONNECTION_STRING

		Public Conn As SqlConnection

		Public Trans As SqlTransaction

		Private TempConn As SqlConnection

		Private TempCommand As SqlCommand

		Private TempDataReader As SqlDataReader

		' Constructor
		Public Sub New(ConnStr As String)
			ConnectionString = ConnStr
			Database_Connecting(ConnectionString)
			Conn = New SqlConnection(ConnectionString)
			Conn.Open()
			OnConnected()
		End Sub

		' Constructor
		Public Sub New()
			Database_Connecting(ConnectionString)
			Conn = New SqlConnection(ConnectionString)
			Conn.Open()
			OnConnected()
		End Sub

		' After connect
		Public Sub OnConnected()
		End Sub

		' Execute SQL
		Public Function Execute(Sql As String) As Integer
			Try
				Dim Cmd As SqlCommand = GetCommand(Sql)
				If EWRPT_DEBUG_ENABLED Then ew_SetDebugMsg("SQL: " & Sql & "<br><br>")				
				Return Cmd.ExecuteNonQuery()
			Catch
				If EWRPT_DEBUG_ENABLED Then Throw
				Return -1
			End Try			
		End Function

		' Execute SQL and return first value of first row
		Public Function ExecuteScalar(Sql As String) As Object
			Try
				Dim Cmd As SqlCommand = GetCommand(Sql)
				If EWRPT_DEBUG_ENABLED Then ew_SetDebugMsg("SQL: " & Sql & "<br><br>")	
				Return Cmd.ExecuteScalar()
			Catch
				If EWRPT_DEBUG_ENABLED Then Throw
				Return Nothing 
			End Try				
		End Function

		' Get data reader
		Public Function GetDataReader(Sql As String) As SqlDataReader
			Try
				Dim Cmd As SqlCommand = GetCommand(Sql)
				If EWRPT_DEBUG_ENABLED Then ew_SetDebugMsg("SQL: " & Sql & "<br><br>")
				Return Cmd.ExecuteReader()
			Catch
				If EWRPT_DEBUG_ENABLED Then Throw
				Return Nothing 
			End Try	
		End Function

		' Get temporary data reader
		Public Function GetTempDataReader(Sql As String) As SqlDataReader
			Try
				If TempConn Is Nothing Then
					TempConn = New SqlConnection(ConnectionString)
					TempConn.Open()
				End If
				If TempCommand Is Nothing Then
					TempCommand = New SqlCommand(Sql, TempConn)
				End If
				CloseTempDataReader()
				TempCommand.CommandText = Sql
				If EWRPT_DEBUG_ENABLED Then ew_SetDebugMsg("SQL: " & Sql & "<br><br>")
				TempDataReader = TempCommand.ExecuteReader()			
				Return TempDataReader
			Catch
				If EWRPT_DEBUG_ENABLED Then Throw
				Return Nothing 
			End Try	
		End Function

		' Close temporary data reader
		Public Sub CloseTempDataReader()
			If TempDataReader IsNot Nothing	Then
				TempDataReader.Close()
				TempDataReader.Dispose()
			End If			
		End Sub

		' Get OrderedDictionary from data reader
		Public Function GetRow(ByRef dr As SqlDataReader) As OrderedDictionary
			Dim od As New OrderedDictionary			
			For i As Integer = 0 to dr.FieldCount - 1 
				Dim name As String = dr.GetName(i)
				If name = "" Then
					name = Convert.ToString(i)
				End If
				od(name) = dr(i)
			Next
			Return od
		End Function

		' Get rows
		Public Overloads Function GetRows(ByRef dr As SqlDataReader) As ArrayList
			Dim Rows As New ArrayList() 
			While dr.Read() 
				Rows.Add(GetRow(dr)) 
			End While
			Return Rows 
		End Function

		' Get rows by SQL
		Public Overloads Function GetRows(Sql As String) As ArrayList
			Dim dr As SqlDataReader = GetTempDataReader(Sql)
			Try
				Dim Rows As ArrayList = GetRows(dr)
				If EWRPT_DEBUG_ENABLED Then ew_SetDebugMsg("RecordCount: " & Rows.Count & "<br><br>")
				Return Rows
			Catch
				If EWRPT_DEBUG_ENABLED Then Throw		
			Finally
				CloseTempDataReader()
			End Try
			Return New ArrayList() 		
		End Function	

		' Get dataset
		Public Function GetDataSet(Sql As String) As DataSet
			Try
				Dim Adapter As New SqlDataAdapter(Sql, Conn)
				If EWRPT_DEBUG_ENABLED Then ew_SetDebugMsg("SQL: " & Sql & "<br><br>")
				Dim DS As DataSet = new DataSet()
				Adapter.Fill(DS)
				Return DS
			Catch
				If EWRPT_DEBUG_ENABLED Then Throw
				Return Nothing
			End Try	
		End Function

		' Get command
		Public Function GetCommand(Sql As String) As SqlCommand
			Dim Cmd As New SqlCommand(Sql, Conn)
			If Trans IsNot Nothing Then Cmd.Transaction = Trans
			Return Cmd
		End Function

		' Dispose	
		Public Sub Dispose() Implements IDisposable.Dispose
			If Trans IsNot Nothing Then Trans.Dispose()
			Conn.Close()
			Conn.Dispose()
			If TempCommand IsNot Nothing Then
				TempCommand.Dispose()
			End If
			If TempConn IsNot Nothing Then
				TempConn.Close()
				TempConn.Dispose()
			End If
		End Sub

		' Database Connecting event
		Public Sub Database_Connecting(ByRef Connstr As String)

			'ew_Write("Database Connecting")
		End Sub
	End Class	

	' Execute SQL
	Public Shared Function ew_Execute(Sql As String) As Integer
		Dim c As New cConnection()
		Try
			Return c.Execute(Sql)
		Finally
			c.Dispose()
		End Try
	End Function

	' Execute SQL and return first value of first row
	Public Shared Function ew_ExecuteScalar(Sql As String) As Object
		Dim c As New cConnection()
		Try
			Return c.ExecuteScalar(Sql)
		Finally
			c.Dispose()
		End Try
	End Function

	' Execute SQL and return first rowr
	Public Shared Function ew_ExecuteRow(Sql As String) As OrderedDictionary
		Dim dr As SqlDataReader = Nothing
		Dim c As New cConnection()
		Try
			dr = c.GetDataReader(Sql)
			If dr IsNot Nothing AndAlso dr.Read() Then
				Return c.GetRow(dr)
			Else
				Return Nothing
			End If
		Finally
			If dr IsNot Nothing Then
				dr.Close()
				dr.Dispose()
			End If
			c.Dispose()
		End Try
	End Function

	' Functions for default date format
	' ANamedFormat = 0-8, where 0-4 same as VBScript
	' 5 = "yyyymmdd"
	' 6 = "mmddyyyy"
	' 7 = "ddmmyyyy"
	' 8 = Short Date + Short Time
	' 9 = "yyyymmdd HH:MM:SS"
	' 10 = "mmddyyyy HH:MM:SS"
	' 11 = "ddmmyyyy HH:MM:SS"
	' 12 = "HH:MM:SS"
	' Format date time based on format type
	Public Shared Function ew_FormatDateTime(ADate As Object, ANamedFormat As Integer) As String
		Dim sDT As String
		If IsDate(ADate) Then
			Dim DT As DateTime = Convert.ToDateTime(ADate)
			If ANamedFormat >= 0 AndAlso ANamedFormat <= 4 Then
				sDT = FormatDateTime(ADate, ANamedFormat)
			ElseIf ANamedFormat = 5 OrElse ANamedFormat = 9 Then 
				sDT = DT.Year & EWRPT_DATE_SEPARATOR & DT.Month & EWRPT_DATE_SEPARATOR & DT.Day
			ElseIf ANamedFormat = 6 OrElse ANamedFormat = 10 Then 
				sDT = DT.Month & EWRPT_DATE_SEPARATOR & DT.Day & EWRPT_DATE_SEPARATOR & DT.Year
			ElseIf ANamedFormat = 7 OrElse ANamedFormat = 11 Then 
				sDT = DT.Day & EWRPT_DATE_SEPARATOR & DT.Month & EWRPT_DATE_SEPARATOR & DT.Year
			ElseIf ANamedFormat = 8 Then 
				sDT = FormatDateTime(ADate, 2)
				If DT.Hour <> 0 OrElse DT.Minute <> 0 OrElse DT.Second <> 0 Then
					sDT = sDT & " " & DT.ToString("HH:mm:ss")
				End If
			ElseIf ANamedFormat = 12 Then 
				sDT = DT.ToString("HH:mm:ss")
			Else
				Return Convert.ToString(DT)
			End If
			If ANamedFormat >= 9 AndAlso ANamedFormat <= 11 Then
				sDT = sDT & " " & DT.ToString("HH:mm:ss")
			End If
			Return sDT
		Else
			Return Convert.ToString(ADate)
		End If
	End Function	

	' Unformat date time based on format type
	Public Shared Function ew_UnFormatDateTime(ADate As Object, ANamedFormat As Integer) As String
		Dim arDate() As String, arDateTime() As String
		Dim d As DateTime
		Dim sDT As String
		ADate = Convert.ToString(ADate).Trim()
		While ADate.Contains("  ")
			ADate = ADate.Replace("  ", " ")
		End While
		arDateTime = ADate.Split(New Char() {" "c})
		If ANamedFormat = 0 AndAlso IsDate(ADate) Then
			d = Convert.ToDateTime(arDateTime(0))
			sDT = d.ToString("yyyy/MM/dd")
			If arDateTime.GetUpperBound(0) > 0 Then
				For i As Integer = 1 To arDateTime.GetUpperBound(0)
					sDT = sDT & " " & arDateTime(i)
				Next 
			End If
			Return sDT
		Else
			arDate = arDateTime(0).Split(New Char() {Convert.ToChar(EWRPT_DATE_SEPARATOR)})
			If arDate.GetUpperBound(0) = 2 Then
				sDT = arDateTime(0)
				If ANamedFormat = 6 OrElse ANamedFormat = 10 Then ' mmddyyyy
					If arDate(0).Length <= 2 AndAlso arDate(1).Length <= 2 AndAlso arDate(2).Length <= 4 Then
						sDT = arDate(2) & "/" & arDate(0) & "/" & arDate(1)
					End If
				ElseIf ANamedFormat = 7 OrElse ANamedFormat = 11 Then  ' ddmmyyyy
					If arDate(0).Length <= 2 AndAlso arDate(1).Length <= 2 AndAlso arDate(2).Length <= 4 Then
						sDT = arDate(2) & "/" & arDate(1) & "/" & arDate(0)
					End If
				ElseIf ANamedFormat = 5 OrElse ANamedFormat = 9 Then  ' yyyymmdd
					If arDate(0).Length <= 4 AndAlso arDate(1).Length <= 2 AndAlso arDate(2).Length <= 2 Then
						sDT = arDate(0) & "/" & arDate(1) & "/" & arDate(2)
					End If
				End If
				If arDateTime.GetUpperBound(0) > 0 Then
					If IsDate(arDateTime(1)) Then ' Is time
						sDT = sDT & " " & arDateTime(1)
					End If
				End If
				Return sDT
			Else
				Return ADate.ToString()
			End If
		End If
	End Function	

	' Format currency
	Public Shared Function ew_FormatCurrency(Expression As Object, NumDigitsAfterDecimal As Integer, IncludeLeadingDigit As TriState, UseParensForNegativeNumbers As TriState, GroupDigits As TriState) As String
		If Not Information.IsNumeric(Expression) Then Return Convert.ToString(Expression)
		If IsDbNull(Expression) Then Return String.Empty 		
		Return Strings.FormatCurrency(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	End Function	

	' Format number
	Public Shared Function ew_FormatNumber(Expression As Object, NumDigitsAfterDecimal As Integer, IncludeLeadingDigit As TriState, UseParensForNegativeNumbers As TriState, GroupDigits As TriState) As String
		If Not Information.IsNumeric(Expression) Then Return Convert.ToString(Expression)
		If IsDbNull(Expression) Then Return String.Empty
		Return Strings.FormatNumber(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	End Function	

	' Format percent
	Public Shared Function ew_FormatPercent(Expression As Object, NumDigitsAfterDecimal As Integer, IncludeLeadingDigit As TriState, UseParensForNegativeNumbers As TriState, GroupDigits As TriState) As String
		If Not Information.IsNumeric(Expression) Then Return Convert.ToString(Expression)
		If IsDbNull(Expression) Then Return String.Empty
		Return Strings.FormatPercent(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)		
	End Function	

	' Truncate Memo Field based on specified length, string truncated to nearest space or CrLf
	Public Shared Function ew_TruncateMemo(memostr As String, ln As Integer, removehtml As Boolean) As String
		Dim j As Integer, i As Integer, k As Integer
		Dim str As String
		If removehtml Then
			str = ew_RemoveHtml(memostr) ' Remove HTML
		Else
			str = memostr
		End If
		If str.Length > 0 AndAlso str.Length > ln Then
			k = 0
			Do While k >= 0 AndAlso k < str.Length
				i = str.IndexOf(" ", k)
				j = str.IndexOf(vbCrLf, k)
				If i < 0 AndAlso j < 0 Then ' Unable to truncate
					Return str
				Else					

					' Get nearest space or CrLf
					If i > 0 AndAlso j > 0 Then
						If i < j Then	k = i	Else k = j
					ElseIf i > 0 Then 
						k = i
					ElseIf j > 0 Then 
						k = j
					End If					

					' Get truncated text
					If k >= ln Then
						Return str.Substring(0, k) & "..."
					Else
						k += 1
					End If
				End If
			Loop 
		End If
		Return str
	End Function

	' Remove Html tags from text
	Public Shared Function ew_RemoveHtml(ByVal str As String) As String
		Return Regex.Replace(str, "<[^>]*>", String.Empty)
	End Function

	' Check if valid operator
	Public Shared Function ew_IsValidOpr(Opr As String, FldType As Integer) As Boolean
		Dim Valid As Boolean = (Opr = "=" OrElse Opr = "<" OrElse Opr = "<=" OrElse Opr = ">" OrElse Opr = ">=" OrElse Opr = "<>")
		If FldType = EWRPT_DATATYPE_STRING OrElse FldType = EWRPT_DATATYPE_MEMO Then
			Valid = Valid OrElse Opr = "LIKE" OrElse Opr = "NOT LIKE" OrElse Opr = "STARTS WITH"
		End If
		Return Valid
	End Function

	' Quoted name for table/field
	Public Shared Function ew_QuotedName(ByVal Name As String) As String
		Return EWRPT_DB_QUOTE_START + Name.Replace(EWRPT_DB_QUOTE_END, EWRPT_DB_QUOTE_END + EWRPT_DB_QUOTE_END) + EWRPT_DB_QUOTE_END
	End Function	

	' Quoted value for field type
	Public Shared Function ew_QuotedValue(Value As Object, FldType As Integer) As String
		Value = Convert.ToString(Value)
		Select Case FldType
			Case EWRPT_DATATYPE_STRING, EWRPT_DATATYPE_MEMO
				Return "'" & ew_AdjustSql(Value) & "'"
			Case EWRPT_DATATYPE_GUID
				If EWRPT_IS_MSACCESS Then
					If Value.StartsWith("{") Then
						Return Value
					Else
						Return "{" & ew_AdjustSql(Value) & "}"
					End If
				Else
					Return "'" & ew_AdjustSql(Value) & "'"
				End If
			Case EWRPT_DATATYPE_DATE, EWRPT_DATATYPE_TIME
				If EWRPT_IS_MSACCESS Then
					Return "#" & ew_AdjustSql(Value) & "#"
				Else
					Return "'" & ew_AdjustSql(Value) & "'"
				End If
			Case Else
				Return Value
		End Select
	End Function

	' Invoke method with no parameter
	Public Function ew_InvokeMethod(ByVal name As String, ByVal parameters As Object()) As Object
		Dim mi As MethodInfo = GetType(AspNetReportMaker4_postergados).GetMethod(name)
		If mi IsNot Nothing Then
			Return mi.Invoke(Me, parameters)
		Else
			Return False
		End If
	End Function

	' Get field value
	Public Function ew_GetFieldValue(ByVal name As String) As Object
		Dim fi As FieldInfo = GetType(AspNetReportMaker4_postergados).GetField(name)
		Return IIf(fi IsNot Nothing, fi.GetValue(Nothing), Nothing)
	End Function

	' Check if object is ArrayList
	Public Shared Function ew_IsArrayList(ByVal obj As Object) As Boolean
		Return (obj IsNot Nothing) AndAlso (obj.GetType().ToString() = "System.Collections.ArrayList")
	End Function

	' Global random
	Private Shared GlobalRandom As New Random()

	' Get a random number
	Public Shared Function ew_Random() As Integer
		SyncLock GlobalRandom
			Dim NewRandom As New Random(GlobalRandom.Next())
			Return NewRandom.Next()
		End SyncLock
	End Function	

	' Get query string value
	Public Shared Function ew_Get(name As String) As String
		If HttpContext.Current.Request.QueryString(name) IsNot Nothing Then
			Return HttpContext.Current.Request.QueryString(name)
		Else
			Return ""
		End If
	End Function

	' Get form value
	Public Shared Function ew_Post(name As String) As String
		If HttpContext.Current.Request.Form(name) IsNot Nothing Then
			Return HttpContext.Current.Request.Form(name)
		Else
			Return ""
		End If
	End Function

	' Get/Set session values
	Public Shared Property ew_Session(name As String) As Object
		Get
			Return HttpContext.Current.Session(name)
		End Get
		Set(ByVal Value As Object)
			HttpContext.Current.Session(name) = Value
		End Set
	End Property

	' Get/Set project cookie
	Public Shared Property ew_Cookie(name As String) As String
		Get
			If HttpContext.Current.Request.Cookies(EWRPT_PROJECT_NAME) IsNot Nothing Then
				Return HttpContext.Current.Request.Cookies(EWRPT_PROJECT_NAME)(name)
			Else
				Return ""
			End If
		End Get
		Set(ByVal value As String)
			Dim c As HttpCookie
			If HttpContext.Current.Request.Cookies(EWRPT_PROJECT_NAME) IsNot Nothing Then
				c = HttpContext.Current.Request.Cookies(EWRPT_PROJECT_NAME)
				c.Values(name) = value
			Else
				c = New HttpCookie(EWRPT_PROJECT_NAME)
			End If
			c.Values(name) = value
			c.Path = ew_AppPath()
			c.Expires = EWRPT_COOKIE_EXPIRY_TIME			
			HttpContext.Current.Response.Cookies.Add(c)	
		End Set
	End Property

	' Response.Write
	Public Shared Sub ew_Write(value As Object)
		HttpContext.Current.Response.Write(value)
	End Sub

	' Response.End
	Public Shared Sub ew_End()
		HttpContext.Current.Response.End()
	End Sub	

	'
	' TEA encrypt/decrypt class
	'
	Public Class cTEA

    Public Shared Function Encrypt(ByVal Data As String, ByVal Key As String) As String
			Try
				If Data.Length = 0 Then
					Throw New ArgumentException("Data must be at least 1 character in length.")
				End If
				Dim formattedKey As UInteger() = FormatKey(Key)
				If Data.Length Mod 2 <> 0 Then Data &= Chr(0) ' Make sure array is even in length
				Dim dataBytes As Byte() = Encoding.Unicode.GetBytes(Data)
				Dim cipher As String = String.Empty
				Dim tempData As UInteger() = New UInteger(1) {}
				For i As Integer = 0 To dataBytes.Length - 1 Step 2
					tempData(0) = dataBytes(i)
					tempData(1) = dataBytes(i + 1)
					Code(tempData, formattedKey)
					cipher &= ConvertUIntToString(tempData(0)) & ConvertUIntToString(tempData(1))
				Next
				Return UrlEncode(cipher)
			Catch
				Return Data	
			End Try
    End Function

    Public Shared Function Decrypt(ByVal Data As String, ByVal Key As String) As String
			Try
				Data = UrlDecode(Data)
				Dim formattedKey As UInteger() = FormatKey(Key)
				Dim x As Integer = 0
				Dim tempData As UInteger() = New UInteger(1) {}
				Dim dataBytes As Byte() = New Byte(Data.Length / 8 * 2 - 1) {}
				For i As Integer = 0 To Data.Length - 1 Step 8
					tempData(0) = ConvertStringToUInt(Data.Substring(i, 4))
					tempData(1) = ConvertStringToUInt(Data.Substring(i + 4, 4))
					Decode(tempData, formattedKey)
					dataBytes(x) = CByte(tempData(0))
					x += 1
					dataBytes(x) = CByte(tempData(1))
					x += 1
				Next
				Dim decipheredString As String = Encoding.Unicode.GetString(dataBytes, 0, dataBytes.Length)
				If decipheredString(decipheredString.Length - 1) = Chr(0) Then ' Strip the null char if it was added
					decipheredString = decipheredString.Substring(0, decipheredString.Length - 1)
				End If
				Return decipheredString
			Catch
				Return Data
			End Try
    End Function

    Private Shared Function FormatKey(ByVal Key As String) As UInteger()
			If Key.Length = 0 Then
				Throw New ArgumentException("Key must be between 1 and 16 characters in length")
			End If
			Key = Key.PadRight(16, " "c).Substring(0, 16) ' Ensure that the key is 16 chars in length
			Dim formattedKey As UInteger() = New UInteger(3) {}

			' Get the key into the correct format for TEA usage
			Dim j As Integer = 0
			For i As Integer = 0 To Key.Length - 1 Step 4
				formattedKey(j) = ConvertStringToUInt(Key.Substring(i, 4))
				j += 1
			Next
			Return formattedKey
    End Function

    Private Shared Function Add(ByVal v1 As ULong, ByVal v2 As ULong) As UInteger
			Dim t As ULong
			If v1 = 4294967295 And v2 = 4294967295 Then
				t = 0
			Else
			  t = v1 + v2
			End If
			If t > 2 ^ 32 Then t = t - 2 ^ 32
			Return t
    End Function

    Private Shared Function Minus(ByVal v1 As Long, ByVal v2 As Long) As UInteger
			Dim t As Long
			t = v1 - v2
			If t > 2 ^ 32 Then
				t = t - 2 ^ 32
			ElseIf t < 0 Then
				t = t + 2 ^ 32
			End If
			Return t
    End Function

    Private Shared Sub Code(ByVal v As UInteger(), ByVal k As UInteger())
			Dim y As UInteger = v(0)
			Dim z As UInteger = v(1)
			Dim sum As UInteger = 0
			Dim delta As UInteger = 2654435769
			Dim n As UInteger = 32
			While n > 0
				y = Add(y, Add(z << 4 Xor z >> 5, z) Xor Add(sum, k(sum And 3)))
				sum = Add(sum, delta)
				z = Add(z, Add(y << 4 Xor y >> 5, y) Xor (Add(sum, k((sum >> 11) And 3))))
				n -= 1
			End While
			v(0) = y
			v(1) = z
    End Sub

    Private Shared Sub Decode(ByVal v As UInteger(), ByVal k As UInteger())
			Dim y As UInteger = v(0)
			Dim z As UInteger = v(1)
			Dim sum As UInteger = 3337565984
			Dim delta As UInteger = 2654435769
			Dim n As UInteger = 32
			While n > 0
				z = Minus(z, Add(y << 4 Xor y >> 5, y) Xor Add(sum, k(sum >> 11 And 3)))
				sum = Minus(sum, delta)
				y = Minus(y, Add(z << 4 Xor z >> 5, z) Xor Add(sum, k(sum And 3)))
				n -= 1
			End While
			v(0) = y
			v(1) = z
    End Sub

    Private Shared Function ConvertStringToUInt(ByVal Input As String) As UInteger
			Dim output As UInteger
			output = Convert.ToUInt32(Input(0))
			output += (Convert.ToUInt32(Input(1)) << 8)
			output += (Convert.ToUInt32(Input(2)) << 16)
			output += (Convert.ToUInt32(Input(3)) << 24)
			Return output
    End Function

    Private Shared Function ConvertUIntToString(ByVal Input As UInteger) As String
			Dim output As New StringBuilder()
			output.Append(Convert.ToChar(Input And 255))
			output.Append(Convert.ToChar((Input >> 8) And 255))
			output.Append(Convert.ToChar((Input >> 16) And 255))
			output.Append(Convert.ToChar((Input >> 24) And 255))
			Return output.ToString()
    End Function

    Private Shared Function UrlEncode(ByVal str As String) As String
			Dim encoding As New UnicodeEncoding()
			str = Convert.ToBase64String(encoding.GetBytes(str))
			str = str.Replace("+"c, "-"c)
			str = str.Replace("/"c, "_"c)
			str = str.Replace("="c, "."c)
			Return str
    End Function

    Private Shared Function UrlDecode(ByVal str As String) As String
			str = str.Replace("-"c, "+"c)
			str = str.Replace("_"c, "/"c)
			str = str.Replace("."c, "="c)
			Dim dataBytes As Byte() = Convert.FromBase64String(str)
			Dim encoding As New UnicodeEncoding()
			Return encoding.GetString(dataBytes)
    End Function
	End Class

	' Return path of the uploaded file
	'	Parameter: If PhyPath is true(1), return physical path on the server
	'	           If PhyPath is false(0), return relative URL
	Public Shared Function ew_UploadPathEx(ByVal PhyPath As Boolean, ByVal DestPath As String) As String
		Dim pos As Integer
		Dim Path As String
		If DestPath.StartsWith("~/") Then
			DestPath = DestPath.Substring(2)
		End If
		If PhyPath Then
			Path = HttpContext.Current.Request.ServerVariables("APPL_PHYSICAL_PATH")
			Path = ew_PathCombine(Path, DestPath.Replace("/", "\"), PhyPath)
		Else
			Path = ew_AppPath()
			Path = ew_PathCombine(Path, DestPath, PhyPath)
		End If
		Return ew_IncludeTrailingDelimiter(Path, PhyPath)
	End Function

	' Get application root path (relative to domain)
	Public Shared Function ew_AppPath() As String
		Dim Path As String = HttpContext.Current.Request.ServerVariables("APPL_MD_PATH")
		Dim pos As Integer = Path.IndexOf("Root", StringComparison.InvariantCultureIgnoreCase)
		If pos > 0 Then
			Path = Path.Substring(pos + 4)
		End If
		Return Path
	End Function

	' Get path relative to application root
	Public Shared Function ew_ServerMapPath(ByVal Path As String) As String
		Return ew_PathCombine(HttpContext.Current.Request.ServerVariables("APPL_PHYSICAL_PATH"), Path, True)
	End Function

	' Get path relative to a base path
	Public Shared Function ew_PathCombine(ByVal BasePath As String, ByVal RelPath As String, ByVal PhyPath As Boolean) As String
		Dim p2 As Integer
		Dim p1 As Integer
		Dim Path2 As String
		Dim Path As String
		Dim Delimiter As String
		BasePath = ew_RemoveTrailingDelimiter(BasePath, PhyPath)
		If PhyPath Then
			Delimiter = "\"
			RelPath = RelPath.Replace("/", "\")
		Else
			Delimiter = "/"
			RelPath = RelPath.Replace("\", "/")
		End If
		If RelPath = "." Or RelPath = ".." Then
			RelPath = RelPath + Delimiter
		End If
		p1 = RelPath.IndexOf(Delimiter)
		Path2 = ""
		While p1 > -1
			Path = RelPath.Substring(0, p1 + 1)

					' Skip
			If Path = Delimiter OrElse Path = "." + Delimiter Then
			ElseIf Path = ".." + Delimiter Then
				p2 = BasePath.LastIndexOf(Delimiter)
				If p2 > -1 Then
					BasePath = BasePath.Substring(0, p2)
				End If
			Else
				Path2 += Path
			End If
			RelPath = RelPath.Substring(p1 + 1)
			p1 = RelPath.IndexOf(Delimiter)
		End While
		Return ew_IncludeTrailingDelimiter(BasePath, PhyPath) + Path2 + RelPath
	End Function

	' Remove the last delimiter for a path
	Public Shared Function ew_RemoveTrailingDelimiter(ByVal Path As String, ByVal PhyPath As Boolean) As String
		Dim Delimiter As String
		If PhyPath Then
			Delimiter = "\"
		Else
			Delimiter = "/"
		End If
		While Path.EndsWith(Delimiter)
			Path = Path.Substring(0, Path.Length - 1)
		End While
		Return Path
	End Function

	' Include the last delimiter for a path
	Public Shared Function ew_IncludeTrailingDelimiter(ByVal Path As String, ByVal PhyPath As Boolean) As String
		Dim Delimiter As String
		Path = ew_RemoveTrailingDelimiter(Path, PhyPath)
		Delimiter = IIf(PhyPath, "\" , "/")
		Return Path + Delimiter
	End Function

	' Create folder
	Public Shared Function ew_CreateFolder(ByVal folder As String) As Boolean
		Try
			Dim di As DirectoryInfo = Directory.CreateDirectory(folder)
			Return (di IsNot Nothing)
		Catch
			Return False
		End Try
	End Function

	' Convert numeric value
	Public Shared Function ew_Conv(ByVal v As Object, ByVal t As Integer) As Object
		If Convert.IsDBNull(v) Then
			Return System.DBNull.Value
		End If
		Select Case t
			Case 20	' adBigInt
				Return Convert.ToInt64(v)
			Case 21	' adUnsignedBigInt
				Return Convert.ToUInt64(v)
			Case 2, 16 ' adSmallInt/adTinyInt
				Return Convert.ToInt16(v)
			Case 3 ' adInteger
				Return Convert.ToInt32(v)
			Case 17, 18	' adUnsignedTinyInt/adUnsignedSmallInt
				Return Convert.ToUInt16(v)
			Case 19	' adUnsignedInt
				Return Convert.ToUInt32(v)
			Case 4	' adSingle
				Return Convert.ToSingle(v)
			Case 5, 6, 131, 139	' adDouble/adCurrency/adNumeric/adVarNumeric
				Return Convert.ToDouble(v)
			Case Else
				Return v
		End Select
	End Function

	' Read global debug message
	Public Shared Function ew_DebugMsg() As String
		Return IIf(ew_NotEmpty(gsDebugMsg), "<p>" & gsDebugMsg & "</p>", "")
	End Function

	' Write global debug message
	Public Shared Sub ew_SetDebugMsg(ByVal v As String)
		If ew_NotEmpty(gsDebugMsg) Then
			gsDebugMsg &= "<br>"
		End If
		gsDebugMsg &= v
	End Sub

	' Encode value for double-quoted JavaScript string
	Public Shared Function ew_JsEncode2(ByVal val As Object) As String
		Dim outstr As String = Convert.ToString(val).Replace("\", "\\")
		outstr = outstr.Replace("""", "\""")
		outstr = outstr.Replace("" & Chr(13) & "" & Chr(10) & "", "<br>")
		outstr = outstr.Replace("" & Chr(13) & "", "<br>")
		outstr = outstr.Replace("" & Chr(10) & "", "<br>")
		Return outstr
	End Function

	' Display elapsed time (in seconds)
	Public Shared Function ew_CalcElapsedTime(tm As Long) As String
		Dim endTimer As Long = Environment.TickCount
		Return "<div>page processing time: " & ((endTimer-tm)/1000).ToString() & " seconds</div>"
	End Function

	' Get current page name
	Public Shared Function ew_CurrentPage() As String
		Return ew_GetPageName(HttpContext.Current.Request.ServerVariables("SCRIPT_NAME"))
	End Function

	' Get page name
	Public Shared Function ew_GetPageName(ByVal url As String) As String
		If url <> "" Then
			If url.Contains("?") Then

					' Remove querystring first
				url = url.Substring(0, url.LastIndexOf("?"))
			End If

				' Remove path
			Return url.Substring(url.LastIndexOf("/") + 1)
		Else
			Return ""
		End If
	End Function

	' Adjust text for caption
	Public Shared Function ew_BtnCaption(ByVal Caption As String) As String
		Dim Min As Integer = 10
		Dim Ln As Integer = Caption.Length
		If Ln < Min Then
			Dim Pad As Integer = Math.Abs(Convert.ToInt32((Min - Ln) / 2 * -1))
			Return Caption.PadLeft(Ln + Pad).PadRight(Ln + Pad * 2)
		Else
			Return Caption
		End If
	End Function

	' Get script name
	Public Shared Function ew_ScriptName() As String
		Dim sn As String = ew_ServerVar("SCRIPT_NAME")
		If ew_Empty(sn) Then
			sn = ew_ServerVar("PATH_INFO")
		End If
		If ew_Empty(sn) Then
			sn = ew_ServerVar("URL")
		End If
		If ew_Empty(sn) Then
			sn = "UNKNOWN"
		End If
		Return sn
	End Function

	' Get server variable by name
	Public Shared Function ew_ServerVar(ByVal Name As String) As String
		Dim str As String = HttpContext.Current.Request.ServerVariables(Name)
		If ew_Empty(str) Then
			str = ""
		End If
		Return str
	End Function

	' Get domain URL
	Public Shared Function ew_DomainUrl() As String
		Dim bSSL As Boolean = Not ew_SameText(HttpContext.Current.Request.ServerVariables("HTTPS"), "off") AndAlso Not ew_Empty(HttpContext.Current.Request.ServerVariables("HTTPS"))
		Dim sUrl As String = IIf(bSSL, "https", "http")
		Dim sPort As String = HttpContext.Current.Request.ServerVariables("SERVER_PORT")
		Dim defPort As String = IIf(bSSL, "443", "80")
		sPort = IIf(sPort = defPort, "", ":" + sPort)
		Return sUrl + "://" + HttpContext.Current.Request.ServerVariables("SERVER_NAME") + sPort
	End Function

	' Get full URL
	Public Shared Function ew_FullUrl() As String
		Return ew_DomainUrl() + HttpContext.Current.Request.ServerVariables("SCRIPT_NAME")
	End Function

	' Get current URL
	Public Shared Function ew_CurrentUrl() As String
		Dim s As String = HttpContext.Current.Request.ServerVariables("SCRIPT_NAME")
		Dim q As String = HttpContext.Current.Request.ServerVariables("QUERY_STRING")
		If q <> "" Then
			s += "?" + q
		End If
		Return s
	End Function

	' Convert to full URL
	Public Shared Function ew_ConvertFullUrl(ByVal url As String) As String
		If url = "" Then
			Return ""
		ElseIf url.Contains("://") Then
			Return url
		Else
			Dim sUrl As String = ew_FullUrl()
			Return sUrl.Substring(0, sUrl.LastIndexOf("/") + 1) + url
		End If
	End Function

	' Remove XSS
	Public Shared Function ew_RemoveXSS(val As Object) As Object		 
		Dim val_before As String, pattern As String, replacement As String

		' Handle null value
		If IsDBNull(val) Then Return val

		' Remove all non-printable characters. CR(0a) and LF(0b) and TAB(9) are allowed 
		' This prevents some character re-spacing such as <java\0script> 
		' Note that you have to handle splits with \n, \r, and \t later since they *are* allowed in some inputs

		Dim regEx As Regex = New Regex("([\x00-\x08][\x0b-\x0c][\x0e-\x20])", RegexOptions.IgnoreCase) ' Create regular expression.
		val = regEx.Replace(Convert.ToString(val), "")

		' Straight replacements, the user should never need these since they're normal characters 
		' This prevents like <IMG SRC=&#X40&#X61&#X76&#X61&#X73&#X63&#X72&#X69&#X70&#X74&#X3A&#X61&#X6C&#X65&#X72&#X74&#X28&#X27&#X58&#X53&#X53&#X27&#X29> 

		Dim search As String = "abcdefghijklmnopqrstuvwxyz"
		search = search & "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 
		search = search & "1234567890!@#$%^&*()" 
		search = search & "~`"";:?+/={}[]-_|'\"
		For i As Integer = 0 To search.Length - 1

			' ;? matches the ;, which is optional 
			' 0{0,7} matches any padded zeros, which are optional and go up to 8 chars	
			' &#x0040 @ search for the hex values

			regEx = New Regex("(&#[x|X]0{0,8}" & Hex(Asc(search(i))) & ";?)") ' With a ;
			val = regEx.Replace(val, search(i))

			' &#00064 @ 0{0,7} matches '0' zero to seven times
			regEx = New Regex("(&#0{0,8}" & Asc(search(i)) & ";?)") ' With a ;
			val = regEx.Replace(val, search(i))
		Next

		' Now the only remaining whitespace attacks are \t, \n, and \r	
		Dim Found As Boolean = True ' Keep replacing as long as the previous round replaced something 
		Do While Found
			val_before = val
			For i As Integer = 0 To EWRPT_REMOVE_XSS_KEYWORDS.GetUpperBound(0)
				pattern = ""
				For j As Integer = 0 To EWRPT_REMOVE_XSS_KEYWORDS(i).Length - 1
					If j > 0 Then
						pattern = pattern & "("
						pattern = pattern & "(&#[x|X]0{0,8}([9][a][b]);?)?"
						pattern = pattern & "|(&#0{0,8}([9][10][13]);?)?"
						pattern = pattern & ")?"
					End If
					pattern = pattern & EWRPT_REMOVE_XSS_KEYWORDS(i)(j)
				Next
				replacement = EWRPT_REMOVE_XSS_KEYWORDS(i).Substring(0, 2) & "<x>" & EWRPT_REMOVE_XSS_KEYWORDS(i).Substring(2) ' Add in <> to nerf the tag
				regEx = New Regex(pattern)
				val = regEx.Replace(val, replacement) ' Filter out the hex tags
				If val_before = val Then					
					Found = False ' No replacements were made, so exit the loop
				End If
			Next
		Loop
		Return val
	End Function

		' Get distinct values
		Public Function ewrpt_GetDistinctValues(ByVal FldOpr As String, ByVal sql As String) As ArrayList
			Dim wrkval As Object
			If sql = "" Then
				Return Nothing
			End If
			Dim ar As New ArrayList()
			Dim rswrk As ArrayList = Conn.GetRows(sql)
			If rswrk.Count > 0 Then
				ar.Add(ewrpt_ConvertValue(FldOpr, DirectCast(rswrk(0), OrderedDictionary)(0)))
				For Each Row As OrderedDictionary In rswrk
					wrkval = ewrpt_ConvertValue(FldOpr, Row(0))
					If Not ew_SameStr(wrkval, ar(ar.Count - 1)) Then
						ar.Add(wrkval)
					End If
				Next
				Return ar
			End If
			Return Nothing
		End Function

		' Convert value
		Public Function ewrpt_ConvertValue(ByVal FldOpr As String, ByVal val As Object) As Object
			If Convert.IsDBNull(val) Then
				Return EWRPT_NULL_VALUE
			ElseIf Convert.ToString(val) = "" Then
				Return EWRPT_EMPTY_VALUE
			End If
			If val.GetType().ToString() = "System.Double" Then
				val = Convert.ToDouble(val)
			End If
			Dim DT As DateTime
			Select Case FldOpr.ToLower()
				Case "year"
					Return Convert.ToDateTime(val).Year
				Case "quarter"
					DT = Convert.ToDateTime(val)
					Return DT.Year & "|" & ewrpt_DatePart(DateInterval.Quarter, DT)
				Case "month"
					DT = Convert.ToDateTime(val)
					Return DT.Year & "|" & DT.Month
				Case "day"
					DT = Convert.ToDateTime(val)
					Return DT.Year & "|" & DT.Month & "|" & DT.Day
				Case "date"
					DT = Convert.ToDateTime(val)
					Return DT.Year & "/" & DT.Month & "/" & DT.Day
			End Select
			Return val
		End Function

		' Dropdown display values
		Public Function ewrpt_DropDownDisplayValue(ByVal v As Object, ByVal t As String, ByVal fmt As Integer) As Object
			If Convert.ToString(v) = EWRPT_NULL_VALUE Then
				Return ReportLanguage.Phrase("NullLabel")
			ElseIf Convert.ToString(v) = EWRPT_EMPTY_VALUE Then
				Return ReportLanguage.Phrase("EmptyLabel")
			ElseIf ew_SameText(t, "boolean") Then
				Return ewrpt_BooleanName(v)
			End If
			Dim ar As String() = Convert.ToString(v).Split(New Char() {"|"C})
			Select Case t.ToLower()
				Case "year"
					Return v
				Case "quarter"
					If ar.GetUpperBound(0) >= 1 Then
						Return ewrpt_QuarterName(ar(1)) & " " & ar(0)
					End If
					Exit Select
				Case "month"
					If ar.GetUpperBound(0) >= 1 Then
						Return ewrpt_MonthName(ar(1)) & " " & ar(0)
					End If
					Exit Select
				Case "day"
					If ar.GetUpperBound(0) >= 2 Then
						Return ew_FormatDateTime(Convert.ToDateTime(ar(0) & "/" & ar(1) & "/" & ar(2)), fmt)
					End If
					Exit Select
				Case "date"
					If ewrpt_IsDate(v) Then
						Return ew_FormatDateTime(v, fmt)
					End If
					Exit Select
			End Select
			Return v
		End Function

		' Get Boolean Value
		Public Function ewrpt_BooleanValue(ByVal v As Object) As String
			If ew_SameText(v, "true") OrElse ew_SameText(v, "yes") OrElse ew_SameText(v, "t") OrElse ew_SameText(v, "y") OrElse ew_SameText(v, "1") Then
				Return EWRPT_BOOLEAN_YES
			Else
				Return EWRPT_BOOLEAN_NO
			End If
		End Function

		' Get Boolean Name
		' - Treat "True" / "Yes" / "1" As True
		Public Function ewrpt_BooleanName(ByVal v As Object) As String
			If Convert.IsDBNull(v) Then
				Return ReportLanguage.Phrase("NullLabel")
			ElseIf ew_SameText(v, "true") OrElse ew_SameText(v, "yes") OrElse ew_SameText(v, "t") OrElse ew_SameText(v, "y") OrElse ew_SameText(v, "1") Then
				Return ReportLanguage.Phrase("BooleanYes")
			Else
				Return ReportLanguage.Phrase("BooleanNo")
			End If
		End Function

		' Quarter name
		Public Function ewrpt_QuarterName(ByVal q As Object) As String
			Select Case Convert.ToInt32(q)
				Case 1
					Return ReportLanguage.Phrase("Qtr1")
				Case 2
					Return ReportLanguage.Phrase("Qtr2")
				Case 3
					Return ReportLanguage.Phrase("Qtr3")
				Case 4
					Return ReportLanguage.Phrase("Qtr4")
			End Select
			Return ""
		End Function

		' Month name
		Public Function ewrpt_MonthName(ByVal m As Object) As String
			Select Case Convert.ToInt32(m)
				Case 1
					Return ReportLanguage.Phrase("MonthJan")
				Case 2
					Return ReportLanguage.Phrase("MonthFeb")
				Case 3
					Return ReportLanguage.Phrase("MonthMar")
				Case 4
					Return ReportLanguage.Phrase("MonthApr")
				Case 5
					Return ReportLanguage.Phrase("MonthMay")
				Case 6
					Return ReportLanguage.Phrase("MonthJun")
				Case 7
					Return ReportLanguage.Phrase("MonthJul")
				Case 8
					Return ReportLanguage.Phrase("MonthAug")
				Case 9
					Return ReportLanguage.Phrase("MonthSep")
				Case 10
					Return ReportLanguage.Phrase("MonthOct")
				Case 11
					Return ReportLanguage.Phrase("MonthNov")
				Case 12
					Return ReportLanguage.Phrase("MonthDec")
			End Select
			Return ""
		End Function

		' Join array
		Public Shared Function ewrpt_JoinArray(ByVal ar As Object, ByVal sep As String, ByVal ft As Integer, ByVal pos As Integer) As String
			If Not ewrpt_IsArray(ar) AndAlso Not ew_IsArrayList(ar) Then
				Return ""
			End If
			Dim str As String = ""
			Dim arwrk() As Object = Nothing
			If ew_IsArrayList(ar) Then
				arwrk = (CType(ar, ArrayList)).ToArray()
			Else If ewrpt_IsArray(ar) Then
				arwrk = CType(ar, Object())
			End If
			Dim arwrkcnt As Integer = arwrk.Length
			For i As Integer = pos To arwrkcnt - 1
				If str <> "" Then
					str &= ", "
				End If
				str &= ew_QuotedValue(arwrk(i), ft)
			Next
			Return str
		End Function

		' Join array
		Public Shared Function ewrpt_JoinArray(ByVal ar As Object, ByVal sep As String, ByVal ft As Integer) As String
			Return ewrpt_JoinArray(ar, sep, ft, 0)
		End Function

		' Build Report SQL
		Public Shared Function ewrpt_BuildReportSql(ByVal sSelect As String, ByVal sWhere As String, ByVal sGroupBy As String, ByVal sHaving As String, ByVal sOrderBy As String, ByVal sFilter As String, _
			ByVal sSort As String) As String
			Dim sDbWhere As String = sWhere
			If ew_NotEmpty(sDbWhere) Then
				sDbWhere = "(" & sDbWhere & ")"
			End If
			If ew_NotEmpty(sFilter) Then
				If ew_NotEmpty(sDbWhere) Then
					sDbWhere = sDbWhere & " AND "
				End If
				sDbWhere = sDbWhere & "(" & sFilter & ")"
			End If
			Dim sDbOrderBy As String = ewrpt_UpdateSortFields(sOrderBy, sSort, 1)
			Dim sSql As String = sSelect
			If ew_NotEmpty(sDbWhere) Then
				sSql = sSql & " WHERE " & sDbWhere
			End If
			If ew_NotEmpty(sGroupBy) Then
				sSql = sSql & " GROUP BY " & sGroupBy
			End If
			If ew_NotEmpty(sHaving) Then
				sSql = sSql & " HAVING " & sHaving
			End If
			If ew_NotEmpty(sDbOrderBy) Then
				sSql = sSql & " ORDER BY " & sDbOrderBy
			End If
			Return sSql
		End Function

		' Update sort fields
		Public Shared Function ewrpt_UpdateSortFields(ByVal sOrderBy As String, ByVal sSort As String, ByVal opt As Integer) As String
			If ew_Empty(sOrderBy) Then
				Return IIf(opt = 1, sSort, "")
			ElseIf ew_Empty(sSort) Then
				Return sOrderBy
			Else

				' Merge sort field list
				Dim arorderby As ArrayList = ewrpt_GetSortFlds(sOrderBy)
				Dim cntorderby As Integer = arorderby.Count
				Dim arsort As ArrayList = ewrpt_GetSortFlds(sSort)
				Dim cntsort As Integer = arsort.Count
				For i As Integer = 0 To cntsort - 1

					' Get sort field				
					Dim sortfld As String = Convert.ToString(arsort(i)).Trim()
					If sortfld.ToUpper().EndsWith(" ASC") Then
						sortfld = sortfld.Substring(0, sortfld.Length - 4).Trim()
					ElseIf sortfld.ToUpper().EndsWith(" DESC") Then
						sortfld = sortfld.Substring(0, sortfld.Length - 4).Trim()
					End If
					Dim orderfld As String = ""
					For j As Integer = 0 To cntorderby - 1

						' Get orderby field
						orderfld = Convert.ToString(arorderby(j)).Trim()
						If orderfld.ToUpper().EndsWith(" ASC") Then
							orderfld = orderfld.Substring(0, orderfld.Length - 4).Trim()
						ElseIf orderfld.ToUpper().EndsWith(" DESC") Then
							orderfld = orderfld.Substring(0, orderfld.Length - 4).Trim()
						End If

						' Replace field
						If ew_SameStr(orderfld, sortfld) Then
							arorderby(j) = arsort(i)
							Exit For
						End If
					Next

					' Append field
					If opt = 1 AndAlso Not ew_SameStr(orderfld, sortfld) Then
						arorderby.Add(arsort(i))
					End If
				Next
				Return String.Join(", ", DirectCast(arorderby.ToArray(GetType(String)), String()))
			End If
		End Function

		' Get sort fields
		Public Shared Function ewrpt_GetSortFlds(ByVal flds As String) As ArrayList
			Dim offset As Integer = -1
			Dim fldpos As Integer = 0
			Dim orderfld As String
			Dim ar As New ArrayList()
			offset = flds.IndexOf(",", offset + 1)
			While offset > -1
				orderfld = flds.Substring(fldpos, offset - fldpos)
				If orderfld.ToUpper().EndsWith(" ASC") OrElse orderfld.ToUpper().EndsWith(" DESC") Then
					fldpos = offset + 1
					ar.Add(orderfld)
				End If
				offset = flds.IndexOf(",", offset + 1)
			End While
			ar.Add(flds.Substring(fldpos))
			Return ar
		End Function

		' Get reverse sort
		Public Shared Function ewrpt_ReverseSort(ByVal sorttype As Object) As String
			Return IIf(ew_SameText(sorttype, "ASC"), "DESC", "ASC")
		End Function

		' Construct a crosstab field name
		Public Shared Function ewrpt_CrossTabField(ByVal smrytype As String, ByVal smryfld As Object, ByVal colfld As Object, ByVal datetype As String, ByVal val As Object, ByVal qc As Object, ByVal analias As String) As String
			Dim ReturnValue As String = ""
			Dim wrkval As String
			Dim wrkqc As String
			If ew_SameStr(val, EWRPT_NULL_VALUE) Then
				wrkval = "NULL"
				wrkqc = ""
			ElseIf ew_SameStr(val, EWRPT_EMPTY_VALUE) Then
				wrkval = ""
				wrkqc = Convert.ToString(qc)
			Else
				wrkval = Convert.ToString(val)
				wrkqc = Convert.ToString(qc)
			End If
			Select Case smrytype
				Case "SUM"
					ReturnValue = smrytype & "(" & smryfld & "*" & ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
					Exit Select
				Case "COUNT"
					ReturnValue = "SUM(" & ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
					Exit Select
				Case "MIN", "MAX"
					Dim aggwrk As String = ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc)
					If EWRPT_IS_MSACCESS Then
						ReturnValue = smrytype & "(IIf(" & aggwrk & "=0,NULL," & smryfld & "))"
					ElseIf EWRPT_IS_MSSQL OrElse EWRPT_IS_ORACLE Then
						ReturnValue = smrytype & "(CASE " & aggwrk & " WHEN 0 THEN NULL ELSE " & smryfld & " END)"
					ElseIf EWRPT_IS_MYSQL Then
						ReturnValue = smrytype & "(IF(" & aggwrk & "=0,NULL," & smryfld & "))"
					End If
					Exit Select
				Case "AVG"
					Dim sumwrk As String = "SUM(" & smryfld & "*" & ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
					If ew_NotEmpty(analias) Then
						sumwrk &= " AS SUM_" & analias
					End If
					Dim cntwrk As String = "SUM(" & ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
					If ew_NotEmpty(analias) Then
						cntwrk &= " AS CNT_" & analias
					End If
					Return sumwrk & ", " & cntwrk
					Exit Select
			End Select
			If ew_NotEmpty(analias) Then
				ReturnValue &= " AS " & analias
			End If
			Return ReturnValue
		End Function

		' Construct a crosstab field name
		Public Shared Function ewrpt_CrossTabField(ByVal smrytype As String, ByVal smryfld As Object, ByVal colfld As Object, ByVal datetype As String, ByVal val As Object, ByVal qc As Object) As String
			Return ewrpt_CrossTabField(smrytype, smryfld, colfld, datetype, val, qc, "")
		End Function

		' Construct SQL Distinct factor
		' - ACCESS
		' y: IIf(Year(FieldName)=1996,1,0)
		' q: IIf(DatePart(""q"",FieldName,1,0)=1,1,0))
		' m: (IIf(DatePart(""m"",FieldName,1,0)=1,1,0)))
		' others: (IIf(FieldName=val,1,0)))
		' - MS SQL
		' y: (1-ABS(SIGN(Year(FieldName)-1996)))
		' q: (1-ABS(SIGN(DatePart(q,FieldName)-1)))
		' m: (1-ABS(SIGN(DatePart(m,FieldName)-1)))
		' d: (CASE Convert(VarChar(10),FieldName,111) WHEN ' 1996/1/1'  THEN 1 ELSE 0 END)
		' - MySQL
		' y: IF(YEAR(OrderDate)=1996,1,0))
		' q: IF(QUARTER(OrderDate)=1,1,0))
		' m: IF(MONTH(OrderDate)=1,1,0))
		Public Shared Function ewrpt_SQLDistinctFactor(ByVal sFld As Object, ByVal dateType As String, ByVal val As String, ByVal qc As String) As String
			Dim ReturnValue As String = ""
			If EWRPT_IS_MSACCESS Then
				If dateType = "y" AndAlso IsNumeric(val) Then
					ReturnValue = "IIf(Year(" & sFld & ")=" & val & ",1,0)"
				ElseIf (dateType = "q" OrElse dateType = "m") AndAlso IsNumeric(val) Then
					ReturnValue = "IIf(DatePart(""" & dateType & """," & sFld & ",1,0)=" & val & ",1,0)"
				Else
					If val = "NULL" Then
						ReturnValue = "IIf(" & sFld & " IS NULL,1,0)"
					Else
						ReturnValue = "IIf(" & sFld & "=" & qc & ew_AdjustSql(val) & qc & ",1,0)"
					End If
				End If
			ElseIf EWRPT_IS_MSSQL Then
				If dateType = "y" AndAlso IsNumeric(val) Then
					ReturnValue = "(1-ABS(SIGN(Year(" & sFld & ")-" & val & ")))"
				ElseIf (dateType = "q" OrElse dateType = "m") AndAlso IsNumeric(val) Then
					ReturnValue = "(1-ABS(SIGN(DatePart(" & dateType & "," & sFld & ")-" & val & ")))"
				ElseIf dateType = "d" Then
					ReturnValue = "(CASE Convert(VarChar(10)," & sFld & ",111) WHEN " & qc & ew_AdjustSql(val) & qc & " THEN 1 ELSE 0 END)"
				ElseIf dateType = "dt" Then
					ReturnValue = "(CASE Convert(VarChar(10)," & sFld & ",120) WHEN " & qc & ew_AdjustSql(val) & qc & " THEN 1 ELSE 0 END)"
				Else
					If val = "NULL" Then
						ReturnValue = "(CASE WHEN " & sFld & " IS NULL THEN 1 ELSE 0 END)"
					Else
						ReturnValue = "(CASE " & sFld & " WHEN " & qc & ew_AdjustSql(val) & qc & " THEN 1 ELSE 0 END)"
					End If
				End If
			ElseIf EWRPT_IS_MYSQL Then
				If dateType = "y" AndAlso IsNumeric(val) Then
					ReturnValue = "IF(YEAR(" & sFld & ")=" & val & ",1,0)"
				ElseIf dateType = "q" AndAlso IsNumeric(val) Then
					ReturnValue = "IF(QUARTER(" & sFld & ")=" & val & ",1,0)"
				ElseIf dateType = "m" AndAlso IsNumeric(val) Then
					ReturnValue = "IF(MONTH(" & sFld & ")=" & val & ",1,0)"
				Else
					If val = "NULL" Then
						ReturnValue = "IF(" & sFld & " IS NULL,1,0)"
					Else
						ReturnValue = "IF(" & sFld & "=" & qc & ew_AdjustSql(val) & qc & ",1,0)"
					End If
				End If
			ElseIf EWRPT_IS_POSTGRESQL Then
				If dateType = "y" AndAlso IsNumeric(val) Then
					ReturnValue = "CASE WHEN EXTRACT(YEAR FROM " & sFld & ")=" & val & " THEN 1 ELSE 0 END"
				ElseIf dateType = "q" AndAlso IsNumeric(val) Then
					ReturnValue = "CASE WHEN EXTRACT(QUARTER FROM " & sFld & ")=" & val & " THEN 1 ELSE 0 END"
				ElseIf dateType = "m" AndAlso IsNumeric(val) Then
					ReturnValue = "CASE WHEN EXTRACT(MONTH FROM " & sFld & ")=" & val & " THEN 1 ELSE 0 END"
				Else
					If val = "NULL" Then
						ReturnValue = "CASE WHEN " & sFld & " IS NULL THEN 1 ELSE 0 END"
					Else
						ReturnValue = "CASE WHEN " & sFld & "=" & qc & ew_AdjustSql(val) & qc & " THEN 1 ELSE 0 END"
					End If
				End If
			ElseIf EWRPT_IS_ORACLE Then
				If dateType = "y" AndAlso IsNumeric(val) Then
					ReturnValue = "DECODE(TO_CHAR(" & sFld & ",'YYYY'),'" & val & "',1,0)"
				ElseIf dateType = "q" AndAlso IsNumeric(val) Then
					ReturnValue = "DECODE(TO_CHAR(" & sFld & ",'Q'),'" & val & "',1,0)"
				ElseIf dateType = "m" AndAlso IsNumeric(val) Then
					ReturnValue = "DECODE(TO_CHAR(" & sFld & ",'MM'),LPAD('" & val & "',2,'0'),1,0)"
				ElseIf dateType = "d" Then
					ReturnValue = "DECODE(" & sFld & ",TO_DATE(" & qc & ew_AdjustSql(val) & qc & ",'YYYY/MM/DD'),1,0)"
				ElseIf dateType = "dt" Then
					ReturnValue = "DECODE(" & sFld & ",TO_DATE(" & qc & ew_AdjustSql(val) & qc & ",'YYYY/MM/DD HH24:MI:SS'),1,0)"
				Else
					If val = "NULL" Then
						ReturnValue = "(CASE WHEN " & sFld & " IS NULL THEN 1 ELSE 0 END)"
					Else
						ReturnValue = "DECODE(" & sFld & "," & qc & ew_AdjustSql(val) & qc & ",1,0)"
					End If
				End If
			End If
			Return ReturnValue
		End Function

		' Evaluate summary value
		Public Shared Function ewrpt_SummaryValue(ByVal val1 As Object, ByVal val2 As Object, ByVal ityp As String) As Object
			Select Case ityp
				Case "SUM", "COUNT", "AVG"
					If Convert.IsDBNull(val2) OrElse Not ewrpt_IsNumeric(val2) Then
						Return val1
					Else
						Return ew_ConvertToDouble(val1) + ew_ConvertToDouble(val2)
					End If
					Exit Select
				Case "MIN"
					If Convert.IsDBNull(val2) OrElse Not ewrpt_IsNumeric(val2) Then ' Skip null and non-numeric
						Return val1
					ElseIf val1 Is Nothing Then ' Initialize for first valid value
						Return val2
					ElseIf ew_ConvertToDouble(val1) < ew_ConvertToDouble(val2) Then
						Return val1
					Else
						Return val2
					End If
					Exit Select
				Case "MAX"
					If Convert.IsDBNull(val2) OrElse Not ewrpt_IsNumeric(val2) Then	' Skip null and non-numeric
						Return val1
					ElseIf val1 Is Nothing Then ' Initialize for first valid value
						Return val2
					ElseIf ew_ConvertToDouble(val1) > ew_ConvertToDouble(val2) Then
						Return val1
					Else
						Return val2
					End If
					Exit Select
			End Select
			Return Nothing
		End Function

		' Match filter value
		Public Function ewrpt_MatchedFilterValue(ByVal ar As Object, ByVal value As Object) As Boolean
			If Not ewrpt_IsArray(ar) Then
				Return ew_SameStr(ar, value)
			Else
				For Each val As Object In DirectCast(ar, String())
					If ew_SameStr(val, value) Then
						Return True
					End If
				Next
				Return False
			End If
		End Function

		' Render repeat column table
		' rowcnt - zero based row count
		Public Function ewrpt_RepeatColumnTable(ByVal totcnt As Integer, ByVal rowcnt As Integer, ByVal repeatcnt As Integer, ByVal rendertype As Integer) As String
			Dim sWrk As String = ""
			If rendertype = 1 Then ' Render control start
				If rowcnt = 0 Then
					sWrk &= "<table class=""" & EWRPT_ITEM_TABLE_CLASSNAME & """>"
				End If
				If rowcnt Mod repeatcnt = 0 Then
					sWrk &= "<tr>"
				End If
				sWrk &= "<td>"
			ElseIf rendertype = 2 Then ' Render control end
				sWrk &= "</td>"
				If rowcnt Mod repeatcnt = repeatcnt - 1 Then
					sWrk &= "</tr>"
				ElseIf rowcnt = totcnt - 1 Then
					For i As Integer = (rowcnt Mod repeatcnt) + 1 To repeatcnt - 1
						sWrk &= "<td>&nbsp;</td>"
					Next
					sWrk &= "</tr>"
				End If
				If rowcnt = totcnt - 1 Then
					sWrk &= "</table>"
				End If
			End If
			Return sWrk
		End Function

		' Check if the value is selected
		' sName: popup name
		' value: supplied value
		Public Function ewrpt_IsSelectedValue(ByVal ar As Object(), ByVal value As Object, ByVal ft As Integer) As Boolean
			If ar IsNot Nothing AndAlso ar.Length > 0 Then
				For Each val As Object In ar
					If Convert.ToString(value).StartsWith("@@") OrElse Convert.ToString(val).StartsWith("@@") Then	' Popup filters			
						If ew_SameStr(val, value) Then
							Return True
						End If
					ElseIf ewrpt_CompareValue(val, value, ft) Then
						Return True
					End If
				Next
			Else
				Return True
			End If
			Return False
		End Function

		Public Shared Sub ewrpt_SetupDistinctValues(ByRef ar As OrderedDictionary, ByVal val As Object, ByVal label As Object, ByVal dup As Boolean)
			If dup AndAlso ar IsNot Nothing AndAlso ar.Contains(val) Then
				Return
			End If
			If ar Is Nothing Then
				ar = New OrderedDictionary()
			End If
			If ew_SameStr(val, EWRPT_EMPTY_VALUE) OrElse ew_SameStr(val, EWRPT_NULL_VALUE) Then	' Null/Empty
				ar.Insert(0, val, label)
			Else	' Default insert at end
				ar.Add(val, label)
			End If
		End Sub

		' Compare values based on field type
		Public Shared Function ewrpt_CompareValue(ByVal v1 As Object, ByVal v2 As Object, ByVal ft As Integer) As Boolean
			Select Case ft
				Case 20, 3, 2, 16, 17, 18, 19, 21 ' adBigInt, adInteger, adSmallInt, adTinyInt, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt
					If ewrpt_IsNumeric(v1) AndAlso ewrpt_IsNumeric(v2) Then
						Return (ew_ConvertToInt(v1) = ew_ConvertToInt(v2))
					End If
					Exit Select
				Case 4, 5, 131, 6 ' adSingle, adDouble, adNumeric, adCurrency
					If ewrpt_IsNumeric(v1) AndAlso ewrpt_IsNumeric(v2) Then
						Return (ew_ConvertToDouble(v1) = ew_ConvertToDouble(v2))
					End If
					Exit Select
				Case 7, 133, 134, 135 ' adDate, adDBDate, adDBTime, adDBTimeStamp
					If ewrpt_IsDate(v1) AndAlso ewrpt_IsDate(v2) Then
						Return (Convert.ToDateTime(v1) = Convert.ToDateTime(v2))
					End If
					Exit Select
				Case 11
					Return (ew_ConvertToBool(v1) = ew_ConvertToBool(v2))
			End Select
			Return (Convert.ToString(v1) = Convert.ToString(v2)) ' Treat as string
		End Function

		' Set up distinct values from ext. filter
		Public Shared Sub ewrpt_SetupDistinctValuesFromFilter(ByRef ar As OrderedDictionary, ByRef af As ArrayList)
			If af IsNot Nothing Then
				For Each afwrk As Object() In af
					ewrpt_SetupDistinctValues(ar, afwrk(0), afwrk(1), False)
				Next
			End If
		End Sub

		' Get group value
		' - Get the group value based on field type, group type and interval
		' - ft: field type
		' * 1: numeric, 2: date, 3: string
		' - gt: group type
		' * numeric: i = interval, n = normal
		' * date: d = Day, w = Week, m = Month, q = Quarter, y = Year
		' * string: f = first nth character, n = normal
		' - intv: interval
		Public Shared Function ewrpt_GroupValue(fld As crField, val As Object) As Object
			Dim ft As Integer = fld.FldType
			Dim grp As String = fld.FldGroupByType
			Dim intv As String = fld.FldGroupInt
			Dim ww As Integer
			Dim q As Integer
			Dim wrkIntv As Integer
			Select Case ft
				Case 20, 3, 2, 16, 4, 5, 131, 6, 17, 18, 19, 21 ' adBigInt, adInteger, adSmallInt, adTinyInt, adSingle, adDouble, adNumeric, adCurrency, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt (Numeric)
					If Not ewrpt_IsNumeric(val) Then
						Return val
					End If
					wrkIntv = Convert.ToInt32(intv)
					If wrkIntv <= 0 Then
						wrkIntv = 10
					End If
					Select Case grp
						Case "i"
							Return Convert.ToInt32(Convert.ToDouble(val) / wrkIntv)
						Case Else
							Return val
					End Select
				Case 7, 133, 134, 135 ' adDate, adDBDate, adDBTime, adDBTimeStamp (Date)
					If Not ewrpt_IsDate(val) Then
						Return val
					End If
					Dim DT As DateTime = Convert.ToDateTime(val)
					Select Case grp
						Case "y"
							Return DT.Year
						Case "q"
							q = ewrpt_DatePart(DateInterval.Quarter, DT)
							Return DT.Year & "|" & q
						Case "m"
							Return DT.Year & "|" & ewrpt_ZeroPad(DT.Month, 2)
						Case "w"
							ww = ewrpt_DatePart(DateInterval.WeekOfYear, Convert.ToDateTime(val))
							Return DT.Year & "|" & ewrpt_ZeroPad(ww, 2)
						Case "d"
							Return DT.Year & "|" & ewrpt_ZeroPad(DT.Month, 2) & "|" & ewrpt_ZeroPad(DT.Day, 2)
						Case "h"
							Return DT.Hour
						Case "min"
							Return DT.Minute
						Case Else
							Return val
					End Select
				Case 201, 203, 129, 130, 200, 202 ' adLongVarChar, adLongVarWChar, adChar, adWChar, adVarChar, adVarWChar (String)
					wrkIntv = Convert.ToInt32(intv)
					If wrkIntv <= 0 Then
						wrkIntv = 1
					End If
					Select Case grp
						Case "f"
							Dim wrkstr As String = Convert.ToString(val)
							Return wrkstr.Substring(0, Math.Min(wrkIntv, wrkstr.Length))
						Case Else
							Return val
					End Select
				Case Else
					Return val
			End Select
		End Function

		' Display group value
		Public Function ewrpt_DisplayGroupValue(fld As crField, val As Object) As String
			Dim ft As Integer = fld.FldType
			Dim grp As String = fld.FldGroupByType
			Dim intv As String = fld.FldGroupInt
			If Convert.IsDBNull(val) Then Return ReportLanguage.Phrase("NullLabel")
			If ew_Empty(val) Then Return ReportLanguage.Phrase("EmptyLabel")
			Dim ar As String()
			Dim wrkIntv As Integer
			Select Case ft
				Case 20, 3, 2, 16, 4, 5, 131, 6, 17, 18, 19, 21 ' adBigInt, adInteger, adSmallInt, adTinyInt, adSingle, adDouble, adNumeric, adCurrency, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt (Numeric)
					wrkIntv = Convert.ToInt32(intv)
					If wrkIntv <= 0 Then
						wrkIntv = 10
					End If
					Select Case grp
						Case "i"
							Return Convert.ToString(Convert.ToDouble(val) * wrkIntv) & " - " & Convert.ToString((Convert.ToDouble(val) + 1) * wrkIntv - 1)
						Case Else
							Return Convert.ToString(val)
					End Select
				Case 7, 133, 134, 135 ' adDate, adDBDate, adDBTime, adDBTimeStamp (Date)
					ar = Convert.ToString(val).Split(New Char() {"|"C})
					Select Case grp
						Case "y"
							Return ar(0)
						Case "q"
							If ar.Length < 2 Then Return Convert.ToString(val)
							Return ewrpt_FormatQuarter(ar(0), ar(1))
						Case "m"
							If ar.Length < 2 Then Return Convert.ToString(val)
							Return ewrpt_FormatMonth(ar(0), ar(1))
						Case "w"
							If ar.Length < 2 Then Return Convert.ToString(val)
							Return ewrpt_FormatWeek(ar(0), ar(1))
						Case "d"
							If ar.Length < 2 Then Return Convert.ToString(val)
							Return ewrpt_FormatDay(ar(0), ar(1), ar(2))
						Case "h"
							Return ewrpt_FormatHour(ar(0))
						Case "min"
							Return ewrpt_FormatMinute(ar(0))
						Case Else
							Return Convert.ToString(val)
					End Select
				Case 201, 203, 129, 130, 200, 202 ' adLongVarChar, adLongVarWChar, adChar, adWChar, adVarChar, adVarWChar (String)
					Return Convert.ToString(val)
				Case Else
					Return Convert.ToString(val)
			End Select
		End Function

		Public Function ewrpt_FormatQuarter(ByVal y As Object, ByVal q As Object) As String
			Return "Q" & q & "/" & y
		End Function

		Public Function ewrpt_FormatMonth(ByVal y As Object, ByVal m As Object) As String
			Return m & "/" & y
		End Function

		Public Function ewrpt_FormatWeek(ByVal y As Object, ByVal w As Object) As String
			Return "WK" & w & "/" & y
		End Function

		Public Function ewrpt_FormatDay(ByVal y As Object, ByVal m As Object, ByVal d As Object) As String
			Return y & "/" & m & "/" & d
		End Function

		Public Function ewrpt_FormatHour(ByVal h As Object) As String
			Dim ReturnValue As String = ""
			If Convert.ToInt32(h) = 0 Then
				ReturnValue = "12 AM"
			ElseIf Convert.ToInt32(h) < 12 Then
				ReturnValue = h & " AM"
			ElseIf Convert.ToInt32(h) = 12 Then
				ReturnValue = "12 PM"
			Else
				ReturnValue = (Convert.ToInt32(h) - 12) & " PM"
			End If
			Return ReturnValue
		End Function

		Public Function ewrpt_FormatMinute(ByVal n As Object) As String
			Return Convert.ToString(n) & " MIN"
		End Function

		' Pad zeros before number
		' - m: number
		' - t: length
		Public Shared Function ewrpt_ZeroPad(ByVal m As Integer, ByVal t As Integer) As String
			Return Convert.ToString(m).PadLeft(t, "0"C)
		End Function

		' Get JavaScript data in the form of:
		' - [value1, text1, selected], [value2, text2, selected] ...
		' - value1: "value 1", text1: "text 1": selected: true|false
		' name: popup name
		' list: comma separated list
		Public Function ewrpt_GetJsData(ByVal fld As crField, ByVal ft As Integer) As String
			Dim value As Object, label As Object
			Dim jsselect As String
			Dim bSelected As Boolean
			Dim jsdata As String = ""
			Dim arv As OrderedDictionary = fld.ValueList
			Dim ars As String() = fld.SelectionList
			For Each d As DictionaryEntry In arv
				jsselect = IIf((ewrpt_IsSelectedValue(ars, d.Key, ft)),"true","false")
				If jsdata <> "" Then
					jsdata += ", "
				End If
				jsdata += "[""" + ewrpt_EscapeJs(d.Key) + """, """ + ewrpt_EscapeJs(d.Value) + """, " + jsselect + "]"
			Next
			Return jsdata
		End Function

		' Return detail filter SQL
		Public Shared Function ewrpt_DetailFilterSQL(ByVal fld As crField, ByVal fn As String, ByVal val As Object) As String
			Dim ft As Integer = fld.FldDataType
			If ew_NotEmpty(fld.FldGroupSql) Then
				ft = EWRPT_DATATYPE_STRING
			End If
			Dim sqlwrk As String = fn
			If Convert.IsDBNull(val) Then
				sqlwrk += " IS NULL"
			Else
				sqlwrk += " = " + ew_QuotedValue(val, ft)
			End If
			Return sqlwrk
		End Function

		' Return popup filter SQL
		Public Shared Function ewrpt_FilterSQL(ByVal fld As crField, ByVal fn As String, ByVal ft As Integer) As String
			Dim ar As String() = fld.SelectionList
			Dim af As ArrayList = fld.AdvancedFilters
			Dim gt As String = fld.FldGroupByType
			Dim gi As String = fld.FldGroupInt
			Dim sql As String = fld.FldGroupSql
			Dim sqlwrk As String = ""
			If ewrpt_IsArray(ar) Then
				For i As Integer = 0 To ar.Length - 1
					Dim value As String = ar(i)
					If ew_SameStr(value, EWRPT_EMPTY_VALUE) Then	' Empty string
						sqlwrk += fn + " = '' OR "
					ElseIf ew_SameStr(value, EWRPT_NULL_VALUE) Then	' Null value
						sqlwrk += fn + " IS NULL OR "
					ElseIf value.StartsWith("@@") Then ' Advanced filter
						If ew_IsArrayList(af) Then
							Dim afsql As Object = ewrpt_AdvancedFilterSQL(af, value)	' Process popup filter
							If afsql IsNot Nothing Then
								sqlwrk += Convert.ToString(afsql).Replace("@@fld@@", fn) + " OR "
							End If
						End If
					ElseIf ew_NotEmpty(sql) Then
						sqlwrk += sql.Replace("%s", fn) + " = '" + value + "' OR "
					Else
						sqlwrk += fn + " IN (" + ewrpt_JoinArray(ar, ", ", ft, i) + ") OR "
						Exit For
					End If
				Next
			End If
			If ew_NotEmpty(sqlwrk) Then
				sqlwrk = "(" + sqlwrk.Substring(0, sqlwrk.Length - 4) + ")"
			End If
			Return sqlwrk
		End Function

		' Return Advanced Filter SQL
		Public Shared Function ewrpt_AdvancedFilterSQL(ByRef ar As ArrayList, ByVal val As Object) As Object
			If Not ew_IsArrayList(ar) Then
				Return Nothing
			ElseIf Convert.IsDBNull(val) Then
				Return Nothing
			Else
				For Each arwrk As String() In ar
					If ew_SameStr(val, arwrk(0)) Then
						Return arwrk(2)
					End If
				Next
				Return Nothing
			End If
		End Function

		' Escape object for JavaScript
		Public Shared Function ewrpt_EscapeJs(ByVal str As Object) As String
			Dim val As String = Convert.ToString(str)
			val = val.Replace("\", "\\")
			val = val.Replace("""", "\""")
			val = val.Replace("" & Chr(13) & "", "\r")
			val = val.Replace("" & Chr(10) & "", "\n")
			Return val
		End Function

		' Load Chart Series
		Public Sub ewrpt_LoadChartSeries(ByVal sSql As String, ByRef cht As crChart)
			Dim rscht As ArrayList = Conn.GetRows(sSql)
			Dim sdt As String = cht.SeriesDateType
			For i As Integer = 0 To rscht.Count - 1
				Dim Row As OrderedDictionary = DirectCast(rscht(i), OrderedDictionary)
				cht.Series.Add(ewrpt_ChartSeriesValue(Row(0), sdt))
			Next
		End Sub

		' Load Chart Data
		Public Sub ewrpt_LoadChartData(ByVal sSql As String, ByRef cht As crChart)
			Dim rscht As ArrayList = Conn.GetRows(sSql)
			Dim sdt As String = cht.SeriesDateType
			Dim xdt As String = cht.XAxisDateFormat
			Dim ndt As String = IIf(cht.ChartType = 20, cht.NameDateFormat, "")
			If ew_NotEmpty(sdt) Then
				xdt = sdt
			End If
			cht.Data.Clear()
			For i As Integer = 0 To rscht.Count - 1
				Dim Row As OrderedDictionary = DirectCast(rscht(i), OrderedDictionary)
				Dim d As New OrderedDictionary()
				d.Add(0, ewrpt_ChartXValue(Row(0), xdt))

				' X value
				d.Add(1, ewrpt_ChartSeriesValue(Row(1), sdt))
				For j As Integer = 2 To Row.Count - 1

					' Series value
					If ew_NotEmpty(ndt) AndAlso j = Row.Count - 1 Then
						d.Add(j, ewrpt_ChartXValue(Row(j), ndt))
					Else
						d.Add(j, Row(j))

						' Name value
						' Y values

					End If
				Next
				cht.Data.Add(d)
			Next
		End Sub

		' Get Chart X value
		Public Function ewrpt_ChartXValue(ByVal val As Object, ByVal dt As String) As String
			If Convert.IsDBNull(val) Then
				Return ReportLanguage.Phrase("NullLabel")
			ElseIf ew_Empty(val) Then
				Return ReportLanguage.Phrase("EmptyLabel")
			ElseIf Information.IsNumeric(dt) Then
				Return ew_FormatDateTime(val, ew_ConvertToInt(dt))
			ElseIf dt = "xyq" Then
				Dim ar As String() = Convert.ToString(val).Split(New Char() {"|"C})
				If ar.Length >= 2 Then
					Return ar(0) + " " + ewrpt_QuarterName(ar(1))
				Else
					Return Convert.ToString(val)
				End If
			ElseIf dt = "xym" Then
				Dim ar As String() = Convert.ToString(val).Split(New Char() {"|"C})
				If ar.Length >= 2 Then
					Return ar(0) + " " + ewrpt_MonthName(ar(1))
				Else
					Return Convert.ToString(val)
				End If
			ElseIf dt = "xq" Then
				Return ewrpt_QuarterName(val)
			ElseIf dt = "xm" Then
				Return ewrpt_MonthName(val)
			Else
				Return Convert.ToString(val).Trim()
			End If
		End Function

		' Get Chart Series value
		Public Function ewrpt_ChartSeriesValue(ByVal val As Object, ByVal dt As String) As String
			If dt = "syq" Then
				Dim ar As String() = Convert.ToString(val).Split(New Char() {"|"C})
				If ar.Length >= 2 Then
					Return ar(0) & " " & ewrpt_QuarterName(ar(1))
				Else
					Return Convert.ToString(val)
				End If
			ElseIf dt = "sym" Then
				Dim ar As String() = Convert.ToString(val).Split(New Char() {"|"C})
				If ar.Length >= 2 Then
					Return ar(0) & " " & ewrpt_MonthName(ar(1))
				Else
					Return Convert.ToString(val)
				End If
			ElseIf dt = "sq" Then
				Return ewrpt_QuarterName(val)
			ElseIf dt = "sm" Then
				Return ewrpt_MonthName(val)
			Else
				Return Convert.ToString(val).Trim()
			End If
		End Function

				' Sort chart data
		Public Sub ewrpt_SortChartData(ByRef ar As ArrayList, ByVal opt As Integer, ByVal seq As String)
			If Not ew_IsArrayList(ar) OrElse ((opt < 3 OrElse opt > 4) AndAlso ew_Empty(seq)) OrElse ((opt < 1 OrElse opt > 4) AndAlso ew_NotEmpty(seq)) Then
				Return
			End If
			If (opt = 3 OrElse opt = 4) AndAlso ew_Empty(seq) Then
				seq = "_number"
			End If
			Select Case opt
				Case 1	' X values ascending
					ar.Sort(New ewrpt_ChartDataComparer(0, seq, "ASC"))
					Exit Select
				Case 2	' X values descending
					ar.Sort(New ewrpt_ChartDataComparer(0, seq, "DESC"))
					Exit Select
				Case 3	' Y values ascending					
					ar.Sort(New ewrpt_ChartDataComparer(2, seq, "ASC"))
					Exit Select
				Case 4	' Y values descending
					ar.Sort(New ewrpt_ChartDataComparer(2, seq, "DESC"))
					Exit Select
			End Select
		End Sub

		' Sort chart multi series data
		Public Sub ewrpt_SortMultiChartData(ByRef ar As ArrayList, ByVal opt As Integer, ByVal seq As String)
			If Not ew_IsArrayList(ar) OrElse ((opt < 3 OrElse opt > 4) AndAlso ew_Empty(seq)) OrElse ((opt < 1 OrElse opt > 4) AndAlso ew_NotEmpty(seq)) Then
				Return
			End If
			If (opt = 3 OrElse opt = 4) AndAlso ew_Empty(seq) Then
				seq = "_number"
			End If

			' Obtain a list of columns
			Dim xsums As New Hashtable()
			For i As Integer = 0 To ar.Count - 1
				Dim d As OrderedDictionary = DirectCast(ar(i), OrderedDictionary)
				If xsums.Contains(d(0)) Then
					xsums(d(0)) = ew_ConvertToDouble(xsums(d(0))) + ew_ConvertToDouble(d(2))
				Else
					xsums(d(0)) = d(2)
				End If
			Next

			' Set up Y sum
			Dim idx As Integer = -1
			If opt = 3 OrElse opt = 4 Then
				For i As Integer = 0 To ar.Count - 1
					Dim d As OrderedDictionary = DirectCast(ar(i), OrderedDictionary)
					If idx = -1 Then
						idx = d.Count
					End If
					d.Add(idx, xsums(d(0)))
				Next
			End If
			Select Case opt
				Case 1	' X values ascending
					ar.Sort(New ewrpt_ChartDataComparer(0, seq, "ASC"))
					Exit Select
				Case 2	' X values descending
					ar.Sort(New ewrpt_ChartDataComparer(0, seq, "DESC"))
					Exit Select
				Case 3
					ar.Sort(New ewrpt_ChartDataComparer(idx, seq, "ASC"))
					Exit Select
				Case 4	' Y values
					ar.Sort(New ewrpt_ChartDataComparer(idx, seq, "DESC"))
					Exit Select
			End Select
		End Sub

		' Chart data comparer
		Public Class ewrpt_ChartDataComparer
			Implements IComparer

			Private Index As Integer = 0

			Private Seq As Object = ""	' Empty (Default)

			Private Order As String = "ASC"	' ASC/DESC

			Public Sub New(ByVal aindex As Integer, ByVal aseq As Object, ByVal aorder As String)
				If aindex > 0 Then
					Index = aindex
				End If
				Seq = aseq
				Order = IIf(ew_SameText(aorder, "ASC"), "ASC", "DESC")
			End Sub

			Private Function Compare(ByVal x As Object, ByVal y As Object) As Integer Implements IComparer.Compare
				x = DirectCast(x, OrderedDictionary)(Index)
				y = DirectCast(y, OrderedDictionary)(Index)
				If ew_Empty(Seq) Then	' Default	
					If Information.IsNumeric(x) AndAlso Information.IsNumeric(y) Then
						Seq = "_number"
				ElseIf Information.IsDate(x) AndAlso Information.IsDate(y) Then
						Seq = "_date"
					Else
						Seq = "_string"
					End If
				End If
				If ew_SameText(Seq, "_string") AndAlso Order = "ASC" Then	' String, ASC		
					Return [String].Compare(Convert.ToString(x), Convert.ToString(y))
				ElseIf ew_SameText(Seq, "_string") AndAlso Order = "DESC" Then	' String, DESC
					Return [String].Compare(Convert.ToString(y), Convert.ToString(x))
				ElseIf ew_SameText(Seq, "_number") AndAlso Order = "ASC" Then	' Number, ASC
					If Information.IsNumeric(x) AndAlso Information.IsNumeric(y) Then
						Return Convert.ToDouble(x).CompareTo(Convert.ToDouble(y))
					End If
				ElseIf ew_SameText(Seq, "_number") AndAlso Order = "DESC" Then	' Number, DESC
					If Information.IsNumeric(x) AndAlso Information.IsNumeric(y) Then
						Return Convert.ToDouble(y).CompareTo(Convert.ToDouble(x))
					End If
				ElseIf ew_SameText(Seq, "_date") AndAlso Order = "ASC" Then	' Date, ASC
					If Information.IsDate(x) AndAlso Information.IsDate(y) Then
						Return DateTime.Compare(Convert.ToDateTime(x), Convert.ToDateTime(y))
					End If
				ElseIf ew_SameText(Seq, "_date") AndAlso Order = "DESC" Then	' Date, DESC
					If Information.IsDate(x) AndAlso Information.IsDate(y) Then
						Return DateTime.Compare(Convert.ToDateTime(y), Convert.ToDateTime(x))
					End If
				ElseIf ew_NotEmpty(Seq) AndAlso Convert.ToString(Seq).Contains("|") Then	' Custom sequence by delimited string
					Dim ar As String() = Convert.ToString(Seq).Split(New Char() {"|"C})
					If Array.IndexOf(ar, Convert.ToString(x)) > -1 AndAlso Array.IndexOf(ar, Convert.ToString(y)) > -1 Then
						Return (Array.IndexOf(ar, Convert.ToString(x)) - Array.IndexOf(ar, Convert.ToString(y)))
					End If
				End If
				Return 0
			End Function
		End Class

		' Resize 1-dimension array
		Public Shared Sub ewrpt_ReDim(ByRef ar As Object(), ByVal ubound As Integer)
			Array.Resize(ar, ubound + 1)
		End Sub

		' Resize 2nd dimension of a 2-dimension array
		Public Shared Sub ewrpt_ReDim(ByRef ar As Object(,), ByVal ubound As Integer)
			ewrpt_ReDimByLen(ar, ar.GetLength(0), ubound + 1)
		End Sub

		' Resize a 2-dimension array by lengths
		Public Shared Sub ewrpt_ReDimByLen(ByRef OldArray As Object(,), ByVal arr1stDimLength As Integer, ByVal arr2ndDimLength As Integer)
			Dim NewArray As Object(,) = New Object(arr1stDimLength - 1, arr2ndDimLength - 1) {}
			Dim xMax As Integer = 0
			Dim yMax As Integer = 0
			If ewrpt_IsArray(OldArray) Then
				If OldArray.GetLength(0) < arr1stDimLength Then
					xMax = OldArray.GetLength(0)
				Else
					xMax = arr1stDimLength
				End If
				If OldArray.GetLength(1) < arr2ndDimLength Then
					yMax = OldArray.GetLength(1)
				Else
					yMax = arr2ndDimLength
				End If
				For x As Integer = 0 To xMax - 1
					For y As Integer = 0 To yMax - 1
						NewArray(x, y) = OldArray(x, y)
					Next
				Next
			End If
			OldArray = NewArray
		End Sub

		' Resize array (nx: UpperBound(0) to check, ny: additional size for 2nd dimension)
		Public Shared Sub ewrpt_ResizeAr(ByRef ar As Object(,), ByVal nx As Integer, ByVal ny As Integer)
			Dim ywrk As Integer
			If Not ewrpt_IsArray(ar) Then
				ar = New Object(nx, ny - 1) {}
			Else
				If ar.GetUpperBound(0) = nx Then
					ywrk = ar.GetUpperBound(1) + ny
					ewrpt_ReDim(ar, ywrk)
				End If
			End If
		End Sub

		' Load Array from SQL
		Public Sub ewrpt_LoadArrayFromSql(ByVal sql As String, ByRef ar As String())
			Dim rswrk As SqlDataReader
			Dim v As Object
			If sql = "" Then
				Return
			End If
			rswrk = Conn.GetTempDataReader(sql)
			Dim al As new List(Of String)
			If rswrk IsNot Nothing Then
				While rswrk.Read()
					v = rswrk(0)
					If Convert.IsDBNull(v) Then
						v = EWRPT_NULL_VALUE
					ElseIf ew_Empty(v) Then
						v = EWRPT_EMPTY_VALUE
					ElseIf v.[GetType]().ToString() = "System.Double" Then
						v = Convert.ToDouble(v)
					End If
					al.Add(Convert.ToString(v))
				End While
			End If
			Conn.CloseTempDataReader()
			ar = al.ToArray()
		End Sub

		' Load ArrayList from SQL
		Public Sub ewrpt_LoadArrayListFromSql(ByVal sql As String, ByRef ar As ArrayList)
			Dim rswrk As SqlDataReader
			Dim v As Object
			If sql = "" Then
				Return
			End If
			rswrk = Conn.GetTempDataReader(sql)
			ar = New ArrayList()
			If rswrk IsNot Nothing Then
				While rswrk.Read()
					v = rswrk(0)
					If Convert.IsDBNull(v) Then
						v = EWRPT_NULL_VALUE
					ElseIf ew_Empty(v) Then
						v = EWRPT_EMPTY_VALUE
					ElseIf v.[GetType]().ToString() = "System.Double" Then
						v = Convert.ToDouble(v)
					End If
					ar.Add(Convert.ToString(v))
				End While
			End If
			Conn.CloseTempDataReader()
		End Sub

		' Match array
		Public Shared Function ewrpt_MatchedArray(ByVal ar1 As Object, ByVal ar2 As Object) As Boolean
			If Not ewrpt_IsArray(ar1) AndAlso Not ewrpt_IsArray(ar2) Then
				Return True
			ElseIf ewrpt_IsArray(ar1) AndAlso ewrpt_IsArray(ar2) Then
				Return ew_SameStr([String].Join(",", DirectCast(ar1, String())), [String].Join(",", DirectCast(ar2, String())))
			End If
			Return False
		End Function

		' Encode chart value
		Public Function ewrpt_Encode(ByVal val As String) As String
			Return val.Replace(",", "%2C")

			' Encode comma
		End Function

		' Eval
		Public Function Eval(ByVal AName As String, ByVal AValue As Object) As Object
			Dim Mi As MethodInfo = Me.GetType().GetMethod(AName)
			If Mi IsNot Nothing Then
				Return Mi.Invoke(Me, New Object() {AValue})
			Else
				Return False
			End If
		End Function

		' DateDiff
		Public Shared Function ewrpt_DateDiff(ByVal Interval As DateInterval, ByVal Date1 As DateTime, ByVal Date2 As DateTime) As Long
			Return DateAndTime.DateDiff(Interval, Date1, Date2, FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1)
		End Function

		' DatePart
		Public Shared Function ewrpt_DatePart(ByVal Interval As DateInterval, ByVal DateValue As DateTime) As Integer
			Return DateAndTime.DatePart(Interval, DateValue, FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1)
		End Function

		' DateAdd
		Public Shared Function ewrpt_DateAdd(ByVal Interval As String, ByVal Number As Double, ByVal DateValue As DateTime) As DateTime
			Select Case Interval
				Case "d"
					Return DateAndTime.DateAdd(DateInterval.Day, Number, DateValue)
				Case "y" ' Truncated to integral value 
					Return DateAndTime.DateAdd(DateInterval.DayOfYear, Number, DateValue)
				Case "h" ' Truncated to integral value 
					Return DateAndTime.DateAdd(DateInterval.Hour, Number, DateValue)
				Case "n" ' Rounded to nearest millisecond 
					Return DateAndTime.DateAdd(DateInterval.Minute, Number, DateValue)
				Case "m" ' Rounded to nearest millisecond 
					Return DateAndTime.DateAdd(DateInterval.Month, Number, DateValue)
				Case "q" ' Truncated to integral value 
					Return DateAndTime.DateAdd(DateInterval.Quarter, Number, DateValue)
				Case "s" ' Truncated to integral value 
					Return DateAndTime.DateAdd(DateInterval.Second, Number, DateValue)
				Case "w" ' Rounded to nearest millisecond 
					Return DateAndTime.DateAdd(DateInterval.Weekday, Number, DateValue)
				Case "ww" ' Truncated to integral value 
					Return DateAndTime.DateAdd(DateInterval.WeekOfYear, Number, DateValue)
				Case "yyyy" ' Truncated to integral value 
					Return DateAndTime.DateAdd(DateInterval.Year, Number, DateValue)
				Case Else
					Return DateValue
			End Select
		End Function

		' DateAdd
		Public Shared Function ewrpt_DateAdd(ByVal Interval As DateInterval, ByVal Number As Double, ByVal DateValue As DateTime) As DateTime
			Return DateAndTime.DateAdd(Interval, Number, DateValue)
		End Function

		' Format number
		Public Shared Function ewrpt_FormatNumber(ByVal Expression As Object, ByVal NumDigitsAfterDecimal As Integer) As String
			If Convert.IsDBNull(Expression) Then	Return String.Empty
			Return Strings.FormatNumber(Expression, NumDigitsAfterDecimal, TriState.UseDefault, TriState.UseDefault, TriState.UseDefault)
		End Function

		' Is array
		Public Shared Function ewrpt_IsArray(ByVal obj As Object) As Boolean
			Return Information.IsArray(obj)
		End Function

		' Is date
		Public Shared Function ewrpt_IsDate(ByVal obj As Object) As Boolean
			Return Information.IsDate(obj)
		End Function

		' Is DateTime
		Public Shared Function ewrpt_IsDateTime(ByVal obj As Object) As Boolean
			Return (obj IsNot Nothing AndAlso obj.GetType().ToString() = "System.DateTime")
		End Function

		' Is numeric
		Public Shared Function ewrpt_IsNumeric(ByVal obj As Object) As Boolean
			Return Information.IsNumeric(obj)
		End Function

		' Register custom filter
		Public Shared Sub ewrpt_RegisterCustomFilter(ByVal fld As crField, ByVal FilterName As String, ByVal DisplayName As String, ByVal FunctionName As String)
			Dim FldName As String = fld.FldName
			Dim FldExpression As String = fld.FldExpression
			fld.CustomFilters.Add(New crCustomFilter(FldName, FilterName, DisplayName, FldExpression, FunctionName))
		End Sub

		' Get custom filter
		Public Function ewrpt_GetCustomFilter(ByRef fld As crField, ByVal FldVal As String) As String
			Dim sWrk As String = ""
			Dim sParm As String = FldVal.Substring(2)
			Dim cntf As Integer = fld.CustomFilters.Count
			For i As Integer = 0 To cntf - 1
				If fld.CustomFilters(i).FilterName = sParm Then
					Dim sFld As String = fld.CustomFilters(i).FldExpression
					Dim sFn As String = fld.CustomFilters(i).FunctionName
					Dim mi As MethodInfo = Me.[GetType]().GetMethod(sFn)
					If mi IsNot Nothing Then
						sWrk = Convert.ToString(mi.Invoke(Me, New Object() {sFld}))
					End If
					Exit For
				End If
			Next
			Return sWrk
		End Function

		' Return date value 
		Public Shared Function ewrpt_DateVal(ByVal FldOpr As String, ByVal FldVal As Object, ByVal ValType As Integer) As Object
			If ew_Empty(FldVal) Then
				Return ""
			End If
			Dim wrkVal As Object = ""
			Dim arWrk As String()
			Dim yr As Object
			Dim mth As Object
			Dim dy As Object

			' Compose date string 
			Select Case FldOpr.ToLower()
				Case "year"
					If ValType = 1 Then
						wrkVal = Convert.ToDateTime(FldVal & "/1/1")
					ElseIf ValType = 2 Then
						wrkVal = Convert.ToDateTime(FldVal & "/12/31")
					End If
					Exit Select
				Case "quarter"
					arWrk = Convert.ToString(FldVal).Split(New Char() {"|"C})
					wrkVal = Convert.ToDateTime(arWrk(0) & "/" & ((Convert.ToInt32(arWrk(1)) - 1) * 3 + 1) & "/1")
					If ValType = 2 Then
						wrkVal = ewrpt_DateAdd("m", 3, Convert.ToDateTime(wrkVal)) ' & three months							
						wrkVal = ewrpt_DateAdd("d", -1, Convert.ToDateTime(wrkVal)) ' - one day 
					End If
					Exit Select
				Case "month"
					wrkVal = Convert.ToDateTime(Convert.ToString(FldVal).Replace("|", "/") & "/1")
					If ValType = 2 Then
						wrkVal = ewrpt_DateAdd("m", 1, Convert.ToDateTime(wrkVal)) ' & one month							 
						wrkVal = ewrpt_DateAdd("d", -1, Convert.ToDateTime(wrkVal))' - one day
					End If
					Exit Select
				Case "day"
					wrkVal = Convert.ToDateTime(Convert.ToString(FldVal).Replace("|", "/"))
					Exit Select
			End Select

			' Add time if necessary 
			wrkVal = Convert.ToDateTime(wrkVal).Year & "/" & Convert.ToDateTime(wrkVal).Month & "/" & Convert.ToDateTime(wrkVal).Day
			If True Then

				' Always return time 
				If ValType = 1 Then
					wrkVal = wrkVal & " 00:00:00"
				ElseIf ValType = 2 Then
					wrkVal = wrkVal & " 23:59:59"
				End If
			End If

			' Check if date
			Return IIf(ewrpt_IsDate(wrkVal), wrkVal, "")
		End Function

		' Is past
		Public Shared Function ewrpt_IsPast() As String
			Return "(@@fld@@ < " & ew_QuotedValue(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is future
		Public Shared Function ewrpt_IsFuture() As String
			Return "(@@fld@@ > " & ew_QuotedValue(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is last 30 days
		Public Shared Function ewrpt_IsLast30Days() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -29, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, 1, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is last 14 days
		Public Shared Function ewrpt_IsLast14Days() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -13, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, 1, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is last 7 days
		Public Shared Function ewrpt_IsLast7Days() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -6, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, 1, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is next 7 days
		Public Shared Function ewrpt_IsNext7Days() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = dt
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, 7, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is next 14 days
		Public Shared Function ewrpt_IsNext14Days() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = dt
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, 14, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is next 30 days
		Public Shared Function ewrpt_IsNext30Days() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = dt
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, 30, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is yesterday
		Public Shared Function ewrpt_IsYesterday() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1, dt)
			Dim dt2 As DateTime = dt
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is DT
		Public Shared Function ewrpt_IsToday() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = dt
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, 1, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is tomorrow
		Public Shared Function ewrpt_IsTomorrow() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, 1, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, 2, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is last month
		Public Shared Function ewrpt_IsLastMonth() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Month, -1, dt)
			Dim dt2 As DateTime = dt
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is this month
		Public Shared Function ewrpt_IsThisMonth() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = dt
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Month, 1, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is next month
		Public Shared Function ewrpt_IsNextMonth() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Month, 1, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Month, 2, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/01"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is last 2 weeks
		Public Shared Function ewrpt_IsLast2Weeks() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek) - 14, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek), dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is last week
		Public Shared Function ewrpt_IsLastWeek() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek) - 7, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek), dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is this week
		Public Shared Function ewrpt_IsThisWeek() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek), dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek) + 7, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is next week
		Public Shared Function ewrpt_IsNextWeek() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek) + 7, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek) + 14, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is next 2 weeks
		Public Shared Function ewrpt_IsNext2Weeks() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek) + 7, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Day, -1 * CInt(dt.DayOfWeek) + 21, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/MM/dd"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is last year
		Public Shared Function ewrpt_IsLastYear() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Year, -1, dt)
			Dim dt2 As DateTime = dt
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is this year
		Public Shared Function ewrpt_IsThisYear() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = dt
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Year, 1, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Is next year
		Public Shared Function ewrpt_IsNextYear() As String
			Dim dt As DateTime = DateTime.Today
			Dim dt1 As DateTime = DateAndTime.DateAdd(DateInterval.Year, 1, dt)
			Dim dt2 As DateTime = DateAndTime.DateAdd(DateInterval.Year, 2, dt)
			Return "(@@fld@@ >= " & ew_QuotedValue(dt1.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) & " AND @@fld@@ < " & ew_QuotedValue(dt2.ToString("yyyy/01/01"), EWRPT_DATATYPE_TIME) & ")"
		End Function

		' Get number of days in a month
		Public Shared Function ewrpt_DaysInMonth(ByVal y As Integer, ByVal m As Integer) As Integer
			If (New List(Of Integer)(New Integer() {1, 3, 5, 7, 8, 10, 12})).Contains(m) Then
				Return 31
			ElseIf (New List(Of Integer)(New Integer() {4, 6, 9, 11})).Contains(m) Then
				Return 30
			ElseIf m = 2 Then
				Return IIf(y Mod 4 = 0, 29, 28)
			End If
			Return 0
		End Function

		'
		' Field class
		'
		Public Class crField
			Inherits AspNetReportMakerBase

			Public TblName As String ' Table name

			Public TblVar As String ' Table variable name

			Public FldName As String ' Field name

			Public FldVar As String ' Field variable name

			Public FldExpression As String ' Field expression (used in SQL)

			Public FldDefaultErrMsg As String ' Default error message

			Public FldType As Integer ' Field type

			Public FldDataType As Integer ' ASP.NET Maker Field type

			Public FldDateTimeFormat As Integer ' Date time format

			Public Count As Integer ' Count

			Public Summary As Object ' Summary

			Public OldValue As Object ' Old Value

			Public CurrentValue As Object ' Current value

			Public ViewValue As String ' View value

			Public HrefValue As String ' Href value

			Public m_FormValue As String ' Form value

			Public m_QueryStringValue As String ' QueryString value

			Public m_DbValue As Object ' Database value

			Public ImageWidth As Integer = 0 ' Image width

			Public ImageHeight As Integer = 0 ' Image height

			Public ImageResize As Boolean = False ' Image resize

			Public Sortable As Boolean = True ' Sortable

			Public GroupingFieldId As Integer = 0 ' Grouping field id

			Public UploadPath As String = EWRPT_UPLOAD_DEST_PATH ' Upload path

			Public CellAttrs As New Hashtable() ' Cell custom attributes

			Public ViewAttrs As New Hashtable() ' View custom attributes

			Public FldGroupByType As String ' Group By Type

			Public FldGroupInt As String ' Group Interval

			Public FldGroupSql As String ' Group SQL

			Public GroupDbValues As New Hashtable() ' Group DB Values

			Public GroupViewValue As String ' Group View Value

			Public SqlSelect As String ' Field SELECT

			Public SqlGroupBy As String ' Field GROUP BY

			Public SqlOrderBy As String ' Field ORDER BY

			Public ValueList As New OrderedDictionary() ' Value List

			Public SelectionList As String() = New String(-1) {} ' Selection List

			Public DefaultSelectionList As New ArrayList() ' Default Selection List

			Public CustomFilters As New List(Of crCustomFilter)() ' Custom Filters

			Public AdvancedFilters As New ArrayList() ' Advanced Filters

			Public RangeFrom As String ' Range From

			Public RangeTo As String ' Range To

			Public DropDownList As New ArrayList() ' Dropdown List

			Public DropDownValue As Object ' Dropdown Value

			Public DefaultDropDownValue As Object ' Default Dropdown Value

			Public DateFilter As String ' Date Filter

			Public SearchValue As Object = "" ' Search Value 1

			Public SearchValue2 As Object = ""	' Search Value 2

			Public SearchOperator As String = "="	' Search Operator 1

			Public SearchOperator2 As String = "=" ' Search Operator 2

			Public SearchCondition As String = "AND" ' Search Condition

			Public DefaultSearchValue As Object = "" ' Default Search Value 1

			Public DefaultSearchValue2 As Object = "" ' Default Search Value 2

			Public DefaultSearchOperator As String = "=" ' Default Search Operator 1

			Public DefaultSearchOperator2 As String = "="	' Default Search Operator 2

			Public DefaultSearchCondition As String = "AND"	' Default Search Condition

			Public TruncateMemoRemoveHtml As Boolean = False ' Remove HTML from memo field

			' Constructor
			Public Sub New(ByVal atblvar As String, ByVal atblname As String, ByVal afldvar As String, ByVal afldname As String, ByVal afldexpression As String, ByVal afldtype As Integer, _
				ByVal aflddatatype As Integer, ByVal aflddtfmt As Integer)
				TblVar = atblvar
				TblName = atblname
				FldVar = afldvar
				FldName = afldname
				FldExpression = afldexpression
				FldType = afldtype
				FldDataType = aflddatatype
				FldDateTimeFormat = aflddtfmt
			End Sub

			' Field caption
			Public Function FldCaption() As String
				Return ReportLanguage.FieldPhrase(TblVar, FldVar.Substring(2), "FldCaption")
			End Function

			' Field title
			Public Function FldTitle() As String
				Return ReportLanguage.FieldPhrase(TblVar, FldVar.Substring(2), "FldTitle")
			End Function

			' Field image alt
			Public Function FldAlt() As String
				Return ReportLanguage.FieldPhrase(TblVar, FldVar.Substring(2), "FldAlt")
			End Function

			' Field error message
			Public Function FldErrMsg() As String
				Dim ErrMsg As String = ReportLanguage.FieldPhrase(TblVar, FldVar.Substring(2), "FldErrMsg")
				If ew_Empty(ErrMsg) Then
					ErrMsg = FldDefaultErrMsg + " - " + FldCaption()
				End If
				Return ErrMsg
			End Function

			' Reset CSS styles for field object
			Public Sub ResetCSS()
				CellAttrs("style") = ""
				CellAttrs("class") = ""
				ViewAttrs("style") = ""
				ViewAttrs("class") = ""
			End Sub

			' View Attributes
			Public ReadOnly Property ViewAttributes() As String
				Get
					Dim sAtt As String = ""
					If ew_ConvertToInt(ImageWidth) > 0 AndAlso (Not ImageResize OrElse (ImageResize AndAlso ew_ConvertToInt(ImageHeight) <= 0)) Then
						sAtt &= " width=""" & ew_ConvertToInt(ImageWidth) & """"
					End If
					If ew_ConvertToInt(ImageHeight) > 0 AndAlso (Not ImageResize OrElse (ImageResize AndAlso ew_ConvertToInt(ImageWidth) <= 0)) Then
						sAtt &= " height=""" & ew_ConvertToInt(ImageHeight) & """"
					End If
					For Each d As DictionaryEntry In ViewAttrs
						If ew_NotEmpty(d.Value) Then
							sAtt &= " " & d.Key & "=""" & Convert.ToString(d.Value).Trim() & """"
						End If
					Next
					Return sAtt
				End Get
			End Property

			' Cell attributes
			Public ReadOnly Property CellAttributes() As String
				Get
					Dim sAtt As String = ""
					For Each d As DictionaryEntry In CellAttrs
						If ew_NotEmpty(d.Value) Then
							sAtt &= " " & d.Key & "=""" & Convert.ToString(d.Value).Trim() & """"
						End If
					Next
					Return sAtt
				End Get
			End Property

			' Sort
			Public Property Sort() As String
				Get
					Return Convert.ToString(ew_Session(EWRPT_PROJECT_NAME + "_" + TblVar + "_" + EWRPT_TABLE_SORT + "_" + FldVar))
				End Get
				Set
					If ew_Session(EWRPT_PROJECT_NAME + "_" + TblVar + "_" + EWRPT_TABLE_SORT + "_" + FldVar) <> value Then
						ew_Session(EWRPT_PROJECT_NAME + "_" + TblVar + "_" + EWRPT_TABLE_SORT + "_" + FldVar) = value
					End If
				End Set
			End Property

			Public ReadOnly Property ReverseSort() As String
				Get
					Return IIf(Sort = "ASC", "DESC", "ASC")
				End Get
			End Property

			' List view value
			Public ReadOnly Property ListViewValue() As String
				Get
					If ew_Empty(ViewValue) Then
						Return "&nbsp;"
					Else
						Dim Result As String = Convert.ToString(ViewValue)
						Dim Result2 As String = Regex.Replace(Result, "<[^img][^>]*>", [String].Empty)

						' Remove all except non-empty image tag
						Return IIf(ew_Empty(Result2), "&nbsp;", Result)
					End If
				End Get
			End Property

			' Form value
			Public Property FormValue() As String
				Get
					Return m_FormValue
				End Get
				Set
					m_FormValue = value
					CurrentValue = m_FormValue
				End Set
			End Property

			Public Property QueryStringValue() As String
				Get
					Return m_QueryStringValue
				End Get
				Set
					m_QueryStringValue = value
					CurrentValue = m_QueryStringValue
				End Set
			End Property

			' Database value
			Public Property DbValue() As Object
				Get
					Return m_DbValue
				End Get
				Set
					If FldType = 131 Then
						value = ew_ConvertToDouble(value)
					End If
					OldValue = m_DbValue
					m_DbValue = value
					CurrentValue = m_DbValue
				End Set
			End Property

			' Group value
			Public Function GroupValue() As Object
				Return GetGroupValue(CurrentValue)
			End Function

			' Group old value
			Public Function GroupOldValue() As Object
				Return GetGroupValue(OldValue)
			End Function

			' Get group value
			Public Function GetGroupValue(ByVal v As Object) As Object
				If GroupingFieldId = 1 Then
					Return v
				ElseIf GroupDbValues.Count > 0 Then
					Return GroupDbValues(v)
				ElseIf ew_NotEmpty(FldGroupByType) AndAlso Not ew_SameStr(FldGroupByType, "n") Then
					Return ewrpt_GroupValue(Me, v)
				Else
					Return v
				End If
			End Function
		End Class

		'
		' Chart parameter class
		'
		Public Class crChartParm

			Public Key As String = ""

			Public Value As Object = Nothing

			Public Output As Boolean

			Public Sub New(ByVal k As String, ByVal v As Object, ByVal o As Boolean)
				Key = k
				Value = v
				Output = o
			End Sub
		End Class

		'
		' Chart class
		'
		Public Class crChart
			Inherits AspNetReportMakerBase

			Public TblName As String = ""	' Table name

			Public TblVar As String = "" ' Table variable name

			Public ChartName As String = ""	' Chart name

			Public ChartVar As String = "" ' Chart variable name

			Public ChartXFldName As String = ""	' Chart X Field name

			Public ChartYFldName As String = ""	' Chart Y Field name

			Public ChartSFldName As String = ""	' Chart Series Field name

			Public ChartType As Integer	' Chart Type

			Public ChartSummaryType As String = "" ' Chart Summary Type

			Public ChartWidth As Integer ' Chart Width

			Public ChartHeight As Integer	' Chart Height

			Public ChartAlign As String = "" ' Chart Align

			Public SqlSelect As String = ""

			Public SqlGroupBy As String = ""

			Public SqlOrderBy As String = ""

			Public XAxisDateFormat As String = ""

			Public NameDateFormat As String = ""

			Public SeriesDateType As String = ""

			Public SqlSelectSeries As String = ""

			Public SqlGroupBySeries As String = ""

			Public SqlOrderBySeries As String = ""

			Public ID As String = ""

			Public Parms As New Dictionary(Of String, crChartParm)()

			Public Trends As New ArrayList()

			Public Data As New ArrayList()

			Public Series As New ArrayList()

			Public RegexColor As New Regex("^#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$")

			Public ci As New System.Globalization.CultureInfo("en-us") ' DO NOT CHANGE!

			' Constructor
			Public Sub New(ByVal stblvar As String, ByVal stblname As String, ByVal schartvar As String, ByVal schartname As String, ByVal xfld As String, ByVal yfld As String, _
				ByVal sfld As String, ByVal type As Integer, ByVal smrytype As String, ByVal width As Integer, ByVal height As Integer, ByVal align As String)
				TblVar = stblvar
				TblName = stblname
				ChartVar = schartvar
				ChartName = schartname
				ChartXFldName = xfld
				ChartYFldName = yfld
				ChartSFldName = sfld
				ChartType = type
				ChartSummaryType = smrytype
				ChartWidth = width
				ChartHeight = height
				ChartAlign = align
			End Sub

			' Chart caption
			Public Function ChartCaption() As String
				Return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartCaption")
			End Function

			' xaxisname
			Public Function ChartXAxisName() As String
				Return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartXAxisName")
			End Function

			' yaxisname
			Public Function ChartYAxisName() As String
				Return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartYAxisName")
			End Function

			' PYAxisName
			Public Function ChartPYAxisName() As String
				Return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartPYAxisName")
			End Function

			' SYAxisName
			Public Function ChartSYAxisName() As String
				Return ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartSYAxisName")
			End Function

			' Set chart parameters
			Public Sub SetChartParam(ByVal key As String, ByVal value As Object, ByVal output As Boolean)
				Parms(key) = New crChartParm(key, value, output)
			End Sub

			' Set up default chart parm
			Public Sub SetupDefaultChartParm(ByVal key As String, ByVal value As Object)
				Dim parm As Object = LoadParm(key)
				If parm Is Nothing Then
					Parms(key) = New crChartParm(key, value, True)
				ElseIf parm = "" Then
					SaveParm(key, value)
				End If
			End Sub

			' Load chart parm
			Public Function LoadParm(ByVal key As String) As Object
				If Parms.ContainsKey(key) Then
					Return Parms(key).Value
				End If
				Return Nothing
			End Function

			' Save chart parm
			Public Sub SaveParm(ByVal key As String, ByVal value As Object)
				If Parms.ContainsKey(key) Then
					Parms(key).Value = value
				End If
			End Sub

			' Chart Xml
			Public Function ChartXml() As String

				' Initialize default values
				SetupDefaultChartParm("caption", "Chart")

				' Show names/values/hover
				SetupDefaultChartParm("shownames", "1") ' Default show names				
				SetupDefaultChartParm("showvalues", "1") ' Default show values				
				SetupDefaultChartParm("showhover", "1") ' Default show hover				

				' Get showvalues/showhovercap
				Dim cht_showValues As String = Convert.ToString(LoadParm("showvalues"))
				Dim cht_showHoverCap As String = Convert.ToString(LoadParm("showhovercap"))

				' Format percent for Pie charts
				Dim cht_showPercentageValues As String = Convert.ToString(LoadParm("showPercentageValues"))
				Dim cht_showPercentageInLabel As String = Convert.ToString(LoadParm("showPercentageInLabel"))
				Dim cht_type As Integer = ew_ConvertToInt(LoadParm("type"))
				If cht_type = 2 OrElse cht_type = 6 OrElse cht_type = 8 Then
					If (cht_showHoverCap = "1" AndAlso cht_showPercentageValues = "1") OrElse (cht_showValues = "1" AndAlso cht_showPercentageInLabel = "1") Then
						SetupDefaultChartParm("formatNumber", "1")
						SaveParm("formatNumber", "1")
					End If
				ElseIf cht_type = 20 Then
					SetupDefaultChartParm("bearBorderColor", "E33C3C")
					SetupDefaultChartParm("bearFillColor", "E33C3C")
				End If
				Dim chartseries As ArrayList = Series
				Dim chartdata As ArrayList = Data
				Dim cht_series As Integer = IIf(cht_type >= 9 AndAlso cht_type <= 19, 1, 0)

				' $cht_series = 1 (Multi series charts)
				Dim cht_series_type As String = Convert.ToString(LoadParm("seriestype"))
				Dim cht_alpha As Integer = ew_ConvertToInt(LoadParm("alpha"))
				Dim wrk As String = ""
				If ew_IsArrayList(chartdata) Then
					wrk += ChartHeader(1)

					' Get chart header
					' Candlestick

					If cht_type = 20 Then

						' Write candlestick cat
						Dim xindex As Integer
						If DirectCast(chartdata(0), OrderedDictionary).Count >= 7 Then
							Dim catwrk As String = ""
							Dim cntcat As Integer = chartdata.Count
							For i As Integer = 0 To cntcat - 1
								xindex = i + 1
								Dim name As String = Convert.ToString(DirectCast(chartdata(i), OrderedDictionary)(6))
								If name <> "" Then
									catwrk += ChartCandlestickCatContent(xindex, name)
								End If
							Next
							If catwrk <> "" Then
								wrk += ChartCatHeader(1) + catwrk + ChartCatHeader(2)
							End If
						End If

						' Write candlestick data
						wrk += ChartCandlestickContentHeader(1)
						Dim open As Double, high As Double, low As Double, close As Double
						For i As Integer = 0 To chartdata.Count - 1
							Dim temp As OrderedDictionary = DirectCast(chartdata(i), OrderedDictionary)
							open = ew_ConvertToDouble(temp(2))
							high = ew_ConvertToDouble(temp(3))
							low = ew_ConvertToDouble(temp(4))
							close = ew_ConvertToDouble(temp(5))
							xindex = i + 1
							wrk += ChartCandlestickContent(open, high, low, close, xindex)
						Next

							' Multi series
						wrk += ChartCandlestickContentHeader(2)
					ElseIf cht_series = 1 Then

						' Multi-Y values
						If cht_series_type = "1" Then

							' Write cat
							wrk += ChartCatHeader(1)
							Dim cntcat As Integer = chartdata.Count
							For i As Integer = 0 To cntcat - 1
								Dim name As String = Convert.ToString(DirectCast(chartdata(i), OrderedDictionary)(0))
								wrk += ChartCatContent(name)
							Next
							wrk += ChartCatHeader(2)

							' Write series
							If cntcat > 0 Then
								Dim temp As OrderedDictionary = DirectCast(chartdata(0), OrderedDictionary)
								Dim cntseries As Integer = chartseries.Count
								If cntseries > temp.Count - 2 Then
									cntseries = temp.Count - 2
								End If
								Dim val As Double
								For i As Integer = 0 To cntseries - 1
									Dim color As String = GetPaletteColor(i)
									Dim bShowSeries As Boolean = EWRPT_CHART_SHOW_BLANK_SERIES
									Dim serieswrk As String = ChartSeriesHeader(1, chartseries(i), color, cht_alpha)
									For j As Integer = 0 To chartdata.Count - 1
										val = ew_ConvertToDouble(DirectCast(chartdata(j), OrderedDictionary)(i + 2))
										If val <> 0 Then
											bShowSeries = True
										End If
										serieswrk += ChartSeriesContent(val)
									Next
									serieswrk += ChartSeriesHeader(2, chartseries(i), color, cht_alpha)
									If bShowSeries Then
										wrk += serieswrk
									End If								
								Next
							End If
						Else ' Series field

							' Get series names
							Dim nSeries As Integer = 0
							If ew_IsArrayList(chartseries) Then
								nSeries = chartseries.Count
							End If

							' Write cat
							wrk += ChartCatHeader(1)
							Dim chartcats As New List(Of String)()
							Dim cntdata As Integer = chartdata.Count
							Dim name As String
							For i As Integer = 0 To cntdata - 1
								name = Convert.ToString(DirectCast(chartdata(i), OrderedDictionary)(0))
								If chartcats.IndexOf(name) = -1 Then
									wrk += ChartCatContent(name)
									chartcats.Add(name)
								End If
							Next
							wrk += ChartCatHeader(2)

							' Write series
							Dim val As Double
							For i As Integer = 0 To nSeries - 1
								Dim seriesname As String
								If ewrpt_IsArray(chartseries(i)) Then
									seriesname = Convert.ToString(CType(chartseries(i), String())(0))
								Else
									seriesname = Convert.ToString(chartseries(i))
								End If
								Dim color As String = GetPaletteColor(i)
								Dim bShowSeries As Boolean = EWRPT_CHART_SHOW_BLANK_SERIES
								Dim serieswrk As String = ChartSeriesHeader(1, chartseries(i), color, cht_alpha)
								For j As Integer = 0 To chartcats.Count - 1
									val = 0
									For k As Integer = 0 To chartdata.Count - 1
										Dim temp As OrderedDictionary = DirectCast(chartdata(k), OrderedDictionary)
										If ew_SameStr(temp(0), chartcats(j)) AndAlso ew_SameStr(temp(1), seriesname) Then
											val = 0
											If (temp.Count > 2) Then
												val = ew_ConvertToDouble(temp(2))
											End If
											If val <> 0 Then
												bShowSeries = True
											End If
											Exit For
										End If
									Next
									serieswrk += ChartSeriesContent(val)
								Next
								serieswrk += ChartSeriesHeader(2, chartseries(i), color, cht_alpha)
								If bShowSeries Then
									wrk += serieswrk
								End If
							Next							
						End If
					Else ' Single series
						Dim val As Double
						Dim link As String = ""
						For i As Integer = 0 To chartdata.Count - 1
							Dim temp As OrderedDictionary = DirectCast(chartdata(i), OrderedDictionary)
							Dim name As String = Convert.ToString(temp(0))
							If name Is Nothing Then
								name = ReportLanguage.Phrase("NullLabel")
							ElseIf ew_Empty(name) Then
								name = ReportLanguage.Phrase("EmptyLabel")
							End If
							Dim color As String = GetPaletteColor(i)
							If ew_NotEmpty(temp(1)) Then
								name += ", " + temp(1)
							End If
							val = 0
							If (temp.Count > 2) Then
								val = ew_ConvertToDouble(temp(2))
							End If

							' Get chart content
							wrk += ChartContent(name, val, color, cht_alpha, link)
						Next
					End If

					' Get trend lines
					wrk += ChartTrendLines()

					' Get chart footer
					wrk += ChartHeader(2)
				End If
				Return wrk

				' ewrpt_Trace($wrk);
			End Function

			' Show chart (FusionCharts Free)
			' typ: chart type (1/2/3/4/...)
			' id: chart id
			' parms: "bgcolor=FFFFFF|..."
			' trends: trend lines
			Public Function ShowChartFCF(ByVal xml As String) As String
				Dim typ As Integer = ChartType
				Dim width As Integer = ChartWidth
				Dim height As Integer = ChartHeight
				Dim align As String = ChartAlign
				If ew_ConvertToInt(typ) <= 0 Then
					typ = 1
				End If
				Dim chartswf As String = ""

				' Get chart swf
				Select Case typ
					Case 1 ' Single Series
						chartswf = "FCF_Column2D.swf" ' Column 2D
					Case 2 
						chartswf = "FCF_Pie2D.swf" ' Pie 2D
					Case 3 
						chartswf = "FCF_Bar2D.swf" ' Bar 2D
					Case 4 
						chartswf = "FCF_Line.swf" ' Line 2D
					Case 5 
						chartswf = "FCF_Column3D.swf" ' Column 3D
					Case 6 
						chartswf = "FCF_Pie3D.swf" ' Pie 3D
					Case 7 
						chartswf = "FCF_Area2D.swf" ' Area 2D
					Case 8 
						chartswf = "FCF_Doughnut2D.swf" ' Doughnut 2D
					Case 9 ' Multi Series
						chartswf = "FCF_MSColumn2D.swf" ' Multi-series Column 2D
					Case 10						
						chartswf = "FCF_MSColumn3D.swf" ' Multi-series Column 3D
					Case 11						
						chartswf = "FCF_MSLine.swf" ' Multi-series Line 2D
					Case 12						
						chartswf = "FCF_MSArea2D.swf" ' Multi-series Area 2D
					Case 13						
						chartswf = "FCF_MSBar2D.swf" ' Multi-series Bar 2D
					Case 14	' Stacked
						chartswf = "FCF_StackedColumn2D.swf" ' Stacked Column 2D
					Case 15						
						chartswf = "FCF_StackedColumn3D.swf" ' Stacked Column 3D
					Case 16						
						chartswf = "FCF_StackedArea2D.swf" ' Stacked Area 2D
					Case 17						
						chartswf = "FCF_StackedBar2D.swf" ' Stacked Bar 2D
					Case 18	' Combination
						chartswf = "FCF_MSColumn2DLineDY.swf" ' Multi-series Column 2D Line Dual Y Chart
					Case 19						
						chartswf = "FCF_MSColumn3DLineDY.swf" ' Multi-series Column 3D Line Dual Y Chart
					Case 20 ' Financial
						chartswf = "FCF_Candlestick.swf" ' Candlestick
					Case 21	' Other
						chartswf = "FCF_Gantt.swf" ' Gantt
					Case 22						
						chartswf = "FCF_Funnel.swf" ' Funnel
					Case Else ' Default
						chartswf = "FCF_Column2D.swf" ' Default = Column 2D
				End Select

				' Set width, height and align
				Dim wrkwidth As Integer
				Dim wrkheight As Integer
				Dim wrkalign As String
				If Information.IsNumeric(width) AndAlso Information.IsNumeric(height) Then
					wrkwidth = width
					wrkheight = height
				Else ' Default
					wrkwidth = EWRPT_CHART_WIDTH
					wrkheight = EWRPT_CHART_HEIGHT
				End If
				If ew_SameStr(align, "left") OrElse ew_SameStr(align, "right") Then
					wrkalign = align.ToLower()
				Else ' Default
					wrkalign = EWRPT_CHART_ALIGN
				End If

				' Output JavaScript for FCF
				Dim chartxml As String = xml
				Dim wrk As String = "<script type=""text/javascript"">" & vbCrLf & ""
				wrk &= "var chartwidth = """ & wrkwidth & """;" & vbCrLf & ""
				wrk &= "var chartheight = """ & wrkheight & """;" & vbCrLf & ""
				wrk &= "var chartalign = """ & wrkalign & """;" & vbCrLf & ""
				wrk &= "var chartxml = """ & ewrpt_EscapeJs(chartxml) & """;" & vbCrLf & ""
				wrk &= "var chartid = ""div_" & ID & """;" & vbCrLf & ""
				wrk &= "var chartswf = ""FusionChartsFree/Charts/" & chartswf & """;" & vbCrLf & ""
				wrk &= "var chart = new FusionCharts(chartswf, ""ewchart"", chartwidth, chartheight);" & vbCrLf & ""
				wrk &= "chart.addParam(""wmode"", ""transparent"");" & vbCrLf & ""
				wrk &= "chart.setDataXML(chartxml);" & vbCrLf & ""
				wrk &= "chart.render(chartid);" & vbCrLf & ""
				wrk &= "</script>" & vbCrLf & ""

				' Add debug xml
				If EWRPT_DEBUG_ENABLED Then
					wrk += "<p>(Chart XML): " + ew_HtmlEncode(chartxml) + "</p>"
				End If
				Return wrk
			End Function

			' Show Chart Xml
			Public Sub ShowChartXml()

				' Build chart content
				Dim sChartContent As String = ChartXml()
				HttpContext.Current.Response.AddHeader("Content-Type", "text/xml; charset=UTF-8")

				' Write utf-8 BOM
				HttpContext.Current.Response.BinaryWrite(New Byte() {239, 187, 191})

				' Write utf-8 encoding
				ew_Write("<?xml version=""1.0"" encoding=""utf-8"" ?>")

				' Write content
				ew_Write(sChartContent)
			End Sub

			' Show Chart Text
			Public Sub ShowChartText()

				' Build chart content
				Dim sChartContent As String = ChartXml()
				HttpContext.Current.Response.AddHeader("Content-Type", "text/xml; charset=UTF-8")

				' Write content
				ew_Write(sChartContent)
			End Sub

			' Get color
			Public Function GetPaletteColor(ByVal i As Integer) As String
				Dim colorpalette As String = Convert.ToString(LoadParm("colorpalette"))
				Dim ar_cht_colorpalette As String() = colorpalette.Split(New Char() {"|"C})
				Dim cntar As Integer = ar_cht_colorpalette.Length
				Return ar_cht_colorpalette(i Mod cntar)
			End Function

			' Convert to HTML color
			Public Function ColorCode(ByVal c As String) As String
				If ew_NotEmpty(c) Then					
					Dim color As String = c.Replace("#", "") ' Remove #					
					Return color.PadLeft(6, "0"C) ' Fill to 6 digits
				Else
					Return ""
				End If
			End Function

			' Output chart header
			Public Function ChartHeader(ByVal typ As Integer) As String
				Dim wrk As String
				If typ = 1 Then
					wrk = "<graph"
					For Each p As KeyValuePair(Of String, crChartParm) In Parms
						Dim parm As crChartParm = p.Value
						If parm.Output Then
							WriteAtt(wrk, parm.Key, parm.Value)
						End If
					Next
					wrk += ">"
				Else
					wrk = "</graph>"
				End If
				Return wrk
			End Function

			' Get TrendLine XML
			' <trendlines>
			'    <line startvalue='0.8' displayValue='Good' color='FF0000' thickness='1' isTrendZone='0'/>
			'    <line startvalue='-0.4' displayValue='Bad' color='009999' thickness='1' isTrendZone='0'/>
			' </trendlines>
			Public Function ChartTrendLines() As String
				Dim wrk As String = ""
				For Each trend As Object() In Trends ' Get all trend lines
					wrk += "<trendlines>"
					wrk += ChartTrendLine(trend(0), trend(1), trend(2), trend(3), trend(4), trend(5), _
						trend(6), trend(7))
					wrk += "</trendlines>"
				Next
				Return wrk
			End Function

			' Output trend line
			Public Function ChartTrendLine(ByVal startval As Object, ByVal endval As Object, ByVal color As Object, ByVal dispval As Object, ByVal thickness As Object, ByVal trendzone As Object, _
				ByVal showontop As Object, ByVal alpha As Object) As String
				Dim wrk As String = "<line"
				WriteAtt(wrk, "startValue", startval)

				' Starting y value
				If ew_ConvertToDouble(endval) <> 0 Then
					WriteAtt(wrk, "endValue", endval)
				End If

				' Ending y value
				WriteAtt(wrk, "color", CheckColorCode(color))

				' Color
				If ew_NotEmpty(dispval) Then
					WriteAtt(wrk, "displayValue", dispval)
				End If

				' Display value
				If ew_ConvertToInt(thickness) > 0 Then
					WriteAtt(wrk, "thickness", thickness)
				End If

				' Thickness
				WriteAtt(wrk, "isTrendZone", trendzone)

				' Display trend as zone or line
				WriteAtt(wrk, "showOnTop", showontop)

				' Show on top
				If ew_ConvertToInt(alpha) > 0 Then
					WriteAtt(wrk, "alpha", alpha)
				End If

				' Alpha
				wrk += "/>"
				Return wrk
			End Function

			' Category header/footer XML (multi series)
			Public Function ChartCatHeader(ByVal typ As Integer) As String
				Return IIf(typ = 1, "<categories>", "</categories>")
			End Function

			' Category content XML (multi series)
			Public Function ChartCatContent(ByVal name As String) As String
				Dim wrk As String = "<category"
				WriteAtt(wrk, "name", name)
				wrk += "/>"
				Return wrk
			End Function

			' Series header/footer XML (multi series)
			Public Function ChartSeriesHeader(ByVal typ As Integer, ByVal series As Object, ByVal color As String, ByVal alpha As Integer) As String
				Dim wrk As String = ""
				If typ = 1 Then
					wrk = "<dataset"
					Dim seriesname As Object = series
					If ewrpt_IsArray(series) Then	seriesname = CType(series, Object())(0)
					If Convert.IsDBNull(seriesname) Then
						seriesname = ReportLanguage.Phrase("NullLabel")
					ElseIf ew_Empty(seriesname) Then
						seriesname = ReportLanguage.Phrase("EmptyLabel")
					End If
					WriteAtt(wrk, "seriesname", seriesname)
					WriteAtt(wrk, "color", ColorCode(color))
					WriteAtt(wrk, "alpha", alpha)
					If ewrpt_IsArray(series) Then
						WriteAtt(wrk, "parentYAxis", DirectCast(series, Object())(1))
					End If
					wrk += ">"
				Else
					wrk = "</dataset>"
				End If
				Return wrk
			End Function

			' Series content XML (multi series)
			Public Function ChartSeriesContent(ByVal val As Double) As String
				Dim wrk As String = "<set"
				WriteAtt(wrk, "value", ChartFormatNumber(val))
				wrk += "/>"
				Return wrk
			End Function

			' Chart content XML
			Public Function ChartContent(ByVal name As String, ByVal val As Double, ByVal color As String, ByVal alpha As Integer, ByVal lnk As String) As String
				Dim cht_shownames As String = Convert.ToString(LoadParm("shownames"))
				Dim wrk As String = "<set"
				WriteAtt(wrk, "name", name)
				WriteAtt(wrk, "value", ChartFormatNumber(val))
				WriteAtt(wrk, "color", ColorCode(color))
				WriteAtt(wrk, "alpha", alpha)
				WriteAtt(wrk, "link", lnk)
				If cht_shownames = "1" Then
					WriteAtt(wrk, "showName", "1")
				End If
				wrk += " />"
				Return wrk
			End Function

			' Category content XML (Candlestick category)
			Public Function ChartCandlestickCatContent(ByVal xindex As Integer, ByVal name As String) As String
				Dim wrk As String = "<category"
				WriteAtt(wrk, "name", name)
				WriteAtt(wrk, "xindex", xindex)
				WriteAtt(wrk, "showline", "1")
				wrk += "/>"
				Return wrk
			End Function

			' Chart content header XML (Candlestick)
			Public Function ChartCandlestickContentHeader(ByVal typ As Integer) As String
				Return IIf(typ = 1, "<data>", "</data>")
			End Function

			' Chart content XML (Candlestick)
			Public Function ChartCandlestickContent(ByVal open As Double, ByVal high As Double, ByVal low As Double, ByVal close As Double, ByVal xindex As Integer) As String
				Dim wrk As String = "<set"
				WriteAtt(wrk, "open", ChartFormatNumber(open))
				WriteAtt(wrk, "high", ChartFormatNumber(high))
				WriteAtt(wrk, "low", ChartFormatNumber(low))
				WriteAtt(wrk, "close", ChartFormatNumber(close))
				If ew_NotEmpty(xindex) Then
					WriteAtt(wrk, "xindex", xindex)
				End If
				wrk += " />"
				Return wrk
			End Function

			' Format number for chart
			Public Function ChartFormatNumber(ByVal v As Double) As String
				Dim cht_decimalprecision As Object = LoadParm("decimalPrecision")
				If cht_decimalprecision Is Nothing Then
					Return Convert.ToString(v)
				Else
					Return v.ToString("F" + Convert.ToString(cht_decimalprecision), ci)
				End If
			End Function

			' Write attribute
			Public Sub WriteAtt(ByRef str As String, ByVal name As String, ByVal val As Object)
				val = CheckColorCode(val)
				val = ChartEncode(val)
				If ew_NotEmpty(val) Then
					str += " " + name + "=""" + ew_HtmlEncode(val) + """"
				End If
			End Sub

			' Check color code
			Public Function CheckColorCode(ByVal val As Object) As Object
				Dim value As String = Convert.ToString(val)
				If RegexColor.IsMatch(value) Then
					Return value.Substring(1)
				Else
					Return value
				End If
			End Function

			' Encode special characters for FusionChartsFree
			' + => %2B
			Public Function ChartEncode(ByVal val As Object) As Object
				Dim value As String = Convert.ToString(val)
				value = value.Replace("+", "%2B")
				Return value
			End Function
		End Class

		'
		' Column class
		'
		Public Class crCrosstabColumn

			Public Caption As String = ""

			Public Value As Object

			Public Visible As Boolean = True

			Public Sub New(ByVal val As Object, ByVal cap As String, ByVal vis As Boolean)
				Caption = cap
				Value = val
				Visible = vis
			End Sub
		End Class

		'
		' Custom filter class
		'
		Public Class crCustomFilter

			Public FldName As String = ""

			Public FilterName As String = ""

			Public DisplayName As String = ""

			Public FldExpression As String = ""

			Public FunctionName As String = ""

			Public Sub New(ByVal fld As String, ByVal filter As String, ByVal display As String, ByVal exp As String, ByVal fn As String)
				FldName = fld
				FilterName = filter
				DisplayName = display
				FldExpression = exp
				FunctionName = fn
			End Sub
		End Class

		' Load email count
		Public Shared Function ewrpt_LoadEmailCount() As Integer

			' Read from log
			If EWRPT_EMAIL_WRITE_LOG Then
				Dim ip As String = ew_ServerVar("REMOTE_ADDR")

				' Load from database
				If EWRPT_EMAIL_WRITE_LOG_TO_DATABASE Then
					Dim dt1 As String = DateTime.Now.AddMinutes(EWRPT_MAX_EMAIL_SENT_PERIOD * -1).ToString("yyyyMMdd HH:mm:ss")
					Dim dt2 As String = DateTime.Now.ToString("yyyyMMdd HH:mm:ss")
					Dim sEmailSql As String = "SELECT COUNT(*) FROM " + ew_QuotedName(EWRPT_EMAIL_LOG_TABLE_NAME) + " WHERE " + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_DATETIME) + " BETWEEN " + ew_QuotedValue(dt1, EWRPT_DATATYPE_DATE) + " AND " + ew_QuotedValue(dt2, EWRPT_DATATYPE_DATE) + " AND " + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_IP) + " = " + ew_QuotedValue(ip, EWRPT_DATATYPE_STRING)
					Dim cnt As Integer = ew_ConvertToInt(ew_ExecuteScalar(sEmailSql))
					If cnt > -1 Then
						ew_Session(EWRPT_EXPORT_EMAIL_COUNTER) = cnt
					Else
						ew_Session(EWRPT_EXPORT_EMAIL_COUNTER) = 0 ' Load from log file
					End If
				Else
					Dim pfx As String = "email"
					Dim sTab As String = "" & Chr(9) & ""
					Dim sFolder As String = EWRPT_UPLOAD_DEST_PATH
					Dim randomkey As String = cTEA.Encrypt(DateTime.Today.ToString("yyyyMMdd"), EWRPT_RANDOM_KEY)
					randomkey = randomkey.Replace("_", "").Replace("-", "").Replace(".", "").Substring(0, 32)
					Dim sFn As String = pfx + "_" + DateTime.Today.ToString("yyyyMMdd") + "_" + randomkey + ".txt"
					Dim filename As String = ew_UploadPathEx(True, sFolder) + sFn
					If File.Exists(filename) Then
						Dim arLines As String() = File.ReadAllLines(filename)
						Dim cnt As Integer = 0
						For Each line As String In arLines
							If ew_NotEmpty(line) Then
								Dim arwrk As String() = line.Split(New Char() {Convert.ToChar(sTab)})
								Dim dtwrk As DateTime
								If DateTime.TryParse(arwrk(0), dtwrk) Then
									Dim ipwrk As String = arwrk(1)
									If ipwrk = ip AndAlso dtwrk.AddMinutes(EWRPT_MAX_EMAIL_SENT_PERIOD) > DateTime.Now Then
										cnt += 1
									End If
								End If
							End If
						Next
						ew_Session(EWRPT_EXPORT_EMAIL_COUNTER) = cnt
					Else
						ew_Session(EWRPT_EXPORT_EMAIL_COUNTER) = 0
					End If
				End If
			End If
			If ew_Session(EWRPT_EXPORT_EMAIL_COUNTER) Is Nothing Then
				ew_Session(EWRPT_EXPORT_EMAIL_COUNTER) = 0
			End If
			Return ew_ConvertToInt(ew_Session(EWRPT_EXPORT_EMAIL_COUNTER))
		End Function

		' Add email log
		Public Sub ewrpt_AddEmailLog(ByVal sender As String, ByVal recipient As String, ByVal subject As String, ByVal message As String)
			Dim cnt As Integer = ew_ConvertToInt(ew_Session(EWRPT_EXPORT_EMAIL_COUNTER))
			ew_Session(EWRPT_EXPORT_EMAIL_COUNTER) = System.Math.Max(System.Threading.Interlocked.Increment(cnt),cnt - 1)

			' Save to email log
			If EWRPT_EMAIL_WRITE_LOG Then
				Dim dt As String = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
				Dim ip As String = ew_ServerVar("REMOTE_ADDR")
				Dim senderwrk As String = ewrpt_TruncateText(sender)
				Dim recipientwrk As String = ewrpt_TruncateText(recipient)
				Dim subjectwrk As String = ewrpt_TruncateText(subject)
				Dim messagewrk As String = ewrpt_TruncateText(message)

				' Save to database
				If EWRPT_EMAIL_WRITE_LOG_TO_DATABASE Then
					Dim sEmailSql As String = "INSERT INTO " + ew_QuotedName(EWRPT_EMAIL_LOG_TABLE_NAME) + " (" + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_DATETIME) + ", " + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_IP) + ", " + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_SENDER) + ", " + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_RECIPIENT) + ", " + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_SUBJECT) + ", " + ew_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_MESSAGE) + ") VALUES (" + ew_QuotedValue(dt, EWRPT_DATATYPE_DATE) + ", " + ew_QuotedValue(ip, EWRPT_DATATYPE_STRING) + ", " + ew_QuotedValue(senderwrk, EWRPT_DATATYPE_STRING) + ", " + ew_QuotedValue(recipientwrk, EWRPT_DATATYPE_STRING) + ", " + ew_QuotedValue(subjectwrk, EWRPT_DATATYPE_STRING) + ", " + ew_QuotedValue(messagewrk, EWRPT_DATATYPE_STRING) + ")"

						' Save to log file
					Conn.Execute(sEmailSql)
				Else
					Dim pfx As String = "email"
					Dim sTab As String = "" & Chr(9) & ""
					Dim sHeader As String = "date/time" + sTab + "ip" + sTab + "sender" + sTab + "recipient" + sTab + "subject" + sTab + "message"
					Dim sMsg As String = dt + sTab + ip + sTab + senderwrk + sTab + recipientwrk + sTab + subjectwrk + sTab + messagewrk
					Dim sFolder As String = EWRPT_UPLOAD_DEST_PATH
					Dim randomkey As String = cTEA.Encrypt(DateTime.Today.ToString("yyyyMMdd"), EWRPT_RANDOM_KEY)
					randomkey = randomkey.Replace("_", "").Replace("-", "").Replace(".", "").Substring(0, 32)
					Dim sFn As String = pfx + "_" + DateTime.Today.ToString("yyyyMMdd") + "_" + randomkey + ".txt"
					Dim filename As String = ew_UploadPathEx(True, sFolder) + sFn
					Dim sw As StreamWriter
					If File.Exists(filename) Then
						sw = File.AppendText(filename)
					Else
						sw = File.CreateText(filename)
						sw.WriteLine(sHeader)
					End If
					sw.WriteLine(sMsg)
					sw.Close()
				End If
			End If
		End Sub

		' Truncate Text
		Public Function ewrpt_TruncateText(ByVal v As String) As String
			Dim maxlen As Integer = EWRPT_EMAIL_LOG_SIZE_LIMIT
			v = v.Replace("" & Chr(13) & "" & Chr(10) & "", " ")
			v = v.Replace("" & Chr(9) & "", " ")
			If v.Length > maxlen Then
				v = v.Substring(0, maxlen - 3) + "..."
			End If
			Return v
		End Function

		' Check if object is Hashtable
		Public Shared Function ewrpt_IsHashtable(ByVal obj As Object) As Boolean
			Return (obj IsNot Nothing) AndAlso (obj.[GetType]().ToString() = "System.Collections.Hashtable")
		End Function

		' Validation functions
		' Check date format
		' format: std/us/euro
		Public Shared Function ewrpt_CheckDateEx(ByVal value As String, ByVal format As String, ByVal sep As String) As Boolean
			If value = "" Then
				Return True
			End If
			While value.Contains("  ")
				value = value.Replace("  ", " ")
			End While
			value = value.Trim()
			Dim arDT As String()
			Dim arD As String()
			Dim pattern As String = ""
			Dim sYear As String = ""
			Dim sMonth As String = ""
			Dim sDay As String = ""
			arDT = value.Split(New Char() {" "C})
			If arDT.Length > 0 Then
				sep = "\" + sep
				Select Case format
					Case "std"
						pattern = "^([0-9]{4})" + sep + "([0]?[1-9]|[1][0-2])" + sep + "([0]?[1-9]|[1|2][0-9]|[3][0|1])"
					Case "us"
						pattern = "^([0]?[1-9]|[1][0-2])" + sep + "([0]?[1-9]|[1|2][0-9]|[3][0|1])" + sep + "([0-9]{4})"
					Case "euro"
						pattern = "^([0]?[1-9]|[1|2][0-9]|[3][0|1])" + sep + "([0]?[1-9]|[1][0-2])" + sep + "([0-9]{4})"
				End Select
				Dim re As New Regex(pattern)
				If Not re.IsMatch(arDT(0)) Then
					Return False
				End If
				arD = arDT(0).Split(New Char() {Convert.ToChar(EWRPT_DATE_SEPARATOR)})
				Select Case format
					Case "std"
						sYear = arD(0)
						sMonth = arD(1)
						sDay = arD(2)
					Case "us"
						sYear = arD(2)
						sMonth = arD(0)
						sDay = arD(1)
					Case "euro"
						sYear = arD(2)
						sMonth = arD(1)
						sDay = arD(0)
				End Select
				If Not ewrpt_CheckDay(ew_ConvertToInt(sYear), ew_ConvertToInt(sMonth), ew_ConvertToInt(sDay)) Then
					Return False
				End If
			End If
			If arDT.Length > 1 AndAlso Not ewrpt_CheckTime(arDT(1)) Then
				Return False
			End If
			Return True
		End Function

		' Check Date format (yyyy/mm/dd)
		Public Shared Function ewrpt_CheckDate(ByVal value As String) As Boolean
			Return ewrpt_CheckDateEx(value, "std", EWRPT_DATE_SEPARATOR)
		End Function

		' Check US Date format (mm/dd/yyyy)
		Public Shared Function ewrpt_CheckUSDate(ByVal value As String) As Boolean
			Return ewrpt_CheckDateEx(value, "us", EWRPT_DATE_SEPARATOR)
		End Function

		' Check Euro Date format (dd/mm/yyyy)
		Public Shared Function ewrpt_CheckEuroDate(ByVal value As String) As Boolean
			Return ewrpt_CheckDateEx(value, "euro", EWRPT_DATE_SEPARATOR)
		End Function

		' Check day
		Public Shared Function ewrpt_CheckDay(ByVal checkYear As Integer, ByVal checkMonth As Integer, ByVal checkDay As Integer) As Boolean
			Dim maxDay As Integer = 31
			If checkMonth = 4 OrElse checkMonth = 6 OrElse checkMonth = 9 OrElse checkMonth = 11 Then
				maxDay = 30
			ElseIf checkMonth = 2 Then
				If checkYear Mod 4 > 0 Then
					maxDay = 28
				ElseIf checkYear Mod 100 = 0 AndAlso checkYear Mod 400 > 0 Then
					maxDay = 28
				Else
					maxDay = 29
				End If
			End If
			Return ewrpt_CheckRange(Convert.ToString(checkDay), 1, maxDay)
		End Function

		' Check integer
		Public Shared Function ewrpt_CheckInteger(ByVal value As String) As Boolean
			If value = "" Then
				Return True
			End If
			Dim re As New Regex("^\-?\+?[0-9]+")
			Return re.IsMatch(value)
		End Function

		' Check number range
		Public Shared Function ewrpt_NumberRange(ByVal value As String, ByVal min As Object, ByVal max As Object) As Boolean
			If (min IsNot Nothing AndAlso Convert.ToDouble(value) < Convert.ToDouble(min)) OrElse (max IsNot Nothing AndAlso Convert.ToDouble(value) > Convert.ToDouble(max)) Then
				Return False
			End If
			Return True
		End Function

		' Check number
		Public Shared Function ewrpt_CheckNumber(ByVal value As String) As Boolean
			If value = "" Then
				Return True
			End If
			Return Information.IsNumeric(Strings.Trim(value))
		End Function

		' Check range
		Public Shared Function ewrpt_CheckRange(ByVal value As String, ByVal min As Object, ByVal max As Object) As Boolean
			If value = "" Then
				Return True
			End If
			If Not ewrpt_CheckNumber(value) Then
				Return False
			End If
			Return ewrpt_NumberRange(value, min, max)
		End Function

		' Check time
		Public Shared Function ewrpt_CheckTime(ByVal value As String) As Boolean
			If value = "" Then
				Return True
			End If
			Dim Values As String() = value.Split(New Char() {"."C, " "C})
			Dim re As New Regex("^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]")
			Return re.IsMatch(Values(0))
		End Function

		' Check US phone number
		Public Shared Function ewrpt_CheckPhone(ByVal value As String) As Boolean
			If value = "" Then
				Return True
			End If
			Dim re As New Regex("^\(\d{3}\) ?\d{3}( |-)?\d{4}|^\d{3}( |-)?\d{3}( |-)?\d{4}")
			Return re.IsMatch(value)
		End Function

		' Check US zip code
		Public Shared Function ewrpt_CheckZip(ByVal value As String) As Boolean
			If value = "" Then
				Return True
			End If
			Dim re As New Regex("^\d{5}|^\d{5}-\d{4}")
			Return re.IsMatch(value)
		End Function

		' Check credit card
		Public Shared Function ewrpt_CheckCreditCard(ByVal value As String) As Boolean
			If value = "" Then
				Return True
			End If
			Dim creditcard As New Hashtable()
			Dim match As Boolean = False
			creditcard.Add("visa", "^4\d{3}[ -]?\d{4}[ -]?\d{4}[ -]?\d{4}")
			creditcard.Add("mastercard", "^5[1-5]\d{2}[ -]?\d{4}[ -]?\d{4}[ -]?\d{4}")
			creditcard.Add("discover", "^6011[ -]?\d{4}[ -]?\d{4}[ -]?\d{4}")
			creditcard.Add("amex", "^3[4,7]\d{13}")
			creditcard.Add("diners", "^3[0,6,8]\d{12}")
			creditcard.Add("bankcard", "^5610[ -]?\d{4}[ -]?\d{4}[ -]?\d{4}")
			creditcard.Add("jcb", "^[3088|3096|3112|3158|3337|3528]\d{12}")
			creditcard.Add("enroute", "^[2014|2149]\d{11}")
			creditcard.Add("switch", "^[4903|4911|4936|5641|6333|6759|6334|6767]\d{12}")
			Dim re As Regex
			For Each de As DictionaryEntry In creditcard
				re = New Regex(Convert.ToString(de.Value))
				If re.IsMatch(value) Then
					Return ewrpt_CheckSum(value)
				End If
			Next
			Return False
		End Function

		' Check sum
		Public Shared Function ewrpt_CheckSum(ByVal value As String) As Boolean
			Dim checksum As Integer
			Dim digit As Byte
			value = value.Replace("-", "")
			value = value.Replace(" ", "")
			checksum = 0
			For i As Integer = 2 - (value.Length Mod 2) To value.Length Step 2
				checksum = checksum + Convert.ToByte(value(i - 1))
			Next
			For i As Integer = (value.Length Mod 2) + 1 To value.Length Step 2
				digit = Convert.ToByte(Convert.ToByte(value(i - 1)) * 2)
				checksum = checksum + IIf(digit < 10, digit, digit - 9)
			Next
			Return (checksum Mod 10 = 0)
		End Function

		' Check US social security number
		Public Shared Function ewrpt_CheckSSC(ByVal value As String) As Boolean
			If value = "" Then
				Return True
			End If
			Dim re As New Regex("^(?!000)([0-6]\d{2}|7([0-6]\d|7[012]))([ -]?)(?!00)\d\d\3(?!0000)\d{4}")
			Return re.IsMatch(value)
		End Function

		' Check email
		Public Shared Function ewrpt_CheckEmail(ByVal value As String) As Boolean
			If value = "" Then
				Return True
			End If
			Dim re As New Regex("^[A-Za-z0-9\._\-+]+@[A-Za-z0-9_\-+]+(\.[A-Za-z0-9_\-+]+)+")
			Return re.IsMatch(value)
		End Function

		' Check emails
		Public Shared Function ewrpt_CheckEmailList(ByVal value As String, ByVal cnt As Integer) As Boolean
			If value = "" Then
				Return True
			End If
			Dim emailList As String = value.Replace(",", ";")
			Dim arEmails As String() = emailList.Split(New Char() {";"c})
			If arEmails.Length > cnt AndAlso cnt > 0 Then
				Return False
			End If
			For Each email As String In arEmails
				If Not ewrpt_CheckEmail(email) Then
					Return False
				End If
			Next
			Return True
		End Function

		' Check GUID
		Public Shared Function ewrpt_CheckGUID(ByVal value As String) As Boolean
			If value = "" Then
				Return True
			End If
			Dim re1 As New Regex("^{{1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}}{1}")
			Dim re2 As New Regex("^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}")
			Return re1.IsMatch(value) OrElse re2.IsMatch(value)
		End Function

		' Check by regular expression
		Public Shared Function ewrpt_CheckByRegEx(ByVal value As String, ByVal pattern As String) As Boolean
			If value = "" Then
				Return True
			End If
			Return Regex.IsMatch(value, pattern)
		End Function

		' Check by regular expression
		Public Shared Function ewrpt_CheckByRegEx(ByVal value As String, ByVal pattern As String, ByVal options As RegexOptions) As Boolean
			If value = "" Then
				Return True
			End If
			Return Regex.IsMatch(value, pattern, options)
		End Function		

		' Save string to file
		Public Shared Function ewrpt_SaveFile(ByVal folder As String, ByVal fn As String, ByVal filedata As String) As Boolean
			If ew_CreateFolder(folder) Then
				Try
					Dim fs As New FileStream(folder + fn, FileMode.Create)
					Dim enc As Encoding
					Try
						enc = Encoding.GetEncoding(EWRPT_EMAIL_CHARSET)
					Catch ' Default	
						enc = Encoding.UTF8
					End Try
					Dim data As Byte() = enc.GetBytes(filedata)
					fs.Write(data, 0, data.Length)
					fs.Close()
					Return True
				Catch
					If EWRPT_DEBUG_ENABLED Then
						Throw
					End If
					Return False
				End Try
			End If
			Return False
		End Function

		' Send email
		Public Shared Function ewrpt_SendEmail(ByVal sFrEmail As String, ByVal sToEmail As String, ByVal sCcEmail As String, ByVal sBccEmail As String, ByVal sSubject As String, ByVal sMail As String, _
			ByVal sAttachmentFileName As String, ByVal sAttachmentContent As String, ByVal sFormat As String, ByVal sCharset As String) As Boolean
			Dim mail As New MailMessage()
			If ew_NotEmpty(sFrEmail) Then
				mail.From = New MailAddress(sFrEmail)
			End If
			If ew_NotEmpty(sToEmail) Then
				sToEmail = sToEmail.Replace(","C, ";"c)
				Dim arTo As String() = sToEmail.Split(New Char() {";"c})
				For Each strTo As String In arTo
					mail.[To].Add(strTo)
				Next
			End If
			If ew_NotEmpty(sCcEmail) Then
				sCcEmail = sCcEmail.Replace(","C, ";"c)
				Dim arCC As String() = sCcEmail.Split(New Char() {";"c})
				For Each strCC As String In arCC
					mail.CC.Add(strCC)
				Next
			End If
			If ew_NotEmpty(sBccEmail) Then
				sBccEmail = sBccEmail.Replace(","C, ";"c)
				Dim arBcc As String() = sBccEmail.Split(New Char() {";"c})
				For Each strBcc As String In arBcc
					mail.Bcc.Add(strBcc)
				Next
			End If
			mail.Subject = sSubject
			mail.Body = sMail
			mail.IsBodyHtml = ew_SameText(sFormat, "html")
			If ew_NotEmpty(sCharset) Then
				mail.BodyEncoding = Encoding.GetEncoding(sCharset)
			End If
			Dim smtp As New SmtpClient()
			smtp.Host = IIf(ew_NotEmpty(EWRPT_SMTP_SERVER), EWRPT_SMTP_SERVER, "localhost")
			If EWRPT_SMTP_SERVER_PORT > 0 Then
				smtp.Port = EWRPT_SMTP_SERVER_PORT
			End If
			If ew_NotEmpty(EWRPT_SMTP_SERVER_USERNAME) AndAlso ew_NotEmpty(EWRPT_SMTP_SERVER_PASSWORD) Then
				Dim smtpuser As New NetworkCredential()
				smtpuser.UserName = EWRPT_SMTP_SERVER_USERNAME
				smtpuser.Password = EWRPT_SMTP_SERVER_PASSWORD
				smtp.UseDefaultCredentials = False
				smtp.Credentials = smtpuser
			End If
			If ew_NotEmpty(sAttachmentFileName) AndAlso ew_NotEmpty(sAttachmentContent) Then

				' HTML
				Dim arByte As Byte() = mail.BodyEncoding.GetBytes(sAttachmentContent)
				Dim stream As New MemoryStream(arByte)
				Dim data As New Attachment(stream, New ContentType(MediaTypeNames.Text.Html))
				Dim disposition As ContentDisposition = data.ContentDisposition
				disposition.FileName = sAttachmentFileName
				mail.Attachments.Add(data)
			ElseIf ew_NotEmpty(sAttachmentFileName) Then

				' URL
				Dim data As New Attachment(sAttachmentFileName, New ContentType(MediaTypeNames.Text.Html))
				mail.Attachments.Add(data)
			End If
			Try
				smtp.Send(mail)
				Return True
			Catch e As Exception
				gsEmailErrDesc = e.ToString()
				If EWRPT_DEBUG_ENABLED Then
					Throw
				End If
				Return False
			End Try
		End Function

		'
		' Email class (Report Maker)
		'
		Public Class crEmail
			Inherits cEmail

			Public AttachmentFileName As String = ""	' Attachment file name

			Public AttachmentContent As String = ""		' Attachement content		

			' Send email
			Public Function Send() As Boolean
				gsEmailErrDesc = ""	' Reset
				Dim bSend As Boolean = ewrpt_SendEmail(Sender, Recipient, Cc, Bcc, Subject, Content, _
					AttachmentFileName, AttachmentContent, Format, Charset)
				If Not bSend Then
					SendErrDescription = gsEmailErrDesc
				End If

				' Send error description
				Return bSend
			End Function

			' Display as string
			Public Function AsString() As String
				Return "{Sender: " + Sender + ", Recipient: " + Recipient + ", Cc: " + Cc + ", Bcc: " + Bcc + ", Subject: " + Subject + ", Format: " + Format + ", Content: " + Content + ", Charset: " + Charset + ", AttachmentFileName: " + AttachmentFileName + ", AttachmentContent: " + AttachmentContent + "}"
			End Function
		End Class

		'
		'  XML document class
		'
		Public Class crXMLDocument
			Implements IDisposable

			Public Encoding As String = ""

			Public RootTagName As String = "table"

			Public RowTagName As String = "row"

			Public XmlDoc As XmlDocument

			Public XmlTbl As XmlElement

			Public XmlRow As XmlElement

			Public XmlFld As XmlElement

			' Constructor
			Public Sub New()
				XmlDoc = New XmlDocument()
			End Sub

			' Add root
			Public Sub AddRoot(ByVal name As String)
				XmlTbl = XmlDoc.CreateElement(name)
				XmlDoc.AppendChild(XmlTbl)
			End Sub

			' Add row
			Public Sub AddRow()
				AddRowEx(RowTagName)
			End Sub

			' Add row by name
			Public Sub AddRowEx(ByVal Name As String)
				XmlRow = XmlDoc.CreateElement(Name)
				XmlTbl.AppendChild(XmlRow)
			End Sub

			' Add field
			Public Sub AddField(ByVal Name As String, ByVal Value As String)
				XmlFld = XmlDoc.CreateElement(Name)
				XmlRow.AppendChild(XmlFld)
				XmlFld.AppendChild(XmlDoc.CreateTextNode(Value + ""))
			End Sub

			' XML
			Public Function XML() As String
				Return XmlDoc.OuterXml
			End Function

			' Output
			Public Sub Output()
				If HttpContext.Current.Response.Buffer Then
					HttpContext.Current.Response.Clear()
				End If
				HttpContext.Current.Response.ContentType = "text/xml"
				Dim PI As String = "<?xml version=""1.0"""
				If Encoding <> "" Then
					PI += " encoding=""" + Encoding + """"
				End If
				PI += " ?>"
				HttpContext.Current.Response.Write(PI + XmlDoc.OuterXml)
			End Sub

			' Output XML for debug
			Public Sub Print()
				If HttpContext.Current.Response.Buffer Then
					HttpContext.Current.Response.Clear()
				End If
				HttpContext.Current.Response.ContentType = "text/plain"
				HttpContext.Current.Response.Write(HttpContext.Current.Server.HtmlEncode(XmlDoc.OuterXml))
			End Sub

			' Load XML
			Public Sub LoadXML(ByVal source As String)
				XmlDoc.LoadXml(source)
			End Sub

			' Create XML element
			Public Function CreateElement(ByVal name As String) As XmlElement
				Return XmlDoc.CreateElement(name)
			End Function

			' getelement
			Public Function GetElementsByTagName(ByVal name As String) As XmlNodeList
				Return XmlDoc.GetElementsByTagName(name)
			End Function

			' Append XML element to target element
			Public Sub AppendChild(ByRef parent As XmlElement, ByRef child As XmlElement)
				If parent Is Nothing OrElse child Is Nothing Then
					Return
				End If
				parent.AppendChild(child)
			End Sub

			' Append XML element to root
			Public Sub AppendChildToRoot(ByRef child As XmlElement)
				AppendChild(XmlTbl, child)
			End Sub

			' Set attribute
			Public Sub SetAttribute(ByRef element As XmlElement, ByVal name As Object, ByVal value As Object)
				If element Is Nothing Then
					Return
				End If
				element.SetAttribute(Convert.ToString(name), Convert.ToString(value))
			End Sub

			' Set attribute // ASPXRPT
			Public Sub SetAttribute(ByRef element As XmlElement, ByVal de As DictionaryEntry)
				If element Is Nothing Then
					Return
				End If
				element.SetAttribute(Convert.ToString(de.Key), Convert.ToString(de.Value))
			End Sub

			' Terminate
			Public Sub Dispose() Implements IDisposable.Dispose
				XmlFld = Nothing
				XmlRow = Nothing
				XmlTbl = Nothing
				XmlDoc = Nothing
			End Sub
		End Class

	' Resize binary to thumbnail
		Public Shared Function ewrpt_ResizeBinary(ByRef filedata As Byte(), ByRef width As Integer, ByRef height As Integer, ByVal interpolation As Integer) As Boolean
			Return True	' No resize
		End Function

		' Resize file to thumbnail file
		Public Shared Function ewtpy_ResizeFile(ByVal fn As String, ByVal tn As String, ByRef width As Integer, ByRef height As Integer, ByVal interpolation As Integer) As Boolean
			Try
				If File.Exists(fn) Then
					File.Copy(fn, tn)	' Copy only
					Return True
				End If
				Return False
			Catch
				If EWRPT_DEBUG_ENABLED Then
					Throw
				End If
				Return False
			End Try
		End Function

		' Resize file to binary
		Public Shared Function ewrpt_ResizeFileToBinary(ByVal fn As String, ByRef width As Integer, ByRef height As Integer, ByVal interpolation As Integer) As Byte()
			Try
				If File.Exists(fn) Then
					Dim oFile As New FileInfo(fn)
					Dim fs As FileStream = oFile.OpenRead()
					Dim lBytes As Long = fs.Length
					If lBytes > 0 Then
						Dim fileData As Byte() = New Byte(lBytes - 1) {}
						fs.Read(fileData, 0, CInt(lBytes))	' Read the file into a byte array
						fs.Close()
						fs.Dispose()
						Return fileData
					End If
				End If
				Return Nothing
			Catch
				If EWRPT_DEBUG_ENABLED Then
					Throw
				End If
				Return Nothing
			End Try
		End Function
End Class
