<%@ Page ClassName="Reincorporacionessmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_Reincorporaciones" %>
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
	Public Reincorporaciones As crReincorporaciones = Nothing

	'
	' Table class (for Reincorporaciones)
	'
	Public Class crReincorporaciones
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
				Return "Reincorporaciones"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Reincorporaciones"
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

		Public Rut As crField

		Public NOMBRE As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public Estado As crField

		Public Estado_Final As crField

		Public AF1o As crField

		Public Periodo As crField

		Public Codigo_Carrera As crField

		Public Codigo As crField

		Public DescripciF3n As crField

		Public EmisiF3n As crField

		Public ObservaciF3n As crField

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

			' Rut
			Rut = new crField("Reincorporaciones", "Reincorporaciones", "x_Rut", "Rut", "[Rut]", 200, EWRPT_DATATYPE_STRING, -1)
			Rut.Page = APage
			Rut.ParentPage = APage.ParentPage
			Fields.Add("Rut", Rut)
			Rut.DateFilter = ""
			Rut.SqlSelect = ""
			Rut.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Reincorporaciones", "Reincorporaciones", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Reincorporaciones", "Reincorporaciones", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Reincorporaciones", "Reincorporaciones", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' Estado
			Estado = new crField("Reincorporaciones", "Reincorporaciones", "x_Estado", "Estado", "[Estado]", 200, EWRPT_DATATYPE_STRING, -1)
			Estado.Page = APage
			Estado.ParentPage = APage.ParentPage
			Fields.Add("Estado", Estado)
			Estado.DateFilter = ""
			Estado.SqlSelect = ""
			Estado.SqlOrderBy = ""

			' Estado Final
			Estado_Final = new crField("Reincorporaciones", "Reincorporaciones", "x_Estado_Final", "Estado Final", "[Estado Final]", 200, EWRPT_DATATYPE_STRING, -1)
			Estado_Final.Page = APage
			Estado_Final.ParentPage = APage.ParentPage
			Fields.Add("Estado_Final", Estado_Final)
			Estado_Final.DateFilter = ""
			Estado_Final.SqlSelect = ""
			Estado_Final.SqlOrderBy = ""

			' Año
			AF1o = new crField("Reincorporaciones", "Reincorporaciones", "x_AF1o", "Año", "[Año]", 131, EWRPT_DATATYPE_NUMBER, -1)
			AF1o.Page = APage
			AF1o.ParentPage = APage.ParentPage
			AF1o.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("AF1o", AF1o)
			AF1o.DateFilter = ""
			AF1o.SqlSelect = ""
			AF1o.SqlOrderBy = ""

			' Periodo
			Periodo = new crField("Reincorporaciones", "Reincorporaciones", "x_Periodo", "Periodo", "[Periodo]", 131, EWRPT_DATATYPE_NUMBER, -1)
			Periodo.Page = APage
			Periodo.ParentPage = APage.ParentPage
			Periodo.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Periodo", Periodo)
			Periodo.DateFilter = ""
			Periodo.SqlSelect = ""
			Periodo.SqlOrderBy = ""

			' Codigo Carrera
			Codigo_Carrera = new crField("Reincorporaciones", "Reincorporaciones", "x_Codigo_Carrera", "Codigo Carrera", "[Codigo Carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			Codigo_Carrera.Page = APage
			Codigo_Carrera.ParentPage = APage.ParentPage
			Fields.Add("Codigo_Carrera", Codigo_Carrera)
			Codigo_Carrera.DateFilter = ""
			Codigo_Carrera.SqlSelect = ""
			Codigo_Carrera.SqlOrderBy = ""

			' Codigo
			Codigo = new crField("Reincorporaciones", "Reincorporaciones", "x_Codigo", "Codigo", "[Codigo]", 131, EWRPT_DATATYPE_NUMBER, -1)
			Codigo.Page = APage
			Codigo.ParentPage = APage.ParentPage
			Codigo.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Codigo", Codigo)
			Codigo.DateFilter = ""
			Codigo.SqlSelect = ""
			Codigo.SqlOrderBy = ""

			' Descripción
			DescripciF3n = new crField("Reincorporaciones", "Reincorporaciones", "x_DescripciF3n", "Descripción", "[Descripción]", 200, EWRPT_DATATYPE_STRING, -1)
			DescripciF3n.Page = APage
			DescripciF3n.ParentPage = APage.ParentPage
			Fields.Add("DescripciF3n", DescripciF3n)
			DescripciF3n.DateFilter = ""
			DescripciF3n.SqlSelect = ""
			DescripciF3n.SqlOrderBy = ""

			' Emisión
			EmisiF3n = new crField("Reincorporaciones", "Reincorporaciones", "x_EmisiF3n", "Emisión", "[Emisión]", 135, EWRPT_DATATYPE_DATE, 7)
			EmisiF3n.Page = APage
			EmisiF3n.ParentPage = APage.ParentPage
			EmisiF3n.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("EmisiF3n", EmisiF3n)
			EmisiF3n.DateFilter = ""
			EmisiF3n.SqlSelect = ""
			EmisiF3n.SqlOrderBy = ""

			' Observación
			ObservaciF3n = new crField("Reincorporaciones", "Reincorporaciones", "x_ObservaciF3n", "Observación", "[Observación]", 200, EWRPT_DATATYPE_STRING, -1)
			ObservaciF3n.Page = APage
			ObservaciF3n.ParentPage = APage.ParentPage
			Fields.Add("ObservaciF3n", ObservaciF3n)
			ObservaciF3n.DateFilter = ""
			ObservaciF3n.SqlSelect = ""
			ObservaciF3n.SqlOrderBy = ""
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
				Return "[SEK_Reincorporaciones]"
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
	Public Reincorporaciones_summary As crReincorporaciones_summary

	'
	' Page class
	'
	Public Class crReincorporaciones_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Reincorporaciones.UseTokenInUrl) Then
				sUrl &= "t=" & Reincorporaciones.TableVar & "&" ' Add page token
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
			If (Reincorporaciones.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Reincorporaciones.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Reincorporaciones.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Reincorporacionessmry 
			Get
				Return CType(m_ParentPage, Reincorporacionessmry)
			End Get
		End Property

		' Table object (Reincorporaciones)
		Public Property Reincorporaciones As crReincorporaciones 
			Get		
				Return AspNetPage.Reincorporaciones ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crReincorporaciones)
				AspNetPage.Reincorporaciones = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_Reincorporaciones)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Reincorporaciones_summary"
			m_PageObjTypeName = "crReincorporaciones_summary"

			' Table name
			m_TableName = "Reincorporaciones"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Reincorporaciones)
			Reincorporaciones = New crReincorporaciones(Me)			

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
				Reincorporaciones.Export = ew_Get("export")
			End If
			gsExport = Reincorporaciones.Export ' Get export parameter, used in header
			gsExportFile = Reincorporaciones.TableVar ' Get export file, used in header
			If (Reincorporaciones.Export = "excel") Then
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
			Reincorporaciones.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Reincorporaciones.SqlSelect, Reincorporaciones.SqlWhere, Reincorporaciones.SqlGroupBy, Reincorporaciones.SqlHaving, Reincorporaciones.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Reincorporaciones.ExportAll AndAlso ew_NotEmpty(Reincorporaciones.Export)) Then
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
				Reincorporaciones.Rut.DbValue = Row("Rut")
				Reincorporaciones.NOMBRE.DbValue = Row("NOMBRE")
				Reincorporaciones.PATERNO.DbValue = Row("PATERNO")
				Reincorporaciones.MATERNO.DbValue = Row("MATERNO")
				Reincorporaciones.Estado.DbValue = Row("Estado")
				Reincorporaciones.Estado_Final.DbValue = Row("Estado Final")
				Reincorporaciones.AF1o.DbValue = Row("Año")
				Reincorporaciones.Periodo.DbValue = Row("Periodo")
				Reincorporaciones.Codigo_Carrera.DbValue = Row("Codigo Carrera")
				Reincorporaciones.Codigo.DbValue = Row("Codigo")
				Reincorporaciones.DescripciF3n.DbValue = Row("Descripción")
				Reincorporaciones.EmisiF3n.DbValue = Row("Emisión")
				Reincorporaciones.ObservaciF3n.DbValue = Row("Observación")
				Val(1) = Reincorporaciones.Rut.CurrentValue
				Val(2) = Reincorporaciones.NOMBRE.CurrentValue
				Val(3) = Reincorporaciones.PATERNO.CurrentValue
				Val(4) = Reincorporaciones.MATERNO.CurrentValue
				Val(5) = Reincorporaciones.Estado.CurrentValue
				Val(6) = Reincorporaciones.Estado_Final.CurrentValue
				Val(7) = Reincorporaciones.AF1o.CurrentValue
				Val(8) = Reincorporaciones.Periodo.CurrentValue
				Val(9) = Reincorporaciones.Codigo_Carrera.CurrentValue
				Val(10) = Reincorporaciones.Codigo.CurrentValue
				Val(11) = Reincorporaciones.DescripciF3n.CurrentValue
				Val(12) = Reincorporaciones.EmisiF3n.CurrentValue
				Val(13) = Reincorporaciones.ObservaciF3n.CurrentValue
			Else
				Reincorporaciones.Rut.DbValue = ""
				Reincorporaciones.NOMBRE.DbValue = ""
				Reincorporaciones.PATERNO.DbValue = ""
				Reincorporaciones.MATERNO.DbValue = ""
				Reincorporaciones.Estado.DbValue = ""
				Reincorporaciones.Estado_Final.DbValue = ""
				Reincorporaciones.AF1o.DbValue = ""
				Reincorporaciones.Periodo.DbValue = ""
				Reincorporaciones.Codigo_Carrera.DbValue = ""
				Reincorporaciones.Codigo.DbValue = ""
				Reincorporaciones.DescripciF3n.DbValue = ""
				Reincorporaciones.EmisiF3n.DbValue = ""
				Reincorporaciones.ObservaciF3n.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Reincorporaciones.Rut.DbValue = dr("Rut")
				Reincorporaciones.NOMBRE.DbValue = dr("NOMBRE")
				Reincorporaciones.PATERNO.DbValue = dr("PATERNO")
				Reincorporaciones.MATERNO.DbValue = dr("MATERNO")
				Reincorporaciones.Estado.DbValue = dr("Estado")
				Reincorporaciones.Estado_Final.DbValue = dr("Estado Final")
				Reincorporaciones.AF1o.DbValue = dr("Año")
				Reincorporaciones.Periodo.DbValue = dr("Periodo")
				Reincorporaciones.Codigo_Carrera.DbValue = dr("Codigo Carrera")
				Reincorporaciones.Codigo.DbValue = dr("Codigo")
				Reincorporaciones.DescripciF3n.DbValue = dr("Descripción")
				Reincorporaciones.EmisiF3n.DbValue = dr("Emisión")
				Reincorporaciones.ObservaciF3n.DbValue = dr("Observación")
				Val(1) = Reincorporaciones.Rut.CurrentValue
				Val(2) = Reincorporaciones.NOMBRE.CurrentValue
				Val(3) = Reincorporaciones.PATERNO.CurrentValue
				Val(4) = Reincorporaciones.MATERNO.CurrentValue
				Val(5) = Reincorporaciones.Estado.CurrentValue
				Val(6) = Reincorporaciones.Estado_Final.CurrentValue
				Val(7) = Reincorporaciones.AF1o.CurrentValue
				Val(8) = Reincorporaciones.Periodo.CurrentValue
				Val(9) = Reincorporaciones.Codigo_Carrera.CurrentValue
				Val(10) = Reincorporaciones.Codigo.CurrentValue
				Val(11) = Reincorporaciones.DescripciF3n.CurrentValue
				Val(12) = Reincorporaciones.EmisiF3n.CurrentValue
				Val(13) = Reincorporaciones.ObservaciF3n.CurrentValue
			Else				
				Reincorporaciones.Rut.DbValue = ""
				Reincorporaciones.NOMBRE.DbValue = ""
				Reincorporaciones.PATERNO.DbValue = ""
				Reincorporaciones.MATERNO.DbValue = ""
				Reincorporaciones.Estado.DbValue = ""
				Reincorporaciones.Estado_Final.DbValue = ""
				Reincorporaciones.AF1o.DbValue = ""
				Reincorporaciones.Periodo.DbValue = ""
				Reincorporaciones.Codigo_Carrera.DbValue = ""
				Reincorporaciones.Codigo.DbValue = ""
				Reincorporaciones.DescripciF3n.DbValue = ""
				Reincorporaciones.EmisiF3n.DbValue = ""
				Reincorporaciones.ObservaciF3n.DbValue = ""
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
				Reincorporaciones.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Reincorporaciones.StartGroup = StartGrp
				Else
					StartGrp = Reincorporaciones.StartGroup
				End If
			Else
				StartGrp = Reincorporaciones.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Reincorporaciones.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Reincorporaciones.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Reincorporaciones.StartGroup = StartGrp
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
			Reincorporaciones.StartGroup = StartGrp
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
				Reincorporaciones.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Reincorporaciones.StartGroup = StartGrp
			Else				
				If (Reincorporaciones.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Reincorporaciones.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Reincorporaciones.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Reincorporaciones.SqlSelectCount, Reincorporaciones.SqlWhere, Reincorporaciones.SqlGroupBy, Reincorporaciones.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Reincorporaciones.Row_Rendering()

			'
			' Render view codes
			'

			If (Reincorporaciones.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' Rut
				Reincorporaciones.Rut.ViewValue = Convert.ToString(Reincorporaciones.Rut.Summary)

				' NOMBRE
				Reincorporaciones.NOMBRE.ViewValue = Convert.ToString(Reincorporaciones.NOMBRE.Summary)

				' PATERNO
				Reincorporaciones.PATERNO.ViewValue = Convert.ToString(Reincorporaciones.PATERNO.Summary)

				' MATERNO
				Reincorporaciones.MATERNO.ViewValue = Convert.ToString(Reincorporaciones.MATERNO.Summary)

				' Estado
				Reincorporaciones.Estado.ViewValue = Convert.ToString(Reincorporaciones.Estado.Summary)

				' Estado Final
				Reincorporaciones.Estado_Final.ViewValue = Convert.ToString(Reincorporaciones.Estado_Final.Summary)

				' Año
				Reincorporaciones.AF1o.ViewValue = Convert.ToString(Reincorporaciones.AF1o.Summary)

				' Periodo
				Reincorporaciones.Periodo.ViewValue = Convert.ToString(Reincorporaciones.Periodo.Summary)

				' Codigo Carrera
				Reincorporaciones.Codigo_Carrera.ViewValue = Convert.ToString(Reincorporaciones.Codigo_Carrera.Summary)

				' Codigo
				Reincorporaciones.Codigo.ViewValue = Convert.ToString(Reincorporaciones.Codigo.Summary)

				' Descripción
				Reincorporaciones.DescripciF3n.ViewValue = Convert.ToString(Reincorporaciones.DescripciF3n.Summary)

				' Emisión
				Reincorporaciones.EmisiF3n.ViewValue = Convert.ToString(Reincorporaciones.EmisiF3n.Summary)
				Reincorporaciones.EmisiF3n.ViewValue = ew_FormatDateTime(Reincorporaciones.EmisiF3n.ViewValue, 7)

				' Observación
				Reincorporaciones.ObservaciF3n.ViewValue = Convert.ToString(Reincorporaciones.ObservaciF3n.Summary)
			Else

				' Rut
				Reincorporaciones.Rut.ViewValue = Convert.ToString(Reincorporaciones.Rut.CurrentValue)
				Reincorporaciones.Rut.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Reincorporaciones.NOMBRE.ViewValue = Convert.ToString(Reincorporaciones.NOMBRE.CurrentValue)
				Reincorporaciones.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Reincorporaciones.PATERNO.ViewValue = Convert.ToString(Reincorporaciones.PATERNO.CurrentValue)
				Reincorporaciones.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Reincorporaciones.MATERNO.ViewValue = Convert.ToString(Reincorporaciones.MATERNO.CurrentValue)
				Reincorporaciones.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Estado
				Reincorporaciones.Estado.ViewValue = Convert.ToString(Reincorporaciones.Estado.CurrentValue)
				Reincorporaciones.Estado.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Estado Final
				Reincorporaciones.Estado_Final.ViewValue = Convert.ToString(Reincorporaciones.Estado_Final.CurrentValue)
				Reincorporaciones.Estado_Final.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Año
				Reincorporaciones.AF1o.ViewValue = Convert.ToString(Reincorporaciones.AF1o.CurrentValue)
				Reincorporaciones.AF1o.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Periodo
				Reincorporaciones.Periodo.ViewValue = Convert.ToString(Reincorporaciones.Periodo.CurrentValue)
				Reincorporaciones.Periodo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Codigo Carrera
				Reincorporaciones.Codigo_Carrera.ViewValue = Convert.ToString(Reincorporaciones.Codigo_Carrera.CurrentValue)
				Reincorporaciones.Codigo_Carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Codigo
				Reincorporaciones.Codigo.ViewValue = Convert.ToString(Reincorporaciones.Codigo.CurrentValue)
				Reincorporaciones.Codigo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Descripción
				Reincorporaciones.DescripciF3n.ViewValue = Convert.ToString(Reincorporaciones.DescripciF3n.CurrentValue)
				Reincorporaciones.DescripciF3n.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Emisión
				Reincorporaciones.EmisiF3n.ViewValue = Convert.ToString(Reincorporaciones.EmisiF3n.CurrentValue)
				Reincorporaciones.EmisiF3n.ViewValue = ew_FormatDateTime(Reincorporaciones.EmisiF3n.ViewValue, 7)
				Reincorporaciones.EmisiF3n.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Observación
				Reincorporaciones.ObservaciF3n.ViewValue = Convert.ToString(Reincorporaciones.ObservaciF3n.CurrentValue)
				Reincorporaciones.ObservaciF3n.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' Rut
			Reincorporaciones.Rut.HrefValue = ""

			' NOMBRE
			Reincorporaciones.NOMBRE.HrefValue = ""

			' PATERNO
			Reincorporaciones.PATERNO.HrefValue = ""

			' MATERNO
			Reincorporaciones.MATERNO.HrefValue = ""

			' Estado
			Reincorporaciones.Estado.HrefValue = ""

			' Estado Final
			Reincorporaciones.Estado_Final.HrefValue = ""

			' Año
			Reincorporaciones.AF1o.HrefValue = ""

			' Periodo
			Reincorporaciones.Periodo.HrefValue = ""

			' Codigo Carrera
			Reincorporaciones.Codigo_Carrera.HrefValue = ""

			' Codigo
			Reincorporaciones.Codigo.HrefValue = ""

			' Descripción
			Reincorporaciones.DescripciF3n.HrefValue = ""

			' Emisión
			Reincorporaciones.EmisiF3n.HrefValue = ""

			' Observación
			Reincorporaciones.ObservaciF3n.HrefValue = ""

			' Call Row_Rendered event
			Reincorporaciones.Row_Rendered()
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

			' Field Estado
			sSelect = "SELECT DISTINCT [Estado] FROM " + Reincorporaciones.SqlFrom
			sOrderBy = "[Estado] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reincorporaciones.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reincorporaciones.Estado.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Estado Final
			sSelect = "SELECT DISTINCT [Estado Final] FROM " + Reincorporaciones.SqlFrom
			sOrderBy = "[Estado Final] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reincorporaciones.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reincorporaciones.Estado_Final.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Año
			sSelect = "SELECT DISTINCT [Año] FROM " + Reincorporaciones.SqlFrom
			sOrderBy = "[Año] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reincorporaciones.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reincorporaciones.AF1o.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Periodo
			sSelect = "SELECT DISTINCT [Periodo] FROM " + Reincorporaciones.SqlFrom
			sOrderBy = "[Periodo] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reincorporaciones.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reincorporaciones.Periodo.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field Rut
				SetSessionFilterValues(Reincorporaciones.Rut)

				' Field NOMBRE
				SetSessionFilterValues(Reincorporaciones.NOMBRE)

				' Field PATERNO
				SetSessionFilterValues(Reincorporaciones.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Reincorporaciones.MATERNO)

				' Field Estado
				SetSessionDropDownValue(Reincorporaciones.Estado.DropDownValue, Reincorporaciones.Estado)

				' Field Estado Final
				SetSessionDropDownValue(Reincorporaciones.Estado_Final.DropDownValue, Reincorporaciones.Estado_Final)

				' Field Año
				SetSessionDropDownValue(Reincorporaciones.AF1o.DropDownValue, Reincorporaciones.AF1o)

				' Field Periodo
				SetSessionDropDownValue(Reincorporaciones.Periodo.DropDownValue, Reincorporaciones.Periodo)

				' Field Codigo Carrera
				SetSessionFilterValues(Reincorporaciones.Codigo_Carrera)
			bSetupFilter = True ' Set up filter required
		Else

				' Field Rut
				If (GetFilterValues(Reincorporaciones.Rut)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(Reincorporaciones.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Reincorporaciones.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Reincorporaciones.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Estado
				If (GetDropDownValue(Reincorporaciones.Estado)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reincorporaciones.Estado.DropDownValue) Then
					If Not ew_SameStr(Reincorporaciones.Estado.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reincorporaciones_Estado") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Estado Final
				If (GetDropDownValue(Reincorporaciones.Estado_Final)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reincorporaciones.Estado_Final.DropDownValue) Then
					If Not ew_SameStr(Reincorporaciones.Estado_Final.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reincorporaciones_Estado_Final") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Año
				If (GetDropDownValue(Reincorporaciones.AF1o)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reincorporaciones.AF1o.DropDownValue) Then
					If Not ew_SameStr(Reincorporaciones.AF1o.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reincorporaciones_AF1o") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Periodo
				If (GetDropDownValue(Reincorporaciones.Periodo)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reincorporaciones.Periodo.DropDownValue) Then
					If Not ew_SameStr(Reincorporaciones.Periodo.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reincorporaciones_Periodo") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Codigo Carrera
				If (GetFilterValues(Reincorporaciones.Codigo_Carrera)) Then
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

			' Field Rut
			GetSessionFilterValues(Reincorporaciones.Rut)

			' Field NOMBRE
			GetSessionFilterValues(Reincorporaciones.NOMBRE)

			' Field PATERNO
			GetSessionFilterValues(Reincorporaciones.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Reincorporaciones.MATERNO)

			' Field Estado
			GetSessionDropDownValue(Reincorporaciones.Estado)

			' Field Estado Final
			GetSessionDropDownValue(Reincorporaciones.Estado_Final)

			' Field Año
			GetSessionDropDownValue(Reincorporaciones.AF1o)

			' Field Periodo
			GetSessionDropDownValue(Reincorporaciones.Periodo)

			' Field Codigo Carrera
			GetSessionFilterValues(Reincorporaciones.Codigo_Carrera)
		End If

		' Call page filter validated event
		Reincorporaciones.Page_FilterValidated()

		' Build SQL
		' Field Rut

		BuildExtendedFilter(Reincorporaciones.Rut, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(Reincorporaciones.NOMBRE, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Reincorporaciones.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Reincorporaciones.MATERNO, sFilter)

		' Field Estado
		BuildDropDownFilter(Reincorporaciones.Estado, sFilter, "")

		' Field Estado Final
		BuildDropDownFilter(Reincorporaciones.Estado_Final, sFilter, "")

		' Field Año
		BuildDropDownFilter(Reincorporaciones.AF1o, sFilter, "")

		' Field Periodo
		BuildDropDownFilter(Reincorporaciones.Periodo, sFilter, "")

		' Field Codigo Carrera
		BuildExtendedFilter(Reincorporaciones.Codigo_Carrera, sFilter)

		' Save parms to Session
		' Field Rut

		SetSessionFilterValues(Reincorporaciones.Rut)

		' Field NOMBRE
		SetSessionFilterValues(Reincorporaciones.NOMBRE)

		' Field PATERNO
		SetSessionFilterValues(Reincorporaciones.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Reincorporaciones.MATERNO)

		' Field Estado
		SetSessionDropDownValue(Reincorporaciones.Estado.DropDownValue, Reincorporaciones.Estado)

		' Field Estado Final
		SetSessionDropDownValue(Reincorporaciones.Estado_Final.DropDownValue, Reincorporaciones.Estado_Final)

		' Field Año
		SetSessionDropDownValue(Reincorporaciones.AF1o.DropDownValue, Reincorporaciones.AF1o)

		' Field Periodo
		SetSessionDropDownValue(Reincorporaciones.Periodo.DropDownValue, Reincorporaciones.Periodo)

		' Field Codigo Carrera
		SetSessionFilterValues(Reincorporaciones.Codigo_Carrera)

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
		If ew_Session("sv_Reincorporaciones_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Reincorporaciones_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Reincorporaciones_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Reincorporaciones_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Reincorporaciones_" + parm)
		End If
		If ew_Session("so1_Reincorporaciones_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Reincorporaciones_" + parm))
		End If
		If ew_Session("sc_Reincorporaciones_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Reincorporaciones_" + parm))
		End If
		If ew_Session("sv2_Reincorporaciones_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Reincorporaciones_" + parm)
		End If
		If ew_Session("so2_Reincorporaciones_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Reincorporaciones_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Reincorporaciones_" + parm) = fld.SearchValue
		ew_Session("so1_Reincorporaciones_" + parm) = fld.SearchOperator
		ew_Session("sc_Reincorporaciones_" + parm) = fld.SearchCondition
		ew_Session("sv2_Reincorporaciones_" + parm) = fld.SearchValue2
		ew_Session("so2_Reincorporaciones_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Reincorporaciones_" + parm) = ""
		ew_Session("so1_Reincorporaciones_" + parm) = "="
		ew_Session("sc_Reincorporaciones_" + parm) = "AND"
		ew_Session("sv2_Reincorporaciones_" + parm) = ""
		ew_Session("so2_Reincorporaciones_" + parm) = "="
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
		ew_Session("sel_Reincorporaciones_" & parm) = ""
		ew_Session("rf_Reincorporaciones_" & parm) = ""
		ew_Session("rt_Reincorporaciones_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Reincorporaciones.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Reincorporaciones_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Reincorporaciones_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Reincorporaciones_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field Estado

			Reincorporaciones.Estado.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reincorporaciones.Estado.DropDownValue = Reincorporaciones.Estado.DefaultDropDownValue

			' Field Estado Final
			Reincorporaciones.Estado_Final.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reincorporaciones.Estado_Final.DropDownValue = Reincorporaciones.Estado_Final.DefaultDropDownValue

			' Field Año
			Reincorporaciones.AF1o.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reincorporaciones.AF1o.DropDownValue = Reincorporaciones.AF1o.DefaultDropDownValue

			' Field Periodo
			Reincorporaciones.Periodo.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reincorporaciones.Periodo.DropDownValue = Reincorporaciones.Periodo.DefaultDropDownValue

		' Set up default values for extended filters
			' Field Rut

			SetDefaultExtFilter(Reincorporaciones.Rut, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reincorporaciones.Rut)	

			' Field NOMBRE
			SetDefaultExtFilter(Reincorporaciones.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reincorporaciones.NOMBRE)	

			' Field PATERNO
			SetDefaultExtFilter(Reincorporaciones.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reincorporaciones.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Reincorporaciones.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reincorporaciones.MATERNO)	

			' Field Codigo Carrera
			SetDefaultExtFilter(Reincorporaciones.Codigo_Carrera, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reincorporaciones.Codigo_Carrera)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check Rut extended filter
		If (TextFilterApplied(Reincorporaciones.Rut)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(Reincorporaciones.NOMBRE)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Reincorporaciones.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Reincorporaciones.MATERNO)) Then bFilterExist = True

		' Check Estado dropdown filter
		If (NonTextFilterApplied(Reincorporaciones.Estado)) Then bFilterExist = True

		' Check Estado Final dropdown filter
		If (NonTextFilterApplied(Reincorporaciones.Estado_Final)) Then bFilterExist = True

		' Check Año dropdown filter
		If (NonTextFilterApplied(Reincorporaciones.AF1o)) Then bFilterExist = True

		' Check Periodo dropdown filter
		If (NonTextFilterApplied(Reincorporaciones.Periodo)) Then bFilterExist = True

		' Check Codigo Carrera extended filter
		If (TextFilterApplied(Reincorporaciones.Codigo_Carrera)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field Rut
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reincorporaciones.Rut, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reincorporaciones.Rut.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reincorporaciones.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reincorporaciones.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reincorporaciones.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reincorporaciones.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reincorporaciones.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reincorporaciones.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Estado
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reincorporaciones.Estado, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reincorporaciones.Estado.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Estado Final
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reincorporaciones.Estado_Final, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reincorporaciones.Estado_Final.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Año
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reincorporaciones.AF1o, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reincorporaciones.AF1o.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Periodo
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reincorporaciones.Periodo, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reincorporaciones.Periodo.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Codigo Carrera
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reincorporaciones.Codigo_Carrera, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reincorporaciones.Codigo_Carrera.FldCaption() & "<br>"
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
				Reincorporaciones.OrderBy = ""
				Reincorporaciones.StartGroup = 1
				Reincorporaciones.Rut.Sort = ""
				Reincorporaciones.NOMBRE.Sort = ""
				Reincorporaciones.PATERNO.Sort = ""
				Reincorporaciones.MATERNO.Sort = ""
				Reincorporaciones.Estado.Sort = ""
				Reincorporaciones.Estado_Final.Sort = ""
				Reincorporaciones.AF1o.Sort = ""
				Reincorporaciones.Periodo.Sort = ""
				Reincorporaciones.Codigo_Carrera.Sort = ""
				Reincorporaciones.Codigo.Sort = ""
				Reincorporaciones.DescripciF3n.Sort = ""
				Reincorporaciones.EmisiF3n.Sort = ""
				Reincorporaciones.ObservaciF3n.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Reincorporaciones.CurrentOrder = ew_Get("order")
			Reincorporaciones.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Reincorporaciones.SortSql()
			Reincorporaciones.OrderBy = sSortSql
			Reincorporaciones.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Reincorporaciones.OrderBy)) Then
			Reincorporaciones.OrderBy = "[PATERNO] ASC, [MATERNO] ASC"
			Reincorporaciones.PATERNO.Sort = "ASC"
			Reincorporaciones.MATERNO.Sort = "ASC"
		End If
		Return Reincorporaciones.OrderBy
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
		Reincorporaciones_summary = New crReincorporaciones_summary(Me)
		Reincorporaciones_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Reincorporaciones_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Reincorporaciones_summary IsNot Nothing) Then Reincorporaciones_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Reincorporaciones.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Reincorporaciones_summary = new ewrpt_Page("Reincorporaciones_summary");
// page properties
Reincorporaciones_summary.PageID = "summary"; // page ID
Reincorporaciones_summary.FormID = "fReincorporacionessummaryfilter"; // form ID
var EWRPT_PAGE_ID = Reincorporaciones_summary.PageID;
// extend page with ValidateForm function
Reincorporaciones_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Reincorporaciones_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Reincorporaciones_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Reincorporaciones_summary.ValidateRequired = false; // no JavaScript validation
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
<% Reincorporaciones_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Reincorporaciones.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Reincorporaciones.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Reincorporaciones.TableCaption() %></h1></div>
<% If (Reincorporaciones.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Reincorporaciones_summary.ExportExcelUrl %>"><img src="images/excel.png" alt="Exportar a Excel" title="Exportar a Excel" border="0" /></a>
<% If (Reincorporaciones_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Reincorporaciones_summary.ShowMessage() %>
<% If (Reincorporaciones.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Reincorporaciones.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Reincorporaciones.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Reincorporaciones.FilterPanelOption = 2 OrElse (Reincorporaciones.FilterPanelOption = 3 AndAlso Reincorporaciones_summary.FilterApplied) OrElse Reincorporaciones_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Reincorporacionessmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fReincorporacionessummaryfilter" id="fReincorporacionessummaryfilter" action="Reincorporacionessmry.aspx" class="ewForm" onsubmit="return Reincorporaciones_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Reincorporaciones.Codigo_Carrera.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reincorporaciones.Rut.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Rut" id="sv1_Rut" size="30" maxlength="30" value="<%= ew_HtmlEncode(Reincorporaciones.Rut.SearchValue) %>"<%= IIf(Reincorporaciones_summary.ClearExtFilter = "Reincorporaciones_Rut", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reincorporaciones.NOMBRE.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(Reincorporaciones.NOMBRE.SearchValue) %>"<%= IIf(Reincorporaciones_summary.ClearExtFilter = "Reincorporaciones_NOMBRE", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reincorporaciones.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Reincorporaciones.PATERNO.SearchValue) %>"<%= IIf(Reincorporaciones_summary.ClearExtFilter = "Reincorporaciones_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reincorporaciones.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Reincorporaciones.MATERNO.SearchValue) %>"<%= IIf(Reincorporaciones_summary.ClearExtFilter = "Reincorporaciones_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reincorporaciones.Estado.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Reincorporaciones.Estado.CustomFilters.Count + Reincorporaciones.Estado.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reincorporaciones.Estado.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Estado")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Reincorporaciones.Estado.DropDownValue" id="Reincorporaciones.Estado.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.Estado.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reincorporaciones.Estado.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Estado" id="sv_Estado" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.Estado.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reincorporaciones.Estado_Final.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Reincorporaciones.Estado_Final.CustomFilters.Count + Reincorporaciones.Estado_Final.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reincorporaciones.Estado_Final.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Estado Final")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Reincorporaciones.Estado_Final.DropDownValue" id="Reincorporaciones.Estado_Final.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.Estado_Final.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reincorporaciones.Estado_Final.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Estado_Final" id="sv_Estado_Final" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.Estado_Final.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reincorporaciones.AF1o.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AF1o" id="sv_AF1o"<%= IIf(Reincorporaciones_summary.ClearExtFilter = "Reincorporaciones_AF1o", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.AF1o.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Reincorporaciones.AF1o.CustomFilters.Count + Reincorporaciones.AF1o.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reincorporaciones.AF1o.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Año")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.AF1o.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reincorporaciones.AF1o.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.AF1o.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reincorporaciones.Periodo.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Periodo" id="sv_Periodo"<%= IIf(Reincorporaciones_summary.ClearExtFilter = "Reincorporaciones_Periodo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.Periodo.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Reincorporaciones.Periodo.CustomFilters.Count + Reincorporaciones.Periodo.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reincorporaciones.Periodo.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Periodo")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.Periodo.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reincorporaciones.Periodo.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reincorporaciones.Periodo.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reincorporaciones.Codigo_Carrera.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Codigo_Carrera" id="sv1_Codigo_Carrera" size="30" maxlength="30" value="<%= ew_HtmlEncode(Reincorporaciones.Codigo_Carrera.SearchValue) %>"<%= IIf(Reincorporaciones_summary.ClearExtFilter = "Reincorporaciones_Codigo_Carrera", " class=""ewInputCleared""", "") %>>
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
<% If (Reincorporaciones.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Reincorporaciones_summary.ShowFilterList() %>
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
If (Reincorporaciones.ExportAll AndAlso ew_NotEmpty(Reincorporaciones.Export)) Then
	Reincorporaciones_summary.StopGrp = Reincorporaciones_summary.TotalGrps
Else
	Reincorporaciones_summary.StopGrp = Reincorporaciones_summary.StartGrp + Reincorporaciones_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Reincorporaciones_summary.StopGrp > Reincorporaciones_summary.TotalGrps) Then
	Reincorporaciones_summary.StopGrp = Reincorporaciones_summary.TotalGrps
End If
Reincorporaciones_summary.RecCount = 0

' Get first row
If (Reincorporaciones_summary.TotalGrps > 0) Then
	Reincorporaciones_summary.GetRow() ' ASPXRPT
	Reincorporaciones_summary.GrpCount = 1
End If
While ((Reincorporaciones_summary.HasRow AndAlso Reincorporaciones_summary.GrpIndex < Reincorporaciones_summary.StopGrp) OrElse Reincorporaciones_summary.ShowFirstHeader)

	' Show header
	If (Reincorporaciones_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.Rut.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.Rut))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.Rut.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.Rut) %>',0);"><%= Reincorporaciones.Rut.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.Rut.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.Rut.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.NOMBRE) %>',0);"><%= Reincorporaciones.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.PATERNO) %>',0);"><%= Reincorporaciones.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.MATERNO) %>',0);"><%= Reincorporaciones.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.Estado.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.Estado))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.Estado.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.Estado) %>',0);"><%= Reincorporaciones.Estado.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.Estado.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.Estado.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.Estado_Final.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.Estado_Final))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.Estado_Final.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.Estado_Final) %>',0);"><%= Reincorporaciones.Estado_Final.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.Estado_Final.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.Estado_Final.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.AF1o.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.AF1o))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.AF1o.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.AF1o) %>',0);"><%= Reincorporaciones.AF1o.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.AF1o.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.AF1o.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.Periodo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.Periodo))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.Periodo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.Periodo) %>',0);"><%= Reincorporaciones.Periodo.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.Periodo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.Periodo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.Codigo_Carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.Codigo_Carrera))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.Codigo_Carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.Codigo_Carrera) %>',0);"><%= Reincorporaciones.Codigo_Carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.Codigo_Carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.Codigo_Carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.Codigo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.Codigo))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.Codigo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.Codigo) %>',0);"><%= Reincorporaciones.Codigo.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.Codigo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.Codigo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.DescripciF3n.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.DescripciF3n))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.DescripciF3n.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.DescripciF3n) %>',0);"><%= Reincorporaciones.DescripciF3n.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.DescripciF3n.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.DescripciF3n.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.EmisiF3n.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.EmisiF3n))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.EmisiF3n.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.EmisiF3n) %>',0);"><%= Reincorporaciones.EmisiF3n.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.EmisiF3n.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.EmisiF3n.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reincorporaciones.Export)) Then %>
