<%@ Page ClassName="Report1smry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public Report1 As crReport1 = Nothing

	'
	' Table class (for Report1)
	'
	Public Class crReport1
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
				Return "Report1"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Report1"
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

		Public Nombre_alumno As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public FONOPROC As crField

		Public FONOACT As crField

		Public MAIL As crField

		Public Carrera As crField

		Public CODCARR As crField

		Public DESCRIPCION As crField

		Public numero_pagare As crField

		Public CodDoc As crField

		Public Documento As crField

		Public ANO As crField

		Public PERIODO As crField

		Public CUOTA As crField

		Public NumCuotas As crField

		Public MONTO As crField

		Public SALDO As crField

		Public FECVEN As crField

		Public ESTACAD As crField

		Public TIPOSITU As crField

		Public FECDEUDA As crField

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

			' rut
			rut = new crField("Report1", "Report1", "x_rut", "rut", "[rut]", 200, EWRPT_DATATYPE_STRING, -1)
			rut.Page = APage
			rut.ParentPage = APage.ParentPage
			Fields.Add("rut", rut)
			rut.DateFilter = ""
			rut.SqlSelect = ""
			rut.SqlOrderBy = ""

			' DIG
			DIG = new crField("Report1", "Report1", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
			DIG.Page = APage
			DIG.ParentPage = APage.ParentPage
			Fields.Add("DIG", DIG)
			DIG.DateFilter = ""
			DIG.SqlSelect = ""
			DIG.SqlOrderBy = ""

			' Nombre_alumno
			Nombre_alumno = new crField("Report1", "Report1", "x_Nombre_alumno", "Nombre_alumno", "[Nombre_alumno]", 200, EWRPT_DATATYPE_STRING, -1)
			Nombre_alumno.Page = APage
			Nombre_alumno.ParentPage = APage.ParentPage
			Fields.Add("Nombre_alumno", Nombre_alumno)
			Nombre_alumno.DateFilter = ""
			Nombre_alumno.SqlSelect = ""
			Nombre_alumno.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Report1", "Report1", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Report1", "Report1", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' FONOPROC
			FONOPROC = new crField("Report1", "Report1", "x_FONOPROC", "FONOPROC", "[FONOPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOPROC.Page = APage
			FONOPROC.ParentPage = APage.ParentPage
			Fields.Add("FONOPROC", FONOPROC)
			FONOPROC.DateFilter = ""
			FONOPROC.SqlSelect = ""
			FONOPROC.SqlOrderBy = ""

			' FONOACT
			FONOACT = new crField("Report1", "Report1", "x_FONOACT", "FONOACT", "[FONOACT]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOACT.Page = APage
			FONOACT.ParentPage = APage.ParentPage
			Fields.Add("FONOACT", FONOACT)
			FONOACT.DateFilter = ""
			FONOACT.SqlSelect = ""
			FONOACT.SqlOrderBy = ""

			' MAIL
			MAIL = new crField("Report1", "Report1", "x_MAIL", "MAIL", "[MAIL]", 200, EWRPT_DATATYPE_STRING, -1)
			MAIL.Page = APage
			MAIL.ParentPage = APage.ParentPage
			Fields.Add("MAIL", MAIL)
			MAIL.DateFilter = ""
			MAIL.SqlSelect = ""
			MAIL.SqlOrderBy = ""

			' Carrera
			Carrera = new crField("Report1", "Report1", "x_Carrera", "Carrera", "[Carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			Carrera.Page = APage
			Carrera.ParentPage = APage.ParentPage
			Fields.Add("Carrera", Carrera)
			Carrera.DateFilter = ""
			Carrera.SqlSelect = ""
			Carrera.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Report1", "Report1", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' DESCRIPCION
			DESCRIPCION = new crField("Report1", "Report1", "x_DESCRIPCION", "DESCRIPCION", "[DESCRIPCION]", 200, EWRPT_DATATYPE_STRING, -1)
			DESCRIPCION.Page = APage
			DESCRIPCION.ParentPage = APage.ParentPage
			Fields.Add("DESCRIPCION", DESCRIPCION)
			DESCRIPCION.DateFilter = ""
			DESCRIPCION.SqlSelect = ""
			DESCRIPCION.SqlOrderBy = ""

			' numero_pagare
			numero_pagare = new crField("Report1", "Report1", "x_numero_pagare", "numero_pagare", "[numero_pagare]", 131, EWRPT_DATATYPE_NUMBER, -1)
			numero_pagare.Page = APage
			numero_pagare.ParentPage = APage.ParentPage
			numero_pagare.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("numero_pagare", numero_pagare)
			numero_pagare.DateFilter = ""
			numero_pagare.SqlSelect = ""
			numero_pagare.SqlOrderBy = ""

			' CodDoc
			CodDoc = new crField("Report1", "Report1", "x_CodDoc", "CodDoc", "[CodDoc]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CodDoc.Page = APage
			CodDoc.ParentPage = APage.ParentPage
			CodDoc.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CodDoc", CodDoc)
			CodDoc.DateFilter = ""
			CodDoc.SqlSelect = ""
			CodDoc.SqlOrderBy = ""

			' Documento
			Documento = new crField("Report1", "Report1", "x_Documento", "Documento", "[Documento]", 200, EWRPT_DATATYPE_STRING, -1)
			Documento.Page = APage
			Documento.ParentPage = APage.ParentPage
			Fields.Add("Documento", Documento)
			Documento.DateFilter = ""
			Documento.SqlSelect = ""
			Documento.SqlOrderBy = ""

			' ANO
			ANO = new crField("Report1", "Report1", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("Report1", "Report1", "x_PERIODO", "PERIODO", "[PERIODO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			PERIODO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' CUOTA
			CUOTA = new crField("Report1", "Report1", "x_CUOTA", "CUOTA", "[CUOTA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CUOTA.Page = APage
			CUOTA.ParentPage = APage.ParentPage
			CUOTA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CUOTA", CUOTA)
			CUOTA.DateFilter = ""
			CUOTA.SqlSelect = ""
			CUOTA.SqlOrderBy = ""

			' NumCuotas
			NumCuotas = new crField("Report1", "Report1", "x_NumCuotas", "NumCuotas", "[NumCuotas]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NumCuotas.Page = APage
			NumCuotas.ParentPage = APage.ParentPage
			NumCuotas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NumCuotas", NumCuotas)
			NumCuotas.DateFilter = ""
			NumCuotas.SqlSelect = ""
			NumCuotas.SqlOrderBy = ""

			' MONTO
			MONTO = new crField("Report1", "Report1", "x_MONTO", "MONTO", "[MONTO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			MONTO.Page = APage
			MONTO.ParentPage = APage.ParentPage
			MONTO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("MONTO", MONTO)
			MONTO.DateFilter = ""
			MONTO.SqlSelect = ""
			MONTO.SqlOrderBy = ""

			' SALDO
			SALDO = new crField("Report1", "Report1", "x_SALDO", "SALDO", "[SALDO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			SALDO.Page = APage
			SALDO.ParentPage = APage.ParentPage
			SALDO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("SALDO", SALDO)
			SALDO.DateFilter = ""
			SALDO.SqlSelect = ""
			SALDO.SqlOrderBy = ""

			' FECVEN
			FECVEN = new crField("Report1", "Report1", "x_FECVEN", "FECVEN", "[FECVEN]", 135, EWRPT_DATATYPE_DATE, 7)
			FECVEN.Page = APage
			FECVEN.ParentPage = APage.ParentPage
			FECVEN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECVEN", FECVEN)
			FECVEN.DateFilter = ""
			FECVEN.SqlSelect = ""
			FECVEN.SqlOrderBy = ""

			' ESTACAD
			ESTACAD = new crField("Report1", "Report1", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTACAD.Page = APage
			ESTACAD.ParentPage = APage.ParentPage
			Fields.Add("ESTACAD", ESTACAD)
			ESTACAD.DateFilter = ""
			ESTACAD.SqlSelect = ""
			ESTACAD.SqlOrderBy = ""

			' TIPOSITU
			TIPOSITU = new crField("Report1", "Report1", "x_TIPOSITU", "TIPOSITU", "[TIPOSITU]", 131, EWRPT_DATATYPE_NUMBER, -1)
			TIPOSITU.Page = APage
			TIPOSITU.ParentPage = APage.ParentPage
			TIPOSITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("TIPOSITU", TIPOSITU)
			TIPOSITU.DateFilter = ""
			TIPOSITU.SqlSelect = ""
			TIPOSITU.SqlOrderBy = ""

			' FECDEUDA
			FECDEUDA = new crField("Report1", "Report1", "x_FECDEUDA", "FECDEUDA", "[FECDEUDA]", 135, EWRPT_DATATYPE_DATE, 7)
			FECDEUDA.Page = APage
			FECDEUDA.ParentPage = APage.ParentPage
			FECDEUDA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECDEUDA", FECDEUDA)
			FECDEUDA.DateFilter = ""
			FECDEUDA.SqlSelect = ""
			FECDEUDA.SqlOrderBy = ""
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
				Return "[SEK_DICOM_Subir_PagareGarantia]"
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
	Public Report1_summary As crReport1_summary

	'
	' Page class
	'
	Public Class crReport1_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Report1.UseTokenInUrl) Then
				sUrl &= "t=" & Report1.TableVar & "&" ' Add page token
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
			If (Report1.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Report1.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Report1.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Report1smry 
			Get
				Return CType(m_ParentPage, Report1smry)
			End Get
		End Property

		' Table object (Report1)
		Public Property Report1 As crReport1 
			Get		
				Return AspNetPage.Report1 ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crReport1)
				AspNetPage.Report1 = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Report1_summary"
			m_PageObjTypeName = "crReport1_summary"

			' Table name
			m_TableName = "Report1"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Report1)
			Report1 = New crReport1(Me)			

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
				Report1.Export = ew_Get("export")
			End If
			gsExport = Report1.Export ' Get export parameter, used in header
			gsExportFile = Report1.TableVar ' Get export file, used in header
			If (Report1.Export = "excel") Then
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

		Public Val As Object() = New Object(24) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(24) {}

		Public GrandMn As Object() = New Object(24) {}

		Public GrandMx As Object() = New Object(24) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 25 ' No. of fields
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
			Report1.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Report1.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Report1.ExportAll AndAlso ew_NotEmpty(Report1.Export)) Then
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
				Report1.numero_pagare.DbValue = Row("numero_pagare")
				Report1.rut.DbValue = Row("rut")
				Report1.DIG.DbValue = Row("DIG")
				Report1.CODCARR.DbValue = Row("CODCARR")
				Report1.Carrera.DbValue = Row("Carrera")
				Report1.CodDoc.DbValue = Row("CodDoc")
				Report1.Documento.DbValue = Row("Documento")
				Report1.ANO.DbValue = Row("ANO")
				Report1.PERIODO.DbValue = Row("PERIODO")
				Report1.CUOTA.DbValue = Row("CUOTA")
				Report1.NumCuotas.DbValue = Row("NumCuotas")
				Report1.MONTO.DbValue = Row("MONTO")
				Report1.SALDO.DbValue = Row("SALDO")
				Report1.FECVEN.DbValue = Row("FECVEN")
				Report1.PATERNO.DbValue = Row("PATERNO")
				Report1.MATERNO.DbValue = Row("MATERNO")
				Report1.Nombre_alumno.DbValue = Row("Nombre_alumno")
				Report1.MAIL.DbValue = Row("MAIL")
				Report1.ESTACAD.DbValue = Row("ESTACAD")
				Report1.TIPOSITU.DbValue = Row("TIPOSITU")
				Report1.DESCRIPCION.DbValue = Row("DESCRIPCION")
				Report1.FONOPROC.DbValue = Row("FONOPROC")
				Report1.FONOACT.DbValue = Row("FONOACT")
				Report1.FECDEUDA.DbValue = Row("FECDEUDA")
				Val(1) = Report1.rut.CurrentValue
				Val(2) = Report1.DIG.CurrentValue
				Val(3) = Report1.Nombre_alumno.CurrentValue
				Val(4) = Report1.PATERNO.CurrentValue
				Val(5) = Report1.MATERNO.CurrentValue
				Val(6) = Report1.FONOPROC.CurrentValue
				Val(7) = Report1.FONOACT.CurrentValue
				Val(8) = Report1.MAIL.CurrentValue
				Val(9) = Report1.Carrera.CurrentValue
				Val(10) = Report1.CODCARR.CurrentValue
				Val(11) = Report1.DESCRIPCION.CurrentValue
				Val(12) = Report1.numero_pagare.CurrentValue
				Val(13) = Report1.CodDoc.CurrentValue
				Val(14) = Report1.Documento.CurrentValue
				Val(15) = Report1.ANO.CurrentValue
				Val(16) = Report1.PERIODO.CurrentValue
				Val(17) = Report1.CUOTA.CurrentValue
				Val(18) = Report1.NumCuotas.CurrentValue
				Val(19) = Report1.MONTO.CurrentValue
				Val(20) = Report1.SALDO.CurrentValue
				Val(21) = Report1.FECVEN.CurrentValue
				Val(22) = Report1.ESTACAD.CurrentValue
				Val(23) = Report1.TIPOSITU.CurrentValue
				Val(24) = Report1.FECDEUDA.CurrentValue
			Else
				Report1.numero_pagare.DbValue = ""
				Report1.rut.DbValue = ""
				Report1.DIG.DbValue = ""
				Report1.CODCARR.DbValue = ""
				Report1.Carrera.DbValue = ""
				Report1.CodDoc.DbValue = ""
				Report1.Documento.DbValue = ""
				Report1.ANO.DbValue = ""
				Report1.PERIODO.DbValue = ""
				Report1.CUOTA.DbValue = ""
				Report1.NumCuotas.DbValue = ""
				Report1.MONTO.DbValue = ""
				Report1.SALDO.DbValue = ""
				Report1.FECVEN.DbValue = ""
				Report1.PATERNO.DbValue = ""
				Report1.MATERNO.DbValue = ""
				Report1.Nombre_alumno.DbValue = ""
				Report1.MAIL.DbValue = ""
				Report1.ESTACAD.DbValue = ""
				Report1.TIPOSITU.DbValue = ""
				Report1.DESCRIPCION.DbValue = ""
				Report1.FONOPROC.DbValue = ""
				Report1.FONOACT.DbValue = ""
				Report1.FECDEUDA.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Report1.numero_pagare.DbValue = dr("numero_pagare")
				Report1.rut.DbValue = dr("rut")
				Report1.DIG.DbValue = dr("DIG")
				Report1.CODCARR.DbValue = dr("CODCARR")
				Report1.Carrera.DbValue = dr("Carrera")
				Report1.CodDoc.DbValue = dr("CodDoc")
				Report1.Documento.DbValue = dr("Documento")
				Report1.ANO.DbValue = dr("ANO")
				Report1.PERIODO.DbValue = dr("PERIODO")
				Report1.CUOTA.DbValue = dr("CUOTA")
				Report1.NumCuotas.DbValue = dr("NumCuotas")
				Report1.MONTO.DbValue = dr("MONTO")
				Report1.SALDO.DbValue = dr("SALDO")
				Report1.FECVEN.DbValue = dr("FECVEN")
				Report1.PATERNO.DbValue = dr("PATERNO")
				Report1.MATERNO.DbValue = dr("MATERNO")
				Report1.Nombre_alumno.DbValue = dr("Nombre_alumno")
				Report1.MAIL.DbValue = dr("MAIL")
				Report1.ESTACAD.DbValue = dr("ESTACAD")
				Report1.TIPOSITU.DbValue = dr("TIPOSITU")
				Report1.DESCRIPCION.DbValue = dr("DESCRIPCION")
				Report1.FONOPROC.DbValue = dr("FONOPROC")
				Report1.FONOACT.DbValue = dr("FONOACT")
				Report1.FECDEUDA.DbValue = dr("FECDEUDA")
				Val(1) = Report1.rut.CurrentValue
				Val(2) = Report1.DIG.CurrentValue
				Val(3) = Report1.Nombre_alumno.CurrentValue
				Val(4) = Report1.PATERNO.CurrentValue
				Val(5) = Report1.MATERNO.CurrentValue
				Val(6) = Report1.FONOPROC.CurrentValue
				Val(7) = Report1.FONOACT.CurrentValue
				Val(8) = Report1.MAIL.CurrentValue
				Val(9) = Report1.Carrera.CurrentValue
				Val(10) = Report1.CODCARR.CurrentValue
				Val(11) = Report1.DESCRIPCION.CurrentValue
				Val(12) = Report1.numero_pagare.CurrentValue
				Val(13) = Report1.CodDoc.CurrentValue
				Val(14) = Report1.Documento.CurrentValue
				Val(15) = Report1.ANO.CurrentValue
				Val(16) = Report1.PERIODO.CurrentValue
				Val(17) = Report1.CUOTA.CurrentValue
				Val(18) = Report1.NumCuotas.CurrentValue
				Val(19) = Report1.MONTO.CurrentValue
				Val(20) = Report1.SALDO.CurrentValue
				Val(21) = Report1.FECVEN.CurrentValue
				Val(22) = Report1.ESTACAD.CurrentValue
				Val(23) = Report1.TIPOSITU.CurrentValue
				Val(24) = Report1.FECDEUDA.CurrentValue
			Else				
				Report1.numero_pagare.DbValue = ""
				Report1.rut.DbValue = ""
				Report1.DIG.DbValue = ""
				Report1.CODCARR.DbValue = ""
				Report1.Carrera.DbValue = ""
				Report1.CodDoc.DbValue = ""
				Report1.Documento.DbValue = ""
				Report1.ANO.DbValue = ""
				Report1.PERIODO.DbValue = ""
				Report1.CUOTA.DbValue = ""
				Report1.NumCuotas.DbValue = ""
				Report1.MONTO.DbValue = ""
				Report1.SALDO.DbValue = ""
				Report1.FECVEN.DbValue = ""
				Report1.PATERNO.DbValue = ""
				Report1.MATERNO.DbValue = ""
				Report1.Nombre_alumno.DbValue = ""
				Report1.MAIL.DbValue = ""
				Report1.ESTACAD.DbValue = ""
				Report1.TIPOSITU.DbValue = ""
				Report1.DESCRIPCION.DbValue = ""
				Report1.FONOPROC.DbValue = ""
				Report1.FONOACT.DbValue = ""
				Report1.FECDEUDA.DbValue = ""
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
				Report1.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Report1.StartGroup = StartGrp
				Else
					StartGrp = Report1.StartGroup
				End If
			Else
				StartGrp = Report1.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Report1.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Report1.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Report1.StartGroup = StartGrp
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
			Report1.StartGroup = StartGrp
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
				Report1.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Report1.StartGroup = StartGrp
			Else				
				If (Report1.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Report1.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Report1.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Report1.SqlSelectCount, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Report1.Row_Rendering()

			'
			' Render view codes
			'

			If (Report1.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' rut
				Report1.rut.ViewValue = Convert.ToString(Report1.rut.Summary)

				' DIG
				Report1.DIG.ViewValue = Convert.ToString(Report1.DIG.Summary)

				' Nombre_alumno
				Report1.Nombre_alumno.ViewValue = Convert.ToString(Report1.Nombre_alumno.Summary)

				' PATERNO
				Report1.PATERNO.ViewValue = Convert.ToString(Report1.PATERNO.Summary)

				' MATERNO
				Report1.MATERNO.ViewValue = Convert.ToString(Report1.MATERNO.Summary)

				' FONOPROC
				Report1.FONOPROC.ViewValue = Convert.ToString(Report1.FONOPROC.Summary)

				' FONOACT
				Report1.FONOACT.ViewValue = Convert.ToString(Report1.FONOACT.Summary)

				' MAIL
				Report1.MAIL.ViewValue = Convert.ToString(Report1.MAIL.Summary)

				' Carrera
				Report1.Carrera.ViewValue = Convert.ToString(Report1.Carrera.Summary)

				' CODCARR
				Report1.CODCARR.ViewValue = Convert.ToString(Report1.CODCARR.Summary)

				' DESCRIPCION
				Report1.DESCRIPCION.ViewValue = Convert.ToString(Report1.DESCRIPCION.Summary)

				' numero_pagare
				Report1.numero_pagare.ViewValue = Convert.ToString(Report1.numero_pagare.Summary)

				' CodDoc
				Report1.CodDoc.ViewValue = Convert.ToString(Report1.CodDoc.Summary)

				' Documento
				Report1.Documento.ViewValue = Convert.ToString(Report1.Documento.Summary)

				' ANO
				Report1.ANO.ViewValue = Convert.ToString(Report1.ANO.Summary)

				' PERIODO
				Report1.PERIODO.ViewValue = Convert.ToString(Report1.PERIODO.Summary)

				' CUOTA
				Report1.CUOTA.ViewValue = Convert.ToString(Report1.CUOTA.Summary)

				' NumCuotas
				Report1.NumCuotas.ViewValue = Convert.ToString(Report1.NumCuotas.Summary)

				' MONTO
				Report1.MONTO.ViewValue = Convert.ToString(Report1.MONTO.Summary)

				' SALDO
				Report1.SALDO.ViewValue = Convert.ToString(Report1.SALDO.Summary)

				' FECVEN
				Report1.FECVEN.ViewValue = Convert.ToString(Report1.FECVEN.Summary)
				Report1.FECVEN.ViewValue = ew_FormatDateTime(Report1.FECVEN.ViewValue, 7)

				' ESTACAD
				Report1.ESTACAD.ViewValue = Convert.ToString(Report1.ESTACAD.Summary)

				' TIPOSITU
				Report1.TIPOSITU.ViewValue = Convert.ToString(Report1.TIPOSITU.Summary)

				' FECDEUDA
				Report1.FECDEUDA.ViewValue = Convert.ToString(Report1.FECDEUDA.Summary)
				Report1.FECDEUDA.ViewValue = ew_FormatDateTime(Report1.FECDEUDA.ViewValue, 7)
			Else

				' rut
				Report1.rut.ViewValue = Convert.ToString(Report1.rut.CurrentValue)
				Report1.rut.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIG
				Report1.DIG.ViewValue = Convert.ToString(Report1.DIG.CurrentValue)
				Report1.DIG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Nombre_alumno
				Report1.Nombre_alumno.ViewValue = Convert.ToString(Report1.Nombre_alumno.CurrentValue)
				Report1.Nombre_alumno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Report1.PATERNO.ViewValue = Convert.ToString(Report1.PATERNO.CurrentValue)
				Report1.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Report1.MATERNO.ViewValue = Convert.ToString(Report1.MATERNO.CurrentValue)
				Report1.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOPROC
				Report1.FONOPROC.ViewValue = Convert.ToString(Report1.FONOPROC.CurrentValue)
				Report1.FONOPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOACT
				Report1.FONOACT.ViewValue = Convert.ToString(Report1.FONOACT.CurrentValue)
				Report1.FONOACT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MAIL
				Report1.MAIL.ViewValue = Convert.ToString(Report1.MAIL.CurrentValue)
				Report1.MAIL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Carrera
				Report1.Carrera.ViewValue = Convert.ToString(Report1.Carrera.CurrentValue)
				Report1.Carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Report1.CODCARR.ViewValue = Convert.ToString(Report1.CODCARR.CurrentValue)
				Report1.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DESCRIPCION
				Report1.DESCRIPCION.ViewValue = Convert.ToString(Report1.DESCRIPCION.CurrentValue)
				Report1.DESCRIPCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' numero_pagare
				Report1.numero_pagare.ViewValue = Convert.ToString(Report1.numero_pagare.CurrentValue)
				Report1.numero_pagare.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CodDoc
				Report1.CodDoc.ViewValue = Convert.ToString(Report1.CodDoc.CurrentValue)
				Report1.CodDoc.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Documento
				Report1.Documento.ViewValue = Convert.ToString(Report1.Documento.CurrentValue)
				Report1.Documento.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				Report1.ANO.ViewValue = Convert.ToString(Report1.ANO.CurrentValue)
				Report1.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO
				Report1.PERIODO.ViewValue = Convert.ToString(Report1.PERIODO.CurrentValue)
				Report1.PERIODO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CUOTA
				Report1.CUOTA.ViewValue = Convert.ToString(Report1.CUOTA.CurrentValue)
				Report1.CUOTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NumCuotas
				Report1.NumCuotas.ViewValue = Convert.ToString(Report1.NumCuotas.CurrentValue)
				Report1.NumCuotas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MONTO
				Report1.MONTO.ViewValue = Convert.ToString(Report1.MONTO.CurrentValue)
				Report1.MONTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SALDO
				Report1.SALDO.ViewValue = Convert.ToString(Report1.SALDO.CurrentValue)
				Report1.SALDO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECVEN
				Report1.FECVEN.ViewValue = Convert.ToString(Report1.FECVEN.CurrentValue)
				Report1.FECVEN.ViewValue = ew_FormatDateTime(Report1.FECVEN.ViewValue, 7)
				Report1.FECVEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTACAD
				Report1.ESTACAD.ViewValue = Convert.ToString(Report1.ESTACAD.CurrentValue)
				Report1.ESTACAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIPOSITU
				Report1.TIPOSITU.ViewValue = Convert.ToString(Report1.TIPOSITU.CurrentValue)
				Report1.TIPOSITU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECDEUDA
				Report1.FECDEUDA.ViewValue = Convert.ToString(Report1.FECDEUDA.CurrentValue)
				Report1.FECDEUDA.ViewValue = ew_FormatDateTime(Report1.FECDEUDA.ViewValue, 7)
				Report1.FECDEUDA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' rut
			Report1.rut.HrefValue = ""

			' DIG
			Report1.DIG.HrefValue = ""

			' Nombre_alumno
			Report1.Nombre_alumno.HrefValue = ""

			' PATERNO
			Report1.PATERNO.HrefValue = ""

			' MATERNO
			Report1.MATERNO.HrefValue = ""

			' FONOPROC
			Report1.FONOPROC.HrefValue = ""

			' FONOACT
			Report1.FONOACT.HrefValue = ""

			' MAIL
			Report1.MAIL.HrefValue = ""

			' Carrera
			Report1.Carrera.HrefValue = ""

			' CODCARR
			Report1.CODCARR.HrefValue = ""

			' DESCRIPCION
			Report1.DESCRIPCION.HrefValue = ""

			' numero_pagare
			Report1.numero_pagare.HrefValue = ""

			' CodDoc
			Report1.CodDoc.HrefValue = ""

			' Documento
			Report1.Documento.HrefValue = ""

			' ANO
			Report1.ANO.HrefValue = ""

			' PERIODO
			Report1.PERIODO.HrefValue = ""

			' CUOTA
			Report1.CUOTA.HrefValue = ""

			' NumCuotas
			Report1.NumCuotas.HrefValue = ""

			' MONTO
			Report1.MONTO.HrefValue = ""

			' SALDO
			Report1.SALDO.HrefValue = ""

			' FECVEN
			Report1.FECVEN.HrefValue = ""

			' ESTACAD
			Report1.ESTACAD.HrefValue = ""

			' TIPOSITU
			Report1.TIPOSITU.HrefValue = ""

			' FECDEUDA
			Report1.FECDEUDA.HrefValue = ""

			' Call Row_Rendered event
			Report1.Row_Rendered()
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

			' Field Carrera
			sSelect = "SELECT DISTINCT [Carrera] FROM " + Report1.SqlFrom
			sOrderBy = "[Carrera] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Report1.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Report1.Carrera.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(Report1.rut)

				' Field PATERNO
				SetSessionFilterValues(Report1.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Report1.MATERNO)

				' Field Carrera
				SetSessionDropDownValue(Report1.Carrera.DropDownValue, Report1.Carrera)

				' Field FECVEN
				SetSessionFilterValues(Report1.FECVEN)
			bSetupFilter = True ' Set up filter required
		Else

				' Field rut
				If (GetFilterValues(Report1.rut)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Report1.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Report1.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Carrera
				If (GetDropDownValue(Report1.Carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Report1.Carrera.DropDownValue) Then
					If Not ew_SameStr(Report1.Carrera.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Report1_Carrera") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field FECVEN
				If (GetFilterValues(Report1.FECVEN)) Then
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
			GetSessionFilterValues(Report1.rut)

			' Field PATERNO
			GetSessionFilterValues(Report1.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Report1.MATERNO)

			' Field Carrera
			GetSessionDropDownValue(Report1.Carrera)

			' Field FECVEN
			GetSessionFilterValues(Report1.FECVEN)
		End If

		' Call page filter validated event
		Report1.Page_FilterValidated()

		' Build SQL
		' Field rut

		BuildExtendedFilter(Report1.rut, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Report1.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Report1.MATERNO, sFilter)

		' Field Carrera
		BuildDropDownFilter(Report1.Carrera, sFilter, "")

		' Field FECVEN
		BuildExtendedFilter(Report1.FECVEN, sFilter)

		' Save parms to Session
		' Field rut

		SetSessionFilterValues(Report1.rut)

		' Field PATERNO
		SetSessionFilterValues(Report1.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Report1.MATERNO)

		' Field Carrera
		SetSessionDropDownValue(Report1.Carrera.DropDownValue, Report1.Carrera)

		' Field FECVEN
		SetSessionFilterValues(Report1.FECVEN)

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
		If ew_Session("sv_Report1_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Report1_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Report1_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Report1_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Report1_" + parm)
		End If
		If ew_Session("so1_Report1_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Report1_" + parm))
		End If
		If ew_Session("sc_Report1_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Report1_" + parm))
		End If
		If ew_Session("sv2_Report1_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Report1_" + parm)
		End If
		If ew_Session("so2_Report1_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Report1_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Report1_" + parm) = fld.SearchValue
		ew_Session("so1_Report1_" + parm) = fld.SearchOperator
		ew_Session("sc_Report1_" + parm) = fld.SearchCondition
		ew_Session("sv2_Report1_" + parm) = fld.SearchValue2
		ew_Session("so2_Report1_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Report1_" + parm) = ""
		ew_Session("so1_Report1_" + parm) = "="
		ew_Session("sc_Report1_" + parm) = "AND"
		ew_Session("sv2_Report1_" + parm) = ""
		ew_Session("so2_Report1_" + parm) = "="
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
		If Not ewrpt_CheckEuroDate(Convert.ToString(Report1.FECVEN.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Report1.FECVEN.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Report1.FECVEN.SearchValue2)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Report1.FECVEN.FldErrMsg()
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
		ew_Session("sel_Report1_" & parm) = ""
		ew_Session("rf_Report1_" & parm) = ""
		ew_Session("rt_Report1_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Report1.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Report1_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Report1_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Report1_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field Carrera

			Report1.Carrera.DefaultDropDownValue = EWRPT_INIT_VALUE
			Report1.Carrera.DropDownValue = Report1.Carrera.DefaultDropDownValue

		' Set up default values for extended filters
			' Field rut

			SetDefaultExtFilter(Report1.rut, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Report1.rut)	

			' Field PATERNO
			SetDefaultExtFilter(Report1.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Report1.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Report1.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Report1.MATERNO)	

			' Field FECVEN
			SetDefaultExtFilter(Report1.FECVEN, "BETWEEN", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Report1.FECVEN)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check rut extended filter
		If (TextFilterApplied(Report1.rut)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Report1.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Report1.MATERNO)) Then bFilterExist = True

		' Check Carrera dropdown filter
		If (NonTextFilterApplied(Report1.Carrera)) Then bFilterExist = True

		' Check FECVEN extended filter
		If (TextFilterApplied(Report1.FECVEN)) Then bFilterExist = True
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
		BuildExtendedFilter(Report1.rut, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Report1.rut.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Report1.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Report1.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Report1.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Report1.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Carrera
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Report1.Carrera, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Report1.Carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECVEN
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Report1.FECVEN, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Report1.FECVEN.FldCaption() & "<br>"
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
				Report1.OrderBy = ""
				Report1.StartGroup = 1
				Report1.rut.Sort = ""
				Report1.DIG.Sort = ""
				Report1.Nombre_alumno.Sort = ""
				Report1.PATERNO.Sort = ""
				Report1.MATERNO.Sort = ""
				Report1.FONOPROC.Sort = ""
				Report1.FONOACT.Sort = ""
				Report1.MAIL.Sort = ""
				Report1.Carrera.Sort = ""
				Report1.CODCARR.Sort = ""
				Report1.DESCRIPCION.Sort = ""
				Report1.numero_pagare.Sort = ""
				Report1.CodDoc.Sort = ""
				Report1.Documento.Sort = ""
				Report1.ANO.Sort = ""
				Report1.PERIODO.Sort = ""
				Report1.CUOTA.Sort = ""
				Report1.NumCuotas.Sort = ""
				Report1.MONTO.Sort = ""
				Report1.SALDO.Sort = ""
				Report1.FECVEN.Sort = ""
				Report1.ESTACAD.Sort = ""
				Report1.TIPOSITU.Sort = ""
				Report1.FECDEUDA.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Report1.CurrentOrder = ew_Get("order")
			Report1.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Report1.SortSql()
			Report1.OrderBy = sSortSql
			Report1.StartGroup = 1
		End If
		Return Report1.OrderBy
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
		Report1_summary = New crReport1_summary(Me)
		Report1_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Report1_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Report1_summary IsNot Nothing) Then Report1_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Report1.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Report1_summary = new ewrpt_Page("Report1_summary");
// page properties
Report1_summary.PageID = "summary"; // page ID
Report1_summary.FormID = "fReport1summaryfilter"; // form ID
var EWRPT_PAGE_ID = Report1_summary.PageID;
// extend page with ValidateForm function
Report1_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_FECVEN;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Report1.FECVEN.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv2_FECVEN;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Report1.FECVEN.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Report1_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Report1_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Report1_summary.ValidateRequired = false; // no JavaScript validation
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
<% Report1_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Report1.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Report1.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1>Subir a Dicom pagare en garantía </h1></div>
<% If (Report1.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Report1_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% If (Report1_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="Report1smry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
<br><br>
<% Report1_summary.ShowMessage() %>
<% If (Report1.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Report1.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (Report1.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (Report1.FilterPanelOption = 2 OrElse (Report1.FilterPanelOption = 3 AndAlso Report1_summary.FilterApplied) OrElse Report1_summary.Filter = "0=101") Then
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
<form name="fReport1summaryfilter" id="fReport1summaryfilter" action="Report1smry.aspx" class="ewForm" onsubmit="return Report1_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Report1.FECVEN.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Report1.rut.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_rut" id="sv1_rut" size="30" maxlength="30" value="<%= ew_HtmlEncode(Report1.rut.SearchValue) %>"<%= IIf(Report1_summary.ClearExtFilter = "Report1_rut", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Report1.PATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Report1.PATERNO.SearchValue) %>"<%= IIf(Report1_summary.ClearExtFilter = "Report1_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Report1.MATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Report1.MATERNO.SearchValue) %>"<%= IIf(Report1_summary.ClearExtFilter = "Report1_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Report1.Carrera.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Carrera" id="sv_Carrera"<%= IIf(Report1_summary.ClearExtFilter = "Report1_Carrera", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Report1.Carrera.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Report1.Carrera.CustomFilters.Count + Report1.Carrera.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Report1.Carrera.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Carrera")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Report1.Carrera.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Report1.Carrera.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Report1.Carrera.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Report1.FECVEN.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECVEN" id="sv1_FECVEN" value="<%= ew_HtmlEncode(Report1.FECVEN.SearchValue) %>"<%= IIf(Report1_summary.ClearExtFilter = "Report1_FECVEN", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv1_FECVEN" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv1_FECVEN", // ID of the input field
ifFormat : "%d/%m/%Y", // the date format
button : "csv1_FECVEN" // ID of the button
})
</script>
</span></td>
				<td></td>
					<td><span class="ewRptSearchOpr" id="btw1_FECVEN" name="btw1_FECVEN">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
					<td><span class="aspnetreportmaker" id="btw1_FECVEN" name="btw1_FECVEN">
<input type="text" name="sv2_FECVEN" id="sv2_FECVEN" value="<%= ew_HtmlEncode(Report1.FECVEN.SearchValue2) %>"<%= IIf(Report1_summary.ClearExtFilter = "Report1_FECVEN", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv2_FECVEN" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv2_FECVEN", // ID of the input field
ifFormat : "%d/%m/%Y", // the date format
button : "csv2_FECVEN" // ID of the button
})
</script>
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
<% If (Report1.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Report1_summary.ShowFilterList() %>
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
If (Report1.ExportAll AndAlso ew_NotEmpty(Report1.Export)) Then
	Report1_summary.StopGrp = Report1_summary.TotalGrps
Else
	Report1_summary.StopGrp = Report1_summary.StartGrp + Report1_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Report1_summary.StopGrp > Report1_summary.TotalGrps) Then
	Report1_summary.StopGrp = Report1_summary.TotalGrps
End If
Report1_summary.RecCount = 0

' Get first row
If (Report1_summary.TotalGrps > 0) Then
	Report1_summary.GetRow() ' ASPXRPT
	Report1_summary.GrpCount = 1
End If
While ((Report1_summary.HasRow AndAlso Report1_summary.GrpIndex < Report1_summary.StopGrp) OrElse Report1_summary.ShowFirstHeader)

	' Show header
	If (Report1_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.rut.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.rut))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.rut.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.rut) %>',0);"><%= Report1.rut.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.rut.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.rut.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.DIG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.DIG))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.DIG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.DIG) %>',0);"><%= Report1.DIG.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.DIG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.DIG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.Nombre_alumno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.Nombre_alumno))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.Nombre_alumno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.Nombre_alumno) %>',0);"><%= Report1.Nombre_alumno.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.Nombre_alumno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.Nombre_alumno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.PATERNO) %>',0);"><%= Report1.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.MATERNO) %>',0);"><%= Report1.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.FONOPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.FONOPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.FONOPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.FONOPROC) %>',0);"><%= Report1.FONOPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.FONOPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.FONOPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.FONOACT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.FONOACT))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.FONOACT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.FONOACT) %>',0);"><%= Report1.FONOACT.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.FONOACT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.FONOACT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.MAIL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.MAIL))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.MAIL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.MAIL) %>',0);"><%= Report1.MAIL.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.MAIL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.MAIL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.Carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.Carrera))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.Carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.Carrera) %>',0);"><%= Report1.Carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.Carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.Carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.CODCARR) %>',0);"><%= Report1.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.DESCRIPCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.DESCRIPCION))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.DESCRIPCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.DESCRIPCION) %>',0);"><%= Report1.DESCRIPCION.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.DESCRIPCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.DESCRIPCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.numero_pagare.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.numero_pagare))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.numero_pagare.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.numero_pagare) %>',0);"><%= Report1.numero_pagare.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.numero_pagare.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.numero_pagare.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.CodDoc.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.CodDoc))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.CodDoc.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.CodDoc) %>',0);"><%= Report1.CodDoc.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.CodDoc.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.CodDoc.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.Documento.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.Documento))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.Documento.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.Documento) %>',0);"><%= Report1.Documento.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.Documento.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.Documento.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.ANO) %>',0);"><%= Report1.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.PERIODO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.PERIODO))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.PERIODO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.PERIODO) %>',0);"><%= Report1.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.PERIODO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.PERIODO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.CUOTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.CUOTA))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.CUOTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.CUOTA) %>',0);"><%= Report1.CUOTA.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.CUOTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.CUOTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.NumCuotas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.NumCuotas))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.NumCuotas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.NumCuotas) %>',0);"><%= Report1.NumCuotas.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.NumCuotas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.NumCuotas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.MONTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.MONTO))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.MONTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.MONTO) %>',0);"><%= Report1.MONTO.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.MONTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.MONTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.SALDO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.SALDO))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.SALDO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.SALDO) %>',0);"><%= Report1.SALDO.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.SALDO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.SALDO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.FECVEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.FECVEN))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.FECVEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.FECVEN) %>',0);"><%= Report1.FECVEN.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.FECVEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.FECVEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.ESTACAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.ESTACAD))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.ESTACAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.ESTACAD) %>',0);"><%= Report1.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.ESTACAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.ESTACAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.TIPOSITU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.TIPOSITU))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.TIPOSITU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.TIPOSITU) %>',0);"><%= Report1.TIPOSITU.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.TIPOSITU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.TIPOSITU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Report1.Export)) Then %>
