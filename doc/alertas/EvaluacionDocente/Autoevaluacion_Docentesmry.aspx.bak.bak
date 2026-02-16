<%@ Page ClassName="Autoevaluacion_Docentesmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_EncuestaDocenteAutoevaluacion" %>
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
	Public Autoevaluacion_Docente As crAutoevaluacion_Docente = Nothing

	'
	' Table class (for Autoevaluacion_Docente)
	'
	Public Class crAutoevaluacion_Docente
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
				Return "Autoevaluacion_Docente"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Autoevaluacion_Docente"
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

		Public RUT As crField

		Public PROFESOR As crField

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

			' RUT
			RUT = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_RUT", "RUT", "matricula.SEK_Encuesta_Docente_Autoev.RUT", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' PROFESOR
			PROFESOR = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_PROFESOR", "PROFESOR", "matricula.SEK_Encuesta_Docente_Autoev.PROFESOR", 200, EWRPT_DATATYPE_STRING, -1)
			PROFESOR.Page = APage
			PROFESOR.ParentPage = APage.ParentPage
			Fields.Add("PROFESOR", PROFESOR)
			PROFESOR.DateFilter = ""
			PROFESOR.SqlSelect = ""
			PROFESOR.SqlOrderBy = ""

			' Carrera
			Carrera = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_Carrera", "Carrera", "matricula.SEK_Encuesta_Docente_Autoev.Carrera", 200, EWRPT_DATATYPE_STRING, -1)
			Carrera.Page = APage
			Carrera.ParentPage = APage.ParentPage
			Fields.Add("Carrera", Carrera)
			Carrera.DateFilter = ""
			Carrera.SqlSelect = ""
			Carrera.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_NOMBRE_C", "NOMBRE_C", "matricula.SEK_Encuesta_Docente_Autoev.NOMBRE_C", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' Asignatura
			Asignatura = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_Asignatura", "Asignatura", "matricula.SEK_Encuesta_Docente_Autoev.Asignatura", 200, EWRPT_DATATYPE_STRING, -1)
			Asignatura.Page = APage
			Asignatura.ParentPage = APage.ParentPage
			Fields.Add("Asignatura", Asignatura)
			Asignatura.DateFilter = ""
			Asignatura.SqlSelect = ""
			Asignatura.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_NOMBRE", "NOMBRE", "matricula.SEK_Encuesta_Docente_Autoev.NOMBRE", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' Seccion
			Seccion = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_Seccion", "Seccion", "matricula.SEK_Encuesta_Docente_Autoev.Seccion", 3, EWRPT_DATATYPE_NUMBER, -1)
			Seccion.Page = APage
			Seccion.ParentPage = APage.ParentPage
			Seccion.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Seccion", Seccion)
			Seccion.DateFilter = ""
			Seccion.SqlSelect = ""
			Seccion.SqlOrderBy = ""

			' Jornada
			Jornada = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_Jornada", "Jornada", "matricula.SEK_Encuesta_Docente_Autoev.Jornada", 200, EWRPT_DATATYPE_STRING, -1)
			Jornada.Page = APage
			Jornada.ParentPage = APage.ParentPage
			Fields.Add("Jornada", Jornada)
			Jornada.DateFilter = ""
			Jornada.SqlSelect = ""
			Jornada.SqlOrderBy = ""

			' Periodo
			Periodo = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_Periodo", "Periodo", "matricula.SEK_Encuesta_Docente_Autoev.Periodo", 200, EWRPT_DATATYPE_STRING, -1)
			Periodo.Page = APage
			Periodo.ParentPage = APage.ParentPage
			Fields.Add("Periodo", Periodo)
			Periodo.DateFilter = ""
			Periodo.SqlSelect = ""
			Periodo.SqlOrderBy = ""

			' Ano
			Ano = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_Ano", "Ano", "matricula.SEK_Encuesta_Docente_Autoev.Ano", 3, EWRPT_DATATYPE_NUMBER, -1)
			Ano.Page = APage
			Ano.ParentPage = APage.ParentPage
			Ano.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Ano", Ano)
			Ano.DateFilter = ""
			Ano.SqlSelect = ""
			Ano.SqlOrderBy = ""

			' fecha
			fecha = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_fecha", "fecha", "matricula.SEK_Encuesta_Docente_Autoev.fecha", 135, EWRPT_DATATYPE_DATE, 7)
			fecha.Page = APage
			fecha.ParentPage = APage.ParentPage
			fecha.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("fecha", fecha)
			fecha.DateFilter = ""
			fecha.SqlSelect = ""
			fecha.SqlOrderBy = ""

			' p1
			p1 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p1", "p1", "matricula.SEK_Encuesta_Docente_Autoev.p1", 200, EWRPT_DATATYPE_STRING, -1)
			p1.Page = APage
			p1.ParentPage = APage.ParentPage
			Fields.Add("p1", p1)
			p1.DateFilter = ""
			p1.SqlSelect = ""
			p1.SqlOrderBy = ""

			' p2
			p2 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p2", "p2", "matricula.SEK_Encuesta_Docente_Autoev.p2", 200, EWRPT_DATATYPE_STRING, -1)
			p2.Page = APage
			p2.ParentPage = APage.ParentPage
			Fields.Add("p2", p2)
			p2.DateFilter = ""
			p2.SqlSelect = ""
			p2.SqlOrderBy = ""

			' p3
			p3 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p3", "p3", "matricula.SEK_Encuesta_Docente_Autoev.p3", 200, EWRPT_DATATYPE_STRING, -1)
			p3.Page = APage
			p3.ParentPage = APage.ParentPage
			Fields.Add("p3", p3)
			p3.DateFilter = ""
			p3.SqlSelect = ""
			p3.SqlOrderBy = ""

			' p4
			p4 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p4", "p4", "matricula.SEK_Encuesta_Docente_Autoev.p4", 200, EWRPT_DATATYPE_STRING, -1)
			p4.Page = APage
			p4.ParentPage = APage.ParentPage
			Fields.Add("p4", p4)
			p4.DateFilter = ""
			p4.SqlSelect = ""
			p4.SqlOrderBy = ""

			' p5
			p5 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p5", "p5", "matricula.SEK_Encuesta_Docente_Autoev.p5", 200, EWRPT_DATATYPE_STRING, -1)
			p5.Page = APage
			p5.ParentPage = APage.ParentPage
			Fields.Add("p5", p5)
			p5.DateFilter = ""
			p5.SqlSelect = ""
			p5.SqlOrderBy = ""

			' p6
			p6 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p6", "p6", "matricula.SEK_Encuesta_Docente_Autoev.p6", 200, EWRPT_DATATYPE_STRING, -1)
			p6.Page = APage
			p6.ParentPage = APage.ParentPage
			Fields.Add("p6", p6)
			p6.DateFilter = ""
			p6.SqlSelect = ""
			p6.SqlOrderBy = ""

			' p7
			p7 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p7", "p7", "matricula.SEK_Encuesta_Docente_Autoev.p7", 200, EWRPT_DATATYPE_STRING, -1)
			p7.Page = APage
			p7.ParentPage = APage.ParentPage
			Fields.Add("p7", p7)
			p7.DateFilter = ""
			p7.SqlSelect = ""
			p7.SqlOrderBy = ""

			' p8
			p8 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p8", "p8", "matricula.SEK_Encuesta_Docente_Autoev.p8", 200, EWRPT_DATATYPE_STRING, -1)
			p8.Page = APage
			p8.ParentPage = APage.ParentPage
			Fields.Add("p8", p8)
			p8.DateFilter = ""
			p8.SqlSelect = ""
			p8.SqlOrderBy = ""

			' p9
			p9 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p9", "p9", "matricula.SEK_Encuesta_Docente_Autoev.p9", 200, EWRPT_DATATYPE_STRING, -1)
			p9.Page = APage
			p9.ParentPage = APage.ParentPage
			Fields.Add("p9", p9)
			p9.DateFilter = ""
			p9.SqlSelect = ""
			p9.SqlOrderBy = ""

			' p10
			p10 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p10", "p10", "matricula.SEK_Encuesta_Docente_Autoev.p10", 200, EWRPT_DATATYPE_STRING, -1)
			p10.Page = APage
			p10.ParentPage = APage.ParentPage
			Fields.Add("p10", p10)
			p10.DateFilter = ""
			p10.SqlSelect = ""
			p10.SqlOrderBy = ""

			' p11
			p11 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p11", "p11", "matricula.SEK_Encuesta_Docente_Autoev.p11", 200, EWRPT_DATATYPE_STRING, -1)
			p11.Page = APage
			p11.ParentPage = APage.ParentPage
			Fields.Add("p11", p11)
			p11.DateFilter = ""
			p11.SqlSelect = ""
			p11.SqlOrderBy = ""

			' p12
			p12 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p12", "p12", "matricula.SEK_Encuesta_Docente_Autoev.p12", 200, EWRPT_DATATYPE_STRING, -1)
			p12.Page = APage
			p12.ParentPage = APage.ParentPage
			Fields.Add("p12", p12)
			p12.DateFilter = ""
			p12.SqlSelect = ""
			p12.SqlOrderBy = ""

			' p13
			p13 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p13", "p13", "matricula.SEK_Encuesta_Docente_Autoev.p13", 200, EWRPT_DATATYPE_STRING, -1)
			p13.Page = APage
			p13.ParentPage = APage.ParentPage
			Fields.Add("p13", p13)
			p13.DateFilter = ""
			p13.SqlSelect = ""
			p13.SqlOrderBy = ""

			' p14
			p14 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p14", "p14", "matricula.SEK_Encuesta_Docente_Autoev.p14", 200, EWRPT_DATATYPE_STRING, -1)
			p14.Page = APage
			p14.ParentPage = APage.ParentPage
			Fields.Add("p14", p14)
			p14.DateFilter = ""
			p14.SqlSelect = ""
			p14.SqlOrderBy = ""

			' p15
			p15 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p15", "p15", "matricula.SEK_Encuesta_Docente_Autoev.p15", 200, EWRPT_DATATYPE_STRING, -1)
			p15.Page = APage
			p15.ParentPage = APage.ParentPage
			Fields.Add("p15", p15)
			p15.DateFilter = ""
			p15.SqlSelect = ""
			p15.SqlOrderBy = ""

			' p16
			p16 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p16", "p16", "matricula.SEK_Encuesta_Docente_Autoev.p16", 200, EWRPT_DATATYPE_STRING, -1)
			p16.Page = APage
			p16.ParentPage = APage.ParentPage
			Fields.Add("p16", p16)
			p16.DateFilter = ""
			p16.SqlSelect = ""
			p16.SqlOrderBy = ""

			' p17
			p17 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p17", "p17", "matricula.SEK_Encuesta_Docente_Autoev.p17", 200, EWRPT_DATATYPE_STRING, -1)
			p17.Page = APage
			p17.ParentPage = APage.ParentPage
			Fields.Add("p17", p17)
			p17.DateFilter = ""
			p17.SqlSelect = ""
			p17.SqlOrderBy = ""

			' p18
			p18 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p18", "p18", "matricula.SEK_Encuesta_Docente_Autoev.p18", 200, EWRPT_DATATYPE_STRING, -1)
			p18.Page = APage
			p18.ParentPage = APage.ParentPage
			Fields.Add("p18", p18)
			p18.DateFilter = ""
			p18.SqlSelect = ""
			p18.SqlOrderBy = ""

			' p19
			p19 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p19", "p19", "matricula.SEK_Encuesta_Docente_Autoev.p19", 200, EWRPT_DATATYPE_STRING, -1)
			p19.Page = APage
			p19.ParentPage = APage.ParentPage
			Fields.Add("p19", p19)
			p19.DateFilter = ""
			p19.SqlSelect = ""
			p19.SqlOrderBy = ""

			' p20
			p20 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p20", "p20", "matricula.SEK_Encuesta_Docente_Autoev.p20", 200, EWRPT_DATATYPE_STRING, -1)
			p20.Page = APage
			p20.ParentPage = APage.ParentPage
			Fields.Add("p20", p20)
			p20.DateFilter = ""
			p20.SqlSelect = ""
			p20.SqlOrderBy = ""

			' p21
			p21 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p21", "p21", "matricula.SEK_Encuesta_Docente_Autoev.p21", 200, EWRPT_DATATYPE_STRING, -1)
			p21.Page = APage
			p21.ParentPage = APage.ParentPage
			Fields.Add("p21", p21)
			p21.DateFilter = ""
			p21.SqlSelect = ""
			p21.SqlOrderBy = ""

			' p22
			p22 = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_p22", "p22", "matricula.SEK_Encuesta_Docente_Autoev.p22", 200, EWRPT_DATATYPE_STRING, -1)
			p22.Page = APage
			p22.ParentPage = APage.ParentPage
			Fields.Add("p22", p22)
			p22.DateFilter = ""
			p22.SqlSelect = ""
			p22.SqlOrderBy = ""

			' observacion
			observacion = new crField("Autoevaluacion_Docente", "Autoevaluacion_Docente", "x_observacion", "observacion", "matricula.SEK_Encuesta_Docente_Autoev.observacion", 201, EWRPT_DATATYPE_MEMO, -1)
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
				Return "matricula.SEK_Encuesta_Docente_Autoev"
			End Get
		End Property

		Public ReadOnly Property SqlSelect As String ' Select
			Get
				Return "SELECT matricula.SEK_Encuesta_Docente_Autoev.PROFESOR, matricula.SEK_Encuesta_Docente_Autoev.RUT, matricula.SEK_Encuesta_Docente_Autoev.Carrera, matricula.SEK_Encuesta_Docente_Autoev.Asignatura, matricula.SEK_Encuesta_Docente_Autoev.NOMBRE, matricula.SEK_Encuesta_Docente_Autoev.Seccion, matricula.SEK_Encuesta_Docente_Autoev.Jornada, matricula.SEK_Encuesta_Docente_Autoev.Periodo, matricula.SEK_Encuesta_Docente_Autoev.Ano, matricula.SEK_Encuesta_Docente_Autoev.fecha, matricula.SEK_Encuesta_Docente_Autoev.p1, matricula.SEK_Encuesta_Docente_Autoev.p2, matricula.SEK_Encuesta_Docente_Autoev.p3, matricula.SEK_Encuesta_Docente_Autoev.p4, matricula.SEK_Encuesta_Docente_Autoev.p5, matricula.SEK_Encuesta_Docente_Autoev.p6, matricula.SEK_Encuesta_Docente_Autoev.p7, matricula.SEK_Encuesta_Docente_Autoev.p8, matricula.SEK_Encuesta_Docente_Autoev.p9, matricula.SEK_Encuesta_Docente_Autoev.p10, matricula.SEK_Encuesta_Docente_Autoev.p11, matricula.SEK_Encuesta_Docente_Autoev.p12, matricula.SEK_Encuesta_Docente_Autoev.p13, matricula.SEK_Encuesta_Docente_Autoev.p14, matricula.SEK_Encuesta_Docente_Autoev.p15, matricula.SEK_Encuesta_Docente_Autoev.p16, matricula.SEK_Encuesta_Docente_Autoev.p17, matricula.SEK_Encuesta_Docente_Autoev.p18, matricula.SEK_Encuesta_Docente_Autoev.p19, matricula.SEK_Encuesta_Docente_Autoev.p20, matricula.SEK_Encuesta_Docente_Autoev.p21, matricula.SEK_Encuesta_Docente_Autoev.p22, matricula.SEK_Encuesta_Docente_Autoev.observacion, matricula.SEK_Encuesta_Docente_Autoev.NOMBRE_C FROM " + SqlFrom
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
	Public Autoevaluacion_Docente_summary As crAutoevaluacion_Docente_summary

	'
	' Page class
	'
	Public Class crAutoevaluacion_Docente_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Autoevaluacion_Docente.UseTokenInUrl) Then
				sUrl &= "t=" & Autoevaluacion_Docente.TableVar & "&" ' Add page token
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
			If (Autoevaluacion_Docente.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Autoevaluacion_Docente.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Autoevaluacion_Docente.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Autoevaluacion_Docentesmry 
			Get
				Return CType(m_ParentPage, Autoevaluacion_Docentesmry)
			End Get
		End Property

		' Table object (Autoevaluacion_Docente)
		Public Property Autoevaluacion_Docente As crAutoevaluacion_Docente 
			Get		
				Return AspNetPage.Autoevaluacion_Docente ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAutoevaluacion_Docente)
				AspNetPage.Autoevaluacion_Docente = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_EncuestaDocenteAutoevaluacion)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Autoevaluacion_Docente_summary"
			m_PageObjTypeName = "crAutoevaluacion_Docente_summary"

			' Table name
			m_TableName = "Autoevaluacion_Docente"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Autoevaluacion_Docente)
			Autoevaluacion_Docente = New crAutoevaluacion_Docente(Me)			

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
				Autoevaluacion_Docente.Export = ew_Get("export")
			End If
			gsExport = Autoevaluacion_Docente.Export ' Get export parameter, used in header
			gsExportFile = Autoevaluacion_Docente.TableVar ' Get export file, used in header
			If (Autoevaluacion_Docente.Export = "excel") Then
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

		Public Val As Object() = New Object(34) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(34) {}

		Public GrandMn As Object() = New Object(34) {}

		Public GrandMx As Object() = New Object(34) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 35 ' No. of fields
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
			Autoevaluacion_Docente.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Autoevaluacion_Docente.SqlSelect, Autoevaluacion_Docente.SqlWhere, Autoevaluacion_Docente.SqlGroupBy, Autoevaluacion_Docente.SqlHaving, Autoevaluacion_Docente.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Autoevaluacion_Docente.ExportAll AndAlso ew_NotEmpty(Autoevaluacion_Docente.Export)) Then
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
				Autoevaluacion_Docente.PROFESOR.DbValue = Row("PROFESOR")
				Autoevaluacion_Docente.RUT.DbValue = Row("RUT")
				Autoevaluacion_Docente.Carrera.DbValue = Row("Carrera")
				Autoevaluacion_Docente.Asignatura.DbValue = Row("Asignatura")
				Autoevaluacion_Docente.NOMBRE.DbValue = Row("NOMBRE")
				Autoevaluacion_Docente.Seccion.DbValue = Row("Seccion")
				Autoevaluacion_Docente.Jornada.DbValue = Row("Jornada")
				Autoevaluacion_Docente.Periodo.DbValue = Row("Periodo")
				Autoevaluacion_Docente.Ano.DbValue = Row("Ano")
				Autoevaluacion_Docente.fecha.DbValue = Row("fecha")
				Autoevaluacion_Docente.p1.DbValue = Row("p1")
				Autoevaluacion_Docente.p2.DbValue = Row("p2")
				Autoevaluacion_Docente.p3.DbValue = Row("p3")
				Autoevaluacion_Docente.p4.DbValue = Row("p4")
				Autoevaluacion_Docente.p5.DbValue = Row("p5")
				Autoevaluacion_Docente.p6.DbValue = Row("p6")
				Autoevaluacion_Docente.p7.DbValue = Row("p7")
				Autoevaluacion_Docente.p8.DbValue = Row("p8")
				Autoevaluacion_Docente.p9.DbValue = Row("p9")
				Autoevaluacion_Docente.p10.DbValue = Row("p10")
				Autoevaluacion_Docente.p11.DbValue = Row("p11")
				Autoevaluacion_Docente.p12.DbValue = Row("p12")
				Autoevaluacion_Docente.p13.DbValue = Row("p13")
				Autoevaluacion_Docente.p14.DbValue = Row("p14")
				Autoevaluacion_Docente.p15.DbValue = Row("p15")
				Autoevaluacion_Docente.p16.DbValue = Row("p16")
				Autoevaluacion_Docente.p17.DbValue = Row("p17")
				Autoevaluacion_Docente.p18.DbValue = Row("p18")
				Autoevaluacion_Docente.p19.DbValue = Row("p19")
				Autoevaluacion_Docente.p20.DbValue = Row("p20")
				Autoevaluacion_Docente.p21.DbValue = Row("p21")
				Autoevaluacion_Docente.p22.DbValue = Row("p22")
				Autoevaluacion_Docente.observacion.DbValue = Row("observacion")
				Autoevaluacion_Docente.NOMBRE_C.DbValue = Row("NOMBRE_C")
				Val(1) = Autoevaluacion_Docente.RUT.CurrentValue
				Val(2) = Autoevaluacion_Docente.PROFESOR.CurrentValue
				Val(3) = Autoevaluacion_Docente.Carrera.CurrentValue
				Val(4) = Autoevaluacion_Docente.NOMBRE_C.CurrentValue
				Val(5) = Autoevaluacion_Docente.Asignatura.CurrentValue
				Val(6) = Autoevaluacion_Docente.NOMBRE.CurrentValue
				Val(7) = Autoevaluacion_Docente.Seccion.CurrentValue
				Val(8) = Autoevaluacion_Docente.Jornada.CurrentValue
				Val(9) = Autoevaluacion_Docente.Periodo.CurrentValue
				Val(10) = Autoevaluacion_Docente.Ano.CurrentValue
				Val(11) = Autoevaluacion_Docente.fecha.CurrentValue
				Val(12) = Autoevaluacion_Docente.p1.CurrentValue
				Val(13) = Autoevaluacion_Docente.p2.CurrentValue
				Val(14) = Autoevaluacion_Docente.p3.CurrentValue
				Val(15) = Autoevaluacion_Docente.p4.CurrentValue
				Val(16) = Autoevaluacion_Docente.p5.CurrentValue
				Val(17) = Autoevaluacion_Docente.p6.CurrentValue
				Val(18) = Autoevaluacion_Docente.p7.CurrentValue
				Val(19) = Autoevaluacion_Docente.p8.CurrentValue
				Val(20) = Autoevaluacion_Docente.p9.CurrentValue
				Val(21) = Autoevaluacion_Docente.p10.CurrentValue
				Val(22) = Autoevaluacion_Docente.p11.CurrentValue
				Val(23) = Autoevaluacion_Docente.p12.CurrentValue
				Val(24) = Autoevaluacion_Docente.p13.CurrentValue
				Val(25) = Autoevaluacion_Docente.p14.CurrentValue
				Val(26) = Autoevaluacion_Docente.p15.CurrentValue
				Val(27) = Autoevaluacion_Docente.p16.CurrentValue
				Val(28) = Autoevaluacion_Docente.p17.CurrentValue
				Val(29) = Autoevaluacion_Docente.p18.CurrentValue
				Val(30) = Autoevaluacion_Docente.p19.CurrentValue
				Val(31) = Autoevaluacion_Docente.p20.CurrentValue
				Val(32) = Autoevaluacion_Docente.p21.CurrentValue
				Val(33) = Autoevaluacion_Docente.p22.CurrentValue
				Val(34) = Autoevaluacion_Docente.observacion.CurrentValue
			Else
				Autoevaluacion_Docente.PROFESOR.DbValue = ""
				Autoevaluacion_Docente.RUT.DbValue = ""
				Autoevaluacion_Docente.Carrera.DbValue = ""
				Autoevaluacion_Docente.Asignatura.DbValue = ""
				Autoevaluacion_Docente.NOMBRE.DbValue = ""
				Autoevaluacion_Docente.Seccion.DbValue = ""
				Autoevaluacion_Docente.Jornada.DbValue = ""
				Autoevaluacion_Docente.Periodo.DbValue = ""
				Autoevaluacion_Docente.Ano.DbValue = ""
				Autoevaluacion_Docente.fecha.DbValue = ""
				Autoevaluacion_Docente.p1.DbValue = ""
				Autoevaluacion_Docente.p2.DbValue = ""
				Autoevaluacion_Docente.p3.DbValue = ""
				Autoevaluacion_Docente.p4.DbValue = ""
				Autoevaluacion_Docente.p5.DbValue = ""
				Autoevaluacion_Docente.p6.DbValue = ""
				Autoevaluacion_Docente.p7.DbValue = ""
				Autoevaluacion_Docente.p8.DbValue = ""
				Autoevaluacion_Docente.p9.DbValue = ""
				Autoevaluacion_Docente.p10.DbValue = ""
				Autoevaluacion_Docente.p11.DbValue = ""
				Autoevaluacion_Docente.p12.DbValue = ""
				Autoevaluacion_Docente.p13.DbValue = ""
				Autoevaluacion_Docente.p14.DbValue = ""
				Autoevaluacion_Docente.p15.DbValue = ""
				Autoevaluacion_Docente.p16.DbValue = ""
				Autoevaluacion_Docente.p17.DbValue = ""
				Autoevaluacion_Docente.p18.DbValue = ""
				Autoevaluacion_Docente.p19.DbValue = ""
				Autoevaluacion_Docente.p20.DbValue = ""
				Autoevaluacion_Docente.p21.DbValue = ""
				Autoevaluacion_Docente.p22.DbValue = ""
				Autoevaluacion_Docente.observacion.DbValue = ""
				Autoevaluacion_Docente.NOMBRE_C.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Autoevaluacion_Docente.PROFESOR.DbValue = dr("PROFESOR")
				Autoevaluacion_Docente.RUT.DbValue = dr("RUT")
				Autoevaluacion_Docente.Carrera.DbValue = dr("Carrera")
				Autoevaluacion_Docente.Asignatura.DbValue = dr("Asignatura")
				Autoevaluacion_Docente.NOMBRE.DbValue = dr("NOMBRE")
				Autoevaluacion_Docente.Seccion.DbValue = dr("Seccion")
				Autoevaluacion_Docente.Jornada.DbValue = dr("Jornada")
				Autoevaluacion_Docente.Periodo.DbValue = dr("Periodo")
				Autoevaluacion_Docente.Ano.DbValue = dr("Ano")
				Autoevaluacion_Docente.fecha.DbValue = dr("fecha")
				Autoevaluacion_Docente.p1.DbValue = dr("p1")
				Autoevaluacion_Docente.p2.DbValue = dr("p2")
				Autoevaluacion_Docente.p3.DbValue = dr("p3")
				Autoevaluacion_Docente.p4.DbValue = dr("p4")
				Autoevaluacion_Docente.p5.DbValue = dr("p5")
				Autoevaluacion_Docente.p6.DbValue = dr("p6")
				Autoevaluacion_Docente.p7.DbValue = dr("p7")
				Autoevaluacion_Docente.p8.DbValue = dr("p8")
				Autoevaluacion_Docente.p9.DbValue = dr("p9")
				Autoevaluacion_Docente.p10.DbValue = dr("p10")
				Autoevaluacion_Docente.p11.DbValue = dr("p11")
				Autoevaluacion_Docente.p12.DbValue = dr("p12")
				Autoevaluacion_Docente.p13.DbValue = dr("p13")
				Autoevaluacion_Docente.p14.DbValue = dr("p14")
				Autoevaluacion_Docente.p15.DbValue = dr("p15")
				Autoevaluacion_Docente.p16.DbValue = dr("p16")
				Autoevaluacion_Docente.p17.DbValue = dr("p17")
				Autoevaluacion_Docente.p18.DbValue = dr("p18")
				Autoevaluacion_Docente.p19.DbValue = dr("p19")
				Autoevaluacion_Docente.p20.DbValue = dr("p20")
				Autoevaluacion_Docente.p21.DbValue = dr("p21")
				Autoevaluacion_Docente.p22.DbValue = dr("p22")
				Autoevaluacion_Docente.observacion.DbValue = dr("observacion")
				Autoevaluacion_Docente.NOMBRE_C.DbValue = dr("NOMBRE_C")
				Val(1) = Autoevaluacion_Docente.RUT.CurrentValue
				Val(2) = Autoevaluacion_Docente.PROFESOR.CurrentValue
				Val(3) = Autoevaluacion_Docente.Carrera.CurrentValue
				Val(4) = Autoevaluacion_Docente.NOMBRE_C.CurrentValue
				Val(5) = Autoevaluacion_Docente.Asignatura.CurrentValue
				Val(6) = Autoevaluacion_Docente.NOMBRE.CurrentValue
				Val(7) = Autoevaluacion_Docente.Seccion.CurrentValue
				Val(8) = Autoevaluacion_Docente.Jornada.CurrentValue
				Val(9) = Autoevaluacion_Docente.Periodo.CurrentValue
				Val(10) = Autoevaluacion_Docente.Ano.CurrentValue
				Val(11) = Autoevaluacion_Docente.fecha.CurrentValue
				Val(12) = Autoevaluacion_Docente.p1.CurrentValue
				Val(13) = Autoevaluacion_Docente.p2.CurrentValue
				Val(14) = Autoevaluacion_Docente.p3.CurrentValue
				Val(15) = Autoevaluacion_Docente.p4.CurrentValue
				Val(16) = Autoevaluacion_Docente.p5.CurrentValue
				Val(17) = Autoevaluacion_Docente.p6.CurrentValue
				Val(18) = Autoevaluacion_Docente.p7.CurrentValue
				Val(19) = Autoevaluacion_Docente.p8.CurrentValue
				Val(20) = Autoevaluacion_Docente.p9.CurrentValue
				Val(21) = Autoevaluacion_Docente.p10.CurrentValue
				Val(22) = Autoevaluacion_Docente.p11.CurrentValue
				Val(23) = Autoevaluacion_Docente.p12.CurrentValue
				Val(24) = Autoevaluacion_Docente.p13.CurrentValue
				Val(25) = Autoevaluacion_Docente.p14.CurrentValue
				Val(26) = Autoevaluacion_Docente.p15.CurrentValue
				Val(27) = Autoevaluacion_Docente.p16.CurrentValue
				Val(28) = Autoevaluacion_Docente.p17.CurrentValue
				Val(29) = Autoevaluacion_Docente.p18.CurrentValue
				Val(30) = Autoevaluacion_Docente.p19.CurrentValue
				Val(31) = Autoevaluacion_Docente.p20.CurrentValue
				Val(32) = Autoevaluacion_Docente.p21.CurrentValue
				Val(33) = Autoevaluacion_Docente.p22.CurrentValue
				Val(34) = Autoevaluacion_Docente.observacion.CurrentValue
			Else				
				Autoevaluacion_Docente.PROFESOR.DbValue = ""
				Autoevaluacion_Docente.RUT.DbValue = ""
				Autoevaluacion_Docente.Carrera.DbValue = ""
				Autoevaluacion_Docente.Asignatura.DbValue = ""
				Autoevaluacion_Docente.NOMBRE.DbValue = ""
				Autoevaluacion_Docente.Seccion.DbValue = ""
				Autoevaluacion_Docente.Jornada.DbValue = ""
				Autoevaluacion_Docente.Periodo.DbValue = ""
				Autoevaluacion_Docente.Ano.DbValue = ""
				Autoevaluacion_Docente.fecha.DbValue = ""
				Autoevaluacion_Docente.p1.DbValue = ""
				Autoevaluacion_Docente.p2.DbValue = ""
				Autoevaluacion_Docente.p3.DbValue = ""
				Autoevaluacion_Docente.p4.DbValue = ""
				Autoevaluacion_Docente.p5.DbValue = ""
				Autoevaluacion_Docente.p6.DbValue = ""
				Autoevaluacion_Docente.p7.DbValue = ""
				Autoevaluacion_Docente.p8.DbValue = ""
				Autoevaluacion_Docente.p9.DbValue = ""
				Autoevaluacion_Docente.p10.DbValue = ""
				Autoevaluacion_Docente.p11.DbValue = ""
				Autoevaluacion_Docente.p12.DbValue = ""
				Autoevaluacion_Docente.p13.DbValue = ""
				Autoevaluacion_Docente.p14.DbValue = ""
				Autoevaluacion_Docente.p15.DbValue = ""
				Autoevaluacion_Docente.p16.DbValue = ""
				Autoevaluacion_Docente.p17.DbValue = ""
				Autoevaluacion_Docente.p18.DbValue = ""
				Autoevaluacion_Docente.p19.DbValue = ""
				Autoevaluacion_Docente.p20.DbValue = ""
				Autoevaluacion_Docente.p21.DbValue = ""
				Autoevaluacion_Docente.p22.DbValue = ""
				Autoevaluacion_Docente.observacion.DbValue = ""
				Autoevaluacion_Docente.NOMBRE_C.DbValue = ""
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
				Autoevaluacion_Docente.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Autoevaluacion_Docente.StartGroup = StartGrp
				Else
					StartGrp = Autoevaluacion_Docente.StartGroup
				End If
			Else
				StartGrp = Autoevaluacion_Docente.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Autoevaluacion_Docente.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Autoevaluacion_Docente.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Autoevaluacion_Docente.StartGroup = StartGrp
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
			Autoevaluacion_Docente.StartGroup = StartGrp
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
				Autoevaluacion_Docente.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Autoevaluacion_Docente.StartGroup = StartGrp
			Else				
				If (Autoevaluacion_Docente.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Autoevaluacion_Docente.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Autoevaluacion_Docente.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Autoevaluacion_Docente.SqlSelectCount, Autoevaluacion_Docente.SqlWhere, Autoevaluacion_Docente.SqlGroupBy, Autoevaluacion_Docente.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Autoevaluacion_Docente.Row_Rendering()

			'
			' Render view codes
			'

			If (Autoevaluacion_Docente.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUT
				Autoevaluacion_Docente.RUT.ViewValue = Convert.ToString(Autoevaluacion_Docente.RUT.Summary)
				Autoevaluacion_Docente.RUT.ViewAttrs("style") = "font-weight:bold;"

				' PROFESOR
				Autoevaluacion_Docente.PROFESOR.ViewValue = Convert.ToString(Autoevaluacion_Docente.PROFESOR.Summary)

				' Carrera
				Autoevaluacion_Docente.Carrera.ViewValue = Convert.ToString(Autoevaluacion_Docente.Carrera.Summary)

				' NOMBRE_C
				Autoevaluacion_Docente.NOMBRE_C.ViewValue = Convert.ToString(Autoevaluacion_Docente.NOMBRE_C.Summary)

				' Asignatura
				Autoevaluacion_Docente.Asignatura.ViewValue = Convert.ToString(Autoevaluacion_Docente.Asignatura.Summary)

				' NOMBRE
				Autoevaluacion_Docente.NOMBRE.ViewValue = Convert.ToString(Autoevaluacion_Docente.NOMBRE.Summary)

				' Seccion
				Autoevaluacion_Docente.Seccion.ViewValue = Convert.ToString(Autoevaluacion_Docente.Seccion.Summary)
				Autoevaluacion_Docente.Seccion.ViewAttrs("style") = "text-align:center;"

				' Jornada
				Autoevaluacion_Docente.Jornada.ViewValue = Convert.ToString(Autoevaluacion_Docente.Jornada.Summary)
				Autoevaluacion_Docente.Jornada.ViewAttrs("style") = "text-align:center;"

				' Periodo
				Autoevaluacion_Docente.Periodo.ViewValue = Convert.ToString(Autoevaluacion_Docente.Periodo.Summary)
				Autoevaluacion_Docente.Periodo.ViewAttrs("style") = "text-align:center;"

				' Ano
				Autoevaluacion_Docente.Ano.ViewValue = Convert.ToString(Autoevaluacion_Docente.Ano.Summary)
				Autoevaluacion_Docente.Ano.ViewAttrs("style") = "text-align:center;"

				' fecha
				Autoevaluacion_Docente.fecha.ViewValue = Convert.ToString(Autoevaluacion_Docente.fecha.Summary)
				Autoevaluacion_Docente.fecha.ViewValue = ew_FormatDateTime(Autoevaluacion_Docente.fecha.ViewValue, 7)
				Autoevaluacion_Docente.fecha.ViewAttrs("style") = "text-align:center;"

				' p1
				Autoevaluacion_Docente.p1.ViewValue = Convert.ToString(Autoevaluacion_Docente.p1.Summary)
				Autoevaluacion_Docente.p1.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p2
				Autoevaluacion_Docente.p2.ViewValue = Convert.ToString(Autoevaluacion_Docente.p2.Summary)
				Autoevaluacion_Docente.p2.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p3
				Autoevaluacion_Docente.p3.ViewValue = Convert.ToString(Autoevaluacion_Docente.p3.Summary)
				Autoevaluacion_Docente.p3.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p4
				Autoevaluacion_Docente.p4.ViewValue = Convert.ToString(Autoevaluacion_Docente.p4.Summary)
				Autoevaluacion_Docente.p4.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p5
				Autoevaluacion_Docente.p5.ViewValue = Convert.ToString(Autoevaluacion_Docente.p5.Summary)
				Autoevaluacion_Docente.p5.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p6
				Autoevaluacion_Docente.p6.ViewValue = Convert.ToString(Autoevaluacion_Docente.p6.Summary)
				Autoevaluacion_Docente.p6.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p7
				Autoevaluacion_Docente.p7.ViewValue = Convert.ToString(Autoevaluacion_Docente.p7.Summary)
				Autoevaluacion_Docente.p7.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p8
				Autoevaluacion_Docente.p8.ViewValue = Convert.ToString(Autoevaluacion_Docente.p8.Summary)
				Autoevaluacion_Docente.p8.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p9
				Autoevaluacion_Docente.p9.ViewValue = Convert.ToString(Autoevaluacion_Docente.p9.Summary)
				Autoevaluacion_Docente.p9.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p10
				Autoevaluacion_Docente.p10.ViewValue = Convert.ToString(Autoevaluacion_Docente.p10.Summary)
				Autoevaluacion_Docente.p10.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p11
				Autoevaluacion_Docente.p11.ViewValue = Convert.ToString(Autoevaluacion_Docente.p11.Summary)
				Autoevaluacion_Docente.p11.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p12
				Autoevaluacion_Docente.p12.ViewValue = Convert.ToString(Autoevaluacion_Docente.p12.Summary)
				Autoevaluacion_Docente.p12.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p13
				Autoevaluacion_Docente.p13.ViewValue = Convert.ToString(Autoevaluacion_Docente.p13.Summary)
				Autoevaluacion_Docente.p13.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p14
				Autoevaluacion_Docente.p14.ViewValue = Convert.ToString(Autoevaluacion_Docente.p14.Summary)
				Autoevaluacion_Docente.p14.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p15
				Autoevaluacion_Docente.p15.ViewValue = Convert.ToString(Autoevaluacion_Docente.p15.Summary)
				Autoevaluacion_Docente.p15.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p16
				Autoevaluacion_Docente.p16.ViewValue = Convert.ToString(Autoevaluacion_Docente.p16.Summary)
				Autoevaluacion_Docente.p16.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p17
				Autoevaluacion_Docente.p17.ViewValue = Convert.ToString(Autoevaluacion_Docente.p17.Summary)
				Autoevaluacion_Docente.p17.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p18
				Autoevaluacion_Docente.p18.ViewValue = Convert.ToString(Autoevaluacion_Docente.p18.Summary)
				Autoevaluacion_Docente.p18.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p19
				Autoevaluacion_Docente.p19.ViewValue = Convert.ToString(Autoevaluacion_Docente.p19.Summary)
				Autoevaluacion_Docente.p19.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p20
				Autoevaluacion_Docente.p20.ViewValue = Convert.ToString(Autoevaluacion_Docente.p20.Summary)
				Autoevaluacion_Docente.p20.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p21
				Autoevaluacion_Docente.p21.ViewValue = Convert.ToString(Autoevaluacion_Docente.p21.Summary)
				Autoevaluacion_Docente.p21.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' p22
				Autoevaluacion_Docente.p22.ViewValue = Convert.ToString(Autoevaluacion_Docente.p22.Summary)
				Autoevaluacion_Docente.p22.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' observacion
				Autoevaluacion_Docente.observacion.ViewValue = Convert.ToString(Autoevaluacion_Docente.observacion.Summary)
			Else

				' RUT
				Autoevaluacion_Docente.RUT.ViewValue = Convert.ToString(Autoevaluacion_Docente.RUT.CurrentValue)
				Autoevaluacion_Docente.RUT.ViewAttrs("style") = "font-weight:bold;"
				Autoevaluacion_Docente.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PROFESOR
				Autoevaluacion_Docente.PROFESOR.ViewValue = Convert.ToString(Autoevaluacion_Docente.PROFESOR.CurrentValue)
				Autoevaluacion_Docente.PROFESOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Carrera
				Autoevaluacion_Docente.Carrera.ViewValue = Convert.ToString(Autoevaluacion_Docente.Carrera.CurrentValue)
				Autoevaluacion_Docente.Carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				Autoevaluacion_Docente.NOMBRE_C.ViewValue = Convert.ToString(Autoevaluacion_Docente.NOMBRE_C.CurrentValue)
				Autoevaluacion_Docente.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Asignatura
				Autoevaluacion_Docente.Asignatura.ViewValue = Convert.ToString(Autoevaluacion_Docente.Asignatura.CurrentValue)
				Autoevaluacion_Docente.Asignatura.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Autoevaluacion_Docente.NOMBRE.ViewValue = Convert.ToString(Autoevaluacion_Docente.NOMBRE.CurrentValue)
				Autoevaluacion_Docente.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Seccion
				Autoevaluacion_Docente.Seccion.ViewValue = Convert.ToString(Autoevaluacion_Docente.Seccion.CurrentValue)
				Autoevaluacion_Docente.Seccion.ViewAttrs("style") = "text-align:center;"
				Autoevaluacion_Docente.Seccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Jornada
				Autoevaluacion_Docente.Jornada.ViewValue = Convert.ToString(Autoevaluacion_Docente.Jornada.CurrentValue)
				Autoevaluacion_Docente.Jornada.ViewAttrs("style") = "text-align:center;"
				Autoevaluacion_Docente.Jornada.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Periodo
				Autoevaluacion_Docente.Periodo.ViewValue = Convert.ToString(Autoevaluacion_Docente.Periodo.CurrentValue)
				Autoevaluacion_Docente.Periodo.ViewAttrs("style") = "text-align:center;"
				Autoevaluacion_Docente.Periodo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Ano
				Autoevaluacion_Docente.Ano.ViewValue = Convert.ToString(Autoevaluacion_Docente.Ano.CurrentValue)
				Autoevaluacion_Docente.Ano.ViewAttrs("style") = "text-align:center;"
				Autoevaluacion_Docente.Ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' fecha
				Autoevaluacion_Docente.fecha.ViewValue = Convert.ToString(Autoevaluacion_Docente.fecha.CurrentValue)
				Autoevaluacion_Docente.fecha.ViewValue = ew_FormatDateTime(Autoevaluacion_Docente.fecha.ViewValue, 7)
				Autoevaluacion_Docente.fecha.ViewAttrs("style") = "text-align:center;"
				Autoevaluacion_Docente.fecha.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p1
				Autoevaluacion_Docente.p1.ViewValue = Convert.ToString(Autoevaluacion_Docente.p1.CurrentValue)
				Autoevaluacion_Docente.p1.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p2
				Autoevaluacion_Docente.p2.ViewValue = Convert.ToString(Autoevaluacion_Docente.p2.CurrentValue)
				Autoevaluacion_Docente.p2.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p3
				Autoevaluacion_Docente.p3.ViewValue = Convert.ToString(Autoevaluacion_Docente.p3.CurrentValue)
				Autoevaluacion_Docente.p3.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p4
				Autoevaluacion_Docente.p4.ViewValue = Convert.ToString(Autoevaluacion_Docente.p4.CurrentValue)
				Autoevaluacion_Docente.p4.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p4.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p5
				Autoevaluacion_Docente.p5.ViewValue = Convert.ToString(Autoevaluacion_Docente.p5.CurrentValue)
				Autoevaluacion_Docente.p5.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p5.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p6
				Autoevaluacion_Docente.p6.ViewValue = Convert.ToString(Autoevaluacion_Docente.p6.CurrentValue)
				Autoevaluacion_Docente.p6.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p6.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p7
				Autoevaluacion_Docente.p7.ViewValue = Convert.ToString(Autoevaluacion_Docente.p7.CurrentValue)
				Autoevaluacion_Docente.p7.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p7.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p8
				Autoevaluacion_Docente.p8.ViewValue = Convert.ToString(Autoevaluacion_Docente.p8.CurrentValue)
				Autoevaluacion_Docente.p8.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p8.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p9
				Autoevaluacion_Docente.p9.ViewValue = Convert.ToString(Autoevaluacion_Docente.p9.CurrentValue)
				Autoevaluacion_Docente.p9.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p9.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p10
				Autoevaluacion_Docente.p10.ViewValue = Convert.ToString(Autoevaluacion_Docente.p10.CurrentValue)
				Autoevaluacion_Docente.p10.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p10.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p11
				Autoevaluacion_Docente.p11.ViewValue = Convert.ToString(Autoevaluacion_Docente.p11.CurrentValue)
				Autoevaluacion_Docente.p11.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p11.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p12
				Autoevaluacion_Docente.p12.ViewValue = Convert.ToString(Autoevaluacion_Docente.p12.CurrentValue)
				Autoevaluacion_Docente.p12.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p12.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p13
				Autoevaluacion_Docente.p13.ViewValue = Convert.ToString(Autoevaluacion_Docente.p13.CurrentValue)
				Autoevaluacion_Docente.p13.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p13.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p14
				Autoevaluacion_Docente.p14.ViewValue = Convert.ToString(Autoevaluacion_Docente.p14.CurrentValue)
				Autoevaluacion_Docente.p14.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p14.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p15
				Autoevaluacion_Docente.p15.ViewValue = Convert.ToString(Autoevaluacion_Docente.p15.CurrentValue)
				Autoevaluacion_Docente.p15.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p15.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p16
				Autoevaluacion_Docente.p16.ViewValue = Convert.ToString(Autoevaluacion_Docente.p16.CurrentValue)
				Autoevaluacion_Docente.p16.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p16.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p17
				Autoevaluacion_Docente.p17.ViewValue = Convert.ToString(Autoevaluacion_Docente.p17.CurrentValue)
				Autoevaluacion_Docente.p17.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p17.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p18
				Autoevaluacion_Docente.p18.ViewValue = Convert.ToString(Autoevaluacion_Docente.p18.CurrentValue)
				Autoevaluacion_Docente.p18.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p18.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p19
				Autoevaluacion_Docente.p19.ViewValue = Convert.ToString(Autoevaluacion_Docente.p19.CurrentValue)
				Autoevaluacion_Docente.p19.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p19.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p20
				Autoevaluacion_Docente.p20.ViewValue = Convert.ToString(Autoevaluacion_Docente.p20.CurrentValue)
				Autoevaluacion_Docente.p20.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p20.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p21
				Autoevaluacion_Docente.p21.ViewValue = Convert.ToString(Autoevaluacion_Docente.p21.CurrentValue)
				Autoevaluacion_Docente.p21.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p21.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p22
				Autoevaluacion_Docente.p22.ViewValue = Convert.ToString(Autoevaluacion_Docente.p22.CurrentValue)
				Autoevaluacion_Docente.p22.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Autoevaluacion_Docente.p22.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' observacion
				Autoevaluacion_Docente.observacion.ViewValue = Convert.ToString(Autoevaluacion_Docente.observacion.CurrentValue)
				Autoevaluacion_Docente.observacion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUT
			Autoevaluacion_Docente.RUT.HrefValue = ""

			' PROFESOR
			Autoevaluacion_Docente.PROFESOR.HrefValue = ""

			' Carrera
			Autoevaluacion_Docente.Carrera.HrefValue = ""

			' NOMBRE_C
			Autoevaluacion_Docente.NOMBRE_C.HrefValue = ""

			' Asignatura
			Autoevaluacion_Docente.Asignatura.HrefValue = ""

			' NOMBRE
			Autoevaluacion_Docente.NOMBRE.HrefValue = ""

			' Seccion
			Autoevaluacion_Docente.Seccion.HrefValue = ""

			' Jornada
			Autoevaluacion_Docente.Jornada.HrefValue = ""

			' Periodo
			Autoevaluacion_Docente.Periodo.HrefValue = ""

			' Ano
			Autoevaluacion_Docente.Ano.HrefValue = ""

			' fecha
			Autoevaluacion_Docente.fecha.HrefValue = ""

			' p1
			Autoevaluacion_Docente.p1.HrefValue = ""

			' p2
			Autoevaluacion_Docente.p2.HrefValue = ""

			' p3
			Autoevaluacion_Docente.p3.HrefValue = ""

			' p4
			Autoevaluacion_Docente.p4.HrefValue = ""

			' p5
			Autoevaluacion_Docente.p5.HrefValue = ""

			' p6
			Autoevaluacion_Docente.p6.HrefValue = ""

			' p7
			Autoevaluacion_Docente.p7.HrefValue = ""

			' p8
			Autoevaluacion_Docente.p8.HrefValue = ""

			' p9
			Autoevaluacion_Docente.p9.HrefValue = ""

			' p10
			Autoevaluacion_Docente.p10.HrefValue = ""

			' p11
			Autoevaluacion_Docente.p11.HrefValue = ""

			' p12
			Autoevaluacion_Docente.p12.HrefValue = ""

			' p13
			Autoevaluacion_Docente.p13.HrefValue = ""

			' p14
			Autoevaluacion_Docente.p14.HrefValue = ""

			' p15
			Autoevaluacion_Docente.p15.HrefValue = ""

			' p16
			Autoevaluacion_Docente.p16.HrefValue = ""

			' p17
			Autoevaluacion_Docente.p17.HrefValue = ""

			' p18
			Autoevaluacion_Docente.p18.HrefValue = ""

			' p19
			Autoevaluacion_Docente.p19.HrefValue = ""

			' p20
			Autoevaluacion_Docente.p20.HrefValue = ""

			' p21
			Autoevaluacion_Docente.p21.HrefValue = ""

			' p22
			Autoevaluacion_Docente.p22.HrefValue = ""

			' observacion
			Autoevaluacion_Docente.observacion.HrefValue = ""

			' Call Row_Rendered event
			Autoevaluacion_Docente.Row_Rendered()
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

			' Field PROFESOR
			sSelect = "SELECT DISTINCT matricula.SEK_Encuesta_Docente_Autoev.PROFESOR FROM " + Autoevaluacion_Docente.SqlFrom
			sOrderBy = "matricula.SEK_Encuesta_Docente_Autoev.PROFESOR ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Autoevaluacion_Docente.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Autoevaluacion_Docente.PROFESOR.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NOMBRE
			sSelect = "SELECT DISTINCT matricula.SEK_Encuesta_Docente_Autoev.NOMBRE FROM " + Autoevaluacion_Docente.SqlFrom
			sOrderBy = "matricula.SEK_Encuesta_Docente_Autoev.NOMBRE ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Autoevaluacion_Docente.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Autoevaluacion_Docente.NOMBRE.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Seccion
			sSelect = "SELECT DISTINCT matricula.SEK_Encuesta_Docente_Autoev.Seccion FROM " + Autoevaluacion_Docente.SqlFrom
			sOrderBy = "matricula.SEK_Encuesta_Docente_Autoev.Seccion ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Autoevaluacion_Docente.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Autoevaluacion_Docente.Seccion.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Jornada
			sSelect = "SELECT DISTINCT matricula.SEK_Encuesta_Docente_Autoev.Jornada FROM " + Autoevaluacion_Docente.SqlFrom
			sOrderBy = "matricula.SEK_Encuesta_Docente_Autoev.Jornada ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Autoevaluacion_Docente.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Autoevaluacion_Docente.Jornada.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Periodo
			sSelect = "SELECT DISTINCT matricula.SEK_Encuesta_Docente_Autoev.Periodo FROM " + Autoevaluacion_Docente.SqlFrom
			sOrderBy = "matricula.SEK_Encuesta_Docente_Autoev.Periodo ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Autoevaluacion_Docente.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Autoevaluacion_Docente.Periodo.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Ano
			sSelect = "SELECT DISTINCT matricula.SEK_Encuesta_Docente_Autoev.Ano FROM " + Autoevaluacion_Docente.SqlFrom
			sOrderBy = "matricula.SEK_Encuesta_Docente_Autoev.Ano ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Autoevaluacion_Docente.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Autoevaluacion_Docente.Ano.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field RUT
				SetSessionFilterValues(Autoevaluacion_Docente.RUT)

				' Field PROFESOR
				SetSessionDropDownValue(Autoevaluacion_Docente.PROFESOR.DropDownValue, Autoevaluacion_Docente.PROFESOR)

				' Field Carrera
				SetSessionFilterValues(Autoevaluacion_Docente.Carrera)

				' Field NOMBRE_C
				SetSessionFilterValues(Autoevaluacion_Docente.NOMBRE_C)

				' Field Asignatura
				SetSessionFilterValues(Autoevaluacion_Docente.Asignatura)

				' Field NOMBRE
				SetSessionDropDownValue(Autoevaluacion_Docente.NOMBRE.DropDownValue, Autoevaluacion_Docente.NOMBRE)

				' Field Seccion
				SetSessionDropDownValue(Autoevaluacion_Docente.Seccion.DropDownValue, Autoevaluacion_Docente.Seccion)

				' Field Jornada
				SetSessionDropDownValue(Autoevaluacion_Docente.Jornada.DropDownValue, Autoevaluacion_Docente.Jornada)

				' Field Periodo
				SetSessionDropDownValue(Autoevaluacion_Docente.Periodo.DropDownValue, Autoevaluacion_Docente.Periodo)

				' Field Ano
				SetSessionDropDownValue(Autoevaluacion_Docente.Ano.DropDownValue, Autoevaluacion_Docente.Ano)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT
				If (GetFilterValues(Autoevaluacion_Docente.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PROFESOR
				If (GetDropDownValue(Autoevaluacion_Docente.PROFESOR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Autoevaluacion_Docente.PROFESOR.DropDownValue) Then
					If Not ew_SameStr(Autoevaluacion_Docente.PROFESOR.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Autoevaluacion_Docente_PROFESOR") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Carrera
				If (GetFilterValues(Autoevaluacion_Docente.Carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE_C
				If (GetFilterValues(Autoevaluacion_Docente.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Asignatura
				If (GetFilterValues(Autoevaluacion_Docente.Asignatura)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetDropDownValue(Autoevaluacion_Docente.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Autoevaluacion_Docente.NOMBRE.DropDownValue) Then
					If Not ew_SameStr(Autoevaluacion_Docente.NOMBRE.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Autoevaluacion_Docente_NOMBRE") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Seccion
				If (GetDropDownValue(Autoevaluacion_Docente.Seccion)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Autoevaluacion_Docente.Seccion.DropDownValue) Then
					If Not ew_SameStr(Autoevaluacion_Docente.Seccion.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Autoevaluacion_Docente_Seccion") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Jornada
				If (GetDropDownValue(Autoevaluacion_Docente.Jornada)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Autoevaluacion_Docente.Jornada.DropDownValue) Then
					If Not ew_SameStr(Autoevaluacion_Docente.Jornada.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Autoevaluacion_Docente_Jornada") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Periodo
				If (GetDropDownValue(Autoevaluacion_Docente.Periodo)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Autoevaluacion_Docente.Periodo.DropDownValue) Then
					If Not ew_SameStr(Autoevaluacion_Docente.Periodo.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Autoevaluacion_Docente_Periodo") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Ano
				If (GetDropDownValue(Autoevaluacion_Docente.Ano)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Autoevaluacion_Docente.Ano.DropDownValue) Then
					If Not ew_SameStr(Autoevaluacion_Docente.Ano.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Autoevaluacion_Docente_Ano") Is Nothing Then
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

			' Field RUT
			GetSessionFilterValues(Autoevaluacion_Docente.RUT)

			' Field PROFESOR
			GetSessionDropDownValue(Autoevaluacion_Docente.PROFESOR)

			' Field Carrera
			GetSessionFilterValues(Autoevaluacion_Docente.Carrera)

			' Field NOMBRE_C
			GetSessionFilterValues(Autoevaluacion_Docente.NOMBRE_C)

			' Field Asignatura
			GetSessionFilterValues(Autoevaluacion_Docente.Asignatura)

			' Field NOMBRE
			GetSessionDropDownValue(Autoevaluacion_Docente.NOMBRE)

			' Field Seccion
			GetSessionDropDownValue(Autoevaluacion_Docente.Seccion)

			' Field Jornada
			GetSessionDropDownValue(Autoevaluacion_Docente.Jornada)

			' Field Periodo
			GetSessionDropDownValue(Autoevaluacion_Docente.Periodo)

			' Field Ano
			GetSessionDropDownValue(Autoevaluacion_Docente.Ano)
		End If

		' Call page filter validated event
		Autoevaluacion_Docente.Page_FilterValidated()

		' Build SQL
		' Field RUT

		BuildExtendedFilter(Autoevaluacion_Docente.RUT, sFilter)

		' Field PROFESOR
		BuildDropDownFilter(Autoevaluacion_Docente.PROFESOR, sFilter, "")

		' Field Carrera
		BuildExtendedFilter(Autoevaluacion_Docente.Carrera, sFilter)

		' Field NOMBRE_C
		BuildExtendedFilter(Autoevaluacion_Docente.NOMBRE_C, sFilter)

		' Field Asignatura
		BuildExtendedFilter(Autoevaluacion_Docente.Asignatura, sFilter)

		' Field NOMBRE
		BuildDropDownFilter(Autoevaluacion_Docente.NOMBRE, sFilter, "")

		' Field Seccion
		BuildDropDownFilter(Autoevaluacion_Docente.Seccion, sFilter, "")

		' Field Jornada
		BuildDropDownFilter(Autoevaluacion_Docente.Jornada, sFilter, "")

		' Field Periodo
		BuildDropDownFilter(Autoevaluacion_Docente.Periodo, sFilter, "")

		' Field Ano
		BuildDropDownFilter(Autoevaluacion_Docente.Ano, sFilter, "")

		' Save parms to Session
		' Field RUT

		SetSessionFilterValues(Autoevaluacion_Docente.RUT)

		' Field PROFESOR
		SetSessionDropDownValue(Autoevaluacion_Docente.PROFESOR.DropDownValue, Autoevaluacion_Docente.PROFESOR)

		' Field Carrera
		SetSessionFilterValues(Autoevaluacion_Docente.Carrera)

		' Field NOMBRE_C
		SetSessionFilterValues(Autoevaluacion_Docente.NOMBRE_C)

		' Field Asignatura
		SetSessionFilterValues(Autoevaluacion_Docente.Asignatura)

		' Field NOMBRE
		SetSessionDropDownValue(Autoevaluacion_Docente.NOMBRE.DropDownValue, Autoevaluacion_Docente.NOMBRE)

		' Field Seccion
		SetSessionDropDownValue(Autoevaluacion_Docente.Seccion.DropDownValue, Autoevaluacion_Docente.Seccion)

		' Field Jornada
		SetSessionDropDownValue(Autoevaluacion_Docente.Jornada.DropDownValue, Autoevaluacion_Docente.Jornada)

		' Field Periodo
		SetSessionDropDownValue(Autoevaluacion_Docente.Periodo.DropDownValue, Autoevaluacion_Docente.Periodo)

		' Field Ano
		SetSessionDropDownValue(Autoevaluacion_Docente.Ano.DropDownValue, Autoevaluacion_Docente.Ano)

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
		If ew_Session("sv_Autoevaluacion_Docente_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Autoevaluacion_Docente_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Autoevaluacion_Docente_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Autoevaluacion_Docente_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Autoevaluacion_Docente_" + parm)
		End If
		If ew_Session("so1_Autoevaluacion_Docente_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Autoevaluacion_Docente_" + parm))
		End If
		If ew_Session("sc_Autoevaluacion_Docente_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Autoevaluacion_Docente_" + parm))
		End If
		If ew_Session("sv2_Autoevaluacion_Docente_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Autoevaluacion_Docente_" + parm)
		End If
		If ew_Session("so2_Autoevaluacion_Docente_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Autoevaluacion_Docente_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Autoevaluacion_Docente_" + parm) = fld.SearchValue
		ew_Session("so1_Autoevaluacion_Docente_" + parm) = fld.SearchOperator
		ew_Session("sc_Autoevaluacion_Docente_" + parm) = fld.SearchCondition
		ew_Session("sv2_Autoevaluacion_Docente_" + parm) = fld.SearchValue2
		ew_Session("so2_Autoevaluacion_Docente_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Autoevaluacion_Docente_" + parm) = ""
		ew_Session("so1_Autoevaluacion_Docente_" + parm) = "="
		ew_Session("sc_Autoevaluacion_Docente_" + parm) = "AND"
		ew_Session("sv2_Autoevaluacion_Docente_" + parm) = ""
		ew_Session("so2_Autoevaluacion_Docente_" + parm) = "="
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
		ew_Session("sel_Autoevaluacion_Docente_" & parm) = ""
		ew_Session("rf_Autoevaluacion_Docente_" & parm) = ""
		ew_Session("rt_Autoevaluacion_Docente_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Autoevaluacion_Docente.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Autoevaluacion_Docente_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Autoevaluacion_Docente_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Autoevaluacion_Docente_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field PROFESOR

			Autoevaluacion_Docente.PROFESOR.DefaultDropDownValue = EWRPT_INIT_VALUE
			Autoevaluacion_Docente.PROFESOR.DropDownValue = Autoevaluacion_Docente.PROFESOR.DefaultDropDownValue

			' Field NOMBRE
			Autoevaluacion_Docente.NOMBRE.DefaultDropDownValue = EWRPT_INIT_VALUE
			Autoevaluacion_Docente.NOMBRE.DropDownValue = Autoevaluacion_Docente.NOMBRE.DefaultDropDownValue

			' Field Seccion
			Autoevaluacion_Docente.Seccion.DefaultDropDownValue = EWRPT_INIT_VALUE
			Autoevaluacion_Docente.Seccion.DropDownValue = Autoevaluacion_Docente.Seccion.DefaultDropDownValue

			' Field Jornada
			Autoevaluacion_Docente.Jornada.DefaultDropDownValue = EWRPT_INIT_VALUE
			Autoevaluacion_Docente.Jornada.DropDownValue = Autoevaluacion_Docente.Jornada.DefaultDropDownValue

			' Field Periodo
			Autoevaluacion_Docente.Periodo.DefaultDropDownValue = EWRPT_INIT_VALUE
			Autoevaluacion_Docente.Periodo.DropDownValue = Autoevaluacion_Docente.Periodo.DefaultDropDownValue

			' Field Ano
			Autoevaluacion_Docente.Ano.DefaultDropDownValue = EWRPT_INIT_VALUE
			Autoevaluacion_Docente.Ano.DropDownValue = Autoevaluacion_Docente.Ano.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(Autoevaluacion_Docente.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Autoevaluacion_Docente.RUT)	

			' Field Carrera
			SetDefaultExtFilter(Autoevaluacion_Docente.Carrera, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Autoevaluacion_Docente.Carrera)	

			' Field NOMBRE_C
			SetDefaultExtFilter(Autoevaluacion_Docente.NOMBRE_C, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Autoevaluacion_Docente.NOMBRE_C)	

			' Field Asignatura
			SetDefaultExtFilter(Autoevaluacion_Docente.Asignatura, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Autoevaluacion_Docente.Asignatura)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT extended filter
		If (TextFilterApplied(Autoevaluacion_Docente.RUT)) Then bFilterExist = True

		' Check PROFESOR dropdown filter
		If (NonTextFilterApplied(Autoevaluacion_Docente.PROFESOR)) Then bFilterExist = True

		' Check Carrera extended filter
		If (TextFilterApplied(Autoevaluacion_Docente.Carrera)) Then bFilterExist = True

		' Check NOMBRE_C extended filter
		If (TextFilterApplied(Autoevaluacion_Docente.NOMBRE_C)) Then bFilterExist = True

		' Check Asignatura extended filter
		If (TextFilterApplied(Autoevaluacion_Docente.Asignatura)) Then bFilterExist = True

		' Check NOMBRE dropdown filter
		If (NonTextFilterApplied(Autoevaluacion_Docente.NOMBRE)) Then bFilterExist = True

		' Check Seccion dropdown filter
		If (NonTextFilterApplied(Autoevaluacion_Docente.Seccion)) Then bFilterExist = True

		' Check Jornada dropdown filter
		If (NonTextFilterApplied(Autoevaluacion_Docente.Jornada)) Then bFilterExist = True

		' Check Periodo dropdown filter
		If (NonTextFilterApplied(Autoevaluacion_Docente.Periodo)) Then bFilterExist = True

		' Check Ano dropdown filter
		If (NonTextFilterApplied(Autoevaluacion_Docente.Ano)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Autoevaluacion_Docente.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PROFESOR
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Autoevaluacion_Docente.PROFESOR, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.PROFESOR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Carrera
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Autoevaluacion_Docente.Carrera, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.Carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Autoevaluacion_Docente.NOMBRE_C, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Asignatura
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Autoevaluacion_Docente.Asignatura, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.Asignatura.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Autoevaluacion_Docente.NOMBRE, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Seccion
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Autoevaluacion_Docente.Seccion, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.Seccion.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Jornada
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Autoevaluacion_Docente.Jornada, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.Jornada.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Periodo
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Autoevaluacion_Docente.Periodo, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.Periodo.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Ano
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Autoevaluacion_Docente.Ano, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Autoevaluacion_Docente.Ano.FldCaption() & "<br>"
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
				Autoevaluacion_Docente.OrderBy = ""
				Autoevaluacion_Docente.StartGroup = 1
				Autoevaluacion_Docente.RUT.Sort = ""
				Autoevaluacion_Docente.PROFESOR.Sort = ""
				Autoevaluacion_Docente.Carrera.Sort = ""
				Autoevaluacion_Docente.NOMBRE_C.Sort = ""
				Autoevaluacion_Docente.Asignatura.Sort = ""
				Autoevaluacion_Docente.NOMBRE.Sort = ""
				Autoevaluacion_Docente.Seccion.Sort = ""
				Autoevaluacion_Docente.Jornada.Sort = ""
				Autoevaluacion_Docente.Periodo.Sort = ""
				Autoevaluacion_Docente.Ano.Sort = ""
				Autoevaluacion_Docente.fecha.Sort = ""
				Autoevaluacion_Docente.p1.Sort = ""
				Autoevaluacion_Docente.p2.Sort = ""
				Autoevaluacion_Docente.p3.Sort = ""
				Autoevaluacion_Docente.p4.Sort = ""
				Autoevaluacion_Docente.p5.Sort = ""
				Autoevaluacion_Docente.p6.Sort = ""
				Autoevaluacion_Docente.p7.Sort = ""
				Autoevaluacion_Docente.p8.Sort = ""
				Autoevaluacion_Docente.p9.Sort = ""
				Autoevaluacion_Docente.p10.Sort = ""
				Autoevaluacion_Docente.p11.Sort = ""
				Autoevaluacion_Docente.p12.Sort = ""
				Autoevaluacion_Docente.p13.Sort = ""
				Autoevaluacion_Docente.p14.Sort = ""
				Autoevaluacion_Docente.p15.Sort = ""
				Autoevaluacion_Docente.p16.Sort = ""
				Autoevaluacion_Docente.p17.Sort = ""
				Autoevaluacion_Docente.p18.Sort = ""
				Autoevaluacion_Docente.p19.Sort = ""
				Autoevaluacion_Docente.p20.Sort = ""
				Autoevaluacion_Docente.p21.Sort = ""
				Autoevaluacion_Docente.p22.Sort = ""
				Autoevaluacion_Docente.observacion.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Autoevaluacion_Docente.CurrentOrder = ew_Get("order")
			Autoevaluacion_Docente.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Autoevaluacion_Docente.SortSql()
			Autoevaluacion_Docente.OrderBy = sSortSql
			Autoevaluacion_Docente.StartGroup = 1
		End If
		Return Autoevaluacion_Docente.OrderBy
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
		Autoevaluacion_Docente_summary = New crAutoevaluacion_Docente_summary(Me)
		Autoevaluacion_Docente_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Autoevaluacion_Docente_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Autoevaluacion_Docente_summary IsNot Nothing) Then Autoevaluacion_Docente_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Autoevaluacion_Docente.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Autoevaluacion_Docente_summary = new ewrpt_Page("Autoevaluacion_Docente_summary");
// page properties
Autoevaluacion_Docente_summary.PageID = "summary"; // page ID
Autoevaluacion_Docente_summary.FormID = "fAutoevaluacion_Docentesummaryfilter"; // form ID
var EWRPT_PAGE_ID = Autoevaluacion_Docente_summary.PageID;
// extend page with ValidateForm function
Autoevaluacion_Docente_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Autoevaluacion_Docente_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Autoevaluacion_Docente_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Autoevaluacion_Docente_summary.ValidateRequired = false; // no JavaScript validation
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
<% Autoevaluacion_Docente_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Autoevaluacion_Docente.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Autoevaluacion_Docente.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Autoevaluacion_Docente.TableCaption() %></h1></div>
<% If (Autoevaluacion_Docente.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Autoevaluacion_Docente_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% End If %>
</div><br><br>
<% Autoevaluacion_Docente_summary.ShowMessage() %>
<% If (Autoevaluacion_Docente.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Autoevaluacion_Docente.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (Autoevaluacion_Docente.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (Autoevaluacion_Docente.FilterPanelOption = 2 OrElse (Autoevaluacion_Docente.FilterPanelOption = 3 AndAlso Autoevaluacion_Docente_summary.FilterApplied) OrElse Autoevaluacion_Docente_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span>
<% If (Autoevaluacion_Docente_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="Autoevaluacion_Docentesmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fAutoevaluacion_Docentesummaryfilter" id="fAutoevaluacion_Docentesummaryfilter" action="Autoevaluacion_Docentesmry.aspx" class="ewForm" onsubmit="return Autoevaluacion_Docente_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Autoevaluacion_Docente.Asignatura.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.RUT.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><input type="hidden" name="so1_RUT" id="so1_RUT" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="22" value="<%= ew_HtmlEncode(Autoevaluacion_Docente.RUT.SearchValue) %>"<%= IIf(Autoevaluacion_Docente_summary.ClearExtFilter = "Autoevaluacion_Docente_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.PROFESOR.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PROFESOR" id="sv_PROFESOR"<%= IIf(Autoevaluacion_Docente_summary.ClearExtFilter = "Autoevaluacion_Docente_PROFESOR", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.PROFESOR.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Autoevaluacion_Docente.PROFESOR.CustomFilters.Count + Autoevaluacion_Docente.PROFESOR.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Autoevaluacion_Docente.PROFESOR.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PROFESOR")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.PROFESOR.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Autoevaluacion_Docente.PROFESOR.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.PROFESOR.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.Carrera.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><input type="hidden" name="so1_Carrera" id="so1_Carrera" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Carrera" id="sv1_Carrera" size="30" maxlength="50" value="<%= ew_HtmlEncode(Autoevaluacion_Docente.Carrera.SearchValue) %>"<%= IIf(Autoevaluacion_Docente_summary.ClearExtFilter = "Autoevaluacion_Docente_Carrera", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.NOMBRE_C.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><input type="hidden" name="so1_NOMBRE_C" id="so1_NOMBRE_C" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE_C" id="sv1_NOMBRE_C" size="30" maxlength="300" value="<%= ew_HtmlEncode(Autoevaluacion_Docente.NOMBRE_C.SearchValue) %>"<%= IIf(Autoevaluacion_Docente_summary.ClearExtFilter = "Autoevaluacion_Docente_NOMBRE_C", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.Asignatura.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><input type="hidden" name="so1_Asignatura" id="so1_Asignatura" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Asignatura" id="sv1_Asignatura" size="30" maxlength="50" value="<%= ew_HtmlEncode(Autoevaluacion_Docente.Asignatura.SearchValue) %>"<%= IIf(Autoevaluacion_Docente_summary.ClearExtFilter = "Autoevaluacion_Docente_Asignatura", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.NOMBRE.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE" id="sv_NOMBRE"<%= IIf(Autoevaluacion_Docente_summary.ClearExtFilter = "Autoevaluacion_Docente_NOMBRE", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.NOMBRE.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Autoevaluacion_Docente.NOMBRE.CustomFilters.Count + Autoevaluacion_Docente.NOMBRE.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Autoevaluacion_Docente.NOMBRE.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.NOMBRE.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Autoevaluacion_Docente.NOMBRE.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.NOMBRE.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.Seccion.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Autoevaluacion_Docente.Seccion.CustomFilters.Count + Autoevaluacion_Docente.Seccion.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Autoevaluacion_Docente.Seccion.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Seccion")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Autoevaluacion_Docente.Seccion.DropDownValue" id="Autoevaluacion_Docente.Seccion.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.Seccion.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Autoevaluacion_Docente.Seccion.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Seccion" id="sv_Seccion" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.Seccion.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.Jornada.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Autoevaluacion_Docente.Jornada.CustomFilters.Count + Autoevaluacion_Docente.Jornada.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Autoevaluacion_Docente.Jornada.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Jornada")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Autoevaluacion_Docente.Jornada.DropDownValue" id="Autoevaluacion_Docente.Jornada.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.Jornada.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Autoevaluacion_Docente.Jornada.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Jornada" id="sv_Jornada" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.Jornada.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.Periodo.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Autoevaluacion_Docente.Periodo.CustomFilters.Count + Autoevaluacion_Docente.Periodo.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Autoevaluacion_Docente.Periodo.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Periodo")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Autoevaluacion_Docente.Periodo.DropDownValue" id="Autoevaluacion_Docente.Periodo.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.Periodo.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Autoevaluacion_Docente.Periodo.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Periodo" id="sv_Periodo" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.Periodo.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Autoevaluacion_Docente.Ano.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Autoevaluacion_Docente.Ano.CustomFilters.Count + Autoevaluacion_Docente.Ano.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Autoevaluacion_Docente.Ano.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Ano")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Autoevaluacion_Docente.Ano.DropDownValue" id="Autoevaluacion_Docente.Ano.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.Ano.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Autoevaluacion_Docente.Ano.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_Ano" id="sv_Ano" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Autoevaluacion_Docente.Ano.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (Autoevaluacion_Docente.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Autoevaluacion_Docente_summary.ShowFilterList() %>
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
If (Autoevaluacion_Docente.ExportAll AndAlso ew_NotEmpty(Autoevaluacion_Docente.Export)) Then
	Autoevaluacion_Docente_summary.StopGrp = Autoevaluacion_Docente_summary.TotalGrps
Else
	Autoevaluacion_Docente_summary.StopGrp = Autoevaluacion_Docente_summary.StartGrp + Autoevaluacion_Docente_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Autoevaluacion_Docente_summary.StopGrp > Autoevaluacion_Docente_summary.TotalGrps) Then
	Autoevaluacion_Docente_summary.StopGrp = Autoevaluacion_Docente_summary.TotalGrps
End If
Autoevaluacion_Docente_summary.RecCount = 0

' Get first row
If (Autoevaluacion_Docente_summary.TotalGrps > 0) Then
	Autoevaluacion_Docente_summary.GetRow() ' ASPXRPT
	Autoevaluacion_Docente_summary.GrpCount = 1
End If
While ((Autoevaluacion_Docente_summary.HasRow AndAlso Autoevaluacion_Docente_summary.GrpIndex < Autoevaluacion_Docente_summary.StopGrp) OrElse Autoevaluacion_Docente_summary.ShowFirstHeader)

	' Show header
	If (Autoevaluacion_Docente_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.RUT) %>',0);"><%= Autoevaluacion_Docente.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.PROFESOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.PROFESOR))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.PROFESOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.PROFESOR) %>',0);"><%= Autoevaluacion_Docente.PROFESOR.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.PROFESOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.PROFESOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.Carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Carrera))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.Carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Carrera) %>',0);"><%= Autoevaluacion_Docente.Carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.Carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.Carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.NOMBRE_C) %>',0);"><%= Autoevaluacion_Docente.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.Asignatura.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Asignatura))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.Asignatura.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Asignatura) %>',0);"><%= Autoevaluacion_Docente.Asignatura.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.Asignatura.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.Asignatura.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.NOMBRE) %>',0);"><%= Autoevaluacion_Docente.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.Seccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Seccion))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.Seccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Seccion) %>',0);"><%= Autoevaluacion_Docente.Seccion.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.Seccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.Seccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.Jornada.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Jornada))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.Jornada.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Jornada) %>',0);"><%= Autoevaluacion_Docente.Jornada.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.Jornada.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.Jornada.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.Periodo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Periodo))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.Periodo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Periodo) %>',0);"><%= Autoevaluacion_Docente.Periodo.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.Periodo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.Periodo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.Ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Ano))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.Ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.Ano) %>',0);"><%= Autoevaluacion_Docente.Ano.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.Ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.Ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.fecha.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.fecha))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.fecha.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.fecha) %>',0);"><%= Autoevaluacion_Docente.fecha.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.fecha.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.fecha.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p1))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p1) %>',0);"><%= Autoevaluacion_Docente.p1.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p2))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p2) %>',0);"><%= Autoevaluacion_Docente.p2.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p3))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p3) %>',0);"><%= Autoevaluacion_Docente.p3.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p4.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p4))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p4.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p4) %>',0);"><%= Autoevaluacion_Docente.p4.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p4.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p4.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p5.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p5))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p5.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p5) %>',0);"><%= Autoevaluacion_Docente.p5.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p5.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p5.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p6.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p6))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p6.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p6) %>',0);"><%= Autoevaluacion_Docente.p6.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p6.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p6.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p7.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p7))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p7.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p7) %>',0);"><%= Autoevaluacion_Docente.p7.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p7.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p7.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p8.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p8))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p8.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p8) %>',0);"><%= Autoevaluacion_Docente.p8.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p8.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p8.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p9.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p9))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p9.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p9) %>',0);"><%= Autoevaluacion_Docente.p9.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p9.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p9.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p10.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p10))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p10.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p10) %>',0);"><%= Autoevaluacion_Docente.p10.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p10.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p10.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p11.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p11))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p11.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p11) %>',0);"><%= Autoevaluacion_Docente.p11.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p11.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p11.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p12.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p12))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p12.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p12) %>',0);"><%= Autoevaluacion_Docente.p12.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p12.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p12.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p13.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p13))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p13.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p13) %>',0);"><%= Autoevaluacion_Docente.p13.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p13.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p13.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p14.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p14))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p14.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p14) %>',0);"><%= Autoevaluacion_Docente.p14.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p14.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p14.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p15.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p15))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p15.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p15) %>',0);"><%= Autoevaluacion_Docente.p15.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p15.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p15.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p16.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p16))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p16.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p16) %>',0);"><%= Autoevaluacion_Docente.p16.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p16.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p16.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p17.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p17))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p17.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p17) %>',0);"><%= Autoevaluacion_Docente.p17.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p17.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p17.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p18.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p18))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p18.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p18) %>',0);"><%= Autoevaluacion_Docente.p18.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p18.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p18.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p19.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p19))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p19.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p19) %>',0);"><%= Autoevaluacion_Docente.p19.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p19.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p19.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p20.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p20))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p20.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p20) %>',0);"><%= Autoevaluacion_Docente.p20.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p20.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p20.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p21.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p21))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p21.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p21) %>',0);"><%= Autoevaluacion_Docente.p21.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p21.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p21.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.p22.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p22))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.p22.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.p22) %>',0);"><%= Autoevaluacion_Docente.p22.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.p22.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.p22.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Autoevaluacion_Docente.Export)) Then %>
