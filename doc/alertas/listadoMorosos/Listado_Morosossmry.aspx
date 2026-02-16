<%@ Page ClassName="Listado_Morosossmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_listado_morosos" %>
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
	Public Listado_Morosos As crListado_Morosos = Nothing

	'
	' Table class (for Listado Morosos)
	'
	Public Class crListado_Morosos
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
				Return "Listado_Morosos"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Listado Morosos"
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

		Public MAIL As crField

		Public DIRPROC As crField

		Public COMUNAPRO As crField

		Public CIUPROC As crField

		Public FONOPROC As crField

		Public FONOACT As crField

		Public CODAPOD As crField

		Public CODCARR As crField

		Public Carrera As crField

		Public CODFAC As crField

		Public Facultad As crField

		Public ANO As crField

		Public PERIODO As crField

		Public ESTACAD As crField

		Public numero_pagare As crField

		Public CodDoc As crField

		Public Documento As crField

		Public CUOTA As crField

		Public NumCuotas As crField

		Public MONTO As crField

		Public SALDO As crField

		Public FECVEN As crField

		Public USUARIO As crField

		Public FECDEUDA As crField

		Public TIPOSITU As crField

		Public DESCRIPCION As crField

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
			rut = new crField("Listado_Morosos", "Listado Morosos", "x_rut", "rut", "[rut]", 200, EWRPT_DATATYPE_STRING, -1)
			rut.Page = APage
			rut.ParentPage = APage.ParentPage
			Fields.Add("rut", rut)
			rut.DateFilter = ""
			rut.SqlSelect = ""
			rut.SqlOrderBy = ""

			' DIG
			DIG = new crField("Listado_Morosos", "Listado Morosos", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
			DIG.Page = APage
			DIG.ParentPage = APage.ParentPage
			Fields.Add("DIG", DIG)
			DIG.DateFilter = ""
			DIG.SqlSelect = ""
			DIG.SqlOrderBy = ""

			' Nombre_alumno
			Nombre_alumno = new crField("Listado_Morosos", "Listado Morosos", "x_Nombre_alumno", "Nombre_alumno", "[Nombre_alumno]", 200, EWRPT_DATATYPE_STRING, -1)
			Nombre_alumno.Page = APage
			Nombre_alumno.ParentPage = APage.ParentPage
			Fields.Add("Nombre_alumno", Nombre_alumno)
			Nombre_alumno.DateFilter = ""
			Nombre_alumno.SqlSelect = ""
			Nombre_alumno.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Listado_Morosos", "Listado Morosos", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Listado_Morosos", "Listado Morosos", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' MAIL
			MAIL = new crField("Listado_Morosos", "Listado Morosos", "x_MAIL", "MAIL", "[MAIL]", 200, EWRPT_DATATYPE_STRING, -1)
			MAIL.Page = APage
			MAIL.ParentPage = APage.ParentPage
			Fields.Add("MAIL", MAIL)
			MAIL.DateFilter = ""
			MAIL.SqlSelect = ""
			MAIL.SqlOrderBy = ""

			' DIRPROC
			DIRPROC = new crField("Listado_Morosos", "Listado Morosos", "x_DIRPROC", "DIRPROC", "[DIRPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			DIRPROC.Page = APage
			DIRPROC.ParentPage = APage.ParentPage
			Fields.Add("DIRPROC", DIRPROC)
			DIRPROC.DateFilter = ""
			DIRPROC.SqlSelect = ""
			DIRPROC.SqlOrderBy = ""

			' COMUNAPRO
			COMUNAPRO = new crField("Listado_Morosos", "Listado Morosos", "x_COMUNAPRO", "COMUNAPRO", "[COMUNAPRO]", 200, EWRPT_DATATYPE_STRING, -1)
			COMUNAPRO.Page = APage
			COMUNAPRO.ParentPage = APage.ParentPage
			Fields.Add("COMUNAPRO", COMUNAPRO)
			COMUNAPRO.DateFilter = ""
			COMUNAPRO.SqlSelect = ""
			COMUNAPRO.SqlOrderBy = ""

			' CIUPROC
			CIUPROC = new crField("Listado_Morosos", "Listado Morosos", "x_CIUPROC", "CIUPROC", "[CIUPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			CIUPROC.Page = APage
			CIUPROC.ParentPage = APage.ParentPage
			Fields.Add("CIUPROC", CIUPROC)
			CIUPROC.DateFilter = ""
			CIUPROC.SqlSelect = ""
			CIUPROC.SqlOrderBy = ""

			' FONOPROC
			FONOPROC = new crField("Listado_Morosos", "Listado Morosos", "x_FONOPROC", "FONOPROC", "[FONOPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOPROC.Page = APage
			FONOPROC.ParentPage = APage.ParentPage
			Fields.Add("FONOPROC", FONOPROC)
			FONOPROC.DateFilter = ""
			FONOPROC.SqlSelect = ""
			FONOPROC.SqlOrderBy = ""

			' FONOACT
			FONOACT = new crField("Listado_Morosos", "Listado Morosos", "x_FONOACT", "FONOACT", "[FONOACT]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOACT.Page = APage
			FONOACT.ParentPage = APage.ParentPage
			Fields.Add("FONOACT", FONOACT)
			FONOACT.DateFilter = ""
			FONOACT.SqlSelect = ""
			FONOACT.SqlOrderBy = ""

			' CODAPOD
			CODAPOD = new crField("Listado_Morosos", "Listado Morosos", "x_CODAPOD", "CODAPOD", "[CODAPOD]", 200, EWRPT_DATATYPE_STRING, -1)
			CODAPOD.Page = APage
			CODAPOD.ParentPage = APage.ParentPage
			Fields.Add("CODAPOD", CODAPOD)
			CODAPOD.DateFilter = ""
			CODAPOD.SqlSelect = ""
			CODAPOD.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Listado_Morosos", "Listado Morosos", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' Carrera
			Carrera = new crField("Listado_Morosos", "Listado Morosos", "x_Carrera", "Carrera", "[Carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			Carrera.Page = APage
			Carrera.ParentPage = APage.ParentPage
			Fields.Add("Carrera", Carrera)
			Carrera.DateFilter = ""
			Carrera.SqlSelect = ""
			Carrera.SqlOrderBy = ""

			' CODFAC
			CODFAC = new crField("Listado_Morosos", "Listado Morosos", "x_CODFAC", "CODFAC", "[CODFAC]", 200, EWRPT_DATATYPE_STRING, -1)
			CODFAC.Page = APage
			CODFAC.ParentPage = APage.ParentPage
			Fields.Add("CODFAC", CODFAC)
			CODFAC.DateFilter = ""
			CODFAC.SqlSelect = ""
			CODFAC.SqlOrderBy = ""

			' Facultad
			Facultad = new crField("Listado_Morosos", "Listado Morosos", "x_Facultad", "Facultad", "[Facultad]", 200, EWRPT_DATATYPE_STRING, -1)
			Facultad.Page = APage
			Facultad.ParentPage = APage.ParentPage
			Fields.Add("Facultad", Facultad)
			Facultad.DateFilter = ""
			Facultad.SqlSelect = ""
			Facultad.SqlOrderBy = ""

			' ANO
			ANO = new crField("Listado_Morosos", "Listado Morosos", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("Listado_Morosos", "Listado Morosos", "x_PERIODO", "PERIODO", "[PERIODO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			PERIODO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' ESTACAD
			ESTACAD = new crField("Listado_Morosos", "Listado Morosos", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTACAD.Page = APage
			ESTACAD.ParentPage = APage.ParentPage
			Fields.Add("ESTACAD", ESTACAD)
			ESTACAD.DateFilter = ""
			ESTACAD.SqlSelect = ""
			ESTACAD.SqlOrderBy = ""

			' numero_pagare
			numero_pagare = new crField("Listado_Morosos", "Listado Morosos", "x_numero_pagare", "numero_pagare", "[numero_pagare]", 131, EWRPT_DATATYPE_NUMBER, -1)
			numero_pagare.Page = APage
			numero_pagare.ParentPage = APage.ParentPage
			numero_pagare.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("numero_pagare", numero_pagare)
			numero_pagare.DateFilter = ""
			numero_pagare.SqlSelect = ""
			numero_pagare.SqlOrderBy = ""

			' CodDoc
			CodDoc = new crField("Listado_Morosos", "Listado Morosos", "x_CodDoc", "CodDoc", "[CodDoc]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CodDoc.Page = APage
			CodDoc.ParentPage = APage.ParentPage
			CodDoc.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CodDoc", CodDoc)
			CodDoc.DateFilter = ""
			CodDoc.SqlSelect = ""
			CodDoc.SqlOrderBy = ""

			' Documento
			Documento = new crField("Listado_Morosos", "Listado Morosos", "x_Documento", "Documento", "[Documento]", 200, EWRPT_DATATYPE_STRING, -1)
			Documento.Page = APage
			Documento.ParentPage = APage.ParentPage
			Fields.Add("Documento", Documento)
			Documento.DateFilter = ""
			Documento.SqlSelect = ""
			Documento.SqlOrderBy = ""

			' CUOTA
			CUOTA = new crField("Listado_Morosos", "Listado Morosos", "x_CUOTA", "CUOTA", "[CUOTA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CUOTA.Page = APage
			CUOTA.ParentPage = APage.ParentPage
			CUOTA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CUOTA", CUOTA)
			CUOTA.DateFilter = ""
			CUOTA.SqlSelect = ""
			CUOTA.SqlOrderBy = ""

			' NumCuotas
			NumCuotas = new crField("Listado_Morosos", "Listado Morosos", "x_NumCuotas", "NumCuotas", "[NumCuotas]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NumCuotas.Page = APage
			NumCuotas.ParentPage = APage.ParentPage
			NumCuotas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NumCuotas", NumCuotas)
			NumCuotas.DateFilter = ""
			NumCuotas.SqlSelect = ""
			NumCuotas.SqlOrderBy = ""

			' MONTO
			MONTO = new crField("Listado_Morosos", "Listado Morosos", "x_MONTO", "MONTO", "[MONTO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			MONTO.Page = APage
			MONTO.ParentPage = APage.ParentPage
			MONTO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("MONTO", MONTO)
			MONTO.DateFilter = ""
			MONTO.SqlSelect = ""
			MONTO.SqlOrderBy = ""

			' SALDO
			SALDO = new crField("Listado_Morosos", "Listado Morosos", "x_SALDO", "SALDO", "[SALDO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			SALDO.Page = APage
			SALDO.ParentPage = APage.ParentPage
			SALDO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("SALDO", SALDO)
			SALDO.DateFilter = ""
			SALDO.SqlSelect = ""
			SALDO.SqlOrderBy = ""

			' FECVEN
			FECVEN = new crField("Listado_Morosos", "Listado Morosos", "x_FECVEN", "FECVEN", "[FECVEN]", 135, EWRPT_DATATYPE_DATE, 7)
			FECVEN.Page = APage
			FECVEN.ParentPage = APage.ParentPage
			FECVEN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECVEN", FECVEN)
			FECVEN.DateFilter = ""
			FECVEN.SqlSelect = ""
			FECVEN.SqlOrderBy = ""

			' USUARIO
			USUARIO = new crField("Listado_Morosos", "Listado Morosos", "x_USUARIO", "USUARIO", "[USUARIO]", 200, EWRPT_DATATYPE_STRING, -1)
			USUARIO.Page = APage
			USUARIO.ParentPage = APage.ParentPage
			Fields.Add("USUARIO", USUARIO)
			USUARIO.DateFilter = ""
			USUARIO.SqlSelect = ""
			USUARIO.SqlOrderBy = ""

			' FECDEUDA
			FECDEUDA = new crField("Listado_Morosos", "Listado Morosos", "x_FECDEUDA", "FECDEUDA", "[FECDEUDA]", 135, EWRPT_DATATYPE_DATE, 7)
			FECDEUDA.Page = APage
			FECDEUDA.ParentPage = APage.ParentPage
			FECDEUDA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECDEUDA", FECDEUDA)
			FECDEUDA.DateFilter = ""
			FECDEUDA.SqlSelect = ""
			FECDEUDA.SqlOrderBy = ""

			' TIPOSITU
			TIPOSITU = new crField("Listado_Morosos", "Listado Morosos", "x_TIPOSITU", "TIPOSITU", "[TIPOSITU]", 131, EWRPT_DATATYPE_NUMBER, -1)
			TIPOSITU.Page = APage
			TIPOSITU.ParentPage = APage.ParentPage
			TIPOSITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("TIPOSITU", TIPOSITU)
			TIPOSITU.DateFilter = ""
			TIPOSITU.SqlSelect = ""
			TIPOSITU.SqlOrderBy = ""

			' DESCRIPCION
			DESCRIPCION = new crField("Listado_Morosos", "Listado Morosos", "x_DESCRIPCION", "DESCRIPCION", "[DESCRIPCION]", 200, EWRPT_DATATYPE_STRING, -1)
			DESCRIPCION.Page = APage
			DESCRIPCION.ParentPage = APage.ParentPage
			Fields.Add("DESCRIPCION", DESCRIPCION)
			DESCRIPCION.DateFilter = ""
			DESCRIPCION.SqlSelect = ""
			DESCRIPCION.SqlOrderBy = ""
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
				Return "[SEK_Morosos_2013]"
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
	Public Listado_Morosos_summary As crListado_Morosos_summary

	'
	' Page class
	'
	Public Class crListado_Morosos_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Listado_Morosos.UseTokenInUrl) Then
				sUrl &= "t=" & Listado_Morosos.TableVar & "&" ' Add page token
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
			If (Listado_Morosos.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Listado_Morosos.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Listado_Morosos.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Listado_Morosossmry 
			Get
				Return CType(m_ParentPage, Listado_Morosossmry)
			End Get
		End Property

		' Table object (Listado_Morosos)
		Public Property Listado_Morosos As crListado_Morosos 
			Get		
				Return AspNetPage.Listado_Morosos ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crListado_Morosos)
				AspNetPage.Listado_Morosos = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_listado_morosos)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Listado_Morosos_summary"
			m_PageObjTypeName = "crListado_Morosos_summary"

			' Table name
			m_TableName = "Listado Morosos"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Listado_Morosos)
			Listado_Morosos = New crListado_Morosos(Me)			

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
				Listado_Morosos.Export = ew_Get("export")
			End If
			gsExport = Listado_Morosos.Export ' Get export parameter, used in header
			gsExportFile = Listado_Morosos.TableVar ' Get export file, used in header
			If (Listado_Morosos.Export = "excel") Then
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
			Listado_Morosos.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Listado_Morosos.SqlSelect, Listado_Morosos.SqlWhere, Listado_Morosos.SqlGroupBy, Listado_Morosos.SqlHaving, Listado_Morosos.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Listado_Morosos.ExportAll AndAlso ew_NotEmpty(Listado_Morosos.Export)) Then
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
				Listado_Morosos.numero_pagare.DbValue = Row("numero_pagare")
				Listado_Morosos.rut.DbValue = Row("rut")
				Listado_Morosos.DIG.DbValue = Row("DIG")
				Listado_Morosos.CODCARR.DbValue = Row("CODCARR")
				Listado_Morosos.Carrera.DbValue = Row("Carrera")
				Listado_Morosos.CodDoc.DbValue = Row("CodDoc")
				Listado_Morosos.Documento.DbValue = Row("Documento")
				Listado_Morosos.ANO.DbValue = Row("ANO")
				Listado_Morosos.PERIODO.DbValue = Row("PERIODO")
				Listado_Morosos.CUOTA.DbValue = Row("CUOTA")
				Listado_Morosos.NumCuotas.DbValue = Row("NumCuotas")
				Listado_Morosos.MONTO.DbValue = Row("MONTO")
				Listado_Morosos.SALDO.DbValue = Row("SALDO")
				Listado_Morosos.FECVEN.DbValue = Row("FECVEN")
				Listado_Morosos.PATERNO.DbValue = Row("PATERNO")
				Listado_Morosos.MATERNO.DbValue = Row("MATERNO")
				Listado_Morosos.Nombre_alumno.DbValue = Row("Nombre_alumno")
				Listado_Morosos.MAIL.DbValue = Row("MAIL")
				Listado_Morosos.DIRPROC.DbValue = Row("DIRPROC")
				Listado_Morosos.CIUPROC.DbValue = Row("CIUPROC")
				Listado_Morosos.COMUNAPRO.DbValue = Row("COMUNAPRO")
				Listado_Morosos.FONOPROC.DbValue = Row("FONOPROC")
				Listado_Morosos.FONOACT.DbValue = Row("FONOACT")
				Listado_Morosos.CODFAC.DbValue = Row("CODFAC")
				Listado_Morosos.Facultad.DbValue = Row("Facultad")
				Listado_Morosos.USUARIO.DbValue = Row("USUARIO")
				Listado_Morosos.CODAPOD.DbValue = Row("CODAPOD")
				Listado_Morosos.FECDEUDA.DbValue = Row("FECDEUDA")
				Listado_Morosos.ESTACAD.DbValue = Row("ESTACAD")
				Listado_Morosos.TIPOSITU.DbValue = Row("TIPOSITU")
				Listado_Morosos.DESCRIPCION.DbValue = Row("DESCRIPCION")
				Val(1) = Listado_Morosos.rut.CurrentValue
				Val(2) = Listado_Morosos.DIG.CurrentValue
				Val(3) = Listado_Morosos.Nombre_alumno.CurrentValue
				Val(4) = Listado_Morosos.PATERNO.CurrentValue
				Val(5) = Listado_Morosos.MATERNO.CurrentValue
				Val(6) = Listado_Morosos.MAIL.CurrentValue
				Val(7) = Listado_Morosos.DIRPROC.CurrentValue
				Val(8) = Listado_Morosos.COMUNAPRO.CurrentValue
				Val(9) = Listado_Morosos.CIUPROC.CurrentValue
				Val(10) = Listado_Morosos.FONOPROC.CurrentValue
				Val(11) = Listado_Morosos.FONOACT.CurrentValue
				Val(12) = Listado_Morosos.CODAPOD.CurrentValue
				Val(13) = Listado_Morosos.CODCARR.CurrentValue
				Val(14) = Listado_Morosos.Carrera.CurrentValue
				Val(15) = Listado_Morosos.CODFAC.CurrentValue
				Val(16) = Listado_Morosos.Facultad.CurrentValue
				Val(17) = Listado_Morosos.ANO.CurrentValue
				Val(18) = Listado_Morosos.PERIODO.CurrentValue
				Val(19) = Listado_Morosos.ESTACAD.CurrentValue
				Val(20) = Listado_Morosos.numero_pagare.CurrentValue
				Val(21) = Listado_Morosos.CodDoc.CurrentValue
				Val(22) = Listado_Morosos.Documento.CurrentValue
				Val(23) = Listado_Morosos.CUOTA.CurrentValue
				Val(24) = Listado_Morosos.NumCuotas.CurrentValue
				Val(25) = Listado_Morosos.MONTO.CurrentValue
				Val(26) = Listado_Morosos.SALDO.CurrentValue
				Val(27) = Listado_Morosos.FECVEN.CurrentValue
				Val(28) = Listado_Morosos.USUARIO.CurrentValue
				Val(29) = Listado_Morosos.FECDEUDA.CurrentValue
				Val(30) = Listado_Morosos.TIPOSITU.CurrentValue
				Val(31) = Listado_Morosos.DESCRIPCION.CurrentValue
			Else
				Listado_Morosos.numero_pagare.DbValue = ""
				Listado_Morosos.rut.DbValue = ""
				Listado_Morosos.DIG.DbValue = ""
				Listado_Morosos.CODCARR.DbValue = ""
				Listado_Morosos.Carrera.DbValue = ""
				Listado_Morosos.CodDoc.DbValue = ""
				Listado_Morosos.Documento.DbValue = ""
				Listado_Morosos.ANO.DbValue = ""
				Listado_Morosos.PERIODO.DbValue = ""
				Listado_Morosos.CUOTA.DbValue = ""
				Listado_Morosos.NumCuotas.DbValue = ""
				Listado_Morosos.MONTO.DbValue = ""
				Listado_Morosos.SALDO.DbValue = ""
				Listado_Morosos.FECVEN.DbValue = ""
				Listado_Morosos.PATERNO.DbValue = ""
				Listado_Morosos.MATERNO.DbValue = ""
				Listado_Morosos.Nombre_alumno.DbValue = ""
				Listado_Morosos.MAIL.DbValue = ""
				Listado_Morosos.DIRPROC.DbValue = ""
				Listado_Morosos.CIUPROC.DbValue = ""
				Listado_Morosos.COMUNAPRO.DbValue = ""
				Listado_Morosos.FONOPROC.DbValue = ""
				Listado_Morosos.FONOACT.DbValue = ""
				Listado_Morosos.CODFAC.DbValue = ""
				Listado_Morosos.Facultad.DbValue = ""
				Listado_Morosos.USUARIO.DbValue = ""
				Listado_Morosos.CODAPOD.DbValue = ""
				Listado_Morosos.FECDEUDA.DbValue = ""
				Listado_Morosos.ESTACAD.DbValue = ""
				Listado_Morosos.TIPOSITU.DbValue = ""
				Listado_Morosos.DESCRIPCION.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Listado_Morosos.numero_pagare.DbValue = dr("numero_pagare")
				Listado_Morosos.rut.DbValue = dr("rut")
				Listado_Morosos.DIG.DbValue = dr("DIG")
				Listado_Morosos.CODCARR.DbValue = dr("CODCARR")
				Listado_Morosos.Carrera.DbValue = dr("Carrera")
				Listado_Morosos.CodDoc.DbValue = dr("CodDoc")
				Listado_Morosos.Documento.DbValue = dr("Documento")
				Listado_Morosos.ANO.DbValue = dr("ANO")
				Listado_Morosos.PERIODO.DbValue = dr("PERIODO")
				Listado_Morosos.CUOTA.DbValue = dr("CUOTA")
				Listado_Morosos.NumCuotas.DbValue = dr("NumCuotas")
				Listado_Morosos.MONTO.DbValue = dr("MONTO")
				Listado_Morosos.SALDO.DbValue = dr("SALDO")
				Listado_Morosos.FECVEN.DbValue = dr("FECVEN")
				Listado_Morosos.PATERNO.DbValue = dr("PATERNO")
				Listado_Morosos.MATERNO.DbValue = dr("MATERNO")
				Listado_Morosos.Nombre_alumno.DbValue = dr("Nombre_alumno")
				Listado_Morosos.MAIL.DbValue = dr("MAIL")
				Listado_Morosos.DIRPROC.DbValue = dr("DIRPROC")
				Listado_Morosos.CIUPROC.DbValue = dr("CIUPROC")
				Listado_Morosos.COMUNAPRO.DbValue = dr("COMUNAPRO")
				Listado_Morosos.FONOPROC.DbValue = dr("FONOPROC")
				Listado_Morosos.FONOACT.DbValue = dr("FONOACT")
				Listado_Morosos.CODFAC.DbValue = dr("CODFAC")
				Listado_Morosos.Facultad.DbValue = dr("Facultad")
				Listado_Morosos.USUARIO.DbValue = dr("USUARIO")
				Listado_Morosos.CODAPOD.DbValue = dr("CODAPOD")
				Listado_Morosos.FECDEUDA.DbValue = dr("FECDEUDA")
				Listado_Morosos.ESTACAD.DbValue = dr("ESTACAD")
				Listado_Morosos.TIPOSITU.DbValue = dr("TIPOSITU")
				Listado_Morosos.DESCRIPCION.DbValue = dr("DESCRIPCION")
				Val(1) = Listado_Morosos.rut.CurrentValue
				Val(2) = Listado_Morosos.DIG.CurrentValue
				Val(3) = Listado_Morosos.Nombre_alumno.CurrentValue
				Val(4) = Listado_Morosos.PATERNO.CurrentValue
				Val(5) = Listado_Morosos.MATERNO.CurrentValue
				Val(6) = Listado_Morosos.MAIL.CurrentValue
				Val(7) = Listado_Morosos.DIRPROC.CurrentValue
				Val(8) = Listado_Morosos.COMUNAPRO.CurrentValue
				Val(9) = Listado_Morosos.CIUPROC.CurrentValue
				Val(10) = Listado_Morosos.FONOPROC.CurrentValue
				Val(11) = Listado_Morosos.FONOACT.CurrentValue
				Val(12) = Listado_Morosos.CODAPOD.CurrentValue
				Val(13) = Listado_Morosos.CODCARR.CurrentValue
				Val(14) = Listado_Morosos.Carrera.CurrentValue
				Val(15) = Listado_Morosos.CODFAC.CurrentValue
				Val(16) = Listado_Morosos.Facultad.CurrentValue
				Val(17) = Listado_Morosos.ANO.CurrentValue
				Val(18) = Listado_Morosos.PERIODO.CurrentValue
				Val(19) = Listado_Morosos.ESTACAD.CurrentValue
				Val(20) = Listado_Morosos.numero_pagare.CurrentValue
				Val(21) = Listado_Morosos.CodDoc.CurrentValue
				Val(22) = Listado_Morosos.Documento.CurrentValue
				Val(23) = Listado_Morosos.CUOTA.CurrentValue
				Val(24) = Listado_Morosos.NumCuotas.CurrentValue
				Val(25) = Listado_Morosos.MONTO.CurrentValue
				Val(26) = Listado_Morosos.SALDO.CurrentValue
				Val(27) = Listado_Morosos.FECVEN.CurrentValue
				Val(28) = Listado_Morosos.USUARIO.CurrentValue
				Val(29) = Listado_Morosos.FECDEUDA.CurrentValue
				Val(30) = Listado_Morosos.TIPOSITU.CurrentValue
				Val(31) = Listado_Morosos.DESCRIPCION.CurrentValue
			Else				
				Listado_Morosos.numero_pagare.DbValue = ""
				Listado_Morosos.rut.DbValue = ""
				Listado_Morosos.DIG.DbValue = ""
				Listado_Morosos.CODCARR.DbValue = ""
				Listado_Morosos.Carrera.DbValue = ""
				Listado_Morosos.CodDoc.DbValue = ""
				Listado_Morosos.Documento.DbValue = ""
				Listado_Morosos.ANO.DbValue = ""
				Listado_Morosos.PERIODO.DbValue = ""
				Listado_Morosos.CUOTA.DbValue = ""
				Listado_Morosos.NumCuotas.DbValue = ""
				Listado_Morosos.MONTO.DbValue = ""
				Listado_Morosos.SALDO.DbValue = ""
				Listado_Morosos.FECVEN.DbValue = ""
				Listado_Morosos.PATERNO.DbValue = ""
				Listado_Morosos.MATERNO.DbValue = ""
				Listado_Morosos.Nombre_alumno.DbValue = ""
				Listado_Morosos.MAIL.DbValue = ""
				Listado_Morosos.DIRPROC.DbValue = ""
				Listado_Morosos.CIUPROC.DbValue = ""
				Listado_Morosos.COMUNAPRO.DbValue = ""
				Listado_Morosos.FONOPROC.DbValue = ""
				Listado_Morosos.FONOACT.DbValue = ""
				Listado_Morosos.CODFAC.DbValue = ""
				Listado_Morosos.Facultad.DbValue = ""
				Listado_Morosos.USUARIO.DbValue = ""
				Listado_Morosos.CODAPOD.DbValue = ""
				Listado_Morosos.FECDEUDA.DbValue = ""
				Listado_Morosos.ESTACAD.DbValue = ""
				Listado_Morosos.TIPOSITU.DbValue = ""
				Listado_Morosos.DESCRIPCION.DbValue = ""
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
				Listado_Morosos.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Listado_Morosos.StartGroup = StartGrp
				Else
					StartGrp = Listado_Morosos.StartGroup
				End If
			Else
				StartGrp = Listado_Morosos.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Listado_Morosos.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Listado_Morosos.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Listado_Morosos.StartGroup = StartGrp
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
			Listado_Morosos.StartGroup = StartGrp
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
				Listado_Morosos.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Listado_Morosos.StartGroup = StartGrp
			Else				
				If (Listado_Morosos.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Listado_Morosos.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Listado_Morosos.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Listado_Morosos.SqlSelectCount, Listado_Morosos.SqlWhere, Listado_Morosos.SqlGroupBy, Listado_Morosos.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Listado_Morosos.Row_Rendering()

			'
			' Render view codes
			'

			If (Listado_Morosos.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' rut
				Listado_Morosos.rut.ViewValue = Convert.ToString(Listado_Morosos.rut.Summary)

				' DIG
				Listado_Morosos.DIG.ViewValue = Convert.ToString(Listado_Morosos.DIG.Summary)

				' Nombre_alumno
				Listado_Morosos.Nombre_alumno.ViewValue = Convert.ToString(Listado_Morosos.Nombre_alumno.Summary)

				' PATERNO
				Listado_Morosos.PATERNO.ViewValue = Convert.ToString(Listado_Morosos.PATERNO.Summary)

				' MATERNO
				Listado_Morosos.MATERNO.ViewValue = Convert.ToString(Listado_Morosos.MATERNO.Summary)

				' MAIL
				Listado_Morosos.MAIL.ViewValue = Convert.ToString(Listado_Morosos.MAIL.Summary)

				' DIRPROC
				Listado_Morosos.DIRPROC.ViewValue = Convert.ToString(Listado_Morosos.DIRPROC.Summary)

				' COMUNAPRO
				Listado_Morosos.COMUNAPRO.ViewValue = Convert.ToString(Listado_Morosos.COMUNAPRO.Summary)

				' CIUPROC
				Listado_Morosos.CIUPROC.ViewValue = Convert.ToString(Listado_Morosos.CIUPROC.Summary)

				' FONOPROC
				Listado_Morosos.FONOPROC.ViewValue = Convert.ToString(Listado_Morosos.FONOPROC.Summary)

				' FONOACT
				Listado_Morosos.FONOACT.ViewValue = Convert.ToString(Listado_Morosos.FONOACT.Summary)

				' CODAPOD
				Listado_Morosos.CODAPOD.ViewValue = Convert.ToString(Listado_Morosos.CODAPOD.Summary)

				' CODCARR
				Listado_Morosos.CODCARR.ViewValue = Convert.ToString(Listado_Morosos.CODCARR.Summary)

				' Carrera
				Listado_Morosos.Carrera.ViewValue = Convert.ToString(Listado_Morosos.Carrera.Summary)

				' CODFAC
				Listado_Morosos.CODFAC.ViewValue = Convert.ToString(Listado_Morosos.CODFAC.Summary)

				' Facultad
				Listado_Morosos.Facultad.ViewValue = Convert.ToString(Listado_Morosos.Facultad.Summary)

				' ANO
				Listado_Morosos.ANO.ViewValue = Convert.ToString(Listado_Morosos.ANO.Summary)

				' PERIODO
				Listado_Morosos.PERIODO.ViewValue = Convert.ToString(Listado_Morosos.PERIODO.Summary)

				' ESTACAD
				Listado_Morosos.ESTACAD.ViewValue = Convert.ToString(Listado_Morosos.ESTACAD.Summary)

				' numero_pagare
				Listado_Morosos.numero_pagare.ViewValue = Convert.ToString(Listado_Morosos.numero_pagare.Summary)

				' CodDoc
				Listado_Morosos.CodDoc.ViewValue = Convert.ToString(Listado_Morosos.CodDoc.Summary)

				' Documento
				Listado_Morosos.Documento.ViewValue = Convert.ToString(Listado_Morosos.Documento.Summary)

				' CUOTA
				Listado_Morosos.CUOTA.ViewValue = Convert.ToString(Listado_Morosos.CUOTA.Summary)

				' NumCuotas
				Listado_Morosos.NumCuotas.ViewValue = Convert.ToString(Listado_Morosos.NumCuotas.Summary)

				' MONTO
				Listado_Morosos.MONTO.ViewValue = Convert.ToString(Listado_Morosos.MONTO.Summary)

				' SALDO
				Listado_Morosos.SALDO.ViewValue = Convert.ToString(Listado_Morosos.SALDO.Summary)

				' FECVEN
				Listado_Morosos.FECVEN.ViewValue = Convert.ToString(Listado_Morosos.FECVEN.Summary)
				Listado_Morosos.FECVEN.ViewValue = ew_FormatDateTime(Listado_Morosos.FECVEN.ViewValue, 7)

				' USUARIO
				Listado_Morosos.USUARIO.ViewValue = Convert.ToString(Listado_Morosos.USUARIO.Summary)

				' FECDEUDA
				Listado_Morosos.FECDEUDA.ViewValue = Convert.ToString(Listado_Morosos.FECDEUDA.Summary)
				Listado_Morosos.FECDEUDA.ViewValue = ew_FormatDateTime(Listado_Morosos.FECDEUDA.ViewValue, 7)

				' TIPOSITU
				Listado_Morosos.TIPOSITU.ViewValue = Convert.ToString(Listado_Morosos.TIPOSITU.Summary)

				' DESCRIPCION
				Listado_Morosos.DESCRIPCION.ViewValue = Convert.ToString(Listado_Morosos.DESCRIPCION.Summary)
			Else

				' rut
				Listado_Morosos.rut.ViewValue = Convert.ToString(Listado_Morosos.rut.CurrentValue)
				Listado_Morosos.rut.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIG
				Listado_Morosos.DIG.ViewValue = Convert.ToString(Listado_Morosos.DIG.CurrentValue)
				Listado_Morosos.DIG.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Nombre_alumno
				Listado_Morosos.Nombre_alumno.ViewValue = Convert.ToString(Listado_Morosos.Nombre_alumno.CurrentValue)
				Listado_Morosos.Nombre_alumno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Listado_Morosos.PATERNO.ViewValue = Convert.ToString(Listado_Morosos.PATERNO.CurrentValue)
				Listado_Morosos.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Listado_Morosos.MATERNO.ViewValue = Convert.ToString(Listado_Morosos.MATERNO.CurrentValue)
				Listado_Morosos.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MAIL
				Listado_Morosos.MAIL.ViewValue = Convert.ToString(Listado_Morosos.MAIL.CurrentValue)
				Listado_Morosos.MAIL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIRPROC
				Listado_Morosos.DIRPROC.ViewValue = Convert.ToString(Listado_Morosos.DIRPROC.CurrentValue)
				Listado_Morosos.DIRPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' COMUNAPRO
				Listado_Morosos.COMUNAPRO.ViewValue = Convert.ToString(Listado_Morosos.COMUNAPRO.CurrentValue)
				Listado_Morosos.COMUNAPRO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CIUPROC
				Listado_Morosos.CIUPROC.ViewValue = Convert.ToString(Listado_Morosos.CIUPROC.CurrentValue)
				Listado_Morosos.CIUPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOPROC
				Listado_Morosos.FONOPROC.ViewValue = Convert.ToString(Listado_Morosos.FONOPROC.CurrentValue)
				Listado_Morosos.FONOPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOACT
				Listado_Morosos.FONOACT.ViewValue = Convert.ToString(Listado_Morosos.FONOACT.CurrentValue)
				Listado_Morosos.FONOACT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODAPOD
				Listado_Morosos.CODAPOD.ViewValue = Convert.ToString(Listado_Morosos.CODAPOD.CurrentValue)
				Listado_Morosos.CODAPOD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Listado_Morosos.CODCARR.ViewValue = Convert.ToString(Listado_Morosos.CODCARR.CurrentValue)
				Listado_Morosos.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Carrera
				Listado_Morosos.Carrera.ViewValue = Convert.ToString(Listado_Morosos.Carrera.CurrentValue)
				Listado_Morosos.Carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODFAC
				Listado_Morosos.CODFAC.ViewValue = Convert.ToString(Listado_Morosos.CODFAC.CurrentValue)
				Listado_Morosos.CODFAC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Facultad
				Listado_Morosos.Facultad.ViewValue = Convert.ToString(Listado_Morosos.Facultad.CurrentValue)
				Listado_Morosos.Facultad.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				Listado_Morosos.ANO.ViewValue = Convert.ToString(Listado_Morosos.ANO.CurrentValue)
				Listado_Morosos.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO
				Listado_Morosos.PERIODO.ViewValue = Convert.ToString(Listado_Morosos.PERIODO.CurrentValue)
				Listado_Morosos.PERIODO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTACAD
				Listado_Morosos.ESTACAD.ViewValue = Convert.ToString(Listado_Morosos.ESTACAD.CurrentValue)
				Listado_Morosos.ESTACAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' numero_pagare
				Listado_Morosos.numero_pagare.ViewValue = Convert.ToString(Listado_Morosos.numero_pagare.CurrentValue)
				Listado_Morosos.numero_pagare.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CodDoc
				Listado_Morosos.CodDoc.ViewValue = Convert.ToString(Listado_Morosos.CodDoc.CurrentValue)
				Listado_Morosos.CodDoc.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Documento
				Listado_Morosos.Documento.ViewValue = Convert.ToString(Listado_Morosos.Documento.CurrentValue)
				Listado_Morosos.Documento.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CUOTA
				Listado_Morosos.CUOTA.ViewValue = Convert.ToString(Listado_Morosos.CUOTA.CurrentValue)
				Listado_Morosos.CUOTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NumCuotas
				Listado_Morosos.NumCuotas.ViewValue = Convert.ToString(Listado_Morosos.NumCuotas.CurrentValue)
				Listado_Morosos.NumCuotas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MONTO
				Listado_Morosos.MONTO.ViewValue = Convert.ToString(Listado_Morosos.MONTO.CurrentValue)
				Listado_Morosos.MONTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SALDO
				Listado_Morosos.SALDO.ViewValue = Convert.ToString(Listado_Morosos.SALDO.CurrentValue)
				Listado_Morosos.SALDO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECVEN
				Listado_Morosos.FECVEN.ViewValue = Convert.ToString(Listado_Morosos.FECVEN.CurrentValue)
				Listado_Morosos.FECVEN.ViewValue = ew_FormatDateTime(Listado_Morosos.FECVEN.ViewValue, 7)
				Listado_Morosos.FECVEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' USUARIO
				Listado_Morosos.USUARIO.ViewValue = Convert.ToString(Listado_Morosos.USUARIO.CurrentValue)
				Listado_Morosos.USUARIO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECDEUDA
				Listado_Morosos.FECDEUDA.ViewValue = Convert.ToString(Listado_Morosos.FECDEUDA.CurrentValue)
				Listado_Morosos.FECDEUDA.ViewValue = ew_FormatDateTime(Listado_Morosos.FECDEUDA.ViewValue, 7)
				Listado_Morosos.FECDEUDA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIPOSITU
				Listado_Morosos.TIPOSITU.ViewValue = Convert.ToString(Listado_Morosos.TIPOSITU.CurrentValue)
				Listado_Morosos.TIPOSITU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DESCRIPCION
				Listado_Morosos.DESCRIPCION.ViewValue = Convert.ToString(Listado_Morosos.DESCRIPCION.CurrentValue)
				Listado_Morosos.DESCRIPCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' rut
			Listado_Morosos.rut.HrefValue = ""

			' DIG
			Listado_Morosos.DIG.HrefValue = ""

			' Nombre_alumno
			Listado_Morosos.Nombre_alumno.HrefValue = ""

			' PATERNO
			Listado_Morosos.PATERNO.HrefValue = ""

			' MATERNO
			Listado_Morosos.MATERNO.HrefValue = ""

			' MAIL
			Listado_Morosos.MAIL.HrefValue = ""

			' DIRPROC
			Listado_Morosos.DIRPROC.HrefValue = ""

			' COMUNAPRO
			Listado_Morosos.COMUNAPRO.HrefValue = ""

			' CIUPROC
			Listado_Morosos.CIUPROC.HrefValue = ""

			' FONOPROC
			Listado_Morosos.FONOPROC.HrefValue = ""

			' FONOACT
			Listado_Morosos.FONOACT.HrefValue = ""

			' CODAPOD
			Listado_Morosos.CODAPOD.HrefValue = ""

			' CODCARR
			Listado_Morosos.CODCARR.HrefValue = ""

			' Carrera
			Listado_Morosos.Carrera.HrefValue = ""

			' CODFAC
			Listado_Morosos.CODFAC.HrefValue = ""

			' Facultad
			Listado_Morosos.Facultad.HrefValue = ""

			' ANO
			Listado_Morosos.ANO.HrefValue = ""

			' PERIODO
			Listado_Morosos.PERIODO.HrefValue = ""

			' ESTACAD
			Listado_Morosos.ESTACAD.HrefValue = ""

			' numero_pagare
			Listado_Morosos.numero_pagare.HrefValue = ""

			' CodDoc
			Listado_Morosos.CodDoc.HrefValue = ""

			' Documento
			Listado_Morosos.Documento.HrefValue = ""

			' CUOTA
			Listado_Morosos.CUOTA.HrefValue = ""

			' NumCuotas
			Listado_Morosos.NumCuotas.HrefValue = ""

			' MONTO
			Listado_Morosos.MONTO.HrefValue = ""

			' SALDO
			Listado_Morosos.SALDO.HrefValue = ""

			' FECVEN
			Listado_Morosos.FECVEN.HrefValue = ""

			' USUARIO
			Listado_Morosos.USUARIO.HrefValue = ""

			' FECDEUDA
			Listado_Morosos.FECDEUDA.HrefValue = ""

			' TIPOSITU
			Listado_Morosos.TIPOSITU.HrefValue = ""

			' DESCRIPCION
			Listado_Morosos.DESCRIPCION.HrefValue = ""

			' Call Row_Rendered event
			Listado_Morosos.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [Carrera] FROM " + Listado_Morosos.SqlFrom
			sOrderBy = "[Carrera] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Listado_Morosos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Listado_Morosos.Carrera.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Facultad
			sSelect = "SELECT DISTINCT [Facultad] FROM " + Listado_Morosos.SqlFrom
			sOrderBy = "[Facultad] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Listado_Morosos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Listado_Morosos.Facultad.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO
			sSelect = "SELECT DISTINCT [ANO] FROM " + Listado_Morosos.SqlFrom
			sOrderBy = "[ANO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Listado_Morosos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Listado_Morosos.ANO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PERIODO
			sSelect = "SELECT DISTINCT [PERIODO] FROM " + Listado_Morosos.SqlFrom
			sOrderBy = "[PERIODO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Listado_Morosos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Listado_Morosos.PERIODO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTACAD
			sSelect = "SELECT DISTINCT [ESTACAD] FROM " + Listado_Morosos.SqlFrom
			sOrderBy = "[ESTACAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Listado_Morosos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Listado_Morosos.ESTACAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field USUARIO
			sSelect = "SELECT DISTINCT [USUARIO] FROM " + Listado_Morosos.SqlFrom
			sOrderBy = "[USUARIO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Listado_Morosos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Listado_Morosos.USUARIO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field TIPOSITU
			sSelect = "SELECT DISTINCT [TIPOSITU] FROM " + Listado_Morosos.SqlFrom
			sOrderBy = "[TIPOSITU] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Listado_Morosos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Listado_Morosos.TIPOSITU.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field DESCRIPCION
			sSelect = "SELECT DISTINCT [DESCRIPCION] FROM " + Listado_Morosos.SqlFrom
			sOrderBy = "[DESCRIPCION] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Listado_Morosos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Listado_Morosos.DESCRIPCION.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(Listado_Morosos.rut)

				' Field PATERNO
				SetSessionFilterValues(Listado_Morosos.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Listado_Morosos.MATERNO)

				' Field CODAPOD
				SetSessionFilterValues(Listado_Morosos.CODAPOD)

				' Field CODCARR
				SetSessionFilterValues(Listado_Morosos.CODCARR)

				' Field Carrera
				SetSessionDropDownValue(Listado_Morosos.Carrera.DropDownValue, Listado_Morosos.Carrera)

				' Field Facultad
				SetSessionDropDownValue(Listado_Morosos.Facultad.DropDownValue, Listado_Morosos.Facultad)

				' Field ANO
				SetSessionDropDownValue(Listado_Morosos.ANO.DropDownValue, Listado_Morosos.ANO)

				' Field PERIODO
				SetSessionDropDownValue(Listado_Morosos.PERIODO.DropDownValue, Listado_Morosos.PERIODO)

				' Field ESTACAD
				SetSessionDropDownValue(Listado_Morosos.ESTACAD.DropDownValue, Listado_Morosos.ESTACAD)

				' Field FECVEN
				SetSessionFilterValues(Listado_Morosos.FECVEN)

				' Field USUARIO
				SetSessionDropDownValue(Listado_Morosos.USUARIO.DropDownValue, Listado_Morosos.USUARIO)

				' Field FECDEUDA
				SetSessionFilterValues(Listado_Morosos.FECDEUDA)

				' Field TIPOSITU
				SetSessionDropDownValue(Listado_Morosos.TIPOSITU.DropDownValue, Listado_Morosos.TIPOSITU)

				' Field DESCRIPCION
				SetSessionDropDownValue(Listado_Morosos.DESCRIPCION.DropDownValue, Listado_Morosos.DESCRIPCION)
			bSetupFilter = True ' Set up filter required
		Else

				' Field rut
				If (GetFilterValues(Listado_Morosos.rut)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Listado_Morosos.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Listado_Morosos.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field CODAPOD
				If (GetFilterValues(Listado_Morosos.CODAPOD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field CODCARR
				If (GetFilterValues(Listado_Morosos.CODCARR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Carrera
				If (GetDropDownValue(Listado_Morosos.Carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Listado_Morosos.Carrera.DropDownValue) Then
					If Not ew_SameStr(Listado_Morosos.Carrera.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Listado_Morosos_Carrera") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Facultad
				If (GetDropDownValue(Listado_Morosos.Facultad)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Listado_Morosos.Facultad.DropDownValue) Then
					If Not ew_SameStr(Listado_Morosos.Facultad.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Listado_Morosos_Facultad") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO
				If (GetDropDownValue(Listado_Morosos.ANO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Listado_Morosos.ANO.DropDownValue) Then
					If Not ew_SameStr(Listado_Morosos.ANO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Listado_Morosos_ANO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PERIODO
				If (GetDropDownValue(Listado_Morosos.PERIODO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Listado_Morosos.PERIODO.DropDownValue) Then
					If Not ew_SameStr(Listado_Morosos.PERIODO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Listado_Morosos_PERIODO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ESTACAD
				If (GetDropDownValue(Listado_Morosos.ESTACAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Listado_Morosos.ESTACAD.DropDownValue) Then
					If Not ew_SameStr(Listado_Morosos.ESTACAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Listado_Morosos_ESTACAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field FECVEN
				If (GetFilterValues(Listado_Morosos.FECVEN)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field USUARIO
				If (GetDropDownValue(Listado_Morosos.USUARIO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Listado_Morosos.USUARIO.DropDownValue) Then
					If Not ew_SameStr(Listado_Morosos.USUARIO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Listado_Morosos_USUARIO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field FECDEUDA
				If (GetFilterValues(Listado_Morosos.FECDEUDA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field TIPOSITU
				If (GetDropDownValue(Listado_Morosos.TIPOSITU)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Listado_Morosos.TIPOSITU.DropDownValue) Then
					If Not ew_SameStr(Listado_Morosos.TIPOSITU.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Listado_Morosos_TIPOSITU") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field DESCRIPCION
				If (GetDropDownValue(Listado_Morosos.DESCRIPCION)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Listado_Morosos.DESCRIPCION.DropDownValue) Then
					If Not ew_SameStr(Listado_Morosos.DESCRIPCION.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Listado_Morosos_DESCRIPCION") Is Nothing Then
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
			GetSessionFilterValues(Listado_Morosos.rut)

			' Field PATERNO
			GetSessionFilterValues(Listado_Morosos.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Listado_Morosos.MATERNO)

			' Field CODAPOD
			GetSessionFilterValues(Listado_Morosos.CODAPOD)

			' Field CODCARR
			GetSessionFilterValues(Listado_Morosos.CODCARR)

			' Field Carrera
			GetSessionDropDownValue(Listado_Morosos.Carrera)

			' Field Facultad
			GetSessionDropDownValue(Listado_Morosos.Facultad)

			' Field ANO
			GetSessionDropDownValue(Listado_Morosos.ANO)

			' Field PERIODO
			GetSessionDropDownValue(Listado_Morosos.PERIODO)

			' Field ESTACAD
			GetSessionDropDownValue(Listado_Morosos.ESTACAD)

			' Field FECVEN
			GetSessionFilterValues(Listado_Morosos.FECVEN)

			' Field USUARIO
			GetSessionDropDownValue(Listado_Morosos.USUARIO)

			' Field FECDEUDA
			GetSessionFilterValues(Listado_Morosos.FECDEUDA)

			' Field TIPOSITU
			GetSessionDropDownValue(Listado_Morosos.TIPOSITU)

			' Field DESCRIPCION
			GetSessionDropDownValue(Listado_Morosos.DESCRIPCION)
		End If

		' Call page filter validated event
		Listado_Morosos.Page_FilterValidated()

		' Build SQL
		' Field rut

		BuildExtendedFilter(Listado_Morosos.rut, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Listado_Morosos.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Listado_Morosos.MATERNO, sFilter)

		' Field CODAPOD
		BuildExtendedFilter(Listado_Morosos.CODAPOD, sFilter)

		' Field CODCARR
		BuildExtendedFilter(Listado_Morosos.CODCARR, sFilter)

		' Field Carrera
		BuildDropDownFilter(Listado_Morosos.Carrera, sFilter, "")

		' Field Facultad
		BuildDropDownFilter(Listado_Morosos.Facultad, sFilter, "")

		' Field ANO
		BuildDropDownFilter(Listado_Morosos.ANO, sFilter, "")

		' Field PERIODO
		BuildDropDownFilter(Listado_Morosos.PERIODO, sFilter, "")

		' Field ESTACAD
		BuildDropDownFilter(Listado_Morosos.ESTACAD, sFilter, "")

		' Field FECVEN
		BuildExtendedFilter(Listado_Morosos.FECVEN, sFilter)

		' Field USUARIO
		BuildDropDownFilter(Listado_Morosos.USUARIO, sFilter, "")

		' Field FECDEUDA
		BuildExtendedFilter(Listado_Morosos.FECDEUDA, sFilter)

		' Field TIPOSITU
		BuildDropDownFilter(Listado_Morosos.TIPOSITU, sFilter, "")

		' Field DESCRIPCION
		BuildDropDownFilter(Listado_Morosos.DESCRIPCION, sFilter, "")

		' Save parms to Session
		' Field rut

		SetSessionFilterValues(Listado_Morosos.rut)

		' Field PATERNO
		SetSessionFilterValues(Listado_Morosos.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Listado_Morosos.MATERNO)

		' Field CODAPOD
		SetSessionFilterValues(Listado_Morosos.CODAPOD)

		' Field CODCARR
		SetSessionFilterValues(Listado_Morosos.CODCARR)

		' Field Carrera
		SetSessionDropDownValue(Listado_Morosos.Carrera.DropDownValue, Listado_Morosos.Carrera)

		' Field Facultad
		SetSessionDropDownValue(Listado_Morosos.Facultad.DropDownValue, Listado_Morosos.Facultad)

		' Field ANO
		SetSessionDropDownValue(Listado_Morosos.ANO.DropDownValue, Listado_Morosos.ANO)

		' Field PERIODO
		SetSessionDropDownValue(Listado_Morosos.PERIODO.DropDownValue, Listado_Morosos.PERIODO)

		' Field ESTACAD
		SetSessionDropDownValue(Listado_Morosos.ESTACAD.DropDownValue, Listado_Morosos.ESTACAD)

		' Field FECVEN
		SetSessionFilterValues(Listado_Morosos.FECVEN)

		' Field USUARIO
		SetSessionDropDownValue(Listado_Morosos.USUARIO.DropDownValue, Listado_Morosos.USUARIO)

		' Field FECDEUDA
		SetSessionFilterValues(Listado_Morosos.FECDEUDA)

		' Field TIPOSITU
		SetSessionDropDownValue(Listado_Morosos.TIPOSITU.DropDownValue, Listado_Morosos.TIPOSITU)

		' Field DESCRIPCION
		SetSessionDropDownValue(Listado_Morosos.DESCRIPCION.DropDownValue, Listado_Morosos.DESCRIPCION)

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
		If ew_Session("sv_Listado_Morosos_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Listado_Morosos_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Listado_Morosos_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Listado_Morosos_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Listado_Morosos_" + parm)
		End If
		If ew_Session("so1_Listado_Morosos_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Listado_Morosos_" + parm))
		End If
		If ew_Session("sc_Listado_Morosos_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Listado_Morosos_" + parm))
		End If
		If ew_Session("sv2_Listado_Morosos_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Listado_Morosos_" + parm)
		End If
		If ew_Session("so2_Listado_Morosos_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Listado_Morosos_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Listado_Morosos_" + parm) = fld.SearchValue
		ew_Session("so1_Listado_Morosos_" + parm) = fld.SearchOperator
		ew_Session("sc_Listado_Morosos_" + parm) = fld.SearchCondition
		ew_Session("sv2_Listado_Morosos_" + parm) = fld.SearchValue2
		ew_Session("so2_Listado_Morosos_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Listado_Morosos_" + parm) = ""
		ew_Session("so1_Listado_Morosos_" + parm) = "="
		ew_Session("sc_Listado_Morosos_" + parm) = "AND"
		ew_Session("sv2_Listado_Morosos_" + parm) = ""
		ew_Session("so2_Listado_Morosos_" + parm) = "="
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
		If Not ewrpt_CheckEuroDate(Convert.ToString(Listado_Morosos.FECVEN.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Listado_Morosos.FECVEN.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Listado_Morosos.FECDEUDA.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Listado_Morosos.FECDEUDA.FldErrMsg()
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
		ew_Session("sel_Listado_Morosos_" & parm) = ""
		ew_Session("rf_Listado_Morosos_" & parm) = ""
		ew_Session("rt_Listado_Morosos_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Listado_Morosos.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Listado_Morosos_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Listado_Morosos_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Listado_Morosos_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field Carrera

			Listado_Morosos.Carrera.DefaultDropDownValue = EWRPT_INIT_VALUE
			Listado_Morosos.Carrera.DropDownValue = Listado_Morosos.Carrera.DefaultDropDownValue

			' Field Facultad
			Listado_Morosos.Facultad.DefaultDropDownValue = EWRPT_INIT_VALUE
			Listado_Morosos.Facultad.DropDownValue = Listado_Morosos.Facultad.DefaultDropDownValue

			' Field ANO
			Listado_Morosos.ANO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Listado_Morosos.ANO.DropDownValue = Listado_Morosos.ANO.DefaultDropDownValue

			' Field PERIODO
			Listado_Morosos.PERIODO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Listado_Morosos.PERIODO.DropDownValue = Listado_Morosos.PERIODO.DefaultDropDownValue

			' Field ESTACAD
			Listado_Morosos.ESTACAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			Listado_Morosos.ESTACAD.DropDownValue = Listado_Morosos.ESTACAD.DefaultDropDownValue

			' Field USUARIO
			Listado_Morosos.USUARIO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Listado_Morosos.USUARIO.DropDownValue = Listado_Morosos.USUARIO.DefaultDropDownValue

			' Field TIPOSITU
			Listado_Morosos.TIPOSITU.DefaultDropDownValue = EWRPT_INIT_VALUE
			Listado_Morosos.TIPOSITU.DropDownValue = Listado_Morosos.TIPOSITU.DefaultDropDownValue

			' Field DESCRIPCION
			Listado_Morosos.DESCRIPCION.DefaultDropDownValue = EWRPT_INIT_VALUE
			Listado_Morosos.DESCRIPCION.DropDownValue = Listado_Morosos.DESCRIPCION.DefaultDropDownValue

		' Set up default values for extended filters
			' Field rut

			SetDefaultExtFilter(Listado_Morosos.rut, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Listado_Morosos.rut)	

			' Field PATERNO
			SetDefaultExtFilter(Listado_Morosos.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Listado_Morosos.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Listado_Morosos.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Listado_Morosos.MATERNO)	

			' Field CODAPOD
			SetDefaultExtFilter(Listado_Morosos.CODAPOD, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Listado_Morosos.CODAPOD)	

			' Field CODCARR
			SetDefaultExtFilter(Listado_Morosos.CODCARR, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Listado_Morosos.CODCARR)	

			' Field FECVEN
			SetDefaultExtFilter(Listado_Morosos.FECVEN, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Listado_Morosos.FECVEN)	

			' Field FECDEUDA
			SetDefaultExtFilter(Listado_Morosos.FECDEUDA, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Listado_Morosos.FECDEUDA)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check rut extended filter
		If (TextFilterApplied(Listado_Morosos.rut)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Listado_Morosos.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Listado_Morosos.MATERNO)) Then bFilterExist = True

		' Check CODAPOD extended filter
		If (TextFilterApplied(Listado_Morosos.CODAPOD)) Then bFilterExist = True

		' Check CODCARR extended filter
		If (TextFilterApplied(Listado_Morosos.CODCARR)) Then bFilterExist = True

		' Check Carrera dropdown filter
		If (NonTextFilterApplied(Listado_Morosos.Carrera)) Then bFilterExist = True

		' Check Facultad dropdown filter
		If (NonTextFilterApplied(Listado_Morosos.Facultad)) Then bFilterExist = True

		' Check ANO dropdown filter
		If (NonTextFilterApplied(Listado_Morosos.ANO)) Then bFilterExist = True

		' Check PERIODO dropdown filter
		If (NonTextFilterApplied(Listado_Morosos.PERIODO)) Then bFilterExist = True

		' Check ESTACAD dropdown filter
		If (NonTextFilterApplied(Listado_Morosos.ESTACAD)) Then bFilterExist = True

		' Check FECVEN extended filter
		If (TextFilterApplied(Listado_Morosos.FECVEN)) Then bFilterExist = True

		' Check USUARIO dropdown filter
		If (NonTextFilterApplied(Listado_Morosos.USUARIO)) Then bFilterExist = True

		' Check FECDEUDA extended filter
		If (TextFilterApplied(Listado_Morosos.FECDEUDA)) Then bFilterExist = True

		' Check TIPOSITU dropdown filter
		If (NonTextFilterApplied(Listado_Morosos.TIPOSITU)) Then bFilterExist = True

		' Check DESCRIPCION dropdown filter
		If (NonTextFilterApplied(Listado_Morosos.DESCRIPCION)) Then bFilterExist = True
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
		BuildExtendedFilter(Listado_Morosos.rut, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.rut.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Listado_Morosos.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Listado_Morosos.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODAPOD
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Listado_Morosos.CODAPOD, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.CODAPOD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODCARR
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Listado_Morosos.CODCARR, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.CODCARR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Carrera
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Listado_Morosos.Carrera, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.Carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Facultad
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Listado_Morosos.Facultad, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.Facultad.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Listado_Morosos.ANO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.ANO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Listado_Morosos.PERIODO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.PERIODO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTACAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Listado_Morosos.ESTACAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.ESTACAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECVEN
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Listado_Morosos.FECVEN, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.FECVEN.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field USUARIO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Listado_Morosos.USUARIO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.USUARIO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECDEUDA
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Listado_Morosos.FECDEUDA, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.FECDEUDA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field TIPOSITU
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Listado_Morosos.TIPOSITU, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.TIPOSITU.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field DESCRIPCION
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Listado_Morosos.DESCRIPCION, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Listado_Morosos.DESCRIPCION.FldCaption() & "<br>"
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
				Listado_Morosos.OrderBy = ""
				Listado_Morosos.StartGroup = 1
				Listado_Morosos.rut.Sort = ""
				Listado_Morosos.DIG.Sort = ""
				Listado_Morosos.Nombre_alumno.Sort = ""
				Listado_Morosos.PATERNO.Sort = ""
				Listado_Morosos.MATERNO.Sort = ""
				Listado_Morosos.MAIL.Sort = ""
				Listado_Morosos.DIRPROC.Sort = ""
				Listado_Morosos.COMUNAPRO.Sort = ""
				Listado_Morosos.CIUPROC.Sort = ""
				Listado_Morosos.FONOPROC.Sort = ""
				Listado_Morosos.FONOACT.Sort = ""
				Listado_Morosos.CODAPOD.Sort = ""
				Listado_Morosos.CODCARR.Sort = ""
				Listado_Morosos.Carrera.Sort = ""
				Listado_Morosos.CODFAC.Sort = ""
				Listado_Morosos.Facultad.Sort = ""
				Listado_Morosos.ANO.Sort = ""
				Listado_Morosos.PERIODO.Sort = ""
				Listado_Morosos.ESTACAD.Sort = ""
				Listado_Morosos.numero_pagare.Sort = ""
				Listado_Morosos.CodDoc.Sort = ""
				Listado_Morosos.Documento.Sort = ""
				Listado_Morosos.CUOTA.Sort = ""
				Listado_Morosos.NumCuotas.Sort = ""
				Listado_Morosos.MONTO.Sort = ""
				Listado_Morosos.SALDO.Sort = ""
				Listado_Morosos.FECVEN.Sort = ""
				Listado_Morosos.USUARIO.Sort = ""
				Listado_Morosos.FECDEUDA.Sort = ""
				Listado_Morosos.TIPOSITU.Sort = ""
				Listado_Morosos.DESCRIPCION.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Listado_Morosos.CurrentOrder = ew_Get("order")
			Listado_Morosos.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Listado_Morosos.SortSql()
			Listado_Morosos.OrderBy = sSortSql
			Listado_Morosos.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Listado_Morosos.OrderBy)) Then
			Listado_Morosos.OrderBy = "[FECVEN] DESC"
			Listado_Morosos.FECVEN.Sort = "DESC"
		End If
		Return Listado_Morosos.OrderBy
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
		Listado_Morosos_summary = New crListado_Morosos_summary(Me)
		Listado_Morosos_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Listado_Morosos_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Listado_Morosos_summary IsNot Nothing) Then Listado_Morosos_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Listado_Morosos.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Listado_Morosos_summary = new ewrpt_Page("Listado_Morosos_summary");
// page properties
Listado_Morosos_summary.PageID = "summary"; // page ID
Listado_Morosos_summary.FormID = "fListado_Morosossummaryfilter"; // form ID
var EWRPT_PAGE_ID = Listado_Morosos_summary.PageID;
// extend page with ValidateForm function
Listado_Morosos_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_FECVEN;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Listado_Morosos.FECVEN.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_FECDEUDA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Listado_Morosos.FECDEUDA.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Listado_Morosos_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Listado_Morosos_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Listado_Morosos_summary.ValidateRequired = false; // no JavaScript validation
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
<% Listado_Morosos_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Listado_Morosos.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Listado_Morosos.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Listado_Morosos.TableCaption() %></h1></div>
<% If (Listado_Morosos.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Listado_Morosos_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" alt="Exportar a Excel" title="Exportar a Excel" /></a>
<% If (Listado_Morosos_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Listado_Morosos_summary.ShowMessage() %>
<% If (Listado_Morosos.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Listado_Morosos.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Listado_Morosos.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Listado_Morosos.FilterPanelOption = 2 OrElse (Listado_Morosos.FilterPanelOption = 3 AndAlso Listado_Morosos_summary.FilterApplied) OrElse Listado_Morosos_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Listado_Morosossmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fListado_Morosossummaryfilter" id="fListado_Morosossummaryfilter" action="Listado_Morosossmry.aspx" class="ewForm" onsubmit="return Listado_Morosos_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Listado_Morosos.FECDEUDA.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.rut.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_rut" id="sv1_rut" size="30" maxlength="30" value="<%= ew_HtmlEncode(Listado_Morosos.rut.SearchValue) %>"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_rut", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Listado_Morosos.PATERNO.SearchValue) %>"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Listado_Morosos.MATERNO.SearchValue) %>"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.CODAPOD.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODAPOD" id="sv1_CODAPOD" size="30" maxlength="30" value="<%= ew_HtmlEncode(Listado_Morosos.CODAPOD.SearchValue) %>"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_CODAPOD", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.CODCARR.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODCARR" id="sv1_CODCARR" size="30" maxlength="50" value="<%= ew_HtmlEncode(Listado_Morosos.CODCARR.SearchValue) %>"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_CODCARR", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.Carrera.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Carrera" id="sv_Carrera"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_Carrera", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.Carrera.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Listado_Morosos.Carrera.CustomFilters.Count + Listado_Morosos.Carrera.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Listado_Morosos.Carrera.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Carrera")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.Carrera.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Listado_Morosos.Carrera.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.Carrera.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.Facultad.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Facultad" id="sv_Facultad"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_Facultad", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.Facultad.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Listado_Morosos.Facultad.CustomFilters.Count + Listado_Morosos.Facultad.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Listado_Morosos.Facultad.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Facultad")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.Facultad.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Listado_Morosos.Facultad.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.Facultad.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.ANO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO" id="sv_ANO"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_ANO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.ANO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Listado_Morosos.ANO.CustomFilters.Count + Listado_Morosos.ANO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Listado_Morosos.ANO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.ANO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Listado_Morosos.ANO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.ANO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.PERIODO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO" id="sv_PERIODO"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_PERIODO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.PERIODO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Listado_Morosos.PERIODO.CustomFilters.Count + Listado_Morosos.PERIODO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Listado_Morosos.PERIODO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PERIODO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.PERIODO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Listado_Morosos.PERIODO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.PERIODO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.ESTACAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Listado_Morosos.ESTACAD.CustomFilters.Count + Listado_Morosos.ESTACAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Listado_Morosos.ESTACAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTACAD")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Listado_Morosos.ESTACAD.DropDownValue" id="Listado_Morosos.ESTACAD.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.ESTACAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Listado_Morosos.ESTACAD.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTACAD" id="sv_ESTACAD" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.ESTACAD.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.FECVEN.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECVEN" id="sv1_FECVEN" value="<%= ew_HtmlEncode(Listado_Morosos.FECVEN.SearchValue) %>"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_FECVEN", " class=""ewInputCleared""", "") %>>
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
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.USUARIO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_USUARIO" id="sv_USUARIO"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_USUARIO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.USUARIO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Listado_Morosos.USUARIO.CustomFilters.Count + Listado_Morosos.USUARIO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Listado_Morosos.USUARIO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "USUARIO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.USUARIO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Listado_Morosos.USUARIO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.USUARIO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.FECDEUDA.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECDEUDA" id="sv1_FECDEUDA" value="<%= ew_HtmlEncode(Listado_Morosos.FECDEUDA.SearchValue) %>"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_FECDEUDA", " class=""ewInputCleared""", "") %>>
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
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.TIPOSITU.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Listado_Morosos.TIPOSITU.CustomFilters.Count + Listado_Morosos.TIPOSITU.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Listado_Morosos.TIPOSITU.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "TIPOSITU")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Listado_Morosos.TIPOSITU.DropDownValue" id="Listado_Morosos.TIPOSITU.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.TIPOSITU.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Listado_Morosos.TIPOSITU.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_TIPOSITU" id="sv_TIPOSITU" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.TIPOSITU.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Listado_Morosos.DESCRIPCION.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_DESCRIPCION" id="sv_DESCRIPCION"<%= IIf(Listado_Morosos_summary.ClearExtFilter = "Listado_Morosos_DESCRIPCION", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.DESCRIPCION.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Listado_Morosos.DESCRIPCION.CustomFilters.Count + Listado_Morosos.DESCRIPCION.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Listado_Morosos.DESCRIPCION.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "DESCRIPCION")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.DESCRIPCION.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Listado_Morosos.DESCRIPCION.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Listado_Morosos.DESCRIPCION.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (Listado_Morosos.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Listado_Morosos_summary.ShowFilterList() %>
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
If (Listado_Morosos.ExportAll AndAlso ew_NotEmpty(Listado_Morosos.Export)) Then
	Listado_Morosos_summary.StopGrp = Listado_Morosos_summary.TotalGrps
Else
	Listado_Morosos_summary.StopGrp = Listado_Morosos_summary.StartGrp + Listado_Morosos_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Listado_Morosos_summary.StopGrp > Listado_Morosos_summary.TotalGrps) Then
	Listado_Morosos_summary.StopGrp = Listado_Morosos_summary.TotalGrps
End If
Listado_Morosos_summary.RecCount = 0

' Get first row
If (Listado_Morosos_summary.TotalGrps > 0) Then
	Listado_Morosos_summary.GetRow() ' ASPXRPT
	Listado_Morosos_summary.GrpCount = 1
End If
While ((Listado_Morosos_summary.HasRow AndAlso Listado_Morosos_summary.GrpIndex < Listado_Morosos_summary.StopGrp) OrElse Listado_Morosos_summary.ShowFirstHeader)

	' Show header
	If (Listado_Morosos_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.rut.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.rut))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.rut.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.rut) %>',0);"><%= Listado_Morosos.rut.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.rut.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.rut.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.DIG.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.DIG))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.DIG.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.DIG) %>',0);"><%= Listado_Morosos.DIG.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.DIG.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.DIG.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.Nombre_alumno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.Nombre_alumno))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.Nombre_alumno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.Nombre_alumno) %>',0);"><%= Listado_Morosos.Nombre_alumno.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.Nombre_alumno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.Nombre_alumno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.PATERNO) %>',0);"><%= Listado_Morosos.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.MATERNO) %>',0);"><%= Listado_Morosos.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.MAIL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.MAIL))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.MAIL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.MAIL) %>',0);"><%= Listado_Morosos.MAIL.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.MAIL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.MAIL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.DIRPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.DIRPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.DIRPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.DIRPROC) %>',0);"><%= Listado_Morosos.DIRPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.DIRPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.DIRPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.COMUNAPRO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.COMUNAPRO))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.COMUNAPRO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.COMUNAPRO) %>',0);"><%= Listado_Morosos.COMUNAPRO.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.COMUNAPRO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.COMUNAPRO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.CIUPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.CIUPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.CIUPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.CIUPROC) %>',0);"><%= Listado_Morosos.CIUPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.CIUPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.CIUPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.FONOPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.FONOPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.FONOPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.FONOPROC) %>',0);"><%= Listado_Morosos.FONOPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.FONOPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.FONOPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.FONOACT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.FONOACT))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.FONOACT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.FONOACT) %>',0);"><%= Listado_Morosos.FONOACT.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.FONOACT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.FONOACT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.CODAPOD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.CODAPOD))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.CODAPOD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.CODAPOD) %>',0);"><%= Listado_Morosos.CODAPOD.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.CODAPOD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.CODAPOD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.CODCARR) %>',0);"><%= Listado_Morosos.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.Carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.Carrera))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.Carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.Carrera) %>',0);"><%= Listado_Morosos.Carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.Carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.Carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.CODFAC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.CODFAC))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.CODFAC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.CODFAC) %>',0);"><%= Listado_Morosos.CODFAC.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.CODFAC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.CODFAC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.Facultad.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.Facultad))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.Facultad.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.Facultad) %>',0);"><%= Listado_Morosos.Facultad.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.Facultad.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.Facultad.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.ANO) %>',0);"><%= Listado_Morosos.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.PERIODO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.PERIODO))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.PERIODO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.PERIODO) %>',0);"><%= Listado_Morosos.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.PERIODO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.PERIODO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.ESTACAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.ESTACAD))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.ESTACAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.ESTACAD) %>',0);"><%= Listado_Morosos.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.ESTACAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.ESTACAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.numero_pagare.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.numero_pagare))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.numero_pagare.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.numero_pagare) %>',0);"><%= Listado_Morosos.numero_pagare.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.numero_pagare.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.numero_pagare.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.CodDoc.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.CodDoc))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.CodDoc.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.CodDoc) %>',0);"><%= Listado_Morosos.CodDoc.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.CodDoc.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.CodDoc.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.Documento.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.Documento))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.Documento.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.Documento) %>',0);"><%= Listado_Morosos.Documento.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.Documento.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.Documento.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.CUOTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.CUOTA))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.CUOTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.CUOTA) %>',0);"><%= Listado_Morosos.CUOTA.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.CUOTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.CUOTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.NumCuotas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.NumCuotas))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.NumCuotas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.NumCuotas) %>',0);"><%= Listado_Morosos.NumCuotas.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.NumCuotas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.NumCuotas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.MONTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.MONTO))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.MONTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.MONTO) %>',0);"><%= Listado_Morosos.MONTO.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.MONTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.MONTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.SALDO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.SALDO))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.SALDO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.SALDO) %>',0);"><%= Listado_Morosos.SALDO.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.SALDO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.SALDO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.FECVEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.FECVEN))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.FECVEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.FECVEN) %>',0);"><%= Listado_Morosos.FECVEN.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.FECVEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.FECVEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.USUARIO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.USUARIO))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.USUARIO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.USUARIO) %>',0);"><%= Listado_Morosos.USUARIO.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.USUARIO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.USUARIO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.FECDEUDA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.FECDEUDA))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.FECDEUDA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.FECDEUDA) %>',0);"><%= Listado_Morosos.FECDEUDA.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.FECDEUDA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.FECDEUDA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.TIPOSITU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.TIPOSITU))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.TIPOSITU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.TIPOSITU) %>',0);"><%= Listado_Morosos.TIPOSITU.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.TIPOSITU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.TIPOSITU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Listado_Morosos.Export)) Then %>