<%= Report1.FECDEUDA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Report1.SortUrl(Report1.FECDEUDA))) Then %>
		<td style="vertical-align: bottom;"><%= Report1.FECDEUDA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.FECDEUDA) %>',0);"><%= Report1.FECDEUDA.FldCaption() %></td><td style="width: 10px;">
		<% If (Report1.FECDEUDA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Report1.FECDEUDA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Report1_summary.ShowFirstHeader = False
	End If
	Report1_summary.RecCount += 1

		' Render detail row
		Report1.ResetCSS()
		Report1.RowType = EWRPT_ROWTYPE_DETAIL
		Report1_summary.RenderRow()
%>
	<tr<%= Report1.RowAttributes() %>>
		<td<%= Report1.rut.CellAttributes %>>
<div<%= Report1.rut.ViewAttributes%>><%= Report1.rut.ListViewValue%></div>
</td>
		<td<%= Report1.DIG.CellAttributes %>>
<div<%= Report1.DIG.ViewAttributes%>><%= Report1.DIG.ListViewValue%></div>
</td>
		<td<%= Report1.Nombre_alumno.CellAttributes %>>
<div<%= Report1.Nombre_alumno.ViewAttributes%>><%= Report1.Nombre_alumno.ListViewValue%></div>
</td>
		<td<%= Report1.PATERNO.CellAttributes %>>
<div<%= Report1.PATERNO.ViewAttributes%>><%= Report1.PATERNO.ListViewValue%></div>
</td>
		<td<%= Report1.MATERNO.CellAttributes %>>
<div<%= Report1.MATERNO.ViewAttributes%>><%= Report1.MATERNO.ListViewValue%></div>
</td>
		<td<%= Report1.FONOPROC.CellAttributes %>>
<div<%= Report1.FONOPROC.ViewAttributes%>><%= Report1.FONOPROC.ListViewValue%></div>
</td>
		<td<%= Report1.FONOACT.CellAttributes %>>
<div<%= Report1.FONOACT.ViewAttributes%>><%= Report1.FONOACT.ListViewValue%></div>
</td>
		<td<%= Report1.MAIL.CellAttributes %>>
<div<%= Report1.MAIL.ViewAttributes%>><%= Report1.MAIL.ListViewValue%></div>
</td>
		<td<%= Report1.Carrera.CellAttributes %>>
<div<%= Report1.Carrera.ViewAttributes%>><%= Report1.Carrera.ListViewValue%></div>
</td>
		<td<%= Report1.CODCARR.CellAttributes %>>
<div<%= Report1.CODCARR.ViewAttributes%>><%= Report1.CODCARR.ListViewValue%></div>
</td>
		<td<%= Report1.DESCRIPCION.CellAttributes %>>
<div<%= Report1.DESCRIPCION.ViewAttributes%>><%= Report1.DESCRIPCION.ListViewValue%></div>
</td>
		<td<%= Report1.numero_pagare.CellAttributes %>>
<div<%= Report1.numero_pagare.ViewAttributes%>><%= Report1.numero_pagare.ListViewValue%></div>
</td>
		<td<%= Report1.CodDoc.CellAttributes %>>
<div<%= Report1.CodDoc.ViewAttributes%>><%= Report1.CodDoc.ListViewValue%></div>
</td>
		<td<%= Report1.Documento.CellAttributes %>>
<div<%= Report1.Documento.ViewAttributes%>><%= Report1.Documento.ListViewValue%></div>
</td>
		<td<%= Report1.ANO.CellAttributes %>>
<div<%= Report1.ANO.ViewAttributes%>><%= Report1.ANO.ListViewValue%></div>
</td>
		<td<%= Report1.PERIODO.CellAttributes %>>
<div<%= Report1.PERIODO.ViewAttributes%>><%= Report1.PERIODO.ListViewValue%></div>
</td>
		<td<%= Report1.CUOTA.CellAttributes %>>
<div<%= Report1.CUOTA.ViewAttributes%>><%= Report1.CUOTA.ListViewValue%></div>
</td>
		<td<%= Report1.NumCuotas.CellAttributes %>>
<div<%= Report1.NumCuotas.ViewAttributes%>><%= Report1.NumCuotas.ListViewValue%></div>
</td>
		<td<%= Report1.MONTO.CellAttributes %>>
<div<%= Report1.MONTO.ViewAttributes%>><%= Report1.MONTO.ListViewValue%></div>
</td>
		<td<%= Report1.SALDO.CellAttributes %>>
<div<%= Report1.SALDO.ViewAttributes%>><%= Report1.SALDO.ListViewValue%></div>
</td>
		<td<%= Report1.FECVEN.CellAttributes %>>
<div<%= Report1.FECVEN.ViewAttributes%>><%= Report1.FECVEN.ListViewValue%></div>
</td>
		<td<%= Report1.ESTACAD.CellAttributes %>>
<div<%= Report1.ESTACAD.ViewAttributes%>><%= Report1.ESTACAD.ListViewValue%></div>
</td>
		<td<%= Report1.TIPOSITU.CellAttributes %>>
<div<%= Report1.TIPOSITU.ViewAttributes%>><%= Report1.TIPOSITU.ListViewValue%></div>
</td>
		<td<%= Report1.FECDEUDA.CellAttributes %>>
<div<%= Report1.FECDEUDA.ViewAttributes%>><%= Report1.FECDEUDA.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Report1_summary.AccumulateSummary()

		' Get next record
		Report1_summary.GetRow() ' ASPXRPT
		Report1_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Report1_summary.TotalGrps > 0) Then
	Report1.ResetCSS()
	Report1.RowType = EWRPT_ROWTYPE_TOTAL
	Report1.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Report1.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Report1.RowAttrs("class") = "ewRptGrandSummary"
	Report1_summary.RenderRow()
%>
	<!-- tr><td colspan="24"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Report1.RowAttributes() %>><td colspan="24"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Report1_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Report1.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Report1_summary.Pager Is Nothing Then Report1_summary.Pager = New cPrevNextPager(Report1_summary.StartGrp, Report1_summary.DisplayGrps, Report1_summary.TotalGrps) %>
<% If Report1_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Report1_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Report1smry.aspx?start=<%= Report1_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Report1_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Report1smry.aspx?start=<%= Report1_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Report1_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Report1_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Report1smry.aspx?start=<%= Report1_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Report1_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Report1smry.aspx?start=<%= Report1_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Report1_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Report1_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Report1_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Report1_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Report1_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Report1_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Report1_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Report1_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="ALL"<% If (Report1.GroupPerPage = -1) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("AllRecords") %></option>
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
<% If (Report1.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Report1.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Report1.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Report1_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Report1.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
