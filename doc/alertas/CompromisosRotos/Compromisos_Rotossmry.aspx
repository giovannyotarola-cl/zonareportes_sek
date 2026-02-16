<%@ Page ClassName="Compromisos_Rotossmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_compromisosPago" %>
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
	Public Compromisos_Rotos As crCompromisos_Rotos = Nothing

	'
	' Table class (for Compromisos Rotos)
	'
	Public Class crCompromisos_Rotos
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
				Return "Compromisos_Rotos"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Compromisos Rotos"
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

		Public CODCLI As crField

		Public MONTO2 As crField

		Public SALDO2 As crField

		Public FECVEN As crField

		Public FECDEUDA As crField

		Public descripcion As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRE As crField

		Public FECHA_PRESUNTA_PAGO As crField

		Public Export As String = ""	' Export

		Public ExportAll As Boolean = False

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

			' CODCLI
			CODCLI = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCLI.Page = APage
			CODCLI.ParentPage = APage.ParentPage
			Fields.Add("CODCLI", CODCLI)
			CODCLI.DateFilter = ""
			CODCLI.SqlSelect = ""
			CODCLI.SqlOrderBy = ""

			' MONTO2
			MONTO2 = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_MONTO2", "MONTO2", "[MONTO2]", 131, EWRPT_DATATYPE_NUMBER, -1)
			MONTO2.Page = APage
			MONTO2.ParentPage = APage.ParentPage
			MONTO2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("MONTO2", MONTO2)
			MONTO2.DateFilter = ""
			MONTO2.SqlSelect = ""
			MONTO2.SqlOrderBy = ""

			' SALDO2
			SALDO2 = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_SALDO2", "SALDO2", "[SALDO2]", 131, EWRPT_DATATYPE_NUMBER, -1)
			SALDO2.Page = APage
			SALDO2.ParentPage = APage.ParentPage
			SALDO2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("SALDO2", SALDO2)
			SALDO2.DateFilter = ""
			SALDO2.SqlSelect = ""
			SALDO2.SqlOrderBy = ""

			' FECVEN
			FECVEN = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_FECVEN", "FECVEN", "[FECVEN]", 135, EWRPT_DATATYPE_DATE, 7)
			FECVEN.Page = APage
			FECVEN.ParentPage = APage.ParentPage
			FECVEN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECVEN", FECVEN)
			FECVEN.DateFilter = ""
			FECVEN.SqlSelect = "SELECT DISTINCT [FECVEN] FROM " + SqlFrom
			FECVEN.SqlOrderBy = "[FECVEN]"

			' FECDEUDA
			FECDEUDA = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_FECDEUDA", "FECDEUDA", "[FECDEUDA]", 135, EWRPT_DATATYPE_DATE, 7)
			FECDEUDA.Page = APage
			FECDEUDA.ParentPage = APage.ParentPage
			FECDEUDA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECDEUDA", FECDEUDA)
			FECDEUDA.DateFilter = ""
			FECDEUDA.SqlSelect = "SELECT DISTINCT [FECDEUDA] FROM " + SqlFrom
			FECDEUDA.SqlOrderBy = "[FECDEUDA]"

			' descripcion
			descripcion = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_descripcion", "descripcion", "[descripcion]", 200, EWRPT_DATATYPE_STRING, -1)
			descripcion.Page = APage
			descripcion.ParentPage = APage.ParentPage
			Fields.Add("descripcion", descripcion)
			descripcion.DateFilter = ""
			descripcion.SqlSelect = ""
			descripcion.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' FECHA_PRESUNTA_PAGO
			FECHA_PRESUNTA_PAGO = new crField("Compromisos_Rotos", "Compromisos Rotos", "x_FECHA_PRESUNTA_PAGO", "FECHA_PRESUNTA_PAGO", "[FECHA_PRESUNTA_PAGO]", 135, EWRPT_DATATYPE_DATE, 7)
			FECHA_PRESUNTA_PAGO.Page = APage
			FECHA_PRESUNTA_PAGO.ParentPage = APage.ParentPage
			FECHA_PRESUNTA_PAGO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECHA_PRESUNTA_PAGO", FECHA_PRESUNTA_PAGO)
			FECHA_PRESUNTA_PAGO.DateFilter = ""
			FECHA_PRESUNTA_PAGO.SqlSelect = ""
			FECHA_PRESUNTA_PAGO.SqlOrderBy = ""
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
				Return "[SEK_compromisos_rotos]"
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
	Public Compromisos_Rotos_summary As crCompromisos_Rotos_summary

	'
	' Page class
	'
	Public Class crCompromisos_Rotos_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Compromisos_Rotos.UseTokenInUrl) Then
				sUrl &= "t=" & Compromisos_Rotos.TableVar & "&" ' Add page token
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
			If (Compromisos_Rotos.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Compromisos_Rotos.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Compromisos_Rotos.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Compromisos_Rotossmry 
			Get
				Return CType(m_ParentPage, Compromisos_Rotossmry)
			End Get
		End Property

		' Table object (Compromisos_Rotos)
		Public Property Compromisos_Rotos As crCompromisos_Rotos 
			Get		
				Return AspNetPage.Compromisos_Rotos ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crCompromisos_Rotos)
				AspNetPage.Compromisos_Rotos = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_compromisosPago)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Compromisos_Rotos_summary"
			m_PageObjTypeName = "crCompromisos_Rotos_summary"

			' Table name
			m_TableName = "Compromisos Rotos"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Compromisos_Rotos)
			Compromisos_Rotos = New crCompromisos_Rotos(Me)			

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
				Compromisos_Rotos.Export = ew_Get("export")
			End If
			gsExport = Compromisos_Rotos.Export ' Get export parameter, used in header
			gsExportFile = Compromisos_Rotos.TableVar ' Get export file, used in header
			If (Compromisos_Rotos.Export = "excel") Then
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

		Public Val As Object() = New Object(10) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(10) {}

		Public GrandMn As Object() = New Object(10) {}

		Public GrandMx As Object() = New Object(10) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 11 ' No. of fields
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
			Compromisos_Rotos.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Compromisos_Rotos.SqlSelect, Compromisos_Rotos.SqlWhere, Compromisos_Rotos.SqlGroupBy, Compromisos_Rotos.SqlHaving, Compromisos_Rotos.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Compromisos_Rotos.ExportAll AndAlso ew_NotEmpty(Compromisos_Rotos.Export)) Then
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
				Compromisos_Rotos.CODCLI.DbValue = Row("CODCLI")
				Compromisos_Rotos.MONTO2.DbValue = Row("MONTO2")
				Compromisos_Rotos.SALDO2.DbValue = Row("SALDO2")
				Compromisos_Rotos.FECVEN.DbValue = Row("FECVEN")
				Compromisos_Rotos.FECDEUDA.DbValue = Row("FECDEUDA")
				Compromisos_Rotos.descripcion.DbValue = Row("descripcion")
				Compromisos_Rotos.PATERNO.DbValue = Row("PATERNO")
				Compromisos_Rotos.MATERNO.DbValue = Row("MATERNO")
				Compromisos_Rotos.NOMBRE.DbValue = Row("NOMBRE")
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.DbValue = Row("FECHA_PRESUNTA_PAGO")
				Val(1) = Compromisos_Rotos.CODCLI.CurrentValue
				Val(2) = Compromisos_Rotos.MONTO2.CurrentValue
				Val(3) = Compromisos_Rotos.SALDO2.CurrentValue
				Val(4) = Compromisos_Rotos.FECVEN.CurrentValue
				Val(5) = Compromisos_Rotos.FECDEUDA.CurrentValue
				Val(6) = Compromisos_Rotos.descripcion.CurrentValue
				Val(7) = Compromisos_Rotos.PATERNO.CurrentValue
				Val(8) = Compromisos_Rotos.MATERNO.CurrentValue
				Val(9) = Compromisos_Rotos.NOMBRE.CurrentValue
				Val(10) = Compromisos_Rotos.FECHA_PRESUNTA_PAGO.CurrentValue
			Else
				Compromisos_Rotos.CODCLI.DbValue = ""
				Compromisos_Rotos.MONTO2.DbValue = ""
				Compromisos_Rotos.SALDO2.DbValue = ""
				Compromisos_Rotos.FECVEN.DbValue = ""
				Compromisos_Rotos.FECDEUDA.DbValue = ""
				Compromisos_Rotos.descripcion.DbValue = ""
				Compromisos_Rotos.PATERNO.DbValue = ""
				Compromisos_Rotos.MATERNO.DbValue = ""
				Compromisos_Rotos.NOMBRE.DbValue = ""
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Compromisos_Rotos.CODCLI.DbValue = dr("CODCLI")
				Compromisos_Rotos.MONTO2.DbValue = dr("MONTO2")
				Compromisos_Rotos.SALDO2.DbValue = dr("SALDO2")
				Compromisos_Rotos.FECVEN.DbValue = dr("FECVEN")
				Compromisos_Rotos.FECDEUDA.DbValue = dr("FECDEUDA")
				Compromisos_Rotos.descripcion.DbValue = dr("descripcion")
				Compromisos_Rotos.PATERNO.DbValue = dr("PATERNO")
				Compromisos_Rotos.MATERNO.DbValue = dr("MATERNO")
				Compromisos_Rotos.NOMBRE.DbValue = dr("NOMBRE")
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.DbValue = dr("FECHA_PRESUNTA_PAGO")
				Val(1) = Compromisos_Rotos.CODCLI.CurrentValue
				Val(2) = Compromisos_Rotos.MONTO2.CurrentValue
				Val(3) = Compromisos_Rotos.SALDO2.CurrentValue
				Val(4) = Compromisos_Rotos.FECVEN.CurrentValue
				Val(5) = Compromisos_Rotos.FECDEUDA.CurrentValue
				Val(6) = Compromisos_Rotos.descripcion.CurrentValue
				Val(7) = Compromisos_Rotos.PATERNO.CurrentValue
				Val(8) = Compromisos_Rotos.MATERNO.CurrentValue
				Val(9) = Compromisos_Rotos.NOMBRE.CurrentValue
				Val(10) = Compromisos_Rotos.FECHA_PRESUNTA_PAGO.CurrentValue
			Else				
				Compromisos_Rotos.CODCLI.DbValue = ""
				Compromisos_Rotos.MONTO2.DbValue = ""
				Compromisos_Rotos.SALDO2.DbValue = ""
				Compromisos_Rotos.FECVEN.DbValue = ""
				Compromisos_Rotos.FECDEUDA.DbValue = ""
				Compromisos_Rotos.descripcion.DbValue = ""
				Compromisos_Rotos.PATERNO.DbValue = ""
				Compromisos_Rotos.MATERNO.DbValue = ""
				Compromisos_Rotos.NOMBRE.DbValue = ""
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.DbValue = ""
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
				Compromisos_Rotos.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Compromisos_Rotos.StartGroup = StartGrp
				Else
					StartGrp = Compromisos_Rotos.StartGroup
				End If
			Else
				StartGrp = Compromisos_Rotos.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Compromisos_Rotos.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Compromisos_Rotos.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Compromisos_Rotos.StartGroup = StartGrp
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
			' Build distinct values for FECVEN

			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Compromisos_Rotos.FECVEN.SqlSelect, Compromisos_Rotos.SqlWhere, Compromisos_Rotos.SqlGroupBy, Compromisos_Rotos.SqlHaving, Compromisos_Rotos.FECVEN.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Compromisos_Rotos.FECVEN.DbValue = rswrk(0)
					If (Convert.IsDBNull(Compromisos_Rotos.FECVEN.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Compromisos_Rotos.FECVEN.CurrentValue)) Then
						bEmptyValue = True
					Else
						Compromisos_Rotos.FECVEN.ViewValue = Convert.ToString(ew_FormatDateTime(Compromisos_Rotos.FECVEN.CurrentValue, 7))
						ewrpt_SetupDistinctValues(Compromisos_Rotos.FECVEN.ValueList, Compromisos_Rotos.FECVEN.CurrentValue, Compromisos_Rotos.FECVEN.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Compromisos_Rotos.FECVEN.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Compromisos_Rotos.FECVEN.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for FECDEUDA
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Compromisos_Rotos.FECDEUDA.SqlSelect, Compromisos_Rotos.SqlWhere, Compromisos_Rotos.SqlGroupBy, Compromisos_Rotos.SqlHaving, Compromisos_Rotos.FECDEUDA.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Compromisos_Rotos.FECDEUDA.DbValue = rswrk(0)
					If (Convert.IsDBNull(Compromisos_Rotos.FECDEUDA.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Compromisos_Rotos.FECDEUDA.CurrentValue)) Then
						bEmptyValue = True
					Else
						Compromisos_Rotos.FECDEUDA.ViewValue = Convert.ToString(ew_FormatDateTime(Compromisos_Rotos.FECDEUDA.CurrentValue, 7))
						ewrpt_SetupDistinctValues(Compromisos_Rotos.FECDEUDA.ValueList, Compromisos_Rotos.FECDEUDA.CurrentValue, Compromisos_Rotos.FECDEUDA.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Compromisos_Rotos.FECDEUDA.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Compromisos_Rotos.FECDEUDA.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

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
					ClearSessionSelection("FECVEN")
					ClearSessionSelection("FECDEUDA")
					ResetPager()
				End If
			End If

			' Load selection criteria to array
			' Get Fecha de vencimiento selected values

			If (ewrpt_IsArray(ew_Session("sel_Compromisos_Rotos_FECVEN"))) Then
				LoadSelectionFromSession("FECVEN")
			ElseIf (ew_SameStr(ew_Session("sel_Compromisos_Rotos_FECVEN"), EWRPT_INIT_VALUE)) Then ' Select all
				Compromisos_Rotos.FECVEN.SelectionList = Nothing
			End If

			' Get Fecha deuda selected values
			If (ewrpt_IsArray(ew_Session("sel_Compromisos_Rotos_FECDEUDA"))) Then
				LoadSelectionFromSession("FECDEUDA")
			ElseIf (ew_SameStr(ew_Session("sel_Compromisos_Rotos_FECDEUDA"), EWRPT_INIT_VALUE)) Then ' Select all
				Compromisos_Rotos.FECDEUDA.SelectionList = Nothing
			End If
		End Sub

		' Reset pager to starting position
		Public Sub ResetPager()
			StartGrp = 1
			Compromisos_Rotos.StartGroup = StartGrp
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
				Compromisos_Rotos.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Compromisos_Rotos.StartGroup = StartGrp
			Else				
				If (Compromisos_Rotos.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Compromisos_Rotos.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Compromisos_Rotos.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Compromisos_Rotos.SqlSelectCount, Compromisos_Rotos.SqlWhere, Compromisos_Rotos.SqlGroupBy, Compromisos_Rotos.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Compromisos_Rotos.Row_Rendering()

			'
			' Render view codes
			'

			If (Compromisos_Rotos.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' CODCLI
				Compromisos_Rotos.CODCLI.ViewValue = Convert.ToString(Compromisos_Rotos.CODCLI.Summary)

				' MONTO2
				Compromisos_Rotos.MONTO2.ViewValue = Convert.ToString(Compromisos_Rotos.MONTO2.Summary)

				' SALDO2
				Compromisos_Rotos.SALDO2.ViewValue = Convert.ToString(Compromisos_Rotos.SALDO2.Summary)

				' FECVEN
				Compromisos_Rotos.FECVEN.ViewValue = Convert.ToString(Compromisos_Rotos.FECVEN.Summary)
				Compromisos_Rotos.FECVEN.ViewValue = ew_FormatDateTime(Compromisos_Rotos.FECVEN.ViewValue, 7)

				' FECDEUDA
				Compromisos_Rotos.FECDEUDA.ViewValue = Convert.ToString(Compromisos_Rotos.FECDEUDA.Summary)
				Compromisos_Rotos.FECDEUDA.ViewValue = ew_FormatDateTime(Compromisos_Rotos.FECDEUDA.ViewValue, 7)

				' descripcion
				Compromisos_Rotos.descripcion.ViewValue = Convert.ToString(Compromisos_Rotos.descripcion.Summary)

				' PATERNO
				Compromisos_Rotos.PATERNO.ViewValue = Convert.ToString(Compromisos_Rotos.PATERNO.Summary)

				' MATERNO
				Compromisos_Rotos.MATERNO.ViewValue = Convert.ToString(Compromisos_Rotos.MATERNO.Summary)

				' NOMBRE
				Compromisos_Rotos.NOMBRE.ViewValue = Convert.ToString(Compromisos_Rotos.NOMBRE.Summary)

				' FECHA_PRESUNTA_PAGO
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.ViewValue = Convert.ToString(Compromisos_Rotos.FECHA_PRESUNTA_PAGO.Summary)
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.ViewValue = ew_FormatDateTime(Compromisos_Rotos.FECHA_PRESUNTA_PAGO.ViewValue, 7)
			Else

				' CODCLI
				Compromisos_Rotos.CODCLI.ViewValue = Convert.ToString(Compromisos_Rotos.CODCLI.CurrentValue)
				Compromisos_Rotos.CODCLI.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MONTO2
				Compromisos_Rotos.MONTO2.ViewValue = Convert.ToString(Compromisos_Rotos.MONTO2.CurrentValue)
				Compromisos_Rotos.MONTO2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SALDO2
				Compromisos_Rotos.SALDO2.ViewValue = Convert.ToString(Compromisos_Rotos.SALDO2.CurrentValue)
				Compromisos_Rotos.SALDO2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECVEN
				Compromisos_Rotos.FECVEN.ViewValue = Convert.ToString(Compromisos_Rotos.FECVEN.CurrentValue)
				Compromisos_Rotos.FECVEN.ViewValue = ew_FormatDateTime(Compromisos_Rotos.FECVEN.ViewValue, 7)
				Compromisos_Rotos.FECVEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECDEUDA
				Compromisos_Rotos.FECDEUDA.ViewValue = Convert.ToString(Compromisos_Rotos.FECDEUDA.CurrentValue)
				Compromisos_Rotos.FECDEUDA.ViewValue = ew_FormatDateTime(Compromisos_Rotos.FECDEUDA.ViewValue, 7)
				Compromisos_Rotos.FECDEUDA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' descripcion
				Compromisos_Rotos.descripcion.ViewValue = Convert.ToString(Compromisos_Rotos.descripcion.CurrentValue)
				Compromisos_Rotos.descripcion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Compromisos_Rotos.PATERNO.ViewValue = Convert.ToString(Compromisos_Rotos.PATERNO.CurrentValue)
				Compromisos_Rotos.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Compromisos_Rotos.MATERNO.ViewValue = Convert.ToString(Compromisos_Rotos.MATERNO.CurrentValue)
				Compromisos_Rotos.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Compromisos_Rotos.NOMBRE.ViewValue = Convert.ToString(Compromisos_Rotos.NOMBRE.CurrentValue)
				Compromisos_Rotos.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECHA_PRESUNTA_PAGO
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.ViewValue = Convert.ToString(Compromisos_Rotos.FECHA_PRESUNTA_PAGO.CurrentValue)
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.ViewValue = ew_FormatDateTime(Compromisos_Rotos.FECHA_PRESUNTA_PAGO.ViewValue, 7)
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' CODCLI
			Compromisos_Rotos.CODCLI.HrefValue = ""

			' MONTO2
			Compromisos_Rotos.MONTO2.HrefValue = ""

			' SALDO2
			Compromisos_Rotos.SALDO2.HrefValue = ""

			' FECVEN
			Compromisos_Rotos.FECVEN.HrefValue = ""

			' FECDEUDA
			Compromisos_Rotos.FECDEUDA.HrefValue = ""

			' descripcion
			Compromisos_Rotos.descripcion.HrefValue = ""

			' PATERNO
			Compromisos_Rotos.PATERNO.HrefValue = ""

			' MATERNO
			Compromisos_Rotos.MATERNO.HrefValue = ""

			' NOMBRE
			Compromisos_Rotos.NOMBRE.HrefValue = ""

			' FECHA_PRESUNTA_PAGO
			Compromisos_Rotos.FECHA_PRESUNTA_PAGO.HrefValue = ""

			' Call Row_Rendered event
			Compromisos_Rotos.Row_Rendered()
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

				' Field CODCLI
				SetSessionFilterValues(Compromisos_Rotos.CODCLI)

				' Field PATERNO
				SetSessionFilterValues(Compromisos_Rotos.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Compromisos_Rotos.MATERNO)

				' Field NOMBRE
				SetSessionFilterValues(Compromisos_Rotos.NOMBRE)
			bSetupFilter = True ' Set up filter required
		Else

				' Field CODCLI
				If (GetFilterValues(Compromisos_Rotos.CODCLI)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Compromisos_Rotos.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Compromisos_Rotos.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(Compromisos_Rotos.NOMBRE)) Then
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

			' Field CODCLI
			GetSessionFilterValues(Compromisos_Rotos.CODCLI)

			' Field PATERNO
			GetSessionFilterValues(Compromisos_Rotos.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Compromisos_Rotos.MATERNO)

			' Field NOMBRE
			GetSessionFilterValues(Compromisos_Rotos.NOMBRE)
		End If

		' Call page filter validated event
		Compromisos_Rotos.Page_FilterValidated()

		' Build SQL
		' Field CODCLI

		BuildExtendedFilter(Compromisos_Rotos.CODCLI, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Compromisos_Rotos.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Compromisos_Rotos.MATERNO, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(Compromisos_Rotos.NOMBRE, sFilter)

		' Save parms to Session
		' Field CODCLI

		SetSessionFilterValues(Compromisos_Rotos.CODCLI)

		' Field PATERNO
		SetSessionFilterValues(Compromisos_Rotos.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Compromisos_Rotos.MATERNO)

		' Field NOMBRE
		SetSessionFilterValues(Compromisos_Rotos.NOMBRE)

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
		If ew_Session("sv_Compromisos_Rotos_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Compromisos_Rotos_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Compromisos_Rotos_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Compromisos_Rotos_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Compromisos_Rotos_" + parm)
		End If
		If ew_Session("so1_Compromisos_Rotos_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Compromisos_Rotos_" + parm))
		End If
		If ew_Session("sc_Compromisos_Rotos_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Compromisos_Rotos_" + parm))
		End If
		If ew_Session("sv2_Compromisos_Rotos_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Compromisos_Rotos_" + parm)
		End If
		If ew_Session("so2_Compromisos_Rotos_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Compromisos_Rotos_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Compromisos_Rotos_" + parm) = fld.SearchValue
		ew_Session("so1_Compromisos_Rotos_" + parm) = fld.SearchOperator
		ew_Session("sc_Compromisos_Rotos_" + parm) = fld.SearchCondition
		ew_Session("sv2_Compromisos_Rotos_" + parm) = fld.SearchValue2
		ew_Session("so2_Compromisos_Rotos_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Compromisos_Rotos_" + parm) = ""
		ew_Session("so1_Compromisos_Rotos_" + parm) = "="
		ew_Session("sc_Compromisos_Rotos_" + parm) = "AND"
		ew_Session("sv2_Compromisos_Rotos_" + parm) = ""
		ew_Session("so2_Compromisos_Rotos_" + parm) = "="
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
		ew_Session("sel_Compromisos_Rotos_" & parm) = ""
		ew_Session("rf_Compromisos_Rotos_" & parm) = ""
		ew_Session("rt_Compromisos_Rotos_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Compromisos_Rotos.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Compromisos_Rotos_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Compromisos_Rotos_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Compromisos_Rotos_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
		' Set up default values for extended filters
			' Field CODCLI

			SetDefaultExtFilter(Compromisos_Rotos.CODCLI, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Compromisos_Rotos.CODCLI)	

			' Field PATERNO
			SetDefaultExtFilter(Compromisos_Rotos.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Compromisos_Rotos.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Compromisos_Rotos.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Compromisos_Rotos.MATERNO)	

			' Field NOMBRE
			SetDefaultExtFilter(Compromisos_Rotos.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Compromisos_Rotos.NOMBRE)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead
			' Field FECVEN

			Compromisos_Rotos.FECVEN.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Compromisos_Rotos.FECVEN.DefaultSelectionList.Add("value1")
			' Compromisos_Rotos.FECVEN.DefaultSelectionList.Add("value2")

			Compromisos_Rotos.FECVEN.SelectionList = New String(Compromisos_Rotos.FECVEN.DefaultSelectionList.Count - 1) {}
			Compromisos_Rotos.FECVEN.DefaultSelectionList.ToArray().CopyTo(Compromisos_Rotos.FECVEN.SelectionList, 0)

			' Field FECDEUDA
			Compromisos_Rotos.FECDEUDA.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Compromisos_Rotos.FECDEUDA.DefaultSelectionList.Add("value1")
			' Compromisos_Rotos.FECDEUDA.DefaultSelectionList.Add("value2")

			Compromisos_Rotos.FECDEUDA.SelectionList = New String(Compromisos_Rotos.FECDEUDA.DefaultSelectionList.Count - 1) {}
			Compromisos_Rotos.FECDEUDA.DefaultSelectionList.ToArray().CopyTo(Compromisos_Rotos.FECDEUDA.SelectionList, 0)
	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check CODCLI extended filter
		If (TextFilterApplied(Compromisos_Rotos.CODCLI)) Then bFilterExist = True

		' Check FECVEN popup filter
		If Not ewrpt_MatchedArray(CTYpe(Compromisos_Rotos.FECVEN.DefaultSelectionList.ToArray(GetType(String)), String()), Compromisos_Rotos.FECVEN.SelectionList) Then bFilterExist = True

		' Check FECDEUDA popup filter
		If Not ewrpt_MatchedArray(CTYpe(Compromisos_Rotos.FECDEUDA.DefaultSelectionList.ToArray(GetType(String)), String()), Compromisos_Rotos.FECDEUDA.SelectionList) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Compromisos_Rotos.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Compromisos_Rotos.MATERNO)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(Compromisos_Rotos.NOMBRE)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field CODCLI
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Compromisos_Rotos.CODCLI, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Compromisos_Rotos.CODCLI.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECVEN
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Compromisos_Rotos.FECVEN.SelectionList) AndAlso Compromisos_Rotos.FECVEN.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Compromisos_Rotos.FECVEN.SelectionList, ", ", EWRPT_DATATYPE_DATE)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Compromisos_Rotos.FECVEN.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECDEUDA
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Compromisos_Rotos.FECDEUDA.SelectionList) AndAlso Compromisos_Rotos.FECDEUDA.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Compromisos_Rotos.FECDEUDA.SelectionList, ", ", EWRPT_DATATYPE_DATE)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Compromisos_Rotos.FECDEUDA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Compromisos_Rotos.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Compromisos_Rotos.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Compromisos_Rotos.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Compromisos_Rotos.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Compromisos_Rotos.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Compromisos_Rotos.NOMBRE.FldCaption() & "<br>"
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
			If (ewrpt_IsArray(Compromisos_Rotos.FECVEN.SelectionList) AndAlso Compromisos_Rotos.FECVEN.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Compromisos_Rotos.FECVEN, "[FECVEN]", EWRPT_DATATYPE_DATE)
			End If		
			If (ewrpt_IsArray(Compromisos_Rotos.FECDEUDA.SelectionList) AndAlso Compromisos_Rotos.FECDEUDA.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Compromisos_Rotos.FECDEUDA, "[FECDEUDA]", EWRPT_DATATYPE_DATE)
			End If		
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
				Compromisos_Rotos.OrderBy = ""
				Compromisos_Rotos.StartGroup = 1
				Compromisos_Rotos.CODCLI.Sort = ""
				Compromisos_Rotos.MONTO2.Sort = ""
				Compromisos_Rotos.SALDO2.Sort = ""
				Compromisos_Rotos.FECVEN.Sort = ""
				Compromisos_Rotos.FECDEUDA.Sort = ""
				Compromisos_Rotos.descripcion.Sort = ""
				Compromisos_Rotos.PATERNO.Sort = ""
				Compromisos_Rotos.MATERNO.Sort = ""
				Compromisos_Rotos.NOMBRE.Sort = ""
				Compromisos_Rotos.FECHA_PRESUNTA_PAGO.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Compromisos_Rotos.CurrentOrder = ew_Get("order")
			Compromisos_Rotos.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Compromisos_Rotos.SortSql()
			Compromisos_Rotos.OrderBy = sSortSql
			Compromisos_Rotos.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Compromisos_Rotos.OrderBy)) Then
			Compromisos_Rotos.OrderBy = "[CODCLI] ASC"
			Compromisos_Rotos.CODCLI.Sort = "ASC"
		End If
		Return Compromisos_Rotos.OrderBy
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
		Compromisos_Rotos_summary = New crCompromisos_Rotos_summary(Me)
		Compromisos_Rotos_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Compromisos_Rotos_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Compromisos_Rotos_summary IsNot Nothing) Then Compromisos_Rotos_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Compromisos_Rotos.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Compromisos_Rotos_summary = new ewrpt_Page("Compromisos_Rotos_summary");
