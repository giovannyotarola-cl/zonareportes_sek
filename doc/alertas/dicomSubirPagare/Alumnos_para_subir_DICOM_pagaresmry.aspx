<%@ Page ClassName="Alumnos_para_subir_DICOM_pagaresmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_dicomSubirPagare" %>
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
	Public Alumnos_para_subir_DICOM_pagare As crAlumnos_para_subir_DICOM_pagare = Nothing

	'
	' Table class (for Alumnos para subir DICOM_pagare)
	'
	Public Class crAlumnos_para_subir_DICOM_pagare
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
				Return "Alumnos_para_subir_DICOM_pagare"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Alumnos para subir DICOM_pagare"
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

		Public Nombre_alumno As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public rut As crField

		Public DIG As crField

		Public MAIL As crField

		Public FONOPROC As crField

		Public FONOACT As crField

		Public CODCARR As crField

		Public Carrera As crField

		Public ESTACAD As crField

		Public ANO As crField

		Public PERIODO As crField

		Public TIPOSITU As crField

		Public DESCRIPCION As crField

		Public CodDoc As crField

		Public Documento As crField

		Public numero_pagare As crField

		Public CUOTA As crField

		Public NumCuotas As crField

		Public MONTO As crField

		Public SALDO As crField

		Public FECVEN As crField

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

			' Nombre_alumno
			Nombre_alumno = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_Nombre_alumno", "Nombre_alumno", "[Nombre_alumno]", 200, EWRPT_DATATYPE_STRING, -1)
			Nombre_alumno.Page = APage
			Nombre_alumno.ParentPage = APage.ParentPage
			Fields.Add("Nombre_alumno", Nombre_alumno)
			Nombre_alumno.DateFilter = ""
			Nombre_alumno.SqlSelect = ""
			Nombre_alumno.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' rut
			rut = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_rut", "rut", "[rut]", 200, EWRPT_DATATYPE_STRING, -1)
			rut.Page = APage
			rut.ParentPage = APage.ParentPage
			Fields.Add("rut", rut)
			rut.DateFilter = ""
			rut.SqlSelect = ""
			rut.SqlOrderBy = ""

			' DIG
			DIG = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
			DIG.Page = APage
			DIG.ParentPage = APage.ParentPage
			Fields.Add("DIG", DIG)
			DIG.DateFilter = ""
			DIG.SqlSelect = ""
			DIG.SqlOrderBy = ""

			' MAIL
			MAIL = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_MAIL", "MAIL", "[MAIL]", 200, EWRPT_DATATYPE_STRING, -1)
			MAIL.Page = APage
			MAIL.ParentPage = APage.ParentPage
			Fields.Add("MAIL", MAIL)
			MAIL.DateFilter = ""
			MAIL.SqlSelect = ""
			MAIL.SqlOrderBy = ""

			' FONOPROC
			FONOPROC = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_FONOPROC", "FONOPROC", "[FONOPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOPROC.Page = APage
			FONOPROC.ParentPage = APage.ParentPage
			Fields.Add("FONOPROC", FONOPROC)
			FONOPROC.DateFilter = ""
			FONOPROC.SqlSelect = ""
			FONOPROC.SqlOrderBy = ""

			' FONOACT
			FONOACT = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_FONOACT", "FONOACT", "[FONOACT]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOACT.Page = APage
			FONOACT.ParentPage = APage.ParentPage
			Fields.Add("FONOACT", FONOACT)
			FONOACT.DateFilter = ""
			FONOACT.SqlSelect = ""
			FONOACT.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' Carrera
			Carrera = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_Carrera", "Carrera", "[Carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			Carrera.Page = APage
			Carrera.ParentPage = APage.ParentPage
			Fields.Add("Carrera", Carrera)
			Carrera.DateFilter = ""
			Carrera.SqlSelect = ""
			Carrera.SqlOrderBy = ""

			' ESTACAD
			ESTACAD = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTACAD.Page = APage
			ESTACAD.ParentPage = APage.ParentPage
			Fields.Add("ESTACAD", ESTACAD)
			ESTACAD.DateFilter = ""
			ESTACAD.SqlSelect = ""
			ESTACAD.SqlOrderBy = ""

			' ANO
			ANO = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_PERIODO", "PERIODO", "[PERIODO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			PERIODO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' TIPOSITU
			TIPOSITU = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_TIPOSITU", "TIPOSITU", "[TIPOSITU]", 131, EWRPT_DATATYPE_NUMBER, -1)
			TIPOSITU.Page = APage
			TIPOSITU.ParentPage = APage.ParentPage
			TIPOSITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("TIPOSITU", TIPOSITU)
			TIPOSITU.DateFilter = ""
			TIPOSITU.SqlSelect = ""
			TIPOSITU.SqlOrderBy = ""

			' DESCRIPCION
			DESCRIPCION = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_DESCRIPCION", "DESCRIPCION", "[DESCRIPCION]", 200, EWRPT_DATATYPE_STRING, -1)
			DESCRIPCION.Page = APage
			DESCRIPCION.ParentPage = APage.ParentPage
			Fields.Add("DESCRIPCION", DESCRIPCION)
			DESCRIPCION.DateFilter = ""
			DESCRIPCION.SqlSelect = ""
			DESCRIPCION.SqlOrderBy = ""

			' CodDoc
			CodDoc = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_CodDoc", "CodDoc", "[CodDoc]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CodDoc.Page = APage
			CodDoc.ParentPage = APage.ParentPage
			CodDoc.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CodDoc", CodDoc)
			CodDoc.DateFilter = ""
			CodDoc.SqlSelect = ""
			CodDoc.SqlOrderBy = ""

			' Documento
			Documento = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_Documento", "Documento", "[Documento]", 200, EWRPT_DATATYPE_STRING, -1)
			Documento.Page = APage
			Documento.ParentPage = APage.ParentPage
			Fields.Add("Documento", Documento)
			Documento.DateFilter = ""
			Documento.SqlSelect = ""
			Documento.SqlOrderBy = ""

			' numero_pagare
			numero_pagare = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_numero_pagare", "numero_pagare", "[numero_pagare]", 131, EWRPT_DATATYPE_NUMBER, -1)
			numero_pagare.Page = APage
			numero_pagare.ParentPage = APage.ParentPage
			numero_pagare.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("numero_pagare", numero_pagare)
			numero_pagare.DateFilter = ""
			numero_pagare.SqlSelect = ""
			numero_pagare.SqlOrderBy = ""

			' CUOTA
			CUOTA = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_CUOTA", "CUOTA", "[CUOTA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CUOTA.Page = APage
			CUOTA.ParentPage = APage.ParentPage
			CUOTA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CUOTA", CUOTA)
			CUOTA.DateFilter = ""
			CUOTA.SqlSelect = ""
			CUOTA.SqlOrderBy = ""

			' NumCuotas
			NumCuotas = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_NumCuotas", "NumCuotas", "[NumCuotas]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NumCuotas.Page = APage
			NumCuotas.ParentPage = APage.ParentPage
			NumCuotas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NumCuotas", NumCuotas)
			NumCuotas.DateFilter = ""
			NumCuotas.SqlSelect = ""
			NumCuotas.SqlOrderBy = ""

			' MONTO
			MONTO = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_MONTO", "MONTO", "[MONTO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			MONTO.Page = APage
			MONTO.ParentPage = APage.ParentPage
			MONTO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("MONTO", MONTO)
			MONTO.DateFilter = ""
			MONTO.SqlSelect = ""
			MONTO.SqlOrderBy = ""

			' SALDO
			SALDO = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_SALDO", "SALDO", "[SALDO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			SALDO.Page = APage
			SALDO.ParentPage = APage.ParentPage
			SALDO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("SALDO", SALDO)
			SALDO.DateFilter = ""
			SALDO.SqlSelect = ""
			SALDO.SqlOrderBy = ""

			' FECVEN
			FECVEN = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_FECVEN", "FECVEN", "[FECVEN]", 135, EWRPT_DATATYPE_DATE, 7)
			FECVEN.Page = APage
			FECVEN.ParentPage = APage.ParentPage
			FECVEN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECVEN", FECVEN)
			FECVEN.DateFilter = ""
			FECVEN.SqlSelect = ""
			FECVEN.SqlOrderBy = ""

			' FECDEUDA
			FECDEUDA = new crField("Alumnos_para_subir_DICOM_pagare", "Alumnos para subir DICOM_pagare", "x_FECDEUDA", "FECDEUDA", "[FECDEUDA]", 135, EWRPT_DATATYPE_DATE, 7)
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
				Return "[SEK_DICOM_Subir_Pagare]"
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
	Public Alumnos_para_subir_DICOM_pagare_summary As crAlumnos_para_subir_DICOM_pagare_summary

	'
	' Page class
	'
	Public Class crAlumnos_para_subir_DICOM_pagare_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Alumnos_para_subir_DICOM_pagare.UseTokenInUrl) Then
				sUrl &= "t=" & Alumnos_para_subir_DICOM_pagare.TableVar & "&" ' Add page token
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
			If (Alumnos_para_subir_DICOM_pagare.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Alumnos_para_subir_DICOM_pagare.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Alumnos_para_subir_DICOM_pagare.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Alumnos_para_subir_DICOM_pagaresmry 
			Get
				Return CType(m_ParentPage, Alumnos_para_subir_DICOM_pagaresmry)
			End Get
		End Property

		' Table object (Alumnos_para_subir_DICOM_pagare)
		Public Property Alumnos_para_subir_DICOM_pagare As crAlumnos_para_subir_DICOM_pagare 
			Get		
				Return AspNetPage.Alumnos_para_subir_DICOM_pagare ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAlumnos_para_subir_DICOM_pagare)
				AspNetPage.Alumnos_para_subir_DICOM_pagare = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_dicomSubirPagare)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Alumnos_para_subir_DICOM_pagare_summary"
			m_PageObjTypeName = "crAlumnos_para_subir_DICOM_pagare_summary"

			' Table name
			m_TableName = "Alumnos para subir DICOM_pagare"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Alumnos_para_subir_DICOM_pagare)
			Alumnos_para_subir_DICOM_pagare = New crAlumnos_para_subir_DICOM_pagare(Me)			

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
				Alumnos_para_subir_DICOM_pagare.Export = ew_Get("export")
			End If
			gsExport = Alumnos_para_subir_DICOM_pagare.Export ' Get export parameter, used in header
			gsExportFile = Alumnos_para_subir_DICOM_pagare.TableVar ' Get export file, used in header
			If (Alumnos_para_subir_DICOM_pagare.Export = "excel") Then
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
			Alumnos_para_subir_DICOM_pagare.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Alumnos_para_subir_DICOM_pagare.SqlSelect, Alumnos_para_subir_DICOM_pagare.SqlWhere, Alumnos_para_subir_DICOM_pagare.SqlGroupBy, Alumnos_para_subir_DICOM_pagare.SqlHaving, Alumnos_para_subir_DICOM_pagare.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Alumnos_para_subir_DICOM_pagare.ExportAll AndAlso ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then
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
				Alumnos_para_subir_DICOM_pagare.numero_pagare.DbValue = Row("numero_pagare")
				Alumnos_para_subir_DICOM_pagare.rut.DbValue = Row("rut")
				Alumnos_para_subir_DICOM_pagare.DIG.DbValue = Row("DIG")
				Alumnos_para_subir_DICOM_pagare.CODCARR.DbValue = Row("CODCARR")
				Alumnos_para_subir_DICOM_pagare.Carrera.DbValue = Row("Carrera")
				Alumnos_para_subir_DICOM_pagare.CodDoc.DbValue = Row("CodDoc")
				Alumnos_para_subir_DICOM_pagare.Documento.DbValue = Row("Documento")
				Alumnos_para_subir_DICOM_pagare.ANO.DbValue = Row("ANO")
				Alumnos_para_subir_DICOM_pagare.PERIODO.DbValue = Row("PERIODO")
				Alumnos_para_subir_DICOM_pagare.CUOTA.DbValue = Row("CUOTA")
				Alumnos_para_subir_DICOM_pagare.NumCuotas.DbValue = Row("NumCuotas")
				Alumnos_para_subir_DICOM_pagare.MONTO.DbValue = Row("MONTO")
				Alumnos_para_subir_DICOM_pagare.SALDO.DbValue = Row("SALDO")
				Alumnos_para_subir_DICOM_pagare.FECVEN.DbValue = Row("FECVEN")
				Alumnos_para_subir_DICOM_pagare.PATERNO.DbValue = Row("PATERNO")
				Alumnos_para_subir_DICOM_pagare.MATERNO.DbValue = Row("MATERNO")
				Alumnos_para_subir_DICOM_pagare.Nombre_alumno.DbValue = Row("Nombre_alumno")
				Alumnos_para_subir_DICOM_pagare.MAIL.DbValue = Row("MAIL")
				Alumnos_para_subir_DICOM_pagare.ESTACAD.DbValue = Row("ESTACAD")
				Alumnos_para_subir_DICOM_pagare.TIPOSITU.DbValue = Row("TIPOSITU")
				Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DbValue = Row("DESCRIPCION")
				Alumnos_para_subir_DICOM_pagare.FONOPROC.DbValue = Row("FONOPROC")
				Alumnos_para_subir_DICOM_pagare.FONOACT.DbValue = Row("FONOACT")
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.DbValue = Row("FECDEUDA")
				Val(1) = Alumnos_para_subir_DICOM_pagare.Nombre_alumno.CurrentValue
				Val(2) = Alumnos_para_subir_DICOM_pagare.PATERNO.CurrentValue
				Val(3) = Alumnos_para_subir_DICOM_pagare.MATERNO.CurrentValue
				Val(4) = Alumnos_para_subir_DICOM_pagare.rut.CurrentValue
				Val(5) = Alumnos_para_subir_DICOM_pagare.DIG.CurrentValue
				Val(6) = Alumnos_para_subir_DICOM_pagare.MAIL.CurrentValue
				Val(7) = Alumnos_para_subir_DICOM_pagare.FONOPROC.CurrentValue
				Val(8) = Alumnos_para_subir_DICOM_pagare.FONOACT.CurrentValue
				Val(9) = Alumnos_para_subir_DICOM_pagare.CODCARR.CurrentValue
				Val(10) = Alumnos_para_subir_DICOM_pagare.Carrera.CurrentValue
				Val(11) = Alumnos_para_subir_DICOM_pagare.ESTACAD.CurrentValue
				Val(12) = Alumnos_para_subir_DICOM_pagare.ANO.CurrentValue
				Val(13) = Alumnos_para_subir_DICOM_pagare.PERIODO.CurrentValue
				Val(14) = Alumnos_para_subir_DICOM_pagare.TIPOSITU.CurrentValue
				Val(15) = Alumnos_para_subir_DICOM_pagare.DESCRIPCION.CurrentValue
				Val(16) = Alumnos_para_subir_DICOM_pagare.CodDoc.CurrentValue
				Val(17) = Alumnos_para_subir_DICOM_pagare.Documento.CurrentValue
				Val(18) = Alumnos_para_subir_DICOM_pagare.numero_pagare.CurrentValue
				Val(19) = Alumnos_para_subir_DICOM_pagare.CUOTA.CurrentValue
				Val(20) = Alumnos_para_subir_DICOM_pagare.NumCuotas.CurrentValue
				Val(21) = Alumnos_para_subir_DICOM_pagare.MONTO.CurrentValue
				Val(22) = Alumnos_para_subir_DICOM_pagare.SALDO.CurrentValue
				Val(23) = Alumnos_para_subir_DICOM_pagare.FECVEN.CurrentValue
				Val(24) = Alumnos_para_subir_DICOM_pagare.FECDEUDA.CurrentValue
			Else
				Alumnos_para_subir_DICOM_pagare.numero_pagare.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.rut.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.DIG.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.CODCARR.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.Carrera.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.CodDoc.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.Documento.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.ANO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.PERIODO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.CUOTA.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.NumCuotas.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.MONTO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.SALDO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.FECVEN.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.PATERNO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.MATERNO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.Nombre_alumno.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.MAIL.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.ESTACAD.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.TIPOSITU.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.FONOPROC.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.FONOACT.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Alumnos_para_subir_DICOM_pagare.numero_pagare.DbValue = dr("numero_pagare")
				Alumnos_para_subir_DICOM_pagare.rut.DbValue = dr("rut")
				Alumnos_para_subir_DICOM_pagare.DIG.DbValue = dr("DIG")
				Alumnos_para_subir_DICOM_pagare.CODCARR.DbValue = dr("CODCARR")
				Alumnos_para_subir_DICOM_pagare.Carrera.DbValue = dr("Carrera")
				Alumnos_para_subir_DICOM_pagare.CodDoc.DbValue = dr("CodDoc")
				Alumnos_para_subir_DICOM_pagare.Documento.DbValue = dr("Documento")
				Alumnos_para_subir_DICOM_pagare.ANO.DbValue = dr("ANO")
				Alumnos_para_subir_DICOM_pagare.PERIODO.DbValue = dr("PERIODO")
				Alumnos_para_subir_DICOM_pagare.CUOTA.DbValue = dr("CUOTA")
				Alumnos_para_subir_DICOM_pagare.NumCuotas.DbValue = dr("NumCuotas")
				Alumnos_para_subir_DICOM_pagare.MONTO.DbValue = dr("MONTO")
				Alumnos_para_subir_DICOM_pagare.SALDO.DbValue = dr("SALDO")
				Alumnos_para_subir_DICOM_pagare.FECVEN.DbValue = dr("FECVEN")
				Alumnos_para_subir_DICOM_pagare.PATERNO.DbValue = dr("PATERNO")
				Alumnos_para_subir_DICOM_pagare.MATERNO.DbValue = dr("MATERNO")
				Alumnos_para_subir_DICOM_pagare.Nombre_alumno.DbValue = dr("Nombre_alumno")
				Alumnos_para_subir_DICOM_pagare.MAIL.DbValue = dr("MAIL")
				Alumnos_para_subir_DICOM_pagare.ESTACAD.DbValue = dr("ESTACAD")
				Alumnos_para_subir_DICOM_pagare.TIPOSITU.DbValue = dr("TIPOSITU")
				Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DbValue = dr("DESCRIPCION")
				Alumnos_para_subir_DICOM_pagare.FONOPROC.DbValue = dr("FONOPROC")
				Alumnos_para_subir_DICOM_pagare.FONOACT.DbValue = dr("FONOACT")
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.DbValue = dr("FECDEUDA")
				Val(1) = Alumnos_para_subir_DICOM_pagare.Nombre_alumno.CurrentValue
				Val(2) = Alumnos_para_subir_DICOM_pagare.PATERNO.CurrentValue
				Val(3) = Alumnos_para_subir_DICOM_pagare.MATERNO.CurrentValue
				Val(4) = Alumnos_para_subir_DICOM_pagare.rut.CurrentValue
				Val(5) = Alumnos_para_subir_DICOM_pagare.DIG.CurrentValue
				Val(6) = Alumnos_para_subir_DICOM_pagare.MAIL.CurrentValue
				Val(7) = Alumnos_para_subir_DICOM_pagare.FONOPROC.CurrentValue
				Val(8) = Alumnos_para_subir_DICOM_pagare.FONOACT.CurrentValue
				Val(9) = Alumnos_para_subir_DICOM_pagare.CODCARR.CurrentValue
				Val(10) = Alumnos_para_subir_DICOM_pagare.Carrera.CurrentValue
				Val(11) = Alumnos_para_subir_DICOM_pagare.ESTACAD.CurrentValue
				Val(12) = Alumnos_para_subir_DICOM_pagare.ANO.CurrentValue
				Val(13) = Alumnos_para_subir_DICOM_pagare.PERIODO.CurrentValue
				Val(14) = Alumnos_para_subir_DICOM_pagare.TIPOSITU.CurrentValue
				Val(15) = Alumnos_para_subir_DICOM_pagare.DESCRIPCION.CurrentValue
				Val(16) = Alumnos_para_subir_DICOM_pagare.CodDoc.CurrentValue
				Val(17) = Alumnos_para_subir_DICOM_pagare.Documento.CurrentValue
				Val(18) = Alumnos_para_subir_DICOM_pagare.numero_pagare.CurrentValue
				Val(19) = Alumnos_para_subir_DICOM_pagare.CUOTA.CurrentValue
				Val(20) = Alumnos_para_subir_DICOM_pagare.NumCuotas.CurrentValue
				Val(21) = Alumnos_para_subir_DICOM_pagare.MONTO.CurrentValue
				Val(22) = Alumnos_para_subir_DICOM_pagare.SALDO.CurrentValue
				Val(23) = Alumnos_para_subir_DICOM_pagare.FECVEN.CurrentValue
				Val(24) = Alumnos_para_subir_DICOM_pagare.FECDEUDA.CurrentValue
			Else				
				Alumnos_para_subir_DICOM_pagare.numero_pagare.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.rut.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.DIG.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.CODCARR.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.Carrera.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.CodDoc.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.Documento.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.ANO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.PERIODO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.CUOTA.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.NumCuotas.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.MONTO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.SALDO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.FECVEN.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.PATERNO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.MATERNO.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.Nombre_alumno.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.MAIL.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.ESTACAD.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.TIPOSITU.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.FONOPROC.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.FONOACT.DbValue = ""
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.DbValue = ""
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
				Alumnos_para_subir_DICOM_pagare.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Alumnos_para_subir_DICOM_pagare.StartGroup = StartGrp
				Else
					StartGrp = Alumnos_para_subir_DICOM_pagare.StartGroup
				End If
			Else
				StartGrp = Alumnos_para_subir_DICOM_pagare.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Alumnos_para_subir_DICOM_pagare.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Alumnos_para_subir_DICOM_pagare.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Alumnos_para_subir_DICOM_pagare.StartGroup = StartGrp
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
			Alumnos_para_subir_DICOM_pagare.StartGroup = StartGrp
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
				Alumnos_para_subir_DICOM_pagare.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Alumnos_para_subir_DICOM_pagare.StartGroup = StartGrp
			Else				
				If (Alumnos_para_subir_DICOM_pagare.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Alumnos_para_subir_DICOM_pagare.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Alumnos_para_subir_DICOM_pagare.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Alumnos_para_subir_DICOM_pagare.SqlSelectCount, Alumnos_para_subir_DICOM_pagare.SqlWhere, Alumnos_para_subir_DICOM_pagare.SqlGroupBy, Alumnos_para_subir_DICOM_pagare.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Alumnos_para_subir_DICOM_pagare.Row_Rendering()

			'
			' Render view codes
			'

			If (Alumnos_para_subir_DICOM_pagare.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' Nombre_alumno
				Alumnos_para_subir_DICOM_pagare.Nombre_alumno.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.Nombre_alumno.Summary)

				' PATERNO
				Alumnos_para_subir_DICOM_pagare.PATERNO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.PATERNO.Summary)

				' MATERNO
				Alumnos_para_subir_DICOM_pagare.MATERNO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.MATERNO.Summary)

				' rut
				Alumnos_para_subir_DICOM_pagare.rut.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.rut.Summary)

				' DIG
				Alumnos_para_subir_DICOM_pagare.DIG.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.DIG.Summary)

				' MAIL
				Alumnos_para_subir_DICOM_pagare.MAIL.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.MAIL.Summary)

				' FONOPROC
				Alumnos_para_subir_DICOM_pagare.FONOPROC.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.FONOPROC.Summary)

				' FONOACT
				Alumnos_para_subir_DICOM_pagare.FONOACT.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.FONOACT.Summary)

				' CODCARR
				Alumnos_para_subir_DICOM_pagare.CODCARR.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.CODCARR.Summary)

				' Carrera
				Alumnos_para_subir_DICOM_pagare.Carrera.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.Carrera.Summary)

				' ESTACAD
				Alumnos_para_subir_DICOM_pagare.ESTACAD.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.ESTACAD.Summary)

				' ANO
				Alumnos_para_subir_DICOM_pagare.ANO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.ANO.Summary)

				' PERIODO
				Alumnos_para_subir_DICOM_pagare.PERIODO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.PERIODO.Summary)

				' TIPOSITU
				Alumnos_para_subir_DICOM_pagare.TIPOSITU.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.TIPOSITU.Summary)

				' DESCRIPCION
				Alumnos_para_subir_DICOM_pagare.DESCRIPCION.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.DESCRIPCION.Summary)

				' CodDoc
				Alumnos_para_subir_DICOM_pagare.CodDoc.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.CodDoc.Summary)

				' Documento
				Alumnos_para_subir_DICOM_pagare.Documento.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.Documento.Summary)

				' numero_pagare
				Alumnos_para_subir_DICOM_pagare.numero_pagare.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.numero_pagare.Summary)

				' CUOTA
				Alumnos_para_subir_DICOM_pagare.CUOTA.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.CUOTA.Summary)

				' NumCuotas
				Alumnos_para_subir_DICOM_pagare.NumCuotas.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.NumCuotas.Summary)

				' MONTO
				Alumnos_para_subir_DICOM_pagare.MONTO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.MONTO.Summary)

				' SALDO
				Alumnos_para_subir_DICOM_pagare.SALDO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.SALDO.Summary)

				' FECVEN
				Alumnos_para_subir_DICOM_pagare.FECVEN.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.FECVEN.Summary)
				Alumnos_para_subir_DICOM_pagare.FECVEN.ViewValue = ew_FormatDateTime(Alumnos_para_subir_DICOM_pagare.FECVEN.ViewValue, 7)

				' FECDEUDA
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.FECDEUDA.Summary)
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.ViewValue = ew_FormatDateTime(Alumnos_para_subir_DICOM_pagare.FECDEUDA.ViewValue, 7)
			Else

				' Nombre_alumno
				Alumnos_para_subir_DICOM_pagare.Nombre_alumno.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.Nombre_alumno.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.Nombre_alumno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Alumnos_para_subir_DICOM_pagare.PATERNO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.PATERNO.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Alumnos_para_subir_DICOM_pagare.MATERNO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.MATERNO.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' rut
				Alumnos_para_subir_DICOM_pagare.rut.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.rut.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.rut.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIG
				Alumnos_para_subir_DICOM_pagare.DIG.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.DIG.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.DIG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MAIL
				Alumnos_para_subir_DICOM_pagare.MAIL.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.MAIL.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.MAIL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOPROC
				Alumnos_para_subir_DICOM_pagare.FONOPROC.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.FONOPROC.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.FONOPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOACT
				Alumnos_para_subir_DICOM_pagare.FONOACT.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.FONOACT.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.FONOACT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Alumnos_para_subir_DICOM_pagare.CODCARR.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.CODCARR.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Carrera
				Alumnos_para_subir_DICOM_pagare.Carrera.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.Carrera.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.Carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTACAD
				Alumnos_para_subir_DICOM_pagare.ESTACAD.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.ESTACAD.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.ESTACAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				Alumnos_para_subir_DICOM_pagare.ANO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.ANO.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO
				Alumnos_para_subir_DICOM_pagare.PERIODO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.PERIODO.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.PERIODO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIPOSITU
				Alumnos_para_subir_DICOM_pagare.TIPOSITU.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.TIPOSITU.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.TIPOSITU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DESCRIPCION
				Alumnos_para_subir_DICOM_pagare.DESCRIPCION.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.DESCRIPCION.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.DESCRIPCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CodDoc
				Alumnos_para_subir_DICOM_pagare.CodDoc.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.CodDoc.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.CodDoc.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Documento
				Alumnos_para_subir_DICOM_pagare.Documento.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.Documento.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.Documento.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' numero_pagare
				Alumnos_para_subir_DICOM_pagare.numero_pagare.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.numero_pagare.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.numero_pagare.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CUOTA
				Alumnos_para_subir_DICOM_pagare.CUOTA.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.CUOTA.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.CUOTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NumCuotas
				Alumnos_para_subir_DICOM_pagare.NumCuotas.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.NumCuotas.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.NumCuotas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MONTO
				Alumnos_para_subir_DICOM_pagare.MONTO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.MONTO.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.MONTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SALDO
				Alumnos_para_subir_DICOM_pagare.SALDO.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.SALDO.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.SALDO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECVEN
				Alumnos_para_subir_DICOM_pagare.FECVEN.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.FECVEN.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.FECVEN.ViewValue = ew_FormatDateTime(Alumnos_para_subir_DICOM_pagare.FECVEN.ViewValue, 7)
				Alumnos_para_subir_DICOM_pagare.FECVEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECDEUDA
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.ViewValue = Convert.ToString(Alumnos_para_subir_DICOM_pagare.FECDEUDA.CurrentValue)
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.ViewValue = ew_FormatDateTime(Alumnos_para_subir_DICOM_pagare.FECDEUDA.ViewValue, 7)
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' Nombre_alumno
			Alumnos_para_subir_DICOM_pagare.Nombre_alumno.HrefValue = ""

			' PATERNO
			Alumnos_para_subir_DICOM_pagare.PATERNO.HrefValue = ""

			' MATERNO
			Alumnos_para_subir_DICOM_pagare.MATERNO.HrefValue = ""

			' rut
			Alumnos_para_subir_DICOM_pagare.rut.HrefValue = ""

			' DIG
			Alumnos_para_subir_DICOM_pagare.DIG.HrefValue = ""

			' MAIL
			Alumnos_para_subir_DICOM_pagare.MAIL.HrefValue = ""

			' FONOPROC
			Alumnos_para_subir_DICOM_pagare.FONOPROC.HrefValue = ""

			' FONOACT
			Alumnos_para_subir_DICOM_pagare.FONOACT.HrefValue = ""

			' CODCARR
			Alumnos_para_subir_DICOM_pagare.CODCARR.HrefValue = ""

			' Carrera
			Alumnos_para_subir_DICOM_pagare.Carrera.HrefValue = ""

			' ESTACAD
			Alumnos_para_subir_DICOM_pagare.ESTACAD.HrefValue = ""

			' ANO
			Alumnos_para_subir_DICOM_pagare.ANO.HrefValue = ""

			' PERIODO
			Alumnos_para_subir_DICOM_pagare.PERIODO.HrefValue = ""

			' TIPOSITU
			Alumnos_para_subir_DICOM_pagare.TIPOSITU.HrefValue = ""

			' DESCRIPCION
			Alumnos_para_subir_DICOM_pagare.DESCRIPCION.HrefValue = ""

			' CodDoc
			Alumnos_para_subir_DICOM_pagare.CodDoc.HrefValue = ""

			' Documento
			Alumnos_para_subir_DICOM_pagare.Documento.HrefValue = ""

			' numero_pagare
			Alumnos_para_subir_DICOM_pagare.numero_pagare.HrefValue = ""

			' CUOTA
			Alumnos_para_subir_DICOM_pagare.CUOTA.HrefValue = ""

			' NumCuotas
			Alumnos_para_subir_DICOM_pagare.NumCuotas.HrefValue = ""

			' MONTO
			Alumnos_para_subir_DICOM_pagare.MONTO.HrefValue = ""

			' SALDO
			Alumnos_para_subir_DICOM_pagare.SALDO.HrefValue = ""

			' FECVEN
			Alumnos_para_subir_DICOM_pagare.FECVEN.HrefValue = ""

			' FECDEUDA
			Alumnos_para_subir_DICOM_pagare.FECDEUDA.HrefValue = ""

			' Call Row_Rendered event
			Alumnos_para_subir_DICOM_pagare.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [Carrera] FROM " + Alumnos_para_subir_DICOM_pagare.SqlFrom
			sOrderBy = "[Carrera] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_para_subir_DICOM_pagare.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_para_subir_DICOM_pagare.Carrera.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTACAD
			sSelect = "SELECT DISTINCT [ESTACAD] FROM " + Alumnos_para_subir_DICOM_pagare.SqlFrom
			sOrderBy = "[ESTACAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_para_subir_DICOM_pagare.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO
			sSelect = "SELECT DISTINCT [ANO] FROM " + Alumnos_para_subir_DICOM_pagare.SqlFrom
			sOrderBy = "[ANO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_para_subir_DICOM_pagare.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_para_subir_DICOM_pagare.ANO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PERIODO
			sSelect = "SELECT DISTINCT [PERIODO] FROM " + Alumnos_para_subir_DICOM_pagare.SqlFrom
			sOrderBy = "[PERIODO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_para_subir_DICOM_pagare.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field TIPOSITU
			sSelect = "SELECT DISTINCT [TIPOSITU] FROM " + Alumnos_para_subir_DICOM_pagare.SqlFrom
			sOrderBy = "[TIPOSITU] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_para_subir_DICOM_pagare.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field DESCRIPCION
			sSelect = "SELECT DISTINCT [DESCRIPCION] FROM " + Alumnos_para_subir_DICOM_pagare.SqlFrom
			sOrderBy = "[DESCRIPCION] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_para_subir_DICOM_pagare.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field PATERNO
				SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.MATERNO)

				' Field rut
				SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.rut)

				' Field Carrera
				SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.Carrera.DropDownValue, Alumnos_para_subir_DICOM_pagare.Carrera)

				' Field ESTACAD
				SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownValue, Alumnos_para_subir_DICOM_pagare.ESTACAD)

				' Field ANO
				SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.ANO.DropDownValue, Alumnos_para_subir_DICOM_pagare.ANO)

				' Field PERIODO
				SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownValue, Alumnos_para_subir_DICOM_pagare.PERIODO)

				' Field TIPOSITU
				SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownValue, Alumnos_para_subir_DICOM_pagare.TIPOSITU)

				' Field DESCRIPCION
				SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownValue, Alumnos_para_subir_DICOM_pagare.DESCRIPCION)

				' Field CodDoc
				SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.CodDoc)

				' Field Documento
				SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.Documento)

				' Field FECVEN
				SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.FECVEN)

				' Field FECDEUDA
				SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.FECDEUDA)
			bSetupFilter = True ' Set up filter required
		Else

				' Field PATERNO
				If (GetFilterValues(Alumnos_para_subir_DICOM_pagare.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Alumnos_para_subir_DICOM_pagare.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field rut
				If (GetFilterValues(Alumnos_para_subir_DICOM_pagare.rut)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Carrera
				If (GetDropDownValue(Alumnos_para_subir_DICOM_pagare.Carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_para_subir_DICOM_pagare.Carrera.DropDownValue) Then
					If Not ew_SameStr(Alumnos_para_subir_DICOM_pagare.Carrera.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_para_subir_DICOM_pagare_Carrera") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ESTACAD
				If (GetDropDownValue(Alumnos_para_subir_DICOM_pagare.ESTACAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownValue) Then
					If Not ew_SameStr(Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_para_subir_DICOM_pagare_ESTACAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO
				If (GetDropDownValue(Alumnos_para_subir_DICOM_pagare.ANO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_para_subir_DICOM_pagare.ANO.DropDownValue) Then
					If Not ew_SameStr(Alumnos_para_subir_DICOM_pagare.ANO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_para_subir_DICOM_pagare_ANO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PERIODO
				If (GetDropDownValue(Alumnos_para_subir_DICOM_pagare.PERIODO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownValue) Then
					If Not ew_SameStr(Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_para_subir_DICOM_pagare_PERIODO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field TIPOSITU
				If (GetDropDownValue(Alumnos_para_subir_DICOM_pagare.TIPOSITU)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownValue) Then
					If Not ew_SameStr(Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_para_subir_DICOM_pagare_TIPOSITU") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field DESCRIPCION
				If (GetDropDownValue(Alumnos_para_subir_DICOM_pagare.DESCRIPCION)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownValue) Then
					If Not ew_SameStr(Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Alumnos_para_subir_DICOM_pagare_DESCRIPCION") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CodDoc
				If (GetFilterValues(Alumnos_para_subir_DICOM_pagare.CodDoc)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Documento
				If (GetFilterValues(Alumnos_para_subir_DICOM_pagare.Documento)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field FECVEN
				If (GetFilterValues(Alumnos_para_subir_DICOM_pagare.FECVEN)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field FECDEUDA
				If (GetFilterValues(Alumnos_para_subir_DICOM_pagare.FECDEUDA)) Then
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

			' Field PATERNO
			GetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.MATERNO)

			' Field rut
			GetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.rut)

			' Field Carrera
			GetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.Carrera)

			' Field ESTACAD
			GetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.ESTACAD)

			' Field ANO
			GetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.ANO)

			' Field PERIODO
			GetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.PERIODO)

			' Field TIPOSITU
			GetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.TIPOSITU)

			' Field DESCRIPCION
			GetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.DESCRIPCION)

			' Field CodDoc
			GetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.CodDoc)

			' Field Documento
			GetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.Documento)

			' Field FECVEN
			GetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.FECVEN)

			' Field FECDEUDA
			GetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.FECDEUDA)
		End If

		' Call page filter validated event
		Alumnos_para_subir_DICOM_pagare.Page_FilterValidated()

		' Build SQL
		' Field PATERNO

		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.MATERNO, sFilter)

		' Field rut
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.rut, sFilter)

		' Field Carrera
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.Carrera, sFilter, "")

		' Field ESTACAD
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.ESTACAD, sFilter, "")

		' Field ANO
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.ANO, sFilter, "")

		' Field PERIODO
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.PERIODO, sFilter, "")

		' Field TIPOSITU
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.TIPOSITU, sFilter, "")

		' Field DESCRIPCION
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.DESCRIPCION, sFilter, "")

		' Field CodDoc
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.CodDoc, sFilter)

		' Field Documento
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.Documento, sFilter)

		' Field FECVEN
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.FECVEN, sFilter)

		' Field FECDEUDA
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.FECDEUDA, sFilter)

		' Save parms to Session
		' Field PATERNO

		SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.MATERNO)

		' Field rut
		SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.rut)

		' Field Carrera
		SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.Carrera.DropDownValue, Alumnos_para_subir_DICOM_pagare.Carrera)

		' Field ESTACAD
		SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownValue, Alumnos_para_subir_DICOM_pagare.ESTACAD)

		' Field ANO
		SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.ANO.DropDownValue, Alumnos_para_subir_DICOM_pagare.ANO)

		' Field PERIODO
		SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownValue, Alumnos_para_subir_DICOM_pagare.PERIODO)

		' Field TIPOSITU
		SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownValue, Alumnos_para_subir_DICOM_pagare.TIPOSITU)

		' Field DESCRIPCION
		SetSessionDropDownValue(Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownValue, Alumnos_para_subir_DICOM_pagare.DESCRIPCION)

		' Field CodDoc
		SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.CodDoc)

		' Field Documento
		SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.Documento)

		' Field FECVEN
		SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.FECVEN)

		' Field FECDEUDA
		SetSessionFilterValues(Alumnos_para_subir_DICOM_pagare.FECDEUDA)

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
		If ew_Session("sv_Alumnos_para_subir_DICOM_pagare_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Alumnos_para_subir_DICOM_pagare_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Alumnos_para_subir_DICOM_pagare_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Alumnos_para_subir_DICOM_pagare_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Alumnos_para_subir_DICOM_pagare_" + parm)
		End If
		If ew_Session("so1_Alumnos_para_subir_DICOM_pagare_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Alumnos_para_subir_DICOM_pagare_" + parm))
		End If
		If ew_Session("sc_Alumnos_para_subir_DICOM_pagare_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Alumnos_para_subir_DICOM_pagare_" + parm))
		End If
		If ew_Session("sv2_Alumnos_para_subir_DICOM_pagare_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Alumnos_para_subir_DICOM_pagare_" + parm)
		End If
		If ew_Session("so2_Alumnos_para_subir_DICOM_pagare_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Alumnos_para_subir_DICOM_pagare_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Alumnos_para_subir_DICOM_pagare_" + parm) = fld.SearchValue
		ew_Session("so1_Alumnos_para_subir_DICOM_pagare_" + parm) = fld.SearchOperator
		ew_Session("sc_Alumnos_para_subir_DICOM_pagare_" + parm) = fld.SearchCondition
		ew_Session("sv2_Alumnos_para_subir_DICOM_pagare_" + parm) = fld.SearchValue2
		ew_Session("so2_Alumnos_para_subir_DICOM_pagare_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Alumnos_para_subir_DICOM_pagare_" + parm) = ""
		ew_Session("so1_Alumnos_para_subir_DICOM_pagare_" + parm) = "="
		ew_Session("sc_Alumnos_para_subir_DICOM_pagare_" + parm) = "AND"
		ew_Session("sv2_Alumnos_para_subir_DICOM_pagare_" + parm) = ""
		ew_Session("so2_Alumnos_para_subir_DICOM_pagare_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(Alumnos_para_subir_DICOM_pagare.CodDoc.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Alumnos_para_subir_DICOM_pagare.CodDoc.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Alumnos_para_subir_DICOM_pagare.FECVEN.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Alumnos_para_subir_DICOM_pagare.FECVEN.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Alumnos_para_subir_DICOM_pagare.FECVEN.SearchValue2)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Alumnos_para_subir_DICOM_pagare.FECVEN.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Alumnos_para_subir_DICOM_pagare.FECDEUDA.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Alumnos_para_subir_DICOM_pagare.FECDEUDA.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Alumnos_para_subir_DICOM_pagare.FECDEUDA.SearchValue2)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Alumnos_para_subir_DICOM_pagare.FECDEUDA.FldErrMsg()
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
		ew_Session("sel_Alumnos_para_subir_DICOM_pagare_" & parm) = ""
		ew_Session("rf_Alumnos_para_subir_DICOM_pagare_" & parm) = ""
		ew_Session("rt_Alumnos_para_subir_DICOM_pagare_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Alumnos_para_subir_DICOM_pagare.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Alumnos_para_subir_DICOM_pagare_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Alumnos_para_subir_DICOM_pagare_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Alumnos_para_subir_DICOM_pagare_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field Carrera

			Alumnos_para_subir_DICOM_pagare.Carrera.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_para_subir_DICOM_pagare.Carrera.DropDownValue = Alumnos_para_subir_DICOM_pagare.Carrera.DefaultDropDownValue

			' Field ESTACAD
			Alumnos_para_subir_DICOM_pagare.ESTACAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownValue = Alumnos_para_subir_DICOM_pagare.ESTACAD.DefaultDropDownValue

			' Field ANO
			Alumnos_para_subir_DICOM_pagare.ANO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_para_subir_DICOM_pagare.ANO.DropDownValue = Alumnos_para_subir_DICOM_pagare.ANO.DefaultDropDownValue

			' Field PERIODO
			Alumnos_para_subir_DICOM_pagare.PERIODO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownValue = Alumnos_para_subir_DICOM_pagare.PERIODO.DefaultDropDownValue

			' Field TIPOSITU
			Alumnos_para_subir_DICOM_pagare.TIPOSITU.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownValue = Alumnos_para_subir_DICOM_pagare.TIPOSITU.DefaultDropDownValue

			' Field DESCRIPCION
			Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DefaultDropDownValue = EWRPT_INIT_VALUE
			Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownValue = Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DefaultDropDownValue

		' Set up default values for extended filters
			' Field PATERNO

			SetDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.MATERNO)	

			' Field rut
			SetDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.rut, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.rut)	

			' Field CodDoc
			SetDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.CodDoc, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.CodDoc)	

			' Field Documento
			SetDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.Documento, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.Documento)	

			' Field FECVEN
			SetDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.FECVEN, "BETWEEN", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.FECVEN)	

			' Field FECDEUDA
			SetDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.FECDEUDA, "BETWEEN", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Alumnos_para_subir_DICOM_pagare.FECDEUDA)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check PATERNO extended filter
		If (TextFilterApplied(Alumnos_para_subir_DICOM_pagare.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Alumnos_para_subir_DICOM_pagare.MATERNO)) Then bFilterExist = True

		' Check rut extended filter
		If (TextFilterApplied(Alumnos_para_subir_DICOM_pagare.rut)) Then bFilterExist = True

		' Check Carrera dropdown filter
		If (NonTextFilterApplied(Alumnos_para_subir_DICOM_pagare.Carrera)) Then bFilterExist = True

		' Check ESTACAD dropdown filter
		If (NonTextFilterApplied(Alumnos_para_subir_DICOM_pagare.ESTACAD)) Then bFilterExist = True

		' Check ANO dropdown filter
		If (NonTextFilterApplied(Alumnos_para_subir_DICOM_pagare.ANO)) Then bFilterExist = True

		' Check PERIODO dropdown filter
		If (NonTextFilterApplied(Alumnos_para_subir_DICOM_pagare.PERIODO)) Then bFilterExist = True

		' Check TIPOSITU dropdown filter
		If (NonTextFilterApplied(Alumnos_para_subir_DICOM_pagare.TIPOSITU)) Then bFilterExist = True

		' Check DESCRIPCION dropdown filter
		If (NonTextFilterApplied(Alumnos_para_subir_DICOM_pagare.DESCRIPCION)) Then bFilterExist = True

		' Check CodDoc extended filter
		If (TextFilterApplied(Alumnos_para_subir_DICOM_pagare.CodDoc)) Then bFilterExist = True

		' Check Documento extended filter
		If (TextFilterApplied(Alumnos_para_subir_DICOM_pagare.Documento)) Then bFilterExist = True

		' Check FECVEN extended filter
		If (TextFilterApplied(Alumnos_para_subir_DICOM_pagare.FECVEN)) Then bFilterExist = True

		' Check FECDEUDA extended filter
		If (TextFilterApplied(Alumnos_para_subir_DICOM_pagare.FECDEUDA)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field rut
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.rut, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.rut.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Carrera
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.Carrera, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.Carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTACAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.ESTACAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.ESTACAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.ANO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.ANO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.PERIODO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.PERIODO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field TIPOSITU
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.TIPOSITU, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.TIPOSITU.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field DESCRIPCION
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Alumnos_para_subir_DICOM_pagare.DESCRIPCION, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.DESCRIPCION.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CodDoc
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.CodDoc, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.CodDoc.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Documento
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.Documento, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.Documento.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECVEN
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.FECVEN, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.FECVEN.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECDEUDA
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Alumnos_para_subir_DICOM_pagare.FECDEUDA, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Alumnos_para_subir_DICOM_pagare.FECDEUDA.FldCaption() & "<br>"
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
				Alumnos_para_subir_DICOM_pagare.OrderBy = ""
				Alumnos_para_subir_DICOM_pagare.StartGroup = 1
				Alumnos_para_subir_DICOM_pagare.Nombre_alumno.Sort = ""
				Alumnos_para_subir_DICOM_pagare.PATERNO.Sort = ""
				Alumnos_para_subir_DICOM_pagare.MATERNO.Sort = ""
				Alumnos_para_subir_DICOM_pagare.rut.Sort = ""
				Alumnos_para_subir_DICOM_pagare.DIG.Sort = ""
				Alumnos_para_subir_DICOM_pagare.MAIL.Sort = ""
				Alumnos_para_subir_DICOM_pagare.FONOPROC.Sort = ""
				Alumnos_para_subir_DICOM_pagare.FONOACT.Sort = ""
				Alumnos_para_subir_DICOM_pagare.CODCARR.Sort = ""
				Alumnos_para_subir_DICOM_pagare.Carrera.Sort = ""
				Alumnos_para_subir_DICOM_pagare.ESTACAD.Sort = ""
				Alumnos_para_subir_DICOM_pagare.ANO.Sort = ""
				Alumnos_para_subir_DICOM_pagare.PERIODO.Sort = ""
				Alumnos_para_subir_DICOM_pagare.TIPOSITU.Sort = ""
				Alumnos_para_subir_DICOM_pagare.DESCRIPCION.Sort = ""
				Alumnos_para_subir_DICOM_pagare.CodDoc.Sort = ""
				Alumnos_para_subir_DICOM_pagare.Documento.Sort = ""
				Alumnos_para_subir_DICOM_pagare.numero_pagare.Sort = ""
				Alumnos_para_subir_DICOM_pagare.CUOTA.Sort = ""
				Alumnos_para_subir_DICOM_pagare.NumCuotas.Sort = ""
				Alumnos_para_subir_DICOM_pagare.MONTO.Sort = ""
				Alumnos_para_subir_DICOM_pagare.SALDO.Sort = ""
				Alumnos_para_subir_DICOM_pagare.FECVEN.Sort = ""
				Alumnos_para_subir_DICOM_pagare.FECDEUDA.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Alumnos_para_subir_DICOM_pagare.CurrentOrder = ew_Get("order")
			Alumnos_para_subir_DICOM_pagare.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Alumnos_para_subir_DICOM_pagare.SortSql()
			Alumnos_para_subir_DICOM_pagare.OrderBy = sSortSql
			Alumnos_para_subir_DICOM_pagare.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Alumnos_para_subir_DICOM_pagare.OrderBy)) Then
			Alumnos_para_subir_DICOM_pagare.OrderBy = "[PATERNO] ASC, [MATERNO] ASC"
			Alumnos_para_subir_DICOM_pagare.PATERNO.Sort = "ASC"
			Alumnos_para_subir_DICOM_pagare.MATERNO.Sort = "ASC"
		End If
		Return Alumnos_para_subir_DICOM_pagare.OrderBy
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
		Alumnos_para_subir_DICOM_pagare_summary = New crAlumnos_para_subir_DICOM_pagare_summary(Me)
		Alumnos_para_subir_DICOM_pagare_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Alumnos_para_subir_DICOM_pagare_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Alumnos_para_subir_DICOM_pagare_summary IsNot Nothing) Then Alumnos_para_subir_DICOM_pagare_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Alumnos_para_subir_DICOM_pagare_summary = new ewrpt_Page("Alumnos_para_subir_DICOM_pagare_summary");
