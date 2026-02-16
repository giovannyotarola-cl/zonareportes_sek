<%@ Page ClassName="PorcentajeAprobacionsmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public PorcentajeAprobacion As crPorcentajeAprobacion = Nothing

	'
	' Table class (for PorcentajeAprobacion)
	'
	Public Class crPorcentajeAprobacion
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
				Return "PorcentajeAprobacion"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "PorcentajeAprobacion"
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

		Public NOMBRE_C As crField

		Public RUT As crField

		Public DIG As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRE As crField

		Public PeriodosAnalizados As crField

		Public RamosAprobados As crField

		Public RamosTotales As crField

		Public PorcentajeAprobacion_1 As crField

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

			' NOMBRE_C
			NOMBRE_C = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' RUT
			RUT = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' DIG
			DIG = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
			DIG.Page = APage
			DIG.ParentPage = APage.ParentPage
			Fields.Add("DIG", DIG)
			DIG.DateFilter = ""
			DIG.SqlSelect = ""
			DIG.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' PeriodosAnalizados
			PeriodosAnalizados = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_PeriodosAnalizados", "PeriodosAnalizados", "[PeriodosAnalizados]", 200, EWRPT_DATATYPE_STRING, -1)
			PeriodosAnalizados.Page = APage
			PeriodosAnalizados.ParentPage = APage.ParentPage
			Fields.Add("PeriodosAnalizados", PeriodosAnalizados)
			PeriodosAnalizados.DateFilter = ""
			PeriodosAnalizados.SqlSelect = ""
			PeriodosAnalizados.SqlOrderBy = ""

			' RamosAprobados
			RamosAprobados = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_RamosAprobados", "RamosAprobados", "[RamosAprobados]", 200, EWRPT_DATATYPE_STRING, -1)
			RamosAprobados.Page = APage
			RamosAprobados.ParentPage = APage.ParentPage
			Fields.Add("RamosAprobados", RamosAprobados)
			RamosAprobados.DateFilter = ""
			RamosAprobados.SqlSelect = ""
			RamosAprobados.SqlOrderBy = ""

			' RamosTotales
			RamosTotales = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_RamosTotales", "RamosTotales", "[RamosTotales]", 200, EWRPT_DATATYPE_STRING, -1)
			RamosTotales.Page = APage
			RamosTotales.ParentPage = APage.ParentPage
			Fields.Add("RamosTotales", RamosTotales)
			RamosTotales.DateFilter = ""
			RamosTotales.SqlSelect = ""
			RamosTotales.SqlOrderBy = ""

			' PorcentajeAprobacion
			PorcentajeAprobacion_1 = new crField("PorcentajeAprobacion", "PorcentajeAprobacion", "x_PorcentajeAprobacion_1", "PorcentajeAprobacion", "[PorcentajeAprobacion]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PorcentajeAprobacion_1.Page = APage
			PorcentajeAprobacion_1.ParentPage = APage.ParentPage
			PorcentajeAprobacion_1.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PorcentajeAprobacion_1", PorcentajeAprobacion_1)
			PorcentajeAprobacion_1.DateFilter = ""
			PorcentajeAprobacion_1.SqlSelect = ""
			PorcentajeAprobacion_1.SqlOrderBy = ""
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
				Return "[SEK_V_Porcentaje_Aprobacion]"
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
	Public PorcentajeAprobacion_summary As crPorcentajeAprobacion_summary

	'
	' Page class
	'
	Public Class crPorcentajeAprobacion_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (PorcentajeAprobacion.UseTokenInUrl) Then
				sUrl &= "t=" & PorcentajeAprobacion.TableVar & "&" ' Add page token
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
			If (PorcentajeAprobacion.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(PorcentajeAprobacion.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(PorcentajeAprobacion.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As PorcentajeAprobacionsmry 
			Get
				Return CType(m_ParentPage, PorcentajeAprobacionsmry)
			End Get
		End Property

		' Table object (PorcentajeAprobacion)
		Public Property PorcentajeAprobacion As crPorcentajeAprobacion 
			Get		
				Return AspNetPage.PorcentajeAprobacion ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crPorcentajeAprobacion)
				AspNetPage.PorcentajeAprobacion = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "PorcentajeAprobacion_summary"
			m_PageObjTypeName = "crPorcentajeAprobacion_summary"

			' Table name
			m_TableName = "PorcentajeAprobacion"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (PorcentajeAprobacion)
			PorcentajeAprobacion = New crPorcentajeAprobacion(Me)			

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
				PorcentajeAprobacion.Export = ew_Get("export")
			End If
			gsExport = PorcentajeAprobacion.Export ' Get export parameter, used in header
			gsExportFile = PorcentajeAprobacion.TableVar ' Get export file, used in header
			If (PorcentajeAprobacion.Export = "excel") Then
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

		Public DisplayGrps As Integer = 15	' Groups per page

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
			PorcentajeAprobacion.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(PorcentajeAprobacion.SqlSelect, PorcentajeAprobacion.SqlWhere, PorcentajeAprobacion.SqlGroupBy, PorcentajeAprobacion.SqlHaving, PorcentajeAprobacion.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (PorcentajeAprobacion.ExportAll AndAlso ew_NotEmpty(PorcentajeAprobacion.Export)) Then
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
				PorcentajeAprobacion.RUT.DbValue = Row("RUT")
				PorcentajeAprobacion.DIG.DbValue = Row("DIG")
				PorcentajeAprobacion.PATERNO.DbValue = Row("PATERNO")
				PorcentajeAprobacion.MATERNO.DbValue = Row("MATERNO")
				PorcentajeAprobacion.NOMBRE.DbValue = Row("NOMBRE")
				PorcentajeAprobacion.NOMBRE_C.DbValue = Row("NOMBRE_C")
				PorcentajeAprobacion.PeriodosAnalizados.DbValue = Row("PeriodosAnalizados")
				PorcentajeAprobacion.RamosAprobados.DbValue = Row("RamosAprobados")
				PorcentajeAprobacion.RamosTotales.DbValue = Row("RamosTotales")
				PorcentajeAprobacion.PorcentajeAprobacion_1.DbValue = Row("PorcentajeAprobacion")
				Val(1) = PorcentajeAprobacion.NOMBRE_C.CurrentValue
				Val(2) = PorcentajeAprobacion.RUT.CurrentValue
				Val(3) = PorcentajeAprobacion.DIG.CurrentValue
				Val(4) = PorcentajeAprobacion.PATERNO.CurrentValue
				Val(5) = PorcentajeAprobacion.MATERNO.CurrentValue
				Val(6) = PorcentajeAprobacion.NOMBRE.CurrentValue
				Val(7) = PorcentajeAprobacion.PeriodosAnalizados.CurrentValue
				Val(8) = PorcentajeAprobacion.RamosAprobados.CurrentValue
				Val(9) = PorcentajeAprobacion.RamosTotales.CurrentValue
				Val(10) = PorcentajeAprobacion.PorcentajeAprobacion_1.CurrentValue
			Else
				PorcentajeAprobacion.RUT.DbValue = ""
				PorcentajeAprobacion.DIG.DbValue = ""
				PorcentajeAprobacion.PATERNO.DbValue = ""
				PorcentajeAprobacion.MATERNO.DbValue = ""
				PorcentajeAprobacion.NOMBRE.DbValue = ""
				PorcentajeAprobacion.NOMBRE_C.DbValue = ""
				PorcentajeAprobacion.PeriodosAnalizados.DbValue = ""
				PorcentajeAprobacion.RamosAprobados.DbValue = ""
				PorcentajeAprobacion.RamosTotales.DbValue = ""
				PorcentajeAprobacion.PorcentajeAprobacion_1.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				PorcentajeAprobacion.RUT.DbValue = dr("RUT")
				PorcentajeAprobacion.DIG.DbValue = dr("DIG")
				PorcentajeAprobacion.PATERNO.DbValue = dr("PATERNO")
				PorcentajeAprobacion.MATERNO.DbValue = dr("MATERNO")
				PorcentajeAprobacion.NOMBRE.DbValue = dr("NOMBRE")
				PorcentajeAprobacion.NOMBRE_C.DbValue = dr("NOMBRE_C")
				PorcentajeAprobacion.PeriodosAnalizados.DbValue = dr("PeriodosAnalizados")
				PorcentajeAprobacion.RamosAprobados.DbValue = dr("RamosAprobados")
				PorcentajeAprobacion.RamosTotales.DbValue = dr("RamosTotales")
				PorcentajeAprobacion.PorcentajeAprobacion_1.DbValue = dr("PorcentajeAprobacion")
				Val(1) = PorcentajeAprobacion.NOMBRE_C.CurrentValue
				Val(2) = PorcentajeAprobacion.RUT.CurrentValue
				Val(3) = PorcentajeAprobacion.DIG.CurrentValue
				Val(4) = PorcentajeAprobacion.PATERNO.CurrentValue
				Val(5) = PorcentajeAprobacion.MATERNO.CurrentValue
				Val(6) = PorcentajeAprobacion.NOMBRE.CurrentValue
				Val(7) = PorcentajeAprobacion.PeriodosAnalizados.CurrentValue
				Val(8) = PorcentajeAprobacion.RamosAprobados.CurrentValue
				Val(9) = PorcentajeAprobacion.RamosTotales.CurrentValue
				Val(10) = PorcentajeAprobacion.PorcentajeAprobacion_1.CurrentValue
			Else				
				PorcentajeAprobacion.RUT.DbValue = ""
				PorcentajeAprobacion.DIG.DbValue = ""
				PorcentajeAprobacion.PATERNO.DbValue = ""
				PorcentajeAprobacion.MATERNO.DbValue = ""
				PorcentajeAprobacion.NOMBRE.DbValue = ""
				PorcentajeAprobacion.NOMBRE_C.DbValue = ""
				PorcentajeAprobacion.PeriodosAnalizados.DbValue = ""
				PorcentajeAprobacion.RamosAprobados.DbValue = ""
				PorcentajeAprobacion.RamosTotales.DbValue = ""
				PorcentajeAprobacion.PorcentajeAprobacion_1.DbValue = ""
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
				PorcentajeAprobacion.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					PorcentajeAprobacion.StartGroup = StartGrp
				Else
					StartGrp = PorcentajeAprobacion.StartGroup
				End If
			Else
				StartGrp = PorcentajeAprobacion.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				PorcentajeAprobacion.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				PorcentajeAprobacion.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				PorcentajeAprobacion.StartGroup = StartGrp
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
			PorcentajeAprobacion.StartGroup = StartGrp
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
						DisplayGrps = 15 ' Non-numeric, load default 
					End If 
				End If				
				PorcentajeAprobacion.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				PorcentajeAprobacion.StartGroup = StartGrp
			Else				
				If (PorcentajeAprobacion.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(PorcentajeAprobacion.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 15 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (PorcentajeAprobacion.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(PorcentajeAprobacion.SqlSelectCount, PorcentajeAprobacion.SqlWhere, PorcentajeAprobacion.SqlGroupBy, PorcentajeAprobacion.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			PorcentajeAprobacion.Row_Rendering()

			'
			' Render view codes
			'

			If (PorcentajeAprobacion.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' NOMBRE_C
				PorcentajeAprobacion.NOMBRE_C.ViewValue = Convert.ToString(PorcentajeAprobacion.NOMBRE_C.Summary)

				' RUT
				PorcentajeAprobacion.RUT.ViewValue = Convert.ToString(PorcentajeAprobacion.RUT.Summary)

				' DIG
				PorcentajeAprobacion.DIG.ViewValue = Convert.ToString(PorcentajeAprobacion.DIG.Summary)

				' PATERNO
				PorcentajeAprobacion.PATERNO.ViewValue = Convert.ToString(PorcentajeAprobacion.PATERNO.Summary)

				' MATERNO
				PorcentajeAprobacion.MATERNO.ViewValue = Convert.ToString(PorcentajeAprobacion.MATERNO.Summary)

				' NOMBRE
				PorcentajeAprobacion.NOMBRE.ViewValue = Convert.ToString(PorcentajeAprobacion.NOMBRE.Summary)

				' PeriodosAnalizados
				PorcentajeAprobacion.PeriodosAnalizados.ViewValue = Convert.ToString(PorcentajeAprobacion.PeriodosAnalizados.Summary)
				PorcentajeAprobacion.PeriodosAnalizados.ViewAttrs("style") = "text-align:center;"

				' RamosAprobados
				PorcentajeAprobacion.RamosAprobados.ViewValue = Convert.ToString(PorcentajeAprobacion.RamosAprobados.Summary)
				PorcentajeAprobacion.RamosAprobados.ViewAttrs("style") = "text-align:center;"

				' RamosTotales
				PorcentajeAprobacion.RamosTotales.ViewValue = Convert.ToString(PorcentajeAprobacion.RamosTotales.Summary)
				PorcentajeAprobacion.RamosTotales.ViewAttrs("style") = "text-align:center;"

				' PorcentajeAprobacion
				PorcentajeAprobacion.PorcentajeAprobacion_1.ViewValue = Convert.ToString(PorcentajeAprobacion.PorcentajeAprobacion_1.Summary)
				PorcentajeAprobacion.PorcentajeAprobacion_1.ViewAttrs("style") = "font-weight:bold;text-align:center;"
			Else

				' NOMBRE_C
				PorcentajeAprobacion.NOMBRE_C.ViewValue = Convert.ToString(PorcentajeAprobacion.NOMBRE_C.CurrentValue)
				PorcentajeAprobacion.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				PorcentajeAprobacion.RUT.ViewValue = Convert.ToString(PorcentajeAprobacion.RUT.CurrentValue)
				PorcentajeAprobacion.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIG
				PorcentajeAprobacion.DIG.ViewValue = Convert.ToString(PorcentajeAprobacion.DIG.CurrentValue)
				PorcentajeAprobacion.DIG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				PorcentajeAprobacion.PATERNO.ViewValue = Convert.ToString(PorcentajeAprobacion.PATERNO.CurrentValue)
				PorcentajeAprobacion.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				PorcentajeAprobacion.MATERNO.ViewValue = Convert.ToString(PorcentajeAprobacion.MATERNO.CurrentValue)
				PorcentajeAprobacion.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				PorcentajeAprobacion.NOMBRE.ViewValue = Convert.ToString(PorcentajeAprobacion.NOMBRE.CurrentValue)
				PorcentajeAprobacion.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PeriodosAnalizados
				PorcentajeAprobacion.PeriodosAnalizados.ViewValue = Convert.ToString(PorcentajeAprobacion.PeriodosAnalizados.CurrentValue)
				PorcentajeAprobacion.PeriodosAnalizados.ViewAttrs("style") = "text-align:center;"
				PorcentajeAprobacion.PeriodosAnalizados.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RamosAprobados
				PorcentajeAprobacion.RamosAprobados.ViewValue = Convert.ToString(PorcentajeAprobacion.RamosAprobados.CurrentValue)
				PorcentajeAprobacion.RamosAprobados.ViewAttrs("style") = "text-align:center;"
				PorcentajeAprobacion.RamosAprobados.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RamosTotales
				PorcentajeAprobacion.RamosTotales.ViewValue = Convert.ToString(PorcentajeAprobacion.RamosTotales.CurrentValue)
				PorcentajeAprobacion.RamosTotales.ViewAttrs("style") = "text-align:center;"
				PorcentajeAprobacion.RamosTotales.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PorcentajeAprobacion
				PorcentajeAprobacion.PorcentajeAprobacion_1.ViewValue = Convert.ToString(PorcentajeAprobacion.PorcentajeAprobacion_1.CurrentValue)
				PorcentajeAprobacion.PorcentajeAprobacion_1.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				PorcentajeAprobacion.PorcentajeAprobacion_1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' NOMBRE_C
			PorcentajeAprobacion.NOMBRE_C.HrefValue = ""

			' RUT
			PorcentajeAprobacion.RUT.HrefValue = ""

			' DIG
			PorcentajeAprobacion.DIG.HrefValue = ""

			' PATERNO
			PorcentajeAprobacion.PATERNO.HrefValue = ""

			' MATERNO
			PorcentajeAprobacion.MATERNO.HrefValue = ""

			' NOMBRE
			PorcentajeAprobacion.NOMBRE.HrefValue = ""

			' PeriodosAnalizados
			PorcentajeAprobacion.PeriodosAnalizados.HrefValue = ""

			' RamosAprobados
			PorcentajeAprobacion.RamosAprobados.HrefValue = ""

			' RamosTotales
			PorcentajeAprobacion.RamosTotales.HrefValue = ""

			' PorcentajeAprobacion
			PorcentajeAprobacion.PorcentajeAprobacion_1.HrefValue = ""

			' Call Row_Rendered event
			PorcentajeAprobacion.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + PorcentajeAprobacion.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, PorcentajeAprobacion.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			PorcentajeAprobacion.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field NOMBRE_C
				SetSessionDropDownValue(PorcentajeAprobacion.NOMBRE_C.DropDownValue, PorcentajeAprobacion.NOMBRE_C)

				' Field RUT
				SetSessionFilterValues(PorcentajeAprobacion.RUT)

				' Field PATERNO
				SetSessionFilterValues(PorcentajeAprobacion.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(PorcentajeAprobacion.MATERNO)

				' Field NOMBRE
				SetSessionFilterValues(PorcentajeAprobacion.NOMBRE)

				' Field PorcentajeAprobacion
				SetSessionFilterValues(PorcentajeAprobacion.PorcentajeAprobacion_1)
			bSetupFilter = True ' Set up filter required
		Else

				' Field NOMBRE_C
				If (GetDropDownValue(PorcentajeAprobacion.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(PorcentajeAprobacion.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(PorcentajeAprobacion.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_PorcentajeAprobacion_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field RUT
				If (GetFilterValues(PorcentajeAprobacion.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(PorcentajeAprobacion.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(PorcentajeAprobacion.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(PorcentajeAprobacion.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PorcentajeAprobacion
				If (GetFilterValues(PorcentajeAprobacion.PorcentajeAprobacion_1)) Then
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

			' Field NOMBRE_C
			GetSessionDropDownValue(PorcentajeAprobacion.NOMBRE_C)

			' Field RUT
			GetSessionFilterValues(PorcentajeAprobacion.RUT)

			' Field PATERNO
			GetSessionFilterValues(PorcentajeAprobacion.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(PorcentajeAprobacion.MATERNO)

			' Field NOMBRE
			GetSessionFilterValues(PorcentajeAprobacion.NOMBRE)

			' Field PorcentajeAprobacion
			GetSessionFilterValues(PorcentajeAprobacion.PorcentajeAprobacion_1)
		End If

		' Call page filter validated event
		PorcentajeAprobacion.Page_FilterValidated()

		' Build SQL
		' Field NOMBRE_C

		BuildDropDownFilter(PorcentajeAprobacion.NOMBRE_C, sFilter, "")

		' Field RUT
		BuildExtendedFilter(PorcentajeAprobacion.RUT, sFilter)

		' Field PATERNO
		BuildExtendedFilter(PorcentajeAprobacion.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(PorcentajeAprobacion.MATERNO, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(PorcentajeAprobacion.NOMBRE, sFilter)

		' Field PorcentajeAprobacion
		BuildExtendedFilter(PorcentajeAprobacion.PorcentajeAprobacion_1, sFilter)

		' Save parms to Session
		' Field NOMBRE_C

		SetSessionDropDownValue(PorcentajeAprobacion.NOMBRE_C.DropDownValue, PorcentajeAprobacion.NOMBRE_C)

		' Field RUT
		SetSessionFilterValues(PorcentajeAprobacion.RUT)

		' Field PATERNO
		SetSessionFilterValues(PorcentajeAprobacion.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(PorcentajeAprobacion.MATERNO)

		' Field NOMBRE
		SetSessionFilterValues(PorcentajeAprobacion.NOMBRE)

		' Field PorcentajeAprobacion
		SetSessionFilterValues(PorcentajeAprobacion.PorcentajeAprobacion_1)

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
		If ew_Session("sv_PorcentajeAprobacion_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_PorcentajeAprobacion_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_PorcentajeAprobacion_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_PorcentajeAprobacion_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_PorcentajeAprobacion_" + parm)
		End If
		If ew_Session("so1_PorcentajeAprobacion_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_PorcentajeAprobacion_" + parm))
		End If
		If ew_Session("sc_PorcentajeAprobacion_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_PorcentajeAprobacion_" + parm))
		End If
		If ew_Session("sv2_PorcentajeAprobacion_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_PorcentajeAprobacion_" + parm)
		End If
		If ew_Session("so2_PorcentajeAprobacion_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_PorcentajeAprobacion_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_PorcentajeAprobacion_" + parm) = fld.SearchValue
		ew_Session("so1_PorcentajeAprobacion_" + parm) = fld.SearchOperator
		ew_Session("sc_PorcentajeAprobacion_" + parm) = fld.SearchCondition
		ew_Session("sv2_PorcentajeAprobacion_" + parm) = fld.SearchValue2
		ew_Session("so2_PorcentajeAprobacion_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_PorcentajeAprobacion_" + parm) = ""
		ew_Session("so1_PorcentajeAprobacion_" + parm) = "="
		ew_Session("sc_PorcentajeAprobacion_" + parm) = "AND"
		ew_Session("sv2_PorcentajeAprobacion_" + parm) = ""
		ew_Session("so2_PorcentajeAprobacion_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(PorcentajeAprobacion.PorcentajeAprobacion_1.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= PorcentajeAprobacion.PorcentajeAprobacion_1.FldErrMsg()
		End If
		If Not ewrpt_CheckNumber(Convert.ToString(PorcentajeAprobacion.PorcentajeAprobacion_1.SearchValue2)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= PorcentajeAprobacion.PorcentajeAprobacion_1.FldErrMsg()
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
		ew_Session("sel_PorcentajeAprobacion_" & parm) = ""
		ew_Session("rf_PorcentajeAprobacion_" & parm) = ""
		ew_Session("rt_PorcentajeAprobacion_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = PorcentajeAprobacion.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_PorcentajeAprobacion_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_PorcentajeAprobacion_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_PorcentajeAprobacion_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBRE_C

			PorcentajeAprobacion.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			PorcentajeAprobacion.NOMBRE_C.DropDownValue = PorcentajeAprobacion.NOMBRE_C.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(PorcentajeAprobacion.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(PorcentajeAprobacion.RUT)	

			' Field PATERNO
			SetDefaultExtFilter(PorcentajeAprobacion.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(PorcentajeAprobacion.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(PorcentajeAprobacion.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(PorcentajeAprobacion.MATERNO)	

			' Field NOMBRE
			SetDefaultExtFilter(PorcentajeAprobacion.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(PorcentajeAprobacion.NOMBRE)	

			' Field PorcentajeAprobacion
			SetDefaultExtFilter(PorcentajeAprobacion.PorcentajeAprobacion_1, "<=", Nothing, "AND", ">=", Nothing)
			ApplyDefaultExtFilter(PorcentajeAprobacion.PorcentajeAprobacion_1)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(PorcentajeAprobacion.NOMBRE_C)) Then bFilterExist = True

		' Check RUT extended filter
		If (TextFilterApplied(PorcentajeAprobacion.RUT)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(PorcentajeAprobacion.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(PorcentajeAprobacion.MATERNO)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(PorcentajeAprobacion.NOMBRE)) Then bFilterExist = True

		' Check PorcentajeAprobacion extended filter
		If (TextFilterApplied(PorcentajeAprobacion.PorcentajeAprobacion_1)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(PorcentajeAprobacion.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PorcentajeAprobacion.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(PorcentajeAprobacion.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PorcentajeAprobacion.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(PorcentajeAprobacion.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PorcentajeAprobacion.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(PorcentajeAprobacion.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PorcentajeAprobacion.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(PorcentajeAprobacion.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PorcentajeAprobacion.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PorcentajeAprobacion
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(PorcentajeAprobacion.PorcentajeAprobacion_1, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PorcentajeAprobacion.PorcentajeAprobacion_1.FldCaption() & "<br>"
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
				PorcentajeAprobacion.OrderBy = ""
				PorcentajeAprobacion.StartGroup = 1
				PorcentajeAprobacion.NOMBRE_C.Sort = ""
				PorcentajeAprobacion.RUT.Sort = ""
				PorcentajeAprobacion.DIG.Sort = ""
				PorcentajeAprobacion.PATERNO.Sort = ""
				PorcentajeAprobacion.MATERNO.Sort = ""
				PorcentajeAprobacion.NOMBRE.Sort = ""
				PorcentajeAprobacion.PeriodosAnalizados.Sort = ""
				PorcentajeAprobacion.RamosAprobados.Sort = ""
				PorcentajeAprobacion.RamosTotales.Sort = ""
				PorcentajeAprobacion.PorcentajeAprobacion_1.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			PorcentajeAprobacion.CurrentOrder = ew_Get("order")
			PorcentajeAprobacion.CurrentOrderType = ew_Get("ordertype")
			sSortSql = PorcentajeAprobacion.SortSql()
			PorcentajeAprobacion.OrderBy = sSortSql
			PorcentajeAprobacion.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(PorcentajeAprobacion.OrderBy)) Then
			PorcentajeAprobacion.OrderBy = "[NOMBRE_C] ASC, [PATERNO] ASC, [MATERNO] ASC"
			PorcentajeAprobacion.NOMBRE_C.Sort = "ASC"
			PorcentajeAprobacion.PATERNO.Sort = "ASC"
			PorcentajeAprobacion.MATERNO.Sort = "ASC"
		End If
		Return PorcentajeAprobacion.OrderBy
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
		PorcentajeAprobacion_summary = New crPorcentajeAprobacion_summary(Me)
		PorcentajeAprobacion_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		PorcentajeAprobacion_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (PorcentajeAprobacion_summary IsNot Nothing) Then PorcentajeAprobacion_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (PorcentajeAprobacion.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var PorcentajeAprobacion_summary = new ewrpt_Page("PorcentajeAprobacion_summary");
// page properties
PorcentajeAprobacion_summary.PageID = "summary"; // page ID
PorcentajeAprobacion_summary.FormID = "fPorcentajeAprobacionsummaryfilter"; // form ID
var EWRPT_PAGE_ID = PorcentajeAprobacion_summary.PageID;
// extend page with ValidateForm function
PorcentajeAprobacion_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_PorcentajeAprobacion_1;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(PorcentajeAprobacion.PorcentajeAprobacion_1.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv2_PorcentajeAprobacion_1;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(PorcentajeAprobacion.PorcentajeAprobacion_1.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
PorcentajeAprobacion_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
PorcentajeAprobacion_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
PorcentajeAprobacion_summary.ValidateRequired = false; // no JavaScript validation
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
<% PorcentajeAprobacion_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (PorcentajeAprobacion.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (PorcentajeAprobacion.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="ewTitle"><h1><%= PorcentajeAprobacion.TableCaption() %></h1>
<% If (PorcentajeAprobacion.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= PorcentajeAprobacion_summary.ExportExcelUrl %>"><img src="images/Excel.png" /></a>
<% If (PorcentajeAprobacion_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="PorcentajeAprobacionsmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% PorcentajeAprobacion_summary.ShowMessage() %>
<% If (PorcentajeAprobacion.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (PorcentajeAprobacion.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (PorcentajeAprobacion.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (PorcentajeAprobacion.FilterPanelOption = 2 OrElse (PorcentajeAprobacion.FilterPanelOption = 3 AndAlso PorcentajeAprobacion_summary.FilterApplied) OrElse PorcentajeAprobacion_summary.Filter = "0=101") Then
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
<form name="fPorcentajeAprobacionsummaryfilter" id="fPorcentajeAprobacionsummaryfilter" action="PorcentajeAprobacionsmry.aspx" class="ewForm" onsubmit="return PorcentajeAprobacion_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = PorcentajeAprobacion.PorcentajeAprobacion_1.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= PorcentajeAprobacion.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(PorcentajeAprobacion_summary.ClearExtFilter = "PorcentajeAprobacion_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(PorcentajeAprobacion.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = PorcentajeAprobacion.NOMBRE_C.CustomFilters.Count + PorcentajeAprobacion.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In PorcentajeAprobacion.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(PorcentajeAprobacion.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In PorcentajeAprobacion.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(PorcentajeAprobacion.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PorcentajeAprobacion.RUT.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_RUT" id="so1_RUT" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="30" value="<%= ew_HtmlEncode(PorcentajeAprobacion.RUT.SearchValue) %>"<%= IIf(PorcentajeAprobacion_summary.ClearExtFilter = "PorcentajeAprobacion_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PorcentajeAprobacion.PATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_PATERNO" id="so1_PATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(PorcentajeAprobacion.PATERNO.SearchValue) %>"<%= IIf(PorcentajeAprobacion_summary.ClearExtFilter = "PorcentajeAprobacion_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PorcentajeAprobacion.MATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_MATERNO" id="so1_MATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(PorcentajeAprobacion.MATERNO.SearchValue) %>"<%= IIf(PorcentajeAprobacion_summary.ClearExtFilter = "PorcentajeAprobacion_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PorcentajeAprobacion.NOMBRE.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_NOMBRE" id="so1_NOMBRE" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(PorcentajeAprobacion.NOMBRE.SearchValue) %>"<%= IIf(PorcentajeAprobacion_summary.ClearExtFilter = "PorcentajeAprobacion_NOMBRE", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PorcentajeAprobacion.PorcentajeAprobacion_1.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("<=") %><input type="hidden" name="so1_PorcentajeAprobacion_1" id="so1_PorcentajeAprobacion_1" value="<="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PorcentajeAprobacion_1" id="sv1_PorcentajeAprobacion_1" size="30" value="<%= ew_HtmlEncode(PorcentajeAprobacion.PorcentajeAprobacion_1.SearchValue) %>"<%= IIf(PorcentajeAprobacion_summary.ClearExtFilter = "PorcentajeAprobacion_PorcentajeAprobacion_1", " class=""ewInputCleared""", "") %>>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw0_PorcentajeAprobacion_1" name="btw0_PorcentajeAprobacion_1"><label><input type="radio" name="sc_PorcentajeAprobacion_1" value="AND"<% If (PorcentajeAprobacion.PorcentajeAprobacion_1.SearchCondition <> "OR") Then Response.Write(" checked=""checked""") %>><%= ReportLanguage.Phrase("AND") %></label>&nbsp;<span class="ewSearchOpr" name="_sc_PorcentajeAprobacion_1" id="_sc_PorcentajeAprobacion_1"><label><input type="radio" name="sc_PorcentajeAprobacion_1" value="OR"<% If (PorcentajeAprobacion.PorcentajeAprobacion_1.SearchCondition = "OR") Then Response.Write(" checked=""checked""") %>><%= ReportLanguage.Phrase("OR") %></label></span></span></td>
					<td><span class="ewRptSearchOpr" id="btw0_PorcentajeAprobacion_1" name="btw0_PorcentajeAprobacion_1" ><%= ReportLanguage.Phrase(">=") %><input type="hidden" name="so2_PorcentajeAprobacion_1" id="so2_PorcentajeAprobacion_1" value=">="></span></td>
					<td><span class="aspnetreportmaker">
<input type="text" name="sv2_PorcentajeAprobacion_1" id="sv2_PorcentajeAprobacion_1" size="30" value="<%= ew_HtmlEncode(PorcentajeAprobacion.PorcentajeAprobacion_1.SearchValue2) %>"<%= IIf(PorcentajeAprobacion_summary.ClearExtFilter = "PorcentajeAprobacion_PorcentajeAprobacion_1", " class=""ewInputCleared""", "") %>>
</span></td>
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
<% If (PorcentajeAprobacion.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% PorcentajeAprobacion_summary.ShowFilterList() %>
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
If (PorcentajeAprobacion.ExportAll AndAlso ew_NotEmpty(PorcentajeAprobacion.Export)) Then
	PorcentajeAprobacion_summary.StopGrp = PorcentajeAprobacion_summary.TotalGrps
Else
	PorcentajeAprobacion_summary.StopGrp = PorcentajeAprobacion_summary.StartGrp + PorcentajeAprobacion_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (PorcentajeAprobacion_summary.StopGrp > PorcentajeAprobacion_summary.TotalGrps) Then
	PorcentajeAprobacion_summary.StopGrp = PorcentajeAprobacion_summary.TotalGrps
End If
PorcentajeAprobacion_summary.RecCount = 0

' Get first row
If (PorcentajeAprobacion_summary.TotalGrps > 0) Then
	PorcentajeAprobacion_summary.GetRow() ' ASPXRPT
	PorcentajeAprobacion_summary.GrpCount = 1
End If
While ((PorcentajeAprobacion_summary.HasRow AndAlso PorcentajeAprobacion_summary.GrpIndex < PorcentajeAprobacion_summary.StopGrp) OrElse PorcentajeAprobacion_summary.ShowFirstHeader)

	' Show header
	If (PorcentajeAprobacion_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.NOMBRE_C) %>',0);"><%= PorcentajeAprobacion.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.RUT) %>',0);"><%= PorcentajeAprobacion.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.DIG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.DIG))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.DIG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.DIG) %>',0);"><%= PorcentajeAprobacion.DIG.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.DIG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.DIG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.PATERNO) %>',0);"><%= PorcentajeAprobacion.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.MATERNO) %>',0);"><%= PorcentajeAprobacion.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.NOMBRE) %>',0);"><%= PorcentajeAprobacion.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.PeriodosAnalizados.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.PeriodosAnalizados))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.PeriodosAnalizados.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.PeriodosAnalizados) %>',0);"><%= PorcentajeAprobacion.PeriodosAnalizados.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.PeriodosAnalizados.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.PeriodosAnalizados.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.RamosAprobados.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.RamosAprobados))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.RamosAprobados.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.RamosAprobados) %>',0);"><%= PorcentajeAprobacion.RamosAprobados.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.RamosAprobados.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.RamosAprobados.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.RamosTotales.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.RamosTotales))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.RamosTotales.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.RamosTotales) %>',0);"><%= PorcentajeAprobacion.RamosTotales.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.RamosTotales.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.RamosTotales.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PorcentajeAprobacion.Export)) Then %>
<%= PorcentajeAprobacion.PorcentajeAprobacion_1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.PorcentajeAprobacion_1))) Then %>
		<td style="vertical-align: bottom;"><%= PorcentajeAprobacion.PorcentajeAprobacion_1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PorcentajeAprobacion.SortUrl(PorcentajeAprobacion.PorcentajeAprobacion_1) %>',0);"><%= PorcentajeAprobacion.PorcentajeAprobacion_1.FldCaption() %></td><td style="width: 10px;">
		<% If (PorcentajeAprobacion.PorcentajeAprobacion_1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PorcentajeAprobacion.PorcentajeAprobacion_1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		PorcentajeAprobacion_summary.ShowFirstHeader = False
	End If
	PorcentajeAprobacion_summary.RecCount += 1

		' Render detail row
		PorcentajeAprobacion.ResetCSS()
		PorcentajeAprobacion.RowType = EWRPT_ROWTYPE_DETAIL
		PorcentajeAprobacion_summary.RenderRow()
%>
	<tr<%= PorcentajeAprobacion.RowAttributes() %>>
		<td<%= PorcentajeAprobacion.NOMBRE_C.CellAttributes %>>
<div<%= PorcentajeAprobacion.NOMBRE_C.ViewAttributes%>><%= PorcentajeAprobacion.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= PorcentajeAprobacion.RUT.CellAttributes %>>
<div<%= PorcentajeAprobacion.RUT.ViewAttributes%>><%= PorcentajeAprobacion.RUT.ListViewValue%></div>
</td>
		<td<%= PorcentajeAprobacion.DIG.CellAttributes %>>
<div<%= PorcentajeAprobacion.DIG.ViewAttributes%>><%= PorcentajeAprobacion.DIG.ListViewValue%></div>
</td>
		<td<%= PorcentajeAprobacion.PATERNO.CellAttributes %>>
<div<%= PorcentajeAprobacion.PATERNO.ViewAttributes%>><%= PorcentajeAprobacion.PATERNO.ListViewValue%></div>
</td>
		<td<%= PorcentajeAprobacion.MATERNO.CellAttributes %>>
<div<%= PorcentajeAprobacion.MATERNO.ViewAttributes%>><%= PorcentajeAprobacion.MATERNO.ListViewValue%></div>
</td>
		<td<%= PorcentajeAprobacion.NOMBRE.CellAttributes %>>
<div<%= PorcentajeAprobacion.NOMBRE.ViewAttributes%>><%= PorcentajeAprobacion.NOMBRE.ListViewValue%></div>
</td>
		<td<%= PorcentajeAprobacion.PeriodosAnalizados.CellAttributes %>>
<div<%= PorcentajeAprobacion.PeriodosAnalizados.ViewAttributes%>><%= PorcentajeAprobacion.PeriodosAnalizados.ListViewValue%></div>
</td>
		<td<%= PorcentajeAprobacion.RamosAprobados.CellAttributes %>>
<div<%= PorcentajeAprobacion.RamosAprobados.ViewAttributes%>><%= PorcentajeAprobacion.RamosAprobados.ListViewValue%></div>
</td>
		<td<%= PorcentajeAprobacion.RamosTotales.CellAttributes %>>
<div<%= PorcentajeAprobacion.RamosTotales.ViewAttributes%>><%= PorcentajeAprobacion.RamosTotales.ListViewValue%></div>
</td>
		<td<%= PorcentajeAprobacion.PorcentajeAprobacion_1.CellAttributes %>>
<div<%= PorcentajeAprobacion.PorcentajeAprobacion_1.ViewAttributes%>><%= PorcentajeAprobacion.PorcentajeAprobacion_1.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		PorcentajeAprobacion_summary.AccumulateSummary()

		' Get next record
		PorcentajeAprobacion_summary.GetRow() ' ASPXRPT
		PorcentajeAprobacion_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (PorcentajeAprobacion_summary.TotalGrps > 0) Then
	PorcentajeAprobacion.ResetCSS()
	PorcentajeAprobacion.RowType = EWRPT_ROWTYPE_TOTAL
	PorcentajeAprobacion.RowTotalType = EWRPT_ROWTOTAL_GRAND
	PorcentajeAprobacion.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	PorcentajeAprobacion.RowAttrs("class") = "ewRptGrandSummary"
	PorcentajeAprobacion_summary.RenderRow()
%>
	<!-- tr><td colspan="10"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= PorcentajeAprobacion.RowAttributes() %>><td colspan="10"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(PorcentajeAprobacion_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (PorcentajeAprobacion.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If PorcentajeAprobacion_summary.Pager Is Nothing Then PorcentajeAprobacion_summary.Pager = New cPrevNextPager(PorcentajeAprobacion_summary.StartGrp, PorcentajeAprobacion_summary.DisplayGrps, PorcentajeAprobacion_summary.TotalGrps) %>
<% If PorcentajeAprobacion_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If PorcentajeAprobacion_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="PorcentajeAprobacionsmry.aspx?start=<%= PorcentajeAprobacion_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If PorcentajeAprobacion_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="PorcentajeAprobacionsmry.aspx?start=<%= PorcentajeAprobacion_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= PorcentajeAprobacion_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If PorcentajeAprobacion_summary.Pager.NextButton.Enabled Then %>
	<td><a href="PorcentajeAprobacionsmry.aspx?start=<%= PorcentajeAprobacion_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If PorcentajeAprobacion_summary.Pager.LastButton.Enabled Then %>
	<td><a href="PorcentajeAprobacionsmry.aspx?start=<%= PorcentajeAprobacion_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= PorcentajeAprobacion_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= PorcentajeAprobacion_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= PorcentajeAprobacion_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= PorcentajeAprobacion_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If PorcentajeAprobacion_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (PorcentajeAprobacion_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If PorcentajeAprobacion_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="15"<% If PorcentajeAprobacion_summary.DisplayGrps = 15 Then Response.Write(" selected=""selected""") %>>15</option>
<option value="20"<% If PorcentajeAprobacion_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
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
<% If (PorcentajeAprobacion.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (PorcentajeAprobacion.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (PorcentajeAprobacion.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% PorcentajeAprobacion_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (PorcentajeAprobacion.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
