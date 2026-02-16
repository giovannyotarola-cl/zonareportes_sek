<%@ Page ClassName="Log_Accesosmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_logAcceso" %>
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

	' Table object
	Public Log_Acceso As crLog_Acceso = Nothing

	'
	' Table class (for Log Acceso)
	'
	Public Class crLog_Acceso
		Inherits AspNetReportMakerBase

		Public ShowCurrentFilter As Boolean = EWRPT_SHOW_CURRENT_FILTER

		Public FilterPanelOption As Integer = EWRPT_FILTER_PANEL_OPTION

		Public CurrentOrder As String = "" ' Current order

		Public CurrentOrderType As String = ""	' Current order type

		' Define table level constants
		Public UseTokenInUrl As Boolean = EWRPT_USE_TOKEN_IN_URL

		' Table variable
		Public ReadOnly Property TableVar() As String
			Get
				Return "Log_Acceso"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Log Acceso"
			End Get
		End Property

		' Table type
		Public ReadOnly Property TableType() As String
			Get
				Return "REPORT"
			End Get
		End Property

		' Table caption
		Public Function TableCaption() As String
			Return ReportLanguage.TablePhrase(TableVar, "TblCaption")
		End Function

		' Session Group Per Page
		Public Property GroupPerPage() As Integer
			Get
				Return ew_ConvertToInt(ew_Session(EWRPT_PROJECT_NAME + "_" + TableVar + "_grpperpage"))
			End Get
			Set
				ew_Session(EWRPT_PROJECT_NAME + "_" + TableVar + "_grpperpage") = value
			End Set
		End Property

		' Session Start Group
		Public Property StartGroup() As Integer
			Get
				Return ew_ConvertToInt(ew_Session(EWRPT_PROJECT_NAME + "_" + TableVar + "_start"))
			End Get
			Set
				ew_Session(EWRPT_PROJECT_NAME + "_" + TableVar + "_start") = value
			End Set
		End Property

		' Session Order By
		Public Property OrderBy() As String
			Get
				Return Convert.ToString(ew_Session(EWRPT_PROJECT_NAME + "_" + TableVar + "_orderby"))
			End Get
			Set
				ew_Session(EWRPT_PROJECT_NAME + "_" + TableVar + "_orderby") = value
			End Set
		End Property	

		Public Fields As New Dictionary(Of String, crField)()

		Public FECHA As crField

		Public USERID As crField

		Public USERNAME As crField

		Public USERPWD As crField

		Public INGRESO As crField

		Public USERIP As crField

		Public WEB As crField

		Public Export As String = ""	' Export

		Public ExportAll As Boolean = True

		Public RowType As Integer	' Row type

		Public RowTotalType As Integer	' Row total type

		Public RowTotalSubType As Integer	' Row total subtype

		Public RowGroupLevel As Integer	' Row group level

		Public RowAttrs As New Hashtable()	' Row attributes

		' Reset CSS styles for table object
		Public Sub ResetCSS()
			RowAttrs("style") = ""
			RowAttrs("class") = ""
			For Each fld As KeyValuePair(Of String, crField) In Fields
				fld.Value.ResetCSS()
			Next
		End Sub		

		'
		' Table class constructor
		'		
		Public Sub New(APage As AspNetReportMakerPage)
			m_Page = APage
			m_ParentPage = APage.ParentPage

			' FECHA
			FECHA = new crField("Log_Acceso", "Log Acceso", "x_FECHA", "FECHA", "[FECHA]", 135, EWRPT_DATATYPE_DATE, 11)
			FECHA.Page = APage
			FECHA.ParentPage = APage.ParentPage
			FECHA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECHA", FECHA)
			FECHA.DateFilter = ""
			FECHA.SqlSelect = ""
			FECHA.SqlOrderBy = ""

			' USERID
			USERID = new crField("Log_Acceso", "Log Acceso", "x_USERID", "USERID", "[USERID]", 3, EWRPT_DATATYPE_NUMBER, -1)
			USERID.Page = APage
			USERID.ParentPage = APage.ParentPage
			USERID.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("USERID", USERID)
			USERID.DateFilter = ""
			USERID.SqlSelect = ""
			USERID.SqlOrderBy = ""

			' USERNAME
			USERNAME = new crField("Log_Acceso", "Log Acceso", "x_USERNAME", "USERNAME", "[USERNAME]", 200, EWRPT_DATATYPE_STRING, -1)
			USERNAME.Page = APage
			USERNAME.ParentPage = APage.ParentPage
			Fields.Add("USERNAME", USERNAME)
			USERNAME.DateFilter = ""
			USERNAME.SqlSelect = ""
			USERNAME.SqlOrderBy = ""

			' USERPWD
			USERPWD = new crField("Log_Acceso", "Log Acceso", "x_USERPWD", "USERPWD", "[USERPWD]", 200, EWRPT_DATATYPE_STRING, -1)
			USERPWD.Page = APage
			USERPWD.ParentPage = APage.ParentPage
			Fields.Add("USERPWD", USERPWD)
			USERPWD.DateFilter = ""
			USERPWD.SqlSelect = ""
			USERPWD.SqlOrderBy = ""

			' INGRESO
			INGRESO = new crField("Log_Acceso", "Log Acceso", "x_INGRESO", "INGRESO", "[INGRESO]", 200, EWRPT_DATATYPE_STRING, -1)
			INGRESO.Page = APage
			INGRESO.ParentPage = APage.ParentPage
			Fields.Add("INGRESO", INGRESO)
			INGRESO.DateFilter = ""
			INGRESO.SqlSelect = ""
			INGRESO.SqlOrderBy = ""

			' USERIP
			USERIP = new crField("Log_Acceso", "Log Acceso", "x_USERIP", "USERIP", "[USERIP]", 200, EWRPT_DATATYPE_STRING, -1)
			USERIP.Page = APage
			USERIP.ParentPage = APage.ParentPage
			Fields.Add("USERIP", USERIP)
			USERIP.DateFilter = ""
			USERIP.SqlSelect = ""
			USERIP.SqlOrderBy = ""

			' WEB
			WEB = new crField("Log_Acceso", "Log Acceso", "x_WEB", "WEB", "[WEB]", 200, EWRPT_DATATYPE_STRING, -1)
			WEB.Page = APage
			WEB.ParentPage = APage.ParentPage
			Fields.Add("WEB", WEB)
			WEB.DateFilter = ""
			WEB.SqlSelect = ""
			WEB.SqlOrderBy = ""
		End Sub

		' Single column sort
		Public Sub UpdateSort(ofld As crField)
			If (CurrentOrder = ofld.FldName) Then
				Dim sLastSort As String = ofld.Sort
				Dim sThisSort As String
				If (CurrentOrderType = "ASC" OrElse CurrentOrderType = "DESC") Then
					sThisSort = CurrentOrderType
				Else
					sThisSort = IIf(sLastSort = "ASC", "DESC", "ASC")
				End If
				ofld.Sort = sThisSort
			Else
				If (ofld.GroupingFieldId = 0) Then ofld.Sort = ""
			End If
		End Sub

		' Get Sort SQL
		Public Function SortSql() As String
			Dim sDtlSortSql As String = ""
			Dim argrps As New List(Of String)()
			For Each field As KeyValuePair(Of String, crField) In Fields
				Dim fld As crField = field.Value
				If ew_NotEmpty(fld.Sort) Then
					If fld.GroupingFieldId > 0 Then
						If ew_NotEmpty(fld.FldGroupSql) Then
							argrps.Add(fld.FldGroupSql.Replace("%s", fld.FldExpression) + " " + fld.Sort)
						Else
							argrps.Add(fld.FldExpression + " " + fld.Sort)
						End If
					Else
						If ew_NotEmpty(sDtlSortSql) Then
							sDtlSortSql += ", "
						End If
						sDtlSortSql += fld.FldExpression + " " + fld.Sort
					End If
				End If
			Next
			Dim sSortSql As String = ""
			For Each grp As String In argrps
				If ew_NotEmpty(sSortSql) Then
					sSortSql += ", "
				End If
				sSortSql += grp
			Next
			If ew_NotEmpty(sDtlSortSql) Then
				If ew_NotEmpty(sSortSql) Then
					sSortSql += ", "
				End If
				sSortSql += sDtlSortSql
			End If
			Return sSortSql
		End Function

		' Table level SQL
		Public ReadOnly Property SqlFrom As String ' From
			Get
				Return "[IF_USUARIO_LOG]"
			End Get
		End Property

		Public ReadOnly Property SqlSelect As String ' Select
			Get
				Return "SELECT * FROM " + SqlFrom
			End Get
		End Property

		Public ReadOnly Property SqlWhere As String ' Where
			Get
				Return ""
			End Get
		End Property

		Public ReadOnly Property SqlGroupBy As String ' Group By
			Get
				Return ""
			End Get
		End Property

		Public ReadOnly Property SqlHaving As String ' Having
			Get
				Return ""
			End Get
		End Property

		Public ReadOnly Property SqlOrderBy As String ' Order By
			Get
				Return ""
			End Get
		End Property

		' Table Level Group SQL
		Public ReadOnly Property SqlFirstGroupField As String
			Get
				Return ""
			End Get
		End Property

		Public ReadOnly Property SqlSelectGroup As String
			Get
				Return "SELECT DISTINCT " + SqlFirstGroupField + " FROM " + SqlFrom
			End Get
		End Property

		Public ReadOnly Property SqlOrderByGroup As String
			Get
				Return ""
			End Get
		End Property

		Public ReadOnly Property SqlSelectAgg As String
			Get
				Return "SELECT * FROM " + SqlFrom
			End Get
		End Property

		Public ReadOnly Property SqlAggPfx As String
			Get
				Return ""
			End Get
		End Property

		Public ReadOnly Property SqlAggSfx As String
			Get
				Return ""
			End Get
		End Property

		Public ReadOnly Property SqlSelectCount As String
			Get
				Return "SELECT COUNT(*) FROM " + SqlFrom
			End Get
		End Property

		' Sort URL
		Public Function SortUrl(fld As crField) As String
			Return ""
		End Function

		' Row attributes
		Public Function RowAttributes() As String
			Dim sAtt As String = ""
			For Each Attr As DictionaryEntry In RowAttrs
				If ew_NotEmpty(Attr.Value) Then
					sAtt += " " + Attr.Key + "=""" + Convert.ToString(Attr.Value).Trim() + """"
				End If
			Next
			Return sAtt
		End Function

		' Table level events
		' Row Rendering event
		Public Sub Row_Rendering()

			' Enter your code here	
		End Sub

		' Row Rendered event
		Public Sub Row_Rendered()

			' To view properties of field class, use:
			' ew_Write(<FieldName>.AsString())

		End Sub

		' Load Custom Filters event
		Public Sub CustomFilters_Load()

			'Enter your code here	
			'ewrpt_RegisterCustomFilter(<Field>, "LastMonth", "Last Month", "GetLastMonthFilter") ' Date example
			'ewrpt_RegisterCustomFilter(<Field>, "StartsWithA", "Starts With A", "GetStartsWithAFilter") ' String example

		End Sub

		' Page Filter Validated event
		Public Sub Page_FilterValidated()

			'Example:
			'MyField1.SearchValue = "your search criteria" ' Search value

		End Sub

		' Chart Rendering event
		Public Sub Chart_Rendering(ByRef chart As Object)

			'Dim cht As crChart = CType(chart, crChart) ' Convert to crChart type or
			'Dim cht As crGantt = CType(chart, crGantt) ' Convert to crGantt type
			' Enter your code here

		End Sub

		' Chart Rendered event
		Public Sub Chart_Rendered(chart As Object, ByRef chartxml As String)

			'Dim cht As crChart = CType(chart, crChart) ' Convert to crChart type or
			'Dim cht As crGantt = CType(chart, crGantt) ' Convert to crGantt type
			' Enter your code here

		End Sub

		' Email Sending event
		Public Function Email_Sending(ByRef Email As crEmail, Args As Hashtable) As Boolean

			'ew_Write(Email.AsString())
			'HttpContext.Current.Response.End()

			Return True
		End Function
	End Class

	' Page object
	Public Log_Acceso_summary As crLog_Acceso_summary

	'
	' Page class
	'
	Public Class crLog_Acceso_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Log_Acceso.UseTokenInUrl) Then
				sUrl &= "t=" & Log_Acceso.TableVar & "&" ' Add page token
			End If
			Return sUrl
		End Function

		' Export URLs
		Public ExportPrintUrl As String = ""

		Public ExportExcelUrl As String = ""

		Public ExportWordUrl As String = ""

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

		Public PageHeader As String = ""

		Public PageFooter As String = ""

		' Show Page Header
		Public Sub ShowPageHeader()
			Dim sHeader As String = PageHeader
			Page_DataRendering(sHeader)
			If (ew_NotEmpty(sHeader)) Then ' Header exists, display
				ew_Write("<p><span class=""aspnetreportmaker"">" & sHeader & "</span></p>")
			End If
		End Sub

		' Show Page Footer
		Public Sub ShowPageFooter()
			Dim sFooter As String = PageFooter
			Page_DataRendered(sFooter)
			If (ew_NotEmpty(sFooter)) Then ' Footer exists, display
				ew_Write("<p><span class=""aspnetreportmaker"">" & sFooter & "</span></p>")
			End If
		End Sub

		' Validate page request
		Public Function IsPageRequest() As Boolean
			If (Log_Acceso.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Log_Acceso.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Log_Acceso.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Log_Accesosmry 
			Get
				Return CType(m_ParentPage, Log_Accesosmry)
			End Get
		End Property

		' Table object (Log_Acceso)
		Public Property Log_Acceso As crLog_Acceso 
			Get		
				Return AspNetPage.Log_Acceso ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crLog_Acceso)
				AspNetPage.Log_Acceso = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_logAcceso)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Log_Acceso_summary"
			m_PageObjTypeName = "crLog_Acceso_summary"

			' Table name
			m_TableName = "Log Acceso"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Log_Acceso)
			Log_Acceso = New crLog_Acceso(Me)			

			' Initialize URLs
			ExportPrintUrl = PageUrl() & "export=print"
			ExportExcelUrl = PageUrl() & "export=excel"
			ExportWordUrl = PageUrl() & "export=word"

			' Open connection
			Conn = New cConnection()
		End Sub

		' 
		'  Page_Init
		'
		Public Sub Page_Init()

			' Get export parameters
			If (ew_NotEmpty(ew_Get("export"))) Then
				Log_Acceso.Export = ew_Get("export")
			End If
			gsExport = Log_Acceso.Export ' Get export parameter, used in header
			gsExportFile = Log_Acceso.TableVar ' Get export file, used in header
			If (Log_Acceso.Export = "excel") Then
				HttpContext.Current.Response.ContentType = "application/vnd.ms-excel;charset=utf-8"
				HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" & gsExportFile & ".xls")	
			End If

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

		' Temp variables
		Public dr As SqlDataReader	' DataReader

		Public rs As New ArrayList()

		Public rsgrp As New ArrayList()

		Public HasRow As Boolean

		Public GrpIndex As Integer = 0

		Public RowIndex As Integer = 0

		' Page variables
		Public RecCount As Integer = 0 ' Record count

		Public StartGrp As Integer = 0 ' Start group

		Public StopGrp As Integer = 0	' Stop group

		Public TotalGrps As Integer = 0	' Total groups

		Public GrpCount As Integer = 0 ' Group count

		Public DisplayGrps As Integer = 20	' Groups per page

		Public GrpRange As Integer = 10

		Public Sort As String = ""

		Public Filter As String = ""

		Public UserIDFilter As String = ""

		' Clear field for ext filter
		Public ClearExtFilter As String = ""

		Public FilterApplied As Boolean

		Public ShowFirstHeader As Boolean

		Public Val As Object() = New Object(6) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(6) {}

		Public GrandMn As Object() = New Object(6) {}

		Public GrandMx As Object() = New Object(6) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 7 ' No. of fields
			Dim nGrps As Integer = 1 ' No. of groups (level 0 used for grand total)
			For i As Integer = 0 To nGrps - 1
				Cnt(i) = New Integer(nDtls-1) {}
				Smry(i) = New Object(nDtls-1) {}
				Mn(i) = New Object(nDtls-1) {}
				Mx(i) = New Object(nDtls-1) {}
			Next

			' Set up groups per page dynamically
			SetUpDisplayGrps()

			' Load default filter values
			LoadDefaultFilters()

			' Set up popup filter
			SetupPopup()

			' Extended filter
			Dim sExtendedFilter As String = ""

			' Get dropdown values
			GetExtendedFilterValues()

			' Load custom filters
			Log_Acceso.CustomFilters_Load()

			' Build extended filter
			sExtendedFilter = GetExtendedFilter()
			If (ew_NotEmpty(sExtendedFilter)) Then
				If (ew_NotEmpty(Filter)) Then
	  			Filter = "(" + Filter + ") AND (" + sExtendedFilter + ")"
				Else
					Filter = sExtendedFilter
				End If
			End If

			' Build popup filter
			Dim sPopupFilter As String = GetPopupFilter()

			'ew_SetDebugMsg("popup filter: " + sPopupFilter)
			If (ew_NotEmpty(sPopupFilter)) Then
				If (ew_NotEmpty(Filter)) Then
					Filter = "(" + Filter + ") AND (" + sPopupFilter + ")"
				Else
					Filter = sPopupFilter
				End If
			End If

			' Check if filter applied
			FilterApplied = CheckFilter()

			' Get sort
			Sort = GetSort()

			' Get total count
			Dim sSql As String = ewrpt_BuildReportSql(Log_Acceso.SqlSelect, Log_Acceso.SqlWhere, Log_Acceso.SqlGroupBy, Log_Acceso.SqlHaving, Log_Acceso.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Log_Acceso.ExportAll AndAlso ew_NotEmpty(Log_Acceso.Export)) Then
				DisplayGrps = TotalGrps
			Else
				SetUpStartGroup()
			End If 

			' Get current page records
			dr = GetRs(sSql, StartGrp, DisplayGrps)
		End Sub

		' Accummulate summary
		Public Sub AccumulateSummary()
			Dim cntx As Integer = Smry.Length
			For ix As Integer = 0 To cntx - 1
				Dim cnty As Integer = Smry(ix).Length
				For iy As Integer = 1 To cnty - 1
					Cnt(ix)(iy) += 1
					If Col(iy) Then
						Dim valwrk As Object = Val(iy)
						If Convert.IsDBNull(valwrk) OrElse Not ewrpt_IsNumeric(valwrk) Then

							' Skip
						Else
							Smry(ix)(iy) = Convert.ToDouble(Smry(ix)(iy)) + Convert.ToDouble(valwrk)
							If Mn(ix)(iy) Is Nothing Then
								Mn(ix)(iy) = valwrk
								Mx(ix)(iy) = valwrk
							Else
								If Convert.ToDouble(Mn(ix)(iy)) > Convert.ToDouble(valwrk) Then
									Mn(ix)(iy) = valwrk
								End If
								If Convert.ToDouble(Mx(ix)(iy)) < Convert.ToDouble(valwrk) Then
									Mx(ix)(iy) = valwrk
								End If
							End If
						End If
					End If
				Next
			Next
			cntx = Smry.Length
			For ix As Integer = 1 To cntx - 1
				Cnt(ix)(0) += 1
			Next
		End Sub

		' Reset level summary
		Public Sub ResetLevelSummary(ByVal lvl As Integer)
			Dim cntx As Integer = Smry.Length
			For ix As Integer = lvl To cntx - 1
				Dim cnty As Integer = Smry(ix).Length
				For iy As Integer = 1 To cnty - 1
					Cnt(ix)(iy) = 0
					If Col(iy) Then
						Smry(ix)(iy) = 0
						Mn(ix)(iy) = Nothing
						Mx(ix)(iy) = Nothing
					End If
				Next
			Next
			cntx = Smry.Length
			For ix As Integer = lvl To cntx - 1
				Cnt(ix)(0) = 0
			Next

			' Reset record count
			RecCount = 0
		End Sub

		' Accummulate grand summary
		Public Sub AccumulateGrandSummary()
			Cnt(0)(0) += 1
			Dim cntgs As Integer = GrandSmry.Length
			For iy As Integer = 1 To cntgs - 1
				If Col(iy) Then
					Dim valwrk As Object = Val(iy)

							' skip
					If Convert.IsDBNull(valwrk) OrElse Not ewrpt_IsNumeric(valwrk) Then
					Else
						GrandSmry(iy) = Convert.ToDouble(GrandSmry(iy)) + Convert.ToDouble(valwrk)
						If ew_Empty(GrandMn(iy)) Then
							GrandMn(iy) = valwrk
							GrandMx(iy) = valwrk
						Else
							If Convert.ToDouble(GrandMn(iy)) > Convert.ToDouble(valwrk) Then
								GrandMn(iy) = valwrk
							End If
							If Convert.ToDouble(GrandMx(iy)) < Convert.ToDouble(valwrk) Then
								GrandMx(iy) = valwrk
							End If
						End If
					End If
				End If
			Next
		End Sub

		' Get count
		Public Function GetCnt(ByVal sql As String) As Integer
			Try
				Dim cnt As Object = ew_ExecuteScalar("SELECT COUNT(*) FROM (" + sql + ") AS EWRPT_TEMP_TABLE")
				If cnt IsNot Nothing Then
					Return ew_ConvertToInt(cnt)
				Else
					Throw New Exception("Failed to get record count")
				End If
			Catch
				Dim dr As SqlDataReader = Conn.GetTempDataReader(sql)
				Dim rscnt As Integer = 0
				If dr IsNot Nothing AndAlso dr.HasRows Then
					While dr.Read()
						rscnt += 1
					End While
				End If
				Conn.CloseTempDataReader()
				Return rscnt
			End Try
		End Function

		' Get rs
		Public Function GetRs(ByVal sql As String, ByVal start As Integer, ByVal grps As Integer) As SqlDataReader
			GrpIndex = -1
			Dim dr As SqlDataReader = Conn.GetDataReader(sql)
			For i As Integer = 1 To start - 1
				HasRow = dr.Read()
				GrpIndex += 1
				If Not HasRow Then
					Exit For
				End If
			Next
			Return dr
		End Function

		' Get row values
		Public Sub GetRow(opt As Integer)
			Dim Row As OrderedDictionary
			If (RowIndex >= rs.Count) Then Return
			RowIndex = IIf(opt = 1, 0, RowIndex + 1)
			If (RowIndex < rs.Count) Then
				Row = CType(rs(RowIndex), OrderedDictionary)		
				Log_Acceso.USERID.DbValue = Row("USERID")
				Log_Acceso.USERNAME.DbValue = Row("USERNAME")
				Log_Acceso.USERPWD.DbValue = Row("USERPWD")
				Log_Acceso.USERIP.DbValue = Row("USERIP")
				Log_Acceso.FECHA.DbValue = Row("FECHA")
				Log_Acceso.INGRESO.DbValue = Row("INGRESO")
				Log_Acceso.WEB.DbValue = Row("WEB")
				Val(1) = Log_Acceso.FECHA.CurrentValue
				Val(2) = Log_Acceso.USERID.CurrentValue
				Val(3) = Log_Acceso.USERNAME.CurrentValue
				Val(4) = Log_Acceso.USERPWD.CurrentValue
				Val(5) = Log_Acceso.INGRESO.CurrentValue
				Val(6) = Log_Acceso.USERIP.CurrentValue
			Else
				Log_Acceso.USERID.DbValue = ""
				Log_Acceso.USERNAME.DbValue = ""
				Log_Acceso.USERPWD.DbValue = ""
				Log_Acceso.USERIP.DbValue = ""
				Log_Acceso.FECHA.DbValue = ""
				Log_Acceso.INGRESO.DbValue = ""
				Log_Acceso.WEB.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Log_Acceso.USERID.DbValue = dr("USERID")
				Log_Acceso.USERNAME.DbValue = dr("USERNAME")
				Log_Acceso.USERPWD.DbValue = dr("USERPWD")
				Log_Acceso.USERIP.DbValue = dr("USERIP")
				Log_Acceso.FECHA.DbValue = dr("FECHA")
				Log_Acceso.INGRESO.DbValue = dr("INGRESO")
				Log_Acceso.WEB.DbValue = dr("WEB")
				Val(1) = Log_Acceso.FECHA.CurrentValue
				Val(2) = Log_Acceso.USERID.CurrentValue
				Val(3) = Log_Acceso.USERNAME.CurrentValue
				Val(4) = Log_Acceso.USERPWD.CurrentValue
				Val(5) = Log_Acceso.INGRESO.CurrentValue
				Val(6) = Log_Acceso.USERIP.CurrentValue
			Else				
				Log_Acceso.USERID.DbValue = ""
				Log_Acceso.USERNAME.DbValue = ""
				Log_Acceso.USERPWD.DbValue = ""
				Log_Acceso.USERIP.DbValue = ""
				Log_Acceso.FECHA.DbValue = ""
				Log_Acceso.INGRESO.DbValue = ""
				Log_Acceso.WEB.DbValue = ""
			End If
			Return HasRow		
		End Function

		' Set up starting group
		Public Sub SetUpStartGroup()

			' Exit if no groups
			If DisplayGrps = 0 Then
				Return
			End If

			' Check for a "start" parameter 
			If ew_NotEmpty(ew_Get(EWRPT_TABLE_START_GROUP)) AndAlso ewrpt_IsNumeric(ew_Get(EWRPT_TABLE_START_GROUP)) Then
				StartGrp = ew_ConvertToInt(ew_Get(EWRPT_TABLE_START_GROUP))
				Log_Acceso.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Log_Acceso.StartGroup = StartGrp
				Else
					StartGrp = Log_Acceso.StartGroup
				End If
			Else
				StartGrp = Log_Acceso.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Log_Acceso.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Log_Acceso.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Log_Acceso.StartGroup = StartGrp
			End If
		End Sub

		' Set up popup
		Public Sub SetupPopup()	
		  Dim sSql As String = ""
		  Dim rswrk As SqlDataReader
		  Dim bNullValue As Boolean
		  Dim bEmptyValue As Boolean
			Dim grpval As Object

			' Initialize popup
			' Process post back form

			If (HttpContext.Current.Request.Form.Count > 0) Then
				Dim sName As String = ew_Post("popup") ' Get popup form name
				If (ew_NotEmpty(sName)) Then
					Dim arValues As Object = HttpContext.Current.Request.Form.GetValues("sel_" + sName)
					Dim cntValues As Integer = CType(arValues, String()).Length
					If (cntValues > 0) Then
						If (ew_Empty(CType(arValues, String())(0))) Then ' Select all
							arValues = EWRPT_INIT_VALUE
						End If
						If Not ewrpt_MatchedArray(arValues, ew_Session("sel_" + sName)) Then
							If (HasSessionFilterValues(sName)) Then
								ClearExtFilter = sName ' Clear extended filter for this field
							End If
						End If
						ew_Session("sel_" + sName) = arValues
						ew_Session("rf_" + sName) = ew_Post("rf_" + sName)
						ew_Session("rt_" + sName) = ew_Post("rt_" + sName)
						ResetPager()
					End If
				End If

			' Get 'reset' command
			ElseIf (ew_NotEmpty(ew_Get("cmd"))) Then '  Get reset cmd
				Dim sCmd As String = ew_Get("cmd")
				If (ew_SameText(sCmd, "reset")) Then
					ResetPager()
				End If
			End If

			' Load selection criteria to array
		End Sub

		' Reset pager to starting position
		Public Sub ResetPager()
			StartGrp = 1
			Log_Acceso.StartGroup = StartGrp
		End Sub

		Public Pager As cPrevNextPager

		' Set up number of groups displayed per page based on form element GrpPerPage 
		Public Sub SetUpDisplayGrps()
			Dim sWrk As String = ew_Get(EWRPT_TABLE_GROUP_PER_PAGE)
			If (ew_NotEmpty(sWrk)) Then 
				If (ewrpt_IsNumeric(sWrk)) Then 
					DisplayGrps = ew_ConvertToInt(sWrk) 
				Else 
					If (ew_SameText(sWrk, "ALL")) Then ' Display all records 
						DisplayGrps = -1 
					Else 
						DisplayGrps = 20 ' Non-numeric, load default 
					End If 
				End If				
				Log_Acceso.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Log_Acceso.StartGroup = StartGrp
			Else				
				If (Log_Acceso.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Log_Acceso.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Log_Acceso.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Log_Acceso.SqlSelectCount, Log_Acceso.SqlWhere, Log_Acceso.SqlGroupBy, Log_Acceso.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Log_Acceso.Row_Rendering()

			'
			' Render view codes
			'

			If (Log_Acceso.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' FECHA
				Log_Acceso.FECHA.ViewValue = Convert.ToString(Log_Acceso.FECHA.Summary)
				Log_Acceso.FECHA.ViewValue = ew_FormatDateTime(Log_Acceso.FECHA.ViewValue, 11)

				' USERID
				Log_Acceso.USERID.ViewValue = Convert.ToString(Log_Acceso.USERID.Summary)

				' USERNAME
				Log_Acceso.USERNAME.ViewValue = Convert.ToString(Log_Acceso.USERNAME.Summary)

				' USERPWD
				Log_Acceso.USERPWD.ViewValue = Convert.ToString(Log_Acceso.USERPWD.Summary)

				' INGRESO
				Log_Acceso.INGRESO.ViewValue = Convert.ToString(Log_Acceso.INGRESO.Summary)

				' USERIP
				Log_Acceso.USERIP.ViewValue = Convert.ToString(Log_Acceso.USERIP.Summary)
			Else

				' FECHA
				Log_Acceso.FECHA.ViewValue = Convert.ToString(Log_Acceso.FECHA.CurrentValue)
				Log_Acceso.FECHA.ViewValue = ew_FormatDateTime(Log_Acceso.FECHA.ViewValue, 11)
				Log_Acceso.FECHA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' USERID
				Log_Acceso.USERID.ViewValue = Convert.ToString(Log_Acceso.USERID.CurrentValue)
				Log_Acceso.USERID.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' USERNAME
				Log_Acceso.USERNAME.ViewValue = Convert.ToString(Log_Acceso.USERNAME.CurrentValue)
				Log_Acceso.USERNAME.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' USERPWD
				Log_Acceso.USERPWD.ViewValue = Convert.ToString(Log_Acceso.USERPWD.CurrentValue)
				Log_Acceso.USERPWD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' INGRESO
				Log_Acceso.INGRESO.ViewValue = Convert.ToString(Log_Acceso.INGRESO.CurrentValue)
				Log_Acceso.INGRESO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' USERIP
				Log_Acceso.USERIP.ViewValue = Convert.ToString(Log_Acceso.USERIP.CurrentValue)
				Log_Acceso.USERIP.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' FECHA
			Log_Acceso.FECHA.HrefValue = ""

			' USERID
			Log_Acceso.USERID.HrefValue = ""

			' USERNAME
			Log_Acceso.USERNAME.HrefValue = ""

			' USERPWD
			Log_Acceso.USERPWD.HrefValue = ""

			' INGRESO
			Log_Acceso.INGRESO.HrefValue = ""

			' USERIP
			Log_Acceso.USERIP.HrefValue = ""

			' Call Row_Rendered event
			Log_Acceso.Row_Rendered()
		End Sub

	'
	' Extended filter
	'
	' Get extended filter values
	Public Sub GetExtendedFilterValues()
		Dim sSelect As String
		Dim sWhere As String = ""
		Dim sOrderBy As String
		Dim wrkSql As String

			' Field USERID
			sSelect = "SELECT DISTINCT [USERID] FROM " + Log_Acceso.SqlFrom
			sOrderBy = "[USERID] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Log_Acceso.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Log_Acceso.USERID.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field USERNAME
			sSelect = "SELECT DISTINCT [USERNAME] FROM " + Log_Acceso.SqlFrom
			sOrderBy = "[USERNAME] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Log_Acceso.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Log_Acceso.USERNAME.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field INGRESO
			sSelect = "SELECT DISTINCT [INGRESO] FROM " + Log_Acceso.SqlFrom
			sOrderBy = "[INGRESO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Log_Acceso.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Log_Acceso.INGRESO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
	End Sub

	' Return extended filter
	Public Function GetExtendedFilter() As String
		Dim sFilter As String = ""
	  Dim sWrk As String
	  Dim bPostBack As Boolean = (HttpContext.Current.Request.Form.Count > 0)
	  Dim bRestoreSession As Boolean = True
		Dim bSetupFilter As Boolean = False		
		If bPostBack Then ' Reset extended filter if filter changed
		ElseIf ew_SameText(ew_Get("cmd"), "reset") Then ' Reset search command

				' Field FECHA
				SetSessionFilterValues(Log_Acceso.FECHA)

				' Field USERID
				SetSessionDropDownValue(Log_Acceso.USERID.DropDownValue, Log_Acceso.USERID)

				' Field USERNAME
				SetSessionDropDownValue(Log_Acceso.USERNAME.DropDownValue, Log_Acceso.USERNAME)

				' Field INGRESO
				SetSessionDropDownValue(Log_Acceso.INGRESO.DropDownValue, Log_Acceso.INGRESO)

				' Field USERIP
				SetSessionFilterValues(Log_Acceso.USERIP)
			bSetupFilter = True ' Set up filter required
		Else

				' Field FECHA
				If (GetFilterValues(Log_Acceso.FECHA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field USERID
				If (GetDropDownValue(Log_Acceso.USERID)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Log_Acceso.USERID.DropDownValue) Then
					If Not ew_SameStr(Log_Acceso.USERID.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Log_Acceso_USERID") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field USERNAME
				If (GetDropDownValue(Log_Acceso.USERNAME)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Log_Acceso.USERNAME.DropDownValue) Then
					If Not ew_SameStr(Log_Acceso.USERNAME.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Log_Acceso_USERNAME") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field INGRESO
				If (GetDropDownValue(Log_Acceso.INGRESO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Log_Acceso.INGRESO.DropDownValue) Then
					If Not ew_SameStr(Log_Acceso.INGRESO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Log_Acceso_INGRESO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field USERIP
				If (GetFilterValues(Log_Acceso.USERIP)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If
			If Not ValidateForm() Then
				Message = gsFormError
				Return sFilter
			End If
		End If

		' Restore session
		If bRestoreSession Then

			' Field FECHA
			GetSessionFilterValues(Log_Acceso.FECHA)

			' Field USERID
			GetSessionDropDownValue(Log_Acceso.USERID)

			' Field USERNAME
			GetSessionDropDownValue(Log_Acceso.USERNAME)

			' Field INGRESO
			GetSessionDropDownValue(Log_Acceso.INGRESO)

			' Field USERIP
			GetSessionFilterValues(Log_Acceso.USERIP)
		End If

		' Call page filter validated event
		Log_Acceso.Page_FilterValidated()

		' Build SQL
		' Field FECHA

		BuildExtendedFilter(Log_Acceso.FECHA, sFilter)

		' Field USERID
		BuildDropDownFilter(Log_Acceso.USERID, sFilter, "")

		' Field USERNAME
		BuildDropDownFilter(Log_Acceso.USERNAME, sFilter, "")

		' Field INGRESO
		BuildDropDownFilter(Log_Acceso.INGRESO, sFilter, "")

		' Field USERIP
		BuildExtendedFilter(Log_Acceso.USERIP, sFilter)

		' Save parms to Session
		' Field FECHA

		SetSessionFilterValues(Log_Acceso.FECHA)

		' Field USERID
		SetSessionDropDownValue(Log_Acceso.USERID.DropDownValue, Log_Acceso.USERID)

		' Field USERNAME
		SetSessionDropDownValue(Log_Acceso.USERNAME.DropDownValue, Log_Acceso.USERNAME)

		' Field INGRESO
		SetSessionDropDownValue(Log_Acceso.INGRESO.DropDownValue, Log_Acceso.INGRESO)

		' Field USERIP
		SetSessionFilterValues(Log_Acceso.USERIP)

		' Setup filter
		If bSetupFilter Then
			Dim sSql As String
		End If
		Return sFilter
	End Function	

	' Get drop down value from querystring 
	Public Function GetDropDownValue(ByRef fld As crField) As Boolean
		If HttpContext.Current.Request.Form.Count > 0 Then
			Return False
		End If

		' Skip post back
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_NotEmpty(ew_Get("sv_" + parm)) Then
			Dim sv As Object = HttpContext.Current.Request.QueryString.GetValues("sv_" + parm)
			If DirectCast(sv, String()).Length = 1 Then
				sv = ew_Get("sv_" + parm)
			End If
			fld.DropDownValue = sv
			Return True
		End If
		Return False
	End Function

	' Get filter values from querystring 
	Public Function GetFilterValues(ByRef fld As crField) As Boolean
		Dim parm As String = fld.FldVar.Substring(2)
		Dim ReturnValue As Boolean = False

		' Skip post back 
		If HttpContext.Current.Request.Form.Count > 0 Then	Return ReturnValue
		If HttpContext.Current.Request.QueryString("sv1_" & parm) IsNot Nothing Then
			fld.SearchValue = ew_Get("sv1_" & parm)
			ReturnValue = True
		End If
		If HttpContext.Current.Request.QueryString("so1_" & parm) IsNot Nothing Then
			fld.SearchOperator = ew_Get("so1_" & parm)
			ReturnValue = True
		End If
		If HttpContext.Current.Request.QueryString("sc_" & parm) IsNot Nothing Then
			fld.SearchCondition = ew_Get("sc_" & parm)
			ReturnValue = True
		End If
		If HttpContext.Current.Request.QueryString("sv2_" & parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Get("sv2_" & parm)
			ReturnValue = True
		End If
		If HttpContext.Current.Request.QueryString("so2_" & parm) IsNot Nothing Then
			fld.SearchOperator2 = ew_Get("so2_" & parm)
			ReturnValue = True
		End If
		Return ReturnValue
	End Function

			' Set default ext filter
	Public Sub SetDefaultExtFilter(ByRef fld As crField, ByVal so1 As String, ByVal sv1 As String, ByVal sc As String, ByVal so2 As String, ByVal sv2 As String)
		fld.DefaultSearchValue = sv1 ' Default ext filter value 1
		fld.DefaultSearchOperator = so1	' Default search operator 1
		fld.DefaultSearchCondition = sc	' Default search condition (if operator 2 is enabled)
		fld.DefaultSearchValue2 = sv2	' Default ext filter value 2 (if operator 2 is enabled)
		fld.DefaultSearchOperator2 = so2 ' Default search operator 2 (if operator 2 is enabled)
	End Sub

	' Apply default ext filter
	Public Sub ApplyDefaultExtFilter(ByRef fld As crField)
		fld.SearchValue = fld.DefaultSearchValue
		fld.SearchOperator = fld.DefaultSearchOperator
		fld.SearchCondition = fld.DefaultSearchCondition
		fld.SearchValue2 = fld.DefaultSearchValue2
		fld.SearchOperator2 = fld.DefaultSearchOperator2
	End Sub

	' Check if Text Filter applied
	Public Function TextFilterApplied(ByRef fld As crField) As Boolean
		Return (Not ew_SameStr(fld.SearchValue, fld.DefaultSearchValue) OrElse Not ew_SameStr(fld.SearchValue2, fld.DefaultSearchValue2) OrElse (ew_NotEmpty(fld.SearchValue) AndAlso Not ew_SameStr(fld.SearchOperator, fld.DefaultSearchOperator)) OrElse (ew_NotEmpty(fld.SearchValue2) AndAlso Not ew_SameStr(fld.SearchOperator2, fld.DefaultSearchOperator2)) OrElse Not ew_SameStr(fld.SearchCondition, fld.DefaultSearchCondition))
	End Function

	' Check if Non-Text Filter applied
	Public Function NonTextFilterApplied(ByRef fld As crField) As Boolean
		If ewrpt_IsArray(fld.DefaultDropDownValue) AndAlso ewrpt_IsArray(fld.DropDownValue) Then
			Dim ar1 As String() = DirectCast(fld.DropDownValue, String())
			Dim ar2 As String() = DirectCast(fld.DefaultDropDownValue, String())
			If ar1.Length <> ar2.Length Then
				Return True
			Else
				Array.Sort(ar1)
				Array.Sort(ar2)
				Return Not ewrpt_MatchedArray(ar1, ar2)
			End If
		ElseIf ewrpt_IsArray(fld.DefaultDropDownValue) OrElse ewrpt_IsArray(fld.DropDownValue) Then
			Return True
		Else
			Dim v1 As String = Convert.ToString(fld.DefaultDropDownValue)
			If v1 = EWRPT_INIT_VALUE Then
				v1 = ""
			End If
			Dim v2 As String = Convert.ToString(fld.DropDownValue)
			If v2 = EWRPT_INIT_VALUE OrElse v2 = EWRPT_ALL_VALUE Then
				v2 = ""
			End If
			Return (Not ew_SameStr(v1, v2))
		End If
	End Function

	' Load selection from a filter clause
	Public Sub LoadSelectionFromFilter(ByRef fld As crField, ByVal filter As String, ByRef sel As ArrayList)
		sel.Clear()
		If ew_NotEmpty(filter) Then
			Dim sSql As String = ewrpt_BuildReportSql(fld.SqlSelect, "", "", "", fld.SqlOrderBy, filter, "")
			ParentPage.ewrpt_LoadArrayListFromSql(sSql, sel)			
		End If
	End Sub

	' Load selection from a filter clause
	Public Sub LoadSelectionFromFilter(ByRef fld As crField, ByVal filter As String, ByRef sel As String())
		sel = New String(-1) {}
		If ew_NotEmpty(filter) Then
			Dim sSql As String = ewrpt_BuildReportSql(fld.SqlSelect, "", "", "", fld.SqlOrderBy, filter, "")
			ParentPage.ewrpt_LoadArrayFromSql(sSql, sel)
		End If
	End Sub

	' Get dropdown value from Session 
	Public Sub GetSessionDropDownValue(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv_Log_Acceso_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Log_Acceso_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Log_Acceso_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Log_Acceso_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Log_Acceso_" + parm)
		End If
		If ew_Session("so1_Log_Acceso_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Log_Acceso_" + parm))
		End If
		If ew_Session("sc_Log_Acceso_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Log_Acceso_" + parm))
		End If
		If ew_Session("sv2_Log_Acceso_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Log_Acceso_" + parm)
		End If
		If ew_Session("so2_Log_Acceso_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Log_Acceso_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Log_Acceso_" + parm) = fld.SearchValue
		ew_Session("so1_Log_Acceso_" + parm) = fld.SearchOperator
		ew_Session("sc_Log_Acceso_" + parm) = fld.SearchCondition
		ew_Session("sv2_Log_Acceso_" + parm) = fld.SearchValue2
		ew_Session("so2_Log_Acceso_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Log_Acceso_" + parm) = ""
		ew_Session("so1_Log_Acceso_" + parm) = "="
		ew_Session("sc_Log_Acceso_" + parm) = "AND"
		ew_Session("sv2_Log_Acceso_" + parm) = ""
		ew_Session("so2_Log_Acceso_" + parm) = "="
	End Sub

	' Check if has Session filter values 
	Public Function HasSessionFilterValues(ByVal parm As String) As Boolean
		Return (ew_NotEmpty(ew_Session("sv_" + parm)) AndAlso Not ew_SameStr(ew_Session("sv_" + parm), EWRPT_INIT_VALUE)) OrElse (ew_NotEmpty(ew_Session("sv1_" + parm)) AndAlso Not ew_SameStr(ew_Session("sv1_" + parm), EWRPT_INIT_VALUE)) OrElse (ew_NotEmpty(ew_Session("sv2_" + parm)) AndAlso Not ew_SameStr(ew_Session("sv2_" + parm), EWRPT_INIT_VALUE))
	End Function

	' Check if dropdown filter
	Public Function DropDownFilterExist(ByRef fld As crField, ByVal FldOpr As String) As Boolean
		Dim sWrk As String = ""
		BuildDropDownFilter(fld, sWrk, FldOpr)
		Return ew_NotEmpty(sWrk)
	End Function

	' Build dropdown filter
	Public Sub BuildDropDownFilter(ByRef fld As crField, ByRef FilterClause As String, ByVal FldOpr As String)
		Dim FldVal As Object = fld.DropDownValue
		Dim sSql As String = ""
		If ewrpt_IsArray(FldVal) Then
			Dim arwrk As String() = DirectCast(FldVal, String())
			Dim sWrk As String
			For Each val As String In arwrk
				sWrk = GetDropDownFilter(fld, val, FldOpr)
				If ew_NotEmpty(sWrk) Then
					sSql = IIf(ew_NotEmpty(sSql), sSql + " OR " + sWrk, sWrk)
				End If
			Next
		Else
			sSql = GetDropDownFilter(fld, Convert.ToString(FldVal), FldOpr)
		End If
		If ew_NotEmpty(sSql) Then
			If ew_NotEmpty(FilterClause) Then
				FilterClause = "(" + FilterClause + ") AND "
			End If
			FilterClause += "(" + sSql + ")"
		End If
	End Sub

	' Get dropdown filter 
	Public Function GetDropDownFilter(ByRef fld As crField, ByVal FldVal As String, ByVal FldOpr As String) As String
		Dim FldName As String = fld.FldName
		Dim FldExpression As String = fld.FldExpression
		Dim FldDataType As Integer = fld.FldDataType
		Dim sWrk As String = ""
		If FldVal = EWRPT_NULL_VALUE Then
			sWrk = FldExpression + " IS NULL"
		ElseIf FldVal = EWRPT_EMPTY_VALUE Then
			sWrk = FldExpression + " = ''"
		Else
			If FldVal.StartsWith("@@") Then
				sWrk = ParentPage.ewrpt_GetCustomFilter(fld, FldVal)
			Else
				If ew_NotEmpty(FldVal) AndAlso Not ew_SameStr(FldVal, EWRPT_INIT_VALUE) AndAlso Not ew_SameStr(FldVal, EWRPT_ALL_VALUE) Then
					If FldDataType = EWRPT_DATATYPE_DATE AndAlso FldOpr <> "" Then
						sWrk = DateFilterString(FldOpr, FldVal, FldDataType)
					Else
						sWrk = FilterString("=", FldVal, FldDataType)
					End If
				End If
				If ew_NotEmpty(sWrk) Then
					sWrk = FldExpression + sWrk
				End If
			End If
		End If
		Return sWrk
	End Function

	' Check if extended filter
	Public Function ExtendedFilterExist(ByRef fld As crField) As Boolean
		Dim sExtWrk As String = ""
		BuildExtendedFilter(fld, sExtWrk)
		Return ew_NotEmpty(sExtWrk)
	End Function

	' Build extended filter 
	Public Sub BuildExtendedFilter(ByRef fld As crField, ByRef FilterClause As String)
		Dim IsValidValue As Boolean
		Dim sWrk As String = ""
		Dim wrkFldVal1 As String
		Dim wrkFldVal2 As String
		Dim FldName As String = fld.FldName
		Dim FldExpression As String = fld.FldExpression
		Dim FldDataType As Integer = fld.FldDataType
		Dim FldDateTimeFormat As Integer = fld.FldDateTimeFormat
		Dim FldVal1 As String = Convert.ToString(fld.SearchValue)
		Dim FldOpr1 As String = fld.SearchOperator
		Dim FldCond As String = fld.SearchCondition
		Dim FldVal2 As String = Convert.ToString(fld.SearchValue2)
		Dim FldOpr2 As String = fld.SearchOperator2
		FldOpr1 = IIf(FldOpr1 IsNot Nothing, FldOpr1.Trim().ToUpper(), "")
		If ew_Empty(FldOpr1) Then
			FldOpr1 = "="
		End If
		FldOpr2 = IIf(FldOpr2 IsNot Nothing, FldOpr2.Trim().ToUpper(), "")
		If ew_Empty(FldOpr2) Then
			FldOpr2 = "="
		End If
		wrkFldVal1 = FldVal1
		wrkFldVal2 = FldVal2
		If FldDataType = EWRPT_DATATYPE_BOOLEAN Then
			If wrkFldVal1 <> "" Then
				wrkFldVal1 = IIf(wrkFldVal1 = "1", "True", "False")
			End If
			If wrkFldVal2 <> "" Then
				wrkFldVal2 = IIf(wrkFldVal2 = "1", "True", "False")
			End If
		ElseIf FldDataType = EWRPT_DATATYPE_DATE Then
			If wrkFldVal1 <> "" Then
				wrkFldVal1 = ew_UnFormatDateTime(wrkFldVal1, FldDateTimeFormat)
			End If
			If wrkFldVal2 <> "" Then
				wrkFldVal2 = ew_UnFormatDateTime(wrkFldVal2, FldDateTimeFormat)
			End If
		End If
		If FldOpr1 = "BETWEEN" Then
			IsValidValue = (FldDataType <> EWRPT_DATATYPE_NUMBER) OrElse (FldDataType = EWRPT_DATATYPE_NUMBER AndAlso ewrpt_IsNumeric(wrkFldVal1) AndAlso ewrpt_IsNumeric(wrkFldVal2))
			If wrkFldVal1 <> "" AndAlso wrkFldVal2 <> "" AndAlso IsValidValue Then
				sWrk = FldExpression + " BETWEEN " + ew_QuotedValue(wrkFldVal1, FldDataType) + " AND " + ew_QuotedValue(wrkFldVal2, FldDataType)
			End If
		ElseIf FldOpr1 = "IS NULL" OrElse FldOpr1 = "IS NOT NULL" Then
			sWrk = FldExpression + " " + wrkFldVal1
		Else
			IsValidValue = (FldDataType <> EWRPT_DATATYPE_NUMBER) OrElse (FldDataType = EWRPT_DATATYPE_NUMBER AndAlso ewrpt_IsNumeric(wrkFldVal1))
			If wrkFldVal1 <> "" AndAlso IsValidValue AndAlso ew_IsValidOpr(FldOpr1, FldDataType) Then
				sWrk = FldExpression + FilterString(FldOpr1, wrkFldVal1, FldDataType)
			End If
			IsValidValue = (FldDataType <> EWRPT_DATATYPE_NUMBER) OrElse (FldDataType = EWRPT_DATATYPE_NUMBER AndAlso ewrpt_IsNumeric(wrkFldVal2))
			If wrkFldVal2 <> "" AndAlso IsValidValue AndAlso ew_IsValidOpr(FldOpr2, FldDataType) Then
				If sWrk <> "" Then
					sWrk += " " + IIf(FldCond = "OR", "OR", "AND") + " "
				End If
				sWrk += FldExpression + FilterString(FldOpr2, wrkFldVal2, FldDataType)
			End If
		End If
		If sWrk <> "" Then
			If FilterClause <> "" Then
				FilterClause += " AND "
			End If
			FilterClause += "(" + sWrk + ")"
		End If
	End Sub

	' Validate form
	Public Function ValidateForm() As Boolean

		' Initialize form error message
		gsFormError = ""

		' Check if validation required
		If Not EWRPT_SERVER_VALIDATE Then
			Return ew_Empty(gsFormError)
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Log_Acceso.FECHA.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Log_Acceso.FECHA.FldErrMsg()
		End If

		' Return validate result
		Dim valid As Boolean = ew_Empty(gsFormError)

		' Call Form_CustomValidate event
		Dim sFormCustomError As String = ""
		valid = valid AndAlso Form_CustomValidate(sFormCustomError)
		If Not ew_Empty(sFormCustomError) Then
			gsFormError &= IIf(ew_NotEmpty(gsFormError), "<br>", "")
			gsFormError &= sFormCustomError
		End If
		Return valid
	End Function

	' Return filter string 
	Public Function FilterString(ByVal FldOpr As String, ByVal FldVal As Object, ByVal FldType As Integer) As String
		If ew_Empty(FldVal) Then
			Return ""
		End If
		If FldOpr = "LIKE" OrElse FldOpr = "NOT LIKE" Then
			Return " " + FldOpr + " " + ew_QuotedValue("%" + FldVal + "%", FldType)
		ElseIf FldOpr = "STARTS WITH" Then
			Return " LIKE " + ew_QuotedValue(FldVal + "%", FldType)
		Else
			Return " " + FldOpr + " " + ew_QuotedValue(FldVal, FldType)
		End If
	End Function

	' Return date search string 
	Public Function DateFilterString(ByVal FldOpr As String, ByVal FldVal As String, ByVal FldType As Integer) As String
		Dim wrkVal1 As Object = ewrpt_DateVal(FldOpr, FldVal, 1)
		Dim wrkVal2 As Object = ewrpt_DateVal(FldOpr, FldVal, 2)
		If ew_NotEmpty(wrkVal1) AndAlso ew_NotEmpty(wrkVal2) Then
			Return " BETWEEN " + ew_QuotedValue(wrkVal1, FldType) + " AND " + ew_QuotedValue(wrkVal2, FldType)
		Else
			Return ""
		End If
	End Function

	' Clear selection stored in session
	Public Sub ClearSessionSelection(parm As String)
		ew_Session("sel_Log_Acceso_" & parm) = ""
		ew_Session("rf_Log_Acceso_" & parm) = ""
		ew_Session("rt_Log_Acceso_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Log_Acceso.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Log_Acceso_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Log_Acceso_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Log_Acceso_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field USERID

			Log_Acceso.USERID.DefaultDropDownValue = EWRPT_INIT_VALUE
			Log_Acceso.USERID.DropDownValue = Log_Acceso.USERID.DefaultDropDownValue

			' Field USERNAME
			Log_Acceso.USERNAME.DefaultDropDownValue = EWRPT_INIT_VALUE
			Log_Acceso.USERNAME.DropDownValue = Log_Acceso.USERNAME.DefaultDropDownValue

			' Field INGRESO
			Log_Acceso.INGRESO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Log_Acceso.INGRESO.DropDownValue = Log_Acceso.INGRESO.DefaultDropDownValue

		' Set up default values for extended filters
			' Field FECHA

			SetDefaultExtFilter(Log_Acceso.FECHA, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Log_Acceso.FECHA)	

			' Field USERIP
			SetDefaultExtFilter(Log_Acceso.USERIP, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Log_Acceso.USERIP)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check FECHA extended filter
		If (TextFilterApplied(Log_Acceso.FECHA)) Then bFilterExist = True

		' Check USERID dropdown filter
		If (NonTextFilterApplied(Log_Acceso.USERID)) Then bFilterExist = True

		' Check USERNAME dropdown filter
		If (NonTextFilterApplied(Log_Acceso.USERNAME)) Then bFilterExist = True

		' Check INGRESO dropdown filter
		If (NonTextFilterApplied(Log_Acceso.INGRESO)) Then bFilterExist = True

		' Check USERIP extended filter
		If (TextFilterApplied(Log_Acceso.USERIP)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field FECHA
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Log_Acceso.FECHA, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Log_Acceso.FECHA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field USERID
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Log_Acceso.USERID, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Log_Acceso.USERID.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field USERNAME
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Log_Acceso.USERNAME, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Log_Acceso.USERNAME.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field INGRESO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Log_Acceso.INGRESO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Log_Acceso.INGRESO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field USERIP
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Log_Acceso.USERIP, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Log_Acceso.USERIP.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Show Filters
		If (ew_NotEmpty(sFilterList)) Then
			ew_Write("CURRENT FILTERS:<br>")
			ew_Write(sFilterList)
		End If
	End Sub

	' Return popup filter
	Public Function GetPopupFilter() As String
		Dim sWrk As String = ""
		Return sWrk
	End Function

	' Return Sort parameters based on Sort links clicked
	Public Function GetSort() As String
		Dim bCtrl As Boolean = False
		Dim sOrder As String, sOrderType As String, sOrderBy As String
		Dim sSortField As String, sLastSort As String, sThisSort As String = "", sSortSql As String = ""

		' Check for a resetsort command
		If ew_NotEmpty(ew_Get("cmd")) Then
			Dim sCmd As String = ew_Get("cmd")
			If ew_SameText(sCmd, "resetsort") Then
				Log_Acceso.OrderBy = ""
				Log_Acceso.StartGroup = 1
				Log_Acceso.FECHA.Sort = ""
				Log_Acceso.USERID.Sort = ""
				Log_Acceso.USERNAME.Sort = ""
				Log_Acceso.USERPWD.Sort = ""
				Log_Acceso.INGRESO.Sort = ""
				Log_Acceso.USERIP.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Log_Acceso.CurrentOrder = ew_Get("order")
			Log_Acceso.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Log_Acceso.SortSql()
			Log_Acceso.OrderBy = sSortSql
			Log_Acceso.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Log_Acceso.OrderBy)) Then
			Log_Acceso.OrderBy = "[FECHA] DESC, [USERID] ASC, [USERNAME] ASC, [INGRESO] ASC"
			Log_Acceso.FECHA.Sort = "DESC"
			Log_Acceso.USERID.Sort = "ASC"
			Log_Acceso.USERNAME.Sort = "ASC"
			Log_Acceso.INGRESO.Sort = "ASC"
		End If
		Return Log_Acceso.OrderBy
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

		' Page Data Rendering event
		Public Sub Page_DataRendering(ByRef header As String)

			' Example:
			'header = "your header"

		End Sub

		' Page Data Rendered event
		Public Sub Page_DataRendered(ByRef footer As String)

			' Example:
			'footer = "your footer"

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
		Log_Acceso_summary = New crLog_Acceso_summary(Me)
		Log_Acceso_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Log_Acceso_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Log_Acceso_summary IsNot Nothing) Then Log_Acceso_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Log_Acceso.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Log_Acceso_summary = new ewrpt_Page("Log_Acceso_summary");
// page properties
Log_Acceso_summary.PageID = "summary"; // page ID
Log_Acceso_summary.FormID = "fLog_Accesosummaryfilter"; // form ID
var EWRPT_PAGE_ID = Log_Acceso_summary.PageID;
// extend page with ValidateForm function
Log_Acceso_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_FECHA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Log_Acceso.FECHA.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Log_Acceso_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Log_Acceso_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Log_Acceso_summary.ValidateRequired = false; // no JavaScript validation
<% End If %>
</script>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
// To include another .js script, use:
// ew_ClientScriptInclude("my_javascript.js"); 
//-->
</script>
<% End If %>
<% Log_Acceso_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Log_Acceso.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Log_Acceso.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Log_Acceso.TableCaption() %></h1></div>
<% If (Log_Acceso.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Log_Acceso_summary.ExportExcelUrl %>"><img src="images/excel.png" alt="Exportar a Excel" border=0 title="Exportar a Excel" /></a>
<% If (Log_Acceso_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Log_Acceso_summary.ShowMessage() %>
<% If (Log_Acceso.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Log_Acceso.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Log_Acceso.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Log_Acceso.FilterPanelOption = 2 OrElse (Log_Acceso.FilterPanelOption = 3 AndAlso Log_Acceso_summary.FilterApplied) OrElse Log_Acceso_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span> </p>
<p><a href="Log_Accesosmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fLog_Accesosummaryfilter" id="fLog_Accesosummaryfilter" action="Log_Accesosmry.aspx" class="ewForm" onsubmit="return Log_Acceso_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Log_Acceso.USERIP.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Log_Acceso.FECHA.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECHA" id="sv1_FECHA" value="<%= ew_HtmlEncode(Log_Acceso.FECHA.SearchValue) %>"<%= IIf(Log_Acceso_summary.ClearExtFilter = "Log_Acceso_FECHA", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Log_Acceso.USERID.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_USERID" id="sv_USERID"<%= IIf(Log_Acceso_summary.ClearExtFilter = "Log_Acceso_USERID", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Log_Acceso.USERID.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Log_Acceso.USERID.CustomFilters.Count + Log_Acceso.USERID.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Log_Acceso.USERID.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "USERID")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Log_Acceso.USERID.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Log_Acceso.USERID.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Log_Acceso.USERID.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Log_Acceso.USERNAME.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_USERNAME" id="sv_USERNAME"<%= IIf(Log_Acceso_summary.ClearExtFilter = "Log_Acceso_USERNAME", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Log_Acceso.USERNAME.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Log_Acceso.USERNAME.CustomFilters.Count + Log_Acceso.USERNAME.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Log_Acceso.USERNAME.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "USERNAME")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Log_Acceso.USERNAME.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Log_Acceso.USERNAME.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Log_Acceso.USERNAME.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Log_Acceso.INGRESO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Log_Acceso.INGRESO.CustomFilters.Count + Log_Acceso.INGRESO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Log_Acceso.INGRESO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "INGRESO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Log_Acceso.INGRESO.DropDownValue" id="Log_Acceso.INGRESO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Log_Acceso.INGRESO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Log_Acceso.INGRESO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_INGRESO" id="sv_INGRESO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Log_Acceso.INGRESO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Log_Acceso.USERIP.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_USERIP" id="sv1_USERIP" size="30" maxlength="50" value="<%= ew_HtmlEncode(Log_Acceso.USERIP.SearchValue) %>"<%= IIf(Log_Acceso_summary.ClearExtFilter = "Log_Acceso_USERIP", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
</table>
<table class="ewRptExtFilter">
	<tr>
		<td><span class="aspnetreportmaker">
			<input type="submit" name="Submit" id="Submit" value="<%= ReportLanguage.Phrase("Search") %>">			
		</span></td>
	</tr>
</table>
</form>
<!-- Search form (end) -->
</div>
<br>
<% End If %>
<% If (Log_Acceso.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Log_Acceso_summary.ShowFilterList() %>
</div>
<br>
<% End If %>
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<!-- Report Grid (Begin) -->
<div class="ewGridMiddlePanel">
<table class="ewTable ewTableSeparate" cellspacing="0">
<%

' Set the last group to display if not export all
If (Log_Acceso.ExportAll AndAlso ew_NotEmpty(Log_Acceso.Export)) Then
	Log_Acceso_summary.StopGrp = Log_Acceso_summary.TotalGrps
Else
	Log_Acceso_summary.StopGrp = Log_Acceso_summary.StartGrp + Log_Acceso_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Log_Acceso_summary.StopGrp > Log_Acceso_summary.TotalGrps) Then
	Log_Acceso_summary.StopGrp = Log_Acceso_summary.TotalGrps
End If
Log_Acceso_summary.RecCount = 0

' Get first row
If (Log_Acceso_summary.TotalGrps > 0) Then
	Log_Acceso_summary.GetRow() ' ASPXRPT
	Log_Acceso_summary.GrpCount = 1
End If
While ((Log_Acceso_summary.HasRow AndAlso Log_Acceso_summary.GrpIndex < Log_Acceso_summary.StopGrp) OrElse Log_Acceso_summary.ShowFirstHeader)

	' Show header
	If (Log_Acceso_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Log_Acceso.Export)) Then %>
<%= Log_Acceso.FECHA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Log_Acceso.SortUrl(Log_Acceso.FECHA))) Then %>
		<td style="vertical-align: bottom;"><%= Log_Acceso.FECHA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Log_Acceso.SortUrl(Log_Acceso.FECHA) %>',0);"><%= Log_Acceso.FECHA.FldCaption() %></td><td style="width: 10px;">
		<% If (Log_Acceso.FECHA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Log_Acceso.FECHA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Log_Acceso.Export)) Then %>
<%= Log_Acceso.USERID.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Log_Acceso.SortUrl(Log_Acceso.USERID))) Then %>
		<td style="vertical-align: bottom;"><%= Log_Acceso.USERID.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Log_Acceso.SortUrl(Log_Acceso.USERID) %>',0);"><%= Log_Acceso.USERID.FldCaption() %></td><td style="width: 10px;">
		<% If (Log_Acceso.USERID.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Log_Acceso.USERID.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Log_Acceso.Export)) Then %>
<%= Log_Acceso.USERNAME.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Log_Acceso.SortUrl(Log_Acceso.USERNAME))) Then %>
		<td style="vertical-align: bottom;"><%= Log_Acceso.USERNAME.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Log_Acceso.SortUrl(Log_Acceso.USERNAME) %>',0);"><%= Log_Acceso.USERNAME.FldCaption() %></td><td style="width: 10px;">
		<% If (Log_Acceso.USERNAME.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Log_Acceso.USERNAME.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Log_Acceso.Export)) Then %>
<%= Log_Acceso.USERPWD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Log_Acceso.SortUrl(Log_Acceso.USERPWD))) Then %>
		<td style="vertical-align: bottom;"><%= Log_Acceso.USERPWD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Log_Acceso.SortUrl(Log_Acceso.USERPWD) %>',0);"><%= Log_Acceso.USERPWD.FldCaption() %></td><td style="width: 10px;">
		<% If (Log_Acceso.USERPWD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Log_Acceso.USERPWD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Log_Acceso.Export)) Then %>
<%= Log_Acceso.INGRESO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Log_Acceso.SortUrl(Log_Acceso.INGRESO))) Then %>
		<td style="vertical-align: bottom;"><%= Log_Acceso.INGRESO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Log_Acceso.SortUrl(Log_Acceso.INGRESO) %>',0);"><%= Log_Acceso.INGRESO.FldCaption() %></td><td style="width: 10px;">
		<% If (Log_Acceso.INGRESO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Log_Acceso.INGRESO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Log_Acceso.Export)) Then %>
<%= Log_Acceso.USERIP.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Log_Acceso.SortUrl(Log_Acceso.USERIP))) Then %>
		<td style="vertical-align: bottom;"><%= Log_Acceso.USERIP.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Log_Acceso.SortUrl(Log_Acceso.USERIP) %>',0);"><%= Log_Acceso.USERIP.FldCaption() %></td><td style="width: 10px;">
		<% If (Log_Acceso.USERIP.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Log_Acceso.USERIP.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Log_Acceso_summary.ShowFirstHeader = False
	End If
	Log_Acceso_summary.RecCount += 1

		' Render detail row
		Log_Acceso.ResetCSS()
		Log_Acceso.RowType = EWRPT_ROWTYPE_DETAIL
		Log_Acceso_summary.RenderRow()
%>
	<tr<%= Log_Acceso.RowAttributes() %>>
		<td<%= Log_Acceso.FECHA.CellAttributes %>>
<div<%= Log_Acceso.FECHA.ViewAttributes%>><%= Log_Acceso.FECHA.ListViewValue%></div>
</td>
		<td<%= Log_Acceso.USERID.CellAttributes %>>
<div<%= Log_Acceso.USERID.ViewAttributes%>><%= Log_Acceso.USERID.ListViewValue%></div>
</td>
		<td<%= Log_Acceso.USERNAME.CellAttributes %>>
<div<%= Log_Acceso.USERNAME.ViewAttributes%>><%= Log_Acceso.USERNAME.ListViewValue%></div>
</td>
		<td<%= Log_Acceso.USERPWD.CellAttributes %>>
<div<%= Log_Acceso.USERPWD.ViewAttributes%>><%= Log_Acceso.USERPWD.ListViewValue%></div>
</td>
		<td<%= Log_Acceso.INGRESO.CellAttributes %>>
<div<%= Log_Acceso.INGRESO.ViewAttributes%>><%= Log_Acceso.INGRESO.ListViewValue%></div>
</td>
		<td<%= Log_Acceso.USERIP.CellAttributes %>>
<div<%= Log_Acceso.USERIP.ViewAttributes%>><%= Log_Acceso.USERIP.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Log_Acceso_summary.AccumulateSummary()

		' Get next record
		Log_Acceso_summary.GetRow() ' ASPXRPT
		Log_Acceso_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Log_Acceso_summary.TotalGrps > 0) Then
	Log_Acceso.ResetCSS()
	Log_Acceso.RowType = EWRPT_ROWTYPE_TOTAL
	Log_Acceso.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Log_Acceso.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Log_Acceso.RowAttrs("class") = "ewRptGrandSummary"
	Log_Acceso_summary.RenderRow()
%>
	<!-- tr><td colspan="6"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Log_Acceso.RowAttributes() %>><td colspan="6"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Log_Acceso_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Log_Acceso.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Log_Acceso_summary.Pager Is Nothing Then Log_Acceso_summary.Pager = New cPrevNextPager(Log_Acceso_summary.StartGrp, Log_Acceso_summary.DisplayGrps, Log_Acceso_summary.TotalGrps) %>
<% If Log_Acceso_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Log_Acceso_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Log_Accesosmry.aspx?start=<%= Log_Acceso_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Log_Acceso_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Log_Accesosmry.aspx?start=<%= Log_Acceso_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Log_Acceso_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Log_Acceso_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Log_Accesosmry.aspx?start=<%= Log_Acceso_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Log_Acceso_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Log_Accesosmry.aspx?start=<%= Log_Acceso_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Log_Acceso_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Log_Acceso_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Log_Acceso_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Log_Acceso_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Log_Acceso_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Log_Acceso_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Log_Acceso_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Log_Acceso_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Log_Acceso_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
</select>
		</span></td>
<% End If %>
	</tr>
</table>
</form>
</div>
<% End If %>
</td></tr></table>
</div>
<!-- Summary Report Ends -->
<% If (Log_Acceso.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Log_Acceso.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Log_Acceso.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Log_Acceso_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Log_Acceso.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