// page properties
Alumnos_para_subir_DICOM_pagare_summary.PageID = "summary"; // page ID
Alumnos_para_subir_DICOM_pagare_summary.FormID = "fAlumnos_para_subir_DICOM_pagaresummaryfilter"; // form ID
var EWRPT_PAGE_ID = Alumnos_para_subir_DICOM_pagare_summary.PageID;
// extend page with ValidateForm function
Alumnos_para_subir_DICOM_pagare_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_CodDoc;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Alumnos_para_subir_DICOM_pagare.CodDoc.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_FECVEN;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Alumnos_para_subir_DICOM_pagare.FECVEN.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv2_FECVEN;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Alumnos_para_subir_DICOM_pagare.FECVEN.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_FECDEUDA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Alumnos_para_subir_DICOM_pagare.FECDEUDA.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv2_FECDEUDA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Alumnos_para_subir_DICOM_pagare.FECDEUDA.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Alumnos_para_subir_DICOM_pagare_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Alumnos_para_subir_DICOM_pagare_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Alumnos_para_subir_DICOM_pagare_summary.ValidateRequired = false; // no JavaScript validation
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
<% Alumnos_para_subir_DICOM_pagare_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Alumnos_para_subir_DICOM_pagare.TableCaption() %></h1></div>
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Alumnos_para_subir_DICOM_pagare_summary.ExportExcelUrl %>"><img src="images/excel.png" alt="Exportar a Excel" border="0" title="Exportar a Excel" /></a>
<% If (Alumnos_para_subir_DICOM_pagare_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Alumnos_para_subir_DICOM_pagare_summary.ShowMessage() %>
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Alumnos_para_subir_DICOM_pagare.FilterPanelOption = 2 OrElse (Alumnos_para_subir_DICOM_pagare.FilterPanelOption = 3 AndAlso Alumnos_para_subir_DICOM_pagare_summary.FilterApplied) OrElse Alumnos_para_subir_DICOM_pagare_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Alumnos_para_subir_DICOM_pagaresmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fAlumnos_para_subir_DICOM_pagaresummaryfilter" id="fAlumnos_para_subir_DICOM_pagaresummaryfilter" action="Alumnos_para_subir_DICOM_pagaresmry.aspx" class="ewForm" onsubmit="return Alumnos_para_subir_DICOM_pagare_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Alumnos_para_subir_DICOM_pagare.FECDEUDA.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Alumnos_para_subir_DICOM_pagare.PATERNO.SearchValue) %>"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Alumnos_para_subir_DICOM_pagare.MATERNO.SearchValue) %>"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.rut.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_rut" id="sv1_rut" size="30" maxlength="30" value="<%= ew_HtmlEncode(Alumnos_para_subir_DICOM_pagare.rut.SearchValue) %>"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_rut", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.Carrera.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Carrera" id="sv_Carrera"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_Carrera", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.Carrera.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_para_subir_DICOM_pagare.Carrera.CustomFilters.Count + Alumnos_para_subir_DICOM_pagare.Carrera.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_para_subir_DICOM_pagare.Carrera.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Carrera")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.Carrera.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_para_subir_DICOM_pagare.Carrera.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.Carrera.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.ESTACAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Alumnos_para_subir_DICOM_pagare.ESTACAD.CustomFilters.Count + Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_para_subir_DICOM_pagare.ESTACAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTACAD")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownValue" id="Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTACAD" id="sv_ESTACAD" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.ESTACAD.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.ANO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO" id="sv_ANO"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_ANO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.ANO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_para_subir_DICOM_pagare.ANO.CustomFilters.Count + Alumnos_para_subir_DICOM_pagare.ANO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_para_subir_DICOM_pagare.ANO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.ANO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_para_subir_DICOM_pagare.ANO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.ANO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.PERIODO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO" id="sv_PERIODO"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_PERIODO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_para_subir_DICOM_pagare.PERIODO.CustomFilters.Count + Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_para_subir_DICOM_pagare.PERIODO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PERIODO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.PERIODO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.TIPOSITU.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_TIPOSITU" id="sv_TIPOSITU"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_TIPOSITU", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_para_subir_DICOM_pagare.TIPOSITU.CustomFilters.Count + Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_para_subir_DICOM_pagare.TIPOSITU.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "TIPOSITU")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.TIPOSITU.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.DESCRIPCION.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_DESCRIPCION" id="sv_DESCRIPCION"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_DESCRIPCION", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Alumnos_para_subir_DICOM_pagare.DESCRIPCION.CustomFilters.Count + Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Alumnos_para_subir_DICOM_pagare.DESCRIPCION.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "DESCRIPCION")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Alumnos_para_subir_DICOM_pagare.DESCRIPCION.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.CodDoc.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CodDoc" id="sv1_CodDoc" size="30" value="<%= ew_HtmlEncode(Alumnos_para_subir_DICOM_pagare.CodDoc.SearchValue) %>"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_CodDoc", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.Documento.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Documento" id="sv1_Documento" size="30" maxlength="60" value="<%= ew_HtmlEncode(Alumnos_para_subir_DICOM_pagare.Documento.SearchValue) %>"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_Documento", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.FECVEN.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("BETWEEN") %><input type="hidden" name="so1_FECVEN" id="so1_FECVEN" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECVEN" id="sv1_FECVEN" value="<%= ew_HtmlEncode(Alumnos_para_subir_DICOM_pagare.FECVEN.SearchValue) %>"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_FECVEN", " class=""ewInputCleared""", "") %>>
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
<input type="text" name="sv2_FECVEN" id="sv2_FECVEN" value="<%= ew_HtmlEncode(Alumnos_para_subir_DICOM_pagare.FECVEN.SearchValue2) %>"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_FECVEN", " class=""ewInputCleared""", "") %>>
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
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_para_subir_DICOM_pagare.FECDEUDA.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("BETWEEN") %><input type="hidden" name="so1_FECDEUDA" id="so1_FECDEUDA" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECDEUDA" id="sv1_FECDEUDA" value="<%= ew_HtmlEncode(Alumnos_para_subir_DICOM_pagare.FECDEUDA.SearchValue) %>"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_FECDEUDA", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv1_FECDEUDA" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv1_FECDEUDA", // ID of the input field
ifFormat : "%d/%m/%Y", // the date format
button : "csv1_FECDEUDA" // ID of the button
})
</script>
</span></td>
				<td></td>
					<td><span class="ewRptSearchOpr" id="btw1_FECDEUDA" name="btw1_FECDEUDA">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
					<td><span class="aspnetreportmaker" id="btw1_FECDEUDA" name="btw1_FECDEUDA">
