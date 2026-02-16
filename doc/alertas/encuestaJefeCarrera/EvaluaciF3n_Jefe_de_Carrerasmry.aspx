<%@ Page ClassName="EvaluaciF3n_Jefe_de_Carrerasmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_encuesta_jefecarrera" %>
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
	Public EvaluaciF3n_Jefe_de_Carrera As crEvaluaciF3n_Jefe_de_Carrera = Nothing

	'
	' Table class (for Evaluación Jefe de Carrera)
	'
	Public Class crEvaluaciF3n_Jefe_de_Carrera
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
				Return "EvaluaciF3n_Jefe_de_Carrera"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Evaluación Jefe de Carrera"
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

		Public responsable As crField

		Public fecha As crField

		Public profesor As crField

		Public codprofesor As crField

		Public contrato As crField

		Public ano As crField

		Public periodo As crField

		Public carrera As crField

		Public codcarrera As crField

		Public ramo As crField

		Public codramo As crField

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

			' responsable
			responsable = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_responsable", "responsable", "[responsable]", 200, EWRPT_DATATYPE_STRING, -1)
			responsable.Page = APage
			responsable.ParentPage = APage.ParentPage
			responsable.GroupingFieldId = 1
			Fields.Add("responsable", responsable)
			responsable.DateFilter = ""
			responsable.SqlSelect = ""
			responsable.SqlOrderBy = ""
			responsable.FldGroupByType = ""
			responsable.FldGroupInt = "0"
			responsable.FldGroupSql = ""

			' fecha
			fecha = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_fecha", "fecha", "[fecha]", 135, EWRPT_DATATYPE_DATE, 7)
			fecha.Page = APage
			fecha.ParentPage = APage.ParentPage
			fecha.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("fecha", fecha)
			fecha.DateFilter = ""
			fecha.SqlSelect = ""
			fecha.SqlOrderBy = ""

			' profesor
			profesor = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_profesor", "profesor", "[profesor]", 200, EWRPT_DATATYPE_STRING, -1)
			profesor.Page = APage
			profesor.ParentPage = APage.ParentPage
			Fields.Add("profesor", profesor)
			profesor.DateFilter = ""
			profesor.SqlSelect = ""
			profesor.SqlOrderBy = ""

			' codprofesor
			codprofesor = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_codprofesor", "codprofesor", "[codprofesor]", 200, EWRPT_DATATYPE_STRING, -1)
			codprofesor.Page = APage
			codprofesor.ParentPage = APage.ParentPage
			Fields.Add("codprofesor", codprofesor)
			codprofesor.DateFilter = ""
			codprofesor.SqlSelect = ""
			codprofesor.SqlOrderBy = ""

			' contrato
			contrato = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_contrato", "contrato", "[contrato]", 200, EWRPT_DATATYPE_STRING, -1)
			contrato.Page = APage
			contrato.ParentPage = APage.ParentPage
			Fields.Add("contrato", contrato)
			contrato.DateFilter = ""
			contrato.SqlSelect = ""
			contrato.SqlOrderBy = ""

			' ano
			ano = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_ano", "ano", "[ano]", 200, EWRPT_DATATYPE_STRING, -1)
			ano.Page = APage
			ano.ParentPage = APage.ParentPage
			Fields.Add("ano", ano)
			ano.DateFilter = ""
			ano.SqlSelect = ""
			ano.SqlOrderBy = ""

			' periodo
			periodo = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_periodo", "periodo", "[periodo]", 3, EWRPT_DATATYPE_NUMBER, -1)
			periodo.Page = APage
			periodo.ParentPage = APage.ParentPage
			periodo.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("periodo", periodo)
			periodo.DateFilter = ""
			periodo.SqlSelect = ""
			periodo.SqlOrderBy = ""

			' carrera
			carrera = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_carrera", "carrera", "[carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			carrera.Page = APage
			carrera.ParentPage = APage.ParentPage
			Fields.Add("carrera", carrera)
			carrera.DateFilter = ""
			carrera.SqlSelect = ""
			carrera.SqlOrderBy = ""

			' codcarrera
			codcarrera = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_codcarrera", "codcarrera", "[codcarrera]", 200, EWRPT_DATATYPE_STRING, -1)
			codcarrera.Page = APage
			codcarrera.ParentPage = APage.ParentPage
			Fields.Add("codcarrera", codcarrera)
			codcarrera.DateFilter = ""
			codcarrera.SqlSelect = ""
			codcarrera.SqlOrderBy = ""

			' ramo
			ramo = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_ramo", "ramo", "[ramo]", 200, EWRPT_DATATYPE_STRING, -1)
			ramo.Page = APage
			ramo.ParentPage = APage.ParentPage
			Fields.Add("ramo", ramo)
			ramo.DateFilter = ""
			ramo.SqlSelect = ""
			ramo.SqlOrderBy = ""

			' codramo
			codramo = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_codramo", "codramo", "[codramo]", 200, EWRPT_DATATYPE_STRING, -1)
			codramo.Page = APage
			codramo.ParentPage = APage.ParentPage
			Fields.Add("codramo", codramo)
			codramo.DateFilter = ""
			codramo.SqlSelect = ""
			codramo.SqlOrderBy = ""

			' p1
			p1 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p1", "p1", "[p1]", 200, EWRPT_DATATYPE_STRING, -1)
			p1.Page = APage
			p1.ParentPage = APage.ParentPage
			Fields.Add("p1", p1)
			p1.DateFilter = ""
			p1.SqlSelect = ""
			p1.SqlOrderBy = ""

			' p2
			p2 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p2", "p2", "[p2]", 200, EWRPT_DATATYPE_STRING, -1)
			p2.Page = APage
			p2.ParentPage = APage.ParentPage
			Fields.Add("p2", p2)
			p2.DateFilter = ""
			p2.SqlSelect = ""
			p2.SqlOrderBy = ""

			' p3
			p3 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p3", "p3", "[p3]", 200, EWRPT_DATATYPE_STRING, -1)
			p3.Page = APage
			p3.ParentPage = APage.ParentPage
			Fields.Add("p3", p3)
			p3.DateFilter = ""
			p3.SqlSelect = ""
			p3.SqlOrderBy = ""

			' p4
			p4 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p4", "p4", "[p4]", 200, EWRPT_DATATYPE_STRING, -1)
			p4.Page = APage
			p4.ParentPage = APage.ParentPage
			Fields.Add("p4", p4)
			p4.DateFilter = ""
			p4.SqlSelect = ""
			p4.SqlOrderBy = ""

			' p5
			p5 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p5", "p5", "[p5]", 200, EWRPT_DATATYPE_STRING, -1)
			p5.Page = APage
			p5.ParentPage = APage.ParentPage
			Fields.Add("p5", p5)
			p5.DateFilter = ""
			p5.SqlSelect = ""
			p5.SqlOrderBy = ""

			' p6
			p6 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p6", "p6", "[p6]", 200, EWRPT_DATATYPE_STRING, -1)
			p6.Page = APage
			p6.ParentPage = APage.ParentPage
			Fields.Add("p6", p6)
			p6.DateFilter = ""
			p6.SqlSelect = ""
			p6.SqlOrderBy = ""

			' p7
			p7 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p7", "p7", "[p7]", 200, EWRPT_DATATYPE_STRING, -1)
			p7.Page = APage
			p7.ParentPage = APage.ParentPage
			Fields.Add("p7", p7)
			p7.DateFilter = ""
			p7.SqlSelect = ""
			p7.SqlOrderBy = ""

			' p8
			p8 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p8", "p8", "[p8]", 200, EWRPT_DATATYPE_STRING, -1)
			p8.Page = APage
			p8.ParentPage = APage.ParentPage
			Fields.Add("p8", p8)
			p8.DateFilter = ""
			p8.SqlSelect = ""
			p8.SqlOrderBy = ""

			' p9
			p9 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p9", "p9", "[p9]", 200, EWRPT_DATATYPE_STRING, -1)
			p9.Page = APage
			p9.ParentPage = APage.ParentPage
			Fields.Add("p9", p9)
			p9.DateFilter = ""
			p9.SqlSelect = ""
			p9.SqlOrderBy = ""

			' p10
			p10 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p10", "p10", "[p10]", 200, EWRPT_DATATYPE_STRING, -1)
			p10.Page = APage
			p10.ParentPage = APage.ParentPage
			Fields.Add("p10", p10)
			p10.DateFilter = ""
			p10.SqlSelect = ""
			p10.SqlOrderBy = ""

			' p11
			p11 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p11", "p11", "[p11]", 200, EWRPT_DATATYPE_STRING, -1)
			p11.Page = APage
			p11.ParentPage = APage.ParentPage
			Fields.Add("p11", p11)
			p11.DateFilter = ""
			p11.SqlSelect = ""
			p11.SqlOrderBy = ""

			' p12
			p12 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p12", "p12", "[p12]", 200, EWRPT_DATATYPE_STRING, -1)
			p12.Page = APage
			p12.ParentPage = APage.ParentPage
			Fields.Add("p12", p12)
			p12.DateFilter = ""
			p12.SqlSelect = ""
			p12.SqlOrderBy = ""

			' p13
			p13 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p13", "p13", "[p13]", 200, EWRPT_DATATYPE_STRING, -1)
			p13.Page = APage
			p13.ParentPage = APage.ParentPage
			Fields.Add("p13", p13)
			p13.DateFilter = ""
			p13.SqlSelect = ""
			p13.SqlOrderBy = ""

			' p14
			p14 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p14", "p14", "[p14]", 200, EWRPT_DATATYPE_STRING, -1)
			p14.Page = APage
			p14.ParentPage = APage.ParentPage
			Fields.Add("p14", p14)
			p14.DateFilter = ""
			p14.SqlSelect = ""
			p14.SqlOrderBy = ""

			' p15
			p15 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p15", "p15", "[p15]", 200, EWRPT_DATATYPE_STRING, -1)
			p15.Page = APage
			p15.ParentPage = APage.ParentPage
			Fields.Add("p15", p15)
			p15.DateFilter = ""
			p15.SqlSelect = ""
			p15.SqlOrderBy = ""

			' p16
			p16 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p16", "p16", "[p16]", 200, EWRPT_DATATYPE_STRING, -1)
			p16.Page = APage
			p16.ParentPage = APage.ParentPage
			Fields.Add("p16", p16)
			p16.DateFilter = ""
			p16.SqlSelect = ""
			p16.SqlOrderBy = ""

			' p17
			p17 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p17", "p17", "[p17]", 200, EWRPT_DATATYPE_STRING, -1)
			p17.Page = APage
			p17.ParentPage = APage.ParentPage
			Fields.Add("p17", p17)
			p17.DateFilter = ""
			p17.SqlSelect = ""
			p17.SqlOrderBy = ""

			' p18
			p18 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p18", "p18", "[p18]", 200, EWRPT_DATATYPE_STRING, -1)
			p18.Page = APage
			p18.ParentPage = APage.ParentPage
			Fields.Add("p18", p18)
			p18.DateFilter = ""
			p18.SqlSelect = ""
			p18.SqlOrderBy = ""

			' p19
			p19 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p19", "p19", "[p19]", 200, EWRPT_DATATYPE_STRING, -1)
			p19.Page = APage
			p19.ParentPage = APage.ParentPage
			Fields.Add("p19", p19)
			p19.DateFilter = ""
			p19.SqlSelect = ""
			p19.SqlOrderBy = ""

			' p20
			p20 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p20", "p20", "[p20]", 200, EWRPT_DATATYPE_STRING, -1)
			p20.Page = APage
			p20.ParentPage = APage.ParentPage
			Fields.Add("p20", p20)
			p20.DateFilter = ""
			p20.SqlSelect = ""
			p20.SqlOrderBy = ""

			' p21
			p21 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p21", "p21", "[p21]", 200, EWRPT_DATATYPE_STRING, -1)
			p21.Page = APage
			p21.ParentPage = APage.ParentPage
			Fields.Add("p21", p21)
			p21.DateFilter = ""
			p21.SqlSelect = ""
			p21.SqlOrderBy = ""

			' p22
			p22 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p22", "p22", "[p22]", 200, EWRPT_DATATYPE_STRING, -1)
			p22.Page = APage
			p22.ParentPage = APage.ParentPage
			Fields.Add("p22", p22)
			p22.DateFilter = ""
			p22.SqlSelect = ""
			p22.SqlOrderBy = ""

			' p23
			p23 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p23", "p23", "[p23]", 200, EWRPT_DATATYPE_STRING, -1)
			p23.Page = APage
			p23.ParentPage = APage.ParentPage
			Fields.Add("p23", p23)
			p23.DateFilter = ""
			p23.SqlSelect = ""
			p23.SqlOrderBy = ""

			' p24
			p24 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p24", "p24", "[p24]", 200, EWRPT_DATATYPE_STRING, -1)
			p24.Page = APage
			p24.ParentPage = APage.ParentPage
			Fields.Add("p24", p24)
			p24.DateFilter = ""
			p24.SqlSelect = ""
			p24.SqlOrderBy = ""

			' p25
			p25 = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_p25", "p25", "[p25]", 200, EWRPT_DATATYPE_STRING, -1)
			p25.Page = APage
			p25.ParentPage = APage.ParentPage
			Fields.Add("p25", p25)
			p25.DateFilter = ""
			p25.SqlSelect = ""
			p25.SqlOrderBy = ""

			' observacion
			observacion = new crField("EvaluaciF3n_Jefe_de_Carrera", "Evaluación Jefe de Carrera", "x_observacion", "observacion", "[observacion]", 201, EWRPT_DATATYPE_MEMO, -1)
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
				Return "[SEK_Encuesta_ZonaEncuestas]"
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
				Return "[responsable] ASC"
			End Get
		End Property

		' Table Level Group SQL
		Public ReadOnly Property SqlFirstGroupField As String
			Get
				Return "[responsable]"
			End Get
		End Property

		Public ReadOnly Property SqlSelectGroup As String
			Get
				Return "SELECT DISTINCT " + SqlFirstGroupField + " FROM " + SqlFrom
			End Get
		End Property

		Public ReadOnly Property SqlOrderByGroup As String
			Get
				Return "[responsable] ASC"
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
	Public EvaluaciF3n_Jefe_de_Carrera_summary As crEvaluaciF3n_Jefe_de_Carrera_summary

	'
	' Page class
	'
	Public Class crEvaluaciF3n_Jefe_de_Carrera_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (EvaluaciF3n_Jefe_de_Carrera.UseTokenInUrl) Then
				sUrl &= "t=" & EvaluaciF3n_Jefe_de_Carrera.TableVar & "&" ' Add page token
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
			If (EvaluaciF3n_Jefe_de_Carrera.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(EvaluaciF3n_Jefe_de_Carrera.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(EvaluaciF3n_Jefe_de_Carrera.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As EvaluaciF3n_Jefe_de_Carrerasmry 
			Get
				Return CType(m_ParentPage, EvaluaciF3n_Jefe_de_Carrerasmry)
			End Get
		End Property

		' Table object (EvaluaciF3n_Jefe_de_Carrera)
		Public Property EvaluaciF3n_Jefe_de_Carrera As crEvaluaciF3n_Jefe_de_Carrera 
			Get		
				Return AspNetPage.EvaluaciF3n_Jefe_de_Carrera ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crEvaluaciF3n_Jefe_de_Carrera)
				AspNetPage.EvaluaciF3n_Jefe_de_Carrera = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_encuesta_jefecarrera)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "EvaluaciF3n_Jefe_de_Carrera_summary"
			m_PageObjTypeName = "crEvaluaciF3n_Jefe_de_Carrera_summary"

			' Table name
			m_TableName = "Evaluación Jefe de Carrera"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (EvaluaciF3n_Jefe_de_Carrera)
			EvaluaciF3n_Jefe_de_Carrera = New crEvaluaciF3n_Jefe_de_Carrera(Me)			

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
				EvaluaciF3n_Jefe_de_Carrera.Export = ew_Get("export")
			End If
			gsExport = EvaluaciF3n_Jefe_de_Carrera.Export ' Get export parameter, used in header
			gsExportFile = EvaluaciF3n_Jefe_de_Carrera.TableVar ' Get export file, used in header
			If (EvaluaciF3n_Jefe_de_Carrera.Export = "excel") Then
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

		Public Val As Object() = New Object(36) {}

		Public Cnt As Integer()() = New Integer(1)() {}

		Public Smry As Object()() = New Object(1)() {}

		Public Mn As Object()() = New Object(1)() {}

		Public Mx As Object()() = New Object(1)() {}

		Public GrandSmry As Object() = New Object(36) {}

		Public GrandMn As Object() = New Object(36) {}

		Public GrandMx As Object() = New Object(36) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 37 ' No. of fields
			Dim nGrps As Integer = 2 ' No. of groups (level 0 used for grand total)
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
			EvaluaciF3n_Jefe_de_Carrera.CustomFilters_Load()

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

			' Get total group count
			Dim sGrpSort As String = ewrpt_UpdateSortFields(EvaluaciF3n_Jefe_de_Carrera.SqlOrderByGroup, Sort, 2) ' Get grouping field only
			Dim sSql As String = ewrpt_BuildReportSql(EvaluaciF3n_Jefe_de_Carrera.SqlSelectGroup, EvaluaciF3n_Jefe_de_Carrera.SqlWhere, EvaluaciF3n_Jefe_de_Carrera.SqlGroupBy, EvaluaciF3n_Jefe_de_Carrera.SqlHaving, EvaluaciF3n_Jefe_de_Carrera.SqlOrderByGroup, Filter, sGrpSort)
			TotalGrps = GetGrpCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (EvaluaciF3n_Jefe_de_Carrera.ExportAll AndAlso ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then
				DisplayGrps = TotalGrps
			Else
				SetUpStartGroup()
			End If 

			' Get current page groups
			rsgrp = GetGrpRs(sSql, StartGrp, DisplayGrps)
		End Sub

		' Check level break
		Public Function ChkLvlBreak(lvl As Integer) As Boolean
			Select Case lvl
				Case 1
					Return (Convert.IsDBNull(EvaluaciF3n_Jefe_de_Carrera.responsable.CurrentValue) AndAlso Not Convert.IsDBNull(EvaluaciF3n_Jefe_de_Carrera.responsable.OldValue)) OrElse _
						(Not Convert.IsDBNull(EvaluaciF3n_Jefe_de_Carrera.responsable.CurrentValue) AndAlso Convert.IsDBNull(EvaluaciF3n_Jefe_de_Carrera.responsable.OldValue)) OrElse _
						(Not ew_SameStr(EvaluaciF3n_Jefe_de_Carrera.responsable.GroupValue(), EvaluaciF3n_Jefe_de_Carrera.responsable.GroupOldValue()))
			End Select
			Return False
		End Function

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

		' Get group count
		Public Function GetGrpCnt(ByVal sql As String) As Integer
			rsgrp = Conn.GetRows(sql)
			Return rsgrp.Count
		End Function

		' Get group rs
		Public Function GetGrpRs(ByVal sql As String, ByVal start As Integer, ByVal grps As Integer) As ArrayList
			GrpIndex = start - 1
			Return rsgrp
		End Function

		' Get group row values
		Public Sub GetGrpRow(ByVal opt As Integer)
			If rsgrp Is Nothing Then
				Return
			End If					
			If opt = 1 Then ' Get first group
				EvaluaciF3n_Jefe_de_Carrera.responsable.DbValue = "" ' Init first value
			Else	' Get next group
				GrpIndex += 1
			End If
			Dim Row As OrderedDictionary
			If GrpIndex >= rsgrp.Count Then
				EvaluaciF3n_Jefe_de_Carrera.responsable.DbValue = ""
			Else
				Row = DirectCast(rsgrp(GrpIndex), OrderedDictionary)
				EvaluaciF3n_Jefe_de_Carrera.responsable.DbValue = Row(0)
			End If
		End Sub

		' Get row values
		Public Sub GetRow(opt As Integer)
			Dim Row As OrderedDictionary
			If (RowIndex >= rs.Count) Then Return
			RowIndex = IIf(opt = 1, 0, RowIndex + 1)
			If (RowIndex < rs.Count) Then
				Row = CType(rs(RowIndex), OrderedDictionary)		
				If (opt <> 1) Then
					If (EvaluaciF3n_Jefe_de_Carrera.responsable.GroupDbValues.Count > 0) Then
						EvaluaciF3n_Jefe_de_Carrera.responsable.DbValue = EvaluaciF3n_Jefe_de_Carrera.responsable.GroupDbValues(Row("responsable"))
					Else
						EvaluaciF3n_Jefe_de_Carrera.responsable.DbValue = ewrpt_GroupValue(EvaluaciF3n_Jefe_de_Carrera.responsable, Row("responsable"))
					End If
				End If
				EvaluaciF3n_Jefe_de_Carrera.fecha.DbValue = Row("fecha")
				EvaluaciF3n_Jefe_de_Carrera.profesor.DbValue = Row("profesor")
				EvaluaciF3n_Jefe_de_Carrera.codprofesor.DbValue = Row("codprofesor")
				EvaluaciF3n_Jefe_de_Carrera.contrato.DbValue = Row("contrato")
				EvaluaciF3n_Jefe_de_Carrera.ano.DbValue = Row("ano")
				EvaluaciF3n_Jefe_de_Carrera.periodo.DbValue = Row("periodo")
				EvaluaciF3n_Jefe_de_Carrera.carrera.DbValue = Row("carrera")
				EvaluaciF3n_Jefe_de_Carrera.codcarrera.DbValue = Row("codcarrera")
				EvaluaciF3n_Jefe_de_Carrera.ramo.DbValue = Row("ramo")
				EvaluaciF3n_Jefe_de_Carrera.codramo.DbValue = Row("codramo")
				EvaluaciF3n_Jefe_de_Carrera.p1.DbValue = Row("p1")
				EvaluaciF3n_Jefe_de_Carrera.p2.DbValue = Row("p2")
				EvaluaciF3n_Jefe_de_Carrera.p3.DbValue = Row("p3")
				EvaluaciF3n_Jefe_de_Carrera.p4.DbValue = Row("p4")
				EvaluaciF3n_Jefe_de_Carrera.p5.DbValue = Row("p5")
				EvaluaciF3n_Jefe_de_Carrera.p6.DbValue = Row("p6")
				EvaluaciF3n_Jefe_de_Carrera.p7.DbValue = Row("p7")
				EvaluaciF3n_Jefe_de_Carrera.p8.DbValue = Row("p8")
				EvaluaciF3n_Jefe_de_Carrera.p9.DbValue = Row("p9")
				EvaluaciF3n_Jefe_de_Carrera.p10.DbValue = Row("p10")
				EvaluaciF3n_Jefe_de_Carrera.p11.DbValue = Row("p11")
				EvaluaciF3n_Jefe_de_Carrera.p12.DbValue = Row("p12")
				EvaluaciF3n_Jefe_de_Carrera.p13.DbValue = Row("p13")
				EvaluaciF3n_Jefe_de_Carrera.p14.DbValue = Row("p14")
				EvaluaciF3n_Jefe_de_Carrera.p15.DbValue = Row("p15")
				EvaluaciF3n_Jefe_de_Carrera.p16.DbValue = Row("p16")
				EvaluaciF3n_Jefe_de_Carrera.p17.DbValue = Row("p17")
				EvaluaciF3n_Jefe_de_Carrera.p18.DbValue = Row("p18")
				EvaluaciF3n_Jefe_de_Carrera.p19.DbValue = Row("p19")
				EvaluaciF3n_Jefe_de_Carrera.p20.DbValue = Row("p20")
				EvaluaciF3n_Jefe_de_Carrera.p21.DbValue = Row("p21")
				EvaluaciF3n_Jefe_de_Carrera.p22.DbValue = Row("p22")
				EvaluaciF3n_Jefe_de_Carrera.p23.DbValue = Row("p23")
				EvaluaciF3n_Jefe_de_Carrera.p24.DbValue = Row("p24")
				EvaluaciF3n_Jefe_de_Carrera.p25.DbValue = Row("p25")
				EvaluaciF3n_Jefe_de_Carrera.observacion.DbValue = Row("observacion")
				Val(1) = EvaluaciF3n_Jefe_de_Carrera.fecha.CurrentValue
				Val(2) = EvaluaciF3n_Jefe_de_Carrera.profesor.CurrentValue
				Val(3) = EvaluaciF3n_Jefe_de_Carrera.codprofesor.CurrentValue
				Val(4) = EvaluaciF3n_Jefe_de_Carrera.contrato.CurrentValue
				Val(5) = EvaluaciF3n_Jefe_de_Carrera.ano.CurrentValue
				Val(6) = EvaluaciF3n_Jefe_de_Carrera.periodo.CurrentValue
				Val(7) = EvaluaciF3n_Jefe_de_Carrera.carrera.CurrentValue
				Val(8) = EvaluaciF3n_Jefe_de_Carrera.codcarrera.CurrentValue
				Val(9) = EvaluaciF3n_Jefe_de_Carrera.ramo.CurrentValue
				Val(10) = EvaluaciF3n_Jefe_de_Carrera.codramo.CurrentValue
				Val(11) = EvaluaciF3n_Jefe_de_Carrera.p1.CurrentValue
				Val(12) = EvaluaciF3n_Jefe_de_Carrera.p2.CurrentValue
				Val(13) = EvaluaciF3n_Jefe_de_Carrera.p3.CurrentValue
				Val(14) = EvaluaciF3n_Jefe_de_Carrera.p4.CurrentValue
				Val(15) = EvaluaciF3n_Jefe_de_Carrera.p5.CurrentValue
				Val(16) = EvaluaciF3n_Jefe_de_Carrera.p6.CurrentValue
				Val(17) = EvaluaciF3n_Jefe_de_Carrera.p7.CurrentValue
				Val(18) = EvaluaciF3n_Jefe_de_Carrera.p8.CurrentValue
				Val(19) = EvaluaciF3n_Jefe_de_Carrera.p9.CurrentValue
				Val(20) = EvaluaciF3n_Jefe_de_Carrera.p10.CurrentValue
				Val(21) = EvaluaciF3n_Jefe_de_Carrera.p11.CurrentValue
				Val(22) = EvaluaciF3n_Jefe_de_Carrera.p12.CurrentValue
				Val(23) = EvaluaciF3n_Jefe_de_Carrera.p13.CurrentValue
				Val(24) = EvaluaciF3n_Jefe_de_Carrera.p14.CurrentValue
				Val(25) = EvaluaciF3n_Jefe_de_Carrera.p15.CurrentValue
				Val(26) = EvaluaciF3n_Jefe_de_Carrera.p16.CurrentValue
				Val(27) = EvaluaciF3n_Jefe_de_Carrera.p17.CurrentValue
				Val(28) = EvaluaciF3n_Jefe_de_Carrera.p18.CurrentValue
				Val(29) = EvaluaciF3n_Jefe_de_Carrera.p19.CurrentValue
				Val(30) = EvaluaciF3n_Jefe_de_Carrera.p20.CurrentValue
				Val(31) = EvaluaciF3n_Jefe_de_Carrera.p21.CurrentValue
				Val(32) = EvaluaciF3n_Jefe_de_Carrera.p22.CurrentValue
				Val(33) = EvaluaciF3n_Jefe_de_Carrera.p23.CurrentValue
				Val(34) = EvaluaciF3n_Jefe_de_Carrera.p24.CurrentValue
				Val(35) = EvaluaciF3n_Jefe_de_Carrera.p25.CurrentValue
				Val(36) = EvaluaciF3n_Jefe_de_Carrera.observacion.CurrentValue
			Else
				EvaluaciF3n_Jefe_de_Carrera.responsable.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.fecha.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.profesor.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.codprofesor.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.contrato.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.ano.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.periodo.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.carrera.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.codcarrera.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.ramo.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.codramo.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p1.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p2.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p3.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p4.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p5.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p6.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p7.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p8.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p9.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p10.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p11.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p12.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p13.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p14.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p15.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p16.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p17.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p18.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p19.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p20.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p21.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p22.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p23.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p24.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p25.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.observacion.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				EvaluaciF3n_Jefe_de_Carrera.responsable.DbValue = dr("responsable")
				EvaluaciF3n_Jefe_de_Carrera.fecha.DbValue = dr("fecha")
				EvaluaciF3n_Jefe_de_Carrera.profesor.DbValue = dr("profesor")
				EvaluaciF3n_Jefe_de_Carrera.codprofesor.DbValue = dr("codprofesor")
				EvaluaciF3n_Jefe_de_Carrera.contrato.DbValue = dr("contrato")
				EvaluaciF3n_Jefe_de_Carrera.ano.DbValue = dr("ano")
				EvaluaciF3n_Jefe_de_Carrera.periodo.DbValue = dr("periodo")
				EvaluaciF3n_Jefe_de_Carrera.carrera.DbValue = dr("carrera")
				EvaluaciF3n_Jefe_de_Carrera.codcarrera.DbValue = dr("codcarrera")
				EvaluaciF3n_Jefe_de_Carrera.ramo.DbValue = dr("ramo")
				EvaluaciF3n_Jefe_de_Carrera.codramo.DbValue = dr("codramo")
				EvaluaciF3n_Jefe_de_Carrera.p1.DbValue = dr("p1")
				EvaluaciF3n_Jefe_de_Carrera.p2.DbValue = dr("p2")
				EvaluaciF3n_Jefe_de_Carrera.p3.DbValue = dr("p3")
				EvaluaciF3n_Jefe_de_Carrera.p4.DbValue = dr("p4")
				EvaluaciF3n_Jefe_de_Carrera.p5.DbValue = dr("p5")
				EvaluaciF3n_Jefe_de_Carrera.p6.DbValue = dr("p6")
				EvaluaciF3n_Jefe_de_Carrera.p7.DbValue = dr("p7")
				EvaluaciF3n_Jefe_de_Carrera.p8.DbValue = dr("p8")
				EvaluaciF3n_Jefe_de_Carrera.p9.DbValue = dr("p9")
				EvaluaciF3n_Jefe_de_Carrera.p10.DbValue = dr("p10")
				EvaluaciF3n_Jefe_de_Carrera.p11.DbValue = dr("p11")
				EvaluaciF3n_Jefe_de_Carrera.p12.DbValue = dr("p12")
				EvaluaciF3n_Jefe_de_Carrera.p13.DbValue = dr("p13")
				EvaluaciF3n_Jefe_de_Carrera.p14.DbValue = dr("p14")
				EvaluaciF3n_Jefe_de_Carrera.p15.DbValue = dr("p15")
				EvaluaciF3n_Jefe_de_Carrera.p16.DbValue = dr("p16")
				EvaluaciF3n_Jefe_de_Carrera.p17.DbValue = dr("p17")
				EvaluaciF3n_Jefe_de_Carrera.p18.DbValue = dr("p18")
				EvaluaciF3n_Jefe_de_Carrera.p19.DbValue = dr("p19")
				EvaluaciF3n_Jefe_de_Carrera.p20.DbValue = dr("p20")
				EvaluaciF3n_Jefe_de_Carrera.p21.DbValue = dr("p21")
				EvaluaciF3n_Jefe_de_Carrera.p22.DbValue = dr("p22")
				EvaluaciF3n_Jefe_de_Carrera.p23.DbValue = dr("p23")
				EvaluaciF3n_Jefe_de_Carrera.p24.DbValue = dr("p24")
				EvaluaciF3n_Jefe_de_Carrera.p25.DbValue = dr("p25")
				EvaluaciF3n_Jefe_de_Carrera.observacion.DbValue = dr("observacion")
				Val(1) = EvaluaciF3n_Jefe_de_Carrera.fecha.CurrentValue
				Val(2) = EvaluaciF3n_Jefe_de_Carrera.profesor.CurrentValue
				Val(3) = EvaluaciF3n_Jefe_de_Carrera.codprofesor.CurrentValue
				Val(4) = EvaluaciF3n_Jefe_de_Carrera.contrato.CurrentValue
				Val(5) = EvaluaciF3n_Jefe_de_Carrera.ano.CurrentValue
				Val(6) = EvaluaciF3n_Jefe_de_Carrera.periodo.CurrentValue
				Val(7) = EvaluaciF3n_Jefe_de_Carrera.carrera.CurrentValue
				Val(8) = EvaluaciF3n_Jefe_de_Carrera.codcarrera.CurrentValue
				Val(9) = EvaluaciF3n_Jefe_de_Carrera.ramo.CurrentValue
				Val(10) = EvaluaciF3n_Jefe_de_Carrera.codramo.CurrentValue
				Val(11) = EvaluaciF3n_Jefe_de_Carrera.p1.CurrentValue
				Val(12) = EvaluaciF3n_Jefe_de_Carrera.p2.CurrentValue
				Val(13) = EvaluaciF3n_Jefe_de_Carrera.p3.CurrentValue
				Val(14) = EvaluaciF3n_Jefe_de_Carrera.p4.CurrentValue
				Val(15) = EvaluaciF3n_Jefe_de_Carrera.p5.CurrentValue
				Val(16) = EvaluaciF3n_Jefe_de_Carrera.p6.CurrentValue
				Val(17) = EvaluaciF3n_Jefe_de_Carrera.p7.CurrentValue
				Val(18) = EvaluaciF3n_Jefe_de_Carrera.p8.CurrentValue
				Val(19) = EvaluaciF3n_Jefe_de_Carrera.p9.CurrentValue
				Val(20) = EvaluaciF3n_Jefe_de_Carrera.p10.CurrentValue
				Val(21) = EvaluaciF3n_Jefe_de_Carrera.p11.CurrentValue
				Val(22) = EvaluaciF3n_Jefe_de_Carrera.p12.CurrentValue
				Val(23) = EvaluaciF3n_Jefe_de_Carrera.p13.CurrentValue
				Val(24) = EvaluaciF3n_Jefe_de_Carrera.p14.CurrentValue
				Val(25) = EvaluaciF3n_Jefe_de_Carrera.p15.CurrentValue
				Val(26) = EvaluaciF3n_Jefe_de_Carrera.p16.CurrentValue
				Val(27) = EvaluaciF3n_Jefe_de_Carrera.p17.CurrentValue
				Val(28) = EvaluaciF3n_Jefe_de_Carrera.p18.CurrentValue
				Val(29) = EvaluaciF3n_Jefe_de_Carrera.p19.CurrentValue
				Val(30) = EvaluaciF3n_Jefe_de_Carrera.p20.CurrentValue
				Val(31) = EvaluaciF3n_Jefe_de_Carrera.p21.CurrentValue
				Val(32) = EvaluaciF3n_Jefe_de_Carrera.p22.CurrentValue
				Val(33) = EvaluaciF3n_Jefe_de_Carrera.p23.CurrentValue
				Val(34) = EvaluaciF3n_Jefe_de_Carrera.p24.CurrentValue
				Val(35) = EvaluaciF3n_Jefe_de_Carrera.p25.CurrentValue
				Val(36) = EvaluaciF3n_Jefe_de_Carrera.observacion.CurrentValue
			Else				
				EvaluaciF3n_Jefe_de_Carrera.fecha.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.profesor.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.codprofesor.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.contrato.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.ano.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.periodo.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.carrera.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.codcarrera.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.ramo.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.codramo.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p1.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p2.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p3.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p4.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p5.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p6.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p7.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p8.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p9.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p10.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p11.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p12.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p13.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p14.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p15.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p16.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p17.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p18.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p19.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p20.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p21.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p22.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p23.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p24.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.p25.DbValue = ""
				EvaluaciF3n_Jefe_de_Carrera.observacion.DbValue = ""
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
				EvaluaciF3n_Jefe_de_Carrera.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					EvaluaciF3n_Jefe_de_Carrera.StartGroup = StartGrp
				Else
					StartGrp = EvaluaciF3n_Jefe_de_Carrera.StartGroup
				End If
			Else
				StartGrp = EvaluaciF3n_Jefe_de_Carrera.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				EvaluaciF3n_Jefe_de_Carrera.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				EvaluaciF3n_Jefe_de_Carrera.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				EvaluaciF3n_Jefe_de_Carrera.StartGroup = StartGrp
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
			EvaluaciF3n_Jefe_de_Carrera.StartGroup = StartGrp
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
				EvaluaciF3n_Jefe_de_Carrera.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				EvaluaciF3n_Jefe_de_Carrera.StartGroup = StartGrp
			Else				
				If (EvaluaciF3n_Jefe_de_Carrera.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(EvaluaciF3n_Jefe_de_Carrera.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (EvaluaciF3n_Jefe_de_Carrera.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(EvaluaciF3n_Jefe_de_Carrera.SqlSelectCount, EvaluaciF3n_Jefe_de_Carrera.SqlWhere, EvaluaciF3n_Jefe_de_Carrera.SqlGroupBy, EvaluaciF3n_Jefe_de_Carrera.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			EvaluaciF3n_Jefe_de_Carrera.Row_Rendering()

			'
			' Render view codes
			'

			If (EvaluaciF3n_Jefe_de_Carrera.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' responsable
				EvaluaciF3n_Jefe_de_Carrera.responsable.GroupViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.responsable.GroupOldValue())
				EvaluaciF3n_Jefe_de_Carrera.responsable.CellAttrs("class") = IIf(EvaluaciF3n_Jefe_de_Carrera.RowGroupLevel = 1, "ewRptGrpSummary1", "ewRptGrpField1")
				EvaluaciF3n_Jefe_de_Carrera.responsable.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(EvaluaciF3n_Jefe_de_Carrera.responsable, EvaluaciF3n_Jefe_de_Carrera.responsable.GroupViewValue)

				' fecha
				EvaluaciF3n_Jefe_de_Carrera.fecha.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.fecha.Summary)
				EvaluaciF3n_Jefe_de_Carrera.fecha.ViewValue = ew_FormatDateTime(EvaluaciF3n_Jefe_de_Carrera.fecha.ViewValue, 7)

				' profesor
				EvaluaciF3n_Jefe_de_Carrera.profesor.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.profesor.Summary)

				' codprofesor
				EvaluaciF3n_Jefe_de_Carrera.codprofesor.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.codprofesor.Summary)

				' contrato
				EvaluaciF3n_Jefe_de_Carrera.contrato.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.contrato.Summary)

				' ano
				EvaluaciF3n_Jefe_de_Carrera.ano.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.ano.Summary)

				' periodo
				EvaluaciF3n_Jefe_de_Carrera.periodo.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.periodo.Summary)

				' carrera
				EvaluaciF3n_Jefe_de_Carrera.carrera.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.carrera.Summary)

				' codcarrera
				EvaluaciF3n_Jefe_de_Carrera.codcarrera.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.codcarrera.Summary)

				' ramo
				EvaluaciF3n_Jefe_de_Carrera.ramo.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.ramo.Summary)

				' codramo
				EvaluaciF3n_Jefe_de_Carrera.codramo.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.codramo.Summary)

				' p1
				EvaluaciF3n_Jefe_de_Carrera.p1.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p1.Summary)

				' p2
				EvaluaciF3n_Jefe_de_Carrera.p2.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p2.Summary)

				' p3
				EvaluaciF3n_Jefe_de_Carrera.p3.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p3.Summary)

				' p4
				EvaluaciF3n_Jefe_de_Carrera.p4.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p4.Summary)

				' p5
				EvaluaciF3n_Jefe_de_Carrera.p5.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p5.Summary)

				' p6
				EvaluaciF3n_Jefe_de_Carrera.p6.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p6.Summary)

				' p7
				EvaluaciF3n_Jefe_de_Carrera.p7.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p7.Summary)

				' p8
				EvaluaciF3n_Jefe_de_Carrera.p8.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p8.Summary)

				' p9
				EvaluaciF3n_Jefe_de_Carrera.p9.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p9.Summary)

				' p10
				EvaluaciF3n_Jefe_de_Carrera.p10.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p10.Summary)

				' p11
				EvaluaciF3n_Jefe_de_Carrera.p11.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p11.Summary)

				' p12
				EvaluaciF3n_Jefe_de_Carrera.p12.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p12.Summary)

				' p13
				EvaluaciF3n_Jefe_de_Carrera.p13.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p13.Summary)

				' p14
				EvaluaciF3n_Jefe_de_Carrera.p14.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p14.Summary)

				' p15
				EvaluaciF3n_Jefe_de_Carrera.p15.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p15.Summary)

				' p16
				EvaluaciF3n_Jefe_de_Carrera.p16.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p16.Summary)

				' p17
				EvaluaciF3n_Jefe_de_Carrera.p17.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p17.Summary)

				' p18
				EvaluaciF3n_Jefe_de_Carrera.p18.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p18.Summary)

				' p19
				EvaluaciF3n_Jefe_de_Carrera.p19.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p19.Summary)

				' p20
				EvaluaciF3n_Jefe_de_Carrera.p20.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p20.Summary)

				' p21
				EvaluaciF3n_Jefe_de_Carrera.p21.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p21.Summary)

				' p22
				EvaluaciF3n_Jefe_de_Carrera.p22.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p22.Summary)

				' p23
				EvaluaciF3n_Jefe_de_Carrera.p23.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p23.Summary)

				' p24
				EvaluaciF3n_Jefe_de_Carrera.p24.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p24.Summary)

				' p25
				EvaluaciF3n_Jefe_de_Carrera.p25.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p25.Summary)

				' observacion
				EvaluaciF3n_Jefe_de_Carrera.observacion.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.observacion.Summary)
			Else

				' responsable
				EvaluaciF3n_Jefe_de_Carrera.responsable.GroupViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.responsable.GroupValue())
				EvaluaciF3n_Jefe_de_Carrera.responsable.CellAttrs("class") = "ewRptGrpField1"
				EvaluaciF3n_Jefe_de_Carrera.responsable.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(EvaluaciF3n_Jefe_de_Carrera.responsable, EvaluaciF3n_Jefe_de_Carrera.responsable.GroupViewValue)
				If (ew_SameStr(EvaluaciF3n_Jefe_de_Carrera.responsable.GroupValue(), EvaluaciF3n_Jefe_de_Carrera.responsable.GroupOldValue()) AndAlso Not ChkLvlBreak(1))
					EvaluaciF3n_Jefe_de_Carrera.responsable.GroupViewValue = "&nbsp;"
				End If

				' fecha
				EvaluaciF3n_Jefe_de_Carrera.fecha.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.fecha.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.fecha.ViewValue = ew_FormatDateTime(EvaluaciF3n_Jefe_de_Carrera.fecha.ViewValue, 7)
				EvaluaciF3n_Jefe_de_Carrera.fecha.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' profesor
				EvaluaciF3n_Jefe_de_Carrera.profesor.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.profesor.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.profesor.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' codprofesor
				EvaluaciF3n_Jefe_de_Carrera.codprofesor.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.codprofesor.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.codprofesor.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' contrato
				EvaluaciF3n_Jefe_de_Carrera.contrato.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.contrato.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.contrato.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ano
				EvaluaciF3n_Jefe_de_Carrera.ano.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.ano.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' periodo
				EvaluaciF3n_Jefe_de_Carrera.periodo.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.periodo.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.periodo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' carrera
				EvaluaciF3n_Jefe_de_Carrera.carrera.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.carrera.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' codcarrera
				EvaluaciF3n_Jefe_de_Carrera.codcarrera.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.codcarrera.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.codcarrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ramo
				EvaluaciF3n_Jefe_de_Carrera.ramo.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.ramo.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.ramo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' codramo
				EvaluaciF3n_Jefe_de_Carrera.codramo.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.codramo.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.codramo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p1
				EvaluaciF3n_Jefe_de_Carrera.p1.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p1.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p2
				EvaluaciF3n_Jefe_de_Carrera.p2.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p2.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p3
				EvaluaciF3n_Jefe_de_Carrera.p3.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p3.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p4
				EvaluaciF3n_Jefe_de_Carrera.p4.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p4.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p4.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p5
				EvaluaciF3n_Jefe_de_Carrera.p5.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p5.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p5.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p6
				EvaluaciF3n_Jefe_de_Carrera.p6.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p6.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p6.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p7
				EvaluaciF3n_Jefe_de_Carrera.p7.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p7.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p7.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p8
				EvaluaciF3n_Jefe_de_Carrera.p8.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p8.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p8.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p9
				EvaluaciF3n_Jefe_de_Carrera.p9.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p9.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p9.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p10
				EvaluaciF3n_Jefe_de_Carrera.p10.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p10.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p10.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p11
				EvaluaciF3n_Jefe_de_Carrera.p11.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p11.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p11.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p12
				EvaluaciF3n_Jefe_de_Carrera.p12.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p12.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p12.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p13
				EvaluaciF3n_Jefe_de_Carrera.p13.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p13.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p13.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p14
				EvaluaciF3n_Jefe_de_Carrera.p14.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p14.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p14.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p15
				EvaluaciF3n_Jefe_de_Carrera.p15.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p15.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p15.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p16
				EvaluaciF3n_Jefe_de_Carrera.p16.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p16.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p16.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p17
				EvaluaciF3n_Jefe_de_Carrera.p17.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p17.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p17.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p18
				EvaluaciF3n_Jefe_de_Carrera.p18.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p18.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p18.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p19
				EvaluaciF3n_Jefe_de_Carrera.p19.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p19.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p19.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p20
				EvaluaciF3n_Jefe_de_Carrera.p20.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p20.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p20.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p21
				EvaluaciF3n_Jefe_de_Carrera.p21.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p21.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p21.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p22
				EvaluaciF3n_Jefe_de_Carrera.p22.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p22.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p22.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p23
				EvaluaciF3n_Jefe_de_Carrera.p23.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p23.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p23.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p24
				EvaluaciF3n_Jefe_de_Carrera.p24.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p24.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p24.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p25
				EvaluaciF3n_Jefe_de_Carrera.p25.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.p25.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.p25.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' observacion
				EvaluaciF3n_Jefe_de_Carrera.observacion.ViewValue = Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.observacion.CurrentValue)
				EvaluaciF3n_Jefe_de_Carrera.observacion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' responsable
			EvaluaciF3n_Jefe_de_Carrera.responsable.HrefValue = ""

			' fecha
			EvaluaciF3n_Jefe_de_Carrera.fecha.HrefValue = ""

			' profesor
			EvaluaciF3n_Jefe_de_Carrera.profesor.HrefValue = ""

			' codprofesor
			EvaluaciF3n_Jefe_de_Carrera.codprofesor.HrefValue = ""

			' contrato
			EvaluaciF3n_Jefe_de_Carrera.contrato.HrefValue = ""

			' ano
			EvaluaciF3n_Jefe_de_Carrera.ano.HrefValue = ""

			' periodo
			EvaluaciF3n_Jefe_de_Carrera.periodo.HrefValue = ""

			' carrera
			EvaluaciF3n_Jefe_de_Carrera.carrera.HrefValue = ""

			' codcarrera
			EvaluaciF3n_Jefe_de_Carrera.codcarrera.HrefValue = ""

			' ramo
			EvaluaciF3n_Jefe_de_Carrera.ramo.HrefValue = ""

			' codramo
			EvaluaciF3n_Jefe_de_Carrera.codramo.HrefValue = ""

			' p1
			EvaluaciF3n_Jefe_de_Carrera.p1.HrefValue = ""

			' p2
			EvaluaciF3n_Jefe_de_Carrera.p2.HrefValue = ""

			' p3
			EvaluaciF3n_Jefe_de_Carrera.p3.HrefValue = ""

			' p4
			EvaluaciF3n_Jefe_de_Carrera.p4.HrefValue = ""

			' p5
			EvaluaciF3n_Jefe_de_Carrera.p5.HrefValue = ""

			' p6
			EvaluaciF3n_Jefe_de_Carrera.p6.HrefValue = ""

			' p7
			EvaluaciF3n_Jefe_de_Carrera.p7.HrefValue = ""

			' p8
			EvaluaciF3n_Jefe_de_Carrera.p8.HrefValue = ""

			' p9
			EvaluaciF3n_Jefe_de_Carrera.p9.HrefValue = ""

			' p10
			EvaluaciF3n_Jefe_de_Carrera.p10.HrefValue = ""

			' p11
			EvaluaciF3n_Jefe_de_Carrera.p11.HrefValue = ""

			' p12
			EvaluaciF3n_Jefe_de_Carrera.p12.HrefValue = ""

			' p13
			EvaluaciF3n_Jefe_de_Carrera.p13.HrefValue = ""

			' p14
			EvaluaciF3n_Jefe_de_Carrera.p14.HrefValue = ""

			' p15
			EvaluaciF3n_Jefe_de_Carrera.p15.HrefValue = ""

			' p16
			EvaluaciF3n_Jefe_de_Carrera.p16.HrefValue = ""

			' p17
			EvaluaciF3n_Jefe_de_Carrera.p17.HrefValue = ""

			' p18
			EvaluaciF3n_Jefe_de_Carrera.p18.HrefValue = ""

			' p19
			EvaluaciF3n_Jefe_de_Carrera.p19.HrefValue = ""

			' p20
			EvaluaciF3n_Jefe_de_Carrera.p20.HrefValue = ""

			' p21
			EvaluaciF3n_Jefe_de_Carrera.p21.HrefValue = ""

			' p22
			EvaluaciF3n_Jefe_de_Carrera.p22.HrefValue = ""

			' p23
			EvaluaciF3n_Jefe_de_Carrera.p23.HrefValue = ""

			' p24
			EvaluaciF3n_Jefe_de_Carrera.p24.HrefValue = ""

			' p25
			EvaluaciF3n_Jefe_de_Carrera.p25.HrefValue = ""

			' observacion
			EvaluaciF3n_Jefe_de_Carrera.observacion.HrefValue = ""

			' Call Row_Rendered event
			EvaluaciF3n_Jefe_de_Carrera.Row_Rendered()
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

			' Field responsable
			sSelect = "SELECT DISTINCT [responsable] FROM " + EvaluaciF3n_Jefe_de_Carrera.SqlFrom
			sOrderBy = "[responsable] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, EvaluaciF3n_Jefe_de_Carrera.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ano
			sSelect = "SELECT DISTINCT [ano] FROM " + EvaluaciF3n_Jefe_de_Carrera.SqlFrom
			sOrderBy = "[ano] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, EvaluaciF3n_Jefe_de_Carrera.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			EvaluaciF3n_Jefe_de_Carrera.ano.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field periodo
			sSelect = "SELECT DISTINCT [periodo] FROM " + EvaluaciF3n_Jefe_de_Carrera.SqlFrom
			sOrderBy = "[periodo] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, EvaluaciF3n_Jefe_de_Carrera.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field carrera
			sSelect = "SELECT DISTINCT [carrera] FROM " + EvaluaciF3n_Jefe_de_Carrera.SqlFrom
			sOrderBy = "[carrera] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, EvaluaciF3n_Jefe_de_Carrera.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ramo
			sSelect = "SELECT DISTINCT [ramo] FROM " + EvaluaciF3n_Jefe_de_Carrera.SqlFrom
			sOrderBy = "[ramo] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, EvaluaciF3n_Jefe_de_Carrera.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field responsable
				SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.responsable)

				' Field fecha
				SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.fecha)

				' Field profesor
				SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.profesor)

				' Field codprofesor
				SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.codprofesor)

				' Field ano
				SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.ano.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.ano)

				' Field periodo
				SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.periodo)

				' Field carrera
				SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.carrera)

				' Field codcarrera
				SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.codcarrera)

				' Field ramo
				SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.ramo)

				' Field codramo
				SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.codramo)
			bSetupFilter = True ' Set up filter required
		Else

				' Field responsable
				If (GetDropDownValue(EvaluaciF3n_Jefe_de_Carrera.responsable)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownValue) Then
					If Not ew_SameStr(EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_EvaluaciF3n_Jefe_de_Carrera_responsable") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field fecha
				If (GetFilterValues(EvaluaciF3n_Jefe_de_Carrera.fecha)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field profesor
				If (GetFilterValues(EvaluaciF3n_Jefe_de_Carrera.profesor)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field codprofesor
				If (GetFilterValues(EvaluaciF3n_Jefe_de_Carrera.codprofesor)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ano
				If (GetDropDownValue(EvaluaciF3n_Jefe_de_Carrera.ano)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(EvaluaciF3n_Jefe_de_Carrera.ano.DropDownValue) Then
					If Not ew_SameStr(EvaluaciF3n_Jefe_de_Carrera.ano.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_EvaluaciF3n_Jefe_de_Carrera_ano") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field periodo
				If (GetDropDownValue(EvaluaciF3n_Jefe_de_Carrera.periodo)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownValue) Then
					If Not ew_SameStr(EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_EvaluaciF3n_Jefe_de_Carrera_periodo") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field carrera
				If (GetDropDownValue(EvaluaciF3n_Jefe_de_Carrera.carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownValue) Then
					If Not ew_SameStr(EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_EvaluaciF3n_Jefe_de_Carrera_carrera") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field codcarrera
				If (GetFilterValues(EvaluaciF3n_Jefe_de_Carrera.codcarrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ramo
				If (GetDropDownValue(EvaluaciF3n_Jefe_de_Carrera.ramo)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownValue) Then
					If Not ew_SameStr(EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_EvaluaciF3n_Jefe_de_Carrera_ramo") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field codramo
				If (GetFilterValues(EvaluaciF3n_Jefe_de_Carrera.codramo)) Then
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

			' Field responsable
			GetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.responsable)

			' Field fecha
			GetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.fecha)

			' Field profesor
			GetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.profesor)

			' Field codprofesor
			GetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.codprofesor)

			' Field ano
			GetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.ano)

			' Field periodo
			GetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.periodo)

			' Field carrera
			GetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.carrera)

			' Field codcarrera
			GetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.codcarrera)

			' Field ramo
			GetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.ramo)

			' Field codramo
			GetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.codramo)
		End If

		' Call page filter validated event
		EvaluaciF3n_Jefe_de_Carrera.Page_FilterValidated()

		' Build SQL
		' Field responsable

		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.responsable, sFilter, "")

		' Field fecha
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.fecha, sFilter)

		' Field profesor
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.profesor, sFilter)

		' Field codprofesor
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.codprofesor, sFilter)

		' Field ano
		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.ano, sFilter, "")

		' Field periodo
		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.periodo, sFilter, "")

		' Field carrera
		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.carrera, sFilter, "")

		' Field codcarrera
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.codcarrera, sFilter)

		' Field ramo
		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.ramo, sFilter, "")

		' Field codramo
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.codramo, sFilter)

		' Save parms to Session
		' Field responsable

		SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.responsable)

		' Field fecha
		SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.fecha)

		' Field profesor
		SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.profesor)

		' Field codprofesor
		SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.codprofesor)

		' Field ano
		SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.ano.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.ano)

		' Field periodo
		SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.periodo)

		' Field carrera
		SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.carrera)

		' Field codcarrera
		SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.codcarrera)

		' Field ramo
		SetSessionDropDownValue(EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownValue, EvaluaciF3n_Jefe_de_Carrera.ramo)

		' Field codramo
		SetSessionFilterValues(EvaluaciF3n_Jefe_de_Carrera.codramo)

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
		If ew_Session("sv_EvaluaciF3n_Jefe_de_Carrera_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_EvaluaciF3n_Jefe_de_Carrera_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_EvaluaciF3n_Jefe_de_Carrera_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_EvaluaciF3n_Jefe_de_Carrera_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_EvaluaciF3n_Jefe_de_Carrera_" + parm)
		End If
		If ew_Session("so1_EvaluaciF3n_Jefe_de_Carrera_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_EvaluaciF3n_Jefe_de_Carrera_" + parm))
		End If
		If ew_Session("sc_EvaluaciF3n_Jefe_de_Carrera_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_EvaluaciF3n_Jefe_de_Carrera_" + parm))
		End If
		If ew_Session("sv2_EvaluaciF3n_Jefe_de_Carrera_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_EvaluaciF3n_Jefe_de_Carrera_" + parm)
		End If
		If ew_Session("so2_EvaluaciF3n_Jefe_de_Carrera_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_EvaluaciF3n_Jefe_de_Carrera_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_EvaluaciF3n_Jefe_de_Carrera_" + parm) = fld.SearchValue
		ew_Session("so1_EvaluaciF3n_Jefe_de_Carrera_" + parm) = fld.SearchOperator
		ew_Session("sc_EvaluaciF3n_Jefe_de_Carrera_" + parm) = fld.SearchCondition
		ew_Session("sv2_EvaluaciF3n_Jefe_de_Carrera_" + parm) = fld.SearchValue2
		ew_Session("so2_EvaluaciF3n_Jefe_de_Carrera_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_EvaluaciF3n_Jefe_de_Carrera_" + parm) = ""
		ew_Session("so1_EvaluaciF3n_Jefe_de_Carrera_" + parm) = "="
		ew_Session("sc_EvaluaciF3n_Jefe_de_Carrera_" + parm) = "AND"
		ew_Session("sv2_EvaluaciF3n_Jefe_de_Carrera_" + parm) = ""
		ew_Session("so2_EvaluaciF3n_Jefe_de_Carrera_" + parm) = "="
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
		If Not ewrpt_CheckEuroDate(Convert.ToString(EvaluaciF3n_Jefe_de_Carrera.fecha.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= EvaluaciF3n_Jefe_de_Carrera.fecha.FldErrMsg()
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
		ew_Session("sel_EvaluaciF3n_Jefe_de_Carrera_" & parm) = ""
		ew_Session("rf_EvaluaciF3n_Jefe_de_Carrera_" & parm) = ""
		ew_Session("rt_EvaluaciF3n_Jefe_de_Carrera_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = EvaluaciF3n_Jefe_de_Carrera.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_EvaluaciF3n_Jefe_de_Carrera_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_EvaluaciF3n_Jefe_de_Carrera_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_EvaluaciF3n_Jefe_de_Carrera_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field responsable

			EvaluaciF3n_Jefe_de_Carrera.responsable.DefaultDropDownValue = EWRPT_INIT_VALUE
			EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownValue = EvaluaciF3n_Jefe_de_Carrera.responsable.DefaultDropDownValue

			' Field ano
			EvaluaciF3n_Jefe_de_Carrera.ano.DefaultDropDownValue = EWRPT_INIT_VALUE
			EvaluaciF3n_Jefe_de_Carrera.ano.DropDownValue = EvaluaciF3n_Jefe_de_Carrera.ano.DefaultDropDownValue

			' Field periodo
			EvaluaciF3n_Jefe_de_Carrera.periodo.DefaultDropDownValue = EWRPT_INIT_VALUE
			EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownValue = EvaluaciF3n_Jefe_de_Carrera.periodo.DefaultDropDownValue

			' Field carrera
			EvaluaciF3n_Jefe_de_Carrera.carrera.DefaultDropDownValue = EWRPT_INIT_VALUE
			EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownValue = EvaluaciF3n_Jefe_de_Carrera.carrera.DefaultDropDownValue

			' Field ramo
			EvaluaciF3n_Jefe_de_Carrera.ramo.DefaultDropDownValue = EWRPT_INIT_VALUE
			EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownValue = EvaluaciF3n_Jefe_de_Carrera.ramo.DefaultDropDownValue

		' Set up default values for extended filters
			' Field fecha

			SetDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.fecha, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.fecha)	

			' Field profesor
			SetDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.profesor, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.profesor)	

			' Field codprofesor
			SetDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.codprofesor, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.codprofesor)	

			' Field codcarrera
			SetDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.codcarrera, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.codcarrera)	

			' Field codramo
			SetDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.codramo, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(EvaluaciF3n_Jefe_de_Carrera.codramo)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check responsable dropdown filter
		If (NonTextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.responsable)) Then bFilterExist = True

		' Check fecha extended filter
		If (TextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.fecha)) Then bFilterExist = True

		' Check profesor extended filter
		If (TextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.profesor)) Then bFilterExist = True

		' Check codprofesor extended filter
		If (TextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.codprofesor)) Then bFilterExist = True

		' Check ano dropdown filter
		If (NonTextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.ano)) Then bFilterExist = True

		' Check periodo dropdown filter
		If (NonTextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.periodo)) Then bFilterExist = True

		' Check carrera dropdown filter
		If (NonTextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.carrera)) Then bFilterExist = True

		' Check codcarrera extended filter
		If (TextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.codcarrera)) Then bFilterExist = True

		' Check ramo dropdown filter
		If (NonTextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.ramo)) Then bFilterExist = True

		' Check codramo extended filter
		If (TextFilterApplied(EvaluaciF3n_Jefe_de_Carrera.codramo)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field responsable
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.responsable, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.responsable.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field fecha
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.fecha, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.fecha.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field profesor
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.profesor, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.profesor.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field codprofesor
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.codprofesor, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.codprofesor.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ano
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.ano, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.ano.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field periodo
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.periodo, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.periodo.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field carrera
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.carrera, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field codcarrera
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.codcarrera, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.codcarrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ramo
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(EvaluaciF3n_Jefe_de_Carrera.ramo, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.ramo.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field codramo
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(EvaluaciF3n_Jefe_de_Carrera.codramo, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= EvaluaciF3n_Jefe_de_Carrera.codramo.FldCaption() & "<br>"
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
				EvaluaciF3n_Jefe_de_Carrera.OrderBy = ""
				EvaluaciF3n_Jefe_de_Carrera.StartGroup = 1
				EvaluaciF3n_Jefe_de_Carrera.responsable.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.fecha.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.profesor.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.codprofesor.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.contrato.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.ano.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.periodo.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.carrera.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.codcarrera.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.ramo.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.codramo.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p1.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p2.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p3.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p4.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p5.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p6.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p7.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p8.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p9.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p10.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p11.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p12.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p13.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p14.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p15.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p16.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p17.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p18.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p19.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p20.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p21.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p22.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p23.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p24.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.p25.Sort = ""
				EvaluaciF3n_Jefe_de_Carrera.observacion.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			EvaluaciF3n_Jefe_de_Carrera.CurrentOrder = ew_Get("order")
			EvaluaciF3n_Jefe_de_Carrera.CurrentOrderType = ew_Get("ordertype")
			sSortSql = EvaluaciF3n_Jefe_de_Carrera.SortSql()
			EvaluaciF3n_Jefe_de_Carrera.OrderBy = sSortSql
			EvaluaciF3n_Jefe_de_Carrera.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.OrderBy)) Then
			EvaluaciF3n_Jefe_de_Carrera.OrderBy = "[fecha] DESC"
			EvaluaciF3n_Jefe_de_Carrera.fecha.Sort = "DESC"
		End If
		Return EvaluaciF3n_Jefe_de_Carrera.OrderBy
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
		EvaluaciF3n_Jefe_de_Carrera_summary = New crEvaluaciF3n_Jefe_de_Carrera_summary(Me)
		EvaluaciF3n_Jefe_de_Carrera_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		EvaluaciF3n_Jefe_de_Carrera_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (EvaluaciF3n_Jefe_de_Carrera_summary IsNot Nothing) Then EvaluaciF3n_Jefe_de_Carrera_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var EvaluaciF3n_Jefe_de_Carrera_summary = new ewrpt_Page("EvaluaciF3n_Jefe_de_Carrera_summary");
// page properties
EvaluaciF3n_Jefe_de_Carrera_summary.PageID = "summary"; // page ID
EvaluaciF3n_Jefe_de_Carrera_summary.FormID = "fEvaluaciF3n_Jefe_de_Carrerasummaryfilter"; // form ID
var EWRPT_PAGE_ID = EvaluaciF3n_Jefe_de_Carrera_summary.PageID;
// extend page with ValidateForm function
EvaluaciF3n_Jefe_de_Carrera_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_fecha;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(EvaluaciF3n_Jefe_de_Carrera.fecha.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
EvaluaciF3n_Jefe_de_Carrera_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
EvaluaciF3n_Jefe_de_Carrera_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
EvaluaciF3n_Jefe_de_Carrera_summary.ValidateRequired = false; // no JavaScript validation
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
<% EvaluaciF3n_Jefe_de_Carrera_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= EvaluaciF3n_Jefe_de_Carrera.TableCaption() %></h1></div>
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= EvaluaciF3n_Jefe_de_Carrera_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" alt="Exportar a Excel" title="Exportar a Excel" /></a>
<% If (EvaluaciF3n_Jefe_de_Carrera_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% EvaluaciF3n_Jefe_de_Carrera_summary.ShowMessage() %>
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (EvaluaciF3n_Jefe_de_Carrera.FilterPanelOption = 2 OrElse (EvaluaciF3n_Jefe_de_Carrera.FilterPanelOption = 3 AndAlso EvaluaciF3n_Jefe_de_Carrera_summary.FilterApplied) OrElse EvaluaciF3n_Jefe_de_Carrera_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="EvaluaciF3n_Jefe_de_Carrerasmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fEvaluaciF3n_Jefe_de_Carrerasummaryfilter" id="fEvaluaciF3n_Jefe_de_Carrerasummaryfilter" action="EvaluaciF3n_Jefe_de_Carrerasmry.aspx" class="ewForm" onsubmit="return EvaluaciF3n_Jefe_de_Carrera_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = EvaluaciF3n_Jefe_de_Carrera.codramo.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.responsable.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_responsable" id="sv_responsable"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_responsable", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = EvaluaciF3n_Jefe_de_Carrera.responsable.CustomFilters.Count + EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In EvaluaciF3n_Jefe_de_Carrera.responsable.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "responsable")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.responsable.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.fecha.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_fecha" id="sv1_fecha" value="<%= ew_HtmlEncode(EvaluaciF3n_Jefe_de_Carrera.fecha.SearchValue) %>"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_fecha", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.profesor.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_profesor" id="sv1_profesor" size="30" maxlength="100" value="<%= ew_HtmlEncode(EvaluaciF3n_Jefe_de_Carrera.profesor.SearchValue) %>"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_profesor", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.codprofesor.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_codprofesor" id="sv1_codprofesor" size="30" maxlength="50" value="<%= ew_HtmlEncode(EvaluaciF3n_Jefe_de_Carrera.codprofesor.SearchValue) %>"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_codprofesor", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.ano.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ano" id="sv_ano"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_ano", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.ano.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = EvaluaciF3n_Jefe_de_Carrera.ano.CustomFilters.Count + EvaluaciF3n_Jefe_de_Carrera.ano.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In EvaluaciF3n_Jefe_de_Carrera.ano.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ano")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.ano.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In EvaluaciF3n_Jefe_de_Carrera.ano.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.ano.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.periodo.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_periodo" id="sv_periodo"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_periodo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = EvaluaciF3n_Jefe_de_Carrera.periodo.CustomFilters.Count + EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In EvaluaciF3n_Jefe_de_Carrera.periodo.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "periodo")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.periodo.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.carrera.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_carrera" id="sv_carrera"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_carrera", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = EvaluaciF3n_Jefe_de_Carrera.carrera.CustomFilters.Count + EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In EvaluaciF3n_Jefe_de_Carrera.carrera.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "carrera")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.carrera.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.codcarrera.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_codcarrera" id="sv1_codcarrera" size="30" maxlength="50" value="<%= ew_HtmlEncode(EvaluaciF3n_Jefe_de_Carrera.codcarrera.SearchValue) %>"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_codcarrera", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.ramo.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ramo" id="sv_ramo"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_ramo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = EvaluaciF3n_Jefe_de_Carrera.ramo.CustomFilters.Count + EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In EvaluaciF3n_Jefe_de_Carrera.ramo.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ramo")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(EvaluaciF3n_Jefe_de_Carrera.ramo.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EvaluaciF3n_Jefe_de_Carrera.codramo.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_codramo" id="sv1_codramo" size="30" maxlength="50" value="<%= ew_HtmlEncode(EvaluaciF3n_Jefe_de_Carrera.codramo.SearchValue) %>"<%= IIf(EvaluaciF3n_Jefe_de_Carrera_summary.ClearExtFilter = "EvaluaciF3n_Jefe_de_Carrera_codramo", " class=""ewInputCleared""", "") %>>
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
<% If (EvaluaciF3n_Jefe_de_Carrera.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% EvaluaciF3n_Jefe_de_Carrera_summary.ShowFilterList() %>
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
If (EvaluaciF3n_Jefe_de_Carrera.ExportAll AndAlso ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then
	EvaluaciF3n_Jefe_de_Carrera_summary.StopGrp = EvaluaciF3n_Jefe_de_Carrera_summary.TotalGrps
Else
	EvaluaciF3n_Jefe_de_Carrera_summary.StopGrp = EvaluaciF3n_Jefe_de_Carrera_summary.StartGrp + EvaluaciF3n_Jefe_de_Carrera_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (EvaluaciF3n_Jefe_de_Carrera_summary.StopGrp > EvaluaciF3n_Jefe_de_Carrera_summary.TotalGrps) Then
	EvaluaciF3n_Jefe_de_Carrera_summary.StopGrp = EvaluaciF3n_Jefe_de_Carrera_summary.TotalGrps
End If
EvaluaciF3n_Jefe_de_Carrera_summary.RecCount = 0

' Get first row
If (EvaluaciF3n_Jefe_de_Carrera_summary.TotalGrps > 0) Then
	EvaluaciF3n_Jefe_de_Carrera_summary.GetGrpRow(1)
	EvaluaciF3n_Jefe_de_Carrera_summary.GrpCount = 1
End If
While (EvaluaciF3n_Jefe_de_Carrera_summary.GrpIndex < EvaluaciF3n_Jefe_de_Carrera_summary.StopGrp OrElse EvaluaciF3n_Jefe_de_Carrera_summary.ShowFirstHeader)

	' Show header
	If (EvaluaciF3n_Jefe_de_Carrera_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.responsable.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.responsable))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.responsable.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.responsable) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.responsable.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.responsable.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.responsable.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.fecha.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.fecha))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.fecha.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.fecha) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.fecha.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.fecha.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.fecha.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.profesor.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.profesor))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.profesor.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.profesor) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.profesor.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.profesor.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.profesor.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.codprofesor.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.codprofesor))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.codprofesor.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.codprofesor) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.codprofesor.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.codprofesor.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.codprofesor.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.contrato.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.contrato))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.contrato.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.contrato) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.contrato.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.contrato.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.contrato.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.ano))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.ano) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.ano.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.periodo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.periodo))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.periodo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.periodo) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.periodo.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.periodo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.periodo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.carrera))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.carrera) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.codcarrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.codcarrera))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.codcarrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.codcarrera) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.codcarrera.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.codcarrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.codcarrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.ramo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.ramo))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.ramo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.ramo) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.ramo.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.ramo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.ramo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.codramo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.codramo))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.codramo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.codramo) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.codramo.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.codramo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.codramo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p1))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p1) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p1.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p2))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p2) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p2.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p3))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p3) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p3.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p4.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p4))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p4.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p4) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p4.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p4.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p4.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p5.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p5))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p5.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p5) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p5.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p5.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p5.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p6.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p6))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p6.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p6) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p6.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p6.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p6.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p7.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p7))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p7.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p7) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p7.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p7.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p7.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p8.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p8))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p8.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p8) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p8.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p8.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p8.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p9.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p9))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p9.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p9) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p9.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p9.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p9.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p10.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p10))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p10.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p10) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p10.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p10.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p10.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p11.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p11))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p11.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p11) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p11.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p11.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p11.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p12.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p12))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p12.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p12) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p12.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p12.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p12.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p13.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p13))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p13.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p13) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p13.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p13.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p13.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p14.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p14))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p14.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p14) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p14.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p14.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p14.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p15.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p15))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p15.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p15) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p15.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p15.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p15.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p16.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p16))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p16.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p16) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p16.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p16.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p16.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p17.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p17))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p17.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p17) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p17.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p17.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p17.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p18.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p18))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p18.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p18) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p18.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p18.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p18.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p19.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p19))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p19.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p19) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p19.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p19.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p19.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p20.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p20))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p20.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p20) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p20.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p20.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p20.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p21.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p21))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p21.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p21) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p21.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p21.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p21.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p22.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p22))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p22.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p22) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p22.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p22.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p22.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p23.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p23))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p23.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p23) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p23.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p23.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p23.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p24.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p24))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p24.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p24) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p24.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p24.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p24.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.p25.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p25))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.p25.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.p25) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.p25.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.p25.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.p25.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera.Export)) Then %>
