<%@ Page ClassName="Encuesta_Docente_SatisfacciF3nsmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_encuesta_docente_satisfaccion" %>
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
	Public Encuesta_Docente_SatisfacciF3n As crEncuesta_Docente_SatisfacciF3n = Nothing

	'
	' Table class (for Encuesta Docente Satisfacción)
	'
	Public Class crEncuesta_Docente_SatisfacciF3n
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
				Return "Encuesta_Docente_SatisfacciF3n"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Encuesta Docente Satisfacción"
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

		Public PROFESOR As crField

		Public RUT As crField

		Public NOMBRE_C As crField

		Public fecha As crField

		Public AD1O As crField

		Public periodo As crField

		Public p1 As crField

		Public p2 As crField

		Public p3 As crField

		Public p4 As crField

		Public p5 As crField

		Public p6 As crField

		Public p7 As crField

		Public p8 As crField

		Public p9 As crField

		Public P10 As crField

		Public P11 As crField

		Public P12 As crField

		Public P13 As crField

		Public P14 As crField

		Public P15 As crField

		Public P16 As crField

		Public P17 As crField

		Public P18 As crField

		Public P19 As crField

		Public P20 As crField

		Public P21 As crField

		Public P22 As crField

		Public P23 As crField

		Public P24 As crField

		Public P25 As crField

		Public p26 As crField

		Public p27 As crField

		Public p28 As crField

		Public p29 As crField

		Public p30 As crField

		Public p31 As crField

		Public p32 As crField

		Public p33 As crField

		Public p34 As crField

		Public p35 As crField

		Public p36 As crField

		Public p37 As crField

		Public p38 As crField

		Public p39 As crField

		Public p40 As crField

		Public p41 As crField

		Public p42 As crField

		Public p43 As crField

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
			codProf = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_codProf", "codProf", "[codProf]", 200, EWRPT_DATATYPE_STRING, -1)
			codProf.Page = APage
			codProf.ParentPage = APage.ParentPage
			Fields.Add("codProf", codProf)
			codProf.DateFilter = ""
			codProf.SqlSelect = ""
			codProf.SqlOrderBy = ""

			' PROFESOR
			PROFESOR = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_PROFESOR", "PROFESOR", "[PROFESOR]", 200, EWRPT_DATATYPE_STRING, -1)
			PROFESOR.Page = APage
			PROFESOR.ParentPage = APage.ParentPage
			Fields.Add("PROFESOR", PROFESOR)
			PROFESOR.DateFilter = ""
			PROFESOR.SqlSelect = ""
			PROFESOR.SqlOrderBy = ""

			' RUT
			RUT = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' fecha
			fecha = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_fecha", "fecha", "[fecha]", 135, EWRPT_DATATYPE_DATE, 7)
			fecha.Page = APage
			fecha.ParentPage = APage.ParentPage
			fecha.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("fecha", fecha)
			fecha.DateFilter = ""
			fecha.SqlSelect = ""
			fecha.SqlOrderBy = ""

			' AÑO
			AD1O = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_AD1O", "AÑO", "[AÑO]", 3, EWRPT_DATATYPE_NUMBER, -1)
			AD1O.Page = APage
			AD1O.ParentPage = APage.ParentPage
			AD1O.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("AD1O", AD1O)
			AD1O.DateFilter = ""
			AD1O.SqlSelect = ""
			AD1O.SqlOrderBy = ""

			' periodo
			periodo = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_periodo", "periodo", "[periodo]", 3, EWRPT_DATATYPE_NUMBER, -1)
			periodo.Page = APage
			periodo.ParentPage = APage.ParentPage
			periodo.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("periodo", periodo)
			periodo.DateFilter = ""
			periodo.SqlSelect = ""
			periodo.SqlOrderBy = ""

			' p1
			p1 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p1", "p1", "[p1]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p1.Page = APage
			p1.ParentPage = APage.ParentPage
			p1.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p1", p1)
			p1.DateFilter = ""
			p1.SqlSelect = ""
			p1.SqlOrderBy = ""

			' p2
			p2 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p2", "p2", "[p2]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p2.Page = APage
			p2.ParentPage = APage.ParentPage
			p2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p2", p2)
			p2.DateFilter = ""
			p2.SqlSelect = ""
			p2.SqlOrderBy = ""

			' p3
			p3 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p3", "p3", "[p3]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p3.Page = APage
			p3.ParentPage = APage.ParentPage
			p3.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p3", p3)
			p3.DateFilter = ""
			p3.SqlSelect = ""
			p3.SqlOrderBy = ""

			' p4
			p4 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p4", "p4", "[p4]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p4.Page = APage
			p4.ParentPage = APage.ParentPage
			p4.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p4", p4)
			p4.DateFilter = ""
			p4.SqlSelect = ""
			p4.SqlOrderBy = ""

			' p5
			p5 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p5", "p5", "[p5]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p5.Page = APage
			p5.ParentPage = APage.ParentPage
			p5.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p5", p5)
			p5.DateFilter = ""
			p5.SqlSelect = ""
			p5.SqlOrderBy = ""

			' p6
			p6 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p6", "p6", "[p6]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p6.Page = APage
			p6.ParentPage = APage.ParentPage
			p6.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p6", p6)
			p6.DateFilter = ""
			p6.SqlSelect = ""
			p6.SqlOrderBy = ""

			' p7
			p7 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p7", "p7", "[p7]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p7.Page = APage
			p7.ParentPage = APage.ParentPage
			p7.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p7", p7)
			p7.DateFilter = ""
			p7.SqlSelect = ""
			p7.SqlOrderBy = ""

			' p8
			p8 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p8", "p8", "[p8]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p8.Page = APage
			p8.ParentPage = APage.ParentPage
			p8.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p8", p8)
			p8.DateFilter = ""
			p8.SqlSelect = ""
			p8.SqlOrderBy = ""

			' p9
			p9 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p9", "p9", "[p9]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p9.Page = APage
			p9.ParentPage = APage.ParentPage
			p9.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p9", p9)
			p9.DateFilter = ""
			p9.SqlSelect = ""
			p9.SqlOrderBy = ""

			' P10
			P10 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P10", "P10", "[P10]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P10.Page = APage
			P10.ParentPage = APage.ParentPage
			P10.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P10", P10)
			P10.DateFilter = ""
			P10.SqlSelect = ""
			P10.SqlOrderBy = ""

			' P11
			P11 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P11", "P11", "[P11]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P11.Page = APage
			P11.ParentPage = APage.ParentPage
			P11.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P11", P11)
			P11.DateFilter = ""
			P11.SqlSelect = ""
			P11.SqlOrderBy = ""

			' P12
			P12 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P12", "P12", "[P12]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P12.Page = APage
			P12.ParentPage = APage.ParentPage
			P12.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P12", P12)
			P12.DateFilter = ""
			P12.SqlSelect = ""
			P12.SqlOrderBy = ""

			' P13
			P13 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P13", "P13", "[P13]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P13.Page = APage
			P13.ParentPage = APage.ParentPage
			P13.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P13", P13)
			P13.DateFilter = ""
			P13.SqlSelect = ""
			P13.SqlOrderBy = ""

			' P14
			P14 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P14", "P14", "[P14]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P14.Page = APage
			P14.ParentPage = APage.ParentPage
			P14.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P14", P14)
			P14.DateFilter = ""
			P14.SqlSelect = ""
			P14.SqlOrderBy = ""

			' P15
			P15 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P15", "P15", "[P15]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P15.Page = APage
			P15.ParentPage = APage.ParentPage
			P15.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P15", P15)
			P15.DateFilter = ""
			P15.SqlSelect = ""
			P15.SqlOrderBy = ""

			' P16
			P16 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P16", "P16", "[P16]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P16.Page = APage
			P16.ParentPage = APage.ParentPage
			P16.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P16", P16)
			P16.DateFilter = ""
			P16.SqlSelect = ""
			P16.SqlOrderBy = ""

			' P17
			P17 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P17", "P17", "[P17]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P17.Page = APage
			P17.ParentPage = APage.ParentPage
			P17.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P17", P17)
			P17.DateFilter = ""
			P17.SqlSelect = ""
			P17.SqlOrderBy = ""

			' P18
			P18 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P18", "P18", "[P18]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P18.Page = APage
			P18.ParentPage = APage.ParentPage
			P18.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P18", P18)
			P18.DateFilter = ""
			P18.SqlSelect = ""
			P18.SqlOrderBy = ""

			' P19
			P19 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P19", "P19", "[P19]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P19.Page = APage
			P19.ParentPage = APage.ParentPage
			P19.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P19", P19)
			P19.DateFilter = ""
			P19.SqlSelect = ""
			P19.SqlOrderBy = ""

			' P20
			P20 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P20", "P20", "[P20]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P20.Page = APage
			P20.ParentPage = APage.ParentPage
			P20.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P20", P20)
			P20.DateFilter = ""
			P20.SqlSelect = ""
			P20.SqlOrderBy = ""

			' P21
			P21 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P21", "P21", "[P21]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P21.Page = APage
			P21.ParentPage = APage.ParentPage
			P21.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P21", P21)
			P21.DateFilter = ""
			P21.SqlSelect = ""
			P21.SqlOrderBy = ""

			' P22
			P22 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P22", "P22", "[P22]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P22.Page = APage
			P22.ParentPage = APage.ParentPage
			P22.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P22", P22)
			P22.DateFilter = ""
			P22.SqlSelect = ""
			P22.SqlOrderBy = ""

			' P23
			P23 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P23", "P23", "[P23]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P23.Page = APage
			P23.ParentPage = APage.ParentPage
			P23.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P23", P23)
			P23.DateFilter = ""
			P23.SqlSelect = ""
			P23.SqlOrderBy = ""

			' P24
			P24 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P24", "P24", "[P24]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P24.Page = APage
			P24.ParentPage = APage.ParentPage
			P24.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P24", P24)
			P24.DateFilter = ""
			P24.SqlSelect = ""
			P24.SqlOrderBy = ""

			' P25
			P25 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_P25", "P25", "[P25]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P25.Page = APage
			P25.ParentPage = APage.ParentPage
			P25.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P25", P25)
			P25.DateFilter = ""
			P25.SqlSelect = ""
			P25.SqlOrderBy = ""

			' p26
			p26 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p26", "p26", "[p26]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p26.Page = APage
			p26.ParentPage = APage.ParentPage
			p26.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p26", p26)
			p26.DateFilter = ""
			p26.SqlSelect = ""
			p26.SqlOrderBy = ""

			' p27
			p27 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p27", "p27", "[p27]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p27.Page = APage
			p27.ParentPage = APage.ParentPage
			p27.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p27", p27)
			p27.DateFilter = ""
			p27.SqlSelect = ""
			p27.SqlOrderBy = ""

			' p28
			p28 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p28", "p28", "[p28]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p28.Page = APage
			p28.ParentPage = APage.ParentPage
			p28.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p28", p28)
			p28.DateFilter = ""
			p28.SqlSelect = ""
			p28.SqlOrderBy = ""

			' p29
			p29 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p29", "p29", "[p29]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p29.Page = APage
			p29.ParentPage = APage.ParentPage
			p29.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p29", p29)
			p29.DateFilter = ""
			p29.SqlSelect = ""
			p29.SqlOrderBy = ""

			' p30
			p30 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p30", "p30", "[p30]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p30.Page = APage
			p30.ParentPage = APage.ParentPage
			p30.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p30", p30)
			p30.DateFilter = ""
			p30.SqlSelect = ""
			p30.SqlOrderBy = ""

			' p31
			p31 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p31", "p31", "[p31]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p31.Page = APage
			p31.ParentPage = APage.ParentPage
			p31.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p31", p31)
			p31.DateFilter = ""
			p31.SqlSelect = ""
			p31.SqlOrderBy = ""

			' p32
			p32 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p32", "p32", "[p32]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p32.Page = APage
			p32.ParentPage = APage.ParentPage
			p32.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p32", p32)
			p32.DateFilter = ""
			p32.SqlSelect = ""
			p32.SqlOrderBy = ""

			' p33
			p33 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p33", "p33", "[p33]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p33.Page = APage
			p33.ParentPage = APage.ParentPage
			p33.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p33", p33)
			p33.DateFilter = ""
			p33.SqlSelect = ""
			p33.SqlOrderBy = ""

			' p34
			p34 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p34", "p34", "[p34]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p34.Page = APage
			p34.ParentPage = APage.ParentPage
			p34.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p34", p34)
			p34.DateFilter = ""
			p34.SqlSelect = ""
			p34.SqlOrderBy = ""

			' p35
			p35 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p35", "p35", "[p35]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p35.Page = APage
			p35.ParentPage = APage.ParentPage
			p35.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p35", p35)
			p35.DateFilter = ""
			p35.SqlSelect = ""
			p35.SqlOrderBy = ""

			' p36
			p36 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p36", "p36", "[p36]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p36.Page = APage
			p36.ParentPage = APage.ParentPage
			p36.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p36", p36)
			p36.DateFilter = ""
			p36.SqlSelect = ""
			p36.SqlOrderBy = ""

			' p37
			p37 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p37", "p37", "[p37]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p37.Page = APage
			p37.ParentPage = APage.ParentPage
			p37.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p37", p37)
			p37.DateFilter = ""
			p37.SqlSelect = ""
			p37.SqlOrderBy = ""

			' p38
			p38 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p38", "p38", "[p38]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p38.Page = APage
			p38.ParentPage = APage.ParentPage
			p38.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p38", p38)
			p38.DateFilter = ""
			p38.SqlSelect = ""
			p38.SqlOrderBy = ""

			' p39
			p39 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p39", "p39", "[p39]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p39.Page = APage
			p39.ParentPage = APage.ParentPage
			p39.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p39", p39)
			p39.DateFilter = ""
			p39.SqlSelect = ""
			p39.SqlOrderBy = ""

			' p40
			p40 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p40", "p40", "[p40]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p40.Page = APage
			p40.ParentPage = APage.ParentPage
			p40.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p40", p40)
			p40.DateFilter = ""
			p40.SqlSelect = ""
			p40.SqlOrderBy = ""

			' p41
			p41 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p41", "p41", "[p41]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p41.Page = APage
			p41.ParentPage = APage.ParentPage
			p41.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p41", p41)
			p41.DateFilter = ""
			p41.SqlSelect = ""
			p41.SqlOrderBy = ""

			' p42
			p42 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p42", "p42", "[p42]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p42.Page = APage
			p42.ParentPage = APage.ParentPage
			p42.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p42", p42)
			p42.DateFilter = ""
			p42.SqlSelect = ""
			p42.SqlOrderBy = ""

			' p43
			p43 = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_p43", "p43", "[p43]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p43.Page = APage
			p43.ParentPage = APage.ParentPage
			p43.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p43", p43)
			p43.DateFilter = ""
			p43.SqlSelect = ""
			p43.SqlOrderBy = ""

			' observacion
			observacion = new crField("Encuesta_Docente_SatisfacciF3n", "Encuesta Docente Satisfacción", "x_observacion", "observacion", "[observacion]", 200, EWRPT_DATATYPE_STRING, -1)
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
				Return "[SEK_Encuesta_Docente_Satisfaccion]"
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
	Public Encuesta_Docente_SatisfacciF3n_summary As crEncuesta_Docente_SatisfacciF3n_summary

	'
	' Page class
	'
	Public Class crEncuesta_Docente_SatisfacciF3n_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Encuesta_Docente_SatisfacciF3n.UseTokenInUrl) Then
				sUrl &= "t=" & Encuesta_Docente_SatisfacciF3n.TableVar & "&" ' Add page token
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
			If (Encuesta_Docente_SatisfacciF3n.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Encuesta_Docente_SatisfacciF3n.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Encuesta_Docente_SatisfacciF3n.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Encuesta_Docente_SatisfacciF3nsmry 
			Get
				Return CType(m_ParentPage, Encuesta_Docente_SatisfacciF3nsmry)
			End Get
		End Property

		' Table object (Encuesta_Docente_SatisfacciF3n)
		Public Property Encuesta_Docente_SatisfacciF3n As crEncuesta_Docente_SatisfacciF3n 
			Get		
				Return AspNetPage.Encuesta_Docente_SatisfacciF3n ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crEncuesta_Docente_SatisfacciF3n)
				AspNetPage.Encuesta_Docente_SatisfacciF3n = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_encuesta_docente_satisfaccion)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Encuesta_Docente_SatisfacciF3n_summary"
			m_PageObjTypeName = "crEncuesta_Docente_SatisfacciF3n_summary"

			' Table name
			m_TableName = "Encuesta Docente Satisfacción"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Encuesta_Docente_SatisfacciF3n)
			Encuesta_Docente_SatisfacciF3n = New crEncuesta_Docente_SatisfacciF3n(Me)			

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
				Encuesta_Docente_SatisfacciF3n.Export = ew_Get("export")
			End If
			gsExport = Encuesta_Docente_SatisfacciF3n.Export ' Get export parameter, used in header
			gsExportFile = Encuesta_Docente_SatisfacciF3n.TableVar ' Get export file, used in header
			If (Encuesta_Docente_SatisfacciF3n.Export = "excel") Then
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

		Public Val As Object() = New Object(51) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(51) {}

		Public GrandMn As Object() = New Object(51) {}

		Public GrandMx As Object() = New Object(51) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 52 ' No. of fields
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
			Encuesta_Docente_SatisfacciF3n.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Encuesta_Docente_SatisfacciF3n.SqlSelect, Encuesta_Docente_SatisfacciF3n.SqlWhere, Encuesta_Docente_SatisfacciF3n.SqlGroupBy, Encuesta_Docente_SatisfacciF3n.SqlHaving, Encuesta_Docente_SatisfacciF3n.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Encuesta_Docente_SatisfacciF3n.ExportAll AndAlso ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then
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
				Encuesta_Docente_SatisfacciF3n.codProf.DbValue = Row("codProf")
				Encuesta_Docente_SatisfacciF3n.PROFESOR.DbValue = Row("PROFESOR")
				Encuesta_Docente_SatisfacciF3n.RUT.DbValue = Row("RUT")
				Encuesta_Docente_SatisfacciF3n.fecha.DbValue = Row("fecha")
				Encuesta_Docente_SatisfacciF3n.AD1O.DbValue = Row("AÑO")
				Encuesta_Docente_SatisfacciF3n.periodo.DbValue = Row("periodo")
				Encuesta_Docente_SatisfacciF3n.p1.DbValue = Row("p1")
				Encuesta_Docente_SatisfacciF3n.p2.DbValue = Row("p2")
				Encuesta_Docente_SatisfacciF3n.p3.DbValue = Row("p3")
				Encuesta_Docente_SatisfacciF3n.p4.DbValue = Row("p4")
				Encuesta_Docente_SatisfacciF3n.p5.DbValue = Row("p5")
				Encuesta_Docente_SatisfacciF3n.p6.DbValue = Row("p6")
				Encuesta_Docente_SatisfacciF3n.p7.DbValue = Row("p7")
				Encuesta_Docente_SatisfacciF3n.p8.DbValue = Row("p8")
				Encuesta_Docente_SatisfacciF3n.p9.DbValue = Row("p9")
				Encuesta_Docente_SatisfacciF3n.P10.DbValue = Row("P10")
				Encuesta_Docente_SatisfacciF3n.P11.DbValue = Row("P11")
				Encuesta_Docente_SatisfacciF3n.P12.DbValue = Row("P12")
				Encuesta_Docente_SatisfacciF3n.P13.DbValue = Row("P13")
				Encuesta_Docente_SatisfacciF3n.P14.DbValue = Row("P14")
				Encuesta_Docente_SatisfacciF3n.P15.DbValue = Row("P15")
				Encuesta_Docente_SatisfacciF3n.P16.DbValue = Row("P16")
				Encuesta_Docente_SatisfacciF3n.P17.DbValue = Row("P17")
				Encuesta_Docente_SatisfacciF3n.P18.DbValue = Row("P18")
				Encuesta_Docente_SatisfacciF3n.P19.DbValue = Row("P19")
				Encuesta_Docente_SatisfacciF3n.P20.DbValue = Row("P20")
				Encuesta_Docente_SatisfacciF3n.P21.DbValue = Row("P21")
				Encuesta_Docente_SatisfacciF3n.P22.DbValue = Row("P22")
				Encuesta_Docente_SatisfacciF3n.P23.DbValue = Row("P23")
				Encuesta_Docente_SatisfacciF3n.P24.DbValue = Row("P24")
				Encuesta_Docente_SatisfacciF3n.P25.DbValue = Row("P25")
				Encuesta_Docente_SatisfacciF3n.p26.DbValue = Row("p26")
				Encuesta_Docente_SatisfacciF3n.p27.DbValue = Row("p27")
				Encuesta_Docente_SatisfacciF3n.p28.DbValue = Row("p28")
				Encuesta_Docente_SatisfacciF3n.p29.DbValue = Row("p29")
				Encuesta_Docente_SatisfacciF3n.p30.DbValue = Row("p30")
				Encuesta_Docente_SatisfacciF3n.p31.DbValue = Row("p31")
				Encuesta_Docente_SatisfacciF3n.p32.DbValue = Row("p32")
				Encuesta_Docente_SatisfacciF3n.p33.DbValue = Row("p33")
				Encuesta_Docente_SatisfacciF3n.p34.DbValue = Row("p34")
				Encuesta_Docente_SatisfacciF3n.p35.DbValue = Row("p35")
				Encuesta_Docente_SatisfacciF3n.p36.DbValue = Row("p36")
				Encuesta_Docente_SatisfacciF3n.p37.DbValue = Row("p37")
				Encuesta_Docente_SatisfacciF3n.p38.DbValue = Row("p38")
				Encuesta_Docente_SatisfacciF3n.p39.DbValue = Row("p39")
				Encuesta_Docente_SatisfacciF3n.p40.DbValue = Row("p40")
				Encuesta_Docente_SatisfacciF3n.p41.DbValue = Row("p41")
				Encuesta_Docente_SatisfacciF3n.p42.DbValue = Row("p42")
				Encuesta_Docente_SatisfacciF3n.p43.DbValue = Row("p43")
				Encuesta_Docente_SatisfacciF3n.observacion.DbValue = Row("observacion")
				Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DbValue = Row("NOMBRE_C")
				Val(1) = Encuesta_Docente_SatisfacciF3n.codProf.CurrentValue
				Val(2) = Encuesta_Docente_SatisfacciF3n.PROFESOR.CurrentValue
				Val(3) = Encuesta_Docente_SatisfacciF3n.RUT.CurrentValue
				Val(4) = Encuesta_Docente_SatisfacciF3n.NOMBRE_C.CurrentValue
				Val(5) = Encuesta_Docente_SatisfacciF3n.fecha.CurrentValue
				Val(6) = Encuesta_Docente_SatisfacciF3n.AD1O.CurrentValue
				Val(7) = Encuesta_Docente_SatisfacciF3n.periodo.CurrentValue
				Val(8) = Encuesta_Docente_SatisfacciF3n.p1.CurrentValue
				Val(9) = Encuesta_Docente_SatisfacciF3n.p2.CurrentValue
				Val(10) = Encuesta_Docente_SatisfacciF3n.p3.CurrentValue
				Val(11) = Encuesta_Docente_SatisfacciF3n.p4.CurrentValue
				Val(12) = Encuesta_Docente_SatisfacciF3n.p5.CurrentValue
				Val(13) = Encuesta_Docente_SatisfacciF3n.p6.CurrentValue
				Val(14) = Encuesta_Docente_SatisfacciF3n.p7.CurrentValue
				Val(15) = Encuesta_Docente_SatisfacciF3n.p8.CurrentValue
				Val(16) = Encuesta_Docente_SatisfacciF3n.p9.CurrentValue
				Val(17) = Encuesta_Docente_SatisfacciF3n.P10.CurrentValue
				Val(18) = Encuesta_Docente_SatisfacciF3n.P11.CurrentValue
				Val(19) = Encuesta_Docente_SatisfacciF3n.P12.CurrentValue
				Val(20) = Encuesta_Docente_SatisfacciF3n.P13.CurrentValue
				Val(21) = Encuesta_Docente_SatisfacciF3n.P14.CurrentValue
				Val(22) = Encuesta_Docente_SatisfacciF3n.P15.CurrentValue
				Val(23) = Encuesta_Docente_SatisfacciF3n.P16.CurrentValue
				Val(24) = Encuesta_Docente_SatisfacciF3n.P17.CurrentValue
				Val(25) = Encuesta_Docente_SatisfacciF3n.P18.CurrentValue
				Val(26) = Encuesta_Docente_SatisfacciF3n.P19.CurrentValue
				Val(27) = Encuesta_Docente_SatisfacciF3n.P20.CurrentValue
				Val(28) = Encuesta_Docente_SatisfacciF3n.P21.CurrentValue
				Val(29) = Encuesta_Docente_SatisfacciF3n.P22.CurrentValue
				Val(30) = Encuesta_Docente_SatisfacciF3n.P23.CurrentValue
				Val(31) = Encuesta_Docente_SatisfacciF3n.P24.CurrentValue
				Val(32) = Encuesta_Docente_SatisfacciF3n.P25.CurrentValue
				Val(33) = Encuesta_Docente_SatisfacciF3n.p26.CurrentValue
				Val(34) = Encuesta_Docente_SatisfacciF3n.p27.CurrentValue
				Val(35) = Encuesta_Docente_SatisfacciF3n.p28.CurrentValue
				Val(36) = Encuesta_Docente_SatisfacciF3n.p29.CurrentValue
				Val(37) = Encuesta_Docente_SatisfacciF3n.p30.CurrentValue
				Val(38) = Encuesta_Docente_SatisfacciF3n.p31.CurrentValue
				Val(39) = Encuesta_Docente_SatisfacciF3n.p32.CurrentValue
				Val(40) = Encuesta_Docente_SatisfacciF3n.p33.CurrentValue
				Val(41) = Encuesta_Docente_SatisfacciF3n.p34.CurrentValue
				Val(42) = Encuesta_Docente_SatisfacciF3n.p35.CurrentValue
				Val(43) = Encuesta_Docente_SatisfacciF3n.p36.CurrentValue
				Val(44) = Encuesta_Docente_SatisfacciF3n.p37.CurrentValue
				Val(45) = Encuesta_Docente_SatisfacciF3n.p38.CurrentValue
				Val(46) = Encuesta_Docente_SatisfacciF3n.p39.CurrentValue
				Val(47) = Encuesta_Docente_SatisfacciF3n.p40.CurrentValue
				Val(48) = Encuesta_Docente_SatisfacciF3n.p41.CurrentValue
				Val(49) = Encuesta_Docente_SatisfacciF3n.p42.CurrentValue
				Val(50) = Encuesta_Docente_SatisfacciF3n.p43.CurrentValue
				Val(51) = Encuesta_Docente_SatisfacciF3n.observacion.CurrentValue
			Else
				Encuesta_Docente_SatisfacciF3n.codProf.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.PROFESOR.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.RUT.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.fecha.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.AD1O.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.periodo.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p1.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p2.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p3.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p4.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p5.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p6.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p7.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p8.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p9.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P10.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P11.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P12.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P13.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P14.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P15.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P16.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P17.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P18.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P19.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P20.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P21.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P22.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P23.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P24.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P25.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p26.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p27.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p28.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p29.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p30.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p31.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p32.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p33.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p34.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p35.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p36.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p37.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p38.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p39.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p40.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p41.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p42.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p43.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.observacion.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Encuesta_Docente_SatisfacciF3n.codProf.DbValue = dr("codProf")
				Encuesta_Docente_SatisfacciF3n.PROFESOR.DbValue = dr("PROFESOR")
				Encuesta_Docente_SatisfacciF3n.RUT.DbValue = dr("RUT")
				Encuesta_Docente_SatisfacciF3n.fecha.DbValue = dr("fecha")
				Encuesta_Docente_SatisfacciF3n.AD1O.DbValue = dr("AÑO")
				Encuesta_Docente_SatisfacciF3n.periodo.DbValue = dr("periodo")
				Encuesta_Docente_SatisfacciF3n.p1.DbValue = dr("p1")
				Encuesta_Docente_SatisfacciF3n.p2.DbValue = dr("p2")
				Encuesta_Docente_SatisfacciF3n.p3.DbValue = dr("p3")
				Encuesta_Docente_SatisfacciF3n.p4.DbValue = dr("p4")
				Encuesta_Docente_SatisfacciF3n.p5.DbValue = dr("p5")
				Encuesta_Docente_SatisfacciF3n.p6.DbValue = dr("p6")
				Encuesta_Docente_SatisfacciF3n.p7.DbValue = dr("p7")
				Encuesta_Docente_SatisfacciF3n.p8.DbValue = dr("p8")
				Encuesta_Docente_SatisfacciF3n.p9.DbValue = dr("p9")
				Encuesta_Docente_SatisfacciF3n.P10.DbValue = dr("P10")
				Encuesta_Docente_SatisfacciF3n.P11.DbValue = dr("P11")
				Encuesta_Docente_SatisfacciF3n.P12.DbValue = dr("P12")
				Encuesta_Docente_SatisfacciF3n.P13.DbValue = dr("P13")
				Encuesta_Docente_SatisfacciF3n.P14.DbValue = dr("P14")
				Encuesta_Docente_SatisfacciF3n.P15.DbValue = dr("P15")
				Encuesta_Docente_SatisfacciF3n.P16.DbValue = dr("P16")
				Encuesta_Docente_SatisfacciF3n.P17.DbValue = dr("P17")
				Encuesta_Docente_SatisfacciF3n.P18.DbValue = dr("P18")
				Encuesta_Docente_SatisfacciF3n.P19.DbValue = dr("P19")
				Encuesta_Docente_SatisfacciF3n.P20.DbValue = dr("P20")
				Encuesta_Docente_SatisfacciF3n.P21.DbValue = dr("P21")
				Encuesta_Docente_SatisfacciF3n.P22.DbValue = dr("P22")
				Encuesta_Docente_SatisfacciF3n.P23.DbValue = dr("P23")
				Encuesta_Docente_SatisfacciF3n.P24.DbValue = dr("P24")
				Encuesta_Docente_SatisfacciF3n.P25.DbValue = dr("P25")
				Encuesta_Docente_SatisfacciF3n.p26.DbValue = dr("p26")
				Encuesta_Docente_SatisfacciF3n.p27.DbValue = dr("p27")
				Encuesta_Docente_SatisfacciF3n.p28.DbValue = dr("p28")
				Encuesta_Docente_SatisfacciF3n.p29.DbValue = dr("p29")
				Encuesta_Docente_SatisfacciF3n.p30.DbValue = dr("p30")
				Encuesta_Docente_SatisfacciF3n.p31.DbValue = dr("p31")
				Encuesta_Docente_SatisfacciF3n.p32.DbValue = dr("p32")
				Encuesta_Docente_SatisfacciF3n.p33.DbValue = dr("p33")
				Encuesta_Docente_SatisfacciF3n.p34.DbValue = dr("p34")
				Encuesta_Docente_SatisfacciF3n.p35.DbValue = dr("p35")
				Encuesta_Docente_SatisfacciF3n.p36.DbValue = dr("p36")
				Encuesta_Docente_SatisfacciF3n.p37.DbValue = dr("p37")
				Encuesta_Docente_SatisfacciF3n.p38.DbValue = dr("p38")
				Encuesta_Docente_SatisfacciF3n.p39.DbValue = dr("p39")
				Encuesta_Docente_SatisfacciF3n.p40.DbValue = dr("p40")
				Encuesta_Docente_SatisfacciF3n.p41.DbValue = dr("p41")
				Encuesta_Docente_SatisfacciF3n.p42.DbValue = dr("p42")
				Encuesta_Docente_SatisfacciF3n.p43.DbValue = dr("p43")
				Encuesta_Docente_SatisfacciF3n.observacion.DbValue = dr("observacion")
				Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DbValue = dr("NOMBRE_C")
				Val(1) = Encuesta_Docente_SatisfacciF3n.codProf.CurrentValue
				Val(2) = Encuesta_Docente_SatisfacciF3n.PROFESOR.CurrentValue
				Val(3) = Encuesta_Docente_SatisfacciF3n.RUT.CurrentValue
				Val(4) = Encuesta_Docente_SatisfacciF3n.NOMBRE_C.CurrentValue
				Val(5) = Encuesta_Docente_SatisfacciF3n.fecha.CurrentValue
				Val(6) = Encuesta_Docente_SatisfacciF3n.AD1O.CurrentValue
				Val(7) = Encuesta_Docente_SatisfacciF3n.periodo.CurrentValue
				Val(8) = Encuesta_Docente_SatisfacciF3n.p1.CurrentValue
				Val(9) = Encuesta_Docente_SatisfacciF3n.p2.CurrentValue
				Val(10) = Encuesta_Docente_SatisfacciF3n.p3.CurrentValue
				Val(11) = Encuesta_Docente_SatisfacciF3n.p4.CurrentValue
				Val(12) = Encuesta_Docente_SatisfacciF3n.p5.CurrentValue
				Val(13) = Encuesta_Docente_SatisfacciF3n.p6.CurrentValue
				Val(14) = Encuesta_Docente_SatisfacciF3n.p7.CurrentValue
				Val(15) = Encuesta_Docente_SatisfacciF3n.p8.CurrentValue
				Val(16) = Encuesta_Docente_SatisfacciF3n.p9.CurrentValue
				Val(17) = Encuesta_Docente_SatisfacciF3n.P10.CurrentValue
				Val(18) = Encuesta_Docente_SatisfacciF3n.P11.CurrentValue
				Val(19) = Encuesta_Docente_SatisfacciF3n.P12.CurrentValue
				Val(20) = Encuesta_Docente_SatisfacciF3n.P13.CurrentValue
				Val(21) = Encuesta_Docente_SatisfacciF3n.P14.CurrentValue
				Val(22) = Encuesta_Docente_SatisfacciF3n.P15.CurrentValue
				Val(23) = Encuesta_Docente_SatisfacciF3n.P16.CurrentValue
				Val(24) = Encuesta_Docente_SatisfacciF3n.P17.CurrentValue
				Val(25) = Encuesta_Docente_SatisfacciF3n.P18.CurrentValue
				Val(26) = Encuesta_Docente_SatisfacciF3n.P19.CurrentValue
				Val(27) = Encuesta_Docente_SatisfacciF3n.P20.CurrentValue
				Val(28) = Encuesta_Docente_SatisfacciF3n.P21.CurrentValue
				Val(29) = Encuesta_Docente_SatisfacciF3n.P22.CurrentValue
				Val(30) = Encuesta_Docente_SatisfacciF3n.P23.CurrentValue
				Val(31) = Encuesta_Docente_SatisfacciF3n.P24.CurrentValue
				Val(32) = Encuesta_Docente_SatisfacciF3n.P25.CurrentValue
				Val(33) = Encuesta_Docente_SatisfacciF3n.p26.CurrentValue
				Val(34) = Encuesta_Docente_SatisfacciF3n.p27.CurrentValue
				Val(35) = Encuesta_Docente_SatisfacciF3n.p28.CurrentValue
				Val(36) = Encuesta_Docente_SatisfacciF3n.p29.CurrentValue
				Val(37) = Encuesta_Docente_SatisfacciF3n.p30.CurrentValue
				Val(38) = Encuesta_Docente_SatisfacciF3n.p31.CurrentValue
				Val(39) = Encuesta_Docente_SatisfacciF3n.p32.CurrentValue
				Val(40) = Encuesta_Docente_SatisfacciF3n.p33.CurrentValue
				Val(41) = Encuesta_Docente_SatisfacciF3n.p34.CurrentValue
				Val(42) = Encuesta_Docente_SatisfacciF3n.p35.CurrentValue
				Val(43) = Encuesta_Docente_SatisfacciF3n.p36.CurrentValue
				Val(44) = Encuesta_Docente_SatisfacciF3n.p37.CurrentValue
				Val(45) = Encuesta_Docente_SatisfacciF3n.p38.CurrentValue
				Val(46) = Encuesta_Docente_SatisfacciF3n.p39.CurrentValue
				Val(47) = Encuesta_Docente_SatisfacciF3n.p40.CurrentValue
				Val(48) = Encuesta_Docente_SatisfacciF3n.p41.CurrentValue
				Val(49) = Encuesta_Docente_SatisfacciF3n.p42.CurrentValue
				Val(50) = Encuesta_Docente_SatisfacciF3n.p43.CurrentValue
				Val(51) = Encuesta_Docente_SatisfacciF3n.observacion.CurrentValue
			Else				
				Encuesta_Docente_SatisfacciF3n.codProf.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.PROFESOR.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.RUT.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.fecha.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.AD1O.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.periodo.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p1.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p2.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p3.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p4.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p5.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p6.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p7.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p8.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p9.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P10.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P11.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P12.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P13.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P14.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P15.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P16.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P17.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P18.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P19.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P20.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P21.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P22.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P23.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P24.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.P25.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p26.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p27.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p28.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p29.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p30.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p31.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p32.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p33.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p34.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p35.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p36.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p37.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p38.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p39.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p40.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p41.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p42.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.p43.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.observacion.DbValue = ""
				Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DbValue = ""
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
				Encuesta_Docente_SatisfacciF3n.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Encuesta_Docente_SatisfacciF3n.StartGroup = StartGrp
				Else
					StartGrp = Encuesta_Docente_SatisfacciF3n.StartGroup
				End If
			Else
				StartGrp = Encuesta_Docente_SatisfacciF3n.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Encuesta_Docente_SatisfacciF3n.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Encuesta_Docente_SatisfacciF3n.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Encuesta_Docente_SatisfacciF3n.StartGroup = StartGrp
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
			Encuesta_Docente_SatisfacciF3n.StartGroup = StartGrp
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
				Encuesta_Docente_SatisfacciF3n.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Encuesta_Docente_SatisfacciF3n.StartGroup = StartGrp
			Else				
				If (Encuesta_Docente_SatisfacciF3n.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Encuesta_Docente_SatisfacciF3n.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Encuesta_Docente_SatisfacciF3n.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Encuesta_Docente_SatisfacciF3n.SqlSelectCount, Encuesta_Docente_SatisfacciF3n.SqlWhere, Encuesta_Docente_SatisfacciF3n.SqlGroupBy, Encuesta_Docente_SatisfacciF3n.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Encuesta_Docente_SatisfacciF3n.Row_Rendering()

			'
			' Render view codes
			'

			If (Encuesta_Docente_SatisfacciF3n.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' codProf
				Encuesta_Docente_SatisfacciF3n.codProf.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.codProf.Summary)

				' PROFESOR
				Encuesta_Docente_SatisfacciF3n.PROFESOR.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.PROFESOR.Summary)

				' RUT
				Encuesta_Docente_SatisfacciF3n.RUT.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.RUT.Summary)

				' NOMBRE_C
				Encuesta_Docente_SatisfacciF3n.NOMBRE_C.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.NOMBRE_C.Summary)

				' fecha
				Encuesta_Docente_SatisfacciF3n.fecha.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.fecha.Summary)
				Encuesta_Docente_SatisfacciF3n.fecha.ViewValue = ew_FormatDateTime(Encuesta_Docente_SatisfacciF3n.fecha.ViewValue, 7)

				' AÑO
				Encuesta_Docente_SatisfacciF3n.AD1O.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.AD1O.Summary)

				' periodo
				Encuesta_Docente_SatisfacciF3n.periodo.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.periodo.Summary)

				' p1
				Encuesta_Docente_SatisfacciF3n.p1.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p1.Summary)

				' p2
				Encuesta_Docente_SatisfacciF3n.p2.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p2.Summary)

				' p3
				Encuesta_Docente_SatisfacciF3n.p3.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p3.Summary)

				' p4
				Encuesta_Docente_SatisfacciF3n.p4.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p4.Summary)

				' p5
				Encuesta_Docente_SatisfacciF3n.p5.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p5.Summary)

				' p6
				Encuesta_Docente_SatisfacciF3n.p6.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p6.Summary)

				' p7
				Encuesta_Docente_SatisfacciF3n.p7.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p7.Summary)

				' p8
				Encuesta_Docente_SatisfacciF3n.p8.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p8.Summary)

				' p9
				Encuesta_Docente_SatisfacciF3n.p9.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p9.Summary)

				' P10
				Encuesta_Docente_SatisfacciF3n.P10.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P10.Summary)

				' P11
				Encuesta_Docente_SatisfacciF3n.P11.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P11.Summary)

				' P12
				Encuesta_Docente_SatisfacciF3n.P12.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P12.Summary)

				' P13
				Encuesta_Docente_SatisfacciF3n.P13.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P13.Summary)

				' P14
				Encuesta_Docente_SatisfacciF3n.P14.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P14.Summary)

				' P15
				Encuesta_Docente_SatisfacciF3n.P15.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P15.Summary)

				' P16
				Encuesta_Docente_SatisfacciF3n.P16.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P16.Summary)

				' P17
				Encuesta_Docente_SatisfacciF3n.P17.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P17.Summary)

				' P18
				Encuesta_Docente_SatisfacciF3n.P18.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P18.Summary)

				' P19
				Encuesta_Docente_SatisfacciF3n.P19.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P19.Summary)

				' P20
				Encuesta_Docente_SatisfacciF3n.P20.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P20.Summary)

				' P21
				Encuesta_Docente_SatisfacciF3n.P21.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P21.Summary)

				' P22
				Encuesta_Docente_SatisfacciF3n.P22.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P22.Summary)

				' P23
				Encuesta_Docente_SatisfacciF3n.P23.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P23.Summary)

				' P24
				Encuesta_Docente_SatisfacciF3n.P24.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P24.Summary)

				' P25
				Encuesta_Docente_SatisfacciF3n.P25.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P25.Summary)

				' p26
				Encuesta_Docente_SatisfacciF3n.p26.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p26.Summary)

				' p27
				Encuesta_Docente_SatisfacciF3n.p27.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p27.Summary)

				' p28
				Encuesta_Docente_SatisfacciF3n.p28.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p28.Summary)

				' p29
				Encuesta_Docente_SatisfacciF3n.p29.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p29.Summary)

				' p30
				Encuesta_Docente_SatisfacciF3n.p30.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p30.Summary)

				' p31
				Encuesta_Docente_SatisfacciF3n.p31.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p31.Summary)

				' p32
				Encuesta_Docente_SatisfacciF3n.p32.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p32.Summary)

				' p33
				Encuesta_Docente_SatisfacciF3n.p33.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p33.Summary)

				' p34
				Encuesta_Docente_SatisfacciF3n.p34.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p34.Summary)

				' p35
				Encuesta_Docente_SatisfacciF3n.p35.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p35.Summary)

				' p36
				Encuesta_Docente_SatisfacciF3n.p36.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p36.Summary)

				' p37
				Encuesta_Docente_SatisfacciF3n.p37.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p37.Summary)

				' p38
				Encuesta_Docente_SatisfacciF3n.p38.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p38.Summary)

				' p39
				Encuesta_Docente_SatisfacciF3n.p39.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p39.Summary)

				' p40
				Encuesta_Docente_SatisfacciF3n.p40.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p40.Summary)

				' p41
				Encuesta_Docente_SatisfacciF3n.p41.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p41.Summary)

				' p42
				Encuesta_Docente_SatisfacciF3n.p42.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p42.Summary)

				' p43
				Encuesta_Docente_SatisfacciF3n.p43.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p43.Summary)

				' observacion
				Encuesta_Docente_SatisfacciF3n.observacion.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.observacion.Summary)
			Else

				' codProf
				Encuesta_Docente_SatisfacciF3n.codProf.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.codProf.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.codProf.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PROFESOR
				Encuesta_Docente_SatisfacciF3n.PROFESOR.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.PROFESOR.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.PROFESOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				Encuesta_Docente_SatisfacciF3n.RUT.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.RUT.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				Encuesta_Docente_SatisfacciF3n.NOMBRE_C.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.NOMBRE_C.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' fecha
				Encuesta_Docente_SatisfacciF3n.fecha.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.fecha.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.fecha.ViewValue = ew_FormatDateTime(Encuesta_Docente_SatisfacciF3n.fecha.ViewValue, 7)
				Encuesta_Docente_SatisfacciF3n.fecha.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' AÑO
				Encuesta_Docente_SatisfacciF3n.AD1O.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.AD1O.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.AD1O.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' periodo
				Encuesta_Docente_SatisfacciF3n.periodo.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.periodo.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.periodo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p1
				Encuesta_Docente_SatisfacciF3n.p1.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p1.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p2
				Encuesta_Docente_SatisfacciF3n.p2.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p2.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p3
				Encuesta_Docente_SatisfacciF3n.p3.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p3.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p4
				Encuesta_Docente_SatisfacciF3n.p4.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p4.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p4.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p5
				Encuesta_Docente_SatisfacciF3n.p5.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p5.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p5.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p6
				Encuesta_Docente_SatisfacciF3n.p6.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p6.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p6.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p7
				Encuesta_Docente_SatisfacciF3n.p7.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p7.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p7.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p8
				Encuesta_Docente_SatisfacciF3n.p8.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p8.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p8.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p9
				Encuesta_Docente_SatisfacciF3n.p9.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p9.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p9.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P10
				Encuesta_Docente_SatisfacciF3n.P10.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P10.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P10.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P11
				Encuesta_Docente_SatisfacciF3n.P11.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P11.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P11.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P12
				Encuesta_Docente_SatisfacciF3n.P12.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P12.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P12.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P13
				Encuesta_Docente_SatisfacciF3n.P13.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P13.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P13.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P14
				Encuesta_Docente_SatisfacciF3n.P14.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P14.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P14.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P15
				Encuesta_Docente_SatisfacciF3n.P15.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P15.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P15.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P16
				Encuesta_Docente_SatisfacciF3n.P16.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P16.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P16.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P17
				Encuesta_Docente_SatisfacciF3n.P17.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P17.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P17.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P18
				Encuesta_Docente_SatisfacciF3n.P18.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P18.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P18.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P19
				Encuesta_Docente_SatisfacciF3n.P19.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P19.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P19.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P20
				Encuesta_Docente_SatisfacciF3n.P20.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P20.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P20.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P21
				Encuesta_Docente_SatisfacciF3n.P21.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P21.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P21.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P22
				Encuesta_Docente_SatisfacciF3n.P22.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P22.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P22.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P23
				Encuesta_Docente_SatisfacciF3n.P23.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P23.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P23.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P24
				Encuesta_Docente_SatisfacciF3n.P24.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P24.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P24.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P25
				Encuesta_Docente_SatisfacciF3n.P25.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.P25.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.P25.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p26
				Encuesta_Docente_SatisfacciF3n.p26.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p26.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p26.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p27
				Encuesta_Docente_SatisfacciF3n.p27.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p27.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p27.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p28
				Encuesta_Docente_SatisfacciF3n.p28.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p28.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p28.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p29
				Encuesta_Docente_SatisfacciF3n.p29.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p29.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p29.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p30
				Encuesta_Docente_SatisfacciF3n.p30.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p30.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p30.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p31
				Encuesta_Docente_SatisfacciF3n.p31.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p31.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p31.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p32
				Encuesta_Docente_SatisfacciF3n.p32.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p32.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p32.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p33
				Encuesta_Docente_SatisfacciF3n.p33.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p33.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p33.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p34
				Encuesta_Docente_SatisfacciF3n.p34.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p34.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p34.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p35
				Encuesta_Docente_SatisfacciF3n.p35.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p35.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p35.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p36
				Encuesta_Docente_SatisfacciF3n.p36.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p36.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p36.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p37
				Encuesta_Docente_SatisfacciF3n.p37.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p37.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p37.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p38
				Encuesta_Docente_SatisfacciF3n.p38.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p38.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p38.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p39
				Encuesta_Docente_SatisfacciF3n.p39.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p39.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p39.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p40
				Encuesta_Docente_SatisfacciF3n.p40.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p40.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p40.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p41
				Encuesta_Docente_SatisfacciF3n.p41.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p41.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p41.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p42
				Encuesta_Docente_SatisfacciF3n.p42.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p42.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p42.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p43
				Encuesta_Docente_SatisfacciF3n.p43.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.p43.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.p43.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' observacion
				Encuesta_Docente_SatisfacciF3n.observacion.ViewValue = Convert.ToString(Encuesta_Docente_SatisfacciF3n.observacion.CurrentValue)
				Encuesta_Docente_SatisfacciF3n.observacion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' codProf
			Encuesta_Docente_SatisfacciF3n.codProf.HrefValue = ""

			' PROFESOR
			Encuesta_Docente_SatisfacciF3n.PROFESOR.HrefValue = ""

			' RUT
			Encuesta_Docente_SatisfacciF3n.RUT.HrefValue = ""

			' NOMBRE_C
			Encuesta_Docente_SatisfacciF3n.NOMBRE_C.HrefValue = ""

			' fecha
			Encuesta_Docente_SatisfacciF3n.fecha.HrefValue = ""

			' AÑO
			Encuesta_Docente_SatisfacciF3n.AD1O.HrefValue = ""

			' periodo
			Encuesta_Docente_SatisfacciF3n.periodo.HrefValue = ""

			' p1
			Encuesta_Docente_SatisfacciF3n.p1.HrefValue = ""

			' p2
			Encuesta_Docente_SatisfacciF3n.p2.HrefValue = ""

			' p3
			Encuesta_Docente_SatisfacciF3n.p3.HrefValue = ""

			' p4
			Encuesta_Docente_SatisfacciF3n.p4.HrefValue = ""

			' p5
			Encuesta_Docente_SatisfacciF3n.p5.HrefValue = ""

			' p6
			Encuesta_Docente_SatisfacciF3n.p6.HrefValue = ""

			' p7
			Encuesta_Docente_SatisfacciF3n.p7.HrefValue = ""

			' p8
			Encuesta_Docente_SatisfacciF3n.p8.HrefValue = ""

			' p9
			Encuesta_Docente_SatisfacciF3n.p9.HrefValue = ""

			' P10
			Encuesta_Docente_SatisfacciF3n.P10.HrefValue = ""

			' P11
			Encuesta_Docente_SatisfacciF3n.P11.HrefValue = ""

			' P12
			Encuesta_Docente_SatisfacciF3n.P12.HrefValue = ""

			' P13
			Encuesta_Docente_SatisfacciF3n.P13.HrefValue = ""

			' P14
			Encuesta_Docente_SatisfacciF3n.P14.HrefValue = ""

			' P15
			Encuesta_Docente_SatisfacciF3n.P15.HrefValue = ""

			' P16
			Encuesta_Docente_SatisfacciF3n.P16.HrefValue = ""

			' P17
			Encuesta_Docente_SatisfacciF3n.P17.HrefValue = ""

			' P18
			Encuesta_Docente_SatisfacciF3n.P18.HrefValue = ""

			' P19
			Encuesta_Docente_SatisfacciF3n.P19.HrefValue = ""

			' P20
			Encuesta_Docente_SatisfacciF3n.P20.HrefValue = ""

			' P21
			Encuesta_Docente_SatisfacciF3n.P21.HrefValue = ""

			' P22
			Encuesta_Docente_SatisfacciF3n.P22.HrefValue = ""

			' P23
			Encuesta_Docente_SatisfacciF3n.P23.HrefValue = ""

			' P24
			Encuesta_Docente_SatisfacciF3n.P24.HrefValue = ""

			' P25
			Encuesta_Docente_SatisfacciF3n.P25.HrefValue = ""

			' p26
			Encuesta_Docente_SatisfacciF3n.p26.HrefValue = ""

			' p27
			Encuesta_Docente_SatisfacciF3n.p27.HrefValue = ""

			' p28
			Encuesta_Docente_SatisfacciF3n.p28.HrefValue = ""

			' p29
			Encuesta_Docente_SatisfacciF3n.p29.HrefValue = ""

			' p30
			Encuesta_Docente_SatisfacciF3n.p30.HrefValue = ""

			' p31
			Encuesta_Docente_SatisfacciF3n.p31.HrefValue = ""

			' p32
			Encuesta_Docente_SatisfacciF3n.p32.HrefValue = ""

			' p33
			Encuesta_Docente_SatisfacciF3n.p33.HrefValue = ""

			' p34
			Encuesta_Docente_SatisfacciF3n.p34.HrefValue = ""

			' p35
			Encuesta_Docente_SatisfacciF3n.p35.HrefValue = ""

			' p36
			Encuesta_Docente_SatisfacciF3n.p36.HrefValue = ""

			' p37
			Encuesta_Docente_SatisfacciF3n.p37.HrefValue = ""

			' p38
			Encuesta_Docente_SatisfacciF3n.p38.HrefValue = ""

			' p39
			Encuesta_Docente_SatisfacciF3n.p39.HrefValue = ""

			' p40
			Encuesta_Docente_SatisfacciF3n.p40.HrefValue = ""

			' p41
			Encuesta_Docente_SatisfacciF3n.p41.HrefValue = ""

			' p42
			Encuesta_Docente_SatisfacciF3n.p42.HrefValue = ""

			' p43
			Encuesta_Docente_SatisfacciF3n.p43.HrefValue = ""

			' observacion
			Encuesta_Docente_SatisfacciF3n.observacion.HrefValue = ""

			' Call Row_Rendered event
			Encuesta_Docente_SatisfacciF3n.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [PROFESOR] FROM " + Encuesta_Docente_SatisfacciF3n.SqlFrom
			sOrderBy = "[PROFESOR] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Encuesta_Docente_SatisfacciF3n.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NOMBRE_C
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + Encuesta_Docente_SatisfacciF3n.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Encuesta_Docente_SatisfacciF3n.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field AÑO
			sSelect = "SELECT DISTINCT [AÑO] FROM " + Encuesta_Docente_SatisfacciF3n.SqlFrom
			sOrderBy = "[AÑO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Encuesta_Docente_SatisfacciF3n.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Encuesta_Docente_SatisfacciF3n.AD1O.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field periodo
			sSelect = "SELECT DISTINCT [periodo] FROM " + Encuesta_Docente_SatisfacciF3n.SqlFrom
			sOrderBy = "[periodo] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Encuesta_Docente_SatisfacciF3n.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Encuesta_Docente_SatisfacciF3n.periodo.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(Encuesta_Docente_SatisfacciF3n.codProf)

				' Field PROFESOR
				SetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownValue, Encuesta_Docente_SatisfacciF3n.PROFESOR)

				' Field RUT
				SetSessionFilterValues(Encuesta_Docente_SatisfacciF3n.RUT)

				' Field NOMBRE_C
				SetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownValue, Encuesta_Docente_SatisfacciF3n.NOMBRE_C)

				' Field AÑO
				SetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.AD1O.DropDownValue, Encuesta_Docente_SatisfacciF3n.AD1O)

				' Field periodo
				SetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.periodo.DropDownValue, Encuesta_Docente_SatisfacciF3n.periodo)
			bSetupFilter = True ' Set up filter required
		Else

				' Field codProf
				If (GetFilterValues(Encuesta_Docente_SatisfacciF3n.codProf)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PROFESOR
				If (GetDropDownValue(Encuesta_Docente_SatisfacciF3n.PROFESOR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownValue) Then
					If Not ew_SameStr(Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Encuesta_Docente_SatisfacciF3n_PROFESOR") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field RUT
				If (GetFilterValues(Encuesta_Docente_SatisfacciF3n.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE_C
				If (GetDropDownValue(Encuesta_Docente_SatisfacciF3n.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Encuesta_Docente_SatisfacciF3n_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field AÑO
				If (GetDropDownValue(Encuesta_Docente_SatisfacciF3n.AD1O)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Encuesta_Docente_SatisfacciF3n.AD1O.DropDownValue) Then
					If Not ew_SameStr(Encuesta_Docente_SatisfacciF3n.AD1O.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Encuesta_Docente_SatisfacciF3n_AD1O") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field periodo
				If (GetDropDownValue(Encuesta_Docente_SatisfacciF3n.periodo)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Encuesta_Docente_SatisfacciF3n.periodo.DropDownValue) Then
					If Not ew_SameStr(Encuesta_Docente_SatisfacciF3n.periodo.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Encuesta_Docente_SatisfacciF3n_periodo") Is Nothing Then
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
			GetSessionFilterValues(Encuesta_Docente_SatisfacciF3n.codProf)

			' Field PROFESOR
			GetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.PROFESOR)

			' Field RUT
			GetSessionFilterValues(Encuesta_Docente_SatisfacciF3n.RUT)

			' Field NOMBRE_C
			GetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.NOMBRE_C)

			' Field AÑO
			GetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.AD1O)

			' Field periodo
			GetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.periodo)
		End If

		' Call page filter validated event
		Encuesta_Docente_SatisfacciF3n.Page_FilterValidated()

		' Build SQL
		' Field codProf

		BuildExtendedFilter(Encuesta_Docente_SatisfacciF3n.codProf, sFilter)

		' Field PROFESOR
		BuildDropDownFilter(Encuesta_Docente_SatisfacciF3n.PROFESOR, sFilter, "")

		' Field RUT
		BuildExtendedFilter(Encuesta_Docente_SatisfacciF3n.RUT, sFilter)

		' Field NOMBRE_C
		BuildDropDownFilter(Encuesta_Docente_SatisfacciF3n.NOMBRE_C, sFilter, "")

		' Field AÑO
		BuildDropDownFilter(Encuesta_Docente_SatisfacciF3n.AD1O, sFilter, "")

		' Field periodo
		BuildDropDownFilter(Encuesta_Docente_SatisfacciF3n.periodo, sFilter, "")

		' Save parms to Session
		' Field codProf

		SetSessionFilterValues(Encuesta_Docente_SatisfacciF3n.codProf)

		' Field PROFESOR
		SetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownValue, Encuesta_Docente_SatisfacciF3n.PROFESOR)

		' Field RUT
		SetSessionFilterValues(Encuesta_Docente_SatisfacciF3n.RUT)

		' Field NOMBRE_C
		SetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownValue, Encuesta_Docente_SatisfacciF3n.NOMBRE_C)

		' Field AÑO
		SetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.AD1O.DropDownValue, Encuesta_Docente_SatisfacciF3n.AD1O)

		' Field periodo
		SetSessionDropDownValue(Encuesta_Docente_SatisfacciF3n.periodo.DropDownValue, Encuesta_Docente_SatisfacciF3n.periodo)

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
		If ew_Session("sv_Encuesta_Docente_SatisfacciF3n_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Encuesta_Docente_SatisfacciF3n_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Encuesta_Docente_SatisfacciF3n_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Encuesta_Docente_SatisfacciF3n_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Encuesta_Docente_SatisfacciF3n_" + parm)
		End If
		If ew_Session("so1_Encuesta_Docente_SatisfacciF3n_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Encuesta_Docente_SatisfacciF3n_" + parm))
		End If
		If ew_Session("sc_Encuesta_Docente_SatisfacciF3n_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Encuesta_Docente_SatisfacciF3n_" + parm))
		End If
		If ew_Session("sv2_Encuesta_Docente_SatisfacciF3n_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Encuesta_Docente_SatisfacciF3n_" + parm)
		End If
		If ew_Session("so2_Encuesta_Docente_SatisfacciF3n_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Encuesta_Docente_SatisfacciF3n_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Encuesta_Docente_SatisfacciF3n_" + parm) = fld.SearchValue
		ew_Session("so1_Encuesta_Docente_SatisfacciF3n_" + parm) = fld.SearchOperator
		ew_Session("sc_Encuesta_Docente_SatisfacciF3n_" + parm) = fld.SearchCondition
		ew_Session("sv2_Encuesta_Docente_SatisfacciF3n_" + parm) = fld.SearchValue2
		ew_Session("so2_Encuesta_Docente_SatisfacciF3n_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Encuesta_Docente_SatisfacciF3n_" + parm) = ""
		ew_Session("so1_Encuesta_Docente_SatisfacciF3n_" + parm) = "="
		ew_Session("sc_Encuesta_Docente_SatisfacciF3n_" + parm) = "AND"
		ew_Session("sv2_Encuesta_Docente_SatisfacciF3n_" + parm) = ""
		ew_Session("so2_Encuesta_Docente_SatisfacciF3n_" + parm) = "="
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
		ew_Session("sel_Encuesta_Docente_SatisfacciF3n_" & parm) = ""
		ew_Session("rf_Encuesta_Docente_SatisfacciF3n_" & parm) = ""
		ew_Session("rt_Encuesta_Docente_SatisfacciF3n_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Encuesta_Docente_SatisfacciF3n.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Encuesta_Docente_SatisfacciF3n_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Encuesta_Docente_SatisfacciF3n_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Encuesta_Docente_SatisfacciF3n_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field PROFESOR

			Encuesta_Docente_SatisfacciF3n.PROFESOR.DefaultDropDownValue = EWRPT_INIT_VALUE
			Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownValue = Encuesta_Docente_SatisfacciF3n.PROFESOR.DefaultDropDownValue

			' Field NOMBRE_C
			Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownValue = Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DefaultDropDownValue

			' Field AÑO
			Encuesta_Docente_SatisfacciF3n.AD1O.DefaultDropDownValue = EWRPT_INIT_VALUE
			Encuesta_Docente_SatisfacciF3n.AD1O.DropDownValue = Encuesta_Docente_SatisfacciF3n.AD1O.DefaultDropDownValue

			' Field periodo
			Encuesta_Docente_SatisfacciF3n.periodo.DefaultDropDownValue = EWRPT_INIT_VALUE
			Encuesta_Docente_SatisfacciF3n.periodo.DropDownValue = Encuesta_Docente_SatisfacciF3n.periodo.DefaultDropDownValue

		' Set up default values for extended filters
			' Field codProf

			SetDefaultExtFilter(Encuesta_Docente_SatisfacciF3n.codProf, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Encuesta_Docente_SatisfacciF3n.codProf)	

			' Field RUT
			SetDefaultExtFilter(Encuesta_Docente_SatisfacciF3n.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Encuesta_Docente_SatisfacciF3n.RUT)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check codProf extended filter
		If (TextFilterApplied(Encuesta_Docente_SatisfacciF3n.codProf)) Then bFilterExist = True

		' Check PROFESOR dropdown filter
		If (NonTextFilterApplied(Encuesta_Docente_SatisfacciF3n.PROFESOR)) Then bFilterExist = True

		' Check RUT extended filter
		If (TextFilterApplied(Encuesta_Docente_SatisfacciF3n.RUT)) Then bFilterExist = True

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(Encuesta_Docente_SatisfacciF3n.NOMBRE_C)) Then bFilterExist = True

		' Check AÑO dropdown filter
		If (NonTextFilterApplied(Encuesta_Docente_SatisfacciF3n.AD1O)) Then bFilterExist = True

		' Check periodo dropdown filter
		If (NonTextFilterApplied(Encuesta_Docente_SatisfacciF3n.periodo)) Then bFilterExist = True
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
		BuildExtendedFilter(Encuesta_Docente_SatisfacciF3n.codProf, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Encuesta_Docente_SatisfacciF3n.codProf.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PROFESOR
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Encuesta_Docente_SatisfacciF3n.PROFESOR, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Encuesta_Docente_SatisfacciF3n.PROFESOR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Encuesta_Docente_SatisfacciF3n.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Encuesta_Docente_SatisfacciF3n.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Encuesta_Docente_SatisfacciF3n.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Encuesta_Docente_SatisfacciF3n.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AÑO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Encuesta_Docente_SatisfacciF3n.AD1O, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Encuesta_Docente_SatisfacciF3n.AD1O.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field periodo
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Encuesta_Docente_SatisfacciF3n.periodo, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Encuesta_Docente_SatisfacciF3n.periodo.FldCaption() & "<br>"
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
				Encuesta_Docente_SatisfacciF3n.OrderBy = ""
				Encuesta_Docente_SatisfacciF3n.StartGroup = 1
				Encuesta_Docente_SatisfacciF3n.codProf.Sort = ""
				Encuesta_Docente_SatisfacciF3n.PROFESOR.Sort = ""
				Encuesta_Docente_SatisfacciF3n.RUT.Sort = ""
				Encuesta_Docente_SatisfacciF3n.NOMBRE_C.Sort = ""
				Encuesta_Docente_SatisfacciF3n.fecha.Sort = ""
				Encuesta_Docente_SatisfacciF3n.AD1O.Sort = ""
				Encuesta_Docente_SatisfacciF3n.periodo.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p1.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p2.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p3.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p4.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p5.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p6.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p7.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p8.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p9.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P10.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P11.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P12.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P13.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P14.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P15.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P16.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P17.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P18.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P19.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P20.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P21.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P22.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P23.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P24.Sort = ""
				Encuesta_Docente_SatisfacciF3n.P25.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p26.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p27.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p28.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p29.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p30.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p31.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p32.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p33.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p34.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p35.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p36.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p37.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p38.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p39.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p40.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p41.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p42.Sort = ""
				Encuesta_Docente_SatisfacciF3n.p43.Sort = ""
				Encuesta_Docente_SatisfacciF3n.observacion.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Encuesta_Docente_SatisfacciF3n.CurrentOrder = ew_Get("order")
			Encuesta_Docente_SatisfacciF3n.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Encuesta_Docente_SatisfacciF3n.SortSql()
			Encuesta_Docente_SatisfacciF3n.OrderBy = sSortSql
			Encuesta_Docente_SatisfacciF3n.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Encuesta_Docente_SatisfacciF3n.OrderBy)) Then
			Encuesta_Docente_SatisfacciF3n.OrderBy = "[PROFESOR] ASC"
			Encuesta_Docente_SatisfacciF3n.PROFESOR.Sort = "ASC"
		End If
		Return Encuesta_Docente_SatisfacciF3n.OrderBy
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
		Encuesta_Docente_SatisfacciF3n_summary = New crEncuesta_Docente_SatisfacciF3n_summary(Me)
		Encuesta_Docente_SatisfacciF3n_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Encuesta_Docente_SatisfacciF3n_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Encuesta_Docente_SatisfacciF3n_summary IsNot Nothing) Then Encuesta_Docente_SatisfacciF3n_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Encuesta_Docente_SatisfacciF3n_summary = new ewrpt_Page("Encuesta_Docente_SatisfacciF3n_summary");