<input type="text" name="sv2_FECDEUDA" id="sv2_FECDEUDA" value="<%= ew_HtmlEncode(Alumnos_para_subir_DICOM_pagare.FECDEUDA.SearchValue2) %>"<%= IIf(Alumnos_para_subir_DICOM_pagare_summary.ClearExtFilter = "Alumnos_para_subir_DICOM_pagare_FECDEUDA", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv2_FECDEUDA" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv2_FECDEUDA", // ID of the input field
ifFormat : "%d/%m/%Y", // the date format
button : "csv2_FECDEUDA" // ID of the button
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
<% If (Alumnos_para_subir_DICOM_pagare.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Alumnos_para_subir_DICOM_pagare_summary.ShowFilterList() %>
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
If (Alumnos_para_subir_DICOM_pagare.ExportAll AndAlso ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then
	Alumnos_para_subir_DICOM_pagare_summary.StopGrp = Alumnos_para_subir_DICOM_pagare_summary.TotalGrps
Else
	Alumnos_para_subir_DICOM_pagare_summary.StopGrp = Alumnos_para_subir_DICOM_pagare_summary.StartGrp + Alumnos_para_subir_DICOM_pagare_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Alumnos_para_subir_DICOM_pagare_summary.StopGrp > Alumnos_para_subir_DICOM_pagare_summary.TotalGrps) Then
	Alumnos_para_subir_DICOM_pagare_summary.StopGrp = Alumnos_para_subir_DICOM_pagare_summary.TotalGrps
End If
Alumnos_para_subir_DICOM_pagare_summary.RecCount = 0

' Get first row
If (Alumnos_para_subir_DICOM_pagare_summary.TotalGrps > 0) Then
	Alumnos_para_subir_DICOM_pagare_summary.GetRow() ' ASPXRPT
	Alumnos_para_subir_DICOM_pagare_summary.GrpCount = 1
End If
While ((Alumnos_para_subir_DICOM_pagare_summary.HasRow AndAlso Alumnos_para_subir_DICOM_pagare_summary.GrpIndex < Alumnos_para_subir_DICOM_pagare_summary.StopGrp) OrElse Alumnos_para_subir_DICOM_pagare_summary.ShowFirstHeader)

	' Show header
	If (Alumnos_para_subir_DICOM_pagare_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.Nombre_alumno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.Nombre_alumno))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.Nombre_alumno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.Nombre_alumno) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.Nombre_alumno.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.Nombre_alumno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.Nombre_alumno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.PATERNO) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.MATERNO) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.rut.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.rut))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.rut.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.rut) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.rut.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.rut.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.rut.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.DIG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.DIG))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.DIG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.DIG) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.DIG.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.DIG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.DIG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.MAIL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.MAIL))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.MAIL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.MAIL) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.MAIL.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.MAIL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.MAIL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.FONOPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.FONOPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.FONOPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.FONOPROC) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.FONOPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.FONOPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.FONOPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.FONOACT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.FONOACT))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.FONOACT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.FONOACT) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.FONOACT.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.FONOACT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.FONOACT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.CODCARR) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.Carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.Carrera))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.Carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.Carrera) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.Carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.Carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.Carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.ESTACAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.ESTACAD))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.ESTACAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.ESTACAD) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.ESTACAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.ESTACAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.ANO) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.PERIODO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.PERIODO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.PERIODO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.PERIODO) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.PERIODO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.PERIODO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.TIPOSITU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.TIPOSITU))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.TIPOSITU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.TIPOSITU) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.TIPOSITU.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.TIPOSITU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.TIPOSITU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.DESCRIPCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.DESCRIPCION))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.DESCRIPCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.DESCRIPCION) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.DESCRIPCION.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.DESCRIPCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.DESCRIPCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.CodDoc.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.CodDoc))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.CodDoc.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.CodDoc) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.CodDoc.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.CodDoc.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.CodDoc.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.Documento.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.Documento))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.Documento.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.Documento) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.Documento.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.Documento.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.Documento.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.numero_pagare.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.numero_pagare))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.numero_pagare.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.numero_pagare) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.numero_pagare.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.numero_pagare.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.numero_pagare.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.CUOTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.CUOTA))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.CUOTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.CUOTA) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.CUOTA.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.CUOTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.CUOTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.NumCuotas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.NumCuotas))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.NumCuotas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.NumCuotas) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.NumCuotas.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.NumCuotas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.NumCuotas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.MONTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.MONTO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.MONTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.MONTO) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.MONTO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.MONTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.MONTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.SALDO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.SALDO))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.SALDO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.SALDO) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.SALDO.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.SALDO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.SALDO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.FECVEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.FECVEN))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.FECVEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.FECVEN) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.FECVEN.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.FECVEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.FECVEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Alumnos_para_subir_DICOM_pagare.Export)) Then %>
