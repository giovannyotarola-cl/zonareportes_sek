<%@ Page ClassName="Evaluacion_Funcionariosmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public Evaluacion_Funcionario As crEvaluacion_Funcionario = Nothing

	'
	' Table class (for Evaluacion Funcionario)
	'
	Public Class crEvaluacion_Funcionario
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
				Return "Evaluacion_Funcionario"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Evaluacion Funcionario"
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

		Public Evaluador As crField

		Public Evaluado As crField

		Public fecha As crField

		Public ano As crField

		Public semestre As crField

		Public G1_a1 As crField

		Public G1_a2 As crField

		Public G1_a3 As crField

		Public G1_a As crField

		Public G1_b As crField

		Public G1_b1 As crField

		Public G1_b2 As crField

		Public G1_b3 As crField

		Public G1_c As crField

		Public G1_c1 As crField

		Public G1_c2 As crField

		Public G1_c3 As crField

		Public G1_promedio As crField

		Public G2_a As crField

		Public G2_a1 As crField

		Public G2_a2 As crField

		Public G2_a3 As crField

		Public G2_b As crField

		Public G2_b1 As crField

		Public G2_b2 As crField

		Public G2_b3 As crField

		Public G2_c As crField

		Public G2_c1 As crField

		Public G2_c2 As crField

		Public G2_c3 As crField

		Public G2_promedio As crField

		Public observaciones As crField

		Public aceptada As crField

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

			' Evaluador
			Evaluador = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_Evaluador", "Evaluador", "[Evaluador]", 202, EWRPT_DATATYPE_STRING, -1)
			Evaluador.Page = APage
			Evaluador.ParentPage = APage.ParentPage
			Fields.Add("Evaluador", Evaluador)
			Evaluador.DateFilter = ""
			Evaluador.SqlSelect = ""
			Evaluador.SqlOrderBy = ""

			' Evaluado
			Evaluado = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_Evaluado", "Evaluado", "[Evaluado]", 202, EWRPT_DATATYPE_STRING, -1)
			Evaluado.Page = APage
			Evaluado.ParentPage = APage.ParentPage
			Fields.Add("Evaluado", Evaluado)
			Evaluado.DateFilter = ""
			Evaluado.SqlSelect = ""
			Evaluado.SqlOrderBy = ""

			' fecha
			fecha = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_fecha", "fecha", "[fecha]", 135, EWRPT_DATATYPE_DATE, 7)
			fecha.Page = APage
			fecha.ParentPage = APage.ParentPage
			fecha.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("fecha", fecha)
			fecha.DateFilter = ""
			fecha.SqlSelect = ""
			fecha.SqlOrderBy = ""

			' ano
			ano = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_ano", "ano", "[ano]", 3, EWRPT_DATATYPE_NUMBER, -1)
			ano.Page = APage
			ano.ParentPage = APage.ParentPage
			ano.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("ano", ano)
			ano.DateFilter = ""
			ano.SqlSelect = ""
			ano.SqlOrderBy = ""

			' semestre
			semestre = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_semestre", "semestre", "[semestre]", 3, EWRPT_DATATYPE_NUMBER, -1)
			semestre.Page = APage
			semestre.ParentPage = APage.ParentPage
			semestre.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("semestre", semestre)
			semestre.DateFilter = ""
			semestre.SqlSelect = ""
			semestre.SqlOrderBy = ""

			' G1_a1
			G1_a1 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_a1", "G1_a1", "[G1_a1]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G1_a1.Page = APage
			G1_a1.ParentPage = APage.ParentPage
			G1_a1.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G1_a1", G1_a1)
			G1_a1.DateFilter = ""
			G1_a1.SqlSelect = ""
			G1_a1.SqlOrderBy = ""

			' G1_a2
			G1_a2 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_a2", "G1_a2", "[G1_a2]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G1_a2.Page = APage
			G1_a2.ParentPage = APage.ParentPage
			G1_a2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G1_a2", G1_a2)
			G1_a2.DateFilter = ""
			G1_a2.SqlSelect = ""
			G1_a2.SqlOrderBy = ""

			' G1_a3
			G1_a3 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_a3", "G1_a3", "[G1_a3]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G1_a3.Page = APage
			G1_a3.ParentPage = APage.ParentPage
			G1_a3.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G1_a3", G1_a3)
			G1_a3.DateFilter = ""
			G1_a3.SqlSelect = ""
			G1_a3.SqlOrderBy = ""

			' G1_a
			G1_a = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_a", "G1_a", "[G1_a]", 5, EWRPT_DATATYPE_NUMBER, -1)
			G1_a.Page = APage
			G1_a.ParentPage = APage.ParentPage
			G1_a.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("G1_a", G1_a)
			G1_a.DateFilter = ""
			G1_a.SqlSelect = ""
			G1_a.SqlOrderBy = ""

			' G1_b
			G1_b = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_b", "G1_b", "[G1_b]", 5, EWRPT_DATATYPE_NUMBER, -1)
			G1_b.Page = APage
			G1_b.ParentPage = APage.ParentPage
			G1_b.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("G1_b", G1_b)
			G1_b.DateFilter = ""
			G1_b.SqlSelect = ""
			G1_b.SqlOrderBy = ""

			' G1_b1
			G1_b1 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_b1", "G1_b1", "[G1_b1]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G1_b1.Page = APage
			G1_b1.ParentPage = APage.ParentPage
			G1_b1.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G1_b1", G1_b1)
			G1_b1.DateFilter = ""
			G1_b1.SqlSelect = ""
			G1_b1.SqlOrderBy = ""

			' G1_b2
			G1_b2 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_b2", "G1_b2", "[G1_b2]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G1_b2.Page = APage
			G1_b2.ParentPage = APage.ParentPage
			G1_b2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G1_b2", G1_b2)
			G1_b2.DateFilter = ""
			G1_b2.SqlSelect = ""
			G1_b2.SqlOrderBy = ""

			' G1_b3
			G1_b3 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_b3", "G1_b3", "[G1_b3]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G1_b3.Page = APage
			G1_b3.ParentPage = APage.ParentPage
			G1_b3.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G1_b3", G1_b3)
			G1_b3.DateFilter = ""
			G1_b3.SqlSelect = ""
			G1_b3.SqlOrderBy = ""

			' G1_c
			G1_c = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_c", "G1_c", "[G1_c]", 5, EWRPT_DATATYPE_NUMBER, -1)
			G1_c.Page = APage
			G1_c.ParentPage = APage.ParentPage
			G1_c.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("G1_c", G1_c)
			G1_c.DateFilter = ""
			G1_c.SqlSelect = ""
			G1_c.SqlOrderBy = ""

			' G1_c1
			G1_c1 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_c1", "G1_c1", "[G1_c1]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G1_c1.Page = APage
			G1_c1.ParentPage = APage.ParentPage
			G1_c1.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G1_c1", G1_c1)
			G1_c1.DateFilter = ""
			G1_c1.SqlSelect = ""
			G1_c1.SqlOrderBy = ""

			' G1_c2
			G1_c2 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_c2", "G1_c2", "[G1_c2]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G1_c2.Page = APage
			G1_c2.ParentPage = APage.ParentPage
			G1_c2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G1_c2", G1_c2)
			G1_c2.DateFilter = ""
			G1_c2.SqlSelect = ""
			G1_c2.SqlOrderBy = ""

			' G1_c3
			G1_c3 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_c3", "G1_c3", "[G1_c3]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G1_c3.Page = APage
			G1_c3.ParentPage = APage.ParentPage
			G1_c3.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G1_c3", G1_c3)
			G1_c3.DateFilter = ""
			G1_c3.SqlSelect = ""
			G1_c3.SqlOrderBy = ""

			' G1_promedio
			G1_promedio = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G1_promedio", "G1_promedio", "[G1_promedio]", 5, EWRPT_DATATYPE_NUMBER, -1)
			G1_promedio.Page = APage
			G1_promedio.ParentPage = APage.ParentPage
			G1_promedio.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("G1_promedio", G1_promedio)
			G1_promedio.DateFilter = ""
			G1_promedio.SqlSelect = ""
			G1_promedio.SqlOrderBy = ""

			' G2_a
			G2_a = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_a", "G2_a", "[G2_a]", 5, EWRPT_DATATYPE_NUMBER, -1)
			G2_a.Page = APage
			G2_a.ParentPage = APage.ParentPage
			G2_a.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("G2_a", G2_a)
			G2_a.DateFilter = ""
			G2_a.SqlSelect = ""
			G2_a.SqlOrderBy = ""

			' G2_a1
			G2_a1 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_a1", "G2_a1", "[G2_a1]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G2_a1.Page = APage
			G2_a1.ParentPage = APage.ParentPage
			G2_a1.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G2_a1", G2_a1)
			G2_a1.DateFilter = ""
			G2_a1.SqlSelect = ""
			G2_a1.SqlOrderBy = ""

			' G2_a2
			G2_a2 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_a2", "G2_a2", "[G2_a2]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G2_a2.Page = APage
			G2_a2.ParentPage = APage.ParentPage
			G2_a2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G2_a2", G2_a2)
			G2_a2.DateFilter = ""
			G2_a2.SqlSelect = ""
			G2_a2.SqlOrderBy = ""

			' G2_a3
			G2_a3 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_a3", "G2_a3", "[G2_a3]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G2_a3.Page = APage
			G2_a3.ParentPage = APage.ParentPage
			G2_a3.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G2_a3", G2_a3)
			G2_a3.DateFilter = ""
			G2_a3.SqlSelect = ""
			G2_a3.SqlOrderBy = ""

			' G2_b
			G2_b = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_b", "G2_b", "[G2_b]", 5, EWRPT_DATATYPE_NUMBER, -1)
			G2_b.Page = APage
			G2_b.ParentPage = APage.ParentPage
			G2_b.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("G2_b", G2_b)
			G2_b.DateFilter = ""
			G2_b.SqlSelect = ""
			G2_b.SqlOrderBy = ""

			' G2_b1
			G2_b1 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_b1", "G2_b1", "[G2_b1]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G2_b1.Page = APage
			G2_b1.ParentPage = APage.ParentPage
			G2_b1.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G2_b1", G2_b1)
			G2_b1.DateFilter = ""
			G2_b1.SqlSelect = ""
			G2_b1.SqlOrderBy = ""

			' G2_b2
			G2_b2 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_b2", "G2_b2", "[G2_b2]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G2_b2.Page = APage
			G2_b2.ParentPage = APage.ParentPage
			G2_b2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G2_b2", G2_b2)
			G2_b2.DateFilter = ""
			G2_b2.SqlSelect = ""
			G2_b2.SqlOrderBy = ""

			' G2_b3
			G2_b3 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_b3", "G2_b3", "[G2_b3]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G2_b3.Page = APage
			G2_b3.ParentPage = APage.ParentPage
			G2_b3.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G2_b3", G2_b3)
			G2_b3.DateFilter = ""
			G2_b3.SqlSelect = ""
			G2_b3.SqlOrderBy = ""

			' G2_c
			G2_c = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_c", "G2_c", "[G2_c]", 5, EWRPT_DATATYPE_NUMBER, -1)
			G2_c.Page = APage
			G2_c.ParentPage = APage.ParentPage
			G2_c.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("G2_c", G2_c)
			G2_c.DateFilter = ""
			G2_c.SqlSelect = ""
			G2_c.SqlOrderBy = ""

			' G2_c1
			G2_c1 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_c1", "G2_c1", "[G2_c1]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G2_c1.Page = APage
			G2_c1.ParentPage = APage.ParentPage
			G2_c1.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G2_c1", G2_c1)
			G2_c1.DateFilter = ""
			G2_c1.SqlSelect = ""
			G2_c1.SqlOrderBy = ""

			' G2_c2
			G2_c2 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_c2", "G2_c2", "[G2_c2]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G2_c2.Page = APage
			G2_c2.ParentPage = APage.ParentPage
			G2_c2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G2_c2", G2_c2)
			G2_c2.DateFilter = ""
			G2_c2.SqlSelect = ""
			G2_c2.SqlOrderBy = ""

			' G2_c3
			G2_c3 = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_c3", "G2_c3", "[G2_c3]", 17, EWRPT_DATATYPE_NUMBER, -1)
			G2_c3.Page = APage
			G2_c3.ParentPage = APage.ParentPage
			G2_c3.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("G2_c3", G2_c3)
			G2_c3.DateFilter = ""
			G2_c3.SqlSelect = ""
			G2_c3.SqlOrderBy = ""

			' G2_promedio
			G2_promedio = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_G2_promedio", "G2_promedio", "[G2_promedio]", 5, EWRPT_DATATYPE_NUMBER, -1)
			G2_promedio.Page = APage
			G2_promedio.ParentPage = APage.ParentPage
			G2_promedio.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("G2_promedio", G2_promedio)
			G2_promedio.DateFilter = ""
			G2_promedio.SqlSelect = ""
			G2_promedio.SqlOrderBy = ""

			' observaciones
			observaciones = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_observaciones", "observaciones", "[observaciones]", 201, EWRPT_DATATYPE_MEMO, -1)
			observaciones.Page = APage
			observaciones.ParentPage = APage.ParentPage
			Fields.Add("observaciones", observaciones)
			observaciones.DateFilter = ""
			observaciones.SqlSelect = ""
			observaciones.SqlOrderBy = ""

			' aceptada
			aceptada = new crField("Evaluacion_Funcionario", "Evaluacion Funcionario", "x_aceptada", "aceptada", "[aceptada]", 11, EWRPT_DATATYPE_BOOLEAN, -1)
			aceptada.Page = APage
			aceptada.ParentPage = APage.ParentPage
			Fields.Add("aceptada", aceptada)
			aceptada.DateFilter = ""
			aceptada.SqlSelect = ""
			aceptada.SqlOrderBy = ""
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
				Return "[SEK_V_Evaluacion_Funcionario]"
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
	Public Evaluacion_Funcionario_summary As crEvaluacion_Funcionario_summary

	'
	' Page class
	'
	Public Class crEvaluacion_Funcionario_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Evaluacion_Funcionario.UseTokenInUrl) Then
				sUrl &= "t=" & Evaluacion_Funcionario.TableVar & "&" ' Add page token
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
			If (Evaluacion_Funcionario.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Evaluacion_Funcionario.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Evaluacion_Funcionario.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Evaluacion_Funcionariosmry 
			Get
				Return CType(m_ParentPage, Evaluacion_Funcionariosmry)
			End Get
		End Property

		' Table object (Evaluacion_Funcionario)
		Public Property Evaluacion_Funcionario As crEvaluacion_Funcionario 
			Get		
				Return AspNetPage.Evaluacion_Funcionario ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crEvaluacion_Funcionario)
				AspNetPage.Evaluacion_Funcionario = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Evaluacion_Funcionario_summary"
			m_PageObjTypeName = "crEvaluacion_Funcionario_summary"

			' Table name
			m_TableName = "Evaluacion Funcionario"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Evaluacion_Funcionario)
			Evaluacion_Funcionario = New crEvaluacion_Funcionario(Me)			

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
				Evaluacion_Funcionario.Export = ew_Get("export")
			End If
			gsExport = Evaluacion_Funcionario.Export ' Get export parameter, used in header
			gsExportFile = Evaluacion_Funcionario.TableVar ' Get export file, used in header
			If (Evaluacion_Funcionario.Export = "excel") Then
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

		Public Val As Object() = New Object(33) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(33) {}

		Public GrandMn As Object() = New Object(33) {}

		Public GrandMx As Object() = New Object(33) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 34 ' No. of fields
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
			Evaluacion_Funcionario.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Evaluacion_Funcionario.SqlSelect, Evaluacion_Funcionario.SqlWhere, Evaluacion_Funcionario.SqlGroupBy, Evaluacion_Funcionario.SqlHaving, Evaluacion_Funcionario.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Evaluacion_Funcionario.ExportAll AndAlso ew_NotEmpty(Evaluacion_Funcionario.Export)) Then
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
				Evaluacion_Funcionario.Evaluador.DbValue = Row("Evaluador")
				Evaluacion_Funcionario.Evaluado.DbValue = Row("Evaluado")
				Evaluacion_Funcionario.fecha.DbValue = Row("fecha")
				Evaluacion_Funcionario.ano.DbValue = Row("ano")
				Evaluacion_Funcionario.semestre.DbValue = Row("semestre")
				Evaluacion_Funcionario.G1_a1.DbValue = Row("G1_a1")
				Evaluacion_Funcionario.G1_a2.DbValue = Row("G1_a2")
				Evaluacion_Funcionario.G1_a3.DbValue = Row("G1_a3")
				Evaluacion_Funcionario.G1_a.DbValue = Row("G1_a")
				Evaluacion_Funcionario.G1_b.DbValue = Row("G1_b")
				Evaluacion_Funcionario.G1_b1.DbValue = Row("G1_b1")
				Evaluacion_Funcionario.G1_b2.DbValue = Row("G1_b2")
				Evaluacion_Funcionario.G1_b3.DbValue = Row("G1_b3")
				Evaluacion_Funcionario.G1_c.DbValue = Row("G1_c")
				Evaluacion_Funcionario.G1_c1.DbValue = Row("G1_c1")
				Evaluacion_Funcionario.G1_c2.DbValue = Row("G1_c2")
				Evaluacion_Funcionario.G1_c3.DbValue = Row("G1_c3")
				Evaluacion_Funcionario.G1_promedio.DbValue = Row("G1_promedio")
				Evaluacion_Funcionario.G2_a.DbValue = Row("G2_a")
				Evaluacion_Funcionario.G2_a1.DbValue = Row("G2_a1")
				Evaluacion_Funcionario.G2_a2.DbValue = Row("G2_a2")
				Evaluacion_Funcionario.G2_a3.DbValue = Row("G2_a3")
				Evaluacion_Funcionario.G2_b.DbValue = Row("G2_b")
				Evaluacion_Funcionario.G2_b1.DbValue = Row("G2_b1")
				Evaluacion_Funcionario.G2_b2.DbValue = Row("G2_b2")
				Evaluacion_Funcionario.G2_b3.DbValue = Row("G2_b3")
				Evaluacion_Funcionario.G2_c.DbValue = Row("G2_c")
				Evaluacion_Funcionario.G2_c1.DbValue = Row("G2_c1")
				Evaluacion_Funcionario.G2_c2.DbValue = Row("G2_c2")
				Evaluacion_Funcionario.G2_c3.DbValue = Row("G2_c3")
				Evaluacion_Funcionario.G2_promedio.DbValue = Row("G2_promedio")
				Evaluacion_Funcionario.observaciones.DbValue = Row("observaciones")
				Evaluacion_Funcionario.aceptada.DbValue = Row("aceptada")
				Val(1) = Evaluacion_Funcionario.Evaluador.CurrentValue
				Val(2) = Evaluacion_Funcionario.Evaluado.CurrentValue
				Val(3) = Evaluacion_Funcionario.fecha.CurrentValue
				Val(4) = Evaluacion_Funcionario.ano.CurrentValue
				Val(5) = Evaluacion_Funcionario.semestre.CurrentValue
				Val(6) = Evaluacion_Funcionario.G1_a1.CurrentValue
				Val(7) = Evaluacion_Funcionario.G1_a2.CurrentValue
				Val(8) = Evaluacion_Funcionario.G1_a3.CurrentValue
				Val(9) = Evaluacion_Funcionario.G1_a.CurrentValue
				Val(10) = Evaluacion_Funcionario.G1_b.CurrentValue
				Val(11) = Evaluacion_Funcionario.G1_b1.CurrentValue
				Val(12) = Evaluacion_Funcionario.G1_b2.CurrentValue
				Val(13) = Evaluacion_Funcionario.G1_b3.CurrentValue
				Val(14) = Evaluacion_Funcionario.G1_c.CurrentValue
				Val(15) = Evaluacion_Funcionario.G1_c1.CurrentValue
				Val(16) = Evaluacion_Funcionario.G1_c2.CurrentValue
				Val(17) = Evaluacion_Funcionario.G1_c3.CurrentValue
				Val(18) = Evaluacion_Funcionario.G1_promedio.CurrentValue
				Val(19) = Evaluacion_Funcionario.G2_a.CurrentValue
				Val(20) = Evaluacion_Funcionario.G2_a1.CurrentValue
				Val(21) = Evaluacion_Funcionario.G2_a2.CurrentValue
				Val(22) = Evaluacion_Funcionario.G2_a3.CurrentValue
				Val(23) = Evaluacion_Funcionario.G2_b.CurrentValue
				Val(24) = Evaluacion_Funcionario.G2_b1.CurrentValue
				Val(25) = Evaluacion_Funcionario.G2_b2.CurrentValue
				Val(26) = Evaluacion_Funcionario.G2_b3.CurrentValue
				Val(27) = Evaluacion_Funcionario.G2_c.CurrentValue
				Val(28) = Evaluacion_Funcionario.G2_c1.CurrentValue
				Val(29) = Evaluacion_Funcionario.G2_c2.CurrentValue
				Val(30) = Evaluacion_Funcionario.G2_c3.CurrentValue
				Val(31) = Evaluacion_Funcionario.G2_promedio.CurrentValue
				Val(32) = Evaluacion_Funcionario.observaciones.CurrentValue
				Val(33) = Evaluacion_Funcionario.aceptada.CurrentValue
			Else
				Evaluacion_Funcionario.Evaluador.DbValue = ""
				Evaluacion_Funcionario.Evaluado.DbValue = ""
				Evaluacion_Funcionario.fecha.DbValue = ""
				Evaluacion_Funcionario.ano.DbValue = ""
				Evaluacion_Funcionario.semestre.DbValue = ""
				Evaluacion_Funcionario.G1_a1.DbValue = ""
				Evaluacion_Funcionario.G1_a2.DbValue = ""
				Evaluacion_Funcionario.G1_a3.DbValue = ""
				Evaluacion_Funcionario.G1_a.DbValue = ""
				Evaluacion_Funcionario.G1_b.DbValue = ""
				Evaluacion_Funcionario.G1_b1.DbValue = ""
				Evaluacion_Funcionario.G1_b2.DbValue = ""
				Evaluacion_Funcionario.G1_b3.DbValue = ""
				Evaluacion_Funcionario.G1_c.DbValue = ""
				Evaluacion_Funcionario.G1_c1.DbValue = ""
				Evaluacion_Funcionario.G1_c2.DbValue = ""
				Evaluacion_Funcionario.G1_c3.DbValue = ""
				Evaluacion_Funcionario.G1_promedio.DbValue = ""
				Evaluacion_Funcionario.G2_a.DbValue = ""
				Evaluacion_Funcionario.G2_a1.DbValue = ""
				Evaluacion_Funcionario.G2_a2.DbValue = ""
				Evaluacion_Funcionario.G2_a3.DbValue = ""
				Evaluacion_Funcionario.G2_b.DbValue = ""
				Evaluacion_Funcionario.G2_b1.DbValue = ""
				Evaluacion_Funcionario.G2_b2.DbValue = ""
				Evaluacion_Funcionario.G2_b3.DbValue = ""
				Evaluacion_Funcionario.G2_c.DbValue = ""
				Evaluacion_Funcionario.G2_c1.DbValue = ""
				Evaluacion_Funcionario.G2_c2.DbValue = ""
				Evaluacion_Funcionario.G2_c3.DbValue = ""
				Evaluacion_Funcionario.G2_promedio.DbValue = ""
				Evaluacion_Funcionario.observaciones.DbValue = ""
				Evaluacion_Funcionario.aceptada.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Evaluacion_Funcionario.Evaluador.DbValue = dr("Evaluador")
				Evaluacion_Funcionario.Evaluado.DbValue = dr("Evaluado")
				Evaluacion_Funcionario.fecha.DbValue = dr("fecha")
				Evaluacion_Funcionario.ano.DbValue = dr("ano")
				Evaluacion_Funcionario.semestre.DbValue = dr("semestre")
				Evaluacion_Funcionario.G1_a1.DbValue = dr("G1_a1")
				Evaluacion_Funcionario.G1_a2.DbValue = dr("G1_a2")
				Evaluacion_Funcionario.G1_a3.DbValue = dr("G1_a3")
				Evaluacion_Funcionario.G1_a.DbValue = dr("G1_a")
				Evaluacion_Funcionario.G1_b.DbValue = dr("G1_b")
				Evaluacion_Funcionario.G1_b1.DbValue = dr("G1_b1")
				Evaluacion_Funcionario.G1_b2.DbValue = dr("G1_b2")
				Evaluacion_Funcionario.G1_b3.DbValue = dr("G1_b3")
				Evaluacion_Funcionario.G1_c.DbValue = dr("G1_c")
				Evaluacion_Funcionario.G1_c1.DbValue = dr("G1_c1")
				Evaluacion_Funcionario.G1_c2.DbValue = dr("G1_c2")
				Evaluacion_Funcionario.G1_c3.DbValue = dr("G1_c3")
				Evaluacion_Funcionario.G1_promedio.DbValue = dr("G1_promedio")
				Evaluacion_Funcionario.G2_a.DbValue = dr("G2_a")
				Evaluacion_Funcionario.G2_a1.DbValue = dr("G2_a1")
				Evaluacion_Funcionario.G2_a2.DbValue = dr("G2_a2")
				Evaluacion_Funcionario.G2_a3.DbValue = dr("G2_a3")
				Evaluacion_Funcionario.G2_b.DbValue = dr("G2_b")
				Evaluacion_Funcionario.G2_b1.DbValue = dr("G2_b1")
				Evaluacion_Funcionario.G2_b2.DbValue = dr("G2_b2")
				Evaluacion_Funcionario.G2_b3.DbValue = dr("G2_b3")
				Evaluacion_Funcionario.G2_c.DbValue = dr("G2_c")
				Evaluacion_Funcionario.G2_c1.DbValue = dr("G2_c1")
				Evaluacion_Funcionario.G2_c2.DbValue = dr("G2_c2")
				Evaluacion_Funcionario.G2_c3.DbValue = dr("G2_c3")
				Evaluacion_Funcionario.G2_promedio.DbValue = dr("G2_promedio")
				Evaluacion_Funcionario.observaciones.DbValue = dr("observaciones")
				Evaluacion_Funcionario.aceptada.DbValue = dr("aceptada")
				Val(1) = Evaluacion_Funcionario.Evaluador.CurrentValue
				Val(2) = Evaluacion_Funcionario.Evaluado.CurrentValue
				Val(3) = Evaluacion_Funcionario.fecha.CurrentValue
				Val(4) = Evaluacion_Funcionario.ano.CurrentValue
				Val(5) = Evaluacion_Funcionario.semestre.CurrentValue
				Val(6) = Evaluacion_Funcionario.G1_a1.CurrentValue
				Val(7) = Evaluacion_Funcionario.G1_a2.CurrentValue
				Val(8) = Evaluacion_Funcionario.G1_a3.CurrentValue
				Val(9) = Evaluacion_Funcionario.G1_a.CurrentValue
				Val(10) = Evaluacion_Funcionario.G1_b.CurrentValue
				Val(11) = Evaluacion_Funcionario.G1_b1.CurrentValue
				Val(12) = Evaluacion_Funcionario.G1_b2.CurrentValue
				Val(13) = Evaluacion_Funcionario.G1_b3.CurrentValue
				Val(14) = Evaluacion_Funcionario.G1_c.CurrentValue
				Val(15) = Evaluacion_Funcionario.G1_c1.CurrentValue
				Val(16) = Evaluacion_Funcionario.G1_c2.CurrentValue
				Val(17) = Evaluacion_Funcionario.G1_c3.CurrentValue
				Val(18) = Evaluacion_Funcionario.G1_promedio.CurrentValue
				Val(19) = Evaluacion_Funcionario.G2_a.CurrentValue
				Val(20) = Evaluacion_Funcionario.G2_a1.CurrentValue
				Val(21) = Evaluacion_Funcionario.G2_a2.CurrentValue
				Val(22) = Evaluacion_Funcionario.G2_a3.CurrentValue
				Val(23) = Evaluacion_Funcionario.G2_b.CurrentValue
				Val(24) = Evaluacion_Funcionario.G2_b1.CurrentValue
				Val(25) = Evaluacion_Funcionario.G2_b2.CurrentValue
				Val(26) = Evaluacion_Funcionario.G2_b3.CurrentValue
				Val(27) = Evaluacion_Funcionario.G2_c.CurrentValue
				Val(28) = Evaluacion_Funcionario.G2_c1.CurrentValue
				Val(29) = Evaluacion_Funcionario.G2_c2.CurrentValue
				Val(30) = Evaluacion_Funcionario.G2_c3.CurrentValue
				Val(31) = Evaluacion_Funcionario.G2_promedio.CurrentValue
				Val(32) = Evaluacion_Funcionario.observaciones.CurrentValue
				Val(33) = Evaluacion_Funcionario.aceptada.CurrentValue
			Else				
				Evaluacion_Funcionario.Evaluador.DbValue = ""
				Evaluacion_Funcionario.Evaluado.DbValue = ""
				Evaluacion_Funcionario.fecha.DbValue = ""
				Evaluacion_Funcionario.ano.DbValue = ""
				Evaluacion_Funcionario.semestre.DbValue = ""
				Evaluacion_Funcionario.G1_a1.DbValue = ""
				Evaluacion_Funcionario.G1_a2.DbValue = ""
				Evaluacion_Funcionario.G1_a3.DbValue = ""
				Evaluacion_Funcionario.G1_a.DbValue = ""
				Evaluacion_Funcionario.G1_b.DbValue = ""
				Evaluacion_Funcionario.G1_b1.DbValue = ""
				Evaluacion_Funcionario.G1_b2.DbValue = ""
				Evaluacion_Funcionario.G1_b3.DbValue = ""
				Evaluacion_Funcionario.G1_c.DbValue = ""
				Evaluacion_Funcionario.G1_c1.DbValue = ""
				Evaluacion_Funcionario.G1_c2.DbValue = ""
				Evaluacion_Funcionario.G1_c3.DbValue = ""
				Evaluacion_Funcionario.G1_promedio.DbValue = ""
				Evaluacion_Funcionario.G2_a.DbValue = ""
				Evaluacion_Funcionario.G2_a1.DbValue = ""
				Evaluacion_Funcionario.G2_a2.DbValue = ""
				Evaluacion_Funcionario.G2_a3.DbValue = ""
				Evaluacion_Funcionario.G2_b.DbValue = ""
				Evaluacion_Funcionario.G2_b1.DbValue = ""
				Evaluacion_Funcionario.G2_b2.DbValue = ""
				Evaluacion_Funcionario.G2_b3.DbValue = ""
				Evaluacion_Funcionario.G2_c.DbValue = ""
				Evaluacion_Funcionario.G2_c1.DbValue = ""
				Evaluacion_Funcionario.G2_c2.DbValue = ""
				Evaluacion_Funcionario.G2_c3.DbValue = ""
				Evaluacion_Funcionario.G2_promedio.DbValue = ""
				Evaluacion_Funcionario.observaciones.DbValue = ""
				Evaluacion_Funcionario.aceptada.DbValue = ""
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
				Evaluacion_Funcionario.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Evaluacion_Funcionario.StartGroup = StartGrp
				Else
					StartGrp = Evaluacion_Funcionario.StartGroup
				End If
			Else
				StartGrp = Evaluacion_Funcionario.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Evaluacion_Funcionario.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Evaluacion_Funcionario.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Evaluacion_Funcionario.StartGroup = StartGrp
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
			Evaluacion_Funcionario.StartGroup = StartGrp
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
				Evaluacion_Funcionario.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Evaluacion_Funcionario.StartGroup = StartGrp
			Else				
				If (Evaluacion_Funcionario.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Evaluacion_Funcionario.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 15 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Evaluacion_Funcionario.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Evaluacion_Funcionario.SqlSelectCount, Evaluacion_Funcionario.SqlWhere, Evaluacion_Funcionario.SqlGroupBy, Evaluacion_Funcionario.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Evaluacion_Funcionario.Row_Rendering()

			'
			' Render view codes
			'

			If (Evaluacion_Funcionario.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' Evaluador
				Evaluacion_Funcionario.Evaluador.ViewValue = Convert.ToString(Evaluacion_Funcionario.Evaluador.Summary)

				' Evaluado
				Evaluacion_Funcionario.Evaluado.ViewValue = Convert.ToString(Evaluacion_Funcionario.Evaluado.Summary)

				' fecha
				Evaluacion_Funcionario.fecha.ViewValue = Convert.ToString(Evaluacion_Funcionario.fecha.Summary)
				Evaluacion_Funcionario.fecha.ViewValue = ew_FormatDateTime(Evaluacion_Funcionario.fecha.ViewValue, 7)

				' ano
				Evaluacion_Funcionario.ano.ViewValue = Convert.ToString(Evaluacion_Funcionario.ano.Summary)

				' semestre
				Evaluacion_Funcionario.semestre.ViewValue = Convert.ToString(Evaluacion_Funcionario.semestre.Summary)

				' G1_a1
				Evaluacion_Funcionario.G1_a1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_a1.Summary)

				' G1_a2
				Evaluacion_Funcionario.G1_a2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_a2.Summary)

				' G1_a3
				Evaluacion_Funcionario.G1_a3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_a3.Summary)

				' G1_a
				Evaluacion_Funcionario.G1_a.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_a.Summary)

				' G1_b
				Evaluacion_Funcionario.G1_b.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_b.Summary)

				' G1_b1
				Evaluacion_Funcionario.G1_b1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_b1.Summary)

				' G1_b2
				Evaluacion_Funcionario.G1_b2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_b2.Summary)

				' G1_b3
				Evaluacion_Funcionario.G1_b3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_b3.Summary)

				' G1_c
				Evaluacion_Funcionario.G1_c.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_c.Summary)

				' G1_c1
				Evaluacion_Funcionario.G1_c1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_c1.Summary)

				' G1_c2
				Evaluacion_Funcionario.G1_c2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_c2.Summary)

				' G1_c3
				Evaluacion_Funcionario.G1_c3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_c3.Summary)

				' G1_promedio
				Evaluacion_Funcionario.G1_promedio.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_promedio.Summary)

				' G2_a
				Evaluacion_Funcionario.G2_a.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_a.Summary)

				' G2_a1
				Evaluacion_Funcionario.G2_a1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_a1.Summary)

				' G2_a2
				Evaluacion_Funcionario.G2_a2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_a2.Summary)

				' G2_a3
				Evaluacion_Funcionario.G2_a3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_a3.Summary)

				' G2_b
				Evaluacion_Funcionario.G2_b.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_b.Summary)

				' G2_b1
				Evaluacion_Funcionario.G2_b1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_b1.Summary)

				' G2_b2
				Evaluacion_Funcionario.G2_b2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_b2.Summary)

				' G2_b3
				Evaluacion_Funcionario.G2_b3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_b3.Summary)

				' G2_c
				Evaluacion_Funcionario.G2_c.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_c.Summary)

				' G2_c1
				Evaluacion_Funcionario.G2_c1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_c1.Summary)

				' G2_c2
				Evaluacion_Funcionario.G2_c2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_c2.Summary)

				' G2_c3
				Evaluacion_Funcionario.G2_c3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_c3.Summary)

				' G2_promedio
				Evaluacion_Funcionario.G2_promedio.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_promedio.Summary)

				' observaciones
				Evaluacion_Funcionario.observaciones.ViewValue = Convert.ToString(Evaluacion_Funcionario.observaciones.Summary)

				' aceptada
				Evaluacion_Funcionario.aceptada.ViewValue = ParentPage.ewrpt_BooleanName(Evaluacion_Funcionario.aceptada.Summary)
			Else

				' Evaluador
				Evaluacion_Funcionario.Evaluador.ViewValue = Convert.ToString(Evaluacion_Funcionario.Evaluador.CurrentValue)
				Evaluacion_Funcionario.Evaluador.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Evaluado
				Evaluacion_Funcionario.Evaluado.ViewValue = Convert.ToString(Evaluacion_Funcionario.Evaluado.CurrentValue)
				Evaluacion_Funcionario.Evaluado.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' fecha
				Evaluacion_Funcionario.fecha.ViewValue = Convert.ToString(Evaluacion_Funcionario.fecha.CurrentValue)
				Evaluacion_Funcionario.fecha.ViewValue = ew_FormatDateTime(Evaluacion_Funcionario.fecha.ViewValue, 7)
				Evaluacion_Funcionario.fecha.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ano
				Evaluacion_Funcionario.ano.ViewValue = Convert.ToString(Evaluacion_Funcionario.ano.CurrentValue)
				Evaluacion_Funcionario.ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' semestre
				Evaluacion_Funcionario.semestre.ViewValue = Convert.ToString(Evaluacion_Funcionario.semestre.CurrentValue)
				Evaluacion_Funcionario.semestre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_a1
				Evaluacion_Funcionario.G1_a1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_a1.CurrentValue)
				Evaluacion_Funcionario.G1_a1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_a2
				Evaluacion_Funcionario.G1_a2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_a2.CurrentValue)
				Evaluacion_Funcionario.G1_a2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_a3
				Evaluacion_Funcionario.G1_a3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_a3.CurrentValue)
				Evaluacion_Funcionario.G1_a3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_a
				Evaluacion_Funcionario.G1_a.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_a.CurrentValue)
				Evaluacion_Funcionario.G1_a.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_b
				Evaluacion_Funcionario.G1_b.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_b.CurrentValue)
				Evaluacion_Funcionario.G1_b.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_b1
				Evaluacion_Funcionario.G1_b1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_b1.CurrentValue)
				Evaluacion_Funcionario.G1_b1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_b2
				Evaluacion_Funcionario.G1_b2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_b2.CurrentValue)
				Evaluacion_Funcionario.G1_b2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_b3
				Evaluacion_Funcionario.G1_b3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_b3.CurrentValue)
				Evaluacion_Funcionario.G1_b3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_c
				Evaluacion_Funcionario.G1_c.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_c.CurrentValue)
				Evaluacion_Funcionario.G1_c.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_c1
				Evaluacion_Funcionario.G1_c1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_c1.CurrentValue)
				Evaluacion_Funcionario.G1_c1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_c2
				Evaluacion_Funcionario.G1_c2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_c2.CurrentValue)
				Evaluacion_Funcionario.G1_c2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_c3
				Evaluacion_Funcionario.G1_c3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_c3.CurrentValue)
				Evaluacion_Funcionario.G1_c3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G1_promedio
				Evaluacion_Funcionario.G1_promedio.ViewValue = Convert.ToString(Evaluacion_Funcionario.G1_promedio.CurrentValue)
				Evaluacion_Funcionario.G1_promedio.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_a
				Evaluacion_Funcionario.G2_a.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_a.CurrentValue)
				Evaluacion_Funcionario.G2_a.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_a1
				Evaluacion_Funcionario.G2_a1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_a1.CurrentValue)
				Evaluacion_Funcionario.G2_a1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_a2
				Evaluacion_Funcionario.G2_a2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_a2.CurrentValue)
				Evaluacion_Funcionario.G2_a2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_a3
				Evaluacion_Funcionario.G2_a3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_a3.CurrentValue)
				Evaluacion_Funcionario.G2_a3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_b
				Evaluacion_Funcionario.G2_b.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_b.CurrentValue)
				Evaluacion_Funcionario.G2_b.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_b1
				Evaluacion_Funcionario.G2_b1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_b1.CurrentValue)
				Evaluacion_Funcionario.G2_b1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_b2
				Evaluacion_Funcionario.G2_b2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_b2.CurrentValue)
				Evaluacion_Funcionario.G2_b2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_b3
				Evaluacion_Funcionario.G2_b3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_b3.CurrentValue)
				Evaluacion_Funcionario.G2_b3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_c
				Evaluacion_Funcionario.G2_c.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_c.CurrentValue)
				Evaluacion_Funcionario.G2_c.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_c1
				Evaluacion_Funcionario.G2_c1.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_c1.CurrentValue)
				Evaluacion_Funcionario.G2_c1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_c2
				Evaluacion_Funcionario.G2_c2.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_c2.CurrentValue)
				Evaluacion_Funcionario.G2_c2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_c3
				Evaluacion_Funcionario.G2_c3.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_c3.CurrentValue)
				Evaluacion_Funcionario.G2_c3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' G2_promedio
				Evaluacion_Funcionario.G2_promedio.ViewValue = Convert.ToString(Evaluacion_Funcionario.G2_promedio.CurrentValue)
				Evaluacion_Funcionario.G2_promedio.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' observaciones
				Evaluacion_Funcionario.observaciones.ViewValue = Convert.ToString(Evaluacion_Funcionario.observaciones.CurrentValue)
				Evaluacion_Funcionario.observaciones.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' aceptada
				Evaluacion_Funcionario.aceptada.ViewValue = ParentPage.ewrpt_BooleanName(Evaluacion_Funcionario.aceptada.CurrentValue)
				Evaluacion_Funcionario.aceptada.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' Evaluador
			Evaluacion_Funcionario.Evaluador.HrefValue = ""

			' Evaluado
			Evaluacion_Funcionario.Evaluado.HrefValue = ""

			' fecha
			Evaluacion_Funcionario.fecha.HrefValue = ""

			' ano
			Evaluacion_Funcionario.ano.HrefValue = ""

			' semestre
			Evaluacion_Funcionario.semestre.HrefValue = ""

			' G1_a1
			Evaluacion_Funcionario.G1_a1.HrefValue = ""

			' G1_a2
			Evaluacion_Funcionario.G1_a2.HrefValue = ""

			' G1_a3
			Evaluacion_Funcionario.G1_a3.HrefValue = ""

			' G1_a
			Evaluacion_Funcionario.G1_a.HrefValue = ""

			' G1_b
			Evaluacion_Funcionario.G1_b.HrefValue = ""

			' G1_b1
			Evaluacion_Funcionario.G1_b1.HrefValue = ""

			' G1_b2
			Evaluacion_Funcionario.G1_b2.HrefValue = ""

			' G1_b3
			Evaluacion_Funcionario.G1_b3.HrefValue = ""

			' G1_c
			Evaluacion_Funcionario.G1_c.HrefValue = ""

			' G1_c1
			Evaluacion_Funcionario.G1_c1.HrefValue = ""

			' G1_c2
			Evaluacion_Funcionario.G1_c2.HrefValue = ""

			' G1_c3
			Evaluacion_Funcionario.G1_c3.HrefValue = ""

			' G1_promedio
			Evaluacion_Funcionario.G1_promedio.HrefValue = ""

			' G2_a
			Evaluacion_Funcionario.G2_a.HrefValue = ""

			' G2_a1
			Evaluacion_Funcionario.G2_a1.HrefValue = ""

			' G2_a2
			Evaluacion_Funcionario.G2_a2.HrefValue = ""

			' G2_a3
			Evaluacion_Funcionario.G2_a3.HrefValue = ""

			' G2_b
			Evaluacion_Funcionario.G2_b.HrefValue = ""

			' G2_b1
			Evaluacion_Funcionario.G2_b1.HrefValue = ""

			' G2_b2
			Evaluacion_Funcionario.G2_b2.HrefValue = ""

			' G2_b3
			Evaluacion_Funcionario.G2_b3.HrefValue = ""

			' G2_c
			Evaluacion_Funcionario.G2_c.HrefValue = ""

			' G2_c1
			Evaluacion_Funcionario.G2_c1.HrefValue = ""

			' G2_c2
			Evaluacion_Funcionario.G2_c2.HrefValue = ""

			' G2_c3
			Evaluacion_Funcionario.G2_c3.HrefValue = ""

			' G2_promedio
			Evaluacion_Funcionario.G2_promedio.HrefValue = ""

			' observaciones
			Evaluacion_Funcionario.observaciones.HrefValue = ""

			' aceptada
			Evaluacion_Funcionario.aceptada.HrefValue = ""

			' Call Row_Rendered event
			Evaluacion_Funcionario.Row_Rendered()
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

			' Field Evaluador
			sSelect = "SELECT DISTINCT [Evaluador] FROM " + Evaluacion_Funcionario.SqlFrom
			sOrderBy = "[Evaluador] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Evaluacion_Funcionario.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Evaluacion_Funcionario.Evaluador.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Evaluado
			sSelect = "SELECT DISTINCT [Evaluado] FROM " + Evaluacion_Funcionario.SqlFrom
			sOrderBy = "[Evaluado] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Evaluacion_Funcionario.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Evaluacion_Funcionario.Evaluado.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ano
			sSelect = "SELECT DISTINCT [ano] FROM " + Evaluacion_Funcionario.SqlFrom
			sOrderBy = "[ano] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Evaluacion_Funcionario.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Evaluacion_Funcionario.ano.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field semestre
			sSelect = "SELECT DISTINCT [semestre] FROM " + Evaluacion_Funcionario.SqlFrom
			sOrderBy = "[semestre] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Evaluacion_Funcionario.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Evaluacion_Funcionario.semestre.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field Evaluador
				SetSessionDropDownValue(Evaluacion_Funcionario.Evaluador.DropDownValue, Evaluacion_Funcionario.Evaluador)

				' Field Evaluado
				SetSessionDropDownValue(Evaluacion_Funcionario.Evaluado.DropDownValue, Evaluacion_Funcionario.Evaluado)

				' Field ano
				SetSessionDropDownValue(Evaluacion_Funcionario.ano.DropDownValue, Evaluacion_Funcionario.ano)

				' Field semestre
				SetSessionDropDownValue(Evaluacion_Funcionario.semestre.DropDownValue, Evaluacion_Funcionario.semestre)
			bSetupFilter = True ' Set up filter required
		Else

				' Field Evaluador
				If (GetDropDownValue(Evaluacion_Funcionario.Evaluador)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Evaluacion_Funcionario.Evaluador.DropDownValue) Then
					If Not ew_SameStr(Evaluacion_Funcionario.Evaluador.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Evaluacion_Funcionario_Evaluador") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Evaluado
				If (GetDropDownValue(Evaluacion_Funcionario.Evaluado)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Evaluacion_Funcionario.Evaluado.DropDownValue) Then
					If Not ew_SameStr(Evaluacion_Funcionario.Evaluado.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Evaluacion_Funcionario_Evaluado") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ano
				If (GetDropDownValue(Evaluacion_Funcionario.ano)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Evaluacion_Funcionario.ano.DropDownValue) Then
					If Not ew_SameStr(Evaluacion_Funcionario.ano.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Evaluacion_Funcionario_ano") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field semestre
				If (GetDropDownValue(Evaluacion_Funcionario.semestre)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Evaluacion_Funcionario.semestre.DropDownValue) Then
					If Not ew_SameStr(Evaluacion_Funcionario.semestre.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Evaluacion_Funcionario_semestre") Is Nothing Then
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

			' Field Evaluador
			GetSessionDropDownValue(Evaluacion_Funcionario.Evaluador)

			' Field Evaluado
			GetSessionDropDownValue(Evaluacion_Funcionario.Evaluado)

			' Field ano
			GetSessionDropDownValue(Evaluacion_Funcionario.ano)

			' Field semestre
			GetSessionDropDownValue(Evaluacion_Funcionario.semestre)
		End If

		' Call page filter validated event
		Evaluacion_Funcionario.Page_FilterValidated()

		' Build SQL
		' Field Evaluador

		BuildDropDownFilter(Evaluacion_Funcionario.Evaluador, sFilter, "")

		' Field Evaluado
		BuildDropDownFilter(Evaluacion_Funcionario.Evaluado, sFilter, "")

		' Field ano
		BuildDropDownFilter(Evaluacion_Funcionario.ano, sFilter, "")

		' Field semestre
		BuildDropDownFilter(Evaluacion_Funcionario.semestre, sFilter, "")

		' Save parms to Session
		' Field Evaluador

		SetSessionDropDownValue(Evaluacion_Funcionario.Evaluador.DropDownValue, Evaluacion_Funcionario.Evaluador)

		' Field Evaluado
		SetSessionDropDownValue(Evaluacion_Funcionario.Evaluado.DropDownValue, Evaluacion_Funcionario.Evaluado)

		' Field ano
		SetSessionDropDownValue(Evaluacion_Funcionario.ano.DropDownValue, Evaluacion_Funcionario.ano)

		' Field semestre
		SetSessionDropDownValue(Evaluacion_Funcionario.semestre.DropDownValue, Evaluacion_Funcionario.semestre)

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
		If ew_Session("sv_Evaluacion_Funcionario_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Evaluacion_Funcionario_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Evaluacion_Funcionario_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Evaluacion_Funcionario_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Evaluacion_Funcionario_" + parm)
		End If
		If ew_Session("so1_Evaluacion_Funcionario_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Evaluacion_Funcionario_" + parm))
		End If
		If ew_Session("sc_Evaluacion_Funcionario_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Evaluacion_Funcionario_" + parm))
		End If
		If ew_Session("sv2_Evaluacion_Funcionario_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Evaluacion_Funcionario_" + parm)
		End If
		If ew_Session("so2_Evaluacion_Funcionario_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Evaluacion_Funcionario_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Evaluacion_Funcionario_" + parm) = fld.SearchValue
		ew_Session("so1_Evaluacion_Funcionario_" + parm) = fld.SearchOperator
		ew_Session("sc_Evaluacion_Funcionario_" + parm) = fld.SearchCondition
		ew_Session("sv2_Evaluacion_Funcionario_" + parm) = fld.SearchValue2
		ew_Session("so2_Evaluacion_Funcionario_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Evaluacion_Funcionario_" + parm) = ""
		ew_Session("so1_Evaluacion_Funcionario_" + parm) = "="
		ew_Session("sc_Evaluacion_Funcionario_" + parm) = "AND"
		ew_Session("sv2_Evaluacion_Funcionario_" + parm) = ""
		ew_Session("so2_Evaluacion_Funcionario_" + parm) = "="
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
		ew_Session("sel_Evaluacion_Funcionario_" & parm) = ""
		ew_Session("rf_Evaluacion_Funcionario_" & parm) = ""
		ew_Session("rt_Evaluacion_Funcionario_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Evaluacion_Funcionario.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Evaluacion_Funcionario_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Evaluacion_Funcionario_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Evaluacion_Funcionario_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field Evaluador

			Evaluacion_Funcionario.Evaluador.DefaultDropDownValue = EWRPT_INIT_VALUE
			Evaluacion_Funcionario.Evaluador.DropDownValue = Evaluacion_Funcionario.Evaluador.DefaultDropDownValue

			' Field Evaluado
			Evaluacion_Funcionario.Evaluado.DefaultDropDownValue = EWRPT_INIT_VALUE
			Evaluacion_Funcionario.Evaluado.DropDownValue = Evaluacion_Funcionario.Evaluado.DefaultDropDownValue

			' Field ano
			Evaluacion_Funcionario.ano.DefaultDropDownValue = EWRPT_INIT_VALUE
			Evaluacion_Funcionario.ano.DropDownValue = Evaluacion_Funcionario.ano.DefaultDropDownValue

			' Field semestre
			Evaluacion_Funcionario.semestre.DefaultDropDownValue = EWRPT_INIT_VALUE
			Evaluacion_Funcionario.semestre.DropDownValue = Evaluacion_Funcionario.semestre.DefaultDropDownValue

		' Set up default values for extended filters
		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check Evaluador dropdown filter
		If (NonTextFilterApplied(Evaluacion_Funcionario.Evaluador)) Then bFilterExist = True

		' Check Evaluado dropdown filter
		If (NonTextFilterApplied(Evaluacion_Funcionario.Evaluado)) Then bFilterExist = True

		' Check ano dropdown filter
		If (NonTextFilterApplied(Evaluacion_Funcionario.ano)) Then bFilterExist = True

		' Check semestre dropdown filter
		If (NonTextFilterApplied(Evaluacion_Funcionario.semestre)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field Evaluador
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Evaluacion_Funcionario.Evaluador, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Evaluacion_Funcionario.Evaluador.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Evaluado
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Evaluacion_Funcionario.Evaluado, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Evaluacion_Funcionario.Evaluado.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ano
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Evaluacion_Funcionario.ano, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Evaluacion_Funcionario.ano.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field semestre
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Evaluacion_Funcionario.semestre, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Evaluacion_Funcionario.semestre.FldCaption() & "<br>"
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
				Evaluacion_Funcionario.OrderBy = ""
				Evaluacion_Funcionario.StartGroup = 1
				Evaluacion_Funcionario.Evaluador.Sort = ""
				Evaluacion_Funcionario.Evaluado.Sort = ""
				Evaluacion_Funcionario.fecha.Sort = ""
				Evaluacion_Funcionario.ano.Sort = ""
				Evaluacion_Funcionario.semestre.Sort = ""
				Evaluacion_Funcionario.G1_a1.Sort = ""
				Evaluacion_Funcionario.G1_a2.Sort = ""
				Evaluacion_Funcionario.G1_a3.Sort = ""
				Evaluacion_Funcionario.G1_a.Sort = ""
				Evaluacion_Funcionario.G1_b.Sort = ""
				Evaluacion_Funcionario.G1_b1.Sort = ""
				Evaluacion_Funcionario.G1_b2.Sort = ""
				Evaluacion_Funcionario.G1_b3.Sort = ""
				Evaluacion_Funcionario.G1_c.Sort = ""
				Evaluacion_Funcionario.G1_c1.Sort = ""
				Evaluacion_Funcionario.G1_c2.Sort = ""
				Evaluacion_Funcionario.G1_c3.Sort = ""
				Evaluacion_Funcionario.G1_promedio.Sort = ""
				Evaluacion_Funcionario.G2_a.Sort = ""
				Evaluacion_Funcionario.G2_a1.Sort = ""
				Evaluacion_Funcionario.G2_a2.Sort = ""
				Evaluacion_Funcionario.G2_a3.Sort = ""
				Evaluacion_Funcionario.G2_b.Sort = ""
				Evaluacion_Funcionario.G2_b1.Sort = ""
				Evaluacion_Funcionario.G2_b2.Sort = ""
				Evaluacion_Funcionario.G2_b3.Sort = ""
				Evaluacion_Funcionario.G2_c.Sort = ""
				Evaluacion_Funcionario.G2_c1.Sort = ""
				Evaluacion_Funcionario.G2_c2.Sort = ""
				Evaluacion_Funcionario.G2_c3.Sort = ""
				Evaluacion_Funcionario.G2_promedio.Sort = ""
				Evaluacion_Funcionario.observaciones.Sort = ""
				Evaluacion_Funcionario.aceptada.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Evaluacion_Funcionario.CurrentOrder = ew_Get("order")
			Evaluacion_Funcionario.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Evaluacion_Funcionario.SortSql()
			Evaluacion_Funcionario.OrderBy = sSortSql
			Evaluacion_Funcionario.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Evaluacion_Funcionario.OrderBy)) Then
			Evaluacion_Funcionario.OrderBy = "[Evaluador] ASC, [ano] DESC, [semestre] DESC"
			Evaluacion_Funcionario.Evaluador.Sort = "ASC"
			Evaluacion_Funcionario.ano.Sort = "DESC"
			Evaluacion_Funcionario.semestre.Sort = "DESC"
		End If
		Return Evaluacion_Funcionario.OrderBy
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
		Evaluacion_Funcionario_summary = New crEvaluacion_Funcionario_summary(Me)
		Evaluacion_Funcionario_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Evaluacion_Funcionario_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Evaluacion_Funcionario_summary IsNot Nothing) Then Evaluacion_Funcionario_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Evaluacion_Funcionario.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Evaluacion_Funcionario_summary = new ewrpt_Page("Evaluacion_Funcionario_summary");
// page properties
Evaluacion_Funcionario_summary.PageID = "summary"; // page ID
Evaluacion_Funcionario_summary.FormID = "fEvaluacion_Funcionariosummaryfilter"; // form ID
var EWRPT_PAGE_ID = Evaluacion_Funcionario_summary.PageID;
// extend page with ValidateForm function
Evaluacion_Funcionario_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Evaluacion_Funcionario_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Evaluacion_Funcionario_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Evaluacion_Funcionario_summary.ValidateRequired = false; // no JavaScript validation
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
<% Evaluacion_Funcionario_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Evaluacion_Funcionario.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Evaluacion_Funcionario.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="ewTitle"><h1><%= Evaluacion_Funcionario.TableCaption() %></h1>
<% If (Evaluacion_Funcionario.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Evaluacion_Funcionario_summary.ExportExcelUrl %>"><img src="images/excel.png" /></a>
<% If (Evaluacion_Funcionario_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="Evaluacion_Funcionariosmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% Evaluacion_Funcionario_summary.ShowMessage() %>
<% If (Evaluacion_Funcionario.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Evaluacion_Funcionario.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (Evaluacion_Funcionario.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (Evaluacion_Funcionario.FilterPanelOption = 2 OrElse (Evaluacion_Funcionario.FilterPanelOption = 3 AndAlso Evaluacion_Funcionario_summary.FilterApplied) OrElse Evaluacion_Funcionario_summary.Filter = "0=101") Then
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
<form name="fEvaluacion_Funcionariosummaryfilter" id="fEvaluacion_Funcionariosummaryfilter" action="Evaluacion_Funcionariosmry.aspx" class="ewForm" onsubmit="return Evaluacion_Funcionario_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Evaluacion_Funcionario.semestre.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Evaluacion_Funcionario.Evaluador.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Evaluador" id="sv_Evaluador"<%= IIf(Evaluacion_Funcionario_summary.ClearExtFilter = "Evaluacion_Funcionario_Evaluador", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.Evaluador.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Evaluacion_Funcionario.Evaluador.CustomFilters.Count + Evaluacion_Funcionario.Evaluador.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Evaluacion_Funcionario.Evaluador.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Evaluador")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.Evaluador.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Evaluacion_Funcionario.Evaluador.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.Evaluador.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Evaluacion_Funcionario.Evaluado.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Evaluado" id="sv_Evaluado"<%= IIf(Evaluacion_Funcionario_summary.ClearExtFilter = "Evaluacion_Funcionario_Evaluado", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.Evaluado.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Evaluacion_Funcionario.Evaluado.CustomFilters.Count + Evaluacion_Funcionario.Evaluado.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Evaluacion_Funcionario.Evaluado.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Evaluado")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.Evaluado.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Evaluacion_Funcionario.Evaluado.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.Evaluado.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Evaluacion_Funcionario.ano.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ano" id="sv_ano"<%= IIf(Evaluacion_Funcionario_summary.ClearExtFilter = "Evaluacion_Funcionario_ano", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.ano.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Evaluacion_Funcionario.ano.CustomFilters.Count + Evaluacion_Funcionario.ano.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Evaluacion_Funcionario.ano.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ano")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.ano.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Evaluacion_Funcionario.ano.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.ano.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Evaluacion_Funcionario.semestre.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_semestre" id="sv_semestre"<%= IIf(Evaluacion_Funcionario_summary.ClearExtFilter = "Evaluacion_Funcionario_semestre", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.semestre.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Evaluacion_Funcionario.semestre.CustomFilters.Count + Evaluacion_Funcionario.semestre.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Evaluacion_Funcionario.semestre.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "semestre")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.semestre.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Evaluacion_Funcionario.semestre.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Evaluacion_Funcionario.semestre.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (Evaluacion_Funcionario.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Evaluacion_Funcionario_summary.ShowFilterList() %>
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
If (Evaluacion_Funcionario.ExportAll AndAlso ew_NotEmpty(Evaluacion_Funcionario.Export)) Then
	Evaluacion_Funcionario_summary.StopGrp = Evaluacion_Funcionario_summary.TotalGrps
Else
	Evaluacion_Funcionario_summary.StopGrp = Evaluacion_Funcionario_summary.StartGrp + Evaluacion_Funcionario_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Evaluacion_Funcionario_summary.StopGrp > Evaluacion_Funcionario_summary.TotalGrps) Then
	Evaluacion_Funcionario_summary.StopGrp = Evaluacion_Funcionario_summary.TotalGrps
End If
Evaluacion_Funcionario_summary.RecCount = 0

' Get first row
If (Evaluacion_Funcionario_summary.TotalGrps > 0) Then
	Evaluacion_Funcionario_summary.GetRow() ' ASPXRPT
	Evaluacion_Funcionario_summary.GrpCount = 1
End If
While ((Evaluacion_Funcionario_summary.HasRow AndAlso Evaluacion_Funcionario_summary.GrpIndex < Evaluacion_Funcionario_summary.StopGrp) OrElse Evaluacion_Funcionario_summary.ShowFirstHeader)

	' Show header
	If (Evaluacion_Funcionario_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.Evaluador.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.Evaluador))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.Evaluador.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.Evaluador) %>',0);"><%= Evaluacion_Funcionario.Evaluador.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.Evaluador.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.Evaluador.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.Evaluado.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.Evaluado))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.Evaluado.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.Evaluado) %>',0);"><%= Evaluacion_Funcionario.Evaluado.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.Evaluado.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.Evaluado.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.fecha.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.fecha))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.fecha.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.fecha) %>',0);"><%= Evaluacion_Funcionario.fecha.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.fecha.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.fecha.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.ano))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.ano) %>',0);"><%= Evaluacion_Funcionario.ano.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.semestre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.semestre))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.semestre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.semestre) %>',0);"><%= Evaluacion_Funcionario.semestre.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.semestre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.semestre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_a1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_a1))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_a1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_a1) %>',0);"><%= Evaluacion_Funcionario.G1_a1.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_a1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_a1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_a2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_a2))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_a2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_a2) %>',0);"><%= Evaluacion_Funcionario.G1_a2.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_a2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_a2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_a3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_a3))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_a3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_a3) %>',0);"><%= Evaluacion_Funcionario.G1_a3.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_a3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_a3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_a.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_a))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_a.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_a) %>',0);"><%= Evaluacion_Funcionario.G1_a.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_a.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_a.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_b.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_b))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_b.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_b) %>',0);"><%= Evaluacion_Funcionario.G1_b.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_b.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_b.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_b1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_b1))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_b1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_b1) %>',0);"><%= Evaluacion_Funcionario.G1_b1.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_b1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_b1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_b2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_b2))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_b2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_b2) %>',0);"><%= Evaluacion_Funcionario.G1_b2.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_b2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_b2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_b3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_b3))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_b3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_b3) %>',0);"><%= Evaluacion_Funcionario.G1_b3.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_b3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_b3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_c.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_c))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_c.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_c) %>',0);"><%= Evaluacion_Funcionario.G1_c.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_c.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_c.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_c1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_c1))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_c1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_c1) %>',0);"><%= Evaluacion_Funcionario.G1_c1.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_c1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_c1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_c2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_c2))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_c2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_c2) %>',0);"><%= Evaluacion_Funcionario.G1_c2.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_c2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_c2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_c3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_c3))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_c3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_c3) %>',0);"><%= Evaluacion_Funcionario.G1_c3.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_c3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_c3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G1_promedio.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_promedio))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G1_promedio.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G1_promedio) %>',0);"><%= Evaluacion_Funcionario.G1_promedio.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G1_promedio.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G1_promedio.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_a.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_a))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_a.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_a) %>',0);"><%= Evaluacion_Funcionario.G2_a.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_a.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_a.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_a1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_a1))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_a1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_a1) %>',0);"><%= Evaluacion_Funcionario.G2_a1.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_a1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_a1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_a2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_a2))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_a2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_a2) %>',0);"><%= Evaluacion_Funcionario.G2_a2.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_a2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_a2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_a3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_a3))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_a3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_a3) %>',0);"><%= Evaluacion_Funcionario.G2_a3.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_a3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_a3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_b.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_b))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_b.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_b) %>',0);"><%= Evaluacion_Funcionario.G2_b.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_b.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_b.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_b1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_b1))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_b1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_b1) %>',0);"><%= Evaluacion_Funcionario.G2_b1.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_b1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_b1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_b2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_b2))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_b2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_b2) %>',0);"><%= Evaluacion_Funcionario.G2_b2.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_b2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_b2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_b3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_b3))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_b3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_b3) %>',0);"><%= Evaluacion_Funcionario.G2_b3.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_b3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_b3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_c.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_c))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_c.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_c) %>',0);"><%= Evaluacion_Funcionario.G2_c.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_c.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_c.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_c1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_c1))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_c1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_c1) %>',0);"><%= Evaluacion_Funcionario.G2_c1.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_c1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_c1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_c2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_c2))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_c2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_c2) %>',0);"><%= Evaluacion_Funcionario.G2_c2.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_c2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_c2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_c3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_c3))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_c3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_c3) %>',0);"><%= Evaluacion_Funcionario.G2_c3.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_c3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_c3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.G2_promedio.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_promedio))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.G2_promedio.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.G2_promedio) %>',0);"><%= Evaluacion_Funcionario.G2_promedio.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.G2_promedio.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.G2_promedio.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.observaciones.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.observaciones))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.observaciones.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.observaciones) %>',0);"><%= Evaluacion_Funcionario.observaciones.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.observaciones.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.observaciones.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Evaluacion_Funcionario.Export)) Then %>
