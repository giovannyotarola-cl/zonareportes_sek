<%@ Page ClassName="AlumnosDerechoExamensmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public AlumnosDerechoExamen As crAlumnosDerechoExamen = Nothing

	'
	' Table class (for AlumnosDerechoExamen)
	'
	Public Class crAlumnosDerechoExamen
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
				Return "AlumnosDerechoExamen"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "AlumnosDerechoExamen"
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

		Public CODRAMO As crField

		Public RAMO As crField

		Public CODSECC As crField

		Public Profesor As crField

		Public ANO As crField

		Public PERIODO As crField

		Public JORNADA As crField

		Public CREDITO As crField

		Public TipoRamo As crField

		Public CODCLI As crField

		Public RUT As crField

		Public DIG As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRE As crField

		Public ASISTENCIA As crField

		Public NP As crField

		Public Deuda As crField

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
			NOMBRE_C = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' CODRAMO
			CODRAMO = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_CODRAMO", "CODRAMO", "[CODRAMO]", 200, EWRPT_DATATYPE_STRING, -1)
			CODRAMO.Page = APage
			CODRAMO.ParentPage = APage.ParentPage
			Fields.Add("CODRAMO", CODRAMO)
			CODRAMO.DateFilter = ""
			CODRAMO.SqlSelect = ""
			CODRAMO.SqlOrderBy = ""

			' RAMO
			RAMO = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_RAMO", "RAMO", "[RAMO]", 200, EWRPT_DATATYPE_STRING, -1)
			RAMO.Page = APage
			RAMO.ParentPage = APage.ParentPage
			Fields.Add("RAMO", RAMO)
			RAMO.DateFilter = ""
			RAMO.SqlSelect = ""
			RAMO.SqlOrderBy = ""

			' CODSECC
			CODSECC = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_CODSECC", "CODSECC", "[CODSECC]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CODSECC.Page = APage
			CODSECC.ParentPage = APage.ParentPage
			CODSECC.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CODSECC", CODSECC)
			CODSECC.DateFilter = ""
			CODSECC.SqlSelect = ""
			CODSECC.SqlOrderBy = ""

			' Profesor
			Profesor = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_Profesor", "Profesor", "[Profesor]", 200, EWRPT_DATATYPE_STRING, -1)
			Profesor.Page = APage
			Profesor.ParentPage = APage.ParentPage
			Fields.Add("Profesor", Profesor)
			Profesor.DateFilter = ""
			Profesor.SqlSelect = ""
			Profesor.SqlOrderBy = ""

			' ANO
			ANO = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_ANO", "ANO", "[ANO]", 200, EWRPT_DATATYPE_STRING, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_PERIODO", "PERIODO", "[PERIODO]", 200, EWRPT_DATATYPE_STRING, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' JORNADA
			JORNADA = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			JORNADA.Page = APage
			JORNADA.ParentPage = APage.ParentPage
			Fields.Add("JORNADA", JORNADA)
			JORNADA.DateFilter = ""
			JORNADA.SqlSelect = ""
			JORNADA.SqlOrderBy = ""

			' CREDITO
			CREDITO = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_CREDITO", "CREDITO", "[CREDITO]", 3, EWRPT_DATATYPE_NUMBER, -1)
			CREDITO.Page = APage
			CREDITO.ParentPage = APage.ParentPage
			CREDITO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("CREDITO", CREDITO)
			CREDITO.DateFilter = ""
			CREDITO.SqlSelect = ""
			CREDITO.SqlOrderBy = ""

			' TipoRamo
			TipoRamo = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_TipoRamo", "TipoRamo", "[TipoRamo]", 200, EWRPT_DATATYPE_STRING, -1)
			TipoRamo.Page = APage
			TipoRamo.ParentPage = APage.ParentPage
			Fields.Add("TipoRamo", TipoRamo)
			TipoRamo.DateFilter = ""
			TipoRamo.SqlSelect = ""
			TipoRamo.SqlOrderBy = ""

			' CODCLI
			CODCLI = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCLI.Page = APage
			CODCLI.ParentPage = APage.ParentPage
			Fields.Add("CODCLI", CODCLI)
			CODCLI.DateFilter = ""
			CODCLI.SqlSelect = ""
			CODCLI.SqlOrderBy = ""

			' RUT
			RUT = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' DIG
			DIG = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
			DIG.Page = APage
			DIG.ParentPage = APage.ParentPage
			Fields.Add("DIG", DIG)
			DIG.DateFilter = ""
			DIG.SqlSelect = ""
			DIG.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' ASISTENCIA
			ASISTENCIA = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_ASISTENCIA", "ASISTENCIA", "[ASISTENCIA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ASISTENCIA.Page = APage
			ASISTENCIA.ParentPage = APage.ParentPage
			ASISTENCIA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ASISTENCIA", ASISTENCIA)
			ASISTENCIA.DateFilter = ""
			ASISTENCIA.SqlSelect = ""
			ASISTENCIA.SqlOrderBy = ""

			' NP
			NP = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_NP", "NP", "[NP]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NP.Page = APage
			NP.ParentPage = APage.ParentPage
			NP.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NP", NP)
			NP.DateFilter = ""
			NP.SqlSelect = ""
			NP.SqlOrderBy = ""

			' Deuda
			Deuda = new crField("AlumnosDerechoExamen", "AlumnosDerechoExamen", "x_Deuda", "Deuda", "[Deuda]", 200, EWRPT_DATATYPE_STRING, -1)
			Deuda.Page = APage
			Deuda.ParentPage = APage.ParentPage
			Fields.Add("Deuda", Deuda)
			Deuda.DateFilter = ""
			Deuda.SqlSelect = ""
			Deuda.SqlOrderBy = ""
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
				Return "[SEK_Alumnos_DerechoExamen]"
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
	Public AlumnosDerechoExamen_summary As crAlumnosDerechoExamen_summary

	'
	' Page class
	'
	Public Class crAlumnosDerechoExamen_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (AlumnosDerechoExamen.UseTokenInUrl) Then
				sUrl &= "t=" & AlumnosDerechoExamen.TableVar & "&" ' Add page token
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
			If (AlumnosDerechoExamen.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(AlumnosDerechoExamen.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(AlumnosDerechoExamen.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As AlumnosDerechoExamensmry 
			Get
				Return CType(m_ParentPage, AlumnosDerechoExamensmry)
			End Get
		End Property

		' Table object (AlumnosDerechoExamen)
		Public Property AlumnosDerechoExamen As crAlumnosDerechoExamen 
			Get		
				Return AspNetPage.AlumnosDerechoExamen ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAlumnosDerechoExamen)
				AspNetPage.AlumnosDerechoExamen = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "AlumnosDerechoExamen_summary"
			m_PageObjTypeName = "crAlumnosDerechoExamen_summary"

			' Table name
			m_TableName = "AlumnosDerechoExamen"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (AlumnosDerechoExamen)
			AlumnosDerechoExamen = New crAlumnosDerechoExamen(Me)			

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
				AlumnosDerechoExamen.Export = ew_Get("export")
			End If
			gsExport = AlumnosDerechoExamen.Export ' Get export parameter, used in header
			gsExportFile = AlumnosDerechoExamen.TableVar ' Get export file, used in header
			If (AlumnosDerechoExamen.Export = "excel") Then
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

		Public Val As Object() = New Object(19) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(19) {}

		Public GrandMn As Object() = New Object(19) {}

		Public GrandMx As Object() = New Object(19) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 20 ' No. of fields
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
			AlumnosDerechoExamen.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(AlumnosDerechoExamen.SqlSelect, AlumnosDerechoExamen.SqlWhere, AlumnosDerechoExamen.SqlGroupBy, AlumnosDerechoExamen.SqlHaving, AlumnosDerechoExamen.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (AlumnosDerechoExamen.ExportAll AndAlso ew_NotEmpty(AlumnosDerechoExamen.Export)) Then
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
				AlumnosDerechoExamen.NOMBRE_C.DbValue = Row("NOMBRE_C")
				AlumnosDerechoExamen.CODRAMO.DbValue = Row("CODRAMO")
				AlumnosDerechoExamen.RAMO.DbValue = Row("RAMO")
				AlumnosDerechoExamen.CODSECC.DbValue = Row("CODSECC")
				AlumnosDerechoExamen.Profesor.DbValue = Row("Profesor")
				AlumnosDerechoExamen.ANO.DbValue = Row("ANO")
				AlumnosDerechoExamen.PERIODO.DbValue = Row("PERIODO")
				AlumnosDerechoExamen.JORNADA.DbValue = Row("JORNADA")
				AlumnosDerechoExamen.CREDITO.DbValue = Row("CREDITO")
				AlumnosDerechoExamen.TipoRamo.DbValue = Row("TipoRamo")
				AlumnosDerechoExamen.CODCLI.DbValue = Row("CODCLI")
				AlumnosDerechoExamen.RUT.DbValue = Row("RUT")
				AlumnosDerechoExamen.DIG.DbValue = Row("DIG")
				AlumnosDerechoExamen.PATERNO.DbValue = Row("PATERNO")
				AlumnosDerechoExamen.MATERNO.DbValue = Row("MATERNO")
				AlumnosDerechoExamen.NOMBRE.DbValue = Row("NOMBRE")
				AlumnosDerechoExamen.ASISTENCIA.DbValue = Row("ASISTENCIA")
				AlumnosDerechoExamen.NP.DbValue = Row("NP")
				AlumnosDerechoExamen.Deuda.DbValue = Row("Deuda")
				Val(1) = AlumnosDerechoExamen.NOMBRE_C.CurrentValue
				Val(2) = AlumnosDerechoExamen.CODRAMO.CurrentValue
				Val(3) = AlumnosDerechoExamen.RAMO.CurrentValue
				Val(4) = AlumnosDerechoExamen.CODSECC.CurrentValue
				Val(5) = AlumnosDerechoExamen.Profesor.CurrentValue
				Val(6) = AlumnosDerechoExamen.ANO.CurrentValue
				Val(7) = AlumnosDerechoExamen.PERIODO.CurrentValue
				Val(8) = AlumnosDerechoExamen.JORNADA.CurrentValue
				Val(9) = AlumnosDerechoExamen.CREDITO.CurrentValue
				Val(10) = AlumnosDerechoExamen.TipoRamo.CurrentValue
				Val(11) = AlumnosDerechoExamen.CODCLI.CurrentValue
				Val(12) = AlumnosDerechoExamen.RUT.CurrentValue
				Val(13) = AlumnosDerechoExamen.DIG.CurrentValue
				Val(14) = AlumnosDerechoExamen.PATERNO.CurrentValue
				Val(15) = AlumnosDerechoExamen.MATERNO.CurrentValue
				Val(16) = AlumnosDerechoExamen.NOMBRE.CurrentValue
				Val(17) = AlumnosDerechoExamen.ASISTENCIA.CurrentValue
				Val(18) = AlumnosDerechoExamen.NP.CurrentValue
				Val(19) = AlumnosDerechoExamen.Deuda.CurrentValue
			Else
				AlumnosDerechoExamen.NOMBRE_C.DbValue = ""
				AlumnosDerechoExamen.CODRAMO.DbValue = ""
				AlumnosDerechoExamen.RAMO.DbValue = ""
				AlumnosDerechoExamen.CODSECC.DbValue = ""
				AlumnosDerechoExamen.Profesor.DbValue = ""
				AlumnosDerechoExamen.ANO.DbValue = ""
				AlumnosDerechoExamen.PERIODO.DbValue = ""
				AlumnosDerechoExamen.JORNADA.DbValue = ""
				AlumnosDerechoExamen.CREDITO.DbValue = ""
				AlumnosDerechoExamen.TipoRamo.DbValue = ""
				AlumnosDerechoExamen.CODCLI.DbValue = ""
				AlumnosDerechoExamen.RUT.DbValue = ""
				AlumnosDerechoExamen.DIG.DbValue = ""
				AlumnosDerechoExamen.PATERNO.DbValue = ""
				AlumnosDerechoExamen.MATERNO.DbValue = ""
				AlumnosDerechoExamen.NOMBRE.DbValue = ""
				AlumnosDerechoExamen.ASISTENCIA.DbValue = ""
				AlumnosDerechoExamen.NP.DbValue = ""
				AlumnosDerechoExamen.Deuda.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				AlumnosDerechoExamen.NOMBRE_C.DbValue = dr("NOMBRE_C")
				AlumnosDerechoExamen.CODRAMO.DbValue = dr("CODRAMO")
				AlumnosDerechoExamen.RAMO.DbValue = dr("RAMO")
				AlumnosDerechoExamen.CODSECC.DbValue = dr("CODSECC")
				AlumnosDerechoExamen.Profesor.DbValue = dr("Profesor")
				AlumnosDerechoExamen.ANO.DbValue = dr("ANO")
				AlumnosDerechoExamen.PERIODO.DbValue = dr("PERIODO")
				AlumnosDerechoExamen.JORNADA.DbValue = dr("JORNADA")
				AlumnosDerechoExamen.CREDITO.DbValue = dr("CREDITO")
				AlumnosDerechoExamen.TipoRamo.DbValue = dr("TipoRamo")
				AlumnosDerechoExamen.CODCLI.DbValue = dr("CODCLI")
				AlumnosDerechoExamen.RUT.DbValue = dr("RUT")
				AlumnosDerechoExamen.DIG.DbValue = dr("DIG")
				AlumnosDerechoExamen.PATERNO.DbValue = dr("PATERNO")
				AlumnosDerechoExamen.MATERNO.DbValue = dr("MATERNO")
				AlumnosDerechoExamen.NOMBRE.DbValue = dr("NOMBRE")
				AlumnosDerechoExamen.ASISTENCIA.DbValue = dr("ASISTENCIA")
				AlumnosDerechoExamen.NP.DbValue = dr("NP")
				AlumnosDerechoExamen.Deuda.DbValue = dr("Deuda")
				Val(1) = AlumnosDerechoExamen.NOMBRE_C.CurrentValue
				Val(2) = AlumnosDerechoExamen.CODRAMO.CurrentValue
				Val(3) = AlumnosDerechoExamen.RAMO.CurrentValue
				Val(4) = AlumnosDerechoExamen.CODSECC.CurrentValue
				Val(5) = AlumnosDerechoExamen.Profesor.CurrentValue
				Val(6) = AlumnosDerechoExamen.ANO.CurrentValue
				Val(7) = AlumnosDerechoExamen.PERIODO.CurrentValue
				Val(8) = AlumnosDerechoExamen.JORNADA.CurrentValue
				Val(9) = AlumnosDerechoExamen.CREDITO.CurrentValue
				Val(10) = AlumnosDerechoExamen.TipoRamo.CurrentValue
				Val(11) = AlumnosDerechoExamen.CODCLI.CurrentValue
				Val(12) = AlumnosDerechoExamen.RUT.CurrentValue
				Val(13) = AlumnosDerechoExamen.DIG.CurrentValue
				Val(14) = AlumnosDerechoExamen.PATERNO.CurrentValue
				Val(15) = AlumnosDerechoExamen.MATERNO.CurrentValue
				Val(16) = AlumnosDerechoExamen.NOMBRE.CurrentValue
				Val(17) = AlumnosDerechoExamen.ASISTENCIA.CurrentValue
				Val(18) = AlumnosDerechoExamen.NP.CurrentValue
				Val(19) = AlumnosDerechoExamen.Deuda.CurrentValue
			Else				
				AlumnosDerechoExamen.NOMBRE_C.DbValue = ""
				AlumnosDerechoExamen.CODRAMO.DbValue = ""
				AlumnosDerechoExamen.RAMO.DbValue = ""
				AlumnosDerechoExamen.CODSECC.DbValue = ""
				AlumnosDerechoExamen.Profesor.DbValue = ""
				AlumnosDerechoExamen.ANO.DbValue = ""
				AlumnosDerechoExamen.PERIODO.DbValue = ""
				AlumnosDerechoExamen.JORNADA.DbValue = ""
				AlumnosDerechoExamen.CREDITO.DbValue = ""
				AlumnosDerechoExamen.TipoRamo.DbValue = ""
				AlumnosDerechoExamen.CODCLI.DbValue = ""
				AlumnosDerechoExamen.RUT.DbValue = ""
				AlumnosDerechoExamen.DIG.DbValue = ""
				AlumnosDerechoExamen.PATERNO.DbValue = ""
				AlumnosDerechoExamen.MATERNO.DbValue = ""
				AlumnosDerechoExamen.NOMBRE.DbValue = ""
				AlumnosDerechoExamen.ASISTENCIA.DbValue = ""
				AlumnosDerechoExamen.NP.DbValue = ""
				AlumnosDerechoExamen.Deuda.DbValue = ""
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
				AlumnosDerechoExamen.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					AlumnosDerechoExamen.StartGroup = StartGrp
				Else
					StartGrp = AlumnosDerechoExamen.StartGroup
				End If
			Else
				StartGrp = AlumnosDerechoExamen.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				AlumnosDerechoExamen.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				AlumnosDerechoExamen.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				AlumnosDerechoExamen.StartGroup = StartGrp
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
			AlumnosDerechoExamen.StartGroup = StartGrp
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
				AlumnosDerechoExamen.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				AlumnosDerechoExamen.StartGroup = StartGrp
			Else				
				If (AlumnosDerechoExamen.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(AlumnosDerechoExamen.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 15 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (AlumnosDerechoExamen.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(AlumnosDerechoExamen.SqlSelectCount, AlumnosDerechoExamen.SqlWhere, AlumnosDerechoExamen.SqlGroupBy, AlumnosDerechoExamen.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			AlumnosDerechoExamen.Row_Rendering()

			'
			' Render view codes
			'

			If (AlumnosDerechoExamen.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' NOMBRE_C
				AlumnosDerechoExamen.NOMBRE_C.ViewValue = Convert.ToString(AlumnosDerechoExamen.NOMBRE_C.Summary)

				' CODRAMO
				AlumnosDerechoExamen.CODRAMO.ViewValue = Convert.ToString(AlumnosDerechoExamen.CODRAMO.Summary)

				' RAMO
				AlumnosDerechoExamen.RAMO.ViewValue = Convert.ToString(AlumnosDerechoExamen.RAMO.Summary)

				' CODSECC
				AlumnosDerechoExamen.CODSECC.ViewValue = Convert.ToString(AlumnosDerechoExamen.CODSECC.Summary)

				' Profesor
				AlumnosDerechoExamen.Profesor.ViewValue = Convert.ToString(AlumnosDerechoExamen.Profesor.Summary)

				' ANO
				AlumnosDerechoExamen.ANO.ViewValue = Convert.ToString(AlumnosDerechoExamen.ANO.Summary)

				' PERIODO
				AlumnosDerechoExamen.PERIODO.ViewValue = Convert.ToString(AlumnosDerechoExamen.PERIODO.Summary)

				' JORNADA
				AlumnosDerechoExamen.JORNADA.ViewValue = Convert.ToString(AlumnosDerechoExamen.JORNADA.Summary)

				' CREDITO
				AlumnosDerechoExamen.CREDITO.ViewValue = Convert.ToString(AlumnosDerechoExamen.CREDITO.Summary)

				' TipoRamo
				AlumnosDerechoExamen.TipoRamo.ViewValue = Convert.ToString(AlumnosDerechoExamen.TipoRamo.Summary)

				' CODCLI
				AlumnosDerechoExamen.CODCLI.ViewValue = Convert.ToString(AlumnosDerechoExamen.CODCLI.Summary)

				' RUT
				AlumnosDerechoExamen.RUT.ViewValue = Convert.ToString(AlumnosDerechoExamen.RUT.Summary)

				' DIG
				AlumnosDerechoExamen.DIG.ViewValue = Convert.ToString(AlumnosDerechoExamen.DIG.Summary)

				' PATERNO
				AlumnosDerechoExamen.PATERNO.ViewValue = Convert.ToString(AlumnosDerechoExamen.PATERNO.Summary)

				' MATERNO
				AlumnosDerechoExamen.MATERNO.ViewValue = Convert.ToString(AlumnosDerechoExamen.MATERNO.Summary)

				' NOMBRE
				AlumnosDerechoExamen.NOMBRE.ViewValue = Convert.ToString(AlumnosDerechoExamen.NOMBRE.Summary)

				' ASISTENCIA
				AlumnosDerechoExamen.ASISTENCIA.ViewValue = Convert.ToString(AlumnosDerechoExamen.ASISTENCIA.Summary)
				AlumnosDerechoExamen.ASISTENCIA.ViewAttrs("style") = "text-align:center;"

				' NP
				AlumnosDerechoExamen.NP.ViewValue = Convert.ToString(AlumnosDerechoExamen.NP.Summary)

				' Deuda
				AlumnosDerechoExamen.Deuda.ViewValue = Convert.ToString(AlumnosDerechoExamen.Deuda.Summary)
				AlumnosDerechoExamen.Deuda.ViewAttrs("style") = "font-weight:bold;text-align:center;"
			Else

				' NOMBRE_C
				AlumnosDerechoExamen.NOMBRE_C.ViewValue = Convert.ToString(AlumnosDerechoExamen.NOMBRE_C.CurrentValue)
				AlumnosDerechoExamen.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODRAMO
				AlumnosDerechoExamen.CODRAMO.ViewValue = Convert.ToString(AlumnosDerechoExamen.CODRAMO.CurrentValue)
				AlumnosDerechoExamen.CODRAMO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RAMO
				AlumnosDerechoExamen.RAMO.ViewValue = Convert.ToString(AlumnosDerechoExamen.RAMO.CurrentValue)
				AlumnosDerechoExamen.RAMO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODSECC
				AlumnosDerechoExamen.CODSECC.ViewValue = Convert.ToString(AlumnosDerechoExamen.CODSECC.CurrentValue)
				AlumnosDerechoExamen.CODSECC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Profesor
				AlumnosDerechoExamen.Profesor.ViewValue = Convert.ToString(AlumnosDerechoExamen.Profesor.CurrentValue)
				AlumnosDerechoExamen.Profesor.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				AlumnosDerechoExamen.ANO.ViewValue = Convert.ToString(AlumnosDerechoExamen.ANO.CurrentValue)
				AlumnosDerechoExamen.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO
				AlumnosDerechoExamen.PERIODO.ViewValue = Convert.ToString(AlumnosDerechoExamen.PERIODO.CurrentValue)
				AlumnosDerechoExamen.PERIODO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' JORNADA
				AlumnosDerechoExamen.JORNADA.ViewValue = Convert.ToString(AlumnosDerechoExamen.JORNADA.CurrentValue)
				AlumnosDerechoExamen.JORNADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CREDITO
				AlumnosDerechoExamen.CREDITO.ViewValue = Convert.ToString(AlumnosDerechoExamen.CREDITO.CurrentValue)
				AlumnosDerechoExamen.CREDITO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TipoRamo
				AlumnosDerechoExamen.TipoRamo.ViewValue = Convert.ToString(AlumnosDerechoExamen.TipoRamo.CurrentValue)
				AlumnosDerechoExamen.TipoRamo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCLI
				AlumnosDerechoExamen.CODCLI.ViewValue = Convert.ToString(AlumnosDerechoExamen.CODCLI.CurrentValue)
				AlumnosDerechoExamen.CODCLI.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				AlumnosDerechoExamen.RUT.ViewValue = Convert.ToString(AlumnosDerechoExamen.RUT.CurrentValue)
				AlumnosDerechoExamen.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIG
				AlumnosDerechoExamen.DIG.ViewValue = Convert.ToString(AlumnosDerechoExamen.DIG.CurrentValue)
				AlumnosDerechoExamen.DIG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				AlumnosDerechoExamen.PATERNO.ViewValue = Convert.ToString(AlumnosDerechoExamen.PATERNO.CurrentValue)
				AlumnosDerechoExamen.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				AlumnosDerechoExamen.MATERNO.ViewValue = Convert.ToString(AlumnosDerechoExamen.MATERNO.CurrentValue)
				AlumnosDerechoExamen.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				AlumnosDerechoExamen.NOMBRE.ViewValue = Convert.ToString(AlumnosDerechoExamen.NOMBRE.CurrentValue)
				AlumnosDerechoExamen.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ASISTENCIA
				AlumnosDerechoExamen.ASISTENCIA.ViewValue = Convert.ToString(AlumnosDerechoExamen.ASISTENCIA.CurrentValue)
				AlumnosDerechoExamen.ASISTENCIA.ViewAttrs("style") = "text-align:center;"
				AlumnosDerechoExamen.ASISTENCIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NP
				AlumnosDerechoExamen.NP.ViewValue = Convert.ToString(AlumnosDerechoExamen.NP.CurrentValue)
				AlumnosDerechoExamen.NP.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Deuda
				AlumnosDerechoExamen.Deuda.ViewValue = Convert.ToString(AlumnosDerechoExamen.Deuda.CurrentValue)
				AlumnosDerechoExamen.Deuda.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				AlumnosDerechoExamen.Deuda.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' NOMBRE_C
			AlumnosDerechoExamen.NOMBRE_C.HrefValue = ""

			' CODRAMO
			AlumnosDerechoExamen.CODRAMO.HrefValue = ""

			' RAMO
			AlumnosDerechoExamen.RAMO.HrefValue = ""

			' CODSECC
			AlumnosDerechoExamen.CODSECC.HrefValue = ""

			' Profesor
			AlumnosDerechoExamen.Profesor.HrefValue = ""

			' ANO
			AlumnosDerechoExamen.ANO.HrefValue = ""

			' PERIODO
			AlumnosDerechoExamen.PERIODO.HrefValue = ""

			' JORNADA
			AlumnosDerechoExamen.JORNADA.HrefValue = ""

			' CREDITO
			AlumnosDerechoExamen.CREDITO.HrefValue = ""

			' TipoRamo
			AlumnosDerechoExamen.TipoRamo.HrefValue = ""

			' CODCLI
			AlumnosDerechoExamen.CODCLI.HrefValue = ""

			' RUT
			AlumnosDerechoExamen.RUT.HrefValue = ""

			' DIG
			AlumnosDerechoExamen.DIG.HrefValue = ""

			' PATERNO
			AlumnosDerechoExamen.PATERNO.HrefValue = ""

			' MATERNO
			AlumnosDerechoExamen.MATERNO.HrefValue = ""

			' NOMBRE
			AlumnosDerechoExamen.NOMBRE.HrefValue = ""

			' ASISTENCIA
			AlumnosDerechoExamen.ASISTENCIA.HrefValue = ""

			' NP
			AlumnosDerechoExamen.NP.HrefValue = ""

			' Deuda
			AlumnosDerechoExamen.Deuda.HrefValue = ""

			' Call Row_Rendered event
			AlumnosDerechoExamen.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + AlumnosDerechoExamen.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosDerechoExamen.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosDerechoExamen.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field RAMO
			sSelect = "SELECT DISTINCT [RAMO] FROM " + AlumnosDerechoExamen.SqlFrom
			sOrderBy = "[RAMO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosDerechoExamen.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosDerechoExamen.RAMO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO
			sSelect = "SELECT DISTINCT [ANO] FROM " + AlumnosDerechoExamen.SqlFrom
			sOrderBy = "[ANO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosDerechoExamen.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosDerechoExamen.ANO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PERIODO
			sSelect = "SELECT DISTINCT [PERIODO] FROM " + AlumnosDerechoExamen.SqlFrom
			sOrderBy = "[PERIODO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosDerechoExamen.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosDerechoExamen.PERIODO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Deuda
			sSelect = "SELECT DISTINCT [Deuda] FROM " + AlumnosDerechoExamen.SqlFrom
			sOrderBy = "[Deuda] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosDerechoExamen.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosDerechoExamen.Deuda.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionDropDownValue(AlumnosDerechoExamen.NOMBRE_C.DropDownValue, AlumnosDerechoExamen.NOMBRE_C)

				' Field RAMO
				SetSessionDropDownValue(AlumnosDerechoExamen.RAMO.DropDownValue, AlumnosDerechoExamen.RAMO)

				' Field Profesor
				SetSessionFilterValues(AlumnosDerechoExamen.Profesor)

				' Field ANO
				SetSessionDropDownValue(AlumnosDerechoExamen.ANO.DropDownValue, AlumnosDerechoExamen.ANO)

				' Field PERIODO
				SetSessionDropDownValue(AlumnosDerechoExamen.PERIODO.DropDownValue, AlumnosDerechoExamen.PERIODO)

				' Field RUT
				SetSessionFilterValues(AlumnosDerechoExamen.RUT)

				' Field PATERNO
				SetSessionFilterValues(AlumnosDerechoExamen.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(AlumnosDerechoExamen.MATERNO)

				' Field NOMBRE
				SetSessionFilterValues(AlumnosDerechoExamen.NOMBRE)

				' Field Deuda
				SetSessionDropDownValue(AlumnosDerechoExamen.Deuda.DropDownValue, AlumnosDerechoExamen.Deuda)
			bSetupFilter = True ' Set up filter required
		Else

				' Field NOMBRE_C
				If (GetDropDownValue(AlumnosDerechoExamen.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosDerechoExamen.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(AlumnosDerechoExamen.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosDerechoExamen_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field RAMO
				If (GetDropDownValue(AlumnosDerechoExamen.RAMO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosDerechoExamen.RAMO.DropDownValue) Then
					If Not ew_SameStr(AlumnosDerechoExamen.RAMO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosDerechoExamen_RAMO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Profesor
				If (GetFilterValues(AlumnosDerechoExamen.Profesor)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ANO
				If (GetDropDownValue(AlumnosDerechoExamen.ANO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosDerechoExamen.ANO.DropDownValue) Then
					If Not ew_SameStr(AlumnosDerechoExamen.ANO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosDerechoExamen_ANO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PERIODO
				If (GetDropDownValue(AlumnosDerechoExamen.PERIODO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosDerechoExamen.PERIODO.DropDownValue) Then
					If Not ew_SameStr(AlumnosDerechoExamen.PERIODO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosDerechoExamen_PERIODO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field RUT
				If (GetFilterValues(AlumnosDerechoExamen.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(AlumnosDerechoExamen.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(AlumnosDerechoExamen.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(AlumnosDerechoExamen.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Deuda
				If (GetDropDownValue(AlumnosDerechoExamen.Deuda)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosDerechoExamen.Deuda.DropDownValue) Then
					If Not ew_SameStr(AlumnosDerechoExamen.Deuda.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosDerechoExamen_Deuda") Is Nothing Then
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

			' Field NOMBRE_C
			GetSessionDropDownValue(AlumnosDerechoExamen.NOMBRE_C)

			' Field RAMO
			GetSessionDropDownValue(AlumnosDerechoExamen.RAMO)

			' Field Profesor
			GetSessionFilterValues(AlumnosDerechoExamen.Profesor)

			' Field ANO
			GetSessionDropDownValue(AlumnosDerechoExamen.ANO)

			' Field PERIODO
			GetSessionDropDownValue(AlumnosDerechoExamen.PERIODO)

			' Field RUT
			GetSessionFilterValues(AlumnosDerechoExamen.RUT)

			' Field PATERNO
			GetSessionFilterValues(AlumnosDerechoExamen.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(AlumnosDerechoExamen.MATERNO)

			' Field NOMBRE
			GetSessionFilterValues(AlumnosDerechoExamen.NOMBRE)

			' Field Deuda
			GetSessionDropDownValue(AlumnosDerechoExamen.Deuda)
		End If

		' Call page filter validated event
		AlumnosDerechoExamen.Page_FilterValidated()

		' Build SQL
		' Field NOMBRE_C

		BuildDropDownFilter(AlumnosDerechoExamen.NOMBRE_C, sFilter, "")

		' Field RAMO
		BuildDropDownFilter(AlumnosDerechoExamen.RAMO, sFilter, "")

		' Field Profesor
		BuildExtendedFilter(AlumnosDerechoExamen.Profesor, sFilter)

		' Field ANO
		BuildDropDownFilter(AlumnosDerechoExamen.ANO, sFilter, "")

		' Field PERIODO
		BuildDropDownFilter(AlumnosDerechoExamen.PERIODO, sFilter, "")

		' Field RUT
		BuildExtendedFilter(AlumnosDerechoExamen.RUT, sFilter)

		' Field PATERNO
		BuildExtendedFilter(AlumnosDerechoExamen.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(AlumnosDerechoExamen.MATERNO, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(AlumnosDerechoExamen.NOMBRE, sFilter)

		' Field Deuda
		BuildDropDownFilter(AlumnosDerechoExamen.Deuda, sFilter, "")

		' Save parms to Session
		' Field NOMBRE_C

		SetSessionDropDownValue(AlumnosDerechoExamen.NOMBRE_C.DropDownValue, AlumnosDerechoExamen.NOMBRE_C)

		' Field RAMO
		SetSessionDropDownValue(AlumnosDerechoExamen.RAMO.DropDownValue, AlumnosDerechoExamen.RAMO)

		' Field Profesor
		SetSessionFilterValues(AlumnosDerechoExamen.Profesor)

		' Field ANO
		SetSessionDropDownValue(AlumnosDerechoExamen.ANO.DropDownValue, AlumnosDerechoExamen.ANO)

		' Field PERIODO
		SetSessionDropDownValue(AlumnosDerechoExamen.PERIODO.DropDownValue, AlumnosDerechoExamen.PERIODO)

		' Field RUT
		SetSessionFilterValues(AlumnosDerechoExamen.RUT)

		' Field PATERNO
		SetSessionFilterValues(AlumnosDerechoExamen.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(AlumnosDerechoExamen.MATERNO)

		' Field NOMBRE
		SetSessionFilterValues(AlumnosDerechoExamen.NOMBRE)

		' Field Deuda
		SetSessionDropDownValue(AlumnosDerechoExamen.Deuda.DropDownValue, AlumnosDerechoExamen.Deuda)

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
		If ew_Session("sv_AlumnosDerechoExamen_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_AlumnosDerechoExamen_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_AlumnosDerechoExamen_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_AlumnosDerechoExamen_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_AlumnosDerechoExamen_" + parm)
		End If
		If ew_Session("so1_AlumnosDerechoExamen_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_AlumnosDerechoExamen_" + parm))
		End If
		If ew_Session("sc_AlumnosDerechoExamen_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_AlumnosDerechoExamen_" + parm))
		End If
		If ew_Session("sv2_AlumnosDerechoExamen_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_AlumnosDerechoExamen_" + parm)
		End If
		If ew_Session("so2_AlumnosDerechoExamen_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_AlumnosDerechoExamen_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_AlumnosDerechoExamen_" + parm) = fld.SearchValue
		ew_Session("so1_AlumnosDerechoExamen_" + parm) = fld.SearchOperator
		ew_Session("sc_AlumnosDerechoExamen_" + parm) = fld.SearchCondition
		ew_Session("sv2_AlumnosDerechoExamen_" + parm) = fld.SearchValue2
		ew_Session("so2_AlumnosDerechoExamen_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_AlumnosDerechoExamen_" + parm) = ""
		ew_Session("so1_AlumnosDerechoExamen_" + parm) = "="
		ew_Session("sc_AlumnosDerechoExamen_" + parm) = "AND"
		ew_Session("sv2_AlumnosDerechoExamen_" + parm) = ""
		ew_Session("so2_AlumnosDerechoExamen_" + parm) = "="
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
		ew_Session("sel_AlumnosDerechoExamen_" & parm) = ""
		ew_Session("rf_AlumnosDerechoExamen_" & parm) = ""
		ew_Session("rt_AlumnosDerechoExamen_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = AlumnosDerechoExamen.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_AlumnosDerechoExamen_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_AlumnosDerechoExamen_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_AlumnosDerechoExamen_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBRE_C

			AlumnosDerechoExamen.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosDerechoExamen.NOMBRE_C.DropDownValue = AlumnosDerechoExamen.NOMBRE_C.DefaultDropDownValue

			' Field RAMO
			AlumnosDerechoExamen.RAMO.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosDerechoExamen.RAMO.DropDownValue = AlumnosDerechoExamen.RAMO.DefaultDropDownValue

			' Field ANO
			AlumnosDerechoExamen.ANO.DefaultDropDownValue = 2013
			AlumnosDerechoExamen.ANO.DropDownValue = AlumnosDerechoExamen.ANO.DefaultDropDownValue

			' Field PERIODO
			AlumnosDerechoExamen.PERIODO.DefaultDropDownValue = 2
			AlumnosDerechoExamen.PERIODO.DropDownValue = AlumnosDerechoExamen.PERIODO.DefaultDropDownValue

			' Field Deuda
			AlumnosDerechoExamen.Deuda.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosDerechoExamen.Deuda.DropDownValue = AlumnosDerechoExamen.Deuda.DefaultDropDownValue

		' Set up default values for extended filters
			' Field Profesor

			SetDefaultExtFilter(AlumnosDerechoExamen.Profesor, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AlumnosDerechoExamen.Profesor)	

			' Field RUT
			SetDefaultExtFilter(AlumnosDerechoExamen.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AlumnosDerechoExamen.RUT)	

			' Field PATERNO
			SetDefaultExtFilter(AlumnosDerechoExamen.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AlumnosDerechoExamen.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(AlumnosDerechoExamen.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AlumnosDerechoExamen.MATERNO)	

			' Field NOMBRE
			SetDefaultExtFilter(AlumnosDerechoExamen.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AlumnosDerechoExamen.NOMBRE)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(AlumnosDerechoExamen.NOMBRE_C)) Then bFilterExist = True

		' Check RAMO dropdown filter
		If (NonTextFilterApplied(AlumnosDerechoExamen.RAMO)) Then bFilterExist = True

		' Check Profesor extended filter
		If (TextFilterApplied(AlumnosDerechoExamen.Profesor)) Then bFilterExist = True

		' Check ANO dropdown filter
		If (NonTextFilterApplied(AlumnosDerechoExamen.ANO)) Then bFilterExist = True

		' Check PERIODO dropdown filter
		If (NonTextFilterApplied(AlumnosDerechoExamen.PERIODO)) Then bFilterExist = True

		' Check RUT extended filter
		If (TextFilterApplied(AlumnosDerechoExamen.RUT)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(AlumnosDerechoExamen.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(AlumnosDerechoExamen.MATERNO)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(AlumnosDerechoExamen.NOMBRE)) Then bFilterExist = True

		' Check Deuda dropdown filter
		If (NonTextFilterApplied(AlumnosDerechoExamen.Deuda)) Then bFilterExist = True
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
		BuildDropDownFilter(AlumnosDerechoExamen.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RAMO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosDerechoExamen.RAMO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.RAMO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Profesor
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AlumnosDerechoExamen.Profesor, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.Profesor.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosDerechoExamen.ANO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.ANO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosDerechoExamen.PERIODO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.PERIODO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AlumnosDerechoExamen.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AlumnosDerechoExamen.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AlumnosDerechoExamen.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AlumnosDerechoExamen.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Deuda
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosDerechoExamen.Deuda, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosDerechoExamen.Deuda.FldCaption() & "<br>"
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
				AlumnosDerechoExamen.OrderBy = ""
				AlumnosDerechoExamen.StartGroup = 1
				AlumnosDerechoExamen.NOMBRE_C.Sort = ""
				AlumnosDerechoExamen.CODRAMO.Sort = ""
				AlumnosDerechoExamen.RAMO.Sort = ""
				AlumnosDerechoExamen.CODSECC.Sort = ""
				AlumnosDerechoExamen.Profesor.Sort = ""
				AlumnosDerechoExamen.ANO.Sort = ""
				AlumnosDerechoExamen.PERIODO.Sort = ""
				AlumnosDerechoExamen.JORNADA.Sort = ""
				AlumnosDerechoExamen.CREDITO.Sort = ""
				AlumnosDerechoExamen.TipoRamo.Sort = ""
				AlumnosDerechoExamen.CODCLI.Sort = ""
				AlumnosDerechoExamen.RUT.Sort = ""
				AlumnosDerechoExamen.DIG.Sort = ""
				AlumnosDerechoExamen.PATERNO.Sort = ""
				AlumnosDerechoExamen.MATERNO.Sort = ""
				AlumnosDerechoExamen.NOMBRE.Sort = ""
				AlumnosDerechoExamen.ASISTENCIA.Sort = ""
				AlumnosDerechoExamen.NP.Sort = ""
				AlumnosDerechoExamen.Deuda.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			AlumnosDerechoExamen.CurrentOrder = ew_Get("order")
			AlumnosDerechoExamen.CurrentOrderType = ew_Get("ordertype")
			sSortSql = AlumnosDerechoExamen.SortSql()
			AlumnosDerechoExamen.OrderBy = sSortSql
			AlumnosDerechoExamen.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(AlumnosDerechoExamen.OrderBy)) Then
			AlumnosDerechoExamen.OrderBy = "[NOMBRE_C] ASC, [RAMO] ASC, [PATERNO] ASC, [MATERNO] ASC, [NOMBRE] ASC"
			AlumnosDerechoExamen.NOMBRE_C.Sort = "ASC"
			AlumnosDerechoExamen.RAMO.Sort = "ASC"
			AlumnosDerechoExamen.PATERNO.Sort = "ASC"
			AlumnosDerechoExamen.MATERNO.Sort = "ASC"
			AlumnosDerechoExamen.NOMBRE.Sort = "ASC"
		End If
		Return AlumnosDerechoExamen.OrderBy
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
		AlumnosDerechoExamen_summary = New crAlumnosDerechoExamen_summary(Me)
		AlumnosDerechoExamen_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		AlumnosDerechoExamen_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (AlumnosDerechoExamen_summary IsNot Nothing) Then AlumnosDerechoExamen_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
    <% If (AlumnosDerechoExamen.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var AlumnosDerechoExamen_summary = new ewrpt_Page("AlumnosDerechoExamen_summary");
// page properties
AlumnosDerechoExamen_summary.PageID = "summary"; // page ID
AlumnosDerechoExamen_summary.FormID = "fAlumnosDerechoExamensummaryfilter"; // form ID
var EWRPT_PAGE_ID = AlumnosDerechoExamen_summary.PageID;
// extend page with ValidateForm function
AlumnosDerechoExamen_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
AlumnosDerechoExamen_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
AlumnosDerechoExamen_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
AlumnosDerechoExamen_summary.ValidateRequired = false; // no JavaScript validation
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
<% AlumnosDerechoExamen_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (AlumnosDerechoExamen.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (AlumnosDerechoExamen.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="ewTitle"><h1><%= AlumnosDerechoExamen.TableCaption() %></h1>
<% If (AlumnosDerechoExamen.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= AlumnosDerechoExamen_summary.ExportExcelUrl %>"><img alt="Exportar a Excel" src="images/Excel.png" /></a>
<% If (AlumnosDerechoExamen_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="AlumnosDerechoExamensmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% AlumnosDerechoExamen_summary.ShowMessage() %>
<% If (AlumnosDerechoExamen.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (AlumnosDerechoExamen.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (AlumnosDerechoExamen.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (AlumnosDerechoExamen.FilterPanelOption = 2 OrElse (AlumnosDerechoExamen.FilterPanelOption = 3 AndAlso AlumnosDerechoExamen_summary.FilterApplied) OrElse AlumnosDerechoExamen_summary.Filter = "0=101") Then
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
<form name="fAlumnosDerechoExamensummaryfilter" id="fAlumnosDerechoExamensummaryfilter" action="AlumnosDerechoExamensmry.aspx" class="ewForm" onsubmit="return AlumnosDerechoExamen_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = AlumnosDerechoExamen.NOMBRE.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(AlumnosDerechoExamen_summary.ClearExtFilter = "AlumnosDerechoExamen_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosDerechoExamen.NOMBRE_C.CustomFilters.Count + AlumnosDerechoExamen.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosDerechoExamen.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosDerechoExamen.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.RAMO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_RAMO" id="sv_RAMO"<%= IIf(AlumnosDerechoExamen_summary.ClearExtFilter = "AlumnosDerechoExamen_RAMO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.RAMO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosDerechoExamen.RAMO.CustomFilters.Count + AlumnosDerechoExamen.RAMO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosDerechoExamen.RAMO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "RAMO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.RAMO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosDerechoExamen.RAMO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.RAMO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.Profesor.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_Profesor" id="so1_Profesor" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Profesor" id="sv1_Profesor" size="30" maxlength="92" value="<%= ew_HtmlEncode(AlumnosDerechoExamen.Profesor.SearchValue) %>"<%= IIf(AlumnosDerechoExamen_summary.ClearExtFilter = "AlumnosDerechoExamen_Profesor", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.ANO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO" id="sv_ANO"<%= IIf(AlumnosDerechoExamen_summary.ClearExtFilter = "AlumnosDerechoExamen_ANO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.ANO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosDerechoExamen.ANO.CustomFilters.Count + AlumnosDerechoExamen.ANO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosDerechoExamen.ANO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.ANO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosDerechoExamen.ANO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.ANO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.PERIODO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO" id="sv_PERIODO"<%= IIf(AlumnosDerechoExamen_summary.ClearExtFilter = "AlumnosDerechoExamen_PERIODO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.PERIODO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosDerechoExamen.PERIODO.CustomFilters.Count + AlumnosDerechoExamen.PERIODO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosDerechoExamen.PERIODO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PERIODO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.PERIODO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosDerechoExamen.PERIODO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.PERIODO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.RUT.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_RUT" id="so1_RUT" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="30" value="<%= ew_HtmlEncode(AlumnosDerechoExamen.RUT.SearchValue) %>"<%= IIf(AlumnosDerechoExamen_summary.ClearExtFilter = "AlumnosDerechoExamen_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.PATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_PATERNO" id="so1_PATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(AlumnosDerechoExamen.PATERNO.SearchValue) %>"<%= IIf(AlumnosDerechoExamen_summary.ClearExtFilter = "AlumnosDerechoExamen_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.MATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_MATERNO" id="so1_MATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(AlumnosDerechoExamen.MATERNO.SearchValue) %>"<%= IIf(AlumnosDerechoExamen_summary.ClearExtFilter = "AlumnosDerechoExamen_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.NOMBRE.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_NOMBRE" id="so1_NOMBRE" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(AlumnosDerechoExamen.NOMBRE.SearchValue) %>"<%= IIf(AlumnosDerechoExamen_summary.ClearExtFilter = "AlumnosDerechoExamen_NOMBRE", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosDerechoExamen.Deuda.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = AlumnosDerechoExamen.Deuda.CustomFilters.Count + AlumnosDerechoExamen.Deuda.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosDerechoExamen.Deuda.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Deuda")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="AlumnosDerechoExamen.Deuda.DropDownValue" id="AlumnosDerechoExamen.Deuda.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.Deuda.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosDerechoExamen.Deuda.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Deuda" id="sv_Deuda" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosDerechoExamen.Deuda.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (AlumnosDerechoExamen.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% AlumnosDerechoExamen_summary.ShowFilterList() %>
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
If (AlumnosDerechoExamen.ExportAll AndAlso ew_NotEmpty(AlumnosDerechoExamen.Export)) Then
	AlumnosDerechoExamen_summary.StopGrp = AlumnosDerechoExamen_summary.TotalGrps
Else
	AlumnosDerechoExamen_summary.StopGrp = AlumnosDerechoExamen_summary.StartGrp + AlumnosDerechoExamen_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (AlumnosDerechoExamen_summary.StopGrp > AlumnosDerechoExamen_summary.TotalGrps) Then
	AlumnosDerechoExamen_summary.StopGrp = AlumnosDerechoExamen_summary.TotalGrps
End If
AlumnosDerechoExamen_summary.RecCount = 0

' Get first row
If (AlumnosDerechoExamen_summary.TotalGrps > 0) Then
	AlumnosDerechoExamen_summary.GetRow() ' ASPXRPT
	AlumnosDerechoExamen_summary.GrpCount = 1
End If
While ((AlumnosDerechoExamen_summary.HasRow AndAlso AlumnosDerechoExamen_summary.GrpIndex < AlumnosDerechoExamen_summary.StopGrp) OrElse AlumnosDerechoExamen_summary.ShowFirstHeader)

	' Show header
	If (AlumnosDerechoExamen_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.NOMBRE_C) %>',0);"><%= AlumnosDerechoExamen.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.CODRAMO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.CODRAMO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.CODRAMO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.CODRAMO) %>',0);"><%= AlumnosDerechoExamen.CODRAMO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.CODRAMO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.CODRAMO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.RAMO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.RAMO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.RAMO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.RAMO) %>',0);"><%= AlumnosDerechoExamen.RAMO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.RAMO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.RAMO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.CODSECC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.CODSECC))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.CODSECC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.CODSECC) %>',0);"><%= AlumnosDerechoExamen.CODSECC.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.CODSECC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.CODSECC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.Profesor.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.Profesor))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.Profesor.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.Profesor) %>',0);"><%= AlumnosDerechoExamen.Profesor.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.Profesor.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.Profesor.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.ANO) %>',0);"><%= AlumnosDerechoExamen.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.PERIODO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.PERIODO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.PERIODO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.PERIODO) %>',0);"><%= AlumnosDerechoExamen.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.PERIODO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.PERIODO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.JORNADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.JORNADA))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.JORNADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.JORNADA) %>',0);"><%= AlumnosDerechoExamen.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.JORNADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.JORNADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.CREDITO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.CREDITO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.CREDITO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.CREDITO) %>',0);"><%= AlumnosDerechoExamen.CREDITO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.CREDITO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.CREDITO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.TipoRamo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.TipoRamo))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.TipoRamo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.TipoRamo) %>',0);"><%= AlumnosDerechoExamen.TipoRamo.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.TipoRamo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.TipoRamo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.CODCLI.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.CODCLI))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.CODCLI.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.CODCLI) %>',0);"><%= AlumnosDerechoExamen.CODCLI.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.CODCLI.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.CODCLI.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.RUT) %>',0);"><%= AlumnosDerechoExamen.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.DIG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.DIG))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.DIG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.DIG) %>',0);"><%= AlumnosDerechoExamen.DIG.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.DIG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.DIG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.PATERNO) %>',0);"><%= AlumnosDerechoExamen.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.MATERNO) %>',0);"><%= AlumnosDerechoExamen.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.NOMBRE) %>',0);"><%= AlumnosDerechoExamen.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.ASISTENCIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.ASISTENCIA))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.ASISTENCIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.ASISTENCIA) %>',0);"><%= AlumnosDerechoExamen.ASISTENCIA.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.ASISTENCIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.ASISTENCIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.NP.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.NP))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.NP.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.NP) %>',0);"><%= AlumnosDerechoExamen.NP.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.NP.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.NP.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosDerechoExamen.Export)) Then %>
<%= AlumnosDerechoExamen.Deuda.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.Deuda))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosDerechoExamen.Deuda.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosDerechoExamen.SortUrl(AlumnosDerechoExamen.Deuda) %>',0);"><%= AlumnosDerechoExamen.Deuda.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosDerechoExamen.Deuda.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosDerechoExamen.Deuda.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		AlumnosDerechoExamen_summary.ShowFirstHeader = False
	End If
	AlumnosDerechoExamen_summary.RecCount += 1

		' Render detail row
		AlumnosDerechoExamen.ResetCSS()
		AlumnosDerechoExamen.RowType = EWRPT_ROWTYPE_DETAIL
		AlumnosDerechoExamen_summary.RenderRow()
%>
	<tr<%= AlumnosDerechoExamen.RowAttributes() %>>
		<td<%= AlumnosDerechoExamen.NOMBRE_C.CellAttributes %>>
<div<%= AlumnosDerechoExamen.NOMBRE_C.ViewAttributes%>><%= AlumnosDerechoExamen.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.CODRAMO.CellAttributes %>>
<div<%= AlumnosDerechoExamen.CODRAMO.ViewAttributes%>><%= AlumnosDerechoExamen.CODRAMO.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.RAMO.CellAttributes %>>
<div<%= AlumnosDerechoExamen.RAMO.ViewAttributes%>><%= AlumnosDerechoExamen.RAMO.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.CODSECC.CellAttributes %>>
<div<%= AlumnosDerechoExamen.CODSECC.ViewAttributes%>><%= AlumnosDerechoExamen.CODSECC.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.Profesor.CellAttributes %>>
<div<%= AlumnosDerechoExamen.Profesor.ViewAttributes%>><%= AlumnosDerechoExamen.Profesor.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.ANO.CellAttributes %>>
<div<%= AlumnosDerechoExamen.ANO.ViewAttributes%>><%= AlumnosDerechoExamen.ANO.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.PERIODO.CellAttributes %>>
<div<%= AlumnosDerechoExamen.PERIODO.ViewAttributes%>><%= AlumnosDerechoExamen.PERIODO.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.JORNADA.CellAttributes %>>
<div<%= AlumnosDerechoExamen.JORNADA.ViewAttributes%>><%= AlumnosDerechoExamen.JORNADA.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.CREDITO.CellAttributes %>>
<div<%= AlumnosDerechoExamen.CREDITO.ViewAttributes%>><%= AlumnosDerechoExamen.CREDITO.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.TipoRamo.CellAttributes %>>
<div<%= AlumnosDerechoExamen.TipoRamo.ViewAttributes%>><%= AlumnosDerechoExamen.TipoRamo.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.CODCLI.CellAttributes %>>
<div<%= AlumnosDerechoExamen.CODCLI.ViewAttributes%>><%= AlumnosDerechoExamen.CODCLI.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.RUT.CellAttributes %>>
<div<%= AlumnosDerechoExamen.RUT.ViewAttributes%>><%= AlumnosDerechoExamen.RUT.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.DIG.CellAttributes %>>
<div<%= AlumnosDerechoExamen.DIG.ViewAttributes%>><%= AlumnosDerechoExamen.DIG.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.PATERNO.CellAttributes %>>
<div<%= AlumnosDerechoExamen.PATERNO.ViewAttributes%>><%= AlumnosDerechoExamen.PATERNO.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.MATERNO.CellAttributes %>>
<div<%= AlumnosDerechoExamen.MATERNO.ViewAttributes%>><%= AlumnosDerechoExamen.MATERNO.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.NOMBRE.CellAttributes %>>
<div<%= AlumnosDerechoExamen.NOMBRE.ViewAttributes%>><%= AlumnosDerechoExamen.NOMBRE.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.ASISTENCIA.CellAttributes %>>
<div<%= AlumnosDerechoExamen.ASISTENCIA.ViewAttributes%>><%= AlumnosDerechoExamen.ASISTENCIA.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.NP.CellAttributes %>>
<div<%= AlumnosDerechoExamen.NP.ViewAttributes%>><%= AlumnosDerechoExamen.NP.ListViewValue%></div>
</td>
		<td<%= AlumnosDerechoExamen.Deuda.CellAttributes %>>
<div<%= AlumnosDerechoExamen.Deuda.ViewAttributes%>><%= AlumnosDerechoExamen.Deuda.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		AlumnosDerechoExamen_summary.AccumulateSummary()

		' Get next record
		AlumnosDerechoExamen_summary.GetRow() ' ASPXRPT
		AlumnosDerechoExamen_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (AlumnosDerechoExamen_summary.TotalGrps > 0) Then
	AlumnosDerechoExamen.ResetCSS()
	AlumnosDerechoExamen.RowType = EWRPT_ROWTYPE_TOTAL
	AlumnosDerechoExamen.RowTotalType = EWRPT_ROWTOTAL_GRAND
	AlumnosDerechoExamen.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	AlumnosDerechoExamen.RowAttrs("class") = "ewRptGrandSummary"
	AlumnosDerechoExamen_summary.RenderRow()
%>
	<!-- tr><td colspan="19"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= AlumnosDerechoExamen.RowAttributes() %>><td colspan="19"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(AlumnosDerechoExamen_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (AlumnosDerechoExamen.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If AlumnosDerechoExamen_summary.Pager Is Nothing Then AlumnosDerechoExamen_summary.Pager = New cPrevNextPager(AlumnosDerechoExamen_summary.StartGrp, AlumnosDerechoExamen_summary.DisplayGrps, AlumnosDerechoExamen_summary.TotalGrps) %>
<% If AlumnosDerechoExamen_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If AlumnosDerechoExamen_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="AlumnosDerechoExamensmry.aspx?start=<%= AlumnosDerechoExamen_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If AlumnosDerechoExamen_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="AlumnosDerechoExamensmry.aspx?start=<%= AlumnosDerechoExamen_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= AlumnosDerechoExamen_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If AlumnosDerechoExamen_summary.Pager.NextButton.Enabled Then %>
	<td><a href="AlumnosDerechoExamensmry.aspx?start=<%= AlumnosDerechoExamen_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If AlumnosDerechoExamen_summary.Pager.LastButton.Enabled Then %>
	<td><a href="AlumnosDerechoExamensmry.aspx?start=<%= AlumnosDerechoExamen_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= AlumnosDerechoExamen_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= AlumnosDerechoExamen_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= AlumnosDerechoExamen_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= AlumnosDerechoExamen_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If AlumnosDerechoExamen_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (AlumnosDerechoExamen_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If AlumnosDerechoExamen_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="15"<% If AlumnosDerechoExamen_summary.DisplayGrps = 15 Then Response.Write(" selected=""selected""") %>>15</option>
<option value="20"<% If AlumnosDerechoExamen_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
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
<% If (AlumnosDerechoExamen.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (AlumnosDerechoExamen.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (AlumnosDerechoExamen.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% AlumnosDerechoExamen_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (AlumnosDerechoExamen.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
