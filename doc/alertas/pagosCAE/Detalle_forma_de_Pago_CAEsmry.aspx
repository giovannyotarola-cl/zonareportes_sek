<%@ Page ClassName="Detalle_forma_de_Pago_CAEsmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_PagoCAE" %>
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
	Public Detalle_forma_de_Pago_CAE As crDetalle_forma_de_Pago_CAE = Nothing

	'
	' Table class (for Detalle forma de Pago CAE)
	'
	Public Class crDetalle_forma_de_Pago_CAE
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
				Return "Detalle_forma_de_Pago_CAE"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Detalle forma de Pago CAE"
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

		Public PATERNO As crField

		Public MATERNO As crField

		Public Nombre_alumno As crField

		Public RUT_Alumno As crField

		Public CODCARR As crField

		Public Carrera As crField

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

		Public ESTACAD As crField

		Public MAIL As crField

		Public DIRPROC As crField

		Public CIUPROC As crField

		Public COMUNAPRO As crField

		Public FONOPROC As crField

		Public FONOACT As crField

		Public USUARIO As crField

		Public CODAPOD As crField

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

			' PATERNO
			PATERNO = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' Nombre_alumno
			Nombre_alumno = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_Nombre_alumno", "Nombre_alumno", "[Nombre_alumno]", 200, EWRPT_DATATYPE_STRING, -1)
			Nombre_alumno.Page = APage
			Nombre_alumno.ParentPage = APage.ParentPage
			Fields.Add("Nombre_alumno", Nombre_alumno)
			Nombre_alumno.DateFilter = ""
			Nombre_alumno.SqlSelect = ""
			Nombre_alumno.SqlOrderBy = ""

			' RUT_Alumno
			RUT_Alumno = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_RUT_Alumno", "RUT_Alumno", "[RUT_Alumno]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT_Alumno.Page = APage
			RUT_Alumno.ParentPage = APage.ParentPage
			Fields.Add("RUT_Alumno", RUT_Alumno)
			RUT_Alumno.DateFilter = ""
			RUT_Alumno.SqlSelect = ""
			RUT_Alumno.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' Carrera
			Carrera = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_Carrera", "Carrera", "[Carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			Carrera.Page = APage
			Carrera.ParentPage = APage.ParentPage
			Fields.Add("Carrera", Carrera)
			Carrera.DateFilter = ""
			Carrera.SqlSelect = ""
			Carrera.SqlOrderBy = ""

			' Facultad
			Facultad = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_Facultad", "Facultad", "[Facultad]", 200, EWRPT_DATATYPE_STRING, -1)
			Facultad.Page = APage
			Facultad.ParentPage = APage.ParentPage
			Fields.Add("Facultad", Facultad)
			Facultad.DateFilter = ""
			Facultad.SqlSelect = ""
			Facultad.SqlOrderBy = ""

			' ANO
			ANO = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_PERIODO", "PERIODO", "[PERIODO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			PERIODO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' numero_pagare
			numero_pagare = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_numero_pagare", "numero_pagare", "[numero_pagare]", 131, EWRPT_DATATYPE_NUMBER, -1)
			numero_pagare.Page = APage
			numero_pagare.ParentPage = APage.ParentPage
			numero_pagare.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("numero_pagare", numero_pagare)
			numero_pagare.DateFilter = ""
			numero_pagare.SqlSelect = ""
			numero_pagare.SqlOrderBy = ""

			' CodDoc
			CodDoc = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_CodDoc", "CodDoc", "[CodDoc]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CodDoc.Page = APage
			CodDoc.ParentPage = APage.ParentPage
			CodDoc.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CodDoc", CodDoc)
			CodDoc.DateFilter = ""
			CodDoc.SqlSelect = ""
			CodDoc.SqlOrderBy = ""

			' Documento
			Documento = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_Documento", "Documento", "[Documento]", 200, EWRPT_DATATYPE_STRING, -1)
			Documento.Page = APage
			Documento.ParentPage = APage.ParentPage
			Fields.Add("Documento", Documento)
			Documento.DateFilter = ""
			Documento.SqlSelect = ""
			Documento.SqlOrderBy = ""

			' CUOTA
			CUOTA = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_CUOTA", "CUOTA", "[CUOTA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CUOTA.Page = APage
			CUOTA.ParentPage = APage.ParentPage
			CUOTA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CUOTA", CUOTA)
			CUOTA.DateFilter = ""
			CUOTA.SqlSelect = ""
			CUOTA.SqlOrderBy = ""

			' NumCuotas
			NumCuotas = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_NumCuotas", "NumCuotas", "[NumCuotas]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NumCuotas.Page = APage
			NumCuotas.ParentPage = APage.ParentPage
			NumCuotas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NumCuotas", NumCuotas)
			NumCuotas.DateFilter = ""
			NumCuotas.SqlSelect = ""
			NumCuotas.SqlOrderBy = ""

			' MONTO
			MONTO = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_MONTO", "MONTO", "[MONTO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			MONTO.Page = APage
			MONTO.ParentPage = APage.ParentPage
			MONTO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("MONTO", MONTO)
			MONTO.DateFilter = ""
			MONTO.SqlSelect = ""
			MONTO.SqlOrderBy = ""

			' SALDO
			SALDO = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_SALDO", "SALDO", "[SALDO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			SALDO.Page = APage
			SALDO.ParentPage = APage.ParentPage
			SALDO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("SALDO", SALDO)
			SALDO.DateFilter = ""
			SALDO.SqlSelect = ""
			SALDO.SqlOrderBy = ""

			' FECVEN
			FECVEN = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_FECVEN", "FECVEN", "[FECVEN]", 135, EWRPT_DATATYPE_DATE, 7)
			FECVEN.Page = APage
			FECVEN.ParentPage = APage.ParentPage
			FECVEN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECVEN", FECVEN)
			FECVEN.DateFilter = ""
			FECVEN.SqlSelect = ""
			FECVEN.SqlOrderBy = ""

			' FECDEUDA
			FECDEUDA = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_FECDEUDA", "FECDEUDA", "[FECDEUDA]", 135, EWRPT_DATATYPE_DATE, 7)
			FECDEUDA.Page = APage
			FECDEUDA.ParentPage = APage.ParentPage
			FECDEUDA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECDEUDA", FECDEUDA)
			FECDEUDA.DateFilter = ""
			FECDEUDA.SqlSelect = ""
			FECDEUDA.SqlOrderBy = ""

			' ESTACAD
			ESTACAD = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTACAD.Page = APage
			ESTACAD.ParentPage = APage.ParentPage
			Fields.Add("ESTACAD", ESTACAD)
			ESTACAD.DateFilter = ""
			ESTACAD.SqlSelect = ""
			ESTACAD.SqlOrderBy = ""

			' MAIL
			MAIL = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_MAIL", "MAIL", "[MAIL]", 200, EWRPT_DATATYPE_STRING, -1)
			MAIL.Page = APage
			MAIL.ParentPage = APage.ParentPage
			Fields.Add("MAIL", MAIL)
			MAIL.DateFilter = ""
			MAIL.SqlSelect = ""
			MAIL.SqlOrderBy = ""

			' DIRPROC
			DIRPROC = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_DIRPROC", "DIRPROC", "[DIRPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			DIRPROC.Page = APage
			DIRPROC.ParentPage = APage.ParentPage
			Fields.Add("DIRPROC", DIRPROC)
			DIRPROC.DateFilter = ""
			DIRPROC.SqlSelect = ""
			DIRPROC.SqlOrderBy = ""

			' CIUPROC
			CIUPROC = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_CIUPROC", "CIUPROC", "[CIUPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			CIUPROC.Page = APage
			CIUPROC.ParentPage = APage.ParentPage
			Fields.Add("CIUPROC", CIUPROC)
			CIUPROC.DateFilter = ""
			CIUPROC.SqlSelect = ""
			CIUPROC.SqlOrderBy = ""

			' COMUNAPRO
			COMUNAPRO = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_COMUNAPRO", "COMUNAPRO", "[COMUNAPRO]", 200, EWRPT_DATATYPE_STRING, -1)
			COMUNAPRO.Page = APage
			COMUNAPRO.ParentPage = APage.ParentPage
			Fields.Add("COMUNAPRO", COMUNAPRO)
			COMUNAPRO.DateFilter = ""
			COMUNAPRO.SqlSelect = ""
			COMUNAPRO.SqlOrderBy = ""

			' FONOPROC
			FONOPROC = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_FONOPROC", "FONOPROC", "[FONOPROC]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOPROC.Page = APage
			FONOPROC.ParentPage = APage.ParentPage
			Fields.Add("FONOPROC", FONOPROC)
			FONOPROC.DateFilter = ""
			FONOPROC.SqlSelect = ""
			FONOPROC.SqlOrderBy = ""

			' FONOACT
			FONOACT = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_FONOACT", "FONOACT", "[FONOACT]", 200, EWRPT_DATATYPE_STRING, -1)
			FONOACT.Page = APage
			FONOACT.ParentPage = APage.ParentPage
			Fields.Add("FONOACT", FONOACT)
			FONOACT.DateFilter = ""
			FONOACT.SqlSelect = ""
			FONOACT.SqlOrderBy = ""

			' USUARIO
			USUARIO = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_USUARIO", "USUARIO", "[USUARIO]", 200, EWRPT_DATATYPE_STRING, -1)
			USUARIO.Page = APage
			USUARIO.ParentPage = APage.ParentPage
			Fields.Add("USUARIO", USUARIO)
			USUARIO.DateFilter = ""
			USUARIO.SqlSelect = ""
			USUARIO.SqlOrderBy = ""

			' CODAPOD
			CODAPOD = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_CODAPOD", "CODAPOD", "[CODAPOD]", 200, EWRPT_DATATYPE_STRING, -1)
			CODAPOD.Page = APage
			CODAPOD.ParentPage = APage.ParentPage
			Fields.Add("CODAPOD", CODAPOD)
			CODAPOD.DateFilter = ""
			CODAPOD.SqlSelect = ""
			CODAPOD.SqlOrderBy = ""

			' TIPOSITU
			TIPOSITU = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_TIPOSITU", "TIPOSITU", "[TIPOSITU]", 131, EWRPT_DATATYPE_NUMBER, -1)
			TIPOSITU.Page = APage
			TIPOSITU.ParentPage = APage.ParentPage
			TIPOSITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("TIPOSITU", TIPOSITU)
			TIPOSITU.DateFilter = ""
			TIPOSITU.SqlSelect = ""
			TIPOSITU.SqlOrderBy = ""

			' DESCRIPCION
			DESCRIPCION = new crField("Detalle_forma_de_Pago_CAE", "Detalle forma de Pago CAE", "x_DESCRIPCION", "DESCRIPCION", "[DESCRIPCION]", 200, EWRPT_DATATYPE_STRING, -1)
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
				Return "[SEK_V_Pagares]"
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
	Public Detalle_forma_de_Pago_CAE_summary As crDetalle_forma_de_Pago_CAE_summary

	'
	' Page class
	'
	Public Class crDetalle_forma_de_Pago_CAE_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Detalle_forma_de_Pago_CAE.UseTokenInUrl) Then
				sUrl &= "t=" & Detalle_forma_de_Pago_CAE.TableVar & "&" ' Add page token
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
			If (Detalle_forma_de_Pago_CAE.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Detalle_forma_de_Pago_CAE.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Detalle_forma_de_Pago_CAE.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Detalle_forma_de_Pago_CAEsmry 
			Get
				Return CType(m_ParentPage, Detalle_forma_de_Pago_CAEsmry)
			End Get
		End Property

		' Table object (Detalle_forma_de_Pago_CAE)
		Public Property Detalle_forma_de_Pago_CAE As crDetalle_forma_de_Pago_CAE 
			Get		
				Return AspNetPage.Detalle_forma_de_Pago_CAE ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crDetalle_forma_de_Pago_CAE)
				AspNetPage.Detalle_forma_de_Pago_CAE = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_PagoCAE)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Detalle_forma_de_Pago_CAE_summary"
			m_PageObjTypeName = "crDetalle_forma_de_Pago_CAE_summary"

			' Table name
			m_TableName = "Detalle forma de Pago CAE"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Detalle_forma_de_Pago_CAE)
			Detalle_forma_de_Pago_CAE = New crDetalle_forma_de_Pago_CAE(Me)			

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
				Detalle_forma_de_Pago_CAE.Export = ew_Get("export")
			End If
			gsExport = Detalle_forma_de_Pago_CAE.Export ' Get export parameter, used in header
			gsExportFile = Detalle_forma_de_Pago_CAE.TableVar ' Get export file, used in header
			If (Detalle_forma_de_Pago_CAE.Export = "excel") Then
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

		Public Val As Object() = New Object(29) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(29) {}

		Public GrandMn As Object() = New Object(29) {}

		Public GrandMx As Object() = New Object(29) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 30 ' No. of fields
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
			Detalle_forma_de_Pago_CAE.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Detalle_forma_de_Pago_CAE.SqlSelect, Detalle_forma_de_Pago_CAE.SqlWhere, Detalle_forma_de_Pago_CAE.SqlGroupBy, Detalle_forma_de_Pago_CAE.SqlHaving, Detalle_forma_de_Pago_CAE.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Detalle_forma_de_Pago_CAE.ExportAll AndAlso ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then
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
				Detalle_forma_de_Pago_CAE.numero_pagare.DbValue = Row("numero_pagare")
				Detalle_forma_de_Pago_CAE.RUT_Alumno.DbValue = Row("RUT_Alumno")
				Detalle_forma_de_Pago_CAE.CODCARR.DbValue = Row("CODCARR")
				Detalle_forma_de_Pago_CAE.Carrera.DbValue = Row("Carrera")
				Detalle_forma_de_Pago_CAE.CodDoc.DbValue = Row("CodDoc")
				Detalle_forma_de_Pago_CAE.Documento.DbValue = Row("Documento")
				Detalle_forma_de_Pago_CAE.ANO.DbValue = Row("ANO")
				Detalle_forma_de_Pago_CAE.PERIODO.DbValue = Row("PERIODO")
				Detalle_forma_de_Pago_CAE.CUOTA.DbValue = Row("CUOTA")
				Detalle_forma_de_Pago_CAE.NumCuotas.DbValue = Row("NumCuotas")
				Detalle_forma_de_Pago_CAE.MONTO.DbValue = Row("MONTO")
				Detalle_forma_de_Pago_CAE.SALDO.DbValue = Row("SALDO")
				Detalle_forma_de_Pago_CAE.FECVEN.DbValue = Row("FECVEN")
				Detalle_forma_de_Pago_CAE.PATERNO.DbValue = Row("PATERNO")
				Detalle_forma_de_Pago_CAE.MATERNO.DbValue = Row("MATERNO")
				Detalle_forma_de_Pago_CAE.Nombre_alumno.DbValue = Row("Nombre_alumno")
				Detalle_forma_de_Pago_CAE.MAIL.DbValue = Row("MAIL")
				Detalle_forma_de_Pago_CAE.DIRPROC.DbValue = Row("DIRPROC")
				Detalle_forma_de_Pago_CAE.CIUPROC.DbValue = Row("CIUPROC")
				Detalle_forma_de_Pago_CAE.COMUNAPRO.DbValue = Row("COMUNAPRO")
				Detalle_forma_de_Pago_CAE.FONOPROC.DbValue = Row("FONOPROC")
				Detalle_forma_de_Pago_CAE.FONOACT.DbValue = Row("FONOACT")
				Detalle_forma_de_Pago_CAE.Facultad.DbValue = Row("Facultad")
				Detalle_forma_de_Pago_CAE.USUARIO.DbValue = Row("USUARIO")
				Detalle_forma_de_Pago_CAE.CODAPOD.DbValue = Row("CODAPOD")
				Detalle_forma_de_Pago_CAE.FECDEUDA.DbValue = Row("FECDEUDA")
				Detalle_forma_de_Pago_CAE.ESTACAD.DbValue = Row("ESTACAD")
				Detalle_forma_de_Pago_CAE.TIPOSITU.DbValue = Row("TIPOSITU")
				Detalle_forma_de_Pago_CAE.DESCRIPCION.DbValue = Row("DESCRIPCION")
				Val(1) = Detalle_forma_de_Pago_CAE.PATERNO.CurrentValue
				Val(2) = Detalle_forma_de_Pago_CAE.MATERNO.CurrentValue
				Val(3) = Detalle_forma_de_Pago_CAE.Nombre_alumno.CurrentValue
				Val(4) = Detalle_forma_de_Pago_CAE.RUT_Alumno.CurrentValue
				Val(5) = Detalle_forma_de_Pago_CAE.CODCARR.CurrentValue
				Val(6) = Detalle_forma_de_Pago_CAE.Carrera.CurrentValue
				Val(7) = Detalle_forma_de_Pago_CAE.Facultad.CurrentValue
				Val(8) = Detalle_forma_de_Pago_CAE.ANO.CurrentValue
				Val(9) = Detalle_forma_de_Pago_CAE.PERIODO.CurrentValue
				Val(10) = Detalle_forma_de_Pago_CAE.numero_pagare.CurrentValue
				Val(11) = Detalle_forma_de_Pago_CAE.CodDoc.CurrentValue
				Val(12) = Detalle_forma_de_Pago_CAE.Documento.CurrentValue
				Val(13) = Detalle_forma_de_Pago_CAE.CUOTA.CurrentValue
				Val(14) = Detalle_forma_de_Pago_CAE.NumCuotas.CurrentValue
				Val(15) = Detalle_forma_de_Pago_CAE.MONTO.CurrentValue
				Val(16) = Detalle_forma_de_Pago_CAE.SALDO.CurrentValue
				Val(17) = Detalle_forma_de_Pago_CAE.FECVEN.CurrentValue
				Val(18) = Detalle_forma_de_Pago_CAE.FECDEUDA.CurrentValue
				Val(19) = Detalle_forma_de_Pago_CAE.ESTACAD.CurrentValue
				Val(20) = Detalle_forma_de_Pago_CAE.MAIL.CurrentValue
				Val(21) = Detalle_forma_de_Pago_CAE.DIRPROC.CurrentValue
				Val(22) = Detalle_forma_de_Pago_CAE.CIUPROC.CurrentValue
				Val(23) = Detalle_forma_de_Pago_CAE.COMUNAPRO.CurrentValue
				Val(24) = Detalle_forma_de_Pago_CAE.FONOPROC.CurrentValue
				Val(25) = Detalle_forma_de_Pago_CAE.FONOACT.CurrentValue
				Val(26) = Detalle_forma_de_Pago_CAE.USUARIO.CurrentValue
				Val(27) = Detalle_forma_de_Pago_CAE.CODAPOD.CurrentValue
				Val(28) = Detalle_forma_de_Pago_CAE.TIPOSITU.CurrentValue
				Val(29) = Detalle_forma_de_Pago_CAE.DESCRIPCION.CurrentValue
			Else
				Detalle_forma_de_Pago_CAE.numero_pagare.DbValue = ""
				Detalle_forma_de_Pago_CAE.RUT_Alumno.DbValue = ""
				Detalle_forma_de_Pago_CAE.CODCARR.DbValue = ""
				Detalle_forma_de_Pago_CAE.Carrera.DbValue = ""
				Detalle_forma_de_Pago_CAE.CodDoc.DbValue = ""
				Detalle_forma_de_Pago_CAE.Documento.DbValue = ""
				Detalle_forma_de_Pago_CAE.ANO.DbValue = ""
				Detalle_forma_de_Pago_CAE.PERIODO.DbValue = ""
				Detalle_forma_de_Pago_CAE.CUOTA.DbValue = ""
				Detalle_forma_de_Pago_CAE.NumCuotas.DbValue = ""
				Detalle_forma_de_Pago_CAE.MONTO.DbValue = ""
				Detalle_forma_de_Pago_CAE.SALDO.DbValue = ""
				Detalle_forma_de_Pago_CAE.FECVEN.DbValue = ""
				Detalle_forma_de_Pago_CAE.PATERNO.DbValue = ""
				Detalle_forma_de_Pago_CAE.MATERNO.DbValue = ""
				Detalle_forma_de_Pago_CAE.Nombre_alumno.DbValue = ""
				Detalle_forma_de_Pago_CAE.MAIL.DbValue = ""
				Detalle_forma_de_Pago_CAE.DIRPROC.DbValue = ""
				Detalle_forma_de_Pago_CAE.CIUPROC.DbValue = ""
				Detalle_forma_de_Pago_CAE.COMUNAPRO.DbValue = ""
				Detalle_forma_de_Pago_CAE.FONOPROC.DbValue = ""
				Detalle_forma_de_Pago_CAE.FONOACT.DbValue = ""
				Detalle_forma_de_Pago_CAE.Facultad.DbValue = ""
				Detalle_forma_de_Pago_CAE.USUARIO.DbValue = ""
				Detalle_forma_de_Pago_CAE.CODAPOD.DbValue = ""
				Detalle_forma_de_Pago_CAE.FECDEUDA.DbValue = ""
				Detalle_forma_de_Pago_CAE.ESTACAD.DbValue = ""
				Detalle_forma_de_Pago_CAE.TIPOSITU.DbValue = ""
				Detalle_forma_de_Pago_CAE.DESCRIPCION.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Detalle_forma_de_Pago_CAE.numero_pagare.DbValue = dr("numero_pagare")
				Detalle_forma_de_Pago_CAE.RUT_Alumno.DbValue = dr("RUT_Alumno")
				Detalle_forma_de_Pago_CAE.CODCARR.DbValue = dr("CODCARR")
				Detalle_forma_de_Pago_CAE.Carrera.DbValue = dr("Carrera")
				Detalle_forma_de_Pago_CAE.CodDoc.DbValue = dr("CodDoc")
				Detalle_forma_de_Pago_CAE.Documento.DbValue = dr("Documento")
				Detalle_forma_de_Pago_CAE.ANO.DbValue = dr("ANO")
				Detalle_forma_de_Pago_CAE.PERIODO.DbValue = dr("PERIODO")
				Detalle_forma_de_Pago_CAE.CUOTA.DbValue = dr("CUOTA")
				Detalle_forma_de_Pago_CAE.NumCuotas.DbValue = dr("NumCuotas")
				Detalle_forma_de_Pago_CAE.MONTO.DbValue = dr("MONTO")
				Detalle_forma_de_Pago_CAE.SALDO.DbValue = dr("SALDO")
				Detalle_forma_de_Pago_CAE.FECVEN.DbValue = dr("FECVEN")
				Detalle_forma_de_Pago_CAE.PATERNO.DbValue = dr("PATERNO")
				Detalle_forma_de_Pago_CAE.MATERNO.DbValue = dr("MATERNO")
				Detalle_forma_de_Pago_CAE.Nombre_alumno.DbValue = dr("Nombre_alumno")
				Detalle_forma_de_Pago_CAE.MAIL.DbValue = dr("MAIL")
				Detalle_forma_de_Pago_CAE.DIRPROC.DbValue = dr("DIRPROC")
				Detalle_forma_de_Pago_CAE.CIUPROC.DbValue = dr("CIUPROC")
				Detalle_forma_de_Pago_CAE.COMUNAPRO.DbValue = dr("COMUNAPRO")
				Detalle_forma_de_Pago_CAE.FONOPROC.DbValue = dr("FONOPROC")
				Detalle_forma_de_Pago_CAE.FONOACT.DbValue = dr("FONOACT")
				Detalle_forma_de_Pago_CAE.Facultad.DbValue = dr("Facultad")
				Detalle_forma_de_Pago_CAE.USUARIO.DbValue = dr("USUARIO")
				Detalle_forma_de_Pago_CAE.CODAPOD.DbValue = dr("CODAPOD")
				Detalle_forma_de_Pago_CAE.FECDEUDA.DbValue = dr("FECDEUDA")
				Detalle_forma_de_Pago_CAE.ESTACAD.DbValue = dr("ESTACAD")
				Detalle_forma_de_Pago_CAE.TIPOSITU.DbValue = dr("TIPOSITU")
				Detalle_forma_de_Pago_CAE.DESCRIPCION.DbValue = dr("DESCRIPCION")
				Val(1) = Detalle_forma_de_Pago_CAE.PATERNO.CurrentValue
				Val(2) = Detalle_forma_de_Pago_CAE.MATERNO.CurrentValue
				Val(3) = Detalle_forma_de_Pago_CAE.Nombre_alumno.CurrentValue
				Val(4) = Detalle_forma_de_Pago_CAE.RUT_Alumno.CurrentValue
				Val(5) = Detalle_forma_de_Pago_CAE.CODCARR.CurrentValue
				Val(6) = Detalle_forma_de_Pago_CAE.Carrera.CurrentValue
				Val(7) = Detalle_forma_de_Pago_CAE.Facultad.CurrentValue
				Val(8) = Detalle_forma_de_Pago_CAE.ANO.CurrentValue
				Val(9) = Detalle_forma_de_Pago_CAE.PERIODO.CurrentValue
				Val(10) = Detalle_forma_de_Pago_CAE.numero_pagare.CurrentValue
				Val(11) = Detalle_forma_de_Pago_CAE.CodDoc.CurrentValue
				Val(12) = Detalle_forma_de_Pago_CAE.Documento.CurrentValue
				Val(13) = Detalle_forma_de_Pago_CAE.CUOTA.CurrentValue
				Val(14) = Detalle_forma_de_Pago_CAE.NumCuotas.CurrentValue
				Val(15) = Detalle_forma_de_Pago_CAE.MONTO.CurrentValue
				Val(16) = Detalle_forma_de_Pago_CAE.SALDO.CurrentValue
				Val(17) = Detalle_forma_de_Pago_CAE.FECVEN.CurrentValue
				Val(18) = Detalle_forma_de_Pago_CAE.FECDEUDA.CurrentValue
				Val(19) = Detalle_forma_de_Pago_CAE.ESTACAD.CurrentValue
				Val(20) = Detalle_forma_de_Pago_CAE.MAIL.CurrentValue
				Val(21) = Detalle_forma_de_Pago_CAE.DIRPROC.CurrentValue
				Val(22) = Detalle_forma_de_Pago_CAE.CIUPROC.CurrentValue
				Val(23) = Detalle_forma_de_Pago_CAE.COMUNAPRO.CurrentValue
				Val(24) = Detalle_forma_de_Pago_CAE.FONOPROC.CurrentValue
				Val(25) = Detalle_forma_de_Pago_CAE.FONOACT.CurrentValue
				Val(26) = Detalle_forma_de_Pago_CAE.USUARIO.CurrentValue
				Val(27) = Detalle_forma_de_Pago_CAE.CODAPOD.CurrentValue
				Val(28) = Detalle_forma_de_Pago_CAE.TIPOSITU.CurrentValue
				Val(29) = Detalle_forma_de_Pago_CAE.DESCRIPCION.CurrentValue
			Else				
				Detalle_forma_de_Pago_CAE.numero_pagare.DbValue = ""
				Detalle_forma_de_Pago_CAE.RUT_Alumno.DbValue = ""
				Detalle_forma_de_Pago_CAE.CODCARR.DbValue = ""
				Detalle_forma_de_Pago_CAE.Carrera.DbValue = ""
				Detalle_forma_de_Pago_CAE.CodDoc.DbValue = ""
				Detalle_forma_de_Pago_CAE.Documento.DbValue = ""
				Detalle_forma_de_Pago_CAE.ANO.DbValue = ""
				Detalle_forma_de_Pago_CAE.PERIODO.DbValue = ""
				Detalle_forma_de_Pago_CAE.CUOTA.DbValue = ""
				Detalle_forma_de_Pago_CAE.NumCuotas.DbValue = ""
				Detalle_forma_de_Pago_CAE.MONTO.DbValue = ""
				Detalle_forma_de_Pago_CAE.SALDO.DbValue = ""
				Detalle_forma_de_Pago_CAE.FECVEN.DbValue = ""
				Detalle_forma_de_Pago_CAE.PATERNO.DbValue = ""
				Detalle_forma_de_Pago_CAE.MATERNO.DbValue = ""
				Detalle_forma_de_Pago_CAE.Nombre_alumno.DbValue = ""
				Detalle_forma_de_Pago_CAE.MAIL.DbValue = ""
				Detalle_forma_de_Pago_CAE.DIRPROC.DbValue = ""
				Detalle_forma_de_Pago_CAE.CIUPROC.DbValue = ""
				Detalle_forma_de_Pago_CAE.COMUNAPRO.DbValue = ""
				Detalle_forma_de_Pago_CAE.FONOPROC.DbValue = ""
				Detalle_forma_de_Pago_CAE.FONOACT.DbValue = ""
				Detalle_forma_de_Pago_CAE.Facultad.DbValue = ""
				Detalle_forma_de_Pago_CAE.USUARIO.DbValue = ""
				Detalle_forma_de_Pago_CAE.CODAPOD.DbValue = ""
				Detalle_forma_de_Pago_CAE.FECDEUDA.DbValue = ""
				Detalle_forma_de_Pago_CAE.ESTACAD.DbValue = ""
				Detalle_forma_de_Pago_CAE.TIPOSITU.DbValue = ""
				Detalle_forma_de_Pago_CAE.DESCRIPCION.DbValue = ""
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
				Detalle_forma_de_Pago_CAE.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Detalle_forma_de_Pago_CAE.StartGroup = StartGrp
				Else
					StartGrp = Detalle_forma_de_Pago_CAE.StartGroup
				End If
			Else
				StartGrp = Detalle_forma_de_Pago_CAE.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Detalle_forma_de_Pago_CAE.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Detalle_forma_de_Pago_CAE.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Detalle_forma_de_Pago_CAE.StartGroup = StartGrp
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
			Detalle_forma_de_Pago_CAE.StartGroup = StartGrp
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
				Detalle_forma_de_Pago_CAE.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Detalle_forma_de_Pago_CAE.StartGroup = StartGrp
			Else				
				If (Detalle_forma_de_Pago_CAE.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Detalle_forma_de_Pago_CAE.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Detalle_forma_de_Pago_CAE.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Detalle_forma_de_Pago_CAE.SqlSelectCount, Detalle_forma_de_Pago_CAE.SqlWhere, Detalle_forma_de_Pago_CAE.SqlGroupBy, Detalle_forma_de_Pago_CAE.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Detalle_forma_de_Pago_CAE.Row_Rendering()

			'
			' Render view codes
			'

			If (Detalle_forma_de_Pago_CAE.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' PATERNO
				Detalle_forma_de_Pago_CAE.PATERNO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.PATERNO.Summary)

				' MATERNO
				Detalle_forma_de_Pago_CAE.MATERNO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.MATERNO.Summary)

				' Nombre_alumno
				Detalle_forma_de_Pago_CAE.Nombre_alumno.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.Nombre_alumno.Summary)

				' RUT_Alumno
				Detalle_forma_de_Pago_CAE.RUT_Alumno.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.RUT_Alumno.Summary)

				' CODCARR
				Detalle_forma_de_Pago_CAE.CODCARR.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CODCARR.Summary)

				' Carrera
				Detalle_forma_de_Pago_CAE.Carrera.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.Carrera.Summary)

				' Facultad
				Detalle_forma_de_Pago_CAE.Facultad.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.Facultad.Summary)

				' ANO
				Detalle_forma_de_Pago_CAE.ANO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.ANO.Summary)

				' PERIODO
				Detalle_forma_de_Pago_CAE.PERIODO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.PERIODO.Summary)

				' numero_pagare
				Detalle_forma_de_Pago_CAE.numero_pagare.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.numero_pagare.Summary)

				' CodDoc
				Detalle_forma_de_Pago_CAE.CodDoc.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CodDoc.Summary)

				' Documento
				Detalle_forma_de_Pago_CAE.Documento.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.Documento.Summary)

				' CUOTA
				Detalle_forma_de_Pago_CAE.CUOTA.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CUOTA.Summary)

				' NumCuotas
				Detalle_forma_de_Pago_CAE.NumCuotas.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.NumCuotas.Summary)

				' MONTO
				Detalle_forma_de_Pago_CAE.MONTO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.MONTO.Summary)

				' SALDO
				Detalle_forma_de_Pago_CAE.SALDO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.SALDO.Summary)

				' FECVEN
				Detalle_forma_de_Pago_CAE.FECVEN.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.FECVEN.Summary)
				Detalle_forma_de_Pago_CAE.FECVEN.ViewValue = ew_FormatDateTime(Detalle_forma_de_Pago_CAE.FECVEN.ViewValue, 7)

				' FECDEUDA
				Detalle_forma_de_Pago_CAE.FECDEUDA.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.FECDEUDA.Summary)
				Detalle_forma_de_Pago_CAE.FECDEUDA.ViewValue = ew_FormatDateTime(Detalle_forma_de_Pago_CAE.FECDEUDA.ViewValue, 7)

				' ESTACAD
				Detalle_forma_de_Pago_CAE.ESTACAD.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.ESTACAD.Summary)

				' MAIL
				Detalle_forma_de_Pago_CAE.MAIL.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.MAIL.Summary)

				' DIRPROC
				Detalle_forma_de_Pago_CAE.DIRPROC.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.DIRPROC.Summary)

				' CIUPROC
				Detalle_forma_de_Pago_CAE.CIUPROC.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CIUPROC.Summary)

				' COMUNAPRO
				Detalle_forma_de_Pago_CAE.COMUNAPRO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.COMUNAPRO.Summary)

				' FONOPROC
				Detalle_forma_de_Pago_CAE.FONOPROC.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.FONOPROC.Summary)

				' FONOACT
				Detalle_forma_de_Pago_CAE.FONOACT.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.FONOACT.Summary)

				' USUARIO
				Detalle_forma_de_Pago_CAE.USUARIO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.USUARIO.Summary)

				' CODAPOD
				Detalle_forma_de_Pago_CAE.CODAPOD.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CODAPOD.Summary)

				' TIPOSITU
				Detalle_forma_de_Pago_CAE.TIPOSITU.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.TIPOSITU.Summary)

				' DESCRIPCION
				Detalle_forma_de_Pago_CAE.DESCRIPCION.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.DESCRIPCION.Summary)
			Else

				' PATERNO
				Detalle_forma_de_Pago_CAE.PATERNO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.PATERNO.CurrentValue)
				Detalle_forma_de_Pago_CAE.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Detalle_forma_de_Pago_CAE.MATERNO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.MATERNO.CurrentValue)
				Detalle_forma_de_Pago_CAE.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Nombre_alumno
				Detalle_forma_de_Pago_CAE.Nombre_alumno.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.Nombre_alumno.CurrentValue)
				Detalle_forma_de_Pago_CAE.Nombre_alumno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT_Alumno
				Detalle_forma_de_Pago_CAE.RUT_Alumno.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.RUT_Alumno.CurrentValue)
				Detalle_forma_de_Pago_CAE.RUT_Alumno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Detalle_forma_de_Pago_CAE.CODCARR.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CODCARR.CurrentValue)
				Detalle_forma_de_Pago_CAE.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Carrera
				Detalle_forma_de_Pago_CAE.Carrera.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.Carrera.CurrentValue)
				Detalle_forma_de_Pago_CAE.Carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Facultad
				Detalle_forma_de_Pago_CAE.Facultad.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.Facultad.CurrentValue)
				Detalle_forma_de_Pago_CAE.Facultad.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				Detalle_forma_de_Pago_CAE.ANO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.ANO.CurrentValue)
				Detalle_forma_de_Pago_CAE.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO
				Detalle_forma_de_Pago_CAE.PERIODO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.PERIODO.CurrentValue)
				Detalle_forma_de_Pago_CAE.PERIODO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' numero_pagare
				Detalle_forma_de_Pago_CAE.numero_pagare.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.numero_pagare.CurrentValue)
				Detalle_forma_de_Pago_CAE.numero_pagare.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CodDoc
				Detalle_forma_de_Pago_CAE.CodDoc.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CodDoc.CurrentValue)
				Detalle_forma_de_Pago_CAE.CodDoc.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Documento
				Detalle_forma_de_Pago_CAE.Documento.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.Documento.CurrentValue)
				Detalle_forma_de_Pago_CAE.Documento.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CUOTA
				Detalle_forma_de_Pago_CAE.CUOTA.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CUOTA.CurrentValue)
				Detalle_forma_de_Pago_CAE.CUOTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NumCuotas
				Detalle_forma_de_Pago_CAE.NumCuotas.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.NumCuotas.CurrentValue)
				Detalle_forma_de_Pago_CAE.NumCuotas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MONTO
				Detalle_forma_de_Pago_CAE.MONTO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.MONTO.CurrentValue)
				Detalle_forma_de_Pago_CAE.MONTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SALDO
				Detalle_forma_de_Pago_CAE.SALDO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.SALDO.CurrentValue)
				Detalle_forma_de_Pago_CAE.SALDO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECVEN
				Detalle_forma_de_Pago_CAE.FECVEN.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.FECVEN.CurrentValue)
				Detalle_forma_de_Pago_CAE.FECVEN.ViewValue = ew_FormatDateTime(Detalle_forma_de_Pago_CAE.FECVEN.ViewValue, 7)
				Detalle_forma_de_Pago_CAE.FECVEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECDEUDA
				Detalle_forma_de_Pago_CAE.FECDEUDA.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.FECDEUDA.CurrentValue)
				Detalle_forma_de_Pago_CAE.FECDEUDA.ViewValue = ew_FormatDateTime(Detalle_forma_de_Pago_CAE.FECDEUDA.ViewValue, 7)
				Detalle_forma_de_Pago_CAE.FECDEUDA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTACAD
				Detalle_forma_de_Pago_CAE.ESTACAD.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.ESTACAD.CurrentValue)
				Detalle_forma_de_Pago_CAE.ESTACAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MAIL
				Detalle_forma_de_Pago_CAE.MAIL.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.MAIL.CurrentValue)
				Detalle_forma_de_Pago_CAE.MAIL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIRPROC
				Detalle_forma_de_Pago_CAE.DIRPROC.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.DIRPROC.CurrentValue)
				Detalle_forma_de_Pago_CAE.DIRPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CIUPROC
				Detalle_forma_de_Pago_CAE.CIUPROC.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CIUPROC.CurrentValue)
				Detalle_forma_de_Pago_CAE.CIUPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' COMUNAPRO
				Detalle_forma_de_Pago_CAE.COMUNAPRO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.COMUNAPRO.CurrentValue)
				Detalle_forma_de_Pago_CAE.COMUNAPRO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOPROC
				Detalle_forma_de_Pago_CAE.FONOPROC.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.FONOPROC.CurrentValue)
				Detalle_forma_de_Pago_CAE.FONOPROC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FONOACT
				Detalle_forma_de_Pago_CAE.FONOACT.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.FONOACT.CurrentValue)
				Detalle_forma_de_Pago_CAE.FONOACT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' USUARIO
				Detalle_forma_de_Pago_CAE.USUARIO.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.USUARIO.CurrentValue)
				Detalle_forma_de_Pago_CAE.USUARIO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODAPOD
				Detalle_forma_de_Pago_CAE.CODAPOD.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.CODAPOD.CurrentValue)
				Detalle_forma_de_Pago_CAE.CODAPOD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIPOSITU
				Detalle_forma_de_Pago_CAE.TIPOSITU.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.TIPOSITU.CurrentValue)
				Detalle_forma_de_Pago_CAE.TIPOSITU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DESCRIPCION
				Detalle_forma_de_Pago_CAE.DESCRIPCION.ViewValue = Convert.ToString(Detalle_forma_de_Pago_CAE.DESCRIPCION.CurrentValue)
				Detalle_forma_de_Pago_CAE.DESCRIPCION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' PATERNO
			Detalle_forma_de_Pago_CAE.PATERNO.HrefValue = ""

			' MATERNO
			Detalle_forma_de_Pago_CAE.MATERNO.HrefValue = ""

			' Nombre_alumno
			Detalle_forma_de_Pago_CAE.Nombre_alumno.HrefValue = ""

			' RUT_Alumno
			Detalle_forma_de_Pago_CAE.RUT_Alumno.HrefValue = ""

			' CODCARR
			Detalle_forma_de_Pago_CAE.CODCARR.HrefValue = ""

			' Carrera
			Detalle_forma_de_Pago_CAE.Carrera.HrefValue = ""

			' Facultad
			Detalle_forma_de_Pago_CAE.Facultad.HrefValue = ""

			' ANO
			Detalle_forma_de_Pago_CAE.ANO.HrefValue = ""

			' PERIODO
			Detalle_forma_de_Pago_CAE.PERIODO.HrefValue = ""

			' numero_pagare
			Detalle_forma_de_Pago_CAE.numero_pagare.HrefValue = ""

			' CodDoc
			Detalle_forma_de_Pago_CAE.CodDoc.HrefValue = ""

			' Documento
			Detalle_forma_de_Pago_CAE.Documento.HrefValue = ""

			' CUOTA
			Detalle_forma_de_Pago_CAE.CUOTA.HrefValue = ""

			' NumCuotas
			Detalle_forma_de_Pago_CAE.NumCuotas.HrefValue = ""

			' MONTO
			Detalle_forma_de_Pago_CAE.MONTO.HrefValue = ""

			' SALDO
			Detalle_forma_de_Pago_CAE.SALDO.HrefValue = ""

			' FECVEN
			Detalle_forma_de_Pago_CAE.FECVEN.HrefValue = ""

			' FECDEUDA
			Detalle_forma_de_Pago_CAE.FECDEUDA.HrefValue = ""

			' ESTACAD
			Detalle_forma_de_Pago_CAE.ESTACAD.HrefValue = ""

			' MAIL
			Detalle_forma_de_Pago_CAE.MAIL.HrefValue = ""

			' DIRPROC
			Detalle_forma_de_Pago_CAE.DIRPROC.HrefValue = ""

			' CIUPROC
			Detalle_forma_de_Pago_CAE.CIUPROC.HrefValue = ""

			' COMUNAPRO
			Detalle_forma_de_Pago_CAE.COMUNAPRO.HrefValue = ""

			' FONOPROC
			Detalle_forma_de_Pago_CAE.FONOPROC.HrefValue = ""

			' FONOACT
			Detalle_forma_de_Pago_CAE.FONOACT.HrefValue = ""

			' USUARIO
			Detalle_forma_de_Pago_CAE.USUARIO.HrefValue = ""

			' CODAPOD
			Detalle_forma_de_Pago_CAE.CODAPOD.HrefValue = ""

			' TIPOSITU
			Detalle_forma_de_Pago_CAE.TIPOSITU.HrefValue = ""

			' DESCRIPCION
			Detalle_forma_de_Pago_CAE.DESCRIPCION.HrefValue = ""

			' Call Row_Rendered event
			Detalle_forma_de_Pago_CAE.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [Carrera] FROM " + Detalle_forma_de_Pago_CAE.SqlFrom
			sOrderBy = "[Carrera] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_forma_de_Pago_CAE.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_forma_de_Pago_CAE.Carrera.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Facultad
			sSelect = "SELECT DISTINCT [Facultad] FROM " + Detalle_forma_de_Pago_CAE.SqlFrom
			sOrderBy = "[Facultad] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_forma_de_Pago_CAE.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_forma_de_Pago_CAE.Facultad.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO
			sSelect = "SELECT DISTINCT [ANO] FROM " + Detalle_forma_de_Pago_CAE.SqlFrom
			sOrderBy = "[ANO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_forma_de_Pago_CAE.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_forma_de_Pago_CAE.ANO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PERIODO
			sSelect = "SELECT DISTINCT [PERIODO] FROM " + Detalle_forma_de_Pago_CAE.SqlFrom
			sOrderBy = "[PERIODO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_forma_de_Pago_CAE.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_forma_de_Pago_CAE.PERIODO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field USUARIO
			sSelect = "SELECT DISTINCT [USUARIO] FROM " + Detalle_forma_de_Pago_CAE.SqlFrom
			sOrderBy = "[USUARIO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Detalle_forma_de_Pago_CAE.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Detalle_forma_de_Pago_CAE.USUARIO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(Detalle_forma_de_Pago_CAE.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Detalle_forma_de_Pago_CAE.MATERNO)

				' Field Nombre_alumno
				SetSessionFilterValues(Detalle_forma_de_Pago_CAE.Nombre_alumno)

				' Field RUT_Alumno
				SetSessionFilterValues(Detalle_forma_de_Pago_CAE.RUT_Alumno)

				' Field Carrera
				SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.Carrera.DropDownValue, Detalle_forma_de_Pago_CAE.Carrera)

				' Field Facultad
				SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.Facultad.DropDownValue, Detalle_forma_de_Pago_CAE.Facultad)

				' Field ANO
				SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.ANO.DropDownValue, Detalle_forma_de_Pago_CAE.ANO)

				' Field PERIODO
				SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.PERIODO.DropDownValue, Detalle_forma_de_Pago_CAE.PERIODO)

				' Field numero_pagare
				SetSessionFilterValues(Detalle_forma_de_Pago_CAE.numero_pagare)

				' Field CodDoc
				SetSessionFilterValues(Detalle_forma_de_Pago_CAE.CodDoc)

				' Field Documento
				SetSessionFilterValues(Detalle_forma_de_Pago_CAE.Documento)

				' Field FECVEN
				SetSessionFilterValues(Detalle_forma_de_Pago_CAE.FECVEN)

				' Field FECDEUDA
				SetSessionFilterValues(Detalle_forma_de_Pago_CAE.FECDEUDA)

				' Field USUARIO
				SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.USUARIO.DropDownValue, Detalle_forma_de_Pago_CAE.USUARIO)
			bSetupFilter = True ' Set up filter required
		Else

				' Field PATERNO
				If (GetFilterValues(Detalle_forma_de_Pago_CAE.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Detalle_forma_de_Pago_CAE.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Nombre_alumno
				If (GetFilterValues(Detalle_forma_de_Pago_CAE.Nombre_alumno)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field RUT_Alumno
				If (GetFilterValues(Detalle_forma_de_Pago_CAE.RUT_Alumno)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Carrera
				If (GetDropDownValue(Detalle_forma_de_Pago_CAE.Carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_forma_de_Pago_CAE.Carrera.DropDownValue) Then
					If Not ew_SameStr(Detalle_forma_de_Pago_CAE.Carrera.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_forma_de_Pago_CAE_Carrera") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Facultad
				If (GetDropDownValue(Detalle_forma_de_Pago_CAE.Facultad)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_forma_de_Pago_CAE.Facultad.DropDownValue) Then
					If Not ew_SameStr(Detalle_forma_de_Pago_CAE.Facultad.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_forma_de_Pago_CAE_Facultad") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO
				If (GetDropDownValue(Detalle_forma_de_Pago_CAE.ANO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_forma_de_Pago_CAE.ANO.DropDownValue) Then
					If Not ew_SameStr(Detalle_forma_de_Pago_CAE.ANO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_forma_de_Pago_CAE_ANO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PERIODO
				If (GetDropDownValue(Detalle_forma_de_Pago_CAE.PERIODO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_forma_de_Pago_CAE.PERIODO.DropDownValue) Then
					If Not ew_SameStr(Detalle_forma_de_Pago_CAE.PERIODO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_forma_de_Pago_CAE_PERIODO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field numero_pagare
				If (GetFilterValues(Detalle_forma_de_Pago_CAE.numero_pagare)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field CodDoc
				If (GetFilterValues(Detalle_forma_de_Pago_CAE.CodDoc)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Documento
				If (GetFilterValues(Detalle_forma_de_Pago_CAE.Documento)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field FECVEN
				If (GetFilterValues(Detalle_forma_de_Pago_CAE.FECVEN)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field FECDEUDA
				If (GetFilterValues(Detalle_forma_de_Pago_CAE.FECDEUDA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field USUARIO
				If (GetDropDownValue(Detalle_forma_de_Pago_CAE.USUARIO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Detalle_forma_de_Pago_CAE.USUARIO.DropDownValue) Then
					If Not ew_SameStr(Detalle_forma_de_Pago_CAE.USUARIO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Detalle_forma_de_Pago_CAE_USUARIO") Is Nothing Then
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

			' Field PATERNO
			GetSessionFilterValues(Detalle_forma_de_Pago_CAE.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Detalle_forma_de_Pago_CAE.MATERNO)

			' Field Nombre_alumno
			GetSessionFilterValues(Detalle_forma_de_Pago_CAE.Nombre_alumno)

			' Field RUT_Alumno
			GetSessionFilterValues(Detalle_forma_de_Pago_CAE.RUT_Alumno)

			' Field Carrera
			GetSessionDropDownValue(Detalle_forma_de_Pago_CAE.Carrera)

			' Field Facultad
			GetSessionDropDownValue(Detalle_forma_de_Pago_CAE.Facultad)

			' Field ANO
			GetSessionDropDownValue(Detalle_forma_de_Pago_CAE.ANO)

			' Field PERIODO
			GetSessionDropDownValue(Detalle_forma_de_Pago_CAE.PERIODO)

			' Field numero_pagare
			GetSessionFilterValues(Detalle_forma_de_Pago_CAE.numero_pagare)

			' Field CodDoc
			GetSessionFilterValues(Detalle_forma_de_Pago_CAE.CodDoc)

			' Field Documento
			GetSessionFilterValues(Detalle_forma_de_Pago_CAE.Documento)

			' Field FECVEN
			GetSessionFilterValues(Detalle_forma_de_Pago_CAE.FECVEN)

			' Field FECDEUDA
			GetSessionFilterValues(Detalle_forma_de_Pago_CAE.FECDEUDA)

			' Field USUARIO
			GetSessionDropDownValue(Detalle_forma_de_Pago_CAE.USUARIO)
		End If

		' Call page filter validated event
		Detalle_forma_de_Pago_CAE.Page_FilterValidated()

		' Build SQL
		' Field PATERNO

		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.MATERNO, sFilter)

		' Field Nombre_alumno
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.Nombre_alumno, sFilter)

		' Field RUT_Alumno
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.RUT_Alumno, sFilter)

		' Field Carrera
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.Carrera, sFilter, "")

		' Field Facultad
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.Facultad, sFilter, "")

		' Field ANO
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.ANO, sFilter, "")

		' Field PERIODO
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.PERIODO, sFilter, "")

		' Field numero_pagare
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.numero_pagare, sFilter)

		' Field CodDoc
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.CodDoc, sFilter)

		' Field Documento
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.Documento, sFilter)

		' Field FECVEN
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.FECVEN, sFilter)

		' Field FECDEUDA
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.FECDEUDA, sFilter)

		' Field USUARIO
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.USUARIO, sFilter, "")

		' Save parms to Session
		' Field PATERNO

		SetSessionFilterValues(Detalle_forma_de_Pago_CAE.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Detalle_forma_de_Pago_CAE.MATERNO)

		' Field Nombre_alumno
		SetSessionFilterValues(Detalle_forma_de_Pago_CAE.Nombre_alumno)

		' Field RUT_Alumno
		SetSessionFilterValues(Detalle_forma_de_Pago_CAE.RUT_Alumno)

		' Field Carrera
		SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.Carrera.DropDownValue, Detalle_forma_de_Pago_CAE.Carrera)

		' Field Facultad
		SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.Facultad.DropDownValue, Detalle_forma_de_Pago_CAE.Facultad)

		' Field ANO
		SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.ANO.DropDownValue, Detalle_forma_de_Pago_CAE.ANO)

		' Field PERIODO
		SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.PERIODO.DropDownValue, Detalle_forma_de_Pago_CAE.PERIODO)

		' Field numero_pagare
		SetSessionFilterValues(Detalle_forma_de_Pago_CAE.numero_pagare)

		' Field CodDoc
		SetSessionFilterValues(Detalle_forma_de_Pago_CAE.CodDoc)

		' Field Documento
		SetSessionFilterValues(Detalle_forma_de_Pago_CAE.Documento)

		' Field FECVEN
		SetSessionFilterValues(Detalle_forma_de_Pago_CAE.FECVEN)

		' Field FECDEUDA
		SetSessionFilterValues(Detalle_forma_de_Pago_CAE.FECDEUDA)

		' Field USUARIO
		SetSessionDropDownValue(Detalle_forma_de_Pago_CAE.USUARIO.DropDownValue, Detalle_forma_de_Pago_CAE.USUARIO)

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
		If ew_Session("sv_Detalle_forma_de_Pago_CAE_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Detalle_forma_de_Pago_CAE_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Detalle_forma_de_Pago_CAE_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Detalle_forma_de_Pago_CAE_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Detalle_forma_de_Pago_CAE_" + parm)
		End If
		If ew_Session("so1_Detalle_forma_de_Pago_CAE_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Detalle_forma_de_Pago_CAE_" + parm))
		End If
		If ew_Session("sc_Detalle_forma_de_Pago_CAE_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Detalle_forma_de_Pago_CAE_" + parm))
		End If
		If ew_Session("sv2_Detalle_forma_de_Pago_CAE_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Detalle_forma_de_Pago_CAE_" + parm)
		End If
		If ew_Session("so2_Detalle_forma_de_Pago_CAE_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Detalle_forma_de_Pago_CAE_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Detalle_forma_de_Pago_CAE_" + parm) = fld.SearchValue
		ew_Session("so1_Detalle_forma_de_Pago_CAE_" + parm) = fld.SearchOperator
		ew_Session("sc_Detalle_forma_de_Pago_CAE_" + parm) = fld.SearchCondition
		ew_Session("sv2_Detalle_forma_de_Pago_CAE_" + parm) = fld.SearchValue2
		ew_Session("so2_Detalle_forma_de_Pago_CAE_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Detalle_forma_de_Pago_CAE_" + parm) = ""
		ew_Session("so1_Detalle_forma_de_Pago_CAE_" + parm) = "="
		ew_Session("sc_Detalle_forma_de_Pago_CAE_" + parm) = "AND"
		ew_Session("sv2_Detalle_forma_de_Pago_CAE_" + parm) = ""
		ew_Session("so2_Detalle_forma_de_Pago_CAE_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(Detalle_forma_de_Pago_CAE.numero_pagare.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Detalle_forma_de_Pago_CAE.numero_pagare.FldErrMsg()
		End If
		If Not ewrpt_CheckNumber(Convert.ToString(Detalle_forma_de_Pago_CAE.CodDoc.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Detalle_forma_de_Pago_CAE.CodDoc.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Detalle_forma_de_Pago_CAE.FECVEN.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Detalle_forma_de_Pago_CAE.FECVEN.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Detalle_forma_de_Pago_CAE.FECVEN.SearchValue2)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Detalle_forma_de_Pago_CAE.FECVEN.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Detalle_forma_de_Pago_CAE.FECDEUDA.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Detalle_forma_de_Pago_CAE.FECDEUDA.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Detalle_forma_de_Pago_CAE.FECDEUDA.SearchValue2)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Detalle_forma_de_Pago_CAE.FECDEUDA.FldErrMsg()
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
		ew_Session("sel_Detalle_forma_de_Pago_CAE_" & parm) = ""
		ew_Session("rf_Detalle_forma_de_Pago_CAE_" & parm) = ""
		ew_Session("rt_Detalle_forma_de_Pago_CAE_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Detalle_forma_de_Pago_CAE.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Detalle_forma_de_Pago_CAE_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Detalle_forma_de_Pago_CAE_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Detalle_forma_de_Pago_CAE_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field Carrera

			Detalle_forma_de_Pago_CAE.Carrera.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_forma_de_Pago_CAE.Carrera.DropDownValue = Detalle_forma_de_Pago_CAE.Carrera.DefaultDropDownValue

			' Field Facultad
			Detalle_forma_de_Pago_CAE.Facultad.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_forma_de_Pago_CAE.Facultad.DropDownValue = Detalle_forma_de_Pago_CAE.Facultad.DefaultDropDownValue

			' Field ANO
			Detalle_forma_de_Pago_CAE.ANO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_forma_de_Pago_CAE.ANO.DropDownValue = Detalle_forma_de_Pago_CAE.ANO.DefaultDropDownValue

			' Field PERIODO
			Detalle_forma_de_Pago_CAE.PERIODO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_forma_de_Pago_CAE.PERIODO.DropDownValue = Detalle_forma_de_Pago_CAE.PERIODO.DefaultDropDownValue

			' Field USUARIO
			Detalle_forma_de_Pago_CAE.USUARIO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Detalle_forma_de_Pago_CAE.USUARIO.DropDownValue = Detalle_forma_de_Pago_CAE.USUARIO.DefaultDropDownValue

		' Set up default values for extended filters
			' Field PATERNO

			SetDefaultExtFilter(Detalle_forma_de_Pago_CAE.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_forma_de_Pago_CAE.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Detalle_forma_de_Pago_CAE.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_forma_de_Pago_CAE.MATERNO)	

			' Field Nombre_alumno
			SetDefaultExtFilter(Detalle_forma_de_Pago_CAE.Nombre_alumno, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_forma_de_Pago_CAE.Nombre_alumno)	

			' Field RUT_Alumno
			SetDefaultExtFilter(Detalle_forma_de_Pago_CAE.RUT_Alumno, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_forma_de_Pago_CAE.RUT_Alumno)	

			' Field numero_pagare
			SetDefaultExtFilter(Detalle_forma_de_Pago_CAE.numero_pagare, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_forma_de_Pago_CAE.numero_pagare)	

			' Field CodDoc
			SetDefaultExtFilter(Detalle_forma_de_Pago_CAE.CodDoc, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_forma_de_Pago_CAE.CodDoc)	

			' Field Documento
			SetDefaultExtFilter(Detalle_forma_de_Pago_CAE.Documento, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_forma_de_Pago_CAE.Documento)	

			' Field FECVEN
			SetDefaultExtFilter(Detalle_forma_de_Pago_CAE.FECVEN, "BETWEEN", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_forma_de_Pago_CAE.FECVEN)	

			' Field FECDEUDA
			SetDefaultExtFilter(Detalle_forma_de_Pago_CAE.FECDEUDA, "BETWEEN", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Detalle_forma_de_Pago_CAE.FECDEUDA)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check PATERNO extended filter
		If (TextFilterApplied(Detalle_forma_de_Pago_CAE.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Detalle_forma_de_Pago_CAE.MATERNO)) Then bFilterExist = True

		' Check Nombre_alumno extended filter
		If (TextFilterApplied(Detalle_forma_de_Pago_CAE.Nombre_alumno)) Then bFilterExist = True

		' Check RUT_Alumno extended filter
		If (TextFilterApplied(Detalle_forma_de_Pago_CAE.RUT_Alumno)) Then bFilterExist = True

		' Check Carrera dropdown filter
		If (NonTextFilterApplied(Detalle_forma_de_Pago_CAE.Carrera)) Then bFilterExist = True

		' Check Facultad dropdown filter
		If (NonTextFilterApplied(Detalle_forma_de_Pago_CAE.Facultad)) Then bFilterExist = True

		' Check ANO dropdown filter
		If (NonTextFilterApplied(Detalle_forma_de_Pago_CAE.ANO)) Then bFilterExist = True

		' Check PERIODO dropdown filter
		If (NonTextFilterApplied(Detalle_forma_de_Pago_CAE.PERIODO)) Then bFilterExist = True

		' Check numero_pagare extended filter
		If (TextFilterApplied(Detalle_forma_de_Pago_CAE.numero_pagare)) Then bFilterExist = True

		' Check CodDoc extended filter
		If (TextFilterApplied(Detalle_forma_de_Pago_CAE.CodDoc)) Then bFilterExist = True

		' Check Documento extended filter
		If (TextFilterApplied(Detalle_forma_de_Pago_CAE.Documento)) Then bFilterExist = True

		' Check FECVEN extended filter
		If (TextFilterApplied(Detalle_forma_de_Pago_CAE.FECVEN)) Then bFilterExist = True

		' Check FECDEUDA extended filter
		If (TextFilterApplied(Detalle_forma_de_Pago_CAE.FECDEUDA)) Then bFilterExist = True

		' Check USUARIO dropdown filter
		If (NonTextFilterApplied(Detalle_forma_de_Pago_CAE.USUARIO)) Then bFilterExist = True
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
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Nombre_alumno
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.Nombre_alumno, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.Nombre_alumno.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUT_Alumno
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.RUT_Alumno, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.RUT_Alumno.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Carrera
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.Carrera, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.Carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Facultad
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.Facultad, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.Facultad.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.ANO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.ANO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.PERIODO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.PERIODO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field numero_pagare
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.numero_pagare, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.numero_pagare.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CodDoc
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.CodDoc, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.CodDoc.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Documento
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.Documento, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.Documento.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECVEN
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.FECVEN, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.FECVEN.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECDEUDA
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Detalle_forma_de_Pago_CAE.FECDEUDA, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.FECDEUDA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field USUARIO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Detalle_forma_de_Pago_CAE.USUARIO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Detalle_forma_de_Pago_CAE.USUARIO.FldCaption() & "<br>"
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
				Detalle_forma_de_Pago_CAE.OrderBy = ""
				Detalle_forma_de_Pago_CAE.StartGroup = 1
				Detalle_forma_de_Pago_CAE.PATERNO.Sort = ""
				Detalle_forma_de_Pago_CAE.MATERNO.Sort = ""
				Detalle_forma_de_Pago_CAE.Nombre_alumno.Sort = ""
				Detalle_forma_de_Pago_CAE.RUT_Alumno.Sort = ""
				Detalle_forma_de_Pago_CAE.CODCARR.Sort = ""
				Detalle_forma_de_Pago_CAE.Carrera.Sort = ""
				Detalle_forma_de_Pago_CAE.Facultad.Sort = ""
				Detalle_forma_de_Pago_CAE.ANO.Sort = ""
				Detalle_forma_de_Pago_CAE.PERIODO.Sort = ""
				Detalle_forma_de_Pago_CAE.numero_pagare.Sort = ""
				Detalle_forma_de_Pago_CAE.CodDoc.Sort = ""
				Detalle_forma_de_Pago_CAE.Documento.Sort = ""
				Detalle_forma_de_Pago_CAE.CUOTA.Sort = ""
				Detalle_forma_de_Pago_CAE.NumCuotas.Sort = ""
				Detalle_forma_de_Pago_CAE.MONTO.Sort = ""
				Detalle_forma_de_Pago_CAE.SALDO.Sort = ""
				Detalle_forma_de_Pago_CAE.FECVEN.Sort = ""
				Detalle_forma_de_Pago_CAE.FECDEUDA.Sort = ""
				Detalle_forma_de_Pago_CAE.ESTACAD.Sort = ""
				Detalle_forma_de_Pago_CAE.MAIL.Sort = ""
				Detalle_forma_de_Pago_CAE.DIRPROC.Sort = ""
				Detalle_forma_de_Pago_CAE.CIUPROC.Sort = ""
				Detalle_forma_de_Pago_CAE.COMUNAPRO.Sort = ""
				Detalle_forma_de_Pago_CAE.FONOPROC.Sort = ""
				Detalle_forma_de_Pago_CAE.FONOACT.Sort = ""
				Detalle_forma_de_Pago_CAE.USUARIO.Sort = ""
				Detalle_forma_de_Pago_CAE.CODAPOD.Sort = ""
				Detalle_forma_de_Pago_CAE.TIPOSITU.Sort = ""
				Detalle_forma_de_Pago_CAE.DESCRIPCION.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Detalle_forma_de_Pago_CAE.CurrentOrder = ew_Get("order")
			Detalle_forma_de_Pago_CAE.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Detalle_forma_de_Pago_CAE.SortSql()
			Detalle_forma_de_Pago_CAE.OrderBy = sSortSql
			Detalle_forma_de_Pago_CAE.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Detalle_forma_de_Pago_CAE.OrderBy)) Then
			Detalle_forma_de_Pago_CAE.OrderBy = "[PATERNO] ASC, [MATERNO] ASC, [Nombre_alumno] ASC"
			Detalle_forma_de_Pago_CAE.PATERNO.Sort = "ASC"
			Detalle_forma_de_Pago_CAE.MATERNO.Sort = "ASC"
			Detalle_forma_de_Pago_CAE.Nombre_alumno.Sort = "ASC"
		End If
		Return Detalle_forma_de_Pago_CAE.OrderBy
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
		Detalle_forma_de_Pago_CAE_summary = New crDetalle_forma_de_Pago_CAE_summary(Me)
		Detalle_forma_de_Pago_CAE_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Detalle_forma_de_Pago_CAE_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Detalle_forma_de_Pago_CAE_summary IsNot Nothing) Then Detalle_forma_de_Pago_CAE_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Detalle_forma_de_Pago_CAE_summary = new ewrpt_Page("Detalle_forma_de_Pago_CAE_summary");
