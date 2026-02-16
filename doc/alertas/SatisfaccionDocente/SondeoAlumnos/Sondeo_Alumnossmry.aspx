<%@ Page ClassName="Sondeo_Alumnossmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_SondeoAlumnos" %>
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
	Public Sondeo_Alumnos As crSondeo_Alumnos = Nothing

	'
	' Table class (for Sondeo Alumnos)
	'
	Public Class crSondeo_Alumnos
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
				Return "Sondeo_Alumnos"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Sondeo Alumnos"
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

		Public NOMBRE As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public carrera As crField

		Public ano As crField

		Public periodo As crField

		Public realizado As crField

		Public fechaRealizado As crField

		Public observacion As crField

		Public p1 As crField

		Public p2 As crField

		Public p3 As crField

		Public p4 As crField

		Public p5 As crField

		Public p6 As crField

		Public p7 As crField

		Public P8 As crField

		Public P9 As crField

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
			rut = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_rut", "rut", "[rut]", 200, EWRPT_DATATYPE_STRING, -1)
			rut.Page = APage
			rut.ParentPage = APage.ParentPage
			Fields.Add("rut", rut)
			rut.DateFilter = ""
			rut.SqlSelect = ""
			rut.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' carrera
			carrera = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_carrera", "carrera", "[carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			carrera.Page = APage
			carrera.ParentPage = APage.ParentPage
			Fields.Add("carrera", carrera)
			carrera.DateFilter = ""
			carrera.SqlSelect = ""
			carrera.SqlOrderBy = ""

			' ano
			ano = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_ano", "ano", "[ano]", 3, EWRPT_DATATYPE_NUMBER, -1)
			ano.Page = APage
			ano.ParentPage = APage.ParentPage
			ano.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("ano", ano)
			ano.DateFilter = ""
			ano.SqlSelect = ""
			ano.SqlOrderBy = ""

			' periodo
			periodo = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_periodo", "periodo", "[periodo]", 3, EWRPT_DATATYPE_NUMBER, -1)
			periodo.Page = APage
			periodo.ParentPage = APage.ParentPage
			periodo.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("periodo", periodo)
			periodo.DateFilter = ""
			periodo.SqlSelect = ""
			periodo.SqlOrderBy = ""

			' realizado
			realizado = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_realizado", "realizado", "[realizado]", 3, EWRPT_DATATYPE_NUMBER, -1)
			realizado.Page = APage
			realizado.ParentPage = APage.ParentPage
			realizado.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("realizado", realizado)
			realizado.DateFilter = ""
			realizado.SqlSelect = ""
			realizado.SqlOrderBy = ""

			' fechaRealizado
			fechaRealizado = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_fechaRealizado", "fechaRealizado", "[fechaRealizado]", 135, EWRPT_DATATYPE_DATE, 7)
			fechaRealizado.Page = APage
			fechaRealizado.ParentPage = APage.ParentPage
			fechaRealizado.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("fechaRealizado", fechaRealizado)
			fechaRealizado.DateFilter = ""
			fechaRealizado.SqlSelect = ""
			fechaRealizado.SqlOrderBy = ""

			' observacion
			observacion = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_observacion", "observacion", "[observacion]", 200, EWRPT_DATATYPE_STRING, -1)
			observacion.Page = APage
			observacion.ParentPage = APage.ParentPage
			Fields.Add("observacion", observacion)
			observacion.DateFilter = ""
			observacion.SqlSelect = ""
			observacion.SqlOrderBy = ""

			' p1
			p1 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p1", "p1", "[p1]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p1.Page = APage
			p1.ParentPage = APage.ParentPage
			p1.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p1", p1)
			p1.DateFilter = ""
			p1.SqlSelect = ""
			p1.SqlOrderBy = ""

			' p2
			p2 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p2", "p2", "[p2]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p2.Page = APage
			p2.ParentPage = APage.ParentPage
			p2.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p2", p2)
			p2.DateFilter = ""
			p2.SqlSelect = ""
			p2.SqlOrderBy = ""

			' p3
			p3 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p3", "p3", "[p3]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p3.Page = APage
			p3.ParentPage = APage.ParentPage
			p3.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p3", p3)
			p3.DateFilter = ""
			p3.SqlSelect = ""
			p3.SqlOrderBy = ""

			' p4
			p4 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p4", "p4", "[p4]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p4.Page = APage
			p4.ParentPage = APage.ParentPage
			p4.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p4", p4)
			p4.DateFilter = ""
			p4.SqlSelect = ""
			p4.SqlOrderBy = ""

			' p5
			p5 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p5", "p5", "[p5]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p5.Page = APage
			p5.ParentPage = APage.ParentPage
			p5.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p5", p5)
			p5.DateFilter = ""
			p5.SqlSelect = ""
			p5.SqlOrderBy = ""

			' p6
			p6 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p6", "p6", "[p6]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p6.Page = APage
			p6.ParentPage = APage.ParentPage
			p6.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p6", p6)
			p6.DateFilter = ""
			p6.SqlSelect = ""
			p6.SqlOrderBy = ""

			' p7
			p7 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p7", "p7", "[p7]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p7.Page = APage
			p7.ParentPage = APage.ParentPage
			p7.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p7", p7)
			p7.DateFilter = ""
			p7.SqlSelect = ""
			p7.SqlOrderBy = ""

			' P8
			P8 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_P8", "P8", "[P8]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P8.Page = APage
			P8.ParentPage = APage.ParentPage
			P8.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P8", P8)
			P8.DateFilter = ""
			P8.SqlSelect = ""
			P8.SqlOrderBy = ""

			' P9
			P9 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_P9", "P9", "[P9]", 3, EWRPT_DATATYPE_NUMBER, -1)
			P9.Page = APage
			P9.ParentPage = APage.ParentPage
			P9.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("P9", P9)
			P9.DateFilter = ""
			P9.SqlSelect = ""
			P9.SqlOrderBy = ""

			' p10
			p10 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p10", "p10", "[p10]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p10.Page = APage
			p10.ParentPage = APage.ParentPage
			p10.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p10", p10)
			p10.DateFilter = ""
			p10.SqlSelect = ""
			p10.SqlOrderBy = ""

			' p11
			p11 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p11", "p11", "[p11]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p11.Page = APage
			p11.ParentPage = APage.ParentPage
			p11.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p11", p11)
			p11.DateFilter = ""
			p11.SqlSelect = ""
			p11.SqlOrderBy = ""

			' p12
			p12 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p12", "p12", "[p12]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p12.Page = APage
			p12.ParentPage = APage.ParentPage
			p12.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p12", p12)
			p12.DateFilter = ""
			p12.SqlSelect = ""
			p12.SqlOrderBy = ""

			' p13
			p13 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p13", "p13", "[p13]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p13.Page = APage
			p13.ParentPage = APage.ParentPage
			p13.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p13", p13)
			p13.DateFilter = ""
			p13.SqlSelect = ""
			p13.SqlOrderBy = ""

			' p14
			p14 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p14", "p14", "[p14]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p14.Page = APage
			p14.ParentPage = APage.ParentPage
			p14.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p14", p14)
			p14.DateFilter = ""
			p14.SqlSelect = ""
			p14.SqlOrderBy = ""

			' p15
			p15 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p15", "p15", "[p15]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p15.Page = APage
			p15.ParentPage = APage.ParentPage
			p15.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p15", p15)
			p15.DateFilter = ""
			p15.SqlSelect = ""
			p15.SqlOrderBy = ""

			' p16
			p16 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p16", "p16", "[p16]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p16.Page = APage
			p16.ParentPage = APage.ParentPage
			p16.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p16", p16)
			p16.DateFilter = ""
			p16.SqlSelect = ""
			p16.SqlOrderBy = ""

			' p17
			p17 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p17", "p17", "[p17]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p17.Page = APage
			p17.ParentPage = APage.ParentPage
			p17.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p17", p17)
			p17.DateFilter = ""
			p17.SqlSelect = ""
			p17.SqlOrderBy = ""

			' p18
			p18 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p18", "p18", "[p18]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p18.Page = APage
			p18.ParentPage = APage.ParentPage
			p18.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p18", p18)
			p18.DateFilter = ""
			p18.SqlSelect = ""
			p18.SqlOrderBy = ""

			' p19
			p19 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p19", "p19", "[p19]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p19.Page = APage
			p19.ParentPage = APage.ParentPage
			p19.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p19", p19)
			p19.DateFilter = ""
			p19.SqlSelect = ""
			p19.SqlOrderBy = ""

			' p20
			p20 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p20", "p20", "[p20]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p20.Page = APage
			p20.ParentPage = APage.ParentPage
			p20.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p20", p20)
			p20.DateFilter = ""
			p20.SqlSelect = ""
			p20.SqlOrderBy = ""

			' p21
			p21 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p21", "p21", "[p21]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p21.Page = APage
			p21.ParentPage = APage.ParentPage
			p21.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p21", p21)
			p21.DateFilter = ""
			p21.SqlSelect = ""
			p21.SqlOrderBy = ""

			' p22
			p22 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p22", "p22", "[p22]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p22.Page = APage
			p22.ParentPage = APage.ParentPage
			p22.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p22", p22)
			p22.DateFilter = ""
			p22.SqlSelect = ""
			p22.SqlOrderBy = ""

			' p23
			p23 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p23", "p23", "[p23]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p23.Page = APage
			p23.ParentPage = APage.ParentPage
			p23.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p23", p23)
			p23.DateFilter = ""
			p23.SqlSelect = ""
			p23.SqlOrderBy = ""

			' p24
			p24 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p24", "p24", "[p24]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p24.Page = APage
			p24.ParentPage = APage.ParentPage
			p24.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p24", p24)
			p24.DateFilter = ""
			p24.SqlSelect = ""
			p24.SqlOrderBy = ""

			' p25
			p25 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p25", "p25", "[p25]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p25.Page = APage
			p25.ParentPage = APage.ParentPage
			p25.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p25", p25)
			p25.DateFilter = ""
			p25.SqlSelect = ""
			p25.SqlOrderBy = ""

			' p26
			p26 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p26", "p26", "[p26]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p26.Page = APage
			p26.ParentPage = APage.ParentPage
			p26.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p26", p26)
			p26.DateFilter = ""
			p26.SqlSelect = ""
			p26.SqlOrderBy = ""

			' p27
			p27 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p27", "p27", "[p27]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p27.Page = APage
			p27.ParentPage = APage.ParentPage
			p27.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p27", p27)
			p27.DateFilter = ""
			p27.SqlSelect = ""
			p27.SqlOrderBy = ""

			' p28
			p28 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p28", "p28", "[p28]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p28.Page = APage
			p28.ParentPage = APage.ParentPage
			p28.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p28", p28)
			p28.DateFilter = ""
			p28.SqlSelect = ""
			p28.SqlOrderBy = ""

			' p29
			p29 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p29", "p29", "[p29]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p29.Page = APage
			p29.ParentPage = APage.ParentPage
			p29.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p29", p29)
			p29.DateFilter = ""
			p29.SqlSelect = ""
			p29.SqlOrderBy = ""

			' p30
			p30 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p30", "p30", "[p30]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p30.Page = APage
			p30.ParentPage = APage.ParentPage
			p30.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p30", p30)
			p30.DateFilter = ""
			p30.SqlSelect = ""
			p30.SqlOrderBy = ""

			' p31
			p31 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p31", "p31", "[p31]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p31.Page = APage
			p31.ParentPage = APage.ParentPage
			p31.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p31", p31)
			p31.DateFilter = ""
			p31.SqlSelect = ""
			p31.SqlOrderBy = ""

			' p32
			p32 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p32", "p32", "[p32]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p32.Page = APage
			p32.ParentPage = APage.ParentPage
			p32.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p32", p32)
			p32.DateFilter = ""
			p32.SqlSelect = ""
			p32.SqlOrderBy = ""

			' p33
			p33 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p33", "p33", "[p33]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p33.Page = APage
			p33.ParentPage = APage.ParentPage
			p33.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p33", p33)
			p33.DateFilter = ""
			p33.SqlSelect = ""
			p33.SqlOrderBy = ""

			' p34
			p34 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p34", "p34", "[p34]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p34.Page = APage
			p34.ParentPage = APage.ParentPage
			p34.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p34", p34)
			p34.DateFilter = ""
			p34.SqlSelect = ""
			p34.SqlOrderBy = ""

			' p35
			p35 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p35", "p35", "[p35]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p35.Page = APage
			p35.ParentPage = APage.ParentPage
			p35.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p35", p35)
			p35.DateFilter = ""
			p35.SqlSelect = ""
			p35.SqlOrderBy = ""

			' p36
			p36 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p36", "p36", "[p36]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p36.Page = APage
			p36.ParentPage = APage.ParentPage
			p36.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p36", p36)
			p36.DateFilter = ""
			p36.SqlSelect = ""
			p36.SqlOrderBy = ""

			' p37
			p37 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p37", "p37", "[p37]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p37.Page = APage
			p37.ParentPage = APage.ParentPage
			p37.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p37", p37)
			p37.DateFilter = ""
			p37.SqlSelect = ""
			p37.SqlOrderBy = ""

			' p38
			p38 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p38", "p38", "[p38]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p38.Page = APage
			p38.ParentPage = APage.ParentPage
			p38.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p38", p38)
			p38.DateFilter = ""
			p38.SqlSelect = ""
			p38.SqlOrderBy = ""

			' p39
			p39 = new crField("Sondeo_Alumnos", "Sondeo Alumnos", "x_p39", "p39", "[p39]", 3, EWRPT_DATATYPE_NUMBER, -1)
			p39.Page = APage
			p39.ParentPage = APage.ParentPage
			p39.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("p39", p39)
			p39.DateFilter = ""
			p39.SqlSelect = ""
			p39.SqlOrderBy = ""
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
				Return "[SEK_V_SondeoAlumnos]"
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
	Public Sondeo_Alumnos_summary As crSondeo_Alumnos_summary

	'
	' Page class
	'
	Public Class crSondeo_Alumnos_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Sondeo_Alumnos.UseTokenInUrl) Then
				sUrl &= "t=" & Sondeo_Alumnos.TableVar & "&" ' Add page token
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
			If (Sondeo_Alumnos.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Sondeo_Alumnos.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Sondeo_Alumnos.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Sondeo_Alumnossmry 
			Get
				Return CType(m_ParentPage, Sondeo_Alumnossmry)
			End Get
		End Property

		' Table object (Sondeo_Alumnos)
		Public Property Sondeo_Alumnos As crSondeo_Alumnos 
			Get		
				Return AspNetPage.Sondeo_Alumnos ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crSondeo_Alumnos)
				AspNetPage.Sondeo_Alumnos = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_SondeoAlumnos)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Sondeo_Alumnos_summary"
			m_PageObjTypeName = "crSondeo_Alumnos_summary"

			' Table name
			m_TableName = "Sondeo Alumnos"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Sondeo_Alumnos)
			Sondeo_Alumnos = New crSondeo_Alumnos(Me)			

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
				Sondeo_Alumnos.Export = ew_Get("export")
			End If
			gsExport = Sondeo_Alumnos.Export ' Get export parameter, used in header
			gsExportFile = Sondeo_Alumnos.TableVar ' Get export file, used in header
			If (Sondeo_Alumnos.Export = "excel") Then
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

		Public Val As Object() = New Object(49) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(49) {}

		Public GrandMn As Object() = New Object(49) {}

		Public GrandMx As Object() = New Object(49) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 50 ' No. of fields
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
			Sondeo_Alumnos.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Sondeo_Alumnos.SqlSelect, Sondeo_Alumnos.SqlWhere, Sondeo_Alumnos.SqlGroupBy, Sondeo_Alumnos.SqlHaving, Sondeo_Alumnos.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Sondeo_Alumnos.ExportAll AndAlso ew_NotEmpty(Sondeo_Alumnos.Export)) Then
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
				Sondeo_Alumnos.NOMBRE.DbValue = Row("NOMBRE")
				Sondeo_Alumnos.PATERNO.DbValue = Row("PATERNO")
				Sondeo_Alumnos.MATERNO.DbValue = Row("MATERNO")
				Sondeo_Alumnos.observacion.DbValue = Row("observacion")
				Sondeo_Alumnos.realizado.DbValue = Row("realizado")
				Sondeo_Alumnos.rut.DbValue = Row("rut")
				Sondeo_Alumnos.carrera.DbValue = Row("carrera")
				Sondeo_Alumnos.ano.DbValue = Row("ano")
				Sondeo_Alumnos.periodo.DbValue = Row("periodo")
				Sondeo_Alumnos.fechaRealizado.DbValue = Row("fechaRealizado")
				Sondeo_Alumnos.p1.DbValue = Row("p1")
				Sondeo_Alumnos.p2.DbValue = Row("p2")
				Sondeo_Alumnos.p3.DbValue = Row("p3")
				Sondeo_Alumnos.p4.DbValue = Row("p4")
				Sondeo_Alumnos.p5.DbValue = Row("p5")
				Sondeo_Alumnos.p6.DbValue = Row("p6")
				Sondeo_Alumnos.p7.DbValue = Row("p7")
				Sondeo_Alumnos.P8.DbValue = Row("P8")
				Sondeo_Alumnos.P9.DbValue = Row("P9")
				Sondeo_Alumnos.p10.DbValue = Row("p10")
				Sondeo_Alumnos.p11.DbValue = Row("p11")
				Sondeo_Alumnos.p12.DbValue = Row("p12")
				Sondeo_Alumnos.p13.DbValue = Row("p13")
				Sondeo_Alumnos.p14.DbValue = Row("p14")
				Sondeo_Alumnos.p15.DbValue = Row("p15")
				Sondeo_Alumnos.p16.DbValue = Row("p16")
				Sondeo_Alumnos.p17.DbValue = Row("p17")
				Sondeo_Alumnos.p18.DbValue = Row("p18")
				Sondeo_Alumnos.p19.DbValue = Row("p19")
				Sondeo_Alumnos.p20.DbValue = Row("p20")
				Sondeo_Alumnos.p21.DbValue = Row("p21")
				Sondeo_Alumnos.p22.DbValue = Row("p22")
				Sondeo_Alumnos.p23.DbValue = Row("p23")
				Sondeo_Alumnos.p24.DbValue = Row("p24")
				Sondeo_Alumnos.p25.DbValue = Row("p25")
				Sondeo_Alumnos.p26.DbValue = Row("p26")
				Sondeo_Alumnos.p27.DbValue = Row("p27")
				Sondeo_Alumnos.p28.DbValue = Row("p28")
				Sondeo_Alumnos.p29.DbValue = Row("p29")
				Sondeo_Alumnos.p30.DbValue = Row("p30")
				Sondeo_Alumnos.p31.DbValue = Row("p31")
				Sondeo_Alumnos.p32.DbValue = Row("p32")
				Sondeo_Alumnos.p33.DbValue = Row("p33")
				Sondeo_Alumnos.p34.DbValue = Row("p34")
				Sondeo_Alumnos.p35.DbValue = Row("p35")
				Sondeo_Alumnos.p36.DbValue = Row("p36")
				Sondeo_Alumnos.p37.DbValue = Row("p37")
				Sondeo_Alumnos.p38.DbValue = Row("p38")
				Sondeo_Alumnos.p39.DbValue = Row("p39")
				Val(1) = Sondeo_Alumnos.rut.CurrentValue
				Val(2) = Sondeo_Alumnos.NOMBRE.CurrentValue
				Val(3) = Sondeo_Alumnos.PATERNO.CurrentValue
				Val(4) = Sondeo_Alumnos.MATERNO.CurrentValue
				Val(5) = Sondeo_Alumnos.carrera.CurrentValue
				Val(6) = Sondeo_Alumnos.ano.CurrentValue
				Val(7) = Sondeo_Alumnos.periodo.CurrentValue
				Val(8) = Sondeo_Alumnos.realizado.CurrentValue
				Val(9) = Sondeo_Alumnos.fechaRealizado.CurrentValue
				Val(10) = Sondeo_Alumnos.observacion.CurrentValue
				Val(11) = Sondeo_Alumnos.p1.CurrentValue
				Val(12) = Sondeo_Alumnos.p2.CurrentValue
				Val(13) = Sondeo_Alumnos.p3.CurrentValue
				Val(14) = Sondeo_Alumnos.p4.CurrentValue
				Val(15) = Sondeo_Alumnos.p5.CurrentValue
				Val(16) = Sondeo_Alumnos.p6.CurrentValue
				Val(17) = Sondeo_Alumnos.p7.CurrentValue
				Val(18) = Sondeo_Alumnos.P8.CurrentValue
				Val(19) = Sondeo_Alumnos.P9.CurrentValue
				Val(20) = Sondeo_Alumnos.p10.CurrentValue
				Val(21) = Sondeo_Alumnos.p11.CurrentValue
				Val(22) = Sondeo_Alumnos.p12.CurrentValue
				Val(23) = Sondeo_Alumnos.p13.CurrentValue
				Val(24) = Sondeo_Alumnos.p14.CurrentValue
				Val(25) = Sondeo_Alumnos.p15.CurrentValue
				Val(26) = Sondeo_Alumnos.p16.CurrentValue
				Val(27) = Sondeo_Alumnos.p17.CurrentValue
				Val(28) = Sondeo_Alumnos.p18.CurrentValue
				Val(29) = Sondeo_Alumnos.p19.CurrentValue
				Val(30) = Sondeo_Alumnos.p20.CurrentValue
				Val(31) = Sondeo_Alumnos.p21.CurrentValue
				Val(32) = Sondeo_Alumnos.p22.CurrentValue
				Val(33) = Sondeo_Alumnos.p23.CurrentValue
				Val(34) = Sondeo_Alumnos.p24.CurrentValue
				Val(35) = Sondeo_Alumnos.p25.CurrentValue
				Val(36) = Sondeo_Alumnos.p26.CurrentValue
				Val(37) = Sondeo_Alumnos.p27.CurrentValue
				Val(38) = Sondeo_Alumnos.p28.CurrentValue
				Val(39) = Sondeo_Alumnos.p29.CurrentValue
				Val(40) = Sondeo_Alumnos.p30.CurrentValue
				Val(41) = Sondeo_Alumnos.p31.CurrentValue
				Val(42) = Sondeo_Alumnos.p32.CurrentValue
				Val(43) = Sondeo_Alumnos.p33.CurrentValue
				Val(44) = Sondeo_Alumnos.p34.CurrentValue
				Val(45) = Sondeo_Alumnos.p35.CurrentValue
				Val(46) = Sondeo_Alumnos.p36.CurrentValue
				Val(47) = Sondeo_Alumnos.p37.CurrentValue
				Val(48) = Sondeo_Alumnos.p38.CurrentValue
				Val(49) = Sondeo_Alumnos.p39.CurrentValue
			Else
				Sondeo_Alumnos.NOMBRE.DbValue = ""
				Sondeo_Alumnos.PATERNO.DbValue = ""
				Sondeo_Alumnos.MATERNO.DbValue = ""
				Sondeo_Alumnos.observacion.DbValue = ""
				Sondeo_Alumnos.realizado.DbValue = ""
				Sondeo_Alumnos.rut.DbValue = ""
				Sondeo_Alumnos.carrera.DbValue = ""
				Sondeo_Alumnos.ano.DbValue = ""
				Sondeo_Alumnos.periodo.DbValue = ""
				Sondeo_Alumnos.fechaRealizado.DbValue = ""
				Sondeo_Alumnos.p1.DbValue = ""
				Sondeo_Alumnos.p2.DbValue = ""
				Sondeo_Alumnos.p3.DbValue = ""
				Sondeo_Alumnos.p4.DbValue = ""
				Sondeo_Alumnos.p5.DbValue = ""
				Sondeo_Alumnos.p6.DbValue = ""
				Sondeo_Alumnos.p7.DbValue = ""
				Sondeo_Alumnos.P8.DbValue = ""
				Sondeo_Alumnos.P9.DbValue = ""
				Sondeo_Alumnos.p10.DbValue = ""
				Sondeo_Alumnos.p11.DbValue = ""
				Sondeo_Alumnos.p12.DbValue = ""
				Sondeo_Alumnos.p13.DbValue = ""
				Sondeo_Alumnos.p14.DbValue = ""
				Sondeo_Alumnos.p15.DbValue = ""
				Sondeo_Alumnos.p16.DbValue = ""
				Sondeo_Alumnos.p17.DbValue = ""
				Sondeo_Alumnos.p18.DbValue = ""
				Sondeo_Alumnos.p19.DbValue = ""
				Sondeo_Alumnos.p20.DbValue = ""
				Sondeo_Alumnos.p21.DbValue = ""
				Sondeo_Alumnos.p22.DbValue = ""
				Sondeo_Alumnos.p23.DbValue = ""
				Sondeo_Alumnos.p24.DbValue = ""
				Sondeo_Alumnos.p25.DbValue = ""
				Sondeo_Alumnos.p26.DbValue = ""
				Sondeo_Alumnos.p27.DbValue = ""
				Sondeo_Alumnos.p28.DbValue = ""
				Sondeo_Alumnos.p29.DbValue = ""
				Sondeo_Alumnos.p30.DbValue = ""
				Sondeo_Alumnos.p31.DbValue = ""
				Sondeo_Alumnos.p32.DbValue = ""
				Sondeo_Alumnos.p33.DbValue = ""
				Sondeo_Alumnos.p34.DbValue = ""
				Sondeo_Alumnos.p35.DbValue = ""
				Sondeo_Alumnos.p36.DbValue = ""
				Sondeo_Alumnos.p37.DbValue = ""
				Sondeo_Alumnos.p38.DbValue = ""
				Sondeo_Alumnos.p39.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Sondeo_Alumnos.NOMBRE.DbValue = dr("NOMBRE")
				Sondeo_Alumnos.PATERNO.DbValue = dr("PATERNO")
				Sondeo_Alumnos.MATERNO.DbValue = dr("MATERNO")
				Sondeo_Alumnos.observacion.DbValue = dr("observacion")
				Sondeo_Alumnos.realizado.DbValue = dr("realizado")
				Sondeo_Alumnos.rut.DbValue = dr("rut")
				Sondeo_Alumnos.carrera.DbValue = dr("carrera")
				Sondeo_Alumnos.ano.DbValue = dr("ano")
				Sondeo_Alumnos.periodo.DbValue = dr("periodo")
				Sondeo_Alumnos.fechaRealizado.DbValue = dr("fechaRealizado")
				Sondeo_Alumnos.p1.DbValue = dr("p1")
				Sondeo_Alumnos.p2.DbValue = dr("p2")
				Sondeo_Alumnos.p3.DbValue = dr("p3")
				Sondeo_Alumnos.p4.DbValue = dr("p4")
				Sondeo_Alumnos.p5.DbValue = dr("p5")
				Sondeo_Alumnos.p6.DbValue = dr("p6")
				Sondeo_Alumnos.p7.DbValue = dr("p7")
				Sondeo_Alumnos.P8.DbValue = dr("P8")
				Sondeo_Alumnos.P9.DbValue = dr("P9")
				Sondeo_Alumnos.p10.DbValue = dr("p10")
				Sondeo_Alumnos.p11.DbValue = dr("p11")
				Sondeo_Alumnos.p12.DbValue = dr("p12")
				Sondeo_Alumnos.p13.DbValue = dr("p13")
				Sondeo_Alumnos.p14.DbValue = dr("p14")
				Sondeo_Alumnos.p15.DbValue = dr("p15")
				Sondeo_Alumnos.p16.DbValue = dr("p16")
				Sondeo_Alumnos.p17.DbValue = dr("p17")
				Sondeo_Alumnos.p18.DbValue = dr("p18")
				Sondeo_Alumnos.p19.DbValue = dr("p19")
				Sondeo_Alumnos.p20.DbValue = dr("p20")
				Sondeo_Alumnos.p21.DbValue = dr("p21")
				Sondeo_Alumnos.p22.DbValue = dr("p22")
				Sondeo_Alumnos.p23.DbValue = dr("p23")
				Sondeo_Alumnos.p24.DbValue = dr("p24")
				Sondeo_Alumnos.p25.DbValue = dr("p25")
				Sondeo_Alumnos.p26.DbValue = dr("p26")
				Sondeo_Alumnos.p27.DbValue = dr("p27")
				Sondeo_Alumnos.p28.DbValue = dr("p28")
				Sondeo_Alumnos.p29.DbValue = dr("p29")
				Sondeo_Alumnos.p30.DbValue = dr("p30")
				Sondeo_Alumnos.p31.DbValue = dr("p31")
				Sondeo_Alumnos.p32.DbValue = dr("p32")
				Sondeo_Alumnos.p33.DbValue = dr("p33")
				Sondeo_Alumnos.p34.DbValue = dr("p34")
				Sondeo_Alumnos.p35.DbValue = dr("p35")
				Sondeo_Alumnos.p36.DbValue = dr("p36")
				Sondeo_Alumnos.p37.DbValue = dr("p37")
				Sondeo_Alumnos.p38.DbValue = dr("p38")
				Sondeo_Alumnos.p39.DbValue = dr("p39")
				Val(1) = Sondeo_Alumnos.rut.CurrentValue
				Val(2) = Sondeo_Alumnos.NOMBRE.CurrentValue
				Val(3) = Sondeo_Alumnos.PATERNO.CurrentValue
				Val(4) = Sondeo_Alumnos.MATERNO.CurrentValue
				Val(5) = Sondeo_Alumnos.carrera.CurrentValue
				Val(6) = Sondeo_Alumnos.ano.CurrentValue
				Val(7) = Sondeo_Alumnos.periodo.CurrentValue
				Val(8) = Sondeo_Alumnos.realizado.CurrentValue
				Val(9) = Sondeo_Alumnos.fechaRealizado.CurrentValue
				Val(10) = Sondeo_Alumnos.observacion.CurrentValue
				Val(11) = Sondeo_Alumnos.p1.CurrentValue
				Val(12) = Sondeo_Alumnos.p2.CurrentValue
				Val(13) = Sondeo_Alumnos.p3.CurrentValue
				Val(14) = Sondeo_Alumnos.p4.CurrentValue
				Val(15) = Sondeo_Alumnos.p5.CurrentValue
				Val(16) = Sondeo_Alumnos.p6.CurrentValue
				Val(17) = Sondeo_Alumnos.p7.CurrentValue
				Val(18) = Sondeo_Alumnos.P8.CurrentValue
				Val(19) = Sondeo_Alumnos.P9.CurrentValue
				Val(20) = Sondeo_Alumnos.p10.CurrentValue
				Val(21) = Sondeo_Alumnos.p11.CurrentValue
				Val(22) = Sondeo_Alumnos.p12.CurrentValue
				Val(23) = Sondeo_Alumnos.p13.CurrentValue
				Val(24) = Sondeo_Alumnos.p14.CurrentValue
				Val(25) = Sondeo_Alumnos.p15.CurrentValue
				Val(26) = Sondeo_Alumnos.p16.CurrentValue
				Val(27) = Sondeo_Alumnos.p17.CurrentValue
				Val(28) = Sondeo_Alumnos.p18.CurrentValue
				Val(29) = Sondeo_Alumnos.p19.CurrentValue
				Val(30) = Sondeo_Alumnos.p20.CurrentValue
				Val(31) = Sondeo_Alumnos.p21.CurrentValue
				Val(32) = Sondeo_Alumnos.p22.CurrentValue
				Val(33) = Sondeo_Alumnos.p23.CurrentValue
				Val(34) = Sondeo_Alumnos.p24.CurrentValue
				Val(35) = Sondeo_Alumnos.p25.CurrentValue
				Val(36) = Sondeo_Alumnos.p26.CurrentValue
				Val(37) = Sondeo_Alumnos.p27.CurrentValue
				Val(38) = Sondeo_Alumnos.p28.CurrentValue
				Val(39) = Sondeo_Alumnos.p29.CurrentValue
				Val(40) = Sondeo_Alumnos.p30.CurrentValue
				Val(41) = Sondeo_Alumnos.p31.CurrentValue
				Val(42) = Sondeo_Alumnos.p32.CurrentValue
				Val(43) = Sondeo_Alumnos.p33.CurrentValue
				Val(44) = Sondeo_Alumnos.p34.CurrentValue
				Val(45) = Sondeo_Alumnos.p35.CurrentValue
				Val(46) = Sondeo_Alumnos.p36.CurrentValue
				Val(47) = Sondeo_Alumnos.p37.CurrentValue
				Val(48) = Sondeo_Alumnos.p38.CurrentValue
				Val(49) = Sondeo_Alumnos.p39.CurrentValue
			Else				
				Sondeo_Alumnos.NOMBRE.DbValue = ""
				Sondeo_Alumnos.PATERNO.DbValue = ""
				Sondeo_Alumnos.MATERNO.DbValue = ""
				Sondeo_Alumnos.observacion.DbValue = ""
				Sondeo_Alumnos.realizado.DbValue = ""
				Sondeo_Alumnos.rut.DbValue = ""
				Sondeo_Alumnos.carrera.DbValue = ""
				Sondeo_Alumnos.ano.DbValue = ""
				Sondeo_Alumnos.periodo.DbValue = ""
				Sondeo_Alumnos.fechaRealizado.DbValue = ""
				Sondeo_Alumnos.p1.DbValue = ""
				Sondeo_Alumnos.p2.DbValue = ""
				Sondeo_Alumnos.p3.DbValue = ""
				Sondeo_Alumnos.p4.DbValue = ""
				Sondeo_Alumnos.p5.DbValue = ""
				Sondeo_Alumnos.p6.DbValue = ""
				Sondeo_Alumnos.p7.DbValue = ""
				Sondeo_Alumnos.P8.DbValue = ""
				Sondeo_Alumnos.P9.DbValue = ""
				Sondeo_Alumnos.p10.DbValue = ""
				Sondeo_Alumnos.p11.DbValue = ""
				Sondeo_Alumnos.p12.DbValue = ""
				Sondeo_Alumnos.p13.DbValue = ""
				Sondeo_Alumnos.p14.DbValue = ""
				Sondeo_Alumnos.p15.DbValue = ""
				Sondeo_Alumnos.p16.DbValue = ""
				Sondeo_Alumnos.p17.DbValue = ""
				Sondeo_Alumnos.p18.DbValue = ""
				Sondeo_Alumnos.p19.DbValue = ""
				Sondeo_Alumnos.p20.DbValue = ""
				Sondeo_Alumnos.p21.DbValue = ""
				Sondeo_Alumnos.p22.DbValue = ""
				Sondeo_Alumnos.p23.DbValue = ""
				Sondeo_Alumnos.p24.DbValue = ""
				Sondeo_Alumnos.p25.DbValue = ""
				Sondeo_Alumnos.p26.DbValue = ""
				Sondeo_Alumnos.p27.DbValue = ""
				Sondeo_Alumnos.p28.DbValue = ""
				Sondeo_Alumnos.p29.DbValue = ""
				Sondeo_Alumnos.p30.DbValue = ""
				Sondeo_Alumnos.p31.DbValue = ""
				Sondeo_Alumnos.p32.DbValue = ""
				Sondeo_Alumnos.p33.DbValue = ""
				Sondeo_Alumnos.p34.DbValue = ""
				Sondeo_Alumnos.p35.DbValue = ""
				Sondeo_Alumnos.p36.DbValue = ""
				Sondeo_Alumnos.p37.DbValue = ""
				Sondeo_Alumnos.p38.DbValue = ""
				Sondeo_Alumnos.p39.DbValue = ""
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
				Sondeo_Alumnos.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Sondeo_Alumnos.StartGroup = StartGrp
				Else
					StartGrp = Sondeo_Alumnos.StartGroup
				End If
			Else
				StartGrp = Sondeo_Alumnos.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Sondeo_Alumnos.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Sondeo_Alumnos.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Sondeo_Alumnos.StartGroup = StartGrp
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
			Sondeo_Alumnos.StartGroup = StartGrp
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
				Sondeo_Alumnos.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Sondeo_Alumnos.StartGroup = StartGrp
			Else				
				If (Sondeo_Alumnos.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Sondeo_Alumnos.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Sondeo_Alumnos.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Sondeo_Alumnos.SqlSelectCount, Sondeo_Alumnos.SqlWhere, Sondeo_Alumnos.SqlGroupBy, Sondeo_Alumnos.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Sondeo_Alumnos.Row_Rendering()

			'
			' Render view codes
			'

			If (Sondeo_Alumnos.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' rut
				Sondeo_Alumnos.rut.ViewValue = Convert.ToString(Sondeo_Alumnos.rut.Summary)

				' NOMBRE
				Sondeo_Alumnos.NOMBRE.ViewValue = Convert.ToString(Sondeo_Alumnos.NOMBRE.Summary)

				' PATERNO
				Sondeo_Alumnos.PATERNO.ViewValue = Convert.ToString(Sondeo_Alumnos.PATERNO.Summary)

				' MATERNO
				Sondeo_Alumnos.MATERNO.ViewValue = Convert.ToString(Sondeo_Alumnos.MATERNO.Summary)

				' carrera
				Sondeo_Alumnos.carrera.ViewValue = Convert.ToString(Sondeo_Alumnos.carrera.Summary)

				' ano
				Sondeo_Alumnos.ano.ViewValue = Convert.ToString(Sondeo_Alumnos.ano.Summary)

				' periodo
				Sondeo_Alumnos.periodo.ViewValue = Convert.ToString(Sondeo_Alumnos.periodo.Summary)

				' realizado
				Sondeo_Alumnos.realizado.ViewValue = Convert.ToString(Sondeo_Alumnos.realizado.Summary)

				' fechaRealizado
				Sondeo_Alumnos.fechaRealizado.ViewValue = Convert.ToString(Sondeo_Alumnos.fechaRealizado.Summary)
				Sondeo_Alumnos.fechaRealizado.ViewValue = ew_FormatDateTime(Sondeo_Alumnos.fechaRealizado.ViewValue, 7)

				' observacion
				Sondeo_Alumnos.observacion.ViewValue = Convert.ToString(Sondeo_Alumnos.observacion.Summary)

				' p1
				Sondeo_Alumnos.p1.ViewValue = Convert.ToString(Sondeo_Alumnos.p1.Summary)

				' p2
				Sondeo_Alumnos.p2.ViewValue = Convert.ToString(Sondeo_Alumnos.p2.Summary)

				' p3
				Sondeo_Alumnos.p3.ViewValue = Convert.ToString(Sondeo_Alumnos.p3.Summary)

				' p4
				Sondeo_Alumnos.p4.ViewValue = Convert.ToString(Sondeo_Alumnos.p4.Summary)

				' p5
				Sondeo_Alumnos.p5.ViewValue = Convert.ToString(Sondeo_Alumnos.p5.Summary)

				' p6
				Sondeo_Alumnos.p6.ViewValue = Convert.ToString(Sondeo_Alumnos.p6.Summary)

				' p7
				Sondeo_Alumnos.p7.ViewValue = Convert.ToString(Sondeo_Alumnos.p7.Summary)

				' P8
				Sondeo_Alumnos.P8.ViewValue = Convert.ToString(Sondeo_Alumnos.P8.Summary)

				' P9
				Sondeo_Alumnos.P9.ViewValue = Convert.ToString(Sondeo_Alumnos.P9.Summary)

				' p10
				Sondeo_Alumnos.p10.ViewValue = Convert.ToString(Sondeo_Alumnos.p10.Summary)

				' p11
				Sondeo_Alumnos.p11.ViewValue = Convert.ToString(Sondeo_Alumnos.p11.Summary)

				' p12
				Sondeo_Alumnos.p12.ViewValue = Convert.ToString(Sondeo_Alumnos.p12.Summary)

				' p13
				Sondeo_Alumnos.p13.ViewValue = Convert.ToString(Sondeo_Alumnos.p13.Summary)

				' p14
				Sondeo_Alumnos.p14.ViewValue = Convert.ToString(Sondeo_Alumnos.p14.Summary)

				' p15
				Sondeo_Alumnos.p15.ViewValue = Convert.ToString(Sondeo_Alumnos.p15.Summary)

				' p16
				Sondeo_Alumnos.p16.ViewValue = Convert.ToString(Sondeo_Alumnos.p16.Summary)

				' p17
				Sondeo_Alumnos.p17.ViewValue = Convert.ToString(Sondeo_Alumnos.p17.Summary)

				' p18
				Sondeo_Alumnos.p18.ViewValue = Convert.ToString(Sondeo_Alumnos.p18.Summary)

				' p19
				Sondeo_Alumnos.p19.ViewValue = Convert.ToString(Sondeo_Alumnos.p19.Summary)

				' p20
				Sondeo_Alumnos.p20.ViewValue = Convert.ToString(Sondeo_Alumnos.p20.Summary)

				' p21
				Sondeo_Alumnos.p21.ViewValue = Convert.ToString(Sondeo_Alumnos.p21.Summary)

				' p22
				Sondeo_Alumnos.p22.ViewValue = Convert.ToString(Sondeo_Alumnos.p22.Summary)

				' p23
				Sondeo_Alumnos.p23.ViewValue = Convert.ToString(Sondeo_Alumnos.p23.Summary)

				' p24
				Sondeo_Alumnos.p24.ViewValue = Convert.ToString(Sondeo_Alumnos.p24.Summary)

				' p25
				Sondeo_Alumnos.p25.ViewValue = Convert.ToString(Sondeo_Alumnos.p25.Summary)

				' p26
				Sondeo_Alumnos.p26.ViewValue = Convert.ToString(Sondeo_Alumnos.p26.Summary)

				' p27
				Sondeo_Alumnos.p27.ViewValue = Convert.ToString(Sondeo_Alumnos.p27.Summary)

				' p28
				Sondeo_Alumnos.p28.ViewValue = Convert.ToString(Sondeo_Alumnos.p28.Summary)

				' p29
				Sondeo_Alumnos.p29.ViewValue = Convert.ToString(Sondeo_Alumnos.p29.Summary)

				' p30
				Sondeo_Alumnos.p30.ViewValue = Convert.ToString(Sondeo_Alumnos.p30.Summary)

				' p31
				Sondeo_Alumnos.p31.ViewValue = Convert.ToString(Sondeo_Alumnos.p31.Summary)

				' p32
				Sondeo_Alumnos.p32.ViewValue = Convert.ToString(Sondeo_Alumnos.p32.Summary)

				' p33
				Sondeo_Alumnos.p33.ViewValue = Convert.ToString(Sondeo_Alumnos.p33.Summary)

				' p34
				Sondeo_Alumnos.p34.ViewValue = Convert.ToString(Sondeo_Alumnos.p34.Summary)

				' p35
				Sondeo_Alumnos.p35.ViewValue = Convert.ToString(Sondeo_Alumnos.p35.Summary)

				' p36
				Sondeo_Alumnos.p36.ViewValue = Convert.ToString(Sondeo_Alumnos.p36.Summary)

				' p37
				Sondeo_Alumnos.p37.ViewValue = Convert.ToString(Sondeo_Alumnos.p37.Summary)

				' p38
				Sondeo_Alumnos.p38.ViewValue = Convert.ToString(Sondeo_Alumnos.p38.Summary)

				' p39
				Sondeo_Alumnos.p39.ViewValue = Convert.ToString(Sondeo_Alumnos.p39.Summary)
			Else

				' rut
				Sondeo_Alumnos.rut.ViewValue = Convert.ToString(Sondeo_Alumnos.rut.CurrentValue)
				Sondeo_Alumnos.rut.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Sondeo_Alumnos.NOMBRE.ViewValue = Convert.ToString(Sondeo_Alumnos.NOMBRE.CurrentValue)
				Sondeo_Alumnos.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Sondeo_Alumnos.PATERNO.ViewValue = Convert.ToString(Sondeo_Alumnos.PATERNO.CurrentValue)
				Sondeo_Alumnos.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Sondeo_Alumnos.MATERNO.ViewValue = Convert.ToString(Sondeo_Alumnos.MATERNO.CurrentValue)
				Sondeo_Alumnos.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' carrera
				Sondeo_Alumnos.carrera.ViewValue = Convert.ToString(Sondeo_Alumnos.carrera.CurrentValue)
				Sondeo_Alumnos.carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ano
				Sondeo_Alumnos.ano.ViewValue = Convert.ToString(Sondeo_Alumnos.ano.CurrentValue)
				Sondeo_Alumnos.ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' periodo
				Sondeo_Alumnos.periodo.ViewValue = Convert.ToString(Sondeo_Alumnos.periodo.CurrentValue)
				Sondeo_Alumnos.periodo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' realizado
				Sondeo_Alumnos.realizado.ViewValue = Convert.ToString(Sondeo_Alumnos.realizado.CurrentValue)
				Sondeo_Alumnos.realizado.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' fechaRealizado
				Sondeo_Alumnos.fechaRealizado.ViewValue = Convert.ToString(Sondeo_Alumnos.fechaRealizado.CurrentValue)
				Sondeo_Alumnos.fechaRealizado.ViewValue = ew_FormatDateTime(Sondeo_Alumnos.fechaRealizado.ViewValue, 7)
				Sondeo_Alumnos.fechaRealizado.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' observacion
				Sondeo_Alumnos.observacion.ViewValue = Convert.ToString(Sondeo_Alumnos.observacion.CurrentValue)
				Sondeo_Alumnos.observacion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p1
				Sondeo_Alumnos.p1.ViewValue = Convert.ToString(Sondeo_Alumnos.p1.CurrentValue)
				Sondeo_Alumnos.p1.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p2
				Sondeo_Alumnos.p2.ViewValue = Convert.ToString(Sondeo_Alumnos.p2.CurrentValue)
				Sondeo_Alumnos.p2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p3
				Sondeo_Alumnos.p3.ViewValue = Convert.ToString(Sondeo_Alumnos.p3.CurrentValue)
				Sondeo_Alumnos.p3.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p4
				Sondeo_Alumnos.p4.ViewValue = Convert.ToString(Sondeo_Alumnos.p4.CurrentValue)
				Sondeo_Alumnos.p4.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p5
				Sondeo_Alumnos.p5.ViewValue = Convert.ToString(Sondeo_Alumnos.p5.CurrentValue)
				Sondeo_Alumnos.p5.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p6
				Sondeo_Alumnos.p6.ViewValue = Convert.ToString(Sondeo_Alumnos.p6.CurrentValue)
				Sondeo_Alumnos.p6.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p7
				Sondeo_Alumnos.p7.ViewValue = Convert.ToString(Sondeo_Alumnos.p7.CurrentValue)
				Sondeo_Alumnos.p7.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P8
				Sondeo_Alumnos.P8.ViewValue = Convert.ToString(Sondeo_Alumnos.P8.CurrentValue)
				Sondeo_Alumnos.P8.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' P9
				Sondeo_Alumnos.P9.ViewValue = Convert.ToString(Sondeo_Alumnos.P9.CurrentValue)
				Sondeo_Alumnos.P9.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p10
				Sondeo_Alumnos.p10.ViewValue = Convert.ToString(Sondeo_Alumnos.p10.CurrentValue)
				Sondeo_Alumnos.p10.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p11
				Sondeo_Alumnos.p11.ViewValue = Convert.ToString(Sondeo_Alumnos.p11.CurrentValue)
				Sondeo_Alumnos.p11.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p12
				Sondeo_Alumnos.p12.ViewValue = Convert.ToString(Sondeo_Alumnos.p12.CurrentValue)
				Sondeo_Alumnos.p12.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p13
				Sondeo_Alumnos.p13.ViewValue = Convert.ToString(Sondeo_Alumnos.p13.CurrentValue)
				Sondeo_Alumnos.p13.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p14
				Sondeo_Alumnos.p14.ViewValue = Convert.ToString(Sondeo_Alumnos.p14.CurrentValue)
				Sondeo_Alumnos.p14.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p15
				Sondeo_Alumnos.p15.ViewValue = Convert.ToString(Sondeo_Alumnos.p15.CurrentValue)
				Sondeo_Alumnos.p15.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p16
				Sondeo_Alumnos.p16.ViewValue = Convert.ToString(Sondeo_Alumnos.p16.CurrentValue)
				Sondeo_Alumnos.p16.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p17
				Sondeo_Alumnos.p17.ViewValue = Convert.ToString(Sondeo_Alumnos.p17.CurrentValue)
				Sondeo_Alumnos.p17.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p18
				Sondeo_Alumnos.p18.ViewValue = Convert.ToString(Sondeo_Alumnos.p18.CurrentValue)
				Sondeo_Alumnos.p18.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p19
				Sondeo_Alumnos.p19.ViewValue = Convert.ToString(Sondeo_Alumnos.p19.CurrentValue)
				Sondeo_Alumnos.p19.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p20
				Sondeo_Alumnos.p20.ViewValue = Convert.ToString(Sondeo_Alumnos.p20.CurrentValue)
				Sondeo_Alumnos.p20.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p21
				Sondeo_Alumnos.p21.ViewValue = Convert.ToString(Sondeo_Alumnos.p21.CurrentValue)
				Sondeo_Alumnos.p21.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p22
				Sondeo_Alumnos.p22.ViewValue = Convert.ToString(Sondeo_Alumnos.p22.CurrentValue)
				Sondeo_Alumnos.p22.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p23
				Sondeo_Alumnos.p23.ViewValue = Convert.ToString(Sondeo_Alumnos.p23.CurrentValue)
				Sondeo_Alumnos.p23.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p24
				Sondeo_Alumnos.p24.ViewValue = Convert.ToString(Sondeo_Alumnos.p24.CurrentValue)
				Sondeo_Alumnos.p24.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p25
				Sondeo_Alumnos.p25.ViewValue = Convert.ToString(Sondeo_Alumnos.p25.CurrentValue)
				Sondeo_Alumnos.p25.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p26
				Sondeo_Alumnos.p26.ViewValue = Convert.ToString(Sondeo_Alumnos.p26.CurrentValue)
				Sondeo_Alumnos.p26.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p27
				Sondeo_Alumnos.p27.ViewValue = Convert.ToString(Sondeo_Alumnos.p27.CurrentValue)
				Sondeo_Alumnos.p27.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p28
				Sondeo_Alumnos.p28.ViewValue = Convert.ToString(Sondeo_Alumnos.p28.CurrentValue)
				Sondeo_Alumnos.p28.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p29
				Sondeo_Alumnos.p29.ViewValue = Convert.ToString(Sondeo_Alumnos.p29.CurrentValue)
				Sondeo_Alumnos.p29.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p30
				Sondeo_Alumnos.p30.ViewValue = Convert.ToString(Sondeo_Alumnos.p30.CurrentValue)
				Sondeo_Alumnos.p30.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p31
				Sondeo_Alumnos.p31.ViewValue = Convert.ToString(Sondeo_Alumnos.p31.CurrentValue)
				Sondeo_Alumnos.p31.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p32
				Sondeo_Alumnos.p32.ViewValue = Convert.ToString(Sondeo_Alumnos.p32.CurrentValue)
				Sondeo_Alumnos.p32.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p33
				Sondeo_Alumnos.p33.ViewValue = Convert.ToString(Sondeo_Alumnos.p33.CurrentValue)
				Sondeo_Alumnos.p33.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p34
				Sondeo_Alumnos.p34.ViewValue = Convert.ToString(Sondeo_Alumnos.p34.CurrentValue)
				Sondeo_Alumnos.p34.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p35
				Sondeo_Alumnos.p35.ViewValue = Convert.ToString(Sondeo_Alumnos.p35.CurrentValue)
				Sondeo_Alumnos.p35.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p36
				Sondeo_Alumnos.p36.ViewValue = Convert.ToString(Sondeo_Alumnos.p36.CurrentValue)
				Sondeo_Alumnos.p36.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p37
				Sondeo_Alumnos.p37.ViewValue = Convert.ToString(Sondeo_Alumnos.p37.CurrentValue)
				Sondeo_Alumnos.p37.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p38
				Sondeo_Alumnos.p38.ViewValue = Convert.ToString(Sondeo_Alumnos.p38.CurrentValue)
				Sondeo_Alumnos.p38.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' p39
				Sondeo_Alumnos.p39.ViewValue = Convert.ToString(Sondeo_Alumnos.p39.CurrentValue)
				Sondeo_Alumnos.p39.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' rut
			Sondeo_Alumnos.rut.HrefValue = ""

			' NOMBRE
			Sondeo_Alumnos.NOMBRE.HrefValue = ""

			' PATERNO
			Sondeo_Alumnos.PATERNO.HrefValue = ""

			' MATERNO
			Sondeo_Alumnos.MATERNO.HrefValue = ""

			' carrera
			Sondeo_Alumnos.carrera.HrefValue = ""

			' ano
			Sondeo_Alumnos.ano.HrefValue = ""

			' periodo
			Sondeo_Alumnos.periodo.HrefValue = ""

			' realizado
			Sondeo_Alumnos.realizado.HrefValue = ""

			' fechaRealizado
			Sondeo_Alumnos.fechaRealizado.HrefValue = ""

			' observacion
			Sondeo_Alumnos.observacion.HrefValue = ""

			' p1
			Sondeo_Alumnos.p1.HrefValue = ""

			' p2
			Sondeo_Alumnos.p2.HrefValue = ""

			' p3
			Sondeo_Alumnos.p3.HrefValue = ""

			' p4
			Sondeo_Alumnos.p4.HrefValue = ""

			' p5
			Sondeo_Alumnos.p5.HrefValue = ""

			' p6
			Sondeo_Alumnos.p6.HrefValue = ""

			' p7
			Sondeo_Alumnos.p7.HrefValue = ""

			' P8
			Sondeo_Alumnos.P8.HrefValue = ""

			' P9
			Sondeo_Alumnos.P9.HrefValue = ""

			' p10
			Sondeo_Alumnos.p10.HrefValue = ""

			' p11
			Sondeo_Alumnos.p11.HrefValue = ""

			' p12
			Sondeo_Alumnos.p12.HrefValue = ""

			' p13
			Sondeo_Alumnos.p13.HrefValue = ""

			' p14
			Sondeo_Alumnos.p14.HrefValue = ""

			' p15
			Sondeo_Alumnos.p15.HrefValue = ""

			' p16
			Sondeo_Alumnos.p16.HrefValue = ""

			' p17
			Sondeo_Alumnos.p17.HrefValue = ""

			' p18
			Sondeo_Alumnos.p18.HrefValue = ""

			' p19
			Sondeo_Alumnos.p19.HrefValue = ""

			' p20
			Sondeo_Alumnos.p20.HrefValue = ""

			' p21
			Sondeo_Alumnos.p21.HrefValue = ""

			' p22
			Sondeo_Alumnos.p22.HrefValue = ""

			' p23
			Sondeo_Alumnos.p23.HrefValue = ""

			' p24
			Sondeo_Alumnos.p24.HrefValue = ""

			' p25
			Sondeo_Alumnos.p25.HrefValue = ""

			' p26
			Sondeo_Alumnos.p26.HrefValue = ""

			' p27
			Sondeo_Alumnos.p27.HrefValue = ""

			' p28
			Sondeo_Alumnos.p28.HrefValue = ""

			' p29
			Sondeo_Alumnos.p29.HrefValue = ""

			' p30
			Sondeo_Alumnos.p30.HrefValue = ""

			' p31
			Sondeo_Alumnos.p31.HrefValue = ""

			' p32
			Sondeo_Alumnos.p32.HrefValue = ""

			' p33
			Sondeo_Alumnos.p33.HrefValue = ""

			' p34
			Sondeo_Alumnos.p34.HrefValue = ""

			' p35
			Sondeo_Alumnos.p35.HrefValue = ""

			' p36
			Sondeo_Alumnos.p36.HrefValue = ""

			' p37
			Sondeo_Alumnos.p37.HrefValue = ""

			' p38
			Sondeo_Alumnos.p38.HrefValue = ""

			' p39
			Sondeo_Alumnos.p39.HrefValue = ""

			' Call Row_Rendered event
			Sondeo_Alumnos.Row_Rendered()
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

			' Field carrera
			sSelect = "SELECT DISTINCT [carrera] FROM " + Sondeo_Alumnos.SqlFrom
			sOrderBy = "[carrera] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Sondeo_Alumnos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Sondeo_Alumnos.carrera.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ano
			sSelect = "SELECT DISTINCT [ano] FROM " + Sondeo_Alumnos.SqlFrom
			sOrderBy = "[ano] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Sondeo_Alumnos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Sondeo_Alumnos.ano.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field periodo
			sSelect = "SELECT DISTINCT [periodo] FROM " + Sondeo_Alumnos.SqlFrom
			sOrderBy = "[periodo] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Sondeo_Alumnos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Sondeo_Alumnos.periodo.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(Sondeo_Alumnos.rut)

				' Field PATERNO
				SetSessionFilterValues(Sondeo_Alumnos.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Sondeo_Alumnos.MATERNO)

				' Field carrera
				SetSessionDropDownValue(Sondeo_Alumnos.carrera.DropDownValue, Sondeo_Alumnos.carrera)

				' Field ano
				SetSessionDropDownValue(Sondeo_Alumnos.ano.DropDownValue, Sondeo_Alumnos.ano)

				' Field periodo
				SetSessionDropDownValue(Sondeo_Alumnos.periodo.DropDownValue, Sondeo_Alumnos.periodo)
			bSetupFilter = True ' Set up filter required
		Else

				' Field rut
				If (GetFilterValues(Sondeo_Alumnos.rut)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Sondeo_Alumnos.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Sondeo_Alumnos.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field carrera
				If (GetDropDownValue(Sondeo_Alumnos.carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Sondeo_Alumnos.carrera.DropDownValue) Then
					If Not ew_SameStr(Sondeo_Alumnos.carrera.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Sondeo_Alumnos_carrera") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ano
				If (GetDropDownValue(Sondeo_Alumnos.ano)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Sondeo_Alumnos.ano.DropDownValue) Then
					If Not ew_SameStr(Sondeo_Alumnos.ano.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Sondeo_Alumnos_ano") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field periodo
				If (GetDropDownValue(Sondeo_Alumnos.periodo)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Sondeo_Alumnos.periodo.DropDownValue) Then
					If Not ew_SameStr(Sondeo_Alumnos.periodo.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Sondeo_Alumnos_periodo") Is Nothing Then
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
			GetSessionFilterValues(Sondeo_Alumnos.rut)

			' Field PATERNO
			GetSessionFilterValues(Sondeo_Alumnos.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Sondeo_Alumnos.MATERNO)

			' Field carrera
			GetSessionDropDownValue(Sondeo_Alumnos.carrera)

			' Field ano
			GetSessionDropDownValue(Sondeo_Alumnos.ano)

			' Field periodo
			GetSessionDropDownValue(Sondeo_Alumnos.periodo)
		End If

		' Call page filter validated event
		Sondeo_Alumnos.Page_FilterValidated()

		' Build SQL
		' Field rut

		BuildExtendedFilter(Sondeo_Alumnos.rut, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Sondeo_Alumnos.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Sondeo_Alumnos.MATERNO, sFilter)

		' Field carrera
		BuildDropDownFilter(Sondeo_Alumnos.carrera, sFilter, "")

		' Field ano
		BuildDropDownFilter(Sondeo_Alumnos.ano, sFilter, "")

		' Field periodo
		BuildDropDownFilter(Sondeo_Alumnos.periodo, sFilter, "")

		' Save parms to Session
		' Field rut

		SetSessionFilterValues(Sondeo_Alumnos.rut)

		' Field PATERNO
		SetSessionFilterValues(Sondeo_Alumnos.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Sondeo_Alumnos.MATERNO)

		' Field carrera
		SetSessionDropDownValue(Sondeo_Alumnos.carrera.DropDownValue, Sondeo_Alumnos.carrera)

		' Field ano
		SetSessionDropDownValue(Sondeo_Alumnos.ano.DropDownValue, Sondeo_Alumnos.ano)

		' Field periodo
		SetSessionDropDownValue(Sondeo_Alumnos.periodo.DropDownValue, Sondeo_Alumnos.periodo)

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
		If ew_Session("sv_Sondeo_Alumnos_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Sondeo_Alumnos_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Sondeo_Alumnos_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Sondeo_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Sondeo_Alumnos_" + parm)
		End If
		If ew_Session("so1_Sondeo_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Sondeo_Alumnos_" + parm))
		End If
		If ew_Session("sc_Sondeo_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Sondeo_Alumnos_" + parm))
		End If
		If ew_Session("sv2_Sondeo_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Sondeo_Alumnos_" + parm)
		End If
		If ew_Session("so2_Sondeo_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Sondeo_Alumnos_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Sondeo_Alumnos_" + parm) = fld.SearchValue
		ew_Session("so1_Sondeo_Alumnos_" + parm) = fld.SearchOperator
		ew_Session("sc_Sondeo_Alumnos_" + parm) = fld.SearchCondition
		ew_Session("sv2_Sondeo_Alumnos_" + parm) = fld.SearchValue2
		ew_Session("so2_Sondeo_Alumnos_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Sondeo_Alumnos_" + parm) = ""
		ew_Session("so1_Sondeo_Alumnos_" + parm) = "="
		ew_Session("sc_Sondeo_Alumnos_" + parm) = "AND"
		ew_Session("sv2_Sondeo_Alumnos_" + parm) = ""
		ew_Session("so2_Sondeo_Alumnos_" + parm) = "="
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
		ew_Session("sel_Sondeo_Alumnos_" & parm) = ""
		ew_Session("rf_Sondeo_Alumnos_" & parm) = ""
		ew_Session("rt_Sondeo_Alumnos_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Sondeo_Alumnos.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Sondeo_Alumnos_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Sondeo_Alumnos_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Sondeo_Alumnos_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field carrera

			Sondeo_Alumnos.carrera.DefaultDropDownValue = EWRPT_INIT_VALUE
			Sondeo_Alumnos.carrera.DropDownValue = Sondeo_Alumnos.carrera.DefaultDropDownValue

			' Field ano
			Sondeo_Alumnos.ano.DefaultDropDownValue = EWRPT_INIT_VALUE
			Sondeo_Alumnos.ano.DropDownValue = Sondeo_Alumnos.ano.DefaultDropDownValue

			' Field periodo
			Sondeo_Alumnos.periodo.DefaultDropDownValue = EWRPT_INIT_VALUE
			Sondeo_Alumnos.periodo.DropDownValue = Sondeo_Alumnos.periodo.DefaultDropDownValue

		' Set up default values for extended filters
			' Field rut

			SetDefaultExtFilter(Sondeo_Alumnos.rut, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Sondeo_Alumnos.rut)	

			' Field PATERNO
			SetDefaultExtFilter(Sondeo_Alumnos.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Sondeo_Alumnos.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Sondeo_Alumnos.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Sondeo_Alumnos.MATERNO)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check rut extended filter
		If (TextFilterApplied(Sondeo_Alumnos.rut)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Sondeo_Alumnos.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Sondeo_Alumnos.MATERNO)) Then bFilterExist = True

		' Check carrera dropdown filter
		If (NonTextFilterApplied(Sondeo_Alumnos.carrera)) Then bFilterExist = True

		' Check ano dropdown filter
		If (NonTextFilterApplied(Sondeo_Alumnos.ano)) Then bFilterExist = True

		' Check periodo dropdown filter
		If (NonTextFilterApplied(Sondeo_Alumnos.periodo)) Then bFilterExist = True
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
		BuildExtendedFilter(Sondeo_Alumnos.rut, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Sondeo_Alumnos.rut.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Sondeo_Alumnos.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Sondeo_Alumnos.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Sondeo_Alumnos.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Sondeo_Alumnos.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field carrera
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Sondeo_Alumnos.carrera, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Sondeo_Alumnos.carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ano
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Sondeo_Alumnos.ano, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Sondeo_Alumnos.ano.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field periodo
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Sondeo_Alumnos.periodo, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Sondeo_Alumnos.periodo.FldCaption() & "<br>"
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
				Sondeo_Alumnos.OrderBy = ""
				Sondeo_Alumnos.StartGroup = 1
				Sondeo_Alumnos.rut.Sort = ""
				Sondeo_Alumnos.NOMBRE.Sort = ""
				Sondeo_Alumnos.PATERNO.Sort = ""
				Sondeo_Alumnos.MATERNO.Sort = ""
				Sondeo_Alumnos.carrera.Sort = ""
				Sondeo_Alumnos.ano.Sort = ""
				Sondeo_Alumnos.periodo.Sort = ""
				Sondeo_Alumnos.realizado.Sort = ""
				Sondeo_Alumnos.fechaRealizado.Sort = ""
				Sondeo_Alumnos.observacion.Sort = ""
				Sondeo_Alumnos.p1.Sort = ""
				Sondeo_Alumnos.p2.Sort = ""
				Sondeo_Alumnos.p3.Sort = ""
				Sondeo_Alumnos.p4.Sort = ""
				Sondeo_Alumnos.p5.Sort = ""
				Sondeo_Alumnos.p6.Sort = ""
				Sondeo_Alumnos.p7.Sort = ""
				Sondeo_Alumnos.P8.Sort = ""
				Sondeo_Alumnos.P9.Sort = ""
				Sondeo_Alumnos.p10.Sort = ""
				Sondeo_Alumnos.p11.Sort = ""
				Sondeo_Alumnos.p12.Sort = ""
				Sondeo_Alumnos.p13.Sort = ""
				Sondeo_Alumnos.p14.Sort = ""
				Sondeo_Alumnos.p15.Sort = ""
				Sondeo_Alumnos.p16.Sort = ""
				Sondeo_Alumnos.p17.Sort = ""
				Sondeo_Alumnos.p18.Sort = ""
				Sondeo_Alumnos.p19.Sort = ""
				Sondeo_Alumnos.p20.Sort = ""
				Sondeo_Alumnos.p21.Sort = ""
				Sondeo_Alumnos.p22.Sort = ""
				Sondeo_Alumnos.p23.Sort = ""
				Sondeo_Alumnos.p24.Sort = ""
				Sondeo_Alumnos.p25.Sort = ""
				Sondeo_Alumnos.p26.Sort = ""
				Sondeo_Alumnos.p27.Sort = ""
				Sondeo_Alumnos.p28.Sort = ""
				Sondeo_Alumnos.p29.Sort = ""
				Sondeo_Alumnos.p30.Sort = ""
				Sondeo_Alumnos.p31.Sort = ""
				Sondeo_Alumnos.p32.Sort = ""
				Sondeo_Alumnos.p33.Sort = ""
				Sondeo_Alumnos.p34.Sort = ""
				Sondeo_Alumnos.p35.Sort = ""
				Sondeo_Alumnos.p36.Sort = ""
				Sondeo_Alumnos.p37.Sort = ""
				Sondeo_Alumnos.p38.Sort = ""
				Sondeo_Alumnos.p39.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Sondeo_Alumnos.CurrentOrder = ew_Get("order")
			Sondeo_Alumnos.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Sondeo_Alumnos.SortSql()
			Sondeo_Alumnos.OrderBy = sSortSql
			Sondeo_Alumnos.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Sondeo_Alumnos.OrderBy)) Then
			Sondeo_Alumnos.OrderBy = "[fechaRealizado] DESC"
			Sondeo_Alumnos.fechaRealizado.Sort = "DESC"
		End If
		Return Sondeo_Alumnos.OrderBy
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
		Sondeo_Alumnos_summary = New crSondeo_Alumnos_summary(Me)
		Sondeo_Alumnos_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Sondeo_Alumnos_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Sondeo_Alumnos_summary IsNot Nothing) Then Sondeo_Alumnos_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Sondeo_Alumnos.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Sondeo_Alumnos_summary = new ewrpt_Page("Sondeo_Alumnos_summary");
// page properties
Sondeo_Alumnos_summary.PageID = "summary"; // page ID
Sondeo_Alumnos_summary.FormID = "fSondeo_Alumnossummaryfilter"; // form ID
var EWRPT_PAGE_ID = Sondeo_Alumnos_summary.PageID;
// extend page with ValidateForm function
Sondeo_Alumnos_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Sondeo_Alumnos_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Sondeo_Alumnos_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Sondeo_Alumnos_summary.ValidateRequired = false; // no JavaScript validation
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
<% Sondeo_Alumnos_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Sondeo_Alumnos.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Sondeo_Alumnos.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Sondeo_Alumnos.TableCaption() %></h1></div>
<% If (Sondeo_Alumnos.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Sondeo_Alumnos_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% If (Sondeo_Alumnos_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Sondeo_Alumnos_summary.ShowMessage() %>
<% If (Sondeo_Alumnos.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Sondeo_Alumnos.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Sondeo_Alumnos.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Sondeo_Alumnos.FilterPanelOption = 2 OrElse (Sondeo_Alumnos.FilterPanelOption = 3 AndAlso Sondeo_Alumnos_summary.FilterApplied) OrElse Sondeo_Alumnos_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Sondeo_Alumnossmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fSondeo_Alumnossummaryfilter" id="fSondeo_Alumnossummaryfilter" action="Sondeo_Alumnossmry.aspx" class="ewForm" onsubmit="return Sondeo_Alumnos_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Sondeo_Alumnos.MATERNO.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Sondeo_Alumnos.rut.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_rut" id="sv1_rut" size="30" maxlength="50" value="<%= ew_HtmlEncode(Sondeo_Alumnos.rut.SearchValue) %>"<%= IIf(Sondeo_Alumnos_summary.ClearExtFilter = "Sondeo_Alumnos_rut", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Sondeo_Alumnos.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Sondeo_Alumnos.PATERNO.SearchValue) %>"<%= IIf(Sondeo_Alumnos_summary.ClearExtFilter = "Sondeo_Alumnos_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Sondeo_Alumnos.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Sondeo_Alumnos.MATERNO.SearchValue) %>"<%= IIf(Sondeo_Alumnos_summary.ClearExtFilter = "Sondeo_Alumnos_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Sondeo_Alumnos.carrera.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_carrera" id="sv_carrera"<%= IIf(Sondeo_Alumnos_summary.ClearExtFilter = "Sondeo_Alumnos_carrera", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Sondeo_Alumnos.carrera.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Sondeo_Alumnos.carrera.CustomFilters.Count + Sondeo_Alumnos.carrera.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Sondeo_Alumnos.carrera.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "carrera")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Sondeo_Alumnos.carrera.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Sondeo_Alumnos.carrera.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Sondeo_Alumnos.carrera.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Sondeo_Alumnos.ano.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ano" id="sv_ano"<%= IIf(Sondeo_Alumnos_summary.ClearExtFilter = "Sondeo_Alumnos_ano", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Sondeo_Alumnos.ano.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Sondeo_Alumnos.ano.CustomFilters.Count + Sondeo_Alumnos.ano.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Sondeo_Alumnos.ano.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ano")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Sondeo_Alumnos.ano.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Sondeo_Alumnos.ano.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Sondeo_Alumnos.ano.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Sondeo_Alumnos.periodo.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_periodo" id="sv_periodo"<%= IIf(Sondeo_Alumnos_summary.ClearExtFilter = "Sondeo_Alumnos_periodo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Sondeo_Alumnos.periodo.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Sondeo_Alumnos.periodo.CustomFilters.Count + Sondeo_Alumnos.periodo.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Sondeo_Alumnos.periodo.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "periodo")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Sondeo_Alumnos.periodo.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Sondeo_Alumnos.periodo.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Sondeo_Alumnos.periodo.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (Sondeo_Alumnos.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Sondeo_Alumnos_summary.ShowFilterList() %>
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
If (Sondeo_Alumnos.ExportAll AndAlso ew_NotEmpty(Sondeo_Alumnos.Export)) Then
	Sondeo_Alumnos_summary.StopGrp = Sondeo_Alumnos_summary.TotalGrps
Else
	Sondeo_Alumnos_summary.StopGrp = Sondeo_Alumnos_summary.StartGrp + Sondeo_Alumnos_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Sondeo_Alumnos_summary.StopGrp > Sondeo_Alumnos_summary.TotalGrps) Then
	Sondeo_Alumnos_summary.StopGrp = Sondeo_Alumnos_summary.TotalGrps
End If
Sondeo_Alumnos_summary.RecCount = 0

' Get first row
If (Sondeo_Alumnos_summary.TotalGrps > 0) Then
	Sondeo_Alumnos_summary.GetRow() ' ASPXRPT
	Sondeo_Alumnos_summary.GrpCount = 1
End If
While ((Sondeo_Alumnos_summary.HasRow AndAlso Sondeo_Alumnos_summary.GrpIndex < Sondeo_Alumnos_summary.StopGrp) OrElse Sondeo_Alumnos_summary.ShowFirstHeader)

	' Show header
	If (Sondeo_Alumnos_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.rut.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.rut))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.rut.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.rut) %>',0);"><%= Sondeo_Alumnos.rut.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.rut.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.rut.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.NOMBRE) %>',0);"><%= Sondeo_Alumnos.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.PATERNO) %>',0);"><%= Sondeo_Alumnos.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.MATERNO) %>',0);"><%= Sondeo_Alumnos.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.carrera))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.carrera) %>',0);"><%= Sondeo_Alumnos.carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.ano))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.ano) %>',0);"><%= Sondeo_Alumnos.ano.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.periodo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.periodo))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.periodo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.periodo) %>',0);"><%= Sondeo_Alumnos.periodo.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.periodo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.periodo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.realizado.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.realizado))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.realizado.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.realizado) %>',0);"><%= Sondeo_Alumnos.realizado.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.realizado.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.realizado.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.fechaRealizado.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.fechaRealizado))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.fechaRealizado.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.fechaRealizado) %>',0);"><%= Sondeo_Alumnos.fechaRealizado.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.fechaRealizado.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.fechaRealizado.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.observacion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.observacion))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.observacion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.observacion) %>',0);"><%= Sondeo_Alumnos.observacion.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.observacion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.observacion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p1.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p1))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p1.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p1) %>',0);"><%= Sondeo_Alumnos.p1.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p1.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p1.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p2))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p2) %>',0);"><%= Sondeo_Alumnos.p2.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p3.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p3))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p3.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p3) %>',0);"><%= Sondeo_Alumnos.p3.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p3.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p3.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p4.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p4))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p4.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p4) %>',0);"><%= Sondeo_Alumnos.p4.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p4.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p4.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p5.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p5))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p5.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p5) %>',0);"><%= Sondeo_Alumnos.p5.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p5.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p5.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p6.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p6))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p6.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p6) %>',0);"><%= Sondeo_Alumnos.p6.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p6.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p6.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p7.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p7))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p7.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p7) %>',0);"><%= Sondeo_Alumnos.p7.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p7.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p7.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.P8.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.P8))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.P8.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.P8) %>',0);"><%= Sondeo_Alumnos.P8.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.P8.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.P8.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.P9.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.P9))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.P9.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.P9) %>',0);"><%= Sondeo_Alumnos.P9.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.P9.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.P9.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p10.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p10))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p10.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p10) %>',0);"><%= Sondeo_Alumnos.p10.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p10.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p10.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p11.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p11))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p11.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p11) %>',0);"><%= Sondeo_Alumnos.p11.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p11.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p11.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p12.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p12))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p12.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p12) %>',0);"><%= Sondeo_Alumnos.p12.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p12.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p12.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p13.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p13))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p13.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p13) %>',0);"><%= Sondeo_Alumnos.p13.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p13.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p13.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p14.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p14))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p14.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p14) %>',0);"><%= Sondeo_Alumnos.p14.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p14.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p14.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p15.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p15))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p15.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p15) %>',0);"><%= Sondeo_Alumnos.p15.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p15.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p15.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p16.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p16))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p16.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p16) %>',0);"><%= Sondeo_Alumnos.p16.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p16.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p16.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p17.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p17))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p17.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p17) %>',0);"><%= Sondeo_Alumnos.p17.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p17.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p17.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p18.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p18))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p18.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p18) %>',0);"><%= Sondeo_Alumnos.p18.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p18.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p18.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p19.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p19))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p19.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p19) %>',0);"><%= Sondeo_Alumnos.p19.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p19.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p19.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p20.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p20))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p20.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p20) %>',0);"><%= Sondeo_Alumnos.p20.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p20.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p20.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p21.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p21))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p21.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p21) %>',0);"><%= Sondeo_Alumnos.p21.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p21.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p21.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p22.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p22))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p22.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p22) %>',0);"><%= Sondeo_Alumnos.p22.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p22.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p22.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p23.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p23))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p23.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p23) %>',0);"><%= Sondeo_Alumnos.p23.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p23.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p23.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p24.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p24))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p24.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p24) %>',0);"><%= Sondeo_Alumnos.p24.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p24.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p24.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p25.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p25))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p25.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p25) %>',0);"><%= Sondeo_Alumnos.p25.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p25.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p25.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p26.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p26))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p26.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p26) %>',0);"><%= Sondeo_Alumnos.p26.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p26.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p26.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p27.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p27))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p27.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p27) %>',0);"><%= Sondeo_Alumnos.p27.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p27.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p27.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p28.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p28))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p28.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p28) %>',0);"><%= Sondeo_Alumnos.p28.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p28.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p28.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p29.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p29))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p29.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p29) %>',0);"><%= Sondeo_Alumnos.p29.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p29.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p29.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p30.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p30))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p30.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p30) %>',0);"><%= Sondeo_Alumnos.p30.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p30.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p30.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p31.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p31))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p31.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p31) %>',0);"><%= Sondeo_Alumnos.p31.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p31.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p31.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p32.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p32))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p32.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p32) %>',0);"><%= Sondeo_Alumnos.p32.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p32.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p32.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p33.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p33))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p33.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p33) %>',0);"><%= Sondeo_Alumnos.p33.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p33.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p33.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p34.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p34))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p34.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p34) %>',0);"><%= Sondeo_Alumnos.p34.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p34.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p34.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p35.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p35))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p35.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p35) %>',0);"><%= Sondeo_Alumnos.p35.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p35.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p35.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p36.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p36))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p36.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p36) %>',0);"><%= Sondeo_Alumnos.p36.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p36.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p36.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p37.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p37))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p37.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p37) %>',0);"><%= Sondeo_Alumnos.p37.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p37.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p37.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p38.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p38))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p38.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p38) %>',0);"><%= Sondeo_Alumnos.p38.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p38.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p38.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Sondeo_Alumnos.Export)) Then %>