// page properties
Encuesta_Docente_SatisfacciF3n_summary.PageID = "summary"; // page ID
Encuesta_Docente_SatisfacciF3n_summary.FormID = "fEncuesta_Docente_SatisfacciF3nsummaryfilter"; // form ID
var EWRPT_PAGE_ID = Encuesta_Docente_SatisfacciF3n_summary.PageID;
// extend page with ValidateForm function
Encuesta_Docente_SatisfacciF3n_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Encuesta_Docente_SatisfacciF3n_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Encuesta_Docente_SatisfacciF3n_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Encuesta_Docente_SatisfacciF3n_summary.ValidateRequired = false; // no JavaScript validation
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
<% Encuesta_Docente_SatisfacciF3n_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Encuesta_Docente_SatisfacciF3n.TableCaption() %></h1></div>
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Encuesta_Docente_SatisfacciF3n_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" alt="Exportar a Excel" title="Exportar a Excel" /></a>
<% If (Encuesta_Docente_SatisfacciF3n_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Encuesta_Docente_SatisfacciF3n_summary.ShowMessage() %>
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Encuesta_Docente_SatisfacciF3n.FilterPanelOption = 2 OrElse (Encuesta_Docente_SatisfacciF3n.FilterPanelOption = 3 AndAlso Encuesta_Docente_SatisfacciF3n_summary.FilterApplied) OrElse Encuesta_Docente_SatisfacciF3n_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Encuesta_Docente_SatisfacciF3nsmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fEncuesta_Docente_SatisfacciF3nsummaryfilter" id="fEncuesta_Docente_SatisfacciF3nsummaryfilter" action="Encuesta_Docente_SatisfacciF3nsmry.aspx" class="ewForm" onsubmit="return Encuesta_Docente_SatisfacciF3n_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Encuesta_Docente_SatisfacciF3n.RUT.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Encuesta_Docente_SatisfacciF3n.codProf.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_codProf" id="sv1_codProf" size="30" maxlength="50" value="<%= ew_HtmlEncode(Encuesta_Docente_SatisfacciF3n.codProf.SearchValue) %>"<%= IIf(Encuesta_Docente_SatisfacciF3n_summary.ClearExtFilter = "Encuesta_Docente_SatisfacciF3n_codProf", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Encuesta_Docente_SatisfacciF3n.PROFESOR.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PROFESOR" id="sv_PROFESOR"<%= IIf(Encuesta_Docente_SatisfacciF3n_summary.ClearExtFilter = "Encuesta_Docente_SatisfacciF3n_PROFESOR", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Encuesta_Docente_SatisfacciF3n.PROFESOR.CustomFilters.Count + Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Encuesta_Docente_SatisfacciF3n.PROFESOR.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PROFESOR")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.PROFESOR.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Encuesta_Docente_SatisfacciF3n.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="22" value="<%= ew_HtmlEncode(Encuesta_Docente_SatisfacciF3n.RUT.SearchValue) %>"<%= IIf(Encuesta_Docente_SatisfacciF3n_summary.ClearExtFilter = "Encuesta_Docente_SatisfacciF3n_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Encuesta_Docente_SatisfacciF3n.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(Encuesta_Docente_SatisfacciF3n_summary.ClearExtFilter = "Encuesta_Docente_SatisfacciF3n_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Encuesta_Docente_SatisfacciF3n.NOMBRE_C.CustomFilters.Count + Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Encuesta_Docente_SatisfacciF3n.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Encuesta_Docente_SatisfacciF3n.AD1O.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AD1O" id="sv_AD1O"<%= IIf(Encuesta_Docente_SatisfacciF3n_summary.ClearExtFilter = "Encuesta_Docente_SatisfacciF3n_AD1O", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.AD1O.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Encuesta_Docente_SatisfacciF3n.AD1O.CustomFilters.Count + Encuesta_Docente_SatisfacciF3n.AD1O.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Encuesta_Docente_SatisfacciF3n.AD1O.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "AÑO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.AD1O.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Encuesta_Docente_SatisfacciF3n.AD1O.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.AD1O.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Encuesta_Docente_SatisfacciF3n.periodo.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_periodo" id="sv_periodo"<%= IIf(Encuesta_Docente_SatisfacciF3n_summary.ClearExtFilter = "Encuesta_Docente_SatisfacciF3n_periodo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.periodo.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Encuesta_Docente_SatisfacciF3n.periodo.CustomFilters.Count + Encuesta_Docente_SatisfacciF3n.periodo.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Encuesta_Docente_SatisfacciF3n.periodo.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "periodo")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.periodo.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Encuesta_Docente_SatisfacciF3n.periodo.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Encuesta_Docente_SatisfacciF3n.periodo.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (Encuesta_Docente_SatisfacciF3n.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Encuesta_Docente_SatisfacciF3n_summary.ShowFilterList() %>
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
If (Encuesta_Docente_SatisfacciF3n.ExportAll AndAlso ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then
	Encuesta_Docente_SatisfacciF3n_summary.StopGrp = Encuesta_Docente_SatisfacciF3n_summary.TotalGrps
Else
	Encuesta_Docente_SatisfacciF3n_summary.StopGrp = Encuesta_Docente_SatisfacciF3n_summary.StartGrp + Encuesta_Docente_SatisfacciF3n_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Encuesta_Docente_SatisfacciF3n_summary.StopGrp > Encuesta_Docente_SatisfacciF3n_summary.TotalGrps) Then
	Encuesta_Docente_SatisfacciF3n_summary.StopGrp = Encuesta_Docente_SatisfacciF3n_summary.TotalGrps
End If
Encuesta_Docente_SatisfacciF3n_summary.RecCount = 0

' Get first row
If (Encuesta_Docente_SatisfacciF3n_summary.TotalGrps > 0) Then
	Encuesta_Docente_SatisfacciF3n_summary.GetRow() ' ASPXRPT
	Encuesta_Docente_SatisfacciF3n_summary.GrpCount = 1
End If
While ((Encuesta_Docente_SatisfacciF3n_summary.HasRow AndAlso Encuesta_Docente_SatisfacciF3n_summary.GrpIndex < Encuesta_Docente_SatisfacciF3n_summary.StopGrp) OrElse Encuesta_Docente_SatisfacciF3n_summary.ShowFirstHeader)

	' Show header
	If (Encuesta_Docente_SatisfacciF3n_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.codProf.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.codProf))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.codProf.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.codProf) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.codProf.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.codProf.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.codProf.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.PROFESOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.PROFESOR))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.PROFESOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.PROFESOR) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.PROFESOR.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.PROFESOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.PROFESOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.RUT) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.NOMBRE_C) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.fecha.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.fecha))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.fecha.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.fecha) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.fecha.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.fecha.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.fecha.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.AD1O.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.AD1O))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.AD1O.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.AD1O) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.AD1O.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.AD1O.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.AD1O.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.periodo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.periodo))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.periodo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.periodo) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.periodo.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.periodo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.periodo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p1))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p1) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p1.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p2))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p2) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p2.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p3))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p3) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p3.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p4.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p4))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p4.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p4) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p4.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p4.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p4.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p5.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p5))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p5.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p5) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p5.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p5.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p5.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p6.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p6))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p6.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p6) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p6.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p6.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p6.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p7.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p7))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p7.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p7) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p7.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p7.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p7.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p8.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p8))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p8.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p8) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p8.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p8.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p8.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p9.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p9))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p9.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p9) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p9.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p9.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p9.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P10.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P10))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P10.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P10) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P10.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P10.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P10.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P11.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P11))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P11.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P11) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P11.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P11.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P11.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P12.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P12))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P12.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P12) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P12.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P12.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P12.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P13.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P13))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P13.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P13) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P13.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P13.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P13.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P14.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P14))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P14.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P14) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P14.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P14.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P14.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P15.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P15))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P15.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P15) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P15.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P15.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P15.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P16.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P16))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P16.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P16) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P16.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P16.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P16.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P17.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P17))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P17.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P17) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P17.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P17.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P17.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P18.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P18))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P18.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P18) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P18.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P18.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P18.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P19.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P19))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P19.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P19) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P19.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P19.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P19.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P20.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P20))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P20.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P20) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P20.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P20.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P20.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P21.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P21))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P21.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P21) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P21.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P21.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P21.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P22.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P22))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P22.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P22) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P22.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P22.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P22.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P23.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P23))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P23.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P23) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P23.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P23.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P23.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P24.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P24))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P24.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P24) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P24.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P24.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P24.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.P25.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P25))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.P25.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.P25) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.P25.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.P25.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.P25.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p26.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p26))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p26.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p26) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p26.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p26.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p26.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p27.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p27))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p27.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p27) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p27.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p27.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p27.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p28.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p28))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p28.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p28) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p28.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p28.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p28.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p29.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p29))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p29.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p29) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p29.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p29.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p29.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p30.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p30))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p30.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p30) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p30.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p30.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p30.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p31.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p31))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p31.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p31) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p31.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p31.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p31.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p32.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p32))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p32.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p32) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p32.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p32.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p32.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p33.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p33))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p33.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p33) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p33.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p33.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p33.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p34.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p34))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p34.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p34) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p34.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p34.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p34.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p35.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p35))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p35.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p35) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p35.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p35.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p35.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p36.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p36))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p36.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p36) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p36.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p36.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p36.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p37.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p37))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p37.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p37) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p37.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p37.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p37.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p38.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p38))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p38.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p38) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p38.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p38.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p38.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p39.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p39))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p39.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p39) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p39.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p39.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p39.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p40.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p40))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p40.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p40) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p40.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p40.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p40.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p41.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p41))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p41.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p41) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p41.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p41.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p41.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p42.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p42))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p42.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p42) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p42.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p42.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p42.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.p43.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p43))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.p43.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.p43) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.p43.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.p43.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.p43.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Encuesta_Docente_SatisfacciF3n.Export)) Then %>