// page properties
Detalle_forma_de_Pago_CAE_summary.PageID = "summary"; // page ID
Detalle_forma_de_Pago_CAE_summary.FormID = "fDetalle_forma_de_Pago_CAEsummaryfilter"; // form ID
var EWRPT_PAGE_ID = Detalle_forma_de_Pago_CAE_summary.PageID;
// extend page with ValidateForm function
Detalle_forma_de_Pago_CAE_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_numero_pagare;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Detalle_forma_de_Pago_CAE.numero_pagare.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_CodDoc;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Detalle_forma_de_Pago_CAE.CodDoc.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_FECVEN;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Detalle_forma_de_Pago_CAE.FECVEN.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv2_FECVEN;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Detalle_forma_de_Pago_CAE.FECVEN.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_FECDEUDA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Detalle_forma_de_Pago_CAE.FECDEUDA.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv2_FECDEUDA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Detalle_forma_de_Pago_CAE.FECDEUDA.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Detalle_forma_de_Pago_CAE_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Detalle_forma_de_Pago_CAE_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Detalle_forma_de_Pago_CAE_summary.ValidateRequired = false; // no JavaScript validation
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
<% Detalle_forma_de_Pago_CAE_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Detalle_forma_de_Pago_CAE.TableCaption() %></h1></div>
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Detalle_forma_de_Pago_CAE_summary.ExportExcelUrl %>"><img src="images/excel.png" title="Exportar a Excel" border="0" alt="Exportar a Excel" /></a>
<% If (Detalle_forma_de_Pago_CAE_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Detalle_forma_de_Pago_CAE_summary.ShowMessage() %>
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Detalle_forma_de_Pago_CAE.FilterPanelOption = 2 OrElse (Detalle_forma_de_Pago_CAE.FilterPanelOption = 3 AndAlso Detalle_forma_de_Pago_CAE_summary.FilterApplied) OrElse Detalle_forma_de_Pago_CAE_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Detalle_forma_de_Pago_CAEsmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fDetalle_forma_de_Pago_CAEsummaryfilter" id="fDetalle_forma_de_Pago_CAEsummaryfilter" action="Detalle_forma_de_Pago_CAEsmry.aspx" class="ewForm" onsubmit="return Detalle_forma_de_Pago_CAE_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Detalle_forma_de_Pago_CAE.FECDEUDA.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.PATERNO.SearchValue) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.MATERNO.SearchValue) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.Nombre_alumno.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Nombre_alumno" id="sv1_Nombre_alumno" size="30" maxlength="32" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.Nombre_alumno.SearchValue) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_Nombre_alumno", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.RUT_Alumno.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT_Alumno" id="sv1_RUT_Alumno" size="30" maxlength="32" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.RUT_Alumno.SearchValue) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_RUT_Alumno", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.Carrera.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Carrera" id="sv_Carrera"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_Carrera", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.Carrera.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Detalle_forma_de_Pago_CAE.Carrera.CustomFilters.Count + Detalle_forma_de_Pago_CAE.Carrera.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_forma_de_Pago_CAE.Carrera.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Carrera")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.Carrera.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_forma_de_Pago_CAE.Carrera.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.Carrera.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.Facultad.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Facultad" id="sv_Facultad"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_Facultad", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.Facultad.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Detalle_forma_de_Pago_CAE.Facultad.CustomFilters.Count + Detalle_forma_de_Pago_CAE.Facultad.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_forma_de_Pago_CAE.Facultad.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Facultad")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.Facultad.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_forma_de_Pago_CAE.Facultad.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.Facultad.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.ANO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO" id="sv_ANO"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_ANO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.ANO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Detalle_forma_de_Pago_CAE.ANO.CustomFilters.Count + Detalle_forma_de_Pago_CAE.ANO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_forma_de_Pago_CAE.ANO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.ANO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_forma_de_Pago_CAE.ANO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.ANO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.PERIODO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO" id="sv_PERIODO"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_PERIODO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.PERIODO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Detalle_forma_de_Pago_CAE.PERIODO.CustomFilters.Count + Detalle_forma_de_Pago_CAE.PERIODO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_forma_de_Pago_CAE.PERIODO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PERIODO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.PERIODO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_forma_de_Pago_CAE.PERIODO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.PERIODO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.numero_pagare.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_numero_pagare" id="sv1_numero_pagare" size="30" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.numero_pagare.SearchValue) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_numero_pagare", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.CodDoc.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CodDoc" id="sv1_CodDoc" size="30" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.CodDoc.SearchValue) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_CodDoc", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.Documento.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Documento" id="sv1_Documento" size="30" maxlength="60" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.Documento.SearchValue) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_Documento", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.FECVEN.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECVEN" id="sv1_FECVEN" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.FECVEN.SearchValue) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_FECVEN", " class=""ewInputCleared""", "") %>>
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
<input type="text" name="sv2_FECVEN" id="sv2_FECVEN" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.FECVEN.SearchValue2) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_FECVEN", " class=""ewInputCleared""", "") %>>
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
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.FECDEUDA.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECDEUDA" id="sv1_FECDEUDA" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.FECDEUDA.SearchValue) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_FECDEUDA", " class=""ewInputCleared""", "") %>>
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
<input type="text" name="sv2_FECDEUDA" id="sv2_FECDEUDA" value="<%= ew_HtmlEncode(Detalle_forma_de_Pago_CAE.FECDEUDA.SearchValue2) %>"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_FECDEUDA", " class=""ewInputCleared""", "") %>>
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
	<tr>
		<td><span class="aspnetreportmaker"><%= Detalle_forma_de_Pago_CAE.USUARIO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_USUARIO" id="sv_USUARIO"<%= IIf(Detalle_forma_de_Pago_CAE_summary.ClearExtFilter = "Detalle_forma_de_Pago_CAE_USUARIO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.USUARIO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Detalle_forma_de_Pago_CAE.USUARIO.CustomFilters.Count + Detalle_forma_de_Pago_CAE.USUARIO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Detalle_forma_de_Pago_CAE.USUARIO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "USUARIO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.USUARIO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Detalle_forma_de_Pago_CAE.USUARIO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Detalle_forma_de_Pago_CAE.USUARIO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (Detalle_forma_de_Pago_CAE.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Detalle_forma_de_Pago_CAE_summary.ShowFilterList() %>
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
If (Detalle_forma_de_Pago_CAE.ExportAll AndAlso ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then
	Detalle_forma_de_Pago_CAE_summary.StopGrp = Detalle_forma_de_Pago_CAE_summary.TotalGrps
Else
	Detalle_forma_de_Pago_CAE_summary.StopGrp = Detalle_forma_de_Pago_CAE_summary.StartGrp + Detalle_forma_de_Pago_CAE_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Detalle_forma_de_Pago_CAE_summary.StopGrp > Detalle_forma_de_Pago_CAE_summary.TotalGrps) Then
	Detalle_forma_de_Pago_CAE_summary.StopGrp = Detalle_forma_de_Pago_CAE_summary.TotalGrps
End If
Detalle_forma_de_Pago_CAE_summary.RecCount = 0

' Get first row
If (Detalle_forma_de_Pago_CAE_summary.TotalGrps > 0) Then
	Detalle_forma_de_Pago_CAE_summary.GetRow() ' ASPXRPT
	Detalle_forma_de_Pago_CAE_summary.GrpCount = 1
End If
While ((Detalle_forma_de_Pago_CAE_summary.HasRow AndAlso Detalle_forma_de_Pago_CAE_summary.GrpIndex < Detalle_forma_de_Pago_CAE_summary.StopGrp) OrElse Detalle_forma_de_Pago_CAE_summary.ShowFirstHeader)

	' Show header
	If (Detalle_forma_de_Pago_CAE_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.PATERNO) %>',0);"><%= Detalle_forma_de_Pago_CAE.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.MATERNO) %>',0);"><%= Detalle_forma_de_Pago_CAE.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.Nombre_alumno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.Nombre_alumno))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.Nombre_alumno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.Nombre_alumno) %>',0);"><%= Detalle_forma_de_Pago_CAE.Nombre_alumno.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.Nombre_alumno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.Nombre_alumno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.RUT_Alumno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.RUT_Alumno))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.RUT_Alumno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.RUT_Alumno) %>',0);"><%= Detalle_forma_de_Pago_CAE.RUT_Alumno.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.RUT_Alumno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.RUT_Alumno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CODCARR) %>',0);"><%= Detalle_forma_de_Pago_CAE.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.Carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.Carrera))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.Carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.Carrera) %>',0);"><%= Detalle_forma_de_Pago_CAE.Carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.Carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.Carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.Facultad.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.Facultad))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.Facultad.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.Facultad) %>',0);"><%= Detalle_forma_de_Pago_CAE.Facultad.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.Facultad.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.Facultad.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.ANO) %>',0);"><%= Detalle_forma_de_Pago_CAE.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.PERIODO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.PERIODO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.PERIODO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.PERIODO) %>',0);"><%= Detalle_forma_de_Pago_CAE.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.PERIODO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.PERIODO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.numero_pagare.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.numero_pagare))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.numero_pagare.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.numero_pagare) %>',0);"><%= Detalle_forma_de_Pago_CAE.numero_pagare.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.numero_pagare.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.numero_pagare.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.CodDoc.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CodDoc))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.CodDoc.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CodDoc) %>',0);"><%= Detalle_forma_de_Pago_CAE.CodDoc.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.CodDoc.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.CodDoc.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.Documento.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.Documento))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.Documento.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.Documento) %>',0);"><%= Detalle_forma_de_Pago_CAE.Documento.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.Documento.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.Documento.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.CUOTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CUOTA))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.CUOTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CUOTA) %>',0);"><%= Detalle_forma_de_Pago_CAE.CUOTA.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.CUOTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.CUOTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.NumCuotas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.NumCuotas))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.NumCuotas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.NumCuotas) %>',0);"><%= Detalle_forma_de_Pago_CAE.NumCuotas.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.NumCuotas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.NumCuotas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.MONTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.MONTO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.MONTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.MONTO) %>',0);"><%= Detalle_forma_de_Pago_CAE.MONTO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.MONTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.MONTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.SALDO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.SALDO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.SALDO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.SALDO) %>',0);"><%= Detalle_forma_de_Pago_CAE.SALDO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.SALDO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.SALDO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.FECVEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.FECVEN))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.FECVEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.FECVEN) %>',0);"><%= Detalle_forma_de_Pago_CAE.FECVEN.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.FECVEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.FECVEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.FECDEUDA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.FECDEUDA))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.FECDEUDA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.FECDEUDA) %>',0);"><%= Detalle_forma_de_Pago_CAE.FECDEUDA.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.FECDEUDA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.FECDEUDA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.ESTACAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.ESTACAD))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.ESTACAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.ESTACAD) %>',0);"><%= Detalle_forma_de_Pago_CAE.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.ESTACAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.ESTACAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.MAIL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.MAIL))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.MAIL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.MAIL) %>',0);"><%= Detalle_forma_de_Pago_CAE.MAIL.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.MAIL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.MAIL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.DIRPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.DIRPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.DIRPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.DIRPROC) %>',0);"><%= Detalle_forma_de_Pago_CAE.DIRPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.DIRPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.DIRPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.CIUPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CIUPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.CIUPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CIUPROC) %>',0);"><%= Detalle_forma_de_Pago_CAE.CIUPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.CIUPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.CIUPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.COMUNAPRO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.COMUNAPRO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.COMUNAPRO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.COMUNAPRO) %>',0);"><%= Detalle_forma_de_Pago_CAE.COMUNAPRO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.COMUNAPRO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.COMUNAPRO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.FONOPROC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.FONOPROC))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.FONOPROC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.FONOPROC) %>',0);"><%= Detalle_forma_de_Pago_CAE.FONOPROC.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.FONOPROC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.FONOPROC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.FONOACT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.FONOACT))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.FONOACT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.FONOACT) %>',0);"><%= Detalle_forma_de_Pago_CAE.FONOACT.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.FONOACT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.FONOACT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.USUARIO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.USUARIO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.USUARIO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.USUARIO) %>',0);"><%= Detalle_forma_de_Pago_CAE.USUARIO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.USUARIO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.USUARIO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.CODAPOD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CODAPOD))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.CODAPOD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.CODAPOD) %>',0);"><%= Detalle_forma_de_Pago_CAE.CODAPOD.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.CODAPOD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.CODAPOD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.TIPOSITU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.TIPOSITU))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.TIPOSITU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.TIPOSITU) %>',0);"><%= Detalle_forma_de_Pago_CAE.TIPOSITU.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.TIPOSITU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.TIPOSITU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_forma_de_Pago_CAE.Export)) Then %>
<%= Detalle_forma_de_Pago_CAE.DESCRIPCION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.DESCRIPCION))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_forma_de_Pago_CAE.DESCRIPCION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_forma_de_Pago_CAE.SortUrl(Detalle_forma_de_Pago_CAE.DESCRIPCION) %>',0);"><%= Detalle_forma_de_Pago_CAE.DESCRIPCION.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_forma_de_Pago_CAE.DESCRIPCION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_forma_de_Pago_CAE.DESCRIPCION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Detalle_forma_de_Pago_CAE_summary.ShowFirstHeader = False
	End If
	Detalle_forma_de_Pago_CAE_summary.RecCount += 1

		' Render detail row
		Detalle_forma_de_Pago_CAE.ResetCSS()
		Detalle_forma_de_Pago_CAE.RowType = EWRPT_ROWTYPE_DETAIL
		Detalle_forma_de_Pago_CAE_summary.RenderRow()
%>
	<tr<%= Detalle_forma_de_Pago_CAE.RowAttributes() %>>
		<td<%= Detalle_forma_de_Pago_CAE.PATERNO.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.PATERNO.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.PATERNO.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.MATERNO.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.MATERNO.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.MATERNO.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.Nombre_alumno.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.Nombre_alumno.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.Nombre_alumno.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.RUT_Alumno.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.RUT_Alumno.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.RUT_Alumno.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.CODCARR.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.CODCARR.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.CODCARR.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.Carrera.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.Carrera.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.Carrera.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.Facultad.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.Facultad.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.Facultad.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.ANO.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.ANO.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.ANO.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.PERIODO.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.PERIODO.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.PERIODO.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.numero_pagare.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.numero_pagare.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.numero_pagare.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.CodDoc.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.CodDoc.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.CodDoc.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.Documento.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.Documento.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.Documento.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.CUOTA.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.CUOTA.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.CUOTA.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.NumCuotas.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.NumCuotas.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.NumCuotas.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.MONTO.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.MONTO.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.MONTO.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.SALDO.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.SALDO.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.SALDO.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.FECVEN.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.FECVEN.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.FECVEN.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.FECDEUDA.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.FECDEUDA.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.FECDEUDA.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.ESTACAD.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.ESTACAD.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.ESTACAD.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.MAIL.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.MAIL.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.MAIL.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.DIRPROC.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.DIRPROC.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.DIRPROC.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.CIUPROC.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.CIUPROC.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.CIUPROC.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.COMUNAPRO.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.COMUNAPRO.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.COMUNAPRO.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.FONOPROC.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.FONOPROC.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.FONOPROC.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.FONOACT.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.FONOACT.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.FONOACT.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.USUARIO.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.USUARIO.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.USUARIO.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.CODAPOD.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.CODAPOD.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.CODAPOD.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.TIPOSITU.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.TIPOSITU.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.TIPOSITU.ListViewValue%></div>
</td>
		<td<%= Detalle_forma_de_Pago_CAE.DESCRIPCION.CellAttributes %>>
<div<%= Detalle_forma_de_Pago_CAE.DESCRIPCION.ViewAttributes%>><%= Detalle_forma_de_Pago_CAE.DESCRIPCION.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Detalle_forma_de_Pago_CAE_summary.AccumulateSummary()

		' Get next record
		Detalle_forma_de_Pago_CAE_summary.GetRow() ' ASPXRPT
		Detalle_forma_de_Pago_CAE_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Detalle_forma_de_Pago_CAE_summary.TotalGrps > 0) Then
	Detalle_forma_de_Pago_CAE.ResetCSS()
	Detalle_forma_de_Pago_CAE.RowType = EWRPT_ROWTYPE_TOTAL
	Detalle_forma_de_Pago_CAE.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Detalle_forma_de_Pago_CAE.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Detalle_forma_de_Pago_CAE.RowAttrs("class") = "ewRptGrandSummary"
	Detalle_forma_de_Pago_CAE_summary.RenderRow()
%>
	<!-- tr><td colspan="29"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Detalle_forma_de_Pago_CAE.RowAttributes() %>><td colspan="29"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Detalle_forma_de_Pago_CAE_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Detalle_forma_de_Pago_CAE_summary.Pager Is Nothing Then Detalle_forma_de_Pago_CAE_summary.Pager = New cPrevNextPager(Detalle_forma_de_Pago_CAE_summary.StartGrp, Detalle_forma_de_Pago_CAE_summary.DisplayGrps, Detalle_forma_de_Pago_CAE_summary.TotalGrps) %>
<% If Detalle_forma_de_Pago_CAE_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Detalle_forma_de_Pago_CAE_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Detalle_forma_de_Pago_CAEsmry.aspx?start=<%= Detalle_forma_de_Pago_CAE_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Detalle_forma_de_Pago_CAE_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Detalle_forma_de_Pago_CAEsmry.aspx?start=<%= Detalle_forma_de_Pago_CAE_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Detalle_forma_de_Pago_CAE_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Detalle_forma_de_Pago_CAE_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Detalle_forma_de_Pago_CAEsmry.aspx?start=<%= Detalle_forma_de_Pago_CAE_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Detalle_forma_de_Pago_CAE_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Detalle_forma_de_Pago_CAEsmry.aspx?start=<%= Detalle_forma_de_Pago_CAE_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Detalle_forma_de_Pago_CAE_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Detalle_forma_de_Pago_CAE_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Detalle_forma_de_Pago_CAE_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Detalle_forma_de_Pago_CAE_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Detalle_forma_de_Pago_CAE_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Detalle_forma_de_Pago_CAE_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Detalle_forma_de_Pago_CAE_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Detalle_forma_de_Pago_CAE_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Detalle_forma_de_Pago_CAE_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Detalle_forma_de_Pago_CAE_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Detalle_forma_de_Pago_CAE.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
