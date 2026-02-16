<%@ Page ClassName="CVSIESsmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_CVSIES" %>
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
	Public CVSIES As crCVSIES = Nothing

	'
	' Table class (for CVSIES)
	'
	Public Class crCVSIES
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
				Return "CVSIES"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "CVSIES"
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

		Public RUT As crField

		Public DV As crField

		Public AP_PATER As crField

		Public AP_MATER As crField

		Public NOMBRES As crField

		Public SEXO As crField

		Public FECNAC As crField

		Public NACIONALIDAD As crField

		Public NUMANIOS As crField

		Public INSTITUCION As crField

		Public PROFESION As crField

		Public PAISINSTITUCION As crField

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

			' RUT
			RUT = new crField("CVSIES", "CVSIES", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' DV
			DV = new crField("CVSIES", "CVSIES", "x_DV", "DV", "[DV]", 200, EWRPT_DATATYPE_STRING, -1)
			DV.Page = APage
			DV.ParentPage = APage.ParentPage
			Fields.Add("DV", DV)
			DV.DateFilter = ""
			DV.SqlSelect = ""
			DV.SqlOrderBy = ""

			' AP_PATER
			AP_PATER = new crField("CVSIES", "CVSIES", "x_AP_PATER", "AP_PATER", "[AP_PATER]", 200, EWRPT_DATATYPE_STRING, -1)
			AP_PATER.Page = APage
			AP_PATER.ParentPage = APage.ParentPage
			Fields.Add("AP_PATER", AP_PATER)
			AP_PATER.DateFilter = ""
			AP_PATER.SqlSelect = ""
			AP_PATER.SqlOrderBy = ""

			' AP_MATER
			AP_MATER = new crField("CVSIES", "CVSIES", "x_AP_MATER", "AP_MATER", "[AP_MATER]", 200, EWRPT_DATATYPE_STRING, -1)
			AP_MATER.Page = APage
			AP_MATER.ParentPage = APage.ParentPage
			Fields.Add("AP_MATER", AP_MATER)
			AP_MATER.DateFilter = ""
			AP_MATER.SqlSelect = ""
			AP_MATER.SqlOrderBy = ""

			' NOMBRES
			NOMBRES = new crField("CVSIES", "CVSIES", "x_NOMBRES", "NOMBRES", "[NOMBRES]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRES.Page = APage
			NOMBRES.ParentPage = APage.ParentPage
			Fields.Add("NOMBRES", NOMBRES)
			NOMBRES.DateFilter = ""
			NOMBRES.SqlSelect = ""
			NOMBRES.SqlOrderBy = ""

			' SEXO
			SEXO = new crField("CVSIES", "CVSIES", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1)
			SEXO.Page = APage
			SEXO.ParentPage = APage.ParentPage
			Fields.Add("SEXO", SEXO)
			SEXO.DateFilter = ""
			SEXO.SqlSelect = ""
			SEXO.SqlOrderBy = ""

			' FECNAC
			FECNAC = new crField("CVSIES", "CVSIES", "x_FECNAC", "FECNAC", "[FECNAC]", 135, EWRPT_DATATYPE_DATE, 7)
			FECNAC.Page = APage
			FECNAC.ParentPage = APage.ParentPage
			FECNAC.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECNAC", FECNAC)
			FECNAC.DateFilter = ""
			FECNAC.SqlSelect = ""
			FECNAC.SqlOrderBy = ""

			' NACIONALIDAD
			NACIONALIDAD = new crField("CVSIES", "CVSIES", "x_NACIONALIDAD", "NACIONALIDAD", "[NACIONALIDAD]", 200, EWRPT_DATATYPE_STRING, -1)
			NACIONALIDAD.Page = APage
			NACIONALIDAD.ParentPage = APage.ParentPage
			Fields.Add("NACIONALIDAD", NACIONALIDAD)
			NACIONALIDAD.DateFilter = ""
			NACIONALIDAD.SqlSelect = ""
			NACIONALIDAD.SqlOrderBy = ""

			' NUMANIOS
			NUMANIOS = new crField("CVSIES", "CVSIES", "x_NUMANIOS", "NUMANIOS", "[NUMANIOS]", 3, EWRPT_DATATYPE_NUMBER, -1)
			NUMANIOS.Page = APage
			NUMANIOS.ParentPage = APage.ParentPage
			NUMANIOS.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("NUMANIOS", NUMANIOS)
			NUMANIOS.DateFilter = ""
			NUMANIOS.SqlSelect = ""
			NUMANIOS.SqlOrderBy = ""

			' INSTITUCION
			INSTITUCION = new crField("CVSIES", "CVSIES", "x_INSTITUCION", "INSTITUCION", "[INSTITUCION]", 200, EWRPT_DATATYPE_STRING, -1)
			INSTITUCION.Page = APage
			INSTITUCION.ParentPage = APage.ParentPage
			Fields.Add("INSTITUCION", INSTITUCION)
			INSTITUCION.DateFilter = ""
			INSTITUCION.SqlSelect = ""
			INSTITUCION.SqlOrderBy = ""

			' PROFESION
			PROFESION = new crField("CVSIES", "CVSIES", "x_PROFESION", "PROFESION", "[PROFESION]", 200, EWRPT_DATATYPE_STRING, -1)
			PROFESION.Page = APage
			PROFESION.ParentPage = APage.ParentPage
			Fields.Add("PROFESION", PROFESION)
			PROFESION.DateFilter = ""
			PROFESION.SqlSelect = ""
			PROFESION.SqlOrderBy = ""

			' PAISINSTITUCION
			PAISINSTITUCION = new crField("CVSIES", "CVSIES", "x_PAISINSTITUCION", "PAISINSTITUCION", "[PAISINSTITUCION]", 200, EWRPT_DATATYPE_STRING, -1)
			PAISINSTITUCION.Page = APage
			PAISINSTITUCION.ParentPage = APage.ParentPage
			Fields.Add("PAISINSTITUCION", PAISINSTITUCION)
			PAISINSTITUCION.DateFilter = ""
			PAISINSTITUCION.SqlSelect = ""
			PAISINSTITUCION.SqlOrderBy = ""
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
				Return "[Vista_PROFES]"
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
	Public CVSIES_summary As crCVSIES_summary

	'
	' Page class
	'
	Public Class crCVSIES_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (CVSIES.UseTokenInUrl) Then
				sUrl &= "t=" & CVSIES.TableVar & "&" ' Add page token
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
			If (CVSIES.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(CVSIES.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(CVSIES.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As CVSIESsmry 
			Get
				Return CType(m_ParentPage, CVSIESsmry)
			End Get
		End Property

		' Table object (CVSIES)
		Public Property CVSIES As crCVSIES 
			Get		
				Return AspNetPage.CVSIES ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crCVSIES)
				AspNetPage.CVSIES = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_CVSIES)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "CVSIES_summary"
			m_PageObjTypeName = "crCVSIES_summary"

			' Table name
			m_TableName = "CVSIES"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (CVSIES)
			CVSIES = New crCVSIES(Me)			

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
				CVSIES.Export = ew_Get("export")
			End If
			gsExport = CVSIES.Export ' Get export parameter, used in header
			gsExportFile = CVSIES.TableVar ' Get export file, used in header
			If (CVSIES.Export = "excel") Then
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

		Public Val As Object() = New Object(11) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(11) {}

		Public GrandMn As Object() = New Object(11) {}

		Public GrandMx As Object() = New Object(11) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 12 ' No. of fields
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
			CVSIES.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(CVSIES.SqlSelect, CVSIES.SqlWhere, CVSIES.SqlGroupBy, CVSIES.SqlHaving, CVSIES.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (CVSIES.ExportAll AndAlso ew_NotEmpty(CVSIES.Export)) Then
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
				CVSIES.RUT.DbValue = Row("RUT")
				CVSIES.DV.DbValue = Row("DV")
				CVSIES.AP_PATER.DbValue = Row("AP_PATER")
				CVSIES.AP_MATER.DbValue = Row("AP_MATER")
				CVSIES.NOMBRES.DbValue = Row("NOMBRES")
				CVSIES.SEXO.DbValue = Row("SEXO")
				CVSIES.FECNAC.DbValue = Row("FECNAC")
				CVSIES.NACIONALIDAD.DbValue = Row("NACIONALIDAD")
				CVSIES.NUMANIOS.DbValue = Row("NUMANIOS")
				CVSIES.INSTITUCION.DbValue = Row("INSTITUCION")
				CVSIES.PROFESION.DbValue = Row("PROFESION")
				CVSIES.PAISINSTITUCION.DbValue = Row("PAISINSTITUCION")
				Val(1) = CVSIES.RUT.CurrentValue
				Val(2) = CVSIES.AP_PATER.CurrentValue
				Val(3) = CVSIES.AP_MATER.CurrentValue
				Val(4) = CVSIES.NOMBRES.CurrentValue
				Val(5) = CVSIES.SEXO.CurrentValue
				Val(6) = CVSIES.FECNAC.CurrentValue
				Val(7) = CVSIES.NACIONALIDAD.CurrentValue
				Val(8) = CVSIES.NUMANIOS.CurrentValue
				Val(9) = CVSIES.INSTITUCION.CurrentValue
				Val(10) = CVSIES.PROFESION.CurrentValue
				Val(11) = CVSIES.PAISINSTITUCION.CurrentValue
			Else
				CVSIES.RUT.DbValue = ""
				CVSIES.DV.DbValue = ""
				CVSIES.AP_PATER.DbValue = ""
				CVSIES.AP_MATER.DbValue = ""
				CVSIES.NOMBRES.DbValue = ""
				CVSIES.SEXO.DbValue = ""
				CVSIES.FECNAC.DbValue = ""
				CVSIES.NACIONALIDAD.DbValue = ""
				CVSIES.NUMANIOS.DbValue = ""
				CVSIES.INSTITUCION.DbValue = ""
				CVSIES.PROFESION.DbValue = ""
				CVSIES.PAISINSTITUCION.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				CVSIES.RUT.DbValue = dr("RUT")
				CVSIES.DV.DbValue = dr("DV")
				CVSIES.AP_PATER.DbValue = dr("AP_PATER")
				CVSIES.AP_MATER.DbValue = dr("AP_MATER")
				CVSIES.NOMBRES.DbValue = dr("NOMBRES")
				CVSIES.SEXO.DbValue = dr("SEXO")
				CVSIES.FECNAC.DbValue = dr("FECNAC")
				CVSIES.NACIONALIDAD.DbValue = dr("NACIONALIDAD")
				CVSIES.NUMANIOS.DbValue = dr("NUMANIOS")
				CVSIES.INSTITUCION.DbValue = dr("INSTITUCION")
				CVSIES.PROFESION.DbValue = dr("PROFESION")
				CVSIES.PAISINSTITUCION.DbValue = dr("PAISINSTITUCION")
				Val(1) = CVSIES.RUT.CurrentValue
				Val(2) = CVSIES.AP_PATER.CurrentValue
				Val(3) = CVSIES.AP_MATER.CurrentValue
				Val(4) = CVSIES.NOMBRES.CurrentValue
				Val(5) = CVSIES.SEXO.CurrentValue
				Val(6) = CVSIES.FECNAC.CurrentValue
				Val(7) = CVSIES.NACIONALIDAD.CurrentValue
				Val(8) = CVSIES.NUMANIOS.CurrentValue
				Val(9) = CVSIES.INSTITUCION.CurrentValue
				Val(10) = CVSIES.PROFESION.CurrentValue
				Val(11) = CVSIES.PAISINSTITUCION.CurrentValue
			Else				
				CVSIES.RUT.DbValue = ""
				CVSIES.DV.DbValue = ""
				CVSIES.AP_PATER.DbValue = ""
				CVSIES.AP_MATER.DbValue = ""
				CVSIES.NOMBRES.DbValue = ""
				CVSIES.SEXO.DbValue = ""
				CVSIES.FECNAC.DbValue = ""
				CVSIES.NACIONALIDAD.DbValue = ""
				CVSIES.NUMANIOS.DbValue = ""
				CVSIES.INSTITUCION.DbValue = ""
				CVSIES.PROFESION.DbValue = ""
				CVSIES.PAISINSTITUCION.DbValue = ""
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
				CVSIES.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					CVSIES.StartGroup = StartGrp
				Else
					StartGrp = CVSIES.StartGroup
				End If
			Else
				StartGrp = CVSIES.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				CVSIES.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				CVSIES.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				CVSIES.StartGroup = StartGrp
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
			CVSIES.StartGroup = StartGrp
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
				CVSIES.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				CVSIES.StartGroup = StartGrp
			Else				
				If (CVSIES.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(CVSIES.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (CVSIES.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(CVSIES.SqlSelectCount, CVSIES.SqlWhere, CVSIES.SqlGroupBy, CVSIES.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			CVSIES.Row_Rendering()

			'
			' Render view codes
			'

			If (CVSIES.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUT
				CVSIES.RUT.ViewValue = Convert.ToString(CVSIES.RUT.Summary)

				' AP_PATER
				CVSIES.AP_PATER.ViewValue = Convert.ToString(CVSIES.AP_PATER.Summary)

				' AP_MATER
				CVSIES.AP_MATER.ViewValue = Convert.ToString(CVSIES.AP_MATER.Summary)

				' NOMBRES
				CVSIES.NOMBRES.ViewValue = Convert.ToString(CVSIES.NOMBRES.Summary)

				' SEXO
				CVSIES.SEXO.ViewValue = Convert.ToString(CVSIES.SEXO.Summary)

				' FECNAC
				CVSIES.FECNAC.ViewValue = Convert.ToString(CVSIES.FECNAC.Summary)
				CVSIES.FECNAC.ViewValue = ew_FormatDateTime(CVSIES.FECNAC.ViewValue, 7)

				' NACIONALIDAD
				CVSIES.NACIONALIDAD.ViewValue = Convert.ToString(CVSIES.NACIONALIDAD.Summary)

				' NUMANIOS
				CVSIES.NUMANIOS.ViewValue = Convert.ToString(CVSIES.NUMANIOS.Summary)

				' INSTITUCION
				CVSIES.INSTITUCION.ViewValue = Convert.ToString(CVSIES.INSTITUCION.Summary)

				' PROFESION
				CVSIES.PROFESION.ViewValue = Convert.ToString(CVSIES.PROFESION.Summary)

				' PAISINSTITUCION
				CVSIES.PAISINSTITUCION.ViewValue = Convert.ToString(CVSIES.PAISINSTITUCION.Summary)
			Else

				' RUT
				CVSIES.RUT.ViewValue = Convert.ToString(CVSIES.RUT.CurrentValue)
				CVSIES.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' AP_PATER
				CVSIES.AP_PATER.ViewValue = Convert.ToString(CVSIES.AP_PATER.CurrentValue)
				CVSIES.AP_PATER.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' AP_MATER
				CVSIES.AP_MATER.ViewValue = Convert.ToString(CVSIES.AP_MATER.CurrentValue)
				CVSIES.AP_MATER.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRES
				CVSIES.NOMBRES.ViewValue = Convert.ToString(CVSIES.NOMBRES.CurrentValue)
				CVSIES.NOMBRES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SEXO
				CVSIES.SEXO.ViewValue = Convert.ToString(CVSIES.SEXO.CurrentValue)
				CVSIES.SEXO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECNAC
				CVSIES.FECNAC.ViewValue = Convert.ToString(CVSIES.FECNAC.CurrentValue)
				CVSIES.FECNAC.ViewValue = ew_FormatDateTime(CVSIES.FECNAC.ViewValue, 7)
				CVSIES.FECNAC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NACIONALIDAD
				CVSIES.NACIONALIDAD.ViewValue = Convert.ToString(CVSIES.NACIONALIDAD.CurrentValue)
				CVSIES.NACIONALIDAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NUMANIOS
				CVSIES.NUMANIOS.ViewValue = Convert.ToString(CVSIES.NUMANIOS.CurrentValue)
				CVSIES.NUMANIOS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' INSTITUCION
				CVSIES.INSTITUCION.ViewValue = Convert.ToString(CVSIES.INSTITUCION.CurrentValue)
				CVSIES.INSTITUCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PROFESION
				CVSIES.PROFESION.ViewValue = Convert.ToString(CVSIES.PROFESION.CurrentValue)
				CVSIES.PROFESION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PAISINSTITUCION
				CVSIES.PAISINSTITUCION.ViewValue = Convert.ToString(CVSIES.PAISINSTITUCION.CurrentValue)
				CVSIES.PAISINSTITUCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUT
			CVSIES.RUT.HrefValue = ""

			' AP_PATER
			CVSIES.AP_PATER.HrefValue = ""

			' AP_MATER
			CVSIES.AP_MATER.HrefValue = ""

			' NOMBRES
			CVSIES.NOMBRES.HrefValue = ""

			' SEXO
			CVSIES.SEXO.HrefValue = ""

			' FECNAC
			CVSIES.FECNAC.HrefValue = ""

			' NACIONALIDAD
			CVSIES.NACIONALIDAD.HrefValue = ""

			' NUMANIOS
			CVSIES.NUMANIOS.HrefValue = ""

			' INSTITUCION
			CVSIES.INSTITUCION.HrefValue = ""

			' PROFESION
			CVSIES.PROFESION.HrefValue = ""

			' PAISINSTITUCION
			CVSIES.PAISINSTITUCION.HrefValue = ""

			' Call Row_Rendered event
			CVSIES.Row_Rendered()
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

				' Field RUT
				SetSessionFilterValues(CVSIES.RUT)

				' Field AP_PATER
				SetSessionFilterValues(CVSIES.AP_PATER)

				' Field AP_MATER
				SetSessionFilterValues(CVSIES.AP_MATER)

				' Field NOMBRES
				SetSessionFilterValues(CVSIES.NOMBRES)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT
				If (GetFilterValues(CVSIES.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field AP_PATER
				If (GetFilterValues(CVSIES.AP_PATER)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field AP_MATER
				If (GetFilterValues(CVSIES.AP_MATER)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRES
				If (GetFilterValues(CVSIES.NOMBRES)) Then
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

			' Field RUT
			GetSessionFilterValues(CVSIES.RUT)

			' Field AP_PATER
			GetSessionFilterValues(CVSIES.AP_PATER)

			' Field AP_MATER
			GetSessionFilterValues(CVSIES.AP_MATER)

			' Field NOMBRES
			GetSessionFilterValues(CVSIES.NOMBRES)
		End If

		' Call page filter validated event
		CVSIES.Page_FilterValidated()

		' Build SQL
		' Field RUT

		BuildExtendedFilter(CVSIES.RUT, sFilter)

		' Field AP_PATER
		BuildExtendedFilter(CVSIES.AP_PATER, sFilter)

		' Field AP_MATER
		BuildExtendedFilter(CVSIES.AP_MATER, sFilter)

		' Field NOMBRES
		BuildExtendedFilter(CVSIES.NOMBRES, sFilter)

		' Save parms to Session
		' Field RUT

		SetSessionFilterValues(CVSIES.RUT)

		' Field AP_PATER
		SetSessionFilterValues(CVSIES.AP_PATER)

		' Field AP_MATER
		SetSessionFilterValues(CVSIES.AP_MATER)

		' Field NOMBRES
		SetSessionFilterValues(CVSIES.NOMBRES)

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
		If ew_Session("sv_CVSIES_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_CVSIES_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_CVSIES_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_CVSIES_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_CVSIES_" + parm)
		End If
		If ew_Session("so1_CVSIES_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_CVSIES_" + parm))
		End If
		If ew_Session("sc_CVSIES_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_CVSIES_" + parm))
		End If
		If ew_Session("sv2_CVSIES_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_CVSIES_" + parm)
		End If
		If ew_Session("so2_CVSIES_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_CVSIES_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_CVSIES_" + parm) = fld.SearchValue
		ew_Session("so1_CVSIES_" + parm) = fld.SearchOperator
		ew_Session("sc_CVSIES_" + parm) = fld.SearchCondition
		ew_Session("sv2_CVSIES_" + parm) = fld.SearchValue2
		ew_Session("so2_CVSIES_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_CVSIES_" + parm) = ""
		ew_Session("so1_CVSIES_" + parm) = "="
		ew_Session("sc_CVSIES_" + parm) = "AND"
		ew_Session("sv2_CVSIES_" + parm) = ""
		ew_Session("so2_CVSIES_" + parm) = "="
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
		ew_Session("sel_CVSIES_" & parm) = ""
		ew_Session("rf_CVSIES_" & parm) = ""
		ew_Session("rt_CVSIES_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = CVSIES.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_CVSIES_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_CVSIES_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_CVSIES_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(CVSIES.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(CVSIES.RUT)	

			' Field AP_PATER
			SetDefaultExtFilter(CVSIES.AP_PATER, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(CVSIES.AP_PATER)	

			' Field AP_MATER
			SetDefaultExtFilter(CVSIES.AP_MATER, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(CVSIES.AP_MATER)	

			' Field NOMBRES
			SetDefaultExtFilter(CVSIES.NOMBRES, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(CVSIES.NOMBRES)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT extended filter
		If (TextFilterApplied(CVSIES.RUT)) Then bFilterExist = True

		' Check AP_PATER extended filter
		If (TextFilterApplied(CVSIES.AP_PATER)) Then bFilterExist = True

		' Check AP_MATER extended filter
		If (TextFilterApplied(CVSIES.AP_MATER)) Then bFilterExist = True

		' Check NOMBRES extended filter
		If (TextFilterApplied(CVSIES.NOMBRES)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(CVSIES.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= CVSIES.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AP_PATER
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(CVSIES.AP_PATER, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= CVSIES.AP_PATER.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AP_MATER
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(CVSIES.AP_MATER, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= CVSIES.AP_MATER.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRES
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(CVSIES.NOMBRES, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= CVSIES.NOMBRES.FldCaption() & "<br>"
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
				CVSIES.OrderBy = ""
				CVSIES.StartGroup = 1
				CVSIES.RUT.Sort = ""
				CVSIES.AP_PATER.Sort = ""
				CVSIES.AP_MATER.Sort = ""
				CVSIES.NOMBRES.Sort = ""
				CVSIES.SEXO.Sort = ""
				CVSIES.FECNAC.Sort = ""
				CVSIES.NACIONALIDAD.Sort = ""
				CVSIES.NUMANIOS.Sort = ""
				CVSIES.INSTITUCION.Sort = ""
				CVSIES.PROFESION.Sort = ""
				CVSIES.PAISINSTITUCION.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			CVSIES.CurrentOrder = ew_Get("order")
			CVSIES.CurrentOrderType = ew_Get("ordertype")
			sSortSql = CVSIES.SortSql()
			CVSIES.OrderBy = sSortSql
			CVSIES.StartGroup = 1
		End If
		Return CVSIES.OrderBy
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
		CVSIES_summary = New crCVSIES_summary(Me)
		CVSIES_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		CVSIES_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (CVSIES_summary IsNot Nothing) Then CVSIES_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (CVSIES.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var CVSIES_summary = new ewrpt_Page("CVSIES_summary");
// page properties
CVSIES_summary.PageID = "summary"; // page ID
CVSIES_summary.FormID = "fCVSIESsummaryfilter"; // form ID
var EWRPT_PAGE_ID = CVSIES_summary.PageID;
// extend page with ValidateForm function
CVSIES_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
CVSIES_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
CVSIES_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
CVSIES_summary.ValidateRequired = false; // no JavaScript validation
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
<% CVSIES_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (CVSIES.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (CVSIES.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="underline"><h1>CV PARA SIES<h1></div>
<p>
  <% If (CVSIES.Export = "") Then %>
  &nbsp;&nbsp;<a href="<%= CVSIES_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
  <% If (CVSIES_summary.FilterApplied) Then %>
  &nbsp;</p>
<p>&nbsp;<a href="CVSIESsmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
  <% End If %>
  <% End If %>
  <br><br>
  <% CVSIES_summary.ShowMessage() %>
  <% If (CVSIES.Export = "") Then %>
</p>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (CVSIES.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (CVSIES.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (CVSIES.FilterPanelOption = 2 OrElse (CVSIES.FilterPanelOption = 3 AndAlso CVSIES_summary.FilterApplied) OrElse CVSIES_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span><br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fCVSIESsummaryfilter" id="fCVSIESsummaryfilter" action="CVSIESsmry.aspx" class="ewForm" onsubmit="return CVSIES_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = CVSIES.NOMBRES.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= CVSIES.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="20" value="<%= ew_HtmlEncode(CVSIES.RUT.SearchValue) %>"<%= IIf(CVSIES_summary.ClearExtFilter = "CVSIES_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= CVSIES.AP_PATER.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_AP_PATER" id="sv1_AP_PATER" size="30" maxlength="30" value="<%= ew_HtmlEncode(CVSIES.AP_PATER.SearchValue) %>"<%= IIf(CVSIES_summary.ClearExtFilter = "CVSIES_AP_PATER", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= CVSIES.AP_MATER.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_AP_MATER" id="sv1_AP_MATER" size="30" maxlength="30" value="<%= ew_HtmlEncode(CVSIES.AP_MATER.SearchValue) %>"<%= IIf(CVSIES_summary.ClearExtFilter = "CVSIES_AP_MATER", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= CVSIES.NOMBRES.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRES" id="sv1_NOMBRES" size="30" maxlength="30" value="<%= ew_HtmlEncode(CVSIES.NOMBRES.SearchValue) %>"<%= IIf(CVSIES_summary.ClearExtFilter = "CVSIES_NOMBRES", " class=""ewInputCleared""", "") %>>
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
<% If (CVSIES.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% CVSIES_summary.ShowFilterList() %>
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
If (CVSIES.ExportAll AndAlso ew_NotEmpty(CVSIES.Export)) Then
	CVSIES_summary.StopGrp = CVSIES_summary.TotalGrps
Else
	CVSIES_summary.StopGrp = CVSIES_summary.StartGrp + CVSIES_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (CVSIES_summary.StopGrp > CVSIES_summary.TotalGrps) Then
	CVSIES_summary.StopGrp = CVSIES_summary.TotalGrps
End If
CVSIES_summary.RecCount = 0

' Get first row
If (CVSIES_summary.TotalGrps > 0) Then
	CVSIES_summary.GetRow() ' ASPXRPT
	CVSIES_summary.GrpCount = 1
End If
While ((CVSIES_summary.HasRow AndAlso CVSIES_summary.GrpIndex < CVSIES_summary.StopGrp) OrElse CVSIES_summary.ShowFirstHeader)

	' Show header
	If (CVSIES_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.RUT) %>',0);"><%= CVSIES.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.AP_PATER.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.AP_PATER))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.AP_PATER.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.AP_PATER) %>',0);"><%= CVSIES.AP_PATER.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.AP_PATER.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.AP_PATER.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.AP_MATER.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.AP_MATER))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.AP_MATER.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.AP_MATER) %>',0);"><%= CVSIES.AP_MATER.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.AP_MATER.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.AP_MATER.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.NOMBRES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.NOMBRES))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.NOMBRES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.NOMBRES) %>',0);"><%= CVSIES.NOMBRES.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.NOMBRES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.NOMBRES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.SEXO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.SEXO))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.SEXO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.SEXO) %>',0);"><%= CVSIES.SEXO.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.SEXO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.SEXO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.FECNAC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.FECNAC))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.FECNAC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.FECNAC) %>',0);"><%= CVSIES.FECNAC.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.FECNAC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.FECNAC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.NACIONALIDAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.NACIONALIDAD))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.NACIONALIDAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.NACIONALIDAD) %>',0);"><%= CVSIES.NACIONALIDAD.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.NACIONALIDAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.NACIONALIDAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.NUMANIOS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.NUMANIOS))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.NUMANIOS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.NUMANIOS) %>',0);"><%= CVSIES.NUMANIOS.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.NUMANIOS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.NUMANIOS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.INSTITUCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.INSTITUCION))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.INSTITUCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.INSTITUCION) %>',0);"><%= CVSIES.INSTITUCION.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.INSTITUCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.INSTITUCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.PROFESION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.PROFESION))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.PROFESION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.PROFESION) %>',0);"><%= CVSIES.PROFESION.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.PROFESION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.PROFESION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CVSIES.Export)) Then %>
<%= CVSIES.PAISINSTITUCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CVSIES.SortUrl(CVSIES.PAISINSTITUCION))) Then %>
		<td style="vertical-align: bottom;"><%= CVSIES.PAISINSTITUCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CVSIES.SortUrl(CVSIES.PAISINSTITUCION) %>',0);"><%= CVSIES.PAISINSTITUCION.FldCaption() %></td><td style="width: 10px;">
		<% If (CVSIES.PAISINSTITUCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CVSIES.PAISINSTITUCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		CVSIES_summary.ShowFirstHeader = False
	End If
	CVSIES_summary.RecCount += 1

		' Render detail row
		CVSIES.ResetCSS()
		CVSIES.RowType = EWRPT_ROWTYPE_DETAIL
		CVSIES_summary.RenderRow()
%>
	<tr<%= CVSIES.RowAttributes() %>>
		<td<%= CVSIES.RUT.CellAttributes %>>
<div<%= CVSIES.RUT.ViewAttributes%>><%= CVSIES.RUT.ListViewValue%></div>
</td>
		<td<%= CVSIES.AP_PATER.CellAttributes %>>
<div<%= CVSIES.AP_PATER.ViewAttributes%>><%= CVSIES.AP_PATER.ListViewValue%></div>
</td>
		<td<%= CVSIES.AP_MATER.CellAttributes %>>
<div<%= CVSIES.AP_MATER.ViewAttributes%>><%= CVSIES.AP_MATER.ListViewValue%></div>
</td>
		<td<%= CVSIES.NOMBRES.CellAttributes %>>
<div<%= CVSIES.NOMBRES.ViewAttributes%>><%= CVSIES.NOMBRES.ListViewValue%></div>
</td>
		<td<%= CVSIES.SEXO.CellAttributes %>>
<div<%= CVSIES.SEXO.ViewAttributes%>><%= CVSIES.SEXO.ListViewValue%></div>
</td>
		<td<%= CVSIES.FECNAC.CellAttributes %>>
<div<%= CVSIES.FECNAC.ViewAttributes%>><%= CVSIES.FECNAC.ListViewValue%></div>
</td>
		<td<%= CVSIES.NACIONALIDAD.CellAttributes %>>
<div<%= CVSIES.NACIONALIDAD.ViewAttributes%>><%= CVSIES.NACIONALIDAD.ListViewValue%></div>
</td>
		<td<%= CVSIES.NUMANIOS.CellAttributes %>>
<div<%= CVSIES.NUMANIOS.ViewAttributes%>><%= CVSIES.NUMANIOS.ListViewValue%></div>
</td>
		<td<%= CVSIES.INSTITUCION.CellAttributes %>>
<div<%= CVSIES.INSTITUCION.ViewAttributes%>><%= CVSIES.INSTITUCION.ListViewValue%></div>
</td>
		<td<%= CVSIES.PROFESION.CellAttributes %>>
<div<%= CVSIES.PROFESION.ViewAttributes%>><%= CVSIES.PROFESION.ListViewValue%></div>
</td>
		<td<%= CVSIES.PAISINSTITUCION.CellAttributes %>>
<div<%= CVSIES.PAISINSTITUCION.ViewAttributes%>><%= CVSIES.PAISINSTITUCION.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		CVSIES_summary.AccumulateSummary()

		' Get next record
		CVSIES_summary.GetRow() ' ASPXRPT
		CVSIES_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (CVSIES_summary.TotalGrps > 0) Then
	CVSIES.ResetCSS()
	CVSIES.RowType = EWRPT_ROWTYPE_TOTAL
	CVSIES.RowTotalType = EWRPT_ROWTOTAL_GRAND
	CVSIES.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	CVSIES.RowAttrs("class") = "ewRptGrandSummary"
	CVSIES_summary.RenderRow()
%>
	<!-- tr><td colspan="11"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= CVSIES.RowAttributes() %>><td colspan="11"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(CVSIES_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (CVSIES.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If CVSIES_summary.Pager Is Nothing Then CVSIES_summary.Pager = New cPrevNextPager(CVSIES_summary.StartGrp, CVSIES_summary.DisplayGrps, CVSIES_summary.TotalGrps) %>
<% If CVSIES_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If CVSIES_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="CVSIESsmry.aspx?start=<%= CVSIES_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If CVSIES_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="CVSIESsmry.aspx?start=<%= CVSIES_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= CVSIES_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If CVSIES_summary.Pager.NextButton.Enabled Then %>
	<td><a href="CVSIESsmry.aspx?start=<%= CVSIES_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If CVSIES_summary.Pager.LastButton.Enabled Then %>
	<td><a href="CVSIESsmry.aspx?start=<%= CVSIES_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= CVSIES_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= CVSIES_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= CVSIES_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= CVSIES_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If CVSIES_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (CVSIES_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If CVSIES_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If CVSIES_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="ALL"<% If (CVSIES.GroupPerPage = -1) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("AllRecords") %></option>
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
<% If (CVSIES.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (CVSIES.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (CVSIES.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% CVSIES_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (CVSIES.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