<%= Encuesta_Docente_SatisfacciF3n.observacion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.observacion))) Then %>
		<td style="vertical-align: bottom;"><%= Encuesta_Docente_SatisfacciF3n.observacion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Encuesta_Docente_SatisfacciF3n.SortUrl(Encuesta_Docente_SatisfacciF3n.observacion) %>',0);"><%= Encuesta_Docente_SatisfacciF3n.observacion.FldCaption() %></td><td style="width: 10px;">
		<% If (Encuesta_Docente_SatisfacciF3n.observacion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Encuesta_Docente_SatisfacciF3n.observacion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Encuesta_Docente_SatisfacciF3n_summary.ShowFirstHeader = False
	End If
	Encuesta_Docente_SatisfacciF3n_summary.RecCount += 1

		' Render detail row
		Encuesta_Docente_SatisfacciF3n.ResetCSS()
		Encuesta_Docente_SatisfacciF3n.RowType = EWRPT_ROWTYPE_DETAIL
		Encuesta_Docente_SatisfacciF3n_summary.RenderRow()
%>
	<tr<%= Encuesta_Docente_SatisfacciF3n.RowAttributes() %>>
		<td<%= Encuesta_Docente_SatisfacciF3n.codProf.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.codProf.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.codProf.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.PROFESOR.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.PROFESOR.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.PROFESOR.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.RUT.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.RUT.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.RUT.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.NOMBRE_C.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.NOMBRE_C.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.fecha.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.fecha.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.fecha.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.AD1O.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.AD1O.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.AD1O.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.periodo.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.periodo.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.periodo.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p1.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p1.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p1.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p2.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p2.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p2.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p3.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p3.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p3.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p4.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p4.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p4.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p5.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p5.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p5.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p6.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p6.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p6.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p7.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p7.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p7.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p8.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p8.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p8.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p9.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p9.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p9.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P10.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P10.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P10.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P11.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P11.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P11.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P12.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P12.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P12.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P13.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P13.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P13.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P14.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P14.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P14.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P15.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P15.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P15.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P16.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P16.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P16.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P17.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P17.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P17.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P18.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P18.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P18.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P19.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P19.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P19.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P20.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P20.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P20.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P21.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P21.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P21.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P22.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P22.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P22.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P23.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P23.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P23.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P24.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P24.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P24.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.P25.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.P25.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.P25.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p26.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p26.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p26.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p27.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p27.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p27.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p28.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p28.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p28.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p29.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p29.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p29.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p30.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p30.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p30.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p31.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p31.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p31.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p32.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p32.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p32.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p33.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p33.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p33.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p34.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p34.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p34.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p35.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p35.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p35.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p36.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p36.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p36.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p37.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p37.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p37.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p38.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p38.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p38.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p39.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p39.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p39.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p40.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p40.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p40.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p41.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p41.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p41.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p42.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p42.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p42.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.p43.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.p43.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.p43.ListViewValue%></div>
</td>
		<td<%= Encuesta_Docente_SatisfacciF3n.observacion.CellAttributes %>>
<div<%= Encuesta_Docente_SatisfacciF3n.observacion.ViewAttributes%>><%= Encuesta_Docente_SatisfacciF3n.observacion.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Encuesta_Docente_SatisfacciF3n_summary.AccumulateSummary()

		' Get next record
		Encuesta_Docente_SatisfacciF3n_summary.GetRow() ' ASPXRPT
		Encuesta_Docente_SatisfacciF3n_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Encuesta_Docente_SatisfacciF3n_summary.TotalGrps > 0) Then
	Encuesta_Docente_SatisfacciF3n.ResetCSS()
	Encuesta_Docente_SatisfacciF3n.RowType = EWRPT_ROWTYPE_TOTAL
	Encuesta_Docente_SatisfacciF3n.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Encuesta_Docente_SatisfacciF3n.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Encuesta_Docente_SatisfacciF3n.RowAttrs("class") = "ewRptGrandSummary"
	Encuesta_Docente_SatisfacciF3n_summary.RenderRow()
