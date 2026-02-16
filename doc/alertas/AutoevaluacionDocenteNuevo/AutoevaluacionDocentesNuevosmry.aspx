<%@ Page ClassName="AutoevaluacionDocentesNuevosmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public AutoevaluacionDocentesNuevo As crAutoevaluacionDocentesNuevo = Nothing

	'
	' Table class (for AutoevaluacionDocentesNuevo)
	'
	Public Class crAutoevaluacionDocentesNuevo
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
				Return "AutoevaluacionDocentesNuevo"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "AutoevaluacionDocentesNuevo"
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

		Public codProf As crField

		Public NOMBREPROFESOR As crField

		Public Carrera As crField

		Public NOMBRE_C As crField

		Public Asignatura As crField

		Public NOMBRE As crField

		Public Seccion As crField

		Public Jornada As crField

		Public Periodo As crField

		Public Ano As crField

		Public fecha As crField

		Public p1 As crField

		Public p2 As crField

		Public p3 As crField

		Public p4 As crField

		Public p5 As crField

		Public p6 As crField

		Public p7 As crField

		Public p8 As crField

		Public p9 As crField

		Public p10 As crField

		Public p11 As crField

		Public p12 As crField

		Public p13 As crField

		Public p14 As crField

		Public p15 As crField

		Public p16 As crField

		Public p17 As crField

		Public p18 As crField

		Public p19 As crField

		Public p20 As crField

		Public p21 As crField

		Public p22 As crField

		Public p23 As crField

		Public p24 As crField

		Public p25 As crField

		Public observacion As crField

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

			' codProf
			codProf = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_codProf", "codProf", "[codProf]", 200, EWRPT_DATATYPE_STRING, -1)
			codProf.Page = APage
			codProf.ParentPage = APage.ParentPage
			Fields.Add("codProf", codProf)
			codProf.DateFilter = ""
			codProf.SqlSelect = ""
			codProf.SqlOrderBy = ""

			' NOMBREPROFESOR
			NOMBREPROFESOR = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_NOMBREPROFESOR", "NOMBREPROFESOR", "[NOMBREPROFESOR]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBREPROFESOR.Page = APage
			NOMBREPROFESOR.ParentPage = APage.ParentPage
			Fields.Add("NOMBREPROFESOR", NOMBREPROFESOR)
			NOMBREPROFESOR.DateFilter = ""
			NOMBREPROFESOR.SqlSelect = ""
			NOMBREPROFESOR.SqlOrderBy = ""

			' Carrera
			Carrera = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_Carrera", "Carrera", "[Carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			Carrera.Page = APage
			Carrera.ParentPage = APage.ParentPage
			Fields.Add("Carrera", Carrera)
			Carrera.DateFilter = ""
			Carrera.SqlSelect = ""
			Carrera.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' Asignatura
			Asignatura = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_Asignatura", "Asignatura", "[Asignatura]", 200, EWRPT_DATATYPE_STRING, -1)
			Asignatura.Page = APage
			Asignatura.ParentPage = APage.ParentPage
			Fields.Add("Asignatura", Asignatura)
			Asignatura.DateFilter = ""
			Asignatura.SqlSelect = ""
			Asignatura.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' Seccion
			Seccion = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_Seccion", "Seccion", "[Seccion]", 3, EWRPT_DATATYPE_NUMBER, -1)
			Seccion.Page = APage
			Seccion.ParentPage = APage.ParentPage
			Seccion.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Seccion", Seccion)
			Seccion.DateFilter = ""
			Seccion.SqlSelect = ""
			Seccion.SqlOrderBy = ""

			' Jornada
			Jornada = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_Jornada", "Jornada", "[Jornada]", 200, EWRPT_DATATYPE_STRING, -1)
			Jornada.Page = APage
			Jornada.ParentPage = APage.ParentPage
			Fields.Add("Jornada", Jornada)
			Jornada.DateFilter = ""
			Jornada.SqlSelect = ""
			Jornada.SqlOrderBy = ""

			' Periodo
			Periodo = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_Periodo", "Periodo", "[Periodo]", 200, EWRPT_DATATYPE_STRING, -1)
			Periodo.Page = APage
			Periodo.ParentPage = APage.ParentPage
			Fields.Add("Periodo", Periodo)
			Periodo.DateFilter = ""
			Periodo.SqlSelect = ""
			Periodo.SqlOrderBy = ""

			' Ano
			Ano = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_Ano", "Ano", "[Ano]", 3, EWRPT_DATATYPE_NUMBER, -1)
			Ano.Page = APage
			Ano.ParentPage = APage.ParentPage
			Ano.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Ano", Ano)
			Ano.DateFilter = ""
			Ano.SqlSelect = ""
			Ano.SqlOrderBy = ""

			' fecha
			fecha = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_fecha", "fecha", "[fecha]", 135, EWRPT_DATATYPE_DATE, 7)
			fecha.Page = APage
			fecha.ParentPage = APage.ParentPage
			fecha.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("fecha", fecha)
			fecha.DateFilter = ""
			fecha.SqlSelect = ""
			fecha.SqlOrderBy = ""

			' p1
			p1 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p1", "p1", "[p1]", 200, EWRPT_DATATYPE_STRING, -1)
			p1.Page = APage
			p1.ParentPage = APage.ParentPage
			Fields.Add("p1", p1)
			p1.DateFilter = ""
			p1.SqlSelect = ""
			p1.SqlOrderBy = ""

			' p2
			p2 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p2", "p2", "[p2]", 200, EWRPT_DATATYPE_STRING, -1)
			p2.Page = APage
			p2.ParentPage = APage.ParentPage
			Fields.Add("p2", p2)
			p2.DateFilter = ""
			p2.SqlSelect = ""
			p2.SqlOrderBy = ""

			' p3
			p3 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p3", "p3", "[p3]", 200, EWRPT_DATATYPE_STRING, -1)
			p3.Page = APage
			p3.ParentPage = APage.ParentPage
			Fields.Add("p3", p3)
			p3.DateFilter = ""
			p3.SqlSelect = ""
			p3.SqlOrderBy = ""

			' p4
			p4 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p4", "p4", "[p4]", 200, EWRPT_DATATYPE_STRING, -1)
			p4.Page = APage
			p4.ParentPage = APage.ParentPage
			Fields.Add("p4", p4)
			p4.DateFilter = ""
			p4.SqlSelect = ""
			p4.SqlOrderBy = ""

			' p5
			p5 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p5", "p5", "[p5]", 200, EWRPT_DATATYPE_STRING, -1)
			p5.Page = APage
			p5.ParentPage = APage.ParentPage
			Fields.Add("p5", p5)
			p5.DateFilter = ""
			p5.SqlSelect = ""
			p5.SqlOrderBy = ""

			' p6
			p6 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p6", "p6", "[p6]", 200, EWRPT_DATATYPE_STRING, -1)
			p6.Page = APage
			p6.ParentPage = APage.ParentPage
			Fields.Add("p6", p6)
			p6.DateFilter = ""
			p6.SqlSelect = ""
			p6.SqlOrderBy = ""

			' p7
			p7 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p7", "p7", "[p7]", 200, EWRPT_DATATYPE_STRING, -1)
			p7.Page = APage
			p7.ParentPage = APage.ParentPage
			Fields.Add("p7", p7)
			p7.DateFilter = ""
			p7.SqlSelect = ""
			p7.SqlOrderBy = ""

			' p8
			p8 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p8", "p8", "[p8]", 200, EWRPT_DATATYPE_STRING, -1)
			p8.Page = APage
			p8.ParentPage = APage.ParentPage
			Fields.Add("p8", p8)
			p8.DateFilter = ""
			p8.SqlSelect = ""
			p8.SqlOrderBy = ""

			' p9
			p9 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p9", "p9", "[p9]", 200, EWRPT_DATATYPE_STRING, -1)
			p9.Page = APage
			p9.ParentPage = APage.ParentPage
			Fields.Add("p9", p9)
			p9.DateFilter = ""
			p9.SqlSelect = ""
			p9.SqlOrderBy = ""

			' p10
			p10 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p10", "p10", "[p10]", 200, EWRPT_DATATYPE_STRING, -1)
			p10.Page = APage
			p10.ParentPage = APage.ParentPage
			Fields.Add("p10", p10)
			p10.DateFilter = ""
			p10.SqlSelect = ""
			p10.SqlOrderBy = ""

			' p11
			p11 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p11", "p11", "[p11]", 200, EWRPT_DATATYPE_STRING, -1)
			p11.Page = APage
			p11.ParentPage = APage.ParentPage
			Fields.Add("p11", p11)
			p11.DateFilter = ""
			p11.SqlSelect = ""
			p11.SqlOrderBy = ""

			' p12
			p12 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p12", "p12", "[p12]", 200, EWRPT_DATATYPE_STRING, -1)
			p12.Page = APage
			p12.ParentPage = APage.ParentPage
			Fields.Add("p12", p12)
			p12.DateFilter = ""
			p12.SqlSelect = ""
			p12.SqlOrderBy = ""

			' p13
			p13 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p13", "p13", "[p13]", 200, EWRPT_DATATYPE_STRING, -1)
			p13.Page = APage
			p13.ParentPage = APage.ParentPage
			Fields.Add("p13", p13)
			p13.DateFilter = ""
			p13.SqlSelect = ""
			p13.SqlOrderBy = ""

			' p14
			p14 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p14", "p14", "[p14]", 200, EWRPT_DATATYPE_STRING, -1)
			p14.Page = APage
			p14.ParentPage = APage.ParentPage
			Fields.Add("p14", p14)
			p14.DateFilter = ""
			p14.SqlSelect = ""
			p14.SqlOrderBy = ""

			' p15
			p15 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p15", "p15", "[p15]", 200, EWRPT_DATATYPE_STRING, -1)
			p15.Page = APage
			p15.ParentPage = APage.ParentPage
			Fields.Add("p15", p15)
			p15.DateFilter = ""
			p15.SqlSelect = ""
			p15.SqlOrderBy = ""

			' p16
			p16 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p16", "p16", "[p16]", 200, EWRPT_DATATYPE_STRING, -1)
			p16.Page = APage
			p16.ParentPage = APage.ParentPage
			Fields.Add("p16", p16)
			p16.DateFilter = ""
			p16.SqlSelect = ""
			p16.SqlOrderBy = ""

			' p17
			p17 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p17", "p17", "[p17]", 200, EWRPT_DATATYPE_STRING, -1)
			p17.Page = APage
			p17.ParentPage = APage.ParentPage
			Fields.Add("p17", p17)
			p17.DateFilter = ""
			p17.SqlSelect = ""
			p17.SqlOrderBy = ""

			' p18
			p18 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p18", "p18", "[p18]", 200, EWRPT_DATATYPE_STRING, -1)
			p18.Page = APage
			p18.ParentPage = APage.ParentPage
			Fields.Add("p18", p18)
			p18.DateFilter = ""
			p18.SqlSelect = ""
			p18.SqlOrderBy = ""

			' p19
			p19 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p19", "p19", "[p19]", 200, EWRPT_DATATYPE_STRING, -1)
			p19.Page = APage
			p19.ParentPage = APage.ParentPage
			Fields.Add("p19", p19)
			p19.DateFilter = ""
			p19.SqlSelect = ""
			p19.SqlOrderBy = ""

			' p20
			p20 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p20", "p20", "[p20]", 200, EWRPT_DATATYPE_STRING, -1)
			p20.Page = APage
			p20.ParentPage = APage.ParentPage
			Fields.Add("p20", p20)
			p20.DateFilter = ""
			p20.SqlSelect = ""
			p20.SqlOrderBy = ""

			' p21
			p21 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p21", "p21", "[p21]", 200, EWRPT_DATATYPE_STRING, -1)
			p21.Page = APage
			p21.ParentPage = APage.ParentPage
			Fields.Add("p21", p21)
			p21.DateFilter = ""
			p21.SqlSelect = ""
			p21.SqlOrderBy = ""

			' p22
			p22 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p22", "p22", "[p22]", 200, EWRPT_DATATYPE_STRING, -1)
			p22.Page = APage
			p22.ParentPage = APage.ParentPage
			Fields.Add("p22", p22)
			p22.DateFilter = ""
			p22.SqlSelect = ""
			p22.SqlOrderBy = ""

			' p23
			p23 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p23", "p23", "[p23]", 200, EWRPT_DATATYPE_STRING, -1)
			p23.Page = APage
			p23.ParentPage = APage.ParentPage
			Fields.Add("p23", p23)
			p23.DateFilter = ""
			p23.SqlSelect = ""
			p23.SqlOrderBy = ""

			' p24
			p24 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p24", "p24", "[p24]", 200, EWRPT_DATATYPE_STRING, -1)
			p24.Page = APage
			p24.ParentPage = APage.ParentPage
			Fields.Add("p24", p24)
			p24.DateFilter = ""
			p24.SqlSelect = ""
			p24.SqlOrderBy = ""

			' p25
			p25 = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_p25", "p25", "[p25]", 200, EWRPT_DATATYPE_STRING, -1)
			p25.Page = APage
			p25.ParentPage = APage.ParentPage
			Fields.Add("p25", p25)
			p25.DateFilter = ""
			p25.SqlSelect = ""
			p25.SqlOrderBy = ""

			' observacion
			observacion = new crField("AutoevaluacionDocentesNuevo", "AutoevaluacionDocentesNuevo", "x_observacion", "observacion", "[observacion]", 201, EWRPT_DATATYPE_MEMO, -1)
			observacion.Page = APage
			observacion.ParentPage = APage.ParentPage
			Fields.Add("observacion", observacion)
			observacion.DateFilter = ""
			observacion.SqlSelect = ""
			observacion.SqlOrderBy = ""
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
				Return "[SEK_V_Autoevaluacion_docentes_nuevo]"
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
	Public AutoevaluacionDocentesNuevo_summary As crAutoevaluacionDocentesNuevo_summary

	'
	' Page class
	'
	Public Class crAutoevaluacionDocentesNuevo_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (AutoevaluacionDocentesNuevo.UseTokenInUrl) Then
				sUrl &= "t=" & AutoevaluacionDocentesNuevo.TableVar & "&" ' Add page token
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
			If (AutoevaluacionDocentesNuevo.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(AutoevaluacionDocentesNuevo.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(AutoevaluacionDocentesNuevo.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As AutoevaluacionDocentesNuevosmry 
			Get
				Return CType(m_ParentPage, AutoevaluacionDocentesNuevosmry)
			End Get
		End Property

		' Table object (AutoevaluacionDocentesNuevo)
		Public Property AutoevaluacionDocentesNuevo As crAutoevaluacionDocentesNuevo 
			Get		
				Return AspNetPage.AutoevaluacionDocentesNuevo ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAutoevaluacionDocentesNuevo)
				AspNetPage.AutoevaluacionDocentesNuevo = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "AutoevaluacionDocentesNuevo_summary"
			m_PageObjTypeName = "crAutoevaluacionDocentesNuevo_summary"

			' Table name
			m_TableName = "AutoevaluacionDocentesNuevo"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (AutoevaluacionDocentesNuevo)
			AutoevaluacionDocentesNuevo = New crAutoevaluacionDocentesNuevo(Me)			

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
				AutoevaluacionDocentesNuevo.Export = ew_Get("export")
			End If
			gsExport = AutoevaluacionDocentesNuevo.Export ' Get export parameter, used in header
			gsExportFile = AutoevaluacionDocentesNuevo.TableVar ' Get export file, used in header
			If (AutoevaluacionDocentesNuevo.Export = "excel") Then
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

		Public Val As Object() = New Object(37) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(37) {}

		Public GrandMn As Object() = New Object(37) {}

		Public GrandMx As Object() = New Object(37) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 38 ' No. of fields
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
			AutoevaluacionDocentesNuevo.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(AutoevaluacionDocentesNuevo.SqlSelect, AutoevaluacionDocentesNuevo.SqlWhere, AutoevaluacionDocentesNuevo.SqlGroupBy, AutoevaluacionDocentesNuevo.SqlHaving, AutoevaluacionDocentesNuevo.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (AutoevaluacionDocentesNuevo.ExportAll AndAlso ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then
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
				AutoevaluacionDocentesNuevo.codProf.DbValue = Row("codProf")
				AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DbValue = Row("NOMBREPROFESOR")
				AutoevaluacionDocentesNuevo.Carrera.DbValue = Row("Carrera")
				AutoevaluacionDocentesNuevo.NOMBRE_C.DbValue = Row("NOMBRE_C")
				AutoevaluacionDocentesNuevo.Asignatura.DbValue = Row("Asignatura")
				AutoevaluacionDocentesNuevo.NOMBRE.DbValue = Row("NOMBRE")
				AutoevaluacionDocentesNuevo.Seccion.DbValue = Row("Seccion")
				AutoevaluacionDocentesNuevo.Jornada.DbValue = Row("Jornada")
				AutoevaluacionDocentesNuevo.Periodo.DbValue = Row("Periodo")
				AutoevaluacionDocentesNuevo.Ano.DbValue = Row("Ano")
				AutoevaluacionDocentesNuevo.fecha.DbValue = Row("fecha")
				AutoevaluacionDocentesNuevo.p1.DbValue = Row("p1")
				AutoevaluacionDocentesNuevo.p2.DbValue = Row("p2")
				AutoevaluacionDocentesNuevo.p3.DbValue = Row("p3")
				AutoevaluacionDocentesNuevo.p4.DbValue = Row("p4")
				AutoevaluacionDocentesNuevo.p5.DbValue = Row("p5")
				AutoevaluacionDocentesNuevo.p6.DbValue = Row("p6")
				AutoevaluacionDocentesNuevo.p7.DbValue = Row("p7")
				AutoevaluacionDocentesNuevo.p8.DbValue = Row("p8")
				AutoevaluacionDocentesNuevo.p9.DbValue = Row("p9")
				AutoevaluacionDocentesNuevo.p10.DbValue = Row("p10")
				AutoevaluacionDocentesNuevo.p11.DbValue = Row("p11")
				AutoevaluacionDocentesNuevo.p12.DbValue = Row("p12")
				AutoevaluacionDocentesNuevo.p13.DbValue = Row("p13")
				AutoevaluacionDocentesNuevo.p14.DbValue = Row("p14")
				AutoevaluacionDocentesNuevo.p15.DbValue = Row("p15")
				AutoevaluacionDocentesNuevo.p16.DbValue = Row("p16")
				AutoevaluacionDocentesNuevo.p17.DbValue = Row("p17")
				AutoevaluacionDocentesNuevo.p18.DbValue = Row("p18")
				AutoevaluacionDocentesNuevo.p19.DbValue = Row("p19")
				AutoevaluacionDocentesNuevo.p20.DbValue = Row("p20")
				AutoevaluacionDocentesNuevo.p21.DbValue = Row("p21")
				AutoevaluacionDocentesNuevo.p22.DbValue = Row("p22")
				AutoevaluacionDocentesNuevo.p23.DbValue = Row("p23")
				AutoevaluacionDocentesNuevo.p24.DbValue = Row("p24")
				AutoevaluacionDocentesNuevo.p25.DbValue = Row("p25")
				AutoevaluacionDocentesNuevo.observacion.DbValue = Row("observacion")
				Val(1) = AutoevaluacionDocentesNuevo.codProf.CurrentValue
				Val(2) = AutoevaluacionDocentesNuevo.NOMBREPROFESOR.CurrentValue
				Val(3) = AutoevaluacionDocentesNuevo.Carrera.CurrentValue
				Val(4) = AutoevaluacionDocentesNuevo.NOMBRE_C.CurrentValue
				Val(5) = AutoevaluacionDocentesNuevo.Asignatura.CurrentValue
				Val(6) = AutoevaluacionDocentesNuevo.NOMBRE.CurrentValue
				Val(7) = AutoevaluacionDocentesNuevo.Seccion.CurrentValue
				Val(8) = AutoevaluacionDocentesNuevo.Jornada.CurrentValue
				Val(9) = AutoevaluacionDocentesNuevo.Periodo.CurrentValue
				Val(10) = AutoevaluacionDocentesNuevo.Ano.CurrentValue
				Val(11) = AutoevaluacionDocentesNuevo.fecha.CurrentValue
				Val(12) = AutoevaluacionDocentesNuevo.p1.CurrentValue
				Val(13) = AutoevaluacionDocentesNuevo.p2.CurrentValue
				Val(14) = AutoevaluacionDocentesNuevo.p3.CurrentValue
				Val(15) = AutoevaluacionDocentesNuevo.p4.CurrentValue
				Val(16) = AutoevaluacionDocentesNuevo.p5.CurrentValue
				Val(17) = AutoevaluacionDocentesNuevo.p6.CurrentValue
				Val(18) = AutoevaluacionDocentesNuevo.p7.CurrentValue
				Val(19) = AutoevaluacionDocentesNuevo.p8.CurrentValue
				Val(20) = AutoevaluacionDocentesNuevo.p9.CurrentValue
				Val(21) = AutoevaluacionDocentesNuevo.p10.CurrentValue
				Val(22) = AutoevaluacionDocentesNuevo.p11.CurrentValue
				Val(23) = AutoevaluacionDocentesNuevo.p12.CurrentValue
				Val(24) = AutoevaluacionDocentesNuevo.p13.CurrentValue
				Val(25) = AutoevaluacionDocentesNuevo.p14.CurrentValue
				Val(26) = AutoevaluacionDocentesNuevo.p15.CurrentValue
				Val(27) = AutoevaluacionDocentesNuevo.p16.CurrentValue
				Val(28) = AutoevaluacionDocentesNuevo.p17.CurrentValue
				Val(29) = AutoevaluacionDocentesNuevo.p18.CurrentValue
				Val(30) = AutoevaluacionDocentesNuevo.p19.CurrentValue
				Val(31) = AutoevaluacionDocentesNuevo.p20.CurrentValue
				Val(32) = AutoevaluacionDocentesNuevo.p21.CurrentValue
				Val(33) = AutoevaluacionDocentesNuevo.p22.CurrentValue
				Val(34) = AutoevaluacionDocentesNuevo.p23.CurrentValue
				Val(35) = AutoevaluacionDocentesNuevo.p24.CurrentValue
				Val(36) = AutoevaluacionDocentesNuevo.p25.CurrentValue
				Val(37) = AutoevaluacionDocentesNuevo.observacion.CurrentValue
			Else
				AutoevaluacionDocentesNuevo.codProf.DbValue = ""
				AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DbValue = ""
				AutoevaluacionDocentesNuevo.Carrera.DbValue = ""
				AutoevaluacionDocentesNuevo.NOMBRE_C.DbValue = ""
				AutoevaluacionDocentesNuevo.Asignatura.DbValue = ""
				AutoevaluacionDocentesNuevo.NOMBRE.DbValue = ""
				AutoevaluacionDocentesNuevo.Seccion.DbValue = ""
				AutoevaluacionDocentesNuevo.Jornada.DbValue = ""
				AutoevaluacionDocentesNuevo.Periodo.DbValue = ""
				AutoevaluacionDocentesNuevo.Ano.DbValue = ""
				AutoevaluacionDocentesNuevo.fecha.DbValue = ""
				AutoevaluacionDocentesNuevo.p1.DbValue = ""
				AutoevaluacionDocentesNuevo.p2.DbValue = ""
				AutoevaluacionDocentesNuevo.p3.DbValue = ""
				AutoevaluacionDocentesNuevo.p4.DbValue = ""
				AutoevaluacionDocentesNuevo.p5.DbValue = ""
				AutoevaluacionDocentesNuevo.p6.DbValue = ""
				AutoevaluacionDocentesNuevo.p7.DbValue = ""
				AutoevaluacionDocentesNuevo.p8.DbValue = ""
				AutoevaluacionDocentesNuevo.p9.DbValue = ""
				AutoevaluacionDocentesNuevo.p10.DbValue = ""
				AutoevaluacionDocentesNuevo.p11.DbValue = ""
				AutoevaluacionDocentesNuevo.p12.DbValue = ""
				AutoevaluacionDocentesNuevo.p13.DbValue = ""
				AutoevaluacionDocentesNuevo.p14.DbValue = ""
				AutoevaluacionDocentesNuevo.p15.DbValue = ""
				AutoevaluacionDocentesNuevo.p16.DbValue = ""
				AutoevaluacionDocentesNuevo.p17.DbValue = ""
				AutoevaluacionDocentesNuevo.p18.DbValue = ""
				AutoevaluacionDocentesNuevo.p19.DbValue = ""
				AutoevaluacionDocentesNuevo.p20.DbValue = ""
				AutoevaluacionDocentesNuevo.p21.DbValue = ""
				AutoevaluacionDocentesNuevo.p22.DbValue = ""
				AutoevaluacionDocentesNuevo.p23.DbValue = ""
				AutoevaluacionDocentesNuevo.p24.DbValue = ""
				AutoevaluacionDocentesNuevo.p25.DbValue = ""
				AutoevaluacionDocentesNuevo.observacion.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				AutoevaluacionDocentesNuevo.codProf.DbValue = dr("codProf")
				AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DbValue = dr("NOMBREPROFESOR")
				AutoevaluacionDocentesNuevo.Carrera.DbValue = dr("Carrera")
				AutoevaluacionDocentesNuevo.NOMBRE_C.DbValue = dr("NOMBRE_C")
				AutoevaluacionDocentesNuevo.Asignatura.DbValue = dr("Asignatura")
				AutoevaluacionDocentesNuevo.NOMBRE.DbValue = dr("NOMBRE")
				AutoevaluacionDocentesNuevo.Seccion.DbValue = dr("Seccion")
				AutoevaluacionDocentesNuevo.Jornada.DbValue = dr("Jornada")
				AutoevaluacionDocentesNuevo.Periodo.DbValue = dr("Periodo")
				AutoevaluacionDocentesNuevo.Ano.DbValue = dr("Ano")
				AutoevaluacionDocentesNuevo.fecha.DbValue = dr("fecha")
				AutoevaluacionDocentesNuevo.p1.DbValue = dr("p1")
				AutoevaluacionDocentesNuevo.p2.DbValue = dr("p2")
				AutoevaluacionDocentesNuevo.p3.DbValue = dr("p3")
				AutoevaluacionDocentesNuevo.p4.DbValue = dr("p4")
				AutoevaluacionDocentesNuevo.p5.DbValue = dr("p5")
				AutoevaluacionDocentesNuevo.p6.DbValue = dr("p6")
				AutoevaluacionDocentesNuevo.p7.DbValue = dr("p7")
				AutoevaluacionDocentesNuevo.p8.DbValue = dr("p8")
				AutoevaluacionDocentesNuevo.p9.DbValue = dr("p9")
				AutoevaluacionDocentesNuevo.p10.DbValue = dr("p10")
				AutoevaluacionDocentesNuevo.p11.DbValue = dr("p11")
				AutoevaluacionDocentesNuevo.p12.DbValue = dr("p12")
				AutoevaluacionDocentesNuevo.p13.DbValue = dr("p13")
				AutoevaluacionDocentesNuevo.p14.DbValue = dr("p14")
				AutoevaluacionDocentesNuevo.p15.DbValue = dr("p15")
				AutoevaluacionDocentesNuevo.p16.DbValue = dr("p16")
				AutoevaluacionDocentesNuevo.p17.DbValue = dr("p17")
				AutoevaluacionDocentesNuevo.p18.DbValue = dr("p18")
				AutoevaluacionDocentesNuevo.p19.DbValue = dr("p19")
				AutoevaluacionDocentesNuevo.p20.DbValue = dr("p20")
				AutoevaluacionDocentesNuevo.p21.DbValue = dr("p21")
				AutoevaluacionDocentesNuevo.p22.DbValue = dr("p22")
				AutoevaluacionDocentesNuevo.p23.DbValue = dr("p23")
				AutoevaluacionDocentesNuevo.p24.DbValue = dr("p24")
				AutoevaluacionDocentesNuevo.p25.DbValue = dr("p25")
				AutoevaluacionDocentesNuevo.observacion.DbValue = dr("observacion")
				Val(1) = AutoevaluacionDocentesNuevo.codProf.CurrentValue
				Val(2) = AutoevaluacionDocentesNuevo.NOMBREPROFESOR.CurrentValue
				Val(3) = AutoevaluacionDocentesNuevo.Carrera.CurrentValue
				Val(4) = AutoevaluacionDocentesNuevo.NOMBRE_C.CurrentValue
				Val(5) = AutoevaluacionDocentesNuevo.Asignatura.CurrentValue
				Val(6) = AutoevaluacionDocentesNuevo.NOMBRE.CurrentValue
				Val(7) = AutoevaluacionDocentesNuevo.Seccion.CurrentValue
				Val(8) = AutoevaluacionDocentesNuevo.Jornada.CurrentValue
				Val(9) = AutoevaluacionDocentesNuevo.Periodo.CurrentValue
				Val(10) = AutoevaluacionDocentesNuevo.Ano.CurrentValue
				Val(11) = AutoevaluacionDocentesNuevo.fecha.CurrentValue
				Val(12) = AutoevaluacionDocentesNuevo.p1.CurrentValue
				Val(13) = AutoevaluacionDocentesNuevo.p2.CurrentValue
				Val(14) = AutoevaluacionDocentesNuevo.p3.CurrentValue
				Val(15) = AutoevaluacionDocentesNuevo.p4.CurrentValue
				Val(16) = AutoevaluacionDocentesNuevo.p5.CurrentValue
				Val(17) = AutoevaluacionDocentesNuevo.p6.CurrentValue
				Val(18) = AutoevaluacionDocentesNuevo.p7.CurrentValue
				Val(19) = AutoevaluacionDocentesNuevo.p8.CurrentValue
				Val(20) = AutoevaluacionDocentesNuevo.p9.CurrentValue
				Val(21) = AutoevaluacionDocentesNuevo.p10.CurrentValue
				Val(22) = AutoevaluacionDocentesNuevo.p11.CurrentValue
				Val(23) = AutoevaluacionDocentesNuevo.p12.CurrentValue
				Val(24) = AutoevaluacionDocentesNuevo.p13.CurrentValue
				Val(25) = AutoevaluacionDocentesNuevo.p14.CurrentValue
				Val(26) = AutoevaluacionDocentesNuevo.p15.CurrentValue
				Val(27) = AutoevaluacionDocentesNuevo.p16.CurrentValue
				Val(28) = AutoevaluacionDocentesNuevo.p17.CurrentValue
				Val(29) = AutoevaluacionDocentesNuevo.p18.CurrentValue
				Val(30) = AutoevaluacionDocentesNuevo.p19.CurrentValue
				Val(31) = AutoevaluacionDocentesNuevo.p20.CurrentValue
				Val(32) = AutoevaluacionDocentesNuevo.p21.CurrentValue
				Val(33) = AutoevaluacionDocentesNuevo.p22.CurrentValue
				Val(34) = AutoevaluacionDocentesNuevo.p23.CurrentValue
				Val(35) = AutoevaluacionDocentesNuevo.p24.CurrentValue
				Val(36) = AutoevaluacionDocentesNuevo.p25.CurrentValue
				Val(37) = AutoevaluacionDocentesNuevo.observacion.CurrentValue
			Else				
				AutoevaluacionDocentesNuevo.codProf.DbValue = ""
				AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DbValue = ""
				AutoevaluacionDocentesNuevo.Carrera.DbValue = ""
				AutoevaluacionDocentesNuevo.NOMBRE_C.DbValue = ""
				AutoevaluacionDocentesNuevo.Asignatura.DbValue = ""
				AutoevaluacionDocentesNuevo.NOMBRE.DbValue = ""
				AutoevaluacionDocentesNuevo.Seccion.DbValue = ""
				AutoevaluacionDocentesNuevo.Jornada.DbValue = ""
				AutoevaluacionDocentesNuevo.Periodo.DbValue = ""
				AutoevaluacionDocentesNuevo.Ano.DbValue = ""
				AutoevaluacionDocentesNuevo.fecha.DbValue = ""
				AutoevaluacionDocentesNuevo.p1.DbValue = ""
				AutoevaluacionDocentesNuevo.p2.DbValue = ""
				AutoevaluacionDocentesNuevo.p3.DbValue = ""
				AutoevaluacionDocentesNuevo.p4.DbValue = ""
				AutoevaluacionDocentesNuevo.p5.DbValue = ""
				AutoevaluacionDocentesNuevo.p6.DbValue = ""
				AutoevaluacionDocentesNuevo.p7.DbValue = ""
				AutoevaluacionDocentesNuevo.p8.DbValue = ""
				AutoevaluacionDocentesNuevo.p9.DbValue = ""
				AutoevaluacionDocentesNuevo.p10.DbValue = ""
				AutoevaluacionDocentesNuevo.p11.DbValue = ""
				AutoevaluacionDocentesNuevo.p12.DbValue = ""
				AutoevaluacionDocentesNuevo.p13.DbValue = ""
				AutoevaluacionDocentesNuevo.p14.DbValue = ""
				AutoevaluacionDocentesNuevo.p15.DbValue = ""
				AutoevaluacionDocentesNuevo.p16.DbValue = ""
				AutoevaluacionDocentesNuevo.p17.DbValue = ""
				AutoevaluacionDocentesNuevo.p18.DbValue = ""
				AutoevaluacionDocentesNuevo.p19.DbValue = ""
				AutoevaluacionDocentesNuevo.p20.DbValue = ""
				AutoevaluacionDocentesNuevo.p21.DbValue = ""
				AutoevaluacionDocentesNuevo.p22.DbValue = ""
				AutoevaluacionDocentesNuevo.p23.DbValue = ""
				AutoevaluacionDocentesNuevo.p24.DbValue = ""
				AutoevaluacionDocentesNuevo.p25.DbValue = ""
				AutoevaluacionDocentesNuevo.observacion.DbValue = ""
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
				AutoevaluacionDocentesNuevo.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					AutoevaluacionDocentesNuevo.StartGroup = StartGrp
				Else
					StartGrp = AutoevaluacionDocentesNuevo.StartGroup
				End If
			Else
				StartGrp = AutoevaluacionDocentesNuevo.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				AutoevaluacionDocentesNuevo.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				AutoevaluacionDocentesNuevo.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				AutoevaluacionDocentesNuevo.StartGroup = StartGrp
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
			AutoevaluacionDocentesNuevo.StartGroup = StartGrp
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
				AutoevaluacionDocentesNuevo.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				AutoevaluacionDocentesNuevo.StartGroup = StartGrp
			Else				
				If (AutoevaluacionDocentesNuevo.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(AutoevaluacionDocentesNuevo.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 15 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (AutoevaluacionDocentesNuevo.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(AutoevaluacionDocentesNuevo.SqlSelectCount, AutoevaluacionDocentesNuevo.SqlWhere, AutoevaluacionDocentesNuevo.SqlGroupBy, AutoevaluacionDocentesNuevo.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			AutoevaluacionDocentesNuevo.Row_Rendering()

			'
			' Render view codes
			'

			If (AutoevaluacionDocentesNuevo.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' codProf
				AutoevaluacionDocentesNuevo.codProf.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.codProf.Summary)

				' NOMBREPROFESOR
				AutoevaluacionDocentesNuevo.NOMBREPROFESOR.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.NOMBREPROFESOR.Summary)

				' Carrera
				AutoevaluacionDocentesNuevo.Carrera.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Carrera.Summary)

				' NOMBRE_C
				AutoevaluacionDocentesNuevo.NOMBRE_C.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.NOMBRE_C.Summary)

				' Asignatura
				AutoevaluacionDocentesNuevo.Asignatura.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Asignatura.Summary)

				' NOMBRE
				AutoevaluacionDocentesNuevo.NOMBRE.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.NOMBRE.Summary)

				' Seccion
				AutoevaluacionDocentesNuevo.Seccion.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Seccion.Summary)

				' Jornada
				AutoevaluacionDocentesNuevo.Jornada.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Jornada.Summary)

				' Periodo
				AutoevaluacionDocentesNuevo.Periodo.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Periodo.Summary)

				' Ano
				AutoevaluacionDocentesNuevo.Ano.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Ano.Summary)

				' fecha
				AutoevaluacionDocentesNuevo.fecha.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.fecha.Summary)
				AutoevaluacionDocentesNuevo.fecha.ViewValue = ew_FormatDateTime(AutoevaluacionDocentesNuevo.fecha.ViewValue, 7)

				' p1
				AutoevaluacionDocentesNuevo.p1.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p1.Summary)

				' p2
				AutoevaluacionDocentesNuevo.p2.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p2.Summary)

				' p3
				AutoevaluacionDocentesNuevo.p3.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p3.Summary)

				' p4
				AutoevaluacionDocentesNuevo.p4.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p4.Summary)

				' p5
				AutoevaluacionDocentesNuevo.p5.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p5.Summary)

				' p6
				AutoevaluacionDocentesNuevo.p6.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p6.Summary)

				' p7
				AutoevaluacionDocentesNuevo.p7.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p7.Summary)

				' p8
				AutoevaluacionDocentesNuevo.p8.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p8.Summary)

				' p9
				AutoevaluacionDocentesNuevo.p9.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p9.Summary)

				' p10
				AutoevaluacionDocentesNuevo.p10.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p10.Summary)

				' p11
				AutoevaluacionDocentesNuevo.p11.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p11.Summary)

				' p12
				AutoevaluacionDocentesNuevo.p12.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p12.Summary)

				' p13
				AutoevaluacionDocentesNuevo.p13.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p13.Summary)

				' p14
				AutoevaluacionDocentesNuevo.p14.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p14.Summary)

				' p15
				AutoevaluacionDocentesNuevo.p15.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p15.Summary)

				' p16
				AutoevaluacionDocentesNuevo.p16.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p16.Summary)

				' p17
				AutoevaluacionDocentesNuevo.p17.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p17.Summary)

				' p18
				AutoevaluacionDocentesNuevo.p18.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p18.Summary)

				' p19
				AutoevaluacionDocentesNuevo.p19.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p19.Summary)

				' p20
				AutoevaluacionDocentesNuevo.p20.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p20.Summary)

				' p21
				AutoevaluacionDocentesNuevo.p21.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p21.Summary)

				' p22
				AutoevaluacionDocentesNuevo.p22.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p22.Summary)

				' p23
				AutoevaluacionDocentesNuevo.p23.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p23.Summary)

				' p24
				AutoevaluacionDocentesNuevo.p24.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p24.Summary)

				' p25
				AutoevaluacionDocentesNuevo.p25.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p25.Summary)

				' observacion
				AutoevaluacionDocentesNuevo.observacion.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.observacion.Summary)
			Else

				' codProf
				AutoevaluacionDocentesNuevo.codProf.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.codProf.CurrentValue)
				AutoevaluacionDocentesNuevo.codProf.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBREPROFESOR
				AutoevaluacionDocentesNuevo.NOMBREPROFESOR.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.NOMBREPROFESOR.CurrentValue)
				AutoevaluacionDocentesNuevo.NOMBREPROFESOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Carrera
				AutoevaluacionDocentesNuevo.Carrera.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Carrera.CurrentValue)
				AutoevaluacionDocentesNuevo.Carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				AutoevaluacionDocentesNuevo.NOMBRE_C.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.NOMBRE_C.CurrentValue)
				AutoevaluacionDocentesNuevo.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Asignatura
				AutoevaluacionDocentesNuevo.Asignatura.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Asignatura.CurrentValue)
				AutoevaluacionDocentesNuevo.Asignatura.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				AutoevaluacionDocentesNuevo.NOMBRE.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.NOMBRE.CurrentValue)
				AutoevaluacionDocentesNuevo.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Seccion
				AutoevaluacionDocentesNuevo.Seccion.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Seccion.CurrentValue)
				AutoevaluacionDocentesNuevo.Seccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Jornada
				AutoevaluacionDocentesNuevo.Jornada.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Jornada.CurrentValue)
				AutoevaluacionDocentesNuevo.Jornada.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Periodo
				AutoevaluacionDocentesNuevo.Periodo.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Periodo.CurrentValue)
				AutoevaluacionDocentesNuevo.Periodo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Ano
				AutoevaluacionDocentesNuevo.Ano.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.Ano.CurrentValue)
				AutoevaluacionDocentesNuevo.Ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' fecha
				AutoevaluacionDocentesNuevo.fecha.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.fecha.CurrentValue)
				AutoevaluacionDocentesNuevo.fecha.ViewValue = ew_FormatDateTime(AutoevaluacionDocentesNuevo.fecha.ViewValue, 7)
				AutoevaluacionDocentesNuevo.fecha.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p1
				AutoevaluacionDocentesNuevo.p1.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p1.CurrentValue)
				AutoevaluacionDocentesNuevo.p1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p2
				AutoevaluacionDocentesNuevo.p2.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p2.CurrentValue)
				AutoevaluacionDocentesNuevo.p2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p3
				AutoevaluacionDocentesNuevo.p3.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p3.CurrentValue)
				AutoevaluacionDocentesNuevo.p3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p4
				AutoevaluacionDocentesNuevo.p4.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p4.CurrentValue)
				AutoevaluacionDocentesNuevo.p4.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p5
				AutoevaluacionDocentesNuevo.p5.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p5.CurrentValue)
				AutoevaluacionDocentesNuevo.p5.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p6
				AutoevaluacionDocentesNuevo.p6.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p6.CurrentValue)
				AutoevaluacionDocentesNuevo.p6.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p7
				AutoevaluacionDocentesNuevo.p7.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p7.CurrentValue)
				AutoevaluacionDocentesNuevo.p7.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p8
				AutoevaluacionDocentesNuevo.p8.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p8.CurrentValue)
				AutoevaluacionDocentesNuevo.p8.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p9
				AutoevaluacionDocentesNuevo.p9.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p9.CurrentValue)
				AutoevaluacionDocentesNuevo.p9.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p10
				AutoevaluacionDocentesNuevo.p10.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p10.CurrentValue)
				AutoevaluacionDocentesNuevo.p10.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p11
				AutoevaluacionDocentesNuevo.p11.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p11.CurrentValue)
				AutoevaluacionDocentesNuevo.p11.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p12
				AutoevaluacionDocentesNuevo.p12.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p12.CurrentValue)
				AutoevaluacionDocentesNuevo.p12.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p13
				AutoevaluacionDocentesNuevo.p13.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p13.CurrentValue)
				AutoevaluacionDocentesNuevo.p13.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p14
				AutoevaluacionDocentesNuevo.p14.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p14.CurrentValue)
				AutoevaluacionDocentesNuevo.p14.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p15
				AutoevaluacionDocentesNuevo.p15.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p15.CurrentValue)
				AutoevaluacionDocentesNuevo.p15.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p16
				AutoevaluacionDocentesNuevo.p16.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p16.CurrentValue)
				AutoevaluacionDocentesNuevo.p16.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p17
				AutoevaluacionDocentesNuevo.p17.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p17.CurrentValue)
				AutoevaluacionDocentesNuevo.p17.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p18
				AutoevaluacionDocentesNuevo.p18.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p18.CurrentValue)
				AutoevaluacionDocentesNuevo.p18.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p19
				AutoevaluacionDocentesNuevo.p19.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p19.CurrentValue)
				AutoevaluacionDocentesNuevo.p19.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p20
				AutoevaluacionDocentesNuevo.p20.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p20.CurrentValue)
				AutoevaluacionDocentesNuevo.p20.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p21
				AutoevaluacionDocentesNuevo.p21.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p21.CurrentValue)
				AutoevaluacionDocentesNuevo.p21.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p22
				AutoevaluacionDocentesNuevo.p22.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p22.CurrentValue)
				AutoevaluacionDocentesNuevo.p22.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p23
				AutoevaluacionDocentesNuevo.p23.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p23.CurrentValue)
				AutoevaluacionDocentesNuevo.p23.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p24
				AutoevaluacionDocentesNuevo.p24.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p24.CurrentValue)
				AutoevaluacionDocentesNuevo.p24.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p25
				AutoevaluacionDocentesNuevo.p25.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.p25.CurrentValue)
				AutoevaluacionDocentesNuevo.p25.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' observacion
				AutoevaluacionDocentesNuevo.observacion.ViewValue = Convert.ToString(AutoevaluacionDocentesNuevo.observacion.CurrentValue)
				AutoevaluacionDocentesNuevo.observacion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' codProf
			AutoevaluacionDocentesNuevo.codProf.HrefValue = ""

			' NOMBREPROFESOR
			AutoevaluacionDocentesNuevo.NOMBREPROFESOR.HrefValue = ""

			' Carrera
			AutoevaluacionDocentesNuevo.Carrera.HrefValue = ""

			' NOMBRE_C
			AutoevaluacionDocentesNuevo.NOMBRE_C.HrefValue = ""

			' Asignatura
			AutoevaluacionDocentesNuevo.Asignatura.HrefValue = ""

			' NOMBRE
			AutoevaluacionDocentesNuevo.NOMBRE.HrefValue = ""

			' Seccion
			AutoevaluacionDocentesNuevo.Seccion.HrefValue = ""

			' Jornada
			AutoevaluacionDocentesNuevo.Jornada.HrefValue = ""

			' Periodo
			AutoevaluacionDocentesNuevo.Periodo.HrefValue = ""

			' Ano
			AutoevaluacionDocentesNuevo.Ano.HrefValue = ""

			' fecha
			AutoevaluacionDocentesNuevo.fecha.HrefValue = ""

			' p1
			AutoevaluacionDocentesNuevo.p1.HrefValue = ""

			' p2
			AutoevaluacionDocentesNuevo.p2.HrefValue = ""

			' p3
			AutoevaluacionDocentesNuevo.p3.HrefValue = ""

			' p4
			AutoevaluacionDocentesNuevo.p4.HrefValue = ""

			' p5
			AutoevaluacionDocentesNuevo.p5.HrefValue = ""

			' p6
			AutoevaluacionDocentesNuevo.p6.HrefValue = ""

			' p7
			AutoevaluacionDocentesNuevo.p7.HrefValue = ""

			' p8
			AutoevaluacionDocentesNuevo.p8.HrefValue = ""

			' p9
			AutoevaluacionDocentesNuevo.p9.HrefValue = ""

			' p10
			AutoevaluacionDocentesNuevo.p10.HrefValue = ""

			' p11
			AutoevaluacionDocentesNuevo.p11.HrefValue = ""

			' p12
			AutoevaluacionDocentesNuevo.p12.HrefValue = ""

			' p13
			AutoevaluacionDocentesNuevo.p13.HrefValue = ""

			' p14
			AutoevaluacionDocentesNuevo.p14.HrefValue = ""

			' p15
			AutoevaluacionDocentesNuevo.p15.HrefValue = ""

			' p16
			AutoevaluacionDocentesNuevo.p16.HrefValue = ""

			' p17
			AutoevaluacionDocentesNuevo.p17.HrefValue = ""

			' p18
			AutoevaluacionDocentesNuevo.p18.HrefValue = ""

			' p19
			AutoevaluacionDocentesNuevo.p19.HrefValue = ""

			' p20
			AutoevaluacionDocentesNuevo.p20.HrefValue = ""

			' p21
			AutoevaluacionDocentesNuevo.p21.HrefValue = ""

			' p22
			AutoevaluacionDocentesNuevo.p22.HrefValue = ""

			' p23
			AutoevaluacionDocentesNuevo.p23.HrefValue = ""

			' p24
			AutoevaluacionDocentesNuevo.p24.HrefValue = ""

			' p25
			AutoevaluacionDocentesNuevo.p25.HrefValue = ""

			' observacion
			AutoevaluacionDocentesNuevo.observacion.HrefValue = ""

			' Call Row_Rendered event
			AutoevaluacionDocentesNuevo.Row_Rendered()
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

			' Field NOMBREPROFESOR
			sSelect = "SELECT DISTINCT [NOMBREPROFESOR] FROM " + AutoevaluacionDocentesNuevo.SqlFrom
			sOrderBy = "[NOMBREPROFESOR] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AutoevaluacionDocentesNuevo.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NOMBRE
			sSelect = "SELECT DISTINCT [NOMBRE] FROM " + AutoevaluacionDocentesNuevo.SqlFrom
			sOrderBy = "[NOMBRE] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AutoevaluacionDocentesNuevo.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AutoevaluacionDocentesNuevo.NOMBRE.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Seccion
			sSelect = "SELECT DISTINCT [Seccion] FROM " + AutoevaluacionDocentesNuevo.SqlFrom
			sOrderBy = "[Seccion] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AutoevaluacionDocentesNuevo.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AutoevaluacionDocentesNuevo.Seccion.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Jornada
			sSelect = "SELECT DISTINCT [Jornada] FROM " + AutoevaluacionDocentesNuevo.SqlFrom
			sOrderBy = "[Jornada] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AutoevaluacionDocentesNuevo.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AutoevaluacionDocentesNuevo.Jornada.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Periodo
			sSelect = "SELECT DISTINCT [Periodo] FROM " + AutoevaluacionDocentesNuevo.SqlFrom
			sOrderBy = "[Periodo] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AutoevaluacionDocentesNuevo.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AutoevaluacionDocentesNuevo.Periodo.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Ano
			sSelect = "SELECT DISTINCT [Ano] FROM " + AutoevaluacionDocentesNuevo.SqlFrom
			sOrderBy = "[Ano] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AutoevaluacionDocentesNuevo.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AutoevaluacionDocentesNuevo.Ano.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field codProf
				SetSessionFilterValues(AutoevaluacionDocentesNuevo.codProf)

				' Field NOMBREPROFESOR
				SetSessionDropDownValue(AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownValue, AutoevaluacionDocentesNuevo.NOMBREPROFESOR)

				' Field Carrera
				SetSessionFilterValues(AutoevaluacionDocentesNuevo.Carrera)

				' Field NOMBRE_C
				SetSessionFilterValues(AutoevaluacionDocentesNuevo.NOMBRE_C)

				' Field Asignatura
				SetSessionFilterValues(AutoevaluacionDocentesNuevo.Asignatura)

				' Field NOMBRE
				SetSessionDropDownValue(AutoevaluacionDocentesNuevo.NOMBRE.DropDownValue, AutoevaluacionDocentesNuevo.NOMBRE)

				' Field Seccion
				SetSessionDropDownValue(AutoevaluacionDocentesNuevo.Seccion.DropDownValue, AutoevaluacionDocentesNuevo.Seccion)

				' Field Jornada
				SetSessionDropDownValue(AutoevaluacionDocentesNuevo.Jornada.DropDownValue, AutoevaluacionDocentesNuevo.Jornada)

				' Field Periodo
				SetSessionDropDownValue(AutoevaluacionDocentesNuevo.Periodo.DropDownValue, AutoevaluacionDocentesNuevo.Periodo)

				' Field Ano
				SetSessionDropDownValue(AutoevaluacionDocentesNuevo.Ano.DropDownValue, AutoevaluacionDocentesNuevo.Ano)
			bSetupFilter = True ' Set up filter required
		Else

				' Field codProf
				If (GetFilterValues(AutoevaluacionDocentesNuevo.codProf)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBREPROFESOR
				If (GetDropDownValue(AutoevaluacionDocentesNuevo.NOMBREPROFESOR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownValue) Then
					If Not ew_SameStr(AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AutoevaluacionDocentesNuevo_NOMBREPROFESOR") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Carrera
				If (GetFilterValues(AutoevaluacionDocentesNuevo.Carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE_C
				If (GetFilterValues(AutoevaluacionDocentesNuevo.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Asignatura
				If (GetFilterValues(AutoevaluacionDocentesNuevo.Asignatura)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetDropDownValue(AutoevaluacionDocentesNuevo.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AutoevaluacionDocentesNuevo.NOMBRE.DropDownValue) Then
					If Not ew_SameStr(AutoevaluacionDocentesNuevo.NOMBRE.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AutoevaluacionDocentesNuevo_NOMBRE") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Seccion
				If (GetDropDownValue(AutoevaluacionDocentesNuevo.Seccion)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AutoevaluacionDocentesNuevo.Seccion.DropDownValue) Then
					If Not ew_SameStr(AutoevaluacionDocentesNuevo.Seccion.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AutoevaluacionDocentesNuevo_Seccion") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Jornada
				If (GetDropDownValue(AutoevaluacionDocentesNuevo.Jornada)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AutoevaluacionDocentesNuevo.Jornada.DropDownValue) Then
					If Not ew_SameStr(AutoevaluacionDocentesNuevo.Jornada.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AutoevaluacionDocentesNuevo_Jornada") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Periodo
				If (GetDropDownValue(AutoevaluacionDocentesNuevo.Periodo)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AutoevaluacionDocentesNuevo.Periodo.DropDownValue) Then
					If Not ew_SameStr(AutoevaluacionDocentesNuevo.Periodo.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AutoevaluacionDocentesNuevo_Periodo") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Ano
				If (GetDropDownValue(AutoevaluacionDocentesNuevo.Ano)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AutoevaluacionDocentesNuevo.Ano.DropDownValue) Then
					If Not ew_SameStr(AutoevaluacionDocentesNuevo.Ano.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AutoevaluacionDocentesNuevo_Ano") Is Nothing Then
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

			' Field codProf
			GetSessionFilterValues(AutoevaluacionDocentesNuevo.codProf)

			' Field NOMBREPROFESOR
			GetSessionDropDownValue(AutoevaluacionDocentesNuevo.NOMBREPROFESOR)

			' Field Carrera
			GetSessionFilterValues(AutoevaluacionDocentesNuevo.Carrera)

			' Field NOMBRE_C
			GetSessionFilterValues(AutoevaluacionDocentesNuevo.NOMBRE_C)

			' Field Asignatura
			GetSessionFilterValues(AutoevaluacionDocentesNuevo.Asignatura)

			' Field NOMBRE
			GetSessionDropDownValue(AutoevaluacionDocentesNuevo.NOMBRE)

			' Field Seccion
			GetSessionDropDownValue(AutoevaluacionDocentesNuevo.Seccion)

			' Field Jornada
			GetSessionDropDownValue(AutoevaluacionDocentesNuevo.Jornada)

			' Field Periodo
			GetSessionDropDownValue(AutoevaluacionDocentesNuevo.Periodo)

			' Field Ano
			GetSessionDropDownValue(AutoevaluacionDocentesNuevo.Ano)
		End If

		' Call page filter validated event
		AutoevaluacionDocentesNuevo.Page_FilterValidated()

		' Build SQL
		' Field codProf

		BuildExtendedFilter(AutoevaluacionDocentesNuevo.codProf, sFilter)

		' Field NOMBREPROFESOR
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.NOMBREPROFESOR, sFilter, "")

		' Field Carrera
		BuildExtendedFilter(AutoevaluacionDocentesNuevo.Carrera, sFilter)

		' Field NOMBRE_C
		BuildExtendedFilter(AutoevaluacionDocentesNuevo.NOMBRE_C, sFilter)

		' Field Asignatura
		BuildExtendedFilter(AutoevaluacionDocentesNuevo.Asignatura, sFilter)

		' Field NOMBRE
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.NOMBRE, sFilter, "")

		' Field Seccion
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.Seccion, sFilter, "")

		' Field Jornada
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.Jornada, sFilter, "")

		' Field Periodo
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.Periodo, sFilter, "")

		' Field Ano
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.Ano, sFilter, "")

		' Save parms to Session
		' Field codProf

		SetSessionFilterValues(AutoevaluacionDocentesNuevo.codProf)

		' Field NOMBREPROFESOR
		SetSessionDropDownValue(AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownValue, AutoevaluacionDocentesNuevo.NOMBREPROFESOR)

		' Field Carrera
		SetSessionFilterValues(AutoevaluacionDocentesNuevo.Carrera)

		' Field NOMBRE_C
		SetSessionFilterValues(AutoevaluacionDocentesNuevo.NOMBRE_C)

		' Field Asignatura
		SetSessionFilterValues(AutoevaluacionDocentesNuevo.Asignatura)

		' Field NOMBRE
		SetSessionDropDownValue(AutoevaluacionDocentesNuevo.NOMBRE.DropDownValue, AutoevaluacionDocentesNuevo.NOMBRE)

		' Field Seccion
		SetSessionDropDownValue(AutoevaluacionDocentesNuevo.Seccion.DropDownValue, AutoevaluacionDocentesNuevo.Seccion)

		' Field Jornada
		SetSessionDropDownValue(AutoevaluacionDocentesNuevo.Jornada.DropDownValue, AutoevaluacionDocentesNuevo.Jornada)

		' Field Periodo
		SetSessionDropDownValue(AutoevaluacionDocentesNuevo.Periodo.DropDownValue, AutoevaluacionDocentesNuevo.Periodo)

		' Field Ano
		SetSessionDropDownValue(AutoevaluacionDocentesNuevo.Ano.DropDownValue, AutoevaluacionDocentesNuevo.Ano)

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
		If ew_Session("sv_AutoevaluacionDocentesNuevo_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_AutoevaluacionDocentesNuevo_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_AutoevaluacionDocentesNuevo_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_AutoevaluacionDocentesNuevo_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_AutoevaluacionDocentesNuevo_" + parm)
		End If
		If ew_Session("so1_AutoevaluacionDocentesNuevo_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_AutoevaluacionDocentesNuevo_" + parm))
		End If
		If ew_Session("sc_AutoevaluacionDocentesNuevo_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_AutoevaluacionDocentesNuevo_" + parm))
		End If
		If ew_Session("sv2_AutoevaluacionDocentesNuevo_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_AutoevaluacionDocentesNuevo_" + parm)
		End If
		If ew_Session("so2_AutoevaluacionDocentesNuevo_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_AutoevaluacionDocentesNuevo_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_AutoevaluacionDocentesNuevo_" + parm) = fld.SearchValue
		ew_Session("so1_AutoevaluacionDocentesNuevo_" + parm) = fld.SearchOperator
		ew_Session("sc_AutoevaluacionDocentesNuevo_" + parm) = fld.SearchCondition
		ew_Session("sv2_AutoevaluacionDocentesNuevo_" + parm) = fld.SearchValue2
		ew_Session("so2_AutoevaluacionDocentesNuevo_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_AutoevaluacionDocentesNuevo_" + parm) = ""
		ew_Session("so1_AutoevaluacionDocentesNuevo_" + parm) = "="
		ew_Session("sc_AutoevaluacionDocentesNuevo_" + parm) = "AND"
		ew_Session("sv2_AutoevaluacionDocentesNuevo_" + parm) = ""
		ew_Session("so2_AutoevaluacionDocentesNuevo_" + parm) = "="
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
		ew_Session("sel_AutoevaluacionDocentesNuevo_" & parm) = ""
		ew_Session("rf_AutoevaluacionDocentesNuevo_" & parm) = ""
		ew_Session("rt_AutoevaluacionDocentesNuevo_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = AutoevaluacionDocentesNuevo.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_AutoevaluacionDocentesNuevo_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_AutoevaluacionDocentesNuevo_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_AutoevaluacionDocentesNuevo_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBREPROFESOR

			AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DefaultDropDownValue = EWRPT_INIT_VALUE
			AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownValue = AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DefaultDropDownValue

			' Field NOMBRE
			AutoevaluacionDocentesNuevo.NOMBRE.DefaultDropDownValue = EWRPT_INIT_VALUE
			AutoevaluacionDocentesNuevo.NOMBRE.DropDownValue = AutoevaluacionDocentesNuevo.NOMBRE.DefaultDropDownValue

			' Field Seccion
			AutoevaluacionDocentesNuevo.Seccion.DefaultDropDownValue = EWRPT_INIT_VALUE
			AutoevaluacionDocentesNuevo.Seccion.DropDownValue = AutoevaluacionDocentesNuevo.Seccion.DefaultDropDownValue

			' Field Jornada
			AutoevaluacionDocentesNuevo.Jornada.DefaultDropDownValue = EWRPT_INIT_VALUE
			AutoevaluacionDocentesNuevo.Jornada.DropDownValue = AutoevaluacionDocentesNuevo.Jornada.DefaultDropDownValue

			' Field Periodo
			AutoevaluacionDocentesNuevo.Periodo.DefaultDropDownValue = EWRPT_INIT_VALUE
			AutoevaluacionDocentesNuevo.Periodo.DropDownValue = AutoevaluacionDocentesNuevo.Periodo.DefaultDropDownValue

			' Field Ano
			AutoevaluacionDocentesNuevo.Ano.DefaultDropDownValue = EWRPT_INIT_VALUE
			AutoevaluacionDocentesNuevo.Ano.DropDownValue = AutoevaluacionDocentesNuevo.Ano.DefaultDropDownValue

		' Set up default values for extended filters
			' Field codProf

			SetDefaultExtFilter(AutoevaluacionDocentesNuevo.codProf, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AutoevaluacionDocentesNuevo.codProf)	

			' Field Carrera
			SetDefaultExtFilter(AutoevaluacionDocentesNuevo.Carrera, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AutoevaluacionDocentesNuevo.Carrera)	

			' Field NOMBRE_C
			SetDefaultExtFilter(AutoevaluacionDocentesNuevo.NOMBRE_C, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AutoevaluacionDocentesNuevo.NOMBRE_C)	

			' Field Asignatura
			SetDefaultExtFilter(AutoevaluacionDocentesNuevo.Asignatura, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AutoevaluacionDocentesNuevo.Asignatura)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check codProf extended filter
		If (TextFilterApplied(AutoevaluacionDocentesNuevo.codProf)) Then bFilterExist = True

		' Check NOMBREPROFESOR dropdown filter
		If (NonTextFilterApplied(AutoevaluacionDocentesNuevo.NOMBREPROFESOR)) Then bFilterExist = True

		' Check Carrera extended filter
		If (TextFilterApplied(AutoevaluacionDocentesNuevo.Carrera)) Then bFilterExist = True

		' Check NOMBRE_C extended filter
		If (TextFilterApplied(AutoevaluacionDocentesNuevo.NOMBRE_C)) Then bFilterExist = True

		' Check Asignatura extended filter
		If (TextFilterApplied(AutoevaluacionDocentesNuevo.Asignatura)) Then bFilterExist = True

		' Check NOMBRE dropdown filter
		If (NonTextFilterApplied(AutoevaluacionDocentesNuevo.NOMBRE)) Then bFilterExist = True

		' Check Seccion dropdown filter
		If (NonTextFilterApplied(AutoevaluacionDocentesNuevo.Seccion)) Then bFilterExist = True

		' Check Jornada dropdown filter
		If (NonTextFilterApplied(AutoevaluacionDocentesNuevo.Jornada)) Then bFilterExist = True

		' Check Periodo dropdown filter
		If (NonTextFilterApplied(AutoevaluacionDocentesNuevo.Periodo)) Then bFilterExist = True

		' Check Ano dropdown filter
		If (NonTextFilterApplied(AutoevaluacionDocentesNuevo.Ano)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field codProf
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AutoevaluacionDocentesNuevo.codProf, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.codProf.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBREPROFESOR
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.NOMBREPROFESOR, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.NOMBREPROFESOR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Carrera
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AutoevaluacionDocentesNuevo.Carrera, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.Carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AutoevaluacionDocentesNuevo.NOMBRE_C, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Asignatura
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AutoevaluacionDocentesNuevo.Asignatura, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.Asignatura.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.NOMBRE, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Seccion
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.Seccion, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.Seccion.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Jornada
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.Jornada, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.Jornada.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Periodo
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.Periodo, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.Periodo.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Ano
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AutoevaluacionDocentesNuevo.Ano, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AutoevaluacionDocentesNuevo.Ano.FldCaption() & "<br>"
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
				AutoevaluacionDocentesNuevo.OrderBy = ""
				AutoevaluacionDocentesNuevo.StartGroup = 1
				AutoevaluacionDocentesNuevo.codProf.Sort = ""
				AutoevaluacionDocentesNuevo.NOMBREPROFESOR.Sort = ""
				AutoevaluacionDocentesNuevo.Carrera.Sort = ""
				AutoevaluacionDocentesNuevo.NOMBRE_C.Sort = ""
				AutoevaluacionDocentesNuevo.Asignatura.Sort = ""
				AutoevaluacionDocentesNuevo.NOMBRE.Sort = ""
				AutoevaluacionDocentesNuevo.Seccion.Sort = ""
				AutoevaluacionDocentesNuevo.Jornada.Sort = ""
				AutoevaluacionDocentesNuevo.Periodo.Sort = ""
				AutoevaluacionDocentesNuevo.Ano.Sort = ""
				AutoevaluacionDocentesNuevo.fecha.Sort = ""
				AutoevaluacionDocentesNuevo.p1.Sort = ""
				AutoevaluacionDocentesNuevo.p2.Sort = ""
				AutoevaluacionDocentesNuevo.p3.Sort = ""
				AutoevaluacionDocentesNuevo.p4.Sort = ""
				AutoevaluacionDocentesNuevo.p5.Sort = ""
				AutoevaluacionDocentesNuevo.p6.Sort = ""
				AutoevaluacionDocentesNuevo.p7.Sort = ""
				AutoevaluacionDocentesNuevo.p8.Sort = ""
				AutoevaluacionDocentesNuevo.p9.Sort = ""
				AutoevaluacionDocentesNuevo.p10.Sort = ""
				AutoevaluacionDocentesNuevo.p11.Sort = ""
				AutoevaluacionDocentesNuevo.p12.Sort = ""
				AutoevaluacionDocentesNuevo.p13.Sort = ""
				AutoevaluacionDocentesNuevo.p14.Sort = ""
				AutoevaluacionDocentesNuevo.p15.Sort = ""
				AutoevaluacionDocentesNuevo.p16.Sort = ""
				AutoevaluacionDocentesNuevo.p17.Sort = ""
				AutoevaluacionDocentesNuevo.p18.Sort = ""
				AutoevaluacionDocentesNuevo.p19.Sort = ""
				AutoevaluacionDocentesNuevo.p20.Sort = ""
				AutoevaluacionDocentesNuevo.p21.Sort = ""
				AutoevaluacionDocentesNuevo.p22.Sort = ""
				AutoevaluacionDocentesNuevo.p23.Sort = ""
				AutoevaluacionDocentesNuevo.p24.Sort = ""
				AutoevaluacionDocentesNuevo.p25.Sort = ""
				AutoevaluacionDocentesNuevo.observacion.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			AutoevaluacionDocentesNuevo.CurrentOrder = ew_Get("order")
			AutoevaluacionDocentesNuevo.CurrentOrderType = ew_Get("ordertype")
			sSortSql = AutoevaluacionDocentesNuevo.SortSql()
			AutoevaluacionDocentesNuevo.OrderBy = sSortSql
			AutoevaluacionDocentesNuevo.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(AutoevaluacionDocentesNuevo.OrderBy)) Then
			AutoevaluacionDocentesNuevo.OrderBy = "[Carrera] ASC"
			AutoevaluacionDocentesNuevo.Carrera.Sort = "ASC"
		End If
		Return AutoevaluacionDocentesNuevo.OrderBy
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
		AutoevaluacionDocentesNuevo_summary = New crAutoevaluacionDocentesNuevo_summary(Me)
		AutoevaluacionDocentesNuevo_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		AutoevaluacionDocentesNuevo_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (AutoevaluacionDocentesNuevo_summary IsNot Nothing) Then AutoevaluacionDocentesNuevo_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var AutoevaluacionDocentesNuevo_summary = new ewrpt_Page("AutoevaluacionDocentesNuevo_summary");
// page properties
AutoevaluacionDocentesNuevo_summary.PageID = "summary"; // page ID
AutoevaluacionDocentesNuevo_summary.FormID = "fAutoevaluacionDocentesNuevosummaryfilter"; // form ID
var EWRPT_PAGE_ID = AutoevaluacionDocentesNuevo_summary.PageID;
// extend page with ValidateForm function
AutoevaluacionDocentesNuevo_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
AutoevaluacionDocentesNuevo_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
AutoevaluacionDocentesNuevo_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
AutoevaluacionDocentesNuevo_summary.ValidateRequired = false; // no JavaScript validation
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
<% AutoevaluacionDocentesNuevo_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="ewTitle"><h1><%= AutoevaluacionDocentesNuevo.TableCaption() %></h1>
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= AutoevaluacionDocentesNuevo_summary.ExportExcelUrl %>"><img src="images/excel.png" /></a>
<% If (AutoevaluacionDocentesNuevo_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="AutoevaluacionDocentesNuevosmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% AutoevaluacionDocentesNuevo_summary.ShowMessage() %>
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (AutoevaluacionDocentesNuevo.FilterPanelOption = 2 OrElse (AutoevaluacionDocentesNuevo.FilterPanelOption = 3 AndAlso AutoevaluacionDocentesNuevo_summary.FilterApplied) OrElse AutoevaluacionDocentesNuevo_summary.Filter = "0=101") Then
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
<form name="fAutoevaluacionDocentesNuevosummaryfilter" id="fAutoevaluacionDocentesNuevosummaryfilter" action="AutoevaluacionDocentesNuevosmry.aspx" class="ewForm" onsubmit="return AutoevaluacionDocentesNuevo_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = AutoevaluacionDocentesNuevo.Asignatura.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.codProf.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_codProf" id="so1_codProf" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_codProf" id="sv1_codProf" size="30" maxlength="50" value="<%= ew_HtmlEncode(AutoevaluacionDocentesNuevo.codProf.SearchValue) %>"<%= IIf(AutoevaluacionDocentesNuevo_summary.ClearExtFilter = "AutoevaluacionDocentesNuevo_codProf", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.NOMBREPROFESOR.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBREPROFESOR" id="sv_NOMBREPROFESOR"<%= IIf(AutoevaluacionDocentesNuevo_summary.ClearExtFilter = "AutoevaluacionDocentesNuevo_NOMBREPROFESOR", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AutoevaluacionDocentesNuevo.NOMBREPROFESOR.CustomFilters.Count + AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AutoevaluacionDocentesNuevo.NOMBREPROFESOR.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBREPROFESOR")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.NOMBREPROFESOR.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.Carrera.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_Carrera" id="so1_Carrera" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Carrera" id="sv1_Carrera" size="30" maxlength="50" value="<%= ew_HtmlEncode(AutoevaluacionDocentesNuevo.Carrera.SearchValue) %>"<%= IIf(AutoevaluacionDocentesNuevo_summary.ClearExtFilter = "AutoevaluacionDocentesNuevo_Carrera", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.NOMBRE_C.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_NOMBRE_C" id="so1_NOMBRE_C" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE_C" id="sv1_NOMBRE_C" size="30" maxlength="300" value="<%= ew_HtmlEncode(AutoevaluacionDocentesNuevo.NOMBRE_C.SearchValue) %>"<%= IIf(AutoevaluacionDocentesNuevo_summary.ClearExtFilter = "AutoevaluacionDocentesNuevo_NOMBRE_C", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.Asignatura.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_Asignatura" id="so1_Asignatura" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Asignatura" id="sv1_Asignatura" size="30" maxlength="50" value="<%= ew_HtmlEncode(AutoevaluacionDocentesNuevo.Asignatura.SearchValue) %>"<%= IIf(AutoevaluacionDocentesNuevo_summary.ClearExtFilter = "AutoevaluacionDocentesNuevo_Asignatura", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.NOMBRE.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE" id="sv_NOMBRE"<%= IIf(AutoevaluacionDocentesNuevo_summary.ClearExtFilter = "AutoevaluacionDocentesNuevo_NOMBRE", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.NOMBRE.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AutoevaluacionDocentesNuevo.NOMBRE.CustomFilters.Count + AutoevaluacionDocentesNuevo.NOMBRE.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AutoevaluacionDocentesNuevo.NOMBRE.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.NOMBRE.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AutoevaluacionDocentesNuevo.NOMBRE.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.NOMBRE.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.Seccion.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = AutoevaluacionDocentesNuevo.Seccion.CustomFilters.Count + AutoevaluacionDocentesNuevo.Seccion.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AutoevaluacionDocentesNuevo.Seccion.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Seccion")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="AutoevaluacionDocentesNuevo.Seccion.DropDownValue" id="AutoevaluacionDocentesNuevo.Seccion.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.Seccion.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AutoevaluacionDocentesNuevo.Seccion.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Seccion" id="sv_Seccion" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.Seccion.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.Jornada.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = AutoevaluacionDocentesNuevo.Jornada.CustomFilters.Count + AutoevaluacionDocentesNuevo.Jornada.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AutoevaluacionDocentesNuevo.Jornada.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Jornada")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="AutoevaluacionDocentesNuevo.Jornada.DropDownValue" id="AutoevaluacionDocentesNuevo.Jornada.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.Jornada.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AutoevaluacionDocentesNuevo.Jornada.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Jornada" id="sv_Jornada" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.Jornada.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.Periodo.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = AutoevaluacionDocentesNuevo.Periodo.CustomFilters.Count + AutoevaluacionDocentesNuevo.Periodo.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AutoevaluacionDocentesNuevo.Periodo.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Periodo")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="AutoevaluacionDocentesNuevo.Periodo.DropDownValue" id="AutoevaluacionDocentesNuevo.Periodo.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.Periodo.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AutoevaluacionDocentesNuevo.Periodo.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Periodo" id="sv_Periodo" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.Periodo.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AutoevaluacionDocentesNuevo.Ano.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = AutoevaluacionDocentesNuevo.Ano.CustomFilters.Count + AutoevaluacionDocentesNuevo.Ano.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AutoevaluacionDocentesNuevo.Ano.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Ano")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="AutoevaluacionDocentesNuevo.Ano.DropDownValue" id="AutoevaluacionDocentesNuevo.Ano.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.Ano.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AutoevaluacionDocentesNuevo.Ano.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Ano" id="sv_Ano" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AutoevaluacionDocentesNuevo.Ano.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (AutoevaluacionDocentesNuevo.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% AutoevaluacionDocentesNuevo_summary.ShowFilterList() %>
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
If (AutoevaluacionDocentesNuevo.ExportAll AndAlso ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then
	AutoevaluacionDocentesNuevo_summary.StopGrp = AutoevaluacionDocentesNuevo_summary.TotalGrps
Else
	AutoevaluacionDocentesNuevo_summary.StopGrp = AutoevaluacionDocentesNuevo_summary.StartGrp + AutoevaluacionDocentesNuevo_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (AutoevaluacionDocentesNuevo_summary.StopGrp > AutoevaluacionDocentesNuevo_summary.TotalGrps) Then
	AutoevaluacionDocentesNuevo_summary.StopGrp = AutoevaluacionDocentesNuevo_summary.TotalGrps
End If
AutoevaluacionDocentesNuevo_summary.RecCount = 0

' Get first row
If (AutoevaluacionDocentesNuevo_summary.TotalGrps > 0) Then
	AutoevaluacionDocentesNuevo_summary.GetRow() ' ASPXRPT
	AutoevaluacionDocentesNuevo_summary.GrpCount = 1
End If
While ((AutoevaluacionDocentesNuevo_summary.HasRow AndAlso AutoevaluacionDocentesNuevo_summary.GrpIndex < AutoevaluacionDocentesNuevo_summary.StopGrp) OrElse AutoevaluacionDocentesNuevo_summary.ShowFirstHeader)

	' Show header
	If (AutoevaluacionDocentesNuevo_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.codProf.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.codProf))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.codProf.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.codProf) %>',0);"><%= AutoevaluacionDocentesNuevo.codProf.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.codProf.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.codProf.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.NOMBREPROFESOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.NOMBREPROFESOR))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.NOMBREPROFESOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.NOMBREPROFESOR) %>',0);"><%= AutoevaluacionDocentesNuevo.NOMBREPROFESOR.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.NOMBREPROFESOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.NOMBREPROFESOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.Carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Carrera))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.Carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Carrera) %>',0);"><%= AutoevaluacionDocentesNuevo.Carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.Carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.Carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.NOMBRE_C) %>',0);"><%= AutoevaluacionDocentesNuevo.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.Asignatura.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Asignatura))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.Asignatura.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Asignatura) %>',0);"><%= AutoevaluacionDocentesNuevo.Asignatura.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.Asignatura.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.Asignatura.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.NOMBRE) %>',0);"><%= AutoevaluacionDocentesNuevo.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.Seccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Seccion))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.Seccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Seccion) %>',0);"><%= AutoevaluacionDocentesNuevo.Seccion.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.Seccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.Seccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.Jornada.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Jornada))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.Jornada.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Jornada) %>',0);"><%= AutoevaluacionDocentesNuevo.Jornada.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.Jornada.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.Jornada.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.Periodo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Periodo))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.Periodo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Periodo) %>',0);"><%= AutoevaluacionDocentesNuevo.Periodo.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.Periodo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.Periodo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.Ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Ano))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.Ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.Ano) %>',0);"><%= AutoevaluacionDocentesNuevo.Ano.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.Ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.Ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.fecha.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.fecha))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.fecha.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.fecha) %>',0);"><%= AutoevaluacionDocentesNuevo.fecha.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.fecha.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.fecha.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p1))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p1) %>',0);"><%= AutoevaluacionDocentesNuevo.p1.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p2))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p2) %>',0);"><%= AutoevaluacionDocentesNuevo.p2.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p3))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p3) %>',0);"><%= AutoevaluacionDocentesNuevo.p3.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p4.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p4))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p4.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p4) %>',0);"><%= AutoevaluacionDocentesNuevo.p4.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p4.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p4.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p5.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p5))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p5.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p5) %>',0);"><%= AutoevaluacionDocentesNuevo.p5.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p5.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p5.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p6.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p6))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p6.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p6) %>',0);"><%= AutoevaluacionDocentesNuevo.p6.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p6.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p6.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p7.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p7))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p7.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p7) %>',0);"><%= AutoevaluacionDocentesNuevo.p7.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p7.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p7.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p8.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p8))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p8.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p8) %>',0);"><%= AutoevaluacionDocentesNuevo.p8.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p8.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p8.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p9.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p9))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p9.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p9) %>',0);"><%= AutoevaluacionDocentesNuevo.p9.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p9.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p9.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p10.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p10))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p10.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p10) %>',0);"><%= AutoevaluacionDocentesNuevo.p10.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p10.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p10.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p11.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p11))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p11.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p11) %>',0);"><%= AutoevaluacionDocentesNuevo.p11.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p11.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p11.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p12.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p12))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p12.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p12) %>',0);"><%= AutoevaluacionDocentesNuevo.p12.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p12.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p12.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p13.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p13))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p13.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p13) %>',0);"><%= AutoevaluacionDocentesNuevo.p13.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p13.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p13.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p14.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p14))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p14.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p14) %>',0);"><%= AutoevaluacionDocentesNuevo.p14.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p14.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p14.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p15.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p15))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p15.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p15) %>',0);"><%= AutoevaluacionDocentesNuevo.p15.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p15.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p15.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p16.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p16))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p16.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p16) %>',0);"><%= AutoevaluacionDocentesNuevo.p16.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p16.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p16.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p17.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p17))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p17.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p17) %>',0);"><%= AutoevaluacionDocentesNuevo.p17.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p17.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p17.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p18.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p18))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p18.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p18) %>',0);"><%= AutoevaluacionDocentesNuevo.p18.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p18.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p18.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p19.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p19))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p19.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p19) %>',0);"><%= AutoevaluacionDocentesNuevo.p19.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p19.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p19.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p20.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p20))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p20.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p20) %>',0);"><%= AutoevaluacionDocentesNuevo.p20.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p20.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p20.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p21.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p21))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p21.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p21) %>',0);"><%= AutoevaluacionDocentesNuevo.p21.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p21.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p21.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p22.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p22))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p22.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p22) %>',0);"><%= AutoevaluacionDocentesNuevo.p22.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p22.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p22.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p23.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p23))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p23.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p23) %>',0);"><%= AutoevaluacionDocentesNuevo.p23.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p23.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p23.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p24.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p24))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p24.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p24) %>',0);"><%= AutoevaluacionDocentesNuevo.p24.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p24.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p24.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.p25.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p25))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.p25.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.p25) %>',0);"><%= AutoevaluacionDocentesNuevo.p25.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.p25.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.p25.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AutoevaluacionDocentesNuevo.Export)) Then %>