<%= Sondeo_Alumnos.p39.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p39))) Then %>
		<td style="vertical-align: bottom;"><%= Sondeo_Alumnos.p39.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Sondeo_Alumnos.SortUrl(Sondeo_Alumnos.p39) %>',0);"><%= Sondeo_Alumnos.p39.FldCaption() %></td><td style="width: 10px;">
		<% If (Sondeo_Alumnos.p39.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Sondeo_Alumnos.p39.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Sondeo_Alumnos_summary.ShowFirstHeader = False
	End If
	Sondeo_Alumnos_summary.RecCount += 1

		' Render detail row
		Sondeo_Alumnos.ResetCSS()
		Sondeo_Alumnos.RowType = EWRPT_ROWTYPE_DETAIL
		Sondeo_Alumnos_summary.RenderRow()
%>
	<tr<%= Sondeo_Alumnos.RowAttributes() %>>
		<td<%= Sondeo_Alumnos.rut.CellAttributes %>>
<div<%= Sondeo_Alumnos.rut.ViewAttributes%>><%= Sondeo_Alumnos.rut.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.NOMBRE.CellAttributes %>>
<div<%= Sondeo_Alumnos.NOMBRE.ViewAttributes%>><%= Sondeo_Alumnos.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.PATERNO.CellAttributes %>>
<div<%= Sondeo_Alumnos.PATERNO.ViewAttributes%>><%= Sondeo_Alumnos.PATERNO.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.MATERNO.CellAttributes %>>
<div<%= Sondeo_Alumnos.MATERNO.ViewAttributes%>><%= Sondeo_Alumnos.MATERNO.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.carrera.CellAttributes %>>
<div<%= Sondeo_Alumnos.carrera.ViewAttributes%>><%= Sondeo_Alumnos.carrera.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.ano.CellAttributes %>>
<div<%= Sondeo_Alumnos.ano.ViewAttributes%>><%= Sondeo_Alumnos.ano.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.periodo.CellAttributes %>>
<div<%= Sondeo_Alumnos.periodo.ViewAttributes%>><%= Sondeo_Alumnos.periodo.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.realizado.CellAttributes %>>
<div<%= Sondeo_Alumnos.realizado.ViewAttributes%>><%= Sondeo_Alumnos.realizado.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.fechaRealizado.CellAttributes %>>
<div<%= Sondeo_Alumnos.fechaRealizado.ViewAttributes%>><%= Sondeo_Alumnos.fechaRealizado.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.observacion.CellAttributes %>>
<div<%= Sondeo_Alumnos.observacion.ViewAttributes%>><%= Sondeo_Alumnos.observacion.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p1.CellAttributes %>>
<div<%= Sondeo_Alumnos.p1.ViewAttributes%>><%= Sondeo_Alumnos.p1.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p2.CellAttributes %>>
<div<%= Sondeo_Alumnos.p2.ViewAttributes%>><%= Sondeo_Alumnos.p2.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p3.CellAttributes %>>
<div<%= Sondeo_Alumnos.p3.ViewAttributes%>><%= Sondeo_Alumnos.p3.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p4.CellAttributes %>>
<div<%= Sondeo_Alumnos.p4.ViewAttributes%>><%= Sondeo_Alumnos.p4.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p5.CellAttributes %>>
<div<%= Sondeo_Alumnos.p5.ViewAttributes%>><%= Sondeo_Alumnos.p5.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p6.CellAttributes %>>
<div<%= Sondeo_Alumnos.p6.ViewAttributes%>><%= Sondeo_Alumnos.p6.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p7.CellAttributes %>>
<div<%= Sondeo_Alumnos.p7.ViewAttributes%>><%= Sondeo_Alumnos.p7.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.P8.CellAttributes %>>
<div<%= Sondeo_Alumnos.P8.ViewAttributes%>><%= Sondeo_Alumnos.P8.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.P9.CellAttributes %>>
<div<%= Sondeo_Alumnos.P9.ViewAttributes%>><%= Sondeo_Alumnos.P9.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p10.CellAttributes %>>
<div<%= Sondeo_Alumnos.p10.ViewAttributes%>><%= Sondeo_Alumnos.p10.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p11.CellAttributes %>>
<div<%= Sondeo_Alumnos.p11.ViewAttributes%>><%= Sondeo_Alumnos.p11.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p12.CellAttributes %>>
<div<%= Sondeo_Alumnos.p12.ViewAttributes%>><%= Sondeo_Alumnos.p12.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p13.CellAttributes %>>
<div<%= Sondeo_Alumnos.p13.ViewAttributes%>><%= Sondeo_Alumnos.p13.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p14.CellAttributes %>>
<div<%= Sondeo_Alumnos.p14.ViewAttributes%>><%= Sondeo_Alumnos.p14.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p15.CellAttributes %>>
<div<%= Sondeo_Alumnos.p15.ViewAttributes%>><%= Sondeo_Alumnos.p15.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p16.CellAttributes %>>
<div<%= Sondeo_Alumnos.p16.ViewAttributes%>><%= Sondeo_Alumnos.p16.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p17.CellAttributes %>>
<div<%= Sondeo_Alumnos.p17.ViewAttributes%>><%= Sondeo_Alumnos.p17.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p18.CellAttributes %>>
<div<%= Sondeo_Alumnos.p18.ViewAttributes%>><%= Sondeo_Alumnos.p18.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p19.CellAttributes %>>
<div<%= Sondeo_Alumnos.p19.ViewAttributes%>><%= Sondeo_Alumnos.p19.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p20.CellAttributes %>>
<div<%= Sondeo_Alumnos.p20.ViewAttributes%>><%= Sondeo_Alumnos.p20.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p21.CellAttributes %>>
<div<%= Sondeo_Alumnos.p21.ViewAttributes%>><%= Sondeo_Alumnos.p21.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p22.CellAttributes %>>
<div<%= Sondeo_Alumnos.p22.ViewAttributes%>><%= Sondeo_Alumnos.p22.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p23.CellAttributes %>>
<div<%= Sondeo_Alumnos.p23.ViewAttributes%>><%= Sondeo_Alumnos.p23.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p24.CellAttributes %>>
<div<%= Sondeo_Alumnos.p24.ViewAttributes%>><%= Sondeo_Alumnos.p24.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p25.CellAttributes %>>
<div<%= Sondeo_Alumnos.p25.ViewAttributes%>><%= Sondeo_Alumnos.p25.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p26.CellAttributes %>>
<div<%= Sondeo_Alumnos.p26.ViewAttributes%>><%= Sondeo_Alumnos.p26.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p27.CellAttributes %>>
<div<%= Sondeo_Alumnos.p27.ViewAttributes%>><%= Sondeo_Alumnos.p27.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p28.CellAttributes %>>
<div<%= Sondeo_Alumnos.p28.ViewAttributes%>><%= Sondeo_Alumnos.p28.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p29.CellAttributes %>>
<div<%= Sondeo_Alumnos.p29.ViewAttributes%>><%= Sondeo_Alumnos.p29.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p30.CellAttributes %>>
<div<%= Sondeo_Alumnos.p30.ViewAttributes%>><%= Sondeo_Alumnos.p30.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p31.CellAttributes %>>
<div<%= Sondeo_Alumnos.p31.ViewAttributes%>><%= Sondeo_Alumnos.p31.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p32.CellAttributes %>>
<div<%= Sondeo_Alumnos.p32.ViewAttributes%>><%= Sondeo_Alumnos.p32.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p33.CellAttributes %>>
<div<%= Sondeo_Alumnos.p33.ViewAttributes%>><%= Sondeo_Alumnos.p33.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p34.CellAttributes %>>
<div<%= Sondeo_Alumnos.p34.ViewAttributes%>><%= Sondeo_Alumnos.p34.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p35.CellAttributes %>>
<div<%= Sondeo_Alumnos.p35.ViewAttributes%>><%= Sondeo_Alumnos.p35.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p36.CellAttributes %>>
<div<%= Sondeo_Alumnos.p36.ViewAttributes%>><%= Sondeo_Alumnos.p36.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p37.CellAttributes %>>
<div<%= Sondeo_Alumnos.p37.ViewAttributes%>><%= Sondeo_Alumnos.p37.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p38.CellAttributes %>>
<div<%= Sondeo_Alumnos.p38.ViewAttributes%>><%= Sondeo_Alumnos.p38.ListViewValue%></div>
</td>
		<td<%= Sondeo_Alumnos.p39.CellAttributes %>>
<div<%= Sondeo_Alumnos.p39.ViewAttributes%>><%= Sondeo_Alumnos.p39.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Sondeo_Alumnos_summary.AccumulateSummary()

		' Get next record
		Sondeo_Alumnos_summary.GetRow() ' ASPXRPT
		Sondeo_Alumnos_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Sondeo_Alumnos_summary.TotalGrps > 0) Then
	Sondeo_Alumnos.ResetCSS()
	Sondeo_Alumnos.RowType = EWRPT_ROWTYPE_TOTAL
	Sondeo_Alumnos.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Sondeo_Alumnos.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Sondeo_Alumnos.RowAttrs("class") = "ewRptGrandSummary"
	Sondeo_Alumnos_summary.RenderRow()