<%= Evaluacion_Funcionario.aceptada.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.aceptada))) Then %>
		<td style="vertical-align: bottom;"><%= Evaluacion_Funcionario.aceptada.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Evaluacion_Funcionario.SortUrl(Evaluacion_Funcionario.aceptada) %>',0);"><%= Evaluacion_Funcionario.aceptada.FldCaption() %></td><td style="width: 10px;">
		<% If (Evaluacion_Funcionario.aceptada.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Evaluacion_Funcionario.aceptada.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Evaluacion_Funcionario_summary.ShowFirstHeader = False
	End If
	Evaluacion_Funcionario_summary.RecCount += 1

		' Render detail row
		Evaluacion_Funcionario.ResetCSS()
		Evaluacion_Funcionario.RowType = EWRPT_ROWTYPE_DETAIL
		Evaluacion_Funcionario_summary.RenderRow()
%>
	<tr<%= Evaluacion_Funcionario.RowAttributes() %>>
		<td<%= Evaluacion_Funcionario.Evaluador.CellAttributes %>>
<div<%= Evaluacion_Funcionario.Evaluador.ViewAttributes%>><%= Evaluacion_Funcionario.Evaluador.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.Evaluado.CellAttributes %>>
<div<%= Evaluacion_Funcionario.Evaluado.ViewAttributes%>><%= Evaluacion_Funcionario.Evaluado.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.fecha.CellAttributes %>>
<div<%= Evaluacion_Funcionario.fecha.ViewAttributes%>><%= Evaluacion_Funcionario.fecha.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.ano.CellAttributes %>>
<div<%= Evaluacion_Funcionario.ano.ViewAttributes%>><%= Evaluacion_Funcionario.ano.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.semestre.CellAttributes %>>
<div<%= Evaluacion_Funcionario.semestre.ViewAttributes%>><%= Evaluacion_Funcionario.semestre.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_a1.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_a1.ViewAttributes%>><%= Evaluacion_Funcionario.G1_a1.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_a2.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_a2.ViewAttributes%>><%= Evaluacion_Funcionario.G1_a2.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_a3.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_a3.ViewAttributes%>><%= Evaluacion_Funcionario.G1_a3.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_a.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_a.ViewAttributes%>><%= Evaluacion_Funcionario.G1_a.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_b.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_b.ViewAttributes%>><%= Evaluacion_Funcionario.G1_b.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_b1.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_b1.ViewAttributes%>><%= Evaluacion_Funcionario.G1_b1.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_b2.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_b2.ViewAttributes%>><%= Evaluacion_Funcionario.G1_b2.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_b3.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_b3.ViewAttributes%>><%= Evaluacion_Funcionario.G1_b3.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_c.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_c.ViewAttributes%>><%= Evaluacion_Funcionario.G1_c.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_c1.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_c1.ViewAttributes%>><%= Evaluacion_Funcionario.G1_c1.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_c2.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_c2.ViewAttributes%>><%= Evaluacion_Funcionario.G1_c2.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_c3.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_c3.ViewAttributes%>><%= Evaluacion_Funcionario.G1_c3.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G1_promedio.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G1_promedio.ViewAttributes%>><%= Evaluacion_Funcionario.G1_promedio.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_a.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_a.ViewAttributes%>><%= Evaluacion_Funcionario.G2_a.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_a1.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_a1.ViewAttributes%>><%= Evaluacion_Funcionario.G2_a1.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_a2.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_a2.ViewAttributes%>><%= Evaluacion_Funcionario.G2_a2.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_a3.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_a3.ViewAttributes%>><%= Evaluacion_Funcionario.G2_a3.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_b.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_b.ViewAttributes%>><%= Evaluacion_Funcionario.G2_b.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_b1.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_b1.ViewAttributes%>><%= Evaluacion_Funcionario.G2_b1.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_b2.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_b2.ViewAttributes%>><%= Evaluacion_Funcionario.G2_b2.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_b3.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_b3.ViewAttributes%>><%= Evaluacion_Funcionario.G2_b3.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_c.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_c.ViewAttributes%>><%= Evaluacion_Funcionario.G2_c.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_c1.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_c1.ViewAttributes%>><%= Evaluacion_Funcionario.G2_c1.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_c2.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_c2.ViewAttributes%>><%= Evaluacion_Funcionario.G2_c2.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_c3.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_c3.ViewAttributes%>><%= Evaluacion_Funcionario.G2_c3.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.G2_promedio.CellAttributes %>>
<div<%= Evaluacion_Funcionario.G2_promedio.ViewAttributes%>><%= Evaluacion_Funcionario.G2_promedio.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.observaciones.CellAttributes %>>
<div<%= Evaluacion_Funcionario.observaciones.ViewAttributes%>><%= Evaluacion_Funcionario.observaciones.ListViewValue%></div>
</td>
		<td<%= Evaluacion_Funcionario.aceptada.CellAttributes %>>
<% If ew_SameText(Evaluacion_Funcionario.aceptada.CurrentValue, "true") OrElse ew_SameText(Evaluacion_Funcionario.aceptada.CurrentValue, "yes") OrElse ew_SameText(Evaluacion_Funcionario.aceptada.CurrentValue, "T") OrElse ew_SameText(Evaluacion_Funcionario.aceptada.CurrentValue, "Y") OrElse ew_SameText(Evaluacion_Funcionario.aceptada.CurrentValue, "1") Then %>
<input type="checkbox" value="<%= Evaluacion_Funcionario.aceptada.ViewValue %>" checked="checked" onclick="this.form.reset();" disabled="disabled" />
<% Else %>
<input type="checkbox" value="<%= Evaluacion_Funcionario.aceptada.ViewValue %>" onclick="this.form.reset();" disabled="disabled" />
<% End If %>
</td>
	</tr>
<%

		' Accumulate page summary
		Evaluacion_Funcionario_summary.AccumulateSummary()

		' Get next record
		Evaluacion_Funcionario_summary.GetRow() ' ASPXRPT
		Evaluacion_Funcionario_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Evaluacion_Funcionario_summary.TotalGrps > 0) Then
	Evaluacion_Funcionario.ResetCSS()
	Evaluacion_Funcionario.RowType = EWRPT_ROWTYPE_TOTAL
	Evaluacion_Funcionario.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Evaluacion_Funcionario.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Evaluacion_Funcionario.RowAttrs("class") = "ewRptGrandSummary"
	Evaluacion_Funcionario_summary.RenderRow()