<%= AutoevaluacionDocentesNuevo.observacion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.observacion))) Then %>
		<td style="vertical-align: bottom;"><%= AutoevaluacionDocentesNuevo.observacion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AutoevaluacionDocentesNuevo.SortUrl(AutoevaluacionDocentesNuevo.observacion) %>',0);"><%= AutoevaluacionDocentesNuevo.observacion.FldCaption() %></td><td style="width: 10px;">
		<% If (AutoevaluacionDocentesNuevo.observacion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AutoevaluacionDocentesNuevo.observacion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		AutoevaluacionDocentesNuevo_summary.ShowFirstHeader = False
	End If
	AutoevaluacionDocentesNuevo_summary.RecCount += 1

		' Render detail row
		AutoevaluacionDocentesNuevo.ResetCSS()
		AutoevaluacionDocentesNuevo.RowType = EWRPT_ROWTYPE_DETAIL
		AutoevaluacionDocentesNuevo_summary.RenderRow()
%>
	<tr<%= AutoevaluacionDocentesNuevo.RowAttributes() %>>
		<td<%= AutoevaluacionDocentesNuevo.codProf.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.codProf.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.codProf.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.NOMBREPROFESOR.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.NOMBREPROFESOR.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.NOMBREPROFESOR.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.Carrera.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.Carrera.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.Carrera.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.NOMBRE_C.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.NOMBRE_C.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.Asignatura.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.Asignatura.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.Asignatura.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.NOMBRE.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.NOMBRE.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.NOMBRE.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.Seccion.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.Seccion.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.Seccion.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.Jornada.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.Jornada.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.Jornada.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.Periodo.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.Periodo.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.Periodo.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.Ano.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.Ano.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.Ano.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.fecha.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.fecha.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.fecha.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p1.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p1.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p1.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p2.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p2.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p2.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p3.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p3.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p3.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p4.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p4.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p4.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p5.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p5.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p5.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p6.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p6.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p6.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p7.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p7.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p7.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p8.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p8.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p8.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p9.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p9.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p9.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p10.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p10.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p10.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p11.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p11.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p11.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p12.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p12.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p12.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p13.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p13.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p13.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p14.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p14.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p14.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p15.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p15.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p15.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p16.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p16.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p16.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p17.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p17.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p17.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p18.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p18.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p18.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p19.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p19.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p19.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p20.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p20.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p20.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p21.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p21.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p21.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p22.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p22.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p22.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p23.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p23.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p23.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p24.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p24.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p24.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.p25.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.p25.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.p25.ListViewValue%></div>
</td>
		<td<%= AutoevaluacionDocentesNuevo.observacion.CellAttributes %>>
<div<%= AutoevaluacionDocentesNuevo.observacion.ViewAttributes%>><%= AutoevaluacionDocentesNuevo.observacion.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		AutoevaluacionDocentesNuevo_summary.AccumulateSummary()

		' Get next record
		AutoevaluacionDocentesNuevo_summary.GetRow() ' ASPXRPT
		AutoevaluacionDocentesNuevo_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (AutoevaluacionDocentesNuevo_summary.TotalGrps > 0) Then
	AutoevaluacionDocentesNuevo.ResetCSS()
	AutoevaluacionDocentesNuevo.RowType = EWRPT_ROWTYPE_TOTAL
	AutoevaluacionDocentesNuevo.RowTotalType = EWRPT_ROWTOTAL_GRAND
	AutoevaluacionDocentesNuevo.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	AutoevaluacionDocentesNuevo.RowAttrs("class") = "ewRptGrandSummary"
	AutoevaluacionDocentesNuevo_summary.RenderRow()
%>
	<!-- tr><td colspan="37"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= AutoevaluacionDocentesNuevo.RowAttributes() %>><td colspan="37"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(AutoevaluacionDocentesNuevo_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If AutoevaluacionDocentesNuevo_summary.Pager Is Nothing Then AutoevaluacionDocentesNuevo_summary.Pager = New cPrevNextPager(AutoevaluacionDocentesNuevo_summary.StartGrp, AutoevaluacionDocentesNuevo_summary.DisplayGrps, AutoevaluacionDocentesNuevo_summary.TotalGrps) %>
<% If AutoevaluacionDocentesNuevo_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If AutoevaluacionDocentesNuevo_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="AutoevaluacionDocentesNuevosmry.aspx?start=<%= AutoevaluacionDocentesNuevo_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If AutoevaluacionDocentesNuevo_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="AutoevaluacionDocentesNuevosmry.aspx?start=<%= AutoevaluacionDocentesNuevo_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= AutoevaluacionDocentesNuevo_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If AutoevaluacionDocentesNuevo_summary.Pager.NextButton.Enabled Then %>
	<td><a href="AutoevaluacionDocentesNuevosmry.aspx?start=<%= AutoevaluacionDocentesNuevo_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If AutoevaluacionDocentesNuevo_summary.Pager.LastButton.Enabled Then %>
	<td><a href="AutoevaluacionDocentesNuevosmry.aspx?start=<%= AutoevaluacionDocentesNuevo_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= AutoevaluacionDocentesNuevo_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= AutoevaluacionDocentesNuevo_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= AutoevaluacionDocentesNuevo_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= AutoevaluacionDocentesNuevo_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If AutoevaluacionDocentesNuevo_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (AutoevaluacionDocentesNuevo_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If AutoevaluacionDocentesNuevo_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="15"<% If AutoevaluacionDocentesNuevo_summary.DisplayGrps = 15 Then Response.Write(" selected=""selected""") %>>15</option>
<option value="20"<% If AutoevaluacionDocentesNuevo_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If AutoevaluacionDocentesNuevo_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
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
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% AutoevaluacionDocentesNuevo_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (AutoevaluacionDocentesNuevo.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
