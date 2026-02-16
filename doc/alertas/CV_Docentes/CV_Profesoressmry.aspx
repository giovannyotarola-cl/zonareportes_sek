<%@ Page ClassName="CV_Profesoressmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_CVTotal" %>
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
	Public CV_Profesores As crCV_Profesores = Nothing

	'
	' Table class (for CV Profesores)
	'
	Public Class crCV_Profesores
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
				Return "CV_Profesores"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "CV Profesores"
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

		Public RUT_Profesor As crField

		Public AP_PATER As crField

		Public AP_MATER As crField

		Public NOMBRES As crField

		Public Extension_Nombre As crField

		Public Extension_Responsable As crField

		Public Expresion_Institucion As crField

		Public Extension_Duracion As crField

		Public GradosAc_Grado As crField

		Public GradosAc_Nombre As crField

		Public GradosAc_Ano As crField

		Public GradosAc_Institucion As crField

		Public GradosAc_NombreInst As crField

		Public GradosAc_PaisInst As crField

		Public Investigacion_Nombre As crField

		Public Investigacion_Director As crField

		Public Investigacion_Institucion As crField

		Public Investigacion_Monto As crField

		Public Investigacion_Duracion As crField

		Public ProgramaAc_Programa As crField

		Public Exp_Institucion As crField

		Public Exp_Programa As crField

		Public Exp_Facultad As crField

		Public Exp_Asignatura As crField

		Public Exp_Pais As crField

		Public Exp_FechInicio As crField

		Public Exp_FechaFin As crField

		Public Exp_Ano As crField

		Public Exp_Tipo As crField

		Public Perf_Institucion As crField

		Public Perf_Curso As crField

		Public Perf_Materia As crField

		Public Perf_Ano As crField

		Public Perf_Tipo As crField

		Public Membr_Nombre As crField

		Public Idiomas_Nombre As crField

		Public Idiomas_Hablado As crField

		Public Idiomas_Leido As crField

		Public Idiomas_Escrito As crField

		Public Becas_Nombre As crField

		Public Becas_Institucion As crField

		Public Becas_Ano As crField

		Public TipoP_Publicacion As crField

		Public TipoP_Lib As crField

		Public TipoP_Art As crField

		Public TipoP_Ars As crField

		Public TipoP_Arn As crField

		Public Publicacion_Titulo As crField

		Public Publicacion_Nombre As crField

		Public Publicacion_Editorial As crField

		Public Publicacion_Autor As crField

		Public Publicacion_Articulo As crField

		Public Publicacion_Ano As crField

		Public Publicacion_Fecha As crField

		Public Publicacion_Tipo As crField

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

			' RUT_Profesor
			RUT_Profesor = new crField("CV_Profesores", "CV Profesores", "x_RUT_Profesor", "RUT_Profesor", "[RUT_Profesor]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT_Profesor.Page = APage
			RUT_Profesor.ParentPage = APage.ParentPage
			RUT_Profesor.GroupingFieldId = 1
			Fields.Add("RUT_Profesor", RUT_Profesor)
			RUT_Profesor.DateFilter = ""
			RUT_Profesor.SqlSelect = ""
			RUT_Profesor.SqlOrderBy = ""
			RUT_Profesor.FldGroupByType = ""
			RUT_Profesor.FldGroupInt = "0"
			RUT_Profesor.FldGroupSql = ""

			' AP_PATER
			AP_PATER = new crField("CV_Profesores", "CV Profesores", "x_AP_PATER", "AP_PATER", "[AP_PATER]", 200, EWRPT_DATATYPE_STRING, -1)
			AP_PATER.Page = APage
			AP_PATER.ParentPage = APage.ParentPage
			AP_PATER.GroupingFieldId = 2
			Fields.Add("AP_PATER", AP_PATER)
			AP_PATER.DateFilter = ""
			AP_PATER.SqlSelect = ""
			AP_PATER.SqlOrderBy = ""
			AP_PATER.FldGroupByType = ""
			AP_PATER.FldGroupInt = "0"
			AP_PATER.FldGroupSql = ""

			' AP_MATER
			AP_MATER = new crField("CV_Profesores", "CV Profesores", "x_AP_MATER", "AP_MATER", "[AP_MATER]", 200, EWRPT_DATATYPE_STRING, -1)
			AP_MATER.Page = APage
			AP_MATER.ParentPage = APage.ParentPage
			AP_MATER.GroupingFieldId = 3
			Fields.Add("AP_MATER", AP_MATER)
			AP_MATER.DateFilter = ""
			AP_MATER.SqlSelect = ""
			AP_MATER.SqlOrderBy = ""
			AP_MATER.FldGroupByType = ""
			AP_MATER.FldGroupInt = "0"
			AP_MATER.FldGroupSql = ""

			' NOMBRES
			NOMBRES = new crField("CV_Profesores", "CV Profesores", "x_NOMBRES", "NOMBRES", "[NOMBRES]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRES.Page = APage
			NOMBRES.ParentPage = APage.ParentPage
			NOMBRES.GroupingFieldId = 4
			Fields.Add("NOMBRES", NOMBRES)
			NOMBRES.DateFilter = ""
			NOMBRES.SqlSelect = ""
			NOMBRES.SqlOrderBy = ""
			NOMBRES.FldGroupByType = ""
			NOMBRES.FldGroupInt = "0"
			NOMBRES.FldGroupSql = ""

			' Extension_Nombre
			Extension_Nombre = new crField("CV_Profesores", "CV Profesores", "x_Extension_Nombre", "Extension_Nombre", "[Extension_Nombre]", 200, EWRPT_DATATYPE_STRING, -1)
			Extension_Nombre.Page = APage
			Extension_Nombre.ParentPage = APage.ParentPage
			Fields.Add("Extension_Nombre", Extension_Nombre)
			Extension_Nombre.DateFilter = ""
			Extension_Nombre.SqlSelect = ""
			Extension_Nombre.SqlOrderBy = ""

			' Extension_Responsable
			Extension_Responsable = new crField("CV_Profesores", "CV Profesores", "x_Extension_Responsable", "Extension_Responsable", "[Extension_Responsable]", 200, EWRPT_DATATYPE_STRING, -1)
			Extension_Responsable.Page = APage
			Extension_Responsable.ParentPage = APage.ParentPage
			Fields.Add("Extension_Responsable", Extension_Responsable)
			Extension_Responsable.DateFilter = ""
			Extension_Responsable.SqlSelect = ""
			Extension_Responsable.SqlOrderBy = ""

			' Expresion_Institucion
			Expresion_Institucion = new crField("CV_Profesores", "CV Profesores", "x_Expresion_Institucion", "Expresion_Institucion", "[Expresion_Institucion]", 200, EWRPT_DATATYPE_STRING, -1)
			Expresion_Institucion.Page = APage
			Expresion_Institucion.ParentPage = APage.ParentPage
			Fields.Add("Expresion_Institucion", Expresion_Institucion)
			Expresion_Institucion.DateFilter = ""
			Expresion_Institucion.SqlSelect = ""
			Expresion_Institucion.SqlOrderBy = ""

			' Extension_Duracion
			Extension_Duracion = new crField("CV_Profesores", "CV Profesores", "x_Extension_Duracion", "Extension_Duracion", "[Extension_Duracion]", 200, EWRPT_DATATYPE_STRING, -1)
			Extension_Duracion.Page = APage
			Extension_Duracion.ParentPage = APage.ParentPage
			Fields.Add("Extension_Duracion", Extension_Duracion)
			Extension_Duracion.DateFilter = ""
			Extension_Duracion.SqlSelect = ""
			Extension_Duracion.SqlOrderBy = ""

			' GradosAc_Grado
			GradosAc_Grado = new crField("CV_Profesores", "CV Profesores", "x_GradosAc_Grado", "GradosAc_Grado", "[GradosAc_Grado]", 200, EWRPT_DATATYPE_STRING, -1)
			GradosAc_Grado.Page = APage
			GradosAc_Grado.ParentPage = APage.ParentPage
			Fields.Add("GradosAc_Grado", GradosAc_Grado)
			GradosAc_Grado.DateFilter = ""
			GradosAc_Grado.SqlSelect = ""
			GradosAc_Grado.SqlOrderBy = ""

			' GradosAc_Nombre
			GradosAc_Nombre = new crField("CV_Profesores", "CV Profesores", "x_GradosAc_Nombre", "GradosAc_Nombre", "[GradosAc_Nombre]", 200, EWRPT_DATATYPE_STRING, -1)
			GradosAc_Nombre.Page = APage
			GradosAc_Nombre.ParentPage = APage.ParentPage
			Fields.Add("GradosAc_Nombre", GradosAc_Nombre)
			GradosAc_Nombre.DateFilter = ""
			GradosAc_Nombre.SqlSelect = ""
			GradosAc_Nombre.SqlOrderBy = ""

			' GradosAc_Ano
			GradosAc_Ano = new crField("CV_Profesores", "CV Profesores", "x_GradosAc_Ano", "GradosAc_Ano", "[GradosAc_Ano]", 135, EWRPT_DATATYPE_DATE, 7)
			GradosAc_Ano.Page = APage
			GradosAc_Ano.ParentPage = APage.ParentPage
			GradosAc_Ano.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("GradosAc_Ano", GradosAc_Ano)
			GradosAc_Ano.DateFilter = ""
			GradosAc_Ano.SqlSelect = ""
			GradosAc_Ano.SqlOrderBy = ""

			' GradosAc_Institucion
			GradosAc_Institucion = new crField("CV_Profesores", "CV Profesores", "x_GradosAc_Institucion", "GradosAc_Institucion", "[GradosAc_Institucion]", 200, EWRPT_DATATYPE_STRING, -1)
			GradosAc_Institucion.Page = APage
			GradosAc_Institucion.ParentPage = APage.ParentPage
			Fields.Add("GradosAc_Institucion", GradosAc_Institucion)
			GradosAc_Institucion.DateFilter = ""
			GradosAc_Institucion.SqlSelect = ""
			GradosAc_Institucion.SqlOrderBy = ""

			' GradosAc_NombreInst
			GradosAc_NombreInst = new crField("CV_Profesores", "CV Profesores", "x_GradosAc_NombreInst", "GradosAc_NombreInst", "[GradosAc_NombreInst]", 200, EWRPT_DATATYPE_STRING, -1)
			GradosAc_NombreInst.Page = APage
			GradosAc_NombreInst.ParentPage = APage.ParentPage
			Fields.Add("GradosAc_NombreInst", GradosAc_NombreInst)
			GradosAc_NombreInst.DateFilter = ""
			GradosAc_NombreInst.SqlSelect = ""
			GradosAc_NombreInst.SqlOrderBy = ""

			' GradosAc_PaisInst
			GradosAc_PaisInst = new crField("CV_Profesores", "CV Profesores", "x_GradosAc_PaisInst", "GradosAc_PaisInst", "[GradosAc_PaisInst]", 200, EWRPT_DATATYPE_STRING, -1)
			GradosAc_PaisInst.Page = APage
			GradosAc_PaisInst.ParentPage = APage.ParentPage
			Fields.Add("GradosAc_PaisInst", GradosAc_PaisInst)
			GradosAc_PaisInst.DateFilter = ""
			GradosAc_PaisInst.SqlSelect = ""
			GradosAc_PaisInst.SqlOrderBy = ""

			' Investigacion_Nombre
			Investigacion_Nombre = new crField("CV_Profesores", "CV Profesores", "x_Investigacion_Nombre", "Investigacion_Nombre", "[Investigacion_Nombre]", 200, EWRPT_DATATYPE_STRING, -1)
			Investigacion_Nombre.Page = APage
			Investigacion_Nombre.ParentPage = APage.ParentPage
			Fields.Add("Investigacion_Nombre", Investigacion_Nombre)
			Investigacion_Nombre.DateFilter = ""
			Investigacion_Nombre.SqlSelect = ""
			Investigacion_Nombre.SqlOrderBy = ""

			' Investigacion_Director
			Investigacion_Director = new crField("CV_Profesores", "CV Profesores", "x_Investigacion_Director", "Investigacion_Director", "[Investigacion_Director]", 200, EWRPT_DATATYPE_STRING, -1)
			Investigacion_Director.Page = APage
			Investigacion_Director.ParentPage = APage.ParentPage
			Fields.Add("Investigacion_Director", Investigacion_Director)
			Investigacion_Director.DateFilter = ""
			Investigacion_Director.SqlSelect = ""
			Investigacion_Director.SqlOrderBy = ""

			' Investigacion_Institucion
			Investigacion_Institucion = new crField("CV_Profesores", "CV Profesores", "x_Investigacion_Institucion", "Investigacion_Institucion", "[Investigacion_Institucion]", 200, EWRPT_DATATYPE_STRING, -1)
			Investigacion_Institucion.Page = APage
			Investigacion_Institucion.ParentPage = APage.ParentPage
			Fields.Add("Investigacion_Institucion", Investigacion_Institucion)
			Investigacion_Institucion.DateFilter = ""
			Investigacion_Institucion.SqlSelect = ""
			Investigacion_Institucion.SqlOrderBy = ""

			' Investigacion_Monto
			Investigacion_Monto = new crField("CV_Profesores", "CV Profesores", "x_Investigacion_Monto", "Investigacion_Monto", "[Investigacion_Monto]", 3, EWRPT_DATATYPE_NUMBER, -1)
			Investigacion_Monto.Page = APage
			Investigacion_Monto.ParentPage = APage.ParentPage
			Investigacion_Monto.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("Investigacion_Monto", Investigacion_Monto)
			Investigacion_Monto.DateFilter = ""
			Investigacion_Monto.SqlSelect = ""
			Investigacion_Monto.SqlOrderBy = ""

			' Investigacion_Duracion
			Investigacion_Duracion = new crField("CV_Profesores", "CV Profesores", "x_Investigacion_Duracion", "Investigacion_Duracion", "[Investigacion_Duracion]", 200, EWRPT_DATATYPE_STRING, -1)
			Investigacion_Duracion.Page = APage
			Investigacion_Duracion.ParentPage = APage.ParentPage
			Fields.Add("Investigacion_Duracion", Investigacion_Duracion)
			Investigacion_Duracion.DateFilter = ""
			Investigacion_Duracion.SqlSelect = ""
			Investigacion_Duracion.SqlOrderBy = ""

			' ProgramaAc_Programa
			ProgramaAc_Programa = new crField("CV_Profesores", "CV Profesores", "x_ProgramaAc_Programa", "ProgramaAc_Programa", "[ProgramaAc_Programa]", 200, EWRPT_DATATYPE_STRING, -1)
			ProgramaAc_Programa.Page = APage
			ProgramaAc_Programa.ParentPage = APage.ParentPage
			Fields.Add("ProgramaAc_Programa", ProgramaAc_Programa)
			ProgramaAc_Programa.DateFilter = ""
			ProgramaAc_Programa.SqlSelect = ""
			ProgramaAc_Programa.SqlOrderBy = ""

			' Exp_Institucion
			Exp_Institucion = new crField("CV_Profesores", "CV Profesores", "x_Exp_Institucion", "Exp_Institucion", "[Exp_Institucion]", 200, EWRPT_DATATYPE_STRING, -1)
			Exp_Institucion.Page = APage
			Exp_Institucion.ParentPage = APage.ParentPage
			Fields.Add("Exp_Institucion", Exp_Institucion)
			Exp_Institucion.DateFilter = ""
			Exp_Institucion.SqlSelect = ""
			Exp_Institucion.SqlOrderBy = ""

			' Exp_Programa
			Exp_Programa = new crField("CV_Profesores", "CV Profesores", "x_Exp_Programa", "Exp_Programa", "[Exp_Programa]", 200, EWRPT_DATATYPE_STRING, -1)
			Exp_Programa.Page = APage
			Exp_Programa.ParentPage = APage.ParentPage
			Fields.Add("Exp_Programa", Exp_Programa)
			Exp_Programa.DateFilter = ""
			Exp_Programa.SqlSelect = ""
			Exp_Programa.SqlOrderBy = ""

			' Exp_Facultad
			Exp_Facultad = new crField("CV_Profesores", "CV Profesores", "x_Exp_Facultad", "Exp_Facultad", "[Exp_Facultad]", 200, EWRPT_DATATYPE_STRING, -1)
			Exp_Facultad.Page = APage
			Exp_Facultad.ParentPage = APage.ParentPage
			Fields.Add("Exp_Facultad", Exp_Facultad)
			Exp_Facultad.DateFilter = ""
			Exp_Facultad.SqlSelect = ""
			Exp_Facultad.SqlOrderBy = ""

			' Exp_Asignatura
			Exp_Asignatura = new crField("CV_Profesores", "CV Profesores", "x_Exp_Asignatura", "Exp_Asignatura", "[Exp_Asignatura]", 200, EWRPT_DATATYPE_STRING, -1)
			Exp_Asignatura.Page = APage
			Exp_Asignatura.ParentPage = APage.ParentPage
			Fields.Add("Exp_Asignatura", Exp_Asignatura)
			Exp_Asignatura.DateFilter = ""
			Exp_Asignatura.SqlSelect = ""
			Exp_Asignatura.SqlOrderBy = ""

			' Exp_Pais
			Exp_Pais = new crField("CV_Profesores", "CV Profesores", "x_Exp_Pais", "Exp_Pais", "[Exp_Pais]", 200, EWRPT_DATATYPE_STRING, -1)
			Exp_Pais.Page = APage
			Exp_Pais.ParentPage = APage.ParentPage
			Fields.Add("Exp_Pais", Exp_Pais)
			Exp_Pais.DateFilter = ""
			Exp_Pais.SqlSelect = ""
			Exp_Pais.SqlOrderBy = ""

			' Exp_FechInicio
			Exp_FechInicio = new crField("CV_Profesores", "CV Profesores", "x_Exp_FechInicio", "Exp_FechInicio", "[Exp_FechInicio]", 135, EWRPT_DATATYPE_DATE, 7)
			Exp_FechInicio.Page = APage
			Exp_FechInicio.ParentPage = APage.ParentPage
			Exp_FechInicio.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("Exp_FechInicio", Exp_FechInicio)
			Exp_FechInicio.DateFilter = ""
			Exp_FechInicio.SqlSelect = ""
			Exp_FechInicio.SqlOrderBy = ""

			' Exp_FechaFin
			Exp_FechaFin = new crField("CV_Profesores", "CV Profesores", "x_Exp_FechaFin", "Exp_FechaFin", "[Exp_FechaFin]", 135, EWRPT_DATATYPE_DATE, 7)
			Exp_FechaFin.Page = APage
			Exp_FechaFin.ParentPage = APage.ParentPage
			Exp_FechaFin.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("Exp_FechaFin", Exp_FechaFin)
			Exp_FechaFin.DateFilter = ""
			Exp_FechaFin.SqlSelect = ""
			Exp_FechaFin.SqlOrderBy = ""

			' Exp_Ano
			Exp_Ano = new crField("CV_Profesores", "CV Profesores", "x_Exp_Ano", "Exp_Ano", "[Exp_Ano]", 200, EWRPT_DATATYPE_STRING, -1)
			Exp_Ano.Page = APage
			Exp_Ano.ParentPage = APage.ParentPage
			Fields.Add("Exp_Ano", Exp_Ano)
			Exp_Ano.DateFilter = ""
			Exp_Ano.SqlSelect = ""
			Exp_Ano.SqlOrderBy = ""

			' Exp_Tipo
			Exp_Tipo = new crField("CV_Profesores", "CV Profesores", "x_Exp_Tipo", "Exp_Tipo", "[Exp_Tipo]", 200, EWRPT_DATATYPE_STRING, -1)
			Exp_Tipo.Page = APage
			Exp_Tipo.ParentPage = APage.ParentPage
			Fields.Add("Exp_Tipo", Exp_Tipo)
			Exp_Tipo.DateFilter = ""
			Exp_Tipo.SqlSelect = ""
			Exp_Tipo.SqlOrderBy = ""

			' Perf_Institucion
			Perf_Institucion = new crField("CV_Profesores", "CV Profesores", "x_Perf_Institucion", "Perf_Institucion", "[Perf_Institucion]", 200, EWRPT_DATATYPE_STRING, -1)
			Perf_Institucion.Page = APage
			Perf_Institucion.ParentPage = APage.ParentPage
			Fields.Add("Perf_Institucion", Perf_Institucion)
			Perf_Institucion.DateFilter = ""
			Perf_Institucion.SqlSelect = ""
			Perf_Institucion.SqlOrderBy = ""

			' Perf_Curso
			Perf_Curso = new crField("CV_Profesores", "CV Profesores", "x_Perf_Curso", "Perf_Curso", "[Perf_Curso]", 200, EWRPT_DATATYPE_STRING, -1)
			Perf_Curso.Page = APage
			Perf_Curso.ParentPage = APage.ParentPage
			Fields.Add("Perf_Curso", Perf_Curso)
			Perf_Curso.DateFilter = ""
			Perf_Curso.SqlSelect = ""
			Perf_Curso.SqlOrderBy = ""

			' Perf_Materia
			Perf_Materia = new crField("CV_Profesores", "CV Profesores", "x_Perf_Materia", "Perf_Materia", "[Perf_Materia]", 200, EWRPT_DATATYPE_STRING, -1)
			Perf_Materia.Page = APage
			Perf_Materia.ParentPage = APage.ParentPage
			Fields.Add("Perf_Materia", Perf_Materia)
			Perf_Materia.DateFilter = ""
			Perf_Materia.SqlSelect = ""
			Perf_Materia.SqlOrderBy = ""

			' Perf_Ano
			Perf_Ano = new crField("CV_Profesores", "CV Profesores", "x_Perf_Ano", "Perf_Ano", "[Perf_Ano]", 200, EWRPT_DATATYPE_STRING, -1)
			Perf_Ano.Page = APage
			Perf_Ano.ParentPage = APage.ParentPage
			Fields.Add("Perf_Ano", Perf_Ano)
			Perf_Ano.DateFilter = ""
			Perf_Ano.SqlSelect = ""
			Perf_Ano.SqlOrderBy = ""

			' Perf_Tipo
			Perf_Tipo = new crField("CV_Profesores", "CV Profesores", "x_Perf_Tipo", "Perf_Tipo", "[Perf_Tipo]", 200, EWRPT_DATATYPE_STRING, -1)
			Perf_Tipo.Page = APage
			Perf_Tipo.ParentPage = APage.ParentPage
			Fields.Add("Perf_Tipo", Perf_Tipo)
			Perf_Tipo.DateFilter = ""
			Perf_Tipo.SqlSelect = ""
			Perf_Tipo.SqlOrderBy = ""

			' Membr_Nombre
			Membr_Nombre = new crField("CV_Profesores", "CV Profesores", "x_Membr_Nombre", "Membr_Nombre", "[Membr_Nombre]", 200, EWRPT_DATATYPE_STRING, -1)
			Membr_Nombre.Page = APage
			Membr_Nombre.ParentPage = APage.ParentPage
			Fields.Add("Membr_Nombre", Membr_Nombre)
			Membr_Nombre.DateFilter = ""
			Membr_Nombre.SqlSelect = ""
			Membr_Nombre.SqlOrderBy = ""

			' Idiomas_Nombre
			Idiomas_Nombre = new crField("CV_Profesores", "CV Profesores", "x_Idiomas_Nombre", "Idiomas_Nombre", "[Idiomas_Nombre]", 200, EWRPT_DATATYPE_STRING, -1)
			Idiomas_Nombre.Page = APage
			Idiomas_Nombre.ParentPage = APage.ParentPage
			Fields.Add("Idiomas_Nombre", Idiomas_Nombre)
			Idiomas_Nombre.DateFilter = ""
			Idiomas_Nombre.SqlSelect = ""
			Idiomas_Nombre.SqlOrderBy = ""

			' Idiomas_Hablado
			Idiomas_Hablado = new crField("CV_Profesores", "CV Profesores", "x_Idiomas_Hablado", "Idiomas_Hablado", "[Idiomas_Hablado]", 200, EWRPT_DATATYPE_STRING, -1)
			Idiomas_Hablado.Page = APage
			Idiomas_Hablado.ParentPage = APage.ParentPage
			Fields.Add("Idiomas_Hablado", Idiomas_Hablado)
			Idiomas_Hablado.DateFilter = ""
			Idiomas_Hablado.SqlSelect = ""
			Idiomas_Hablado.SqlOrderBy = ""

			' Idiomas_Leido
			Idiomas_Leido = new crField("CV_Profesores", "CV Profesores", "x_Idiomas_Leido", "Idiomas_Leido", "[Idiomas_Leido]", 200, EWRPT_DATATYPE_STRING, -1)
			Idiomas_Leido.Page = APage
			Idiomas_Leido.ParentPage = APage.ParentPage
			Fields.Add("Idiomas_Leido", Idiomas_Leido)
			Idiomas_Leido.DateFilter = ""
			Idiomas_Leido.SqlSelect = ""
			Idiomas_Leido.SqlOrderBy = ""

			' Idiomas_Escrito
			Idiomas_Escrito = new crField("CV_Profesores", "CV Profesores", "x_Idiomas_Escrito", "Idiomas_Escrito", "[Idiomas_Escrito]", 200, EWRPT_DATATYPE_STRING, -1)
			Idiomas_Escrito.Page = APage
			Idiomas_Escrito.ParentPage = APage.ParentPage
			Fields.Add("Idiomas_Escrito", Idiomas_Escrito)
			Idiomas_Escrito.DateFilter = ""
			Idiomas_Escrito.SqlSelect = ""
			Idiomas_Escrito.SqlOrderBy = ""

			' Becas_Nombre
			Becas_Nombre = new crField("CV_Profesores", "CV Profesores", "x_Becas_Nombre", "Becas_Nombre", "[Becas_Nombre]", 200, EWRPT_DATATYPE_STRING, -1)
			Becas_Nombre.Page = APage
			Becas_Nombre.ParentPage = APage.ParentPage
			Fields.Add("Becas_Nombre", Becas_Nombre)
			Becas_Nombre.DateFilter = ""
			Becas_Nombre.SqlSelect = ""
			Becas_Nombre.SqlOrderBy = ""

			' Becas_Institucion
			Becas_Institucion = new crField("CV_Profesores", "CV Profesores", "x_Becas_Institucion", "Becas_Institucion", "[Becas_Institucion]", 200, EWRPT_DATATYPE_STRING, -1)
			Becas_Institucion.Page = APage
			Becas_Institucion.ParentPage = APage.ParentPage
			Fields.Add("Becas_Institucion", Becas_Institucion)
			Becas_Institucion.DateFilter = ""
			Becas_Institucion.SqlSelect = ""
			Becas_Institucion.SqlOrderBy = ""

			' Becas_Ano
			Becas_Ano = new crField("CV_Profesores", "CV Profesores", "x_Becas_Ano", "Becas_Ano", "[Becas_Ano]", 200, EWRPT_DATATYPE_STRING, -1)
			Becas_Ano.Page = APage
			Becas_Ano.ParentPage = APage.ParentPage
			Fields.Add("Becas_Ano", Becas_Ano)
			Becas_Ano.DateFilter = ""
			Becas_Ano.SqlSelect = ""
			Becas_Ano.SqlOrderBy = ""

			' TipoP_Publicacion
			TipoP_Publicacion = new crField("CV_Profesores", "CV Profesores", "x_TipoP_Publicacion", "TipoP_Publicacion", "[TipoP_Publicacion]", 200, EWRPT_DATATYPE_STRING, -1)
			TipoP_Publicacion.Page = APage
			TipoP_Publicacion.ParentPage = APage.ParentPage
			Fields.Add("TipoP_Publicacion", TipoP_Publicacion)
			TipoP_Publicacion.DateFilter = ""
			TipoP_Publicacion.SqlSelect = ""
			TipoP_Publicacion.SqlOrderBy = ""

			' TipoP_Lib
			TipoP_Lib = new crField("CV_Profesores", "CV Profesores", "x_TipoP_Lib", "TipoP_Lib", "[TipoP_Lib]", 200, EWRPT_DATATYPE_STRING, -1)
			TipoP_Lib.Page = APage
			TipoP_Lib.ParentPage = APage.ParentPage
			Fields.Add("TipoP_Lib", TipoP_Lib)
			TipoP_Lib.DateFilter = ""
			TipoP_Lib.SqlSelect = ""
			TipoP_Lib.SqlOrderBy = ""

			' TipoP_Art
			TipoP_Art = new crField("CV_Profesores", "CV Profesores", "x_TipoP_Art", "TipoP_Art", "[TipoP_Art]", 200, EWRPT_DATATYPE_STRING, -1)
			TipoP_Art.Page = APage
			TipoP_Art.ParentPage = APage.ParentPage
			Fields.Add("TipoP_Art", TipoP_Art)
			TipoP_Art.DateFilter = ""
			TipoP_Art.SqlSelect = ""
			TipoP_Art.SqlOrderBy = ""

			' TipoP_Ars
			TipoP_Ars = new crField("CV_Profesores", "CV Profesores", "x_TipoP_Ars", "TipoP_Ars", "[TipoP_Ars]", 200, EWRPT_DATATYPE_STRING, -1)
			TipoP_Ars.Page = APage
			TipoP_Ars.ParentPage = APage.ParentPage
			Fields.Add("TipoP_Ars", TipoP_Ars)
			TipoP_Ars.DateFilter = ""
			TipoP_Ars.SqlSelect = ""
			TipoP_Ars.SqlOrderBy = ""

			' TipoP_Arn
			TipoP_Arn = new crField("CV_Profesores", "CV Profesores", "x_TipoP_Arn", "TipoP_Arn", "[TipoP_Arn]", 200, EWRPT_DATATYPE_STRING, -1)
			TipoP_Arn.Page = APage
			TipoP_Arn.ParentPage = APage.ParentPage
			Fields.Add("TipoP_Arn", TipoP_Arn)
			TipoP_Arn.DateFilter = ""
			TipoP_Arn.SqlSelect = ""
			TipoP_Arn.SqlOrderBy = ""

			' Publicacion_Titulo
			Publicacion_Titulo = new crField("CV_Profesores", "CV Profesores", "x_Publicacion_Titulo", "Publicacion_Titulo", "[Publicacion_Titulo]", 200, EWRPT_DATATYPE_STRING, -1)
			Publicacion_Titulo.Page = APage
			Publicacion_Titulo.ParentPage = APage.ParentPage
			Fields.Add("Publicacion_Titulo", Publicacion_Titulo)
			Publicacion_Titulo.DateFilter = ""
			Publicacion_Titulo.SqlSelect = ""
			Publicacion_Titulo.SqlOrderBy = ""

			' Publicacion_Nombre
			Publicacion_Nombre = new crField("CV_Profesores", "CV Profesores", "x_Publicacion_Nombre", "Publicacion_Nombre", "[Publicacion_Nombre]", 200, EWRPT_DATATYPE_STRING, -1)
			Publicacion_Nombre.Page = APage
			Publicacion_Nombre.ParentPage = APage.ParentPage
			Fields.Add("Publicacion_Nombre", Publicacion_Nombre)
			Publicacion_Nombre.DateFilter = ""
			Publicacion_Nombre.SqlSelect = ""
			Publicacion_Nombre.SqlOrderBy = ""

			' Publicacion_Editorial
			Publicacion_Editorial = new crField("CV_Profesores", "CV Profesores", "x_Publicacion_Editorial", "Publicacion_Editorial", "[Publicacion_Editorial]", 200, EWRPT_DATATYPE_STRING, -1)
			Publicacion_Editorial.Page = APage
			Publicacion_Editorial.ParentPage = APage.ParentPage
			Fields.Add("Publicacion_Editorial", Publicacion_Editorial)
			Publicacion_Editorial.DateFilter = ""
			Publicacion_Editorial.SqlSelect = ""
			Publicacion_Editorial.SqlOrderBy = ""

			' Publicacion_Autor
			Publicacion_Autor = new crField("CV_Profesores", "CV Profesores", "x_Publicacion_Autor", "Publicacion_Autor", "[Publicacion_Autor]", 200, EWRPT_DATATYPE_STRING, -1)
			Publicacion_Autor.Page = APage
			Publicacion_Autor.ParentPage = APage.ParentPage
			Fields.Add("Publicacion_Autor", Publicacion_Autor)
			Publicacion_Autor.DateFilter = ""
			Publicacion_Autor.SqlSelect = ""
			Publicacion_Autor.SqlOrderBy = ""

			' Publicacion_Articulo
			Publicacion_Articulo = new crField("CV_Profesores", "CV Profesores", "x_Publicacion_Articulo", "Publicacion_Articulo", "[Publicacion_Articulo]", 200, EWRPT_DATATYPE_STRING, -1)
			Publicacion_Articulo.Page = APage
			Publicacion_Articulo.ParentPage = APage.ParentPage
			Fields.Add("Publicacion_Articulo", Publicacion_Articulo)
			Publicacion_Articulo.DateFilter = ""
			Publicacion_Articulo.SqlSelect = ""
			Publicacion_Articulo.SqlOrderBy = ""

			' Publicacion_Ano
			Publicacion_Ano = new crField("CV_Profesores", "CV Profesores", "x_Publicacion_Ano", "Publicacion_Ano", "[Publicacion_Ano]", 200, EWRPT_DATATYPE_STRING, -1)
			Publicacion_Ano.Page = APage
			Publicacion_Ano.ParentPage = APage.ParentPage
			Fields.Add("Publicacion_Ano", Publicacion_Ano)
			Publicacion_Ano.DateFilter = ""
			Publicacion_Ano.SqlSelect = ""
			Publicacion_Ano.SqlOrderBy = ""

			' Publicacion_Fecha
			Publicacion_Fecha = new crField("CV_Profesores", "CV Profesores", "x_Publicacion_Fecha", "Publicacion_Fecha", "[Publicacion_Fecha]", 135, EWRPT_DATATYPE_DATE, 7)
			Publicacion_Fecha.Page = APage
			Publicacion_Fecha.ParentPage = APage.ParentPage
			Publicacion_Fecha.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("Publicacion_Fecha", Publicacion_Fecha)
			Publicacion_Fecha.DateFilter = ""
			Publicacion_Fecha.SqlSelect = ""
			Publicacion_Fecha.SqlOrderBy = ""

			' Publicacion_Tipo
			Publicacion_Tipo = new crField("CV_Profesores", "CV Profesores", "x_Publicacion_Tipo", "Publicacion_Tipo", "[Publicacion_Tipo]", 200, EWRPT_DATATYPE_STRING, -1)
			Publicacion_Tipo.Page = APage
			Publicacion_Tipo.ParentPage = APage.ParentPage
			Fields.Add("Publicacion_Tipo", Publicacion_Tipo)
			Publicacion_Tipo.DateFilter = ""
			Publicacion_Tipo.SqlSelect = ""
			Publicacion_Tipo.SqlOrderBy = ""
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
				Return "[SEK_Vista_CV_Total]"
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
				Return "[RUT_Profesor] ASC, [AP_PATER] ASC, [AP_MATER] ASC, [NOMBRES] ASC"
			End Get
		End Property

		' Table Level Group SQL
		Public ReadOnly Property SqlFirstGroupField As String
			Get
				Return "[RUT_Profesor]"
			End Get
		End Property

		Public ReadOnly Property SqlSelectGroup As String
			Get
				Return "SELECT DISTINCT " + SqlFirstGroupField + " FROM " + SqlFrom
			End Get
		End Property

		Public ReadOnly Property SqlOrderByGroup As String
			Get
				Return "[RUT_Profesor] ASC"
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
	Public CV_Profesores_summary As crCV_Profesores_summary

	'
	' Page class
	'
	Public Class crCV_Profesores_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (CV_Profesores.UseTokenInUrl) Then
				sUrl &= "t=" & CV_Profesores.TableVar & "&" ' Add page token
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
			If (CV_Profesores.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(CV_Profesores.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(CV_Profesores.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As CV_Profesoressmry 
			Get
				Return CType(m_ParentPage, CV_Profesoressmry)
			End Get
		End Property

		' Table object (CV_Profesores)
		Public Property CV_Profesores As crCV_Profesores 
			Get		
				Return AspNetPage.CV_Profesores ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crCV_Profesores)
				AspNetPage.CV_Profesores = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_CVTotal)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "CV_Profesores_summary"
			m_PageObjTypeName = "crCV_Profesores_summary"

			' Table name
			m_TableName = "CV Profesores"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (CV_Profesores)
			CV_Profesores = New crCV_Profesores(Me)			

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
				CV_Profesores.Export = ew_Get("export")
			End If
			gsExport = CV_Profesores.Export ' Get export parameter, used in header
			gsExportFile = CV_Profesores.TableVar ' Get export file, used in header
			If (CV_Profesores.Export = "excel") Then
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

		Public Cnt As Integer()() = New Integer(4)() {}

		Public Smry As Object()() = New Object(4)() {}

		Public Mn As Object()() = New Object(4)() {}

		Public Mx As Object()() = New Object(4)() {}

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
			Dim nGrps As Integer = 5 ' No. of groups (level 0 used for grand total)
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
			CV_Profesores.CustomFilters_Load()

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
			Dim sGrpSort As String = ewrpt_UpdateSortFields(CV_Profesores.SqlOrderByGroup, Sort, 2) ' Get grouping field only
			Dim sSql As String = ewrpt_BuildReportSql(CV_Profesores.SqlSelectGroup, CV_Profesores.SqlWhere, CV_Profesores.SqlGroupBy, CV_Profesores.SqlHaving, CV_Profesores.SqlOrderByGroup, Filter, sGrpSort)
			TotalGrps = GetGrpCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (CV_Profesores.ExportAll AndAlso ew_NotEmpty(CV_Profesores.Export)) Then
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
					Return (Convert.IsDBNull(CV_Profesores.RUT_Profesor.CurrentValue) AndAlso Not Convert.IsDBNull(CV_Profesores.RUT_Profesor.OldValue)) OrElse _
						(Not Convert.IsDBNull(CV_Profesores.RUT_Profesor.CurrentValue) AndAlso Convert.IsDBNull(CV_Profesores.RUT_Profesor.OldValue)) OrElse _
						(Not ew_SameStr(CV_Profesores.RUT_Profesor.GroupValue(), CV_Profesores.RUT_Profesor.GroupOldValue()))
				Case 2
					Return (Convert.IsDBNull(CV_Profesores.AP_PATER.CurrentValue) AndAlso Not Convert.IsDBNull(CV_Profesores.AP_PATER.OldValue)) OrElse _
						(Not Convert.IsDBNull(CV_Profesores.AP_PATER.CurrentValue) AndAlso Convert.IsDBNull(CV_Profesores.AP_PATER.OldValue)) OrElse _
						(Not ew_SameStr(CV_Profesores.AP_PATER.GroupValue(), CV_Profesores.AP_PATER.GroupOldValue())) OrElse ChkLvlBreak(1) ' Recurse upper level
				Case 3
					Return (Convert.IsDBNull(CV_Profesores.AP_MATER.CurrentValue) AndAlso Not Convert.IsDBNull(CV_Profesores.AP_MATER.OldValue)) OrElse _
						(Not Convert.IsDBNull(CV_Profesores.AP_MATER.CurrentValue) AndAlso Convert.IsDBNull(CV_Profesores.AP_MATER.OldValue)) OrElse _
						(Not ew_SameStr(CV_Profesores.AP_MATER.GroupValue(), CV_Profesores.AP_MATER.GroupOldValue())) OrElse ChkLvlBreak(2) ' Recurse upper level
				Case 4
					Return (Convert.IsDBNull(CV_Profesores.NOMBRES.CurrentValue) AndAlso Not Convert.IsDBNull(CV_Profesores.NOMBRES.OldValue)) OrElse _
						(Not Convert.IsDBNull(CV_Profesores.NOMBRES.CurrentValue) AndAlso Convert.IsDBNull(CV_Profesores.NOMBRES.OldValue)) OrElse _
						(Not ew_SameStr(CV_Profesores.NOMBRES.GroupValue(), CV_Profesores.NOMBRES.GroupOldValue())) OrElse ChkLvlBreak(3) ' Recurse upper level
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
				CV_Profesores.RUT_Profesor.DbValue = "" ' Init first value
			Else	' Get next group
				GrpIndex += 1
			End If
			Dim Row As OrderedDictionary
			If GrpIndex >= rsgrp.Count Then
				CV_Profesores.RUT_Profesor.DbValue = ""
			Else
				Row = DirectCast(rsgrp(GrpIndex), OrderedDictionary)
				CV_Profesores.RUT_Profesor.DbValue = Row(0)
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
					If (CV_Profesores.RUT_Profesor.GroupDbValues.Count > 0) Then
						CV_Profesores.RUT_Profesor.DbValue = CV_Profesores.RUT_Profesor.GroupDbValues(Row("RUT_Profesor"))
					Else
						CV_Profesores.RUT_Profesor.DbValue = ewrpt_GroupValue(CV_Profesores.RUT_Profesor, Row("RUT_Profesor"))
					End If
				End If
				CV_Profesores.AP_PATER.DbValue = Row("AP_PATER")
				CV_Profesores.AP_MATER.DbValue = Row("AP_MATER")
				CV_Profesores.NOMBRES.DbValue = Row("NOMBRES")
				CV_Profesores.Extension_Nombre.DbValue = Row("Extension_Nombre")
				CV_Profesores.Extension_Responsable.DbValue = Row("Extension_Responsable")
				CV_Profesores.Expresion_Institucion.DbValue = Row("Expresion_Institucion")
				CV_Profesores.Extension_Duracion.DbValue = Row("Extension_Duracion")
				CV_Profesores.GradosAc_Grado.DbValue = Row("GradosAc_Grado")
				CV_Profesores.GradosAc_Nombre.DbValue = Row("GradosAc_Nombre")
				CV_Profesores.GradosAc_Ano.DbValue = Row("GradosAc_Ano")
				CV_Profesores.GradosAc_Institucion.DbValue = Row("GradosAc_Institucion")
				CV_Profesores.GradosAc_NombreInst.DbValue = Row("GradosAc_NombreInst")
				CV_Profesores.GradosAc_PaisInst.DbValue = Row("GradosAc_PaisInst")
				CV_Profesores.Investigacion_Nombre.DbValue = Row("Investigacion_Nombre")
				CV_Profesores.Investigacion_Director.DbValue = Row("Investigacion_Director")
				CV_Profesores.Investigacion_Institucion.DbValue = Row("Investigacion_Institucion")
				CV_Profesores.Investigacion_Monto.DbValue = Row("Investigacion_Monto")
				CV_Profesores.Investigacion_Duracion.DbValue = Row("Investigacion_Duracion")
				CV_Profesores.ProgramaAc_Programa.DbValue = Row("ProgramaAc_Programa")
				CV_Profesores.Exp_Institucion.DbValue = Row("Exp_Institucion")
				CV_Profesores.Exp_Programa.DbValue = Row("Exp_Programa")
				CV_Profesores.Exp_Facultad.DbValue = Row("Exp_Facultad")
				CV_Profesores.Exp_Asignatura.DbValue = Row("Exp_Asignatura")
				CV_Profesores.Exp_Pais.DbValue = Row("Exp_Pais")
				CV_Profesores.Exp_FechInicio.DbValue = Row("Exp_FechInicio")
				CV_Profesores.Exp_FechaFin.DbValue = Row("Exp_FechaFin")
				CV_Profesores.Exp_Ano.DbValue = Row("Exp_Ano")
				CV_Profesores.Exp_Tipo.DbValue = Row("Exp_Tipo")
				CV_Profesores.Perf_Institucion.DbValue = Row("Perf_Institucion")
				CV_Profesores.Perf_Curso.DbValue = Row("Perf_Curso")
				CV_Profesores.Perf_Materia.DbValue = Row("Perf_Materia")
				CV_Profesores.Perf_Ano.DbValue = Row("Perf_Ano")
				CV_Profesores.Perf_Tipo.DbValue = Row("Perf_Tipo")
				CV_Profesores.Membr_Nombre.DbValue = Row("Membr_Nombre")
				CV_Profesores.Idiomas_Nombre.DbValue = Row("Idiomas_Nombre")
				CV_Profesores.Idiomas_Hablado.DbValue = Row("Idiomas_Hablado")
				CV_Profesores.Idiomas_Leido.DbValue = Row("Idiomas_Leido")
				CV_Profesores.Idiomas_Escrito.DbValue = Row("Idiomas_Escrito")
				CV_Profesores.Becas_Nombre.DbValue = Row("Becas_Nombre")
				CV_Profesores.Becas_Institucion.DbValue = Row("Becas_Institucion")
				CV_Profesores.Becas_Ano.DbValue = Row("Becas_Ano")
				CV_Profesores.TipoP_Publicacion.DbValue = Row("TipoP_Publicacion")
				CV_Profesores.TipoP_Lib.DbValue = Row("TipoP_Lib")
				CV_Profesores.TipoP_Art.DbValue = Row("TipoP_Art")
				CV_Profesores.TipoP_Ars.DbValue = Row("TipoP_Ars")
				CV_Profesores.TipoP_Arn.DbValue = Row("TipoP_Arn")
				CV_Profesores.Publicacion_Titulo.DbValue = Row("Publicacion_Titulo")
				CV_Profesores.Publicacion_Nombre.DbValue = Row("Publicacion_Nombre")
				CV_Profesores.Publicacion_Editorial.DbValue = Row("Publicacion_Editorial")
				CV_Profesores.Publicacion_Autor.DbValue = Row("Publicacion_Autor")
				CV_Profesores.Publicacion_Articulo.DbValue = Row("Publicacion_Articulo")
				CV_Profesores.Publicacion_Ano.DbValue = Row("Publicacion_Ano")
				CV_Profesores.Publicacion_Fecha.DbValue = Row("Publicacion_Fecha")
				CV_Profesores.Publicacion_Tipo.DbValue = Row("Publicacion_Tipo")
				Val(1) = CV_Profesores.Extension_Nombre.CurrentValue
				Val(2) = CV_Profesores.Extension_Responsable.CurrentValue
				Val(3) = CV_Profesores.Expresion_Institucion.CurrentValue
				Val(4) = CV_Profesores.Extension_Duracion.CurrentValue
				Val(5) = CV_Profesores.GradosAc_Grado.CurrentValue
				Val(6) = CV_Profesores.GradosAc_Nombre.CurrentValue
				Val(7) = CV_Profesores.GradosAc_Ano.CurrentValue
				Val(8) = CV_Profesores.GradosAc_Institucion.CurrentValue
				Val(9) = CV_Profesores.GradosAc_NombreInst.CurrentValue
				Val(10) = CV_Profesores.GradosAc_PaisInst.CurrentValue
				Val(11) = CV_Profesores.Investigacion_Nombre.CurrentValue
				Val(12) = CV_Profesores.Investigacion_Director.CurrentValue
				Val(13) = CV_Profesores.Investigacion_Institucion.CurrentValue
				Val(14) = CV_Profesores.Investigacion_Monto.CurrentValue
				Val(15) = CV_Profesores.Investigacion_Duracion.CurrentValue
				Val(16) = CV_Profesores.ProgramaAc_Programa.CurrentValue
				Val(17) = CV_Profesores.Exp_Institucion.CurrentValue
				Val(18) = CV_Profesores.Exp_Programa.CurrentValue
				Val(19) = CV_Profesores.Exp_Facultad.CurrentValue
				Val(20) = CV_Profesores.Exp_Asignatura.CurrentValue
				Val(21) = CV_Profesores.Exp_Pais.CurrentValue
				Val(22) = CV_Profesores.Exp_FechInicio.CurrentValue
				Val(23) = CV_Profesores.Exp_FechaFin.CurrentValue
				Val(24) = CV_Profesores.Exp_Ano.CurrentValue
				Val(25) = CV_Profesores.Exp_Tipo.CurrentValue
				Val(26) = CV_Profesores.Perf_Institucion.CurrentValue
				Val(27) = CV_Profesores.Perf_Curso.CurrentValue
				Val(28) = CV_Profesores.Perf_Materia.CurrentValue
				Val(29) = CV_Profesores.Perf_Ano.CurrentValue
				Val(30) = CV_Profesores.Perf_Tipo.CurrentValue
				Val(31) = CV_Profesores.Membr_Nombre.CurrentValue
				Val(32) = CV_Profesores.Idiomas_Nombre.CurrentValue
				Val(33) = CV_Profesores.Idiomas_Hablado.CurrentValue
				Val(34) = CV_Profesores.Idiomas_Leido.CurrentValue
				Val(35) = CV_Profesores.Idiomas_Escrito.CurrentValue
				Val(36) = CV_Profesores.Becas_Nombre.CurrentValue
				Val(37) = CV_Profesores.Becas_Institucion.CurrentValue
				Val(38) = CV_Profesores.Becas_Ano.CurrentValue
				Val(39) = CV_Profesores.TipoP_Publicacion.CurrentValue
				Val(40) = CV_Profesores.TipoP_Lib.CurrentValue
				Val(41) = CV_Profesores.TipoP_Art.CurrentValue
				Val(42) = CV_Profesores.TipoP_Ars.CurrentValue
				Val(43) = CV_Profesores.TipoP_Arn.CurrentValue
				Val(44) = CV_Profesores.Publicacion_Titulo.CurrentValue
				Val(45) = CV_Profesores.Publicacion_Nombre.CurrentValue
				Val(46) = CV_Profesores.Publicacion_Editorial.CurrentValue
				Val(47) = CV_Profesores.Publicacion_Autor.CurrentValue
				Val(48) = CV_Profesores.Publicacion_Articulo.CurrentValue
				Val(49) = CV_Profesores.Publicacion_Ano.CurrentValue
				Val(50) = CV_Profesores.Publicacion_Fecha.CurrentValue
				Val(51) = CV_Profesores.Publicacion_Tipo.CurrentValue
			Else
				CV_Profesores.RUT_Profesor.DbValue = ""
				CV_Profesores.AP_PATER.DbValue = ""
				CV_Profesores.AP_MATER.DbValue = ""
				CV_Profesores.NOMBRES.DbValue = ""
				CV_Profesores.Extension_Nombre.DbValue = ""
				CV_Profesores.Extension_Responsable.DbValue = ""
				CV_Profesores.Expresion_Institucion.DbValue = ""
				CV_Profesores.Extension_Duracion.DbValue = ""
				CV_Profesores.GradosAc_Grado.DbValue = ""
				CV_Profesores.GradosAc_Nombre.DbValue = ""
				CV_Profesores.GradosAc_Ano.DbValue = ""
				CV_Profesores.GradosAc_Institucion.DbValue = ""
				CV_Profesores.GradosAc_NombreInst.DbValue = ""
				CV_Profesores.GradosAc_PaisInst.DbValue = ""
				CV_Profesores.Investigacion_Nombre.DbValue = ""
				CV_Profesores.Investigacion_Director.DbValue = ""
				CV_Profesores.Investigacion_Institucion.DbValue = ""
				CV_Profesores.Investigacion_Monto.DbValue = ""
				CV_Profesores.Investigacion_Duracion.DbValue = ""
				CV_Profesores.ProgramaAc_Programa.DbValue = ""
				CV_Profesores.Exp_Institucion.DbValue = ""
				CV_Profesores.Exp_Programa.DbValue = ""
				CV_Profesores.Exp_Facultad.DbValue = ""
				CV_Profesores.Exp_Asignatura.DbValue = ""
				CV_Profesores.Exp_Pais.DbValue = ""
				CV_Profesores.Exp_FechInicio.DbValue = ""
				CV_Profesores.Exp_FechaFin.DbValue = ""
				CV_Profesores.Exp_Ano.DbValue = ""
				CV_Profesores.Exp_Tipo.DbValue = ""
				CV_Profesores.Perf_Institucion.DbValue = ""
				CV_Profesores.Perf_Curso.DbValue = ""
				CV_Profesores.Perf_Materia.DbValue = ""
				CV_Profesores.Perf_Ano.DbValue = ""
				CV_Profesores.Perf_Tipo.DbValue = ""
				CV_Profesores.Membr_Nombre.DbValue = ""
				CV_Profesores.Idiomas_Nombre.DbValue = ""
				CV_Profesores.Idiomas_Hablado.DbValue = ""
				CV_Profesores.Idiomas_Leido.DbValue = ""
				CV_Profesores.Idiomas_Escrito.DbValue = ""
				CV_Profesores.Becas_Nombre.DbValue = ""
				CV_Profesores.Becas_Institucion.DbValue = ""
				CV_Profesores.Becas_Ano.DbValue = ""
				CV_Profesores.TipoP_Publicacion.DbValue = ""
				CV_Profesores.TipoP_Lib.DbValue = ""
				CV_Profesores.TipoP_Art.DbValue = ""
				CV_Profesores.TipoP_Ars.DbValue = ""
				CV_Profesores.TipoP_Arn.DbValue = ""
				CV_Profesores.Publicacion_Titulo.DbValue = ""
				CV_Profesores.Publicacion_Nombre.DbValue = ""
				CV_Profesores.Publicacion_Editorial.DbValue = ""
				CV_Profesores.Publicacion_Autor.DbValue = ""
				CV_Profesores.Publicacion_Articulo.DbValue = ""
				CV_Profesores.Publicacion_Ano.DbValue = ""
				CV_Profesores.Publicacion_Fecha.DbValue = ""
				CV_Profesores.Publicacion_Tipo.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				CV_Profesores.RUT_Profesor.DbValue = dr("RUT_Profesor")
				CV_Profesores.AP_PATER.DbValue = dr("AP_PATER")
				CV_Profesores.AP_MATER.DbValue = dr("AP_MATER")
				CV_Profesores.NOMBRES.DbValue = dr("NOMBRES")
				CV_Profesores.Extension_Nombre.DbValue = dr("Extension_Nombre")
				CV_Profesores.Extension_Responsable.DbValue = dr("Extension_Responsable")
				CV_Profesores.Expresion_Institucion.DbValue = dr("Expresion_Institucion")
				CV_Profesores.Extension_Duracion.DbValue = dr("Extension_Duracion")
				CV_Profesores.GradosAc_Grado.DbValue = dr("GradosAc_Grado")
				CV_Profesores.GradosAc_Nombre.DbValue = dr("GradosAc_Nombre")
				CV_Profesores.GradosAc_Ano.DbValue = dr("GradosAc_Ano")
				CV_Profesores.GradosAc_Institucion.DbValue = dr("GradosAc_Institucion")
				CV_Profesores.GradosAc_NombreInst.DbValue = dr("GradosAc_NombreInst")
				CV_Profesores.GradosAc_PaisInst.DbValue = dr("GradosAc_PaisInst")
				CV_Profesores.Investigacion_Nombre.DbValue = dr("Investigacion_Nombre")
				CV_Profesores.Investigacion_Director.DbValue = dr("Investigacion_Director")
				CV_Profesores.Investigacion_Institucion.DbValue = dr("Investigacion_Institucion")
				CV_Profesores.Investigacion_Monto.DbValue = dr("Investigacion_Monto")
				CV_Profesores.Investigacion_Duracion.DbValue = dr("Investigacion_Duracion")
				CV_Profesores.ProgramaAc_Programa.DbValue = dr("ProgramaAc_Programa")
				CV_Profesores.Exp_Institucion.DbValue = dr("Exp_Institucion")
				CV_Profesores.Exp_Programa.DbValue = dr("Exp_Programa")
				CV_Profesores.Exp_Facultad.DbValue = dr("Exp_Facultad")
				CV_Profesores.Exp_Asignatura.DbValue = dr("Exp_Asignatura")
				CV_Profesores.Exp_Pais.DbValue = dr("Exp_Pais")
				CV_Profesores.Exp_FechInicio.DbValue = dr("Exp_FechInicio")
				CV_Profesores.Exp_FechaFin.DbValue = dr("Exp_FechaFin")
				CV_Profesores.Exp_Ano.DbValue = dr("Exp_Ano")
				CV_Profesores.Exp_Tipo.DbValue = dr("Exp_Tipo")
				CV_Profesores.Perf_Institucion.DbValue = dr("Perf_Institucion")
				CV_Profesores.Perf_Curso.DbValue = dr("Perf_Curso")
				CV_Profesores.Perf_Materia.DbValue = dr("Perf_Materia")
				CV_Profesores.Perf_Ano.DbValue = dr("Perf_Ano")
				CV_Profesores.Perf_Tipo.DbValue = dr("Perf_Tipo")
				CV_Profesores.Membr_Nombre.DbValue = dr("Membr_Nombre")
				CV_Profesores.Idiomas_Nombre.DbValue = dr("Idiomas_Nombre")
				CV_Profesores.Idiomas_Hablado.DbValue = dr("Idiomas_Hablado")
				CV_Profesores.Idiomas_Leido.DbValue = dr("Idiomas_Leido")
				CV_Profesores.Idiomas_Escrito.DbValue = dr("Idiomas_Escrito")
				CV_Profesores.Becas_Nombre.DbValue = dr("Becas_Nombre")
				CV_Profesores.Becas_Institucion.DbValue = dr("Becas_Institucion")
				CV_Profesores.Becas_Ano.DbValue = dr("Becas_Ano")
				CV_Profesores.TipoP_Publicacion.DbValue = dr("TipoP_Publicacion")
				CV_Profesores.TipoP_Lib.DbValue = dr("TipoP_Lib")
				CV_Profesores.TipoP_Art.DbValue = dr("TipoP_Art")
				CV_Profesores.TipoP_Ars.DbValue = dr("TipoP_Ars")
				CV_Profesores.TipoP_Arn.DbValue = dr("TipoP_Arn")
				CV_Profesores.Publicacion_Titulo.DbValue = dr("Publicacion_Titulo")
				CV_Profesores.Publicacion_Nombre.DbValue = dr("Publicacion_Nombre")
				CV_Profesores.Publicacion_Editorial.DbValue = dr("Publicacion_Editorial")
				CV_Profesores.Publicacion_Autor.DbValue = dr("Publicacion_Autor")
				CV_Profesores.Publicacion_Articulo.DbValue = dr("Publicacion_Articulo")
				CV_Profesores.Publicacion_Ano.DbValue = dr("Publicacion_Ano")
				CV_Profesores.Publicacion_Fecha.DbValue = dr("Publicacion_Fecha")
				CV_Profesores.Publicacion_Tipo.DbValue = dr("Publicacion_Tipo")
				Val(1) = CV_Profesores.Extension_Nombre.CurrentValue
				Val(2) = CV_Profesores.Extension_Responsable.CurrentValue
				Val(3) = CV_Profesores.Expresion_Institucion.CurrentValue
				Val(4) = CV_Profesores.Extension_Duracion.CurrentValue
				Val(5) = CV_Profesores.GradosAc_Grado.CurrentValue
				Val(6) = CV_Profesores.GradosAc_Nombre.CurrentValue
				Val(7) = CV_Profesores.GradosAc_Ano.CurrentValue
				Val(8) = CV_Profesores.GradosAc_Institucion.CurrentValue
				Val(9) = CV_Profesores.GradosAc_NombreInst.CurrentValue
				Val(10) = CV_Profesores.GradosAc_PaisInst.CurrentValue
				Val(11) = CV_Profesores.Investigacion_Nombre.CurrentValue
				Val(12) = CV_Profesores.Investigacion_Director.CurrentValue
				Val(13) = CV_Profesores.Investigacion_Institucion.CurrentValue
				Val(14) = CV_Profesores.Investigacion_Monto.CurrentValue
				Val(15) = CV_Profesores.Investigacion_Duracion.CurrentValue
				Val(16) = CV_Profesores.ProgramaAc_Programa.CurrentValue
				Val(17) = CV_Profesores.Exp_Institucion.CurrentValue
				Val(18) = CV_Profesores.Exp_Programa.CurrentValue
				Val(19) = CV_Profesores.Exp_Facultad.CurrentValue
				Val(20) = CV_Profesores.Exp_Asignatura.CurrentValue
				Val(21) = CV_Profesores.Exp_Pais.CurrentValue
				Val(22) = CV_Profesores.Exp_FechInicio.CurrentValue
				Val(23) = CV_Profesores.Exp_FechaFin.CurrentValue
				Val(24) = CV_Profesores.Exp_Ano.CurrentValue
				Val(25) = CV_Profesores.Exp_Tipo.CurrentValue
				Val(26) = CV_Profesores.Perf_Institucion.CurrentValue
				Val(27) = CV_Profesores.Perf_Curso.CurrentValue
				Val(28) = CV_Profesores.Perf_Materia.CurrentValue
				Val(29) = CV_Profesores.Perf_Ano.CurrentValue
				Val(30) = CV_Profesores.Perf_Tipo.CurrentValue
				Val(31) = CV_Profesores.Membr_Nombre.CurrentValue
				Val(32) = CV_Profesores.Idiomas_Nombre.CurrentValue
				Val(33) = CV_Profesores.Idiomas_Hablado.CurrentValue
				Val(34) = CV_Profesores.Idiomas_Leido.CurrentValue
				Val(35) = CV_Profesores.Idiomas_Escrito.CurrentValue
				Val(36) = CV_Profesores.Becas_Nombre.CurrentValue
				Val(37) = CV_Profesores.Becas_Institucion.CurrentValue
				Val(38) = CV_Profesores.Becas_Ano.CurrentValue
				Val(39) = CV_Profesores.TipoP_Publicacion.CurrentValue
				Val(40) = CV_Profesores.TipoP_Lib.CurrentValue
				Val(41) = CV_Profesores.TipoP_Art.CurrentValue
				Val(42) = CV_Profesores.TipoP_Ars.CurrentValue
				Val(43) = CV_Profesores.TipoP_Arn.CurrentValue
				Val(44) = CV_Profesores.Publicacion_Titulo.CurrentValue
				Val(45) = CV_Profesores.Publicacion_Nombre.CurrentValue
				Val(46) = CV_Profesores.Publicacion_Editorial.CurrentValue
				Val(47) = CV_Profesores.Publicacion_Autor.CurrentValue
				Val(48) = CV_Profesores.Publicacion_Articulo.CurrentValue
				Val(49) = CV_Profesores.Publicacion_Ano.CurrentValue
				Val(50) = CV_Profesores.Publicacion_Fecha.CurrentValue
				Val(51) = CV_Profesores.Publicacion_Tipo.CurrentValue
			Else				
				CV_Profesores.AP_PATER.DbValue = ""
				CV_Profesores.AP_MATER.DbValue = ""
				CV_Profesores.NOMBRES.DbValue = ""
				CV_Profesores.Extension_Nombre.DbValue = ""
				CV_Profesores.Extension_Responsable.DbValue = ""
				CV_Profesores.Expresion_Institucion.DbValue = ""
				CV_Profesores.Extension_Duracion.DbValue = ""
				CV_Profesores.GradosAc_Grado.DbValue = ""
				CV_Profesores.GradosAc_Nombre.DbValue = ""
				CV_Profesores.GradosAc_Ano.DbValue = ""
				CV_Profesores.GradosAc_Institucion.DbValue = ""
				CV_Profesores.GradosAc_NombreInst.DbValue = ""
				CV_Profesores.GradosAc_PaisInst.DbValue = ""
				CV_Profesores.Investigacion_Nombre.DbValue = ""
				CV_Profesores.Investigacion_Director.DbValue = ""
				CV_Profesores.Investigacion_Institucion.DbValue = ""
				CV_Profesores.Investigacion_Monto.DbValue = ""
				CV_Profesores.Investigacion_Duracion.DbValue = ""
				CV_Profesores.ProgramaAc_Programa.DbValue = ""
				CV_Profesores.Exp_Institucion.DbValue = ""
				CV_Profesores.Exp_Programa.DbValue = ""
				CV_Profesores.Exp_Facultad.DbValue = ""
				CV_Profesores.Exp_Asignatura.DbValue = ""
				CV_Profesores.Exp_Pais.DbValue = ""
				CV_Profesores.Exp_FechInicio.DbValue = ""
				CV_Profesores.Exp_FechaFin.DbValue = ""
				CV_Profesores.Exp_Ano.DbValue = ""
				CV_Profesores.Exp_Tipo.DbValue = ""
				CV_Profesores.Perf_Institucion.DbValue = ""
				CV_Profesores.Perf_Curso.DbValue = ""
				CV_Profesores.Perf_Materia.DbValue = ""
				CV_Profesores.Perf_Ano.DbValue = ""
				CV_Profesores.Perf_Tipo.DbValue = ""
				CV_Profesores.Membr_Nombre.DbValue = ""
				CV_Profesores.Idiomas_Nombre.DbValue = ""
				CV_Profesores.Idiomas_Hablado.DbValue = ""
				CV_Profesores.Idiomas_Leido.DbValue = ""
				CV_Profesores.Idiomas_Escrito.DbValue = ""
				CV_Profesores.Becas_Nombre.DbValue = ""
				CV_Profesores.Becas_Institucion.DbValue = ""
				CV_Profesores.Becas_Ano.DbValue = ""
				CV_Profesores.TipoP_Publicacion.DbValue = ""
				CV_Profesores.TipoP_Lib.DbValue = ""
				CV_Profesores.TipoP_Art.DbValue = ""
				CV_Profesores.TipoP_Ars.DbValue = ""
				CV_Profesores.TipoP_Arn.DbValue = ""
				CV_Profesores.Publicacion_Titulo.DbValue = ""
				CV_Profesores.Publicacion_Nombre.DbValue = ""
				CV_Profesores.Publicacion_Editorial.DbValue = ""
				CV_Profesores.Publicacion_Autor.DbValue = ""
				CV_Profesores.Publicacion_Articulo.DbValue = ""
				CV_Profesores.Publicacion_Ano.DbValue = ""
				CV_Profesores.Publicacion_Fecha.DbValue = ""
				CV_Profesores.Publicacion_Tipo.DbValue = ""
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
				CV_Profesores.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					CV_Profesores.StartGroup = StartGrp
				Else
					StartGrp = CV_Profesores.StartGroup
				End If
			Else
				StartGrp = CV_Profesores.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				CV_Profesores.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				CV_Profesores.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				CV_Profesores.StartGroup = StartGrp
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
			CV_Profesores.StartGroup = StartGrp
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
				CV_Profesores.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				CV_Profesores.StartGroup = StartGrp
			Else				
				If (CV_Profesores.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(CV_Profesores.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (CV_Profesores.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(CV_Profesores.SqlSelectCount, CV_Profesores.SqlWhere, CV_Profesores.SqlGroupBy, CV_Profesores.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			CV_Profesores.Row_Rendering()

			'
			' Render view codes
			'

			If (CV_Profesores.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUT_Profesor
				CV_Profesores.RUT_Profesor.GroupViewValue = Convert.ToString(CV_Profesores.RUT_Profesor.GroupOldValue())
				CV_Profesores.RUT_Profesor.CellAttrs("class") = IIf(CV_Profesores.RowGroupLevel = 1, "ewRptGrpSummary1", "ewRptGrpField1")
				CV_Profesores.RUT_Profesor.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(CV_Profesores.RUT_Profesor, CV_Profesores.RUT_Profesor.GroupViewValue)

				' AP_PATER
				CV_Profesores.AP_PATER.GroupViewValue = Convert.ToString(CV_Profesores.AP_PATER.GroupOldValue())
				CV_Profesores.AP_PATER.CellAttrs("class") = IIf(CV_Profesores.RowGroupLevel = 2, "ewRptGrpSummary2", "ewRptGrpField2")
				CV_Profesores.AP_PATER.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(CV_Profesores.AP_PATER, CV_Profesores.AP_PATER.GroupViewValue)

				' AP_MATER
				CV_Profesores.AP_MATER.GroupViewValue = Convert.ToString(CV_Profesores.AP_MATER.GroupOldValue())
				CV_Profesores.AP_MATER.CellAttrs("class") = IIf(CV_Profesores.RowGroupLevel = 3, "ewRptGrpSummary3", "ewRptGrpField3")
				CV_Profesores.AP_MATER.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(CV_Profesores.AP_MATER, CV_Profesores.AP_MATER.GroupViewValue)

				' NOMBRES
				CV_Profesores.NOMBRES.GroupViewValue = Convert.ToString(CV_Profesores.NOMBRES.GroupOldValue())
				CV_Profesores.NOMBRES.CellAttrs("class") = IIf(CV_Profesores.RowGroupLevel = 4, "ewRptGrpSummary4", "ewRptGrpField4")
				CV_Profesores.NOMBRES.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(CV_Profesores.NOMBRES, CV_Profesores.NOMBRES.GroupViewValue)

				' Extension_Nombre
				CV_Profesores.Extension_Nombre.ViewValue = Convert.ToString(CV_Profesores.Extension_Nombre.Summary)

				' Extension_Responsable
				CV_Profesores.Extension_Responsable.ViewValue = Convert.ToString(CV_Profesores.Extension_Responsable.Summary)

				' Expresion_Institucion
				CV_Profesores.Expresion_Institucion.ViewValue = Convert.ToString(CV_Profesores.Expresion_Institucion.Summary)

				' Extension_Duracion
				CV_Profesores.Extension_Duracion.ViewValue = Convert.ToString(CV_Profesores.Extension_Duracion.Summary)

				' GradosAc_Grado
				CV_Profesores.GradosAc_Grado.ViewValue = Convert.ToString(CV_Profesores.GradosAc_Grado.Summary)

				' GradosAc_Nombre
				CV_Profesores.GradosAc_Nombre.ViewValue = Convert.ToString(CV_Profesores.GradosAc_Nombre.Summary)

				' GradosAc_Ano
				CV_Profesores.GradosAc_Ano.ViewValue = Convert.ToString(CV_Profesores.GradosAc_Ano.Summary)
				CV_Profesores.GradosAc_Ano.ViewValue = ew_FormatDateTime(CV_Profesores.GradosAc_Ano.ViewValue, 7)

				' GradosAc_Institucion
				CV_Profesores.GradosAc_Institucion.ViewValue = Convert.ToString(CV_Profesores.GradosAc_Institucion.Summary)

				' GradosAc_NombreInst
				CV_Profesores.GradosAc_NombreInst.ViewValue = Convert.ToString(CV_Profesores.GradosAc_NombreInst.Summary)

				' GradosAc_PaisInst
				CV_Profesores.GradosAc_PaisInst.ViewValue = Convert.ToString(CV_Profesores.GradosAc_PaisInst.Summary)

				' Investigacion_Nombre
				CV_Profesores.Investigacion_Nombre.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Nombre.Summary)

				' Investigacion_Director
				CV_Profesores.Investigacion_Director.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Director.Summary)

				' Investigacion_Institucion
				CV_Profesores.Investigacion_Institucion.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Institucion.Summary)

				' Investigacion_Monto
				CV_Profesores.Investigacion_Monto.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Monto.Summary)

				' Investigacion_Duracion
				CV_Profesores.Investigacion_Duracion.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Duracion.Summary)

				' ProgramaAc_Programa
				CV_Profesores.ProgramaAc_Programa.ViewValue = Convert.ToString(CV_Profesores.ProgramaAc_Programa.Summary)

				' Exp_Institucion
				CV_Profesores.Exp_Institucion.ViewValue = Convert.ToString(CV_Profesores.Exp_Institucion.Summary)

				' Exp_Programa
				CV_Profesores.Exp_Programa.ViewValue = Convert.ToString(CV_Profesores.Exp_Programa.Summary)

				' Exp_Facultad
				CV_Profesores.Exp_Facultad.ViewValue = Convert.ToString(CV_Profesores.Exp_Facultad.Summary)

				' Exp_Asignatura
				CV_Profesores.Exp_Asignatura.ViewValue = Convert.ToString(CV_Profesores.Exp_Asignatura.Summary)

				' Exp_Pais
				CV_Profesores.Exp_Pais.ViewValue = Convert.ToString(CV_Profesores.Exp_Pais.Summary)

				' Exp_FechInicio
				CV_Profesores.Exp_FechInicio.ViewValue = Convert.ToString(CV_Profesores.Exp_FechInicio.Summary)
				CV_Profesores.Exp_FechInicio.ViewValue = ew_FormatDateTime(CV_Profesores.Exp_FechInicio.ViewValue, 7)

				' Exp_FechaFin
				CV_Profesores.Exp_FechaFin.ViewValue = Convert.ToString(CV_Profesores.Exp_FechaFin.Summary)
				CV_Profesores.Exp_FechaFin.ViewValue = ew_FormatDateTime(CV_Profesores.Exp_FechaFin.ViewValue, 7)

				' Exp_Ano
				CV_Profesores.Exp_Ano.ViewValue = Convert.ToString(CV_Profesores.Exp_Ano.Summary)

				' Exp_Tipo
				CV_Profesores.Exp_Tipo.ViewValue = Convert.ToString(CV_Profesores.Exp_Tipo.Summary)

				' Perf_Institucion
				CV_Profesores.Perf_Institucion.ViewValue = Convert.ToString(CV_Profesores.Perf_Institucion.Summary)

				' Perf_Curso
				CV_Profesores.Perf_Curso.ViewValue = Convert.ToString(CV_Profesores.Perf_Curso.Summary)

				' Perf_Materia
				CV_Profesores.Perf_Materia.ViewValue = Convert.ToString(CV_Profesores.Perf_Materia.Summary)

				' Perf_Ano
				CV_Profesores.Perf_Ano.ViewValue = Convert.ToString(CV_Profesores.Perf_Ano.Summary)

				' Perf_Tipo
				CV_Profesores.Perf_Tipo.ViewValue = Convert.ToString(CV_Profesores.Perf_Tipo.Summary)

				' Membr_Nombre
				CV_Profesores.Membr_Nombre.ViewValue = Convert.ToString(CV_Profesores.Membr_Nombre.Summary)

				' Idiomas_Nombre
				CV_Profesores.Idiomas_Nombre.ViewValue = Convert.ToString(CV_Profesores.Idiomas_Nombre.Summary)

				' Idiomas_Hablado
				CV_Profesores.Idiomas_Hablado.ViewValue = Convert.ToString(CV_Profesores.Idiomas_Hablado.Summary)

				' Idiomas_Leido
				CV_Profesores.Idiomas_Leido.ViewValue = Convert.ToString(CV_Profesores.Idiomas_Leido.Summary)

				' Idiomas_Escrito
				CV_Profesores.Idiomas_Escrito.ViewValue = Convert.ToString(CV_Profesores.Idiomas_Escrito.Summary)

				' Becas_Nombre
				CV_Profesores.Becas_Nombre.ViewValue = Convert.ToString(CV_Profesores.Becas_Nombre.Summary)

				' Becas_Institucion
				CV_Profesores.Becas_Institucion.ViewValue = Convert.ToString(CV_Profesores.Becas_Institucion.Summary)

				' Becas_Ano
				CV_Profesores.Becas_Ano.ViewValue = Convert.ToString(CV_Profesores.Becas_Ano.Summary)

				' TipoP_Publicacion
				CV_Profesores.TipoP_Publicacion.ViewValue = Convert.ToString(CV_Profesores.TipoP_Publicacion.Summary)

				' TipoP_Lib
				CV_Profesores.TipoP_Lib.ViewValue = Convert.ToString(CV_Profesores.TipoP_Lib.Summary)

				' TipoP_Art
				CV_Profesores.TipoP_Art.ViewValue = Convert.ToString(CV_Profesores.TipoP_Art.Summary)

				' TipoP_Ars
				CV_Profesores.TipoP_Ars.ViewValue = Convert.ToString(CV_Profesores.TipoP_Ars.Summary)

				' TipoP_Arn
				CV_Profesores.TipoP_Arn.ViewValue = Convert.ToString(CV_Profesores.TipoP_Arn.Summary)

				' Publicacion_Titulo
				CV_Profesores.Publicacion_Titulo.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Titulo.Summary)

				' Publicacion_Nombre
				CV_Profesores.Publicacion_Nombre.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Nombre.Summary)

				' Publicacion_Editorial
				CV_Profesores.Publicacion_Editorial.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Editorial.Summary)

				' Publicacion_Autor
				CV_Profesores.Publicacion_Autor.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Autor.Summary)

				' Publicacion_Articulo
				CV_Profesores.Publicacion_Articulo.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Articulo.Summary)

				' Publicacion_Ano
				CV_Profesores.Publicacion_Ano.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Ano.Summary)

				' Publicacion_Fecha
				CV_Profesores.Publicacion_Fecha.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Fecha.Summary)
				CV_Profesores.Publicacion_Fecha.ViewValue = ew_FormatDateTime(CV_Profesores.Publicacion_Fecha.ViewValue, 7)

				' Publicacion_Tipo
				CV_Profesores.Publicacion_Tipo.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Tipo.Summary)
			Else

				' RUT_Profesor
				CV_Profesores.RUT_Profesor.GroupViewValue = Convert.ToString(CV_Profesores.RUT_Profesor.GroupValue())
				CV_Profesores.RUT_Profesor.CellAttrs("class") = "ewRptGrpField1"
				CV_Profesores.RUT_Profesor.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(CV_Profesores.RUT_Profesor, CV_Profesores.RUT_Profesor.GroupViewValue)
				If (ew_SameStr(CV_Profesores.RUT_Profesor.GroupValue(), CV_Profesores.RUT_Profesor.GroupOldValue()) AndAlso Not ChkLvlBreak(1))
					CV_Profesores.RUT_Profesor.GroupViewValue = "&nbsp;"
				End If

				' AP_PATER
				CV_Profesores.AP_PATER.GroupViewValue = Convert.ToString(CV_Profesores.AP_PATER.GroupValue())
				CV_Profesores.AP_PATER.CellAttrs("class") = "ewRptGrpField2"
				CV_Profesores.AP_PATER.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(CV_Profesores.AP_PATER, CV_Profesores.AP_PATER.GroupViewValue)
				If (ew_SameStr(CV_Profesores.AP_PATER.GroupValue(), CV_Profesores.AP_PATER.GroupOldValue()) AndAlso Not ChkLvlBreak(2))
					CV_Profesores.AP_PATER.GroupViewValue = "&nbsp;"
				End If

				' AP_MATER
				CV_Profesores.AP_MATER.GroupViewValue = Convert.ToString(CV_Profesores.AP_MATER.GroupValue())
				CV_Profesores.AP_MATER.CellAttrs("class") = "ewRptGrpField3"
				CV_Profesores.AP_MATER.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(CV_Profesores.AP_MATER, CV_Profesores.AP_MATER.GroupViewValue)
				If (ew_SameStr(CV_Profesores.AP_MATER.GroupValue(), CV_Profesores.AP_MATER.GroupOldValue()) AndAlso Not ChkLvlBreak(3))
					CV_Profesores.AP_MATER.GroupViewValue = "&nbsp;"
				End If

				' NOMBRES
				CV_Profesores.NOMBRES.GroupViewValue = Convert.ToString(CV_Profesores.NOMBRES.GroupValue())
				CV_Profesores.NOMBRES.CellAttrs("class") = "ewRptGrpField4"
				CV_Profesores.NOMBRES.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(CV_Profesores.NOMBRES, CV_Profesores.NOMBRES.GroupViewValue)
				If (ew_SameStr(CV_Profesores.NOMBRES.GroupValue(), CV_Profesores.NOMBRES.GroupOldValue()) AndAlso Not ChkLvlBreak(4))
					CV_Profesores.NOMBRES.GroupViewValue = "&nbsp;"
				End If

				' Extension_Nombre
				CV_Profesores.Extension_Nombre.ViewValue = Convert.ToString(CV_Profesores.Extension_Nombre.CurrentValue)
				CV_Profesores.Extension_Nombre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Extension_Responsable
				CV_Profesores.Extension_Responsable.ViewValue = Convert.ToString(CV_Profesores.Extension_Responsable.CurrentValue)
				CV_Profesores.Extension_Responsable.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Expresion_Institucion
				CV_Profesores.Expresion_Institucion.ViewValue = Convert.ToString(CV_Profesores.Expresion_Institucion.CurrentValue)
				CV_Profesores.Expresion_Institucion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Extension_Duracion
				CV_Profesores.Extension_Duracion.ViewValue = Convert.ToString(CV_Profesores.Extension_Duracion.CurrentValue)
				CV_Profesores.Extension_Duracion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' GradosAc_Grado
				CV_Profesores.GradosAc_Grado.ViewValue = Convert.ToString(CV_Profesores.GradosAc_Grado.CurrentValue)
				CV_Profesores.GradosAc_Grado.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' GradosAc_Nombre
				CV_Profesores.GradosAc_Nombre.ViewValue = Convert.ToString(CV_Profesores.GradosAc_Nombre.CurrentValue)
				CV_Profesores.GradosAc_Nombre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' GradosAc_Ano
				CV_Profesores.GradosAc_Ano.ViewValue = Convert.ToString(CV_Profesores.GradosAc_Ano.CurrentValue)
				CV_Profesores.GradosAc_Ano.ViewValue = ew_FormatDateTime(CV_Profesores.GradosAc_Ano.ViewValue, 7)
				CV_Profesores.GradosAc_Ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' GradosAc_Institucion
				CV_Profesores.GradosAc_Institucion.ViewValue = Convert.ToString(CV_Profesores.GradosAc_Institucion.CurrentValue)
				CV_Profesores.GradosAc_Institucion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' GradosAc_NombreInst
				CV_Profesores.GradosAc_NombreInst.ViewValue = Convert.ToString(CV_Profesores.GradosAc_NombreInst.CurrentValue)
				CV_Profesores.GradosAc_NombreInst.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' GradosAc_PaisInst
				CV_Profesores.GradosAc_PaisInst.ViewValue = Convert.ToString(CV_Profesores.GradosAc_PaisInst.CurrentValue)
				CV_Profesores.GradosAc_PaisInst.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Investigacion_Nombre
				CV_Profesores.Investigacion_Nombre.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Nombre.CurrentValue)
				CV_Profesores.Investigacion_Nombre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Investigacion_Director
				CV_Profesores.Investigacion_Director.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Director.CurrentValue)
				CV_Profesores.Investigacion_Director.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Investigacion_Institucion
				CV_Profesores.Investigacion_Institucion.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Institucion.CurrentValue)
				CV_Profesores.Investigacion_Institucion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Investigacion_Monto
				CV_Profesores.Investigacion_Monto.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Monto.CurrentValue)
				CV_Profesores.Investigacion_Monto.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Investigacion_Duracion
				CV_Profesores.Investigacion_Duracion.ViewValue = Convert.ToString(CV_Profesores.Investigacion_Duracion.CurrentValue)
				CV_Profesores.Investigacion_Duracion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ProgramaAc_Programa
				CV_Profesores.ProgramaAc_Programa.ViewValue = Convert.ToString(CV_Profesores.ProgramaAc_Programa.CurrentValue)
				CV_Profesores.ProgramaAc_Programa.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Exp_Institucion
				CV_Profesores.Exp_Institucion.ViewValue = Convert.ToString(CV_Profesores.Exp_Institucion.CurrentValue)
				CV_Profesores.Exp_Institucion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Exp_Programa
				CV_Profesores.Exp_Programa.ViewValue = Convert.ToString(CV_Profesores.Exp_Programa.CurrentValue)
				CV_Profesores.Exp_Programa.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Exp_Facultad
				CV_Profesores.Exp_Facultad.ViewValue = Convert.ToString(CV_Profesores.Exp_Facultad.CurrentValue)
				CV_Profesores.Exp_Facultad.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Exp_Asignatura
				CV_Profesores.Exp_Asignatura.ViewValue = Convert.ToString(CV_Profesores.Exp_Asignatura.CurrentValue)
				CV_Profesores.Exp_Asignatura.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Exp_Pais
				CV_Profesores.Exp_Pais.ViewValue = Convert.ToString(CV_Profesores.Exp_Pais.CurrentValue)
				CV_Profesores.Exp_Pais.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Exp_FechInicio
				CV_Profesores.Exp_FechInicio.ViewValue = Convert.ToString(CV_Profesores.Exp_FechInicio.CurrentValue)
				CV_Profesores.Exp_FechInicio.ViewValue = ew_FormatDateTime(CV_Profesores.Exp_FechInicio.ViewValue, 7)
				CV_Profesores.Exp_FechInicio.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Exp_FechaFin
				CV_Profesores.Exp_FechaFin.ViewValue = Convert.ToString(CV_Profesores.Exp_FechaFin.CurrentValue)
				CV_Profesores.Exp_FechaFin.ViewValue = ew_FormatDateTime(CV_Profesores.Exp_FechaFin.ViewValue, 7)
				CV_Profesores.Exp_FechaFin.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Exp_Ano
				CV_Profesores.Exp_Ano.ViewValue = Convert.ToString(CV_Profesores.Exp_Ano.CurrentValue)
				CV_Profesores.Exp_Ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Exp_Tipo
				CV_Profesores.Exp_Tipo.ViewValue = Convert.ToString(CV_Profesores.Exp_Tipo.CurrentValue)
				CV_Profesores.Exp_Tipo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Perf_Institucion
				CV_Profesores.Perf_Institucion.ViewValue = Convert.ToString(CV_Profesores.Perf_Institucion.CurrentValue)
				CV_Profesores.Perf_Institucion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Perf_Curso
				CV_Profesores.Perf_Curso.ViewValue = Convert.ToString(CV_Profesores.Perf_Curso.CurrentValue)
				CV_Profesores.Perf_Curso.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Perf_Materia
				CV_Profesores.Perf_Materia.ViewValue = Convert.ToString(CV_Profesores.Perf_Materia.CurrentValue)
				CV_Profesores.Perf_Materia.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Perf_Ano
				CV_Profesores.Perf_Ano.ViewValue = Convert.ToString(CV_Profesores.Perf_Ano.CurrentValue)
				CV_Profesores.Perf_Ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Perf_Tipo
				CV_Profesores.Perf_Tipo.ViewValue = Convert.ToString(CV_Profesores.Perf_Tipo.CurrentValue)
				CV_Profesores.Perf_Tipo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Membr_Nombre
				CV_Profesores.Membr_Nombre.ViewValue = Convert.ToString(CV_Profesores.Membr_Nombre.CurrentValue)
				CV_Profesores.Membr_Nombre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Idiomas_Nombre
				CV_Profesores.Idiomas_Nombre.ViewValue = Convert.ToString(CV_Profesores.Idiomas_Nombre.CurrentValue)
				CV_Profesores.Idiomas_Nombre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Idiomas_Hablado
				CV_Profesores.Idiomas_Hablado.ViewValue = Convert.ToString(CV_Profesores.Idiomas_Hablado.CurrentValue)
				CV_Profesores.Idiomas_Hablado.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Idiomas_Leido
				CV_Profesores.Idiomas_Leido.ViewValue = Convert.ToString(CV_Profesores.Idiomas_Leido.CurrentValue)
				CV_Profesores.Idiomas_Leido.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Idiomas_Escrito
				CV_Profesores.Idiomas_Escrito.ViewValue = Convert.ToString(CV_Profesores.Idiomas_Escrito.CurrentValue)
				CV_Profesores.Idiomas_Escrito.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Becas_Nombre
				CV_Profesores.Becas_Nombre.ViewValue = Convert.ToString(CV_Profesores.Becas_Nombre.CurrentValue)
				CV_Profesores.Becas_Nombre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Becas_Institucion
				CV_Profesores.Becas_Institucion.ViewValue = Convert.ToString(CV_Profesores.Becas_Institucion.CurrentValue)
				CV_Profesores.Becas_Institucion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Becas_Ano
				CV_Profesores.Becas_Ano.ViewValue = Convert.ToString(CV_Profesores.Becas_Ano.CurrentValue)
				CV_Profesores.Becas_Ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TipoP_Publicacion
				CV_Profesores.TipoP_Publicacion.ViewValue = Convert.ToString(CV_Profesores.TipoP_Publicacion.CurrentValue)
				CV_Profesores.TipoP_Publicacion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TipoP_Lib
				CV_Profesores.TipoP_Lib.ViewValue = Convert.ToString(CV_Profesores.TipoP_Lib.CurrentValue)
				CV_Profesores.TipoP_Lib.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TipoP_Art
				CV_Profesores.TipoP_Art.ViewValue = Convert.ToString(CV_Profesores.TipoP_Art.CurrentValue)
				CV_Profesores.TipoP_Art.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TipoP_Ars
				CV_Profesores.TipoP_Ars.ViewValue = Convert.ToString(CV_Profesores.TipoP_Ars.CurrentValue)
				CV_Profesores.TipoP_Ars.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TipoP_Arn
				CV_Profesores.TipoP_Arn.ViewValue = Convert.ToString(CV_Profesores.TipoP_Arn.CurrentValue)
				CV_Profesores.TipoP_Arn.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Publicacion_Titulo
				CV_Profesores.Publicacion_Titulo.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Titulo.CurrentValue)
				CV_Profesores.Publicacion_Titulo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Publicacion_Nombre
				CV_Profesores.Publicacion_Nombre.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Nombre.CurrentValue)
				CV_Profesores.Publicacion_Nombre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Publicacion_Editorial
				CV_Profesores.Publicacion_Editorial.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Editorial.CurrentValue)
				CV_Profesores.Publicacion_Editorial.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Publicacion_Autor
				CV_Profesores.Publicacion_Autor.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Autor.CurrentValue)
				CV_Profesores.Publicacion_Autor.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Publicacion_Articulo
				CV_Profesores.Publicacion_Articulo.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Articulo.CurrentValue)
				CV_Profesores.Publicacion_Articulo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Publicacion_Ano
				CV_Profesores.Publicacion_Ano.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Ano.CurrentValue)
				CV_Profesores.Publicacion_Ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Publicacion_Fecha
				CV_Profesores.Publicacion_Fecha.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Fecha.CurrentValue)
				CV_Profesores.Publicacion_Fecha.ViewValue = ew_FormatDateTime(CV_Profesores.Publicacion_Fecha.ViewValue, 7)
				CV_Profesores.Publicacion_Fecha.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Publicacion_Tipo
				CV_Profesores.Publicacion_Tipo.ViewValue = Convert.ToString(CV_Profesores.Publicacion_Tipo.CurrentValue)
				CV_Profesores.Publicacion_Tipo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUT_Profesor
			CV_Profesores.RUT_Profesor.HrefValue = ""

			' AP_PATER
			CV_Profesores.AP_PATER.HrefValue = ""

			' AP_MATER
			CV_Profesores.AP_MATER.HrefValue = ""

			' NOMBRES
			CV_Profesores.NOMBRES.HrefValue = ""

			' Extension_Nombre
			CV_Profesores.Extension_Nombre.HrefValue = ""

			' Extension_Responsable
			CV_Profesores.Extension_Responsable.HrefValue = ""

			' Expresion_Institucion
			CV_Profesores.Expresion_Institucion.HrefValue = ""

			' Extension_Duracion
			CV_Profesores.Extension_Duracion.HrefValue = ""

			' GradosAc_Grado
			CV_Profesores.GradosAc_Grado.HrefValue = ""

			' GradosAc_Nombre
			CV_Profesores.GradosAc_Nombre.HrefValue = ""

			' GradosAc_Ano
			CV_Profesores.GradosAc_Ano.HrefValue = ""

			' GradosAc_Institucion
			CV_Profesores.GradosAc_Institucion.HrefValue = ""

			' GradosAc_NombreInst
			CV_Profesores.GradosAc_NombreInst.HrefValue = ""

			' GradosAc_PaisInst
			CV_Profesores.GradosAc_PaisInst.HrefValue = ""

			' Investigacion_Nombre
			CV_Profesores.Investigacion_Nombre.HrefValue = ""

			' Investigacion_Director
			CV_Profesores.Investigacion_Director.HrefValue = ""

			' Investigacion_Institucion
			CV_Profesores.Investigacion_Institucion.HrefValue = ""

			' Investigacion_Monto
			CV_Profesores.Investigacion_Monto.HrefValue = ""

			' Investigacion_Duracion
			CV_Profesores.Investigacion_Duracion.HrefValue = ""

			' ProgramaAc_Programa
			CV_Profesores.ProgramaAc_Programa.HrefValue = ""

			' Exp_Institucion
			CV_Profesores.Exp_Institucion.HrefValue = ""

			' Exp_Programa
			CV_Profesores.Exp_Programa.HrefValue = ""

			' Exp_Facultad
			CV_Profesores.Exp_Facultad.HrefValue = ""

			' Exp_Asignatura
			CV_Profesores.Exp_Asignatura.HrefValue = ""

			' Exp_Pais
			CV_Profesores.Exp_Pais.HrefValue = ""

			' Exp_FechInicio
			CV_Profesores.Exp_FechInicio.HrefValue = ""

			' Exp_FechaFin
			CV_Profesores.Exp_FechaFin.HrefValue = ""

			' Exp_Ano
			CV_Profesores.Exp_Ano.HrefValue = ""

			' Exp_Tipo
			CV_Profesores.Exp_Tipo.HrefValue = ""

			' Perf_Institucion
			CV_Profesores.Perf_Institucion.HrefValue = ""

			' Perf_Curso
			CV_Profesores.Perf_Curso.HrefValue = ""

			' Perf_Materia
			CV_Profesores.Perf_Materia.HrefValue = ""

			' Perf_Ano
			CV_Profesores.Perf_Ano.HrefValue = ""

			' Perf_Tipo
			CV_Profesores.Perf_Tipo.HrefValue = ""

			' Membr_Nombre
			CV_Profesores.Membr_Nombre.HrefValue = ""

			' Idiomas_Nombre
			CV_Profesores.Idiomas_Nombre.HrefValue = ""

			' Idiomas_Hablado
			CV_Profesores.Idiomas_Hablado.HrefValue = ""

			' Idiomas_Leido
			CV_Profesores.Idiomas_Leido.HrefValue = ""

			' Idiomas_Escrito
			CV_Profesores.Idiomas_Escrito.HrefValue = ""

			' Becas_Nombre
			CV_Profesores.Becas_Nombre.HrefValue = ""

			' Becas_Institucion
			CV_Profesores.Becas_Institucion.HrefValue = ""

			' Becas_Ano
			CV_Profesores.Becas_Ano.HrefValue = ""

			' TipoP_Publicacion
			CV_Profesores.TipoP_Publicacion.HrefValue = ""

			' TipoP_Lib
			CV_Profesores.TipoP_Lib.HrefValue = ""

			' TipoP_Art
			CV_Profesores.TipoP_Art.HrefValue = ""

			' TipoP_Ars
			CV_Profesores.TipoP_Ars.HrefValue = ""

			' TipoP_Arn
			CV_Profesores.TipoP_Arn.HrefValue = ""

			' Publicacion_Titulo
			CV_Profesores.Publicacion_Titulo.HrefValue = ""

			' Publicacion_Nombre
			CV_Profesores.Publicacion_Nombre.HrefValue = ""

			' Publicacion_Editorial
			CV_Profesores.Publicacion_Editorial.HrefValue = ""

			' Publicacion_Autor
			CV_Profesores.Publicacion_Autor.HrefValue = ""

			' Publicacion_Articulo
			CV_Profesores.Publicacion_Articulo.HrefValue = ""

			' Publicacion_Ano
			CV_Profesores.Publicacion_Ano.HrefValue = ""

			' Publicacion_Fecha
			CV_Profesores.Publicacion_Fecha.HrefValue = ""

			' Publicacion_Tipo
			CV_Profesores.Publicacion_Tipo.HrefValue = ""

			' Call Row_Rendered event
			CV_Profesores.Row_Rendered()
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

				' Field RUT_Profesor
				SetSessionFilterValues(CV_Profesores.RUT_Profesor)

				' Field AP_PATER
				SetSessionFilterValues(CV_Profesores.AP_PATER)

				' Field AP_MATER
				SetSessionFilterValues(CV_Profesores.AP_MATER)

				' Field NOMBRES
				SetSessionFilterValues(CV_Profesores.NOMBRES)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT_Profesor
				If (GetFilterValues(CV_Profesores.RUT_Profesor)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field AP_PATER
				If (GetFilterValues(CV_Profesores.AP_PATER)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field AP_MATER
				If (GetFilterValues(CV_Profesores.AP_MATER)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRES
				If (GetFilterValues(CV_Profesores.NOMBRES)) Then
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

			' Field RUT_Profesor
			GetSessionFilterValues(CV_Profesores.RUT_Profesor)

			' Field AP_PATER
			GetSessionFilterValues(CV_Profesores.AP_PATER)

			' Field AP_MATER
			GetSessionFilterValues(CV_Profesores.AP_MATER)

			' Field NOMBRES
			GetSessionFilterValues(CV_Profesores.NOMBRES)
		End If

		' Call page filter validated event
		CV_Profesores.Page_FilterValidated()

		' Build SQL
		' Field RUT_Profesor

		BuildExtendedFilter(CV_Profesores.RUT_Profesor, sFilter)

		' Field AP_PATER
		BuildExtendedFilter(CV_Profesores.AP_PATER, sFilter)

		' Field AP_MATER
		BuildExtendedFilter(CV_Profesores.AP_MATER, sFilter)

		' Field NOMBRES
		BuildExtendedFilter(CV_Profesores.NOMBRES, sFilter)

		' Save parms to Session
		' Field RUT_Profesor

		SetSessionFilterValues(CV_Profesores.RUT_Profesor)

		' Field AP_PATER
		SetSessionFilterValues(CV_Profesores.AP_PATER)

		' Field AP_MATER
		SetSessionFilterValues(CV_Profesores.AP_MATER)

		' Field NOMBRES
		SetSessionFilterValues(CV_Profesores.NOMBRES)

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
		If ew_Session("sv_CV_Profesores_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_CV_Profesores_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_CV_Profesores_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_CV_Profesores_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_CV_Profesores_" + parm)
		End If
		If ew_Session("so1_CV_Profesores_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_CV_Profesores_" + parm))
		End If
		If ew_Session("sc_CV_Profesores_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_CV_Profesores_" + parm))
		End If
		If ew_Session("sv2_CV_Profesores_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_CV_Profesores_" + parm)
		End If
		If ew_Session("so2_CV_Profesores_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_CV_Profesores_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_CV_Profesores_" + parm) = fld.SearchValue
		ew_Session("so1_CV_Profesores_" + parm) = fld.SearchOperator
		ew_Session("sc_CV_Profesores_" + parm) = fld.SearchCondition
		ew_Session("sv2_CV_Profesores_" + parm) = fld.SearchValue2
		ew_Session("so2_CV_Profesores_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_CV_Profesores_" + parm) = ""
		ew_Session("so1_CV_Profesores_" + parm) = "="
		ew_Session("sc_CV_Profesores_" + parm) = "AND"
		ew_Session("sv2_CV_Profesores_" + parm) = ""
		ew_Session("so2_CV_Profesores_" + parm) = "="
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
		ew_Session("sel_CV_Profesores_" & parm) = ""
		ew_Session("rf_CV_Profesores_" & parm) = ""
		ew_Session("rt_CV_Profesores_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = CV_Profesores.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_CV_Profesores_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_CV_Profesores_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_CV_Profesores_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
		' Set up default values for extended filters
			' Field RUT_Profesor

			SetDefaultExtFilter(CV_Profesores.RUT_Profesor, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(CV_Profesores.RUT_Profesor)	

			' Field AP_PATER
			SetDefaultExtFilter(CV_Profesores.AP_PATER, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(CV_Profesores.AP_PATER)	

			' Field AP_MATER
			SetDefaultExtFilter(CV_Profesores.AP_MATER, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(CV_Profesores.AP_MATER)	

			' Field NOMBRES
			SetDefaultExtFilter(CV_Profesores.NOMBRES, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(CV_Profesores.NOMBRES)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT_Profesor extended filter
		If (TextFilterApplied(CV_Profesores.RUT_Profesor)) Then bFilterExist = True

		' Check AP_PATER extended filter
		If (TextFilterApplied(CV_Profesores.AP_PATER)) Then bFilterExist = True

		' Check AP_MATER extended filter
		If (TextFilterApplied(CV_Profesores.AP_MATER)) Then bFilterExist = True

		' Check NOMBRES extended filter
		If (TextFilterApplied(CV_Profesores.NOMBRES)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field RUT_Profesor
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(CV_Profesores.RUT_Profesor, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= CV_Profesores.RUT_Profesor.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AP_PATER
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(CV_Profesores.AP_PATER, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= CV_Profesores.AP_PATER.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AP_MATER
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(CV_Profesores.AP_MATER, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= CV_Profesores.AP_MATER.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRES
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(CV_Profesores.NOMBRES, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= CV_Profesores.NOMBRES.FldCaption() & "<br>"
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
				CV_Profesores.OrderBy = ""
				CV_Profesores.StartGroup = 1
				CV_Profesores.RUT_Profesor.Sort = ""
				CV_Profesores.AP_PATER.Sort = ""
				CV_Profesores.AP_MATER.Sort = ""
				CV_Profesores.NOMBRES.Sort = ""
				CV_Profesores.Extension_Nombre.Sort = ""
				CV_Profesores.Extension_Responsable.Sort = ""
				CV_Profesores.Expresion_Institucion.Sort = ""
				CV_Profesores.Extension_Duracion.Sort = ""
				CV_Profesores.GradosAc_Grado.Sort = ""
				CV_Profesores.GradosAc_Nombre.Sort = ""
				CV_Profesores.GradosAc_Ano.Sort = ""
				CV_Profesores.GradosAc_Institucion.Sort = ""
				CV_Profesores.GradosAc_NombreInst.Sort = ""
				CV_Profesores.GradosAc_PaisInst.Sort = ""
				CV_Profesores.Investigacion_Nombre.Sort = ""
				CV_Profesores.Investigacion_Director.Sort = ""
				CV_Profesores.Investigacion_Institucion.Sort = ""
				CV_Profesores.Investigacion_Monto.Sort = ""
				CV_Profesores.Investigacion_Duracion.Sort = ""
				CV_Profesores.ProgramaAc_Programa.Sort = ""
				CV_Profesores.Exp_Institucion.Sort = ""
				CV_Profesores.Exp_Programa.Sort = ""
				CV_Profesores.Exp_Facultad.Sort = ""
				CV_Profesores.Exp_Asignatura.Sort = ""
				CV_Profesores.Exp_Pais.Sort = ""
				CV_Profesores.Exp_FechInicio.Sort = ""
				CV_Profesores.Exp_FechaFin.Sort = ""
				CV_Profesores.Exp_Ano.Sort = ""
				CV_Profesores.Exp_Tipo.Sort = ""
				CV_Profesores.Perf_Institucion.Sort = ""
				CV_Profesores.Perf_Curso.Sort = ""
				CV_Profesores.Perf_Materia.Sort = ""
				CV_Profesores.Perf_Ano.Sort = ""
				CV_Profesores.Perf_Tipo.Sort = ""
				CV_Profesores.Membr_Nombre.Sort = ""
				CV_Profesores.Idiomas_Nombre.Sort = ""
				CV_Profesores.Idiomas_Hablado.Sort = ""
				CV_Profesores.Idiomas_Leido.Sort = ""
				CV_Profesores.Idiomas_Escrito.Sort = ""
				CV_Profesores.Becas_Nombre.Sort = ""
				CV_Profesores.Becas_Institucion.Sort = ""
				CV_Profesores.Becas_Ano.Sort = ""
				CV_Profesores.TipoP_Publicacion.Sort = ""
				CV_Profesores.TipoP_Lib.Sort = ""
				CV_Profesores.TipoP_Art.Sort = ""
				CV_Profesores.TipoP_Ars.Sort = ""
				CV_Profesores.TipoP_Arn.Sort = ""
				CV_Profesores.Publicacion_Titulo.Sort = ""
				CV_Profesores.Publicacion_Nombre.Sort = ""
				CV_Profesores.Publicacion_Editorial.Sort = ""
				CV_Profesores.Publicacion_Autor.Sort = ""
				CV_Profesores.Publicacion_Articulo.Sort = ""
				CV_Profesores.Publicacion_Ano.Sort = ""
				CV_Profesores.Publicacion_Fecha.Sort = ""
				CV_Profesores.Publicacion_Tipo.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			CV_Profesores.CurrentOrder = ew_Get("order")
			CV_Profesores.CurrentOrderType = ew_Get("ordertype")
			sSortSql = CV_Profesores.SortSql()
			CV_Profesores.OrderBy = sSortSql
			CV_Profesores.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(CV_Profesores.OrderBy)) Then
			CV_Profesores.OrderBy = "[AP_PATER] ASC, [AP_MATER] ASC, [NOMBRES] ASC"
			CV_Profesores.AP_PATER.Sort = "ASC"
			CV_Profesores.AP_MATER.Sort = "ASC"
			CV_Profesores.NOMBRES.Sort = "ASC"
		End If
		Return CV_Profesores.OrderBy
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
		CV_Profesores_summary = New crCV_Profesores_summary(Me)
		CV_Profesores_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		CV_Profesores_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (CV_Profesores_summary IsNot Nothing) Then CV_Profesores_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (CV_Profesores.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var CV_Profesores_summary = new ewrpt_Page("CV_Profesores_summary");
// page properties
CV_Profesores_summary.PageID = "summary"; // page ID
CV_Profesores_summary.FormID = "fCV_Profesoressummaryfilter"; // form ID
var EWRPT_PAGE_ID = CV_Profesores_summary.PageID;
// extend page with ValidateForm function
CV_Profesores_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
CV_Profesores_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
CV_Profesores_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
CV_Profesores_summary.ValidateRequired = false; // no JavaScript validation
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
<% CV_Profesores_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (CV_Profesores.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (CV_Profesores.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= CV_Profesores.TableCaption() %></h1></div>
<% If (CV_Profesores.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= CV_Profesores_summary.ExportExcelUrl %>"><img src="images/excel.png" alt="Exportar a Excel" title="Exportar a Excel" border="0" /></a>
<% If (CV_Profesores_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% CV_Profesores_summary.ShowMessage() %>
<% If (CV_Profesores.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (CV_Profesores.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (CV_Profesores.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (CV_Profesores.FilterPanelOption = 2 OrElse (CV_Profesores.FilterPanelOption = 3 AndAlso CV_Profesores_summary.FilterApplied) OrElse CV_Profesores_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="CV_Profesoressmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fCV_Profesoressummaryfilter" id="fCV_Profesoressummaryfilter" action="CV_Profesoressmry.aspx" class="ewForm" onsubmit="return CV_Profesores_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = CV_Profesores.NOMBRES.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= CV_Profesores.RUT_Profesor.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT_Profesor" id="sv1_RUT_Profesor" size="30" maxlength="24" value="<%= ew_HtmlEncode(CV_Profesores.RUT_Profesor.SearchValue) %>"<%= IIf(CV_Profesores_summary.ClearExtFilter = "CV_Profesores_RUT_Profesor", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= CV_Profesores.AP_PATER.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_AP_PATER" id="sv1_AP_PATER" size="30" maxlength="30" value="<%= ew_HtmlEncode(CV_Profesores.AP_PATER.SearchValue) %>"<%= IIf(CV_Profesores_summary.ClearExtFilter = "CV_Profesores_AP_PATER", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= CV_Profesores.AP_MATER.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_AP_MATER" id="sv1_AP_MATER" size="30" maxlength="30" value="<%= ew_HtmlEncode(CV_Profesores.AP_MATER.SearchValue) %>"<%= IIf(CV_Profesores_summary.ClearExtFilter = "CV_Profesores_AP_MATER", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= CV_Profesores.NOMBRES.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRES" id="sv1_NOMBRES" size="30" maxlength="30" value="<%= ew_HtmlEncode(CV_Profesores.NOMBRES.SearchValue) %>"<%= IIf(CV_Profesores_summary.ClearExtFilter = "CV_Profesores_NOMBRES", " class=""ewInputCleared""", "") %>>
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
<% If (CV_Profesores.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% CV_Profesores_summary.ShowFilterList() %>
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
If (CV_Profesores.ExportAll AndAlso ew_NotEmpty(CV_Profesores.Export)) Then
	CV_Profesores_summary.StopGrp = CV_Profesores_summary.TotalGrps
Else
	CV_Profesores_summary.StopGrp = CV_Profesores_summary.StartGrp + CV_Profesores_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (CV_Profesores_summary.StopGrp > CV_Profesores_summary.TotalGrps) Then
	CV_Profesores_summary.StopGrp = CV_Profesores_summary.TotalGrps
End If
CV_Profesores_summary.RecCount = 0

' Get first row
If (CV_Profesores_summary.TotalGrps > 0) Then
	CV_Profesores_summary.GetGrpRow(1)
	CV_Profesores_summary.GrpCount = 1
End If
While (CV_Profesores_summary.GrpIndex < CV_Profesores_summary.StopGrp OrElse CV_Profesores_summary.ShowFirstHeader)

	' Show header
	If (CV_Profesores_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.RUT_Profesor.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.RUT_Profesor))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.RUT_Profesor.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.RUT_Profesor) %>',0);"><%= CV_Profesores.RUT_Profesor.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.RUT_Profesor.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.RUT_Profesor.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.AP_PATER.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.AP_PATER))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.AP_PATER.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.AP_PATER) %>',0);"><%= CV_Profesores.AP_PATER.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.AP_PATER.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.AP_PATER.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.AP_MATER.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.AP_MATER))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.AP_MATER.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.AP_MATER) %>',0);"><%= CV_Profesores.AP_MATER.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.AP_MATER.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.AP_MATER.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.NOMBRES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.NOMBRES))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.NOMBRES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.NOMBRES) %>',0);"><%= CV_Profesores.NOMBRES.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.NOMBRES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.NOMBRES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Extension_Nombre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Extension_Nombre))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Extension_Nombre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Extension_Nombre) %>',0);"><%= CV_Profesores.Extension_Nombre.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Extension_Nombre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Extension_Nombre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Extension_Responsable.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Extension_Responsable))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Extension_Responsable.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Extension_Responsable) %>',0);"><%= CV_Profesores.Extension_Responsable.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Extension_Responsable.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Extension_Responsable.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Expresion_Institucion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Expresion_Institucion))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Expresion_Institucion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Expresion_Institucion) %>',0);"><%= CV_Profesores.Expresion_Institucion.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Expresion_Institucion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Expresion_Institucion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Extension_Duracion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Extension_Duracion))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Extension_Duracion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Extension_Duracion) %>',0);"><%= CV_Profesores.Extension_Duracion.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Extension_Duracion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Extension_Duracion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.GradosAc_Grado.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.GradosAc_Grado))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.GradosAc_Grado.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.GradosAc_Grado) %>',0);"><%= CV_Profesores.GradosAc_Grado.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.GradosAc_Grado.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.GradosAc_Grado.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.GradosAc_Nombre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.GradosAc_Nombre))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.GradosAc_Nombre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.GradosAc_Nombre) %>',0);"><%= CV_Profesores.GradosAc_Nombre.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.GradosAc_Nombre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.GradosAc_Nombre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.GradosAc_Ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.GradosAc_Ano))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.GradosAc_Ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.GradosAc_Ano) %>',0);"><%= CV_Profesores.GradosAc_Ano.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.GradosAc_Ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.GradosAc_Ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.GradosAc_Institucion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.GradosAc_Institucion))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.GradosAc_Institucion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.GradosAc_Institucion) %>',0);"><%= CV_Profesores.GradosAc_Institucion.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.GradosAc_Institucion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.GradosAc_Institucion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.GradosAc_NombreInst.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.GradosAc_NombreInst))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.GradosAc_NombreInst.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.GradosAc_NombreInst) %>',0);"><%= CV_Profesores.GradosAc_NombreInst.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.GradosAc_NombreInst.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.GradosAc_NombreInst.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.GradosAc_PaisInst.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.GradosAc_PaisInst))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.GradosAc_PaisInst.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.GradosAc_PaisInst) %>',0);"><%= CV_Profesores.GradosAc_PaisInst.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.GradosAc_PaisInst.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.GradosAc_PaisInst.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Investigacion_Nombre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Investigacion_Nombre))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Investigacion_Nombre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Investigacion_Nombre) %>',0);"><%= CV_Profesores.Investigacion_Nombre.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Investigacion_Nombre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Investigacion_Nombre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Investigacion_Director.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Investigacion_Director))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Investigacion_Director.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Investigacion_Director) %>',0);"><%= CV_Profesores.Investigacion_Director.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Investigacion_Director.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Investigacion_Director.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Investigacion_Institucion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Investigacion_Institucion))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Investigacion_Institucion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Investigacion_Institucion) %>',0);"><%= CV_Profesores.Investigacion_Institucion.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Investigacion_Institucion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Investigacion_Institucion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Investigacion_Monto.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Investigacion_Monto))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Investigacion_Monto.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Investigacion_Monto) %>',0);"><%= CV_Profesores.Investigacion_Monto.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Investigacion_Monto.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Investigacion_Monto.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Investigacion_Duracion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Investigacion_Duracion))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Investigacion_Duracion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Investigacion_Duracion) %>',0);"><%= CV_Profesores.Investigacion_Duracion.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Investigacion_Duracion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Investigacion_Duracion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.ProgramaAc_Programa.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.ProgramaAc_Programa))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.ProgramaAc_Programa.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.ProgramaAc_Programa) %>',0);"><%= CV_Profesores.ProgramaAc_Programa.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.ProgramaAc_Programa.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.ProgramaAc_Programa.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Exp_Institucion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Exp_Institucion))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Exp_Institucion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Exp_Institucion) %>',0);"><%= CV_Profesores.Exp_Institucion.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Exp_Institucion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Exp_Institucion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Exp_Programa.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Exp_Programa))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Exp_Programa.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Exp_Programa) %>',0);"><%= CV_Profesores.Exp_Programa.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Exp_Programa.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Exp_Programa.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Exp_Facultad.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Exp_Facultad))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Exp_Facultad.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Exp_Facultad) %>',0);"><%= CV_Profesores.Exp_Facultad.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Exp_Facultad.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Exp_Facultad.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Exp_Asignatura.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Exp_Asignatura))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Exp_Asignatura.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Exp_Asignatura) %>',0);"><%= CV_Profesores.Exp_Asignatura.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Exp_Asignatura.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Exp_Asignatura.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Exp_Pais.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Exp_Pais))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Exp_Pais.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Exp_Pais) %>',0);"><%= CV_Profesores.Exp_Pais.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Exp_Pais.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Exp_Pais.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Exp_FechInicio.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Exp_FechInicio))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Exp_FechInicio.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Exp_FechInicio) %>',0);"><%= CV_Profesores.Exp_FechInicio.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Exp_FechInicio.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Exp_FechInicio.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Exp_FechaFin.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Exp_FechaFin))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Exp_FechaFin.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Exp_FechaFin) %>',0);"><%= CV_Profesores.Exp_FechaFin.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Exp_FechaFin.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Exp_FechaFin.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Exp_Ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Exp_Ano))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Exp_Ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Exp_Ano) %>',0);"><%= CV_Profesores.Exp_Ano.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Exp_Ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Exp_Ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Exp_Tipo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Exp_Tipo))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Exp_Tipo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Exp_Tipo) %>',0);"><%= CV_Profesores.Exp_Tipo.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Exp_Tipo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Exp_Tipo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Perf_Institucion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Perf_Institucion))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Perf_Institucion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Perf_Institucion) %>',0);"><%= CV_Profesores.Perf_Institucion.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Perf_Institucion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Perf_Institucion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Perf_Curso.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Perf_Curso))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Perf_Curso.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Perf_Curso) %>',0);"><%= CV_Profesores.Perf_Curso.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Perf_Curso.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Perf_Curso.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Perf_Materia.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Perf_Materia))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Perf_Materia.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Perf_Materia) %>',0);"><%= CV_Profesores.Perf_Materia.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Perf_Materia.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Perf_Materia.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Perf_Ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Perf_Ano))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Perf_Ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Perf_Ano) %>',0);"><%= CV_Profesores.Perf_Ano.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Perf_Ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Perf_Ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Perf_Tipo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Perf_Tipo))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Perf_Tipo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Perf_Tipo) %>',0);"><%= CV_Profesores.Perf_Tipo.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Perf_Tipo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Perf_Tipo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Membr_Nombre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Membr_Nombre))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Membr_Nombre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Membr_Nombre) %>',0);"><%= CV_Profesores.Membr_Nombre.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Membr_Nombre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Membr_Nombre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Idiomas_Nombre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Idiomas_Nombre))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Idiomas_Nombre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Idiomas_Nombre) %>',0);"><%= CV_Profesores.Idiomas_Nombre.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Idiomas_Nombre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Idiomas_Nombre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Idiomas_Hablado.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Idiomas_Hablado))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Idiomas_Hablado.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Idiomas_Hablado) %>',0);"><%= CV_Profesores.Idiomas_Hablado.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Idiomas_Hablado.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Idiomas_Hablado.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Idiomas_Leido.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Idiomas_Leido))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Idiomas_Leido.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Idiomas_Leido) %>',0);"><%= CV_Profesores.Idiomas_Leido.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Idiomas_Leido.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Idiomas_Leido.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Idiomas_Escrito.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Idiomas_Escrito))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Idiomas_Escrito.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Idiomas_Escrito) %>',0);"><%= CV_Profesores.Idiomas_Escrito.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Idiomas_Escrito.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Idiomas_Escrito.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Becas_Nombre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Becas_Nombre))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Becas_Nombre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Becas_Nombre) %>',0);"><%= CV_Profesores.Becas_Nombre.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Becas_Nombre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Becas_Nombre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Becas_Institucion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Becas_Institucion))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Becas_Institucion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Becas_Institucion) %>',0);"><%= CV_Profesores.Becas_Institucion.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Becas_Institucion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Becas_Institucion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Becas_Ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Becas_Ano))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Becas_Ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Becas_Ano) %>',0);"><%= CV_Profesores.Becas_Ano.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Becas_Ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Becas_Ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.TipoP_Publicacion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.TipoP_Publicacion))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.TipoP_Publicacion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.TipoP_Publicacion) %>',0);"><%= CV_Profesores.TipoP_Publicacion.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.TipoP_Publicacion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.TipoP_Publicacion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.TipoP_Lib.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.TipoP_Lib))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.TipoP_Lib.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.TipoP_Lib) %>',0);"><%= CV_Profesores.TipoP_Lib.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.TipoP_Lib.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.TipoP_Lib.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.TipoP_Art.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.TipoP_Art))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.TipoP_Art.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.TipoP_Art) %>',0);"><%= CV_Profesores.TipoP_Art.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.TipoP_Art.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.TipoP_Art.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.TipoP_Ars.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.TipoP_Ars))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.TipoP_Ars.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.TipoP_Ars) %>',0);"><%= CV_Profesores.TipoP_Ars.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.TipoP_Ars.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.TipoP_Ars.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.TipoP_Arn.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.TipoP_Arn))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.TipoP_Arn.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.TipoP_Arn) %>',0);"><%= CV_Profesores.TipoP_Arn.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.TipoP_Arn.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.TipoP_Arn.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Publicacion_Titulo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Publicacion_Titulo))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Publicacion_Titulo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Publicacion_Titulo) %>',0);"><%= CV_Profesores.Publicacion_Titulo.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Publicacion_Titulo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Publicacion_Titulo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Publicacion_Nombre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Publicacion_Nombre))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Publicacion_Nombre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Publicacion_Nombre) %>',0);"><%= CV_Profesores.Publicacion_Nombre.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Publicacion_Nombre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Publicacion_Nombre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Publicacion_Editorial.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Publicacion_Editorial))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Publicacion_Editorial.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Publicacion_Editorial) %>',0);"><%= CV_Profesores.Publicacion_Editorial.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Publicacion_Editorial.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Publicacion_Editorial.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Publicacion_Autor.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Publicacion_Autor))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Publicacion_Autor.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Publicacion_Autor) %>',0);"><%= CV_Profesores.Publicacion_Autor.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Publicacion_Autor.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Publicacion_Autor.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Publicacion_Articulo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Publicacion_Articulo))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Publicacion_Articulo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Publicacion_Articulo) %>',0);"><%= CV_Profesores.Publicacion_Articulo.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Publicacion_Articulo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Publicacion_Articulo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Publicacion_Ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Publicacion_Ano))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Publicacion_Ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Publicacion_Ano) %>',0);"><%= CV_Profesores.Publicacion_Ano.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Publicacion_Ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Publicacion_Ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Publicacion_Fecha.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Publicacion_Fecha))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Publicacion_Fecha.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Publicacion_Fecha) %>',0);"><%= CV_Profesores.Publicacion_Fecha.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Publicacion_Fecha.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Publicacion_Fecha.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(CV_Profesores.Export)) Then %>
<%= CV_Profesores.Publicacion_Tipo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(CV_Profesores.SortUrl(CV_Profesores.Publicacion_Tipo))) Then %>
		<td style="vertical-align: bottom;"><%= CV_Profesores.Publicacion_Tipo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CV_Profesores.SortUrl(CV_Profesores.Publicacion_Tipo) %>',0);"><%= CV_Profesores.Publicacion_Tipo.FldCaption() %></td><td style="width: 10px;">
		<% If (CV_Profesores.Publicacion_Tipo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (CV_Profesores.Publicacion_Tipo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		CV_Profesores_summary.ShowFirstHeader = False
	End If

	' Build detail SQL
	Dim sWhere As String = ewrpt_DetailFilterSQL(CV_Profesores.RUT_Profesor, CV_Profesores.SqlFirstGroupField, CV_Profesores.RUT_Profesor.GroupValue())
	If (ew_NotEmpty(CV_Profesores_summary.Filter)) Then
		sWhere = "(" + CV_Profesores_summary.Filter + ") AND (" + sWhere + ")"
	End If
	sSql = ewrpt_BuildReportSql(CV_Profesores.SqlSelect, CV_Profesores.SqlWhere, CV_Profesores.SqlGroupBy, CV_Profesores.SqlHaving, CV_Profesores.SqlOrderBy, sWhere, CV_Profesores_summary.Sort)
	CV_Profesores_summary.rs = Conn.GetRows(sSql)
	Dim rsdtlcnt As Integer = CV_Profesores_summary.rs.Count
	CV_Profesores_summary.RowIndex = 0	
	If (rsdtlcnt > 0) Then
		CV_Profesores_summary.GetRow(1)
	End If

	' Loop detail records
	While (CV_Profesores_summary.RowIndex < CV_Profesores_summary.rs.Count) 
		CV_Profesores_summary.RecCount += 1

		' Render detail row
		CV_Profesores.ResetCSS()
		CV_Profesores.RowType = EWRPT_ROWTYPE_DETAIL
		CV_Profesores_summary.RenderRow()
%>
	<tr<%= CV_Profesores.RowAttributes() %>>
		<td<%= CV_Profesores.RUT_Profesor.CellAttributes %>><div<%= CV_Profesores.RUT_Profesor.ViewAttributes %>><%= CV_Profesores.RUT_Profesor.GroupViewValue %></div></td>
		<td<%= CV_Profesores.AP_PATER.CellAttributes %>><div<%= CV_Profesores.AP_PATER.ViewAttributes %>><%= CV_Profesores.AP_PATER.GroupViewValue %></div></td>
		<td<%= CV_Profesores.AP_MATER.CellAttributes %>><div<%= CV_Profesores.AP_MATER.ViewAttributes %>><%= CV_Profesores.AP_MATER.GroupViewValue %></div></td>
		<td<%= CV_Profesores.NOMBRES.CellAttributes %>><div<%= CV_Profesores.NOMBRES.ViewAttributes %>><%= CV_Profesores.NOMBRES.GroupViewValue %></div></td>
		<td<%= CV_Profesores.Extension_Nombre.CellAttributes %>>
<div<%= CV_Profesores.Extension_Nombre.ViewAttributes%>><%= CV_Profesores.Extension_Nombre.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Extension_Responsable.CellAttributes %>>
<div<%= CV_Profesores.Extension_Responsable.ViewAttributes%>><%= CV_Profesores.Extension_Responsable.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Expresion_Institucion.CellAttributes %>>
<div<%= CV_Profesores.Expresion_Institucion.ViewAttributes%>><%= CV_Profesores.Expresion_Institucion.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Extension_Duracion.CellAttributes %>>
<div<%= CV_Profesores.Extension_Duracion.ViewAttributes%>><%= CV_Profesores.Extension_Duracion.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.GradosAc_Grado.CellAttributes %>>
<div<%= CV_Profesores.GradosAc_Grado.ViewAttributes%>><%= CV_Profesores.GradosAc_Grado.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.GradosAc_Nombre.CellAttributes %>>
<div<%= CV_Profesores.GradosAc_Nombre.ViewAttributes%>><%= CV_Profesores.GradosAc_Nombre.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.GradosAc_Ano.CellAttributes %>>
<div<%= CV_Profesores.GradosAc_Ano.ViewAttributes%>><%= CV_Profesores.GradosAc_Ano.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.GradosAc_Institucion.CellAttributes %>>
<div<%= CV_Profesores.GradosAc_Institucion.ViewAttributes%>><%= CV_Profesores.GradosAc_Institucion.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.GradosAc_NombreInst.CellAttributes %>>
<div<%= CV_Profesores.GradosAc_NombreInst.ViewAttributes%>><%= CV_Profesores.GradosAc_NombreInst.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.GradosAc_PaisInst.CellAttributes %>>
<div<%= CV_Profesores.GradosAc_PaisInst.ViewAttributes%>><%= CV_Profesores.GradosAc_PaisInst.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Investigacion_Nombre.CellAttributes %>>
<div<%= CV_Profesores.Investigacion_Nombre.ViewAttributes%>><%= CV_Profesores.Investigacion_Nombre.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Investigacion_Director.CellAttributes %>>
<div<%= CV_Profesores.Investigacion_Director.ViewAttributes%>><%= CV_Profesores.Investigacion_Director.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Investigacion_Institucion.CellAttributes %>>
<div<%= CV_Profesores.Investigacion_Institucion.ViewAttributes%>><%= CV_Profesores.Investigacion_Institucion.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Investigacion_Monto.CellAttributes %>>
<div<%= CV_Profesores.Investigacion_Monto.ViewAttributes%>><%= CV_Profesores.Investigacion_Monto.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Investigacion_Duracion.CellAttributes %>>
<div<%= CV_Profesores.Investigacion_Duracion.ViewAttributes%>><%= CV_Profesores.Investigacion_Duracion.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.ProgramaAc_Programa.CellAttributes %>>
<div<%= CV_Profesores.ProgramaAc_Programa.ViewAttributes%>><%= CV_Profesores.ProgramaAc_Programa.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Exp_Institucion.CellAttributes %>>
<div<%= CV_Profesores.Exp_Institucion.ViewAttributes%>><%= CV_Profesores.Exp_Institucion.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Exp_Programa.CellAttributes %>>
<div<%= CV_Profesores.Exp_Programa.ViewAttributes%>><%= CV_Profesores.Exp_Programa.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Exp_Facultad.CellAttributes %>>
<div<%= CV_Profesores.Exp_Facultad.ViewAttributes%>><%= CV_Profesores.Exp_Facultad.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Exp_Asignatura.CellAttributes %>>
<div<%= CV_Profesores.Exp_Asignatura.ViewAttributes%>><%= CV_Profesores.Exp_Asignatura.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Exp_Pais.CellAttributes %>>
<div<%= CV_Profesores.Exp_Pais.ViewAttributes%>><%= CV_Profesores.Exp_Pais.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Exp_FechInicio.CellAttributes %>>
<div<%= CV_Profesores.Exp_FechInicio.ViewAttributes%>><%= CV_Profesores.Exp_FechInicio.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Exp_FechaFin.CellAttributes %>>
<div<%= CV_Profesores.Exp_FechaFin.ViewAttributes%>><%= CV_Profesores.Exp_FechaFin.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Exp_Ano.CellAttributes %>>
<div<%= CV_Profesores.Exp_Ano.ViewAttributes%>><%= CV_Profesores.Exp_Ano.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Exp_Tipo.CellAttributes %>>
<div<%= CV_Profesores.Exp_Tipo.ViewAttributes%>><%= CV_Profesores.Exp_Tipo.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Perf_Institucion.CellAttributes %>>
<div<%= CV_Profesores.Perf_Institucion.ViewAttributes%>><%= CV_Profesores.Perf_Institucion.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Perf_Curso.CellAttributes %>>
<div<%= CV_Profesores.Perf_Curso.ViewAttributes%>><%= CV_Profesores.Perf_Curso.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Perf_Materia.CellAttributes %>>
<div<%= CV_Profesores.Perf_Materia.ViewAttributes%>><%= CV_Profesores.Perf_Materia.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Perf_Ano.CellAttributes %>>
<div<%= CV_Profesores.Perf_Ano.ViewAttributes%>><%= CV_Profesores.Perf_Ano.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Perf_Tipo.CellAttributes %>>
<div<%= CV_Profesores.Perf_Tipo.ViewAttributes%>><%= CV_Profesores.Perf_Tipo.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Membr_Nombre.CellAttributes %>>
<div<%= CV_Profesores.Membr_Nombre.ViewAttributes%>><%= CV_Profesores.Membr_Nombre.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Idiomas_Nombre.CellAttributes %>>
<div<%= CV_Profesores.Idiomas_Nombre.ViewAttributes%>><%= CV_Profesores.Idiomas_Nombre.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Idiomas_Hablado.CellAttributes %>>
<div<%= CV_Profesores.Idiomas_Hablado.ViewAttributes%>><%= CV_Profesores.Idiomas_Hablado.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Idiomas_Leido.CellAttributes %>>
<div<%= CV_Profesores.Idiomas_Leido.ViewAttributes%>><%= CV_Profesores.Idiomas_Leido.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Idiomas_Escrito.CellAttributes %>>
<div<%= CV_Profesores.Idiomas_Escrito.ViewAttributes%>><%= CV_Profesores.Idiomas_Escrito.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Becas_Nombre.CellAttributes %>>
<div<%= CV_Profesores.Becas_Nombre.ViewAttributes%>><%= CV_Profesores.Becas_Nombre.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Becas_Institucion.CellAttributes %>>
<div<%= CV_Profesores.Becas_Institucion.ViewAttributes%>><%= CV_Profesores.Becas_Institucion.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Becas_Ano.CellAttributes %>>
<div<%= CV_Profesores.Becas_Ano.ViewAttributes%>><%= CV_Profesores.Becas_Ano.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.TipoP_Publicacion.CellAttributes %>>
<div<%= CV_Profesores.TipoP_Publicacion.ViewAttributes%>><%= CV_Profesores.TipoP_Publicacion.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.TipoP_Lib.CellAttributes %>>
<div<%= CV_Profesores.TipoP_Lib.ViewAttributes%>><%= CV_Profesores.TipoP_Lib.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.TipoP_Art.CellAttributes %>>
<div<%= CV_Profesores.TipoP_Art.ViewAttributes%>><%= CV_Profesores.TipoP_Art.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.TipoP_Ars.CellAttributes %>>
<div<%= CV_Profesores.TipoP_Ars.ViewAttributes%>><%= CV_Profesores.TipoP_Ars.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.TipoP_Arn.CellAttributes %>>
<div<%= CV_Profesores.TipoP_Arn.ViewAttributes%>><%= CV_Profesores.TipoP_Arn.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Publicacion_Titulo.CellAttributes %>>
<div<%= CV_Profesores.Publicacion_Titulo.ViewAttributes%>><%= CV_Profesores.Publicacion_Titulo.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Publicacion_Nombre.CellAttributes %>>
<div<%= CV_Profesores.Publicacion_Nombre.ViewAttributes%>><%= CV_Profesores.Publicacion_Nombre.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Publicacion_Editorial.CellAttributes %>>
<div<%= CV_Profesores.Publicacion_Editorial.ViewAttributes%>><%= CV_Profesores.Publicacion_Editorial.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Publicacion_Autor.CellAttributes %>>
<div<%= CV_Profesores.Publicacion_Autor.ViewAttributes%>><%= CV_Profesores.Publicacion_Autor.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Publicacion_Articulo.CellAttributes %>>
<div<%= CV_Profesores.Publicacion_Articulo.ViewAttributes%>><%= CV_Profesores.Publicacion_Articulo.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Publicacion_Ano.CellAttributes %>>
<div<%= CV_Profesores.Publicacion_Ano.ViewAttributes%>><%= CV_Profesores.Publicacion_Ano.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Publicacion_Fecha.CellAttributes %>>
<div<%= CV_Profesores.Publicacion_Fecha.ViewAttributes%>><%= CV_Profesores.Publicacion_Fecha.ListViewValue%></div>
</td>
		<td<%= CV_Profesores.Publicacion_Tipo.CellAttributes %>>
<div<%= CV_Profesores.Publicacion_Tipo.ViewAttributes%>><%= CV_Profesores.Publicacion_Tipo.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		CV_Profesores_summary.AccumulateSummary()

		' Get next record
		CV_Profesores_summary.GetRow(2)

		' Show Footers
%>
<%
	End While ' End detail records loop
%>
<%

	' Next group
	CV_Profesores_summary.GetGrpRow(2)
	CV_Profesores_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (CV_Profesores_summary.TotalGrps > 0) Then
	CV_Profesores.ResetCSS()
	CV_Profesores.RowType = EWRPT_ROWTYPE_TOTAL
	CV_Profesores.RowTotalType = EWRPT_ROWTOTAL_GRAND
	CV_Profesores.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	CV_Profesores.RowAttrs("class") = "ewRptGrandSummary"
	CV_Profesores_summary.RenderRow()
%>
	<!-- tr><td colspan="55"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= CV_Profesores.RowAttributes() %>><td colspan="55"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(CV_Profesores_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (CV_Profesores.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If CV_Profesores_summary.Pager Is Nothing Then CV_Profesores_summary.Pager = New cPrevNextPager(CV_Profesores_summary.StartGrp, CV_Profesores_summary.DisplayGrps, CV_Profesores_summary.TotalGrps) %>
<% If CV_Profesores_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If CV_Profesores_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="CV_Profesoressmry.aspx?start=<%= CV_Profesores_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If CV_Profesores_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="CV_Profesoressmry.aspx?start=<%= CV_Profesores_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= CV_Profesores_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If CV_Profesores_summary.Pager.NextButton.Enabled Then %>
	<td><a href="CV_Profesoressmry.aspx?start=<%= CV_Profesores_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If CV_Profesores_summary.Pager.LastButton.Enabled Then %>
	<td><a href="CV_Profesoressmry.aspx?start=<%= CV_Profesores_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= CV_Profesores_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= CV_Profesores_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= CV_Profesores_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= CV_Profesores_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If CV_Profesores_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (CV_Profesores_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If CV_Profesores_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If CV_Profesores_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If CV_Profesores_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (CV_Profesores.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (CV_Profesores.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (CV_Profesores.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% CV_Profesores_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (CV_Profesores.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
