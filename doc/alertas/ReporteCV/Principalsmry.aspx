<%@ Page ClassName="Principalsmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_CVTotal_2" %>
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
	Public Principal As crPrincipal = Nothing

	'
	' Table class (for Principal)
	'
	Public Class crPrincipal
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
				Return "Principal"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Principal"
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

		Public RUT_Profesor As crField

		Public Profesor As crField

		Public Experiencia As crField

		Public Num_GradosAcad As crField

		Public Num_Extensiones As crField

		Public Num_Becas As crField

		Public Num_Perf As crField

		Public Num_Idiomas As crField

		Public Num_Publicaciones As crField

		Public Num_ProgAcad As crField

		Public Num_Membresias As crField

		Public Num_Investigaciones As crField

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

			' RUT
			RUT = new crField("Principal", "Principal", "x_RUT", "RUT", "matricula.SEK_CV_Nums.RUT", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' RUT_Profesor
			RUT_Profesor = new crField("Principal", "Principal", "x_RUT_Profesor", "RUT_Profesor", "matricula.SEK_CV_Nums.RUT_Profesor", 200, EWRPT_DATATYPE_STRING, -1)
			RUT_Profesor.Page = APage
			RUT_Profesor.ParentPage = APage.ParentPage
			Fields.Add("RUT_Profesor", RUT_Profesor)
			RUT_Profesor.DateFilter = ""
			RUT_Profesor.SqlSelect = ""
			RUT_Profesor.SqlOrderBy = ""

			' Profesor
			Profesor = new crField("Principal", "Principal", "x_Profesor", "Profesor", "matricula.SEK_CV_Nums.AP_PATER + ' ' + matricula.SEK_CV_Nums.AP_MATER + ',' + matricula.SEK_CV_Nums.NOMBRES", 200, EWRPT_DATATYPE_STRING, -1)
			Profesor.Page = APage
			Profesor.ParentPage = APage.ParentPage
			Fields.Add("Profesor", Profesor)
			Profesor.DateFilter = ""
			Profesor.SqlSelect = ""
			Profesor.SqlOrderBy = ""

			' Experiencia
			Experiencia = new crField("Principal", "Principal", "x_Experiencia", "Experiencia", "Case When matricula.SEK_CV_Nums.Num_Experiencias = 0 Then Convert(Varchar(5),'0') When matricula.SEK_CV_Nums.Num_Experiencias = 1 Then Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) Else Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) End", 200, EWRPT_DATATYPE_STRING, -1)
			Experiencia.Page = APage
			Experiencia.ParentPage = APage.ParentPage
			Experiencia.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Experiencia", Experiencia)
			Experiencia.DateFilter = ""
			Experiencia.SqlSelect = "SELECT DISTINCT Case When matricula.SEK_CV_Nums.Num_Experiencias = 0 Then Convert(Varchar(5),'0') When matricula.SEK_CV_Nums.Num_Experiencias = 1 Then Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) Else Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) End FROM " + SqlFrom
			Experiencia.SqlOrderBy = "Case When matricula.SEK_CV_Nums.Num_Experiencias = 0 Then Convert(Varchar(5),'0') When matricula.SEK_CV_Nums.Num_Experiencias = 1 Then Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) Else Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) End"

			' Num_GradosAcad
			Num_GradosAcad = new crField("Principal", "Principal", "x_Num_GradosAcad", "Num_GradosAcad", "matricula.SEK_CV_Nums.Num_GradosAcad", 3, EWRPT_DATATYPE_NUMBER, -1)
			Num_GradosAcad.Page = APage
			Num_GradosAcad.ParentPage = APage.ParentPage
			Num_GradosAcad.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Num_GradosAcad", Num_GradosAcad)
			Num_GradosAcad.DateFilter = ""
			Num_GradosAcad.SqlSelect = "SELECT DISTINCT matricula.SEK_CV_Nums.Num_GradosAcad FROM " + SqlFrom
			Num_GradosAcad.SqlOrderBy = "matricula.SEK_CV_Nums.Num_GradosAcad"

			' Num_Extensiones
			Num_Extensiones = new crField("Principal", "Principal", "x_Num_Extensiones", "Num_Extensiones", "matricula.SEK_CV_Nums.Num_Extensiones", 3, EWRPT_DATATYPE_NUMBER, -1)
			Num_Extensiones.Page = APage
			Num_Extensiones.ParentPage = APage.ParentPage
			Num_Extensiones.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Num_Extensiones", Num_Extensiones)
			Num_Extensiones.DateFilter = ""
			Num_Extensiones.SqlSelect = "SELECT DISTINCT matricula.SEK_CV_Nums.Num_Extensiones FROM " + SqlFrom
			Num_Extensiones.SqlOrderBy = "matricula.SEK_CV_Nums.Num_Extensiones"

			' Num_Becas
			Num_Becas = new crField("Principal", "Principal", "x_Num_Becas", "Num_Becas", "matricula.SEK_CV_Nums.Num_Becas", 3, EWRPT_DATATYPE_NUMBER, -1)
			Num_Becas.Page = APage
			Num_Becas.ParentPage = APage.ParentPage
			Num_Becas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Num_Becas", Num_Becas)
			Num_Becas.DateFilter = ""
			Num_Becas.SqlSelect = "SELECT DISTINCT matricula.SEK_CV_Nums.Num_Becas FROM " + SqlFrom
			Num_Becas.SqlOrderBy = "matricula.SEK_CV_Nums.Num_Becas"

			' Num_Perf
			Num_Perf = new crField("Principal", "Principal", "x_Num_Perf", "Num_Perf", "matricula.SEK_CV_Nums.Num_Perf", 3, EWRPT_DATATYPE_NUMBER, -1)
			Num_Perf.Page = APage
			Num_Perf.ParentPage = APage.ParentPage
			Num_Perf.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Num_Perf", Num_Perf)
			Num_Perf.DateFilter = ""
			Num_Perf.SqlSelect = "SELECT DISTINCT matricula.SEK_CV_Nums.Num_Perf FROM " + SqlFrom
			Num_Perf.SqlOrderBy = "matricula.SEK_CV_Nums.Num_Perf"

			' Num_Idiomas
			Num_Idiomas = new crField("Principal", "Principal", "x_Num_Idiomas", "Num_Idiomas", "matricula.SEK_CV_Nums.Num_Idiomas", 3, EWRPT_DATATYPE_NUMBER, -1)
			Num_Idiomas.Page = APage
			Num_Idiomas.ParentPage = APage.ParentPage
			Num_Idiomas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Num_Idiomas", Num_Idiomas)
			Num_Idiomas.DateFilter = ""
			Num_Idiomas.SqlSelect = "SELECT DISTINCT matricula.SEK_CV_Nums.Num_Idiomas FROM " + SqlFrom
			Num_Idiomas.SqlOrderBy = "matricula.SEK_CV_Nums.Num_Idiomas"

			' Num_Publicaciones
			Num_Publicaciones = new crField("Principal", "Principal", "x_Num_Publicaciones", "Num_Publicaciones", "matricula.SEK_CV_Nums.Num_Publicaciones", 3, EWRPT_DATATYPE_NUMBER, -1)
			Num_Publicaciones.Page = APage
			Num_Publicaciones.ParentPage = APage.ParentPage
			Num_Publicaciones.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Num_Publicaciones", Num_Publicaciones)
			Num_Publicaciones.DateFilter = ""
			Num_Publicaciones.SqlSelect = "SELECT DISTINCT matricula.SEK_CV_Nums.Num_Publicaciones FROM " + SqlFrom
			Num_Publicaciones.SqlOrderBy = "matricula.SEK_CV_Nums.Num_Publicaciones"

			' Num_ProgAcad
			Num_ProgAcad = new crField("Principal", "Principal", "x_Num_ProgAcad", "Num_ProgAcad", "matricula.SEK_CV_Nums.Num_ProgAcad", 3, EWRPT_DATATYPE_NUMBER, -1)
			Num_ProgAcad.Page = APage
			Num_ProgAcad.ParentPage = APage.ParentPage
			Num_ProgAcad.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Num_ProgAcad", Num_ProgAcad)
			Num_ProgAcad.DateFilter = ""
			Num_ProgAcad.SqlSelect = "SELECT DISTINCT matricula.SEK_CV_Nums.Num_ProgAcad FROM " + SqlFrom
			Num_ProgAcad.SqlOrderBy = "matricula.SEK_CV_Nums.Num_ProgAcad"

			' Num_Membresias
			Num_Membresias = new crField("Principal", "Principal", "x_Num_Membresias", "Num_Membresias", "matricula.SEK_CV_Nums.Num_Membresias", 3, EWRPT_DATATYPE_NUMBER, -1)
			Num_Membresias.Page = APage
			Num_Membresias.ParentPage = APage.ParentPage
			Num_Membresias.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Num_Membresias", Num_Membresias)
			Num_Membresias.DateFilter = ""
			Num_Membresias.SqlSelect = "SELECT DISTINCT matricula.SEK_CV_Nums.Num_Membresias FROM " + SqlFrom
			Num_Membresias.SqlOrderBy = "matricula.SEK_CV_Nums.Num_Membresias"

			' Num_Investigaciones
			Num_Investigaciones = new crField("Principal", "Principal", "x_Num_Investigaciones", "Num_Investigaciones", "matricula.SEK_CV_Nums.Num_Investigaciones", 3, EWRPT_DATATYPE_NUMBER, -1)
			Num_Investigaciones.Page = APage
			Num_Investigaciones.ParentPage = APage.ParentPage
			Num_Investigaciones.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Num_Investigaciones", Num_Investigaciones)
			Num_Investigaciones.DateFilter = ""
			Num_Investigaciones.SqlSelect = "SELECT DISTINCT matricula.SEK_CV_Nums.Num_Investigaciones FROM " + SqlFrom
			Num_Investigaciones.SqlOrderBy = "matricula.SEK_CV_Nums.Num_Investigaciones"
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
				Return "matricula.SEK_CV_Nums"
			End Get
		End Property

		Public ReadOnly Property SqlSelect As String ' Select
			Get
				Return "SELECT matricula.SEK_CV_Nums.RUT, matricula.SEK_CV_Nums.RUT_Profesor, matricula.SEK_CV_Nums.AP_PATER + ' ' + matricula.SEK_CV_Nums.AP_MATER + ',' + matricula.SEK_CV_Nums.NOMBRES As Profesor, Case When matricula.SEK_CV_Nums.Num_Experiencias = 0 Then Convert(Varchar(5),'0') When matricula.SEK_CV_Nums.Num_Experiencias = 1 Then Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) Else Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) End As Experiencia, matricula.SEK_CV_Nums.Num_GradosAcad, matricula.SEK_CV_Nums.Num_Extensiones, matricula.SEK_CV_Nums.Num_Becas, matricula.SEK_CV_Nums.Num_Perf, matricula.SEK_CV_Nums.Num_Idiomas, matricula.SEK_CV_Nums.Num_Publicaciones, matricula.SEK_CV_Nums.Num_ProgAcad, matricula.SEK_CV_Nums.Num_Membresias, matricula.SEK_CV_Nums.Num_Investigaciones FROM " + SqlFrom
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
	Public Principal_summary As crPrincipal_summary

	'
	' Page class
	'
	Public Class crPrincipal_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Principal.UseTokenInUrl) Then
				sUrl &= "t=" & Principal.TableVar & "&" ' Add page token
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
			If (Principal.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Principal.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Principal.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Principalsmry 
			Get
				Return CType(m_ParentPage, Principalsmry)
			End Get
		End Property

		' Table object (Principal)
		Public Property Principal As crPrincipal 
			Get		
				Return AspNetPage.Principal ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crPrincipal)
				AspNetPage.Principal = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_CVTotal_2)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Principal_summary"
			m_PageObjTypeName = "crPrincipal_summary"

			' Table name
			m_TableName = "Principal"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Principal)
			Principal = New crPrincipal(Me)			

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
				Principal.Export = ew_Get("export")
			End If
			gsExport = Principal.Export ' Get export parameter, used in header
			gsExportFile = Principal.TableVar ' Get export file, used in header
			If (Principal.Export = "excel") Then
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
			Principal.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Principal.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Principal.ExportAll AndAlso ew_NotEmpty(Principal.Export)) Then
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
				Principal.RUT_Profesor.DbValue = Row("RUT_Profesor")
				Principal.Experiencia.DbValue = Row("Experiencia")
				Principal.Num_GradosAcad.DbValue = Row("Num_GradosAcad")
				Principal.Num_Extensiones.DbValue = Row("Num_Extensiones")
				Principal.Num_Becas.DbValue = Row("Num_Becas")
				Principal.Num_Perf.DbValue = Row("Num_Perf")
				Principal.Num_Idiomas.DbValue = Row("Num_Idiomas")
				Principal.Num_Publicaciones.DbValue = Row("Num_Publicaciones")
				Principal.Num_ProgAcad.DbValue = Row("Num_ProgAcad")
				Principal.Num_Membresias.DbValue = Row("Num_Membresias")
				Principal.Num_Investigaciones.DbValue = Row("Num_Investigaciones")
				Principal.RUT.DbValue = Row("RUT")
				Principal.Profesor.DbValue = Row("Profesor")
				Val(1) = Principal.RUT_Profesor.CurrentValue
				Val(2) = Principal.Profesor.CurrentValue
				Val(3) = Principal.Experiencia.CurrentValue
				Val(4) = Principal.Num_GradosAcad.CurrentValue
				Val(5) = Principal.Num_Extensiones.CurrentValue
				Val(6) = Principal.Num_Becas.CurrentValue
				Val(7) = Principal.Num_Perf.CurrentValue
				Val(8) = Principal.Num_Idiomas.CurrentValue
				Val(9) = Principal.Num_Publicaciones.CurrentValue
				Val(10) = Principal.Num_ProgAcad.CurrentValue
				Val(11) = Principal.Num_Membresias.CurrentValue
				Val(12) = Principal.Num_Investigaciones.CurrentValue
			Else
				Principal.RUT_Profesor.DbValue = ""
				Principal.Experiencia.DbValue = ""
				Principal.Num_GradosAcad.DbValue = ""
				Principal.Num_Extensiones.DbValue = ""
				Principal.Num_Becas.DbValue = ""
				Principal.Num_Perf.DbValue = ""
				Principal.Num_Idiomas.DbValue = ""
				Principal.Num_Publicaciones.DbValue = ""
				Principal.Num_ProgAcad.DbValue = ""
				Principal.Num_Membresias.DbValue = ""
				Principal.Num_Investigaciones.DbValue = ""
				Principal.RUT.DbValue = ""
				Principal.Profesor.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Principal.RUT_Profesor.DbValue = dr("RUT_Profesor")
				Principal.Experiencia.DbValue = dr("Experiencia")
				Principal.Num_GradosAcad.DbValue = dr("Num_GradosAcad")
				Principal.Num_Extensiones.DbValue = dr("Num_Extensiones")
				Principal.Num_Becas.DbValue = dr("Num_Becas")
				Principal.Num_Perf.DbValue = dr("Num_Perf")
				Principal.Num_Idiomas.DbValue = dr("Num_Idiomas")
				Principal.Num_Publicaciones.DbValue = dr("Num_Publicaciones")
				Principal.Num_ProgAcad.DbValue = dr("Num_ProgAcad")
				Principal.Num_Membresias.DbValue = dr("Num_Membresias")
				Principal.Num_Investigaciones.DbValue = dr("Num_Investigaciones")
				Principal.RUT.DbValue = dr("RUT")
				Principal.Profesor.DbValue = dr("Profesor")
				Val(1) = Principal.RUT_Profesor.CurrentValue
				Val(2) = Principal.Profesor.CurrentValue
				Val(3) = Principal.Experiencia.CurrentValue
				Val(4) = Principal.Num_GradosAcad.CurrentValue
				Val(5) = Principal.Num_Extensiones.CurrentValue
				Val(6) = Principal.Num_Becas.CurrentValue
				Val(7) = Principal.Num_Perf.CurrentValue
				Val(8) = Principal.Num_Idiomas.CurrentValue
				Val(9) = Principal.Num_Publicaciones.CurrentValue
				Val(10) = Principal.Num_ProgAcad.CurrentValue
				Val(11) = Principal.Num_Membresias.CurrentValue
				Val(12) = Principal.Num_Investigaciones.CurrentValue
			Else				
				Principal.RUT_Profesor.DbValue = ""
				Principal.Experiencia.DbValue = ""
				Principal.Num_GradosAcad.DbValue = ""
				Principal.Num_Extensiones.DbValue = ""
				Principal.Num_Becas.DbValue = ""
				Principal.Num_Perf.DbValue = ""
				Principal.Num_Idiomas.DbValue = ""
				Principal.Num_Publicaciones.DbValue = ""
				Principal.Num_ProgAcad.DbValue = ""
				Principal.Num_Membresias.DbValue = ""
				Principal.Num_Investigaciones.DbValue = ""
				Principal.RUT.DbValue = ""
				Principal.Profesor.DbValue = ""
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
				Principal.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Principal.StartGroup = StartGrp
				Else
					StartGrp = Principal.StartGroup
				End If
			Else
				StartGrp = Principal.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Principal.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Principal.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Principal.StartGroup = StartGrp
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
			' Build distinct values for Experiencia

			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Experiencia.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Experiencia.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Experiencia.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Experiencia.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Experiencia.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Experiencia.ViewValue = Convert.ToString(Principal.Experiencia.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Experiencia.ValueList, Principal.Experiencia.CurrentValue, Principal.Experiencia.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Experiencia.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Experiencia.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for Num_GradosAcad
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Num_GradosAcad.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Num_GradosAcad.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Num_GradosAcad.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Num_GradosAcad.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Num_GradosAcad.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Num_GradosAcad.ViewValue = Convert.ToString(Principal.Num_GradosAcad.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Num_GradosAcad.ValueList, Principal.Num_GradosAcad.CurrentValue, Principal.Num_GradosAcad.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_GradosAcad.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_GradosAcad.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for Num_Extensiones
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Num_Extensiones.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Num_Extensiones.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Num_Extensiones.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Num_Extensiones.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Num_Extensiones.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Num_Extensiones.ViewValue = Convert.ToString(Principal.Num_Extensiones.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Num_Extensiones.ValueList, Principal.Num_Extensiones.CurrentValue, Principal.Num_Extensiones.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Extensiones.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Extensiones.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for Num_Becas
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Num_Becas.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Num_Becas.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Num_Becas.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Num_Becas.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Num_Becas.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Num_Becas.ViewValue = Convert.ToString(Principal.Num_Becas.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Num_Becas.ValueList, Principal.Num_Becas.CurrentValue, Principal.Num_Becas.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Becas.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Becas.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for Num_Perf
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Num_Perf.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Num_Perf.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Num_Perf.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Num_Perf.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Num_Perf.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Num_Perf.ViewValue = Convert.ToString(Principal.Num_Perf.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Num_Perf.ValueList, Principal.Num_Perf.CurrentValue, Principal.Num_Perf.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Perf.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Perf.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for Num_Idiomas
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Num_Idiomas.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Num_Idiomas.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Num_Idiomas.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Num_Idiomas.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Num_Idiomas.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Num_Idiomas.ViewValue = Convert.ToString(Principal.Num_Idiomas.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Num_Idiomas.ValueList, Principal.Num_Idiomas.CurrentValue, Principal.Num_Idiomas.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Idiomas.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Idiomas.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for Num_Publicaciones
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Num_Publicaciones.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Num_Publicaciones.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Num_Publicaciones.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Num_Publicaciones.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Num_Publicaciones.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Num_Publicaciones.ViewValue = Convert.ToString(Principal.Num_Publicaciones.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Num_Publicaciones.ValueList, Principal.Num_Publicaciones.CurrentValue, Principal.Num_Publicaciones.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Publicaciones.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Publicaciones.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for Num_ProgAcad
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Num_ProgAcad.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Num_ProgAcad.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Num_ProgAcad.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Num_ProgAcad.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Num_ProgAcad.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Num_ProgAcad.ViewValue = Convert.ToString(Principal.Num_ProgAcad.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Num_ProgAcad.ValueList, Principal.Num_ProgAcad.CurrentValue, Principal.Num_ProgAcad.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_ProgAcad.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_ProgAcad.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for Num_Membresias
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Num_Membresias.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Num_Membresias.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Num_Membresias.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Num_Membresias.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Num_Membresias.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Num_Membresias.ViewValue = Convert.ToString(Principal.Num_Membresias.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Num_Membresias.ValueList, Principal.Num_Membresias.CurrentValue, Principal.Num_Membresias.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Membresias.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Membresias.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

			' Build distinct values for Num_Investigaciones
			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Principal.Num_Investigaciones.SqlSelect, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, Principal.Num_Investigaciones.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Principal.Num_Investigaciones.DbValue = rswrk(0)
					If (Convert.IsDBNull(Principal.Num_Investigaciones.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Principal.Num_Investigaciones.CurrentValue)) Then
						bEmptyValue = True
					Else
						Principal.Num_Investigaciones.ViewValue = Convert.ToString(Principal.Num_Investigaciones.CurrentValue)
						ewrpt_SetupDistinctValues(Principal.Num_Investigaciones.ValueList, Principal.Num_Investigaciones.CurrentValue, Principal.Num_Investigaciones.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Investigaciones.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Principal.Num_Investigaciones.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
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
					ClearSessionSelection("Experiencia")
					ClearSessionSelection("Num_GradosAcad")
					ClearSessionSelection("Num_Extensiones")
					ClearSessionSelection("Num_Becas")
					ClearSessionSelection("Num_Perf")
					ClearSessionSelection("Num_Idiomas")
					ClearSessionSelection("Num_Publicaciones")
					ClearSessionSelection("Num_ProgAcad")
					ClearSessionSelection("Num_Membresias")
					ClearSessionSelection("Num_Investigaciones")
					ResetPager()
				End If
			End If

			' Load selection criteria to array
			' Get Experiencia selected values

			If (ewrpt_IsArray(ew_Session("sel_Principal_Experiencia"))) Then
				LoadSelectionFromSession("Experiencia")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Experiencia"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Experiencia.SelectionList = Nothing
			End If

			' Get Grados Acad selected values
			If (ewrpt_IsArray(ew_Session("sel_Principal_Num_GradosAcad"))) Then
				LoadSelectionFromSession("Num_GradosAcad")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Num_GradosAcad"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Num_GradosAcad.SelectionList = Nothing
			End If

			' Get Extensiones selected values
			If (ewrpt_IsArray(ew_Session("sel_Principal_Num_Extensiones"))) Then
				LoadSelectionFromSession("Num_Extensiones")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Num_Extensiones"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Num_Extensiones.SelectionList = Nothing
			End If

			' Get Becas selected values
			If (ewrpt_IsArray(ew_Session("sel_Principal_Num_Becas"))) Then
				LoadSelectionFromSession("Num_Becas")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Num_Becas"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Num_Becas.SelectionList = Nothing
			End If

			' Get Perfeccion selected values
			If (ewrpt_IsArray(ew_Session("sel_Principal_Num_Perf"))) Then
				LoadSelectionFromSession("Num_Perf")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Num_Perf"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Num_Perf.SelectionList = Nothing
			End If

			' Get Idiomas selected values
			If (ewrpt_IsArray(ew_Session("sel_Principal_Num_Idiomas"))) Then
				LoadSelectionFromSession("Num_Idiomas")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Num_Idiomas"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Num_Idiomas.SelectionList = Nothing
			End If

			' Get Publicaciones selected values
			If (ewrpt_IsArray(ew_Session("sel_Principal_Num_Publicaciones"))) Then
				LoadSelectionFromSession("Num_Publicaciones")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Num_Publicaciones"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Num_Publicaciones.SelectionList = Nothing
			End If

			' Get Programa Acad selected values
			If (ewrpt_IsArray(ew_Session("sel_Principal_Num_ProgAcad"))) Then
				LoadSelectionFromSession("Num_ProgAcad")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Num_ProgAcad"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Num_ProgAcad.SelectionList = Nothing
			End If

			' Get Membresias selected values
			If (ewrpt_IsArray(ew_Session("sel_Principal_Num_Membresias"))) Then
				LoadSelectionFromSession("Num_Membresias")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Num_Membresias"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Num_Membresias.SelectionList = Nothing
			End If

			' Get Investigaciones selected values
			If (ewrpt_IsArray(ew_Session("sel_Principal_Num_Investigaciones"))) Then
				LoadSelectionFromSession("Num_Investigaciones")
			ElseIf (ew_SameStr(ew_Session("sel_Principal_Num_Investigaciones"), EWRPT_INIT_VALUE)) Then ' Select all
				Principal.Num_Investigaciones.SelectionList = Nothing
			End If
		End Sub

		' Reset pager to starting position
		Public Sub ResetPager()
			StartGrp = 1
			Principal.StartGroup = StartGrp
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
				Principal.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Principal.StartGroup = StartGrp
			Else				
				If (Principal.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Principal.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Principal.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Principal.SqlSelectCount, Principal.SqlWhere, Principal.SqlGroupBy, Principal.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Principal.Row_Rendering()

			'
			' Render view codes
			'

			If (Principal.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUT_Profesor
				Principal.RUT_Profesor.ViewValue = Convert.ToString(Principal.RUT_Profesor.Summary)
				Principal.RUT_Profesor.CellAttrs("style") = "width: 100px;"

				' Profesor
				Principal.Profesor.ViewValue = Convert.ToString(Principal.Profesor.Summary)
				Principal.Profesor.CellAttrs("style") = "width: 200px;"

				' Experiencia
				Principal.Experiencia.ViewValue = Convert.ToString(Principal.Experiencia.Summary)
				Principal.Experiencia.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Num_GradosAcad
				Principal.Num_GradosAcad.ViewValue = Convert.ToString(Principal.Num_GradosAcad.Summary)
				Principal.Num_GradosAcad.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Num_Extensiones
				Principal.Num_Extensiones.ViewValue = Convert.ToString(Principal.Num_Extensiones.Summary)
				Principal.Num_Extensiones.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Num_Becas
				Principal.Num_Becas.ViewValue = Convert.ToString(Principal.Num_Becas.Summary)
				Principal.Num_Becas.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Num_Perf
				Principal.Num_Perf.ViewValue = Convert.ToString(Principal.Num_Perf.Summary)
				Principal.Num_Perf.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Num_Idiomas
				Principal.Num_Idiomas.ViewValue = Convert.ToString(Principal.Num_Idiomas.Summary)
				Principal.Num_Idiomas.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Num_Publicaciones
				Principal.Num_Publicaciones.ViewValue = Convert.ToString(Principal.Num_Publicaciones.Summary)
				Principal.Num_Publicaciones.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Num_ProgAcad
				Principal.Num_ProgAcad.ViewValue = Convert.ToString(Principal.Num_ProgAcad.Summary)
				Principal.Num_ProgAcad.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Num_Membresias
				Principal.Num_Membresias.ViewValue = Convert.ToString(Principal.Num_Membresias.Summary)
				Principal.Num_Membresias.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Num_Investigaciones
				Principal.Num_Investigaciones.ViewValue = Convert.ToString(Principal.Num_Investigaciones.Summary)
				Principal.Num_Investigaciones.ViewAttrs("style") = "font-weight:bold;text-align:center;"
			Else

				' RUT_Profesor
				Principal.RUT_Profesor.ViewValue = Convert.ToString(Principal.RUT_Profesor.CurrentValue)
				Principal.RUT_Profesor.CellAttrs("style") = "width: 100px;"
				Principal.RUT_Profesor.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Profesor
				Principal.Profesor.ViewValue = Convert.ToString(Principal.Profesor.CurrentValue)
				Principal.Profesor.CellAttrs("style") = "width: 200px;"
				Principal.Profesor.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Experiencia
				Principal.Experiencia.ViewValue = Convert.ToString(Principal.Experiencia.CurrentValue)
				Principal.Experiencia.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Experiencia.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num_GradosAcad
				Principal.Num_GradosAcad.ViewValue = Convert.ToString(Principal.Num_GradosAcad.CurrentValue)
				Principal.Num_GradosAcad.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Num_GradosAcad.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num_Extensiones
				Principal.Num_Extensiones.ViewValue = Convert.ToString(Principal.Num_Extensiones.CurrentValue)
				Principal.Num_Extensiones.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Num_Extensiones.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num_Becas
				Principal.Num_Becas.ViewValue = Convert.ToString(Principal.Num_Becas.CurrentValue)
				Principal.Num_Becas.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Num_Becas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num_Perf
				Principal.Num_Perf.ViewValue = Convert.ToString(Principal.Num_Perf.CurrentValue)
				Principal.Num_Perf.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Num_Perf.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num_Idiomas
				Principal.Num_Idiomas.ViewValue = Convert.ToString(Principal.Num_Idiomas.CurrentValue)
				Principal.Num_Idiomas.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Num_Idiomas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num_Publicaciones
				Principal.Num_Publicaciones.ViewValue = Convert.ToString(Principal.Num_Publicaciones.CurrentValue)
				Principal.Num_Publicaciones.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Num_Publicaciones.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num_ProgAcad
				Principal.Num_ProgAcad.ViewValue = Convert.ToString(Principal.Num_ProgAcad.CurrentValue)
				Principal.Num_ProgAcad.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Num_ProgAcad.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num_Membresias
				Principal.Num_Membresias.ViewValue = Convert.ToString(Principal.Num_Membresias.CurrentValue)
				Principal.Num_Membresias.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Num_Membresias.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num_Investigaciones
				Principal.Num_Investigaciones.ViewValue = Convert.ToString(Principal.Num_Investigaciones.CurrentValue)
				Principal.Num_Investigaciones.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Principal.Num_Investigaciones.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUT_Profesor
			Principal.RUT_Profesor.HrefValue = ""

			' Profesor
			Principal.Profesor.HrefValue = ""

			' Experiencia
			If (ew_NotEmpty(Principal.RUT.CurrentValue)) Then
				Principal.Experiencia.HrefValue = Convert.ToString(Principal.RUT.CurrentValue)
				If (ew_NotEmpty(Principal.Export)) Then Principal.Experiencia.HrefValue = ew_ConvertFullUrl(Principal.Experiencia.HrefValue)
			Else
				Principal.Experiencia.HrefValue = ""
			End If

			' Num_GradosAcad
			Principal.Num_GradosAcad.HrefValue = ""

			' Num_Extensiones
			Principal.Num_Extensiones.HrefValue = ""

			' Num_Becas
			Principal.Num_Becas.HrefValue = ""

			' Num_Perf
			Principal.Num_Perf.HrefValue = ""

			' Num_Idiomas
			Principal.Num_Idiomas.HrefValue = ""

			' Num_Publicaciones
			If (ew_NotEmpty(Principal.RUT.CurrentValue)) Then
				Principal.Num_Publicaciones.HrefValue = Convert.ToString(Principal.RUT.CurrentValue)
				If (ew_NotEmpty(Principal.Export)) Then Principal.Num_Publicaciones.HrefValue = ew_ConvertFullUrl(Principal.Num_Publicaciones.HrefValue)
			Else
				Principal.Num_Publicaciones.HrefValue = ""
			End If

			' Num_ProgAcad
			Principal.Num_ProgAcad.HrefValue = ""

			' Num_Membresias
			Principal.Num_Membresias.HrefValue = ""

			' Num_Investigaciones
			Principal.Num_Investigaciones.HrefValue = ""

			' Call Row_Rendered event
			Principal.Row_Rendered()
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

				' Field RUT_Profesor
				SetSessionFilterValues(Principal.RUT_Profesor)

				' Field Profesor
				SetSessionFilterValues(Principal.Profesor)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT_Profesor
				If (GetFilterValues(Principal.RUT_Profesor)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Profesor
				If (GetFilterValues(Principal.Profesor)) Then
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

			' Field RUT_Profesor
			GetSessionFilterValues(Principal.RUT_Profesor)

			' Field Profesor
			GetSessionFilterValues(Principal.Profesor)
		End If

		' Call page filter validated event
		Principal.Page_FilterValidated()

		' Build SQL
		' Field RUT_Profesor

		BuildExtendedFilter(Principal.RUT_Profesor, sFilter)

		' Field Profesor
		BuildExtendedFilter(Principal.Profesor, sFilter)

		' Save parms to Session
		' Field RUT_Profesor

		SetSessionFilterValues(Principal.RUT_Profesor)

		' Field Profesor
		SetSessionFilterValues(Principal.Profesor)

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
		If ew_Session("sv_Principal_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Principal_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Principal_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Principal_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Principal_" + parm)
		End If
		If ew_Session("so1_Principal_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Principal_" + parm))
		End If
		If ew_Session("sc_Principal_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Principal_" + parm))
		End If
		If ew_Session("sv2_Principal_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Principal_" + parm)
		End If
		If ew_Session("so2_Principal_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Principal_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Principal_" + parm) = fld.SearchValue
		ew_Session("so1_Principal_" + parm) = fld.SearchOperator
		ew_Session("sc_Principal_" + parm) = fld.SearchCondition
		ew_Session("sv2_Principal_" + parm) = fld.SearchValue2
		ew_Session("so2_Principal_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Principal_" + parm) = ""
		ew_Session("so1_Principal_" + parm) = "="
		ew_Session("sc_Principal_" + parm) = "AND"
		ew_Session("sv2_Principal_" + parm) = ""
		ew_Session("so2_Principal_" + parm) = "="
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
		ew_Session("sel_Principal_" & parm) = ""
		ew_Session("rf_Principal_" & parm) = ""
		ew_Session("rt_Principal_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Principal.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Principal_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Principal_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Principal_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
		' Set up default values for extended filters
			' Field RUT_Profesor

			SetDefaultExtFilter(Principal.RUT_Profesor, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Principal.RUT_Profesor)	

			' Field Profesor
			SetDefaultExtFilter(Principal.Profesor, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Principal.Profesor)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead
			' Field Experiencia

			Principal.Experiencia.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Experiencia.DefaultSelectionList.Add("value1")
			' Principal.Experiencia.DefaultSelectionList.Add("value2")

			Principal.Experiencia.SelectionList = New String(Principal.Experiencia.DefaultSelectionList.Count - 1) {}
			Principal.Experiencia.DefaultSelectionList.ToArray().CopyTo(Principal.Experiencia.SelectionList, 0)

			' Field Num_GradosAcad
			Principal.Num_GradosAcad.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Num_GradosAcad.DefaultSelectionList.Add("value1")
			' Principal.Num_GradosAcad.DefaultSelectionList.Add("value2")

			Principal.Num_GradosAcad.SelectionList = New String(Principal.Num_GradosAcad.DefaultSelectionList.Count - 1) {}
			Principal.Num_GradosAcad.DefaultSelectionList.ToArray().CopyTo(Principal.Num_GradosAcad.SelectionList, 0)

			' Field Num_Extensiones
			Principal.Num_Extensiones.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Num_Extensiones.DefaultSelectionList.Add("value1")
			' Principal.Num_Extensiones.DefaultSelectionList.Add("value2")

			Principal.Num_Extensiones.SelectionList = New String(Principal.Num_Extensiones.DefaultSelectionList.Count - 1) {}
			Principal.Num_Extensiones.DefaultSelectionList.ToArray().CopyTo(Principal.Num_Extensiones.SelectionList, 0)

			' Field Num_Becas
			Principal.Num_Becas.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Num_Becas.DefaultSelectionList.Add("value1")
			' Principal.Num_Becas.DefaultSelectionList.Add("value2")

			Principal.Num_Becas.SelectionList = New String(Principal.Num_Becas.DefaultSelectionList.Count - 1) {}
			Principal.Num_Becas.DefaultSelectionList.ToArray().CopyTo(Principal.Num_Becas.SelectionList, 0)

			' Field Num_Perf
			Principal.Num_Perf.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Num_Perf.DefaultSelectionList.Add("value1")
			' Principal.Num_Perf.DefaultSelectionList.Add("value2")

			Principal.Num_Perf.SelectionList = New String(Principal.Num_Perf.DefaultSelectionList.Count - 1) {}
			Principal.Num_Perf.DefaultSelectionList.ToArray().CopyTo(Principal.Num_Perf.SelectionList, 0)

			' Field Num_Idiomas
			Principal.Num_Idiomas.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Num_Idiomas.DefaultSelectionList.Add("value1")
			' Principal.Num_Idiomas.DefaultSelectionList.Add("value2")

			Principal.Num_Idiomas.SelectionList = New String(Principal.Num_Idiomas.DefaultSelectionList.Count - 1) {}
			Principal.Num_Idiomas.DefaultSelectionList.ToArray().CopyTo(Principal.Num_Idiomas.SelectionList, 0)

			' Field Num_Publicaciones
			Principal.Num_Publicaciones.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Num_Publicaciones.DefaultSelectionList.Add("value1")
			' Principal.Num_Publicaciones.DefaultSelectionList.Add("value2")

			Principal.Num_Publicaciones.SelectionList = New String(Principal.Num_Publicaciones.DefaultSelectionList.Count - 1) {}
			Principal.Num_Publicaciones.DefaultSelectionList.ToArray().CopyTo(Principal.Num_Publicaciones.SelectionList, 0)

			' Field Num_ProgAcad
			Principal.Num_ProgAcad.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Num_ProgAcad.DefaultSelectionList.Add("value1")
			' Principal.Num_ProgAcad.DefaultSelectionList.Add("value2")

			Principal.Num_ProgAcad.SelectionList = New String(Principal.Num_ProgAcad.DefaultSelectionList.Count - 1) {}
			Principal.Num_ProgAcad.DefaultSelectionList.ToArray().CopyTo(Principal.Num_ProgAcad.SelectionList, 0)

			' Field Num_Membresias
			Principal.Num_Membresias.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Num_Membresias.DefaultSelectionList.Add("value1")
			' Principal.Num_Membresias.DefaultSelectionList.Add("value2")

			Principal.Num_Membresias.SelectionList = New String(Principal.Num_Membresias.DefaultSelectionList.Count - 1) {}
			Principal.Num_Membresias.DefaultSelectionList.ToArray().CopyTo(Principal.Num_Membresias.SelectionList, 0)

			' Field Num_Investigaciones
			Principal.Num_Investigaciones.DefaultSelectionList.Clear()

			' Setup your default values for the popup filter below, e.g.
			' Principal.Num_Investigaciones.DefaultSelectionList.Add("value1")
			' Principal.Num_Investigaciones.DefaultSelectionList.Add("value2")

			Principal.Num_Investigaciones.SelectionList = New String(Principal.Num_Investigaciones.DefaultSelectionList.Count - 1) {}
			Principal.Num_Investigaciones.DefaultSelectionList.ToArray().CopyTo(Principal.Num_Investigaciones.SelectionList, 0)
	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT_Profesor extended filter
		If (TextFilterApplied(Principal.RUT_Profesor)) Then bFilterExist = True

		' Check Profesor extended filter
		If (TextFilterApplied(Principal.Profesor)) Then bFilterExist = True

		' Check Experiencia popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Experiencia.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Experiencia.SelectionList) Then bFilterExist = True

		' Check Num_GradosAcad popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Num_GradosAcad.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Num_GradosAcad.SelectionList) Then bFilterExist = True

		' Check Num_Extensiones popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Num_Extensiones.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Num_Extensiones.SelectionList) Then bFilterExist = True

		' Check Num_Becas popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Num_Becas.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Num_Becas.SelectionList) Then bFilterExist = True

		' Check Num_Perf popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Num_Perf.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Num_Perf.SelectionList) Then bFilterExist = True

		' Check Num_Idiomas popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Num_Idiomas.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Num_Idiomas.SelectionList) Then bFilterExist = True

		' Check Num_Publicaciones popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Num_Publicaciones.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Num_Publicaciones.SelectionList) Then bFilterExist = True

		' Check Num_ProgAcad popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Num_ProgAcad.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Num_ProgAcad.SelectionList) Then bFilterExist = True

		' Check Num_Membresias popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Num_Membresias.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Num_Membresias.SelectionList) Then bFilterExist = True

		' Check Num_Investigaciones popup filter
		If Not ewrpt_MatchedArray(CTYpe(Principal.Num_Investigaciones.DefaultSelectionList.ToArray(GetType(String)), String()), Principal.Num_Investigaciones.SelectionList) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field RUT_Profesor
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Principal.RUT_Profesor, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.RUT_Profesor.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Profesor
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Principal.Profesor, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Profesor.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Experiencia
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Experiencia.SelectionList) AndAlso Principal.Experiencia.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Experiencia.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Experiencia.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Num_GradosAcad
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Num_GradosAcad.SelectionList) AndAlso Principal.Num_GradosAcad.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Num_GradosAcad.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Num_GradosAcad.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Num_Extensiones
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Num_Extensiones.SelectionList) AndAlso Principal.Num_Extensiones.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Num_Extensiones.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Num_Extensiones.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Num_Becas
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Num_Becas.SelectionList) AndAlso Principal.Num_Becas.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Num_Becas.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Num_Becas.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Num_Perf
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Num_Perf.SelectionList) AndAlso Principal.Num_Perf.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Num_Perf.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Num_Perf.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Num_Idiomas
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Num_Idiomas.SelectionList) AndAlso Principal.Num_Idiomas.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Num_Idiomas.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Num_Idiomas.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Num_Publicaciones
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Num_Publicaciones.SelectionList) AndAlso Principal.Num_Publicaciones.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Num_Publicaciones.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Num_Publicaciones.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Num_ProgAcad
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Num_ProgAcad.SelectionList) AndAlso Principal.Num_ProgAcad.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Num_ProgAcad.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Num_ProgAcad.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Num_Membresias
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Num_Membresias.SelectionList) AndAlso Principal.Num_Membresias.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Num_Membresias.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Num_Membresias.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Num_Investigaciones
		sExtWrk = ""
		sWrk = ""
		If (ewrpt_IsArray(Principal.Num_Investigaciones.SelectionList) AndAlso Principal.Num_Investigaciones.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Principal.Num_Investigaciones.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Principal.Num_Investigaciones.FldCaption() & "<br>"
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
			If (ewrpt_IsArray(Principal.Experiencia.SelectionList) AndAlso Principal.Experiencia.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Experiencia, "Case When matricula.SEK_CV_Nums.Num_Experiencias = 0 Then Convert(Varchar(5),'0') When matricula.SEK_CV_Nums.Num_Experiencias = 1 Then Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) Else Convert(Varchar(5),matricula.SEK_CV_Nums.Num_Experiencias) End", EWRPT_DATATYPE_STRING)
			End If		
			If (ewrpt_IsArray(Principal.Num_GradosAcad.SelectionList) AndAlso Principal.Num_GradosAcad.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Num_GradosAcad, "matricula.SEK_CV_Nums.Num_GradosAcad", EWRPT_DATATYPE_NUMBER)
			End If		
			If (ewrpt_IsArray(Principal.Num_Extensiones.SelectionList) AndAlso Principal.Num_Extensiones.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Num_Extensiones, "matricula.SEK_CV_Nums.Num_Extensiones", EWRPT_DATATYPE_NUMBER)
			End If		
			If (ewrpt_IsArray(Principal.Num_Becas.SelectionList) AndAlso Principal.Num_Becas.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Num_Becas, "matricula.SEK_CV_Nums.Num_Becas", EWRPT_DATATYPE_NUMBER)
			End If		
			If (ewrpt_IsArray(Principal.Num_Perf.SelectionList) AndAlso Principal.Num_Perf.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Num_Perf, "matricula.SEK_CV_Nums.Num_Perf", EWRPT_DATATYPE_NUMBER)
			End If		
			If (ewrpt_IsArray(Principal.Num_Idiomas.SelectionList) AndAlso Principal.Num_Idiomas.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Num_Idiomas, "matricula.SEK_CV_Nums.Num_Idiomas", EWRPT_DATATYPE_NUMBER)
			End If		
			If (ewrpt_IsArray(Principal.Num_Publicaciones.SelectionList) AndAlso Principal.Num_Publicaciones.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Num_Publicaciones, "matricula.SEK_CV_Nums.Num_Publicaciones", EWRPT_DATATYPE_NUMBER)
			End If		
			If (ewrpt_IsArray(Principal.Num_ProgAcad.SelectionList) AndAlso Principal.Num_ProgAcad.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Num_ProgAcad, "matricula.SEK_CV_Nums.Num_ProgAcad", EWRPT_DATATYPE_NUMBER)
			End If		
			If (ewrpt_IsArray(Principal.Num_Membresias.SelectionList) AndAlso Principal.Num_Membresias.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Num_Membresias, "matricula.SEK_CV_Nums.Num_Membresias", EWRPT_DATATYPE_NUMBER)
			End If		
			If (ewrpt_IsArray(Principal.Num_Investigaciones.SelectionList) AndAlso Principal.Num_Investigaciones.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Principal.Num_Investigaciones, "matricula.SEK_CV_Nums.Num_Investigaciones", EWRPT_DATATYPE_NUMBER)
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
				Principal.OrderBy = ""
				Principal.StartGroup = 1
				Principal.RUT_Profesor.Sort = ""
				Principal.Profesor.Sort = ""
				Principal.Experiencia.Sort = ""
				Principal.Num_GradosAcad.Sort = ""
				Principal.Num_Extensiones.Sort = ""
				Principal.Num_Becas.Sort = ""
				Principal.Num_Perf.Sort = ""
				Principal.Num_Idiomas.Sort = ""
				Principal.Num_Publicaciones.Sort = ""
				Principal.Num_ProgAcad.Sort = ""
				Principal.Num_Membresias.Sort = ""
				Principal.Num_Investigaciones.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Principal.CurrentOrder = ew_Get("order")
			Principal.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Principal.SortSql()
			Principal.OrderBy = sSortSql
			Principal.StartGroup = 1
		End If
		Return Principal.OrderBy
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
		Principal_summary = New crPrincipal_summary(Me)
		Principal_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Principal_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Principal_summary IsNot Nothing) Then Principal_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Principal.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Principal_summary = new ewrpt_Page("Principal_summary");
// page properties
Principal_summary.PageID = "summary"; // page ID
Principal_summary.FormID = "fPrincipalsummaryfilter"; // form ID
var EWRPT_PAGE_ID = Principal_summary.PageID;
// extend page with ValidateForm function
Principal_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Principal_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Principal_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Principal_summary.ValidateRequired = false; // no JavaScript validation
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
<% Principal_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Principal.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
ewrpt_CreatePopup("Principal_Experiencia", [<%= ewrpt_GetJsData(Principal.Experiencia, Principal.Experiencia.FldType) %>]);
ewrpt_CreatePopup("Principal_Num_GradosAcad", [<%= ewrpt_GetJsData(Principal.Num_GradosAcad, Principal.Num_GradosAcad.FldType) %>]);
ewrpt_CreatePopup("Principal_Num_Extensiones", [<%= ewrpt_GetJsData(Principal.Num_Extensiones, Principal.Num_Extensiones.FldType) %>]);
ewrpt_CreatePopup("Principal_Num_Becas", [<%= ewrpt_GetJsData(Principal.Num_Becas, Principal.Num_Becas.FldType) %>]);
ewrpt_CreatePopup("Principal_Num_Perf", [<%= ewrpt_GetJsData(Principal.Num_Perf, Principal.Num_Perf.FldType) %>]);
ewrpt_CreatePopup("Principal_Num_Idiomas", [<%= ewrpt_GetJsData(Principal.Num_Idiomas, Principal.Num_Idiomas.FldType) %>]);
ewrpt_CreatePopup("Principal_Num_Publicaciones", [<%= ewrpt_GetJsData(Principal.Num_Publicaciones, Principal.Num_Publicaciones.FldType) %>]);
ewrpt_CreatePopup("Principal_Num_ProgAcad", [<%= ewrpt_GetJsData(Principal.Num_ProgAcad, Principal.Num_ProgAcad.FldType) %>]);
ewrpt_CreatePopup("Principal_Num_Membresias", [<%= ewrpt_GetJsData(Principal.Num_Membresias, Principal.Num_Membresias.FldType) %>]);
ewrpt_CreatePopup("Principal_Num_Investigaciones", [<%= ewrpt_GetJsData(Principal.Num_Investigaciones, Principal.Num_Investigaciones.FldType) %>]);
</script>
<div id="Principal_Experiencia_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Principal_Num_GradosAcad_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Principal_Num_Extensiones_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Principal_Num_Becas_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Principal_Num_Perf_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Principal_Num_Idiomas_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Principal_Num_Publicaciones_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Principal_Num_ProgAcad_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Principal_Num_Membresias_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<div id="Principal_Num_Investigaciones_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<% End If %>
<% If (Principal.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="ewTitle"><%= Principal.TableCaption() %>
<% If (Principal.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Principal_summary.ExportExcelUrl %>"><%= ReportLanguage.Phrase("ExportToExcel") %></a>
<% If (Principal_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="Principalsmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% Principal_summary.ShowMessage() %>
<% If (Principal.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Principal.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (Principal.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (Principal.FilterPanelOption = 2 OrElse (Principal.FilterPanelOption = 3 AndAlso Principal_summary.FilterApplied) OrElse Principal_summary.Filter = "0=101") Then
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
<form name="fPrincipalsummaryfilter" id="fPrincipalsummaryfilter" action="Principalsmry.aspx" class="ewForm" onsubmit="return Principal_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Principal.Num_Investigaciones.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Principal.RUT_Profesor.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_RUT_Profesor" id="so1_RUT_Profesor" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT_Profesor" id="sv1_RUT_Profesor" size="30" maxlength="24" value="<%= ew_HtmlEncode(Principal.RUT_Profesor.SearchValue) %>"<%= IIf(Principal_summary.ClearExtFilter = "Principal_RUT_Profesor", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Principal.Profesor.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_Profesor" id="so1_Profesor" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Profesor" id="sv1_Profesor" size="30" maxlength="92" value="<%= ew_HtmlEncode(Principal.Profesor.SearchValue) %>"<%= IIf(Principal_summary.ClearExtFilter = "Principal_Profesor", " class=""ewInputCleared""", "") %>>
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
<% If (Principal.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Principal_summary.ShowFilterList() %>
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
If (Principal.ExportAll AndAlso ew_NotEmpty(Principal.Export)) Then
	Principal_summary.StopGrp = Principal_summary.TotalGrps
Else
	Principal_summary.StopGrp = Principal_summary.StartGrp + Principal_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Principal_summary.StopGrp > Principal_summary.TotalGrps) Then
	Principal_summary.StopGrp = Principal_summary.TotalGrps
End If
Principal_summary.RecCount = 0

' Get first row
If (Principal_summary.TotalGrps > 0) Then
	Principal_summary.GetRow() ' ASPXRPT
	Principal_summary.GrpCount = 1
End If
While ((Principal_summary.HasRow AndAlso Principal_summary.GrpIndex < Principal_summary.StopGrp) OrElse Principal_summary.ShowFirstHeader)

	' Show header
	If (Principal_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.RUT_Profesor.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn" style="width: 100px;"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.RUT_Profesor))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.RUT_Profesor.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.RUT_Profesor) %>',0);"><%= Principal.RUT_Profesor.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.RUT_Profesor.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.RUT_Profesor.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Profesor.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn" style="width: 200px;"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Profesor))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Profesor.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Profesor) %>',0);"><%= Principal.Profesor.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Profesor.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Profesor.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Experiencia.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Experiencia))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Experiencia.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Experiencia) %>',0);"><%= Principal.Experiencia.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Experiencia.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Experiencia.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Experiencia', false, '<%= Principal.Experiencia.RangeFrom %>', '<%= Principal.Experiencia.RangeTo %>');return false;" name="x_Experiencia<%= Principal_summary.Cnt(0)(0) %>" id="x_Experiencia<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Num_GradosAcad.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Num_GradosAcad))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Num_GradosAcad.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Num_GradosAcad) %>',0);"><%= Principal.Num_GradosAcad.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Num_GradosAcad.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Num_GradosAcad.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Num_GradosAcad', false, '<%= Principal.Num_GradosAcad.RangeFrom %>', '<%= Principal.Num_GradosAcad.RangeTo %>');return false;" name="x_Num_GradosAcad<%= Principal_summary.Cnt(0)(0) %>" id="x_Num_GradosAcad<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Num_Extensiones.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Num_Extensiones))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Num_Extensiones.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Num_Extensiones) %>',0);"><%= Principal.Num_Extensiones.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Num_Extensiones.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Num_Extensiones.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Num_Extensiones', false, '<%= Principal.Num_Extensiones.RangeFrom %>', '<%= Principal.Num_Extensiones.RangeTo %>');return false;" name="x_Num_Extensiones<%= Principal_summary.Cnt(0)(0) %>" id="x_Num_Extensiones<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Num_Becas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Num_Becas))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Num_Becas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Num_Becas) %>',0);"><%= Principal.Num_Becas.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Num_Becas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Num_Becas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Num_Becas', false, '<%= Principal.Num_Becas.RangeFrom %>', '<%= Principal.Num_Becas.RangeTo %>');return false;" name="x_Num_Becas<%= Principal_summary.Cnt(0)(0) %>" id="x_Num_Becas<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Num_Perf.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Num_Perf))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Num_Perf.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Num_Perf) %>',0);"><%= Principal.Num_Perf.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Num_Perf.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Num_Perf.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Num_Perf', false, '<%= Principal.Num_Perf.RangeFrom %>', '<%= Principal.Num_Perf.RangeTo %>');return false;" name="x_Num_Perf<%= Principal_summary.Cnt(0)(0) %>" id="x_Num_Perf<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Num_Idiomas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Num_Idiomas))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Num_Idiomas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Num_Idiomas) %>',0);"><%= Principal.Num_Idiomas.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Num_Idiomas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Num_Idiomas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Num_Idiomas', false, '<%= Principal.Num_Idiomas.RangeFrom %>', '<%= Principal.Num_Idiomas.RangeTo %>');return false;" name="x_Num_Idiomas<%= Principal_summary.Cnt(0)(0) %>" id="x_Num_Idiomas<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Num_Publicaciones.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Num_Publicaciones))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Num_Publicaciones.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Num_Publicaciones) %>',0);"><%= Principal.Num_Publicaciones.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Num_Publicaciones.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Num_Publicaciones.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Num_Publicaciones', false, '<%= Principal.Num_Publicaciones.RangeFrom %>', '<%= Principal.Num_Publicaciones.RangeTo %>');return false;" name="x_Num_Publicaciones<%= Principal_summary.Cnt(0)(0) %>" id="x_Num_Publicaciones<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Num_ProgAcad.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Num_ProgAcad))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Num_ProgAcad.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Num_ProgAcad) %>',0);"><%= Principal.Num_ProgAcad.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Num_ProgAcad.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Num_ProgAcad.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Num_ProgAcad', false, '<%= Principal.Num_ProgAcad.RangeFrom %>', '<%= Principal.Num_ProgAcad.RangeTo %>');return false;" name="x_Num_ProgAcad<%= Principal_summary.Cnt(0)(0) %>" id="x_Num_ProgAcad<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Num_Membresias.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Num_Membresias))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Num_Membresias.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Num_Membresias) %>',0);"><%= Principal.Num_Membresias.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Num_Membresias.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Num_Membresias.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Num_Membresias', false, '<%= Principal.Num_Membresias.RangeFrom %>', '<%= Principal.Num_Membresias.RangeTo %>');return false;" name="x_Num_Membresias<%= Principal_summary.Cnt(0)(0) %>" id="x_Num_Membresias<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Principal.Export)) Then %>
<%= Principal.Num_Investigaciones.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Principal.SortUrl(Principal.Num_Investigaciones))) Then %>
		<td style="vertical-align: bottom;"><%= Principal.Num_Investigaciones.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Principal.SortUrl(Principal.Num_Investigaciones) %>',0);"><%= Principal.Num_Investigaciones.FldCaption() %></td><td style="width: 10px;">
		<% If (Principal.Num_Investigaciones.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Principal.Num_Investigaciones.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Principal_Num_Investigaciones', false, '<%= Principal.Num_Investigaciones.RangeFrom %>', '<%= Principal.Num_Investigaciones.RangeTo %>');return false;" name="x_Num_Investigaciones<%= Principal_summary.Cnt(0)(0) %>" id="x_Num_Investigaciones<%= Principal_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Principal_summary.ShowFirstHeader = False
	End If
	Principal_summary.RecCount += 1

		' Render detail row
		Principal.ResetCSS()
		Principal.RowType = EWRPT_ROWTYPE_DETAIL
		Principal_summary.RenderRow()
%>
	<tr<%= Principal.RowAttributes() %>>
		<td<%= Principal.RUT_Profesor.CellAttributes %>>
<div<%= Principal.RUT_Profesor.ViewAttributes%>><%= Principal.RUT_Profesor.ListViewValue%></div>
</td>
		<td<%= Principal.Profesor.CellAttributes %>>
<div<%= Principal.Profesor.ViewAttributes%>><%= Principal.Profesor.ListViewValue%></div>
</td>
		<td<%= Principal.Experiencia.CellAttributes %>>
<div<%= Principal.Experiencia.ViewAttributes%>>
<% If (Principal.Experiencia.ListViewValue <> "0") Then %>
<a href="http://zonareportes.uisek.cl/doc/default.asp?acc=EN0000&file=Experienciasmry&dir=ReporteCV/Experiencia&var=sv1_RUT_Profesor&sv1_RUT_Profesor=<%= Principal.Experiencia.HrefValue %>" target="_blank"><%= Principal.Experiencia.ListViewValue%></a>
<% Else %>
<%= Principal.Experiencia.ListViewValue%>
<% End If %>
</div>
</td>
		<td<%= Principal.Num_GradosAcad.CellAttributes %>>
<div<%= Principal.Num_GradosAcad.ViewAttributes%>><%= Principal.Num_GradosAcad.ListViewValue%></div>
</td>
		<td<%= Principal.Num_Extensiones.CellAttributes %>>
<div<%= Principal.Num_Extensiones.ViewAttributes%>><%= Principal.Num_Extensiones.ListViewValue%></div>
</td>
		<td<%= Principal.Num_Becas.CellAttributes %>>
<div<%= Principal.Num_Becas.ViewAttributes%>><%= Principal.Num_Becas.ListViewValue%></div>
</td>
		<td<%= Principal.Num_Perf.CellAttributes %>>
<div<%= Principal.Num_Perf.ViewAttributes%>><%= Principal.Num_Perf.ListViewValue%></div>
</td>
		<td<%= Principal.Num_Idiomas.CellAttributes %>>
<div<%= Principal.Num_Idiomas.ViewAttributes%>><%= Principal.Num_Idiomas.ListViewValue%></div>
</td>
		<td<%= Principal.Num_Publicaciones.CellAttributes %>>
<div<%= Principal.Num_Publicaciones.ViewAttributes%>>
<% If (Principal.Num_Publicaciones.ListViewValue <> "0") Then %>
<a href="http://zonareportes.uisek.cl/doc/default.asp?acc=EN0000&file=Publicacionessmry&dir=ReporteCV/Publicaciones&var=sv1_RUT_Profesor&sv1_RUT_Profesor=<%= Principal.Num_Publicaciones.HrefValue %>" target="_blank"><%= Principal.Num_Publicaciones.ListViewValue%></a>
<% Else %>
<%= Principal.Num_Publicaciones.ListViewValue%>
<% End If %>
</div>
</td>
		<td<%= Principal.Num_ProgAcad.CellAttributes %>>
<div<%= Principal.Num_ProgAcad.ViewAttributes%>><%= Principal.Num_ProgAcad.ListViewValue%></div>
</td>
		<td<%= Principal.Num_Membresias.CellAttributes %>>
<div<%= Principal.Num_Membresias.ViewAttributes%>><%= Principal.Num_Membresias.ListViewValue%></div>
</td>
		<td<%= Principal.Num_Investigaciones.CellAttributes %>>
<div<%= Principal.Num_Investigaciones.ViewAttributes%>><%= Principal.Num_Investigaciones.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Principal_summary.AccumulateSummary()

		' Get next record
		Principal_summary.GetRow() ' ASPXRPT
		Principal_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Principal_summary.TotalGrps > 0) Then
	Principal.ResetCSS()
	Principal.RowType = EWRPT_ROWTYPE_TOTAL
	Principal.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Principal.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Principal.RowAttrs("class") = "ewRptGrandSummary"
	Principal_summary.RenderRow()
%>
	<!-- tr><td colspan="12"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Principal.RowAttributes() %>><td colspan="12"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Principal_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Principal.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Principal_summary.Pager Is Nothing Then Principal_summary.Pager = New cPrevNextPager(Principal_summary.StartGrp, Principal_summary.DisplayGrps, Principal_summary.TotalGrps) %>
<% If Principal_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Principal_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Principalsmry.aspx?start=<%= Principal_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Principal_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Principalsmry.aspx?start=<%= Principal_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Principal_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Principal_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Principalsmry.aspx?start=<%= Principal_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Principal_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Principalsmry.aspx?start=<%= Principal_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Principal_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Principal_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Principal_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Principal_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Principal_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Principal_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Principal_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Principal_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Principal_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Principal.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Principal.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Principal.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Principal_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Principal.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