// page properties
Compromisos_Rotos_summary.PageID = "summary"; // page ID
Compromisos_Rotos_summary.FormID = "fCompromisos_Rotossummaryfilter"; // form ID
var EWRPT_PAGE_ID = Compromisos_Rotos_summary.PageID;
// extend page with ValidateForm function
Compromisos_Rotos_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Compromisos_Rotos_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Compromisos_Rotos_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Compromisos_Rotos_summary.ValidateRequired = false; // no JavaScript validation
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
<% Compromisos_Rotos_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Compromisos_Rotos.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
ewrpt_CreatePopup("Compromisos_Rotos_FECVEN", [<%= ewrpt_GetJsData(Compromisos_Rotos.FECVEN, Compromisos_Rotos.FECVEN.FldType) %>]);
ewrpt_CreatePopup("Compromisos_Rotos_FECDEUDA", [<%= ewrpt_GetJsData(Compromisos_Rotos.FECDEUDA, Compromisos_Rotos.FECDEUDA.FldType) %>]);
</script>
<div id="Compromisos_Rotos_FECVEN_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Compromisos_Rotos_FECDEUDA_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<% End If %>
<% If (Compromisos_Rotos.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Compromisos_Rotos.TableCaption() %></h1></div>
<% If (Compromisos_Rotos.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Compromisos_Rotos_summary.ExportExcelUrl %>"><img src="images/excel.png" border=0 alt="Exportar a excel" title="Exportar a excel" /></a>
<% If (Compromisos_Rotos_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Compromisos_Rotos_summary.ShowMessage() %>
<% If (Compromisos_Rotos.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Compromisos_Rotos.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Compromisos_Rotos.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Compromisos_Rotos.FilterPanelOption = 2 OrElse (Compromisos_Rotos.FilterPanelOption = 3 AndAlso Compromisos_Rotos_summary.FilterApplied) OrElse Compromisos_Rotos_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Compromisos_Rotossmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fCompromisos_Rotossummaryfilter" id="fCompromisos_Rotossummaryfilter" action="Compromisos_Rotossmry.aspx" class="ewForm" onsubmit="return Compromisos_Rotos_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Compromisos_Rotos.FECDEUDA.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Compromisos_Rotos.CODCLI.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODCLI" id="sv1_CODCLI" size="30" maxlength="30" value="<%= ew_HtmlEncode(Compromisos_Rotos.CODCLI.SearchValue) %>"<%= IIf(Compromisos_Rotos_summary.ClearExtFilter = "Compromisos_Rotos_CODCLI", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Compromisos_Rotos.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Compromisos_Rotos.PATERNO.SearchValue) %>"<%= IIf(Compromisos_Rotos_summary.ClearExtFilter = "Compromisos_Rotos_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Compromisos_Rotos.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Compromisos_Rotos.MATERNO.SearchValue) %>"<%= IIf(Compromisos_Rotos_summary.ClearExtFilter = "Compromisos_Rotos_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Compromisos_Rotos.NOMBRE.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(Compromisos_Rotos.NOMBRE.SearchValue) %>"<%= IIf(Compromisos_Rotos_summary.ClearExtFilter = "Compromisos_Rotos_NOMBRE", " class=""ewInputCleared""", "") %>>
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
<% If (Compromisos_Rotos.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Compromisos_Rotos_summary.ShowFilterList() %>
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
If (Compromisos_Rotos.ExportAll AndAlso ew_NotEmpty(Compromisos_Rotos.Export)) Then
	Compromisos_Rotos_summary.StopGrp = Compromisos_Rotos_summary.TotalGrps
Else
	Compromisos_Rotos_summary.StopGrp = Compromisos_Rotos_summary.StartGrp + Compromisos_Rotos_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Compromisos_Rotos_summary.StopGrp > Compromisos_Rotos_summary.TotalGrps) Then
	Compromisos_Rotos_summary.StopGrp = Compromisos_Rotos_summary.TotalGrps
End If
Compromisos_Rotos_summary.RecCount = 0

' Get first row
If (Compromisos_Rotos_summary.TotalGrps > 0) Then
	Compromisos_Rotos_summary.GetRow() ' ASPXRPT
	Compromisos_Rotos_summary.GrpCount = 1
End If
While ((Compromisos_Rotos_summary.HasRow AndAlso Compromisos_Rotos_summary.GrpIndex < Compromisos_Rotos_summary.StopGrp) OrElse Compromisos_Rotos_summary.ShowFirstHeader)

	' Show header
	If (Compromisos_Rotos_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.CODCLI.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.CODCLI))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.CODCLI.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.CODCLI) %>',0);"><%= Compromisos_Rotos.CODCLI.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.CODCLI.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.CODCLI.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.MONTO2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.MONTO2))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.MONTO2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.MONTO2) %>',0);"><%= Compromisos_Rotos.MONTO2.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.MONTO2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.MONTO2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.SALDO2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.SALDO2))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.SALDO2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.SALDO2) %>',0);"><%= Compromisos_Rotos.SALDO2.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.SALDO2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.SALDO2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.FECVEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.FECVEN))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.FECVEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.FECVEN) %>',0);"><%= Compromisos_Rotos.FECVEN.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.FECVEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.FECVEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Compromisos_Rotos_FECVEN', false, '<%= Compromisos_Rotos.FECVEN.RangeFrom %>', '<%= Compromisos_Rotos.FECVEN.RangeTo %>');return false;" name="x_FECVEN<%= Compromisos_Rotos_summary.Cnt(0)(0) %>" id="x_FECVEN<%= Compromisos_Rotos_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.FECDEUDA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.FECDEUDA))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.FECDEUDA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.FECDEUDA) %>',0);"><%= Compromisos_Rotos.FECDEUDA.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.FECDEUDA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.FECDEUDA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Compromisos_Rotos_FECDEUDA', false, '<%= Compromisos_Rotos.FECDEUDA.RangeFrom %>', '<%= Compromisos_Rotos.FECDEUDA.RangeTo %>');return false;" name="x_FECDEUDA<%= Compromisos_Rotos_summary.Cnt(0)(0) %>" id="x_FECDEUDA<%= Compromisos_Rotos_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.descripcion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.descripcion))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.descripcion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.descripcion) %>',0);"><%= Compromisos_Rotos.descripcion.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.descripcion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.descripcion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.PATERNO) %>',0);"><%= Compromisos_Rotos.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.MATERNO) %>',0);"><%= Compromisos_Rotos.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.NOMBRE) %>',0);"><%= Compromisos_Rotos.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Compromisos_Rotos.Export)) Then %>
