<%@ Page ClassName="Analisis_Pagosmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public Analisis_Pago As crAnalisis_Pago = Nothing

	'
	' Table class (for Analisis Pago)
	'
	Public Class crAnalisis_Pago
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
				Return "Analisis_Pago"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Analisis Pago"
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

		Public FACULTAD As crField

		Public CARRERA As crField

		Public RUT As crField

		Public DIG As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRES As crField

		Public DOCUMENTO As crField

		Public PAGO As crField

		Public CTADOC As crField

		Public CTADOCNUM As crField

		Public CTAPAGNUM As crField

		Public CTAPAG As crField

		Public Monto_Ctadoc As crField

		Public Saldo_Ctadoc As crField

		Public FECVEN As crField

		Public ANO As crField

		Public Monto_CtaDep As crField

		Public Monto_CtaPag As crField

		Public Saldo_Ctapag As crField

		Public FECCANCEL As crField

		Public AF1o_Movimiento As crField

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

			' FACULTAD
			FACULTAD = new crField("Analisis_Pago", "Analisis Pago", "x_FACULTAD", "FACULTAD", "[FACULTAD]", 200, EWRPT_DATATYPE_STRING, -1)
			FACULTAD.Page = APage
			FACULTAD.ParentPage = APage.ParentPage
			Fields.Add("FACULTAD", FACULTAD)
			FACULTAD.DateFilter = ""
			FACULTAD.SqlSelect = ""
			FACULTAD.SqlOrderBy = ""

			' CARRERA
			CARRERA = new crField("Analisis_Pago", "Analisis Pago", "x_CARRERA", "CARRERA", "[CARRERA]", 200, EWRPT_DATATYPE_STRING, -1)
			CARRERA.Page = APage
			CARRERA.ParentPage = APage.ParentPage
			Fields.Add("CARRERA", CARRERA)
			CARRERA.DateFilter = ""
			CARRERA.SqlSelect = ""
			CARRERA.SqlOrderBy = ""

			' RUT
			RUT = new crField("Analisis_Pago", "Analisis Pago", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' DIG
			DIG = new crField("Analisis_Pago", "Analisis Pago", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
			DIG.Page = APage
			DIG.ParentPage = APage.ParentPage
			Fields.Add("DIG", DIG)
			DIG.DateFilter = ""
			DIG.SqlSelect = ""
			DIG.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Analisis_Pago", "Analisis Pago", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Analisis_Pago", "Analisis Pago", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRES
			NOMBRES = new crField("Analisis_Pago", "Analisis Pago", "x_NOMBRES", "NOMBRES", "[NOMBRES]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRES.Page = APage
			NOMBRES.ParentPage = APage.ParentPage
			Fields.Add("NOMBRES", NOMBRES)
			NOMBRES.DateFilter = ""
			NOMBRES.SqlSelect = ""
			NOMBRES.SqlOrderBy = ""

			' DOCUMENTO
			DOCUMENTO = new crField("Analisis_Pago", "Analisis Pago", "x_DOCUMENTO", "DOCUMENTO", "[DOCUMENTO]", 200, EWRPT_DATATYPE_STRING, -1)
			DOCUMENTO.Page = APage
			DOCUMENTO.ParentPage = APage.ParentPage
			Fields.Add("DOCUMENTO", DOCUMENTO)
			DOCUMENTO.DateFilter = ""
			DOCUMENTO.SqlSelect = ""
			DOCUMENTO.SqlOrderBy = ""

			' PAGO
			PAGO = new crField("Analisis_Pago", "Analisis Pago", "x_PAGO", "PAGO", "[PAGO]", 200, EWRPT_DATATYPE_STRING, -1)
			PAGO.Page = APage
			PAGO.ParentPage = APage.ParentPage
			Fields.Add("PAGO", PAGO)
			PAGO.DateFilter = ""
			PAGO.SqlSelect = ""
			PAGO.SqlOrderBy = ""

			' CTADOC
			CTADOC = new crField("Analisis_Pago", "Analisis Pago", "x_CTADOC", "CTADOC", "[CTADOC]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CTADOC.Page = APage
			CTADOC.ParentPage = APage.ParentPage
			CTADOC.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CTADOC", CTADOC)
			CTADOC.DateFilter = ""
			CTADOC.SqlSelect = ""
			CTADOC.SqlOrderBy = ""

			' CTADOCNUM
			CTADOCNUM = new crField("Analisis_Pago", "Analisis Pago", "x_CTADOCNUM", "CTADOCNUM", "[CTADOCNUM]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CTADOCNUM.Page = APage
			CTADOCNUM.ParentPage = APage.ParentPage
			CTADOCNUM.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CTADOCNUM", CTADOCNUM)
			CTADOCNUM.DateFilter = ""
			CTADOCNUM.SqlSelect = ""
			CTADOCNUM.SqlOrderBy = ""

			' CTAPAGNUM
			CTAPAGNUM = new crField("Analisis_Pago", "Analisis Pago", "x_CTAPAGNUM", "CTAPAGNUM", "[CTAPAGNUM]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CTAPAGNUM.Page = APage
			CTAPAGNUM.ParentPage = APage.ParentPage
			CTAPAGNUM.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CTAPAGNUM", CTAPAGNUM)
			CTAPAGNUM.DateFilter = ""
			CTAPAGNUM.SqlSelect = ""
			CTAPAGNUM.SqlOrderBy = ""

			' CTAPAG
			CTAPAG = new crField("Analisis_Pago", "Analisis Pago", "x_CTAPAG", "CTAPAG", "[CTAPAG]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CTAPAG.Page = APage
			CTAPAG.ParentPage = APage.ParentPage
			CTAPAG.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CTAPAG", CTAPAG)
			CTAPAG.DateFilter = ""
			CTAPAG.SqlSelect = ""
			CTAPAG.SqlOrderBy = ""

			' Monto Ctadoc
			Monto_Ctadoc = new crField("Analisis_Pago", "Analisis Pago", "x_Monto_Ctadoc", "Monto Ctadoc", "[Monto Ctadoc]", 131, EWRPT_DATATYPE_NUMBER, -1)
			Monto_Ctadoc.Page = APage
			Monto_Ctadoc.ParentPage = APage.ParentPage
			Monto_Ctadoc.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Monto_Ctadoc", Monto_Ctadoc)
			Monto_Ctadoc.DateFilter = ""
			Monto_Ctadoc.SqlSelect = ""
			Monto_Ctadoc.SqlOrderBy = ""

			' Saldo Ctadoc
			Saldo_Ctadoc = new crField("Analisis_Pago", "Analisis Pago", "x_Saldo_Ctadoc", "Saldo Ctadoc", "[Saldo Ctadoc]", 131, EWRPT_DATATYPE_NUMBER, -1)
			Saldo_Ctadoc.Page = APage
			Saldo_Ctadoc.ParentPage = APage.ParentPage
			Saldo_Ctadoc.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Saldo_Ctadoc", Saldo_Ctadoc)
			Saldo_Ctadoc.DateFilter = ""
			Saldo_Ctadoc.SqlSelect = ""
			Saldo_Ctadoc.SqlOrderBy = ""

			' FECVEN
			FECVEN = new crField("Analisis_Pago", "Analisis Pago", "x_FECVEN", "FECVEN", "[FECVEN]", 135, EWRPT_DATATYPE_DATE, 7)
			FECVEN.Page = APage
			FECVEN.ParentPage = APage.ParentPage
			FECVEN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECVEN", FECVEN)
			FECVEN.DateFilter = ""
			FECVEN.SqlSelect = ""
			FECVEN.SqlOrderBy = ""

			' ANO
			ANO = new crField("Analisis_Pago", "Analisis Pago", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' Monto CtaDep
			Monto_CtaDep = new crField("Analisis_Pago", "Analisis Pago", "x_Monto_CtaDep", "Monto CtaDep", "[Monto CtaDep]", 131, EWRPT_DATATYPE_NUMBER, -1)
			Monto_CtaDep.Page = APage
			Monto_CtaDep.ParentPage = APage.ParentPage
			Monto_CtaDep.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Monto_CtaDep", Monto_CtaDep)
			Monto_CtaDep.DateFilter = ""
			Monto_CtaDep.SqlSelect = ""
			Monto_CtaDep.SqlOrderBy = ""

			' Monto CtaPag
			Monto_CtaPag = new crField("Analisis_Pago", "Analisis Pago", "x_Monto_CtaPag", "Monto CtaPag", "[Monto CtaPag]", 131, EWRPT_DATATYPE_NUMBER, -1)
			Monto_CtaPag.Page = APage
			Monto_CtaPag.ParentPage = APage.ParentPage
			Monto_CtaPag.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Monto_CtaPag", Monto_CtaPag)
			Monto_CtaPag.DateFilter = ""
			Monto_CtaPag.SqlSelect = ""
			Monto_CtaPag.SqlOrderBy = ""

			' Saldo Ctapag
			Saldo_Ctapag = new crField("Analisis_Pago", "Analisis Pago", "x_Saldo_Ctapag", "Saldo Ctapag", "[Saldo Ctapag]", 131, EWRPT_DATATYPE_NUMBER, -1)
			Saldo_Ctapag.Page = APage
			Saldo_Ctapag.ParentPage = APage.ParentPage
			Saldo_Ctapag.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Saldo_Ctapag", Saldo_Ctapag)
			Saldo_Ctapag.DateFilter = ""
			Saldo_Ctapag.SqlSelect = ""
			Saldo_Ctapag.SqlOrderBy = ""

			' FECCANCEL
			FECCANCEL = new crField("Analisis_Pago", "Analisis Pago", "x_FECCANCEL", "FECCANCEL", "[FECCANCEL]", 135, EWRPT_DATATYPE_DATE, 7)
			FECCANCEL.Page = APage
			FECCANCEL.ParentPage = APage.ParentPage
			FECCANCEL.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECCANCEL", FECCANCEL)
			FECCANCEL.DateFilter = ""
			FECCANCEL.SqlSelect = ""
			FECCANCEL.SqlOrderBy = ""

			' Año Movimiento
			AF1o_Movimiento = new crField("Analisis_Pago", "Analisis Pago", "x_AF1o_Movimiento", "Año Movimiento", "[Año Movimiento]", 131, EWRPT_DATATYPE_NUMBER, -1)
			AF1o_Movimiento.Page = APage
			AF1o_Movimiento.ParentPage = APage.ParentPage
			AF1o_Movimiento.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("AF1o_Movimiento", AF1o_Movimiento)
			AF1o_Movimiento.DateFilter = ""
			AF1o_Movimiento.SqlSelect = ""
			AF1o_Movimiento.SqlOrderBy = ""
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
				Return "[Vista_AnalisisPagos]"
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
	Public Analisis_Pago_summary As crAnalisis_Pago_summary

	'
	' Page class
	'
	Public Class crAnalisis_Pago_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Analisis_Pago.UseTokenInUrl) Then
				sUrl &= "t=" & Analisis_Pago.TableVar & "&" ' Add page token
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
			If (Analisis_Pago.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Analisis_Pago.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Analisis_Pago.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Analisis_Pagosmry 
			Get
				Return CType(m_ParentPage, Analisis_Pagosmry)
			End Get
		End Property

		' Table object (Analisis_Pago)
		Public Property Analisis_Pago As crAnalisis_Pago 
			Get		
				Return AspNetPage.Analisis_Pago ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAnalisis_Pago)
				AspNetPage.Analisis_Pago = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Analisis_Pago_summary"
			m_PageObjTypeName = "crAnalisis_Pago_summary"

			' Table name
			m_TableName = "Analisis Pago"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Analisis_Pago)
			Analisis_Pago = New crAnalisis_Pago(Me)			

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
				Analisis_Pago.Export = ew_Get("export")
			End If
			gsExport = Analisis_Pago.Export ' Get export parameter, used in header
			gsExportFile = Analisis_Pago.TableVar ' Get export file, used in header
			If (Analisis_Pago.Export = "excel") Then
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

		Public Val As Object() = New Object(21) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(21) {}

		Public GrandMn As Object() = New Object(21) {}

		Public GrandMx As Object() = New Object(21) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 22 ' No. of fields
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
			Analisis_Pago.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Analisis_Pago.SqlSelect, Analisis_Pago.SqlWhere, Analisis_Pago.SqlGroupBy, Analisis_Pago.SqlHaving, Analisis_Pago.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Analisis_Pago.ExportAll AndAlso ew_NotEmpty(Analisis_Pago.Export)) Then
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
				Analisis_Pago.FACULTAD.DbValue = Row("FACULTAD")
				Analisis_Pago.CARRERA.DbValue = Row("CARRERA")
				Analisis_Pago.RUT.DbValue = Row("RUT")
				Analisis_Pago.DIG.DbValue = Row("DIG")
				Analisis_Pago.PATERNO.DbValue = Row("PATERNO")
				Analisis_Pago.MATERNO.DbValue = Row("MATERNO")
				Analisis_Pago.NOMBRES.DbValue = Row("NOMBRES")
				Analisis_Pago.DOCUMENTO.DbValue = Row("DOCUMENTO")
				Analisis_Pago.PAGO.DbValue = Row("PAGO")
				Analisis_Pago.Monto_CtaDep.DbValue = Row("Monto CtaDep")
				Analisis_Pago.CTADOC.DbValue = Row("CTADOC")
				Analisis_Pago.CTADOCNUM.DbValue = Row("CTADOCNUM")
				Analisis_Pago.CTAPAGNUM.DbValue = Row("CTAPAGNUM")
				Analisis_Pago.CTAPAG.DbValue = Row("CTAPAG")
				Analisis_Pago.Monto_Ctadoc.DbValue = Row("Monto Ctadoc")
				Analisis_Pago.Saldo_Ctadoc.DbValue = Row("Saldo Ctadoc")
				Analisis_Pago.FECVEN.DbValue = Row("FECVEN")
				Analisis_Pago.ANO.DbValue = Row("ANO")
				Analisis_Pago.Monto_CtaPag.DbValue = Row("Monto CtaPag")
				Analisis_Pago.Saldo_Ctapag.DbValue = Row("Saldo Ctapag")
				Analisis_Pago.FECCANCEL.DbValue = Row("FECCANCEL")
				Analisis_Pago.AF1o_Movimiento.DbValue = Row("Año Movimiento")
				Val(1) = Analisis_Pago.FACULTAD.CurrentValue
				Val(2) = Analisis_Pago.CARRERA.CurrentValue
				Val(3) = Analisis_Pago.RUT.CurrentValue
				Val(4) = Analisis_Pago.DIG.CurrentValue
				Val(5) = Analisis_Pago.PATERNO.CurrentValue
				Val(6) = Analisis_Pago.MATERNO.CurrentValue
				Val(7) = Analisis_Pago.NOMBRES.CurrentValue
				Val(8) = Analisis_Pago.DOCUMENTO.CurrentValue
				Val(9) = Analisis_Pago.PAGO.CurrentValue
				Val(10) = Analisis_Pago.CTADOC.CurrentValue
				Val(11) = Analisis_Pago.CTADOCNUM.CurrentValue
				Val(12) = Analisis_Pago.CTAPAGNUM.CurrentValue
				Val(13) = Analisis_Pago.CTAPAG.CurrentValue
				Val(14) = Analisis_Pago.Monto_Ctadoc.CurrentValue
				Val(15) = Analisis_Pago.Saldo_Ctadoc.CurrentValue
				Val(16) = Analisis_Pago.FECVEN.CurrentValue
				Val(17) = Analisis_Pago.ANO.CurrentValue
				Val(18) = Analisis_Pago.Monto_CtaDep.CurrentValue
				Val(19) = Analisis_Pago.Monto_CtaPag.CurrentValue
				Val(20) = Analisis_Pago.Saldo_Ctapag.CurrentValue
				Val(21) = Analisis_Pago.FECCANCEL.CurrentValue
			Else
				Analisis_Pago.FACULTAD.DbValue = ""
				Analisis_Pago.CARRERA.DbValue = ""
				Analisis_Pago.RUT.DbValue = ""
				Analisis_Pago.DIG.DbValue = ""
				Analisis_Pago.PATERNO.DbValue = ""
				Analisis_Pago.MATERNO.DbValue = ""
				Analisis_Pago.NOMBRES.DbValue = ""
				Analisis_Pago.DOCUMENTO.DbValue = ""
				Analisis_Pago.PAGO.DbValue = ""
				Analisis_Pago.Monto_CtaDep.DbValue = ""
				Analisis_Pago.CTADOC.DbValue = ""
				Analisis_Pago.CTADOCNUM.DbValue = ""
				Analisis_Pago.CTAPAGNUM.DbValue = ""
				Analisis_Pago.CTAPAG.DbValue = ""
				Analisis_Pago.Monto_Ctadoc.DbValue = ""
				Analisis_Pago.Saldo_Ctadoc.DbValue = ""
				Analisis_Pago.FECVEN.DbValue = ""
				Analisis_Pago.ANO.DbValue = ""
				Analisis_Pago.Monto_CtaPag.DbValue = ""
				Analisis_Pago.Saldo_Ctapag.DbValue = ""
				Analisis_Pago.FECCANCEL.DbValue = ""
				Analisis_Pago.AF1o_Movimiento.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Analisis_Pago.FACULTAD.DbValue = dr("FACULTAD")
				Analisis_Pago.CARRERA.DbValue = dr("CARRERA")
				Analisis_Pago.RUT.DbValue = dr("RUT")
				Analisis_Pago.DIG.DbValue = dr("DIG")
				Analisis_Pago.PATERNO.DbValue = dr("PATERNO")
				Analisis_Pago.MATERNO.DbValue = dr("MATERNO")
				Analisis_Pago.NOMBRES.DbValue = dr("NOMBRES")
				Analisis_Pago.DOCUMENTO.DbValue = dr("DOCUMENTO")
				Analisis_Pago.PAGO.DbValue = dr("PAGO")
				Analisis_Pago.Monto_CtaDep.DbValue = dr("Monto CtaDep")
				Analisis_Pago.CTADOC.DbValue = dr("CTADOC")
				Analisis_Pago.CTADOCNUM.DbValue = dr("CTADOCNUM")
				Analisis_Pago.CTAPAGNUM.DbValue = dr("CTAPAGNUM")
				Analisis_Pago.CTAPAG.DbValue = dr("CTAPAG")
				Analisis_Pago.Monto_Ctadoc.DbValue = dr("Monto Ctadoc")
				Analisis_Pago.Saldo_Ctadoc.DbValue = dr("Saldo Ctadoc")
				Analisis_Pago.FECVEN.DbValue = dr("FECVEN")
				Analisis_Pago.ANO.DbValue = dr("ANO")
				Analisis_Pago.Monto_CtaPag.DbValue = dr("Monto CtaPag")
				Analisis_Pago.Saldo_Ctapag.DbValue = dr("Saldo Ctapag")
				Analisis_Pago.FECCANCEL.DbValue = dr("FECCANCEL")
				Analisis_Pago.AF1o_Movimiento.DbValue = dr("Año Movimiento")
				Val(1) = Analisis_Pago.FACULTAD.CurrentValue
				Val(2) = Analisis_Pago.CARRERA.CurrentValue
				Val(3) = Analisis_Pago.RUT.CurrentValue
				Val(4) = Analisis_Pago.DIG.CurrentValue
				Val(5) = Analisis_Pago.PATERNO.CurrentValue
				Val(6) = Analisis_Pago.MATERNO.CurrentValue
				Val(7) = Analisis_Pago.NOMBRES.CurrentValue
				Val(8) = Analisis_Pago.DOCUMENTO.CurrentValue
				Val(9) = Analisis_Pago.PAGO.CurrentValue
				Val(10) = Analisis_Pago.CTADOC.CurrentValue
				Val(11) = Analisis_Pago.CTADOCNUM.CurrentValue
				Val(12) = Analisis_Pago.CTAPAGNUM.CurrentValue
				Val(13) = Analisis_Pago.CTAPAG.CurrentValue
				Val(14) = Analisis_Pago.Monto_Ctadoc.CurrentValue
				Val(15) = Analisis_Pago.Saldo_Ctadoc.CurrentValue
				Val(16) = Analisis_Pago.FECVEN.CurrentValue
				Val(17) = Analisis_Pago.ANO.CurrentValue
				Val(18) = Analisis_Pago.Monto_CtaDep.CurrentValue
				Val(19) = Analisis_Pago.Monto_CtaPag.CurrentValue
				Val(20) = Analisis_Pago.Saldo_Ctapag.CurrentValue
				Val(21) = Analisis_Pago.FECCANCEL.CurrentValue
			Else				
				Analisis_Pago.FACULTAD.DbValue = ""
				Analisis_Pago.CARRERA.DbValue = ""
				Analisis_Pago.RUT.DbValue = ""
				Analisis_Pago.DIG.DbValue = ""
				Analisis_Pago.PATERNO.DbValue = ""
				Analisis_Pago.MATERNO.DbValue = ""
				Analisis_Pago.NOMBRES.DbValue = ""
				Analisis_Pago.DOCUMENTO.DbValue = ""
				Analisis_Pago.PAGO.DbValue = ""
				Analisis_Pago.Monto_CtaDep.DbValue = ""
				Analisis_Pago.CTADOC.DbValue = ""
				Analisis_Pago.CTADOCNUM.DbValue = ""
				Analisis_Pago.CTAPAGNUM.DbValue = ""
				Analisis_Pago.CTAPAG.DbValue = ""
				Analisis_Pago.Monto_Ctadoc.DbValue = ""
				Analisis_Pago.Saldo_Ctadoc.DbValue = ""
				Analisis_Pago.FECVEN.DbValue = ""
				Analisis_Pago.ANO.DbValue = ""
				Analisis_Pago.Monto_CtaPag.DbValue = ""
				Analisis_Pago.Saldo_Ctapag.DbValue = ""
				Analisis_Pago.FECCANCEL.DbValue = ""
				Analisis_Pago.AF1o_Movimiento.DbValue = ""
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
				Analisis_Pago.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Analisis_Pago.StartGroup = StartGrp
				Else
					StartGrp = Analisis_Pago.StartGroup
				End If
			Else
				StartGrp = Analisis_Pago.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Analisis_Pago.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Analisis_Pago.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Analisis_Pago.StartGroup = StartGrp
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
			Analisis_Pago.StartGroup = StartGrp
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
				Analisis_Pago.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Analisis_Pago.StartGroup = StartGrp
			Else				
				If (Analisis_Pago.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Analisis_Pago.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 15 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Analisis_Pago.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Analisis_Pago.SqlSelectCount, Analisis_Pago.SqlWhere, Analisis_Pago.SqlGroupBy, Analisis_Pago.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Analisis_Pago.Row_Rendering()

			'
			' Render view codes
			'

			If (Analisis_Pago.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' FACULTAD
				Analisis_Pago.FACULTAD.ViewValue = Convert.ToString(Analisis_Pago.FACULTAD.Summary)

				' CARRERA
				Analisis_Pago.CARRERA.ViewValue = Convert.ToString(Analisis_Pago.CARRERA.Summary)

				' RUT
				Analisis_Pago.RUT.ViewValue = Convert.ToString(Analisis_Pago.RUT.Summary)

				' DIG
				Analisis_Pago.DIG.ViewValue = Convert.ToString(Analisis_Pago.DIG.Summary)

				' PATERNO
				Analisis_Pago.PATERNO.ViewValue = Convert.ToString(Analisis_Pago.PATERNO.Summary)

				' MATERNO
				Analisis_Pago.MATERNO.ViewValue = Convert.ToString(Analisis_Pago.MATERNO.Summary)

				' NOMBRES
				Analisis_Pago.NOMBRES.ViewValue = Convert.ToString(Analisis_Pago.NOMBRES.Summary)

				' DOCUMENTO
				Analisis_Pago.DOCUMENTO.ViewValue = Convert.ToString(Analisis_Pago.DOCUMENTO.Summary)

				' PAGO
				Analisis_Pago.PAGO.ViewValue = Convert.ToString(Analisis_Pago.PAGO.Summary)

				' CTADOC
				Analisis_Pago.CTADOC.ViewValue = Convert.ToString(Analisis_Pago.CTADOC.Summary)

				' CTADOCNUM
				Analisis_Pago.CTADOCNUM.ViewValue = Convert.ToString(Analisis_Pago.CTADOCNUM.Summary)

				' CTAPAGNUM
				Analisis_Pago.CTAPAGNUM.ViewValue = Convert.ToString(Analisis_Pago.CTAPAGNUM.Summary)

				' CTAPAG
				Analisis_Pago.CTAPAG.ViewValue = Convert.ToString(Analisis_Pago.CTAPAG.Summary)

				' Monto Ctadoc
				Analisis_Pago.Monto_Ctadoc.ViewValue = Convert.ToString(Analisis_Pago.Monto_Ctadoc.Summary)

				' Saldo Ctadoc
				Analisis_Pago.Saldo_Ctadoc.ViewValue = Convert.ToString(Analisis_Pago.Saldo_Ctadoc.Summary)

				' FECVEN
				Analisis_Pago.FECVEN.ViewValue = Convert.ToString(Analisis_Pago.FECVEN.Summary)
				Analisis_Pago.FECVEN.ViewValue = ew_FormatDateTime(Analisis_Pago.FECVEN.ViewValue, 7)

				' ANO
				Analisis_Pago.ANO.ViewValue = Convert.ToString(Analisis_Pago.ANO.Summary)

				' Monto CtaDep
				Analisis_Pago.Monto_CtaDep.ViewValue = Convert.ToString(Analisis_Pago.Monto_CtaDep.Summary)

				' Monto CtaPag
				Analisis_Pago.Monto_CtaPag.ViewValue = Convert.ToString(Analisis_Pago.Monto_CtaPag.Summary)

				' Saldo Ctapag
				Analisis_Pago.Saldo_Ctapag.ViewValue = Convert.ToString(Analisis_Pago.Saldo_Ctapag.Summary)

				' FECCANCEL
				Analisis_Pago.FECCANCEL.ViewValue = Convert.ToString(Analisis_Pago.FECCANCEL.Summary)
				Analisis_Pago.FECCANCEL.ViewValue = ew_FormatDateTime(Analisis_Pago.FECCANCEL.ViewValue, 7)
			Else

				' FACULTAD
				Analisis_Pago.FACULTAD.ViewValue = Convert.ToString(Analisis_Pago.FACULTAD.CurrentValue)
				Analisis_Pago.FACULTAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CARRERA
				Analisis_Pago.CARRERA.ViewValue = Convert.ToString(Analisis_Pago.CARRERA.CurrentValue)
				Analisis_Pago.CARRERA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				Analisis_Pago.RUT.ViewValue = Convert.ToString(Analisis_Pago.RUT.CurrentValue)
				Analisis_Pago.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIG
				Analisis_Pago.DIG.ViewValue = Convert.ToString(Analisis_Pago.DIG.CurrentValue)
				Analisis_Pago.DIG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Analisis_Pago.PATERNO.ViewValue = Convert.ToString(Analisis_Pago.PATERNO.CurrentValue)
				Analisis_Pago.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Analisis_Pago.MATERNO.ViewValue = Convert.ToString(Analisis_Pago.MATERNO.CurrentValue)
				Analisis_Pago.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRES
				Analisis_Pago.NOMBRES.ViewValue = Convert.ToString(Analisis_Pago.NOMBRES.CurrentValue)
				Analisis_Pago.NOMBRES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DOCUMENTO
				Analisis_Pago.DOCUMENTO.ViewValue = Convert.ToString(Analisis_Pago.DOCUMENTO.CurrentValue)
				Analisis_Pago.DOCUMENTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PAGO
				Analisis_Pago.PAGO.ViewValue = Convert.ToString(Analisis_Pago.PAGO.CurrentValue)
				Analisis_Pago.PAGO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CTADOC
				Analisis_Pago.CTADOC.ViewValue = Convert.ToString(Analisis_Pago.CTADOC.CurrentValue)
				Analisis_Pago.CTADOC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CTADOCNUM
				Analisis_Pago.CTADOCNUM.ViewValue = Convert.ToString(Analisis_Pago.CTADOCNUM.CurrentValue)
				Analisis_Pago.CTADOCNUM.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CTAPAGNUM
				Analisis_Pago.CTAPAGNUM.ViewValue = Convert.ToString(Analisis_Pago.CTAPAGNUM.CurrentValue)
				Analisis_Pago.CTAPAGNUM.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CTAPAG
				Analisis_Pago.CTAPAG.ViewValue = Convert.ToString(Analisis_Pago.CTAPAG.CurrentValue)
				Analisis_Pago.CTAPAG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Monto Ctadoc
				Analisis_Pago.Monto_Ctadoc.ViewValue = Convert.ToString(Analisis_Pago.Monto_Ctadoc.CurrentValue)
				Analisis_Pago.Monto_Ctadoc.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Saldo Ctadoc
				Analisis_Pago.Saldo_Ctadoc.ViewValue = Convert.ToString(Analisis_Pago.Saldo_Ctadoc.CurrentValue)
				Analisis_Pago.Saldo_Ctadoc.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECVEN
				Analisis_Pago.FECVEN.ViewValue = Convert.ToString(Analisis_Pago.FECVEN.CurrentValue)
				Analisis_Pago.FECVEN.ViewValue = ew_FormatDateTime(Analisis_Pago.FECVEN.ViewValue, 7)
				Analisis_Pago.FECVEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				Analisis_Pago.ANO.ViewValue = Convert.ToString(Analisis_Pago.ANO.CurrentValue)
				Analisis_Pago.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Monto CtaDep
				Analisis_Pago.Monto_CtaDep.ViewValue = Convert.ToString(Analisis_Pago.Monto_CtaDep.CurrentValue)
				Analisis_Pago.Monto_CtaDep.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Monto CtaPag
				Analisis_Pago.Monto_CtaPag.ViewValue = Convert.ToString(Analisis_Pago.Monto_CtaPag.CurrentValue)
				Analisis_Pago.Monto_CtaPag.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Saldo Ctapag
				Analisis_Pago.Saldo_Ctapag.ViewValue = Convert.ToString(Analisis_Pago.Saldo_Ctapag.CurrentValue)
				Analisis_Pago.Saldo_Ctapag.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECCANCEL
				Analisis_Pago.FECCANCEL.ViewValue = Convert.ToString(Analisis_Pago.FECCANCEL.CurrentValue)
				Analisis_Pago.FECCANCEL.ViewValue = ew_FormatDateTime(Analisis_Pago.FECCANCEL.ViewValue, 7)
				Analisis_Pago.FECCANCEL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' FACULTAD
			Analisis_Pago.FACULTAD.HrefValue = ""

			' CARRERA
			Analisis_Pago.CARRERA.HrefValue = ""

			' RUT
			Analisis_Pago.RUT.HrefValue = ""

			' DIG
			Analisis_Pago.DIG.HrefValue = ""

			' PATERNO
			Analisis_Pago.PATERNO.HrefValue = ""

			' MATERNO
			Analisis_Pago.MATERNO.HrefValue = ""

			' NOMBRES
			Analisis_Pago.NOMBRES.HrefValue = ""

			' DOCUMENTO
			Analisis_Pago.DOCUMENTO.HrefValue = ""

			' PAGO
			Analisis_Pago.PAGO.HrefValue = ""

			' CTADOC
			Analisis_Pago.CTADOC.HrefValue = ""

			' CTADOCNUM
			Analisis_Pago.CTADOCNUM.HrefValue = ""

			' CTAPAGNUM
			Analisis_Pago.CTAPAGNUM.HrefValue = ""

			' CTAPAG
			Analisis_Pago.CTAPAG.HrefValue = ""

			' Monto Ctadoc
			Analisis_Pago.Monto_Ctadoc.HrefValue = ""

			' Saldo Ctadoc
			Analisis_Pago.Saldo_Ctadoc.HrefValue = ""

			' FECVEN
			Analisis_Pago.FECVEN.HrefValue = ""

			' ANO
			Analisis_Pago.ANO.HrefValue = ""

			' Monto CtaDep
			Analisis_Pago.Monto_CtaDep.HrefValue = ""

			' Monto CtaPag
			Analisis_Pago.Monto_CtaPag.HrefValue = ""

			' Saldo Ctapag
			Analisis_Pago.Saldo_Ctapag.HrefValue = ""

			' FECCANCEL
			Analisis_Pago.FECCANCEL.HrefValue = ""

			' Call Row_Rendered event
			Analisis_Pago.Row_Rendered()
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

			' Field FACULTAD
			sSelect = "SELECT DISTINCT [FACULTAD] FROM " + Analisis_Pago.SqlFrom
			sOrderBy = "[FACULTAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_Pago.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_Pago.FACULTAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CARRERA
			sSelect = "SELECT DISTINCT [CARRERA] FROM " + Analisis_Pago.SqlFrom
			sOrderBy = "[CARRERA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_Pago.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_Pago.CARRERA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field DOCUMENTO
			sSelect = "SELECT DISTINCT [DOCUMENTO] FROM " + Analisis_Pago.SqlFrom
			sOrderBy = "[DOCUMENTO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_Pago.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_Pago.DOCUMENTO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PAGO
			sSelect = "SELECT DISTINCT [PAGO] FROM " + Analisis_Pago.SqlFrom
			sOrderBy = "[PAGO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_Pago.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_Pago.PAGO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field FACULTAD
				SetSessionDropDownValue(Analisis_Pago.FACULTAD.DropDownValue, Analisis_Pago.FACULTAD)

				' Field CARRERA
				SetSessionDropDownValue(Analisis_Pago.CARRERA.DropDownValue, Analisis_Pago.CARRERA)

				' Field RUT
				SetSessionFilterValues(Analisis_Pago.RUT)

				' Field DOCUMENTO
				SetSessionDropDownValue(Analisis_Pago.DOCUMENTO.DropDownValue, Analisis_Pago.DOCUMENTO)

				' Field PAGO
				SetSessionDropDownValue(Analisis_Pago.PAGO.DropDownValue, Analisis_Pago.PAGO)

				' Field ANO
				SetSessionFilterValues(Analisis_Pago.ANO)
			bSetupFilter = True ' Set up filter required
		Else

				' Field FACULTAD
				If (GetDropDownValue(Analisis_Pago.FACULTAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_Pago.FACULTAD.DropDownValue) Then
					If Not ew_SameStr(Analisis_Pago.FACULTAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_Pago_FACULTAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CARRERA
				If (GetDropDownValue(Analisis_Pago.CARRERA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_Pago.CARRERA.DropDownValue) Then
					If Not ew_SameStr(Analisis_Pago.CARRERA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_Pago_CARRERA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field RUT
				If (GetFilterValues(Analisis_Pago.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field DOCUMENTO
				If (GetDropDownValue(Analisis_Pago.DOCUMENTO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_Pago.DOCUMENTO.DropDownValue) Then
					If Not ew_SameStr(Analisis_Pago.DOCUMENTO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_Pago_DOCUMENTO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PAGO
				If (GetDropDownValue(Analisis_Pago.PAGO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_Pago.PAGO.DropDownValue) Then
					If Not ew_SameStr(Analisis_Pago.PAGO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_Pago_PAGO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO
				If (GetFilterValues(Analisis_Pago.ANO)) Then
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

			' Field FACULTAD
			GetSessionDropDownValue(Analisis_Pago.FACULTAD)

			' Field CARRERA
			GetSessionDropDownValue(Analisis_Pago.CARRERA)

			' Field RUT
			GetSessionFilterValues(Analisis_Pago.RUT)

			' Field DOCUMENTO
			GetSessionDropDownValue(Analisis_Pago.DOCUMENTO)

			' Field PAGO
			GetSessionDropDownValue(Analisis_Pago.PAGO)

			' Field ANO
			GetSessionFilterValues(Analisis_Pago.ANO)
		End If

		' Call page filter validated event
		Analisis_Pago.Page_FilterValidated()

		' Build SQL
		' Field FACULTAD

		BuildDropDownFilter(Analisis_Pago.FACULTAD, sFilter, "")

		' Field CARRERA
		BuildDropDownFilter(Analisis_Pago.CARRERA, sFilter, "")

		' Field RUT
		BuildExtendedFilter(Analisis_Pago.RUT, sFilter)

		' Field DOCUMENTO
		BuildDropDownFilter(Analisis_Pago.DOCUMENTO, sFilter, "")

		' Field PAGO
		BuildDropDownFilter(Analisis_Pago.PAGO, sFilter, "")

		' Field ANO
		BuildExtendedFilter(Analisis_Pago.ANO, sFilter)

		' Save parms to Session
		' Field FACULTAD

		SetSessionDropDownValue(Analisis_Pago.FACULTAD.DropDownValue, Analisis_Pago.FACULTAD)

		' Field CARRERA
		SetSessionDropDownValue(Analisis_Pago.CARRERA.DropDownValue, Analisis_Pago.CARRERA)

		' Field RUT
		SetSessionFilterValues(Analisis_Pago.RUT)

		' Field DOCUMENTO
		SetSessionDropDownValue(Analisis_Pago.DOCUMENTO.DropDownValue, Analisis_Pago.DOCUMENTO)

		' Field PAGO
		SetSessionDropDownValue(Analisis_Pago.PAGO.DropDownValue, Analisis_Pago.PAGO)

		' Field ANO
		SetSessionFilterValues(Analisis_Pago.ANO)

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
		If ew_Session("sv_Analisis_Pago_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Analisis_Pago_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Analisis_Pago_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Analisis_Pago_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Analisis_Pago_" + parm)
		End If
		If ew_Session("so1_Analisis_Pago_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Analisis_Pago_" + parm))
		End If
		If ew_Session("sc_Analisis_Pago_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Analisis_Pago_" + parm))
		End If
		If ew_Session("sv2_Analisis_Pago_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Analisis_Pago_" + parm)
		End If
		If ew_Session("so2_Analisis_Pago_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Analisis_Pago_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Analisis_Pago_" + parm) = fld.SearchValue
		ew_Session("so1_Analisis_Pago_" + parm) = fld.SearchOperator
		ew_Session("sc_Analisis_Pago_" + parm) = fld.SearchCondition
		ew_Session("sv2_Analisis_Pago_" + parm) = fld.SearchValue2
		ew_Session("so2_Analisis_Pago_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Analisis_Pago_" + parm) = ""
		ew_Session("so1_Analisis_Pago_" + parm) = "="
		ew_Session("sc_Analisis_Pago_" + parm) = "AND"
		ew_Session("sv2_Analisis_Pago_" + parm) = ""
		ew_Session("so2_Analisis_Pago_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(Analisis_Pago.ANO.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Analisis_Pago.ANO.FldErrMsg()
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
		ew_Session("sel_Analisis_Pago_" & parm) = ""
		ew_Session("rf_Analisis_Pago_" & parm) = ""
		ew_Session("rt_Analisis_Pago_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Analisis_Pago.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Analisis_Pago_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Analisis_Pago_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Analisis_Pago_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field FACULTAD

			Analisis_Pago.FACULTAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_Pago.FACULTAD.DropDownValue = Analisis_Pago.FACULTAD.DefaultDropDownValue

			' Field CARRERA
			Analisis_Pago.CARRERA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_Pago.CARRERA.DropDownValue = Analisis_Pago.CARRERA.DefaultDropDownValue

			' Field DOCUMENTO
			Analisis_Pago.DOCUMENTO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_Pago.DOCUMENTO.DropDownValue = Analisis_Pago.DOCUMENTO.DefaultDropDownValue

			' Field PAGO
			Analisis_Pago.PAGO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_Pago.PAGO.DropDownValue = Analisis_Pago.PAGO.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(Analisis_Pago.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Analisis_Pago.RUT)	

			' Field ANO
			SetDefaultExtFilter(Analisis_Pago.ANO, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Analisis_Pago.ANO)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check FACULTAD dropdown filter
		If (NonTextFilterApplied(Analisis_Pago.FACULTAD)) Then bFilterExist = True

		' Check CARRERA dropdown filter
		If (NonTextFilterApplied(Analisis_Pago.CARRERA)) Then bFilterExist = True

		' Check RUT extended filter
		If (TextFilterApplied(Analisis_Pago.RUT)) Then bFilterExist = True

		' Check DOCUMENTO dropdown filter
		If (NonTextFilterApplied(Analisis_Pago.DOCUMENTO)) Then bFilterExist = True

		' Check PAGO dropdown filter
		If (NonTextFilterApplied(Analisis_Pago.PAGO)) Then bFilterExist = True

		' Check ANO extended filter
		If (TextFilterApplied(Analisis_Pago.ANO)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field FACULTAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_Pago.FACULTAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_Pago.FACULTAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CARRERA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_Pago.CARRERA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_Pago.CARRERA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Analisis_Pago.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_Pago.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field DOCUMENTO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_Pago.DOCUMENTO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_Pago.DOCUMENTO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PAGO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_Pago.PAGO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_Pago.PAGO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Analisis_Pago.ANO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_Pago.ANO.FldCaption() & "<br>"
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
				Analisis_Pago.OrderBy = ""
				Analisis_Pago.StartGroup = 1
				Analisis_Pago.FACULTAD.Sort = ""
				Analisis_Pago.CARRERA.Sort = ""
				Analisis_Pago.RUT.Sort = ""
				Analisis_Pago.DIG.Sort = ""
				Analisis_Pago.PATERNO.Sort = ""
				Analisis_Pago.MATERNO.Sort = ""
				Analisis_Pago.NOMBRES.Sort = ""
				Analisis_Pago.DOCUMENTO.Sort = ""
				Analisis_Pago.PAGO.Sort = ""
				Analisis_Pago.CTADOC.Sort = ""
				Analisis_Pago.CTADOCNUM.Sort = ""
				Analisis_Pago.CTAPAGNUM.Sort = ""
				Analisis_Pago.CTAPAG.Sort = ""
				Analisis_Pago.Monto_Ctadoc.Sort = ""
				Analisis_Pago.Saldo_Ctadoc.Sort = ""
				Analisis_Pago.FECVEN.Sort = ""
				Analisis_Pago.ANO.Sort = ""
				Analisis_Pago.Monto_CtaDep.Sort = ""
				Analisis_Pago.Monto_CtaPag.Sort = ""
				Analisis_Pago.Saldo_Ctapag.Sort = ""
				Analisis_Pago.FECCANCEL.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Analisis_Pago.CurrentOrder = ew_Get("order")
			Analisis_Pago.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Analisis_Pago.SortSql()
			Analisis_Pago.OrderBy = sSortSql
			Analisis_Pago.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Analisis_Pago.OrderBy)) Then
			Analisis_Pago.OrderBy = "[FACULTAD] ASC, [CARRERA] ASC"
			Analisis_Pago.FACULTAD.Sort = "ASC"
			Analisis_Pago.CARRERA.Sort = "ASC"
		End If
		Return Analisis_Pago.OrderBy
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
		Analisis_Pago_summary = New crAnalisis_Pago_summary(Me)
		Analisis_Pago_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Analisis_Pago_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Analisis_Pago_summary IsNot Nothing) Then Analisis_Pago_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Analisis_Pago.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Analisis_Pago_summary = new ewrpt_Page("Analisis_Pago_summary");
// page properties
Analisis_Pago_summary.PageID = "summary"; // page ID
Analisis_Pago_summary.FormID = "fAnalisis_Pagosummaryfilter"; // form ID
var EWRPT_PAGE_ID = Analisis_Pago_summary.PageID;
// extend page with ValidateForm function
Analisis_Pago_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_ANO;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Analisis_Pago.ANO.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Analisis_Pago_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Analisis_Pago_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Analisis_Pago_summary.ValidateRequired = false; // no JavaScript validation
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
<% Analisis_Pago_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Analisis_Pago.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Analisis_Pago.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="ewTitle"><h1><%= Analisis_Pago.TableCaption() %></h1>
<% If (Analisis_Pago.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Analisis_Pago_summary.ExportExcelUrl %>"><img src="images/excel.png" /></a>
<% If (Analisis_Pago_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="Analisis_Pagosmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% Analisis_Pago_summary.ShowMessage() %>
<% If (Analisis_Pago.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Analisis_Pago.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (Analisis_Pago.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (Analisis_Pago.FilterPanelOption = 2 OrElse (Analisis_Pago.FilterPanelOption = 3 AndAlso Analisis_Pago_summary.FilterApplied) OrElse Analisis_Pago_summary.Filter = "0=101") Then
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
<form name="fAnalisis_Pagosummaryfilter" id="fAnalisis_Pagosummaryfilter" action="Analisis_Pagosmry.aspx" class="ewForm" onsubmit="return Analisis_Pago_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Analisis_Pago.ANO.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_Pago.FACULTAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FACULTAD" id="sv_FACULTAD"<%= IIf(Analisis_Pago_summary.ClearExtFilter = "Analisis_Pago_FACULTAD", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.FACULTAD.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Analisis_Pago.FACULTAD.CustomFilters.Count + Analisis_Pago.FACULTAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_Pago.FACULTAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "FACULTAD")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.FACULTAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_Pago.FACULTAD.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.FACULTAD.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_Pago.CARRERA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CARRERA" id="sv_CARRERA"<%= IIf(Analisis_Pago_summary.ClearExtFilter = "Analisis_Pago_CARRERA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.CARRERA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Analisis_Pago.CARRERA.CustomFilters.Count + Analisis_Pago.CARRERA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_Pago.CARRERA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CARRERA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.CARRERA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_Pago.CARRERA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.CARRERA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_Pago.RUT.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_RUT" id="so1_RUT" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="30" value="<%= ew_HtmlEncode(Analisis_Pago.RUT.SearchValue) %>"<%= IIf(Analisis_Pago_summary.ClearExtFilter = "Analisis_Pago_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_Pago.DOCUMENTO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_DOCUMENTO" id="sv_DOCUMENTO"<%= IIf(Analisis_Pago_summary.ClearExtFilter = "Analisis_Pago_DOCUMENTO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.DOCUMENTO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Analisis_Pago.DOCUMENTO.CustomFilters.Count + Analisis_Pago.DOCUMENTO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_Pago.DOCUMENTO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "DOCUMENTO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.DOCUMENTO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_Pago.DOCUMENTO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.DOCUMENTO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_Pago.PAGO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PAGO" id="sv_PAGO"<%= IIf(Analisis_Pago_summary.ClearExtFilter = "Analisis_Pago_PAGO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.PAGO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Analisis_Pago.PAGO.CustomFilters.Count + Analisis_Pago.PAGO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_Pago.PAGO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PAGO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.PAGO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_Pago.PAGO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_Pago.PAGO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_Pago.ANO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_ANO" id="sv1_ANO" size="30" value="<%= ew_HtmlEncode(Analisis_Pago.ANO.SearchValue) %>"<%= IIf(Analisis_Pago_summary.ClearExtFilter = "Analisis_Pago_ANO", " class=""ewInputCleared""", "") %>>
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
<% If (Analisis_Pago.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Analisis_Pago_summary.ShowFilterList() %>
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
If (Analisis_Pago.ExportAll AndAlso ew_NotEmpty(Analisis_Pago.Export)) Then
	Analisis_Pago_summary.StopGrp = Analisis_Pago_summary.TotalGrps
Else
	Analisis_Pago_summary.StopGrp = Analisis_Pago_summary.StartGrp + Analisis_Pago_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Analisis_Pago_summary.StopGrp > Analisis_Pago_summary.TotalGrps) Then
	Analisis_Pago_summary.StopGrp = Analisis_Pago_summary.TotalGrps
End If
Analisis_Pago_summary.RecCount = 0

' Get first row
If (Analisis_Pago_summary.TotalGrps > 0) Then
	Analisis_Pago_summary.GetRow() ' ASPXRPT
	Analisis_Pago_summary.GrpCount = 1
End If
While ((Analisis_Pago_summary.HasRow AndAlso Analisis_Pago_summary.GrpIndex < Analisis_Pago_summary.StopGrp) OrElse Analisis_Pago_summary.ShowFirstHeader)

	' Show header
	If (Analisis_Pago_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.FACULTAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.FACULTAD))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.FACULTAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.FACULTAD) %>',0);"><%= Analisis_Pago.FACULTAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.FACULTAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.FACULTAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.CARRERA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.CARRERA))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.CARRERA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.CARRERA) %>',0);"><%= Analisis_Pago.CARRERA.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.CARRERA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.CARRERA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.RUT) %>',0);"><%= Analisis_Pago.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.DIG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.DIG))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.DIG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.DIG) %>',0);"><%= Analisis_Pago.DIG.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.DIG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.DIG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.PATERNO) %>',0);"><%= Analisis_Pago.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.MATERNO) %>',0);"><%= Analisis_Pago.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.NOMBRES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.NOMBRES))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.NOMBRES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.NOMBRES) %>',0);"><%= Analisis_Pago.NOMBRES.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.NOMBRES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.NOMBRES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.DOCUMENTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.DOCUMENTO))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.DOCUMENTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.DOCUMENTO) %>',0);"><%= Analisis_Pago.DOCUMENTO.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.DOCUMENTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.DOCUMENTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.PAGO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.PAGO))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.PAGO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.PAGO) %>',0);"><%= Analisis_Pago.PAGO.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.PAGO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.PAGO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.CTADOC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.CTADOC))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.CTADOC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.CTADOC) %>',0);"><%= Analisis_Pago.CTADOC.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.CTADOC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.CTADOC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.CTADOCNUM.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.CTADOCNUM))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.CTADOCNUM.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.CTADOCNUM) %>',0);"><%= Analisis_Pago.CTADOCNUM.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.CTADOCNUM.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.CTADOCNUM.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.CTAPAGNUM.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.CTAPAGNUM))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.CTAPAGNUM.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.CTAPAGNUM) %>',0);"><%= Analisis_Pago.CTAPAGNUM.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.CTAPAGNUM.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.CTAPAGNUM.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.CTAPAG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.CTAPAG))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.CTAPAG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.CTAPAG) %>',0);"><%= Analisis_Pago.CTAPAG.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.CTAPAG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.CTAPAG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.Monto_Ctadoc.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.Monto_Ctadoc))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.Monto_Ctadoc.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.Monto_Ctadoc) %>',0);"><%= Analisis_Pago.Monto_Ctadoc.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.Monto_Ctadoc.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.Monto_Ctadoc.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.Saldo_Ctadoc.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.Saldo_Ctadoc))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.Saldo_Ctadoc.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.Saldo_Ctadoc) %>',0);"><%= Analisis_Pago.Saldo_Ctadoc.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.Saldo_Ctadoc.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.Saldo_Ctadoc.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.FECVEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.FECVEN))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.FECVEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.FECVEN) %>',0);"><%= Analisis_Pago.FECVEN.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.FECVEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.FECVEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.ANO) %>',0);"><%= Analisis_Pago.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.Monto_CtaDep.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.Monto_CtaDep))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.Monto_CtaDep.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.Monto_CtaDep) %>',0);"><%= Analisis_Pago.Monto_CtaDep.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.Monto_CtaDep.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.Monto_CtaDep.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.Monto_CtaPag.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.Monto_CtaPag))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.Monto_CtaPag.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.Monto_CtaPag) %>',0);"><%= Analisis_Pago.Monto_CtaPag.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.Monto_CtaPag.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.Monto_CtaPag.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.Saldo_Ctapag.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.Saldo_Ctapag))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.Saldo_Ctapag.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.Saldo_Ctapag) %>',0);"><%= Analisis_Pago.Saldo_Ctapag.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.Saldo_Ctapag.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.Saldo_Ctapag.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_Pago.Export)) Then %>