%>
	<!-- tr><td colspan="49"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Sondeo_Alumnos.RowAttributes() %>><td colspan="49"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Sondeo_Alumnos_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Sondeo_Alumnos.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Sondeo_Alumnos_summary.Pager Is Nothing Then Sondeo_Alumnos_summary.Pager = New cPrevNextPager(Sondeo_Alumnos_summary.StartGrp, Sondeo_Alumnos_summary.DisplayGrps, Sondeo_Alumnos_summary.TotalGrps) %>
<% If Sondeo_Alumnos_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Sondeo_Alumnos_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Sondeo_Alumnossmry.aspx?start=<%= Sondeo_Alumnos_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Sondeo_Alumnos_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Sondeo_Alumnossmry.aspx?start=<%= Sondeo_Alumnos_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Sondeo_Alumnos_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Sondeo_Alumnos_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Sondeo_Alumnossmry.aspx?start=<%= Sondeo_Alumnos_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Sondeo_Alumnos_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Sondeo_Alumnossmry.aspx?start=<%= Sondeo_Alumnos_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Sondeo_Alumnos_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Sondeo_Alumnos_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Sondeo_Alumnos_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Sondeo_Alumnos_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Sondeo_Alumnos_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Sondeo_Alumnos_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Sondeo_Alumnos_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Sondeo_Alumnos_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Sondeo_Alumnos_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Sondeo_Alumnos.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Sondeo_Alumnos.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Sondeo_Alumnos.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Sondeo_Alumnos_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Sondeo_Alumnos.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