<%= Alumnos_para_subir_DICOM_pagare.FECDEUDA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.FECDEUDA))) Then %>
		<td style="vertical-align: bottom;"><%= Alumnos_para_subir_DICOM_pagare.FECDEUDA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_para_subir_DICOM_pagare.SortUrl(Alumnos_para_subir_DICOM_pagare.FECDEUDA) %>',0);"><%= Alumnos_para_subir_DICOM_pagare.FECDEUDA.FldCaption() %></td><td style="width: 10px;">
		<% If (Alumnos_para_subir_DICOM_pagare.FECDEUDA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Alumnos_para_subir_DICOM_pagare.FECDEUDA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Alumnos_para_subir_DICOM_pagare_summary.ShowFirstHeader = False
	End If
	Alumnos_para_subir_DICOM_pagare_summary.RecCount += 1

		' Render detail row
		Alumnos_para_subir_DICOM_pagare.ResetCSS()
		Alumnos_para_subir_DICOM_pagare.RowType = EWRPT_ROWTYPE_DETAIL
		Alumnos_para_subir_DICOM_pagare_summary.RenderRow()
%>
	<tr<%= Alumnos_para_subir_DICOM_pagare.RowAttributes() %>>
		<td<%= Alumnos_para_subir_DICOM_pagare.Nombre_alumno.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.Nombre_alumno.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.Nombre_alumno.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.PATERNO.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.PATERNO.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.PATERNO.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.MATERNO.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.MATERNO.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.MATERNO.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.rut.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.rut.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.rut.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.DIG.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.DIG.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.DIG.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.MAIL.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.MAIL.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.MAIL.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.FONOPROC.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.FONOPROC.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.FONOPROC.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.FONOACT.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.FONOACT.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.FONOACT.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.CODCARR.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.CODCARR.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.CODCARR.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.Carrera.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.Carrera.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.Carrera.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.ESTACAD.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.ESTACAD.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.ESTACAD.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.ANO.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.ANO.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.ANO.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.PERIODO.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.PERIODO.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.PERIODO.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.TIPOSITU.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.TIPOSITU.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.TIPOSITU.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.DESCRIPCION.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.DESCRIPCION.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.DESCRIPCION.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.CodDoc.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.CodDoc.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.CodDoc.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.Documento.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.Documento.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.Documento.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.numero_pagare.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.numero_pagare.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.numero_pagare.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.CUOTA.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.CUOTA.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.CUOTA.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.NumCuotas.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.NumCuotas.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.NumCuotas.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.MONTO.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.MONTO.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.MONTO.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.SALDO.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.SALDO.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.SALDO.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.FECVEN.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.FECVEN.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.FECVEN.ListViewValue%></div>
</td>
		<td<%= Alumnos_para_subir_DICOM_pagare.FECDEUDA.CellAttributes %>>
<div<%= Alumnos_para_subir_DICOM_pagare.FECDEUDA.ViewAttributes%>><%= Alumnos_para_subir_DICOM_pagare.FECDEUDA.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Alumnos_para_subir_DICOM_pagare_summary.AccumulateSummary()

		' Get next record
		Alumnos_para_subir_DICOM_pagare_summary.GetRow() ' ASPXRPT
		Alumnos_para_subir_DICOM_pagare_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Alumnos_para_subir_DICOM_pagare_summary.TotalGrps > 0) Then
	Alumnos_para_subir_DICOM_pagare.ResetCSS()
	Alumnos_para_subir_DICOM_pagare.RowType = EWRPT_ROWTYPE_TOTAL
	Alumnos_para_subir_DICOM_pagare.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Alumnos_para_subir_DICOM_pagare.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Alumnos_para_subir_DICOM_pagare.RowAttrs("class") = "ewRptGrandSummary"
	Alumnos_para_subir_DICOM_pagare_summary.RenderRow()
