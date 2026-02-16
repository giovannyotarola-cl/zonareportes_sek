<%@ Page ClassName="Detalle_Formas_de_Pagosmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_detalleFormasPago" %>
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
	Public Detalle_Formas_de_Pago As crDetalle_Formas_de_Pago = Nothing

	'
	' Table class (for Detalle Formas de Pago)
	'
	Public Class crDetalle_Formas_de_Pago
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
				Return "Detalle_Formas_de_Pago"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Detalle Formas de Pago"
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

		Public CODCARR As crField

		Public CODCARPR As crField

		Public PRODUCTO As crField

		Public documento As crField

		Public ANO As crField

		Public PERIODO As crField
		
		Public ANO_COHORTE As crField

		Public PERIODO_COHORTE As crField

		Public CODCLI As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRE As crField

		Public ESTACAD As crField

		Public TOTAL As crField

		Public MONTO As crField

		Public FECREG As crField

		Public CTAPAG As crField

		Public CTAPAGNUM As crField

		Public FECVEN As crField

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
			FACULTAD = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_FACULTAD", "FACULTAD", "[FACULTAD]", 200, EWRPT_DATATYPE_STRING, -1)
			FACULTAD.Page = APage
			FACULTAD.ParentPage = APage.ParentPage
			Fields.Add("FACULTAD", FACULTAD)
			FACULTAD.DateFilter = ""
			FACULTAD.SqlSelect = ""
			FACULTAD.SqlOrderBy = ""

			' CARRERA
			CARRERA = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_CARRERA", "CARRERA", "[CARRERA]", 200, EWRPT_DATATYPE_STRING, -1)
			CARRERA.Page = APage
			CARRERA.ParentPage = APage.ParentPage
			Fields.Add("CARRERA", CARRERA)
			CARRERA.DateFilter = ""
			CARRERA.SqlSelect = ""
			CARRERA.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' CODCARPR
			CODCARPR = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_CODCARPR", "CODCARPR", "[CODCARPR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARPR.Page = APage
			CODCARPR.ParentPage = APage.ParentPage
			Fields.Add("CODCARPR", CODCARPR)
			CODCARPR.DateFilter = ""
			CODCARPR.SqlSelect = ""
			CODCARPR.SqlOrderBy = ""

			' PRODUCTO
			PRODUCTO = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_PRODUCTO", "PRODUCTO", "[PRODUCTO]", 200, EWRPT_DATATYPE_STRING, -1)
			PRODUCTO.Page = APage
			PRODUCTO.ParentPage = APage.ParentPage
			Fields.Add("PRODUCTO", PRODUCTO)
			PRODUCTO.DateFilter = ""
			PRODUCTO.SqlSelect = ""
			PRODUCTO.SqlOrderBy = ""

			' documento
			documento = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_documento", "documento", "[documento]", 200, EWRPT_DATATYPE_STRING, -1)
			documento.Page = APage
			documento.ParentPage = APage.ParentPage
			Fields.Add("documento", documento)
			documento.DateFilter = ""
			documento.SqlSelect = ""
			documento.SqlOrderBy = ""

			' ANO
			ANO = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_PERIODO", "PERIODO", "[PERIODO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			PERIODO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' CODCLI
			CODCLI = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCLI.Page = APage
			CODCLI.ParentPage = APage.ParentPage
			Fields.Add("CODCLI", CODCLI)
			CODCLI.DateFilter = ""
			CODCLI.SqlSelect = ""
			CODCLI.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' ESTACAD
			ESTACAD = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTACAD.Page = APage
			ESTACAD.ParentPage = APage.ParentPage
			Fields.Add("ESTACAD", ESTACAD)
			ESTACAD.DateFilter = ""
			ESTACAD.SqlSelect = ""
			ESTACAD.SqlOrderBy = ""

			' TOTAL
			TOTAL = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_TOTAL", "TOTAL", "[TOTAL]", 131, EWRPT_DATATYPE_NUMBER, -1)
			TOTAL.Page = APage
			TOTAL.ParentPage = APage.ParentPage
			TOTAL.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("TOTAL", TOTAL)
			TOTAL.DateFilter = ""
			TOTAL.SqlSelect = ""
			TOTAL.SqlOrderBy = ""

			' MONTO
			MONTO = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_MONTO", "MONTO", "[MONTO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			MONTO.Page = APage
			MONTO.ParentPage = APage.ParentPage
			MONTO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("MONTO", MONTO)
			MONTO.DateFilter = ""
			MONTO.SqlSelect = ""
			MONTO.SqlOrderBy = ""

			' FECREG
			FECREG = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_FECREG", "FECREG", "[FECREG]", 135, EWRPT_DATATYPE_DATE, 7)
			FECREG.Page = APage
			FECREG.ParentPage = APage.ParentPage
			FECREG.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECREG", FECREG)
			FECREG.DateFilter = ""
			FECREG.SqlSelect = ""
			FECREG.SqlOrderBy = ""

			' CTAPAG
			CTAPAG = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_CTAPAG", "CTAPAG", "[CTAPAG]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CTAPAG.Page = APage
			CTAPAG.ParentPage = APage.ParentPage
			CTAPAG.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CTAPAG", CTAPAG)
			CTAPAG.DateFilter = ""
			CTAPAG.SqlSelect = ""
			CTAPAG.SqlOrderBy = ""

			' CTAPAGNUM
			CTAPAGNUM = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_CTAPAGNUM", "CTAPAGNUM", "[CTAPAGNUM]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CTAPAGNUM.Page = APage
			CTAPAGNUM.ParentPage = APage.ParentPage
			CTAPAGNUM.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CTAPAGNUM", CTAPAGNUM)
			CTAPAGNUM.DateFilter = ""
			CTAPAGNUM.SqlSelect = ""
			CTAPAGNUM.SqlOrderBy = ""

			' FECVEN
			FECVEN = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_FECVEN", "FECVEN", "[FECVEN]", 135, EWRPT_DATATYPE_DATE, 7)
			FECVEN.Page = APage
			FECVEN.ParentPage = APage.ParentPage
			FECVEN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECVEN", FECVEN)
			FECVEN.DateFilter = ""
			FECVEN.SqlSelect = ""
			FECVEN.SqlOrderBy = ""
			
			
			' ANO_COHORTE
			ANO = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_ANO_COHORTE", "ANO_COHORTE", "[ANO_COHORTE]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO_COHORTE", ANO_COHORTE)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO_COHORTE
			PERIODO = new crField("Detalle_Formas_de_Pago", "Detalle Formas de Pago", "x_PERIODO_COHORTE", "PERIODO_COHORTE", "[PERIODO_COHORTE]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			PERIODO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO_COHORTE", PERIODO_COHORTE)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""
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
				Return "[Vista_DetalleFormasPago]"
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
	Public Detalle_Formas_de_Pago_summary As crDetalle_Formas_de_Pago_summary

	'
	' Page class
	'
	Public Class crDetalle_Formas_de_Pago_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Detalle_Formas_de_Pago.UseTokenInUrl) Then
				sUrl &= "t=" & Detalle_Formas_de_Pago.TableVar & "&" ' Add page token
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
			If (Detalle_Formas_de_Pago.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Detalle_Formas_de_Pago.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Detalle_Formas_de_Pago.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Detalle_Formas_de_Pagosmry 
			Get
				Return CType(m_ParentPage, Detalle_Formas_de_Pagosmry)
			End Get
		End Property

		' Table object (Detalle_Formas_de_Pago)
		Public Property Detalle_Formas_de_Pago As crDetalle_Formas_de_Pago 
			Get		
				Return AspNetPage.Detalle_Formas_de_Pago ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crDetalle_Formas_de_Pago)
				AspNetPage.Detalle_Formas_de_Pago = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_detalleFormasPago)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Detalle_Formas_de_Pago_summary"
			m_PageObjTypeName = "crDetalle_Formas_de_Pago_summary"

			' Table name
			m_TableName = "Detalle Formas de Pago"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Detalle_Formas_de_Pago)
			Detalle_Formas_de_Pago = New crDetalle_Formas_de_Pago(Me)			

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
				Detalle_Formas_de_Pago.Export = ew_Get("export")
			End If
			gsExport = Detalle_Formas_de_Pago.Export ' Get export parameter, used in header
			gsExportFile = Detalle_Formas_de_Pago.TableVar ' Get export file, used in header
			If (Detalle_Formas_de_Pago.Export = "excel") Then
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

		Public DisplayGrps As Integer = 22	' Groups per page

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

		Public GrandSmry As Object() = New Object(19) {}

		Public GrandMn As Object() = New Object(19) {}

		Public GrandMx As Object() = New Object(19) {}

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
			Detalle_Formas_de_Pago.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Detalle_Formas_de_Pago.SqlSelect, Detalle_Formas_de_Pago.SqlWhere, Detalle_Formas_de_Pago.SqlGroupBy, Detalle_Formas_de_Pago.SqlHaving, Detalle_Formas_de_Pago.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Detalle_Formas_de_Pago.ExportAll AndAlso ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then
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
				Detalle_Formas_de_Pago.FACULTAD.DbValue = Row("FACULTAD")
				Detalle_Formas_de_Pago.CARRERA.DbValue = Row("CARRERA")
				Detalle_Formas_de_Pago.PRODUCTO.DbValue = Row("PRODUCTO")
				Detalle_Formas_de_Pago.ANO.DbValue = Row("ANO")
				Detalle_Formas_de_Pago.PERIODO.DbValue = Row("PERIODO")
				Detalle_Formas_de_Pago.CODCLI.DbValue = Row("CODCLI")
				Detalle_Formas_de_Pago.PATERNO.DbValue = Row("PATERNO")
				Detalle_Formas_de_Pago.MATERNO.DbValue = Row("MATERNO")
				Detalle_Formas_de_Pago.NOMBRE.DbValue = Row("NOMBRE")
				Detalle_Formas_de_Pago.CODCARR.DbValue = Row("CODCARR")
				Detalle_Formas_de_Pago.TOTAL.DbValue = Row("TOTAL")
				Detalle_Formas_de_Pago.MONTO.DbValue = Row("MONTO")
				Detalle_Formas_de_Pago.FECREG.DbValue = Row("FECREG")
				Detalle_Formas_de_Pago.CTAPAG.DbValue = Row("CTAPAG")
				Detalle_Formas_de_Pago.documento.DbValue = Row("documento")
				Detalle_Formas_de_Pago.CTAPAGNUM.DbValue = Row("CTAPAGNUM")
				Detalle_Formas_de_Pago.FECVEN.DbValue = Row("FECVEN")
				Detalle_Formas_de_Pago.ESTACAD.DbValue = Row("ESTACAD")
				Detalle_Formas_de_Pago.CODCARPR.DbValue = Row("CODCARPR")
				Detalle_Formas_de_Pago.ANO_COHORTE.DbValue = Row("ANO_COHORTE")
				Detalle_Formas_de_Pago.PERIODO_COHORTE.DbValue = Row("PERIODO_COHORTE")
				
				Val(1) = Detalle_Formas_de_Pago.FACULTAD.CurrentValue
				Val(2) = Detalle_Formas_de_Pago.CARRERA.CurrentValue
				Val(3) = Detalle_Formas_de_Pago.CODCARR.CurrentValue
				Val(4) = Detalle_Formas_de_Pago.CODCARPR.CurrentValue
				Val(5) = Detalle_Formas_de_Pago.PRODUCTO.CurrentValue
				Val(6) = Detalle_Formas_de_Pago.documento.CurrentValue
				Val(7) = Detalle_Formas_de_Pago.ANO.CurrentValue
				Val(8) = Detalle_Formas_de_Pago.PERIODO.CurrentValue
				Val(9) = Detalle_Formas_de_Pago.CODCLI.CurrentValue
				Val(10) = Detalle_Formas_de_Pago.PATERNO.CurrentValue
				Val(11) = Detalle_Formas_de_Pago.MATERNO.CurrentValue
				Val(12) = Detalle_Formas_de_Pago.NOMBRE.CurrentValue
				Val(13) = Detalle_Formas_de_Pago.ESTACAD.CurrentValue
				Val(14) = Detalle_Formas_de_Pago.TOTAL.CurrentValue
				Val(15) = Detalle_Formas_de_Pago.MONTO.CurrentValue
				Val(16) = Detalle_Formas_de_Pago.FECREG.CurrentValue
				Val(17) = Detalle_Formas_de_Pago.CTAPAG.CurrentValue
				Val(18) = Detalle_Formas_de_Pago.CTAPAGNUM.CurrentValue
				Val(19) = Detalle_Formas_de_Pago.FECVEN.CurrentValue
				Val(20) = Detalle_Formas_de_Pago.ANO_COHORTE.CurrentValue
				Val(21) = Detalle_Formas_de_Pago.PERIODO_COHORTE.CurrentValue
			Else
				Detalle_Formas_de_Pago.FACULTAD.DbValue = ""
				Detalle_Formas_de_Pago.CARRERA.DbValue = ""
				Detalle_Formas_de_Pago.PRODUCTO.DbValue = ""
				Detalle_Formas_de_Pago.ANO.DbValue = ""
				Detalle_Formas_de_Pago.PERIODO.DbValue = ""
				Detalle_Formas_de_Pago.CODCLI.DbValue = ""
				Detalle_Formas_de_Pago.PATERNO.DbValue = ""
				Detalle_Formas_de_Pago.MATERNO.DbValue = ""
				Detalle_Formas_de_Pago.NOMBRE.DbValue = ""
				Detalle_Formas_de_Pago.CODCARR.DbValue = ""
				Detalle_Formas_de_Pago.TOTAL.DbValue = ""
				Detalle_Formas_de_Pago.MONTO.DbValue = ""
				Detalle_Formas_de_Pago.FECREG.DbValue = ""
				Detalle_Formas_de_Pago.CTAPAG.DbValue = ""
				Detalle_Formas_de_Pago.documento.DbValue = ""
				Detalle_Formas_de_Pago.CTAPAGNUM.DbValue = ""
				Detalle_Formas_de_Pago.FECVEN.DbValue = ""
				Detalle_Formas_de_Pago.ESTACAD.DbValue = ""
				Detalle_Formas_de_Pago.CODCARPR.DbValue = ""
				Detalle_Formas_de_Pago.ANO_COHORTE.DbValue = ""
				Detalle_Formas_de_Pago.PERIODO_COHORTE.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Detalle_Formas_de_Pago.FACULTAD.DbValue = dr("FACULTAD")
				Detalle_Formas_de_Pago.CARRERA.DbValue = dr("CARRERA")
				Detalle_Formas_de_Pago.PRODUCTO.DbValue = dr("PRODUCTO")
				Detalle_Formas_de_Pago.ANO.DbValue = dr("ANO")
				Detalle_Formas_de_Pago.PERIODO.DbValue = dr("PERIODO")
				Detalle_Formas_de_Pago.CODCLI.DbValue = dr("CODCLI")
				Detalle_Formas_de_Pago.PATERNO.DbValue = dr("PATERNO")
				Detalle_Formas_de_Pago.MATERNO.DbValue = dr("MATERNO")
				Detalle_Formas_de_Pago.NOMBRE.DbValue = dr("NOMBRE")
				Detalle_Formas_de_Pago.CODCARR.DbValue = dr("CODCARR")
				Detalle_Formas_de_Pago.TOTAL.DbValue = dr("TOTAL")
				Detalle_Formas_de_Pago.MONTO.DbValue = dr("MONTO")
				Detalle_Formas_de_Pago.FECREG.DbValue = dr("FECREG")
				Detalle_Formas_de_Pago.CTAPAG.DbValue = dr("CTAPAG")
				Detalle_Formas_de_Pago.documento.DbValue = dr("documento")
				Detalle_Formas_de_Pago.CTAPAGNUM.DbValue = dr("CTAPAGNUM")
				Detalle_Formas_de_Pago.FECVEN.DbValue = dr("FECVEN")
				Detalle_Formas_de_Pago.ESTACAD.DbValue = dr("ESTACAD")
				Detalle_Formas_de_Pago.CODCARPR.DbValue = dr("CODCARPR")
				Detalle_Formas_de_Pago.ANO_COHORTE.DbValue = dr("ANO_COHORTE")
				Detalle_Formas_de_Pago.PERIODO_COHORTE.DbValue = dr("PERIODO_COHORTE")
				Val(1) = Detalle_Formas_de_Pago.FACULTAD.CurrentValue
				Val(2) = Detalle_Formas_de_Pago.CARRERA.CurrentValue
				Val(3) = Detalle_Formas_de_Pago.CODCARR.CurrentValue
				Val(4) = Detalle_Formas_de_Pago.CODCARPR.CurrentValue
				Val(5) = Detalle_Formas_de_Pago.PRODUCTO.CurrentValue
				Val(6) = Detalle_Formas_de_Pago.documento.CurrentValue
				Val(7) = Detalle_Formas_de_Pago.ANO.CurrentValue
				Val(8) = Detalle_Formas_de_Pago.PERIODO.CurrentValue
				Val(9) = Detalle_Formas_de_Pago.CODCLI.CurrentValue
				Val(10) = Detalle_Formas_de_Pago.PATERNO.CurrentValue
				Val(11) = Detalle_Formas_de_Pago.MATERNO.CurrentValue
				Val(12) = Detalle_Formas_de_Pago.NOMBRE.CurrentValue
				Val(13) = Detalle_Formas_de_Pago.ESTACAD.CurrentValue
				Val(14) = Detalle_Formas_de_Pago.TOTAL.CurrentValue
				Val(15) = Detalle_Formas_de_Pago.MONTO.CurrentValue
				Val(16) = Detalle_Formas_de_Pago.FECREG.CurrentValue
				Val(17) = Detalle_Formas_de_Pago.CTAPAG.CurrentValue
				Val(18) = Detalle_Formas_de_Pago.CTAPAGNUM.CurrentValue
				Val(19) = Detalle_Formas_de_Pago.FECVEN.CurrentValue
				Val(20) = Detalle_Formas_de_Pago.ANO_COHORTE.CurrentValue
				Val(21) = Detalle_Formas_de_Pago.PERIODO_COHORTE.CurrentValue
			Else				
				Detalle_Formas_de_Pago.FACULTAD.DbValue = ""
				Detalle_Formas_de_Pago.CARRERA.DbValue = ""
				Detalle_Formas_de_Pago.PRODUCTO.DbValue = ""
				Detalle_Formas_de_Pago.ANO.DbValue = ""
				Detalle_Formas_de_Pago.PERIODO.DbValue = ""
				Detalle_Formas_de_Pago.CODCLI.DbValue = ""
				Detalle_Formas_de_Pago.PATERNO.DbValue = ""
				Detalle_Formas_de_Pago.MATERNO.DbValue = ""
				Detalle_Formas_de_Pago.NOMBRE.DbValue = ""
				Detalle_Formas_de_Pago.CODCARR.DbValue = ""
				Detalle_Formas_de_Pago.TOTAL.DbValue = ""
				Detalle_Formas_de_Pago.MONTO.DbValue = ""
				Detalle_Formas_de_Pago.FECREG.DbValue = ""
				Detalle_Formas_de_Pago.CTAPAG.DbValue = ""
				Detalle_Formas_de_Pago.documento.DbValue = ""
				Detalle_Formas_de_Pago.CTAPAGNUM.DbValue = ""
				Detalle_Formas_de_Pago.FECVEN.DbValue = ""
				Detalle_Formas_de_Pago.ESTACAD.DbValue = ""
				Detalle_Formas_de_Pago.CODCARPR.DbValue = ""
				Detalle_Formas_de_Pago.ANO_COHORTE.DbValue = ""
				Detalle_Formas_de_Pago.PERIODO_COHORTE.DbValue = ""
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
				Detalle_Formas_de_Pago.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Detalle_Formas_de_Pago.StartGroup = StartGrp
				Else
					StartGrp = Detalle_Formas_de_Pago.StartGroup
				End If
			Else
				StartGrp = Detalle_Formas_de_Pago.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Detalle_Formas_de_Pago.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Detalle_Formas_de_Pago.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Detalle_Formas_de_Pago.StartGroup = StartGrp
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
			Detalle_Formas_de_Pago.StartGroup = StartGrp
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
				Detalle_Formas_de_Pago.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Detalle_Formas_de_Pago.StartGroup = StartGrp
			Else				
				If (Detalle_Formas_de_Pago.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Detalle_Formas_de_Pago.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Detalle_Formas_de_Pago.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Detalle_Formas_de_Pago.SqlSelectCount, Detalle_Formas_de_Pago.SqlWhere, Detalle_Formas_de_Pago.SqlGroupBy, Detalle_Formas_de_Pago.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Detalle_Formas_de_Pago.Row_Rendering()

			'
			' Render view codes
			'

			If (Detalle_Formas_de_Pago.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' FACULTAD
				Detalle_Formas_de_Pago.FACULTAD.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.FACULTAD.Summary)

				' CARRERA
				Detalle_Formas_de_Pago.CARRERA.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CARRERA.Summary)

				' CODCARR
				Detalle_Formas_de_Pago.CODCARR.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CODCARR.Summary)

				' CODCARPR
				Detalle_Formas_de_Pago.CODCARPR.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CODCARPR.Summary)

				' PRODUCTO
				Detalle_Formas_de_Pago.PRODUCTO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.PRODUCTO.Summary)

				' documento
				Detalle_Formas_de_Pago.documento.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.documento.Summary)

				' ANO
				Detalle_Formas_de_Pago.ANO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.ANO.Summary)

				' PERIODO
				Detalle_Formas_de_Pago.PERIODO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.PERIODO.Summary)

				' CODCLI
				Detalle_Formas_de_Pago.CODCLI.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CODCLI.Summary)

				' PATERNO
				Detalle_Formas_de_Pago.PATERNO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.PATERNO.Summary)

				' MATERNO
				Detalle_Formas_de_Pago.MATERNO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.MATERNO.Summary)

				' NOMBRE
				Detalle_Formas_de_Pago.NOMBRE.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.NOMBRE.Summary)

				' ESTACAD
				Detalle_Formas_de_Pago.ESTACAD.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.ESTACAD.Summary)

				' TOTAL
				Detalle_Formas_de_Pago.TOTAL.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.TOTAL.Summary)

				' MONTO
				Detalle_Formas_de_Pago.MONTO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.MONTO.Summary)

				' FECREG
				Detalle_Formas_de_Pago.FECREG.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.FECREG.Summary)
				Detalle_Formas_de_Pago.FECREG.ViewValue = ew_FormatDateTime(Detalle_Formas_de_Pago.FECREG.ViewValue, 7)

				' CTAPAG
				Detalle_Formas_de_Pago.CTAPAG.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CTAPAG.Summary)

				' CTAPAGNUM
				Detalle_Formas_de_Pago.CTAPAGNUM.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CTAPAGNUM.Summary)

				' FECVEN
				Detalle_Formas_de_Pago.FECVEN.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.FECVEN.Summary)
				Detalle_Formas_de_Pago.FECVEN.ViewValue = ew_FormatDateTime(Detalle_Formas_de_Pago.FECVEN.ViewValue, 7)
				' ANO_COHORTE
				Detalle_Formas_de_Pago.ANO_COHORTE.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.ANO_COHORTE.Summary)

				' PERIODO_COHORTE
				Detalle_Formas_de_Pago.PERIODO_COHORTE.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.PERIODO_COHORTE.Summary)
			Else

				' FACULTAD
				Detalle_Formas_de_Pago.FACULTAD.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.FACULTAD.CurrentValue)
				Detalle_Formas_de_Pago.FACULTAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CARRERA
				Detalle_Formas_de_Pago.CARRERA.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CARRERA.CurrentValue)
				Detalle_Formas_de_Pago.CARRERA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Detalle_Formas_de_Pago.CODCARR.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CODCARR.CurrentValue)
				Detalle_Formas_de_Pago.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARPR
				Detalle_Formas_de_Pago.CODCARPR.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CODCARPR.CurrentValue)
				Detalle_Formas_de_Pago.CODCARPR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PRODUCTO
				Detalle_Formas_de_Pago.PRODUCTO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.PRODUCTO.CurrentValue)
				Detalle_Formas_de_Pago.PRODUCTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' documento
				Detalle_Formas_de_Pago.documento.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.documento.CurrentValue)
				Detalle_Formas_de_Pago.documento.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				Detalle_Formas_de_Pago.ANO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.ANO.CurrentValue)
				Detalle_Formas_de_Pago.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO
				Detalle_Formas_de_Pago.PERIODO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.PERIODO.CurrentValue)
				Detalle_Formas_de_Pago.PERIODO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCLI
				Detalle_Formas_de_Pago.CODCLI.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CODCLI.CurrentValue)
				Detalle_Formas_de_Pago.CODCLI.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Detalle_Formas_de_Pago.PATERNO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.PATERNO.CurrentValue)
				Detalle_Formas_de_Pago.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Detalle_Formas_de_Pago.MATERNO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.MATERNO.CurrentValue)
				Detalle_Formas_de_Pago.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Detalle_Formas_de_Pago.NOMBRE.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.NOMBRE.CurrentValue)
				Detalle_Formas_de_Pago.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTACAD
				Detalle_Formas_de_Pago.ESTACAD.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.ESTACAD.CurrentValue)
				Detalle_Formas_de_Pago.ESTACAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TOTAL
				Detalle_Formas_de_Pago.TOTAL.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.TOTAL.CurrentValue)
				Detalle_Formas_de_Pago.TOTAL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MONTO
				Detalle_Formas_de_Pago.MONTO.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.MONTO.CurrentValue)
				Detalle_Formas_de_Pago.MONTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECREG
				Detalle_Formas_de_Pago.FECREG.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.FECREG.CurrentValue)
				Detalle_Formas_de_Pago.FECREG.ViewValue = ew_FormatDateTime(Detalle_Formas_de_Pago.FECREG.ViewValue, 7)
				Detalle_Formas_de_Pago.FECREG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CTAPAG
				Detalle_Formas_de_Pago.CTAPAG.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CTAPAG.CurrentValue)
				Detalle_Formas_de_Pago.CTAPAG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CTAPAGNUM
				Detalle_Formas_de_Pago.CTAPAGNUM.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.CTAPAGNUM.CurrentValue)
				Detalle_Formas_de_Pago.CTAPAGNUM.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECVEN
				Detalle_Formas_de_Pago.FECVEN.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.FECVEN.CurrentValue)
				Detalle_Formas_de_Pago.FECVEN.ViewValue = ew_FormatDateTime(Detalle_Formas_de_Pago.FECVEN.ViewValue, 7)
				Detalle_Formas_de_Pago.FECVEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
				
				
				' ANO_COHORTE
				Detalle_Formas_de_Pago.ANO_COHORTE.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.ANO_COHORTE.CurrentValue)
				Detalle_Formas_de_Pago.ANO_COHORTE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO_COHORTE
				Detalle_Formas_de_Pago.PERIODO_COHORTE.ViewValue = Convert.ToString(Detalle_Formas_de_Pago.PERIODO_COHORTE.CurrentValue)
				Detalle_Formas_de_Pago.PERIODO_COHORTE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' FACULTAD
			Detalle_Formas_de_Pago.FACULTAD.HrefValue = ""

			' CARRERA
			Detalle_Formas_de_Pago.CARRERA.HrefValue = ""

			' CODCARR
			Detalle_Formas_de_Pago.CODCARR.HrefValue = ""

			' CODCARPR
			Detalle_Formas_de_Pago.CODCARPR.HrefValue = ""

			' PRODUCTO
			Detalle_Formas_de_Pago.PRODUCTO.HrefValue = ""

			' documento
			Detalle_Formas_de_Pago.documento.HrefValue = ""

			' ANO
			Detalle_Formas_de_Pago.ANO.HrefValue = ""

			' PERIODO
			Detalle_Formas_de_Pago.PERIODO.HrefValue = ""

			' CODCLI
			Detalle_Formas_de_Pago.CODCLI.HrefValue = ""

			' PATERNO
			Detalle_Formas_de_Pago.PATERNO.HrefValue = ""

			' MATERNO
			Detalle_Formas_de_Pago.MATERNO.HrefValue = ""

			' NOMBRE
			Detalle_Formas_de_Pago.NOMBRE.HrefValue = ""

			' ESTACAD
			Detalle_Formas_de_Pago.ESTACAD.HrefValue = ""

			' TOTAL
			Detalle_Formas_de_Pago.TOTAL.HrefValue = ""

			' MONTO
			Detalle_Formas_de_Pago.MONTO.HrefValue = ""

			' FECREG
			Detalle_Formas_de_Pago.FECREG.HrefValue = ""

			' CTAPAG
			Detalle_Formas_de_Pago.CTAPAG.HrefValue = ""

			' CTAPAGNUM
			Detalle_Formas_de_Pago.CTAPAGNUM.HrefValue = ""

			' FECVEN
			Detalle_Formas_de_Pago.FECVEN.HrefValue = ""
			
			' ANO_COHORTE
			Detalle_Formas_de_Pago.ANO_COHORTE.HrefValue = ""

			' PERIODO_COHORTE
			Detalle_Formas_de_Pago.PERIODO_COHORTE.HrefValue = ""


			' Call Row_Rendered event
			Detalle_Formas_de_Pago.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [FACULTAD] FROM " + Detalle_Formas_de_Pago.SqlFrom
			sOrderBy = "[FACULTAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_Formas_de_Pago.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_Formas_de_Pago.FACULTAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CARRERA
			sSelect = "SELECT DISTINCT [CARRERA] FROM " + Detalle_Formas_de_Pago.SqlFrom
			sOrderBy = "[CARRERA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_Formas_de_Pago.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_Formas_de_Pago.CARRERA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO
			sSelect = "SELECT DISTINCT [ANO] FROM " + Detalle_Formas_de_Pago.SqlFrom
			sOrderBy = "[ANO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_Formas_de_Pago.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_Formas_de_Pago.ANO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PERIODO
			sSelect = "SELECT DISTINCT [PERIODO] FROM " + Detalle_Formas_de_Pago.SqlFrom
			sOrderBy = "[PERIODO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_Formas_de_Pago.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_Formas_de_Pago.PERIODO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTACAD
			sSelect = "SELECT DISTINCT [ESTACAD] FROM " + Detalle_Formas_de_Pago.SqlFrom
			sOrderBy = "[ESTACAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_Formas_de_Pago.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_Formas_de_Pago.ESTACAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionDropDownValue(Detalle_Formas_de_Pago.FACULTAD.DropDownValue, Detalle_Formas_de_Pago.FACULTAD)

				' Field CARRERA
				SetSessionDropDownValue(Detalle_Formas_de_Pago.CARRERA.DropDownValue, Detalle_Formas_de_Pago.CARRERA)

				' Field CODCARR
				SetSessionFilterValues(Detalle_Formas_de_Pago.CODCARR)

				' Field ANO
				SetSessionDropDownValue(Detalle_Formas_de_Pago.ANO.DropDownValue, Detalle_Formas_de_Pago.ANO)

				' Field PERIODO
				SetSessionDropDownValue(Detalle_Formas_de_Pago.PERIODO.DropDownValue, Detalle_Formas_de_Pago.PERIODO)

				' Field CODCLI
				SetSessionFilterValues(Detalle_Formas_de_Pago.CODCLI)

				' Field PATERNO
				SetSessionFilterValues(Detalle_Formas_de_Pago.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Detalle_Formas_de_Pago.MATERNO)

				' Field NOMBRE
				SetSessionFilterValues(Detalle_Formas_de_Pago.NOMBRE)

				' Field ESTACAD
				SetSessionDropDownValue(Detalle_Formas_de_Pago.ESTACAD.DropDownValue, Detalle_Formas_de_Pago.ESTACAD)
			bSetupFilter = True ' Set up filter required
		Else

				' Field FACULTAD
				If (GetDropDownValue(Detalle_Formas_de_Pago.FACULTAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_Formas_de_Pago.FACULTAD.DropDownValue) Then
					If Not ew_SameStr(Detalle_Formas_de_Pago.FACULTAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_Formas_de_Pago_FACULTAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CARRERA
				If (GetDropDownValue(Detalle_Formas_de_Pago.CARRERA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_Formas_de_Pago.CARRERA.DropDownValue) Then
					If Not ew_SameStr(Detalle_Formas_de_Pago.CARRERA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_Formas_de_Pago_CARRERA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CODCARR
				If (GetFilterValues(Detalle_Formas_de_Pago.CODCARR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ANO
				If (GetDropDownValue(Detalle_Formas_de_Pago.ANO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_Formas_de_Pago.ANO.DropDownValue) Then
					If Not ew_SameStr(Detalle_Formas_de_Pago.ANO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_Formas_de_Pago_ANO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PERIODO
				If (GetDropDownValue(Detalle_Formas_de_Pago.PERIODO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_Formas_de_Pago.PERIODO.DropDownValue) Then
					If Not ew_SameStr(Detalle_Formas_de_Pago.PERIODO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_Formas_de_Pago_PERIODO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CODCLI
				If (GetFilterValues(Detalle_Formas_de_Pago.CODCLI)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Detalle_Formas_de_Pago.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Detalle_Formas_de_Pago.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(Detalle_Formas_de_Pago.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ESTACAD
				If (GetDropDownValue(Detalle_Formas_de_Pago.ESTACAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_Formas_de_Pago.ESTACAD.DropDownValue) Then
					If Not ew_SameStr(Detalle_Formas_de_Pago.ESTACAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_Formas_de_Pago_ESTACAD") Is Nothing Then
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

			' Field FACULTAD
			GetSessionDropDownValue(Detalle_Formas_de_Pago.FACULTAD)

			' Field CARRERA
			GetSessionDropDownValue(Detalle_Formas_de_Pago.CARRERA)

			' Field CODCARR
			GetSessionFilterValues(Detalle_Formas_de_Pago.CODCARR)

			' Field ANO
			GetSessionDropDownValue(Detalle_Formas_de_Pago.ANO)

			' Field PERIODO
			GetSessionDropDownValue(Detalle_Formas_de_Pago.PERIODO)

			' Field CODCLI
			GetSessionFilterValues(Detalle_Formas_de_Pago.CODCLI)

			' Field PATERNO
			GetSessionFilterValues(Detalle_Formas_de_Pago.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Detalle_Formas_de_Pago.MATERNO)

			' Field NOMBRE
			GetSessionFilterValues(Detalle_Formas_de_Pago.NOMBRE)

			' Field ESTACAD
			GetSessionDropDownValue(Detalle_Formas_de_Pago.ESTACAD)
		End If

		' Call page filter validated event
		Detalle_Formas_de_Pago.Page_FilterValidated()

		' Build SQL
		' Field FACULTAD

		BuildDropDownFilter(Detalle_Formas_de_Pago.FACULTAD, sFilter, "")

		' Field CARRERA
		BuildDropDownFilter(Detalle_Formas_de_Pago.CARRERA, sFilter, "")

		' Field CODCARR
		BuildExtendedFilter(Detalle_Formas_de_Pago.CODCARR, sFilter)

		' Field ANO
		BuildDropDownFilter(Detalle_Formas_de_Pago.ANO, sFilter, "")

		' Field PERIODO
		BuildDropDownFilter(Detalle_Formas_de_Pago.PERIODO, sFilter, "")

		' Field CODCLI
		BuildExtendedFilter(Detalle_Formas_de_Pago.CODCLI, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Detalle_Formas_de_Pago.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Detalle_Formas_de_Pago.MATERNO, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(Detalle_Formas_de_Pago.NOMBRE, sFilter)

		' Field ESTACAD
		BuildDropDownFilter(Detalle_Formas_de_Pago.ESTACAD, sFilter, "")

		' Save parms to Session
		' Field FACULTAD

		SetSessionDropDownValue(Detalle_Formas_de_Pago.FACULTAD.DropDownValue, Detalle_Formas_de_Pago.FACULTAD)

		' Field CARRERA
		SetSessionDropDownValue(Detalle_Formas_de_Pago.CARRERA.DropDownValue, Detalle_Formas_de_Pago.CARRERA)

		' Field CODCARR
		SetSessionFilterValues(Detalle_Formas_de_Pago.CODCARR)

		' Field ANO
		SetSessionDropDownValue(Detalle_Formas_de_Pago.ANO.DropDownValue, Detalle_Formas_de_Pago.ANO)

		' Field PERIODO
		SetSessionDropDownValue(Detalle_Formas_de_Pago.PERIODO.DropDownValue, Detalle_Formas_de_Pago.PERIODO)

		' Field CODCLI
		SetSessionFilterValues(Detalle_Formas_de_Pago.CODCLI)

		' Field PATERNO
		SetSessionFilterValues(Detalle_Formas_de_Pago.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Detalle_Formas_de_Pago.MATERNO)

		' Field NOMBRE
		SetSessionFilterValues(Detalle_Formas_de_Pago.NOMBRE)

		' Field ESTACAD
		SetSessionDropDownValue(Detalle_Formas_de_Pago.ESTACAD.DropDownValue, Detalle_Formas_de_Pago.ESTACAD)

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
		If ew_Session("sv_Detalle_Formas_de_Pago_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Detalle_Formas_de_Pago_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Detalle_Formas_de_Pago_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Detalle_Formas_de_Pago_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Detalle_Formas_de_Pago_" + parm)
		End If
		If ew_Session("so1_Detalle_Formas_de_Pago_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Detalle_Formas_de_Pago_" + parm))
		End If
		If ew_Session("sc_Detalle_Formas_de_Pago_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Detalle_Formas_de_Pago_" + parm))
		End If
		If ew_Session("sv2_Detalle_Formas_de_Pago_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Detalle_Formas_de_Pago_" + parm)
		End If
		If ew_Session("so2_Detalle_Formas_de_Pago_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Detalle_Formas_de_Pago_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Detalle_Formas_de_Pago_" + parm) = fld.SearchValue
		ew_Session("so1_Detalle_Formas_de_Pago_" + parm) = fld.SearchOperator
		ew_Session("sc_Detalle_Formas_de_Pago_" + parm) = fld.SearchCondition
		ew_Session("sv2_Detalle_Formas_de_Pago_" + parm) = fld.SearchValue2
		ew_Session("so2_Detalle_Formas_de_Pago_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Detalle_Formas_de_Pago_" + parm) = ""
		ew_Session("so1_Detalle_Formas_de_Pago_" + parm) = "="
		ew_Session("sc_Detalle_Formas_de_Pago_" + parm) = "AND"
		ew_Session("sv2_Detalle_Formas_de_Pago_" + parm) = ""
		ew_Session("so2_Detalle_Formas_de_Pago_" + parm) = "="
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
		ew_Session("sel_Detalle_Formas_de_Pago_" & parm) = ""
		ew_Session("rf_Detalle_Formas_de_Pago_" & parm) = ""
		ew_Session("rt_Detalle_Formas_de_Pago_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Detalle_Formas_de_Pago.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Detalle_Formas_de_Pago_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Detalle_Formas_de_Pago_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Detalle_Formas_de_Pago_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field FACULTAD

			Detalle_Formas_de_Pago.FACULTAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_Formas_de_Pago.FACULTAD.DropDownValue = Detalle_Formas_de_Pago.FACULTAD.DefaultDropDownValue

			' Field CARRERA
			Detalle_Formas_de_Pago.CARRERA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_Formas_de_Pago.CARRERA.DropDownValue = Detalle_Formas_de_Pago.CARRERA.DefaultDropDownValue

			' Field ANO
			Detalle_Formas_de_Pago.ANO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_Formas_de_Pago.ANO.DropDownValue = Detalle_Formas_de_Pago.ANO.DefaultDropDownValue

			' Field PERIODO
			Detalle_Formas_de_Pago.PERIODO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_Formas_de_Pago.PERIODO.DropDownValue = Detalle_Formas_de_Pago.PERIODO.DefaultDropDownValue

			' Field ESTACAD
			Detalle_Formas_de_Pago.ESTACAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_Formas_de_Pago.ESTACAD.DropDownValue = Detalle_Formas_de_Pago.ESTACAD.DefaultDropDownValue

		' Set up default values for extended filters
			' Field CODCARR

			SetDefaultExtFilter(Detalle_Formas_de_Pago.CODCARR, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_Formas_de_Pago.CODCARR)	

			' Field CODCLI
			SetDefaultExtFilter(Detalle_Formas_de_Pago.CODCLI, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_Formas_de_Pago.CODCLI)	

			' Field PATERNO
			SetDefaultExtFilter(Detalle_Formas_de_Pago.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_Formas_de_Pago.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Detalle_Formas_de_Pago.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_Formas_de_Pago.MATERNO)	

			' Field NOMBRE
			SetDefaultExtFilter(Detalle_Formas_de_Pago.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_Formas_de_Pago.NOMBRE)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check FACULTAD dropdown filter
		If (NonTextFilterApplied(Detalle_Formas_de_Pago.FACULTAD)) Then bFilterExist = True

		' Check CARRERA dropdown filter
		If (NonTextFilterApplied(Detalle_Formas_de_Pago.CARRERA)) Then bFilterExist = True

		' Check CODCARR extended filter
		If (TextFilterApplied(Detalle_Formas_de_Pago.CODCARR)) Then bFilterExist = True

		' Check ANO dropdown filter
		If (NonTextFilterApplied(Detalle_Formas_de_Pago.ANO)) Then bFilterExist = True

		' Check PERIODO dropdown filter
		If (NonTextFilterApplied(Detalle_Formas_de_Pago.PERIODO)) Then bFilterExist = True

		' Check CODCLI extended filter
		If (TextFilterApplied(Detalle_Formas_de_Pago.CODCLI)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Detalle_Formas_de_Pago.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Detalle_Formas_de_Pago.MATERNO)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(Detalle_Formas_de_Pago.NOMBRE)) Then bFilterExist = True

		' Check ESTACAD dropdown filter
		If (NonTextFilterApplied(Detalle_Formas_de_Pago.ESTACAD)) Then bFilterExist = True
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
		BuildDropDownFilter(Detalle_Formas_de_Pago.FACULTAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.FACULTAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CARRERA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Detalle_Formas_de_Pago.CARRERA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.CARRERA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODCARR
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_Formas_de_Pago.CODCARR, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.CODCARR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Detalle_Formas_de_Pago.ANO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.ANO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Detalle_Formas_de_Pago.PERIODO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.PERIODO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODCLI
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_Formas_de_Pago.CODCLI, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.CODCLI.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_Formas_de_Pago.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_Formas_de_Pago.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_Formas_de_Pago.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTACAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Detalle_Formas_de_Pago.ESTACAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_Formas_de_Pago.ESTACAD.FldCaption() & "<br>"
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
				Detalle_Formas_de_Pago.OrderBy = ""
				Detalle_Formas_de_Pago.StartGroup = 1
				Detalle_Formas_de_Pago.FACULTAD.Sort = ""
				Detalle_Formas_de_Pago.CARRERA.Sort = ""
				Detalle_Formas_de_Pago.CODCARR.Sort = ""
				Detalle_Formas_de_Pago.CODCARPR.Sort = ""
				Detalle_Formas_de_Pago.PRODUCTO.Sort = ""
				Detalle_Formas_de_Pago.documento.Sort = ""
				Detalle_Formas_de_Pago.ANO.Sort = ""
				Detalle_Formas_de_Pago.PERIODO.Sort = ""
				Detalle_Formas_de_Pago.CODCLI.Sort = ""
				Detalle_Formas_de_Pago.PATERNO.Sort = ""
				Detalle_Formas_de_Pago.MATERNO.Sort = ""
				Detalle_Formas_de_Pago.NOMBRE.Sort = ""
				Detalle_Formas_de_Pago.ESTACAD.Sort = ""
				Detalle_Formas_de_Pago.TOTAL.Sort = ""
				Detalle_Formas_de_Pago.MONTO.Sort = ""
				Detalle_Formas_de_Pago.FECREG.Sort = ""
				Detalle_Formas_de_Pago.CTAPAG.Sort = ""
				Detalle_Formas_de_Pago.CTAPAGNUM.Sort = ""
				Detalle_Formas_de_Pago.FECVEN.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Detalle_Formas_de_Pago.CurrentOrder = ew_Get("order")
			Detalle_Formas_de_Pago.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Detalle_Formas_de_Pago.SortSql()
			Detalle_Formas_de_Pago.OrderBy = sSortSql
			Detalle_Formas_de_Pago.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Detalle_Formas_de_Pago.OrderBy)) Then
			Detalle_Formas_de_Pago.OrderBy = "[PATERNO] ASC, [MATERNO] ASC"
			Detalle_Formas_de_Pago.PATERNO.Sort = "ASC"
			Detalle_Formas_de_Pago.MATERNO.Sort = "ASC"
		End If
		Return Detalle_Formas_de_Pago.OrderBy
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
		Detalle_Formas_de_Pago_summary = New crDetalle_Formas_de_Pago_summary(Me)
		Detalle_Formas_de_Pago_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Detalle_Formas_de_Pago_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Detalle_Formas_de_Pago_summary IsNot Nothing) Then Detalle_Formas_de_Pago_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Detalle_Formas_de_Pago_summary = new ewrpt_Page("Detalle_Formas_de_Pago_summary");
// page properties
Detalle_Formas_de_Pago_summary.PageID = "summary"; // page ID
Detalle_Formas_de_Pago_summary.FormID = "fDetalle_Formas_de_Pagosummaryfilter"; // form ID
var EWRPT_PAGE_ID = Detalle_Formas_de_Pago_summary.PageID;
// extend page with ValidateForm function
Detalle_Formas_de_Pago_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Detalle_Formas_de_Pago_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Detalle_Formas_de_Pago_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Detalle_Formas_de_Pago_summary.ValidateRequired = false; // no JavaScript validation
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
<% Detalle_Formas_de_Pago_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Detalle_Formas_de_Pago.TableCaption() %></h1></div>
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Detalle_Formas_de_Pago_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% If (Detalle_Formas_de_Pago_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Detalle_Formas_de_Pago_summary.ShowMessage() %>
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Detalle_Formas_de_Pago.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Detalle_Formas_de_Pago.FilterPanelOption = 2 OrElse (Detalle_Formas_de_Pago.FilterPanelOption = 3 AndAlso Detalle_Formas_de_Pago_summary.FilterApplied) OrElse Detalle_Formas_de_Pago_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Detalle_Formas_de_Pagosmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fDetalle_Formas_de_Pagosummaryfilter" id="fDetalle_Formas_de_Pagosummaryfilter" action="Detalle_Formas_de_Pagosmry.aspx" class="ewForm" onsubmit="return Detalle_Formas_de_Pago_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Detalle_Formas_de_Pago.NOMBRE.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.FACULTAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FACULTAD" id="sv_FACULTAD"<%= IIf(Detalle_Formas_de_Pago_summary.ClearExtFilter = "Detalle_Formas_de_Pago_FACULTAD", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.FACULTAD.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Detalle_Formas_de_Pago.FACULTAD.CustomFilters.Count + Detalle_Formas_de_Pago.FACULTAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_Formas_de_Pago.FACULTAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "FACULTAD")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.FACULTAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_Formas_de_Pago.FACULTAD.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.FACULTAD.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.CARRERA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CARRERA" id="sv_CARRERA"<%= IIf(Detalle_Formas_de_Pago_summary.ClearExtFilter = "Detalle_Formas_de_Pago_CARRERA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.CARRERA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Detalle_Formas_de_Pago.CARRERA.CustomFilters.Count + Detalle_Formas_de_Pago.CARRERA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_Formas_de_Pago.CARRERA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CARRERA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.CARRERA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_Formas_de_Pago.CARRERA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.CARRERA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.CODCARR.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODCARR" id="sv1_CODCARR" size="30" maxlength="50" value="<%= ew_HtmlEncode(Detalle_Formas_de_Pago.CODCARR.SearchValue) %>"<%= IIf(Detalle_Formas_de_Pago_summary.ClearExtFilter = "Detalle_Formas_de_Pago_CODCARR", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.ANO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO" id="sv_ANO"<%= IIf(Detalle_Formas_de_Pago_summary.ClearExtFilter = "Detalle_Formas_de_Pago_ANO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.ANO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Detalle_Formas_de_Pago.ANO.CustomFilters.Count + Detalle_Formas_de_Pago.ANO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_Formas_de_Pago.ANO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.ANO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_Formas_de_Pago.ANO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.ANO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.PERIODO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO" id="sv_PERIODO"<%= IIf(Detalle_Formas_de_Pago_summary.ClearExtFilter = "Detalle_Formas_de_Pago_PERIODO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.PERIODO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Detalle_Formas_de_Pago.PERIODO.CustomFilters.Count + Detalle_Formas_de_Pago.PERIODO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_Formas_de_Pago.PERIODO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PERIODO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.PERIODO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_Formas_de_Pago.PERIODO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.PERIODO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.CODCLI.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODCLI" id="sv1_CODCLI" size="30" maxlength="30" value="<%= ew_HtmlEncode(Detalle_Formas_de_Pago.CODCLI.SearchValue) %>"<%= IIf(Detalle_Formas_de_Pago_summary.ClearExtFilter = "Detalle_Formas_de_Pago_CODCLI", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Detalle_Formas_de_Pago.PATERNO.SearchValue) %>"<%= IIf(Detalle_Formas_de_Pago_summary.ClearExtFilter = "Detalle_Formas_de_Pago_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Detalle_Formas_de_Pago.MATERNO.SearchValue) %>"<%= IIf(Detalle_Formas_de_Pago_summary.ClearExtFilter = "Detalle_Formas_de_Pago_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.NOMBRE.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(Detalle_Formas_de_Pago.NOMBRE.SearchValue) %>"<%= IIf(Detalle_Formas_de_Pago_summary.ClearExtFilter = "Detalle_Formas_de_Pago_NOMBRE", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_Formas_de_Pago.ESTACAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Detalle_Formas_de_Pago.ESTACAD.CustomFilters.Count + Detalle_Formas_de_Pago.ESTACAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_Formas_de_Pago.ESTACAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTACAD")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Detalle_Formas_de_Pago.ESTACAD.DropDownValue" id="Detalle_Formas_de_Pago.ESTACAD.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.ESTACAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_Formas_de_Pago.ESTACAD.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTACAD" id="sv_ESTACAD" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_Formas_de_Pago.ESTACAD.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (Detalle_Formas_de_Pago.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Detalle_Formas_de_Pago_summary.ShowFilterList() %>
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
If (Detalle_Formas_de_Pago.ExportAll AndAlso ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then
	Detalle_Formas_de_Pago_summary.StopGrp = Detalle_Formas_de_Pago_summary.TotalGrps
Else
	Detalle_Formas_de_Pago_summary.StopGrp = Detalle_Formas_de_Pago_summary.StartGrp + Detalle_Formas_de_Pago_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Detalle_Formas_de_Pago_summary.StopGrp > Detalle_Formas_de_Pago_summary.TotalGrps) Then
	Detalle_Formas_de_Pago_summary.StopGrp = Detalle_Formas_de_Pago_summary.TotalGrps
End If
Detalle_Formas_de_Pago_summary.RecCount = 0

' Get first row
If (Detalle_Formas_de_Pago_summary.TotalGrps > 0) Then
	Detalle_Formas_de_Pago_summary.GetRow() ' ASPXRPT
	Detalle_Formas_de_Pago_summary.GrpCount = 1
End If
While ((Detalle_Formas_de_Pago_summary.HasRow AndAlso Detalle_Formas_de_Pago_summary.GrpIndex < Detalle_Formas_de_Pago_summary.StopGrp) OrElse Detalle_Formas_de_Pago_summary.ShowFirstHeader)

	' Show header
	If (Detalle_Formas_de_Pago_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.FACULTAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.FACULTAD))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.FACULTAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.FACULTAD) %>',0);"><%= Detalle_Formas_de_Pago.FACULTAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.FACULTAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.FACULTAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.CARRERA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CARRERA))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.CARRERA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CARRERA) %>',0);"><%= Detalle_Formas_de_Pago.CARRERA.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.CARRERA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.CARRERA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CODCARR) %>',0);"><%= Detalle_Formas_de_Pago.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.CODCARPR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CODCARPR))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.CODCARPR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CODCARPR) %>',0);"><%= Detalle_Formas_de_Pago.CODCARPR.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.CODCARPR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.CODCARPR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.PRODUCTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.PRODUCTO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.PRODUCTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.PRODUCTO) %>',0);"><%= Detalle_Formas_de_Pago.PRODUCTO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.PRODUCTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.PRODUCTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.documento.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.documento))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.documento.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.documento) %>',0);"><%= Detalle_Formas_de_Pago.documento.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.documento.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.documento.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.ANO) %>',0);"><%= Detalle_Formas_de_Pago.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.PERIODO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.PERIODO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.PERIODO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.PERIODO) %>',0);"><%= Detalle_Formas_de_Pago.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.PERIODO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.PERIODO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.CODCLI.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CODCLI))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.CODCLI.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CODCLI) %>',0);"><%= Detalle_Formas_de_Pago.CODCLI.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.CODCLI.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.CODCLI.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.PATERNO) %>',0);"><%= Detalle_Formas_de_Pago.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.MATERNO) %>',0);"><%= Detalle_Formas_de_Pago.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.NOMBRE) %>',0);"><%= Detalle_Formas_de_Pago.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.ESTACAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.ESTACAD))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.ESTACAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.ESTACAD) %>',0);"><%= Detalle_Formas_de_Pago.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.ESTACAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.ESTACAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.TOTAL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.TOTAL))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.TOTAL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.TOTAL) %>',0);"><%= Detalle_Formas_de_Pago.TOTAL.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.TOTAL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.TOTAL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.MONTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.MONTO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.MONTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.MONTO) %>',0);"><%= Detalle_Formas_de_Pago.MONTO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.MONTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.MONTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.FECREG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.FECREG))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.FECREG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.FECREG) %>',0);"><%= Detalle_Formas_de_Pago.FECREG.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.FECREG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.FECREG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.CTAPAG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CTAPAG))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.CTAPAG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CTAPAG) %>',0);"><%= Detalle_Formas_de_Pago.CTAPAG.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.CTAPAG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.CTAPAG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.CTAPAGNUM.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CTAPAGNUM))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.CTAPAGNUM.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.CTAPAGNUM) %>',0);"><%= Detalle_Formas_de_Pago.CTAPAGNUM.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.CTAPAGNUM.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.CTAPAGNUM.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.FECVEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.FECVEN))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.FECVEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.FECVEN) %>',0);"><%= Detalle_Formas_de_Pago.FECVEN.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.FECVEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.FECVEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>