%>
	<!-- tr><td colspan="33"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Evaluacion_Funcionario.RowAttributes() %>><td colspan="33"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Evaluacion_Funcionario_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Evaluacion_Funcionario.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Evaluacion_Funcionario_summary.Pager Is Nothing Then Evaluacion_Funcionario_summary.Pager = New cPrevNextPager(Evaluacion_Funcionario_summary.StartGrp, Evaluacion_Funcionario_summary.DisplayGrps, Evaluacion_Funcionario_summary.TotalGrps) %>
<% If Evaluacion_Funcionario_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Evaluacion_Funcionario_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Evaluacion_Funcionariosmry.aspx?start=<%= Evaluacion_Funcionario_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Evaluacion_Funcionario_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Evaluacion_Funcionariosmry.aspx?start=<%= Evaluacion_Funcionario_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Evaluacion_Funcionario_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Evaluacion_Funcionario_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Evaluacion_Funcionariosmry.aspx?start=<%= Evaluacion_Funcionario_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Evaluacion_Funcionario_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Evaluacion_Funcionariosmry.aspx?start=<%= Evaluacion_Funcionario_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Evaluacion_Funcionario_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Evaluacion_Funcionario_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Evaluacion_Funcionario_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Evaluacion_Funcionario_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Evaluacion_Funcionario_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Evaluacion_Funcionario_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If Evaluacion_Funcionario_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="15"<% If Evaluacion_Funcionario_summary.DisplayGrps = 15 Then Response.Write(" selected=""selected""") %>>15</option>
<option value="20"<% If Evaluacion_Funcionario_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Evaluacion_Funcionario_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
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
<% If (Evaluacion_Funcionario.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Evaluacion_Funcionario.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Evaluacion_Funcionario.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Evaluacion_Funcionario_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Evaluacion_Funcionario.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