<%= Analisis_Pago.FECCANCEL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_Pago.SortUrl(Analisis_Pago.FECCANCEL))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_Pago.FECCANCEL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_Pago.SortUrl(Analisis_Pago.FECCANCEL) %>',0);"><%= Analisis_Pago.FECCANCEL.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_Pago.FECCANCEL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_Pago.FECCANCEL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Analisis_Pago_summary.ShowFirstHeader = False
	End If
	Analisis_Pago_summary.RecCount += 1

		' Render detail row
		Analisis_Pago.ResetCSS()
		Analisis_Pago.RowType = EWRPT_ROWTYPE_DETAIL
		Analisis_Pago_summary.RenderRow()
%>
	<tr<%= Analisis_Pago.RowAttributes() %>>
		<td<%= Analisis_Pago.FACULTAD.CellAttributes %>>
<div<%= Analisis_Pago.FACULTAD.ViewAttributes%>><%= Analisis_Pago.FACULTAD.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.CARRERA.CellAttributes %>>
<div<%= Analisis_Pago.CARRERA.ViewAttributes%>><%= Analisis_Pago.CARRERA.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.RUT.CellAttributes %>>
<div<%= Analisis_Pago.RUT.ViewAttributes%>><%= Analisis_Pago.RUT.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.DIG.CellAttributes %>>
<div<%= Analisis_Pago.DIG.ViewAttributes%>><%= Analisis_Pago.DIG.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.PATERNO.CellAttributes %>>
<div<%= Analisis_Pago.PATERNO.ViewAttributes%>><%= Analisis_Pago.PATERNO.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.MATERNO.CellAttributes %>>
<div<%= Analisis_Pago.MATERNO.ViewAttributes%>><%= Analisis_Pago.MATERNO.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.NOMBRES.CellAttributes %>>
<div<%= Analisis_Pago.NOMBRES.ViewAttributes%>><%= Analisis_Pago.NOMBRES.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.DOCUMENTO.CellAttributes %>>
<div<%= Analisis_Pago.DOCUMENTO.ViewAttributes%>><%= Analisis_Pago.DOCUMENTO.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.PAGO.CellAttributes %>>
<div<%= Analisis_Pago.PAGO.ViewAttributes%>><%= Analisis_Pago.PAGO.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.CTADOC.CellAttributes %>>
<div<%= Analisis_Pago.CTADOC.ViewAttributes%>><%= Analisis_Pago.CTADOC.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.CTADOCNUM.CellAttributes %>>
<div<%= Analisis_Pago.CTADOCNUM.ViewAttributes%>><%= Analisis_Pago.CTADOCNUM.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.CTAPAGNUM.CellAttributes %>>
<div<%= Analisis_Pago.CTAPAGNUM.ViewAttributes%>><%= Analisis_Pago.CTAPAGNUM.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.CTAPAG.CellAttributes %>>
<div<%= Analisis_Pago.CTAPAG.ViewAttributes%>><%= Analisis_Pago.CTAPAG.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.Monto_Ctadoc.CellAttributes %>>
<div<%= Analisis_Pago.Monto_Ctadoc.ViewAttributes%>><%= Analisis_Pago.Monto_Ctadoc.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.Saldo_Ctadoc.CellAttributes %>>
<div<%= Analisis_Pago.Saldo_Ctadoc.ViewAttributes%>><%= Analisis_Pago.Saldo_Ctadoc.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.FECVEN.CellAttributes %>>
<div<%= Analisis_Pago.FECVEN.ViewAttributes%>><%= Analisis_Pago.FECVEN.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.ANO.CellAttributes %>>
<div<%= Analisis_Pago.ANO.ViewAttributes%>><%= Analisis_Pago.ANO.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.Monto_CtaDep.CellAttributes %>>
<div<%= Analisis_Pago.Monto_CtaDep.ViewAttributes%>><%= Analisis_Pago.Monto_CtaDep.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.Monto_CtaPag.CellAttributes %>>
<div<%= Analisis_Pago.Monto_CtaPag.ViewAttributes%>><%= Analisis_Pago.Monto_CtaPag.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.Saldo_Ctapag.CellAttributes %>>
<div<%= Analisis_Pago.Saldo_Ctapag.ViewAttributes%>><%= Analisis_Pago.Saldo_Ctapag.ListViewValue%></div>
</td>
		<td<%= Analisis_Pago.FECCANCEL.CellAttributes %>>