<%= EvaluaciF3n_Jefe_de_Carrera.observacion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.observacion))) Then %>
		<td style="vertical-align: bottom;"><%= EvaluaciF3n_Jefe_de_Carrera.observacion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EvaluaciF3n_Jefe_de_Carrera.SortUrl(EvaluaciF3n_Jefe_de_Carrera.observacion) %>',0);"><%= EvaluaciF3n_Jefe_de_Carrera.observacion.FldCaption() %></td><td style="width: 10px;">
		<% If (EvaluaciF3n_Jefe_de_Carrera.observacion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (EvaluaciF3n_Jefe_de_Carrera.observacion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		EvaluaciF3n_Jefe_de_Carrera_summary.ShowFirstHeader = False
	End If

	' Build detail SQL
	Dim sWhere As String = ewrpt_DetailFilterSQL(EvaluaciF3n_Jefe_de_Carrera.responsable, EvaluaciF3n_Jefe_de_Carrera.SqlFirstGroupField, EvaluaciF3n_Jefe_de_Carrera.responsable.GroupValue())
	If (ew_NotEmpty(EvaluaciF3n_Jefe_de_Carrera_summary.Filter)) Then
		sWhere = "(" + EvaluaciF3n_Jefe_de_Carrera_summary.Filter + ") AND (" + sWhere + ")"
	End If
	sSql = ewrpt_BuildReportSql(EvaluaciF3n_Jefe_de_Carrera.SqlSelect, EvaluaciF3n_Jefe_de_Carrera.SqlWhere, EvaluaciF3n_Jefe_de_Carrera.SqlGroupBy, EvaluaciF3n_Jefe_de_Carrera.SqlHaving, EvaluaciF3n_Jefe_de_Carrera.SqlOrderBy, sWhere, EvaluaciF3n_Jefe_de_Carrera_summary.Sort)
	EvaluaciF3n_Jefe_de_Carrera_summary.rs = Conn.GetRows(sSql)
	Dim rsdtlcnt As Integer = EvaluaciF3n_Jefe_de_Carrera_summary.rs.Count
	EvaluaciF3n_Jefe_de_Carrera_summary.RowIndex = 0	
	If (rsdtlcnt > 0) Then
		EvaluaciF3n_Jefe_de_Carrera_summary.GetRow(1)
	End If

	' Loop detail records
	While (EvaluaciF3n_Jefe_de_Carrera_summary.RowIndex < EvaluaciF3n_Jefe_de_Carrera_summary.rs.Count) 
		EvaluaciF3n_Jefe_de_Carrera_summary.RecCount += 1

		' Render detail row
		EvaluaciF3n_Jefe_de_Carrera.ResetCSS()
		EvaluaciF3n_Jefe_de_Carrera.RowType = EWRPT_ROWTYPE_DETAIL
		EvaluaciF3n_Jefe_de_Carrera_summary.RenderRow()
%>
	<tr<%= EvaluaciF3n_Jefe_de_Carrera.RowAttributes() %>>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.responsable.CellAttributes %>><div<%= EvaluaciF3n_Jefe_de_Carrera.responsable.ViewAttributes %>><%= EvaluaciF3n_Jefe_de_Carrera.responsable.GroupViewValue %></div></td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.fecha.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.fecha.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.fecha.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.profesor.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.profesor.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.profesor.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.codprofesor.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.codprofesor.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.codprofesor.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.contrato.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.contrato.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.contrato.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.ano.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.ano.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.ano.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.periodo.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.periodo.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.periodo.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.carrera.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.carrera.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.carrera.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.codcarrera.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.codcarrera.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.codcarrera.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.ramo.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.ramo.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.ramo.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.codramo.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.codramo.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.codramo.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p1.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p1.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p1.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p2.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p2.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p2.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p3.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p3.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p3.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p4.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p4.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p4.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p5.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p5.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p5.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p6.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p6.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p6.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p7.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p7.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p7.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p8.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p8.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p8.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p9.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p9.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p9.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p10.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p10.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p10.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p11.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p11.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p11.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p12.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p12.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p12.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p13.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p13.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p13.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p14.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p14.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p14.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p15.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p15.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p15.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p16.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p16.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p16.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p17.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p17.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p17.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p18.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p18.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p18.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p19.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p19.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p19.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p20.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p20.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p20.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p21.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p21.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p21.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p22.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p22.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p22.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p23.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p23.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p23.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p24.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p24.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p24.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.p25.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.p25.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.p25.ListViewValue%></div>
</td>
		<td<%= EvaluaciF3n_Jefe_de_Carrera.observacion.CellAttributes %>>
<div<%= EvaluaciF3n_Jefe_de_Carrera.observacion.ViewAttributes%>><%= EvaluaciF3n_Jefe_de_Carrera.observacion.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		EvaluaciF3n_Jefe_de_Carrera_summary.AccumulateSummary()

		' Get next record
		EvaluaciF3n_Jefe_de_Carrera_summary.GetRow(2)

		' Show Footers
%>
<%
	End While ' End detail records loop
%>
<%

	' Next group
	EvaluaciF3n_Jefe_de_Carrera_summary.GetGrpRow(2)
	EvaluaciF3n_Jefe_de_Carrera_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (EvaluaciF3n_Jefe_de_Carrera_summary.TotalGrps > 0) Then
	EvaluaciF3n_Jefe_de_Carrera.ResetCSS()
	EvaluaciF3n_Jefe_de_Carrera.RowType = EWRPT_ROWTYPE_TOTAL
	EvaluaciF3n_Jefe_de_Carrera.RowTotalType = EWRPT_ROWTOTAL_GRAND
	EvaluaciF3n_Jefe_de_Carrera.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	EvaluaciF3n_Jefe_de_Carrera.RowAttrs("class") = "ewRptGrandSummary"
	EvaluaciF3n_Jefe_de_Carrera_summary.RenderRow()
%>
	<!-- tr><td colspan="37"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= EvaluaciF3n_Jefe_de_Carrera.RowAttributes() %>><td colspan="37"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(EvaluaciF3n_Jefe_de_Carrera_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If EvaluaciF3n_Jefe_de_Carrera_summary.Pager Is Nothing Then EvaluaciF3n_Jefe_de_Carrera_summary.Pager = New cPrevNextPager(EvaluaciF3n_Jefe_de_Carrera_summary.StartGrp, EvaluaciF3n_Jefe_de_Carrera_summary.DisplayGrps, EvaluaciF3n_Jefe_de_Carrera_summary.TotalGrps) %>
<% If EvaluaciF3n_Jefe_de_Carrera_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If EvaluaciF3n_Jefe_de_Carrera_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="EvaluaciF3n_Jefe_de_Carrerasmry.aspx?start=<%= EvaluaciF3n_Jefe_de_Carrera_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If EvaluaciF3n_Jefe_de_Carrera_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="EvaluaciF3n_Jefe_de_Carrerasmry.aspx?start=<%= EvaluaciF3n_Jefe_de_Carrera_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= EvaluaciF3n_Jefe_de_Carrera_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If EvaluaciF3n_Jefe_de_Carrera_summary.Pager.NextButton.Enabled Then %>
	<td><a href="EvaluaciF3n_Jefe_de_Carrerasmry.aspx?start=<%= EvaluaciF3n_Jefe_de_Carrera_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If EvaluaciF3n_Jefe_de_Carrera_summary.Pager.LastButton.Enabled Then %>
	<td><a href="EvaluaciF3n_Jefe_de_Carrerasmry.aspx?start=<%= EvaluaciF3n_Jefe_de_Carrera_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= EvaluaciF3n_Jefe_de_Carrera_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= EvaluaciF3n_Jefe_de_Carrera_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= EvaluaciF3n_Jefe_de_Carrera_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= EvaluaciF3n_Jefe_de_Carrera_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If EvaluaciF3n_Jefe_de_Carrera_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (EvaluaciF3n_Jefe_de_Carrera_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If EvaluaciF3n_Jefe_de_Carrera_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If EvaluaciF3n_Jefe_de_Carrera_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If EvaluaciF3n_Jefe_de_Carrera_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% EvaluaciF3n_Jefe_de_Carrera_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (EvaluaciF3n_Jefe_de_Carrera.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
