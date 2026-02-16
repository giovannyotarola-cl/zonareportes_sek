<%@ Page ClassName="Morosos_Futurossmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_morososFuturos" %>
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
	Public Morosos_Futuros As crMorosos_Futuros = Nothing

	'
	' Table class (for Morosos Futuros)
	'
	Public Class crMorosos_Futuros
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
				Return "Morosos_Futuros"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Morosos Futuros"
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

		Public ESTACAD As crField

		Public CODCARR As crField

		Public Carrera As crField

		Public CODFAC As crField

		Public Facultad As crField

		Public ANO As crField

		Public PERIODO As crField

		Public numero_pagare As crField

		Public CodDoc As crField

		Public Documento As crField

		Public CUOTA As crField

		Public NumCuotas As crField

		Public MONTO As crField

		Public SALDO As crField

		Public FECVEN As crField

		Public FECDEUDA As crField

		Public TIPOSITU As crField

		Public DESCRIPCION As crField

		Public USUARIO As crField

		Public MAIL As crField

		Public DIRPROC As crField

		Public COMUNAPRO As crField

		Public CIUPROC As crField

		Public FONOPROC As crField

		Public FONOACT As crField

		Public CODAPOD As crField

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
			rut = new crField("Morosos_Futuros", "Morosos Futuros", "x_rut", "rut", "[rut]", 200, EWRPT_DATATYPE_STRING, -1)
			rut.Page = APage
			rut.ParentPage = APage.ParentPage
			Fields.Add("rut", rut)
			rut.DateFilter = ""
			rut.SqlSelect = ""
			rut.SqlOrderBy = ""

			' DIG
			DIG = new crField("Morosos_Futuros", "Morosos Futuros", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
			DIG.Page = APage
			DIG.ParentPage = APage.ParentPage
			Fields.Add("DIG", DIG)
			DIG.DateFilter = ""
			DIG.SqlSelect = ""
			DIG.SqlOrderBy = ""

			' Nombre_alumno
			Nombre_alumno = new crField("Morosos_Futuros", "Morosos Futuros", "x_Nombre_alumno", "Nombre_alumno", "[Nombre_alumno]", 200, EWRPT_DATATYPE_STRING, -1)
			Nombre_alumno.Page = APage
			Nombre_alumno.ParentPage = APage.ParentPage
			Fields.Add("Nombre_alumno", Nombre_alumno)
			Nombre_alumno.DateFilter = ""
			Nombre_alumno.SqlSelect = ""
			Nombre_alumno.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Morosos_Futuros", "Morosos Futuros", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Morosos_Futuros", "Morosos Futuros", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' ESTACAD
			ESTACAD = new crField("Morosos_Futuros", "Morosos Futuros", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTACAD.Page = APage
			ESTACAD.ParentPage = APage.ParentPage
			Fields.Add("ESTACAD", ESTACAD)
			ESTACAD.DateFilter = ""
			ESTACAD.SqlSelect = ""
			ESTACAD.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Morosos_Futuros", "Morosos Futuros", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' Carrera
			Carrera = new crField("Morosos_Futuros", "Morosos Futuros", "x_Carrera", "Carrera", "[Carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			Carrera.Page = APage
			Carrera.ParentPage = APage.ParentPage
			Fields.Add("Carrera", Carrera)
			Carrera.DateFilter = ""
			Carrera.SqlSelect = ""
			Carrera.SqlOrderBy = ""

			' CODFAC
			CODFAC = new crField("Morosos_Futuros", "Morosos Futuros", "x_CODFAC", "CODFAC", "[CODFAC]", 200, EWRPT_DATATYPE_STRING, -1)
			CODFAC.Page = APage
			CODFAC.ParentPage = APage.ParentPage
			Fields.Add("CODFAC", CODFAC)
			CODFAC.DateFilter = ""
			CODFAC.SqlSelect = ""
			CODFAC.SqlOrderBy = ""

			' Facultad
			Facultad = new crField("Morosos_Futuros", "Morosos Futuros", "x_Facultad", "Facultad", "[Facultad]", 200, EWRPT_DATATYPE_STRING, -1)
			Facultad.Page = APage
			Facultad.ParentPage = APage.ParentPage
			Fields.Add("Facultad", Facultad)
			Facultad.DateFilter = ""
			Facultad.SqlSelect = ""
			Facultad.SqlOrderBy = ""

			' ANO
			ANO = new crField("Morosos_Futuros", "Morosos Futuros", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("Morosos_Futuros", "Morosos Futuros", "x_PERIODO", "PERIODO", "[PERIODO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			PERIODO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' numero_pagare
			numero_pagare = new crField("Morosos_Futuros", "Morosos Futuros", "x_numero_pagare", "numero_pagare", "[numero_pagare]", 131, EWRPT_DATATYPE_NUMBER, -1)
			numero_pagare.Page = APage
			numero_pagare.ParentPage = APage.ParentPage
			numero_pagare.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("numero_pagare", numero_pagare)
			numero_pagare.DateFilter = ""
			numero_pagare.SqlSelect = ""
			numero_pagare.SqlOrderBy = ""

			' CodDoc
			CodDoc = new crField("Morosos_Futuros", "Morosos Futuros", "x_CodDoc", "CodDoc", "[CodDoc]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CodDoc.Page = APage
			CodDoc.ParentPage = APage.ParentPage
			CodDoc.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CodDoc", CodDoc)
			CodDoc.DateFilter = ""
			CodDoc.SqlSelect = ""
			CodDoc.SqlOrderBy = ""

			' Documento
			Documento = new crField("Morosos_Futuros", "Morosos Futuros", "x_Documento", "Documento", "[Documento]", 200, EWRPT_DATATYPE_STRING, -1)
			Documento.Page = APage
			Documento.ParentPage = APage.ParentPage
			Fields.Add("Documento", Documento)
			Documento.DateFilter = ""
			Documento.SqlSelect = ""
			Documento.SqlOrderBy = ""

			' CUOTA
			CUOTA = new crField("Morosos_Futuros", "Morosos Futuros", "x_CUOTA", "CUOTA", "[CUOTA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CUOTA.Page = APage
			CUOTA.ParentPage = APage.ParentPage
			CUOTA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CUOTA", CUOTA)
			CUOTA.DateFilter = ""
			CUOTA.SqlSelect = ""
			CUOTA.SqlOrderBy = ""

			' NumCuotas
			NumCuotas = new crField("Morosos_Futuros", "Morosos Futuros", "x_NumCuotas", "NumCuotas", "[NumCuotas]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NumCuotas.Page = APage
			NumCuotas.ParentPage = APage.ParentPage
			NumCuotas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NumCuotas", NumCuotas)
			NumCuotas.DateFilter = ""
			NumCuotas.SqlSelect = ""
			NumCuotas.SqlOrderBy = ""

			' MONTO
			MONTO = new crField("Morosos_Futuros", "Morosos Futuros", "x_MONTO", "MONTO", "[MONTO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			MONTO.Page = APage
			MONTO.ParentPage = APage.ParentPage
			MONTO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("MONTO", MONTO)
			MONTO.DateFilter = ""
			MONTO.SqlSelect = ""
			MONTO.SqlOrderBy = ""

			' SALDO
			SALDO = new crField("Morosos_Futuros", "Morosos Futuros", "x_SALDO", "SALDO", "[SALDO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			SALDO.Page = APage
			SALDO.ParentPage = APage.ParentPage
			SALDO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("SALDO", SALDO)
			SALDO.DateFilter = ""
			SALDO.SqlSelect = ""
			SALDO.SqlOrderBy = ""

			' FECVEN
			FECVEN = new crField("Morosos_Futuros", "Morosos Futuros", "x_FECVEN", "FECVEN", "[FECVEN]", 135, EWRPT_DATATYPE_DATE, 7)
			FECVEN.Page = APage
			FECVEN.ParentPage = APage.ParentPage
			FECVEN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECVEN", FECVEN)
			FECVEN.DateFilter = ""
			FECVEN.SqlSelect = ""
			FECVEN.SqlOrderBy = ""

			' FECDEUDA
			FECDEUDA = new crField("Morosos_Futuros", "Morosos Futuros", "x_FECDEUDA", "FECDEUDA", "[FECDEUDA]", 135, EWRPT_DATATYPE_DATE, 7)
			FECDEUDA.Page = APage
			FECDEUDA.ParentPage = APage.ParentPage
			FECDEUDA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECDEUDA", FECDEUDA)
			FECDEUDA.DateFilter = ""
			FECDEUDA.SqlSelect = ""
			FECDEUDA.SqlOrderBy = ""

			' TIPOSITU
			TIPOSITU = new crField("Morosos_Futuros", "Morosos Futuros", "x_TIPOSITU", "TIPOSITU", "[TIPOSITU]", 131, EWRPT_DATATYPE_NUMBER, -1)
			TIPOSITU.Page = APage
			TIPOSITU.ParentPage = APage.ParentPage
			TIPOSITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("TIPOSITU", TIPOSITU)
			TIPOSITU.DateFilter = ""
			TIPOSITU.SqlSelect = ""
			TIPOSITU.SqlOrderBy = ""

			' DESCRIPCION
			DESCRIPCION = new crField("Morosos_Futuros", "Morosos Futuros", "x_DESCRIPCION", "DESCRIPCION", "[DESCRIPCION]", 200, EWRPT_DATATYPE_STRING, -1)
			DESCRIPCION.Page = APage
			DESCRIPCION.ParentPage = APage.ParentPage
			Fields.Add("DESCRIPCION", DESCRIPCION)
			DESCRIPCION.DateFilter = ""
			DESCRIPCION.SqlSelect = ""
			DESCRIPCION.SqlOrderBy = ""

			' USUARIO
			USUARIO = new crField("Morosos_Futuros", "Morosos Futuros", "x_USUARIO", "USUARIO", "[USUARIO]", 200, EWRPT_DATATYPE_STRING, -1)
			USUARIO.Page = APage
			USUARIO.ParentPage = APage.ParentPage
			Fields.Add("USUARIO", USUARIO)
			USUARIO.DateFilter = ""
			USUARIO.SqlSelect = ""
			USUARIO.SqlOrderBy = ""

			' MAIL
			MAIL = new crField("Morosos_Futuros", "Morosos Futuros", "x_MAIL", "MAIL", "[MAIL]", 200, EWRPT_DATATYPE_STRING, -1)
			MAIL.Page = APage
			MAIL.ParentPage = APage.ParentPage
			Fields.Add("MAIL", MAIL)
			MAIL.DateFilter = ""
			MAIL.SqlSelect = ""
			MAIL.SqlOrderBy = ""

			' DIRPROC
			DIRPROC = new crField("Morosos_Futuros", "Morosos Futuros", "x_DIRPROC", "DIRPROC", "[DIRPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			DIRPROC.Page = APage
			DIRPROC.ParentPage = APage.ParentPage
			Fields.Add("DIRPROC", DIRPROC)
			DIRPROC.DateFilter = ""
			DIRPROC.SqlSelect = ""
			DIRPROC.SqlOrderBy = ""

			' COMUNAPRO
			COMUNAPRO = new crField("Morosos_Futuros", "Morosos Futuros", "x_COMUNAPRO", "COMUNAPRO", "[COMUNAPRO]", 200, EWRPT_DATATYPE_STRING, -1)
			COMUNAPRO.Page = APage
			COMUNAPRO.ParentPage = APage.ParentPage
			Fields.Add("COMUNAPRO", COMUNAPRO)
			COMUNAPRO.DateFilter = ""
			COMUNAPRO.SqlSelect = ""
			COMUNAPRO.SqlOrderBy = ""

			' CIUPROC
			CIUPROC = new crField("Morosos_Futuros", "Morosos Futuros", "x_CIUPROC", "CIUPROC", "[CIUPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			CIUPROC.Page = APage
			CIUPROC.ParentPage = APage.ParentPage
			Fields.Add("CIUPROC", CIUPROC)
			CIUPROC.DateFilter = ""
			CIUPROC.SqlSelect = ""
			CIUPROC.SqlOrderBy = ""

			' FONOPROC
			FONOPROC = new crField("Morosos_Futuros", "Morosos Futuros", "x_FONOPROC", "FONOPROC", "[FONOPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOPROC.Page = APage
			FONOPROC.ParentPage = APage.ParentPage
			Fields.Add("FONOPROC", FONOPROC)
			FONOPROC.DateFilter = ""
			FONOPROC.SqlSelect = ""
			FONOPROC.SqlOrderBy = ""

			' FONOACT
			FONOACT = new crField("Morosos_Futuros", "Morosos Futuros", "x_FONOACT", "FONOACT", "[FONOACT]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOACT.Page = APage
			FONOACT.ParentPage = APage.ParentPage
			Fields.Add("FONOACT", FONOACT)
			FONOACT.DateFilter = ""
			FONOACT.SqlSelect = ""
			FONOACT.SqlOrderBy = ""

			' CODAPOD
			CODAPOD = new crField("Morosos_Futuros", "Morosos Futuros", "x_CODAPOD", "CODAPOD", "[CODAPOD]", 200, EWRPT_DATATYPE_STRING, -1)
			CODAPOD.Page = APage
			CODAPOD.ParentPage = APage.ParentPage
			Fields.Add("CODAPOD", CODAPOD)
			CODAPOD.DateFilter = ""
			CODAPOD.SqlSelect = ""
			CODAPOD.SqlOrderBy = ""
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
				Return "[SEK_Morosos_Futuros]"
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
	Public Morosos_Futuros_summary As crMorosos_Futuros_summary

	'
	' Page class
	'
	Public Class crMorosos_Futuros_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Morosos_Futuros.UseTokenInUrl) Then
				sUrl &= "t=" & Morosos_Futuros.TableVar & "&" ' Add page token
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
			If (Morosos_Futuros.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Morosos_Futuros.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Morosos_Futuros.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Morosos_Futurossmry 
			Get
				Return CType(m_ParentPage, Morosos_Futurossmry)
			End Get
		End Property

		' Table object (Morosos_Futuros)
		Public Property Morosos_Futuros As crMorosos_Futuros 
			Get		
				Return AspNetPage.Morosos_Futuros ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crMorosos_Futuros)
				AspNetPage.Morosos_Futuros = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_morososFuturos)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Morosos_Futuros_summary"
			m_PageObjTypeName = "crMorosos_Futuros_summary"

			' Table name
			m_TableName = "Morosos Futuros"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Morosos_Futuros)
			Morosos_Futuros = New crMorosos_Futuros(Me)			

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
				Morosos_Futuros.Export = ew_Get("export")
			End If
			gsExport = Morosos_Futuros.Export ' Get export parameter, used in header
			gsExportFile = Morosos_Futuros.TableVar ' Get export file, used in header
			If (Morosos_Futuros.Export = "excel") Then
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

		Public Val As Object() = New Object(31) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(31) {}

		Public GrandMn As Object() = New Object(31) {}

		Public GrandMx As Object() = New Object(31) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 32 ' No. of fields
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
			Morosos_Futuros.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Morosos_Futuros.SqlSelect, Morosos_Futuros.SqlWhere, Morosos_Futuros.SqlGroupBy, Morosos_Futuros.SqlHaving, Morosos_Futuros.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Morosos_Futuros.ExportAll AndAlso ew_NotEmpty(Morosos_Futuros.Export)) Then
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
				Morosos_Futuros.numero_pagare.DbValue = Row("numero_pagare")
				Morosos_Futuros.rut.DbValue = Row("rut")
				Morosos_Futuros.DIG.DbValue = Row("DIG")
				Morosos_Futuros.CODCARR.DbValue = Row("CODCARR")
				Morosos_Futuros.Carrera.DbValue = Row("Carrera")
				Morosos_Futuros.CodDoc.DbValue = Row("CodDoc")
				Morosos_Futuros.Documento.DbValue = Row("Documento")
				Morosos_Futuros.ANO.DbValue = Row("ANO")
				Morosos_Futuros.PERIODO.DbValue = Row("PERIODO")
				Morosos_Futuros.CUOTA.DbValue = Row("CUOTA")
				Morosos_Futuros.NumCuotas.DbValue = Row("NumCuotas")
				Morosos_Futuros.MONTO.DbValue = Row("MONTO")
				Morosos_Futuros.SALDO.DbValue = Row("SALDO")
				Morosos_Futuros.FECVEN.DbValue = Row("FECVEN")
				Morosos_Futuros.PATERNO.DbValue = Row("PATERNO")
				Morosos_Futuros.MATERNO.DbValue = Row("MATERNO")
				Morosos_Futuros.Nombre_alumno.DbValue = Row("Nombre_alumno")
				Morosos_Futuros.MAIL.DbValue = Row("MAIL")
				Morosos_Futuros.DIRPROC.DbValue = Row("DIRPROC")
				Morosos_Futuros.CIUPROC.DbValue = Row("CIUPROC")
				Morosos_Futuros.COMUNAPRO.DbValue = Row("COMUNAPRO")
				Morosos_Futuros.FONOPROC.DbValue = Row("FONOPROC")
				Morosos_Futuros.FONOACT.DbValue = Row("FONOACT")
				Morosos_Futuros.CODFAC.DbValue = Row("CODFAC")
				Morosos_Futuros.Facultad.DbValue = Row("Facultad")
				Morosos_Futuros.USUARIO.DbValue = Row("USUARIO")
				Morosos_Futuros.CODAPOD.DbValue = Row("CODAPOD")
				Morosos_Futuros.FECDEUDA.DbValue = Row("FECDEUDA")
				Morosos_Futuros.ESTACAD.DbValue = Row("ESTACAD")
				Morosos_Futuros.TIPOSITU.DbValue = Row("TIPOSITU")
				Morosos_Futuros.DESCRIPCION.DbValue = Row("DESCRIPCION")
				Val(1) = Morosos_Futuros.rut.CurrentValue
				Val(2) = Morosos_Futuros.DIG.CurrentValue
				Val(3) = Morosos_Futuros.Nombre_alumno.CurrentValue
				Val(4) = Morosos_Futuros.PATERNO.CurrentValue
				Val(5) = Morosos_Futuros.MATERNO.CurrentValue
				Val(6) = Morosos_Futuros.ESTACAD.CurrentValue
				Val(7) = Morosos_Futuros.CODCARR.CurrentValue
				Val(8) = Morosos_Futuros.Carrera.CurrentValue
				Val(9) = Morosos_Futuros.CODFAC.CurrentValue
				Val(10) = Morosos_Futuros.Facultad.CurrentValue
				Val(11) = Morosos_Futuros.ANO.CurrentValue
				Val(12) = Morosos_Futuros.PERIODO.CurrentValue
				Val(13) = Morosos_Futuros.numero_pagare.CurrentValue
				Val(14) = Morosos_Futuros.CodDoc.CurrentValue
				Val(15) = Morosos_Futuros.Documento.CurrentValue
				Val(16) = Morosos_Futuros.CUOTA.CurrentValue
				Val(17) = Morosos_Futuros.NumCuotas.CurrentValue
				Val(18) = Morosos_Futuros.MONTO.CurrentValue
				Val(19) = Morosos_Futuros.SALDO.CurrentValue
				Val(20) = Morosos_Futuros.FECVEN.CurrentValue
				Val(21) = Morosos_Futuros.FECDEUDA.CurrentValue
				Val(22) = Morosos_Futuros.TIPOSITU.CurrentValue
				Val(23) = Morosos_Futuros.DESCRIPCION.CurrentValue
				Val(24) = Morosos_Futuros.USUARIO.CurrentValue
				Val(25) = Morosos_Futuros.MAIL.CurrentValue
				Val(26) = Morosos_Futuros.DIRPROC.CurrentValue
				Val(27) = Morosos_Futuros.COMUNAPRO.CurrentValue
				Val(28) = Morosos_Futuros.CIUPROC.CurrentValue
				Val(29) = Morosos_Futuros.FONOPROC.CurrentValue
				Val(30) = Morosos_Futuros.FONOACT.CurrentValue
				Val(31) = Morosos_Futuros.CODAPOD.CurrentValue
			Else
				Morosos_Futuros.numero_pagare.DbValue = ""
				Morosos_Futuros.rut.DbValue = ""
				Morosos_Futuros.DIG.DbValue = ""
				Morosos_Futuros.CODCARR.DbValue = ""
				Morosos_Futuros.Carrera.DbValue = ""
				Morosos_Futuros.CodDoc.DbValue = ""
				Morosos_Futuros.Documento.DbValue = ""
				Morosos_Futuros.ANO.DbValue = ""
				Morosos_Futuros.PERIODO.DbValue = ""
				Morosos_Futuros.CUOTA.DbValue = ""
				Morosos_Futuros.NumCuotas.DbValue = ""
				Morosos_Futuros.MONTO.DbValue = ""
				Morosos_Futuros.SALDO.DbValue = ""
				Morosos_Futuros.FECVEN.DbValue = ""
				Morosos_Futuros.PATERNO.DbValue = ""
				Morosos_Futuros.MATERNO.DbValue = ""
				Morosos_Futuros.Nombre_alumno.DbValue = ""
				Morosos_Futuros.MAIL.DbValue = ""
				Morosos_Futuros.DIRPROC.DbValue = ""
				Morosos_Futuros.CIUPROC.DbValue = ""
				Morosos_Futuros.COMUNAPRO.DbValue = ""
				Morosos_Futuros.FONOPROC.DbValue = ""
				Morosos_Futuros.FONOACT.DbValue = ""
				Morosos_Futuros.CODFAC.DbValue = ""
				Morosos_Futuros.Facultad.DbValue = ""
				Morosos_Futuros.USUARIO.DbValue = ""
				Morosos_Futuros.CODAPOD.DbValue = ""
				Morosos_Futuros.FECDEUDA.DbValue = ""
				Morosos_Futuros.ESTACAD.DbValue = ""
				Morosos_Futuros.TIPOSITU.DbValue = ""
				Morosos_Futuros.DESCRIPCION.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Morosos_Futuros.numero_pagare.DbValue = dr("numero_pagare")
				Morosos_Futuros.rut.DbValue = dr("rut")
				Morosos_Futuros.DIG.DbValue = dr("DIG")
				Morosos_Futuros.CODCARR.DbValue = dr("CODCARR")
				Morosos_Futuros.Carrera.DbValue = dr("Carrera")
				Morosos_Futuros.CodDoc.DbValue = dr("CodDoc")
				Morosos_Futuros.Documento.DbValue = dr("Documento")
				Morosos_Futuros.ANO.DbValue = dr("ANO")
				Morosos_Futuros.PERIODO.DbValue = dr("PERIODO")
				Morosos_Futuros.CUOTA.DbValue = dr("CUOTA")
				Morosos_Futuros.NumCuotas.DbValue = dr("NumCuotas")
				Morosos_Futuros.MONTO.DbValue = dr("MONTO")
				Morosos_Futuros.SALDO.DbValue = dr("SALDO")
				Morosos_Futuros.FECVEN.DbValue = dr("FECVEN")
				Morosos_Futuros.PATERNO.DbValue = dr("PATERNO")
				Morosos_Futuros.MATERNO.DbValue = dr("MATERNO")
				Morosos_Futuros.Nombre_alumno.DbValue = dr("Nombre_alumno")
				Morosos_Futuros.MAIL.DbValue = dr("MAIL")
				Morosos_Futuros.DIRPROC.DbValue = dr("DIRPROC")
				Morosos_Futuros.CIUPROC.DbValue = dr("CIUPROC")
				Morosos_Futuros.COMUNAPRO.DbValue = dr("COMUNAPRO")
				Morosos_Futuros.FONOPROC.DbValue = dr("FONOPROC")
				Morosos_Futuros.FONOACT.DbValue = dr("FONOACT")
				Morosos_Futuros.CODFAC.DbValue = dr("CODFAC")
				Morosos_Futuros.Facultad.DbValue = dr("Facultad")
				Morosos_Futuros.USUARIO.DbValue = dr("USUARIO")
				Morosos_Futuros.CODAPOD.DbValue = dr("CODAPOD")
				Morosos_Futuros.FECDEUDA.DbValue = dr("FECDEUDA")
				Morosos_Futuros.ESTACAD.DbValue = dr("ESTACAD")
				Morosos_Futuros.TIPOSITU.DbValue = dr("TIPOSITU")
				Morosos_Futuros.DESCRIPCION.DbValue = dr("DESCRIPCION")
				Val(1) = Morosos_Futuros.rut.CurrentValue
				Val(2) = Morosos_Futuros.DIG.CurrentValue
				Val(3) = Morosos_Futuros.Nombre_alumno.CurrentValue
				Val(4) = Morosos_Futuros.PATERNO.CurrentValue
				Val(5) = Morosos_Futuros.MATERNO.CurrentValue
				Val(6) = Morosos_Futuros.ESTACAD.CurrentValue
				Val(7) = Morosos_Futuros.CODCARR.CurrentValue
				Val(8) = Morosos_Futuros.Carrera.CurrentValue
				Val(9) = Morosos_Futuros.CODFAC.CurrentValue
				Val(10) = Morosos_Futuros.Facultad.CurrentValue
				Val(11) = Morosos_Futuros.ANO.CurrentValue
				Val(12) = Morosos_Futuros.PERIODO.CurrentValue
				Val(13) = Morosos_Futuros.numero_pagare.CurrentValue
				Val(14) = Morosos_Futuros.CodDoc.CurrentValue
				Val(15) = Morosos_Futuros.Documento.CurrentValue
				Val(16) = Morosos_Futuros.CUOTA.CurrentValue
				Val(17) = Morosos_Futuros.NumCuotas.CurrentValue
				Val(18) = Morosos_Futuros.MONTO.CurrentValue
				Val(19) = Morosos_Futuros.SALDO.CurrentValue
				Val(20) = Morosos_Futuros.FECVEN.CurrentValue
				Val(21) = Morosos_Futuros.FECDEUDA.CurrentValue
				Val(22) = Morosos_Futuros.TIPOSITU.CurrentValue
				Val(23) = Morosos_Futuros.DESCRIPCION.CurrentValue
				Val(24) = Morosos_Futuros.USUARIO.CurrentValue
				Val(25) = Morosos_Futuros.MAIL.CurrentValue
				Val(26) = Morosos_Futuros.DIRPROC.CurrentValue
				Val(27) = Morosos_Futuros.COMUNAPRO.CurrentValue
				Val(28) = Morosos_Futuros.CIUPROC.CurrentValue
				Val(29) = Morosos_Futuros.FONOPROC.CurrentValue
				Val(30) = Morosos_Futuros.FONOACT.CurrentValue
				Val(31) = Morosos_Futuros.CODAPOD.CurrentValue
			Else				
				Morosos_Futuros.numero_pagare.DbValue = ""
				Morosos_Futuros.rut.DbValue = ""
				Morosos_Futuros.DIG.DbValue = ""
				Morosos_Futuros.CODCARR.DbValue = ""
				Morosos_Futuros.Carrera.DbValue = ""
				Morosos_Futuros.CodDoc.DbValue = ""
				Morosos_Futuros.Documento.DbValue = ""
				Morosos_Futuros.ANO.DbValue = ""
				Morosos_Futuros.PERIODO.DbValue = ""
				Morosos_Futuros.CUOTA.DbValue = ""
				Morosos_Futuros.NumCuotas.DbValue = ""
				Morosos_Futuros.MONTO.DbValue = ""
				Morosos_Futuros.SALDO.DbValue = ""
				Morosos_Futuros.FECVEN.DbValue = ""
				Morosos_Futuros.PATERNO.DbValue = ""
				Morosos_Futuros.MATERNO.DbValue = ""
				Morosos_Futuros.Nombre_alumno.DbValue = ""
				Morosos_Futuros.MAIL.DbValue = ""
				Morosos_Futuros.DIRPROC.DbValue = ""
				Morosos_Futuros.CIUPROC.DbValue = ""
				Morosos_Futuros.COMUNAPRO.DbValue = ""
				Morosos_Futuros.FONOPROC.DbValue = ""
				Morosos_Futuros.FONOACT.DbValue = ""
				Morosos_Futuros.CODFAC.DbValue = ""
				Morosos_Futuros.Facultad.DbValue = ""
				Morosos_Futuros.USUARIO.DbValue = ""
				Morosos_Futuros.CODAPOD.DbValue = ""
				Morosos_Futuros.FECDEUDA.DbValue = ""
				Morosos_Futuros.ESTACAD.DbValue = ""
				Morosos_Futuros.TIPOSITU.DbValue = ""
				Morosos_Futuros.DESCRIPCION.DbValue = ""
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
				Morosos_Futuros.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Morosos_Futuros.StartGroup = StartGrp
				Else
					StartGrp = Morosos_Futuros.StartGroup
				End If
			Else
				StartGrp = Morosos_Futuros.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Morosos_Futuros.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Morosos_Futuros.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Morosos_Futuros.StartGroup = StartGrp
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
			Morosos_Futuros.StartGroup = StartGrp
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
				Morosos_Futuros.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Morosos_Futuros.StartGroup = StartGrp
			Else				
				If (Morosos_Futuros.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Morosos_Futuros.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Morosos_Futuros.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Morosos_Futuros.SqlSelectCount, Morosos_Futuros.SqlWhere, Morosos_Futuros.SqlGroupBy, Morosos_Futuros.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Morosos_Futuros.Row_Rendering()

			'
			' Render view codes
			'

			If (Morosos_Futuros.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' rut
				Morosos_Futuros.rut.ViewValue = Convert.ToString(Morosos_Futuros.rut.Summary)

				' DIG
				Morosos_Futuros.DIG.ViewValue = Convert.ToString(Morosos_Futuros.DIG.Summary)

				' Nombre_alumno
				Morosos_Futuros.Nombre_alumno.ViewValue = Convert.ToString(Morosos_Futuros.Nombre_alumno.Summary)

				' PATERNO
				Morosos_Futuros.PATERNO.ViewValue = Convert.ToString(Morosos_Futuros.PATERNO.Summary)

				' MATERNO
				Morosos_Futuros.MATERNO.ViewValue = Convert.ToString(Morosos_Futuros.MATERNO.Summary)

				' ESTACAD
				Morosos_Futuros.ESTACAD.ViewValue = Convert.ToString(Morosos_Futuros.ESTACAD.Summary)

				' CODCARR
				Morosos_Futuros.CODCARR.ViewValue = Convert.ToString(Morosos_Futuros.CODCARR.Summary)

				' Carrera
				Morosos_Futuros.Carrera.ViewValue = Convert.ToString(Morosos_Futuros.Carrera.Summary)

				' CODFAC
				Morosos_Futuros.CODFAC.ViewValue = Convert.ToString(Morosos_Futuros.CODFAC.Summary)

				' Facultad
				Morosos_Futuros.Facultad.ViewValue = Convert.ToString(Morosos_Futuros.Facultad.Summary)

				' ANO
				Morosos_Futuros.ANO.ViewValue = Convert.ToString(Morosos_Futuros.ANO.Summary)

				' PERIODO
				Morosos_Futuros.PERIODO.ViewValue = Convert.ToString(Morosos_Futuros.PERIODO.Summary)

				' numero_pagare
				Morosos_Futuros.numero_pagare.ViewValue = Convert.ToString(Morosos_Futuros.numero_pagare.Summary)

				' CodDoc
				Morosos_Futuros.CodDoc.ViewValue = Convert.ToString(Morosos_Futuros.CodDoc.Summary)

				' Documento
				Morosos_Futuros.Documento.ViewValue = Convert.ToString(Morosos_Futuros.Documento.Summary)

				' CUOTA
				Morosos_Futuros.CUOTA.ViewValue = Convert.ToString(Morosos_Futuros.CUOTA.Summary)

				' NumCuotas
				Morosos_Futuros.NumCuotas.ViewValue = Convert.ToString(Morosos_Futuros.NumCuotas.Summary)

				' MONTO
				Morosos_Futuros.MONTO.ViewValue = Convert.ToString(Morosos_Futuros.MONTO.Summary)

				' SALDO
				Morosos_Futuros.SALDO.ViewValue = Convert.ToString(Morosos_Futuros.SALDO.Summary)

				' FECVEN
				Morosos_Futuros.FECVEN.ViewValue = Convert.ToString(Morosos_Futuros.FECVEN.Summary)
				Morosos_Futuros.FECVEN.ViewValue = ew_FormatDateTime(Morosos_Futuros.FECVEN.ViewValue, 7)

				' FECDEUDA
				Morosos_Futuros.FECDEUDA.ViewValue = Convert.ToString(Morosos_Futuros.FECDEUDA.Summary)
				Morosos_Futuros.FECDEUDA.ViewValue = ew_FormatDateTime(Morosos_Futuros.FECDEUDA.ViewValue, 7)

				' TIPOSITU
				Morosos_Futuros.TIPOSITU.ViewValue = Convert.ToString(Morosos_Futuros.TIPOSITU.Summary)

				' DESCRIPCION
				Morosos_Futuros.DESCRIPCION.ViewValue = Convert.ToString(Morosos_Futuros.DESCRIPCION.Summary)

				' USUARIO
				Morosos_Futuros.USUARIO.ViewValue = Convert.ToString(Morosos_Futuros.USUARIO.Summary)

				' MAIL
				Morosos_Futuros.MAIL.ViewValue = Convert.ToString(Morosos_Futuros.MAIL.Summary)

				' DIRPROC
				Morosos_Futuros.DIRPROC.ViewValue = Convert.ToString(Morosos_Futuros.DIRPROC.Summary)

				' COMUNAPRO
				Morosos_Futuros.COMUNAPRO.ViewValue = Convert.ToString(Morosos_Futuros.COMUNAPRO.Summary)

				' CIUPROC
				Morosos_Futuros.CIUPROC.ViewValue = Convert.ToString(Morosos_Futuros.CIUPROC.Summary)

				' FONOPROC
				Morosos_Futuros.FONOPROC.ViewValue = Convert.ToString(Morosos_Futuros.FONOPROC.Summary)

				' FONOACT
				Morosos_Futuros.FONOACT.ViewValue = Convert.ToString(Morosos_Futuros.FONOACT.Summary)

				' CODAPOD
				Morosos_Futuros.CODAPOD.ViewValue = Convert.ToString(Morosos_Futuros.CODAPOD.Summary)
			Else

				' rut
				Morosos_Futuros.rut.ViewValue = Convert.ToString(Morosos_Futuros.rut.CurrentValue)
				Morosos_Futuros.rut.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIG
				Morosos_Futuros.DIG.ViewValue = Convert.ToString(Morosos_Futuros.DIG.CurrentValue)
				Morosos_Futuros.DIG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Nombre_alumno
				Morosos_Futuros.Nombre_alumno.ViewValue = Convert.ToString(Morosos_Futuros.Nombre_alumno.CurrentValue)
				Morosos_Futuros.Nombre_alumno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Morosos_Futuros.PATERNO.ViewValue = Convert.ToString(Morosos_Futuros.PATERNO.CurrentValue)
				Morosos_Futuros.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Morosos_Futuros.MATERNO.ViewValue = Convert.ToString(Morosos_Futuros.MATERNO.CurrentValue)
				Morosos_Futuros.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTACAD
				Morosos_Futuros.ESTACAD.ViewValue = Convert.ToString(Morosos_Futuros.ESTACAD.CurrentValue)
				Morosos_Futuros.ESTACAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Morosos_Futuros.CODCARR.ViewValue = Convert.ToString(Morosos_Futuros.CODCARR.CurrentValue)
				Morosos_Futuros.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Carrera
				Morosos_Futuros.Carrera.ViewValue = Convert.ToString(Morosos_Futuros.Carrera.CurrentValue)
				Morosos_Futuros.Carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODFAC
				Morosos_Futuros.CODFAC.ViewValue = Convert.ToString(Morosos_Futuros.CODFAC.CurrentValue)
				Morosos_Futuros.CODFAC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Facultad
				Morosos_Futuros.Facultad.ViewValue = Convert.ToString(Morosos_Futuros.Facultad.CurrentValue)
				Morosos_Futuros.Facultad.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				Morosos_Futuros.ANO.ViewValue = Convert.ToString(Morosos_Futuros.ANO.CurrentValue)
				Morosos_Futuros.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO
				Morosos_Futuros.PERIODO.ViewValue = Convert.ToString(Morosos_Futuros.PERIODO.CurrentValue)
				Morosos_Futuros.PERIODO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' numero_pagare
				Morosos_Futuros.numero_pagare.ViewValue = Convert.ToString(Morosos_Futuros.numero_pagare.CurrentValue)
				Morosos_Futuros.numero_pagare.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CodDoc
				Morosos_Futuros.CodDoc.ViewValue = Convert.ToString(Morosos_Futuros.CodDoc.CurrentValue)
				Morosos_Futuros.CodDoc.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Documento
				Morosos_Futuros.Documento.ViewValue = Convert.ToString(Morosos_Futuros.Documento.CurrentValue)
				Morosos_Futuros.Documento.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CUOTA
				Morosos_Futuros.CUOTA.ViewValue = Convert.ToString(Morosos_Futuros.CUOTA.CurrentValue)
				Morosos_Futuros.CUOTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NumCuotas
				Morosos_Futuros.NumCuotas.ViewValue = Convert.ToString(Morosos_Futuros.NumCuotas.CurrentValue)
				Morosos_Futuros.NumCuotas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MONTO
				Morosos_Futuros.MONTO.ViewValue = Convert.ToString(Morosos_Futuros.MONTO.CurrentValue)
				Morosos_Futuros.MONTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SALDO
				Morosos_Futuros.SALDO.ViewValue = Convert.ToString(Morosos_Futuros.SALDO.CurrentValue)
				Morosos_Futuros.SALDO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECVEN
				Morosos_Futuros.FECVEN.ViewValue = Convert.ToString(Morosos_Futuros.FECVEN.CurrentValue)
				Morosos_Futuros.FECVEN.ViewValue = ew_FormatDateTime(Morosos_Futuros.FECVEN.ViewValue, 7)
				Morosos_Futuros.FECVEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECDEUDA
				Morosos_Futuros.FECDEUDA.ViewValue = Convert.ToString(Morosos_Futuros.FECDEUDA.CurrentValue)
				Morosos_Futuros.FECDEUDA.ViewValue = ew_FormatDateTime(Morosos_Futuros.FECDEUDA.ViewValue, 7)
				Morosos_Futuros.FECDEUDA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIPOSITU
				Morosos_Futuros.TIPOSITU.ViewValue = Convert.ToString(Morosos_Futuros.TIPOSITU.CurrentValue)
				Morosos_Futuros.TIPOSITU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DESCRIPCION
				Morosos_Futuros.DESCRIPCION.ViewValue = Convert.ToString(Morosos_Futuros.DESCRIPCION.CurrentValue)
				Morosos_Futuros.DESCRIPCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' USUARIO
				Morosos_Futuros.USUARIO.ViewValue = Convert.ToString(Morosos_Futuros.USUARIO.CurrentValue)
				Morosos_Futuros.USUARIO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MAIL
				Morosos_Futuros.MAIL.ViewValue = Convert.ToString(Morosos_Futuros.MAIL.CurrentValue)
				Morosos_Futuros.MAIL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIRPROC
				Morosos_Futuros.DIRPROC.ViewValue = Convert.ToString(Morosos_Futuros.DIRPROC.CurrentValue)
				Morosos_Futuros.DIRPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' COMUNAPRO
				Morosos_Futuros.COMUNAPRO.ViewValue = Convert.ToString(Morosos_Futuros.COMUNAPRO.CurrentValue)
				Morosos_Futuros.COMUNAPRO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CIUPROC
				Morosos_Futuros.CIUPROC.ViewValue = Convert.ToString(Morosos_Futuros.CIUPROC.CurrentValue)
				Morosos_Futuros.CIUPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOPROC
				Morosos_Futuros.FONOPROC.ViewValue = Convert.ToString(Morosos_Futuros.FONOPROC.CurrentValue)
				Morosos_Futuros.FONOPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOACT
				Morosos_Futuros.FONOACT.ViewValue = Convert.ToString(Morosos_Futuros.FONOACT.CurrentValue)
				Morosos_Futuros.FONOACT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODAPOD
				Morosos_Futuros.CODAPOD.ViewValue = Convert.ToString(Morosos_Futuros.CODAPOD.CurrentValue)
				Morosos_Futuros.CODAPOD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' rut
			Morosos_Futuros.rut.HrefValue = ""

			' DIG
			Morosos_Futuros.DIG.HrefValue = ""

			' Nombre_alumno
			Morosos_Futuros.Nombre_alumno.HrefValue = ""

			' PATERNO
			Morosos_Futuros.PATERNO.HrefValue = ""

			' MATERNO
			Morosos_Futuros.MATERNO.HrefValue = ""

			' ESTACAD
			Morosos_Futuros.ESTACAD.HrefValue = ""

			' CODCARR
			Morosos_Futuros.CODCARR.HrefValue = ""

			' Carrera
			Morosos_Futuros.Carrera.HrefValue = ""

			' CODFAC
			Morosos_Futuros.CODFAC.HrefValue = ""

			' Facultad
			Morosos_Futuros.Facultad.HrefValue = ""

			' ANO
			Morosos_Futuros.ANO.HrefValue = ""

			' PERIODO
			Morosos_Futuros.PERIODO.HrefValue = ""

			' numero_pagare
			Morosos_Futuros.numero_pagare.HrefValue = ""

			' CodDoc
			Morosos_Futuros.CodDoc.HrefValue = ""

			' Documento
			Morosos_Futuros.Documento.HrefValue = ""

			' CUOTA
			Morosos_Futuros.CUOTA.HrefValue = ""

			' NumCuotas
			Morosos_Futuros.NumCuotas.HrefValue = ""

			' MONTO
			Morosos_Futuros.MONTO.HrefValue = ""

			' SALDO
			Morosos_Futuros.SALDO.HrefValue = ""

			' FECVEN
			Morosos_Futuros.FECVEN.HrefValue = ""

			' FECDEUDA
			Morosos_Futuros.FECDEUDA.HrefValue = ""

			' TIPOSITU
			Morosos_Futuros.TIPOSITU.HrefValue = ""

			' DESCRIPCION
			Morosos_Futuros.DESCRIPCION.HrefValue = ""

			' USUARIO
			Morosos_Futuros.USUARIO.HrefValue = ""

			' MAIL
			Morosos_Futuros.MAIL.HrefValue = ""

			' DIRPROC
			Morosos_Futuros.DIRPROC.HrefValue = ""

			' COMUNAPRO
			Morosos_Futuros.COMUNAPRO.HrefValue = ""

			' CIUPROC
			Morosos_Futuros.CIUPROC.HrefValue = ""

			' FONOPROC
			Morosos_Futuros.FONOPROC.HrefValue = ""

			' FONOACT
			Morosos_Futuros.FONOACT.HrefValue = ""

			' CODAPOD
			Morosos_Futuros.CODAPOD.HrefValue = ""

			' Call Row_Rendered event
			Morosos_Futuros.Row_Rendered()
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

			' Field ESTACAD
			sSelect = "SELECT DISTINCT [ESTACAD] FROM " + Morosos_Futuros.SqlFrom
			sOrderBy = "[ESTACAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Morosos_Futuros.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Morosos_Futuros.ESTACAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Carrera
			sSelect = "SELECT DISTINCT [Carrera] FROM " + Morosos_Futuros.SqlFrom
			sOrderBy = "[Carrera] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Morosos_Futuros.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Morosos_Futuros.Carrera.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Facultad
			sSelect = "SELECT DISTINCT [Facultad] FROM " + Morosos_Futuros.SqlFrom
			sOrderBy = "[Facultad] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Morosos_Futuros.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Morosos_Futuros.Facultad.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO
			sSelect = "SELECT DISTINCT [ANO] FROM " + Morosos_Futuros.SqlFrom
			sOrderBy = "[ANO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Morosos_Futuros.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Morosos_Futuros.ANO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PERIODO
			sSelect = "SELECT DISTINCT [PERIODO] FROM " + Morosos_Futuros.SqlFrom
			sOrderBy = "[PERIODO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Morosos_Futuros.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Morosos_Futuros.PERIODO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Documento
			sSelect = "SELECT DISTINCT [Documento] FROM " + Morosos_Futuros.SqlFrom
			sOrderBy = "[Documento] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Morosos_Futuros.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Morosos_Futuros.Documento.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field TIPOSITU
			sSelect = "SELECT DISTINCT [TIPOSITU] FROM " + Morosos_Futuros.SqlFrom
			sOrderBy = "[TIPOSITU] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Morosos_Futuros.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Morosos_Futuros.TIPOSITU.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field DESCRIPCION
			sSelect = "SELECT DISTINCT [DESCRIPCION] FROM " + Morosos_Futuros.SqlFrom
			sOrderBy = "[DESCRIPCION] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Morosos_Futuros.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Morosos_Futuros.DESCRIPCION.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(Morosos_Futuros.rut)

				' Field PATERNO
				SetSessionFilterValues(Morosos_Futuros.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Morosos_Futuros.MATERNO)

				' Field ESTACAD
				SetSessionDropDownValue(Morosos_Futuros.ESTACAD.DropDownValue, Morosos_Futuros.ESTACAD)

				' Field Carrera
				SetSessionDropDownValue(Morosos_Futuros.Carrera.DropDownValue, Morosos_Futuros.Carrera)

				' Field Facultad
				SetSessionDropDownValue(Morosos_Futuros.Facultad.DropDownValue, Morosos_Futuros.Facultad)

				' Field ANO
				SetSessionDropDownValue(Morosos_Futuros.ANO.DropDownValue, Morosos_Futuros.ANO)

				' Field PERIODO
				SetSessionDropDownValue(Morosos_Futuros.PERIODO.DropDownValue, Morosos_Futuros.PERIODO)

				' Field numero_pagare
				SetSessionFilterValues(Morosos_Futuros.numero_pagare)

				' Field Documento
				SetSessionDropDownValue(Morosos_Futuros.Documento.DropDownValue, Morosos_Futuros.Documento)

				' Field FECVEN
				SetSessionFilterValues(Morosos_Futuros.FECVEN)

				' Field TIPOSITU
				SetSessionDropDownValue(Morosos_Futuros.TIPOSITU.DropDownValue, Morosos_Futuros.TIPOSITU)

				' Field DESCRIPCION
				SetSessionDropDownValue(Morosos_Futuros.DESCRIPCION.DropDownValue, Morosos_Futuros.DESCRIPCION)
			bSetupFilter = True ' Set up filter required
		Else

				' Field rut
				If (GetFilterValues(Morosos_Futuros.rut)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Morosos_Futuros.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Morosos_Futuros.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ESTACAD
				If (GetDropDownValue(Morosos_Futuros.ESTACAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Morosos_Futuros.ESTACAD.DropDownValue) Then
					If Not ew_SameStr(Morosos_Futuros.ESTACAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Morosos_Futuros_ESTACAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Carrera
				If (GetDropDownValue(Morosos_Futuros.Carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Morosos_Futuros.Carrera.DropDownValue) Then
					If Not ew_SameStr(Morosos_Futuros.Carrera.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Morosos_Futuros_Carrera") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Facultad
				If (GetDropDownValue(Morosos_Futuros.Facultad)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Morosos_Futuros.Facultad.DropDownValue) Then
					If Not ew_SameStr(Morosos_Futuros.Facultad.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Morosos_Futuros_Facultad") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO
				If (GetDropDownValue(Morosos_Futuros.ANO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Morosos_Futuros.ANO.DropDownValue) Then
					If Not ew_SameStr(Morosos_Futuros.ANO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Morosos_Futuros_ANO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PERIODO
				If (GetDropDownValue(Morosos_Futuros.PERIODO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Morosos_Futuros.PERIODO.DropDownValue) Then
					If Not ew_SameStr(Morosos_Futuros.PERIODO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Morosos_Futuros_PERIODO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field numero_pagare
				If (GetFilterValues(Morosos_Futuros.numero_pagare)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Documento
				If (GetDropDownValue(Morosos_Futuros.Documento)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Morosos_Futuros.Documento.DropDownValue) Then
					If Not ew_SameStr(Morosos_Futuros.Documento.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Morosos_Futuros_Documento") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field FECVEN
				If (GetFilterValues(Morosos_Futuros.FECVEN)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field TIPOSITU
				If (GetDropDownValue(Morosos_Futuros.TIPOSITU)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Morosos_Futuros.TIPOSITU.DropDownValue) Then
					If Not ew_SameStr(Morosos_Futuros.TIPOSITU.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Morosos_Futuros_TIPOSITU") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field DESCRIPCION
				If (GetDropDownValue(Morosos_Futuros.DESCRIPCION)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Morosos_Futuros.DESCRIPCION.DropDownValue) Then
					If Not ew_SameStr(Morosos_Futuros.DESCRIPCION.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Morosos_Futuros_DESCRIPCION") Is Nothing Then
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

			' Field rut
			GetSessionFilterValues(Morosos_Futuros.rut)

			' Field PATERNO
			GetSessionFilterValues(Morosos_Futuros.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Morosos_Futuros.MATERNO)

			' Field ESTACAD
			GetSessionDropDownValue(Morosos_Futuros.ESTACAD)

			' Field Carrera
			GetSessionDropDownValue(Morosos_Futuros.Carrera)

			' Field Facultad
			GetSessionDropDownValue(Morosos_Futuros.Facultad)

			' Field ANO
			GetSessionDropDownValue(Morosos_Futuros.ANO)

			' Field PERIODO
			GetSessionDropDownValue(Morosos_Futuros.PERIODO)

			' Field numero_pagare
			GetSessionFilterValues(Morosos_Futuros.numero_pagare)

			' Field Documento
			GetSessionDropDownValue(Morosos_Futuros.Documento)

			' Field FECVEN
			GetSessionFilterValues(Morosos_Futuros.FECVEN)

			' Field TIPOSITU
			GetSessionDropDownValue(Morosos_Futuros.TIPOSITU)

			' Field DESCRIPCION
			GetSessionDropDownValue(Morosos_Futuros.DESCRIPCION)
		End If

		' Call page filter validated event
		Morosos_Futuros.Page_FilterValidated()

		' Build SQL
		' Field rut

		BuildExtendedFilter(Morosos_Futuros.rut, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Morosos_Futuros.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Morosos_Futuros.MATERNO, sFilter)

		' Field ESTACAD
		BuildDropDownFilter(Morosos_Futuros.ESTACAD, sFilter, "")

		' Field Carrera
		BuildDropDownFilter(Morosos_Futuros.Carrera, sFilter, "")

		' Field Facultad
		BuildDropDownFilter(Morosos_Futuros.Facultad, sFilter, "")

		' Field ANO
		BuildDropDownFilter(Morosos_Futuros.ANO, sFilter, "")

		' Field PERIODO
		BuildDropDownFilter(Morosos_Futuros.PERIODO, sFilter, "")

		' Field numero_pagare
		BuildExtendedFilter(Morosos_Futuros.numero_pagare, sFilter)

		' Field Documento
		BuildDropDownFilter(Morosos_Futuros.Documento, sFilter, "")

		' Field FECVEN
		BuildExtendedFilter(Morosos_Futuros.FECVEN, sFilter)

		' Field TIPOSITU
		BuildDropDownFilter(Morosos_Futuros.TIPOSITU, sFilter, "")

		' Field DESCRIPCION
		BuildDropDownFilter(Morosos_Futuros.DESCRIPCION, sFilter, "")

		' Save parms to Session
		' Field rut

		SetSessionFilterValues(Morosos_Futuros.rut)

		' Field PATERNO
		SetSessionFilterValues(Morosos_Futuros.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Morosos_Futuros.MATERNO)

		' Field ESTACAD
		SetSessionDropDownValue(Morosos_Futuros.ESTACAD.DropDownValue, Morosos_Futuros.ESTACAD)

		' Field Carrera
		SetSessionDropDownValue(Morosos_Futuros.Carrera.DropDownValue, Morosos_Futuros.Carrera)

		' Field Facultad
		SetSessionDropDownValue(Morosos_Futuros.Facultad.DropDownValue, Morosos_Futuros.Facultad)

		' Field ANO
		SetSessionDropDownValue(Morosos_Futuros.ANO.DropDownValue, Morosos_Futuros.ANO)

		' Field PERIODO
		SetSessionDropDownValue(Morosos_Futuros.PERIODO.DropDownValue, Morosos_Futuros.PERIODO)

		' Field numero_pagare
		SetSessionFilterValues(Morosos_Futuros.numero_pagare)

		' Field Documento
		SetSessionDropDownValue(Morosos_Futuros.Documento.DropDownValue, Morosos_Futuros.Documento)

		' Field FECVEN
		SetSessionFilterValues(Morosos_Futuros.FECVEN)

		' Field TIPOSITU
		SetSessionDropDownValue(Morosos_Futuros.TIPOSITU.DropDownValue, Morosos_Futuros.TIPOSITU)

		' Field DESCRIPCION
		SetSessionDropDownValue(Morosos_Futuros.DESCRIPCION.DropDownValue, Morosos_Futuros.DESCRIPCION)

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
		If ew_Session("sv_Morosos_Futuros_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Morosos_Futuros_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Morosos_Futuros_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Morosos_Futuros_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Morosos_Futuros_" + parm)
		End If
		If ew_Session("so1_Morosos_Futuros_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Morosos_Futuros_" + parm))
		End If
		If ew_Session("sc_Morosos_Futuros_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Morosos_Futuros_" + parm))
		End If
		If ew_Session("sv2_Morosos_Futuros_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Morosos_Futuros_" + parm)
		End If
		If ew_Session("so2_Morosos_Futuros_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Morosos_Futuros_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Morosos_Futuros_" + parm) = fld.SearchValue
		ew_Session("so1_Morosos_Futuros_" + parm) = fld.SearchOperator
		ew_Session("sc_Morosos_Futuros_" + parm) = fld.SearchCondition
		ew_Session("sv2_Morosos_Futuros_" + parm) = fld.SearchValue2
		ew_Session("so2_Morosos_Futuros_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Morosos_Futuros_" + parm) = ""
		ew_Session("so1_Morosos_Futuros_" + parm) = "="
		ew_Session("sc_Morosos_Futuros_" + parm) = "AND"
		ew_Session("sv2_Morosos_Futuros_" + parm) = ""
		ew_Session("so2_Morosos_Futuros_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(Morosos_Futuros.numero_pagare.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Morosos_Futuros.numero_pagare.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Morosos_Futuros.FECVEN.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Morosos_Futuros.FECVEN.FldErrMsg()
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
		ew_Session("sel_Morosos_Futuros_" & parm) = ""
		ew_Session("rf_Morosos_Futuros_" & parm) = ""
		ew_Session("rt_Morosos_Futuros_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Morosos_Futuros.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Morosos_Futuros_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Morosos_Futuros_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Morosos_Futuros_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field ESTACAD

			Morosos_Futuros.ESTACAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			Morosos_Futuros.ESTACAD.DropDownValue = Morosos_Futuros.ESTACAD.DefaultDropDownValue

			' Field Carrera
			Morosos_Futuros.Carrera.DefaultDropDownValue = EWRPT_INIT_VALUE
			Morosos_Futuros.Carrera.DropDownValue = Morosos_Futuros.Carrera.DefaultDropDownValue

			' Field Facultad
			Morosos_Futuros.Facultad.DefaultDropDownValue = EWRPT_INIT_VALUE
			Morosos_Futuros.Facultad.DropDownValue = Morosos_Futuros.Facultad.DefaultDropDownValue

			' Field ANO
			Morosos_Futuros.ANO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Morosos_Futuros.ANO.DropDownValue = Morosos_Futuros.ANO.DefaultDropDownValue

			' Field PERIODO
			Morosos_Futuros.PERIODO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Morosos_Futuros.PERIODO.DropDownValue = Morosos_Futuros.PERIODO.DefaultDropDownValue

			' Field Documento
			Morosos_Futuros.Documento.DefaultDropDownValue = EWRPT_INIT_VALUE
			Morosos_Futuros.Documento.DropDownValue = Morosos_Futuros.Documento.DefaultDropDownValue

			' Field TIPOSITU
			Morosos_Futuros.TIPOSITU.DefaultDropDownValue = EWRPT_INIT_VALUE
			Morosos_Futuros.TIPOSITU.DropDownValue = Morosos_Futuros.TIPOSITU.DefaultDropDownValue

			' Field DESCRIPCION
			Morosos_Futuros.DESCRIPCION.DefaultDropDownValue = EWRPT_INIT_VALUE
			Morosos_Futuros.DESCRIPCION.DropDownValue = Morosos_Futuros.DESCRIPCION.DefaultDropDownValue

		' Set up default values for extended filters
			' Field rut

			SetDefaultExtFilter(Morosos_Futuros.rut, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Morosos_Futuros.rut)	

			' Field PATERNO
			SetDefaultExtFilter(Morosos_Futuros.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Morosos_Futuros.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Morosos_Futuros.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Morosos_Futuros.MATERNO)	

			' Field numero_pagare
			SetDefaultExtFilter(Morosos_Futuros.numero_pagare, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Morosos_Futuros.numero_pagare)	

			' Field FECVEN
			SetDefaultExtFilter(Morosos_Futuros.FECVEN, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Morosos_Futuros.FECVEN)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check rut extended filter
		If (TextFilterApplied(Morosos_Futuros.rut)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Morosos_Futuros.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Morosos_Futuros.MATERNO)) Then bFilterExist = True

		' Check ESTACAD dropdown filter
		If (NonTextFilterApplied(Morosos_Futuros.ESTACAD)) Then bFilterExist = True

		' Check Carrera dropdown filter
		If (NonTextFilterApplied(Morosos_Futuros.Carrera)) Then bFilterExist = True

		' Check Facultad dropdown filter
		If (NonTextFilterApplied(Morosos_Futuros.Facultad)) Then bFilterExist = True

		' Check ANO dropdown filter
		If (NonTextFilterApplied(Morosos_Futuros.ANO)) Then bFilterExist = True

		' Check PERIODO dropdown filter
		If (NonTextFilterApplied(Morosos_Futuros.PERIODO)) Then bFilterExist = True

		' Check numero_pagare extended filter
		If (TextFilterApplied(Morosos_Futuros.numero_pagare)) Then bFilterExist = True

		' Check Documento dropdown filter
		If (NonTextFilterApplied(Morosos_Futuros.Documento)) Then bFilterExist = True

		' Check FECVEN extended filter
		If (TextFilterApplied(Morosos_Futuros.FECVEN)) Then bFilterExist = True

		' Check TIPOSITU dropdown filter
		If (NonTextFilterApplied(Morosos_Futuros.TIPOSITU)) Then bFilterExist = True

		' Check DESCRIPCION dropdown filter
		If (NonTextFilterApplied(Morosos_Futuros.DESCRIPCION)) Then bFilterExist = True
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
		BuildExtendedFilter(Morosos_Futuros.rut, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.rut.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Morosos_Futuros.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Morosos_Futuros.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTACAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Morosos_Futuros.ESTACAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.ESTACAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Carrera
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Morosos_Futuros.Carrera, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.Carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Facultad
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Morosos_Futuros.Facultad, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.Facultad.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Morosos_Futuros.ANO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.ANO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Morosos_Futuros.PERIODO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.PERIODO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field numero_pagare
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Morosos_Futuros.numero_pagare, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.numero_pagare.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Documento
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Morosos_Futuros.Documento, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.Documento.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECVEN
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Morosos_Futuros.FECVEN, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.FECVEN.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field TIPOSITU
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Morosos_Futuros.TIPOSITU, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.TIPOSITU.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field DESCRIPCION
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Morosos_Futuros.DESCRIPCION, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Morosos_Futuros.DESCRIPCION.FldCaption() & "<br>"
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
				Morosos_Futuros.OrderBy = ""
				Morosos_Futuros.StartGroup = 1
				Morosos_Futuros.rut.Sort = ""
				Morosos_Futuros.DIG.Sort = ""
				Morosos_Futuros.Nombre_alumno.Sort = ""
				Morosos_Futuros.PATERNO.Sort = ""
				Morosos_Futuros.MATERNO.Sort = ""
				Morosos_Futuros.ESTACAD.Sort = ""
				Morosos_Futuros.CODCARR.Sort = ""
				Morosos_Futuros.Carrera.Sort = ""
				Morosos_Futuros.CODFAC.Sort = ""
				Morosos_Futuros.Facultad.Sort = ""
				Morosos_Futuros.ANO.Sort = ""
				Morosos_Futuros.PERIODO.Sort = ""
				Morosos_Futuros.numero_pagare.Sort = ""
				Morosos_Futuros.CodDoc.Sort = ""
				Morosos_Futuros.Documento.Sort = ""
				Morosos_Futuros.CUOTA.Sort = ""
				Morosos_Futuros.NumCuotas.Sort = ""
				Morosos_Futuros.MONTO.Sort = ""
				Morosos_Futuros.SALDO.Sort = ""
				Morosos_Futuros.FECVEN.Sort = ""
				Morosos_Futuros.FECDEUDA.Sort = ""
				Morosos_Futuros.TIPOSITU.Sort = ""
				Morosos_Futuros.DESCRIPCION.Sort = ""
				Morosos_Futuros.USUARIO.Sort = ""
				Morosos_Futuros.MAIL.Sort = ""
				Morosos_Futuros.DIRPROC.Sort = ""
				Morosos_Futuros.COMUNAPRO.Sort = ""
				Morosos_Futuros.CIUPROC.Sort = ""
				Morosos_Futuros.FONOPROC.Sort = ""
				Morosos_Futuros.FONOACT.Sort = ""
				Morosos_Futuros.CODAPOD.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Morosos_Futuros.CurrentOrder = ew_Get("order")
			Morosos_Futuros.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Morosos_Futuros.SortSql()
			Morosos_Futuros.OrderBy = sSortSql
			Morosos_Futuros.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Morosos_Futuros.OrderBy)) Then
			Morosos_Futuros.OrderBy = "[FECVEN] ASC, [PATERNO] ASC, [MATERNO] ASC"
			Morosos_Futuros.FECVEN.Sort = "ASC"
			Morosos_Futuros.PATERNO.Sort = "ASC"
			Morosos_Futuros.MATERNO.Sort = "ASC"
		End If
		Return Morosos_Futuros.OrderBy
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
		Morosos_Futuros_summary = New crMorosos_Futuros_summary(Me)
		Morosos_Futuros_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Morosos_Futuros_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Morosos_Futuros_summary IsNot Nothing) Then Morosos_Futuros_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Morosos_Futuros.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Morosos_Futuros_summary = new ewrpt_Page("Morosos_Futuros_summary");
// page properties
Morosos_Futuros_summary.PageID = "summary"; // page ID
Morosos_Futuros_summary.FormID = "fMorosos_Futurossummaryfilter"; // form ID
var EWRPT_PAGE_ID = Morosos_Futuros_summary.PageID;
// extend page with ValidateForm function
Morosos_Futuros_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_numero_pagare;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Morosos_Futuros.numero_pagare.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_FECVEN;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Morosos_Futuros.FECVEN.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Morosos_Futuros_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Morosos_Futuros_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Morosos_Futuros_summary.ValidateRequired = false; // no JavaScript validation
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
<% Morosos_Futuros_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Morosos_Futuros.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Morosos_Futuros.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Morosos_Futuros.TableCaption() %></h1></div>
<% If (Morosos_Futuros.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Morosos_Futuros_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" alt="Exportar a Excel" title="Exportar a Excel" /></a>
<% If (Morosos_Futuros_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Morosos_Futuros_summary.ShowMessage() %>
<% If (Morosos_Futuros.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Morosos_Futuros.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Morosos_Futuros.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Morosos_Futuros.FilterPanelOption = 2 OrElse (Morosos_Futuros.FilterPanelOption = 3 AndAlso Morosos_Futuros_summary.FilterApplied) OrElse Morosos_Futuros_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Morosos_Futurossmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fMorosos_Futurossummaryfilter" id="fMorosos_Futurossummaryfilter" action="Morosos_Futurossmry.aspx" class="ewForm" onsubmit="return Morosos_Futuros_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Morosos_Futuros.FECVEN.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.rut.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_rut" id="sv1_rut" size="30" maxlength="30" value="<%= ew_HtmlEncode(Morosos_Futuros.rut.SearchValue) %>"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_rut", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Morosos_Futuros.PATERNO.SearchValue) %>"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Morosos_Futuros.MATERNO.SearchValue) %>"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.ESTACAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Morosos_Futuros.ESTACAD.CustomFilters.Count + Morosos_Futuros.ESTACAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Morosos_Futuros.ESTACAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTACAD")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Morosos_Futuros.ESTACAD.DropDownValue" id="Morosos_Futuros.ESTACAD.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.ESTACAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Morosos_Futuros.ESTACAD.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTACAD" id="sv_ESTACAD" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.ESTACAD.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.Carrera.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Carrera" id="sv_Carrera"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_Carrera", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.Carrera.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Morosos_Futuros.Carrera.CustomFilters.Count + Morosos_Futuros.Carrera.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Morosos_Futuros.Carrera.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Carrera")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.Carrera.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Morosos_Futuros.Carrera.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.Carrera.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.Facultad.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Facultad" id="sv_Facultad"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_Facultad", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.Facultad.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Morosos_Futuros.Facultad.CustomFilters.Count + Morosos_Futuros.Facultad.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Morosos_Futuros.Facultad.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Facultad")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.Facultad.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Morosos_Futuros.Facultad.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.Facultad.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.ANO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO" id="sv_ANO"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_ANO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.ANO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Morosos_Futuros.ANO.CustomFilters.Count + Morosos_Futuros.ANO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Morosos_Futuros.ANO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.ANO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Morosos_Futuros.ANO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.ANO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.PERIODO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO" id="sv_PERIODO"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_PERIODO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.PERIODO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Morosos_Futuros.PERIODO.CustomFilters.Count + Morosos_Futuros.PERIODO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Morosos_Futuros.PERIODO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PERIODO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.PERIODO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Morosos_Futuros.PERIODO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.PERIODO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.numero_pagare.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_numero_pagare" id="sv1_numero_pagare" size="30" value="<%= ew_HtmlEncode(Morosos_Futuros.numero_pagare.SearchValue) %>"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_numero_pagare", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.Documento.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Documento" id="sv_Documento"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_Documento", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.Documento.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Morosos_Futuros.Documento.CustomFilters.Count + Morosos_Futuros.Documento.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Morosos_Futuros.Documento.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Documento")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.Documento.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Morosos_Futuros.Documento.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.Documento.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.FECVEN.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECVEN" id="sv1_FECVEN" value="<%= ew_HtmlEncode(Morosos_Futuros.FECVEN.SearchValue) %>"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_FECVEN", " class=""ewInputCleared""", "") %>>
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
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.TIPOSITU.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_TIPOSITU" id="sv_TIPOSITU"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_TIPOSITU", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.TIPOSITU.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Morosos_Futuros.TIPOSITU.CustomFilters.Count + Morosos_Futuros.TIPOSITU.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Morosos_Futuros.TIPOSITU.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "TIPOSITU")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.TIPOSITU.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Morosos_Futuros.TIPOSITU.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.TIPOSITU.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Morosos_Futuros.DESCRIPCION.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_DESCRIPCION" id="sv_DESCRIPCION"<%= IIf(Morosos_Futuros_summary.ClearExtFilter = "Morosos_Futuros_DESCRIPCION", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.DESCRIPCION.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Morosos_Futuros.DESCRIPCION.CustomFilters.Count + Morosos_Futuros.DESCRIPCION.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Morosos_Futuros.DESCRIPCION.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "DESCRIPCION")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.DESCRIPCION.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Morosos_Futuros.DESCRIPCION.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Morosos_Futuros.DESCRIPCION.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (Morosos_Futuros.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Morosos_Futuros_summary.ShowFilterList() %>
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
If (Morosos_Futuros.ExportAll AndAlso ew_NotEmpty(Morosos_Futuros.Export)) Then
	Morosos_Futuros_summary.StopGrp = Morosos_Futuros_summary.TotalGrps
Else
	Morosos_Futuros_summary.StopGrp = Morosos_Futuros_summary.StartGrp + Morosos_Futuros_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Morosos_Futuros_summary.StopGrp > Morosos_Futuros_summary.TotalGrps) Then
	Morosos_Futuros_summary.StopGrp = Morosos_Futuros_summary.TotalGrps
End If
Morosos_Futuros_summary.RecCount = 0

' Get first row
If (Morosos_Futuros_summary.TotalGrps > 0) Then
	Morosos_Futuros_summary.GetRow() ' ASPXRPT
	Morosos_Futuros_summary.GrpCount = 1
End If
While ((Morosos_Futuros_summary.HasRow AndAlso Morosos_Futuros_summary.GrpIndex < Morosos_Futuros_summary.StopGrp) OrElse Morosos_Futuros_summary.ShowFirstHeader)

	' Show header
	If (Morosos_Futuros_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.rut.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.rut))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.rut.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.rut) %>',0);"><%= Morosos_Futuros.rut.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.rut.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.rut.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.DIG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.DIG))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.DIG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.DIG) %>',0);"><%= Morosos_Futuros.DIG.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.DIG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.DIG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.Nombre_alumno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.Nombre_alumno))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.Nombre_alumno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.Nombre_alumno) %>',0);"><%= Morosos_Futuros.Nombre_alumno.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.Nombre_alumno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.Nombre_alumno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.PATERNO) %>',0);"><%= Morosos_Futuros.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.MATERNO) %>',0);"><%= Morosos_Futuros.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.ESTACAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.ESTACAD))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.ESTACAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.ESTACAD) %>',0);"><%= Morosos_Futuros.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.ESTACAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.ESTACAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.CODCARR) %>',0);"><%= Morosos_Futuros.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.Carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.Carrera))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.Carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.Carrera) %>',0);"><%= Morosos_Futuros.Carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.Carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.Carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.CODFAC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.CODFAC))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.CODFAC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.CODFAC) %>',0);"><%= Morosos_Futuros.CODFAC.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.CODFAC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.CODFAC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.Facultad.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.Facultad))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.Facultad.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.Facultad) %>',0);"><%= Morosos_Futuros.Facultad.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.Facultad.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.Facultad.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.ANO) %>',0);"><%= Morosos_Futuros.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.PERIODO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.PERIODO))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.PERIODO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.PERIODO) %>',0);"><%= Morosos_Futuros.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.PERIODO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.PERIODO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.numero_pagare.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.numero_pagare))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.numero_pagare.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.numero_pagare) %>',0);"><%= Morosos_Futuros.numero_pagare.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.numero_pagare.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.numero_pagare.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.CodDoc.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.CodDoc))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.CodDoc.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.CodDoc) %>',0);"><%= Morosos_Futuros.CodDoc.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.CodDoc.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.CodDoc.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.Documento.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.Documento))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.Documento.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.Documento) %>',0);"><%= Morosos_Futuros.Documento.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.Documento.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.Documento.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.CUOTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.CUOTA))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.CUOTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.CUOTA) %>',0);"><%= Morosos_Futuros.CUOTA.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.CUOTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.CUOTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.NumCuotas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.NumCuotas))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.NumCuotas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.NumCuotas) %>',0);"><%= Morosos_Futuros.NumCuotas.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.NumCuotas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.NumCuotas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.MONTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.MONTO))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.MONTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.MONTO) %>',0);"><%= Morosos_Futuros.MONTO.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.MONTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.MONTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.SALDO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.SALDO))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.SALDO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.SALDO) %>',0);"><%= Morosos_Futuros.SALDO.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.SALDO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.SALDO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.FECVEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.FECVEN))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.FECVEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.FECVEN) %>',0);"><%= Morosos_Futuros.FECVEN.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.FECVEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.FECVEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.FECDEUDA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.FECDEUDA))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.FECDEUDA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.FECDEUDA) %>',0);"><%= Morosos_Futuros.FECDEUDA.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.FECDEUDA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.FECDEUDA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.TIPOSITU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.TIPOSITU))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.TIPOSITU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.TIPOSITU) %>',0);"><%= Morosos_Futuros.TIPOSITU.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.TIPOSITU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.TIPOSITU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.DESCRIPCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.DESCRIPCION))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.DESCRIPCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.DESCRIPCION) %>',0);"><%= Morosos_Futuros.DESCRIPCION.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.DESCRIPCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.DESCRIPCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.USUARIO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.USUARIO))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.USUARIO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.USUARIO) %>',0);"><%= Morosos_Futuros.USUARIO.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.USUARIO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.USUARIO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.MAIL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.MAIL))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.MAIL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.MAIL) %>',0);"><%= Morosos_Futuros.MAIL.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.MAIL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.MAIL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.DIRPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.DIRPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.DIRPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.DIRPROC) %>',0);"><%= Morosos_Futuros.DIRPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.DIRPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.DIRPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.COMUNAPRO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.COMUNAPRO))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.COMUNAPRO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.COMUNAPRO) %>',0);"><%= Morosos_Futuros.COMUNAPRO.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.COMUNAPRO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.COMUNAPRO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.CIUPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.CIUPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.CIUPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.CIUPROC) %>',0);"><%= Morosos_Futuros.CIUPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.CIUPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.CIUPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.FONOPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.FONOPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.FONOPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.FONOPROC) %>',0);"><%= Morosos_Futuros.FONOPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.FONOPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.FONOPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.FONOACT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.FONOACT))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.FONOACT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.FONOACT) %>',0);"><%= Morosos_Futuros.FONOACT.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.FONOACT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.FONOACT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Morosos_Futuros.Export)) Then %>
<%= Morosos_Futuros.CODAPOD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Morosos_Futuros.SortUrl(Morosos_Futuros.CODAPOD))) Then %>
		<td style="vertical-align: bottom;"><%= Morosos_Futuros.CODAPOD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Morosos_Futuros.SortUrl(Morosos_Futuros.CODAPOD) %>',0);"><%= Morosos_Futuros.CODAPOD.FldCaption() %></td><td style="width: 10px;">
		<% If (Morosos_Futuros.CODAPOD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Morosos_Futuros.CODAPOD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Morosos_Futuros_summary.ShowFirstHeader = False
	End If
	Morosos_Futuros_summary.RecCount += 1

		' Render detail row
		Morosos_Futuros.ResetCSS()
		Morosos_Futuros.RowType = EWRPT_ROWTYPE_DETAIL
		Morosos_Futuros_summary.RenderRow()
%>
	<tr<%= Morosos_Futuros.RowAttributes() %>>
		<td<%= Morosos_Futuros.rut.CellAttributes %>>
<div<%= Morosos_Futuros.rut.ViewAttributes%>><%= Morosos_Futuros.rut.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.DIG.CellAttributes %>>
<div<%= Morosos_Futuros.DIG.ViewAttributes%>><%= Morosos_Futuros.DIG.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.Nombre_alumno.CellAttributes %>>
<div<%= Morosos_Futuros.Nombre_alumno.ViewAttributes%>><%= Morosos_Futuros.Nombre_alumno.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.PATERNO.CellAttributes %>>
<div<%= Morosos_Futuros.PATERNO.ViewAttributes%>><%= Morosos_Futuros.PATERNO.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.MATERNO.CellAttributes %>>
<div<%= Morosos_Futuros.MATERNO.ViewAttributes%>><%= Morosos_Futuros.MATERNO.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.ESTACAD.CellAttributes %>>
<div<%= Morosos_Futuros.ESTACAD.ViewAttributes%>><%= Morosos_Futuros.ESTACAD.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.CODCARR.CellAttributes %>>
<div<%= Morosos_Futuros.CODCARR.ViewAttributes%>><%= Morosos_Futuros.CODCARR.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.Carrera.CellAttributes %>>
<div<%= Morosos_Futuros.Carrera.ViewAttributes%>><%= Morosos_Futuros.Carrera.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.CODFAC.CellAttributes %>>
<div<%= Morosos_Futuros.CODFAC.ViewAttributes%>><%= Morosos_Futuros.CODFAC.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.Facultad.CellAttributes %>>
<div<%= Morosos_Futuros.Facultad.ViewAttributes%>><%= Morosos_Futuros.Facultad.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.ANO.CellAttributes %>>
<div<%= Morosos_Futuros.ANO.ViewAttributes%>><%= Morosos_Futuros.ANO.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.PERIODO.CellAttributes %>>
<div<%= Morosos_Futuros.PERIODO.ViewAttributes%>><%= Morosos_Futuros.PERIODO.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.numero_pagare.CellAttributes %>>
<div<%= Morosos_Futuros.numero_pagare.ViewAttributes%>><%= Morosos_Futuros.numero_pagare.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.CodDoc.CellAttributes %>>
<div<%= Morosos_Futuros.CodDoc.ViewAttributes%>><%= Morosos_Futuros.CodDoc.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.Documento.CellAttributes %>>
<div<%= Morosos_Futuros.Documento.ViewAttributes%>><%= Morosos_Futuros.Documento.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.CUOTA.CellAttributes %>>
<div<%= Morosos_Futuros.CUOTA.ViewAttributes%>><%= Morosos_Futuros.CUOTA.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.NumCuotas.CellAttributes %>>
<div<%= Morosos_Futuros.NumCuotas.ViewAttributes%>><%= Morosos_Futuros.NumCuotas.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.MONTO.CellAttributes %>>
<div<%= Morosos_Futuros.MONTO.ViewAttributes%>><%= Morosos_Futuros.MONTO.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.SALDO.CellAttributes %>>
<div<%= Morosos_Futuros.SALDO.ViewAttributes%>><%= Morosos_Futuros.SALDO.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.FECVEN.CellAttributes %>>
<div<%= Morosos_Futuros.FECVEN.ViewAttributes%>><%= Morosos_Futuros.FECVEN.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.FECDEUDA.CellAttributes %>>
<div<%= Morosos_Futuros.FECDEUDA.ViewAttributes%>><%= Morosos_Futuros.FECDEUDA.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.TIPOSITU.CellAttributes %>>
<div<%= Morosos_Futuros.TIPOSITU.ViewAttributes%>><%= Morosos_Futuros.TIPOSITU.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.DESCRIPCION.CellAttributes %>>
<div<%= Morosos_Futuros.DESCRIPCION.ViewAttributes%>><%= Morosos_Futuros.DESCRIPCION.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.USUARIO.CellAttributes %>>
<div<%= Morosos_Futuros.USUARIO.ViewAttributes%>><%= Morosos_Futuros.USUARIO.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.MAIL.CellAttributes %>>
<div<%= Morosos_Futuros.MAIL.ViewAttributes%>><%= Morosos_Futuros.MAIL.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.DIRPROC.CellAttributes %>>
<div<%= Morosos_Futuros.DIRPROC.ViewAttributes%>><%= Morosos_Futuros.DIRPROC.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.COMUNAPRO.CellAttributes %>>
<div<%= Morosos_Futuros.COMUNAPRO.ViewAttributes%>><%= Morosos_Futuros.COMUNAPRO.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.CIUPROC.CellAttributes %>>
<div<%= Morosos_Futuros.CIUPROC.ViewAttributes%>><%= Morosos_Futuros.CIUPROC.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.FONOPROC.CellAttributes %>>
<div<%= Morosos_Futuros.FONOPROC.ViewAttributes%>><%= Morosos_Futuros.FONOPROC.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.FONOACT.CellAttributes %>>
<div<%= Morosos_Futuros.FONOACT.ViewAttributes%>><%= Morosos_Futuros.FONOACT.ListViewValue%></div>
</td>
		<td<%= Morosos_Futuros.CODAPOD.CellAttributes %>>
<div<%= Morosos_Futuros.CODAPOD.ViewAttributes%>><%= Morosos_Futuros.CODAPOD.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Morosos_Futuros_summary.AccumulateSummary()

		' Get next record
		Morosos_Futuros_summary.GetRow() ' ASPXRPT
		Morosos_Futuros_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Morosos_Futuros_summary.TotalGrps > 0) Then
	Morosos_Futuros.ResetCSS()
	Morosos_Futuros.RowType = EWRPT_ROWTYPE_TOTAL
	Morosos_Futuros.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Morosos_Futuros.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Morosos_Futuros.RowAttrs("class") = "ewRptGrandSummary"
	Morosos_Futuros_summary.RenderRow()
%>
	<!-- tr><td colspan="31"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Morosos_Futuros.RowAttributes() %>><td colspan="31"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Morosos_Futuros_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Morosos_Futuros.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Morosos_Futuros_summary.Pager Is Nothing Then Morosos_Futuros_summary.Pager = New cPrevNextPager(Morosos_Futuros_summary.StartGrp, Morosos_Futuros_summary.DisplayGrps, Morosos_Futuros_summary.TotalGrps) %>
<% If Morosos_Futuros_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Morosos_Futuros_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Morosos_Futurossmry.aspx?start=<%= Morosos_Futuros_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Morosos_Futuros_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Morosos_Futurossmry.aspx?start=<%= Morosos_Futuros_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Morosos_Futuros_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Morosos_Futuros_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Morosos_Futurossmry.aspx?start=<%= Morosos_Futuros_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Morosos_Futuros_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Morosos_Futurossmry.aspx?start=<%= Morosos_Futuros_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Morosos_Futuros_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Morosos_Futuros_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Morosos_Futuros_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Morosos_Futuros_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Morosos_Futuros_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Morosos_Futuros_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Morosos_Futuros_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Morosos_Futuros_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Morosos_Futuros_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Morosos_Futuros.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Morosos_Futuros.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Morosos_Futuros.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Morosos_Futuros_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Morosos_Futuros.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
