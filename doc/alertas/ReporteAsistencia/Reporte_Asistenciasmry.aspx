<%@ Page ClassName="Reporte_Asistenciasmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public Reporte_Asistencia As crReporte_Asistencia = Nothing

	'
	' Table class (for Reporte Asistencia)
	'
	Public Class crReporte_Asistencia
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
				Return "Reporte_Asistencia"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Reporte Asistencia"
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

		Public RUTPROFESOR As crField

		Public PROFESOR As crField

		Public HORARIO As crField

		Public FECHA As crField

		Public RUTALUMNO As crField

		Public ALUMNO As crField

		Public ASIGNATURA As crField

		Public SECCION As crField

		Public ASISTE As crField

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

			' RUTPROFESOR
			RUTPROFESOR = new crField("Reporte_Asistencia", "Reporte Asistencia", "x_RUTPROFESOR", "RUTPROFESOR", "dbo.SEK_Asistencia_Alumnos.RUTPROFESOR", 200, EWRPT_DATATYPE_STRING, -1)
			RUTPROFESOR.Page = APage
			RUTPROFESOR.ParentPage = APage.ParentPage
			RUTPROFESOR.GroupingFieldId = 1
			Fields.Add("RUTPROFESOR", RUTPROFESOR)
			RUTPROFESOR.DateFilter = ""
			RUTPROFESOR.SqlSelect = ""
			RUTPROFESOR.SqlOrderBy = ""
			RUTPROFESOR.FldGroupByType = ""
			RUTPROFESOR.FldGroupInt = "0"
			RUTPROFESOR.FldGroupSql = ""

			' PROFESOR
			PROFESOR = new crField("Reporte_Asistencia", "Reporte Asistencia", "x_PROFESOR", "PROFESOR", "dbo.SEK_Asistencia_Alumnos.PROFESOR", 200, EWRPT_DATATYPE_STRING, -1)
			PROFESOR.Page = APage
			PROFESOR.ParentPage = APage.ParentPage
			PROFESOR.GroupingFieldId = 2
			Fields.Add("PROFESOR", PROFESOR)
			PROFESOR.DateFilter = ""
			PROFESOR.SqlSelect = ""
			PROFESOR.SqlOrderBy = ""
			PROFESOR.FldGroupByType = ""
			PROFESOR.FldGroupInt = "0"
			PROFESOR.FldGroupSql = ""

			' HORARIO
			HORARIO = new crField("Reporte_Asistencia", "Reporte Asistencia", "x_HORARIO", "HORARIO", "dbo.SEK_Asistencia_Alumnos.HORARIO", 200, EWRPT_DATATYPE_STRING, -1)
			HORARIO.Page = APage
			HORARIO.ParentPage = APage.ParentPage
			HORARIO.GroupingFieldId = 3
			Fields.Add("HORARIO", HORARIO)
			HORARIO.DateFilter = ""
			HORARIO.SqlSelect = ""
			HORARIO.SqlOrderBy = ""
			HORARIO.FldGroupByType = ""
			HORARIO.FldGroupInt = "0"
			HORARIO.FldGroupSql = ""

			' FECHA
			FECHA = new crField("Reporte_Asistencia", "Reporte Asistencia", "x_FECHA", "FECHA", "dbo.SEK_Asistencia_Alumnos.FECHA", 135, EWRPT_DATATYPE_DATE, 7)
			FECHA.Page = APage
			FECHA.ParentPage = APage.ParentPage
			FECHA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECHA", FECHA)
			FECHA.DateFilter = ""
			FECHA.SqlSelect = ""
			FECHA.SqlOrderBy = ""

			' RUTALUMNO
			RUTALUMNO = new crField("Reporte_Asistencia", "Reporte Asistencia", "x_RUTALUMNO", "RUTALUMNO", "dbo.SEK_Asistencia_Alumnos.RUTALUMNO", 200, EWRPT_DATATYPE_STRING, -1)
			RUTALUMNO.Page = APage
			RUTALUMNO.ParentPage = APage.ParentPage
			Fields.Add("RUTALUMNO", RUTALUMNO)
			RUTALUMNO.DateFilter = ""
			RUTALUMNO.SqlSelect = ""
			RUTALUMNO.SqlOrderBy = ""

			' ALUMNO
			ALUMNO = new crField("Reporte_Asistencia", "Reporte Asistencia", "x_ALUMNO", "ALUMNO", "dbo.SEK_Asistencia_Alumnos.ALUMNO", 200, EWRPT_DATATYPE_STRING, -1)
			ALUMNO.Page = APage
			ALUMNO.ParentPage = APage.ParentPage
			Fields.Add("ALUMNO", ALUMNO)
			ALUMNO.DateFilter = ""
			ALUMNO.SqlSelect = ""
			ALUMNO.SqlOrderBy = ""

			' ASIGNATURA
			ASIGNATURA = new crField("Reporte_Asistencia", "Reporte Asistencia", "x_ASIGNATURA", "ASIGNATURA", "dbo.SEK_Asistencia_Alumnos.ASIGNATURA", 200, EWRPT_DATATYPE_STRING, -1)
			ASIGNATURA.Page = APage
			ASIGNATURA.ParentPage = APage.ParentPage
			Fields.Add("ASIGNATURA", ASIGNATURA)
			ASIGNATURA.DateFilter = ""
			ASIGNATURA.SqlSelect = ""
			ASIGNATURA.SqlOrderBy = ""

			' SECCION
			SECCION = new crField("Reporte_Asistencia", "Reporte Asistencia", "x_SECCION", "SECCION", "dbo.SEK_Asistencia_Alumnos.SECCION", 17, EWRPT_DATATYPE_NUMBER, -1)
			SECCION.Page = APage
			SECCION.ParentPage = APage.ParentPage
			SECCION.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("SECCION", SECCION)
			SECCION.DateFilter = ""
			SECCION.SqlSelect = ""
			SECCION.SqlOrderBy = ""

			' ASISTE
			ASISTE = new crField("Reporte_Asistencia", "Reporte Asistencia", "x_ASISTE", "ASISTE", "dbo.SEK_Asistencia_Alumnos.ASISTE", 200, EWRPT_DATATYPE_STRING, -1)
			ASISTE.Page = APage
			ASISTE.ParentPage = APage.ParentPage
			Fields.Add("ASISTE", ASISTE)
			ASISTE.DateFilter = ""
			ASISTE.SqlSelect = ""
			ASISTE.SqlOrderBy = ""
		End Sub

		' Multiple column sort
		Public Sub UpdateSort(ofld As crField, ctrl As Boolean)
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
				If (ofld.GroupingFieldId = 0 AndAlso Not ctrl) Then ofld.Sort = ""
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
				Return "dbo.SEK_Asistencia_Alumnos"
			End Get
		End Property

		Public ReadOnly Property SqlSelect As String ' Select
			Get
				Return "SELECT dbo.SEK_Asistencia_Alumnos.RUTPROFESOR, dbo.SEK_Asistencia_Alumnos.PROFESOR, dbo.SEK_Asistencia_Alumnos.HORARIO, dbo.SEK_Asistencia_Alumnos.FECHA, dbo.SEK_Asistencia_Alumnos.RUTALUMNO, dbo.SEK_Asistencia_Alumnos.ALUMNO, dbo.SEK_Asistencia_Alumnos.ASIGNATURA, dbo.SEK_Asistencia_Alumnos.SECCION, dbo.SEK_Asistencia_Alumnos.ASISTE FROM " + SqlFrom
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
				Return "dbo.SEK_Asistencia_Alumnos.RUTPROFESOR ASC, dbo.SEK_Asistencia_Alumnos.PROFESOR ASC, dbo.SEK_Asistencia_Alumnos.HORARIO ASC"
			End Get
		End Property

		' Table Level Group SQL
		Public ReadOnly Property SqlFirstGroupField As String
			Get
				Return "dbo.SEK_Asistencia_Alumnos.RUTPROFESOR"
			End Get
		End Property

		Public ReadOnly Property SqlSelectGroup As String
			Get
				Return "SELECT DISTINCT " + SqlFirstGroupField + " FROM " + SqlFrom
			End Get
		End Property

		Public ReadOnly Property SqlOrderByGroup As String
			Get
				Return "dbo.SEK_Asistencia_Alumnos.RUTPROFESOR ASC"
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
			If (ew_NotEmpty(Export) OrElse _
				Array.IndexOf(New Integer() {141, 201, 203, 128, 204, 205}, fld.FldType) > -1) Then ' Unsortable data type
					Return ""
			ElseIf (fld.Sortable) Then
				Dim sUrlParm As String = "order=" + ew_UrlEncode(fld.FldName) + "&ordertype=" + fld.ReverseSort
				Return ew_CurrentPage() + "?" + sUrlParm
			Else
				Return ""
			End If
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
	Public Reporte_Asistencia_summary As crReporte_Asistencia_summary

	'
	' Page class
	'
	Public Class crReporte_Asistencia_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Reporte_Asistencia.UseTokenInUrl) Then
				sUrl &= "t=" & Reporte_Asistencia.TableVar & "&" ' Add page token
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
			If (Reporte_Asistencia.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Reporte_Asistencia.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Reporte_Asistencia.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Reporte_Asistenciasmry 
			Get
				Return CType(m_ParentPage, Reporte_Asistenciasmry)
			End Get
		End Property

		' Table object (Reporte_Asistencia)
		Public Property Reporte_Asistencia As crReporte_Asistencia 
			Get		
				Return AspNetPage.Reporte_Asistencia ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crReporte_Asistencia)
				AspNetPage.Reporte_Asistencia = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Reporte_Asistencia_summary"
			m_PageObjTypeName = "crReporte_Asistencia_summary"

			' Table name
			m_TableName = "Reporte Asistencia"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Reporte_Asistencia)
			Reporte_Asistencia = New crReporte_Asistencia(Me)			

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
				Reporte_Asistencia.Export = ew_Get("export")
			End If
			gsExport = Reporte_Asistencia.Export ' Get export parameter, used in header
			gsExportFile = Reporte_Asistencia.TableVar ' Get export file, used in header
			If (Reporte_Asistencia.Export = "excel") Then
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

		Public DisplayGrps As Integer = 3	' Groups per page

		Public GrpRange As Integer = 10

		Public Sort As String = ""

		Public Filter As String = ""

		Public UserIDFilter As String = ""

		' Clear field for ext filter
		Public ClearExtFilter As String = ""

		Public FilterApplied As Boolean

		Public ShowFirstHeader As Boolean

		Public Val As Object() = New Object(6) {}

		Public Cnt As Integer()() = New Integer(3)() {}

		Public Smry As Object()() = New Object(3)() {}

		Public Mn As Object()() = New Object(3)() {}

		Public Mx As Object()() = New Object(3)() {}

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
			Dim nGrps As Integer = 4 ' No. of groups (level 0 used for grand total)
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
			Reporte_Asistencia.CustomFilters_Load()

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

			' Get total group count
			Dim sGrpSort As String = ewrpt_UpdateSortFields(Reporte_Asistencia.SqlOrderByGroup, Sort, 2) ' Get grouping field only
			Dim sSql As String = ewrpt_BuildReportSql(Reporte_Asistencia.SqlSelectGroup, Reporte_Asistencia.SqlWhere, Reporte_Asistencia.SqlGroupBy, Reporte_Asistencia.SqlHaving, Reporte_Asistencia.SqlOrderByGroup, Filter, sGrpSort)
			TotalGrps = GetGrpCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Reporte_Asistencia.ExportAll AndAlso ew_NotEmpty(Reporte_Asistencia.Export)) Then
				DisplayGrps = TotalGrps
			Else
				SetUpStartGroup()
			End If 

			' Get current page groups
			rsgrp = GetGrpRs(sSql, StartGrp, DisplayGrps)
		End Sub

		' Check level break
		Public Function ChkLvlBreak(lvl As Integer) As Boolean
			Select Case lvl
				Case 1
					Return (Convert.IsDBNull(Reporte_Asistencia.RUTPROFESOR.CurrentValue) AndAlso Not Convert.IsDBNull(Reporte_Asistencia.RUTPROFESOR.OldValue)) OrElse _
						(Not Convert.IsDBNull(Reporte_Asistencia.RUTPROFESOR.CurrentValue) AndAlso Convert.IsDBNull(Reporte_Asistencia.RUTPROFESOR.OldValue)) OrElse _
						(Not ew_SameStr(Reporte_Asistencia.RUTPROFESOR.GroupValue(), Reporte_Asistencia.RUTPROFESOR.GroupOldValue()))
				Case 2
					Return (Convert.IsDBNull(Reporte_Asistencia.PROFESOR.CurrentValue) AndAlso Not Convert.IsDBNull(Reporte_Asistencia.PROFESOR.OldValue)) OrElse _
						(Not Convert.IsDBNull(Reporte_Asistencia.PROFESOR.CurrentValue) AndAlso Convert.IsDBNull(Reporte_Asistencia.PROFESOR.OldValue)) OrElse _
						(Not ew_SameStr(Reporte_Asistencia.PROFESOR.GroupValue(), Reporte_Asistencia.PROFESOR.GroupOldValue())) OrElse ChkLvlBreak(1) ' Recurse upper level
				Case 3
					Return (Convert.IsDBNull(Reporte_Asistencia.HORARIO.CurrentValue) AndAlso Not Convert.IsDBNull(Reporte_Asistencia.HORARIO.OldValue)) OrElse _
						(Not Convert.IsDBNull(Reporte_Asistencia.HORARIO.CurrentValue) AndAlso Convert.IsDBNull(Reporte_Asistencia.HORARIO.OldValue)) OrElse _
						(Not ew_SameStr(Reporte_Asistencia.HORARIO.GroupValue(), Reporte_Asistencia.HORARIO.GroupOldValue())) OrElse ChkLvlBreak(2) ' Recurse upper level
			End Select
			Return False
		End Function

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

		' Get group count
		Public Function GetGrpCnt(ByVal sql As String) As Integer
			rsgrp = Conn.GetRows(sql)
			Return rsgrp.Count
		End Function

		' Get group rs
		Public Function GetGrpRs(ByVal sql As String, ByVal start As Integer, ByVal grps As Integer) As ArrayList
			GrpIndex = start - 1
			Return rsgrp
		End Function

		' Get group row values
		Public Sub GetGrpRow(ByVal opt As Integer)
			If rsgrp Is Nothing Then
				Return
			End If					
			If opt = 1 Then ' Get first group
				Reporte_Asistencia.RUTPROFESOR.DbValue = "" ' Init first value
			Else	' Get next group
				GrpIndex += 1
			End If
			Dim Row As OrderedDictionary
			If GrpIndex >= rsgrp.Count Then
				Reporte_Asistencia.RUTPROFESOR.DbValue = ""
			Else
				Row = DirectCast(rsgrp(GrpIndex), OrderedDictionary)
				Reporte_Asistencia.RUTPROFESOR.DbValue = Row(0)
			End If
		End Sub

		' Get row values
		Public Sub GetRow(opt As Integer)
			Dim Row As OrderedDictionary
			If (RowIndex >= rs.Count) Then Return
			RowIndex = IIf(opt = 1, 0, RowIndex + 1)
			If (RowIndex < rs.Count) Then
				Row = CType(rs(RowIndex), OrderedDictionary)		
				If (opt <> 1) Then
					If (Reporte_Asistencia.RUTPROFESOR.GroupDbValues.Count > 0) Then
						Reporte_Asistencia.RUTPROFESOR.DbValue = Reporte_Asistencia.RUTPROFESOR.GroupDbValues(Row("RUTPROFESOR"))
					Else
						Reporte_Asistencia.RUTPROFESOR.DbValue = ewrpt_GroupValue(Reporte_Asistencia.RUTPROFESOR, Row("RUTPROFESOR"))
					End If
				End If
				Reporte_Asistencia.PROFESOR.DbValue = Row("PROFESOR")
				Reporte_Asistencia.HORARIO.DbValue = Row("HORARIO")
				Reporte_Asistencia.FECHA.DbValue = Row("FECHA")
				Reporte_Asistencia.RUTALUMNO.DbValue = Row("RUTALUMNO")
				Reporte_Asistencia.ALUMNO.DbValue = Row("ALUMNO")
				Reporte_Asistencia.ASIGNATURA.DbValue = Row("ASIGNATURA")
				Reporte_Asistencia.SECCION.DbValue = Row("SECCION")
				Reporte_Asistencia.ASISTE.DbValue = Row("ASISTE")
				Val(1) = Reporte_Asistencia.FECHA.CurrentValue
				Val(2) = Reporte_Asistencia.RUTALUMNO.CurrentValue
				Val(3) = Reporte_Asistencia.ALUMNO.CurrentValue
				Val(4) = Reporte_Asistencia.ASIGNATURA.CurrentValue
				Val(5) = Reporte_Asistencia.SECCION.CurrentValue
				Val(6) = Reporte_Asistencia.ASISTE.CurrentValue
			Else
				Reporte_Asistencia.RUTPROFESOR.DbValue = ""
				Reporte_Asistencia.PROFESOR.DbValue = ""
				Reporte_Asistencia.HORARIO.DbValue = ""
				Reporte_Asistencia.FECHA.DbValue = ""
				Reporte_Asistencia.RUTALUMNO.DbValue = ""
				Reporte_Asistencia.ALUMNO.DbValue = ""
				Reporte_Asistencia.ASIGNATURA.DbValue = ""
				Reporte_Asistencia.SECCION.DbValue = ""
				Reporte_Asistencia.ASISTE.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Reporte_Asistencia.RUTPROFESOR.DbValue = dr("RUTPROFESOR")
				Reporte_Asistencia.PROFESOR.DbValue = dr("PROFESOR")
				Reporte_Asistencia.HORARIO.DbValue = dr("HORARIO")
				Reporte_Asistencia.FECHA.DbValue = dr("FECHA")
				Reporte_Asistencia.RUTALUMNO.DbValue = dr("RUTALUMNO")
				Reporte_Asistencia.ALUMNO.DbValue = dr("ALUMNO")
				Reporte_Asistencia.ASIGNATURA.DbValue = dr("ASIGNATURA")
				Reporte_Asistencia.SECCION.DbValue = dr("SECCION")
				Reporte_Asistencia.ASISTE.DbValue = dr("ASISTE")
				Val(1) = Reporte_Asistencia.FECHA.CurrentValue
				Val(2) = Reporte_Asistencia.RUTALUMNO.CurrentValue
				Val(3) = Reporte_Asistencia.ALUMNO.CurrentValue
				Val(4) = Reporte_Asistencia.ASIGNATURA.CurrentValue
				Val(5) = Reporte_Asistencia.SECCION.CurrentValue
				Val(6) = Reporte_Asistencia.ASISTE.CurrentValue
			Else				
				Reporte_Asistencia.PROFESOR.DbValue = ""
				Reporte_Asistencia.HORARIO.DbValue = ""
				Reporte_Asistencia.FECHA.DbValue = ""
				Reporte_Asistencia.RUTALUMNO.DbValue = ""
				Reporte_Asistencia.ALUMNO.DbValue = ""
				Reporte_Asistencia.ASIGNATURA.DbValue = ""
				Reporte_Asistencia.SECCION.DbValue = ""
				Reporte_Asistencia.ASISTE.DbValue = ""
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
				Reporte_Asistencia.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Reporte_Asistencia.StartGroup = StartGrp
				Else
					StartGrp = Reporte_Asistencia.StartGroup
				End If
			Else
				StartGrp = Reporte_Asistencia.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Reporte_Asistencia.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Reporte_Asistencia.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Reporte_Asistencia.StartGroup = StartGrp
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
			Reporte_Asistencia.StartGroup = StartGrp
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
						DisplayGrps = 3 ' Non-numeric, load default 
					End If 
				End If				
				Reporte_Asistencia.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Reporte_Asistencia.StartGroup = StartGrp
			Else				
				If (Reporte_Asistencia.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Reporte_Asistencia.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 3 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Reporte_Asistencia.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Reporte_Asistencia.SqlSelectCount, Reporte_Asistencia.SqlWhere, Reporte_Asistencia.SqlGroupBy, Reporte_Asistencia.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Reporte_Asistencia.Row_Rendering()

			'
			' Render view codes
			'

			If (Reporte_Asistencia.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUTPROFESOR
				Reporte_Asistencia.RUTPROFESOR.GroupViewValue = Convert.ToString(Reporte_Asistencia.RUTPROFESOR.GroupOldValue())
				Reporte_Asistencia.RUTPROFESOR.ViewAttrs("style") = "font-weight:bold;"
				Reporte_Asistencia.RUTPROFESOR.CellAttrs("class") = IIf(Reporte_Asistencia.RowGroupLevel = 1, "ewRptGrpSummary1", "ewRptGrpField1")
				Reporte_Asistencia.RUTPROFESOR.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Reporte_Asistencia.RUTPROFESOR, Reporte_Asistencia.RUTPROFESOR.GroupViewValue)

				' PROFESOR
				Reporte_Asistencia.PROFESOR.GroupViewValue = Convert.ToString(Reporte_Asistencia.PROFESOR.GroupOldValue())
				Reporte_Asistencia.PROFESOR.CellAttrs("class") = IIf(Reporte_Asistencia.RowGroupLevel = 2, "ewRptGrpSummary2", "ewRptGrpField2")
				Reporte_Asistencia.PROFESOR.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Reporte_Asistencia.PROFESOR, Reporte_Asistencia.PROFESOR.GroupViewValue)

				' HORARIO
				Reporte_Asistencia.HORARIO.GroupViewValue = Convert.ToString(Reporte_Asistencia.HORARIO.GroupOldValue())
				Reporte_Asistencia.HORARIO.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Reporte_Asistencia.HORARIO.CellAttrs("class") = IIf(Reporte_Asistencia.RowGroupLevel = 3, "ewRptGrpSummary3", "ewRptGrpField3")
				Reporte_Asistencia.HORARIO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Reporte_Asistencia.HORARIO, Reporte_Asistencia.HORARIO.GroupViewValue)

				' FECHA
				Reporte_Asistencia.FECHA.ViewValue = Convert.ToString(Reporte_Asistencia.FECHA.Summary)
				Reporte_Asistencia.FECHA.ViewValue = ew_FormatDateTime(Reporte_Asistencia.FECHA.ViewValue, 7)
				Reporte_Asistencia.FECHA.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' RUTALUMNO
				Reporte_Asistencia.RUTALUMNO.ViewValue = Convert.ToString(Reporte_Asistencia.RUTALUMNO.Summary)
				Reporte_Asistencia.RUTALUMNO.ViewAttrs("style") = "font-weight:bold;"

				' ALUMNO
				Reporte_Asistencia.ALUMNO.ViewValue = Convert.ToString(Reporte_Asistencia.ALUMNO.Summary)

				' ASIGNATURA
				Reporte_Asistencia.ASIGNATURA.ViewValue = Convert.ToString(Reporte_Asistencia.ASIGNATURA.Summary)

				' SECCION
				Reporte_Asistencia.SECCION.ViewValue = Convert.ToString(Reporte_Asistencia.SECCION.Summary)
				Reporte_Asistencia.SECCION.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' ASISTE
				Reporte_Asistencia.ASISTE.ViewValue = Convert.ToString(Reporte_Asistencia.ASISTE.Summary)
				Reporte_Asistencia.ASISTE.ViewAttrs("style") = "font-weight:bold;text-align:center;"
			Else

				' RUTPROFESOR
				Reporte_Asistencia.RUTPROFESOR.GroupViewValue = Convert.ToString(Reporte_Asistencia.RUTPROFESOR.GroupValue())
				Reporte_Asistencia.RUTPROFESOR.ViewAttrs("style") = "font-weight:bold;"
				Reporte_Asistencia.RUTPROFESOR.CellAttrs("class") = "ewRptGrpField1"
				Reporte_Asistencia.RUTPROFESOR.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Reporte_Asistencia.RUTPROFESOR, Reporte_Asistencia.RUTPROFESOR.GroupViewValue)
				If (ew_SameStr(Reporte_Asistencia.RUTPROFESOR.GroupValue(), Reporte_Asistencia.RUTPROFESOR.GroupOldValue()) AndAlso Not ChkLvlBreak(1))
					Reporte_Asistencia.RUTPROFESOR.GroupViewValue = "&nbsp;"
				End If

				' PROFESOR
				Reporte_Asistencia.PROFESOR.GroupViewValue = Convert.ToString(Reporte_Asistencia.PROFESOR.GroupValue())
				Reporte_Asistencia.PROFESOR.CellAttrs("class") = "ewRptGrpField2"
				Reporte_Asistencia.PROFESOR.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Reporte_Asistencia.PROFESOR, Reporte_Asistencia.PROFESOR.GroupViewValue)
				If (ew_SameStr(Reporte_Asistencia.PROFESOR.GroupValue(), Reporte_Asistencia.PROFESOR.GroupOldValue()) AndAlso Not ChkLvlBreak(2))
					Reporte_Asistencia.PROFESOR.GroupViewValue = "&nbsp;"
				End If

				' HORARIO
				Reporte_Asistencia.HORARIO.GroupViewValue = Convert.ToString(Reporte_Asistencia.HORARIO.GroupValue())
				Reporte_Asistencia.HORARIO.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Reporte_Asistencia.HORARIO.CellAttrs("class") = "ewRptGrpField3"
				Reporte_Asistencia.HORARIO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Reporte_Asistencia.HORARIO, Reporte_Asistencia.HORARIO.GroupViewValue)
				If (ew_SameStr(Reporte_Asistencia.HORARIO.GroupValue(), Reporte_Asistencia.HORARIO.GroupOldValue()) AndAlso Not ChkLvlBreak(3))
					Reporte_Asistencia.HORARIO.GroupViewValue = "&nbsp;"
				End If

				' FECHA
				Reporte_Asistencia.FECHA.ViewValue = Convert.ToString(Reporte_Asistencia.FECHA.CurrentValue)
				Reporte_Asistencia.FECHA.ViewValue = ew_FormatDateTime(Reporte_Asistencia.FECHA.ViewValue, 7)
				Reporte_Asistencia.FECHA.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Reporte_Asistencia.FECHA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUTALUMNO
				Reporte_Asistencia.RUTALUMNO.ViewValue = Convert.ToString(Reporte_Asistencia.RUTALUMNO.CurrentValue)
				Reporte_Asistencia.RUTALUMNO.ViewAttrs("style") = "font-weight:bold;"
				Reporte_Asistencia.RUTALUMNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ALUMNO
				Reporte_Asistencia.ALUMNO.ViewValue = Convert.ToString(Reporte_Asistencia.ALUMNO.CurrentValue)
				Reporte_Asistencia.ALUMNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ASIGNATURA
				Reporte_Asistencia.ASIGNATURA.ViewValue = Convert.ToString(Reporte_Asistencia.ASIGNATURA.CurrentValue)
				Reporte_Asistencia.ASIGNATURA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SECCION
				Reporte_Asistencia.SECCION.ViewValue = Convert.ToString(Reporte_Asistencia.SECCION.CurrentValue)
				Reporte_Asistencia.SECCION.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Reporte_Asistencia.SECCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ASISTE
				Reporte_Asistencia.ASISTE.ViewValue = Convert.ToString(Reporte_Asistencia.ASISTE.CurrentValue)
				Reporte_Asistencia.ASISTE.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Reporte_Asistencia.ASISTE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUTPROFESOR
			Reporte_Asistencia.RUTPROFESOR.HrefValue = ""

			' PROFESOR
			Reporte_Asistencia.PROFESOR.HrefValue = ""

			' HORARIO
			Reporte_Asistencia.HORARIO.HrefValue = ""

			' FECHA
			Reporte_Asistencia.FECHA.HrefValue = ""

			' RUTALUMNO
			Reporte_Asistencia.RUTALUMNO.HrefValue = ""

			' ALUMNO
			Reporte_Asistencia.ALUMNO.HrefValue = ""

			' ASIGNATURA
			Reporte_Asistencia.ASIGNATURA.HrefValue = ""

			' SECCION
			Reporte_Asistencia.SECCION.HrefValue = ""

			' ASISTE
			Reporte_Asistencia.ASISTE.HrefValue = ""

			' Call Row_Rendered event
			Reporte_Asistencia.Row_Rendered()
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

			' Field PROFESOR
			sSelect = "SELECT DISTINCT dbo.SEK_Asistencia_Alumnos.PROFESOR FROM " + Reporte_Asistencia.SqlFrom
			sOrderBy = "dbo.SEK_Asistencia_Alumnos.PROFESOR ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reporte_Asistencia.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reporte_Asistencia.PROFESOR.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field HORARIO
			sSelect = "SELECT DISTINCT dbo.SEK_Asistencia_Alumnos.HORARIO FROM " + Reporte_Asistencia.SqlFrom
			sOrderBy = "dbo.SEK_Asistencia_Alumnos.HORARIO ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reporte_Asistencia.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reporte_Asistencia.HORARIO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ALUMNO
			sSelect = "SELECT DISTINCT dbo.SEK_Asistencia_Alumnos.ALUMNO FROM " + Reporte_Asistencia.SqlFrom
			sOrderBy = "dbo.SEK_Asistencia_Alumnos.ALUMNO ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reporte_Asistencia.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reporte_Asistencia.ALUMNO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ASIGNATURA
			sSelect = "SELECT DISTINCT dbo.SEK_Asistencia_Alumnos.ASIGNATURA FROM " + Reporte_Asistencia.SqlFrom
			sOrderBy = "dbo.SEK_Asistencia_Alumnos.ASIGNATURA ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reporte_Asistencia.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reporte_Asistencia.ASIGNATURA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field SECCION
			sSelect = "SELECT DISTINCT dbo.SEK_Asistencia_Alumnos.SECCION FROM " + Reporte_Asistencia.SqlFrom
			sOrderBy = "dbo.SEK_Asistencia_Alumnos.SECCION ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reporte_Asistencia.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reporte_Asistencia.SECCION.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ASISTE
			sSelect = "SELECT DISTINCT dbo.SEK_Asistencia_Alumnos.ASISTE FROM " + Reporte_Asistencia.SqlFrom
			sOrderBy = "dbo.SEK_Asistencia_Alumnos.ASISTE ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reporte_Asistencia.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reporte_Asistencia.ASISTE.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field RUTPROFESOR
				SetSessionFilterValues(Reporte_Asistencia.RUTPROFESOR)

				' Field PROFESOR
				SetSessionDropDownValue(Reporte_Asistencia.PROFESOR.DropDownValue, Reporte_Asistencia.PROFESOR)

				' Field HORARIO
				SetSessionDropDownValue(Reporte_Asistencia.HORARIO.DropDownValue, Reporte_Asistencia.HORARIO)

				' Field FECHA
				SetSessionFilterValues(Reporte_Asistencia.FECHA)

				' Field RUTALUMNO
				SetSessionFilterValues(Reporte_Asistencia.RUTALUMNO)

				' Field ALUMNO
				SetSessionDropDownValue(Reporte_Asistencia.ALUMNO.DropDownValue, Reporte_Asistencia.ALUMNO)

				' Field ASIGNATURA
				SetSessionDropDownValue(Reporte_Asistencia.ASIGNATURA.DropDownValue, Reporte_Asistencia.ASIGNATURA)

				' Field SECCION
				SetSessionDropDownValue(Reporte_Asistencia.SECCION.DropDownValue, Reporte_Asistencia.SECCION)

				' Field ASISTE
				SetSessionDropDownValue(Reporte_Asistencia.ASISTE.DropDownValue, Reporte_Asistencia.ASISTE)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUTPROFESOR
				If (GetFilterValues(Reporte_Asistencia.RUTPROFESOR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PROFESOR
				If (GetDropDownValue(Reporte_Asistencia.PROFESOR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reporte_Asistencia.PROFESOR.DropDownValue) Then
					If Not ew_SameStr(Reporte_Asistencia.PROFESOR.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reporte_Asistencia_PROFESOR") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field HORARIO
				If (GetDropDownValue(Reporte_Asistencia.HORARIO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reporte_Asistencia.HORARIO.DropDownValue) Then
					If Not ew_SameStr(Reporte_Asistencia.HORARIO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reporte_Asistencia_HORARIO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field FECHA
				If (GetFilterValues(Reporte_Asistencia.FECHA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field RUTALUMNO
				If (GetFilterValues(Reporte_Asistencia.RUTALUMNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ALUMNO
				If (GetDropDownValue(Reporte_Asistencia.ALUMNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reporte_Asistencia.ALUMNO.DropDownValue) Then
					If Not ew_SameStr(Reporte_Asistencia.ALUMNO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reporte_Asistencia_ALUMNO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ASIGNATURA
				If (GetDropDownValue(Reporte_Asistencia.ASIGNATURA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reporte_Asistencia.ASIGNATURA.DropDownValue) Then
					If Not ew_SameStr(Reporte_Asistencia.ASIGNATURA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reporte_Asistencia_ASIGNATURA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field SECCION
				If (GetDropDownValue(Reporte_Asistencia.SECCION)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reporte_Asistencia.SECCION.DropDownValue) Then
					If Not ew_SameStr(Reporte_Asistencia.SECCION.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reporte_Asistencia_SECCION") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ASISTE
				If (GetDropDownValue(Reporte_Asistencia.ASISTE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reporte_Asistencia.ASISTE.DropDownValue) Then
					If Not ew_SameStr(Reporte_Asistencia.ASISTE.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reporte_Asistencia_ASISTE") Is Nothing Then
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

			' Field RUTPROFESOR
			GetSessionFilterValues(Reporte_Asistencia.RUTPROFESOR)

			' Field PROFESOR
			GetSessionDropDownValue(Reporte_Asistencia.PROFESOR)

			' Field HORARIO
			GetSessionDropDownValue(Reporte_Asistencia.HORARIO)

			' Field FECHA
			GetSessionFilterValues(Reporte_Asistencia.FECHA)

			' Field RUTALUMNO
			GetSessionFilterValues(Reporte_Asistencia.RUTALUMNO)

			' Field ALUMNO
			GetSessionDropDownValue(Reporte_Asistencia.ALUMNO)

			' Field ASIGNATURA
			GetSessionDropDownValue(Reporte_Asistencia.ASIGNATURA)

			' Field SECCION
			GetSessionDropDownValue(Reporte_Asistencia.SECCION)

			' Field ASISTE
			GetSessionDropDownValue(Reporte_Asistencia.ASISTE)
		End If

		' Call page filter validated event
		Reporte_Asistencia.Page_FilterValidated()

		' Build SQL
		' Field RUTPROFESOR

		BuildExtendedFilter(Reporte_Asistencia.RUTPROFESOR, sFilter)

		' Field PROFESOR
		BuildDropDownFilter(Reporte_Asistencia.PROFESOR, sFilter, "")

		' Field HORARIO
		BuildDropDownFilter(Reporte_Asistencia.HORARIO, sFilter, "")

		' Field FECHA
		BuildExtendedFilter(Reporte_Asistencia.FECHA, sFilter)

		' Field RUTALUMNO
		BuildExtendedFilter(Reporte_Asistencia.RUTALUMNO, sFilter)

		' Field ALUMNO
		BuildDropDownFilter(Reporte_Asistencia.ALUMNO, sFilter, "")

		' Field ASIGNATURA
		BuildDropDownFilter(Reporte_Asistencia.ASIGNATURA, sFilter, "")

		' Field SECCION
		BuildDropDownFilter(Reporte_Asistencia.SECCION, sFilter, "")

		' Field ASISTE
		BuildDropDownFilter(Reporte_Asistencia.ASISTE, sFilter, "")

		' Save parms to Session
		' Field RUTPROFESOR

		SetSessionFilterValues(Reporte_Asistencia.RUTPROFESOR)

		' Field PROFESOR
		SetSessionDropDownValue(Reporte_Asistencia.PROFESOR.DropDownValue, Reporte_Asistencia.PROFESOR)

		' Field HORARIO
		SetSessionDropDownValue(Reporte_Asistencia.HORARIO.DropDownValue, Reporte_Asistencia.HORARIO)

		' Field FECHA
		SetSessionFilterValues(Reporte_Asistencia.FECHA)

		' Field RUTALUMNO
		SetSessionFilterValues(Reporte_Asistencia.RUTALUMNO)

		' Field ALUMNO
		SetSessionDropDownValue(Reporte_Asistencia.ALUMNO.DropDownValue, Reporte_Asistencia.ALUMNO)

		' Field ASIGNATURA
		SetSessionDropDownValue(Reporte_Asistencia.ASIGNATURA.DropDownValue, Reporte_Asistencia.ASIGNATURA)

		' Field SECCION
		SetSessionDropDownValue(Reporte_Asistencia.SECCION.DropDownValue, Reporte_Asistencia.SECCION)

		' Field ASISTE
		SetSessionDropDownValue(Reporte_Asistencia.ASISTE.DropDownValue, Reporte_Asistencia.ASISTE)

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
		If ew_Session("sv_Reporte_Asistencia_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Reporte_Asistencia_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Reporte_Asistencia_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Reporte_Asistencia_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Reporte_Asistencia_" + parm)
		End If
		If ew_Session("so1_Reporte_Asistencia_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Reporte_Asistencia_" + parm))
		End If
		If ew_Session("sc_Reporte_Asistencia_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Reporte_Asistencia_" + parm))
		End If
		If ew_Session("sv2_Reporte_Asistencia_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Reporte_Asistencia_" + parm)
		End If
		If ew_Session("so2_Reporte_Asistencia_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Reporte_Asistencia_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Reporte_Asistencia_" + parm) = fld.SearchValue
		ew_Session("so1_Reporte_Asistencia_" + parm) = fld.SearchOperator
		ew_Session("sc_Reporte_Asistencia_" + parm) = fld.SearchCondition
		ew_Session("sv2_Reporte_Asistencia_" + parm) = fld.SearchValue2
		ew_Session("so2_Reporte_Asistencia_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Reporte_Asistencia_" + parm) = ""
		ew_Session("so1_Reporte_Asistencia_" + parm) = "="
		ew_Session("sc_Reporte_Asistencia_" + parm) = "AND"
		ew_Session("sv2_Reporte_Asistencia_" + parm) = ""
		ew_Session("so2_Reporte_Asistencia_" + parm) = "="
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
		If Not ewrpt_CheckEuroDate(Convert.ToString(Reporte_Asistencia.FECHA.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Reporte_Asistencia.FECHA.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Reporte_Asistencia.FECHA.SearchValue2)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Reporte_Asistencia.FECHA.FldErrMsg()
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
		ew_Session("sel_Reporte_Asistencia_" & parm) = ""
		ew_Session("rf_Reporte_Asistencia_" & parm) = ""
		ew_Session("rt_Reporte_Asistencia_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Reporte_Asistencia.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Reporte_Asistencia_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Reporte_Asistencia_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Reporte_Asistencia_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field PROFESOR

			Reporte_Asistencia.PROFESOR.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reporte_Asistencia.PROFESOR.DropDownValue = Reporte_Asistencia.PROFESOR.DefaultDropDownValue

			' Field HORARIO
			Reporte_Asistencia.HORARIO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reporte_Asistencia.HORARIO.DropDownValue = Reporte_Asistencia.HORARIO.DefaultDropDownValue

			' Field ALUMNO
			Reporte_Asistencia.ALUMNO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reporte_Asistencia.ALUMNO.DropDownValue = Reporte_Asistencia.ALUMNO.DefaultDropDownValue

			' Field ASIGNATURA
			Reporte_Asistencia.ASIGNATURA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reporte_Asistencia.ASIGNATURA.DropDownValue = Reporte_Asistencia.ASIGNATURA.DefaultDropDownValue

			' Field SECCION
			Reporte_Asistencia.SECCION.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reporte_Asistencia.SECCION.DropDownValue = Reporte_Asistencia.SECCION.DefaultDropDownValue

			' Field ASISTE
			Reporte_Asistencia.ASISTE.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reporte_Asistencia.ASISTE.DropDownValue = Reporte_Asistencia.ASISTE.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUTPROFESOR

			SetDefaultExtFilter(Reporte_Asistencia.RUTPROFESOR, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_Asistencia.RUTPROFESOR)	

			' Field FECHA
			SetDefaultExtFilter(Reporte_Asistencia.FECHA, "BETWEEN", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_Asistencia.FECHA)	

			' Field RUTALUMNO
			SetDefaultExtFilter(Reporte_Asistencia.RUTALUMNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_Asistencia.RUTALUMNO)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUTPROFESOR extended filter
		If (TextFilterApplied(Reporte_Asistencia.RUTPROFESOR)) Then bFilterExist = True

		' Check PROFESOR dropdown filter
		If (NonTextFilterApplied(Reporte_Asistencia.PROFESOR)) Then bFilterExist = True

		' Check HORARIO dropdown filter
		If (NonTextFilterApplied(Reporte_Asistencia.HORARIO)) Then bFilterExist = True

		' Check FECHA extended filter
		If (TextFilterApplied(Reporte_Asistencia.FECHA)) Then bFilterExist = True

		' Check RUTALUMNO extended filter
		If (TextFilterApplied(Reporte_Asistencia.RUTALUMNO)) Then bFilterExist = True

		' Check ALUMNO dropdown filter
		If (NonTextFilterApplied(Reporte_Asistencia.ALUMNO)) Then bFilterExist = True

		' Check ASIGNATURA dropdown filter
		If (NonTextFilterApplied(Reporte_Asistencia.ASIGNATURA)) Then bFilterExist = True

		' Check SECCION dropdown filter
		If (NonTextFilterApplied(Reporte_Asistencia.SECCION)) Then bFilterExist = True

		' Check ASISTE dropdown filter
		If (NonTextFilterApplied(Reporte_Asistencia.ASISTE)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field RUTPROFESOR
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_Asistencia.RUTPROFESOR, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_Asistencia.RUTPROFESOR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PROFESOR
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reporte_Asistencia.PROFESOR, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_Asistencia.PROFESOR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field HORARIO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reporte_Asistencia.HORARIO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_Asistencia.HORARIO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECHA
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_Asistencia.FECHA, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_Asistencia.FECHA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUTALUMNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_Asistencia.RUTALUMNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_Asistencia.RUTALUMNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ALUMNO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reporte_Asistencia.ALUMNO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_Asistencia.ALUMNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ASIGNATURA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reporte_Asistencia.ASIGNATURA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_Asistencia.ASIGNATURA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field SECCION
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reporte_Asistencia.SECCION, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_Asistencia.SECCION.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ASISTE
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reporte_Asistencia.ASISTE, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_Asistencia.ASISTE.FldCaption() & "<br>"
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

		' Check for Ctrl pressed
		bCtrl = ew_NotEmpty(ew_Get("ctrl"))

		' Check for a resetsort command
		If ew_NotEmpty(ew_Get("cmd")) Then
			Dim sCmd As String = ew_Get("cmd")
			If ew_SameText(sCmd, "resetsort") Then
				Reporte_Asistencia.OrderBy = ""
				Reporte_Asistencia.StartGroup = 1
				Reporte_Asistencia.RUTPROFESOR.Sort = ""
				Reporte_Asistencia.PROFESOR.Sort = ""
				Reporte_Asistencia.HORARIO.Sort = ""
				Reporte_Asistencia.FECHA.Sort = ""
				Reporte_Asistencia.RUTALUMNO.Sort = ""
				Reporte_Asistencia.ALUMNO.Sort = ""
				Reporte_Asistencia.ASIGNATURA.Sort = ""
				Reporte_Asistencia.SECCION.Sort = ""
				Reporte_Asistencia.ASISTE.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Reporte_Asistencia.CurrentOrder = ew_Get("order")
			Reporte_Asistencia.CurrentOrderType = ew_Get("ordertype")
			Reporte_Asistencia.UpdateSort(Reporte_Asistencia.RUTPROFESOR, bCtrl) ' RUTPROFESOR
			Reporte_Asistencia.UpdateSort(Reporte_Asistencia.PROFESOR, bCtrl) ' PROFESOR
			Reporte_Asistencia.UpdateSort(Reporte_Asistencia.HORARIO, bCtrl) ' HORARIO
			Reporte_Asistencia.UpdateSort(Reporte_Asistencia.FECHA, bCtrl) ' FECHA
			Reporte_Asistencia.UpdateSort(Reporte_Asistencia.RUTALUMNO, bCtrl) ' RUTALUMNO
			Reporte_Asistencia.UpdateSort(Reporte_Asistencia.ALUMNO, bCtrl) ' ALUMNO
			Reporte_Asistencia.UpdateSort(Reporte_Asistencia.ASIGNATURA, bCtrl) ' ASIGNATURA
			Reporte_Asistencia.UpdateSort(Reporte_Asistencia.SECCION, bCtrl) ' SECCION
			Reporte_Asistencia.UpdateSort(Reporte_Asistencia.ASISTE, bCtrl) ' ASISTE
			sSortSql = Reporte_Asistencia.SortSql()
			Reporte_Asistencia.OrderBy = sSortSql
			Reporte_Asistencia.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Reporte_Asistencia.OrderBy)) Then
			Reporte_Asistencia.OrderBy = "dbo.SEK_Asistencia_Alumnos.FECHA ASC"
			Reporte_Asistencia.FECHA.Sort = "ASC"
		End If
		Return Reporte_Asistencia.OrderBy
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
		Reporte_Asistencia_summary = New crReporte_Asistencia_summary(Me)
		Reporte_Asistencia_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Reporte_Asistencia_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Reporte_Asistencia_summary IsNot Nothing) Then Reporte_Asistencia_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Reporte_Asistencia.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Reporte_Asistencia_summary = new ewrpt_Page("Reporte_Asistencia_summary");
// page properties
Reporte_Asistencia_summary.PageID = "summary"; // page ID
Reporte_Asistencia_summary.FormID = "fReporte_Asistenciasummaryfilter"; // form ID
var EWRPT_PAGE_ID = Reporte_Asistencia_summary.PageID;
// extend page with ValidateForm function
Reporte_Asistencia_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_FECHA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Reporte_Asistencia.FECHA.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv2_FECHA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Reporte_Asistencia.FECHA.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Reporte_Asistencia_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Reporte_Asistencia_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Reporte_Asistencia_summary.ValidateRequired = false; // no JavaScript validation
<% End If %>
</script>
<link rel="stylesheet" type="text/css" media="all" href="jscalendar/calendar-win2k-1.css" title="win2k-1" />
<script type="text/javascript" src="jscalendar/calendar.js"></script>
<script type="text/javascript" src="jscalendar/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar/calendar-setup.js"></script>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
// To include another .js script, use:
// ew_ClientScriptInclude("my_javascript.js"); 
//-->
</script>
<% End If %>
<% Reporte_Asistencia_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Reporte_Asistencia.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Reporte_Asistencia.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Reporte_Asistencia.TableCaption() %></h1></div>
<% If (Reporte_Asistencia.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Reporte_Asistencia_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% End If %>
</div><br><br>
<% Reporte_Asistencia_summary.ShowMessage() %>
<% If (Reporte_Asistencia.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Reporte_Asistencia.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (Reporte_Asistencia.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (Reporte_Asistencia.FilterPanelOption = 2 OrElse (Reporte_Asistencia.FilterPanelOption = 3 AndAlso Reporte_Asistencia_summary.FilterApplied) OrElse Reporte_Asistencia_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span>
<% If (Reporte_Asistencia_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="Reporte_Asistenciasmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fReporte_Asistenciasummaryfilter" id="fReporte_Asistenciasummaryfilter" action="Reporte_Asistenciasmry.aspx" class="ewForm" onsubmit="return Reporte_Asistencia_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Reporte_Asistencia.RUTALUMNO.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_Asistencia.RUTPROFESOR.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><input type="hidden" name="so1_RUTPROFESOR" id="so1_RUTPROFESOR" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUTPROFESOR" id="sv1_RUTPROFESOR" size="30" maxlength="22" value="<%= ew_HtmlEncode(Reporte_Asistencia.RUTPROFESOR.SearchValue) %>"<%= IIf(Reporte_Asistencia_summary.ClearExtFilter = "Reporte_Asistencia_RUTPROFESOR", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_Asistencia.PROFESOR.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PROFESOR" id="sv_PROFESOR"<%= IIf(Reporte_Asistencia_summary.ClearExtFilter = "Reporte_Asistencia_PROFESOR", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.PROFESOR.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Reporte_Asistencia.PROFESOR.CustomFilters.Count + Reporte_Asistencia.PROFESOR.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reporte_Asistencia.PROFESOR.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PROFESOR")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.PROFESOR.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reporte_Asistencia.PROFESOR.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.PROFESOR.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_Asistencia.HORARIO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_HORARIO" id="sv_HORARIO"<%= IIf(Reporte_Asistencia_summary.ClearExtFilter = "Reporte_Asistencia_HORARIO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.HORARIO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Reporte_Asistencia.HORARIO.CustomFilters.Count + Reporte_Asistencia.HORARIO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reporte_Asistencia.HORARIO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "HORARIO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.HORARIO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reporte_Asistencia.HORARIO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.HORARIO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_Asistencia.FECHA.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%Response.Write("entre") %><input type="hidden" name="so1_FECHA" id="so1_FECHA" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECHA" id="sv1_FECHA" value="<%= ew_HtmlEncode(Reporte_Asistencia.FECHA.SearchValue) %>"<%= IIf(Reporte_Asistencia_summary.ClearExtFilter = "Reporte_Asistencia_FECHA", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv1_FECHA" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv1_FECHA", // ID of the input field
ifFormat : "%m/%d/%Y", // the date format
button : "csv1_FECHA" // ID of the button
})
</script>
</span></td>
				<td></td>
					<td><span class="ewRptSearchOpr" id="btw1_FECHA" name="btw1_FECHA">&nbsp;<%Response.Write("y") %>&nbsp;</span></td>
					<td><span class="aspnetreportmaker" id="btw1_FECHA" name="btw1_FECHA">
<input type="text" name="sv2_FECHA" id="sv2_FECHA" value="<%= ew_HtmlEncode(Reporte_Asistencia.FECHA.SearchValue2) %>"<%= IIf(Reporte_Asistencia_summary.ClearExtFilter = "Reporte_Asistencia_FECHA", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv2_FECHA" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv2_FECHA", // ID of the input field
ifFormat : "%m/%d/%Y", // the date format
button : "csv2_FECHA" // ID of the button
})
</script>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_Asistencia.RUTALUMNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr">
		  <input type="hidden" name="so1_RUTALUMNO" id="so1_RUTALUMNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUTALUMNO" id="sv1_RUTALUMNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Reporte_Asistencia.RUTALUMNO.SearchValue) %>"<%= IIf(Reporte_Asistencia_summary.ClearExtFilter = "Reporte_Asistencia_RUTALUMNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_Asistencia.ALUMNO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ALUMNO" id="sv_ALUMNO"<%= IIf(Reporte_Asistencia_summary.ClearExtFilter = "Reporte_Asistencia_ALUMNO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.ALUMNO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Reporte_Asistencia.ALUMNO.CustomFilters.Count + Reporte_Asistencia.ALUMNO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reporte_Asistencia.ALUMNO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ALUMNO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.ALUMNO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reporte_Asistencia.ALUMNO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.ALUMNO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_Asistencia.ASIGNATURA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ASIGNATURA" id="sv_ASIGNATURA"<%= IIf(Reporte_Asistencia_summary.ClearExtFilter = "Reporte_Asistencia_ASIGNATURA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.ASIGNATURA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Reporte_Asistencia.ASIGNATURA.CustomFilters.Count + Reporte_Asistencia.ASIGNATURA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reporte_Asistencia.ASIGNATURA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ASIGNATURA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.ASIGNATURA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reporte_Asistencia.ASIGNATURA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.ASIGNATURA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_Asistencia.SECCION.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Reporte_Asistencia.SECCION.CustomFilters.Count + Reporte_Asistencia.SECCION.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reporte_Asistencia.SECCION.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "SECCION")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Reporte_Asistencia.SECCION.DropDownValue" id="Reporte_Asistencia.SECCION.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.SECCION.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reporte_Asistencia.SECCION.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_SECCION" id="sv_SECCION" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.SECCION.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_Asistencia.ASISTE.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Reporte_Asistencia.ASISTE.CustomFilters.Count + Reporte_Asistencia.ASISTE.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reporte_Asistencia.ASISTE.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ASISTE")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Reporte_Asistencia.ASISTE.DropDownValue" id="Reporte_Asistencia.ASISTE.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.ASISTE.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reporte_Asistencia.ASISTE.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ASISTE" id="sv_ASISTE" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reporte_Asistencia.ASISTE.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
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
<% If (Reporte_Asistencia.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Reporte_Asistencia_summary.ShowFilterList() %>
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
If (Reporte_Asistencia.ExportAll AndAlso ew_NotEmpty(Reporte_Asistencia.Export)) Then
	Reporte_Asistencia_summary.StopGrp = Reporte_Asistencia_summary.TotalGrps
Else
	Reporte_Asistencia_summary.StopGrp = Reporte_Asistencia_summary.StartGrp + Reporte_Asistencia_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Reporte_Asistencia_summary.StopGrp > Reporte_Asistencia_summary.TotalGrps) Then
	Reporte_Asistencia_summary.StopGrp = Reporte_Asistencia_summary.TotalGrps
End If
Reporte_Asistencia_summary.RecCount = 0

' Get first row
If (Reporte_Asistencia_summary.TotalGrps > 0) Then
	Reporte_Asistencia_summary.GetGrpRow(1)
	Reporte_Asistencia_summary.GrpCount = 1
End If
While (Reporte_Asistencia_summary.GrpIndex < Reporte_Asistencia_summary.StopGrp OrElse Reporte_Asistencia_summary.ShowFirstHeader)

	' Show header
	If (Reporte_Asistencia_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_Asistencia.Export)) Then %>
<%= Reporte_Asistencia.RUTPROFESOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_Asistencia.SortUrl(Reporte_Asistencia.RUTPROFESOR))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_Asistencia.RUTPROFESOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_Asistencia.SortUrl(Reporte_Asistencia.RUTPROFESOR) %>',2);"><%= Reporte_Asistencia.RUTPROFESOR.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_Asistencia.RUTPROFESOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_Asistencia.RUTPROFESOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_Asistencia.Export)) Then %>
<%= Reporte_Asistencia.PROFESOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_Asistencia.SortUrl(Reporte_Asistencia.PROFESOR))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_Asistencia.PROFESOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_Asistencia.SortUrl(Reporte_Asistencia.PROFESOR) %>',2);"><%= Reporte_Asistencia.PROFESOR.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_Asistencia.PROFESOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_Asistencia.PROFESOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_Asistencia.Export)) Then %>
<%= Reporte_Asistencia.HORARIO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_Asistencia.SortUrl(Reporte_Asistencia.HORARIO))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_Asistencia.HORARIO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_Asistencia.SortUrl(Reporte_Asistencia.HORARIO) %>',2);"><%= Reporte_Asistencia.HORARIO.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_Asistencia.HORARIO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_Asistencia.HORARIO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_Asistencia.Export)) Then %>
<%= Reporte_Asistencia.FECHA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_Asistencia.SortUrl(Reporte_Asistencia.FECHA))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_Asistencia.FECHA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_Asistencia.SortUrl(Reporte_Asistencia.FECHA) %>',2);"><%= Reporte_Asistencia.FECHA.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_Asistencia.FECHA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_Asistencia.FECHA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_Asistencia.Export)) Then %>
<%= Reporte_Asistencia.RUTALUMNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_Asistencia.SortUrl(Reporte_Asistencia.RUTALUMNO))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_Asistencia.RUTALUMNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_Asistencia.SortUrl(Reporte_Asistencia.RUTALUMNO) %>',2);"><%= Reporte_Asistencia.RUTALUMNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_Asistencia.RUTALUMNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_Asistencia.RUTALUMNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_Asistencia.Export)) Then %>
<%= Reporte_Asistencia.ALUMNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_Asistencia.SortUrl(Reporte_Asistencia.ALUMNO))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_Asistencia.ALUMNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_Asistencia.SortUrl(Reporte_Asistencia.ALUMNO) %>',2);"><%= Reporte_Asistencia.ALUMNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_Asistencia.ALUMNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_Asistencia.ALUMNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_Asistencia.Export)) Then %>
<%= Reporte_Asistencia.ASIGNATURA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_Asistencia.SortUrl(Reporte_Asistencia.ASIGNATURA))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_Asistencia.ASIGNATURA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_Asistencia.SortUrl(Reporte_Asistencia.ASIGNATURA) %>',2);"><%= Reporte_Asistencia.ASIGNATURA.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_Asistencia.ASIGNATURA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_Asistencia.ASIGNATURA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_Asistencia.Export)) Then %>
<%= Reporte_Asistencia.SECCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_Asistencia.SortUrl(Reporte_Asistencia.SECCION))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_Asistencia.SECCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_Asistencia.SortUrl(Reporte_Asistencia.SECCION) %>',2);"><%= Reporte_Asistencia.SECCION.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_Asistencia.SECCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_Asistencia.SECCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_Asistencia.Export)) Then %>
<%= Reporte_Asistencia.ASISTE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_Asistencia.SortUrl(Reporte_Asistencia.ASISTE))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_Asistencia.ASISTE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_Asistencia.SortUrl(Reporte_Asistencia.ASISTE) %>',2);"><%= Reporte_Asistencia.ASISTE.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_Asistencia.ASISTE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_Asistencia.ASISTE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Reporte_Asistencia_summary.ShowFirstHeader = False
	End If

	' Build detail SQL
	Dim sWhere As String = ewrpt_DetailFilterSQL(Reporte_Asistencia.RUTPROFESOR, Reporte_Asistencia.SqlFirstGroupField, Reporte_Asistencia.RUTPROFESOR.GroupValue())
	If (ew_NotEmpty(Reporte_Asistencia_summary.Filter)) Then
		sWhere = "(" + Reporte_Asistencia_summary.Filter + ") AND (" + sWhere + ")"
	End If
	sSql = ewrpt_BuildReportSql(Reporte_Asistencia.SqlSelect, Reporte_Asistencia.SqlWhere, Reporte_Asistencia.SqlGroupBy, Reporte_Asistencia.SqlHaving, Reporte_Asistencia.SqlOrderBy, sWhere, Reporte_Asistencia_summary.Sort)
	Reporte_Asistencia_summary.rs = Conn.GetRows(sSql)
	Dim rsdtlcnt As Integer = Reporte_Asistencia_summary.rs.Count
	Reporte_Asistencia_summary.RowIndex = 0	
	If (rsdtlcnt > 0) Then
		Reporte_Asistencia_summary.GetRow(1)
	End If

	' Loop detail records
	While (Reporte_Asistencia_summary.RowIndex < Reporte_Asistencia_summary.rs.Count) 
		Reporte_Asistencia_summary.RecCount += 1

		' Render detail row
		Reporte_Asistencia.ResetCSS()
		Reporte_Asistencia.RowType = EWRPT_ROWTYPE_DETAIL
		Reporte_Asistencia_summary.RenderRow()
%>
	<tr<%= Reporte_Asistencia.RowAttributes() %>>
		<td<%= Reporte_Asistencia.RUTPROFESOR.CellAttributes %>><div<%= Reporte_Asistencia.RUTPROFESOR.ViewAttributes %>><%= Reporte_Asistencia.RUTPROFESOR.GroupViewValue %></div></td>
		<td<%= Reporte_Asistencia.PROFESOR.CellAttributes %>><div<%= Reporte_Asistencia.PROFESOR.ViewAttributes %>><%= Reporte_Asistencia.PROFESOR.GroupViewValue %></div></td>
		<td<%= Reporte_Asistencia.HORARIO.CellAttributes %>><div<%= Reporte_Asistencia.HORARIO.ViewAttributes %>><%= Reporte_Asistencia.HORARIO.GroupViewValue %></div></td>
		<td<%= Reporte_Asistencia.FECHA.CellAttributes %>>
<div<%= Reporte_Asistencia.FECHA.ViewAttributes%>><%= Reporte_Asistencia.FECHA.ListViewValue%></div>
</td>
		<td<%= Reporte_Asistencia.RUTALUMNO.CellAttributes %>>
<div<%= Reporte_Asistencia.RUTALUMNO.ViewAttributes%>><%= Reporte_Asistencia.RUTALUMNO.ListViewValue%></div>
</td>
		<td<%= Reporte_Asistencia.ALUMNO.CellAttributes %>>
<div<%= Reporte_Asistencia.ALUMNO.ViewAttributes%>><%= Reporte_Asistencia.ALUMNO.ListViewValue%></div>
</td>
		<td<%= Reporte_Asistencia.ASIGNATURA.CellAttributes %>>
<div<%= Reporte_Asistencia.ASIGNATURA.ViewAttributes%>><%= Reporte_Asistencia.ASIGNATURA.ListViewValue%></div>
</td>
		<td<%= Reporte_Asistencia.SECCION.CellAttributes %>>
<div<%= Reporte_Asistencia.SECCION.ViewAttributes%>><%= Reporte_Asistencia.SECCION.ListViewValue%></div>
</td>
		<td<%= Reporte_Asistencia.ASISTE.CellAttributes %>>
<div<%= Reporte_Asistencia.ASISTE.ViewAttributes%>><%= Reporte_Asistencia.ASISTE.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Reporte_Asistencia_summary.AccumulateSummary()

		' Get next record
		Reporte_Asistencia_summary.GetRow(2)

		' Show Footers
%>
<%
		If (Reporte_Asistencia_summary.ChkLvlBreak(2)) Then
			Reporte_Asistencia.ResetCSS()
			Reporte_Asistencia.RowType = EWRPT_ROWTYPE_TOTAL
			Reporte_Asistencia.RowTotalType = EWRPT_ROWTOTAL_GROUP
			Reporte_Asistencia.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
			Reporte_Asistencia.RowGroupLevel = 2
			Reporte_Asistencia_summary.RenderRow()
%>
	<tr<%= Reporte_Asistencia.RowAttributes() %>>
		<td<%= Reporte_Asistencia.RUTPROFESOR.CellAttributes %>>&nbsp;</td>
		<td colspan="8"<%= Reporte_Asistencia.PROFESOR.CellAttributes %>><%= ReportLanguage.Phrase("RptSumHead") %> <%= Reporte_Asistencia.PROFESOR.FldCaption() %>: <%= Reporte_Asistencia.PROFESOR.GroupViewValue %> (<%= ewrpt_FormatNumber(Reporte_Asistencia_summary.Cnt(2)(0),0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<%

			' Reset level 2 summary
			Reporte_Asistencia_summary.ResetLevelSummary(2)
		End If ' End check level check
%>
<%
	End While ' End detail records loop
%>
<%

	' Next group
	Reporte_Asistencia_summary.GetGrpRow(2)
	Reporte_Asistencia_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Reporte_Asistencia_summary.TotalGrps > 0) Then
	Reporte_Asistencia.ResetCSS()
	Reporte_Asistencia.RowType = EWRPT_ROWTYPE_TOTAL
	Reporte_Asistencia.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Reporte_Asistencia.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Reporte_Asistencia.RowAttrs("class") = "ewRptGrandSummary"
	Reporte_Asistencia_summary.RenderRow()
%>
	<!-- tr><td colspan="9"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Reporte_Asistencia.RowAttributes() %>><td colspan="9"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Reporte_Asistencia_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Reporte_Asistencia.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Reporte_Asistencia_summary.Pager Is Nothing Then Reporte_Asistencia_summary.Pager = New cPrevNextPager(Reporte_Asistencia_summary.StartGrp, Reporte_Asistencia_summary.DisplayGrps, Reporte_Asistencia_summary.TotalGrps) %>
<% If Reporte_Asistencia_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Reporte_Asistencia_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Reporte_Asistenciasmry.aspx?start=<%= Reporte_Asistencia_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Reporte_Asistencia_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Reporte_Asistenciasmry.aspx?start=<%= Reporte_Asistencia_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Reporte_Asistencia_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Reporte_Asistencia_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Reporte_Asistenciasmry.aspx?start=<%= Reporte_Asistencia_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Reporte_Asistencia_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Reporte_Asistenciasmry.aspx?start=<%= Reporte_Asistencia_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Reporte_Asistencia_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Reporte_Asistencia_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Reporte_Asistencia_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Reporte_Asistencia_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Reporte_Asistencia_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Reporte_Asistencia_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="3"<% If Reporte_Asistencia_summary.DisplayGrps = 3 Then Response.Write(" selected=""selected""") %>>3</option>
<option value="20"<% If Reporte_Asistencia_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="30"<% If Reporte_Asistencia_summary.DisplayGrps = 30 Then Response.Write(" selected=""selected""") %>>30</option>
<option value="40"<% If Reporte_Asistencia_summary.DisplayGrps = 40 Then Response.Write(" selected=""selected""") %>>40</option>
<option value="50"<% If Reporte_Asistencia_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="ALL"<% If (Reporte_Asistencia.GroupPerPage = -1) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("AllRecords") %></option>
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
<% If (Reporte_Asistencia.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Reporte_Asistencia.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Reporte_Asistencia.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Reporte_Asistencia_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Reporte_Asistencia.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