<%= Autoevaluacion_Docente.observacion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.observacion))) Then %>
		<td style="vertical-align: bottom;"><%= Autoevaluacion_Docente.observacion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Autoevaluacion_Docente.SortUrl(Autoevaluacion_Docente.observacion) %>',0);"><%= Autoevaluacion_Docente.observacion.FldCaption() %></td><td style="width: 10px;">
		<% If (Autoevaluacion_Docente.observacion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Autoevaluacion_Docente.observacion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Autoevaluacion_Docente_summary.ShowFirstHeader = False
	End If
	Autoevaluacion_Docente_summary.RecCount += 1

		' Render detail row
		Autoevaluacion_Docente.ResetCSS()
		Autoevaluacion_Docente.RowType = EWRPT_ROWTYPE_DETAIL
		Autoevaluacion_Docente_summary.RenderRow()
%>
	<tr<%= Autoevaluacion_Docente.RowAttributes() %>>
		<td<%= Autoevaluacion_Docente.RUT.CellAttributes %>>
<div<%= Autoevaluacion_Docente.RUT.ViewAttributes%>><%= Autoevaluacion_Docente.RUT.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.PROFESOR.CellAttributes %>>
<div<%= Autoevaluacion_Docente.PROFESOR.ViewAttributes%>><%= Autoevaluacion_Docente.PROFESOR.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.Carrera.CellAttributes %>>
<div<%= Autoevaluacion_Docente.Carrera.ViewAttributes%>><%= Autoevaluacion_Docente.Carrera.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.NOMBRE_C.CellAttributes %>>
<div<%= Autoevaluacion_Docente.NOMBRE_C.ViewAttributes%>><%= Autoevaluacion_Docente.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.Asignatura.CellAttributes %>>
<div<%= Autoevaluacion_Docente.Asignatura.ViewAttributes%>><%= Autoevaluacion_Docente.Asignatura.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.NOMBRE.CellAttributes %>>
<div<%= Autoevaluacion_Docente.NOMBRE.ViewAttributes%>><%= Autoevaluacion_Docente.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.Seccion.CellAttributes %>>
<div<%= Autoevaluacion_Docente.Seccion.ViewAttributes%>><%= Autoevaluacion_Docente.Seccion.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.Jornada.CellAttributes %>>
<div<%= Autoevaluacion_Docente.Jornada.ViewAttributes%>><%= Autoevaluacion_Docente.Jornada.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.Periodo.CellAttributes %>>
<div<%= Autoevaluacion_Docente.Periodo.ViewAttributes%>><%= Autoevaluacion_Docente.Periodo.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.Ano.CellAttributes %>>
<div<%= Autoevaluacion_Docente.Ano.ViewAttributes%>><%= Autoevaluacion_Docente.Ano.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.fecha.CellAttributes %>>
<div<%= Autoevaluacion_Docente.fecha.ViewAttributes%>><%= Autoevaluacion_Docente.fecha.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p1.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p1.ViewAttributes%>><%= Autoevaluacion_Docente.p1.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p2.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p2.ViewAttributes%>><%= Autoevaluacion_Docente.p2.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p3.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p3.ViewAttributes%>><%= Autoevaluacion_Docente.p3.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p4.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p4.ViewAttributes%>><%= Autoevaluacion_Docente.p4.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p5.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p5.ViewAttributes%>><%= Autoevaluacion_Docente.p5.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p6.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p6.ViewAttributes%>><%= Autoevaluacion_Docente.p6.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p7.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p7.ViewAttributes%>><%= Autoevaluacion_Docente.p7.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p8.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p8.ViewAttributes%>><%= Autoevaluacion_Docente.p8.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p9.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p9.ViewAttributes%>><%= Autoevaluacion_Docente.p9.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p10.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p10.ViewAttributes%>><%= Autoevaluacion_Docente.p10.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p11.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p11.ViewAttributes%>><%= Autoevaluacion_Docente.p11.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p12.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p12.ViewAttributes%>><%= Autoevaluacion_Docente.p12.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p13.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p13.ViewAttributes%>><%= Autoevaluacion_Docente.p13.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p14.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p14.ViewAttributes%>><%= Autoevaluacion_Docente.p14.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p15.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p15.ViewAttributes%>><%= Autoevaluacion_Docente.p15.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p16.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p16.ViewAttributes%>><%= Autoevaluacion_Docente.p16.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p17.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p17.ViewAttributes%>><%= Autoevaluacion_Docente.p17.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p18.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p18.ViewAttributes%>><%= Autoevaluacion_Docente.p18.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p19.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p19.ViewAttributes%>><%= Autoevaluacion_Docente.p19.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p20.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p20.ViewAttributes%>><%= Autoevaluacion_Docente.p20.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p21.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p21.ViewAttributes%>><%= Autoevaluacion_Docente.p21.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.p22.CellAttributes %>>
<div<%= Autoevaluacion_Docente.p22.ViewAttributes%>><%= Autoevaluacion_Docente.p22.ListViewValue%></div>
</td>
		<td<%= Autoevaluacion_Docente.observacion.CellAttributes %>>
<div<%= Autoevaluacion_Docente.observacion.ViewAttributes%>><%= Autoevaluacion_Docente.observacion.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Autoevaluacion_Docente_summary.AccumulateSummary()

		' Get next record
		Autoevaluacion_Docente_summary.GetRow() ' ASPXRPT
		Autoevaluacion_Docente_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Autoevaluacion_Docente_summary.TotalGrps > 0) Then
	Autoevaluacion_Docente.ResetCSS()
	Autoevaluacion_Docente.RowType = EWRPT_ROWTYPE_TOTAL
	Autoevaluacion_Docente.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Autoevaluacion_Docente.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Autoevaluacion_Docente.RowAttrs("class") = "ewRptGrandSummary"
	Autoevaluacion_Docente_summary.RenderRow()