%>
	<!-- tr><td colspan="51"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Encuesta_Docente_SatisfacciF3n.RowAttributes() %>><td colspan="51"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Encuesta_Docente_SatisfacciF3n_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Encuesta_Docente_SatisfacciF3n_summary.Pager Is Nothing Then Encuesta_Docente_SatisfacciF3n_summary.Pager = New cPrevNextPager(Encuesta_Docente_SatisfacciF3n_summary.StartGrp, Encuesta_Docente_SatisfacciF3n_summary.DisplayGrps, Encuesta_Docente_SatisfacciF3n_summary.TotalGrps) %>
<% If Encuesta_Docente_SatisfacciF3n_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Encuesta_Docente_SatisfacciF3n_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Encuesta_Docente_SatisfacciF3nsmry.aspx?start=<%= Encuesta_Docente_SatisfacciF3n_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Encuesta_Docente_SatisfacciF3n_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Encuesta_Docente_SatisfacciF3nsmry.aspx?start=<%= Encuesta_Docente_SatisfacciF3n_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Encuesta_Docente_SatisfacciF3n_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Encuesta_Docente_SatisfacciF3n_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Encuesta_Docente_SatisfacciF3nsmry.aspx?start=<%= Encuesta_Docente_SatisfacciF3n_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Encuesta_Docente_SatisfacciF3n_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Encuesta_Docente_SatisfacciF3nsmry.aspx?start=<%= Encuesta_Docente_SatisfacciF3n_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Encuesta_Docente_SatisfacciF3n_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Encuesta_Docente_SatisfacciF3n_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Encuesta_Docente_SatisfacciF3n_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Encuesta_Docente_SatisfacciF3n_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Encuesta_Docente_SatisfacciF3n_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Encuesta_Docente_SatisfacciF3n_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Encuesta_Docente_SatisfacciF3n_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Encuesta_Docente_SatisfacciF3n_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Encuesta_Docente_SatisfacciF3n_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Encuesta_Docente_SatisfacciF3n_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Encuesta_Docente_SatisfacciF3n.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
