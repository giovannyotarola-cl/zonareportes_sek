<%@ Page ClassName="Alumnos_Retiradossmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_alumnos_retirados_2013" %>
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
	Public Alumnos_Retirados As crAlumnos_Retirados = Nothing

	'
	' Table class (for Alumnos Retirados)
	'
	Public Class crAlumnos_Retirados
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
				Return "Alumnos_Retirados"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Alumnos Retirados"
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

		Public NOMBRE As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public RUT As crField

		Public CODCLI As crField

		Public CODCARPR As crField

		Public NOMBRE_C As crField

		Public ANO As crField

		Public PERIODO As crField

		Public TIPOSITU As crField

		Public OBSERVACION As crField

		Public CODSITU As crField

		Public NOMBRE_SITU As crField

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

			' NOMBRE
			NOMBRE = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' RUT
			RUT = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' CODCLI
			CODCLI = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCLI.Page = APage
			CODCLI.ParentPage = APage.ParentPage
			Fields.Add("CODCLI", CODCLI)
			CODCLI.DateFilter = ""
			CODCLI.SqlSelect = ""
			CODCLI.SqlOrderBy = ""

			' CODCARPR
			CODCARPR = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_CODCARPR", "CODCARPR", "[CODCARPR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARPR.Page = APage
			CODCARPR.ParentPage = APage.ParentPage
			Fields.Add("CODCARPR", CODCARPR)
			CODCARPR.DateFilter = ""
			CODCARPR.SqlSelect = ""
			CODCARPR.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' ANO
			ANO = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_PERIODO", "PERIODO", "[PERIODO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			PERIODO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' TIPOSITU
			TIPOSITU = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_TIPOSITU", "TIPOSITU", "[TIPOSITU]", 131, EWRPT_DATATYPE_NUMBER, -1)
			TIPOSITU.Page = APage
			TIPOSITU.ParentPage = APage.ParentPage
			TIPOSITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("TIPOSITU", TIPOSITU)
			TIPOSITU.DateFilter = ""
			TIPOSITU.SqlSelect = ""
			TIPOSITU.SqlOrderBy = ""

			' OBSERVACION
			OBSERVACION = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_OBSERVACION", "OBSERVACION", "[OBSERVACION]", 200, EWRPT_DATATYPE_STRING, -1)
			OBSERVACION.Page = APage
			OBSERVACION.ParentPage = APage.ParentPage
			Fields.Add("OBSERVACION", OBSERVACION)
			OBSERVACION.DateFilter = ""
			OBSERVACION.SqlSelect = ""
			OBSERVACION.SqlOrderBy = ""

			' CODSITU
			CODSITU = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_CODSITU", "CODSITU", "[CODSITU]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CODSITU.Page = APage
			CODSITU.ParentPage = APage.ParentPage
			CODSITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CODSITU", CODSITU)
			CODSITU.DateFilter = ""
			CODSITU.SqlSelect = ""
			CODSITU.SqlOrderBy = ""

			' NOMBRE_SITU
			NOMBRE_SITU = new crField("Alumnos_Retirados", "Alumnos Retirados", "x_NOMBRE_SITU", "NOMBRE_SITU", "[NOMBRE_SITU]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_SITU.Page = APage
			NOMBRE_SITU.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_SITU", NOMBRE_SITU)
			NOMBRE_SITU.DateFilter = ""
			NOMBRE_SITU.SqlSelect = ""
			NOMBRE_SITU.SqlOrderBy = ""
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
				Return "[SEK_Alumnos_Retirados_2013]"
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
	Public Alumnos_Retirados_summary As crAlumnos_Retirados_summary

	'
	' Page class
	'
	Public Class crAlumnos_Retirados_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Alumnos_Retirados.UseTokenInUrl) Then
				sUrl &= "t=" & Alumnos_Retirados.TableVar & "&" ' Add page token
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
			If (Alumnos_Retirados.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Alumnos_Retirados.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Alumnos_Retirados.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Alumnos_Retiradossmry 
			Get
				Return CType(m_ParentPage, Alumnos_Retiradossmry)
			End Get
		End Property

		' Table object (Alumnos_Retirados)
		Public Property Alumnos_Retirados As crAlumnos_Retirados 
			Get		
				Return AspNetPage.Alumnos_Retirados ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAlumnos_Retirados)
				AspNetPage.Alumnos_Retirados = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_alumnos_retirados_2013)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Alumnos_Retirados_summary"
			m_PageObjTypeName = "crAlumnos_Retirados_summary"

			' Table name
			m_TableName = "Alumnos Retirados"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Alumnos_Retirados)
			Alumnos_Retirados = New crAlumnos_Retirados(Me)			

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
				Alumnos_Retirados.Export = ew_Get("export")
			End If
			gsExport = Alumnos_Retirados.Export ' Get export parameter, used in header
			gsExportFile = Alumnos_Retirados.TableVar ' Get export file, used in header
			If (Alumnos_Retirados.Export = "excel") Then
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

		Public Val As Object() = New Object(13) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(13) {}

		Public GrandMn As Object() = New Object(13) {}

		Public GrandMx As Object() = New Object(13) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 14 ' No. of fields
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
			Alumnos_Retirados.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Alumnos_Retirados.SqlSelect, Alumnos_Retirados.SqlWhere, Alumnos_Retirados.SqlGroupBy, Alumnos_Retirados.SqlHaving, Alumnos_Retirados.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Alumnos_Retirados.ExportAll AndAlso ew_NotEmpty(Alumnos_Retirados.Export)) Then
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
				Alumnos_Retirados.CODCLI.DbValue = Row("CODCLI")
				Alumnos_Retirados.ANO.DbValue = Row("ANO")
				Alumnos_Retirados.PERIODO.DbValue = Row("PERIODO")
				Alumnos_Retirados.TIPOSITU.DbValue = Row("TIPOSITU")
				Alumnos_Retirados.OBSERVACION.DbValue = Row("OBSERVACION")
				Alumnos_Retirados.CODSITU.DbValue = Row("CODSITU")
				Alumnos_Retirados.RUT.DbValue = Row("RUT")
				Alumnos_Retirados.NOMBRE.DbValue = Row("NOMBRE")
				Alumnos_Retirados.PATERNO.DbValue = Row("PATERNO")
				Alumnos_Retirados.MATERNO.DbValue = Row("MATERNO")
				Alumnos_Retirados.CODCARPR.DbValue = Row("CODCARPR")
				Alumnos_Retirados.NOMBRE_C.DbValue = Row("NOMBRE_C")
				Alumnos_Retirados.NOMBRE_SITU.DbValue = Row("NOMBRE_SITU")
				Val(1) = Alumnos_Retirados.NOMBRE.CurrentValue
				Val(2) = Alumnos_Retirados.PATERNO.CurrentValue
				Val(3) = Alumnos_Retirados.MATERNO.CurrentValue
				Val(4) = Alumnos_Retirados.RUT.CurrentValue
				Val(5) = Alumnos_Retirados.CODCLI.CurrentValue
				Val(6) = Alumnos_Retirados.CODCARPR.CurrentValue
				Val(7) = Alumnos_Retirados.NOMBRE_C.CurrentValue
				Val(8) = Alumnos_Retirados.ANO.CurrentValue
				Val(9) = Alumnos_Retirados.PERIODO.CurrentValue
				Val(10) = Alumnos_Retirados.TIPOSITU.CurrentValue
				Val(11) = Alumnos_Retirados.OBSERVACION.CurrentValue
				Val(12) = Alumnos_Retirados.CODSITU.CurrentValue
				Val(13) = Alumnos_Retirados.NOMBRE_SITU.CurrentValue
			Else
				Alumnos_Retirados.CODCLI.DbValue = ""
				Alumnos_Retirados.ANO.DbValue = ""
				Alumnos_Retirados.PERIODO.DbValue = ""
				Alumnos_Retirados.TIPOSITU.DbValue = ""
				Alumnos_Retirados.OBSERVACION.DbValue = ""
				Alumnos_Retirados.CODSITU.DbValue = ""
				Alumnos_Retirados.RUT.DbValue = ""
				Alumnos_Retirados.NOMBRE.DbValue = ""
				Alumnos_Retirados.PATERNO.DbValue = ""
				Alumnos_Retirados.MATERNO.DbValue = ""
				Alumnos_Retirados.CODCARPR.DbValue = ""
				Alumnos_Retirados.NOMBRE_C.DbValue = ""
				Alumnos_Retirados.NOMBRE_SITU.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Alumnos_Retirados.CODCLI.DbValue = dr("CODCLI")
				Alumnos_Retirados.ANO.DbValue = dr("ANO")
				Alumnos_Retirados.PERIODO.DbValue = dr("PERIODO")
				Alumnos_Retirados.TIPOSITU.DbValue = dr("TIPOSITU")
				Alumnos_Retirados.OBSERVACION.DbValue = dr("OBSERVACION")
				Alumnos_Retirados.CODSITU.DbValue = dr("CODSITU")
				Alumnos_Retirados.RUT.DbValue = dr("RUT")
				Alumnos_Retirados.NOMBRE.DbValue = dr("NOMBRE")
				Alumnos_Retirados.PATERNO.DbValue = dr("PATERNO")
				Alumnos_Retirados.MATERNO.DbValue = dr("MATERNO")
				Alumnos_Retirados.CODCARPR.DbValue = dr("CODCARPR")
				Alumnos_Retirados.NOMBRE_C.DbValue = dr("NOMBRE_C")
				Alumnos_Retirados.NOMBRE_SITU.DbValue = dr("NOMBRE_SITU")
				Val(1) = Alumnos_Retirados.NOMBRE.CurrentValue
				Val(2) = Alumnos_Retirados.PATERNO.CurrentValue
				Val(3) = Alumnos_Retirados.MATERNO.CurrentValue
				Val(4) = Alumnos_Retirados.RUT.CurrentValue
				Val(5) = Alumnos_Retirados.CODCLI.CurrentValue
				Val(6) = Alumnos_Retirados.CODCARPR.CurrentValue
				Val(7) = Alumnos_Retirados.NOMBRE_C.CurrentValue
				Val(8) = Alumnos_Retirados.ANO.CurrentValue
				Val(9) = Alumnos_Retirados.PERIODO.CurrentValue
				Val(10) = Alumnos_Retirados.TIPOSITU.CurrentValue
				Val(11) = Alumnos_Retirados.OBSERVACION.CurrentValue
				Val(12) = Alumnos_Retirados.CODSITU.CurrentValue
				Val(13) = Alumnos_Retirados.NOMBRE_SITU.CurrentValue
			Else				
				Alumnos_Retirados.CODCLI.DbValue = ""
				Alumnos_Retirados.ANO.DbValue = ""
				Alumnos_Retirados.PERIODO.DbValue = ""
				Alumnos_Retirados.TIPOSITU.DbValue = ""
				Alumnos_Retirados.OBSERVACION.DbValue = ""
				Alumnos_Retirados.CODSITU.DbValue = ""
				Alumnos_Retirados.RUT.DbValue = ""
				Alumnos_Retirados.NOMBRE.DbValue = ""
				Alumnos_Retirados.PATERNO.DbValue = ""
				Alumnos_Retirados.MATERNO.DbValue = ""
				Alumnos_Retirados.CODCARPR.DbValue = ""
				Alumnos_Retirados.NOMBRE_C.DbValue = ""
				Alumnos_Retirados.NOMBRE_SITU.DbValue = ""
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
				Alumnos_Retirados.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Alumnos_Retirados.StartGroup = StartGrp
				Else
					StartGrp = Alumnos_Retirados.StartGroup
				End If
			Else
				StartGrp = Alumnos_Retirados.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Alumnos_Retirados.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Alumnos_Retirados.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Alumnos_Retirados.StartGroup = StartGrp
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
			Alumnos_Retirados.StartGroup = StartGrp
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
				Alumnos_Retirados.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Alumnos_Retirados.StartGroup = StartGrp
			Else				
				If (Alumnos_Retirados.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Alumnos_Retirados.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Alumnos_Retirados.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Alumnos_Retirados.SqlSelectCount, Alumnos_Retirados.SqlWhere, Alumnos_Retirados.SqlGroupBy, Alumnos_Retirados.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Alumnos_Retirados.Row_Rendering()

			'
			' Render view codes
			'

			If (Alumnos_Retirados.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' NOMBRE
				Alumnos_Retirados.NOMBRE.ViewValue = Convert.ToString(Alumnos_Retirados.NOMBRE.Summary)

				' PATERNO
				Alumnos_Retirados.PATERNO.ViewValue = Convert.ToString(Alumnos_Retirados.PATERNO.Summary)

				' MATERNO
				Alumnos_Retirados.MATERNO.ViewValue = Convert.ToString(Alumnos_Retirados.MATERNO.Summary)

				' RUT
				Alumnos_Retirados.RUT.ViewValue = Convert.ToString(Alumnos_Retirados.RUT.Summary)

				' CODCLI
				Alumnos_Retirados.CODCLI.ViewValue = Convert.ToString(Alumnos_Retirados.CODCLI.Summary)

				' CODCARPR
				Alumnos_Retirados.CODCARPR.ViewValue = Convert.ToString(Alumnos_Retirados.CODCARPR.Summary)

				' NOMBRE_C
				Alumnos_Retirados.NOMBRE_C.ViewValue = Convert.ToString(Alumnos_Retirados.NOMBRE_C.Summary)

				' ANO
				Alumnos_Retirados.ANO.ViewValue = Convert.ToString(Alumnos_Retirados.ANO.Summary)

				' PERIODO
				Alumnos_Retirados.PERIODO.ViewValue = Convert.ToString(Alumnos_Retirados.PERIODO.Summary)

				' TIPOSITU
				Alumnos_Retirados.TIPOSITU.ViewValue = Convert.ToString(Alumnos_Retirados.TIPOSITU.Summary)

				' OBSERVACION
				Alumnos_Retirados.OBSERVACION.ViewValue = Convert.ToString(Alumnos_Retirados.OBSERVACION.Summary)

				' CODSITU
				Alumnos_Retirados.CODSITU.ViewValue = Convert.ToString(Alumnos_Retirados.CODSITU.Summary)

				' NOMBRE_SITU
				Alumnos_Retirados.NOMBRE_SITU.ViewValue = Convert.ToString(Alumnos_Retirados.NOMBRE_SITU.Summary)
			Else

				' NOMBRE
				Alumnos_Retirados.NOMBRE.ViewValue = Convert.ToString(Alumnos_Retirados.NOMBRE.CurrentValue)
				Alumnos_Retirados.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Alumnos_Retirados.PATERNO.ViewValue = Convert.ToString(Alumnos_Retirados.PATERNO.CurrentValue)
				Alumnos_Retirados.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Alumnos_Retirados.MATERNO.ViewValue = Convert.ToString(Alumnos_Retirados.MATERNO.CurrentValue)
				Alumnos_Retirados.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				Alumnos_Retirados.RUT.ViewValue = Convert.ToString(Alumnos_Retirados.RUT.CurrentValue)
				Alumnos_Retirados.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCLI
				Alumnos_Retirados.CODCLI.ViewValue = Convert.ToString(Alumnos_Retirados.CODCLI.CurrentValue)
				Alumnos_Retirados.CODCLI.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARPR
				Alumnos_Retirados.CODCARPR.ViewValue = Convert.ToString(Alumnos_Retirados.CODCARPR.CurrentValue)
				Alumnos_Retirados.CODCARPR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				Alumnos_Retirados.NOMBRE_C.ViewValue = Convert.ToString(Alumnos_Retirados.NOMBRE_C.CurrentValue)
				Alumnos_Retirados.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				Alumnos_Retirados.ANO.ViewValue = Convert.ToString(Alumnos_Retirados.ANO.CurrentValue)
				Alumnos_Retirados.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO
				Alumnos_Retirados.PERIODO.ViewValue = Convert.ToString(Alumnos_Retirados.PERIODO.CurrentValue)
				Alumnos_Retirados.PERIODO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIPOSITU
				Alumnos_Retirados.TIPOSITU.ViewValue = Convert.ToString(Alumnos_Retirados.TIPOSITU.CurrentValue)
				Alumnos_Retirados.TIPOSITU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' OBSERVACION
				Alumnos_Retirados.OBSERVACION.ViewValue = Convert.ToString(Alumnos_Retirados.OBSERVACION.CurrentValue)
				Alumnos_Retirados.OBSERVACION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODSITU
				Alumnos_Retirados.CODSITU.ViewValue = Convert.ToString(Alumnos_Retirados.CODSITU.CurrentValue)
				Alumnos_Retirados.CODSITU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_SITU
				Alumnos_Retirados.NOMBRE_SITU.ViewValue = Convert.ToString(Alumnos_Retirados.NOMBRE_SITU.CurrentValue)
				Alumnos_Retirados.NOMBRE_SITU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' NOMBRE
			Alumnos_Retirados.NOMBRE.HrefValue = ""

			' PATERNO
			Alumnos_Retirados.PATERNO.HrefValue = ""

			' MATERNO
			Alumnos_Retirados.MATERNO.HrefValue = ""

			' RUT
			Alumnos_Retirados.RUT.HrefValue = ""

			' CODCLI
			Alumnos_Retirados.CODCLI.HrefValue = ""

			' CODCARPR
			Alumnos_Retirados.CODCARPR.HrefValue = ""

			' NOMBRE_C
			Alumnos_Retirados.NOMBRE_C.HrefValue = ""

			' ANO
			Alumnos_Retirados.ANO.HrefValue = ""

			' PERIODO
			Alumnos_Retirados.PERIODO.HrefValue = ""

			' TIPOSITU
			Alumnos_Retirados.TIPOSITU.HrefValue = ""

			' OBSERVACION
			Alumnos_Retirados.OBSERVACION.HrefValue = ""

			' CODSITU
			Alumnos_Retirados.CODSITU.HrefValue = ""

			' NOMBRE_SITU
			Alumnos_Retirados.NOMBRE_SITU.HrefValue = ""

			' Call Row_Rendered event
			Alumnos_Retirados.Row_Rendered()
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

			' Field NOMBRE_C
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + Alumnos_Retirados.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Retirados.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_Retirados.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO
			sSelect = "SELECT DISTINCT [ANO] FROM " + Alumnos_Retirados.SqlFrom
			sOrderBy = "[ANO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Retirados.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_Retirados.ANO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PERIODO
			sSelect = "SELECT DISTINCT [PERIODO] FROM " + Alumnos_Retirados.SqlFrom
			sOrderBy = "[PERIODO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Retirados.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_Retirados.PERIODO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field TIPOSITU
			sSelect = "SELECT DISTINCT [TIPOSITU] FROM " + Alumnos_Retirados.SqlFrom
			sOrderBy = "[TIPOSITU] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Retirados.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_Retirados.TIPOSITU.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CODSITU
			sSelect = "SELECT DISTINCT [CODSITU] FROM " + Alumnos_Retirados.SqlFrom
			sOrderBy = "[CODSITU] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Retirados.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_Retirados.CODSITU.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NOMBRE_SITU
			sSelect = "SELECT DISTINCT [NOMBRE_SITU] FROM " + Alumnos_Retirados.SqlFrom
			sOrderBy = "[NOMBRE_SITU] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Retirados.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_Retirados.NOMBRE_SITU.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field PATERNO
				SetSessionFilterValues(Alumnos_Retirados.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Alumnos_Retirados.MATERNO)

				' Field RUT
				SetSessionFilterValues(Alumnos_Retirados.RUT)

				' Field CODCARPR
				SetSessionFilterValues(Alumnos_Retirados.CODCARPR)

				' Field NOMBRE_C
				SetSessionDropDownValue(Alumnos_Retirados.NOMBRE_C.DropDownValue, Alumnos_Retirados.NOMBRE_C)

				' Field ANO
				SetSessionDropDownValue(Alumnos_Retirados.ANO.DropDownValue, Alumnos_Retirados.ANO)

				' Field PERIODO
				SetSessionDropDownValue(Alumnos_Retirados.PERIODO.DropDownValue, Alumnos_Retirados.PERIODO)

				' Field TIPOSITU
				SetSessionDropDownValue(Alumnos_Retirados.TIPOSITU.DropDownValue, Alumnos_Retirados.TIPOSITU)

				' Field CODSITU
				SetSessionDropDownValue(Alumnos_Retirados.CODSITU.DropDownValue, Alumnos_Retirados.CODSITU)

				' Field NOMBRE_SITU
				SetSessionDropDownValue(Alumnos_Retirados.NOMBRE_SITU.DropDownValue, Alumnos_Retirados.NOMBRE_SITU)
			bSetupFilter = True ' Set up filter required
		Else

				' Field PATERNO
				If (GetFilterValues(Alumnos_Retirados.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Alumnos_Retirados.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field RUT
				If (GetFilterValues(Alumnos_Retirados.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field CODCARPR
				If (GetFilterValues(Alumnos_Retirados.CODCARPR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE_C
				If (GetDropDownValue(Alumnos_Retirados.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_Retirados.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(Alumnos_Retirados.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_Retirados_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO
				If (GetDropDownValue(Alumnos_Retirados.ANO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_Retirados.ANO.DropDownValue) Then
					If Not ew_SameStr(Alumnos_Retirados.ANO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_Retirados_ANO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PERIODO
				If (GetDropDownValue(Alumnos_Retirados.PERIODO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_Retirados.PERIODO.DropDownValue) Then
					If Not ew_SameStr(Alumnos_Retirados.PERIODO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_Retirados_PERIODO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field TIPOSITU
				If (GetDropDownValue(Alumnos_Retirados.TIPOSITU)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_Retirados.TIPOSITU.DropDownValue) Then
					If Not ew_SameStr(Alumnos_Retirados.TIPOSITU.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_Retirados_TIPOSITU") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CODSITU
				If (GetDropDownValue(Alumnos_Retirados.CODSITU)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_Retirados.CODSITU.DropDownValue) Then
					If Not ew_SameStr(Alumnos_Retirados.CODSITU.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_Retirados_CODSITU") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field NOMBRE_SITU
				If (GetDropDownValue(Alumnos_Retirados.NOMBRE_SITU)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_Retirados.NOMBRE_SITU.DropDownValue) Then
					If Not ew_SameStr(Alumnos_Retirados.NOMBRE_SITU.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_Retirados_NOMBRE_SITU") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If
			If Not ValidateForm() Then
				Message = gsFormError
				Return sFilter
			End If
		End If

		' Restore session
		If bRestoreSession Then

			' Field PATERNO
			GetSessionFilterValues(Alumnos_Retirados.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Alumnos_Retirados.MATERNO)

			' Field RUT
			GetSessionFilterValues(Alumnos_Retirados.RUT)

			' Field CODCARPR
			GetSessionFilterValues(Alumnos_Retirados.CODCARPR)

			' Field NOMBRE_C
			GetSessionDropDownValue(Alumnos_Retirados.NOMBRE_C)

			' Field ANO
			GetSessionDropDownValue(Alumnos_Retirados.ANO)

			' Field PERIODO
			GetSessionDropDownValue(Alumnos_Retirados.PERIODO)

			' Field TIPOSITU
			GetSessionDropDownValue(Alumnos_Retirados.TIPOSITU)

			' Field CODSITU
			GetSessionDropDownValue(Alumnos_Retirados.CODSITU)

			' Field NOMBRE_SITU
			GetSessionDropDownValue(Alumnos_Retirados.NOMBRE_SITU)
		End If

		' Call page filter validated event
		Alumnos_Retirados.Page_FilterValidated()

		' Build SQL
		' Field PATERNO

		BuildExtendedFilter(Alumnos_Retirados.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Alumnos_Retirados.MATERNO, sFilter)

		' Field RUT
		BuildExtendedFilter(Alumnos_Retirados.RUT, sFilter)

		' Field CODCARPR
		BuildExtendedFilter(Alumnos_Retirados.CODCARPR, sFilter)

		' Field NOMBRE_C
		BuildDropDownFilter(Alumnos_Retirados.NOMBRE_C, sFilter, "")

		' Field ANO
		BuildDropDownFilter(Alumnos_Retirados.ANO, sFilter, "")

		' Field PERIODO
		BuildDropDownFilter(Alumnos_Retirados.PERIODO, sFilter, "")

		' Field TIPOSITU
		BuildDropDownFilter(Alumnos_Retirados.TIPOSITU, sFilter, "")

		' Field CODSITU
		BuildDropDownFilter(Alumnos_Retirados.CODSITU, sFilter, "")

		' Field NOMBRE_SITU
		BuildDropDownFilter(Alumnos_Retirados.NOMBRE_SITU, sFilter, "")

		' Save parms to Session
		' Field PATERNO

		SetSessionFilterValues(Alumnos_Retirados.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Alumnos_Retirados.MATERNO)

		' Field RUT
		SetSessionFilterValues(Alumnos_Retirados.RUT)

		' Field CODCARPR
		SetSessionFilterValues(Alumnos_Retirados.CODCARPR)

		' Field NOMBRE_C
		SetSessionDropDownValue(Alumnos_Retirados.NOMBRE_C.DropDownValue, Alumnos_Retirados.NOMBRE_C)

		' Field ANO
		SetSessionDropDownValue(Alumnos_Retirados.ANO.DropDownValue, Alumnos_Retirados.ANO)

		' Field PERIODO
		SetSessionDropDownValue(Alumnos_Retirados.PERIODO.DropDownValue, Alumnos_Retirados.PERIODO)

		' Field TIPOSITU
		SetSessionDropDownValue(Alumnos_Retirados.TIPOSITU.DropDownValue, Alumnos_Retirados.TIPOSITU)

		' Field CODSITU
		SetSessionDropDownValue(Alumnos_Retirados.CODSITU.DropDownValue, Alumnos_Retirados.CODSITU)

		' Field NOMBRE_SITU
		SetSessionDropDownValue(Alumnos_Retirados.NOMBRE_SITU.DropDownValue, Alumnos_Retirados.NOMBRE_SITU)

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
		If ew_Session("sv_Alumnos_Retirados_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Alumnos_Retirados_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Alumnos_Retirados_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Alumnos_Retirados_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Alumnos_Retirados_" + parm)
		End If
		If ew_Session("so1_Alumnos_Retirados_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Alumnos_Retirados_" + parm))
		End If
		If ew_Session("sc_Alumnos_Retirados_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Alumnos_Retirados_" + parm))
		End If
		If ew_Session("sv2_Alumnos_Retirados_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Alumnos_Retirados_" + parm)
		End If
		If ew_Session("so2_Alumnos_Retirados_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Alumnos_Retirados_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Alumnos_Retirados_" + parm) = fld.SearchValue
		ew_Session("so1_Alumnos_Retirados_" + parm) = fld.SearchOperator
		ew_Session("sc_Alumnos_Retirados_" + parm) = fld.SearchCondition
		ew_Session("sv2_Alumnos_Retirados_" + parm) = fld.SearchValue2
		ew_Session("so2_Alumnos_Retirados_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Alumnos_Retirados_" + parm) = ""
		ew_Session("so1_Alumnos_Retirados_" + parm) = "="
		ew_Session("sc_Alumnos_Retirados_" + parm) = "AND"
		ew_Session("sv2_Alumnos_Retirados_" + parm) = ""
		ew_Session("so2_Alumnos_Retirados_" + parm) = "="
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
		ew_Session("sel_Alumnos_Retirados_" & parm) = ""
		ew_Session("rf_Alumnos_Retirados_" & parm) = ""
		ew_Session("rt_Alumnos_Retirados_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Alumnos_Retirados.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Alumnos_Retirados_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Alumnos_Retirados_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Alumnos_Retirados_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBRE_C

			Alumnos_Retirados.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_Retirados.NOMBRE_C.DropDownValue = Alumnos_Retirados.NOMBRE_C.DefaultDropDownValue

			' Field ANO
			Alumnos_Retirados.ANO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_Retirados.ANO.DropDownValue = Alumnos_Retirados.ANO.DefaultDropDownValue

			' Field PERIODO
			Alumnos_Retirados.PERIODO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_Retirados.PERIODO.DropDownValue = Alumnos_Retirados.PERIODO.DefaultDropDownValue

			' Field TIPOSITU
			Alumnos_Retirados.TIPOSITU.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_Retirados.TIPOSITU.DropDownValue = Alumnos_Retirados.TIPOSITU.DefaultDropDownValue

			' Field CODSITU
			Alumnos_Retirados.CODSITU.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_Retirados.CODSITU.DropDownValue = Alumnos_Retirados.CODSITU.DefaultDropDownValue

			' Field NOMBRE_SITU
			Alumnos_Retirados.NOMBRE_SITU.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_Retirados.NOMBRE_SITU.DropDownValue = Alumnos_Retirados.NOMBRE_SITU.DefaultDropDownValue

		' Set up default values for extended filters
			' Field PATERNO

			SetDefaultExtFilter(Alumnos_Retirados.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_Retirados.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Alumnos_Retirados.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_Retirados.MATERNO)	

			' Field RUT
			SetDefaultExtFilter(Alumnos_Retirados.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_Retirados.RUT)	

			' Field CODCARPR
			SetDefaultExtFilter(Alumnos_Retirados.CODCARPR, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_Retirados.CODCARPR)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check PATERNO extended filter
		If (TextFilterApplied(Alumnos_Retirados.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Alumnos_Retirados.MATERNO)) Then bFilterExist = True

		' Check RUT extended filter
		If (TextFilterApplied(Alumnos_Retirados.RUT)) Then bFilterExist = True

		' Check CODCARPR extended filter
		If (TextFilterApplied(Alumnos_Retirados.CODCARPR)) Then bFilterExist = True

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(Alumnos_Retirados.NOMBRE_C)) Then bFilterExist = True

		' Check ANO dropdown filter
		If (NonTextFilterApplied(Alumnos_Retirados.ANO)) Then bFilterExist = True

		' Check PERIODO dropdown filter
		If (NonTextFilterApplied(Alumnos_Retirados.PERIODO)) Then bFilterExist = True

		' Check TIPOSITU dropdown filter
		If (NonTextFilterApplied(Alumnos_Retirados.TIPOSITU)) Then bFilterExist = True

		' Check CODSITU dropdown filter
		If (NonTextFilterApplied(Alumnos_Retirados.CODSITU)) Then bFilterExist = True

		' Check NOMBRE_SITU dropdown filter
		If (NonTextFilterApplied(Alumnos_Retirados.NOMBRE_SITU)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_Retirados.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_Retirados.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_Retirados.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODCARPR
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_Retirados.CODCARPR, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.CODCARPR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_Retirados.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_Retirados.ANO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.ANO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_Retirados.PERIODO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.PERIODO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field TIPOSITU
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_Retirados.TIPOSITU, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.TIPOSITU.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODSITU
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_Retirados.CODSITU, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.CODSITU.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_SITU
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_Retirados.NOMBRE_SITU, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_Retirados.NOMBRE_SITU.FldCaption() & "<br>"
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
				Alumnos_Retirados.OrderBy = ""
				Alumnos_Retirados.StartGroup = 1
				Alumnos_Retirados.NOMBRE.Sort = ""
				Alumnos_Retirados.PATERNO.Sort = ""
				Alumnos_Retirados.MATERNO.Sort = ""
				Alumnos_Retirados.RUT.Sort = ""
				Alumnos_Retirados.CODCLI.Sort = ""
				Alumnos_Retirados.CODCARPR.Sort = ""
				Alumnos_Retirados.NOMBRE_C.Sort = ""
				Alumnos_Retirados.ANO.Sort = ""
				Alumnos_Retirados.PERIODO.Sort = ""
				Alumnos_Retirados.TIPOSITU.Sort = ""
				Alumnos_Retirados.OBSERVACION.Sort = ""
				Alumnos_Retirados.CODSITU.Sort = ""
				Alumnos_Retirados.NOMBRE_SITU.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Alumnos_Retirados.CurrentOrder = ew_Get("order")
			Alumnos_Retirados.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Alumnos_Retirados.SortSql()
			Alumnos_Retirados.OrderBy = sSortSql
			Alumnos_Retirados.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Alumnos_Retirados.OrderBy)) Then
			Alumnos_Retirados.OrderBy = "[PATERNO] ASC, [MATERNO] ASC"
			Alumnos_Retirados.PATERNO.Sort = "ASC"
			Alumnos_Retirados.MATERNO.Sort = "ASC"
		End If
		Return Alumnos_Retirados.OrderBy
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
		Alumnos_Retirados_summary = New crAlumnos_Retirados_summary(Me)
		Alumnos_Retirados_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Alumnos_Retirados_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Alumnos_Retirados_summary IsNot Nothing) Then Alumnos_Retirados_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Alumnos_Retirados.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Alumnos_Retirados_summary = new ewrpt_Page("Alumnos_Retirados_summary");
// page properties
Alumnos_Retirados_summary.PageID = "summary"; // page ID
Alumnos_Retirados_summary.FormID = "fAlumnos_Retiradossummaryfilter"; // form ID
var EWRPT_PAGE_ID = Alumnos_Retirados_summary.PageID;
// extend page with ValidateForm function
Alumnos_Retirados_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Alumnos_Retirados_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Alumnos_Retirados_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Alumnos_Retirados_summary.ValidateRequired = false; // no JavaScript validation
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
<% Alumnos_Retirados_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Alumnos_Retirados.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Alumnos_Retirados.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Alumnos_Retirados.TableCaption() %></h1></div>
<% If (Alumnos_Retirados.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Alumnos_Retirados_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% If (Alumnos_Retirados_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Alumnos_Retirados_summary.ShowMessage() %>
<% If (Alumnos_Retirados.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Alumnos_Retirados.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Alumnos_Retirados.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Alumnos_Retirados.FilterPanelOption = 2 OrElse (Alumnos_Retirados.FilterPanelOption = 3 AndAlso Alumnos_Retirados_summary.FilterApplied) OrElse Alumnos_Retirados_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Alumnos_Retiradossmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fAlumnos_Retiradossummaryfilter" id="fAlumnos_Retiradossummaryfilter" action="Alumnos_Retiradossmry.aspx" class="ewForm" onsubmit="return Alumnos_Retirados_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Alumnos_Retirados.CODCARPR.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Alumnos_Retirados.PATERNO.SearchValue) %>"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Alumnos_Retirados.MATERNO.SearchValue) %>"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="32" value="<%= ew_HtmlEncode(Alumnos_Retirados.RUT.SearchValue) %>"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.CODCARPR.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODCARPR" id="sv1_CODCARPR" size="30" maxlength="30" value="<%= ew_HtmlEncode(Alumnos_Retirados.CODCARPR.SearchValue) %>"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_CODCARPR", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_Retirados.NOMBRE_C.CustomFilters.Count + Alumnos_Retirados.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_Retirados.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_Retirados.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.ANO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO" id="sv_ANO"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_ANO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.ANO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_Retirados.ANO.CustomFilters.Count + Alumnos_Retirados.ANO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_Retirados.ANO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.ANO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_Retirados.ANO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.ANO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.PERIODO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO" id="sv_PERIODO"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_PERIODO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.PERIODO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_Retirados.PERIODO.CustomFilters.Count + Alumnos_Retirados.PERIODO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_Retirados.PERIODO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PERIODO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.PERIODO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_Retirados.PERIODO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.PERIODO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.TIPOSITU.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_TIPOSITU" id="sv_TIPOSITU"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_TIPOSITU", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.TIPOSITU.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_Retirados.TIPOSITU.CustomFilters.Count + Alumnos_Retirados.TIPOSITU.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_Retirados.TIPOSITU.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "TIPOSITU")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.TIPOSITU.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_Retirados.TIPOSITU.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.TIPOSITU.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.CODSITU.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CODSITU" id="sv_CODSITU"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_CODSITU", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.CODSITU.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_Retirados.CODSITU.CustomFilters.Count + Alumnos_Retirados.CODSITU.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_Retirados.CODSITU.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CODSITU")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.CODSITU.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_Retirados.CODSITU.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.CODSITU.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Retirados.NOMBRE_SITU.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_SITU" id="sv_NOMBRE_SITU"<%= IIf(Alumnos_Retirados_summary.ClearExtFilter = "Alumnos_Retirados_NOMBRE_SITU", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.NOMBRE_SITU.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_Retirados.NOMBRE_SITU.CustomFilters.Count + Alumnos_Retirados.NOMBRE_SITU.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_Retirados.NOMBRE_SITU.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_SITU")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.NOMBRE_SITU.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_Retirados.NOMBRE_SITU.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_Retirados.NOMBRE_SITU.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
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
<% If (Alumnos_Retirados.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Alumnos_Retirados_summary.ShowFilterList() %>
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
If (Alumnos_Retirados.ExportAll AndAlso ew_NotEmpty(Alumnos_Retirados.Export)) Then
	Alumnos_Retirados_summary.StopGrp = Alumnos_Retirados_summary.TotalGrps
Else
	Alumnos_Retirados_summary.StopGrp = Alumnos_Retirados_summary.StartGrp + Alumnos_Retirados_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Alumnos_Retirados_summary.StopGrp > Alumnos_Retirados_summary.TotalGrps) Then
	Alumnos_Retirados_summary.StopGrp = Alumnos_Retirados_summary.TotalGrps
End If
Alumnos_Retirados_summary.RecCount = 0

' Get first row
If (Alumnos_Retirados_summary.TotalGrps > 0) Then
	Alumnos_Retirados_summary.GetRow() ' ASPXRPT
	Alumnos_Retirados_summary.GrpCount = 1
End If
While ((Alumnos_Retirados_summary.HasRow AndAlso Alumnos_Retirados_summary.GrpIndex < Alumnos_Retirados_summary.StopGrp) OrElse Alumnos_Retirados_summary.ShowFirstHeader)

	' Show header
	If (Alumnos_Retirados_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.NOMBRE) %>',0);"><%= Alumnos_Retirados.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.PATERNO) %>',0);"><%= Alumnos_Retirados.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.MATERNO) %>',0);"><%= Alumnos_Retirados.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.RUT) %>',0);"><%= Alumnos_Retirados.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.CODCLI.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.CODCLI))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.CODCLI.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.CODCLI) %>',0);"><%= Alumnos_Retirados.CODCLI.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.CODCLI.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.CODCLI.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.CODCARPR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.CODCARPR))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.CODCARPR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.CODCARPR) %>',0);"><%= Alumnos_Retirados.CODCARPR.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.CODCARPR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.CODCARPR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.NOMBRE_C) %>',0);"><%= Alumnos_Retirados.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.ANO) %>',0);"><%= Alumnos_Retirados.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.PERIODO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.PERIODO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.PERIODO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.PERIODO) %>',0);"><%= Alumnos_Retirados.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.PERIODO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.PERIODO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.TIPOSITU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.TIPOSITU))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.TIPOSITU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.TIPOSITU) %>',0);"><%= Alumnos_Retirados.TIPOSITU.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.TIPOSITU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.TIPOSITU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.OBSERVACION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.OBSERVACION))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.OBSERVACION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.OBSERVACION) %>',0);"><%= Alumnos_Retirados.OBSERVACION.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.OBSERVACION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.OBSERVACION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.CODSITU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.CODSITU))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.CODSITU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.CODSITU) %>',0);"><%= Alumnos_Retirados.CODSITU.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.CODSITU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.CODSITU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_Retirados.Export)) Then %>
<%= Alumnos_Retirados.NOMBRE_SITU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_Retirados.SortUrl(Alumnos_Retirados.NOMBRE_SITU))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_Retirados.NOMBRE_SITU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Retirados.SortUrl(Alumnos_Retirados.NOMBRE_SITU) %>',0);"><%= Alumnos_Retirados.NOMBRE_SITU.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_Retirados.NOMBRE_SITU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_Retirados.NOMBRE_SITU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Alumnos_Retirados_summary.ShowFirstHeader = False
	End If
	Alumnos_Retirados_summary.RecCount += 1

		' Render detail row
		Alumnos_Retirados.ResetCSS()
		Alumnos_Retirados.RowType = EWRPT_ROWTYPE_DETAIL
		Alumnos_Retirados_summary.RenderRow()
%>
	<tr<%= Alumnos_Retirados.RowAttributes() %>>
		<td<%= Alumnos_Retirados.NOMBRE.CellAttributes %>>
<div<%= Alumnos_Retirados.NOMBRE.ViewAttributes%>><%= Alumnos_Retirados.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.PATERNO.CellAttributes %>>
<div<%= Alumnos_Retirados.PATERNO.ViewAttributes%>><%= Alumnos_Retirados.PATERNO.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.MATERNO.CellAttributes %>>
<div<%= Alumnos_Retirados.MATERNO.ViewAttributes%>><%= Alumnos_Retirados.MATERNO.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.RUT.CellAttributes %>>
<div<%= Alumnos_Retirados.RUT.ViewAttributes%>><%= Alumnos_Retirados.RUT.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.CODCLI.CellAttributes %>>
<div<%= Alumnos_Retirados.CODCLI.ViewAttributes%>><%= Alumnos_Retirados.CODCLI.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.CODCARPR.CellAttributes %>>
<div<%= Alumnos_Retirados.CODCARPR.ViewAttributes%>><%= Alumnos_Retirados.CODCARPR.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.NOMBRE_C.CellAttributes %>>
<div<%= Alumnos_Retirados.NOMBRE_C.ViewAttributes%>><%= Alumnos_Retirados.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.ANO.CellAttributes %>>
<div<%= Alumnos_Retirados.ANO.ViewAttributes%>><%= Alumnos_Retirados.ANO.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.PERIODO.CellAttributes %>>
<div<%= Alumnos_Retirados.PERIODO.ViewAttributes%>><%= Alumnos_Retirados.PERIODO.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.TIPOSITU.CellAttributes %>>
<div<%= Alumnos_Retirados.TIPOSITU.ViewAttributes%>><%= Alumnos_Retirados.TIPOSITU.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.OBSERVACION.CellAttributes %>>
<div<%= Alumnos_Retirados.OBSERVACION.ViewAttributes%>><%= Alumnos_Retirados.OBSERVACION.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.CODSITU.CellAttributes %>>
<div<%= Alumnos_Retirados.CODSITU.ViewAttributes%>><%= Alumnos_Retirados.CODSITU.ListViewValue%></div>
</td>
		<td<%= Alumnos_Retirados.NOMBRE_SITU.CellAttributes %>>
<div<%= Alumnos_Retirados.NOMBRE_SITU.ViewAttributes%>><%= Alumnos_Retirados.NOMBRE_SITU.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Alumnos_Retirados_summary.AccumulateSummary()

		' Get next record
		Alumnos_Retirados_summary.GetRow() ' ASPXRPT
		Alumnos_Retirados_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Alumnos_Retirados_summary.TotalGrps > 0) Then
	Alumnos_Retirados.ResetCSS()
	Alumnos_Retirados.RowType = EWRPT_ROWTYPE_TOTAL
	Alumnos_Retirados.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Alumnos_Retirados.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Alumnos_Retirados.RowAttrs("class") = "ewRptGrandSummary"
	Alumnos_Retirados_summary.RenderRow()
%>
	<!-- tr><td colspan="13"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Alumnos_Retirados.RowAttributes() %>><td colspan="13"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Alumnos_Retirados_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Alumnos_Retirados.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Alumnos_Retirados_summary.Pager Is Nothing Then Alumnos_Retirados_summary.Pager = New cPrevNextPager(Alumnos_Retirados_summary.StartGrp, Alumnos_Retirados_summary.DisplayGrps, Alumnos_Retirados_summary.TotalGrps) %>
<% If Alumnos_Retirados_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Alumnos_Retirados_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Alumnos_Retiradossmry.aspx?start=<%= Alumnos_Retirados_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Alumnos_Retirados_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Alumnos_Retiradossmry.aspx?start=<%= Alumnos_Retirados_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Alumnos_Retirados_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Alumnos_Retirados_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Alumnos_Retiradossmry.aspx?start=<%= Alumnos_Retirados_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Alumnos_Retirados_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Alumnos_Retiradossmry.aspx?start=<%= Alumnos_Retirados_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Alumnos_Retirados_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Alumnos_Retirados_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Alumnos_Retirados_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Alumnos_Retirados_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Alumnos_Retirados_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Alumnos_Retirados_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Alumnos_Retirados_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Alumnos_Retirados_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Alumnos_Retirados_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Alumnos_Retirados.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Alumnos_Retirados.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Alumnos_Retirados.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Alumnos_Retirados_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Alumnos_Retirados.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