<%= Reincorporaciones.ObservaciF3n.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reincorporaciones.SortUrl(Reincorporaciones.ObservaciF3n))) Then %>
		<td style="vertical-align: bottom;"><%= Reincorporaciones.ObservaciF3n.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reincorporaciones.SortUrl(Reincorporaciones.ObservaciF3n) %>',0);"><%= Reincorporaciones.ObservaciF3n.FldCaption() %></td><td style="width: 10px;">
		<% If (Reincorporaciones.ObservaciF3n.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reincorporaciones.ObservaciF3n.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Reincorporaciones_summary.ShowFirstHeader = False
	End If
	Reincorporaciones_summary.RecCount += 1

		' Render detail row
		Reincorporaciones.ResetCSS()
		Reincorporaciones.RowType = EWRPT_ROWTYPE_DETAIL
		Reincorporaciones_summary.RenderRow()
%>
	<tr<%= Reincorporaciones.RowAttributes() %>>
		<td<%= Reincorporaciones.Rut.CellAttributes %>>
<div<%= Reincorporaciones.Rut.ViewAttributes%>><%= Reincorporaciones.Rut.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.NOMBRE.CellAttributes %>>
<div<%= Reincorporaciones.NOMBRE.ViewAttributes%>><%= Reincorporaciones.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.PATERNO.CellAttributes %>>
<div<%= Reincorporaciones.PATERNO.ViewAttributes%>><%= Reincorporaciones.PATERNO.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.MATERNO.CellAttributes %>>
<div<%= Reincorporaciones.MATERNO.ViewAttributes%>><%= Reincorporaciones.MATERNO.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.Estado.CellAttributes %>>
<div<%= Reincorporaciones.Estado.ViewAttributes%>><%= Reincorporaciones.Estado.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.Estado_Final.CellAttributes %>>
<div<%= Reincorporaciones.Estado_Final.ViewAttributes%>><%= Reincorporaciones.Estado_Final.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.AF1o.CellAttributes %>>
<div<%= Reincorporaciones.AF1o.ViewAttributes%>><%= Reincorporaciones.AF1o.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.Periodo.CellAttributes %>>
<div<%= Reincorporaciones.Periodo.ViewAttributes%>><%= Reincorporaciones.Periodo.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.Codigo_Carrera.CellAttributes %>>
<div<%= Reincorporaciones.Codigo_Carrera.ViewAttributes%>><%= Reincorporaciones.Codigo_Carrera.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.Codigo.CellAttributes %>>
<div<%= Reincorporaciones.Codigo.ViewAttributes%>><%= Reincorporaciones.Codigo.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.DescripciF3n.CellAttributes %>>
<div<%= Reincorporaciones.DescripciF3n.ViewAttributes%>><%= Reincorporaciones.DescripciF3n.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.EmisiF3n.CellAttributes %>>
<div<%= Reincorporaciones.EmisiF3n.ViewAttributes%>><%= Reincorporaciones.EmisiF3n.ListViewValue%></div>
</td>
		<td<%= Reincorporaciones.ObservaciF3n.CellAttributes %>>
<div<%= Reincorporaciones.ObservaciF3n.ViewAttributes%>><%= Reincorporaciones.ObservaciF3n.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Reincorporaciones_summary.AccumulateSummary()

		' Get next record
		Reincorporaciones_summary.GetRow() ' ASPXRPT
		Reincorporaciones_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Reincorporaciones_summary.TotalGrps > 0) Then
	Reincorporaciones.ResetCSS()
	Reincorporaciones.RowType = EWRPT_ROWTYPE_TOTAL
	Reincorporaciones.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Reincorporaciones.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Reincorporaciones.RowAttrs("class") = "ewRptGrandSummary"
	Reincorporaciones_summary.RenderRow()
%>
	<!-- tr><td colspan="13"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Reincorporaciones.RowAttributes() %>><td colspan="13"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Reincorporaciones_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Reincorporaciones.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Reincorporaciones_summary.Pager Is Nothing Then Reincorporaciones_summary.Pager = New cPrevNextPager(Reincorporaciones_summary.StartGrp, Reincorporaciones_summary.DisplayGrps, Reincorporaciones_summary.TotalGrps) %>
<% If Reincorporaciones_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Reincorporaciones_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Reincorporacionessmry.aspx?start=<%= Reincorporaciones_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Reincorporaciones_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Reincorporacionessmry.aspx?start=<%= Reincorporaciones_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Reincorporaciones_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Reincorporaciones_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Reincorporacionessmry.aspx?start=<%= Reincorporaciones_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Reincorporaciones_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Reincorporacionessmry.aspx?start=<%= Reincorporaciones_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Reincorporaciones_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Reincorporaciones_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Reincorporaciones_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Reincorporaciones_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Reincorporaciones_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Reincorporaciones_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Reincorporaciones_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Reincorporaciones_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Reincorporaciones_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Reincorporaciones.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Reincorporaciones.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Reincorporaciones.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Reincorporaciones_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Reincorporaciones.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