<%= Listado_Morosos.DESCRIPCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Listado_Morosos.SortUrl(Listado_Morosos.DESCRIPCION))) Then %>
		<td style="vertical-align: bottom;"><%= Listado_Morosos.DESCRIPCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Listado_Morosos.SortUrl(Listado_Morosos.DESCRIPCION) %>',0);"><%= Listado_Morosos.DESCRIPCION.FldCaption() %></td><td style="width: 10px;">
		<% If (Listado_Morosos.DESCRIPCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Listado_Morosos.DESCRIPCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Listado_Morosos_summary.ShowFirstHeader = False
	End If
	Listado_Morosos_summary.RecCount += 1

		' Render detail row
		Listado_Morosos.ResetCSS()
		Listado_Morosos.RowType = EWRPT_ROWTYPE_DETAIL
		Listado_Morosos_summary.RenderRow()
%>
	<tr<%= Listado_Morosos.RowAttributes() %>>
		<td<%= Listado_Morosos.rut.CellAttributes %>>
<div<%= Listado_Morosos.rut.ViewAttributes%>><%= Listado_Morosos.rut.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.DIG.CellAttributes %>>
<div<%= Listado_Morosos.DIG.ViewAttributes%>><%= Listado_Morosos.DIG.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.Nombre_alumno.CellAttributes %>>
<div<%= Listado_Morosos.Nombre_alumno.ViewAttributes%>><%= Listado_Morosos.Nombre_alumno.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.PATERNO.CellAttributes %>>
<div<%= Listado_Morosos.PATERNO.ViewAttributes%>><%= Listado_Morosos.PATERNO.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.MATERNO.CellAttributes %>>
<div<%= Listado_Morosos.MATERNO.ViewAttributes%>><%= Listado_Morosos.MATERNO.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.MAIL.CellAttributes %>>
<div<%= Listado_Morosos.MAIL.ViewAttributes%>><%= Listado_Morosos.MAIL.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.DIRPROC.CellAttributes %>>
<div<%= Listado_Morosos.DIRPROC.ViewAttributes%>><%= Listado_Morosos.DIRPROC.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.COMUNAPRO.CellAttributes %>>
<div<%= Listado_Morosos.COMUNAPRO.ViewAttributes%>><%= Listado_Morosos.COMUNAPRO.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.CIUPROC.CellAttributes %>>
<div<%= Listado_Morosos.CIUPROC.ViewAttributes%>><%= Listado_Morosos.CIUPROC.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.FONOPROC.CellAttributes %>>
<div<%= Listado_Morosos.FONOPROC.ViewAttributes%>><%= Listado_Morosos.FONOPROC.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.FONOACT.CellAttributes %>>
<div<%= Listado_Morosos.FONOACT.ViewAttributes%>><%= Listado_Morosos.FONOACT.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.CODAPOD.CellAttributes %>>
<div<%= Listado_Morosos.CODAPOD.ViewAttributes%>><%= Listado_Morosos.CODAPOD.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.CODCARR.CellAttributes %>>
<div<%= Listado_Morosos.CODCARR.ViewAttributes%>><%= Listado_Morosos.CODCARR.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.Carrera.CellAttributes %>>
<div<%= Listado_Morosos.Carrera.ViewAttributes%>><%= Listado_Morosos.Carrera.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.CODFAC.CellAttributes %>>
<div<%= Listado_Morosos.CODFAC.ViewAttributes%>><%= Listado_Morosos.CODFAC.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.Facultad.CellAttributes %>>
<div<%= Listado_Morosos.Facultad.ViewAttributes%>><%= Listado_Morosos.Facultad.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.ANO.CellAttributes %>>
<div<%= Listado_Morosos.ANO.ViewAttributes%>><%= Listado_Morosos.ANO.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.PERIODO.CellAttributes %>>
<div<%= Listado_Morosos.PERIODO.ViewAttributes%>><%= Listado_Morosos.PERIODO.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.ESTACAD.CellAttributes %>>
<div<%= Listado_Morosos.ESTACAD.ViewAttributes%>><%= Listado_Morosos.ESTACAD.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.numero_pagare.CellAttributes %>>
<div<%= Listado_Morosos.numero_pagare.ViewAttributes%>><%= Listado_Morosos.numero_pagare.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.CodDoc.CellAttributes %>>
<div<%= Listado_Morosos.CodDoc.ViewAttributes%>><%= Listado_Morosos.CodDoc.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.Documento.CellAttributes %>>
<div<%= Listado_Morosos.Documento.ViewAttributes%>><%= Listado_Morosos.Documento.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.CUOTA.CellAttributes %>>
<div<%= Listado_Morosos.CUOTA.ViewAttributes%>><%= Listado_Morosos.CUOTA.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.NumCuotas.CellAttributes %>>
<div<%= Listado_Morosos.NumCuotas.ViewAttributes%>><%= Listado_Morosos.NumCuotas.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.MONTO.CellAttributes %>>
<div<%= Listado_Morosos.MONTO.ViewAttributes%>><%= Listado_Morosos.MONTO.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.SALDO.CellAttributes %>>
<div<%= Listado_Morosos.SALDO.ViewAttributes%>><%= Listado_Morosos.SALDO.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.FECVEN.CellAttributes %>>
<div<%= Listado_Morosos.FECVEN.ViewAttributes%>><%= Listado_Morosos.FECVEN.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.USUARIO.CellAttributes %>>
<div<%= Listado_Morosos.USUARIO.ViewAttributes%>><%= Listado_Morosos.USUARIO.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.FECDEUDA.CellAttributes %>>
<div<%= Listado_Morosos.FECDEUDA.ViewAttributes%>><%= Listado_Morosos.FECDEUDA.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.TIPOSITU.CellAttributes %>>
<div<%= Listado_Morosos.TIPOSITU.ViewAttributes%>><%= Listado_Morosos.TIPOSITU.ListViewValue%></div>
</td>
		<td<%= Listado_Morosos.DESCRIPCION.CellAttributes %>>
<div<%= Listado_Morosos.DESCRIPCION.ViewAttributes%>><%= Listado_Morosos.DESCRIPCION.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Listado_Morosos_summary.AccumulateSummary()

		' Get next record
		Listado_Morosos_summary.GetRow() ' ASPXRPT
		Listado_Morosos_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Listado_Morosos_summary.TotalGrps > 0) Then
	Listado_Morosos.ResetCSS()
	Listado_Morosos.RowType = EWRPT_ROWTYPE_TOTAL
	Listado_Morosos.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Listado_Morosos.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Listado_Morosos.RowAttrs("class") = "ewRptGrandSummary"
	Listado_Morosos_summary.RenderRow()
%>
	<!-- tr><td colspan="31"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Listado_Morosos.RowAttributes() %>><td colspan="31"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Listado_Morosos_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Listado_Morosos.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Listado_Morosos_summary.Pager Is Nothing Then Listado_Morosos_summary.Pager = New cPrevNextPager(Listado_Morosos_summary.StartGrp, Listado_Morosos_summary.DisplayGrps, Listado_Morosos_summary.TotalGrps) %>
<% If Listado_Morosos_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Listado_Morosos_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Listado_Morosossmry.aspx?start=<%= Listado_Morosos_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Listado_Morosos_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Listado_Morosossmry.aspx?start=<%= Listado_Morosos_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Listado_Morosos_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Listado_Morosos_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Listado_Morosossmry.aspx?start=<%= Listado_Morosos_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Listado_Morosos_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Listado_Morosossmry.aspx?start=<%= Listado_Morosos_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Listado_Morosos_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Listado_Morosos_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Listado_Morosos_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Listado_Morosos_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Listado_Morosos_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Listado_Morosos_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Listado_Morosos_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Listado_Morosos_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Listado_Morosos_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Listado_Morosos.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Listado_Morosos.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Listado_Morosos.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Listado_Morosos_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Listado_Morosos.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
