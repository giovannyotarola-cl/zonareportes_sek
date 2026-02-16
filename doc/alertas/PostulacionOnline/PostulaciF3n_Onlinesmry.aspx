<%@ Page ClassName="PostulaciF3n_Onlinesmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_postulacion_online" %>
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
	Public PostulaciF3n_Online As crPostulaciF3n_Online = Nothing

	'
	' Table class (for Postulación Online)
	'
	Public Class crPostulaciF3n_Online
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
				Return "PostulaciF3n_Online"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Postulación Online"
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

		Public NOMBRE As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public CARRERA As crField

		Public JORNADA As crField

		Public REGION_PROCEDENCIA As crField

		Public MAIL As crField

		Public PAIS_PROCEDENCIA As crField

		Public TRAMO_RENTA As crField

		Public CONVIVE As crField

		Public INGRESO_FAMILIAR As crField

		Public SALUD As crField

		Public MOTIVO As crField

		Public VIA As crField

		Public TELEFONO_PARTICULAR As crField

		Public TELEFONO_EMERGENCIA As crField

		Public FECHA_POSTULACION As crField

		Public DIRECCION_PROCEDENCIA As crField

		Public CIUDAD_PROCEDENCIA As crField

		Public COMUNA As crField

		Public DIRECCION_ACTUAL As crField

		Public CIUDAD_ACTUAL As crField

		Public COMUNA_ACTUAL As crField

		Public REGIONACTUAL As crField

		Public ESTADO_CIVIL As crField

		Public FECHA_NACIMIENTO As crField

		Public GENERO As crField

		Public TRABAJA As crField

		Public TIPO_TRABAJO As crField

		Public EMPRESA As crField

		Public ACTIVIDAD As crField

		Public DIRECCION_EMPRESA As crField

		Public SOSTENEDOR As crField

		Public NivelEducativoAlumno As crField

		Public COLEGIO As crField

		Public AD1O_EGRESO_COLEGIO As crField

		Public CONVALIDA As crField

		Public AD1O_PSU As crField

		Public PROMEDIO_ENSED1ANZA_MEDIA As crField

		Public TIPO_PRUEBA As crField

		Public PUNTAJE_PSU_MATEMATICAS As crField

		Public PUNTAJE_PSU_LENGUAJE As crField

		Public PROMEDIO_PSU As crField

		Public PUNTAJE_PAA_MATEMATICAS As crField

		Public PUNTAJE_PAA_LENGUAJE As crField

		Public PROMEDIO_PAA As crField

		Public NUMERO_INTEGRANTES As crField

		Public TIENE_HIJOS As crField

		Public OCUPACIONMadre As crField

		Public EstudiosMadre As crField

		Public OcupacionPadre As crField

		Public EstudiosPadre As crField

		Public ESTADO_POSTULACION As crField

		Public FECHA_ACTUALIZACION As crField

		Public PASO As crField

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
			RUT = new crField("PostulaciF3n_Online", "Postulación Online", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("PostulaciF3n_Online", "Postulación Online", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("PostulaciF3n_Online", "Postulación Online", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("PostulaciF3n_Online", "Postulación Online", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' CARRERA
			CARRERA = new crField("PostulaciF3n_Online", "Postulación Online", "x_CARRERA", "CARRERA", "[CARRERA]", 200, EWRPT_DATATYPE_STRING, -1)
			CARRERA.Page = APage
			CARRERA.ParentPage = APage.ParentPage
			Fields.Add("CARRERA", CARRERA)
			CARRERA.DateFilter = ""
			CARRERA.SqlSelect = ""
			CARRERA.SqlOrderBy = ""

			' JORNADA
			JORNADA = new crField("PostulaciF3n_Online", "Postulación Online", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			JORNADA.Page = APage
			JORNADA.ParentPage = APage.ParentPage
			Fields.Add("JORNADA", JORNADA)
			JORNADA.DateFilter = ""
			JORNADA.SqlSelect = ""
			JORNADA.SqlOrderBy = ""

			' REGION PROCEDENCIA
			REGION_PROCEDENCIA = new crField("PostulaciF3n_Online", "Postulación Online", "x_REGION_PROCEDENCIA", "REGION PROCEDENCIA", "[REGION PROCEDENCIA]", 200, EWRPT_DATATYPE_STRING, -1)
			REGION_PROCEDENCIA.Page = APage
			REGION_PROCEDENCIA.ParentPage = APage.ParentPage
			Fields.Add("REGION_PROCEDENCIA", REGION_PROCEDENCIA)
			REGION_PROCEDENCIA.DateFilter = ""
			REGION_PROCEDENCIA.SqlSelect = ""
			REGION_PROCEDENCIA.SqlOrderBy = ""

			' MAIL
			MAIL = new crField("PostulaciF3n_Online", "Postulación Online", "x_MAIL", "MAIL", "[MAIL]", 200, EWRPT_DATATYPE_STRING, -1)
			MAIL.Page = APage
			MAIL.ParentPage = APage.ParentPage
			Fields.Add("MAIL", MAIL)
			MAIL.DateFilter = ""
			MAIL.SqlSelect = ""
			MAIL.SqlOrderBy = ""

			' PAIS PROCEDENCIA
			PAIS_PROCEDENCIA = new crField("PostulaciF3n_Online", "Postulación Online", "x_PAIS_PROCEDENCIA", "PAIS PROCEDENCIA", "[PAIS PROCEDENCIA]", 200, EWRPT_DATATYPE_STRING, -1)
			PAIS_PROCEDENCIA.Page = APage
			PAIS_PROCEDENCIA.ParentPage = APage.ParentPage
			Fields.Add("PAIS_PROCEDENCIA", PAIS_PROCEDENCIA)
			PAIS_PROCEDENCIA.DateFilter = ""
			PAIS_PROCEDENCIA.SqlSelect = ""
			PAIS_PROCEDENCIA.SqlOrderBy = ""

			' TRAMO RENTA
			TRAMO_RENTA = new crField("PostulaciF3n_Online", "Postulación Online", "x_TRAMO_RENTA", "TRAMO RENTA", "[TRAMO RENTA]", 200, EWRPT_DATATYPE_STRING, -1)
			TRAMO_RENTA.Page = APage
			TRAMO_RENTA.ParentPage = APage.ParentPage
			Fields.Add("TRAMO_RENTA", TRAMO_RENTA)
			TRAMO_RENTA.DateFilter = ""
			TRAMO_RENTA.SqlSelect = ""
			TRAMO_RENTA.SqlOrderBy = ""

			' CONVIVE
			CONVIVE = new crField("PostulaciF3n_Online", "Postulación Online", "x_CONVIVE", "CONVIVE", "[CONVIVE]", 200, EWRPT_DATATYPE_STRING, -1)
			CONVIVE.Page = APage
			CONVIVE.ParentPage = APage.ParentPage
			Fields.Add("CONVIVE", CONVIVE)
			CONVIVE.DateFilter = ""
			CONVIVE.SqlSelect = ""
			CONVIVE.SqlOrderBy = ""

			' INGRESO FAMILIAR
			INGRESO_FAMILIAR = new crField("PostulaciF3n_Online", "Postulación Online", "x_INGRESO_FAMILIAR", "INGRESO FAMILIAR", "[INGRESO FAMILIAR]", 200, EWRPT_DATATYPE_STRING, -1)
			INGRESO_FAMILIAR.Page = APage
			INGRESO_FAMILIAR.ParentPage = APage.ParentPage
			Fields.Add("INGRESO_FAMILIAR", INGRESO_FAMILIAR)
			INGRESO_FAMILIAR.DateFilter = ""
			INGRESO_FAMILIAR.SqlSelect = ""
			INGRESO_FAMILIAR.SqlOrderBy = ""

			' SALUD
			SALUD = new crField("PostulaciF3n_Online", "Postulación Online", "x_SALUD", "SALUD", "[SALUD]", 200, EWRPT_DATATYPE_STRING, -1)
			SALUD.Page = APage
			SALUD.ParentPage = APage.ParentPage
			Fields.Add("SALUD", SALUD)
			SALUD.DateFilter = ""
			SALUD.SqlSelect = ""
			SALUD.SqlOrderBy = ""

			' MOTIVO
			MOTIVO = new crField("PostulaciF3n_Online", "Postulación Online", "x_MOTIVO", "MOTIVO", "[MOTIVO]", 200, EWRPT_DATATYPE_STRING, -1)
			MOTIVO.Page = APage
			MOTIVO.ParentPage = APage.ParentPage
			Fields.Add("MOTIVO", MOTIVO)
			MOTIVO.DateFilter = ""
			MOTIVO.SqlSelect = ""
			MOTIVO.SqlOrderBy = ""

			' VIA
			VIA = new crField("PostulaciF3n_Online", "Postulación Online", "x_VIA", "VIA", "[VIA]", 200, EWRPT_DATATYPE_STRING, -1)
			VIA.Page = APage
			VIA.ParentPage = APage.ParentPage
			Fields.Add("VIA", VIA)
			VIA.DateFilter = ""
			VIA.SqlSelect = ""
			VIA.SqlOrderBy = ""

			' TELEFONO PARTICULAR
			TELEFONO_PARTICULAR = new crField("PostulaciF3n_Online", "Postulación Online", "x_TELEFONO_PARTICULAR", "TELEFONO PARTICULAR", "[TELEFONO PARTICULAR]", 200, EWRPT_DATATYPE_STRING, -1)
			TELEFONO_PARTICULAR.Page = APage
			TELEFONO_PARTICULAR.ParentPage = APage.ParentPage
			Fields.Add("TELEFONO_PARTICULAR", TELEFONO_PARTICULAR)
			TELEFONO_PARTICULAR.DateFilter = ""
			TELEFONO_PARTICULAR.SqlSelect = ""
			TELEFONO_PARTICULAR.SqlOrderBy = ""

			' TELEFONO EMERGENCIA
			TELEFONO_EMERGENCIA = new crField("PostulaciF3n_Online", "Postulación Online", "x_TELEFONO_EMERGENCIA", "TELEFONO EMERGENCIA", "[TELEFONO EMERGENCIA]", 200, EWRPT_DATATYPE_STRING, -1)
			TELEFONO_EMERGENCIA.Page = APage
			TELEFONO_EMERGENCIA.ParentPage = APage.ParentPage
			Fields.Add("TELEFONO_EMERGENCIA", TELEFONO_EMERGENCIA)
			TELEFONO_EMERGENCIA.DateFilter = ""
			TELEFONO_EMERGENCIA.SqlSelect = ""
			TELEFONO_EMERGENCIA.SqlOrderBy = ""

			' FECHA POSTULACION
			FECHA_POSTULACION = new crField("PostulaciF3n_Online", "Postulación Online", "x_FECHA_POSTULACION", "FECHA POSTULACION", "[FECHA POSTULACION]", 135, EWRPT_DATATYPE_DATE, 7)
			FECHA_POSTULACION.Page = APage
			FECHA_POSTULACION.ParentPage = APage.ParentPage
			FECHA_POSTULACION.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECHA_POSTULACION", FECHA_POSTULACION)
			FECHA_POSTULACION.DateFilter = ""
			FECHA_POSTULACION.SqlSelect = ""
			FECHA_POSTULACION.SqlOrderBy = ""

			' DIRECCION PROCEDENCIA
			DIRECCION_PROCEDENCIA = new crField("PostulaciF3n_Online", "Postulación Online", "x_DIRECCION_PROCEDENCIA", "DIRECCION PROCEDENCIA", "[DIRECCION PROCEDENCIA]", 200, EWRPT_DATATYPE_STRING, -1)
			DIRECCION_PROCEDENCIA.Page = APage
			DIRECCION_PROCEDENCIA.ParentPage = APage.ParentPage
			Fields.Add("DIRECCION_PROCEDENCIA", DIRECCION_PROCEDENCIA)
			DIRECCION_PROCEDENCIA.DateFilter = ""
			DIRECCION_PROCEDENCIA.SqlSelect = ""
			DIRECCION_PROCEDENCIA.SqlOrderBy = ""

			' CIUDAD PROCEDENCIA
			CIUDAD_PROCEDENCIA = new crField("PostulaciF3n_Online", "Postulación Online", "x_CIUDAD_PROCEDENCIA", "CIUDAD PROCEDENCIA", "[CIUDAD PROCEDENCIA]", 200, EWRPT_DATATYPE_STRING, -1)
			CIUDAD_PROCEDENCIA.Page = APage
			CIUDAD_PROCEDENCIA.ParentPage = APage.ParentPage
			Fields.Add("CIUDAD_PROCEDENCIA", CIUDAD_PROCEDENCIA)
			CIUDAD_PROCEDENCIA.DateFilter = ""
			CIUDAD_PROCEDENCIA.SqlSelect = ""
			CIUDAD_PROCEDENCIA.SqlOrderBy = ""

			' COMUNA
			COMUNA = new crField("PostulaciF3n_Online", "Postulación Online", "x_COMUNA", "COMUNA", "[COMUNA]", 200, EWRPT_DATATYPE_STRING, -1)
			COMUNA.Page = APage
			COMUNA.ParentPage = APage.ParentPage
			Fields.Add("COMUNA", COMUNA)
			COMUNA.DateFilter = ""
			COMUNA.SqlSelect = ""
			COMUNA.SqlOrderBy = ""

			' DIRECCION ACTUAL
			DIRECCION_ACTUAL = new crField("PostulaciF3n_Online", "Postulación Online", "x_DIRECCION_ACTUAL", "DIRECCION ACTUAL", "[DIRECCION ACTUAL]", 200, EWRPT_DATATYPE_STRING, -1)
			DIRECCION_ACTUAL.Page = APage
			DIRECCION_ACTUAL.ParentPage = APage.ParentPage
			Fields.Add("DIRECCION_ACTUAL", DIRECCION_ACTUAL)
			DIRECCION_ACTUAL.DateFilter = ""
			DIRECCION_ACTUAL.SqlSelect = ""
			DIRECCION_ACTUAL.SqlOrderBy = ""

			' CIUDAD ACTUAL
			CIUDAD_ACTUAL = new crField("PostulaciF3n_Online", "Postulación Online", "x_CIUDAD_ACTUAL", "CIUDAD ACTUAL", "[CIUDAD ACTUAL]", 200, EWRPT_DATATYPE_STRING, -1)
			CIUDAD_ACTUAL.Page = APage
			CIUDAD_ACTUAL.ParentPage = APage.ParentPage
			Fields.Add("CIUDAD_ACTUAL", CIUDAD_ACTUAL)
			CIUDAD_ACTUAL.DateFilter = ""
			CIUDAD_ACTUAL.SqlSelect = ""
			CIUDAD_ACTUAL.SqlOrderBy = ""

			' COMUNA ACTUAL
			COMUNA_ACTUAL = new crField("PostulaciF3n_Online", "Postulación Online", "x_COMUNA_ACTUAL", "COMUNA ACTUAL", "[COMUNA ACTUAL]", 200, EWRPT_DATATYPE_STRING, -1)
			COMUNA_ACTUAL.Page = APage
			COMUNA_ACTUAL.ParentPage = APage.ParentPage
			Fields.Add("COMUNA_ACTUAL", COMUNA_ACTUAL)
			COMUNA_ACTUAL.DateFilter = ""
			COMUNA_ACTUAL.SqlSelect = ""
			COMUNA_ACTUAL.SqlOrderBy = ""

			' REGIONACTUAL
			REGIONACTUAL = new crField("PostulaciF3n_Online", "Postulación Online", "x_REGIONACTUAL", "REGIONACTUAL", "[REGIONACTUAL]", 200, EWRPT_DATATYPE_STRING, -1)
			REGIONACTUAL.Page = APage
			REGIONACTUAL.ParentPage = APage.ParentPage
			Fields.Add("REGIONACTUAL", REGIONACTUAL)
			REGIONACTUAL.DateFilter = ""
			REGIONACTUAL.SqlSelect = ""
			REGIONACTUAL.SqlOrderBy = ""

			' ESTADO CIVIL
			ESTADO_CIVIL = new crField("PostulaciF3n_Online", "Postulación Online", "x_ESTADO_CIVIL", "ESTADO CIVIL", "[ESTADO CIVIL]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTADO_CIVIL.Page = APage
			ESTADO_CIVIL.ParentPage = APage.ParentPage
			Fields.Add("ESTADO_CIVIL", ESTADO_CIVIL)
			ESTADO_CIVIL.DateFilter = ""
			ESTADO_CIVIL.SqlSelect = ""
			ESTADO_CIVIL.SqlOrderBy = ""

			' FECHA NACIMIENTO
			FECHA_NACIMIENTO = new crField("PostulaciF3n_Online", "Postulación Online", "x_FECHA_NACIMIENTO", "FECHA NACIMIENTO", "[FECHA NACIMIENTO]", 135, EWRPT_DATATYPE_DATE, 7)
			FECHA_NACIMIENTO.Page = APage
			FECHA_NACIMIENTO.ParentPage = APage.ParentPage
			FECHA_NACIMIENTO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECHA_NACIMIENTO", FECHA_NACIMIENTO)
			FECHA_NACIMIENTO.DateFilter = ""
			FECHA_NACIMIENTO.SqlSelect = ""
			FECHA_NACIMIENTO.SqlOrderBy = ""

			' GENERO
			GENERO = new crField("PostulaciF3n_Online", "Postulación Online", "x_GENERO", "GENERO", "[GENERO]", 200, EWRPT_DATATYPE_STRING, -1)
			GENERO.Page = APage
			GENERO.ParentPage = APage.ParentPage
			Fields.Add("GENERO", GENERO)
			GENERO.DateFilter = ""
			GENERO.SqlSelect = ""
			GENERO.SqlOrderBy = ""

			' TRABAJA
			TRABAJA = new crField("PostulaciF3n_Online", "Postulación Online", "x_TRABAJA", "TRABAJA", "[TRABAJA]", 200, EWRPT_DATATYPE_STRING, -1)
			TRABAJA.Page = APage
			TRABAJA.ParentPage = APage.ParentPage
			Fields.Add("TRABAJA", TRABAJA)
			TRABAJA.DateFilter = ""
			TRABAJA.SqlSelect = ""
			TRABAJA.SqlOrderBy = ""

			' TIPO TRABAJO
			TIPO_TRABAJO = new crField("PostulaciF3n_Online", "Postulación Online", "x_TIPO_TRABAJO", "TIPO TRABAJO", "[TIPO TRABAJO]", 200, EWRPT_DATATYPE_STRING, -1)
			TIPO_TRABAJO.Page = APage
			TIPO_TRABAJO.ParentPage = APage.ParentPage
			Fields.Add("TIPO_TRABAJO", TIPO_TRABAJO)
			TIPO_TRABAJO.DateFilter = ""
			TIPO_TRABAJO.SqlSelect = ""
			TIPO_TRABAJO.SqlOrderBy = ""

			' EMPRESA
			EMPRESA = new crField("PostulaciF3n_Online", "Postulación Online", "x_EMPRESA", "EMPRESA", "[EMPRESA]", 200, EWRPT_DATATYPE_STRING, -1)
			EMPRESA.Page = APage
			EMPRESA.ParentPage = APage.ParentPage
			Fields.Add("EMPRESA", EMPRESA)
			EMPRESA.DateFilter = ""
			EMPRESA.SqlSelect = ""
			EMPRESA.SqlOrderBy = ""

			' ACTIVIDAD
			ACTIVIDAD = new crField("PostulaciF3n_Online", "Postulación Online", "x_ACTIVIDAD", "ACTIVIDAD", "[ACTIVIDAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ACTIVIDAD.Page = APage
			ACTIVIDAD.ParentPage = APage.ParentPage
			Fields.Add("ACTIVIDAD", ACTIVIDAD)
			ACTIVIDAD.DateFilter = ""
			ACTIVIDAD.SqlSelect = ""
			ACTIVIDAD.SqlOrderBy = ""

			' DIRECCION EMPRESA
			DIRECCION_EMPRESA = new crField("PostulaciF3n_Online", "Postulación Online", "x_DIRECCION_EMPRESA", "DIRECCION EMPRESA", "[DIRECCION EMPRESA]", 200, EWRPT_DATATYPE_STRING, -1)
			DIRECCION_EMPRESA.Page = APage
			DIRECCION_EMPRESA.ParentPage = APage.ParentPage
			Fields.Add("DIRECCION_EMPRESA", DIRECCION_EMPRESA)
			DIRECCION_EMPRESA.DateFilter = ""
			DIRECCION_EMPRESA.SqlSelect = ""
			DIRECCION_EMPRESA.SqlOrderBy = ""

			' SOSTENEDOR
			SOSTENEDOR = new crField("PostulaciF3n_Online", "Postulación Online", "x_SOSTENEDOR", "SOSTENEDOR", "[SOSTENEDOR]", 200, EWRPT_DATATYPE_STRING, -1)
			SOSTENEDOR.Page = APage
			SOSTENEDOR.ParentPage = APage.ParentPage
			Fields.Add("SOSTENEDOR", SOSTENEDOR)
			SOSTENEDOR.DateFilter = ""
			SOSTENEDOR.SqlSelect = ""
			SOSTENEDOR.SqlOrderBy = ""

			' NivelEducativoAlumno
			NivelEducativoAlumno = new crField("PostulaciF3n_Online", "Postulación Online", "x_NivelEducativoAlumno", "NivelEducativoAlumno", "[NivelEducativoAlumno]", 200, EWRPT_DATATYPE_STRING, -1)
			NivelEducativoAlumno.Page = APage
			NivelEducativoAlumno.ParentPage = APage.ParentPage
			Fields.Add("NivelEducativoAlumno", NivelEducativoAlumno)
			NivelEducativoAlumno.DateFilter = ""
			NivelEducativoAlumno.SqlSelect = ""
			NivelEducativoAlumno.SqlOrderBy = ""

			' COLEGIO
			COLEGIO = new crField("PostulaciF3n_Online", "Postulación Online", "x_COLEGIO", "COLEGIO", "[COLEGIO]", 200, EWRPT_DATATYPE_STRING, -1)
			COLEGIO.Page = APage
			COLEGIO.ParentPage = APage.ParentPage
			Fields.Add("COLEGIO", COLEGIO)
			COLEGIO.DateFilter = ""
			COLEGIO.SqlSelect = ""
			COLEGIO.SqlOrderBy = ""

			' AÑO EGRESO COLEGIO
			AD1O_EGRESO_COLEGIO = new crField("PostulaciF3n_Online", "Postulación Online", "x_AD1O_EGRESO_COLEGIO", "AÑO EGRESO COLEGIO", "[AÑO EGRESO COLEGIO]", 3, EWRPT_DATATYPE_NUMBER, -1)
			AD1O_EGRESO_COLEGIO.Page = APage
			AD1O_EGRESO_COLEGIO.ParentPage = APage.ParentPage
			AD1O_EGRESO_COLEGIO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("AD1O_EGRESO_COLEGIO", AD1O_EGRESO_COLEGIO)
			AD1O_EGRESO_COLEGIO.DateFilter = ""
			AD1O_EGRESO_COLEGIO.SqlSelect = ""
			AD1O_EGRESO_COLEGIO.SqlOrderBy = ""

			' CONVALIDA
			CONVALIDA = new crField("PostulaciF3n_Online", "Postulación Online", "x_CONVALIDA", "CONVALIDA", "[CONVALIDA]", 200, EWRPT_DATATYPE_STRING, -1)
			CONVALIDA.Page = APage
			CONVALIDA.ParentPage = APage.ParentPage
			Fields.Add("CONVALIDA", CONVALIDA)
			CONVALIDA.DateFilter = ""
			CONVALIDA.SqlSelect = ""
			CONVALIDA.SqlOrderBy = ""

			' AÑO PSU
			AD1O_PSU = new crField("PostulaciF3n_Online", "Postulación Online", "x_AD1O_PSU", "AÑO PSU", "[AÑO PSU]", 3, EWRPT_DATATYPE_NUMBER, -1)
			AD1O_PSU.Page = APage
			AD1O_PSU.ParentPage = APage.ParentPage
			AD1O_PSU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("AD1O_PSU", AD1O_PSU)
			AD1O_PSU.DateFilter = ""
			AD1O_PSU.SqlSelect = ""
			AD1O_PSU.SqlOrderBy = ""

			' PROMEDIO ENSEÑANZA MEDIA
			PROMEDIO_ENSED1ANZA_MEDIA = new crField("PostulaciF3n_Online", "Postulación Online", "x_PROMEDIO_ENSED1ANZA_MEDIA", "PROMEDIO ENSEÑANZA MEDIA", "[PROMEDIO ENSEÑANZA MEDIA]", 200, EWRPT_DATATYPE_STRING, -1)
			PROMEDIO_ENSED1ANZA_MEDIA.Page = APage
			PROMEDIO_ENSED1ANZA_MEDIA.ParentPage = APage.ParentPage
			Fields.Add("PROMEDIO_ENSED1ANZA_MEDIA", PROMEDIO_ENSED1ANZA_MEDIA)
			PROMEDIO_ENSED1ANZA_MEDIA.DateFilter = ""
			PROMEDIO_ENSED1ANZA_MEDIA.SqlSelect = ""
			PROMEDIO_ENSED1ANZA_MEDIA.SqlOrderBy = ""

			' TIPO PRUEBA
			TIPO_PRUEBA = new crField("PostulaciF3n_Online", "Postulación Online", "x_TIPO_PRUEBA", "TIPO PRUEBA", "[TIPO PRUEBA]", 200, EWRPT_DATATYPE_STRING, -1)
			TIPO_PRUEBA.Page = APage
			TIPO_PRUEBA.ParentPage = APage.ParentPage
			Fields.Add("TIPO_PRUEBA", TIPO_PRUEBA)
			TIPO_PRUEBA.DateFilter = ""
			TIPO_PRUEBA.SqlSelect = ""
			TIPO_PRUEBA.SqlOrderBy = ""

			' PUNTAJE PSU MATEMATICAS
			PUNTAJE_PSU_MATEMATICAS = new crField("PostulaciF3n_Online", "Postulación Online", "x_PUNTAJE_PSU_MATEMATICAS", "PUNTAJE PSU MATEMATICAS", "[PUNTAJE PSU MATEMATICAS]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PUNTAJE_PSU_MATEMATICAS.Page = APage
			PUNTAJE_PSU_MATEMATICAS.ParentPage = APage.ParentPage
			PUNTAJE_PSU_MATEMATICAS.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PUNTAJE_PSU_MATEMATICAS", PUNTAJE_PSU_MATEMATICAS)
			PUNTAJE_PSU_MATEMATICAS.DateFilter = ""
			PUNTAJE_PSU_MATEMATICAS.SqlSelect = ""
			PUNTAJE_PSU_MATEMATICAS.SqlOrderBy = ""

			' PUNTAJE PSU LENGUAJE
			PUNTAJE_PSU_LENGUAJE = new crField("PostulaciF3n_Online", "Postulación Online", "x_PUNTAJE_PSU_LENGUAJE", "PUNTAJE PSU LENGUAJE", "[PUNTAJE PSU LENGUAJE]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PUNTAJE_PSU_LENGUAJE.Page = APage
			PUNTAJE_PSU_LENGUAJE.ParentPage = APage.ParentPage
			PUNTAJE_PSU_LENGUAJE.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PUNTAJE_PSU_LENGUAJE", PUNTAJE_PSU_LENGUAJE)
			PUNTAJE_PSU_LENGUAJE.DateFilter = ""
			PUNTAJE_PSU_LENGUAJE.SqlSelect = ""
			PUNTAJE_PSU_LENGUAJE.SqlOrderBy = ""

			' PROMEDIO PSU
			PROMEDIO_PSU = new crField("PostulaciF3n_Online", "Postulación Online", "x_PROMEDIO_PSU", "PROMEDIO PSU", "[PROMEDIO PSU]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PROMEDIO_PSU.Page = APage
			PROMEDIO_PSU.ParentPage = APage.ParentPage
			PROMEDIO_PSU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PROMEDIO_PSU", PROMEDIO_PSU)
			PROMEDIO_PSU.DateFilter = ""
			PROMEDIO_PSU.SqlSelect = ""
			PROMEDIO_PSU.SqlOrderBy = ""

			' PUNTAJE PAA MATEMATICAS
			PUNTAJE_PAA_MATEMATICAS = new crField("PostulaciF3n_Online", "Postulación Online", "x_PUNTAJE_PAA_MATEMATICAS", "PUNTAJE PAA MATEMATICAS", "[PUNTAJE PAA MATEMATICAS]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PUNTAJE_PAA_MATEMATICAS.Page = APage
			PUNTAJE_PAA_MATEMATICAS.ParentPage = APage.ParentPage
			PUNTAJE_PAA_MATEMATICAS.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PUNTAJE_PAA_MATEMATICAS", PUNTAJE_PAA_MATEMATICAS)
			PUNTAJE_PAA_MATEMATICAS.DateFilter = ""
			PUNTAJE_PAA_MATEMATICAS.SqlSelect = ""
			PUNTAJE_PAA_MATEMATICAS.SqlOrderBy = ""

			' PUNTAJE PAA LENGUAJE
			PUNTAJE_PAA_LENGUAJE = new crField("PostulaciF3n_Online", "Postulación Online", "x_PUNTAJE_PAA_LENGUAJE", "PUNTAJE PAA LENGUAJE", "[PUNTAJE PAA LENGUAJE]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PUNTAJE_PAA_LENGUAJE.Page = APage
			PUNTAJE_PAA_LENGUAJE.ParentPage = APage.ParentPage
			PUNTAJE_PAA_LENGUAJE.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PUNTAJE_PAA_LENGUAJE", PUNTAJE_PAA_LENGUAJE)
			PUNTAJE_PAA_LENGUAJE.DateFilter = ""
			PUNTAJE_PAA_LENGUAJE.SqlSelect = ""
			PUNTAJE_PAA_LENGUAJE.SqlOrderBy = ""

			' PROMEDIO PAA
			PROMEDIO_PAA = new crField("PostulaciF3n_Online", "Postulación Online", "x_PROMEDIO_PAA", "PROMEDIO PAA", "[PROMEDIO PAA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PROMEDIO_PAA.Page = APage
			PROMEDIO_PAA.ParentPage = APage.ParentPage
			PROMEDIO_PAA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PROMEDIO_PAA", PROMEDIO_PAA)
			PROMEDIO_PAA.DateFilter = ""
			PROMEDIO_PAA.SqlSelect = ""
			PROMEDIO_PAA.SqlOrderBy = ""

			' NUMERO INTEGRANTES
			NUMERO_INTEGRANTES = new crField("PostulaciF3n_Online", "Postulación Online", "x_NUMERO_INTEGRANTES", "NUMERO INTEGRANTES", "[NUMERO INTEGRANTES]", 3, EWRPT_DATATYPE_NUMBER, -1)
			NUMERO_INTEGRANTES.Page = APage
			NUMERO_INTEGRANTES.ParentPage = APage.ParentPage
			NUMERO_INTEGRANTES.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("NUMERO_INTEGRANTES", NUMERO_INTEGRANTES)
			NUMERO_INTEGRANTES.DateFilter = ""
			NUMERO_INTEGRANTES.SqlSelect = ""
			NUMERO_INTEGRANTES.SqlOrderBy = ""

			' TIENE HIJOS
			TIENE_HIJOS = new crField("PostulaciF3n_Online", "Postulación Online", "x_TIENE_HIJOS", "TIENE HIJOS", "[TIENE HIJOS]", 3, EWRPT_DATATYPE_NUMBER, -1)
			TIENE_HIJOS.Page = APage
			TIENE_HIJOS.ParentPage = APage.ParentPage
			TIENE_HIJOS.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("TIENE_HIJOS", TIENE_HIJOS)
			TIENE_HIJOS.DateFilter = ""
			TIENE_HIJOS.SqlSelect = ""
			TIENE_HIJOS.SqlOrderBy = ""

			' OCUPACIONMadre
			OCUPACIONMadre = new crField("PostulaciF3n_Online", "Postulación Online", "x_OCUPACIONMadre", "OCUPACIONMadre", "[OCUPACIONMadre]", 200, EWRPT_DATATYPE_STRING, -1)
			OCUPACIONMadre.Page = APage
			OCUPACIONMadre.ParentPage = APage.ParentPage
			Fields.Add("OCUPACIONMadre", OCUPACIONMadre)
			OCUPACIONMadre.DateFilter = ""
			OCUPACIONMadre.SqlSelect = ""
			OCUPACIONMadre.SqlOrderBy = ""

			' EstudiosMadre
			EstudiosMadre = new crField("PostulaciF3n_Online", "Postulación Online", "x_EstudiosMadre", "EstudiosMadre", "[EstudiosMadre]", 200, EWRPT_DATATYPE_STRING, -1)
			EstudiosMadre.Page = APage
			EstudiosMadre.ParentPage = APage.ParentPage
			Fields.Add("EstudiosMadre", EstudiosMadre)
			EstudiosMadre.DateFilter = ""
			EstudiosMadre.SqlSelect = ""
			EstudiosMadre.SqlOrderBy = ""

			' OcupacionPadre
			OcupacionPadre = new crField("PostulaciF3n_Online", "Postulación Online", "x_OcupacionPadre", "OcupacionPadre", "[OcupacionPadre]", 200, EWRPT_DATATYPE_STRING, -1)
			OcupacionPadre.Page = APage
			OcupacionPadre.ParentPage = APage.ParentPage
			Fields.Add("OcupacionPadre", OcupacionPadre)
			OcupacionPadre.DateFilter = ""
			OcupacionPadre.SqlSelect = ""
			OcupacionPadre.SqlOrderBy = ""

			' EstudiosPadre
			EstudiosPadre = new crField("PostulaciF3n_Online", "Postulación Online", "x_EstudiosPadre", "EstudiosPadre", "[EstudiosPadre]", 200, EWRPT_DATATYPE_STRING, -1)
			EstudiosPadre.Page = APage
			EstudiosPadre.ParentPage = APage.ParentPage
			Fields.Add("EstudiosPadre", EstudiosPadre)
			EstudiosPadre.DateFilter = ""
			EstudiosPadre.SqlSelect = ""
			EstudiosPadre.SqlOrderBy = ""

			' ESTADO POSTULACION
			ESTADO_POSTULACION = new crField("PostulaciF3n_Online", "Postulación Online", "x_ESTADO_POSTULACION", "ESTADO POSTULACION", "[ESTADO POSTULACION]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTADO_POSTULACION.Page = APage
			ESTADO_POSTULACION.ParentPage = APage.ParentPage
			Fields.Add("ESTADO_POSTULACION", ESTADO_POSTULACION)
			ESTADO_POSTULACION.DateFilter = ""
			ESTADO_POSTULACION.SqlSelect = ""
			ESTADO_POSTULACION.SqlOrderBy = ""

			' FECHA ACTUALIZACION
			FECHA_ACTUALIZACION = new crField("PostulaciF3n_Online", "Postulación Online", "x_FECHA_ACTUALIZACION", "FECHA ACTUALIZACION", "[FECHA ACTUALIZACION]", 135, EWRPT_DATATYPE_DATE, 7)
			FECHA_ACTUALIZACION.Page = APage
			FECHA_ACTUALIZACION.ParentPage = APage.ParentPage
			FECHA_ACTUALIZACION.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECHA_ACTUALIZACION", FECHA_ACTUALIZACION)
			FECHA_ACTUALIZACION.DateFilter = ""
			FECHA_ACTUALIZACION.SqlSelect = ""
			FECHA_ACTUALIZACION.SqlOrderBy = ""

			' PASO
			PASO = new crField("PostulaciF3n_Online", "Postulación Online", "x_PASO", "PASO", "[PASO]", 200, EWRPT_DATATYPE_STRING, -1)
			PASO.Page = APage
			PASO.ParentPage = APage.ParentPage
			Fields.Add("PASO", PASO)
			PASO.DateFilter = ""
			PASO.SqlSelect = ""
			PASO.SqlOrderBy = ""
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
				Return "[SEK_VISTA_POSTULACION_ONLINE]"
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
	Public PostulaciF3n_Online_summary As crPostulaciF3n_Online_summary

	'
	' Page class
	'
	Public Class crPostulaciF3n_Online_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (PostulaciF3n_Online.UseTokenInUrl) Then
				sUrl &= "t=" & PostulaciF3n_Online.TableVar & "&" ' Add page token
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
			If (PostulaciF3n_Online.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(PostulaciF3n_Online.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(PostulaciF3n_Online.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As PostulaciF3n_Onlinesmry 
			Get
				Return CType(m_ParentPage, PostulaciF3n_Onlinesmry)
			End Get
		End Property

		' Table object (PostulaciF3n_Online)
		Public Property PostulaciF3n_Online As crPostulaciF3n_Online 
			Get		
				Return AspNetPage.PostulaciF3n_Online ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crPostulaciF3n_Online)
				AspNetPage.PostulaciF3n_Online = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_postulacion_online)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "PostulaciF3n_Online_summary"
			m_PageObjTypeName = "crPostulaciF3n_Online_summary"

			' Table name
			m_TableName = "Postulación Online"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (PostulaciF3n_Online)
			PostulaciF3n_Online = New crPostulaciF3n_Online(Me)			

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
				PostulaciF3n_Online.Export = ew_Get("export")
			End If
			gsExport = PostulaciF3n_Online.Export ' Get export parameter, used in header
			gsExportFile = PostulaciF3n_Online.TableVar ' Get export file, used in header
			If (PostulaciF3n_Online.Export = "excel") Then
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

		Public Val As Object() = New Object(56) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(56) {}

		Public GrandMn As Object() = New Object(56) {}

		Public GrandMx As Object() = New Object(56) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 57 ' No. of fields
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
			PostulaciF3n_Online.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(PostulaciF3n_Online.SqlSelect, PostulaciF3n_Online.SqlWhere, PostulaciF3n_Online.SqlGroupBy, PostulaciF3n_Online.SqlHaving, PostulaciF3n_Online.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (PostulaciF3n_Online.ExportAll AndAlso ew_NotEmpty(PostulaciF3n_Online.Export)) Then
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
				PostulaciF3n_Online.RUT.DbValue = Row("RUT")
				PostulaciF3n_Online.NOMBRE.DbValue = Row("NOMBRE")
				PostulaciF3n_Online.PATERNO.DbValue = Row("PATERNO")
				PostulaciF3n_Online.MATERNO.DbValue = Row("MATERNO")
				PostulaciF3n_Online.CARRERA.DbValue = Row("CARRERA")
				PostulaciF3n_Online.JORNADA.DbValue = Row("JORNADA")
				PostulaciF3n_Online.REGION_PROCEDENCIA.DbValue = Row("REGION PROCEDENCIA")
				PostulaciF3n_Online.MAIL.DbValue = Row("MAIL")
				PostulaciF3n_Online.PAIS_PROCEDENCIA.DbValue = Row("PAIS PROCEDENCIA")
				PostulaciF3n_Online.TRAMO_RENTA.DbValue = Row("TRAMO RENTA")
				PostulaciF3n_Online.CONVIVE.DbValue = Row("CONVIVE")
				PostulaciF3n_Online.INGRESO_FAMILIAR.DbValue = Row("INGRESO FAMILIAR")
				PostulaciF3n_Online.SALUD.DbValue = Row("SALUD")
				PostulaciF3n_Online.MOTIVO.DbValue = Row("MOTIVO")
				PostulaciF3n_Online.VIA.DbValue = Row("VIA")
				PostulaciF3n_Online.TELEFONO_PARTICULAR.DbValue = Row("TELEFONO PARTICULAR")
				PostulaciF3n_Online.TELEFONO_EMERGENCIA.DbValue = Row("TELEFONO EMERGENCIA")
				PostulaciF3n_Online.FECHA_POSTULACION.DbValue = Row("FECHA POSTULACION")
				PostulaciF3n_Online.DIRECCION_PROCEDENCIA.DbValue = Row("DIRECCION PROCEDENCIA")
				PostulaciF3n_Online.CIUDAD_PROCEDENCIA.DbValue = Row("CIUDAD PROCEDENCIA")
				PostulaciF3n_Online.COMUNA.DbValue = Row("COMUNA")
				PostulaciF3n_Online.DIRECCION_ACTUAL.DbValue = Row("DIRECCION ACTUAL")
				PostulaciF3n_Online.CIUDAD_ACTUAL.DbValue = Row("CIUDAD ACTUAL")
				PostulaciF3n_Online.COMUNA_ACTUAL.DbValue = Row("COMUNA ACTUAL")
				PostulaciF3n_Online.ESTADO_CIVIL.DbValue = Row("ESTADO CIVIL")
				PostulaciF3n_Online.FECHA_NACIMIENTO.DbValue = Row("FECHA NACIMIENTO")
				PostulaciF3n_Online.GENERO.DbValue = Row("GENERO")
				PostulaciF3n_Online.TRABAJA.DbValue = Row("TRABAJA")
				PostulaciF3n_Online.TIPO_TRABAJO.DbValue = Row("TIPO TRABAJO")
				PostulaciF3n_Online.EMPRESA.DbValue = Row("EMPRESA")
				PostulaciF3n_Online.ACTIVIDAD.DbValue = Row("ACTIVIDAD")
				PostulaciF3n_Online.DIRECCION_EMPRESA.DbValue = Row("DIRECCION EMPRESA")
				PostulaciF3n_Online.SOSTENEDOR.DbValue = Row("SOSTENEDOR")
				PostulaciF3n_Online.COLEGIO.DbValue = Row("COLEGIO")
				PostulaciF3n_Online.CONVALIDA.DbValue = Row("CONVALIDA")
				PostulaciF3n_Online.AD1O_PSU.DbValue = Row("AÑO PSU")
				PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.DbValue = Row("PROMEDIO ENSEÑANZA MEDIA")
				PostulaciF3n_Online.TIPO_PRUEBA.DbValue = Row("TIPO PRUEBA")
				PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.DbValue = Row("PUNTAJE PSU MATEMATICAS")
				PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.DbValue = Row("PUNTAJE PSU LENGUAJE")
				PostulaciF3n_Online.PROMEDIO_PSU.DbValue = Row("PROMEDIO PSU")
				PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.DbValue = Row("PUNTAJE PAA MATEMATICAS")
				PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.DbValue = Row("PUNTAJE PAA LENGUAJE")
				PostulaciF3n_Online.PROMEDIO_PAA.DbValue = Row("PROMEDIO PAA")
				PostulaciF3n_Online.NUMERO_INTEGRANTES.DbValue = Row("NUMERO INTEGRANTES")
				PostulaciF3n_Online.TIENE_HIJOS.DbValue = Row("TIENE HIJOS")
				PostulaciF3n_Online.ESTADO_POSTULACION.DbValue = Row("ESTADO POSTULACION")
				PostulaciF3n_Online.FECHA_ACTUALIZACION.DbValue = Row("FECHA ACTUALIZACION")
				PostulaciF3n_Online.PASO.DbValue = Row("PASO")
				PostulaciF3n_Online.NivelEducativoAlumno.DbValue = Row("NivelEducativoAlumno")
				PostulaciF3n_Online.OCUPACIONMadre.DbValue = Row("OCUPACIONMadre")
				PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.DbValue = Row("AÑO EGRESO COLEGIO")
				PostulaciF3n_Online.REGIONACTUAL.DbValue = Row("REGIONACTUAL")
				PostulaciF3n_Online.EstudiosPadre.DbValue = Row("EstudiosPadre")
				PostulaciF3n_Online.EstudiosMadre.DbValue = Row("EstudiosMadre")
				PostulaciF3n_Online.OcupacionPadre.DbValue = Row("OcupacionPadre")
				Val(1) = PostulaciF3n_Online.RUT.CurrentValue
				Val(2) = PostulaciF3n_Online.NOMBRE.CurrentValue
				Val(3) = PostulaciF3n_Online.PATERNO.CurrentValue
				Val(4) = PostulaciF3n_Online.MATERNO.CurrentValue
				Val(5) = PostulaciF3n_Online.CARRERA.CurrentValue
				Val(6) = PostulaciF3n_Online.JORNADA.CurrentValue
				Val(7) = PostulaciF3n_Online.REGION_PROCEDENCIA.CurrentValue
				Val(8) = PostulaciF3n_Online.MAIL.CurrentValue
				Val(9) = PostulaciF3n_Online.PAIS_PROCEDENCIA.CurrentValue
				Val(10) = PostulaciF3n_Online.TRAMO_RENTA.CurrentValue
				Val(11) = PostulaciF3n_Online.CONVIVE.CurrentValue
				Val(12) = PostulaciF3n_Online.INGRESO_FAMILIAR.CurrentValue
				Val(13) = PostulaciF3n_Online.SALUD.CurrentValue
				Val(14) = PostulaciF3n_Online.MOTIVO.CurrentValue
				Val(15) = PostulaciF3n_Online.VIA.CurrentValue
				Val(16) = PostulaciF3n_Online.TELEFONO_PARTICULAR.CurrentValue
				Val(17) = PostulaciF3n_Online.TELEFONO_EMERGENCIA.CurrentValue
				Val(18) = PostulaciF3n_Online.FECHA_POSTULACION.CurrentValue
				Val(19) = PostulaciF3n_Online.DIRECCION_PROCEDENCIA.CurrentValue
				Val(20) = PostulaciF3n_Online.CIUDAD_PROCEDENCIA.CurrentValue
				Val(21) = PostulaciF3n_Online.COMUNA.CurrentValue
				Val(22) = PostulaciF3n_Online.DIRECCION_ACTUAL.CurrentValue
				Val(23) = PostulaciF3n_Online.CIUDAD_ACTUAL.CurrentValue
				Val(24) = PostulaciF3n_Online.COMUNA_ACTUAL.CurrentValue
				Val(25) = PostulaciF3n_Online.REGIONACTUAL.CurrentValue
				Val(26) = PostulaciF3n_Online.ESTADO_CIVIL.CurrentValue
				Val(27) = PostulaciF3n_Online.FECHA_NACIMIENTO.CurrentValue
				Val(28) = PostulaciF3n_Online.GENERO.CurrentValue
				Val(29) = PostulaciF3n_Online.TRABAJA.CurrentValue
				Val(30) = PostulaciF3n_Online.TIPO_TRABAJO.CurrentValue
				Val(31) = PostulaciF3n_Online.EMPRESA.CurrentValue
				Val(32) = PostulaciF3n_Online.ACTIVIDAD.CurrentValue
				Val(33) = PostulaciF3n_Online.DIRECCION_EMPRESA.CurrentValue
				Val(34) = PostulaciF3n_Online.SOSTENEDOR.CurrentValue
				Val(35) = PostulaciF3n_Online.NivelEducativoAlumno.CurrentValue
				Val(36) = PostulaciF3n_Online.COLEGIO.CurrentValue
				Val(37) = PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.CurrentValue
				Val(38) = PostulaciF3n_Online.CONVALIDA.CurrentValue
				Val(39) = PostulaciF3n_Online.AD1O_PSU.CurrentValue
				Val(40) = PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.CurrentValue
				Val(41) = PostulaciF3n_Online.TIPO_PRUEBA.CurrentValue
				Val(42) = PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.CurrentValue
				Val(43) = PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.CurrentValue
				Val(44) = PostulaciF3n_Online.PROMEDIO_PSU.CurrentValue
				Val(45) = PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.CurrentValue
				Val(46) = PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.CurrentValue
				Val(47) = PostulaciF3n_Online.PROMEDIO_PAA.CurrentValue
				Val(48) = PostulaciF3n_Online.NUMERO_INTEGRANTES.CurrentValue
				Val(49) = PostulaciF3n_Online.TIENE_HIJOS.CurrentValue
				Val(50) = PostulaciF3n_Online.OCUPACIONMadre.CurrentValue
				Val(51) = PostulaciF3n_Online.EstudiosMadre.CurrentValue
				Val(52) = PostulaciF3n_Online.OcupacionPadre.CurrentValue
				Val(53) = PostulaciF3n_Online.EstudiosPadre.CurrentValue
				Val(54) = PostulaciF3n_Online.ESTADO_POSTULACION.CurrentValue
				Val(55) = PostulaciF3n_Online.FECHA_ACTUALIZACION.CurrentValue
				Val(56) = PostulaciF3n_Online.PASO.CurrentValue
			Else
				PostulaciF3n_Online.RUT.DbValue = ""
				PostulaciF3n_Online.NOMBRE.DbValue = ""
				PostulaciF3n_Online.PATERNO.DbValue = ""
				PostulaciF3n_Online.MATERNO.DbValue = ""
				PostulaciF3n_Online.CARRERA.DbValue = ""
				PostulaciF3n_Online.JORNADA.DbValue = ""
				PostulaciF3n_Online.REGION_PROCEDENCIA.DbValue = ""
				PostulaciF3n_Online.MAIL.DbValue = ""
				PostulaciF3n_Online.PAIS_PROCEDENCIA.DbValue = ""
				PostulaciF3n_Online.TRAMO_RENTA.DbValue = ""
				PostulaciF3n_Online.CONVIVE.DbValue = ""
				PostulaciF3n_Online.INGRESO_FAMILIAR.DbValue = ""
				PostulaciF3n_Online.SALUD.DbValue = ""
				PostulaciF3n_Online.MOTIVO.DbValue = ""
				PostulaciF3n_Online.VIA.DbValue = ""
				PostulaciF3n_Online.TELEFONO_PARTICULAR.DbValue = ""
				PostulaciF3n_Online.TELEFONO_EMERGENCIA.DbValue = ""
				PostulaciF3n_Online.FECHA_POSTULACION.DbValue = ""
				PostulaciF3n_Online.DIRECCION_PROCEDENCIA.DbValue = ""
				PostulaciF3n_Online.CIUDAD_PROCEDENCIA.DbValue = ""
				PostulaciF3n_Online.COMUNA.DbValue = ""
				PostulaciF3n_Online.DIRECCION_ACTUAL.DbValue = ""
				PostulaciF3n_Online.CIUDAD_ACTUAL.DbValue = ""
				PostulaciF3n_Online.COMUNA_ACTUAL.DbValue = ""
				PostulaciF3n_Online.ESTADO_CIVIL.DbValue = ""
				PostulaciF3n_Online.FECHA_NACIMIENTO.DbValue = ""
				PostulaciF3n_Online.GENERO.DbValue = ""
				PostulaciF3n_Online.TRABAJA.DbValue = ""
				PostulaciF3n_Online.TIPO_TRABAJO.DbValue = ""
				PostulaciF3n_Online.EMPRESA.DbValue = ""
				PostulaciF3n_Online.ACTIVIDAD.DbValue = ""
				PostulaciF3n_Online.DIRECCION_EMPRESA.DbValue = ""
				PostulaciF3n_Online.SOSTENEDOR.DbValue = ""
				PostulaciF3n_Online.COLEGIO.DbValue = ""
				PostulaciF3n_Online.CONVALIDA.DbValue = ""
				PostulaciF3n_Online.AD1O_PSU.DbValue = ""
				PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.DbValue = ""
				PostulaciF3n_Online.TIPO_PRUEBA.DbValue = ""
				PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.DbValue = ""
				PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.DbValue = ""
				PostulaciF3n_Online.PROMEDIO_PSU.DbValue = ""
				PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.DbValue = ""
				PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.DbValue = ""
				PostulaciF3n_Online.PROMEDIO_PAA.DbValue = ""
				PostulaciF3n_Online.NUMERO_INTEGRANTES.DbValue = ""
				PostulaciF3n_Online.TIENE_HIJOS.DbValue = ""
				PostulaciF3n_Online.ESTADO_POSTULACION.DbValue = ""
				PostulaciF3n_Online.FECHA_ACTUALIZACION.DbValue = ""
				PostulaciF3n_Online.PASO.DbValue = ""
				PostulaciF3n_Online.NivelEducativoAlumno.DbValue = ""
				PostulaciF3n_Online.OCUPACIONMadre.DbValue = ""
				PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.DbValue = ""
				PostulaciF3n_Online.REGIONACTUAL.DbValue = ""
				PostulaciF3n_Online.EstudiosPadre.DbValue = ""
				PostulaciF3n_Online.EstudiosMadre.DbValue = ""
				PostulaciF3n_Online.OcupacionPadre.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				PostulaciF3n_Online.RUT.DbValue = dr("RUT")
				PostulaciF3n_Online.NOMBRE.DbValue = dr("NOMBRE")
				PostulaciF3n_Online.PATERNO.DbValue = dr("PATERNO")
				PostulaciF3n_Online.MATERNO.DbValue = dr("MATERNO")
				PostulaciF3n_Online.CARRERA.DbValue = dr("CARRERA")
				PostulaciF3n_Online.JORNADA.DbValue = dr("JORNADA")
				PostulaciF3n_Online.REGION_PROCEDENCIA.DbValue = dr("REGION PROCEDENCIA")
				PostulaciF3n_Online.MAIL.DbValue = dr("MAIL")
				PostulaciF3n_Online.PAIS_PROCEDENCIA.DbValue = dr("PAIS PROCEDENCIA")
				PostulaciF3n_Online.TRAMO_RENTA.DbValue = dr("TRAMO RENTA")
				PostulaciF3n_Online.CONVIVE.DbValue = dr("CONVIVE")
				PostulaciF3n_Online.INGRESO_FAMILIAR.DbValue = dr("INGRESO FAMILIAR")
				PostulaciF3n_Online.SALUD.DbValue = dr("SALUD")
				PostulaciF3n_Online.MOTIVO.DbValue = dr("MOTIVO")
				PostulaciF3n_Online.VIA.DbValue = dr("VIA")
				PostulaciF3n_Online.TELEFONO_PARTICULAR.DbValue = dr("TELEFONO PARTICULAR")
				PostulaciF3n_Online.TELEFONO_EMERGENCIA.DbValue = dr("TELEFONO EMERGENCIA")
				PostulaciF3n_Online.FECHA_POSTULACION.DbValue = dr("FECHA POSTULACION")
				PostulaciF3n_Online.DIRECCION_PROCEDENCIA.DbValue = dr("DIRECCION PROCEDENCIA")
				PostulaciF3n_Online.CIUDAD_PROCEDENCIA.DbValue = dr("CIUDAD PROCEDENCIA")
				PostulaciF3n_Online.COMUNA.DbValue = dr("COMUNA")
				PostulaciF3n_Online.DIRECCION_ACTUAL.DbValue = dr("DIRECCION ACTUAL")
				PostulaciF3n_Online.CIUDAD_ACTUAL.DbValue = dr("CIUDAD ACTUAL")
				PostulaciF3n_Online.COMUNA_ACTUAL.DbValue = dr("COMUNA ACTUAL")
				PostulaciF3n_Online.ESTADO_CIVIL.DbValue = dr("ESTADO CIVIL")
				PostulaciF3n_Online.FECHA_NACIMIENTO.DbValue = dr("FECHA NACIMIENTO")
				PostulaciF3n_Online.GENERO.DbValue = dr("GENERO")
				PostulaciF3n_Online.TRABAJA.DbValue = dr("TRABAJA")
				PostulaciF3n_Online.TIPO_TRABAJO.DbValue = dr("TIPO TRABAJO")
				PostulaciF3n_Online.EMPRESA.DbValue = dr("EMPRESA")
				PostulaciF3n_Online.ACTIVIDAD.DbValue = dr("ACTIVIDAD")
				PostulaciF3n_Online.DIRECCION_EMPRESA.DbValue = dr("DIRECCION EMPRESA")
				PostulaciF3n_Online.SOSTENEDOR.DbValue = dr("SOSTENEDOR")
				PostulaciF3n_Online.COLEGIO.DbValue = dr("COLEGIO")
				PostulaciF3n_Online.CONVALIDA.DbValue = dr("CONVALIDA")
				PostulaciF3n_Online.AD1O_PSU.DbValue = dr("AÑO PSU")
				PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.DbValue = dr("PROMEDIO ENSEÑANZA MEDIA")
				PostulaciF3n_Online.TIPO_PRUEBA.DbValue = dr("TIPO PRUEBA")
				PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.DbValue = dr("PUNTAJE PSU MATEMATICAS")
				PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.DbValue = dr("PUNTAJE PSU LENGUAJE")
				PostulaciF3n_Online.PROMEDIO_PSU.DbValue = dr("PROMEDIO PSU")
				PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.DbValue = dr("PUNTAJE PAA MATEMATICAS")
				PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.DbValue = dr("PUNTAJE PAA LENGUAJE")
				PostulaciF3n_Online.PROMEDIO_PAA.DbValue = dr("PROMEDIO PAA")
				PostulaciF3n_Online.NUMERO_INTEGRANTES.DbValue = dr("NUMERO INTEGRANTES")
				PostulaciF3n_Online.TIENE_HIJOS.DbValue = dr("TIENE HIJOS")
				PostulaciF3n_Online.ESTADO_POSTULACION.DbValue = dr("ESTADO POSTULACION")
				PostulaciF3n_Online.FECHA_ACTUALIZACION.DbValue = dr("FECHA ACTUALIZACION")
				PostulaciF3n_Online.PASO.DbValue = dr("PASO")
				PostulaciF3n_Online.NivelEducativoAlumno.DbValue = dr("NivelEducativoAlumno")
				PostulaciF3n_Online.OCUPACIONMadre.DbValue = dr("OCUPACIONMadre")
				PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.DbValue = dr("AÑO EGRESO COLEGIO")
				PostulaciF3n_Online.REGIONACTUAL.DbValue = dr("REGIONACTUAL")
				PostulaciF3n_Online.EstudiosPadre.DbValue = dr("EstudiosPadre")
				PostulaciF3n_Online.EstudiosMadre.DbValue = dr("EstudiosMadre")
				PostulaciF3n_Online.OcupacionPadre.DbValue = dr("OcupacionPadre")
				Val(1) = PostulaciF3n_Online.RUT.CurrentValue
				Val(2) = PostulaciF3n_Online.NOMBRE.CurrentValue
				Val(3) = PostulaciF3n_Online.PATERNO.CurrentValue
				Val(4) = PostulaciF3n_Online.MATERNO.CurrentValue
				Val(5) = PostulaciF3n_Online.CARRERA.CurrentValue
				Val(6) = PostulaciF3n_Online.JORNADA.CurrentValue
				Val(7) = PostulaciF3n_Online.REGION_PROCEDENCIA.CurrentValue
				Val(8) = PostulaciF3n_Online.MAIL.CurrentValue
				Val(9) = PostulaciF3n_Online.PAIS_PROCEDENCIA.CurrentValue
				Val(10) = PostulaciF3n_Online.TRAMO_RENTA.CurrentValue
				Val(11) = PostulaciF3n_Online.CONVIVE.CurrentValue
				Val(12) = PostulaciF3n_Online.INGRESO_FAMILIAR.CurrentValue
				Val(13) = PostulaciF3n_Online.SALUD.CurrentValue
				Val(14) = PostulaciF3n_Online.MOTIVO.CurrentValue
				Val(15) = PostulaciF3n_Online.VIA.CurrentValue
				Val(16) = PostulaciF3n_Online.TELEFONO_PARTICULAR.CurrentValue
				Val(17) = PostulaciF3n_Online.TELEFONO_EMERGENCIA.CurrentValue
				Val(18) = PostulaciF3n_Online.FECHA_POSTULACION.CurrentValue
				Val(19) = PostulaciF3n_Online.DIRECCION_PROCEDENCIA.CurrentValue
				Val(20) = PostulaciF3n_Online.CIUDAD_PROCEDENCIA.CurrentValue
				Val(21) = PostulaciF3n_Online.COMUNA.CurrentValue
				Val(22) = PostulaciF3n_Online.DIRECCION_ACTUAL.CurrentValue
				Val(23) = PostulaciF3n_Online.CIUDAD_ACTUAL.CurrentValue
				Val(24) = PostulaciF3n_Online.COMUNA_ACTUAL.CurrentValue
				Val(25) = PostulaciF3n_Online.REGIONACTUAL.CurrentValue
				Val(26) = PostulaciF3n_Online.ESTADO_CIVIL.CurrentValue
				Val(27) = PostulaciF3n_Online.FECHA_NACIMIENTO.CurrentValue
				Val(28) = PostulaciF3n_Online.GENERO.CurrentValue
				Val(29) = PostulaciF3n_Online.TRABAJA.CurrentValue
				Val(30) = PostulaciF3n_Online.TIPO_TRABAJO.CurrentValue
				Val(31) = PostulaciF3n_Online.EMPRESA.CurrentValue
				Val(32) = PostulaciF3n_Online.ACTIVIDAD.CurrentValue
				Val(33) = PostulaciF3n_Online.DIRECCION_EMPRESA.CurrentValue
				Val(34) = PostulaciF3n_Online.SOSTENEDOR.CurrentValue
				Val(35) = PostulaciF3n_Online.NivelEducativoAlumno.CurrentValue
				Val(36) = PostulaciF3n_Online.COLEGIO.CurrentValue
				Val(37) = PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.CurrentValue
				Val(38) = PostulaciF3n_Online.CONVALIDA.CurrentValue
				Val(39) = PostulaciF3n_Online.AD1O_PSU.CurrentValue
				Val(40) = PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.CurrentValue
				Val(41) = PostulaciF3n_Online.TIPO_PRUEBA.CurrentValue
				Val(42) = PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.CurrentValue
				Val(43) = PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.CurrentValue
				Val(44) = PostulaciF3n_Online.PROMEDIO_PSU.CurrentValue
				Val(45) = PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.CurrentValue
				Val(46) = PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.CurrentValue
				Val(47) = PostulaciF3n_Online.PROMEDIO_PAA.CurrentValue
				Val(48) = PostulaciF3n_Online.NUMERO_INTEGRANTES.CurrentValue
				Val(49) = PostulaciF3n_Online.TIENE_HIJOS.CurrentValue
				Val(50) = PostulaciF3n_Online.OCUPACIONMadre.CurrentValue
				Val(51) = PostulaciF3n_Online.EstudiosMadre.CurrentValue
				Val(52) = PostulaciF3n_Online.OcupacionPadre.CurrentValue
				Val(53) = PostulaciF3n_Online.EstudiosPadre.CurrentValue
				Val(54) = PostulaciF3n_Online.ESTADO_POSTULACION.CurrentValue
				Val(55) = PostulaciF3n_Online.FECHA_ACTUALIZACION.CurrentValue
				Val(56) = PostulaciF3n_Online.PASO.CurrentValue
			Else				
				PostulaciF3n_Online.RUT.DbValue = ""
				PostulaciF3n_Online.NOMBRE.DbValue = ""
				PostulaciF3n_Online.PATERNO.DbValue = ""
				PostulaciF3n_Online.MATERNO.DbValue = ""
				PostulaciF3n_Online.CARRERA.DbValue = ""
				PostulaciF3n_Online.JORNADA.DbValue = ""
				PostulaciF3n_Online.REGION_PROCEDENCIA.DbValue = ""
				PostulaciF3n_Online.MAIL.DbValue = ""
				PostulaciF3n_Online.PAIS_PROCEDENCIA.DbValue = ""
				PostulaciF3n_Online.TRAMO_RENTA.DbValue = ""
				PostulaciF3n_Online.CONVIVE.DbValue = ""
				PostulaciF3n_Online.INGRESO_FAMILIAR.DbValue = ""
				PostulaciF3n_Online.SALUD.DbValue = ""
				PostulaciF3n_Online.MOTIVO.DbValue = ""
				PostulaciF3n_Online.VIA.DbValue = ""
				PostulaciF3n_Online.TELEFONO_PARTICULAR.DbValue = ""
				PostulaciF3n_Online.TELEFONO_EMERGENCIA.DbValue = ""
				PostulaciF3n_Online.FECHA_POSTULACION.DbValue = ""
				PostulaciF3n_Online.DIRECCION_PROCEDENCIA.DbValue = ""
				PostulaciF3n_Online.CIUDAD_PROCEDENCIA.DbValue = ""
				PostulaciF3n_Online.COMUNA.DbValue = ""
				PostulaciF3n_Online.DIRECCION_ACTUAL.DbValue = ""
				PostulaciF3n_Online.CIUDAD_ACTUAL.DbValue = ""
				PostulaciF3n_Online.COMUNA_ACTUAL.DbValue = ""
				PostulaciF3n_Online.ESTADO_CIVIL.DbValue = ""
				PostulaciF3n_Online.FECHA_NACIMIENTO.DbValue = ""
				PostulaciF3n_Online.GENERO.DbValue = ""
				PostulaciF3n_Online.TRABAJA.DbValue = ""
				PostulaciF3n_Online.TIPO_TRABAJO.DbValue = ""
				PostulaciF3n_Online.EMPRESA.DbValue = ""
				PostulaciF3n_Online.ACTIVIDAD.DbValue = ""
				PostulaciF3n_Online.DIRECCION_EMPRESA.DbValue = ""
				PostulaciF3n_Online.SOSTENEDOR.DbValue = ""
				PostulaciF3n_Online.COLEGIO.DbValue = ""
				PostulaciF3n_Online.CONVALIDA.DbValue = ""
				PostulaciF3n_Online.AD1O_PSU.DbValue = ""
				PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.DbValue = ""
				PostulaciF3n_Online.TIPO_PRUEBA.DbValue = ""
				PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.DbValue = ""
				PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.DbValue = ""
				PostulaciF3n_Online.PROMEDIO_PSU.DbValue = ""
				PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.DbValue = ""
				PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.DbValue = ""
				PostulaciF3n_Online.PROMEDIO_PAA.DbValue = ""
				PostulaciF3n_Online.NUMERO_INTEGRANTES.DbValue = ""
				PostulaciF3n_Online.TIENE_HIJOS.DbValue = ""
				PostulaciF3n_Online.ESTADO_POSTULACION.DbValue = ""
				PostulaciF3n_Online.FECHA_ACTUALIZACION.DbValue = ""
				PostulaciF3n_Online.PASO.DbValue = ""
				PostulaciF3n_Online.NivelEducativoAlumno.DbValue = ""
				PostulaciF3n_Online.OCUPACIONMadre.DbValue = ""
				PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.DbValue = ""
				PostulaciF3n_Online.REGIONACTUAL.DbValue = ""
				PostulaciF3n_Online.EstudiosPadre.DbValue = ""
				PostulaciF3n_Online.EstudiosMadre.DbValue = ""
				PostulaciF3n_Online.OcupacionPadre.DbValue = ""
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
				PostulaciF3n_Online.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					PostulaciF3n_Online.StartGroup = StartGrp
				Else
					StartGrp = PostulaciF3n_Online.StartGroup
				End If
			Else
				StartGrp = PostulaciF3n_Online.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				PostulaciF3n_Online.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				PostulaciF3n_Online.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				PostulaciF3n_Online.StartGroup = StartGrp
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
			PostulaciF3n_Online.StartGroup = StartGrp
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
				PostulaciF3n_Online.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				PostulaciF3n_Online.StartGroup = StartGrp
			Else				
				If (PostulaciF3n_Online.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(PostulaciF3n_Online.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (PostulaciF3n_Online.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(PostulaciF3n_Online.SqlSelectCount, PostulaciF3n_Online.SqlWhere, PostulaciF3n_Online.SqlGroupBy, PostulaciF3n_Online.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			PostulaciF3n_Online.Row_Rendering()

			'
			' Render view codes
			'

			If (PostulaciF3n_Online.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUT
				PostulaciF3n_Online.RUT.ViewValue = Convert.ToString(PostulaciF3n_Online.RUT.Summary)

				' NOMBRE
				PostulaciF3n_Online.NOMBRE.ViewValue = Convert.ToString(PostulaciF3n_Online.NOMBRE.Summary)

				' PATERNO
				PostulaciF3n_Online.PATERNO.ViewValue = Convert.ToString(PostulaciF3n_Online.PATERNO.Summary)

				' MATERNO
				PostulaciF3n_Online.MATERNO.ViewValue = Convert.ToString(PostulaciF3n_Online.MATERNO.Summary)

				' CARRERA
				PostulaciF3n_Online.CARRERA.ViewValue = Convert.ToString(PostulaciF3n_Online.CARRERA.Summary)

				' JORNADA
				PostulaciF3n_Online.JORNADA.ViewValue = Convert.ToString(PostulaciF3n_Online.JORNADA.Summary)

				' REGION PROCEDENCIA
				PostulaciF3n_Online.REGION_PROCEDENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.REGION_PROCEDENCIA.Summary)

				' MAIL
				PostulaciF3n_Online.MAIL.ViewValue = Convert.ToString(PostulaciF3n_Online.MAIL.Summary)

				' PAIS PROCEDENCIA
				PostulaciF3n_Online.PAIS_PROCEDENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.PAIS_PROCEDENCIA.Summary)

				' TRAMO RENTA
				PostulaciF3n_Online.TRAMO_RENTA.ViewValue = Convert.ToString(PostulaciF3n_Online.TRAMO_RENTA.Summary)

				' CONVIVE
				PostulaciF3n_Online.CONVIVE.ViewValue = Convert.ToString(PostulaciF3n_Online.CONVIVE.Summary)

				' INGRESO FAMILIAR
				PostulaciF3n_Online.INGRESO_FAMILIAR.ViewValue = Convert.ToString(PostulaciF3n_Online.INGRESO_FAMILIAR.Summary)

				' SALUD
				PostulaciF3n_Online.SALUD.ViewValue = Convert.ToString(PostulaciF3n_Online.SALUD.Summary)

				' MOTIVO
				PostulaciF3n_Online.MOTIVO.ViewValue = Convert.ToString(PostulaciF3n_Online.MOTIVO.Summary)

				' VIA
				PostulaciF3n_Online.VIA.ViewValue = Convert.ToString(PostulaciF3n_Online.VIA.Summary)

				' TELEFONO PARTICULAR
				PostulaciF3n_Online.TELEFONO_PARTICULAR.ViewValue = Convert.ToString(PostulaciF3n_Online.TELEFONO_PARTICULAR.Summary)

				' TELEFONO EMERGENCIA
				PostulaciF3n_Online.TELEFONO_EMERGENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.TELEFONO_EMERGENCIA.Summary)

				' FECHA POSTULACION
				PostulaciF3n_Online.FECHA_POSTULACION.ViewValue = Convert.ToString(PostulaciF3n_Online.FECHA_POSTULACION.Summary)
				PostulaciF3n_Online.FECHA_POSTULACION.ViewValue = ew_FormatDateTime(PostulaciF3n_Online.FECHA_POSTULACION.ViewValue, 7)

				' DIRECCION PROCEDENCIA
				PostulaciF3n_Online.DIRECCION_PROCEDENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.DIRECCION_PROCEDENCIA.Summary)

				' CIUDAD PROCEDENCIA
				PostulaciF3n_Online.CIUDAD_PROCEDENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.CIUDAD_PROCEDENCIA.Summary)

				' COMUNA
				PostulaciF3n_Online.COMUNA.ViewValue = Convert.ToString(PostulaciF3n_Online.COMUNA.Summary)

				' DIRECCION ACTUAL
				PostulaciF3n_Online.DIRECCION_ACTUAL.ViewValue = Convert.ToString(PostulaciF3n_Online.DIRECCION_ACTUAL.Summary)

				' CIUDAD ACTUAL
				PostulaciF3n_Online.CIUDAD_ACTUAL.ViewValue = Convert.ToString(PostulaciF3n_Online.CIUDAD_ACTUAL.Summary)

				' COMUNA ACTUAL
				PostulaciF3n_Online.COMUNA_ACTUAL.ViewValue = Convert.ToString(PostulaciF3n_Online.COMUNA_ACTUAL.Summary)

				' REGIONACTUAL
				PostulaciF3n_Online.REGIONACTUAL.ViewValue = Convert.ToString(PostulaciF3n_Online.REGIONACTUAL.Summary)

				' ESTADO CIVIL
				PostulaciF3n_Online.ESTADO_CIVIL.ViewValue = Convert.ToString(PostulaciF3n_Online.ESTADO_CIVIL.Summary)

				' FECHA NACIMIENTO
				PostulaciF3n_Online.FECHA_NACIMIENTO.ViewValue = Convert.ToString(PostulaciF3n_Online.FECHA_NACIMIENTO.Summary)
				PostulaciF3n_Online.FECHA_NACIMIENTO.ViewValue = ew_FormatDateTime(PostulaciF3n_Online.FECHA_NACIMIENTO.ViewValue, 7)

				' GENERO
				PostulaciF3n_Online.GENERO.ViewValue = Convert.ToString(PostulaciF3n_Online.GENERO.Summary)

				' TRABAJA
				PostulaciF3n_Online.TRABAJA.ViewValue = Convert.ToString(PostulaciF3n_Online.TRABAJA.Summary)

				' TIPO TRABAJO
				PostulaciF3n_Online.TIPO_TRABAJO.ViewValue = Convert.ToString(PostulaciF3n_Online.TIPO_TRABAJO.Summary)

				' EMPRESA
				PostulaciF3n_Online.EMPRESA.ViewValue = Convert.ToString(PostulaciF3n_Online.EMPRESA.Summary)

				' ACTIVIDAD
				PostulaciF3n_Online.ACTIVIDAD.ViewValue = Convert.ToString(PostulaciF3n_Online.ACTIVIDAD.Summary)

				' DIRECCION EMPRESA
				PostulaciF3n_Online.DIRECCION_EMPRESA.ViewValue = Convert.ToString(PostulaciF3n_Online.DIRECCION_EMPRESA.Summary)

				' SOSTENEDOR
				PostulaciF3n_Online.SOSTENEDOR.ViewValue = Convert.ToString(PostulaciF3n_Online.SOSTENEDOR.Summary)

				' NivelEducativoAlumno
				PostulaciF3n_Online.NivelEducativoAlumno.ViewValue = Convert.ToString(PostulaciF3n_Online.NivelEducativoAlumno.Summary)

				' COLEGIO
				PostulaciF3n_Online.COLEGIO.ViewValue = Convert.ToString(PostulaciF3n_Online.COLEGIO.Summary)

				' AÑO EGRESO COLEGIO
				PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.ViewValue = Convert.ToString(PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.Summary)

				' CONVALIDA
				PostulaciF3n_Online.CONVALIDA.ViewValue = Convert.ToString(PostulaciF3n_Online.CONVALIDA.Summary)

				' AÑO PSU
				PostulaciF3n_Online.AD1O_PSU.ViewValue = Convert.ToString(PostulaciF3n_Online.AD1O_PSU.Summary)

				' PROMEDIO ENSEÑANZA MEDIA
				PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.ViewValue = Convert.ToString(PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.Summary)

				' TIPO PRUEBA
				PostulaciF3n_Online.TIPO_PRUEBA.ViewValue = Convert.ToString(PostulaciF3n_Online.TIPO_PRUEBA.Summary)

				' PUNTAJE PSU MATEMATICAS
				PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.ViewValue = Convert.ToString(PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.Summary)

				' PUNTAJE PSU LENGUAJE
				PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.ViewValue = Convert.ToString(PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.Summary)

				' PROMEDIO PSU
				PostulaciF3n_Online.PROMEDIO_PSU.ViewValue = Convert.ToString(PostulaciF3n_Online.PROMEDIO_PSU.Summary)

				' PUNTAJE PAA MATEMATICAS
				PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.ViewValue = Convert.ToString(PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.Summary)

				' PUNTAJE PAA LENGUAJE
				PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.ViewValue = Convert.ToString(PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.Summary)

				' PROMEDIO PAA
				PostulaciF3n_Online.PROMEDIO_PAA.ViewValue = Convert.ToString(PostulaciF3n_Online.PROMEDIO_PAA.Summary)

				' NUMERO INTEGRANTES
				PostulaciF3n_Online.NUMERO_INTEGRANTES.ViewValue = Convert.ToString(PostulaciF3n_Online.NUMERO_INTEGRANTES.Summary)

				' TIENE HIJOS
				PostulaciF3n_Online.TIENE_HIJOS.ViewValue = Convert.ToString(PostulaciF3n_Online.TIENE_HIJOS.Summary)

				' OCUPACIONMadre
				PostulaciF3n_Online.OCUPACIONMadre.ViewValue = Convert.ToString(PostulaciF3n_Online.OCUPACIONMadre.Summary)

				' EstudiosMadre
				PostulaciF3n_Online.EstudiosMadre.ViewValue = Convert.ToString(PostulaciF3n_Online.EstudiosMadre.Summary)

				' OcupacionPadre
				PostulaciF3n_Online.OcupacionPadre.ViewValue = Convert.ToString(PostulaciF3n_Online.OcupacionPadre.Summary)

				' EstudiosPadre
				PostulaciF3n_Online.EstudiosPadre.ViewValue = Convert.ToString(PostulaciF3n_Online.EstudiosPadre.Summary)

				' ESTADO POSTULACION
				PostulaciF3n_Online.ESTADO_POSTULACION.ViewValue = Convert.ToString(PostulaciF3n_Online.ESTADO_POSTULACION.Summary)

				' FECHA ACTUALIZACION
				PostulaciF3n_Online.FECHA_ACTUALIZACION.ViewValue = Convert.ToString(PostulaciF3n_Online.FECHA_ACTUALIZACION.Summary)
				PostulaciF3n_Online.FECHA_ACTUALIZACION.ViewValue = ew_FormatDateTime(PostulaciF3n_Online.FECHA_ACTUALIZACION.ViewValue, 7)

				' PASO
				PostulaciF3n_Online.PASO.ViewValue = Convert.ToString(PostulaciF3n_Online.PASO.Summary)
			Else

				' RUT
				PostulaciF3n_Online.RUT.ViewValue = Convert.ToString(PostulaciF3n_Online.RUT.CurrentValue)
				PostulaciF3n_Online.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				PostulaciF3n_Online.NOMBRE.ViewValue = Convert.ToString(PostulaciF3n_Online.NOMBRE.CurrentValue)
				PostulaciF3n_Online.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				PostulaciF3n_Online.PATERNO.ViewValue = Convert.ToString(PostulaciF3n_Online.PATERNO.CurrentValue)
				PostulaciF3n_Online.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				PostulaciF3n_Online.MATERNO.ViewValue = Convert.ToString(PostulaciF3n_Online.MATERNO.CurrentValue)
				PostulaciF3n_Online.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CARRERA
				PostulaciF3n_Online.CARRERA.ViewValue = Convert.ToString(PostulaciF3n_Online.CARRERA.CurrentValue)
				PostulaciF3n_Online.CARRERA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' JORNADA
				PostulaciF3n_Online.JORNADA.ViewValue = Convert.ToString(PostulaciF3n_Online.JORNADA.CurrentValue)
				PostulaciF3n_Online.JORNADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' REGION PROCEDENCIA
				PostulaciF3n_Online.REGION_PROCEDENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.REGION_PROCEDENCIA.CurrentValue)
				PostulaciF3n_Online.REGION_PROCEDENCIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MAIL
				PostulaciF3n_Online.MAIL.ViewValue = Convert.ToString(PostulaciF3n_Online.MAIL.CurrentValue)
				PostulaciF3n_Online.MAIL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PAIS PROCEDENCIA
				PostulaciF3n_Online.PAIS_PROCEDENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.PAIS_PROCEDENCIA.CurrentValue)
				PostulaciF3n_Online.PAIS_PROCEDENCIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TRAMO RENTA
				PostulaciF3n_Online.TRAMO_RENTA.ViewValue = Convert.ToString(PostulaciF3n_Online.TRAMO_RENTA.CurrentValue)
				PostulaciF3n_Online.TRAMO_RENTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CONVIVE
				PostulaciF3n_Online.CONVIVE.ViewValue = Convert.ToString(PostulaciF3n_Online.CONVIVE.CurrentValue)
				PostulaciF3n_Online.CONVIVE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' INGRESO FAMILIAR
				PostulaciF3n_Online.INGRESO_FAMILIAR.ViewValue = Convert.ToString(PostulaciF3n_Online.INGRESO_FAMILIAR.CurrentValue)
				PostulaciF3n_Online.INGRESO_FAMILIAR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SALUD
				PostulaciF3n_Online.SALUD.ViewValue = Convert.ToString(PostulaciF3n_Online.SALUD.CurrentValue)
				PostulaciF3n_Online.SALUD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MOTIVO
				PostulaciF3n_Online.MOTIVO.ViewValue = Convert.ToString(PostulaciF3n_Online.MOTIVO.CurrentValue)
				PostulaciF3n_Online.MOTIVO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' VIA
				PostulaciF3n_Online.VIA.ViewValue = Convert.ToString(PostulaciF3n_Online.VIA.CurrentValue)
				PostulaciF3n_Online.VIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TELEFONO PARTICULAR
				PostulaciF3n_Online.TELEFONO_PARTICULAR.ViewValue = Convert.ToString(PostulaciF3n_Online.TELEFONO_PARTICULAR.CurrentValue)
				PostulaciF3n_Online.TELEFONO_PARTICULAR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TELEFONO EMERGENCIA
				PostulaciF3n_Online.TELEFONO_EMERGENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.TELEFONO_EMERGENCIA.CurrentValue)
				PostulaciF3n_Online.TELEFONO_EMERGENCIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECHA POSTULACION
				PostulaciF3n_Online.FECHA_POSTULACION.ViewValue = Convert.ToString(PostulaciF3n_Online.FECHA_POSTULACION.CurrentValue)
				PostulaciF3n_Online.FECHA_POSTULACION.ViewValue = ew_FormatDateTime(PostulaciF3n_Online.FECHA_POSTULACION.ViewValue, 7)
				PostulaciF3n_Online.FECHA_POSTULACION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIRECCION PROCEDENCIA
				PostulaciF3n_Online.DIRECCION_PROCEDENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.DIRECCION_PROCEDENCIA.CurrentValue)
				PostulaciF3n_Online.DIRECCION_PROCEDENCIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CIUDAD PROCEDENCIA
				PostulaciF3n_Online.CIUDAD_PROCEDENCIA.ViewValue = Convert.ToString(PostulaciF3n_Online.CIUDAD_PROCEDENCIA.CurrentValue)
				PostulaciF3n_Online.CIUDAD_PROCEDENCIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' COMUNA
				PostulaciF3n_Online.COMUNA.ViewValue = Convert.ToString(PostulaciF3n_Online.COMUNA.CurrentValue)
				PostulaciF3n_Online.COMUNA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIRECCION ACTUAL
				PostulaciF3n_Online.DIRECCION_ACTUAL.ViewValue = Convert.ToString(PostulaciF3n_Online.DIRECCION_ACTUAL.CurrentValue)
				PostulaciF3n_Online.DIRECCION_ACTUAL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CIUDAD ACTUAL
				PostulaciF3n_Online.CIUDAD_ACTUAL.ViewValue = Convert.ToString(PostulaciF3n_Online.CIUDAD_ACTUAL.CurrentValue)
				PostulaciF3n_Online.CIUDAD_ACTUAL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' COMUNA ACTUAL
				PostulaciF3n_Online.COMUNA_ACTUAL.ViewValue = Convert.ToString(PostulaciF3n_Online.COMUNA_ACTUAL.CurrentValue)
				PostulaciF3n_Online.COMUNA_ACTUAL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' REGIONACTUAL
				PostulaciF3n_Online.REGIONACTUAL.ViewValue = Convert.ToString(PostulaciF3n_Online.REGIONACTUAL.CurrentValue)
				PostulaciF3n_Online.REGIONACTUAL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTADO CIVIL
				PostulaciF3n_Online.ESTADO_CIVIL.ViewValue = Convert.ToString(PostulaciF3n_Online.ESTADO_CIVIL.CurrentValue)
				PostulaciF3n_Online.ESTADO_CIVIL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECHA NACIMIENTO
				PostulaciF3n_Online.FECHA_NACIMIENTO.ViewValue = Convert.ToString(PostulaciF3n_Online.FECHA_NACIMIENTO.CurrentValue)
				PostulaciF3n_Online.FECHA_NACIMIENTO.ViewValue = ew_FormatDateTime(PostulaciF3n_Online.FECHA_NACIMIENTO.ViewValue, 7)
				PostulaciF3n_Online.FECHA_NACIMIENTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' GENERO
				PostulaciF3n_Online.GENERO.ViewValue = Convert.ToString(PostulaciF3n_Online.GENERO.CurrentValue)
				PostulaciF3n_Online.GENERO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TRABAJA
				PostulaciF3n_Online.TRABAJA.ViewValue = Convert.ToString(PostulaciF3n_Online.TRABAJA.CurrentValue)
				PostulaciF3n_Online.TRABAJA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIPO TRABAJO
				PostulaciF3n_Online.TIPO_TRABAJO.ViewValue = Convert.ToString(PostulaciF3n_Online.TIPO_TRABAJO.CurrentValue)
				PostulaciF3n_Online.TIPO_TRABAJO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' EMPRESA
				PostulaciF3n_Online.EMPRESA.ViewValue = Convert.ToString(PostulaciF3n_Online.EMPRESA.CurrentValue)
				PostulaciF3n_Online.EMPRESA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ACTIVIDAD
				PostulaciF3n_Online.ACTIVIDAD.ViewValue = Convert.ToString(PostulaciF3n_Online.ACTIVIDAD.CurrentValue)
				PostulaciF3n_Online.ACTIVIDAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIRECCION EMPRESA
				PostulaciF3n_Online.DIRECCION_EMPRESA.ViewValue = Convert.ToString(PostulaciF3n_Online.DIRECCION_EMPRESA.CurrentValue)
				PostulaciF3n_Online.DIRECCION_EMPRESA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SOSTENEDOR
				PostulaciF3n_Online.SOSTENEDOR.ViewValue = Convert.ToString(PostulaciF3n_Online.SOSTENEDOR.CurrentValue)
				PostulaciF3n_Online.SOSTENEDOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NivelEducativoAlumno
				PostulaciF3n_Online.NivelEducativoAlumno.ViewValue = Convert.ToString(PostulaciF3n_Online.NivelEducativoAlumno.CurrentValue)
				PostulaciF3n_Online.NivelEducativoAlumno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' COLEGIO
				PostulaciF3n_Online.COLEGIO.ViewValue = Convert.ToString(PostulaciF3n_Online.COLEGIO.CurrentValue)
				PostulaciF3n_Online.COLEGIO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' AÑO EGRESO COLEGIO
				PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.ViewValue = Convert.ToString(PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.CurrentValue)
				PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CONVALIDA
				PostulaciF3n_Online.CONVALIDA.ViewValue = Convert.ToString(PostulaciF3n_Online.CONVALIDA.CurrentValue)
				PostulaciF3n_Online.CONVALIDA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' AÑO PSU
				PostulaciF3n_Online.AD1O_PSU.ViewValue = Convert.ToString(PostulaciF3n_Online.AD1O_PSU.CurrentValue)
				PostulaciF3n_Online.AD1O_PSU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PROMEDIO ENSEÑANZA MEDIA
				PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.ViewValue = Convert.ToString(PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.CurrentValue)
				PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIPO PRUEBA
				PostulaciF3n_Online.TIPO_PRUEBA.ViewValue = Convert.ToString(PostulaciF3n_Online.TIPO_PRUEBA.CurrentValue)
				PostulaciF3n_Online.TIPO_PRUEBA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PUNTAJE PSU MATEMATICAS
				PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.ViewValue = Convert.ToString(PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.CurrentValue)
				PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PUNTAJE PSU LENGUAJE
				PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.ViewValue = Convert.ToString(PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.CurrentValue)
				PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PROMEDIO PSU
				PostulaciF3n_Online.PROMEDIO_PSU.ViewValue = Convert.ToString(PostulaciF3n_Online.PROMEDIO_PSU.CurrentValue)
				PostulaciF3n_Online.PROMEDIO_PSU.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PUNTAJE PAA MATEMATICAS
				PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.ViewValue = Convert.ToString(PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.CurrentValue)
				PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PUNTAJE PAA LENGUAJE
				PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.ViewValue = Convert.ToString(PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.CurrentValue)
				PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PROMEDIO PAA
				PostulaciF3n_Online.PROMEDIO_PAA.ViewValue = Convert.ToString(PostulaciF3n_Online.PROMEDIO_PAA.CurrentValue)
				PostulaciF3n_Online.PROMEDIO_PAA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NUMERO INTEGRANTES
				PostulaciF3n_Online.NUMERO_INTEGRANTES.ViewValue = Convert.ToString(PostulaciF3n_Online.NUMERO_INTEGRANTES.CurrentValue)
				PostulaciF3n_Online.NUMERO_INTEGRANTES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIENE HIJOS
				PostulaciF3n_Online.TIENE_HIJOS.ViewValue = Convert.ToString(PostulaciF3n_Online.TIENE_HIJOS.CurrentValue)
				PostulaciF3n_Online.TIENE_HIJOS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' OCUPACIONMadre
				PostulaciF3n_Online.OCUPACIONMadre.ViewValue = Convert.ToString(PostulaciF3n_Online.OCUPACIONMadre.CurrentValue)
				PostulaciF3n_Online.OCUPACIONMadre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' EstudiosMadre
				PostulaciF3n_Online.EstudiosMadre.ViewValue = Convert.ToString(PostulaciF3n_Online.EstudiosMadre.CurrentValue)
				PostulaciF3n_Online.EstudiosMadre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' OcupacionPadre
				PostulaciF3n_Online.OcupacionPadre.ViewValue = Convert.ToString(PostulaciF3n_Online.OcupacionPadre.CurrentValue)
				PostulaciF3n_Online.OcupacionPadre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' EstudiosPadre
				PostulaciF3n_Online.EstudiosPadre.ViewValue = Convert.ToString(PostulaciF3n_Online.EstudiosPadre.CurrentValue)
				PostulaciF3n_Online.EstudiosPadre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTADO POSTULACION
				PostulaciF3n_Online.ESTADO_POSTULACION.ViewValue = Convert.ToString(PostulaciF3n_Online.ESTADO_POSTULACION.CurrentValue)
				PostulaciF3n_Online.ESTADO_POSTULACION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECHA ACTUALIZACION
				PostulaciF3n_Online.FECHA_ACTUALIZACION.ViewValue = Convert.ToString(PostulaciF3n_Online.FECHA_ACTUALIZACION.CurrentValue)
				PostulaciF3n_Online.FECHA_ACTUALIZACION.ViewValue = ew_FormatDateTime(PostulaciF3n_Online.FECHA_ACTUALIZACION.ViewValue, 7)
				PostulaciF3n_Online.FECHA_ACTUALIZACION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PASO
				PostulaciF3n_Online.PASO.ViewValue = Convert.ToString(PostulaciF3n_Online.PASO.CurrentValue)
				PostulaciF3n_Online.PASO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUT
			PostulaciF3n_Online.RUT.HrefValue = ""

			' NOMBRE
			PostulaciF3n_Online.NOMBRE.HrefValue = ""

			' PATERNO
			PostulaciF3n_Online.PATERNO.HrefValue = ""

			' MATERNO
			PostulaciF3n_Online.MATERNO.HrefValue = ""

			' CARRERA
			PostulaciF3n_Online.CARRERA.HrefValue = ""

			' JORNADA
			PostulaciF3n_Online.JORNADA.HrefValue = ""

			' REGION PROCEDENCIA
			PostulaciF3n_Online.REGION_PROCEDENCIA.HrefValue = ""

			' MAIL
			PostulaciF3n_Online.MAIL.HrefValue = ""

			' PAIS PROCEDENCIA
			PostulaciF3n_Online.PAIS_PROCEDENCIA.HrefValue = ""

			' TRAMO RENTA
			PostulaciF3n_Online.TRAMO_RENTA.HrefValue = ""

			' CONVIVE
			PostulaciF3n_Online.CONVIVE.HrefValue = ""

			' INGRESO FAMILIAR
			PostulaciF3n_Online.INGRESO_FAMILIAR.HrefValue = ""

			' SALUD
			PostulaciF3n_Online.SALUD.HrefValue = ""

			' MOTIVO
			PostulaciF3n_Online.MOTIVO.HrefValue = ""

			' VIA
			PostulaciF3n_Online.VIA.HrefValue = ""

			' TELEFONO PARTICULAR
			PostulaciF3n_Online.TELEFONO_PARTICULAR.HrefValue = ""

			' TELEFONO EMERGENCIA
			PostulaciF3n_Online.TELEFONO_EMERGENCIA.HrefValue = ""

			' FECHA POSTULACION
			PostulaciF3n_Online.FECHA_POSTULACION.HrefValue = ""

			' DIRECCION PROCEDENCIA
			PostulaciF3n_Online.DIRECCION_PROCEDENCIA.HrefValue = ""

			' CIUDAD PROCEDENCIA
			PostulaciF3n_Online.CIUDAD_PROCEDENCIA.HrefValue = ""

			' COMUNA
			PostulaciF3n_Online.COMUNA.HrefValue = ""

			' DIRECCION ACTUAL
			PostulaciF3n_Online.DIRECCION_ACTUAL.HrefValue = ""

			' CIUDAD ACTUAL
			PostulaciF3n_Online.CIUDAD_ACTUAL.HrefValue = ""

			' COMUNA ACTUAL
			PostulaciF3n_Online.COMUNA_ACTUAL.HrefValue = ""

			' REGIONACTUAL
			PostulaciF3n_Online.REGIONACTUAL.HrefValue = ""

			' ESTADO CIVIL
			PostulaciF3n_Online.ESTADO_CIVIL.HrefValue = ""

			' FECHA NACIMIENTO
			PostulaciF3n_Online.FECHA_NACIMIENTO.HrefValue = ""

			' GENERO
			PostulaciF3n_Online.GENERO.HrefValue = ""

			' TRABAJA
			PostulaciF3n_Online.TRABAJA.HrefValue = ""

			' TIPO TRABAJO
			PostulaciF3n_Online.TIPO_TRABAJO.HrefValue = ""

			' EMPRESA
			PostulaciF3n_Online.EMPRESA.HrefValue = ""

			' ACTIVIDAD
			PostulaciF3n_Online.ACTIVIDAD.HrefValue = ""

			' DIRECCION EMPRESA
			PostulaciF3n_Online.DIRECCION_EMPRESA.HrefValue = ""

			' SOSTENEDOR
			PostulaciF3n_Online.SOSTENEDOR.HrefValue = ""

			' NivelEducativoAlumno
			PostulaciF3n_Online.NivelEducativoAlumno.HrefValue = ""

			' COLEGIO
			PostulaciF3n_Online.COLEGIO.HrefValue = ""

			' AÑO EGRESO COLEGIO
			PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.HrefValue = ""

			' CONVALIDA
			PostulaciF3n_Online.CONVALIDA.HrefValue = ""

			' AÑO PSU
			PostulaciF3n_Online.AD1O_PSU.HrefValue = ""

			' PROMEDIO ENSEÑANZA MEDIA
			PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.HrefValue = ""

			' TIPO PRUEBA
			PostulaciF3n_Online.TIPO_PRUEBA.HrefValue = ""

			' PUNTAJE PSU MATEMATICAS
			PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.HrefValue = ""

			' PUNTAJE PSU LENGUAJE
			PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.HrefValue = ""

			' PROMEDIO PSU
			PostulaciF3n_Online.PROMEDIO_PSU.HrefValue = ""

			' PUNTAJE PAA MATEMATICAS
			PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.HrefValue = ""

			' PUNTAJE PAA LENGUAJE
			PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.HrefValue = ""

			' PROMEDIO PAA
			PostulaciF3n_Online.PROMEDIO_PAA.HrefValue = ""

			' NUMERO INTEGRANTES
			PostulaciF3n_Online.NUMERO_INTEGRANTES.HrefValue = ""

			' TIENE HIJOS
			PostulaciF3n_Online.TIENE_HIJOS.HrefValue = ""

			' OCUPACIONMadre
			PostulaciF3n_Online.OCUPACIONMadre.HrefValue = ""

			' EstudiosMadre
			PostulaciF3n_Online.EstudiosMadre.HrefValue = ""

			' OcupacionPadre
			PostulaciF3n_Online.OcupacionPadre.HrefValue = ""

			' EstudiosPadre
			PostulaciF3n_Online.EstudiosPadre.HrefValue = ""

			' ESTADO POSTULACION
			PostulaciF3n_Online.ESTADO_POSTULACION.HrefValue = ""

			' FECHA ACTUALIZACION
			PostulaciF3n_Online.FECHA_ACTUALIZACION.HrefValue = ""

			' PASO
			PostulaciF3n_Online.PASO.HrefValue = ""

			' Call Row_Rendered event
			PostulaciF3n_Online.Row_Rendered()
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

			' Field CARRERA
			sSelect = "SELECT DISTINCT [CARRERA] FROM " + PostulaciF3n_Online.SqlFrom
			sOrderBy = "[CARRERA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, PostulaciF3n_Online.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			PostulaciF3n_Online.CARRERA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field JORNADA
			sSelect = "SELECT DISTINCT [JORNADA] FROM " + PostulaciF3n_Online.SqlFrom
			sOrderBy = "[JORNADA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, PostulaciF3n_Online.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			PostulaciF3n_Online.JORNADA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTADO POSTULACION
			sSelect = "SELECT DISTINCT [ESTADO POSTULACION] FROM " + PostulaciF3n_Online.SqlFrom
			sOrderBy = "[ESTADO POSTULACION] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, PostulaciF3n_Online.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			PostulaciF3n_Online.ESTADO_POSTULACION.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PASO
			sSelect = "SELECT DISTINCT [PASO] FROM " + PostulaciF3n_Online.SqlFrom
			sOrderBy = "[PASO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, PostulaciF3n_Online.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			PostulaciF3n_Online.PASO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
			
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
				SetSessionFilterValues(PostulaciF3n_Online.RUT)

				' Field PATERNO
				SetSessionFilterValues(PostulaciF3n_Online.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(PostulaciF3n_Online.MATERNO)

				' Field CARRERA
				SetSessionDropDownValue(PostulaciF3n_Online.CARRERA.DropDownValue, PostulaciF3n_Online.CARRERA)

				' Field JORNADA
				SetSessionDropDownValue(PostulaciF3n_Online.JORNADA.DropDownValue, PostulaciF3n_Online.JORNADA)

				' Field ESTADO POSTULACION
				SetSessionDropDownValue(PostulaciF3n_Online.ESTADO_POSTULACION.DropDownValue, PostulaciF3n_Online.ESTADO_POSTULACION)

				' Field PASO
				SetSessionDropDownValue(PostulaciF3n_Online.PASO.DropDownValue, PostulaciF3n_Online.PASO)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT
				If (GetFilterValues(PostulaciF3n_Online.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(PostulaciF3n_Online.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(PostulaciF3n_Online.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field CARRERA
				If (GetDropDownValue(PostulaciF3n_Online.CARRERA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(PostulaciF3n_Online.CARRERA.DropDownValue) Then
					If Not ew_SameStr(PostulaciF3n_Online.CARRERA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_PostulaciF3n_Online_CARRERA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field JORNADA
				If (GetDropDownValue(PostulaciF3n_Online.JORNADA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(PostulaciF3n_Online.JORNADA.DropDownValue) Then
					If Not ew_SameStr(PostulaciF3n_Online.JORNADA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_PostulaciF3n_Online_JORNADA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ESTADO POSTULACION
				If (GetDropDownValue(PostulaciF3n_Online.ESTADO_POSTULACION)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(PostulaciF3n_Online.ESTADO_POSTULACION.DropDownValue) Then
					If Not ew_SameStr(PostulaciF3n_Online.ESTADO_POSTULACION.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_PostulaciF3n_Online_ESTADO_POSTULACION") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PASO
				If (GetDropDownValue(PostulaciF3n_Online.PASO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(PostulaciF3n_Online.PASO.DropDownValue) Then
					If Not ew_SameStr(PostulaciF3n_Online.PASO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_PostulaciF3n_Online_PASO") Is Nothing Then
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
			GetSessionFilterValues(PostulaciF3n_Online.RUT)

			' Field PATERNO
			GetSessionFilterValues(PostulaciF3n_Online.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(PostulaciF3n_Online.MATERNO)

			' Field CARRERA
			GetSessionDropDownValue(PostulaciF3n_Online.CARRERA)

			' Field JORNADA
			GetSessionDropDownValue(PostulaciF3n_Online.JORNADA)

			' Field ESTADO POSTULACION
			GetSessionDropDownValue(PostulaciF3n_Online.ESTADO_POSTULACION)

			' Field PASO
			GetSessionDropDownValue(PostulaciF3n_Online.PASO)
		End If

		' Call page filter validated event
		PostulaciF3n_Online.Page_FilterValidated()

		' Build SQL
		' Field RUT

		BuildExtendedFilter(PostulaciF3n_Online.RUT, sFilter)

		' Field PATERNO
		BuildExtendedFilter(PostulaciF3n_Online.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(PostulaciF3n_Online.MATERNO, sFilter)

		' Field CARRERA
		BuildDropDownFilter(PostulaciF3n_Online.CARRERA, sFilter, "")

		' Field JORNADA
		BuildDropDownFilter(PostulaciF3n_Online.JORNADA, sFilter, "")

		' Field ESTADO POSTULACION
		BuildDropDownFilter(PostulaciF3n_Online.ESTADO_POSTULACION, sFilter, "")

		' Field PASO
		BuildDropDownFilter(PostulaciF3n_Online.PASO, sFilter, "")

		' Save parms to Session
		' Field RUT

		SetSessionFilterValues(PostulaciF3n_Online.RUT)

		' Field PATERNO
		SetSessionFilterValues(PostulaciF3n_Online.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(PostulaciF3n_Online.MATERNO)

		' Field CARRERA
		SetSessionDropDownValue(PostulaciF3n_Online.CARRERA.DropDownValue, PostulaciF3n_Online.CARRERA)

		' Field JORNADA
		SetSessionDropDownValue(PostulaciF3n_Online.JORNADA.DropDownValue, PostulaciF3n_Online.JORNADA)

		' Field ESTADO POSTULACION
		SetSessionDropDownValue(PostulaciF3n_Online.ESTADO_POSTULACION.DropDownValue, PostulaciF3n_Online.ESTADO_POSTULACION)

		' Field PASO
		SetSessionDropDownValue(PostulaciF3n_Online.PASO.DropDownValue, PostulaciF3n_Online.PASO)

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
		If ew_Session("sv_PostulaciF3n_Online_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_PostulaciF3n_Online_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_PostulaciF3n_Online_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_PostulaciF3n_Online_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_PostulaciF3n_Online_" + parm)
		End If
		If ew_Session("so1_PostulaciF3n_Online_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_PostulaciF3n_Online_" + parm))
		End If
		If ew_Session("sc_PostulaciF3n_Online_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_PostulaciF3n_Online_" + parm))
		End If
		If ew_Session("sv2_PostulaciF3n_Online_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_PostulaciF3n_Online_" + parm)
		End If
		If ew_Session("so2_PostulaciF3n_Online_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_PostulaciF3n_Online_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_PostulaciF3n_Online_" + parm) = fld.SearchValue
		ew_Session("so1_PostulaciF3n_Online_" + parm) = fld.SearchOperator
		ew_Session("sc_PostulaciF3n_Online_" + parm) = fld.SearchCondition
		ew_Session("sv2_PostulaciF3n_Online_" + parm) = fld.SearchValue2
		ew_Session("so2_PostulaciF3n_Online_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_PostulaciF3n_Online_" + parm) = ""
		ew_Session("so1_PostulaciF3n_Online_" + parm) = "="
		ew_Session("sc_PostulaciF3n_Online_" + parm) = "AND"
		ew_Session("sv2_PostulaciF3n_Online_" + parm) = ""
		ew_Session("so2_PostulaciF3n_Online_" + parm) = "="
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
		ew_Session("sel_PostulaciF3n_Online_" & parm) = ""
		ew_Session("rf_PostulaciF3n_Online_" & parm) = ""
		ew_Session("rt_PostulaciF3n_Online_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = PostulaciF3n_Online.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_PostulaciF3n_Online_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_PostulaciF3n_Online_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_PostulaciF3n_Online_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field CARRERA

			PostulaciF3n_Online.CARRERA.DefaultDropDownValue = EWRPT_INIT_VALUE
			PostulaciF3n_Online.CARRERA.DropDownValue = PostulaciF3n_Online.CARRERA.DefaultDropDownValue

			' Field JORNADA
			PostulaciF3n_Online.JORNADA.DefaultDropDownValue = EWRPT_INIT_VALUE
			PostulaciF3n_Online.JORNADA.DropDownValue = PostulaciF3n_Online.JORNADA.DefaultDropDownValue

			' Field ESTADO POSTULACION
			PostulaciF3n_Online.ESTADO_POSTULACION.DefaultDropDownValue = EWRPT_INIT_VALUE
			PostulaciF3n_Online.ESTADO_POSTULACION.DropDownValue = PostulaciF3n_Online.ESTADO_POSTULACION.DefaultDropDownValue

			' Field PASO
			PostulaciF3n_Online.PASO.DefaultDropDownValue = EWRPT_INIT_VALUE
			PostulaciF3n_Online.PASO.DropDownValue = PostulaciF3n_Online.PASO.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(PostulaciF3n_Online.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(PostulaciF3n_Online.RUT)	

			' Field PATERNO
			SetDefaultExtFilter(PostulaciF3n_Online.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(PostulaciF3n_Online.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(PostulaciF3n_Online.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(PostulaciF3n_Online.MATERNO)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT extended filter
		If (TextFilterApplied(PostulaciF3n_Online.RUT)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(PostulaciF3n_Online.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(PostulaciF3n_Online.MATERNO)) Then bFilterExist = True

		' Check CARRERA dropdown filter
		If (NonTextFilterApplied(PostulaciF3n_Online.CARRERA)) Then bFilterExist = True

		' Check JORNADA dropdown filter
		If (NonTextFilterApplied(PostulaciF3n_Online.JORNADA)) Then bFilterExist = True

		' Check ESTADO POSTULACION dropdown filter
		If (NonTextFilterApplied(PostulaciF3n_Online.ESTADO_POSTULACION)) Then bFilterExist = True

		' Check PASO dropdown filter
		If (NonTextFilterApplied(PostulaciF3n_Online.PASO)) Then bFilterExist = True
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
		BuildExtendedFilter(PostulaciF3n_Online.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PostulaciF3n_Online.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(PostulaciF3n_Online.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PostulaciF3n_Online.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(PostulaciF3n_Online.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PostulaciF3n_Online.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CARRERA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(PostulaciF3n_Online.CARRERA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PostulaciF3n_Online.CARRERA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field JORNADA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(PostulaciF3n_Online.JORNADA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PostulaciF3n_Online.JORNADA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTADO POSTULACION
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(PostulaciF3n_Online.ESTADO_POSTULACION, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PostulaciF3n_Online.ESTADO_POSTULACION.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PASO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(PostulaciF3n_Online.PASO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= PostulaciF3n_Online.PASO.FldCaption() & "<br>"
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
				PostulaciF3n_Online.OrderBy = ""
				PostulaciF3n_Online.StartGroup = 1
				PostulaciF3n_Online.RUT.Sort = ""
				PostulaciF3n_Online.NOMBRE.Sort = ""
				PostulaciF3n_Online.PATERNO.Sort = ""
				PostulaciF3n_Online.MATERNO.Sort = ""
				PostulaciF3n_Online.CARRERA.Sort = ""
				PostulaciF3n_Online.JORNADA.Sort = ""
				PostulaciF3n_Online.REGION_PROCEDENCIA.Sort = ""
				PostulaciF3n_Online.MAIL.Sort = ""
				PostulaciF3n_Online.PAIS_PROCEDENCIA.Sort = ""
				PostulaciF3n_Online.TRAMO_RENTA.Sort = ""
				PostulaciF3n_Online.CONVIVE.Sort = ""
				PostulaciF3n_Online.INGRESO_FAMILIAR.Sort = ""
				PostulaciF3n_Online.SALUD.Sort = ""
				PostulaciF3n_Online.MOTIVO.Sort = ""
				PostulaciF3n_Online.VIA.Sort = ""
				PostulaciF3n_Online.TELEFONO_PARTICULAR.Sort = ""
				PostulaciF3n_Online.TELEFONO_EMERGENCIA.Sort = ""
				PostulaciF3n_Online.FECHA_POSTULACION.Sort = ""
				PostulaciF3n_Online.DIRECCION_PROCEDENCIA.Sort = ""
				PostulaciF3n_Online.CIUDAD_PROCEDENCIA.Sort = ""
				PostulaciF3n_Online.COMUNA.Sort = ""
				PostulaciF3n_Online.DIRECCION_ACTUAL.Sort = ""
				PostulaciF3n_Online.CIUDAD_ACTUAL.Sort = ""
				PostulaciF3n_Online.COMUNA_ACTUAL.Sort = ""
				PostulaciF3n_Online.REGIONACTUAL.Sort = ""
				PostulaciF3n_Online.ESTADO_CIVIL.Sort = ""
				PostulaciF3n_Online.FECHA_NACIMIENTO.Sort = ""
				PostulaciF3n_Online.GENERO.Sort = ""
				PostulaciF3n_Online.TRABAJA.Sort = ""
				PostulaciF3n_Online.TIPO_TRABAJO.Sort = ""
				PostulaciF3n_Online.EMPRESA.Sort = ""
				PostulaciF3n_Online.ACTIVIDAD.Sort = ""
				PostulaciF3n_Online.DIRECCION_EMPRESA.Sort = ""
				PostulaciF3n_Online.SOSTENEDOR.Sort = ""
				PostulaciF3n_Online.NivelEducativoAlumno.Sort = ""
				PostulaciF3n_Online.COLEGIO.Sort = ""
				PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.Sort = ""
				PostulaciF3n_Online.CONVALIDA.Sort = ""
				PostulaciF3n_Online.AD1O_PSU.Sort = ""
				PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.Sort = ""
				PostulaciF3n_Online.TIPO_PRUEBA.Sort = ""
				PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.Sort = ""
				PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.Sort = ""
				PostulaciF3n_Online.PROMEDIO_PSU.Sort = ""
				PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.Sort = ""
				PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.Sort = ""
				PostulaciF3n_Online.PROMEDIO_PAA.Sort = ""
				PostulaciF3n_Online.NUMERO_INTEGRANTES.Sort = ""
				PostulaciF3n_Online.TIENE_HIJOS.Sort = ""
				PostulaciF3n_Online.OCUPACIONMadre.Sort = ""
				PostulaciF3n_Online.EstudiosMadre.Sort = ""
				PostulaciF3n_Online.OcupacionPadre.Sort = ""
				PostulaciF3n_Online.EstudiosPadre.Sort = ""
				PostulaciF3n_Online.ESTADO_POSTULACION.Sort = ""
				PostulaciF3n_Online.FECHA_ACTUALIZACION.Sort = ""
				PostulaciF3n_Online.PASO.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			PostulaciF3n_Online.CurrentOrder = ew_Get("order")
			PostulaciF3n_Online.CurrentOrderType = ew_Get("ordertype")
			sSortSql = PostulaciF3n_Online.SortSql()
			PostulaciF3n_Online.OrderBy = sSortSql
			PostulaciF3n_Online.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(PostulaciF3n_Online.OrderBy)) Then
			PostulaciF3n_Online.OrderBy = "[FECHA POSTULACION] DESC"
			PostulaciF3n_Online.FECHA_POSTULACION.Sort = "DESC"
		End If
		Return PostulaciF3n_Online.OrderBy
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
		PostulaciF3n_Online_summary = New crPostulaciF3n_Online_summary(Me)
		PostulaciF3n_Online_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		PostulaciF3n_Online_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (PostulaciF3n_Online_summary IsNot Nothing) Then PostulaciF3n_Online_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (PostulaciF3n_Online.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var PostulaciF3n_Online_summary = new ewrpt_Page("PostulaciF3n_Online_summary");
// page properties
PostulaciF3n_Online_summary.PageID = "summary"; // page ID
PostulaciF3n_Online_summary.FormID = "fPostulaciF3n_Onlinesummaryfilter"; // form ID
var EWRPT_PAGE_ID = PostulaciF3n_Online_summary.PageID;
// extend page with ValidateForm function
PostulaciF3n_Online_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
PostulaciF3n_Online_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
PostulaciF3n_Online_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
PostulaciF3n_Online_summary.ValidateRequired = false; // no JavaScript validation
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
<% PostulaciF3n_Online_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (PostulaciF3n_Online.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (PostulaciF3n_Online.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= PostulaciF3n_Online.TableCaption() %></h1></div>
<% If (PostulaciF3n_Online.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= PostulaciF3n_Online_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" alt="Exportar a Excel" title="Exportar a Excel" /></a>
<% If (PostulaciF3n_Online_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% PostulaciF3n_Online_summary.ShowMessage() %>
<% If (PostulaciF3n_Online.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (PostulaciF3n_Online.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (PostulaciF3n_Online.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (PostulaciF3n_Online.FilterPanelOption = 2 OrElse (PostulaciF3n_Online.FilterPanelOption = 3 AndAlso PostulaciF3n_Online_summary.FilterApplied) OrElse PostulaciF3n_Online_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="PostulaciF3n_Onlinesmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fPostulaciF3n_Onlinesummaryfilter" id="fPostulaciF3n_Onlinesummaryfilter" action="PostulaciF3n_Onlinesmry.aspx" class="ewForm" onsubmit="return PostulaciF3n_Online_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = PostulaciF3n_Online.MATERNO.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= PostulaciF3n_Online.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="53" value="<%= ew_HtmlEncode(PostulaciF3n_Online.RUT.SearchValue) %>"<%= IIf(PostulaciF3n_Online_summary.ClearExtFilter = "PostulaciF3n_Online_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PostulaciF3n_Online.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="50" value="<%= ew_HtmlEncode(PostulaciF3n_Online.PATERNO.SearchValue) %>"<%= IIf(PostulaciF3n_Online_summary.ClearExtFilter = "PostulaciF3n_Online_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PostulaciF3n_Online.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="50" value="<%= ew_HtmlEncode(PostulaciF3n_Online.MATERNO.SearchValue) %>"<%= IIf(PostulaciF3n_Online_summary.ClearExtFilter = "PostulaciF3n_Online_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PostulaciF3n_Online.CARRERA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CARRERA" id="sv_CARRERA"<%= IIf(PostulaciF3n_Online_summary.ClearExtFilter = "PostulaciF3n_Online_CARRERA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.CARRERA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = PostulaciF3n_Online.CARRERA.CustomFilters.Count + PostulaciF3n_Online.CARRERA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In PostulaciF3n_Online.CARRERA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CARRERA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.CARRERA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In PostulaciF3n_Online.CARRERA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.CARRERA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PostulaciF3n_Online.JORNADA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_JORNADA" id="sv_JORNADA"<%= IIf(PostulaciF3n_Online_summary.ClearExtFilter = "PostulaciF3n_Online_JORNADA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.JORNADA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = PostulaciF3n_Online.JORNADA.CustomFilters.Count + PostulaciF3n_Online.JORNADA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In PostulaciF3n_Online.JORNADA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "JORNADA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.JORNADA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In PostulaciF3n_Online.JORNADA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.JORNADA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PostulaciF3n_Online.ESTADO_POSTULACION.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = PostulaciF3n_Online.ESTADO_POSTULACION.CustomFilters.Count + PostulaciF3n_Online.ESTADO_POSTULACION.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In PostulaciF3n_Online.ESTADO_POSTULACION.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTADO POSTULACION")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="PostulaciF3n_Online.ESTADO_POSTULACION.DropDownValue" id="PostulaciF3n_Online.ESTADO_POSTULACION.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.ESTADO_POSTULACION.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In PostulaciF3n_Online.ESTADO_POSTULACION.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTADO_POSTULACION" id="sv_ESTADO_POSTULACION" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.ESTADO_POSTULACION.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= PostulaciF3n_Online.PASO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = PostulaciF3n_Online.PASO.CustomFilters.Count + PostulaciF3n_Online.PASO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In PostulaciF3n_Online.PASO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PASO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="PostulaciF3n_Online.PASO.DropDownValue" id="PostulaciF3n_Online.PASO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.PASO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In PostulaciF3n_Online.PASO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_PASO" id="sv_PASO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(PostulaciF3n_Online.PASO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (PostulaciF3n_Online.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% PostulaciF3n_Online_summary.ShowFilterList() %>
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
If (PostulaciF3n_Online.ExportAll AndAlso ew_NotEmpty(PostulaciF3n_Online.Export)) Then
	PostulaciF3n_Online_summary.StopGrp = PostulaciF3n_Online_summary.TotalGrps
Else
	PostulaciF3n_Online_summary.StopGrp = PostulaciF3n_Online_summary.StartGrp + PostulaciF3n_Online_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (PostulaciF3n_Online_summary.StopGrp > PostulaciF3n_Online_summary.TotalGrps) Then
	PostulaciF3n_Online_summary.StopGrp = PostulaciF3n_Online_summary.TotalGrps
End If
PostulaciF3n_Online_summary.RecCount = 0

' Get first row
If (PostulaciF3n_Online_summary.TotalGrps > 0) Then
	PostulaciF3n_Online_summary.GetRow() ' ASPXRPT
	PostulaciF3n_Online_summary.GrpCount = 1
End If
While ((PostulaciF3n_Online_summary.HasRow AndAlso PostulaciF3n_Online_summary.GrpIndex < PostulaciF3n_Online_summary.StopGrp) OrElse PostulaciF3n_Online_summary.ShowFirstHeader)

	' Show header
	If (PostulaciF3n_Online_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.RUT) %>',0);"><%= PostulaciF3n_Online.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.NOMBRE) %>',0);"><%= PostulaciF3n_Online.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PATERNO) %>',0);"><%= PostulaciF3n_Online.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.MATERNO) %>',0);"><%= PostulaciF3n_Online.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.CARRERA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CARRERA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.CARRERA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CARRERA) %>',0);"><%= PostulaciF3n_Online.CARRERA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.CARRERA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.CARRERA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.JORNADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.JORNADA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.JORNADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.JORNADA) %>',0);"><%= PostulaciF3n_Online.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.JORNADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.JORNADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.REGION_PROCEDENCIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.REGION_PROCEDENCIA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.REGION_PROCEDENCIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.REGION_PROCEDENCIA) %>',0);"><%= PostulaciF3n_Online.REGION_PROCEDENCIA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.REGION_PROCEDENCIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.REGION_PROCEDENCIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.MAIL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.MAIL))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.MAIL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.MAIL) %>',0);"><%= PostulaciF3n_Online.MAIL.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.MAIL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.MAIL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PAIS_PROCEDENCIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PAIS_PROCEDENCIA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PAIS_PROCEDENCIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PAIS_PROCEDENCIA) %>',0);"><%= PostulaciF3n_Online.PAIS_PROCEDENCIA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PAIS_PROCEDENCIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PAIS_PROCEDENCIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.TRAMO_RENTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TRAMO_RENTA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.TRAMO_RENTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TRAMO_RENTA) %>',0);"><%= PostulaciF3n_Online.TRAMO_RENTA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.TRAMO_RENTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.TRAMO_RENTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.CONVIVE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CONVIVE))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.CONVIVE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CONVIVE) %>',0);"><%= PostulaciF3n_Online.CONVIVE.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.CONVIVE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.CONVIVE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.INGRESO_FAMILIAR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.INGRESO_FAMILIAR))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.INGRESO_FAMILIAR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.INGRESO_FAMILIAR) %>',0);"><%= PostulaciF3n_Online.INGRESO_FAMILIAR.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.INGRESO_FAMILIAR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.INGRESO_FAMILIAR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.SALUD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.SALUD))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.SALUD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.SALUD) %>',0);"><%= PostulaciF3n_Online.SALUD.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.SALUD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.SALUD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.MOTIVO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.MOTIVO))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.MOTIVO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.MOTIVO) %>',0);"><%= PostulaciF3n_Online.MOTIVO.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.MOTIVO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.MOTIVO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.VIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.VIA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.VIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.VIA) %>',0);"><%= PostulaciF3n_Online.VIA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.VIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.VIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.TELEFONO_PARTICULAR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TELEFONO_PARTICULAR))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.TELEFONO_PARTICULAR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TELEFONO_PARTICULAR) %>',0);"><%= PostulaciF3n_Online.TELEFONO_PARTICULAR.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.TELEFONO_PARTICULAR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.TELEFONO_PARTICULAR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.TELEFONO_EMERGENCIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TELEFONO_EMERGENCIA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.TELEFONO_EMERGENCIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TELEFONO_EMERGENCIA) %>',0);"><%= PostulaciF3n_Online.TELEFONO_EMERGENCIA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.TELEFONO_EMERGENCIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.TELEFONO_EMERGENCIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.FECHA_POSTULACION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.FECHA_POSTULACION))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.FECHA_POSTULACION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.FECHA_POSTULACION) %>',0);"><%= PostulaciF3n_Online.FECHA_POSTULACION.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.FECHA_POSTULACION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.FECHA_POSTULACION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.DIRECCION_PROCEDENCIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.DIRECCION_PROCEDENCIA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.DIRECCION_PROCEDENCIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.DIRECCION_PROCEDENCIA) %>',0);"><%= PostulaciF3n_Online.DIRECCION_PROCEDENCIA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.DIRECCION_PROCEDENCIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.DIRECCION_PROCEDENCIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.CIUDAD_PROCEDENCIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CIUDAD_PROCEDENCIA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.CIUDAD_PROCEDENCIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CIUDAD_PROCEDENCIA) %>',0);"><%= PostulaciF3n_Online.CIUDAD_PROCEDENCIA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.CIUDAD_PROCEDENCIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.CIUDAD_PROCEDENCIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.COMUNA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.COMUNA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.COMUNA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.COMUNA) %>',0);"><%= PostulaciF3n_Online.COMUNA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.COMUNA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.COMUNA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.DIRECCION_ACTUAL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.DIRECCION_ACTUAL))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.DIRECCION_ACTUAL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.DIRECCION_ACTUAL) %>',0);"><%= PostulaciF3n_Online.DIRECCION_ACTUAL.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.DIRECCION_ACTUAL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.DIRECCION_ACTUAL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.CIUDAD_ACTUAL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CIUDAD_ACTUAL))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.CIUDAD_ACTUAL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CIUDAD_ACTUAL) %>',0);"><%= PostulaciF3n_Online.CIUDAD_ACTUAL.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.CIUDAD_ACTUAL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.CIUDAD_ACTUAL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.COMUNA_ACTUAL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.COMUNA_ACTUAL))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.COMUNA_ACTUAL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.COMUNA_ACTUAL) %>',0);"><%= PostulaciF3n_Online.COMUNA_ACTUAL.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.COMUNA_ACTUAL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.COMUNA_ACTUAL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.REGIONACTUAL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.REGIONACTUAL))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.REGIONACTUAL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.REGIONACTUAL) %>',0);"><%= PostulaciF3n_Online.REGIONACTUAL.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.REGIONACTUAL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.REGIONACTUAL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.ESTADO_CIVIL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.ESTADO_CIVIL))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.ESTADO_CIVIL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.ESTADO_CIVIL) %>',0);"><%= PostulaciF3n_Online.ESTADO_CIVIL.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.ESTADO_CIVIL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.ESTADO_CIVIL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.FECHA_NACIMIENTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.FECHA_NACIMIENTO))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.FECHA_NACIMIENTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.FECHA_NACIMIENTO) %>',0);"><%= PostulaciF3n_Online.FECHA_NACIMIENTO.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.FECHA_NACIMIENTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.FECHA_NACIMIENTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.GENERO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.GENERO))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.GENERO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.GENERO) %>',0);"><%= PostulaciF3n_Online.GENERO.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.GENERO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.GENERO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.TRABAJA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TRABAJA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.TRABAJA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TRABAJA) %>',0);"><%= PostulaciF3n_Online.TRABAJA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.TRABAJA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.TRABAJA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.TIPO_TRABAJO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TIPO_TRABAJO))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.TIPO_TRABAJO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TIPO_TRABAJO) %>',0);"><%= PostulaciF3n_Online.TIPO_TRABAJO.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.TIPO_TRABAJO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.TIPO_TRABAJO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.EMPRESA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.EMPRESA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.EMPRESA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.EMPRESA) %>',0);"><%= PostulaciF3n_Online.EMPRESA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.EMPRESA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.EMPRESA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.ACTIVIDAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.ACTIVIDAD))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.ACTIVIDAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.ACTIVIDAD) %>',0);"><%= PostulaciF3n_Online.ACTIVIDAD.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.ACTIVIDAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.ACTIVIDAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.DIRECCION_EMPRESA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.DIRECCION_EMPRESA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.DIRECCION_EMPRESA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.DIRECCION_EMPRESA) %>',0);"><%= PostulaciF3n_Online.DIRECCION_EMPRESA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.DIRECCION_EMPRESA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.DIRECCION_EMPRESA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.SOSTENEDOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.SOSTENEDOR))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.SOSTENEDOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.SOSTENEDOR) %>',0);"><%= PostulaciF3n_Online.SOSTENEDOR.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.SOSTENEDOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.SOSTENEDOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.NivelEducativoAlumno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.NivelEducativoAlumno))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.NivelEducativoAlumno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.NivelEducativoAlumno) %>',0);"><%= PostulaciF3n_Online.NivelEducativoAlumno.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.NivelEducativoAlumno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.NivelEducativoAlumno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.COLEGIO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.COLEGIO))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.COLEGIO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.COLEGIO) %>',0);"><%= PostulaciF3n_Online.COLEGIO.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.COLEGIO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.COLEGIO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.AD1O_EGRESO_COLEGIO))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.AD1O_EGRESO_COLEGIO) %>',0);"><%= PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.CONVALIDA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CONVALIDA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.CONVALIDA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.CONVALIDA) %>',0);"><%= PostulaciF3n_Online.CONVALIDA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.CONVALIDA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.CONVALIDA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.AD1O_PSU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.AD1O_PSU))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.AD1O_PSU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.AD1O_PSU) %>',0);"><%= PostulaciF3n_Online.AD1O_PSU.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.AD1O_PSU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.AD1O_PSU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA) %>',0);"><%= PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.TIPO_PRUEBA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TIPO_PRUEBA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.TIPO_PRUEBA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TIPO_PRUEBA) %>',0);"><%= PostulaciF3n_Online.TIPO_PRUEBA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.TIPO_PRUEBA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.TIPO_PRUEBA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS) %>',0);"><%= PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE) %>',0);"><%= PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PROMEDIO_PSU.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PROMEDIO_PSU))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PROMEDIO_PSU.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PROMEDIO_PSU) %>',0);"><%= PostulaciF3n_Online.PROMEDIO_PSU.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PROMEDIO_PSU.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PROMEDIO_PSU.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS) %>',0);"><%= PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE) %>',0);"><%= PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PROMEDIO_PAA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PROMEDIO_PAA))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PROMEDIO_PAA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PROMEDIO_PAA) %>',0);"><%= PostulaciF3n_Online.PROMEDIO_PAA.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PROMEDIO_PAA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PROMEDIO_PAA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.NUMERO_INTEGRANTES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.NUMERO_INTEGRANTES))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.NUMERO_INTEGRANTES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.NUMERO_INTEGRANTES) %>',0);"><%= PostulaciF3n_Online.NUMERO_INTEGRANTES.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.NUMERO_INTEGRANTES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.NUMERO_INTEGRANTES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.TIENE_HIJOS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TIENE_HIJOS))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.TIENE_HIJOS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.TIENE_HIJOS) %>',0);"><%= PostulaciF3n_Online.TIENE_HIJOS.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.TIENE_HIJOS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.TIENE_HIJOS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.OCUPACIONMadre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.OCUPACIONMadre))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.OCUPACIONMadre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.OCUPACIONMadre) %>',0);"><%= PostulaciF3n_Online.OCUPACIONMadre.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.OCUPACIONMadre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.OCUPACIONMadre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.EstudiosMadre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.EstudiosMadre))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.EstudiosMadre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.EstudiosMadre) %>',0);"><%= PostulaciF3n_Online.EstudiosMadre.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.EstudiosMadre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.EstudiosMadre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.OcupacionPadre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.OcupacionPadre))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.OcupacionPadre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.OcupacionPadre) %>',0);"><%= PostulaciF3n_Online.OcupacionPadre.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.OcupacionPadre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.OcupacionPadre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.EstudiosPadre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.EstudiosPadre))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.EstudiosPadre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.EstudiosPadre) %>',0);"><%= PostulaciF3n_Online.EstudiosPadre.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.EstudiosPadre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.EstudiosPadre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.ESTADO_POSTULACION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.ESTADO_POSTULACION))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.ESTADO_POSTULACION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.ESTADO_POSTULACION) %>',0);"><%= PostulaciF3n_Online.ESTADO_POSTULACION.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.ESTADO_POSTULACION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.ESTADO_POSTULACION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.FECHA_ACTUALIZACION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.FECHA_ACTUALIZACION))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.FECHA_ACTUALIZACION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.FECHA_ACTUALIZACION) %>',0);"><%= PostulaciF3n_Online.FECHA_ACTUALIZACION.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.FECHA_ACTUALIZACION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.FECHA_ACTUALIZACION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(PostulaciF3n_Online.Export)) Then %>