%>
	<!-- tr><td colspan="24"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Alumnos_para_subir_DICOM_pagare.RowAttributes() %>><td colspan="24"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Alumnos_para_subir_DICOM_pagare_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Alumnos_para_subir_DICOM_pagare_summary.Pager Is Nothing Then Alumnos_para_subir_DICOM_pagare_summary.Pager = New cPrevNextPager(Alumnos_para_subir_DICOM_pagare_summary.StartGrp, Alumnos_para_subir_DICOM_pagare_summary.DisplayGrps, Alumnos_para_subir_DICOM_pagare_summary.TotalGrps) %>
<% If Alumnos_para_subir_DICOM_pagare_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Alumnos_para_subir_DICOM_pagare_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Alumnos_para_subir_DICOM_pagaresmry.aspx?start=<%= Alumnos_para_subir_DICOM_pagare_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Alumnos_para_subir_DICOM_pagare_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Alumnos_para_subir_DICOM_pagaresmry.aspx?start=<%= Alumnos_para_subir_DICOM_pagare_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Alumnos_para_subir_DICOM_pagare_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Alumnos_para_subir_DICOM_pagare_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Alumnos_para_subir_DICOM_pagaresmry.aspx?start=<%= Alumnos_para_subir_DICOM_pagare_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Alumnos_para_subir_DICOM_pagare_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Alumnos_para_subir_DICOM_pagaresmry.aspx?start=<%= Alumnos_para_subir_DICOM_pagare_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Alumnos_para_subir_DICOM_pagare_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Alumnos_para_subir_DICOM_pagare_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Alumnos_para_subir_DICOM_pagare_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Alumnos_para_subir_DICOM_pagare_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Alumnos_para_subir_DICOM_pagare_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Alumnos_para_subir_DICOM_pagare_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Alumnos_para_subir_DICOM_pagare_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Alumnos_para_subir_DICOM_pagare_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Alumnos_para_subir_DICOM_pagare_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Alumnos_para_subir_DICOM_pagare_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Alumnos_para_subir_DICOM_pagare.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