<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.ANO_COHORTE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.ANO_COHORTE))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.ANO_COHORTE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.ANO_COHORTE) %>',0);"><%= Detalle_Formas_de_Pago.ANO_COHORTE.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.ANO_COHORTE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.ANO_COHORTE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_Formas_de_Pago.Export)) Then %>
<%= Detalle_Formas_de_Pago.PERIODO_COHORTE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.PERIODO_COHORTE))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_Formas_de_Pago.PERIODO_COHORTE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_Formas_de_Pago.SortUrl(Detalle_Formas_de_Pago.PERIODO_COHORTE) %>',0);"><%= Detalle_Formas_de_Pago.PERIODO_COHORTE.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_Formas_de_Pago.PERIODO_COHORTE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_Formas_de_Pago.PERIODO_COHORTE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Detalle_Formas_de_Pago_summary.ShowFirstHeader = False
	End If
	Detalle_Formas_de_Pago_summary.RecCount += 1

		' Render detail row
		Detalle_Formas_de_Pago.ResetCSS()
		Detalle_Formas_de_Pago.RowType = EWRPT_ROWTYPE_DETAIL
		Detalle_Formas_de_Pago_summary.RenderRow()
%>
	<tr<%= Detalle_Formas_de_Pago.RowAttributes() %>>
		<td<%= Detalle_Formas_de_Pago.FACULTAD.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.FACULTAD.ViewAttributes%>><%= Detalle_Formas_de_Pago.FACULTAD.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.CARRERA.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.CARRERA.ViewAttributes%>><%= Detalle_Formas_de_Pago.CARRERA.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.CODCARR.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.CODCARR.ViewAttributes%>><%= Detalle_Formas_de_Pago.CODCARR.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.CODCARPR.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.CODCARPR.ViewAttributes%>><%= Detalle_Formas_de_Pago.CODCARPR.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.PRODUCTO.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.PRODUCTO.ViewAttributes%>><%= Detalle_Formas_de_Pago.PRODUCTO.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.documento.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.documento.ViewAttributes%>><%= Detalle_Formas_de_Pago.documento.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.ANO.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.ANO.ViewAttributes%>><%= Detalle_Formas_de_Pago.ANO.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.PERIODO.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.PERIODO.ViewAttributes%>><%= Detalle_Formas_de_Pago.PERIODO.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.CODCLI.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.CODCLI.ViewAttributes%>><%= Detalle_Formas_de_Pago.CODCLI.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.PATERNO.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.PATERNO.ViewAttributes%>><%= Detalle_Formas_de_Pago.PATERNO.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.MATERNO.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.MATERNO.ViewAttributes%>><%= Detalle_Formas_de_Pago.MATERNO.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.NOMBRE.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.NOMBRE.ViewAttributes%>><%= Detalle_Formas_de_Pago.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.ESTACAD.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.ESTACAD.ViewAttributes%>><%= Detalle_Formas_de_Pago.ESTACAD.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.TOTAL.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.TOTAL.ViewAttributes%>><%= Detalle_Formas_de_Pago.TOTAL.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.MONTO.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.MONTO.ViewAttributes%>><%= Detalle_Formas_de_Pago.MONTO.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.FECREG.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.FECREG.ViewAttributes%>><%= Detalle_Formas_de_Pago.FECREG.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.CTAPAG.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.CTAPAG.ViewAttributes%>><%= Detalle_Formas_de_Pago.CTAPAG.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.CTAPAGNUM.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.CTAPAGNUM.ViewAttributes%>><%= Detalle_Formas_de_Pago.CTAPAGNUM.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.FECVEN.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.FECVEN.ViewAttributes%>><%= Detalle_Formas_de_Pago.FECVEN.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.ANO_COHORTE.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.ANO_COHORTE.ViewAttributes%>><%= Detalle_Formas_de_Pago.ANO_COHORTE.ListViewValue%></div>