<%= PostulaciF3n_Online.PASO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PASO))) Then %>
		<td style="vertical-align: bottom;"><%= PostulaciF3n_Online.PASO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= PostulaciF3n_Online.SortUrl(PostulaciF3n_Online.PASO) %>',0);"><%= PostulaciF3n_Online.PASO.FldCaption() %></td><td style="width: 10px;">
		<% If (PostulaciF3n_Online.PASO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (PostulaciF3n_Online.PASO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		PostulaciF3n_Online_summary.ShowFirstHeader = False
	End If
	PostulaciF3n_Online_summary.RecCount += 1

		' Render detail row
		PostulaciF3n_Online.ResetCSS()
		PostulaciF3n_Online.RowType = EWRPT_ROWTYPE_DETAIL
		PostulaciF3n_Online_summary.RenderRow()
%>
	<tr<%= PostulaciF3n_Online.RowAttributes() %>>
		<td<%= PostulaciF3n_Online.RUT.CellAttributes %>>
<div<%= PostulaciF3n_Online.RUT.ViewAttributes%>><%= PostulaciF3n_Online.RUT.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.NOMBRE.CellAttributes %>>
<div<%= PostulaciF3n_Online.NOMBRE.ViewAttributes%>><%= PostulaciF3n_Online.NOMBRE.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PATERNO.CellAttributes %>>
<div<%= PostulaciF3n_Online.PATERNO.ViewAttributes%>><%= PostulaciF3n_Online.PATERNO.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.MATERNO.CellAttributes %>>
<div<%= PostulaciF3n_Online.MATERNO.ViewAttributes%>><%= PostulaciF3n_Online.MATERNO.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.CARRERA.CellAttributes %>>
<div<%= PostulaciF3n_Online.CARRERA.ViewAttributes%>><%= PostulaciF3n_Online.CARRERA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.JORNADA.CellAttributes %>>
<div<%= PostulaciF3n_Online.JORNADA.ViewAttributes%>><%= PostulaciF3n_Online.JORNADA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.REGION_PROCEDENCIA.CellAttributes %>>
<div<%= PostulaciF3n_Online.REGION_PROCEDENCIA.ViewAttributes%>><%= PostulaciF3n_Online.REGION_PROCEDENCIA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.MAIL.CellAttributes %>>
<div<%= PostulaciF3n_Online.MAIL.ViewAttributes%>><%= PostulaciF3n_Online.MAIL.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PAIS_PROCEDENCIA.CellAttributes %>>
<div<%= PostulaciF3n_Online.PAIS_PROCEDENCIA.ViewAttributes%>><%= PostulaciF3n_Online.PAIS_PROCEDENCIA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.TRAMO_RENTA.CellAttributes %>>
<div<%= PostulaciF3n_Online.TRAMO_RENTA.ViewAttributes%>><%= PostulaciF3n_Online.TRAMO_RENTA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.CONVIVE.CellAttributes %>>
<div<%= PostulaciF3n_Online.CONVIVE.ViewAttributes%>><%= PostulaciF3n_Online.CONVIVE.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.INGRESO_FAMILIAR.CellAttributes %>>
<div<%= PostulaciF3n_Online.INGRESO_FAMILIAR.ViewAttributes%>><%= PostulaciF3n_Online.INGRESO_FAMILIAR.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.SALUD.CellAttributes %>>
<div<%= PostulaciF3n_Online.SALUD.ViewAttributes%>><%= PostulaciF3n_Online.SALUD.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.MOTIVO.CellAttributes %>>
<div<%= PostulaciF3n_Online.MOTIVO.ViewAttributes%>><%= PostulaciF3n_Online.MOTIVO.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.VIA.CellAttributes %>>
<div<%= PostulaciF3n_Online.VIA.ViewAttributes%>><%= PostulaciF3n_Online.VIA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.TELEFONO_PARTICULAR.CellAttributes %>>
<div<%= PostulaciF3n_Online.TELEFONO_PARTICULAR.ViewAttributes%>><%= PostulaciF3n_Online.TELEFONO_PARTICULAR.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.TELEFONO_EMERGENCIA.CellAttributes %>>
<div<%= PostulaciF3n_Online.TELEFONO_EMERGENCIA.ViewAttributes%>><%= PostulaciF3n_Online.TELEFONO_EMERGENCIA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.FECHA_POSTULACION.CellAttributes %>>
<div<%= PostulaciF3n_Online.FECHA_POSTULACION.ViewAttributes%>><%= PostulaciF3n_Online.FECHA_POSTULACION.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.DIRECCION_PROCEDENCIA.CellAttributes %>>
<div<%= PostulaciF3n_Online.DIRECCION_PROCEDENCIA.ViewAttributes%>><%= PostulaciF3n_Online.DIRECCION_PROCEDENCIA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.CIUDAD_PROCEDENCIA.CellAttributes %>>
<div<%= PostulaciF3n_Online.CIUDAD_PROCEDENCIA.ViewAttributes%>><%= PostulaciF3n_Online.CIUDAD_PROCEDENCIA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.COMUNA.CellAttributes %>>
<div<%= PostulaciF3n_Online.COMUNA.ViewAttributes%>><%= PostulaciF3n_Online.COMUNA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.DIRECCION_ACTUAL.CellAttributes %>>
<div<%= PostulaciF3n_Online.DIRECCION_ACTUAL.ViewAttributes%>><%= PostulaciF3n_Online.DIRECCION_ACTUAL.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.CIUDAD_ACTUAL.CellAttributes %>>
<div<%= PostulaciF3n_Online.CIUDAD_ACTUAL.ViewAttributes%>><%= PostulaciF3n_Online.CIUDAD_ACTUAL.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.COMUNA_ACTUAL.CellAttributes %>>
<div<%= PostulaciF3n_Online.COMUNA_ACTUAL.ViewAttributes%>><%= PostulaciF3n_Online.COMUNA_ACTUAL.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.REGIONACTUAL.CellAttributes %>>
<div<%= PostulaciF3n_Online.REGIONACTUAL.ViewAttributes%>><%= PostulaciF3n_Online.REGIONACTUAL.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.ESTADO_CIVIL.CellAttributes %>>
<div<%= PostulaciF3n_Online.ESTADO_CIVIL.ViewAttributes%>><%= PostulaciF3n_Online.ESTADO_CIVIL.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.FECHA_NACIMIENTO.CellAttributes %>>
<div<%= PostulaciF3n_Online.FECHA_NACIMIENTO.ViewAttributes%>><%= PostulaciF3n_Online.FECHA_NACIMIENTO.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.GENERO.CellAttributes %>>
<div<%= PostulaciF3n_Online.GENERO.ViewAttributes%>><%= PostulaciF3n_Online.GENERO.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.TRABAJA.CellAttributes %>>
<div<%= PostulaciF3n_Online.TRABAJA.ViewAttributes%>><%= PostulaciF3n_Online.TRABAJA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.TIPO_TRABAJO.CellAttributes %>>
<div<%= PostulaciF3n_Online.TIPO_TRABAJO.ViewAttributes%>><%= PostulaciF3n_Online.TIPO_TRABAJO.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.EMPRESA.CellAttributes %>>
<div<%= PostulaciF3n_Online.EMPRESA.ViewAttributes%>><%= PostulaciF3n_Online.EMPRESA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.ACTIVIDAD.CellAttributes %>>
<div<%= PostulaciF3n_Online.ACTIVIDAD.ViewAttributes%>><%= PostulaciF3n_Online.ACTIVIDAD.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.DIRECCION_EMPRESA.CellAttributes %>>
<div<%= PostulaciF3n_Online.DIRECCION_EMPRESA.ViewAttributes%>><%= PostulaciF3n_Online.DIRECCION_EMPRESA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.SOSTENEDOR.CellAttributes %>>
<div<%= PostulaciF3n_Online.SOSTENEDOR.ViewAttributes%>><%= PostulaciF3n_Online.SOSTENEDOR.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.NivelEducativoAlumno.CellAttributes %>>
<div<%= PostulaciF3n_Online.NivelEducativoAlumno.ViewAttributes%>><%= PostulaciF3n_Online.NivelEducativoAlumno.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.COLEGIO.CellAttributes %>>
<div<%= PostulaciF3n_Online.COLEGIO.ViewAttributes%>><%= PostulaciF3n_Online.COLEGIO.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.CellAttributes %>>
<div<%= PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.ViewAttributes%>><%= PostulaciF3n_Online.AD1O_EGRESO_COLEGIO.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.CONVALIDA.CellAttributes %>>
<div<%= PostulaciF3n_Online.CONVALIDA.ViewAttributes%>><%= PostulaciF3n_Online.CONVALIDA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.AD1O_PSU.CellAttributes %>>
<div<%= PostulaciF3n_Online.AD1O_PSU.ViewAttributes%>><%= PostulaciF3n_Online.AD1O_PSU.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.CellAttributes %>>
<div<%= PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.ViewAttributes%>><%= PostulaciF3n_Online.PROMEDIO_ENSED1ANZA_MEDIA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.TIPO_PRUEBA.CellAttributes %>>
<div<%= PostulaciF3n_Online.TIPO_PRUEBA.ViewAttributes%>><%= PostulaciF3n_Online.TIPO_PRUEBA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.CellAttributes %>>
<div<%= PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.ViewAttributes%>><%= PostulaciF3n_Online.PUNTAJE_PSU_MATEMATICAS.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.CellAttributes %>>
<div<%= PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.ViewAttributes%>><%= PostulaciF3n_Online.PUNTAJE_PSU_LENGUAJE.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PROMEDIO_PSU.CellAttributes %>>
<div<%= PostulaciF3n_Online.PROMEDIO_PSU.ViewAttributes%>><%= PostulaciF3n_Online.PROMEDIO_PSU.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.CellAttributes %>>
<div<%= PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.ViewAttributes%>><%= PostulaciF3n_Online.PUNTAJE_PAA_MATEMATICAS.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.CellAttributes %>>
<div<%= PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.ViewAttributes%>><%= PostulaciF3n_Online.PUNTAJE_PAA_LENGUAJE.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PROMEDIO_PAA.CellAttributes %>>
<div<%= PostulaciF3n_Online.PROMEDIO_PAA.ViewAttributes%>><%= PostulaciF3n_Online.PROMEDIO_PAA.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.NUMERO_INTEGRANTES.CellAttributes %>>
<div<%= PostulaciF3n_Online.NUMERO_INTEGRANTES.ViewAttributes%>><%= PostulaciF3n_Online.NUMERO_INTEGRANTES.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.TIENE_HIJOS.CellAttributes %>>
<div<%= PostulaciF3n_Online.TIENE_HIJOS.ViewAttributes%>><%= PostulaciF3n_Online.TIENE_HIJOS.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.OCUPACIONMadre.CellAttributes %>>
<div<%= PostulaciF3n_Online.OCUPACIONMadre.ViewAttributes%>><%= PostulaciF3n_Online.OCUPACIONMadre.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.EstudiosMadre.CellAttributes %>>
<div<%= PostulaciF3n_Online.EstudiosMadre.ViewAttributes%>><%= PostulaciF3n_Online.EstudiosMadre.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.OcupacionPadre.CellAttributes %>>
<div<%= PostulaciF3n_Online.OcupacionPadre.ViewAttributes%>><%= PostulaciF3n_Online.OcupacionPadre.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.EstudiosPadre.CellAttributes %>>
<div<%= PostulaciF3n_Online.EstudiosPadre.ViewAttributes%>><%= PostulaciF3n_Online.EstudiosPadre.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.ESTADO_POSTULACION.CellAttributes %>>
<div<%= PostulaciF3n_Online.ESTADO_POSTULACION.ViewAttributes%>><%= PostulaciF3n_Online.ESTADO_POSTULACION.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.FECHA_ACTUALIZACION.CellAttributes %>>
<div<%= PostulaciF3n_Online.FECHA_ACTUALIZACION.ViewAttributes%>><%= PostulaciF3n_Online.FECHA_ACTUALIZACION.ListViewValue%></div>
</td>
		<td<%= PostulaciF3n_Online.PASO.CellAttributes %>>
<div<%= PostulaciF3n_Online.PASO.ViewAttributes%>><%= PostulaciF3n_Online.PASO.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		PostulaciF3n_Online_summary.AccumulateSummary()

		' Get next record
		PostulaciF3n_Online_summary.GetRow() ' ASPXRPT
		PostulaciF3n_Online_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (PostulaciF3n_Online_summary.TotalGrps > 0) Then
	PostulaciF3n_Online.ResetCSS()
	PostulaciF3n_Online.RowType = EWRPT_ROWTYPE_TOTAL
	PostulaciF3n_Online.RowTotalType = EWRPT_ROWTOTAL_GRAND
	PostulaciF3n_Online.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	PostulaciF3n_Online.RowAttrs("class") = "ewRptGrandSummary"
	PostulaciF3n_Online_summary.RenderRow()
%>
	<!-- tr><td colspan="56"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= PostulaciF3n_Online.RowAttributes() %>><td colspan="56"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(PostulaciF3n_Online_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (PostulaciF3n_Online.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If PostulaciF3n_Online_summary.Pager Is Nothing Then PostulaciF3n_Online_summary.Pager = New cPrevNextPager(PostulaciF3n_Online_summary.StartGrp, PostulaciF3n_Online_summary.DisplayGrps, PostulaciF3n_Online_summary.TotalGrps) %>
<% If PostulaciF3n_Online_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If PostulaciF3n_Online_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="PostulaciF3n_Onlinesmry.aspx?start=<%= PostulaciF3n_Online_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If PostulaciF3n_Online_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="PostulaciF3n_Onlinesmry.aspx?start=<%= PostulaciF3n_Online_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= PostulaciF3n_Online_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If PostulaciF3n_Online_summary.Pager.NextButton.Enabled Then %>
	<td><a href="PostulaciF3n_Onlinesmry.aspx?start=<%= PostulaciF3n_Online_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If PostulaciF3n_Online_summary.Pager.LastButton.Enabled Then %>
	<td><a href="PostulaciF3n_Onlinesmry.aspx?start=<%= PostulaciF3n_Online_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= PostulaciF3n_Online_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= PostulaciF3n_Online_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= PostulaciF3n_Online_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= PostulaciF3n_Online_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If PostulaciF3n_Online_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (PostulaciF3n_Online_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If PostulaciF3n_Online_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If PostulaciF3n_Online_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If PostulaciF3n_Online_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (PostulaciF3n_Online.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (PostulaciF3n_Online.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (PostulaciF3n_Online.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% PostulaciF3n_Online_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (PostulaciF3n_Online.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