<div<%= Analisis_Pago.FECCANCEL.ViewAttributes%>><%= Analisis_Pago.FECCANCEL.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Analisis_Pago_summary.AccumulateSummary()

		' Get next record
		Analisis_Pago_summary.GetRow() ' ASPXRPT
		Analisis_Pago_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Analisis_Pago_summary.TotalGrps > 0) Then
	Analisis_Pago.ResetCSS()
	Analisis_Pago.RowType = EWRPT_ROWTYPE_TOTAL
	Analisis_Pago.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Analisis_Pago.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Analisis_Pago.RowAttrs("class") = "ewRptGrandSummary"
	Analisis_Pago_summary.RenderRow()
%>
	<!-- tr><td colspan="21"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Analisis_Pago.RowAttributes() %>><td colspan="21"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Analisis_Pago_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Analisis_Pago.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Analisis_Pago_summary.Pager Is Nothing Then Analisis_Pago_summary.Pager = New cPrevNextPager(Analisis_Pago_summary.StartGrp, Analisis_Pago_summary.DisplayGrps, Analisis_Pago_summary.TotalGrps) %>
<% If Analisis_Pago_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Analisis_Pago_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Analisis_Pagosmry.aspx?start=<%= Analisis_Pago_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Analisis_Pago_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Analisis_Pagosmry.aspx?start=<%= Analisis_Pago_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Analisis_Pago_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Analisis_Pago_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Analisis_Pagosmry.aspx?start=<%= Analisis_Pago_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Analisis_Pago_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Analisis_Pagosmry.aspx?start=<%= Analisis_Pago_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Analisis_Pago_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Analisis_Pago_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Analisis_Pago_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Analisis_Pago_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Analisis_Pago_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Analisis_Pago_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If Analisis_Pago_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="15"<% If Analisis_Pago_summary.DisplayGrps = 15 Then Response.Write(" selected=""selected""") %>>15</option>
<option value="20"<% If Analisis_Pago_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Analisis_Pago_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
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
<% If (Analisis_Pago.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Analisis_Pago.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Analisis_Pago.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Analisis_Pago_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Analisis_Pago.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
