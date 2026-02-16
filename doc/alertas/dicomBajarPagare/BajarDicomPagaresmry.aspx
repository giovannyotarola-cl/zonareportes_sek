<%@ Page ClassName="BajarDicomPagaresmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_dicomBajarPagare" %>
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
	Public BajarDicomPagare As crBajarDicomPagare = Nothing

	'
	' Table class (for BajarDicomPagare)
	'
	Public Class crBajarDicomPagare
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
				Return "BajarDicomPagare"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "BajarDicomPagare"
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

		Public rut As crField

		Public DIG As crField

		Public Nombre__alumno As crField

		Public PATERNO_ALUMNO As crField

		Public MATERNO_ALUMNO As crField

		Public MAIL__ALUMNO As crField

		Public numero__pagare As crField

		Public Documento As crField

		Public ANO__ORIGEN_DEUDA As crField

		Public NUMERO_DE_CUOTA As crField

		Public Num_TOTAL_Cuotas As crField

		Public MONTO_INICIAL As crField

		Public SALDO_PENDIENTE As crField

		Public FECHA_VENCIMIENTO_CUOTA As crField

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

			' rut
			rut = new crField("BajarDicomPagare", "BajarDicomPagare", "x_rut", "rut", "[rut]", 5, EWRPT_DATATYPE_NUMBER, -1)
			rut.Page = APage
			rut.ParentPage = APage.ParentPage
			rut.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("rut", rut)
			rut.DateFilter = ""
			rut.SqlSelect = ""
			rut.SqlOrderBy = ""

			' DIG
			DIG = new crField("BajarDicomPagare", "BajarDicomPagare", "x_DIG", "DIG", "[DIG]", 202, EWRPT_DATATYPE_STRING, -1)
			DIG.Page = APage
			DIG.ParentPage = APage.ParentPage
			Fields.Add("DIG", DIG)
			DIG.DateFilter = ""
			DIG.SqlSelect = ""
			DIG.SqlOrderBy = ""

			' Nombre_ alumno
			Nombre__alumno = new crField("BajarDicomPagare", "BajarDicomPagare", "x_Nombre__alumno", "Nombre_ alumno", "[Nombre_ alumno]", 202, EWRPT_DATATYPE_STRING, -1)
			Nombre__alumno.Page = APage
			Nombre__alumno.ParentPage = APage.ParentPage
			Fields.Add("Nombre__alumno", Nombre__alumno)
			Nombre__alumno.DateFilter = ""
			Nombre__alumno.SqlSelect = ""
			Nombre__alumno.SqlOrderBy = ""

			' PATERNO ALUMNO
			PATERNO_ALUMNO = new crField("BajarDicomPagare", "BajarDicomPagare", "x_PATERNO_ALUMNO", "PATERNO ALUMNO", "[PATERNO ALUMNO]", 202, EWRPT_DATATYPE_STRING, -1)
			PATERNO_ALUMNO.Page = APage
			PATERNO_ALUMNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO_ALUMNO", PATERNO_ALUMNO)
			PATERNO_ALUMNO.DateFilter = ""
			PATERNO_ALUMNO.SqlSelect = ""
			PATERNO_ALUMNO.SqlOrderBy = ""

			' MATERNO ALUMNO
			MATERNO_ALUMNO = new crField("BajarDicomPagare", "BajarDicomPagare", "x_MATERNO_ALUMNO", "MATERNO ALUMNO", "[MATERNO ALUMNO]", 202, EWRPT_DATATYPE_STRING, -1)
			MATERNO_ALUMNO.Page = APage
			MATERNO_ALUMNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO_ALUMNO", MATERNO_ALUMNO)
			MATERNO_ALUMNO.DateFilter = ""
			MATERNO_ALUMNO.SqlSelect = ""
			MATERNO_ALUMNO.SqlOrderBy = ""

			' MAIL_ ALUMNO
			MAIL__ALUMNO = new crField("BajarDicomPagare", "BajarDicomPagare", "x_MAIL__ALUMNO", "MAIL_ ALUMNO", "[MAIL_ ALUMNO]", 202, EWRPT_DATATYPE_STRING, -1)
			MAIL__ALUMNO.Page = APage
			MAIL__ALUMNO.ParentPage = APage.ParentPage
			Fields.Add("MAIL__ALUMNO", MAIL__ALUMNO)
			MAIL__ALUMNO.DateFilter = ""
			MAIL__ALUMNO.SqlSelect = ""
			MAIL__ALUMNO.SqlOrderBy = ""

			' numero_ pagare
			numero__pagare = new crField("BajarDicomPagare", "BajarDicomPagare", "x_numero__pagare", "numero_ pagare", "[numero_ pagare]", 5, EWRPT_DATATYPE_NUMBER, -1)
			numero__pagare.Page = APage
			numero__pagare.ParentPage = APage.ParentPage
			numero__pagare.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("numero__pagare", numero__pagare)
			numero__pagare.DateFilter = ""
			numero__pagare.SqlSelect = ""
			numero__pagare.SqlOrderBy = ""

			' Documento
			Documento = new crField("BajarDicomPagare", "BajarDicomPagare", "x_Documento", "Documento", "[Documento]", 202, EWRPT_DATATYPE_STRING, -1)
			Documento.Page = APage
			Documento.ParentPage = APage.ParentPage
			Fields.Add("Documento", Documento)
			Documento.DateFilter = ""
			Documento.SqlSelect = ""
			Documento.SqlOrderBy = ""

			' ANO  ORIGEN DEUDA
			ANO__ORIGEN_DEUDA = new crField("BajarDicomPagare", "BajarDicomPagare", "x_ANO__ORIGEN_DEUDA", "ANO  ORIGEN DEUDA", "[ANO  ORIGEN DEUDA]", 5, EWRPT_DATATYPE_NUMBER, -1)
			ANO__ORIGEN_DEUDA.Page = APage
			ANO__ORIGEN_DEUDA.ParentPage = APage.ParentPage
			ANO__ORIGEN_DEUDA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO__ORIGEN_DEUDA", ANO__ORIGEN_DEUDA)
			ANO__ORIGEN_DEUDA.DateFilter = ""
			ANO__ORIGEN_DEUDA.SqlSelect = ""
			ANO__ORIGEN_DEUDA.SqlOrderBy = ""

			' NUMERO DE CUOTA
			NUMERO_DE_CUOTA = new crField("BajarDicomPagare", "BajarDicomPagare", "x_NUMERO_DE_CUOTA", "NUMERO DE CUOTA", "[NUMERO DE CUOTA]", 5, EWRPT_DATATYPE_NUMBER, -1)
			NUMERO_DE_CUOTA.Page = APage
			NUMERO_DE_CUOTA.ParentPage = APage.ParentPage
			NUMERO_DE_CUOTA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NUMERO_DE_CUOTA", NUMERO_DE_CUOTA)
			NUMERO_DE_CUOTA.DateFilter = ""
			NUMERO_DE_CUOTA.SqlSelect = ""
			NUMERO_DE_CUOTA.SqlOrderBy = ""

			' Num TOTAL Cuotas
			Num_TOTAL_Cuotas = new crField("BajarDicomPagare", "BajarDicomPagare", "x_Num_TOTAL_Cuotas", "Num TOTAL Cuotas", "[Num TOTAL Cuotas]", 5, EWRPT_DATATYPE_NUMBER, -1)
			Num_TOTAL_Cuotas.Page = APage
			Num_TOTAL_Cuotas.ParentPage = APage.ParentPage
			Num_TOTAL_Cuotas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Num_TOTAL_Cuotas", Num_TOTAL_Cuotas)
			Num_TOTAL_Cuotas.DateFilter = ""
			Num_TOTAL_Cuotas.SqlSelect = ""
			Num_TOTAL_Cuotas.SqlOrderBy = ""

			' MONTO INICIAL
			MONTO_INICIAL = new crField("BajarDicomPagare", "BajarDicomPagare", "x_MONTO_INICIAL", "MONTO INICIAL", "[MONTO INICIAL]", 6, EWRPT_DATATYPE_NUMBER, -1)
			MONTO_INICIAL.Page = APage
			MONTO_INICIAL.ParentPage = APage.ParentPage
			MONTO_INICIAL.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("MONTO_INICIAL", MONTO_INICIAL)
			MONTO_INICIAL.DateFilter = ""
			MONTO_INICIAL.SqlSelect = ""
			MONTO_INICIAL.SqlOrderBy = ""

			' SALDO PENDIENTE
			SALDO_PENDIENTE = new crField("BajarDicomPagare", "BajarDicomPagare", "x_SALDO_PENDIENTE", "SALDO PENDIENTE", "[SALDO PENDIENTE]", 6, EWRPT_DATATYPE_NUMBER, -1)
			SALDO_PENDIENTE.Page = APage
			SALDO_PENDIENTE.ParentPage = APage.ParentPage
			SALDO_PENDIENTE.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("SALDO_PENDIENTE", SALDO_PENDIENTE)
			SALDO_PENDIENTE.DateFilter = ""
			SALDO_PENDIENTE.SqlSelect = ""
			SALDO_PENDIENTE.SqlOrderBy = ""

			' FECHA VENCIMIENTO CUOTA
			FECHA_VENCIMIENTO_CUOTA = new crField("BajarDicomPagare", "BajarDicomPagare", "x_FECHA_VENCIMIENTO_CUOTA", "FECHA VENCIMIENTO CUOTA", "[FECHA VENCIMIENTO CUOTA]", 135, EWRPT_DATATYPE_DATE, 7)
			FECHA_VENCIMIENTO_CUOTA.Page = APage
			FECHA_VENCIMIENTO_CUOTA.ParentPage = APage.ParentPage
			FECHA_VENCIMIENTO_CUOTA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECHA_VENCIMIENTO_CUOTA", FECHA_VENCIMIENTO_CUOTA)
			FECHA_VENCIMIENTO_CUOTA.DateFilter = ""
			FECHA_VENCIMIENTO_CUOTA.SqlSelect = ""
			FECHA_VENCIMIENTO_CUOTA.SqlOrderBy = ""
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
				Return "[SEK_DICOM_Bajar_Pagare]"
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
	Public BajarDicomPagare_summary As crBajarDicomPagare_summary

	'
	' Page class
	'
	Public Class crBajarDicomPagare_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (BajarDicomPagare.UseTokenInUrl) Then
				sUrl &= "t=" & BajarDicomPagare.TableVar & "&" ' Add page token
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
			If (BajarDicomPagare.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(BajarDicomPagare.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(BajarDicomPagare.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As BajarDicomPagaresmry 
			Get
				Return CType(m_ParentPage, BajarDicomPagaresmry)
			End Get
		End Property

		' Table object (BajarDicomPagare)
		Public Property BajarDicomPagare As crBajarDicomPagare 
			Get		
				Return AspNetPage.BajarDicomPagare ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crBajarDicomPagare)
				AspNetPage.BajarDicomPagare = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_dicomBajarPagare)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "BajarDicomPagare_summary"
			m_PageObjTypeName = "crBajarDicomPagare_summary"

			' Table name
			m_TableName = "BajarDicomPagare"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (BajarDicomPagare)
			BajarDicomPagare = New crBajarDicomPagare(Me)			

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
				BajarDicomPagare.Export = ew_Get("export")
			End If
			gsExport = BajarDicomPagare.Export ' Get export parameter, used in header
			gsExportFile = BajarDicomPagare.TableVar ' Get export file, used in header
			If (BajarDicomPagare.Export = "excel") Then
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
			BajarDicomPagare.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(BajarDicomPagare.SqlSelect, BajarDicomPagare.SqlWhere, BajarDicomPagare.SqlGroupBy, BajarDicomPagare.SqlHaving, BajarDicomPagare.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (BajarDicomPagare.ExportAll AndAlso ew_NotEmpty(BajarDicomPagare.Export)) Then
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
				BajarDicomPagare.MAIL__ALUMNO.DbValue = Row("MAIL_ ALUMNO")
				BajarDicomPagare.numero__pagare.DbValue = Row("numero_ pagare")
				BajarDicomPagare.rut.DbValue = Row("rut")
				BajarDicomPagare.DIG.DbValue = Row("DIG")
				BajarDicomPagare.Documento.DbValue = Row("Documento")
				BajarDicomPagare.ANO__ORIGEN_DEUDA.DbValue = Row("ANO  ORIGEN DEUDA")
				BajarDicomPagare.NUMERO_DE_CUOTA.DbValue = Row("NUMERO DE CUOTA")
				BajarDicomPagare.Num_TOTAL_Cuotas.DbValue = Row("Num TOTAL Cuotas")
				BajarDicomPagare.MONTO_INICIAL.DbValue = Row("MONTO INICIAL")
				BajarDicomPagare.SALDO_PENDIENTE.DbValue = Row("SALDO PENDIENTE")
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.DbValue = Row("FECHA VENCIMIENTO CUOTA")
				BajarDicomPagare.Nombre__alumno.DbValue = Row("Nombre_ alumno")
				BajarDicomPagare.PATERNO_ALUMNO.DbValue = Row("PATERNO ALUMNO")
				BajarDicomPagare.MATERNO_ALUMNO.DbValue = Row("MATERNO ALUMNO")
				Val(1) = BajarDicomPagare.rut.CurrentValue
				Val(2) = BajarDicomPagare.DIG.CurrentValue
				Val(3) = BajarDicomPagare.Nombre__alumno.CurrentValue
				Val(4) = BajarDicomPagare.PATERNO_ALUMNO.CurrentValue
				Val(5) = BajarDicomPagare.MATERNO_ALUMNO.CurrentValue
				Val(6) = BajarDicomPagare.MAIL__ALUMNO.CurrentValue
				Val(7) = BajarDicomPagare.numero__pagare.CurrentValue
				Val(8) = BajarDicomPagare.Documento.CurrentValue
				Val(9) = BajarDicomPagare.ANO__ORIGEN_DEUDA.CurrentValue
				Val(10) = BajarDicomPagare.NUMERO_DE_CUOTA.CurrentValue
				Val(11) = BajarDicomPagare.Num_TOTAL_Cuotas.CurrentValue
				Val(12) = BajarDicomPagare.MONTO_INICIAL.CurrentValue
				Val(13) = BajarDicomPagare.SALDO_PENDIENTE.CurrentValue
				Val(14) = BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.CurrentValue
			Else
				BajarDicomPagare.MAIL__ALUMNO.DbValue = ""
				BajarDicomPagare.numero__pagare.DbValue = ""
				BajarDicomPagare.rut.DbValue = ""
				BajarDicomPagare.DIG.DbValue = ""
				BajarDicomPagare.Documento.DbValue = ""
				BajarDicomPagare.ANO__ORIGEN_DEUDA.DbValue = ""
				BajarDicomPagare.NUMERO_DE_CUOTA.DbValue = ""
				BajarDicomPagare.Num_TOTAL_Cuotas.DbValue = ""
				BajarDicomPagare.MONTO_INICIAL.DbValue = ""
				BajarDicomPagare.SALDO_PENDIENTE.DbValue = ""
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.DbValue = ""
				BajarDicomPagare.Nombre__alumno.DbValue = ""
				BajarDicomPagare.PATERNO_ALUMNO.DbValue = ""
				BajarDicomPagare.MATERNO_ALUMNO.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				BajarDicomPagare.MAIL__ALUMNO.DbValue = dr("MAIL_ ALUMNO")
				BajarDicomPagare.numero__pagare.DbValue = dr("numero_ pagare")
				BajarDicomPagare.rut.DbValue = dr("rut")
				BajarDicomPagare.DIG.DbValue = dr("DIG")
				BajarDicomPagare.Documento.DbValue = dr("Documento")
				BajarDicomPagare.ANO__ORIGEN_DEUDA.DbValue = dr("ANO  ORIGEN DEUDA")
				BajarDicomPagare.NUMERO_DE_CUOTA.DbValue = dr("NUMERO DE CUOTA")
				BajarDicomPagare.Num_TOTAL_Cuotas.DbValue = dr("Num TOTAL Cuotas")
				BajarDicomPagare.MONTO_INICIAL.DbValue = dr("MONTO INICIAL")
				BajarDicomPagare.SALDO_PENDIENTE.DbValue = dr("SALDO PENDIENTE")
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.DbValue = dr("FECHA VENCIMIENTO CUOTA")
				BajarDicomPagare.Nombre__alumno.DbValue = dr("Nombre_ alumno")
				BajarDicomPagare.PATERNO_ALUMNO.DbValue = dr("PATERNO ALUMNO")
				BajarDicomPagare.MATERNO_ALUMNO.DbValue = dr("MATERNO ALUMNO")
				Val(1) = BajarDicomPagare.rut.CurrentValue
				Val(2) = BajarDicomPagare.DIG.CurrentValue
				Val(3) = BajarDicomPagare.Nombre__alumno.CurrentValue
				Val(4) = BajarDicomPagare.PATERNO_ALUMNO.CurrentValue
				Val(5) = BajarDicomPagare.MATERNO_ALUMNO.CurrentValue
				Val(6) = BajarDicomPagare.MAIL__ALUMNO.CurrentValue
				Val(7) = BajarDicomPagare.numero__pagare.CurrentValue
				Val(8) = BajarDicomPagare.Documento.CurrentValue
				Val(9) = BajarDicomPagare.ANO__ORIGEN_DEUDA.CurrentValue
				Val(10) = BajarDicomPagare.NUMERO_DE_CUOTA.CurrentValue
				Val(11) = BajarDicomPagare.Num_TOTAL_Cuotas.CurrentValue
				Val(12) = BajarDicomPagare.MONTO_INICIAL.CurrentValue
				Val(13) = BajarDicomPagare.SALDO_PENDIENTE.CurrentValue
				Val(14) = BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.CurrentValue
			Else				
				BajarDicomPagare.MAIL__ALUMNO.DbValue = ""
				BajarDicomPagare.numero__pagare.DbValue = ""
				BajarDicomPagare.rut.DbValue = ""
				BajarDicomPagare.DIG.DbValue = ""
				BajarDicomPagare.Documento.DbValue = ""
				BajarDicomPagare.ANO__ORIGEN_DEUDA.DbValue = ""
				BajarDicomPagare.NUMERO_DE_CUOTA.DbValue = ""
				BajarDicomPagare.Num_TOTAL_Cuotas.DbValue = ""
				BajarDicomPagare.MONTO_INICIAL.DbValue = ""
				BajarDicomPagare.SALDO_PENDIENTE.DbValue = ""
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.DbValue = ""
				BajarDicomPagare.Nombre__alumno.DbValue = ""
				BajarDicomPagare.PATERNO_ALUMNO.DbValue = ""
				BajarDicomPagare.MATERNO_ALUMNO.DbValue = ""
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
				BajarDicomPagare.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					BajarDicomPagare.StartGroup = StartGrp
				Else
					StartGrp = BajarDicomPagare.StartGroup
				End If
			Else
				StartGrp = BajarDicomPagare.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				BajarDicomPagare.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				BajarDicomPagare.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				BajarDicomPagare.StartGroup = StartGrp
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
			BajarDicomPagare.StartGroup = StartGrp
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
				BajarDicomPagare.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				BajarDicomPagare.StartGroup = StartGrp
			Else				
				If (BajarDicomPagare.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(BajarDicomPagare.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (BajarDicomPagare.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(BajarDicomPagare.SqlSelectCount, BajarDicomPagare.SqlWhere, BajarDicomPagare.SqlGroupBy, BajarDicomPagare.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			BajarDicomPagare.Row_Rendering()

			'
			' Render view codes
			'

			If (BajarDicomPagare.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' rut
				BajarDicomPagare.rut.ViewValue = Convert.ToString(BajarDicomPagare.rut.Summary)

				' DIG
				BajarDicomPagare.DIG.ViewValue = Convert.ToString(BajarDicomPagare.DIG.Summary)

				' Nombre_ alumno
				BajarDicomPagare.Nombre__alumno.ViewValue = Convert.ToString(BajarDicomPagare.Nombre__alumno.Summary)

				' PATERNO ALUMNO
				BajarDicomPagare.PATERNO_ALUMNO.ViewValue = Convert.ToString(BajarDicomPagare.PATERNO_ALUMNO.Summary)

				' MATERNO ALUMNO
				BajarDicomPagare.MATERNO_ALUMNO.ViewValue = Convert.ToString(BajarDicomPagare.MATERNO_ALUMNO.Summary)

				' MAIL_ ALUMNO
				BajarDicomPagare.MAIL__ALUMNO.ViewValue = Convert.ToString(BajarDicomPagare.MAIL__ALUMNO.Summary)

				' numero_ pagare
				BajarDicomPagare.numero__pagare.ViewValue = Convert.ToString(BajarDicomPagare.numero__pagare.Summary)

				' Documento
				BajarDicomPagare.Documento.ViewValue = Convert.ToString(BajarDicomPagare.Documento.Summary)

				' ANO  ORIGEN DEUDA
				BajarDicomPagare.ANO__ORIGEN_DEUDA.ViewValue = Convert.ToString(BajarDicomPagare.ANO__ORIGEN_DEUDA.Summary)

				' NUMERO DE CUOTA
				BajarDicomPagare.NUMERO_DE_CUOTA.ViewValue = Convert.ToString(BajarDicomPagare.NUMERO_DE_CUOTA.Summary)

				' Num TOTAL Cuotas
				BajarDicomPagare.Num_TOTAL_Cuotas.ViewValue = Convert.ToString(BajarDicomPagare.Num_TOTAL_Cuotas.Summary)

				' MONTO INICIAL
				BajarDicomPagare.MONTO_INICIAL.ViewValue = Convert.ToString(BajarDicomPagare.MONTO_INICIAL.Summary)

				' SALDO PENDIENTE
				BajarDicomPagare.SALDO_PENDIENTE.ViewValue = Convert.ToString(BajarDicomPagare.SALDO_PENDIENTE.Summary)

				' FECHA VENCIMIENTO CUOTA
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.ViewValue = Convert.ToString(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.Summary)
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.ViewValue = ew_FormatDateTime(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.ViewValue, 7)
			Else

				' rut
				BajarDicomPagare.rut.ViewValue = Convert.ToString(BajarDicomPagare.rut.CurrentValue)
				BajarDicomPagare.rut.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIG
				BajarDicomPagare.DIG.ViewValue = Convert.ToString(BajarDicomPagare.DIG.CurrentValue)
				BajarDicomPagare.DIG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Nombre_ alumno
				BajarDicomPagare.Nombre__alumno.ViewValue = Convert.ToString(BajarDicomPagare.Nombre__alumno.CurrentValue)
				BajarDicomPagare.Nombre__alumno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO ALUMNO
				BajarDicomPagare.PATERNO_ALUMNO.ViewValue = Convert.ToString(BajarDicomPagare.PATERNO_ALUMNO.CurrentValue)
				BajarDicomPagare.PATERNO_ALUMNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO ALUMNO
				BajarDicomPagare.MATERNO_ALUMNO.ViewValue = Convert.ToString(BajarDicomPagare.MATERNO_ALUMNO.CurrentValue)
				BajarDicomPagare.MATERNO_ALUMNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MAIL_ ALUMNO
				BajarDicomPagare.MAIL__ALUMNO.ViewValue = Convert.ToString(BajarDicomPagare.MAIL__ALUMNO.CurrentValue)
				BajarDicomPagare.MAIL__ALUMNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' numero_ pagare
				BajarDicomPagare.numero__pagare.ViewValue = Convert.ToString(BajarDicomPagare.numero__pagare.CurrentValue)
				BajarDicomPagare.numero__pagare.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Documento
				BajarDicomPagare.Documento.ViewValue = Convert.ToString(BajarDicomPagare.Documento.CurrentValue)
				BajarDicomPagare.Documento.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO  ORIGEN DEUDA
				BajarDicomPagare.ANO__ORIGEN_DEUDA.ViewValue = Convert.ToString(BajarDicomPagare.ANO__ORIGEN_DEUDA.CurrentValue)
				BajarDicomPagare.ANO__ORIGEN_DEUDA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NUMERO DE CUOTA
				BajarDicomPagare.NUMERO_DE_CUOTA.ViewValue = Convert.ToString(BajarDicomPagare.NUMERO_DE_CUOTA.CurrentValue)
				BajarDicomPagare.NUMERO_DE_CUOTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Num TOTAL Cuotas
				BajarDicomPagare.Num_TOTAL_Cuotas.ViewValue = Convert.ToString(BajarDicomPagare.Num_TOTAL_Cuotas.CurrentValue)
				BajarDicomPagare.Num_TOTAL_Cuotas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MONTO INICIAL
				BajarDicomPagare.MONTO_INICIAL.ViewValue = Convert.ToString(BajarDicomPagare.MONTO_INICIAL.CurrentValue)
				BajarDicomPagare.MONTO_INICIAL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SALDO PENDIENTE
				BajarDicomPagare.SALDO_PENDIENTE.ViewValue = Convert.ToString(BajarDicomPagare.SALDO_PENDIENTE.CurrentValue)
				BajarDicomPagare.SALDO_PENDIENTE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECHA VENCIMIENTO CUOTA
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.ViewValue = Convert.ToString(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.CurrentValue)
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.ViewValue = ew_FormatDateTime(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.ViewValue, 7)
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' rut
			BajarDicomPagare.rut.HrefValue = ""

			' DIG
			BajarDicomPagare.DIG.HrefValue = ""

			' Nombre_ alumno
			BajarDicomPagare.Nombre__alumno.HrefValue = ""

			' PATERNO ALUMNO
			BajarDicomPagare.PATERNO_ALUMNO.HrefValue = ""

			' MATERNO ALUMNO
			BajarDicomPagare.MATERNO_ALUMNO.HrefValue = ""

			' MAIL_ ALUMNO
			BajarDicomPagare.MAIL__ALUMNO.HrefValue = ""

			' numero_ pagare
			BajarDicomPagare.numero__pagare.HrefValue = ""

			' Documento
			BajarDicomPagare.Documento.HrefValue = ""

			' ANO  ORIGEN DEUDA
			BajarDicomPagare.ANO__ORIGEN_DEUDA.HrefValue = ""

			' NUMERO DE CUOTA
			BajarDicomPagare.NUMERO_DE_CUOTA.HrefValue = ""

			' Num TOTAL Cuotas
			BajarDicomPagare.Num_TOTAL_Cuotas.HrefValue = ""

			' MONTO INICIAL
			BajarDicomPagare.MONTO_INICIAL.HrefValue = ""

			' SALDO PENDIENTE
			BajarDicomPagare.SALDO_PENDIENTE.HrefValue = ""

			' FECHA VENCIMIENTO CUOTA
			BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.HrefValue = ""

			' Call Row_Rendered event
			BajarDicomPagare.Row_Rendered()
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

			' Field ANO  ORIGEN DEUDA
			sSelect = "SELECT DISTINCT [ANO  ORIGEN DEUDA] FROM " + BajarDicomPagare.SqlFrom
			sOrderBy = "[ANO  ORIGEN DEUDA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, BajarDicomPagare.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NUMERO DE CUOTA
			sSelect = "SELECT DISTINCT [NUMERO DE CUOTA] FROM " + BajarDicomPagare.SqlFrom
			sOrderBy = "[NUMERO DE CUOTA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, BajarDicomPagare.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			BajarDicomPagare.NUMERO_DE_CUOTA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field rut
				SetSessionFilterValues(BajarDicomPagare.rut)

				' Field Nombre_ alumno
				SetSessionFilterValues(BajarDicomPagare.Nombre__alumno)

				' Field PATERNO ALUMNO
				SetSessionFilterValues(BajarDicomPagare.PATERNO_ALUMNO)

				' Field MATERNO ALUMNO
				SetSessionFilterValues(BajarDicomPagare.MATERNO_ALUMNO)

				' Field numero_ pagare
				SetSessionFilterValues(BajarDicomPagare.numero__pagare)

				' Field ANO  ORIGEN DEUDA
				SetSessionDropDownValue(BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownValue, BajarDicomPagare.ANO__ORIGEN_DEUDA)

				' Field NUMERO DE CUOTA
				SetSessionDropDownValue(BajarDicomPagare.NUMERO_DE_CUOTA.DropDownValue, BajarDicomPagare.NUMERO_DE_CUOTA)

				' Field FECHA VENCIMIENTO CUOTA
				SetSessionFilterValues(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA)
			bSetupFilter = True ' Set up filter required
		Else

				' Field rut
				If (GetFilterValues(BajarDicomPagare.rut)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Nombre_ alumno
				If (GetFilterValues(BajarDicomPagare.Nombre__alumno)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO ALUMNO
				If (GetFilterValues(BajarDicomPagare.PATERNO_ALUMNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO ALUMNO
				If (GetFilterValues(BajarDicomPagare.MATERNO_ALUMNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field numero_ pagare
				If (GetFilterValues(BajarDicomPagare.numero__pagare)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ANO  ORIGEN DEUDA
				If (GetDropDownValue(BajarDicomPagare.ANO__ORIGEN_DEUDA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownValue) Then
					If Not ew_SameStr(BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_BajarDicomPagare_ANO__ORIGEN_DEUDA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field NUMERO DE CUOTA
				If (GetDropDownValue(BajarDicomPagare.NUMERO_DE_CUOTA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(BajarDicomPagare.NUMERO_DE_CUOTA.DropDownValue) Then
					If Not ew_SameStr(BajarDicomPagare.NUMERO_DE_CUOTA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_BajarDicomPagare_NUMERO_DE_CUOTA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field FECHA VENCIMIENTO CUOTA
				If (GetFilterValues(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA)) Then
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

			' Field rut
			GetSessionFilterValues(BajarDicomPagare.rut)

			' Field Nombre_ alumno
			GetSessionFilterValues(BajarDicomPagare.Nombre__alumno)

			' Field PATERNO ALUMNO
			GetSessionFilterValues(BajarDicomPagare.PATERNO_ALUMNO)

			' Field MATERNO ALUMNO
			GetSessionFilterValues(BajarDicomPagare.MATERNO_ALUMNO)

			' Field numero_ pagare
			GetSessionFilterValues(BajarDicomPagare.numero__pagare)

			' Field ANO  ORIGEN DEUDA
			GetSessionDropDownValue(BajarDicomPagare.ANO__ORIGEN_DEUDA)

			' Field NUMERO DE CUOTA
			GetSessionDropDownValue(BajarDicomPagare.NUMERO_DE_CUOTA)

			' Field FECHA VENCIMIENTO CUOTA
			GetSessionFilterValues(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA)
		End If

		' Call page filter validated event
		BajarDicomPagare.Page_FilterValidated()

		' Build SQL
		' Field rut

		BuildExtendedFilter(BajarDicomPagare.rut, sFilter)

		' Field Nombre_ alumno
		BuildExtendedFilter(BajarDicomPagare.Nombre__alumno, sFilter)

		' Field PATERNO ALUMNO
		BuildExtendedFilter(BajarDicomPagare.PATERNO_ALUMNO, sFilter)

		' Field MATERNO ALUMNO
		BuildExtendedFilter(BajarDicomPagare.MATERNO_ALUMNO, sFilter)

		' Field numero_ pagare
		BuildExtendedFilter(BajarDicomPagare.numero__pagare, sFilter)

		' Field ANO  ORIGEN DEUDA
		BuildDropDownFilter(BajarDicomPagare.ANO__ORIGEN_DEUDA, sFilter, "")

		' Field NUMERO DE CUOTA
		BuildDropDownFilter(BajarDicomPagare.NUMERO_DE_CUOTA, sFilter, "")

		' Field FECHA VENCIMIENTO CUOTA
		BuildExtendedFilter(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA, sFilter)

		' Save parms to Session
		' Field rut

		SetSessionFilterValues(BajarDicomPagare.rut)

		' Field Nombre_ alumno
		SetSessionFilterValues(BajarDicomPagare.Nombre__alumno)

		' Field PATERNO ALUMNO
		SetSessionFilterValues(BajarDicomPagare.PATERNO_ALUMNO)

		' Field MATERNO ALUMNO
		SetSessionFilterValues(BajarDicomPagare.MATERNO_ALUMNO)

		' Field numero_ pagare
		SetSessionFilterValues(BajarDicomPagare.numero__pagare)

		' Field ANO  ORIGEN DEUDA
		SetSessionDropDownValue(BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownValue, BajarDicomPagare.ANO__ORIGEN_DEUDA)

		' Field NUMERO DE CUOTA
		SetSessionDropDownValue(BajarDicomPagare.NUMERO_DE_CUOTA.DropDownValue, BajarDicomPagare.NUMERO_DE_CUOTA)

		' Field FECHA VENCIMIENTO CUOTA
		SetSessionFilterValues(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA)

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
		If ew_Session("sv_BajarDicomPagare_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_BajarDicomPagare_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_BajarDicomPagare_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_BajarDicomPagare_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_BajarDicomPagare_" + parm)
		End If
		If ew_Session("so1_BajarDicomPagare_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_BajarDicomPagare_" + parm))
		End If
		If ew_Session("sc_BajarDicomPagare_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_BajarDicomPagare_" + parm))
		End If
		If ew_Session("sv2_BajarDicomPagare_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_BajarDicomPagare_" + parm)
		End If
		If ew_Session("so2_BajarDicomPagare_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_BajarDicomPagare_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_BajarDicomPagare_" + parm) = fld.SearchValue
		ew_Session("so1_BajarDicomPagare_" + parm) = fld.SearchOperator
		ew_Session("sc_BajarDicomPagare_" + parm) = fld.SearchCondition
		ew_Session("sv2_BajarDicomPagare_" + parm) = fld.SearchValue2
		ew_Session("so2_BajarDicomPagare_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_BajarDicomPagare_" + parm) = ""
		ew_Session("so1_BajarDicomPagare_" + parm) = "="
		ew_Session("sc_BajarDicomPagare_" + parm) = "AND"
		ew_Session("sv2_BajarDicomPagare_" + parm) = ""
		ew_Session("so2_BajarDicomPagare_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(BajarDicomPagare.rut.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= BajarDicomPagare.rut.FldErrMsg()
		End If
		If Not ewrpt_CheckNumber(Convert.ToString(BajarDicomPagare.numero__pagare.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= BajarDicomPagare.numero__pagare.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.FldErrMsg()
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
		ew_Session("sel_BajarDicomPagare_" & parm) = ""
		ew_Session("rf_BajarDicomPagare_" & parm) = ""
		ew_Session("rt_BajarDicomPagare_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = BajarDicomPagare.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_BajarDicomPagare_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_BajarDicomPagare_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_BajarDicomPagare_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field ANO  ORIGEN DEUDA

			BajarDicomPagare.ANO__ORIGEN_DEUDA.DefaultDropDownValue = EWRPT_INIT_VALUE
			BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownValue = BajarDicomPagare.ANO__ORIGEN_DEUDA.DefaultDropDownValue

			' Field NUMERO DE CUOTA
			BajarDicomPagare.NUMERO_DE_CUOTA.DefaultDropDownValue = EWRPT_INIT_VALUE
			BajarDicomPagare.NUMERO_DE_CUOTA.DropDownValue = BajarDicomPagare.NUMERO_DE_CUOTA.DefaultDropDownValue

		' Set up default values for extended filters
			' Field rut

			SetDefaultExtFilter(BajarDicomPagare.rut, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(BajarDicomPagare.rut)	

			' Field Nombre_ alumno
			SetDefaultExtFilter(BajarDicomPagare.Nombre__alumno, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(BajarDicomPagare.Nombre__alumno)	

			' Field PATERNO ALUMNO
			SetDefaultExtFilter(BajarDicomPagare.PATERNO_ALUMNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(BajarDicomPagare.PATERNO_ALUMNO)	

			' Field MATERNO ALUMNO
			SetDefaultExtFilter(BajarDicomPagare.MATERNO_ALUMNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(BajarDicomPagare.MATERNO_ALUMNO)	

			' Field numero_ pagare
			SetDefaultExtFilter(BajarDicomPagare.numero__pagare, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(BajarDicomPagare.numero__pagare)	

			' Field FECHA VENCIMIENTO CUOTA
			SetDefaultExtFilter(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check rut extended filter
		If (TextFilterApplied(BajarDicomPagare.rut)) Then bFilterExist = True

		' Check Nombre_ alumno extended filter
		If (TextFilterApplied(BajarDicomPagare.Nombre__alumno)) Then bFilterExist = True

		' Check PATERNO ALUMNO extended filter
		If (TextFilterApplied(BajarDicomPagare.PATERNO_ALUMNO)) Then bFilterExist = True

		' Check MATERNO ALUMNO extended filter
		If (TextFilterApplied(BajarDicomPagare.MATERNO_ALUMNO)) Then bFilterExist = True

		' Check numero_ pagare extended filter
		If (TextFilterApplied(BajarDicomPagare.numero__pagare)) Then bFilterExist = True

		' Check ANO  ORIGEN DEUDA dropdown filter
		If (NonTextFilterApplied(BajarDicomPagare.ANO__ORIGEN_DEUDA)) Then bFilterExist = True

		' Check NUMERO DE CUOTA dropdown filter
		If (NonTextFilterApplied(BajarDicomPagare.NUMERO_DE_CUOTA)) Then bFilterExist = True

		' Check FECHA VENCIMIENTO CUOTA extended filter
		If (TextFilterApplied(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field rut
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(BajarDicomPagare.rut, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= BajarDicomPagare.rut.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Nombre_ alumno
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(BajarDicomPagare.Nombre__alumno, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= BajarDicomPagare.Nombre__alumno.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO ALUMNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(BajarDicomPagare.PATERNO_ALUMNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= BajarDicomPagare.PATERNO_ALUMNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO ALUMNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(BajarDicomPagare.MATERNO_ALUMNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= BajarDicomPagare.MATERNO_ALUMNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field numero_ pagare
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(BajarDicomPagare.numero__pagare, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= BajarDicomPagare.numero__pagare.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO  ORIGEN DEUDA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(BajarDicomPagare.ANO__ORIGEN_DEUDA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= BajarDicomPagare.ANO__ORIGEN_DEUDA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NUMERO DE CUOTA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(BajarDicomPagare.NUMERO_DE_CUOTA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= BajarDicomPagare.NUMERO_DE_CUOTA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECHA VENCIMIENTO CUOTA
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.FldCaption() & "<br>"
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
				BajarDicomPagare.OrderBy = ""
				BajarDicomPagare.StartGroup = 1
				BajarDicomPagare.rut.Sort = ""
				BajarDicomPagare.DIG.Sort = ""
				BajarDicomPagare.Nombre__alumno.Sort = ""
				BajarDicomPagare.PATERNO_ALUMNO.Sort = ""
				BajarDicomPagare.MATERNO_ALUMNO.Sort = ""
				BajarDicomPagare.MAIL__ALUMNO.Sort = ""
				BajarDicomPagare.numero__pagare.Sort = ""
				BajarDicomPagare.Documento.Sort = ""
				BajarDicomPagare.ANO__ORIGEN_DEUDA.Sort = ""
				BajarDicomPagare.NUMERO_DE_CUOTA.Sort = ""
				BajarDicomPagare.Num_TOTAL_Cuotas.Sort = ""
				BajarDicomPagare.MONTO_INICIAL.Sort = ""
				BajarDicomPagare.SALDO_PENDIENTE.Sort = ""
				BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			BajarDicomPagare.CurrentOrder = ew_Get("order")
			BajarDicomPagare.CurrentOrderType = ew_Get("ordertype")
			sSortSql = BajarDicomPagare.SortSql()
			BajarDicomPagare.OrderBy = sSortSql
			BajarDicomPagare.StartGroup = 1
		End If
		Return BajarDicomPagare.OrderBy
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
		BajarDicomPagare_summary = New crBajarDicomPagare_summary(Me)
		BajarDicomPagare_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		BajarDicomPagare_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (BajarDicomPagare_summary IsNot Nothing) Then BajarDicomPagare_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (BajarDicomPagare.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var BajarDicomPagare_summary = new ewrpt_Page("BajarDicomPagare_summary");
// page properties
BajarDicomPagare_summary.PageID = "summary"; // page ID
BajarDicomPagare_summary.FormID = "fBajarDicomPagaresummaryfilter"; // form ID
var EWRPT_PAGE_ID = BajarDicomPagare_summary.PageID;
// extend page with ValidateForm function
BajarDicomPagare_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_rut;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(BajarDicomPagare.rut.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_numero__pagare;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(BajarDicomPagare.numero__pagare.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_FECHA_VENCIMIENTO_CUOTA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
BajarDicomPagare_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
BajarDicomPagare_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
BajarDicomPagare_summary.ValidateRequired = false; // no JavaScript validation
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
<% BajarDicomPagare_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (BajarDicomPagare.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (BajarDicomPagare.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= BajarDicomPagare.TableCaption() %></h1></div>
<% If (BajarDicomPagare.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= BajarDicomPagare_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% If (BajarDicomPagare_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
</div><br><br>
<% BajarDicomPagare_summary.ShowMessage() %>
<% If (BajarDicomPagare.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (BajarDicomPagare.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (BajarDicomPagare.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (BajarDicomPagare.FilterPanelOption = 2 OrElse (BajarDicomPagare.FilterPanelOption = 3 AndAlso BajarDicomPagare_summary.FilterApplied) OrElse BajarDicomPagare_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="BajarDicomPagaresmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fBajarDicomPagaresummaryfilter" id="fBajarDicomPagaresummaryfilter" action="BajarDicomPagaresmry.aspx" class="ewForm" onsubmit="return BajarDicomPagare_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= BajarDicomPagare.rut.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_rut" id="sv1_rut" size="30" value="<%= ew_HtmlEncode(BajarDicomPagare.rut.SearchValue) %>"<%= IIf(BajarDicomPagare_summary.ClearExtFilter = "BajarDicomPagare_rut", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= BajarDicomPagare.Nombre__alumno.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Nombre__alumno" id="sv1_Nombre__alumno" size="30" maxlength="255" value="<%= ew_HtmlEncode(BajarDicomPagare.Nombre__alumno.SearchValue) %>"<%= IIf(BajarDicomPagare_summary.ClearExtFilter = "BajarDicomPagare_Nombre__alumno", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= BajarDicomPagare.PATERNO_ALUMNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO_ALUMNO" id="sv1_PATERNO_ALUMNO" size="30" maxlength="255" value="<%= ew_HtmlEncode(BajarDicomPagare.PATERNO_ALUMNO.SearchValue) %>"<%= IIf(BajarDicomPagare_summary.ClearExtFilter = "BajarDicomPagare_PATERNO_ALUMNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= BajarDicomPagare.MATERNO_ALUMNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO_ALUMNO" id="sv1_MATERNO_ALUMNO" size="30" maxlength="255" value="<%= ew_HtmlEncode(BajarDicomPagare.MATERNO_ALUMNO.SearchValue) %>"<%= IIf(BajarDicomPagare_summary.ClearExtFilter = "BajarDicomPagare_MATERNO_ALUMNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= BajarDicomPagare.numero__pagare.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_numero__pagare" id="sv1_numero__pagare" size="30" value="<%= ew_HtmlEncode(BajarDicomPagare.numero__pagare.SearchValue) %>"<%= IIf(BajarDicomPagare_summary.ClearExtFilter = "BajarDicomPagare_numero__pagare", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= BajarDicomPagare.ANO__ORIGEN_DEUDA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO__ORIGEN_DEUDA" id="sv_ANO__ORIGEN_DEUDA"<%= IIf(BajarDicomPagare_summary.ClearExtFilter = "BajarDicomPagare_ANO__ORIGEN_DEUDA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = BajarDicomPagare.ANO__ORIGEN_DEUDA.CustomFilters.Count + BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In BajarDicomPagare.ANO__ORIGEN_DEUDA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO  ORIGEN DEUDA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(BajarDicomPagare.ANO__ORIGEN_DEUDA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= BajarDicomPagare.NUMERO_DE_CUOTA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NUMERO_DE_CUOTA" id="sv_NUMERO_DE_CUOTA"<%= IIf(BajarDicomPagare_summary.ClearExtFilter = "BajarDicomPagare_NUMERO_DE_CUOTA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(BajarDicomPagare.NUMERO_DE_CUOTA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = BajarDicomPagare.NUMERO_DE_CUOTA.CustomFilters.Count + BajarDicomPagare.NUMERO_DE_CUOTA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In BajarDicomPagare.NUMERO_DE_CUOTA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NUMERO DE CUOTA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(BajarDicomPagare.NUMERO_DE_CUOTA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In BajarDicomPagare.NUMERO_DE_CUOTA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(BajarDicomPagare.NUMERO_DE_CUOTA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECHA_VENCIMIENTO_CUOTA" id="sv1_FECHA_VENCIMIENTO_CUOTA" value="<%= ew_HtmlEncode(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.SearchValue) %>"<%= IIf(BajarDicomPagare_summary.ClearExtFilter = "BajarDicomPagare_FECHA_VENCIMIENTO_CUOTA", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv1_FECHA_VENCIMIENTO_CUOTA" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv1_FECHA_VENCIMIENTO_CUOTA", // ID of the input field
ifFormat : "%d/%m/%Y", // the date format
button : "csv1_FECHA_VENCIMIENTO_CUOTA" // ID of the button
})
</script>
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
<% If (BajarDicomPagare.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% BajarDicomPagare_summary.ShowFilterList() %>
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
If (BajarDicomPagare.ExportAll AndAlso ew_NotEmpty(BajarDicomPagare.Export)) Then
	BajarDicomPagare_summary.StopGrp = BajarDicomPagare_summary.TotalGrps
Else
	BajarDicomPagare_summary.StopGrp = BajarDicomPagare_summary.StartGrp + BajarDicomPagare_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (BajarDicomPagare_summary.StopGrp > BajarDicomPagare_summary.TotalGrps) Then
	BajarDicomPagare_summary.StopGrp = BajarDicomPagare_summary.TotalGrps
End If
BajarDicomPagare_summary.RecCount = 0

' Get first row
If (BajarDicomPagare_summary.TotalGrps > 0) Then
	BajarDicomPagare_summary.GetRow() ' ASPXRPT
	BajarDicomPagare_summary.GrpCount = 1
End If
While ((BajarDicomPagare_summary.HasRow AndAlso BajarDicomPagare_summary.GrpIndex < BajarDicomPagare_summary.StopGrp) OrElse BajarDicomPagare_summary.ShowFirstHeader)

	' Show header
	If (BajarDicomPagare_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.rut.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.rut))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.rut.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.rut) %>',0);"><%= BajarDicomPagare.rut.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.rut.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.rut.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.DIG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.DIG))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.DIG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.DIG) %>',0);"><%= BajarDicomPagare.DIG.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.DIG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.DIG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.Nombre__alumno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.Nombre__alumno))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.Nombre__alumno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.Nombre__alumno) %>',0);"><%= BajarDicomPagare.Nombre__alumno.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.Nombre__alumno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.Nombre__alumno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.PATERNO_ALUMNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.PATERNO_ALUMNO))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.PATERNO_ALUMNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.PATERNO_ALUMNO) %>',0);"><%= BajarDicomPagare.PATERNO_ALUMNO.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.PATERNO_ALUMNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.PATERNO_ALUMNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.MATERNO_ALUMNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.MATERNO_ALUMNO))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.MATERNO_ALUMNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.MATERNO_ALUMNO) %>',0);"><%= BajarDicomPagare.MATERNO_ALUMNO.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.MATERNO_ALUMNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.MATERNO_ALUMNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.MAIL__ALUMNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.MAIL__ALUMNO))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.MAIL__ALUMNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.MAIL__ALUMNO) %>',0);"><%= BajarDicomPagare.MAIL__ALUMNO.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.MAIL__ALUMNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.MAIL__ALUMNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.numero__pagare.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.numero__pagare))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.numero__pagare.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.numero__pagare) %>',0);"><%= BajarDicomPagare.numero__pagare.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.numero__pagare.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.numero__pagare.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.Documento.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.Documento))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.Documento.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.Documento) %>',0);"><%= BajarDicomPagare.Documento.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.Documento.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.Documento.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.ANO__ORIGEN_DEUDA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.ANO__ORIGEN_DEUDA))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.ANO__ORIGEN_DEUDA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.ANO__ORIGEN_DEUDA) %>',0);"><%= BajarDicomPagare.ANO__ORIGEN_DEUDA.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.ANO__ORIGEN_DEUDA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.ANO__ORIGEN_DEUDA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.NUMERO_DE_CUOTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.NUMERO_DE_CUOTA))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.NUMERO_DE_CUOTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.NUMERO_DE_CUOTA) %>',0);"><%= BajarDicomPagare.NUMERO_DE_CUOTA.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.NUMERO_DE_CUOTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.NUMERO_DE_CUOTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.Num_TOTAL_Cuotas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.Num_TOTAL_Cuotas))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.Num_TOTAL_Cuotas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.Num_TOTAL_Cuotas) %>',0);"><%= BajarDicomPagare.Num_TOTAL_Cuotas.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.Num_TOTAL_Cuotas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.Num_TOTAL_Cuotas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.MONTO_INICIAL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.MONTO_INICIAL))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.MONTO_INICIAL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.MONTO_INICIAL) %>',0);"><%= BajarDicomPagare.MONTO_INICIAL.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.MONTO_INICIAL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.MONTO_INICIAL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.SALDO_PENDIENTE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.SALDO_PENDIENTE))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.SALDO_PENDIENTE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.SALDO_PENDIENTE) %>',0);"><%= BajarDicomPagare.SALDO_PENDIENTE.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.SALDO_PENDIENTE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.SALDO_PENDIENTE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(BajarDicomPagare.Export)) Then %>
<%= BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(BajarDicomPagare.SortUrl(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA))) Then %>
		<td style="vertical-align: bottom;"><%= BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= BajarDicomPagare.SortUrl(BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA) %>',0);"><%= BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.FldCaption() %></td><td style="width: 10px;">
		<% If (BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		BajarDicomPagare_summary.ShowFirstHeader = False
	End If
	BajarDicomPagare_summary.RecCount += 1

		' Render detail row
		BajarDicomPagare.ResetCSS()
		BajarDicomPagare.RowType = EWRPT_ROWTYPE_DETAIL
		BajarDicomPagare_summary.RenderRow()
%>
	<tr<%= BajarDicomPagare.RowAttributes() %>>
		<td<%= BajarDicomPagare.rut.CellAttributes %>>
<div<%= BajarDicomPagare.rut.ViewAttributes%>><%= BajarDicomPagare.rut.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.DIG.CellAttributes %>>
<div<%= BajarDicomPagare.DIG.ViewAttributes%>><%= BajarDicomPagare.DIG.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.Nombre__alumno.CellAttributes %>>
<div<%= BajarDicomPagare.Nombre__alumno.ViewAttributes%>><%= BajarDicomPagare.Nombre__alumno.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.PATERNO_ALUMNO.CellAttributes %>>
<div<%= BajarDicomPagare.PATERNO_ALUMNO.ViewAttributes%>><%= BajarDicomPagare.PATERNO_ALUMNO.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.MATERNO_ALUMNO.CellAttributes %>>
<div<%= BajarDicomPagare.MATERNO_ALUMNO.ViewAttributes%>><%= BajarDicomPagare.MATERNO_ALUMNO.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.MAIL__ALUMNO.CellAttributes %>>
<div<%= BajarDicomPagare.MAIL__ALUMNO.ViewAttributes%>><%= BajarDicomPagare.MAIL__ALUMNO.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.numero__pagare.CellAttributes %>>
<div<%= BajarDicomPagare.numero__pagare.ViewAttributes%>><%= BajarDicomPagare.numero__pagare.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.Documento.CellAttributes %>>
<div<%= BajarDicomPagare.Documento.ViewAttributes%>><%= BajarDicomPagare.Documento.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.ANO__ORIGEN_DEUDA.CellAttributes %>>
<div<%= BajarDicomPagare.ANO__ORIGEN_DEUDA.ViewAttributes%>><%= BajarDicomPagare.ANO__ORIGEN_DEUDA.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.NUMERO_DE_CUOTA.CellAttributes %>>
<div<%= BajarDicomPagare.NUMERO_DE_CUOTA.ViewAttributes%>><%= BajarDicomPagare.NUMERO_DE_CUOTA.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.Num_TOTAL_Cuotas.CellAttributes %>>
<div<%= BajarDicomPagare.Num_TOTAL_Cuotas.ViewAttributes%>><%= BajarDicomPagare.Num_TOTAL_Cuotas.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.MONTO_INICIAL.CellAttributes %>>
<div<%= BajarDicomPagare.MONTO_INICIAL.ViewAttributes%>><%= BajarDicomPagare.MONTO_INICIAL.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.SALDO_PENDIENTE.CellAttributes %>>
<div<%= BajarDicomPagare.SALDO_PENDIENTE.ViewAttributes%>><%= BajarDicomPagare.SALDO_PENDIENTE.ListViewValue%></div>
</td>
		<td<%= BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.CellAttributes %>>
<div<%= BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.ViewAttributes%>><%= BajarDicomPagare.FECHA_VENCIMIENTO_CUOTA.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		BajarDicomPagare_summary.AccumulateSummary()

		' Get next record
		BajarDicomPagare_summary.GetRow() ' ASPXRPT
		BajarDicomPagare_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (BajarDicomPagare_summary.TotalGrps > 0) Then
	BajarDicomPagare.ResetCSS()
	BajarDicomPagare.RowType = EWRPT_ROWTYPE_TOTAL
	BajarDicomPagare.RowTotalType = EWRPT_ROWTOTAL_GRAND
	BajarDicomPagare.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	BajarDicomPagare.RowAttrs("class") = "ewRptGrandSummary"
	BajarDicomPagare_summary.RenderRow()
%>
	<!-- tr><td colspan="14"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= BajarDicomPagare.RowAttributes() %>><td colspan="14"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(BajarDicomPagare_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (BajarDicomPagare.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If BajarDicomPagare_summary.Pager Is Nothing Then BajarDicomPagare_summary.Pager = New cPrevNextPager(BajarDicomPagare_summary.StartGrp, BajarDicomPagare_summary.DisplayGrps, BajarDicomPagare_summary.TotalGrps) %>
<% If BajarDicomPagare_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If BajarDicomPagare_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="BajarDicomPagaresmry.aspx?start=<%= BajarDicomPagare_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If BajarDicomPagare_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="BajarDicomPagaresmry.aspx?start=<%= BajarDicomPagare_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= BajarDicomPagare_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If BajarDicomPagare_summary.Pager.NextButton.Enabled Then %>
	<td><a href="BajarDicomPagaresmry.aspx?start=<%= BajarDicomPagare_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If BajarDicomPagare_summary.Pager.LastButton.Enabled Then %>
	<td><a href="BajarDicomPagaresmry.aspx?start=<%= BajarDicomPagare_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= BajarDicomPagare_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= BajarDicomPagare_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= BajarDicomPagare_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= BajarDicomPagare_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If BajarDicomPagare_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (BajarDicomPagare_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If BajarDicomPagare_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If BajarDicomPagare_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If BajarDicomPagare_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (BajarDicomPagare.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (BajarDicomPagare.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (BajarDicomPagare.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% BajarDicomPagare_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (BajarDicomPagare.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