<%= Compromisos_Rotos.FECHA_PRESUNTA_PAGO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Compromisos_Rotos.SortUrl(Compromisos_Rotos.FECHA_PRESUNTA_PAGO))) Then %>
		<td style="vertical-align: bottom;"><%= Compromisos_Rotos.FECHA_PRESUNTA_PAGO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Compromisos_Rotos.SortUrl(Compromisos_Rotos.FECHA_PRESUNTA_PAGO) %>',0);"><%= Compromisos_Rotos.FECHA_PRESUNTA_PAGO.FldCaption() %></td><td style="width: 10px;">
		<% If (Compromisos_Rotos.FECHA_PRESUNTA_PAGO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Compromisos_Rotos.FECHA_PRESUNTA_PAGO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Compromisos_Rotos_summary.ShowFirstHeader = False
	End If
	Compromisos_Rotos_summary.RecCount += 1

		' Render detail row
		Compromisos_Rotos.ResetCSS()
		Compromisos_Rotos.RowType = EWRPT_ROWTYPE_DETAIL
		Compromisos_Rotos_summary.RenderRow()
%>
	<tr<%= Compromisos_Rotos.RowAttributes() %>>
		<td<%= Compromisos_Rotos.CODCLI.CellAttributes %>>
<div<%= Compromisos_Rotos.CODCLI.ViewAttributes%>><%= Compromisos_Rotos.CODCLI.ListViewValue%></div>
</td>
		<td<%= Compromisos_Rotos.MONTO2.CellAttributes %>>
<div<%= Compromisos_Rotos.MONTO2.ViewAttributes%>><%= Compromisos_Rotos.MONTO2.ListViewValue%></div>
</td>
		<td<%= Compromisos_Rotos.SALDO2.CellAttributes %>>
<div<%= Compromisos_Rotos.SALDO2.ViewAttributes%>><%= Compromisos_Rotos.SALDO2.ListViewValue%></div>
</td>
		<td<%= Compromisos_Rotos.FECVEN.CellAttributes %>>
<div<%= Compromisos_Rotos.FECVEN.ViewAttributes%>><%= Compromisos_Rotos.FECVEN.ListViewValue%></div>
</td>
		<td<%= Compromisos_Rotos.FECDEUDA.CellAttributes %>>
<div<%= Compromisos_Rotos.FECDEUDA.ViewAttributes%>><%= Compromisos_Rotos.FECDEUDA.ListViewValue%></div>
</td>
		<td<%= Compromisos_Rotos.descripcion.CellAttributes %>>
<div<%= Compromisos_Rotos.descripcion.ViewAttributes%>><%= Compromisos_Rotos.descripcion.ListViewValue%></div>
</td>
		<td<%= Compromisos_Rotos.PATERNO.CellAttributes %>>
<div<%= Compromisos_Rotos.PATERNO.ViewAttributes%>><%= Compromisos_Rotos.PATERNO.ListViewValue%></div>
</td>
		<td<%= Compromisos_Rotos.MATERNO.CellAttributes %>>
<div<%= Compromisos_Rotos.MATERNO.ViewAttributes%>><%= Compromisos_Rotos.MATERNO.ListViewValue%></div>
</td>
		<td<%= Compromisos_Rotos.NOMBRE.CellAttributes %>>
<div<%= Compromisos_Rotos.NOMBRE.ViewAttributes%>><%= Compromisos_Rotos.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Compromisos_Rotos.FECHA_PRESUNTA_PAGO.CellAttributes %>>
<div<%= Compromisos_Rotos.FECHA_PRESUNTA_PAGO.ViewAttributes%>><%= Compromisos_Rotos.FECHA_PRESUNTA_PAGO.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Compromisos_Rotos_summary.AccumulateSummary()

		' Get next record
		Compromisos_Rotos_summary.GetRow() ' ASPXRPT
		Compromisos_Rotos_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Compromisos_Rotos_summary.TotalGrps > 0) Then
	Compromisos_Rotos.ResetCSS()
	Compromisos_Rotos.RowType = EWRPT_ROWTYPE_TOTAL
	Compromisos_Rotos.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Compromisos_Rotos.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Compromisos_Rotos.RowAttrs("class") = "ewRptGrandSummary"
	Compromisos_Rotos_summary.RenderRow()