%>
	<!-- tr><td colspan="34"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Autoevaluacion_Docente.RowAttributes() %>><td colspan="34"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Autoevaluacion_Docente_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Autoevaluacion_Docente.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Autoevaluacion_Docente_summary.Pager Is Nothing Then Autoevaluacion_Docente_summary.Pager = New cPrevNextPager(Autoevaluacion_Docente_summary.StartGrp, Autoevaluacion_Docente_summary.DisplayGrps, Autoevaluacion_Docente_summary.TotalGrps) %>
<% If Autoevaluacion_Docente_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Autoevaluacion_Docente_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Autoevaluacion_Docentesmry.aspx?start=<%= Autoevaluacion_Docente_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Autoevaluacion_Docente_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Autoevaluacion_Docentesmry.aspx?start=<%= Autoevaluacion_Docente_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Autoevaluacion_Docente_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Autoevaluacion_Docente_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Autoevaluacion_Docentesmry.aspx?start=<%= Autoevaluacion_Docente_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Autoevaluacion_Docente_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Autoevaluacion_Docentesmry.aspx?start=<%= Autoevaluacion_Docente_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Autoevaluacion_Docente_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Autoevaluacion_Docente_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Autoevaluacion_Docente_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Autoevaluacion_Docente_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Autoevaluacion_Docente_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Autoevaluacion_Docente_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If Autoevaluacion_Docente_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="20"<% If Autoevaluacion_Docente_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="30"<% If Autoevaluacion_Docente_summary.DisplayGrps = 30 Then Response.Write(" selected=""selected""") %>>30</option>
<option value="40"<% If Autoevaluacion_Docente_summary.DisplayGrps = 40 Then Response.Write(" selected=""selected""") %>>40</option>
<option value="50"<% If Autoevaluacion_Docente_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
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
<% If (Autoevaluacion_Docente.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Autoevaluacion_Docente.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Autoevaluacion_Docente.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Autoevaluacion_Docente_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Autoevaluacion_Docente.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
