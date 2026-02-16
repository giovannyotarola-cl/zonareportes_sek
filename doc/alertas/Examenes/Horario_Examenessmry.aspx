<%@ Page ClassName="Horario_Examenessmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public Horario_Examenes As crHorario_Examenes = Nothing

	'
	' Table class (for Horario_Examenes)
	'
	Public Class crHorario_Examenes
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
				Return "Horario_Examenes"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Horario_Examenes"
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

		Public ID As crField

		Public FECHA As crField

		Public ANIO As crField

		Public PERIODO As crField

		Public DIA As crField

		Public HORA As crField

		Public CARRERA As crField

		Public JORNADA As crField

		Public CURSO As crField

		Public MODALIDAD As crField

		Public ASIGNATURA As crField

		Public PROFESOR As crField

		Public SECCION As crField

		Public SALA As crField

		Public CAMPUS As crField

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

			' ID
			ID = new crField("Horario_Examenes", "Horario_Examenes", "x_ID", "ID", "[ID]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ID.Page = APage
			ID.ParentPage = APage.ParentPage
			ID.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ID", ID)
			ID.DateFilter = ""
			ID.SqlSelect = ""
			ID.SqlOrderBy = ""

			' FECHA
			FECHA = new crField("Horario_Examenes", "Horario_Examenes", "x_FECHA", "FECHA", "[FECHA]", 200, EWRPT_DATATYPE_STRING, -1)
			FECHA.Page = APage
			FECHA.ParentPage = APage.ParentPage
			Fields.Add("FECHA", FECHA)
			FECHA.DateFilter = ""
			FECHA.SqlSelect = ""
			FECHA.SqlOrderBy = ""

			' ANIO
			ANIO = new crField("Horario_Examenes", "Horario_Examenes", "x_ANIO", "ANIO", "[ANIO]", 200, EWRPT_DATATYPE_STRING, -1)
			ANIO.Page = APage
			ANIO.ParentPage = APage.ParentPage
			Fields.Add("ANIO", ANIO)
			ANIO.DateFilter = ""
			ANIO.SqlSelect = ""
			ANIO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("Horario_Examenes", "Horario_Examenes", "x_PERIODO", "PERIODO", "[PERIODO]", 200, EWRPT_DATATYPE_STRING, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' DIA
			DIA = new crField("Horario_Examenes", "Horario_Examenes", "x_DIA", "DIA", "[DIA]", 200, EWRPT_DATATYPE_STRING, -1)
			DIA.Page = APage
			DIA.ParentPage = APage.ParentPage
			Fields.Add("DIA", DIA)
			DIA.DateFilter = ""
			DIA.SqlSelect = ""
			DIA.SqlOrderBy = ""

			' HORA
			HORA = new crField("Horario_Examenes", "Horario_Examenes", "x_HORA", "HORA", "[HORA]", 200, EWRPT_DATATYPE_STRING, -1)
			HORA.Page = APage
			HORA.ParentPage = APage.ParentPage
			Fields.Add("HORA", HORA)
			HORA.DateFilter = ""
			HORA.SqlSelect = ""
			HORA.SqlOrderBy = ""

			' CARRERA
			CARRERA = new crField("Horario_Examenes", "Horario_Examenes", "x_CARRERA", "CARRERA", "[CARRERA]", 200, EWRPT_DATATYPE_STRING, -1)
			CARRERA.Page = APage
			CARRERA.ParentPage = APage.ParentPage
			Fields.Add("CARRERA", CARRERA)
			CARRERA.DateFilter = ""
			CARRERA.SqlSelect = ""
			CARRERA.SqlOrderBy = ""

			' JORNADA
			JORNADA = new crField("Horario_Examenes", "Horario_Examenes", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			JORNADA.Page = APage
			JORNADA.ParentPage = APage.ParentPage
			Fields.Add("JORNADA", JORNADA)
			JORNADA.DateFilter = ""
			JORNADA.SqlSelect = ""
			JORNADA.SqlOrderBy = ""

			' CURSO
			CURSO = new crField("Horario_Examenes", "Horario_Examenes", "x_CURSO", "CURSO", "[CURSO]", 200, EWRPT_DATATYPE_STRING, -1)
			CURSO.Page = APage
			CURSO.ParentPage = APage.ParentPage
			Fields.Add("CURSO", CURSO)
			CURSO.DateFilter = ""
			CURSO.SqlSelect = ""
			CURSO.SqlOrderBy = ""

			' MODALIDAD
			MODALIDAD = new crField("Horario_Examenes", "Horario_Examenes", "x_MODALIDAD", "MODALIDAD", "[MODALIDAD]", 200, EWRPT_DATATYPE_STRING, -1)
			MODALIDAD.Page = APage
			MODALIDAD.ParentPage = APage.ParentPage
			Fields.Add("MODALIDAD", MODALIDAD)
			MODALIDAD.DateFilter = ""
			MODALIDAD.SqlSelect = ""
			MODALIDAD.SqlOrderBy = ""

			' ASIGNATURA
			ASIGNATURA = new crField("Horario_Examenes", "Horario_Examenes", "x_ASIGNATURA", "ASIGNATURA", "[ASIGNATURA]", 200, EWRPT_DATATYPE_STRING, -1)
			ASIGNATURA.Page = APage
			ASIGNATURA.ParentPage = APage.ParentPage
			Fields.Add("ASIGNATURA", ASIGNATURA)
			ASIGNATURA.DateFilter = ""
			ASIGNATURA.SqlSelect = ""
			ASIGNATURA.SqlOrderBy = ""

			' PROFESOR
			PROFESOR = new crField("Horario_Examenes", "Horario_Examenes", "x_PROFESOR", "PROFESOR", "[PROFESOR]", 200, EWRPT_DATATYPE_STRING, -1)
			PROFESOR.Page = APage
			PROFESOR.ParentPage = APage.ParentPage
			Fields.Add("PROFESOR", PROFESOR)
			PROFESOR.DateFilter = ""
			PROFESOR.SqlSelect = ""
			PROFESOR.SqlOrderBy = ""

			' SECCION
			SECCION = new crField("Horario_Examenes", "Horario_Examenes", "x_SECCION", "SECCION", "[SECCION]", 200, EWRPT_DATATYPE_STRING, -1)
			SECCION.Page = APage
			SECCION.ParentPage = APage.ParentPage
			Fields.Add("SECCION", SECCION)
			SECCION.DateFilter = ""
			SECCION.SqlSelect = ""
			SECCION.SqlOrderBy = ""

			' SALA
			SALA = new crField("Horario_Examenes", "Horario_Examenes", "x_SALA", "SALA", "[SALA]", 200, EWRPT_DATATYPE_STRING, -1)
			SALA.Page = APage
			SALA.ParentPage = APage.ParentPage
			Fields.Add("SALA", SALA)
			SALA.DateFilter = ""
			SALA.SqlSelect = ""
			SALA.SqlOrderBy = ""

			' CAMPUS
			CAMPUS = new crField("Horario_Examenes", "Horario_Examenes", "x_CAMPUS", "CAMPUS", "[CAMPUS]", 200, EWRPT_DATATYPE_STRING, -1)
			CAMPUS.Page = APage
			CAMPUS.ParentPage = APage.ParentPage
			Fields.Add("CAMPUS", CAMPUS)
			CAMPUS.DateFilter = ""
			CAMPUS.SqlSelect = ""
			CAMPUS.SqlOrderBy = ""
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
				Return "[SEK_Horario_Examenes]"
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
	Public Horario_Examenes_summary As crHorario_Examenes_summary

	'
	' Page class
	'
	Public Class crHorario_Examenes_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Horario_Examenes.UseTokenInUrl) Then
				sUrl &= "t=" & Horario_Examenes.TableVar & "&" ' Add page token
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
			If (Horario_Examenes.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Horario_Examenes.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Horario_Examenes.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Horario_Examenessmry 
			Get
				Return CType(m_ParentPage, Horario_Examenessmry)
			End Get
		End Property

		' Table object (Horario_Examenes)
		Public Property Horario_Examenes As crHorario_Examenes 
			Get		
				Return AspNetPage.Horario_Examenes ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crHorario_Examenes)
				AspNetPage.Horario_Examenes = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Horario_Examenes_summary"
			m_PageObjTypeName = "crHorario_Examenes_summary"

			' Table name
			m_TableName = "Horario_Examenes"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Horario_Examenes)
			Horario_Examenes = New crHorario_Examenes(Me)			

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
				Horario_Examenes.Export = ew_Get("export")
			End If
			gsExport = Horario_Examenes.Export ' Get export parameter, used in header
			gsExportFile = Horario_Examenes.TableVar ' Get export file, used in header
			If (Horario_Examenes.Export = "excel") Then
				HttpContext.Current.Response.ContentType = "application/vnd.ms-excel;charset=utf-8"
				HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" & gsExportFile & ".xls")	
			End If
			If (Horario_Examenes.Export = "word") Then
				HttpContext.Current.Response.ContentType = "application/vnd.ms-word;charset=utf-8"
				HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + gsExportFile & ".doc")	
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

		Public Val As Object() = New Object(12) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(12) {}

		Public GrandMn As Object() = New Object(12) {}

		Public GrandMx As Object() = New Object(12) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 13 ' No. of fields
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
			Horario_Examenes.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Horario_Examenes.SqlSelect, Horario_Examenes.SqlWhere, Horario_Examenes.SqlGroupBy, Horario_Examenes.SqlHaving, Horario_Examenes.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Horario_Examenes.ExportAll AndAlso ew_NotEmpty(Horario_Examenes.Export)) Then
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
				Horario_Examenes.ID.DbValue = Row("ID")
				Horario_Examenes.FECHA.DbValue = Row("FECHA")
				Horario_Examenes.ANIO.DbValue = Row("ANIO")
				Horario_Examenes.PERIODO.DbValue = Row("PERIODO")
				Horario_Examenes.DIA.DbValue = Row("DIA")
				Horario_Examenes.HORA.DbValue = Row("HORA")
				Horario_Examenes.CARRERA.DbValue = Row("CARRERA")
				Horario_Examenes.JORNADA.DbValue = Row("JORNADA")
				Horario_Examenes.CURSO.DbValue = Row("CURSO")
				Horario_Examenes.MODALIDAD.DbValue = Row("MODALIDAD")
				Horario_Examenes.ASIGNATURA.DbValue = Row("ASIGNATURA")
				Horario_Examenes.PROFESOR.DbValue = Row("PROFESOR")
				Horario_Examenes.SECCION.DbValue = Row("SECCION")
				Horario_Examenes.SALA.DbValue = Row("SALA")
				Horario_Examenes.CAMPUS.DbValue = Row("CAMPUS")
				Val(1) = Horario_Examenes.FECHA.CurrentValue
				Val(2) = Horario_Examenes.DIA.CurrentValue
				Val(3) = Horario_Examenes.HORA.CurrentValue
				Val(4) = Horario_Examenes.CARRERA.CurrentValue
				Val(5) = Horario_Examenes.JORNADA.CurrentValue
				Val(6) = Horario_Examenes.CURSO.CurrentValue
				Val(7) = Horario_Examenes.MODALIDAD.CurrentValue
				Val(8) = Horario_Examenes.ASIGNATURA.CurrentValue
				Val(9) = Horario_Examenes.PROFESOR.CurrentValue
				Val(10) = Horario_Examenes.SECCION.CurrentValue
				Val(11) = Horario_Examenes.SALA.CurrentValue
				Val(12) = Horario_Examenes.CAMPUS.CurrentValue
			Else
				Horario_Examenes.ID.DbValue = ""
				Horario_Examenes.FECHA.DbValue = ""
				Horario_Examenes.ANIO.DbValue = ""
				Horario_Examenes.PERIODO.DbValue = ""
				Horario_Examenes.DIA.DbValue = ""
				Horario_Examenes.HORA.DbValue = ""
				Horario_Examenes.CARRERA.DbValue = ""
				Horario_Examenes.JORNADA.DbValue = ""
				Horario_Examenes.CURSO.DbValue = ""
				Horario_Examenes.MODALIDAD.DbValue = ""
				Horario_Examenes.ASIGNATURA.DbValue = ""
				Horario_Examenes.PROFESOR.DbValue = ""
				Horario_Examenes.SECCION.DbValue = ""
				Horario_Examenes.SALA.DbValue = ""
				Horario_Examenes.CAMPUS.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Horario_Examenes.ID.DbValue = dr("ID")
				Horario_Examenes.FECHA.DbValue = dr("FECHA")
				Horario_Examenes.ANIO.DbValue = dr("ANIO")
				Horario_Examenes.PERIODO.DbValue = dr("PERIODO")
				Horario_Examenes.DIA.DbValue = dr("DIA")
				Horario_Examenes.HORA.DbValue = dr("HORA")
				Horario_Examenes.CARRERA.DbValue = dr("CARRERA")
				Horario_Examenes.JORNADA.DbValue = dr("JORNADA")
				Horario_Examenes.CURSO.DbValue = dr("CURSO")
				Horario_Examenes.MODALIDAD.DbValue = dr("MODALIDAD")
				Horario_Examenes.ASIGNATURA.DbValue = dr("ASIGNATURA")
				Horario_Examenes.PROFESOR.DbValue = dr("PROFESOR")
				Horario_Examenes.SECCION.DbValue = dr("SECCION")
				Horario_Examenes.SALA.DbValue = dr("SALA")
				Horario_Examenes.CAMPUS.DbValue = dr("CAMPUS")
				Val(1) = Horario_Examenes.FECHA.CurrentValue
				Val(2) = Horario_Examenes.DIA.CurrentValue
				Val(3) = Horario_Examenes.HORA.CurrentValue
				Val(4) = Horario_Examenes.CARRERA.CurrentValue
				Val(5) = Horario_Examenes.JORNADA.CurrentValue
				Val(6) = Horario_Examenes.CURSO.CurrentValue
				Val(7) = Horario_Examenes.MODALIDAD.CurrentValue
				Val(8) = Horario_Examenes.ASIGNATURA.CurrentValue
				Val(9) = Horario_Examenes.PROFESOR.CurrentValue
				Val(10) = Horario_Examenes.SECCION.CurrentValue
				Val(11) = Horario_Examenes.SALA.CurrentValue
				Val(12) = Horario_Examenes.CAMPUS.CurrentValue
			Else				
				Horario_Examenes.ID.DbValue = ""
				Horario_Examenes.FECHA.DbValue = ""
				Horario_Examenes.ANIO.DbValue = ""
				Horario_Examenes.PERIODO.DbValue = ""
				Horario_Examenes.DIA.DbValue = ""
				Horario_Examenes.HORA.DbValue = ""
				Horario_Examenes.CARRERA.DbValue = ""
				Horario_Examenes.JORNADA.DbValue = ""
				Horario_Examenes.CURSO.DbValue = ""
				Horario_Examenes.MODALIDAD.DbValue = ""
				Horario_Examenes.ASIGNATURA.DbValue = ""
				Horario_Examenes.PROFESOR.DbValue = ""
				Horario_Examenes.SECCION.DbValue = ""
				Horario_Examenes.SALA.DbValue = ""
				Horario_Examenes.CAMPUS.DbValue = ""
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
				Horario_Examenes.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Horario_Examenes.StartGroup = StartGrp
				Else
					StartGrp = Horario_Examenes.StartGroup
				End If
			Else
				StartGrp = Horario_Examenes.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Horario_Examenes.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Horario_Examenes.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Horario_Examenes.StartGroup = StartGrp
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
			Horario_Examenes.StartGroup = StartGrp
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
				Horario_Examenes.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Horario_Examenes.StartGroup = StartGrp
			Else				
				If (Horario_Examenes.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Horario_Examenes.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Horario_Examenes.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Horario_Examenes.SqlSelectCount, Horario_Examenes.SqlWhere, Horario_Examenes.SqlGroupBy, Horario_Examenes.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Horario_Examenes.Row_Rendering()

			'
			' Render view codes
			'

			If (Horario_Examenes.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' FECHA
				Horario_Examenes.FECHA.ViewValue = Convert.ToString(Horario_Examenes.FECHA.Summary)

				' DIA
				Horario_Examenes.DIA.ViewValue = Convert.ToString(Horario_Examenes.DIA.Summary)

				' HORA
				Horario_Examenes.HORA.ViewValue = Convert.ToString(Horario_Examenes.HORA.Summary)

				' CARRERA
				Horario_Examenes.CARRERA.ViewValue = Convert.ToString(Horario_Examenes.CARRERA.Summary)
				Horario_Examenes.CARRERA.ViewAttrs("style") = "font-weight:bold;text-align:left;"

				' JORNADA
				Horario_Examenes.JORNADA.ViewValue = Convert.ToString(Horario_Examenes.JORNADA.Summary)

				' CURSO
				Horario_Examenes.CURSO.ViewValue = Convert.ToString(Horario_Examenes.CURSO.Summary)
				Horario_Examenes.CURSO.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' MODALIDAD
				Horario_Examenes.MODALIDAD.ViewValue = Convert.ToString(Horario_Examenes.MODALIDAD.Summary)

				' ASIGNATURA
				Horario_Examenes.ASIGNATURA.ViewValue = Convert.ToString(Horario_Examenes.ASIGNATURA.Summary)
				Horario_Examenes.ASIGNATURA.ViewAttrs("style") = "font-weight:bold;text-align:left;"

				' PROFESOR
				Horario_Examenes.PROFESOR.ViewValue = Convert.ToString(Horario_Examenes.PROFESOR.Summary)

				' SECCION
				Horario_Examenes.SECCION.ViewValue = Convert.ToString(Horario_Examenes.SECCION.Summary)
				Horario_Examenes.SECCION.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' SALA
				Horario_Examenes.SALA.ViewValue = Convert.ToString(Horario_Examenes.SALA.Summary)
				Horario_Examenes.SALA.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' CAMPUS
				Horario_Examenes.CAMPUS.ViewValue = Convert.ToString(Horario_Examenes.CAMPUS.Summary)
			Else

				' FECHA
				Horario_Examenes.FECHA.ViewValue = Convert.ToString(Horario_Examenes.FECHA.CurrentValue)
				Horario_Examenes.FECHA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIA
				Horario_Examenes.DIA.ViewValue = Convert.ToString(Horario_Examenes.DIA.CurrentValue)
				Horario_Examenes.DIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' HORA
				Horario_Examenes.HORA.ViewValue = Convert.ToString(Horario_Examenes.HORA.CurrentValue)
				Horario_Examenes.HORA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CARRERA
				Horario_Examenes.CARRERA.ViewValue = Convert.ToString(Horario_Examenes.CARRERA.CurrentValue)
				Horario_Examenes.CARRERA.ViewAttrs("style") = "font-weight:bold;text-align:left;"
				Horario_Examenes.CARRERA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' JORNADA
				Horario_Examenes.JORNADA.ViewValue = Convert.ToString(Horario_Examenes.JORNADA.CurrentValue)
				Horario_Examenes.JORNADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CURSO
				Horario_Examenes.CURSO.ViewValue = Convert.ToString(Horario_Examenes.CURSO.CurrentValue)
				Horario_Examenes.CURSO.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Horario_Examenes.CURSO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MODALIDAD
				Horario_Examenes.MODALIDAD.ViewValue = Convert.ToString(Horario_Examenes.MODALIDAD.CurrentValue)
				Horario_Examenes.MODALIDAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ASIGNATURA
				Horario_Examenes.ASIGNATURA.ViewValue = Convert.ToString(Horario_Examenes.ASIGNATURA.CurrentValue)
				Horario_Examenes.ASIGNATURA.ViewAttrs("style") = "font-weight:bold;text-align:left;"
				Horario_Examenes.ASIGNATURA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PROFESOR
				Horario_Examenes.PROFESOR.ViewValue = Convert.ToString(Horario_Examenes.PROFESOR.CurrentValue)
				Horario_Examenes.PROFESOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SECCION
				Horario_Examenes.SECCION.ViewValue = Convert.ToString(Horario_Examenes.SECCION.CurrentValue)
				Horario_Examenes.SECCION.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Horario_Examenes.SECCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SALA
				Horario_Examenes.SALA.ViewValue = Convert.ToString(Horario_Examenes.SALA.CurrentValue)
				Horario_Examenes.SALA.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Horario_Examenes.SALA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CAMPUS
				Horario_Examenes.CAMPUS.ViewValue = Convert.ToString(Horario_Examenes.CAMPUS.CurrentValue)
				Horario_Examenes.CAMPUS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' FECHA
			Horario_Examenes.FECHA.HrefValue = ""

			' DIA
			Horario_Examenes.DIA.HrefValue = ""

			' HORA
			Horario_Examenes.HORA.HrefValue = ""

			' CARRERA
			Horario_Examenes.CARRERA.HrefValue = ""

			' JORNADA
			Horario_Examenes.JORNADA.HrefValue = ""

			' CURSO
			Horario_Examenes.CURSO.HrefValue = ""

			' MODALIDAD
			Horario_Examenes.MODALIDAD.HrefValue = ""

			' ASIGNATURA
			Horario_Examenes.ASIGNATURA.HrefValue = ""

			' PROFESOR
			Horario_Examenes.PROFESOR.HrefValue = ""

			' SECCION
			Horario_Examenes.SECCION.HrefValue = ""

			' SALA
			Horario_Examenes.SALA.HrefValue = ""

			' CAMPUS
			Horario_Examenes.CAMPUS.HrefValue = ""

			' Call Row_Rendered event
			Horario_Examenes.Row_Rendered()
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

			' Field CARRERA
			sSelect = "SELECT DISTINCT [CARRERA] FROM " + Horario_Examenes.SqlFrom
			sOrderBy = "[CARRERA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Horario_Examenes.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Horario_Examenes.CARRERA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field JORNADA
			sSelect = "SELECT DISTINCT [JORNADA] FROM " + Horario_Examenes.SqlFrom
			sOrderBy = "[JORNADA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Horario_Examenes.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Horario_Examenes.JORNADA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CURSO
			sSelect = "SELECT DISTINCT [CURSO] FROM " + Horario_Examenes.SqlFrom
			sOrderBy = "[CURSO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Horario_Examenes.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Horario_Examenes.CURSO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field MODALIDAD
			sSelect = "SELECT DISTINCT [MODALIDAD] FROM " + Horario_Examenes.SqlFrom
			sOrderBy = "[MODALIDAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Horario_Examenes.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Horario_Examenes.MODALIDAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ASIGNATURA
			sSelect = "SELECT DISTINCT [ASIGNATURA] FROM " + Horario_Examenes.SqlFrom
			sOrderBy = "[ASIGNATURA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Horario_Examenes.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Horario_Examenes.ASIGNATURA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PROFESOR
			sSelect = "SELECT DISTINCT [PROFESOR] FROM " + Horario_Examenes.SqlFrom
			sOrderBy = "[PROFESOR] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Horario_Examenes.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Horario_Examenes.PROFESOR.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field SECCION
			sSelect = "SELECT DISTINCT [SECCION] FROM " + Horario_Examenes.SqlFrom
			sOrderBy = "[SECCION] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Horario_Examenes.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Horario_Examenes.SECCION.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CAMPUS
			sSelect = "SELECT DISTINCT [CAMPUS] FROM " + Horario_Examenes.SqlFrom
			sOrderBy = "[CAMPUS] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Horario_Examenes.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Horario_Examenes.CAMPUS.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field CARRERA
				SetSessionDropDownValue(Horario_Examenes.CARRERA.DropDownValue, Horario_Examenes.CARRERA)

				' Field JORNADA
				SetSessionDropDownValue(Horario_Examenes.JORNADA.DropDownValue, Horario_Examenes.JORNADA)

				' Field CURSO
				SetSessionDropDownValue(Horario_Examenes.CURSO.DropDownValue, Horario_Examenes.CURSO)

				' Field MODALIDAD
				SetSessionDropDownValue(Horario_Examenes.MODALIDAD.DropDownValue, Horario_Examenes.MODALIDAD)

				' Field ASIGNATURA
				SetSessionDropDownValue(Horario_Examenes.ASIGNATURA.DropDownValue, Horario_Examenes.ASIGNATURA)

				' Field PROFESOR
				SetSessionDropDownValue(Horario_Examenes.PROFESOR.DropDownValue, Horario_Examenes.PROFESOR)

				' Field SECCION
				SetSessionDropDownValue(Horario_Examenes.SECCION.DropDownValue, Horario_Examenes.SECCION)

				' Field CAMPUS
				SetSessionDropDownValue(Horario_Examenes.CAMPUS.DropDownValue, Horario_Examenes.CAMPUS)
			bSetupFilter = True ' Set up filter required
		Else

				' Field CARRERA
				If (GetDropDownValue(Horario_Examenes.CARRERA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Horario_Examenes.CARRERA.DropDownValue) Then
					If Not ew_SameStr(Horario_Examenes.CARRERA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Horario_Examenes_CARRERA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field JORNADA
				If (GetDropDownValue(Horario_Examenes.JORNADA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Horario_Examenes.JORNADA.DropDownValue) Then
					If Not ew_SameStr(Horario_Examenes.JORNADA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Horario_Examenes_JORNADA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CURSO
				If (GetDropDownValue(Horario_Examenes.CURSO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Horario_Examenes.CURSO.DropDownValue) Then
					If Not ew_SameStr(Horario_Examenes.CURSO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Horario_Examenes_CURSO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field MODALIDAD
				If (GetDropDownValue(Horario_Examenes.MODALIDAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Horario_Examenes.MODALIDAD.DropDownValue) Then
					If Not ew_SameStr(Horario_Examenes.MODALIDAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Horario_Examenes_MODALIDAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ASIGNATURA
				If (GetDropDownValue(Horario_Examenes.ASIGNATURA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Horario_Examenes.ASIGNATURA.DropDownValue) Then
					If Not ew_SameStr(Horario_Examenes.ASIGNATURA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Horario_Examenes_ASIGNATURA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PROFESOR
				If (GetDropDownValue(Horario_Examenes.PROFESOR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Horario_Examenes.PROFESOR.DropDownValue) Then
					If Not ew_SameStr(Horario_Examenes.PROFESOR.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Horario_Examenes_PROFESOR") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field SECCION
				If (GetDropDownValue(Horario_Examenes.SECCION)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Horario_Examenes.SECCION.DropDownValue) Then
					If Not ew_SameStr(Horario_Examenes.SECCION.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Horario_Examenes_SECCION") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CAMPUS
				If (GetDropDownValue(Horario_Examenes.CAMPUS)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Horario_Examenes.CAMPUS.DropDownValue) Then
					If Not ew_SameStr(Horario_Examenes.CAMPUS.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Horario_Examenes_CAMPUS") Is Nothing Then
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

			' Field CARRERA
			GetSessionDropDownValue(Horario_Examenes.CARRERA)

			' Field JORNADA
			GetSessionDropDownValue(Horario_Examenes.JORNADA)

			' Field CURSO
			GetSessionDropDownValue(Horario_Examenes.CURSO)

			' Field MODALIDAD
			GetSessionDropDownValue(Horario_Examenes.MODALIDAD)

			' Field ASIGNATURA
			GetSessionDropDownValue(Horario_Examenes.ASIGNATURA)

			' Field PROFESOR
			GetSessionDropDownValue(Horario_Examenes.PROFESOR)

			' Field SECCION
			GetSessionDropDownValue(Horario_Examenes.SECCION)

			' Field CAMPUS
			GetSessionDropDownValue(Horario_Examenes.CAMPUS)
		End If

		' Call page filter validated event
		Horario_Examenes.Page_FilterValidated()

		' Build SQL
		' Field CARRERA

		BuildDropDownFilter(Horario_Examenes.CARRERA, sFilter, "")

		' Field JORNADA
		BuildDropDownFilter(Horario_Examenes.JORNADA, sFilter, "")

		' Field CURSO
		BuildDropDownFilter(Horario_Examenes.CURSO, sFilter, "")

		' Field MODALIDAD
		BuildDropDownFilter(Horario_Examenes.MODALIDAD, sFilter, "")

		' Field ASIGNATURA
		BuildDropDownFilter(Horario_Examenes.ASIGNATURA, sFilter, "")

		' Field PROFESOR
		BuildDropDownFilter(Horario_Examenes.PROFESOR, sFilter, "")

		' Field SECCION
		BuildDropDownFilter(Horario_Examenes.SECCION, sFilter, "")

		' Field CAMPUS
		BuildDropDownFilter(Horario_Examenes.CAMPUS, sFilter, "")

		' Save parms to Session
		' Field CARRERA

		SetSessionDropDownValue(Horario_Examenes.CARRERA.DropDownValue, Horario_Examenes.CARRERA)

		' Field JORNADA
		SetSessionDropDownValue(Horario_Examenes.JORNADA.DropDownValue, Horario_Examenes.JORNADA)

		' Field CURSO
		SetSessionDropDownValue(Horario_Examenes.CURSO.DropDownValue, Horario_Examenes.CURSO)

		' Field MODALIDAD
		SetSessionDropDownValue(Horario_Examenes.MODALIDAD.DropDownValue, Horario_Examenes.MODALIDAD)

		' Field ASIGNATURA
		SetSessionDropDownValue(Horario_Examenes.ASIGNATURA.DropDownValue, Horario_Examenes.ASIGNATURA)

		' Field PROFESOR
		SetSessionDropDownValue(Horario_Examenes.PROFESOR.DropDownValue, Horario_Examenes.PROFESOR)

		' Field SECCION
		SetSessionDropDownValue(Horario_Examenes.SECCION.DropDownValue, Horario_Examenes.SECCION)

		' Field CAMPUS
		SetSessionDropDownValue(Horario_Examenes.CAMPUS.DropDownValue, Horario_Examenes.CAMPUS)

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
		If ew_Session("sv_Horario_Examenes_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Horario_Examenes_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Horario_Examenes_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Horario_Examenes_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Horario_Examenes_" + parm)
		End If
		If ew_Session("so1_Horario_Examenes_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Horario_Examenes_" + parm))
		End If
		If ew_Session("sc_Horario_Examenes_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Horario_Examenes_" + parm))
		End If
		If ew_Session("sv2_Horario_Examenes_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Horario_Examenes_" + parm)
		End If
		If ew_Session("so2_Horario_Examenes_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Horario_Examenes_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Horario_Examenes_" + parm) = fld.SearchValue
		ew_Session("so1_Horario_Examenes_" + parm) = fld.SearchOperator
		ew_Session("sc_Horario_Examenes_" + parm) = fld.SearchCondition
		ew_Session("sv2_Horario_Examenes_" + parm) = fld.SearchValue2
		ew_Session("so2_Horario_Examenes_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Horario_Examenes_" + parm) = ""
		ew_Session("so1_Horario_Examenes_" + parm) = "="
		ew_Session("sc_Horario_Examenes_" + parm) = "AND"
		ew_Session("sv2_Horario_Examenes_" + parm) = ""
		ew_Session("so2_Horario_Examenes_" + parm) = "="
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
		ew_Session("sel_Horario_Examenes_" & parm) = ""
		ew_Session("rf_Horario_Examenes_" & parm) = ""
		ew_Session("rt_Horario_Examenes_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Horario_Examenes.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Horario_Examenes_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Horario_Examenes_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Horario_Examenes_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field CARRERA

			Horario_Examenes.CARRERA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Horario_Examenes.CARRERA.DropDownValue = Horario_Examenes.CARRERA.DefaultDropDownValue

			' Field JORNADA
			Horario_Examenes.JORNADA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Horario_Examenes.JORNADA.DropDownValue = Horario_Examenes.JORNADA.DefaultDropDownValue

			' Field CURSO
			Horario_Examenes.CURSO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Horario_Examenes.CURSO.DropDownValue = Horario_Examenes.CURSO.DefaultDropDownValue

			' Field MODALIDAD
			Horario_Examenes.MODALIDAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			Horario_Examenes.MODALIDAD.DropDownValue = Horario_Examenes.MODALIDAD.DefaultDropDownValue

			' Field ASIGNATURA
			Horario_Examenes.ASIGNATURA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Horario_Examenes.ASIGNATURA.DropDownValue = Horario_Examenes.ASIGNATURA.DefaultDropDownValue

			' Field PROFESOR
			Horario_Examenes.PROFESOR.DefaultDropDownValue = EWRPT_INIT_VALUE
			Horario_Examenes.PROFESOR.DropDownValue = Horario_Examenes.PROFESOR.DefaultDropDownValue

			' Field SECCION
			Horario_Examenes.SECCION.DefaultDropDownValue = EWRPT_INIT_VALUE
			Horario_Examenes.SECCION.DropDownValue = Horario_Examenes.SECCION.DefaultDropDownValue

			' Field CAMPUS
			Horario_Examenes.CAMPUS.DefaultDropDownValue = EWRPT_INIT_VALUE
			Horario_Examenes.CAMPUS.DropDownValue = Horario_Examenes.CAMPUS.DefaultDropDownValue

		' Set up default values for extended filters
		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check CARRERA dropdown filter
		If (NonTextFilterApplied(Horario_Examenes.CARRERA)) Then bFilterExist = True

		' Check JORNADA dropdown filter
		If (NonTextFilterApplied(Horario_Examenes.JORNADA)) Then bFilterExist = True

		' Check CURSO dropdown filter
		If (NonTextFilterApplied(Horario_Examenes.CURSO)) Then bFilterExist = True

		' Check MODALIDAD dropdown filter
		If (NonTextFilterApplied(Horario_Examenes.MODALIDAD)) Then bFilterExist = True

		' Check ASIGNATURA dropdown filter
		If (NonTextFilterApplied(Horario_Examenes.ASIGNATURA)) Then bFilterExist = True

		' Check PROFESOR dropdown filter
		If (NonTextFilterApplied(Horario_Examenes.PROFESOR)) Then bFilterExist = True

		' Check SECCION dropdown filter
		If (NonTextFilterApplied(Horario_Examenes.SECCION)) Then bFilterExist = True

		' Check CAMPUS dropdown filter
		If (NonTextFilterApplied(Horario_Examenes.CAMPUS)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field CARRERA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Horario_Examenes.CARRERA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Horario_Examenes.CARRERA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field JORNADA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Horario_Examenes.JORNADA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Horario_Examenes.JORNADA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CURSO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Horario_Examenes.CURSO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Horario_Examenes.CURSO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MODALIDAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Horario_Examenes.MODALIDAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Horario_Examenes.MODALIDAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ASIGNATURA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Horario_Examenes.ASIGNATURA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Horario_Examenes.ASIGNATURA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PROFESOR
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Horario_Examenes.PROFESOR, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Horario_Examenes.PROFESOR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field SECCION
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Horario_Examenes.SECCION, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Horario_Examenes.SECCION.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CAMPUS
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Horario_Examenes.CAMPUS, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Horario_Examenes.CAMPUS.FldCaption() & "<br>"
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
				Horario_Examenes.OrderBy = ""
				Horario_Examenes.StartGroup = 1
				Horario_Examenes.FECHA.Sort = ""
				Horario_Examenes.DIA.Sort = ""
				Horario_Examenes.HORA.Sort = ""
				Horario_Examenes.CARRERA.Sort = ""
				Horario_Examenes.JORNADA.Sort = ""
				Horario_Examenes.CURSO.Sort = ""
				Horario_Examenes.MODALIDAD.Sort = ""
				Horario_Examenes.ASIGNATURA.Sort = ""
				Horario_Examenes.PROFESOR.Sort = ""
				Horario_Examenes.SECCION.Sort = ""
				Horario_Examenes.SALA.Sort = ""
				Horario_Examenes.CAMPUS.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Horario_Examenes.CurrentOrder = ew_Get("order")
			Horario_Examenes.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Horario_Examenes.SortSql()
			Horario_Examenes.OrderBy = sSortSql
			Horario_Examenes.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Horario_Examenes.OrderBy)) Then
			Horario_Examenes.OrderBy = "[FECHA] ASC"
			Horario_Examenes.FECHA.Sort = "ASC"
		End If
		Return Horario_Examenes.OrderBy
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
		Horario_Examenes_summary = New crHorario_Examenes_summary(Me)
		Horario_Examenes_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Horario_Examenes_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Horario_Examenes_summary IsNot Nothing) Then Horario_Examenes_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Horario_Examenes.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Horario_Examenes_summary = new ewrpt_Page("Horario_Examenes_summary");
// page properties
Horario_Examenes_summary.PageID = "summary"; // page ID
Horario_Examenes_summary.FormID = "fHorario_Examenessummaryfilter"; // form ID
var EWRPT_PAGE_ID = Horario_Examenes_summary.PageID;
// extend page with ValidateForm function
Horario_Examenes_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Horario_Examenes_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Horario_Examenes_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Horario_Examenes_summary.ValidateRequired = false; // no JavaScript validation
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
<% Horario_Examenes_summary.ShowPageHeader() %>
<% If (Horario_Examenes.Export = "" OrElse Horario_Examenes.Export = "print" OrElse Horario_Examenes.Export = "email") Then %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% End If %>
<% If (Horario_Examenes.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Horario_Examenes.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<% If (Horario_Examenes.Export = "" OrElse Horario_Examenes.Export = "print" OrElse Horario_Examenes.Export = "email") Then %>
<% End If %>
<div class="ewTitle"><%= Horario_Examenes.TableCaption() %>
<% If (Horario_Examenes.Export = "") Then %>
&nbsp;&nbsp;<!--<a href="<%= Horario_Examenes_summary.ExportPrintUrl %>"><%= ReportLanguage.Phrase("PrinterFriendly") %></a>-->
&nbsp;&nbsp;<a href="<%= Horario_Examenes_summary.ExportExcelUrl %>"><%= ReportLanguage.Phrase("ExportToExcel") %></a>
&nbsp;&nbsp;<a href="<%= Horario_Examenes_summary.ExportWordUrl %>"><%= ReportLanguage.Phrase("ExportToWord") %></a>
<% If (Horario_Examenes_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="Horario_Examenessmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% Horario_Examenes_summary.ShowMessage() %>
<% If (Horario_Examenes.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Horario_Examenes.Export = "" OrElse Horario_Examenes.Export = "print" OrElse Horario_Examenes.Export = "email") Then %>
<% End If %>
<% If (Horario_Examenes.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (Horario_Examenes.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (Horario_Examenes.FilterPanelOption = 2 OrElse (Horario_Examenes.FilterPanelOption = 3 AndAlso Horario_Examenes_summary.FilterApplied) OrElse Horario_Examenes_summary.Filter = "0=101") Then
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
<form name="fHorario_Examenessummaryfilter" id="fHorario_Examenessummaryfilter" action="Horario_Examenessmry.aspx" class="ewForm" onsubmit="return Horario_Examenes_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Horario_Examenes.FECHA.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Horario_Examenes.CARRERA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CARRERA" id="sv_CARRERA"<%= IIf(Horario_Examenes_summary.ClearExtFilter = "Horario_Examenes_CARRERA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.CARRERA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Horario_Examenes.CARRERA.CustomFilters.Count + Horario_Examenes.CARRERA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Horario_Examenes.CARRERA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CARRERA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.CARRERA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Horario_Examenes.CARRERA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.CARRERA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Horario_Examenes.JORNADA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_JORNADA" id="sv_JORNADA"<%= IIf(Horario_Examenes_summary.ClearExtFilter = "Horario_Examenes_JORNADA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.JORNADA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Horario_Examenes.JORNADA.CustomFilters.Count + Horario_Examenes.JORNADA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Horario_Examenes.JORNADA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "JORNADA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.JORNADA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Horario_Examenes.JORNADA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.JORNADA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Horario_Examenes.CURSO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CURSO" id="sv_CURSO"<%= IIf(Horario_Examenes_summary.ClearExtFilter = "Horario_Examenes_CURSO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.CURSO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Horario_Examenes.CURSO.CustomFilters.Count + Horario_Examenes.CURSO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Horario_Examenes.CURSO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CURSO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.CURSO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Horario_Examenes.CURSO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.CURSO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Horario_Examenes.MODALIDAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_MODALIDAD" id="sv_MODALIDAD"<%= IIf(Horario_Examenes_summary.ClearExtFilter = "Horario_Examenes_MODALIDAD", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.MODALIDAD.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Horario_Examenes.MODALIDAD.CustomFilters.Count + Horario_Examenes.MODALIDAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Horario_Examenes.MODALIDAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "MODALIDAD")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.MODALIDAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Horario_Examenes.MODALIDAD.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.MODALIDAD.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Horario_Examenes.ASIGNATURA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ASIGNATURA" id="sv_ASIGNATURA"<%= IIf(Horario_Examenes_summary.ClearExtFilter = "Horario_Examenes_ASIGNATURA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.ASIGNATURA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Horario_Examenes.ASIGNATURA.CustomFilters.Count + Horario_Examenes.ASIGNATURA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Horario_Examenes.ASIGNATURA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ASIGNATURA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.ASIGNATURA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Horario_Examenes.ASIGNATURA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.ASIGNATURA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Horario_Examenes.PROFESOR.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PROFESOR" id="sv_PROFESOR"<%= IIf(Horario_Examenes_summary.ClearExtFilter = "Horario_Examenes_PROFESOR", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.PROFESOR.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Horario_Examenes.PROFESOR.CustomFilters.Count + Horario_Examenes.PROFESOR.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Horario_Examenes.PROFESOR.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PROFESOR")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.PROFESOR.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Horario_Examenes.PROFESOR.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.PROFESOR.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Horario_Examenes.SECCION.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_SECCION" id="sv_SECCION"<%= IIf(Horario_Examenes_summary.ClearExtFilter = "Horario_Examenes_SECCION", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.SECCION.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Horario_Examenes.SECCION.CustomFilters.Count + Horario_Examenes.SECCION.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Horario_Examenes.SECCION.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "SECCION")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.SECCION.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Horario_Examenes.SECCION.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.SECCION.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Horario_Examenes.CAMPUS.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CAMPUS" id="sv_CAMPUS"<%= IIf(Horario_Examenes_summary.ClearExtFilter = "Horario_Examenes_CAMPUS", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.CAMPUS.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Horario_Examenes.CAMPUS.CustomFilters.Count + Horario_Examenes.CAMPUS.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Horario_Examenes.CAMPUS.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CAMPUS")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.CAMPUS.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Horario_Examenes.CAMPUS.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Horario_Examenes.CAMPUS.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (Horario_Examenes.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Horario_Examenes_summary.ShowFilterList() %>
</div>
<br>
<% End If %>
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<% If (Horario_Examenes.Export = "") Then %>
<div class="ewGridUpperPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Horario_Examenes_summary.Pager Is Nothing Then Horario_Examenes_summary.Pager = New cPrevNextPager(Horario_Examenes_summary.StartGrp, Horario_Examenes_summary.DisplayGrps, Horario_Examenes_summary.TotalGrps) %>
<% If Horario_Examenes_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Horario_Examenes_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Horario_Examenessmry.aspx?start=<%= Horario_Examenes_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Horario_Examenes_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Horario_Examenessmry.aspx?start=<%= Horario_Examenes_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Horario_Examenes_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Horario_Examenes_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Horario_Examenessmry.aspx?start=<%= Horario_Examenes_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Horario_Examenes_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Horario_Examenessmry.aspx?start=<%= Horario_Examenes_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Horario_Examenes_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Horario_Examenes_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Horario_Examenes_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Horario_Examenes_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Horario_Examenes_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Horario_Examenes_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Horario_Examenes_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="30"<% If Horario_Examenes_summary.DisplayGrps = 30 Then Response.Write(" selected=""selected""") %>>30</option>
<option value="50"<% If Horario_Examenes_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
</select>
		</span></td>
<% End If %>
	</tr>
</table>
</form>
</div>
<% End If %>
<!-- Report Grid (Begin) -->
<div class="ewGridMiddlePanel">
<table class="ewTable ewTableSeparate" cellspacing="0">
<%

' Set the last group to display if not export all
If (Horario_Examenes.ExportAll AndAlso ew_NotEmpty(Horario_Examenes.Export)) Then
	Horario_Examenes_summary.StopGrp = Horario_Examenes_summary.TotalGrps
Else
	Horario_Examenes_summary.StopGrp = Horario_Examenes_summary.StartGrp + Horario_Examenes_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Horario_Examenes_summary.StopGrp > Horario_Examenes_summary.TotalGrps) Then
	Horario_Examenes_summary.StopGrp = Horario_Examenes_summary.TotalGrps
End If
Horario_Examenes_summary.RecCount = 0

' Get first row
If (Horario_Examenes_summary.TotalGrps > 0) Then
	Horario_Examenes_summary.GetRow() ' ASPXRPT
	Horario_Examenes_summary.GrpCount = 1
End If
While ((Horario_Examenes_summary.HasRow AndAlso Horario_Examenes_summary.GrpIndex < Horario_Examenes_summary.StopGrp) OrElse Horario_Examenes_summary.ShowFirstHeader)

	' Show header
	If (Horario_Examenes_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.FECHA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.FECHA))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.FECHA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.FECHA) %>',0);"><%= Horario_Examenes.FECHA.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.FECHA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.FECHA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.DIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.DIA))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.DIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.DIA) %>',0);"><%= Horario_Examenes.DIA.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.DIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.DIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.HORA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.HORA))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.HORA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.HORA) %>',0);"><%= Horario_Examenes.HORA.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.HORA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.HORA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.CARRERA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.CARRERA))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.CARRERA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.CARRERA) %>',0);"><%= Horario_Examenes.CARRERA.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.CARRERA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.CARRERA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.JORNADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.JORNADA))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.JORNADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.JORNADA) %>',0);"><%= Horario_Examenes.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.JORNADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.JORNADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.CURSO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.CURSO))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.CURSO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.CURSO) %>',0);"><%= Horario_Examenes.CURSO.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.CURSO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.CURSO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.MODALIDAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.MODALIDAD))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.MODALIDAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.MODALIDAD) %>',0);"><%= Horario_Examenes.MODALIDAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.MODALIDAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.MODALIDAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.ASIGNATURA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.ASIGNATURA))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.ASIGNATURA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.ASIGNATURA) %>',0);"><%= Horario_Examenes.ASIGNATURA.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.ASIGNATURA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.ASIGNATURA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.PROFESOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.PROFESOR))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.PROFESOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.PROFESOR) %>',0);"><%= Horario_Examenes.PROFESOR.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.PROFESOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.PROFESOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.SECCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.SECCION))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.SECCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.SECCION) %>',0);"><%= Horario_Examenes.SECCION.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.SECCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.SECCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.SALA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.SALA))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.SALA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.SALA) %>',0);"><%= Horario_Examenes.SALA.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.SALA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.SALA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Horario_Examenes.Export)) Then %>
<%= Horario_Examenes.CAMPUS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Horario_Examenes.SortUrl(Horario_Examenes.CAMPUS))) Then %>
		<td style="vertical-align: bottom;"><%= Horario_Examenes.CAMPUS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Horario_Examenes.SortUrl(Horario_Examenes.CAMPUS) %>',0);"><%= Horario_Examenes.CAMPUS.FldCaption() %></td><td style="width: 10px;">
		<% If (Horario_Examenes.CAMPUS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Horario_Examenes.CAMPUS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Horario_Examenes_summary.ShowFirstHeader = False
	End If
	Horario_Examenes_summary.RecCount += 1

		' Render detail row
		Horario_Examenes.ResetCSS()
		Horario_Examenes.RowType = EWRPT_ROWTYPE_DETAIL
		Horario_Examenes_summary.RenderRow()
%>
	<tr<%= Horario_Examenes.RowAttributes() %>>
		<td<%= Horario_Examenes.FECHA.CellAttributes %>>
<div<%= Horario_Examenes.FECHA.ViewAttributes%>><%= Horario_Examenes.FECHA.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.DIA.CellAttributes %>>
<div<%= Horario_Examenes.DIA.ViewAttributes%>><%= Horario_Examenes.DIA.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.HORA.CellAttributes %>>
<div<%= Horario_Examenes.HORA.ViewAttributes%>><%= Horario_Examenes.HORA.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.CARRERA.CellAttributes %>>
<div<%= Horario_Examenes.CARRERA.ViewAttributes%>><%= Horario_Examenes.CARRERA.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.JORNADA.CellAttributes %>>
<div<%= Horario_Examenes.JORNADA.ViewAttributes%>><%= Horario_Examenes.JORNADA.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.CURSO.CellAttributes %>>
<div<%= Horario_Examenes.CURSO.ViewAttributes%>><%= Horario_Examenes.CURSO.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.MODALIDAD.CellAttributes %>>
<div<%= Horario_Examenes.MODALIDAD.ViewAttributes%>><%= Horario_Examenes.MODALIDAD.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.ASIGNATURA.CellAttributes %>>
<div<%= Horario_Examenes.ASIGNATURA.ViewAttributes%>><%= Horario_Examenes.ASIGNATURA.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.PROFESOR.CellAttributes %>>
<div<%= Horario_Examenes.PROFESOR.ViewAttributes%>><%= Horario_Examenes.PROFESOR.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.SECCION.CellAttributes %>>
<div<%= Horario_Examenes.SECCION.ViewAttributes%>><%= Horario_Examenes.SECCION.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.SALA.CellAttributes %>>
<div<%= Horario_Examenes.SALA.ViewAttributes%>><%= Horario_Examenes.SALA.ListViewValue%></div>
</td>
		<td<%= Horario_Examenes.CAMPUS.CellAttributes %>>
<div<%= Horario_Examenes.CAMPUS.ViewAttributes%>><%= Horario_Examenes.CAMPUS.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Horario_Examenes_summary.AccumulateSummary()

		' Get next record
		Horario_Examenes_summary.GetRow() ' ASPXRPT
		Horario_Examenes_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Horario_Examenes_summary.TotalGrps > 0) Then
	Horario_Examenes.ResetCSS()
	Horario_Examenes.RowType = EWRPT_ROWTYPE_TOTAL
	Horario_Examenes.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Horario_Examenes.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Horario_Examenes.RowAttrs("class") = "ewRptGrandSummary"
	Horario_Examenes_summary.RenderRow()
%>
	<!-- tr><td colspan="12"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Horario_Examenes.RowAttributes() %>><td colspan="12"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Horario_Examenes_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Horario_Examenes_summary.TotalGrps > 0) Then %>
<% If (Horario_Examenes.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Horario_Examenes_summary.Pager Is Nothing Then Horario_Examenes_summary.Pager = New cPrevNextPager(Horario_Examenes_summary.StartGrp, Horario_Examenes_summary.DisplayGrps, Horario_Examenes_summary.TotalGrps) %>
<% If Horario_Examenes_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Horario_Examenes_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Horario_Examenessmry.aspx?start=<%= Horario_Examenes_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Horario_Examenes_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Horario_Examenessmry.aspx?start=<%= Horario_Examenes_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Horario_Examenes_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Horario_Examenes_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Horario_Examenessmry.aspx?start=<%= Horario_Examenes_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Horario_Examenes_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Horario_Examenessmry.aspx?start=<%= Horario_Examenes_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Horario_Examenes_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Horario_Examenes_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Horario_Examenes_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Horario_Examenes_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Horario_Examenes_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Horario_Examenes_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Horario_Examenes_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="30"<% If Horario_Examenes_summary.DisplayGrps = 30 Then Response.Write(" selected=""selected""") %>>30</option>
<option value="50"<% If Horario_Examenes_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
</select>
		</span></td>
<% End If %>
	</tr>
</table>
</form>
</div>
<% End If %>
<% End If %>
</td></tr></table>
</div>
<!-- Summary Report Ends -->
<% If (Horario_Examenes.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Horario_Examenes.Export = "" OrElse Horario_Examenes.Export = "print" OrElse Horario_Examenes.Export = "email") Then %>
<% End If %>
<% If (Horario_Examenes.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Horario_Examenes.Export = "" OrElse Horario_Examenes.Export = "print" OrElse Horario_Examenes.Export = "email") Then %>
<% End If %>
<% If (Horario_Examenes.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Horario_Examenes_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Horario_Examenes.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