%>
	<!-- tr><td colspan="10"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Compromisos_Rotos.RowAttributes() %>><td colspan="10"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Compromisos_Rotos_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Compromisos_Rotos.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Compromisos_Rotos_summary.Pager Is Nothing Then Compromisos_Rotos_summary.Pager = New cPrevNextPager(Compromisos_Rotos_summary.StartGrp, Compromisos_Rotos_summary.DisplayGrps, Compromisos_Rotos_summary.TotalGrps) %>
<% If Compromisos_Rotos_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Compromisos_Rotos_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Compromisos_Rotossmry.aspx?start=<%= Compromisos_Rotos_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Compromisos_Rotos_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Compromisos_Rotossmry.aspx?start=<%= Compromisos_Rotos_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Compromisos_Rotos_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Compromisos_Rotos_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Compromisos_Rotossmry.aspx?start=<%= Compromisos_Rotos_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Compromisos_Rotos_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Compromisos_Rotossmry.aspx?start=<%= Compromisos_Rotos_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Compromisos_Rotos_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Compromisos_Rotos_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Compromisos_Rotos_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Compromisos_Rotos_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Compromisos_Rotos_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Compromisos_Rotos_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Compromisos_Rotos_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Compromisos_Rotos_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Compromisos_Rotos_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Compromisos_Rotos.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Compromisos_Rotos.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Compromisos_Rotos.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Compromisos_Rotos_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Compromisos_Rotos.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