</td>
		<td<%= Detalle_Formas_de_Pago.PERIODO_COHORTE.CellAttributes %>>
<div<%= Detalle_Formas_de_Pago.PERIODO_COHORTE.ViewAttributes%>><%= Detalle_Formas_de_Pago.PERIODO_COHORTE.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Detalle_Formas_de_Pago_summary.AccumulateSummary()

		' Get next record
		Detalle_Formas_de_Pago_summary.GetRow() ' ASPXRPT
		Detalle_Formas_de_Pago_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Detalle_Formas_de_Pago_summary.TotalGrps > 0) Then
	Detalle_Formas_de_Pago.ResetCSS()
	Detalle_Formas_de_Pago.RowType = EWRPT_ROWTYPE_TOTAL
	Detalle_Formas_de_Pago.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Detalle_Formas_de_Pago.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Detalle_Formas_de_Pago.RowAttrs("class") = "ewRptGrandSummary"
	Detalle_Formas_de_Pago_summary.RenderRow()
%>
	<!-- tr><td colspan="19"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Detalle_Formas_de_Pago.RowAttributes() %>><td colspan="19"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Detalle_Formas_de_Pago_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Detalle_Formas_de_Pago_summary.Pager Is Nothing Then Detalle_Formas_de_Pago_summary.Pager = New cPrevNextPager(Detalle_Formas_de_Pago_summary.StartGrp, Detalle_Formas_de_Pago_summary.DisplayGrps, Detalle_Formas_de_Pago_summary.TotalGrps) %>
<% If Detalle_Formas_de_Pago_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Detalle_Formas_de_Pago_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Detalle_Formas_de_Pagosmry.aspx?start=<%= Detalle_Formas_de_Pago_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Detalle_Formas_de_Pago_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Detalle_Formas_de_Pagosmry.aspx?start=<%= Detalle_Formas_de_Pago_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Detalle_Formas_de_Pago_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Detalle_Formas_de_Pago_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Detalle_Formas_de_Pagosmry.aspx?start=<%= Detalle_Formas_de_Pago_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Detalle_Formas_de_Pago_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Detalle_Formas_de_Pagosmry.aspx?start=<%= Detalle_Formas_de_Pago_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Detalle_Formas_de_Pago_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Detalle_Formas_de_Pago_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Detalle_Formas_de_Pago_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Detalle_Formas_de_Pago_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Detalle_Formas_de_Pago_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Detalle_Formas_de_Pago_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Detalle_Formas_de_Pago_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Detalle_Formas_de_Pago_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Detalle_Formas_de_Pago_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Detalle_Formas_de_Pago_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Detalle_Formas_de_Pago.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
