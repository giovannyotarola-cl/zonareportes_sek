<%@ Page ClassName="AuditorEDa_U2Bsmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_AuditoriaUmas" %>
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
	Public AuditorEDa_U2B As crAuditorEDa_U2B = Nothing

	'
	' Table class (for Auditoría U+)
	'
	Public Class crAuditorEDa_U2B
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
				Return "AuditorEDa_U2B"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Auditoría U+"
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

		Public USERNAME As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRE As crField

		Public NOMBRE_C As crField

		Public TRANSACCION As crField

		Public OPCION As crField

		Public ACCESO_OPCION As crField

		Public HORFEC_LOG As crField

		Public HORFEC_OUT As crField

		Public HORFEC_TRANS As crField

		Public FECMOVTRANS As crField

		Public NOMBRE_FUNCIONARIO As crField

		Public ROL_ADMINISTRATIVO As crField

		Public NIVEL As crField

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

			' USERNAME
			USERNAME = new crField("AuditorEDa_U2B", "Auditoría U+", "x_USERNAME", "USERNAME", "[USERNAME]", 200, EWRPT_DATATYPE_STRING, -1)
			USERNAME.Page = APage
			USERNAME.ParentPage = APage.ParentPage
			Fields.Add("USERNAME", USERNAME)
			USERNAME.DateFilter = ""
			USERNAME.SqlSelect = ""
			USERNAME.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("AuditorEDa_U2B", "Auditoría U+", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("AuditorEDa_U2B", "Auditoría U+", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("AuditorEDa_U2B", "Auditoría U+", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("AuditorEDa_U2B", "Auditoría U+", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' TRANSACCION
			TRANSACCION = new crField("AuditorEDa_U2B", "Auditoría U+", "x_TRANSACCION", "TRANSACCION", "[TRANSACCION]", 200, EWRPT_DATATYPE_STRING, -1)
			TRANSACCION.Page = APage
			TRANSACCION.ParentPage = APage.ParentPage
			Fields.Add("TRANSACCION", TRANSACCION)
			TRANSACCION.DateFilter = ""
			TRANSACCION.SqlSelect = ""
			TRANSACCION.SqlOrderBy = ""

			' OPCION
			OPCION = new crField("AuditorEDa_U2B", "Auditoría U+", "x_OPCION", "OPCION", "[OPCION]", 200, EWRPT_DATATYPE_STRING, -1)
			OPCION.Page = APage
			OPCION.ParentPage = APage.ParentPage
			Fields.Add("OPCION", OPCION)
			OPCION.DateFilter = ""
			OPCION.SqlSelect = ""
			OPCION.SqlOrderBy = ""

			' ACCESO_OPCION
			ACCESO_OPCION = new crField("AuditorEDa_U2B", "Auditoría U+", "x_ACCESO_OPCION", "ACCESO_OPCION", "[ACCESO_OPCION]", 200, EWRPT_DATATYPE_STRING, -1)
			ACCESO_OPCION.Page = APage
			ACCESO_OPCION.ParentPage = APage.ParentPage
			Fields.Add("ACCESO_OPCION", ACCESO_OPCION)
			ACCESO_OPCION.DateFilter = ""
			ACCESO_OPCION.SqlSelect = ""
			ACCESO_OPCION.SqlOrderBy = ""

			' HORFEC_LOG
			HORFEC_LOG = new crField("AuditorEDa_U2B", "Auditoría U+", "x_HORFEC_LOG", "HORFEC_LOG", "[HORFEC_LOG]", 200, EWRPT_DATATYPE_STRING, -1)
			HORFEC_LOG.Page = APage
			HORFEC_LOG.ParentPage = APage.ParentPage
			Fields.Add("HORFEC_LOG", HORFEC_LOG)
			HORFEC_LOG.DateFilter = ""
			HORFEC_LOG.SqlSelect = ""
			HORFEC_LOG.SqlOrderBy = ""

			' HORFEC_OUT
			HORFEC_OUT = new crField("AuditorEDa_U2B", "Auditoría U+", "x_HORFEC_OUT", "HORFEC_OUT", "[HORFEC_OUT]", 200, EWRPT_DATATYPE_STRING, -1)
			HORFEC_OUT.Page = APage
			HORFEC_OUT.ParentPage = APage.ParentPage
			Fields.Add("HORFEC_OUT", HORFEC_OUT)
			HORFEC_OUT.DateFilter = ""
			HORFEC_OUT.SqlSelect = ""
			HORFEC_OUT.SqlOrderBy = ""

			' HORFEC_TRANS
			HORFEC_TRANS = new crField("AuditorEDa_U2B", "Auditoría U+", "x_HORFEC_TRANS", "HORFEC_TRANS", "[HORFEC_TRANS]", 200, EWRPT_DATATYPE_STRING, -1)
			HORFEC_TRANS.Page = APage
			HORFEC_TRANS.ParentPage = APage.ParentPage
			Fields.Add("HORFEC_TRANS", HORFEC_TRANS)
			HORFEC_TRANS.DateFilter = ""
			HORFEC_TRANS.SqlSelect = ""
			HORFEC_TRANS.SqlOrderBy = ""

			' FECMOVTRANS
			FECMOVTRANS = new crField("AuditorEDa_U2B", "Auditoría U+", "x_FECMOVTRANS", "FECMOVTRANS", "[FECMOVTRANS]", 135, EWRPT_DATATYPE_DATE, 7)
			FECMOVTRANS.Page = APage
			FECMOVTRANS.ParentPage = APage.ParentPage
			FECMOVTRANS.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECMOVTRANS", FECMOVTRANS)
			FECMOVTRANS.DateFilter = ""
			FECMOVTRANS.SqlSelect = ""
			FECMOVTRANS.SqlOrderBy = ""

			' NOMBRE_FUNCIONARIO
			NOMBRE_FUNCIONARIO = new crField("AuditorEDa_U2B", "Auditoría U+", "x_NOMBRE_FUNCIONARIO", "NOMBRE_FUNCIONARIO", "[NOMBRE_FUNCIONARIO]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_FUNCIONARIO.Page = APage
			NOMBRE_FUNCIONARIO.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_FUNCIONARIO", NOMBRE_FUNCIONARIO)
			NOMBRE_FUNCIONARIO.DateFilter = ""
			NOMBRE_FUNCIONARIO.SqlSelect = ""
			NOMBRE_FUNCIONARIO.SqlOrderBy = ""

			' ROL_ADMINISTRATIVO
			ROL_ADMINISTRATIVO = new crField("AuditorEDa_U2B", "Auditoría U+", "x_ROL_ADMINISTRATIVO", "ROL_ADMINISTRATIVO", "[ROL_ADMINISTRATIVO]", 200, EWRPT_DATATYPE_STRING, -1)
			ROL_ADMINISTRATIVO.Page = APage
			ROL_ADMINISTRATIVO.ParentPage = APage.ParentPage
			Fields.Add("ROL_ADMINISTRATIVO", ROL_ADMINISTRATIVO)
			ROL_ADMINISTRATIVO.DateFilter = ""
			ROL_ADMINISTRATIVO.SqlSelect = ""
			ROL_ADMINISTRATIVO.SqlOrderBy = ""

			' NIVEL
			NIVEL = new crField("AuditorEDa_U2B", "Auditoría U+", "x_NIVEL", "NIVEL", "[NIVEL]", 3, EWRPT_DATATYPE_NUMBER, -1)
			NIVEL.Page = APage
			NIVEL.ParentPage = APage.ParentPage
			NIVEL.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("NIVEL", NIVEL)
			NIVEL.DateFilter = ""
			NIVEL.SqlSelect = ""
			NIVEL.SqlOrderBy = ""
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
				Return "[SEK_AUDITORIA_UMAS]"
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
	Public AuditorEDa_U2B_summary As crAuditorEDa_U2B_summary

	'
	' Page class
	'
	Public Class crAuditorEDa_U2B_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (AuditorEDa_U2B.UseTokenInUrl) Then
				sUrl &= "t=" & AuditorEDa_U2B.TableVar & "&" ' Add page token
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
			If (AuditorEDa_U2B.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(AuditorEDa_U2B.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(AuditorEDa_U2B.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As AuditorEDa_U2Bsmry 
			Get
				Return CType(m_ParentPage, AuditorEDa_U2Bsmry)
			End Get
		End Property

		' Table object (AuditorEDa_U2B)
		Public Property AuditorEDa_U2B As crAuditorEDa_U2B 
			Get		
				Return AspNetPage.AuditorEDa_U2B ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAuditorEDa_U2B)
				AspNetPage.AuditorEDa_U2B = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_AuditoriaUmas)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "AuditorEDa_U2B_summary"
			m_PageObjTypeName = "crAuditorEDa_U2B_summary"

			' Table name
			m_TableName = "Auditoría U+"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (AuditorEDa_U2B)
			AuditorEDa_U2B = New crAuditorEDa_U2B(Me)			

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
				AuditorEDa_U2B.Export = ew_Get("export")
			End If
			gsExport = AuditorEDa_U2B.Export ' Get export parameter, used in header
			gsExportFile = AuditorEDa_U2B.TableVar ' Get export file, used in header
			If (AuditorEDa_U2B.Export = "excel") Then
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

		Public Val As Object() = New Object(14) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(14) {}

		Public GrandMn As Object() = New Object(14) {}

		Public GrandMx As Object() = New Object(14) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 15 ' No. of fields
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
			AuditorEDa_U2B.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(AuditorEDa_U2B.SqlSelect, AuditorEDa_U2B.SqlWhere, AuditorEDa_U2B.SqlGroupBy, AuditorEDa_U2B.SqlHaving, AuditorEDa_U2B.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (AuditorEDa_U2B.ExportAll AndAlso ew_NotEmpty(AuditorEDa_U2B.Export)) Then
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
				AuditorEDa_U2B.USERNAME.DbValue = Row("USERNAME")
				AuditorEDa_U2B.PATERNO.DbValue = Row("PATERNO")
				AuditorEDa_U2B.MATERNO.DbValue = Row("MATERNO")
				AuditorEDa_U2B.NOMBRE.DbValue = Row("NOMBRE")
				AuditorEDa_U2B.NOMBRE_C.DbValue = Row("NOMBRE_C")
				AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DbValue = Row("NOMBRE_FUNCIONARIO")
				AuditorEDa_U2B.ROL_ADMINISTRATIVO.DbValue = Row("ROL_ADMINISTRATIVO")
				AuditorEDa_U2B.HORFEC_LOG.DbValue = Row("HORFEC_LOG")
				AuditorEDa_U2B.HORFEC_OUT.DbValue = Row("HORFEC_OUT")
				AuditorEDa_U2B.OPCION.DbValue = Row("OPCION")
				AuditorEDa_U2B.HORFEC_TRANS.DbValue = Row("HORFEC_TRANS")
				AuditorEDa_U2B.TRANSACCION.DbValue = Row("TRANSACCION")
				AuditorEDa_U2B.ACCESO_OPCION.DbValue = Row("ACCESO_OPCION")
				AuditorEDa_U2B.NIVEL.DbValue = Row("NIVEL")
				AuditorEDa_U2B.FECMOVTRANS.DbValue = Row("FECMOVTRANS")
				Val(1) = AuditorEDa_U2B.USERNAME.CurrentValue
				Val(2) = AuditorEDa_U2B.PATERNO.CurrentValue
				Val(3) = AuditorEDa_U2B.MATERNO.CurrentValue
				Val(4) = AuditorEDa_U2B.NOMBRE.CurrentValue
				Val(5) = AuditorEDa_U2B.NOMBRE_C.CurrentValue
				Val(6) = AuditorEDa_U2B.TRANSACCION.CurrentValue
				Val(7) = AuditorEDa_U2B.OPCION.CurrentValue
				Val(8) = AuditorEDa_U2B.ACCESO_OPCION.CurrentValue
				Val(9) = AuditorEDa_U2B.HORFEC_LOG.CurrentValue
				Val(10) = AuditorEDa_U2B.HORFEC_OUT.CurrentValue
				Val(11) = AuditorEDa_U2B.HORFEC_TRANS.CurrentValue
				Val(12) = AuditorEDa_U2B.FECMOVTRANS.CurrentValue
				Val(13) = AuditorEDa_U2B.NOMBRE_FUNCIONARIO.CurrentValue
				Val(14) = AuditorEDa_U2B.ROL_ADMINISTRATIVO.CurrentValue
			Else
				AuditorEDa_U2B.USERNAME.DbValue = ""
				AuditorEDa_U2B.PATERNO.DbValue = ""
				AuditorEDa_U2B.MATERNO.DbValue = ""
				AuditorEDa_U2B.NOMBRE.DbValue = ""
				AuditorEDa_U2B.NOMBRE_C.DbValue = ""
				AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DbValue = ""
				AuditorEDa_U2B.ROL_ADMINISTRATIVO.DbValue = ""
				AuditorEDa_U2B.HORFEC_LOG.DbValue = ""
				AuditorEDa_U2B.HORFEC_OUT.DbValue = ""
				AuditorEDa_U2B.OPCION.DbValue = ""
				AuditorEDa_U2B.HORFEC_TRANS.DbValue = ""
				AuditorEDa_U2B.TRANSACCION.DbValue = ""
				AuditorEDa_U2B.ACCESO_OPCION.DbValue = ""
				AuditorEDa_U2B.NIVEL.DbValue = ""
				AuditorEDa_U2B.FECMOVTRANS.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				AuditorEDa_U2B.USERNAME.DbValue = dr("USERNAME")
				AuditorEDa_U2B.PATERNO.DbValue = dr("PATERNO")
				AuditorEDa_U2B.MATERNO.DbValue = dr("MATERNO")
				AuditorEDa_U2B.NOMBRE.DbValue = dr("NOMBRE")
				AuditorEDa_U2B.NOMBRE_C.DbValue = dr("NOMBRE_C")
				AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DbValue = dr("NOMBRE_FUNCIONARIO")
				AuditorEDa_U2B.ROL_ADMINISTRATIVO.DbValue = dr("ROL_ADMINISTRATIVO")
				AuditorEDa_U2B.HORFEC_LOG.DbValue = dr("HORFEC_LOG")
				AuditorEDa_U2B.HORFEC_OUT.DbValue = dr("HORFEC_OUT")
				AuditorEDa_U2B.OPCION.DbValue = dr("OPCION")
				AuditorEDa_U2B.HORFEC_TRANS.DbValue = dr("HORFEC_TRANS")
				AuditorEDa_U2B.TRANSACCION.DbValue = dr("TRANSACCION")
				AuditorEDa_U2B.ACCESO_OPCION.DbValue = dr("ACCESO_OPCION")
				AuditorEDa_U2B.NIVEL.DbValue = dr("NIVEL")
				AuditorEDa_U2B.FECMOVTRANS.DbValue = dr("FECMOVTRANS")
				Val(1) = AuditorEDa_U2B.USERNAME.CurrentValue
				Val(2) = AuditorEDa_U2B.PATERNO.CurrentValue
				Val(3) = AuditorEDa_U2B.MATERNO.CurrentValue
				Val(4) = AuditorEDa_U2B.NOMBRE.CurrentValue
				Val(5) = AuditorEDa_U2B.NOMBRE_C.CurrentValue
				Val(6) = AuditorEDa_U2B.TRANSACCION.CurrentValue
				Val(7) = AuditorEDa_U2B.OPCION.CurrentValue
				Val(8) = AuditorEDa_U2B.ACCESO_OPCION.CurrentValue
				Val(9) = AuditorEDa_U2B.HORFEC_LOG.CurrentValue
				Val(10) = AuditorEDa_U2B.HORFEC_OUT.CurrentValue
				Val(11) = AuditorEDa_U2B.HORFEC_TRANS.CurrentValue
				Val(12) = AuditorEDa_U2B.FECMOVTRANS.CurrentValue
				Val(13) = AuditorEDa_U2B.NOMBRE_FUNCIONARIO.CurrentValue
				Val(14) = AuditorEDa_U2B.ROL_ADMINISTRATIVO.CurrentValue
			Else				
				AuditorEDa_U2B.USERNAME.DbValue = ""
				AuditorEDa_U2B.PATERNO.DbValue = ""
				AuditorEDa_U2B.MATERNO.DbValue = ""
				AuditorEDa_U2B.NOMBRE.DbValue = ""
				AuditorEDa_U2B.NOMBRE_C.DbValue = ""
				AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DbValue = ""
				AuditorEDa_U2B.ROL_ADMINISTRATIVO.DbValue = ""
				AuditorEDa_U2B.HORFEC_LOG.DbValue = ""
				AuditorEDa_U2B.HORFEC_OUT.DbValue = ""
				AuditorEDa_U2B.OPCION.DbValue = ""
				AuditorEDa_U2B.HORFEC_TRANS.DbValue = ""
				AuditorEDa_U2B.TRANSACCION.DbValue = ""
				AuditorEDa_U2B.ACCESO_OPCION.DbValue = ""
				AuditorEDa_U2B.NIVEL.DbValue = ""
				AuditorEDa_U2B.FECMOVTRANS.DbValue = ""
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
				AuditorEDa_U2B.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					AuditorEDa_U2B.StartGroup = StartGrp
				Else
					StartGrp = AuditorEDa_U2B.StartGroup
				End If
			Else
				StartGrp = AuditorEDa_U2B.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				AuditorEDa_U2B.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				AuditorEDa_U2B.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				AuditorEDa_U2B.StartGroup = StartGrp
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
			AuditorEDa_U2B.StartGroup = StartGrp
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
				AuditorEDa_U2B.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				AuditorEDa_U2B.StartGroup = StartGrp
			Else				
				If (AuditorEDa_U2B.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(AuditorEDa_U2B.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (AuditorEDa_U2B.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(AuditorEDa_U2B.SqlSelectCount, AuditorEDa_U2B.SqlWhere, AuditorEDa_U2B.SqlGroupBy, AuditorEDa_U2B.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			AuditorEDa_U2B.Row_Rendering()

			'
			' Render view codes
			'

			If (AuditorEDa_U2B.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' USERNAME
				AuditorEDa_U2B.USERNAME.ViewValue = Convert.ToString(AuditorEDa_U2B.USERNAME.Summary)

				' PATERNO
				AuditorEDa_U2B.PATERNO.ViewValue = Convert.ToString(AuditorEDa_U2B.PATERNO.Summary)

				' MATERNO
				AuditorEDa_U2B.MATERNO.ViewValue = Convert.ToString(AuditorEDa_U2B.MATERNO.Summary)

				' NOMBRE
				AuditorEDa_U2B.NOMBRE.ViewValue = Convert.ToString(AuditorEDa_U2B.NOMBRE.Summary)

				' NOMBRE_C
				AuditorEDa_U2B.NOMBRE_C.ViewValue = Convert.ToString(AuditorEDa_U2B.NOMBRE_C.Summary)

				' TRANSACCION
				AuditorEDa_U2B.TRANSACCION.ViewValue = Convert.ToString(AuditorEDa_U2B.TRANSACCION.Summary)

				' OPCION
				AuditorEDa_U2B.OPCION.ViewValue = Convert.ToString(AuditorEDa_U2B.OPCION.Summary)

				' ACCESO_OPCION
				AuditorEDa_U2B.ACCESO_OPCION.ViewValue = Convert.ToString(AuditorEDa_U2B.ACCESO_OPCION.Summary)

				' HORFEC_LOG
				AuditorEDa_U2B.HORFEC_LOG.ViewValue = Convert.ToString(AuditorEDa_U2B.HORFEC_LOG.Summary)

				' HORFEC_OUT
				AuditorEDa_U2B.HORFEC_OUT.ViewValue = Convert.ToString(AuditorEDa_U2B.HORFEC_OUT.Summary)

				' HORFEC_TRANS
				AuditorEDa_U2B.HORFEC_TRANS.ViewValue = Convert.ToString(AuditorEDa_U2B.HORFEC_TRANS.Summary)

				' FECMOVTRANS
				AuditorEDa_U2B.FECMOVTRANS.ViewValue = Convert.ToString(AuditorEDa_U2B.FECMOVTRANS.Summary)
				AuditorEDa_U2B.FECMOVTRANS.ViewValue = ew_FormatDateTime(AuditorEDa_U2B.FECMOVTRANS.ViewValue, 7)

				' NOMBRE_FUNCIONARIO
				AuditorEDa_U2B.NOMBRE_FUNCIONARIO.ViewValue = Convert.ToString(AuditorEDa_U2B.NOMBRE_FUNCIONARIO.Summary)

				' ROL_ADMINISTRATIVO
				AuditorEDa_U2B.ROL_ADMINISTRATIVO.ViewValue = Convert.ToString(AuditorEDa_U2B.ROL_ADMINISTRATIVO.Summary)
			Else

				' USERNAME
				AuditorEDa_U2B.USERNAME.ViewValue = Convert.ToString(AuditorEDa_U2B.USERNAME.CurrentValue)
				AuditorEDa_U2B.USERNAME.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				AuditorEDa_U2B.PATERNO.ViewValue = Convert.ToString(AuditorEDa_U2B.PATERNO.CurrentValue)
				AuditorEDa_U2B.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				AuditorEDa_U2B.MATERNO.ViewValue = Convert.ToString(AuditorEDa_U2B.MATERNO.CurrentValue)
				AuditorEDa_U2B.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				AuditorEDa_U2B.NOMBRE.ViewValue = Convert.ToString(AuditorEDa_U2B.NOMBRE.CurrentValue)
				AuditorEDa_U2B.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				AuditorEDa_U2B.NOMBRE_C.ViewValue = Convert.ToString(AuditorEDa_U2B.NOMBRE_C.CurrentValue)
				AuditorEDa_U2B.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TRANSACCION
				AuditorEDa_U2B.TRANSACCION.ViewValue = Convert.ToString(AuditorEDa_U2B.TRANSACCION.CurrentValue)
				AuditorEDa_U2B.TRANSACCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' OPCION
				AuditorEDa_U2B.OPCION.ViewValue = Convert.ToString(AuditorEDa_U2B.OPCION.CurrentValue)
				AuditorEDa_U2B.OPCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ACCESO_OPCION
				AuditorEDa_U2B.ACCESO_OPCION.ViewValue = Convert.ToString(AuditorEDa_U2B.ACCESO_OPCION.CurrentValue)
				AuditorEDa_U2B.ACCESO_OPCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' HORFEC_LOG
				AuditorEDa_U2B.HORFEC_LOG.ViewValue = Convert.ToString(AuditorEDa_U2B.HORFEC_LOG.CurrentValue)
				AuditorEDa_U2B.HORFEC_LOG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' HORFEC_OUT
				AuditorEDa_U2B.HORFEC_OUT.ViewValue = Convert.ToString(AuditorEDa_U2B.HORFEC_OUT.CurrentValue)
				AuditorEDa_U2B.HORFEC_OUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' HORFEC_TRANS
				AuditorEDa_U2B.HORFEC_TRANS.ViewValue = Convert.ToString(AuditorEDa_U2B.HORFEC_TRANS.CurrentValue)
				AuditorEDa_U2B.HORFEC_TRANS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECMOVTRANS
				AuditorEDa_U2B.FECMOVTRANS.ViewValue = Convert.ToString(AuditorEDa_U2B.FECMOVTRANS.CurrentValue)
				AuditorEDa_U2B.FECMOVTRANS.ViewValue = ew_FormatDateTime(AuditorEDa_U2B.FECMOVTRANS.ViewValue, 7)
				AuditorEDa_U2B.FECMOVTRANS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_FUNCIONARIO
				AuditorEDa_U2B.NOMBRE_FUNCIONARIO.ViewValue = Convert.ToString(AuditorEDa_U2B.NOMBRE_FUNCIONARIO.CurrentValue)
				AuditorEDa_U2B.NOMBRE_FUNCIONARIO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ROL_ADMINISTRATIVO
				AuditorEDa_U2B.ROL_ADMINISTRATIVO.ViewValue = Convert.ToString(AuditorEDa_U2B.ROL_ADMINISTRATIVO.CurrentValue)
				AuditorEDa_U2B.ROL_ADMINISTRATIVO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' USERNAME
			AuditorEDa_U2B.USERNAME.HrefValue = ""

			' PATERNO
			AuditorEDa_U2B.PATERNO.HrefValue = ""

			' MATERNO
			AuditorEDa_U2B.MATERNO.HrefValue = ""

			' NOMBRE
			AuditorEDa_U2B.NOMBRE.HrefValue = ""

			' NOMBRE_C
			AuditorEDa_U2B.NOMBRE_C.HrefValue = ""

			' TRANSACCION
			AuditorEDa_U2B.TRANSACCION.HrefValue = ""

			' OPCION
			AuditorEDa_U2B.OPCION.HrefValue = ""

			' ACCESO_OPCION
			AuditorEDa_U2B.ACCESO_OPCION.HrefValue = ""

			' HORFEC_LOG
			AuditorEDa_U2B.HORFEC_LOG.HrefValue = ""

			' HORFEC_OUT
			AuditorEDa_U2B.HORFEC_OUT.HrefValue = ""

			' HORFEC_TRANS
			AuditorEDa_U2B.HORFEC_TRANS.HrefValue = ""

			' FECMOVTRANS
			AuditorEDa_U2B.FECMOVTRANS.HrefValue = ""

			' NOMBRE_FUNCIONARIO
			AuditorEDa_U2B.NOMBRE_FUNCIONARIO.HrefValue = ""

			' ROL_ADMINISTRATIVO
			AuditorEDa_U2B.ROL_ADMINISTRATIVO.HrefValue = ""

			' Call Row_Rendered event
			AuditorEDa_U2B.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + AuditorEDa_U2B.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AuditorEDa_U2B.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AuditorEDa_U2B.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NOMBRE_FUNCIONARIO
			sSelect = "SELECT DISTINCT [NOMBRE_FUNCIONARIO] FROM " + AuditorEDa_U2B.SqlFrom
			sOrderBy = "[NOMBRE_FUNCIONARIO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AuditorEDa_U2B.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field USERNAME
				SetSessionFilterValues(AuditorEDa_U2B.USERNAME)

				' Field PATERNO
				SetSessionFilterValues(AuditorEDa_U2B.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(AuditorEDa_U2B.MATERNO)

				' Field NOMBRE
				SetSessionFilterValues(AuditorEDa_U2B.NOMBRE)

				' Field NOMBRE_C
				SetSessionDropDownValue(AuditorEDa_U2B.NOMBRE_C.DropDownValue, AuditorEDa_U2B.NOMBRE_C)

				' Field NOMBRE_FUNCIONARIO
				SetSessionDropDownValue(AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownValue, AuditorEDa_U2B.NOMBRE_FUNCIONARIO)
			bSetupFilter = True ' Set up filter required
		Else

				' Field USERNAME
				If (GetFilterValues(AuditorEDa_U2B.USERNAME)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(AuditorEDa_U2B.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(AuditorEDa_U2B.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(AuditorEDa_U2B.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE_C
				If (GetDropDownValue(AuditorEDa_U2B.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AuditorEDa_U2B.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(AuditorEDa_U2B.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AuditorEDa_U2B_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field NOMBRE_FUNCIONARIO
				If (GetDropDownValue(AuditorEDa_U2B.NOMBRE_FUNCIONARIO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownValue) Then
					If Not ew_SameStr(AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AuditorEDa_U2B_NOMBRE_FUNCIONARIO") Is Nothing Then
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

			' Field USERNAME
			GetSessionFilterValues(AuditorEDa_U2B.USERNAME)

			' Field PATERNO
			GetSessionFilterValues(AuditorEDa_U2B.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(AuditorEDa_U2B.MATERNO)

			' Field NOMBRE
			GetSessionFilterValues(AuditorEDa_U2B.NOMBRE)

			' Field NOMBRE_C
			GetSessionDropDownValue(AuditorEDa_U2B.NOMBRE_C)

			' Field NOMBRE_FUNCIONARIO
			GetSessionDropDownValue(AuditorEDa_U2B.NOMBRE_FUNCIONARIO)
		End If

		' Call page filter validated event
		AuditorEDa_U2B.Page_FilterValidated()

		' Build SQL
		' Field USERNAME

		BuildExtendedFilter(AuditorEDa_U2B.USERNAME, sFilter)

		' Field PATERNO
		BuildExtendedFilter(AuditorEDa_U2B.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(AuditorEDa_U2B.MATERNO, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(AuditorEDa_U2B.NOMBRE, sFilter)

		' Field NOMBRE_C
		BuildDropDownFilter(AuditorEDa_U2B.NOMBRE_C, sFilter, "")

		' Field NOMBRE_FUNCIONARIO
		BuildDropDownFilter(AuditorEDa_U2B.NOMBRE_FUNCIONARIO, sFilter, "")

		' Save parms to Session
		' Field USERNAME

		SetSessionFilterValues(AuditorEDa_U2B.USERNAME)

		' Field PATERNO
		SetSessionFilterValues(AuditorEDa_U2B.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(AuditorEDa_U2B.MATERNO)

		' Field NOMBRE
		SetSessionFilterValues(AuditorEDa_U2B.NOMBRE)

		' Field NOMBRE_C
		SetSessionDropDownValue(AuditorEDa_U2B.NOMBRE_C.DropDownValue, AuditorEDa_U2B.NOMBRE_C)

		' Field NOMBRE_FUNCIONARIO
		SetSessionDropDownValue(AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownValue, AuditorEDa_U2B.NOMBRE_FUNCIONARIO)

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
		If ew_Session("sv_AuditorEDa_U2B_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_AuditorEDa_U2B_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_AuditorEDa_U2B_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_AuditorEDa_U2B_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_AuditorEDa_U2B_" + parm)
		End If
		If ew_Session("so1_AuditorEDa_U2B_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_AuditorEDa_U2B_" + parm))
		End If
		If ew_Session("sc_AuditorEDa_U2B_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_AuditorEDa_U2B_" + parm))
		End If
		If ew_Session("sv2_AuditorEDa_U2B_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_AuditorEDa_U2B_" + parm)
		End If
		If ew_Session("so2_AuditorEDa_U2B_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_AuditorEDa_U2B_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_AuditorEDa_U2B_" + parm) = fld.SearchValue
		ew_Session("so1_AuditorEDa_U2B_" + parm) = fld.SearchOperator
		ew_Session("sc_AuditorEDa_U2B_" + parm) = fld.SearchCondition
		ew_Session("sv2_AuditorEDa_U2B_" + parm) = fld.SearchValue2
		ew_Session("so2_AuditorEDa_U2B_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_AuditorEDa_U2B_" + parm) = ""
		ew_Session("so1_AuditorEDa_U2B_" + parm) = "="
		ew_Session("sc_AuditorEDa_U2B_" + parm) = "AND"
		ew_Session("sv2_AuditorEDa_U2B_" + parm) = ""
		ew_Session("so2_AuditorEDa_U2B_" + parm) = "="
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
		ew_Session("sel_AuditorEDa_U2B_" & parm) = ""
		ew_Session("rf_AuditorEDa_U2B_" & parm) = ""
		ew_Session("rt_AuditorEDa_U2B_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = AuditorEDa_U2B.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_AuditorEDa_U2B_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_AuditorEDa_U2B_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_AuditorEDa_U2B_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBRE_C

			AuditorEDa_U2B.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			AuditorEDa_U2B.NOMBRE_C.DropDownValue = AuditorEDa_U2B.NOMBRE_C.DefaultDropDownValue

			' Field NOMBRE_FUNCIONARIO
			AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DefaultDropDownValue = EWRPT_INIT_VALUE
			AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownValue = AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DefaultDropDownValue

		' Set up default values for extended filters
			' Field USERNAME

			SetDefaultExtFilter(AuditorEDa_U2B.USERNAME, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AuditorEDa_U2B.USERNAME)	

			' Field PATERNO
			SetDefaultExtFilter(AuditorEDa_U2B.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AuditorEDa_U2B.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(AuditorEDa_U2B.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AuditorEDa_U2B.MATERNO)	

			' Field NOMBRE
			SetDefaultExtFilter(AuditorEDa_U2B.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AuditorEDa_U2B.NOMBRE)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check USERNAME extended filter
		If (TextFilterApplied(AuditorEDa_U2B.USERNAME)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(AuditorEDa_U2B.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(AuditorEDa_U2B.MATERNO)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(AuditorEDa_U2B.NOMBRE)) Then bFilterExist = True

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(AuditorEDa_U2B.NOMBRE_C)) Then bFilterExist = True

		' Check NOMBRE_FUNCIONARIO dropdown filter
		If (NonTextFilterApplied(AuditorEDa_U2B.NOMBRE_FUNCIONARIO)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field USERNAME
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AuditorEDa_U2B.USERNAME, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AuditorEDa_U2B.USERNAME.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AuditorEDa_U2B.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AuditorEDa_U2B.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AuditorEDa_U2B.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AuditorEDa_U2B.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AuditorEDa_U2B.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AuditorEDa_U2B.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AuditorEDa_U2B.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AuditorEDa_U2B.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_FUNCIONARIO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AuditorEDa_U2B.NOMBRE_FUNCIONARIO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AuditorEDa_U2B.NOMBRE_FUNCIONARIO.FldCaption() & "<br>"
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
				AuditorEDa_U2B.OrderBy = ""
				AuditorEDa_U2B.StartGroup = 1
				AuditorEDa_U2B.USERNAME.Sort = ""
				AuditorEDa_U2B.PATERNO.Sort = ""
				AuditorEDa_U2B.MATERNO.Sort = ""
				AuditorEDa_U2B.NOMBRE.Sort = ""
				AuditorEDa_U2B.NOMBRE_C.Sort = ""
				AuditorEDa_U2B.TRANSACCION.Sort = ""
				AuditorEDa_U2B.OPCION.Sort = ""
				AuditorEDa_U2B.ACCESO_OPCION.Sort = ""
				AuditorEDa_U2B.HORFEC_LOG.Sort = ""
				AuditorEDa_U2B.HORFEC_OUT.Sort = ""
				AuditorEDa_U2B.HORFEC_TRANS.Sort = ""
				AuditorEDa_U2B.FECMOVTRANS.Sort = ""
				AuditorEDa_U2B.NOMBRE_FUNCIONARIO.Sort = ""
				AuditorEDa_U2B.ROL_ADMINISTRATIVO.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			AuditorEDa_U2B.CurrentOrder = ew_Get("order")
			AuditorEDa_U2B.CurrentOrderType = ew_Get("ordertype")
			sSortSql = AuditorEDa_U2B.SortSql()
			AuditorEDa_U2B.OrderBy = sSortSql
			AuditorEDa_U2B.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(AuditorEDa_U2B.OrderBy)) Then
			AuditorEDa_U2B.OrderBy = "[PATERNO] ASC, [MATERNO] ASC, [NOMBRE] ASC"
			AuditorEDa_U2B.PATERNO.Sort = "ASC"
			AuditorEDa_U2B.MATERNO.Sort = "ASC"
			AuditorEDa_U2B.NOMBRE.Sort = "ASC"
		End If
		Return AuditorEDa_U2B.OrderBy
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
		AuditorEDa_U2B_summary = New crAuditorEDa_U2B_summary(Me)
		AuditorEDa_U2B_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		AuditorEDa_U2B_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (AuditorEDa_U2B_summary IsNot Nothing) Then AuditorEDa_U2B_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (AuditorEDa_U2B.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var AuditorEDa_U2B_summary = new ewrpt_Page("AuditorEDa_U2B_summary");
// page properties
AuditorEDa_U2B_summary.PageID = "summary"; // page ID
AuditorEDa_U2B_summary.FormID = "fAuditorEDa_U2Bsummaryfilter"; // form ID
var EWRPT_PAGE_ID = AuditorEDa_U2B_summary.PageID;
// extend page with ValidateForm function
AuditorEDa_U2B_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
AuditorEDa_U2B_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
AuditorEDa_U2B_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
AuditorEDa_U2B_summary.ValidateRequired = false; // no JavaScript validation
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
<% AuditorEDa_U2B_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (AuditorEDa_U2B.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (AuditorEDa_U2B.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= AuditorEDa_U2B.TableCaption() %></h1></div>
<% If (AuditorEDa_U2B.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= AuditorEDa_U2B_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% If (AuditorEDa_U2B_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% AuditorEDa_U2B_summary.ShowMessage() %>
<% If (AuditorEDa_U2B.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (AuditorEDa_U2B.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (AuditorEDa_U2B.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (AuditorEDa_U2B.FilterPanelOption = 2 OrElse (AuditorEDa_U2B.FilterPanelOption = 3 AndAlso AuditorEDa_U2B_summary.FilterApplied) OrElse AuditorEDa_U2B_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="AuditorEDa_U2Bsmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fAuditorEDa_U2Bsummaryfilter" id="fAuditorEDa_U2Bsummaryfilter" action="AuditorEDa_U2Bsmry.aspx" class="ewForm" onsubmit="return AuditorEDa_U2B_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = AuditorEDa_U2B.NOMBRE.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= AuditorEDa_U2B.USERNAME.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_USERNAME" id="sv1_USERNAME" size="30" maxlength="30" value="<%= ew_HtmlEncode(AuditorEDa_U2B.USERNAME.SearchValue) %>"<%= IIf(AuditorEDa_U2B_summary.ClearExtFilter = "AuditorEDa_U2B_USERNAME", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AuditorEDa_U2B.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(AuditorEDa_U2B.PATERNO.SearchValue) %>"<%= IIf(AuditorEDa_U2B_summary.ClearExtFilter = "AuditorEDa_U2B_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AuditorEDa_U2B.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(AuditorEDa_U2B.MATERNO.SearchValue) %>"<%= IIf(AuditorEDa_U2B_summary.ClearExtFilter = "AuditorEDa_U2B_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AuditorEDa_U2B.NOMBRE.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(AuditorEDa_U2B.NOMBRE.SearchValue) %>"<%= IIf(AuditorEDa_U2B_summary.ClearExtFilter = "AuditorEDa_U2B_NOMBRE", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AuditorEDa_U2B.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(AuditorEDa_U2B_summary.ClearExtFilter = "AuditorEDa_U2B_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AuditorEDa_U2B.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AuditorEDa_U2B.NOMBRE_C.CustomFilters.Count + AuditorEDa_U2B.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AuditorEDa_U2B.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AuditorEDa_U2B.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AuditorEDa_U2B.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AuditorEDa_U2B.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AuditorEDa_U2B.NOMBRE_FUNCIONARIO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_FUNCIONARIO" id="sv_NOMBRE_FUNCIONARIO"<%= IIf(AuditorEDa_U2B_summary.ClearExtFilter = "AuditorEDa_U2B_NOMBRE_FUNCIONARIO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AuditorEDa_U2B.NOMBRE_FUNCIONARIO.CustomFilters.Count + AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AuditorEDa_U2B.NOMBRE_FUNCIONARIO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_FUNCIONARIO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AuditorEDa_U2B.NOMBRE_FUNCIONARIO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (AuditorEDa_U2B.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% AuditorEDa_U2B_summary.ShowFilterList() %>
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
If (AuditorEDa_U2B.ExportAll AndAlso ew_NotEmpty(AuditorEDa_U2B.Export)) Then
	AuditorEDa_U2B_summary.StopGrp = AuditorEDa_U2B_summary.TotalGrps
Else
	AuditorEDa_U2B_summary.StopGrp = AuditorEDa_U2B_summary.StartGrp + AuditorEDa_U2B_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (AuditorEDa_U2B_summary.StopGrp > AuditorEDa_U2B_summary.TotalGrps) Then
	AuditorEDa_U2B_summary.StopGrp = AuditorEDa_U2B_summary.TotalGrps
End If
AuditorEDa_U2B_summary.RecCount = 0

' Get first row
If (AuditorEDa_U2B_summary.TotalGrps > 0) Then
	AuditorEDa_U2B_summary.GetRow() ' ASPXRPT
	AuditorEDa_U2B_summary.GrpCount = 1
End If
While ((AuditorEDa_U2B_summary.HasRow AndAlso AuditorEDa_U2B_summary.GrpIndex < AuditorEDa_U2B_summary.StopGrp) OrElse AuditorEDa_U2B_summary.ShowFirstHeader)

	' Show header
	If (AuditorEDa_U2B_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.USERNAME.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.USERNAME))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.USERNAME.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.USERNAME) %>',0);"><%= AuditorEDa_U2B.USERNAME.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.USERNAME.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.USERNAME.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.PATERNO) %>',0);"><%= AuditorEDa_U2B.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.MATERNO) %>',0);"><%= AuditorEDa_U2B.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.NOMBRE) %>',0);"><%= AuditorEDa_U2B.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.NOMBRE_C) %>',0);"><%= AuditorEDa_U2B.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.TRANSACCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.TRANSACCION))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.TRANSACCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.TRANSACCION) %>',0);"><%= AuditorEDa_U2B.TRANSACCION.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.TRANSACCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.TRANSACCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.OPCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.OPCION))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.OPCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.OPCION) %>',0);"><%= AuditorEDa_U2B.OPCION.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.OPCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.OPCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.ACCESO_OPCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.ACCESO_OPCION))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.ACCESO_OPCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.ACCESO_OPCION) %>',0);"><%= AuditorEDa_U2B.ACCESO_OPCION.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.ACCESO_OPCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.ACCESO_OPCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.HORFEC_LOG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.HORFEC_LOG))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.HORFEC_LOG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.HORFEC_LOG) %>',0);"><%= AuditorEDa_U2B.HORFEC_LOG.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.HORFEC_LOG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.HORFEC_LOG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.HORFEC_OUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.HORFEC_OUT))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.HORFEC_OUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.HORFEC_OUT) %>',0);"><%= AuditorEDa_U2B.HORFEC_OUT.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.HORFEC_OUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.HORFEC_OUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.HORFEC_TRANS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.HORFEC_TRANS))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.HORFEC_TRANS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.HORFEC_TRANS) %>',0);"><%= AuditorEDa_U2B.HORFEC_TRANS.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.HORFEC_TRANS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.HORFEC_TRANS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.FECMOVTRANS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.FECMOVTRANS))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.FECMOVTRANS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.FECMOVTRANS) %>',0);"><%= AuditorEDa_U2B.FECMOVTRANS.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.FECMOVTRANS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.FECMOVTRANS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.NOMBRE_FUNCIONARIO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.NOMBRE_FUNCIONARIO))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.NOMBRE_FUNCIONARIO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.NOMBRE_FUNCIONARIO) %>',0);"><%= AuditorEDa_U2B.NOMBRE_FUNCIONARIO.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.NOMBRE_FUNCIONARIO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.NOMBRE_FUNCIONARIO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AuditorEDa_U2B.Export)) Then %>
<%= AuditorEDa_U2B.ROL_ADMINISTRATIVO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.ROL_ADMINISTRATIVO))) Then %>
		<td style="vertical-align: bottom;"><%= AuditorEDa_U2B.ROL_ADMINISTRATIVO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AuditorEDa_U2B.SortUrl(AuditorEDa_U2B.ROL_ADMINISTRATIVO) %>',0);"><%= AuditorEDa_U2B.ROL_ADMINISTRATIVO.FldCaption() %></td><td style="width: 10px;">
		<% If (AuditorEDa_U2B.ROL_ADMINISTRATIVO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AuditorEDa_U2B.ROL_ADMINISTRATIVO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		AuditorEDa_U2B_summary.ShowFirstHeader = False
	End If
	AuditorEDa_U2B_summary.RecCount += 1

		' Render detail row
		AuditorEDa_U2B.ResetCSS()
		AuditorEDa_U2B.RowType = EWRPT_ROWTYPE_DETAIL
		AuditorEDa_U2B_summary.RenderRow()
%>
	<tr<%= AuditorEDa_U2B.RowAttributes() %>>
		<td<%= AuditorEDa_U2B.USERNAME.CellAttributes %>>
<div<%= AuditorEDa_U2B.USERNAME.ViewAttributes%>><%= AuditorEDa_U2B.USERNAME.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.PATERNO.CellAttributes %>>
<div<%= AuditorEDa_U2B.PATERNO.ViewAttributes%>><%= AuditorEDa_U2B.PATERNO.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.MATERNO.CellAttributes %>>
<div<%= AuditorEDa_U2B.MATERNO.ViewAttributes%>><%= AuditorEDa_U2B.MATERNO.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.NOMBRE.CellAttributes %>>
<div<%= AuditorEDa_U2B.NOMBRE.ViewAttributes%>><%= AuditorEDa_U2B.NOMBRE.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.NOMBRE_C.CellAttributes %>>
<div<%= AuditorEDa_U2B.NOMBRE_C.ViewAttributes%>><%= AuditorEDa_U2B.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.TRANSACCION.CellAttributes %>>
<div<%= AuditorEDa_U2B.TRANSACCION.ViewAttributes%>><%= AuditorEDa_U2B.TRANSACCION.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.OPCION.CellAttributes %>>
<div<%= AuditorEDa_U2B.OPCION.ViewAttributes%>><%= AuditorEDa_U2B.OPCION.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.ACCESO_OPCION.CellAttributes %>>
<div<%= AuditorEDa_U2B.ACCESO_OPCION.ViewAttributes%>><%= AuditorEDa_U2B.ACCESO_OPCION.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.HORFEC_LOG.CellAttributes %>>
<div<%= AuditorEDa_U2B.HORFEC_LOG.ViewAttributes%>><%= AuditorEDa_U2B.HORFEC_LOG.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.HORFEC_OUT.CellAttributes %>>
<div<%= AuditorEDa_U2B.HORFEC_OUT.ViewAttributes%>><%= AuditorEDa_U2B.HORFEC_OUT.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.HORFEC_TRANS.CellAttributes %>>
<div<%= AuditorEDa_U2B.HORFEC_TRANS.ViewAttributes%>><%= AuditorEDa_U2B.HORFEC_TRANS.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.FECMOVTRANS.CellAttributes %>>
<div<%= AuditorEDa_U2B.FECMOVTRANS.ViewAttributes%>><%= AuditorEDa_U2B.FECMOVTRANS.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.NOMBRE_FUNCIONARIO.CellAttributes %>>
<div<%= AuditorEDa_U2B.NOMBRE_FUNCIONARIO.ViewAttributes%>><%= AuditorEDa_U2B.NOMBRE_FUNCIONARIO.ListViewValue%></div>
</td>
		<td<%= AuditorEDa_U2B.ROL_ADMINISTRATIVO.CellAttributes %>>
<div<%= AuditorEDa_U2B.ROL_ADMINISTRATIVO.ViewAttributes%>><%= AuditorEDa_U2B.ROL_ADMINISTRATIVO.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		AuditorEDa_U2B_summary.AccumulateSummary()

		' Get next record
		AuditorEDa_U2B_summary.GetRow() ' ASPXRPT
		AuditorEDa_U2B_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (AuditorEDa_U2B_summary.TotalGrps > 0) Then
	AuditorEDa_U2B.ResetCSS()
	AuditorEDa_U2B.RowType = EWRPT_ROWTYPE_TOTAL
	AuditorEDa_U2B.RowTotalType = EWRPT_ROWTOTAL_GRAND
	AuditorEDa_U2B.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	AuditorEDa_U2B.RowAttrs("class") = "ewRptGrandSummary"
	AuditorEDa_U2B_summary.RenderRow()
%>
	<!-- tr><td colspan="14"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= AuditorEDa_U2B.RowAttributes() %>><td colspan="14"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(AuditorEDa_U2B_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (AuditorEDa_U2B.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If AuditorEDa_U2B_summary.Pager Is Nothing Then AuditorEDa_U2B_summary.Pager = New cPrevNextPager(AuditorEDa_U2B_summary.StartGrp, AuditorEDa_U2B_summary.DisplayGrps, AuditorEDa_U2B_summary.TotalGrps) %>
<% If AuditorEDa_U2B_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If AuditorEDa_U2B_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="AuditorEDa_U2Bsmry.aspx?start=<%= AuditorEDa_U2B_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If AuditorEDa_U2B_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="AuditorEDa_U2Bsmry.aspx?start=<%= AuditorEDa_U2B_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= AuditorEDa_U2B_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If AuditorEDa_U2B_summary.Pager.NextButton.Enabled Then %>
	<td><a href="AuditorEDa_U2Bsmry.aspx?start=<%= AuditorEDa_U2B_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If AuditorEDa_U2B_summary.Pager.LastButton.Enabled Then %>
	<td><a href="AuditorEDa_U2Bsmry.aspx?start=<%= AuditorEDa_U2B_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= AuditorEDa_U2B_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= AuditorEDa_U2B_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= AuditorEDa_U2B_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= AuditorEDa_U2B_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If AuditorEDa_U2B_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (AuditorEDa_U2B_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If AuditorEDa_U2B_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If AuditorEDa_U2B_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If AuditorEDa_U2B_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
<option value="200"<% If AuditorEDa_U2B_summary.DisplayGrps = 200 Then Response.Write(" selected=""selected""") %>>200</option>
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
<% If (AuditorEDa_U2B.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (AuditorEDa_U2B.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (AuditorEDa_U2B.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% AuditorEDa_U2B_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (AuditorEDa_U2B.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
