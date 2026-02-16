<%@ Page ClassName="NotasHistoricassmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public NotasHistoricas As crNotasHistoricas = Nothing

	'
	' Table class (for NotasHistoricas)
	'
	Public Class crNotasHistoricas
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
				Return "NotasHistoricas"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "NotasHistoricas"
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

		Public FACULTAD As crField

		Public CARRERA As crField

		Public RAMO As crField

		Public CODRAMO As crField

		Public CODALU As crField

		Public RUT As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRE As crField

		Public SEXO As crField

		Public ANOINGRESO As crField

		Public ANO_MAT As crField

		Public PER_MAT As crField

		Public NACIONALIDAD As crField

		Public NP As crField

		Public NE As crField

		Public NPR As crField

		Public NER As crField

		Public NEP As crField

		Public NERP As crField

		Public NFP As crField

		Public NF As crField

		Public ASISTENCIA As crField

		Public ESTADO As crField

		Public ANO_RAMO As crField

		Public PER_RAMO As crField

		Public PAT_PROF As crField

		Public MAT_PROF As crField

		Public NOM_PROF As crField

		Public ID As crField

		Public JORNADA As crField

		Public DURACION As crField

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

			' FACULTAD
			FACULTAD = new crField("NotasHistoricas", "NotasHistoricas", "x_FACULTAD", "FACULTAD", "[FACULTAD]", 200, EWRPT_DATATYPE_STRING, -1)
			FACULTAD.Page = APage
			FACULTAD.ParentPage = APage.ParentPage
			Fields.Add("FACULTAD", FACULTAD)
			FACULTAD.DateFilter = ""
			FACULTAD.SqlSelect = ""
			FACULTAD.SqlOrderBy = ""

			' CARRERA
			CARRERA = new crField("NotasHistoricas", "NotasHistoricas", "x_CARRERA", "CARRERA", "[CARRERA]", 200, EWRPT_DATATYPE_STRING, -1)
			CARRERA.Page = APage
			CARRERA.ParentPage = APage.ParentPage
			Fields.Add("CARRERA", CARRERA)
			CARRERA.DateFilter = ""
			CARRERA.SqlSelect = ""
			CARRERA.SqlOrderBy = ""

			' RAMO
			RAMO = new crField("NotasHistoricas", "NotasHistoricas", "x_RAMO", "RAMO", "[RAMO]", 200, EWRPT_DATATYPE_STRING, -1)
			RAMO.Page = APage
			RAMO.ParentPage = APage.ParentPage
			Fields.Add("RAMO", RAMO)
			RAMO.DateFilter = ""
			RAMO.SqlSelect = ""
			RAMO.SqlOrderBy = ""

			' CODRAMO
			CODRAMO = new crField("NotasHistoricas", "NotasHistoricas", "x_CODRAMO", "CODRAMO", "[CODRAMO]", 200, EWRPT_DATATYPE_STRING, -1)
			CODRAMO.Page = APage
			CODRAMO.ParentPage = APage.ParentPage
			Fields.Add("CODRAMO", CODRAMO)
			CODRAMO.DateFilter = ""
			CODRAMO.SqlSelect = ""
			CODRAMO.SqlOrderBy = ""

			' CODALU
			CODALU = new crField("NotasHistoricas", "NotasHistoricas", "x_CODALU", "CODALU", "[CODALU]", 200, EWRPT_DATATYPE_STRING, -1)
			CODALU.Page = APage
			CODALU.ParentPage = APage.ParentPage
			Fields.Add("CODALU", CODALU)
			CODALU.DateFilter = ""
			CODALU.SqlSelect = ""
			CODALU.SqlOrderBy = ""

			' RUT
			RUT = new crField("NotasHistoricas", "NotasHistoricas", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("NotasHistoricas", "NotasHistoricas", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("NotasHistoricas", "NotasHistoricas", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("NotasHistoricas", "NotasHistoricas", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' SEXO
			SEXO = new crField("NotasHistoricas", "NotasHistoricas", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1)
			SEXO.Page = APage
			SEXO.ParentPage = APage.ParentPage
			Fields.Add("SEXO", SEXO)
			SEXO.DateFilter = ""
			SEXO.SqlSelect = ""
			SEXO.SqlOrderBy = ""

			' ANOINGRESO
			ANOINGRESO = new crField("NotasHistoricas", "NotasHistoricas", "x_ANOINGRESO", "ANOINGRESO", "[ANOINGRESO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANOINGRESO.Page = APage
			ANOINGRESO.ParentPage = APage.ParentPage
			ANOINGRESO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANOINGRESO", ANOINGRESO)
			ANOINGRESO.DateFilter = ""
			ANOINGRESO.SqlSelect = ""
			ANOINGRESO.SqlOrderBy = ""

			' ANO_MAT
			ANO_MAT = new crField("NotasHistoricas", "NotasHistoricas", "x_ANO_MAT", "ANO_MAT", "[ANO_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO_MAT.Page = APage
			ANO_MAT.ParentPage = APage.ParentPage
			ANO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO_MAT", ANO_MAT)
			ANO_MAT.DateFilter = ""
			ANO_MAT.SqlSelect = ""
			ANO_MAT.SqlOrderBy = ""

			' PER_MAT
			PER_MAT = new crField("NotasHistoricas", "NotasHistoricas", "x_PER_MAT", "PER_MAT", "[PER_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PER_MAT.Page = APage
			PER_MAT.ParentPage = APage.ParentPage
			PER_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PER_MAT", PER_MAT)
			PER_MAT.DateFilter = ""
			PER_MAT.SqlSelect = ""
			PER_MAT.SqlOrderBy = ""

			' NACIONALIDAD
			NACIONALIDAD = new crField("NotasHistoricas", "NotasHistoricas", "x_NACIONALIDAD", "NACIONALIDAD", "[NACIONALIDAD]", 200, EWRPT_DATATYPE_STRING, -1)
			NACIONALIDAD.Page = APage
			NACIONALIDAD.ParentPage = APage.ParentPage
			Fields.Add("NACIONALIDAD", NACIONALIDAD)
			NACIONALIDAD.DateFilter = ""
			NACIONALIDAD.SqlSelect = ""
			NACIONALIDAD.SqlOrderBy = ""

			' NP
			NP = new crField("NotasHistoricas", "NotasHistoricas", "x_NP", "NP", "[NP]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NP.Page = APage
			NP.ParentPage = APage.ParentPage
			NP.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NP", NP)
			NP.DateFilter = ""
			NP.SqlSelect = ""
			NP.SqlOrderBy = ""

			' NE
			NE = new crField("NotasHistoricas", "NotasHistoricas", "x_NE", "NE", "[NE]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NE.Page = APage
			NE.ParentPage = APage.ParentPage
			NE.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NE", NE)
			NE.DateFilter = ""
			NE.SqlSelect = ""
			NE.SqlOrderBy = ""

			' NPR
			NPR = new crField("NotasHistoricas", "NotasHistoricas", "x_NPR", "NPR", "[NPR]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NPR.Page = APage
			NPR.ParentPage = APage.ParentPage
			NPR.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NPR", NPR)
			NPR.DateFilter = ""
			NPR.SqlSelect = ""
			NPR.SqlOrderBy = ""

			' NER
			NER = new crField("NotasHistoricas", "NotasHistoricas", "x_NER", "NER", "[NER]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NER.Page = APage
			NER.ParentPage = APage.ParentPage
			NER.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NER", NER)
			NER.DateFilter = ""
			NER.SqlSelect = ""
			NER.SqlOrderBy = ""

			' NEP
			NEP = new crField("NotasHistoricas", "NotasHistoricas", "x_NEP", "NEP", "[NEP]", 200, EWRPT_DATATYPE_STRING, -1)
			NEP.Page = APage
			NEP.ParentPage = APage.ParentPage
			Fields.Add("NEP", NEP)
			NEP.DateFilter = ""
			NEP.SqlSelect = ""
			NEP.SqlOrderBy = ""

			' NERP
			NERP = new crField("NotasHistoricas", "NotasHistoricas", "x_NERP", "NERP", "[NERP]", 200, EWRPT_DATATYPE_STRING, -1)
			NERP.Page = APage
			NERP.ParentPage = APage.ParentPage
			Fields.Add("NERP", NERP)
			NERP.DateFilter = ""
			NERP.SqlSelect = ""
			NERP.SqlOrderBy = ""

			' NFP
			NFP = new crField("NotasHistoricas", "NotasHistoricas", "x_NFP", "NFP", "[NFP]", 200, EWRPT_DATATYPE_STRING, -1)
			NFP.Page = APage
			NFP.ParentPage = APage.ParentPage
			Fields.Add("NFP", NFP)
			NFP.DateFilter = ""
			NFP.SqlSelect = ""
			NFP.SqlOrderBy = ""

			' NF
			NF = new crField("NotasHistoricas", "NotasHistoricas", "x_NF", "NF", "[NF]", 131, EWRPT_DATATYPE_NUMBER, -1)
			NF.Page = APage
			NF.ParentPage = APage.ParentPage
			NF.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("NF", NF)
			NF.DateFilter = ""
			NF.SqlSelect = ""
			NF.SqlOrderBy = ""

			' ASISTENCIA
			ASISTENCIA = new crField("NotasHistoricas", "NotasHistoricas", "x_ASISTENCIA", "ASISTENCIA", "[ASISTENCIA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ASISTENCIA.Page = APage
			ASISTENCIA.ParentPage = APage.ParentPage
			ASISTENCIA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ASISTENCIA", ASISTENCIA)
			ASISTENCIA.DateFilter = ""
			ASISTENCIA.SqlSelect = ""
			ASISTENCIA.SqlOrderBy = ""

			' ESTADO
			ESTADO = new crField("NotasHistoricas", "NotasHistoricas", "x_ESTADO", "ESTADO", "[ESTADO]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTADO.Page = APage
			ESTADO.ParentPage = APage.ParentPage
			Fields.Add("ESTADO", ESTADO)
			ESTADO.DateFilter = ""
			ESTADO.SqlSelect = ""
			ESTADO.SqlOrderBy = ""

			' ANO_RAMO
			ANO_RAMO = new crField("NotasHistoricas", "NotasHistoricas", "x_ANO_RAMO", "ANO_RAMO", "[ANO_RAMO]", 200, EWRPT_DATATYPE_STRING, -1)
			ANO_RAMO.Page = APage
			ANO_RAMO.ParentPage = APage.ParentPage
			Fields.Add("ANO_RAMO", ANO_RAMO)
			ANO_RAMO.DateFilter = ""
			ANO_RAMO.SqlSelect = ""
			ANO_RAMO.SqlOrderBy = ""

			' PER_RAMO
			PER_RAMO = new crField("NotasHistoricas", "NotasHistoricas", "x_PER_RAMO", "PER_RAMO", "[PER_RAMO]", 200, EWRPT_DATATYPE_STRING, -1)
			PER_RAMO.Page = APage
			PER_RAMO.ParentPage = APage.ParentPage
			Fields.Add("PER_RAMO", PER_RAMO)
			PER_RAMO.DateFilter = ""
			PER_RAMO.SqlSelect = ""
			PER_RAMO.SqlOrderBy = ""

			' PAT_PROF
			PAT_PROF = new crField("NotasHistoricas", "NotasHistoricas", "x_PAT_PROF", "PAT_PROF", "[PAT_PROF]", 200, EWRPT_DATATYPE_STRING, -1)
			PAT_PROF.Page = APage
			PAT_PROF.ParentPage = APage.ParentPage
			Fields.Add("PAT_PROF", PAT_PROF)
			PAT_PROF.DateFilter = ""
			PAT_PROF.SqlSelect = ""
			PAT_PROF.SqlOrderBy = ""

			' MAT_PROF
			MAT_PROF = new crField("NotasHistoricas", "NotasHistoricas", "x_MAT_PROF", "MAT_PROF", "[MAT_PROF]", 200, EWRPT_DATATYPE_STRING, -1)
			MAT_PROF.Page = APage
			MAT_PROF.ParentPage = APage.ParentPage
			Fields.Add("MAT_PROF", MAT_PROF)
			MAT_PROF.DateFilter = ""
			MAT_PROF.SqlSelect = ""
			MAT_PROF.SqlOrderBy = ""

			' NOM_PROF
			NOM_PROF = new crField("NotasHistoricas", "NotasHistoricas", "x_NOM_PROF", "NOM_PROF", "[NOM_PROF]", 200, EWRPT_DATATYPE_STRING, -1)
			NOM_PROF.Page = APage
			NOM_PROF.ParentPage = APage.ParentPage
			Fields.Add("NOM_PROF", NOM_PROF)
			NOM_PROF.DateFilter = ""
			NOM_PROF.SqlSelect = ""
			NOM_PROF.SqlOrderBy = ""

			' ID
			ID = new crField("NotasHistoricas", "NotasHistoricas", "x_ID", "ID", "[ID]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ID.Page = APage
			ID.ParentPage = APage.ParentPage
			ID.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ID", ID)
			ID.DateFilter = ""
			ID.SqlSelect = ""
			ID.SqlOrderBy = ""

			' JORNADA
			JORNADA = new crField("NotasHistoricas", "NotasHistoricas", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			JORNADA.Page = APage
			JORNADA.ParentPage = APage.ParentPage
			Fields.Add("JORNADA", JORNADA)
			JORNADA.DateFilter = ""
			JORNADA.SqlSelect = ""
			JORNADA.SqlOrderBy = ""

			' DURACION
			DURACION = new crField("NotasHistoricas", "NotasHistoricas", "x_DURACION", "DURACION", "[DURACION]", 200, EWRPT_DATATYPE_STRING, -1)
			DURACION.Page = APage
			DURACION.ParentPage = APage.ParentPage
			Fields.Add("DURACION", DURACION)
			DURACION.DateFilter = ""
			DURACION.SqlSelect = ""
			DURACION.SqlOrderBy = ""
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
				Return "[Vista_NotasHistoricas]"
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
	Public NotasHistoricas_summary As crNotasHistoricas_summary

	'
	' Page class
	'
	Public Class crNotasHistoricas_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (NotasHistoricas.UseTokenInUrl) Then
				sUrl &= "t=" & NotasHistoricas.TableVar & "&" ' Add page token
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
			If (NotasHistoricas.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(NotasHistoricas.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(NotasHistoricas.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As NotasHistoricassmry 
			Get
				Return CType(m_ParentPage, NotasHistoricassmry)
			End Get
		End Property

		' Table object (NotasHistoricas)
		Public Property NotasHistoricas As crNotasHistoricas 
			Get		
				Return AspNetPage.NotasHistoricas ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crNotasHistoricas)
				AspNetPage.NotasHistoricas = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "NotasHistoricas_summary"
			m_PageObjTypeName = "crNotasHistoricas_summary"

			' Table name
			m_TableName = "NotasHistoricas"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (NotasHistoricas)
			NotasHistoricas = New crNotasHistoricas(Me)			

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
				NotasHistoricas.Export = ew_Get("export")
			End If
			gsExport = NotasHistoricas.Export ' Get export parameter, used in header
			gsExportFile = NotasHistoricas.TableVar ' Get export file, used in header
			If (NotasHistoricas.Export = "excel") Then
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

		Public Val As Object() = New Object(30) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(30) {}

		Public GrandMn As Object() = New Object(30) {}

		Public GrandMx As Object() = New Object(30) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 31 ' No. of fields
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
			NotasHistoricas.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(NotasHistoricas.SqlSelect, NotasHistoricas.SqlWhere, NotasHistoricas.SqlGroupBy, NotasHistoricas.SqlHaving, NotasHistoricas.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (NotasHistoricas.ExportAll AndAlso ew_NotEmpty(NotasHistoricas.Export)) Then
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
				NotasHistoricas.FACULTAD.DbValue = Row("FACULTAD")
				NotasHistoricas.CARRERA.DbValue = Row("CARRERA")
				NotasHistoricas.RAMO.DbValue = Row("RAMO")
				NotasHistoricas.CODRAMO.DbValue = Row("CODRAMO")
				NotasHistoricas.CODALU.DbValue = Row("CODALU")
				NotasHistoricas.RUT.DbValue = Row("RUT")
				NotasHistoricas.PATERNO.DbValue = Row("PATERNO")
				NotasHistoricas.MATERNO.DbValue = Row("MATERNO")
				NotasHistoricas.NOMBRE.DbValue = Row("NOMBRE")
				NotasHistoricas.SEXO.DbValue = Row("SEXO")
				NotasHistoricas.ANOINGRESO.DbValue = Row("ANOINGRESO")
				NotasHistoricas.ANO_MAT.DbValue = Row("ANO_MAT")
				NotasHistoricas.PER_MAT.DbValue = Row("PER_MAT")
				NotasHistoricas.NACIONALIDAD.DbValue = Row("NACIONALIDAD")
				NotasHistoricas.NP.DbValue = Row("NP")
				NotasHistoricas.NE.DbValue = Row("NE")
				NotasHistoricas.NPR.DbValue = Row("NPR")
				NotasHistoricas.NER.DbValue = Row("NER")
				NotasHistoricas.NEP.DbValue = Row("NEP")
				NotasHistoricas.NERP.DbValue = Row("NERP")
				NotasHistoricas.NFP.DbValue = Row("NFP")
				NotasHistoricas.NF.DbValue = Row("NF")
				NotasHistoricas.ASISTENCIA.DbValue = Row("ASISTENCIA")
				NotasHistoricas.ESTADO.DbValue = Row("ESTADO")
				NotasHistoricas.ANO_RAMO.DbValue = Row("ANO_RAMO")
				NotasHistoricas.PER_RAMO.DbValue = Row("PER_RAMO")
				NotasHistoricas.PAT_PROF.DbValue = Row("PAT_PROF")
				NotasHistoricas.MAT_PROF.DbValue = Row("MAT_PROF")
				NotasHistoricas.NOM_PROF.DbValue = Row("NOM_PROF")
				NotasHistoricas.ID.DbValue = Row("ID")
				NotasHistoricas.JORNADA.DbValue = Row("JORNADA")
				NotasHistoricas.DURACION.DbValue = Row("DURACION")
				Val(1) = NotasHistoricas.FACULTAD.CurrentValue
				Val(2) = NotasHistoricas.CARRERA.CurrentValue
				Val(3) = NotasHistoricas.RAMO.CurrentValue
				Val(4) = NotasHistoricas.CODRAMO.CurrentValue
				Val(5) = NotasHistoricas.RUT.CurrentValue
				Val(6) = NotasHistoricas.PATERNO.CurrentValue
				Val(7) = NotasHistoricas.MATERNO.CurrentValue
				Val(8) = NotasHistoricas.NOMBRE.CurrentValue
				Val(9) = NotasHistoricas.SEXO.CurrentValue
				Val(10) = NotasHistoricas.ANOINGRESO.CurrentValue
				Val(11) = NotasHistoricas.ANO_MAT.CurrentValue
				Val(12) = NotasHistoricas.PER_MAT.CurrentValue
				Val(13) = NotasHistoricas.NACIONALIDAD.CurrentValue
				Val(14) = NotasHistoricas.NP.CurrentValue
				Val(15) = NotasHistoricas.NE.CurrentValue
				Val(16) = NotasHistoricas.NPR.CurrentValue
				Val(17) = NotasHistoricas.NER.CurrentValue
				Val(18) = NotasHistoricas.NEP.CurrentValue
				Val(19) = NotasHistoricas.NERP.CurrentValue
				Val(20) = NotasHistoricas.NFP.CurrentValue
				Val(21) = NotasHistoricas.NF.CurrentValue
				Val(22) = NotasHistoricas.ASISTENCIA.CurrentValue
				Val(23) = NotasHistoricas.ESTADO.CurrentValue
				Val(24) = NotasHistoricas.ANO_RAMO.CurrentValue
				Val(25) = NotasHistoricas.PER_RAMO.CurrentValue
				Val(26) = NotasHistoricas.PAT_PROF.CurrentValue
				Val(27) = NotasHistoricas.MAT_PROF.CurrentValue
				Val(28) = NotasHistoricas.NOM_PROF.CurrentValue
				Val(29) = NotasHistoricas.JORNADA.CurrentValue
				Val(30) = NotasHistoricas.DURACION.CurrentValue
			Else
				NotasHistoricas.FACULTAD.DbValue = ""
				NotasHistoricas.CARRERA.DbValue = ""
				NotasHistoricas.RAMO.DbValue = ""
				NotasHistoricas.CODRAMO.DbValue = ""
				NotasHistoricas.CODALU.DbValue = ""
				NotasHistoricas.RUT.DbValue = ""
				NotasHistoricas.PATERNO.DbValue = ""
				NotasHistoricas.MATERNO.DbValue = ""
				NotasHistoricas.NOMBRE.DbValue = ""
				NotasHistoricas.SEXO.DbValue = ""
				NotasHistoricas.ANOINGRESO.DbValue = ""
				NotasHistoricas.ANO_MAT.DbValue = ""
				NotasHistoricas.PER_MAT.DbValue = ""
				NotasHistoricas.NACIONALIDAD.DbValue = ""
				NotasHistoricas.NP.DbValue = ""
				NotasHistoricas.NE.DbValue = ""
				NotasHistoricas.NPR.DbValue = ""
				NotasHistoricas.NER.DbValue = ""
				NotasHistoricas.NEP.DbValue = ""
				NotasHistoricas.NERP.DbValue = ""
				NotasHistoricas.NFP.DbValue = ""
				NotasHistoricas.NF.DbValue = ""
				NotasHistoricas.ASISTENCIA.DbValue = ""
				NotasHistoricas.ESTADO.DbValue = ""
				NotasHistoricas.ANO_RAMO.DbValue = ""
				NotasHistoricas.PER_RAMO.DbValue = ""
				NotasHistoricas.PAT_PROF.DbValue = ""
				NotasHistoricas.MAT_PROF.DbValue = ""
				NotasHistoricas.NOM_PROF.DbValue = ""
				NotasHistoricas.ID.DbValue = ""
				NotasHistoricas.JORNADA.DbValue = ""
				NotasHistoricas.DURACION.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				NotasHistoricas.FACULTAD.DbValue = dr("FACULTAD")
				NotasHistoricas.CARRERA.DbValue = dr("CARRERA")
				NotasHistoricas.RAMO.DbValue = dr("RAMO")
				NotasHistoricas.CODRAMO.DbValue = dr("CODRAMO")
				NotasHistoricas.CODALU.DbValue = dr("CODALU")
				NotasHistoricas.RUT.DbValue = dr("RUT")
				NotasHistoricas.PATERNO.DbValue = dr("PATERNO")
				NotasHistoricas.MATERNO.DbValue = dr("MATERNO")
				NotasHistoricas.NOMBRE.DbValue = dr("NOMBRE")
				NotasHistoricas.SEXO.DbValue = dr("SEXO")
				NotasHistoricas.ANOINGRESO.DbValue = dr("ANOINGRESO")
				NotasHistoricas.ANO_MAT.DbValue = dr("ANO_MAT")
				NotasHistoricas.PER_MAT.DbValue = dr("PER_MAT")
				NotasHistoricas.NACIONALIDAD.DbValue = dr("NACIONALIDAD")
				NotasHistoricas.NP.DbValue = dr("NP")
				NotasHistoricas.NE.DbValue = dr("NE")
				NotasHistoricas.NPR.DbValue = dr("NPR")
				NotasHistoricas.NER.DbValue = dr("NER")
				NotasHistoricas.NEP.DbValue = dr("NEP")
				NotasHistoricas.NERP.DbValue = dr("NERP")
				NotasHistoricas.NFP.DbValue = dr("NFP")
				NotasHistoricas.NF.DbValue = dr("NF")
				NotasHistoricas.ASISTENCIA.DbValue = dr("ASISTENCIA")
				NotasHistoricas.ESTADO.DbValue = dr("ESTADO")
				NotasHistoricas.ANO_RAMO.DbValue = dr("ANO_RAMO")
				NotasHistoricas.PER_RAMO.DbValue = dr("PER_RAMO")
				NotasHistoricas.PAT_PROF.DbValue = dr("PAT_PROF")
				NotasHistoricas.MAT_PROF.DbValue = dr("MAT_PROF")
				NotasHistoricas.NOM_PROF.DbValue = dr("NOM_PROF")
				NotasHistoricas.ID.DbValue = dr("ID")
				NotasHistoricas.JORNADA.DbValue = dr("JORNADA")
				NotasHistoricas.DURACION.DbValue = dr("DURACION")
				Val(1) = NotasHistoricas.FACULTAD.CurrentValue
				Val(2) = NotasHistoricas.CARRERA.CurrentValue
				Val(3) = NotasHistoricas.RAMO.CurrentValue
				Val(4) = NotasHistoricas.CODRAMO.CurrentValue
				Val(5) = NotasHistoricas.RUT.CurrentValue
				Val(6) = NotasHistoricas.PATERNO.CurrentValue
				Val(7) = NotasHistoricas.MATERNO.CurrentValue
				Val(8) = NotasHistoricas.NOMBRE.CurrentValue
				Val(9) = NotasHistoricas.SEXO.CurrentValue
				Val(10) = NotasHistoricas.ANOINGRESO.CurrentValue
				Val(11) = NotasHistoricas.ANO_MAT.CurrentValue
				Val(12) = NotasHistoricas.PER_MAT.CurrentValue
				Val(13) = NotasHistoricas.NACIONALIDAD.CurrentValue
				Val(14) = NotasHistoricas.NP.CurrentValue
				Val(15) = NotasHistoricas.NE.CurrentValue
				Val(16) = NotasHistoricas.NPR.CurrentValue
				Val(17) = NotasHistoricas.NER.CurrentValue
				Val(18) = NotasHistoricas.NEP.CurrentValue
				Val(19) = NotasHistoricas.NERP.CurrentValue
				Val(20) = NotasHistoricas.NFP.CurrentValue
				Val(21) = NotasHistoricas.NF.CurrentValue
				Val(22) = NotasHistoricas.ASISTENCIA.CurrentValue
				Val(23) = NotasHistoricas.ESTADO.CurrentValue
				Val(24) = NotasHistoricas.ANO_RAMO.CurrentValue
				Val(25) = NotasHistoricas.PER_RAMO.CurrentValue
				Val(26) = NotasHistoricas.PAT_PROF.CurrentValue
				Val(27) = NotasHistoricas.MAT_PROF.CurrentValue
				Val(28) = NotasHistoricas.NOM_PROF.CurrentValue
				Val(29) = NotasHistoricas.JORNADA.CurrentValue
				Val(30) = NotasHistoricas.DURACION.CurrentValue
			Else				
				NotasHistoricas.FACULTAD.DbValue = ""
				NotasHistoricas.CARRERA.DbValue = ""
				NotasHistoricas.RAMO.DbValue = ""
				NotasHistoricas.CODRAMO.DbValue = ""
				NotasHistoricas.CODALU.DbValue = ""
				NotasHistoricas.RUT.DbValue = ""
				NotasHistoricas.PATERNO.DbValue = ""
				NotasHistoricas.MATERNO.DbValue = ""
				NotasHistoricas.NOMBRE.DbValue = ""
				NotasHistoricas.SEXO.DbValue = ""
				NotasHistoricas.ANOINGRESO.DbValue = ""
				NotasHistoricas.ANO_MAT.DbValue = ""
				NotasHistoricas.PER_MAT.DbValue = ""
				NotasHistoricas.NACIONALIDAD.DbValue = ""
				NotasHistoricas.NP.DbValue = ""
				NotasHistoricas.NE.DbValue = ""
				NotasHistoricas.NPR.DbValue = ""
				NotasHistoricas.NER.DbValue = ""
				NotasHistoricas.NEP.DbValue = ""
				NotasHistoricas.NERP.DbValue = ""
				NotasHistoricas.NFP.DbValue = ""
				NotasHistoricas.NF.DbValue = ""
				NotasHistoricas.ASISTENCIA.DbValue = ""
				NotasHistoricas.ESTADO.DbValue = ""
				NotasHistoricas.ANO_RAMO.DbValue = ""
				NotasHistoricas.PER_RAMO.DbValue = ""
				NotasHistoricas.PAT_PROF.DbValue = ""
				NotasHistoricas.MAT_PROF.DbValue = ""
				NotasHistoricas.NOM_PROF.DbValue = ""
				NotasHistoricas.ID.DbValue = ""
				NotasHistoricas.JORNADA.DbValue = ""
				NotasHistoricas.DURACION.DbValue = ""
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
				NotasHistoricas.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					NotasHistoricas.StartGroup = StartGrp
				Else
					StartGrp = NotasHistoricas.StartGroup
				End If
			Else
				StartGrp = NotasHistoricas.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				NotasHistoricas.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				NotasHistoricas.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				NotasHistoricas.StartGroup = StartGrp
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
			NotasHistoricas.StartGroup = StartGrp
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
				NotasHistoricas.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				NotasHistoricas.StartGroup = StartGrp
			Else				
				If (NotasHistoricas.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(NotasHistoricas.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 15 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (NotasHistoricas.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(NotasHistoricas.SqlSelectCount, NotasHistoricas.SqlWhere, NotasHistoricas.SqlGroupBy, NotasHistoricas.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			NotasHistoricas.Row_Rendering()

			'
			' Render view codes
			'

			If (NotasHistoricas.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' FACULTAD
				NotasHistoricas.FACULTAD.ViewValue = Convert.ToString(NotasHistoricas.FACULTAD.Summary)

				' CARRERA
				NotasHistoricas.CARRERA.ViewValue = Convert.ToString(NotasHistoricas.CARRERA.Summary)

				' RAMO
				NotasHistoricas.RAMO.ViewValue = Convert.ToString(NotasHistoricas.RAMO.Summary)

				' CODRAMO
				NotasHistoricas.CODRAMO.ViewValue = Convert.ToString(NotasHistoricas.CODRAMO.Summary)

				' RUT
				NotasHistoricas.RUT.ViewValue = Convert.ToString(NotasHistoricas.RUT.Summary)

				' PATERNO
				NotasHistoricas.PATERNO.ViewValue = Convert.ToString(NotasHistoricas.PATERNO.Summary)

				' MATERNO
				NotasHistoricas.MATERNO.ViewValue = Convert.ToString(NotasHistoricas.MATERNO.Summary)

				' NOMBRE
				NotasHistoricas.NOMBRE.ViewValue = Convert.ToString(NotasHistoricas.NOMBRE.Summary)

				' SEXO
				NotasHistoricas.SEXO.ViewValue = Convert.ToString(NotasHistoricas.SEXO.Summary)

				' ANOINGRESO
				NotasHistoricas.ANOINGRESO.ViewValue = Convert.ToString(NotasHistoricas.ANOINGRESO.Summary)

				' ANO_MAT
				NotasHistoricas.ANO_MAT.ViewValue = Convert.ToString(NotasHistoricas.ANO_MAT.Summary)

				' PER_MAT
				NotasHistoricas.PER_MAT.ViewValue = Convert.ToString(NotasHistoricas.PER_MAT.Summary)

				' NACIONALIDAD
				NotasHistoricas.NACIONALIDAD.ViewValue = Convert.ToString(NotasHistoricas.NACIONALIDAD.Summary)

				' NP
				NotasHistoricas.NP.ViewValue = Convert.ToString(NotasHistoricas.NP.Summary)

				' NE
				NotasHistoricas.NE.ViewValue = Convert.ToString(NotasHistoricas.NE.Summary)

				' NPR
				NotasHistoricas.NPR.ViewValue = Convert.ToString(NotasHistoricas.NPR.Summary)

				' NER
				NotasHistoricas.NER.ViewValue = Convert.ToString(NotasHistoricas.NER.Summary)

				' NEP
				NotasHistoricas.NEP.ViewValue = Convert.ToString(NotasHistoricas.NEP.Summary)

				' NERP
				NotasHistoricas.NERP.ViewValue = Convert.ToString(NotasHistoricas.NERP.Summary)

				' NFP
				NotasHistoricas.NFP.ViewValue = Convert.ToString(NotasHistoricas.NFP.Summary)

				' NF
				NotasHistoricas.NF.ViewValue = Convert.ToString(NotasHistoricas.NF.Summary)

				' ASISTENCIA
				NotasHistoricas.ASISTENCIA.ViewValue = Convert.ToString(NotasHistoricas.ASISTENCIA.Summary)

				' ESTADO
				NotasHistoricas.ESTADO.ViewValue = Convert.ToString(NotasHistoricas.ESTADO.Summary)

				' ANO_RAMO
				NotasHistoricas.ANO_RAMO.ViewValue = Convert.ToString(NotasHistoricas.ANO_RAMO.Summary)

				' PER_RAMO
				NotasHistoricas.PER_RAMO.ViewValue = Convert.ToString(NotasHistoricas.PER_RAMO.Summary)

				' PAT_PROF
				NotasHistoricas.PAT_PROF.ViewValue = Convert.ToString(NotasHistoricas.PAT_PROF.Summary)

				' MAT_PROF
				NotasHistoricas.MAT_PROF.ViewValue = Convert.ToString(NotasHistoricas.MAT_PROF.Summary)

				' NOM_PROF
				NotasHistoricas.NOM_PROF.ViewValue = Convert.ToString(NotasHistoricas.NOM_PROF.Summary)

				' JORNADA
				NotasHistoricas.JORNADA.ViewValue = Convert.ToString(NotasHistoricas.JORNADA.Summary)

				' DURACION
				NotasHistoricas.DURACION.ViewValue = Convert.ToString(NotasHistoricas.DURACION.Summary)
			Else

				' FACULTAD
				NotasHistoricas.FACULTAD.ViewValue = Convert.ToString(NotasHistoricas.FACULTAD.CurrentValue)
				NotasHistoricas.FACULTAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CARRERA
				NotasHistoricas.CARRERA.ViewValue = Convert.ToString(NotasHistoricas.CARRERA.CurrentValue)
				NotasHistoricas.CARRERA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RAMO
				NotasHistoricas.RAMO.ViewValue = Convert.ToString(NotasHistoricas.RAMO.CurrentValue)
				NotasHistoricas.RAMO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODRAMO
				NotasHistoricas.CODRAMO.ViewValue = Convert.ToString(NotasHistoricas.CODRAMO.CurrentValue)
				NotasHistoricas.CODRAMO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				NotasHistoricas.RUT.ViewValue = Convert.ToString(NotasHistoricas.RUT.CurrentValue)
				NotasHistoricas.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				NotasHistoricas.PATERNO.ViewValue = Convert.ToString(NotasHistoricas.PATERNO.CurrentValue)
				NotasHistoricas.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				NotasHistoricas.MATERNO.ViewValue = Convert.ToString(NotasHistoricas.MATERNO.CurrentValue)
				NotasHistoricas.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				NotasHistoricas.NOMBRE.ViewValue = Convert.ToString(NotasHistoricas.NOMBRE.CurrentValue)
				NotasHistoricas.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SEXO
				NotasHistoricas.SEXO.ViewValue = Convert.ToString(NotasHistoricas.SEXO.CurrentValue)
				NotasHistoricas.SEXO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANOINGRESO
				NotasHistoricas.ANOINGRESO.ViewValue = Convert.ToString(NotasHistoricas.ANOINGRESO.CurrentValue)
				NotasHistoricas.ANOINGRESO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO_MAT
				NotasHistoricas.ANO_MAT.ViewValue = Convert.ToString(NotasHistoricas.ANO_MAT.CurrentValue)
				NotasHistoricas.ANO_MAT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PER_MAT
				NotasHistoricas.PER_MAT.ViewValue = Convert.ToString(NotasHistoricas.PER_MAT.CurrentValue)
				NotasHistoricas.PER_MAT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NACIONALIDAD
				NotasHistoricas.NACIONALIDAD.ViewValue = Convert.ToString(NotasHistoricas.NACIONALIDAD.CurrentValue)
				NotasHistoricas.NACIONALIDAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NP
				NotasHistoricas.NP.ViewValue = Convert.ToString(NotasHistoricas.NP.CurrentValue)
				NotasHistoricas.NP.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NE
				NotasHistoricas.NE.ViewValue = Convert.ToString(NotasHistoricas.NE.CurrentValue)
				NotasHistoricas.NE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NPR
				NotasHistoricas.NPR.ViewValue = Convert.ToString(NotasHistoricas.NPR.CurrentValue)
				NotasHistoricas.NPR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NER
				NotasHistoricas.NER.ViewValue = Convert.ToString(NotasHistoricas.NER.CurrentValue)
				NotasHistoricas.NER.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NEP
				NotasHistoricas.NEP.ViewValue = Convert.ToString(NotasHistoricas.NEP.CurrentValue)
				NotasHistoricas.NEP.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NERP
				NotasHistoricas.NERP.ViewValue = Convert.ToString(NotasHistoricas.NERP.CurrentValue)
				NotasHistoricas.NERP.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NFP
				NotasHistoricas.NFP.ViewValue = Convert.ToString(NotasHistoricas.NFP.CurrentValue)
				NotasHistoricas.NFP.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NF
				NotasHistoricas.NF.ViewValue = Convert.ToString(NotasHistoricas.NF.CurrentValue)
				NotasHistoricas.NF.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ASISTENCIA
				NotasHistoricas.ASISTENCIA.ViewValue = Convert.ToString(NotasHistoricas.ASISTENCIA.CurrentValue)
				NotasHistoricas.ASISTENCIA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTADO
				NotasHistoricas.ESTADO.ViewValue = Convert.ToString(NotasHistoricas.ESTADO.CurrentValue)
				NotasHistoricas.ESTADO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO_RAMO
				NotasHistoricas.ANO_RAMO.ViewValue = Convert.ToString(NotasHistoricas.ANO_RAMO.CurrentValue)
				NotasHistoricas.ANO_RAMO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PER_RAMO
				NotasHistoricas.PER_RAMO.ViewValue = Convert.ToString(NotasHistoricas.PER_RAMO.CurrentValue)
				NotasHistoricas.PER_RAMO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PAT_PROF
				NotasHistoricas.PAT_PROF.ViewValue = Convert.ToString(NotasHistoricas.PAT_PROF.CurrentValue)
				NotasHistoricas.PAT_PROF.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MAT_PROF
				NotasHistoricas.MAT_PROF.ViewValue = Convert.ToString(NotasHistoricas.MAT_PROF.CurrentValue)
				NotasHistoricas.MAT_PROF.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOM_PROF
				NotasHistoricas.NOM_PROF.ViewValue = Convert.ToString(NotasHistoricas.NOM_PROF.CurrentValue)
				NotasHistoricas.NOM_PROF.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' JORNADA
				NotasHistoricas.JORNADA.ViewValue = Convert.ToString(NotasHistoricas.JORNADA.CurrentValue)
				NotasHistoricas.JORNADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DURACION
				NotasHistoricas.DURACION.ViewValue = Convert.ToString(NotasHistoricas.DURACION.CurrentValue)
				NotasHistoricas.DURACION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' FACULTAD
			NotasHistoricas.FACULTAD.HrefValue = ""

			' CARRERA
			NotasHistoricas.CARRERA.HrefValue = ""

			' RAMO
			NotasHistoricas.RAMO.HrefValue = ""

			' CODRAMO
			NotasHistoricas.CODRAMO.HrefValue = ""

			' RUT
			NotasHistoricas.RUT.HrefValue = ""

			' PATERNO
			NotasHistoricas.PATERNO.HrefValue = ""

			' MATERNO
			NotasHistoricas.MATERNO.HrefValue = ""

			' NOMBRE
			NotasHistoricas.NOMBRE.HrefValue = ""

			' SEXO
			NotasHistoricas.SEXO.HrefValue = ""

			' ANOINGRESO
			NotasHistoricas.ANOINGRESO.HrefValue = ""

			' ANO_MAT
			NotasHistoricas.ANO_MAT.HrefValue = ""

			' PER_MAT
			NotasHistoricas.PER_MAT.HrefValue = ""

			' NACIONALIDAD
			NotasHistoricas.NACIONALIDAD.HrefValue = ""

			' NP
			NotasHistoricas.NP.HrefValue = ""

			' NE
			NotasHistoricas.NE.HrefValue = ""

			' NPR
			NotasHistoricas.NPR.HrefValue = ""

			' NER
			NotasHistoricas.NER.HrefValue = ""

			' NEP
			NotasHistoricas.NEP.HrefValue = ""

			' NERP
			NotasHistoricas.NERP.HrefValue = ""

			' NFP
			NotasHistoricas.NFP.HrefValue = ""

			' NF
			NotasHistoricas.NF.HrefValue = ""

			' ASISTENCIA
			NotasHistoricas.ASISTENCIA.HrefValue = ""

			' ESTADO
			NotasHistoricas.ESTADO.HrefValue = ""

			' ANO_RAMO
			NotasHistoricas.ANO_RAMO.HrefValue = ""

			' PER_RAMO
			NotasHistoricas.PER_RAMO.HrefValue = ""

			' PAT_PROF
			NotasHistoricas.PAT_PROF.HrefValue = ""

			' MAT_PROF
			NotasHistoricas.MAT_PROF.HrefValue = ""

			' NOM_PROF
			NotasHistoricas.NOM_PROF.HrefValue = ""

			' JORNADA
			NotasHistoricas.JORNADA.HrefValue = ""

			' DURACION
			NotasHistoricas.DURACION.HrefValue = ""

			' Call Row_Rendered event
			NotasHistoricas.Row_Rendered()
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

			' Field FACULTAD
			sSelect = "SELECT DISTINCT [FACULTAD] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[FACULTAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.FACULTAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CARRERA
			sSelect = "SELECT DISTINCT [CARRERA] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[CARRERA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.CARRERA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field RAMO
			sSelect = "SELECT DISTINCT [RAMO] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[RAMO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.RAMO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANOINGRESO
			sSelect = "SELECT DISTINCT [ANOINGRESO] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[ANOINGRESO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.ANOINGRESO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO_MAT
			sSelect = "SELECT DISTINCT [ANO_MAT] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[ANO_MAT] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.ANO_MAT.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PER_MAT
			sSelect = "SELECT DISTINCT [PER_MAT] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[PER_MAT] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.PER_MAT.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTADO
			sSelect = "SELECT DISTINCT [ESTADO] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[ESTADO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.ESTADO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO_RAMO
			sSelect = "SELECT DISTINCT [ANO_RAMO] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[ANO_RAMO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.ANO_RAMO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PER_RAMO
			sSelect = "SELECT DISTINCT [PER_RAMO] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[PER_RAMO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.PER_RAMO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field JORNADA
			sSelect = "SELECT DISTINCT [JORNADA] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[JORNADA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.JORNADA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field DURACION
			sSelect = "SELECT DISTINCT [DURACION] FROM " + NotasHistoricas.SqlFrom
			sOrderBy = "[DURACION] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, NotasHistoricas.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			NotasHistoricas.DURACION.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field FACULTAD
				SetSessionDropDownValue(NotasHistoricas.FACULTAD.DropDownValue, NotasHistoricas.FACULTAD)

				' Field CARRERA
				SetSessionDropDownValue(NotasHistoricas.CARRERA.DropDownValue, NotasHistoricas.CARRERA)

				' Field RAMO
				SetSessionDropDownValue(NotasHistoricas.RAMO.DropDownValue, NotasHistoricas.RAMO)

				' Field RUT
				SetSessionFilterValues(NotasHistoricas.RUT)

				' Field ANOINGRESO
				SetSessionDropDownValue(NotasHistoricas.ANOINGRESO.DropDownValue, NotasHistoricas.ANOINGRESO)

				' Field ANO_MAT
				SetSessionDropDownValue(NotasHistoricas.ANO_MAT.DropDownValue, NotasHistoricas.ANO_MAT)

				' Field PER_MAT
				SetSessionDropDownValue(NotasHistoricas.PER_MAT.DropDownValue, NotasHistoricas.PER_MAT)

				' Field NP
				SetSessionFilterValues(NotasHistoricas.NP)

				' Field ASISTENCIA
				SetSessionFilterValues(NotasHistoricas.ASISTENCIA)

				' Field ESTADO
				SetSessionDropDownValue(NotasHistoricas.ESTADO.DropDownValue, NotasHistoricas.ESTADO)

				' Field ANO_RAMO
				SetSessionDropDownValue(NotasHistoricas.ANO_RAMO.DropDownValue, NotasHistoricas.ANO_RAMO)

				' Field PER_RAMO
				SetSessionDropDownValue(NotasHistoricas.PER_RAMO.DropDownValue, NotasHistoricas.PER_RAMO)

				' Field JORNADA
				SetSessionDropDownValue(NotasHistoricas.JORNADA.DropDownValue, NotasHistoricas.JORNADA)

				' Field DURACION
				SetSessionDropDownValue(NotasHistoricas.DURACION.DropDownValue, NotasHistoricas.DURACION)
			bSetupFilter = True ' Set up filter required
		Else

				' Field FACULTAD
				If (GetDropDownValue(NotasHistoricas.FACULTAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.FACULTAD.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.FACULTAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_FACULTAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CARRERA
				If (GetDropDownValue(NotasHistoricas.CARRERA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.CARRERA.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.CARRERA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_CARRERA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field RAMO
				If (GetDropDownValue(NotasHistoricas.RAMO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.RAMO.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.RAMO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_RAMO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field RUT
				If (GetFilterValues(NotasHistoricas.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ANOINGRESO
				If (GetDropDownValue(NotasHistoricas.ANOINGRESO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.ANOINGRESO.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.ANOINGRESO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_ANOINGRESO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO_MAT
				If (GetDropDownValue(NotasHistoricas.ANO_MAT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.ANO_MAT.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.ANO_MAT.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_ANO_MAT") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PER_MAT
				If (GetDropDownValue(NotasHistoricas.PER_MAT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.PER_MAT.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.PER_MAT.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_PER_MAT") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field NP
				If (GetFilterValues(NotasHistoricas.NP)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ASISTENCIA
				If (GetFilterValues(NotasHistoricas.ASISTENCIA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ESTADO
				If (GetDropDownValue(NotasHistoricas.ESTADO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.ESTADO.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.ESTADO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_ESTADO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO_RAMO
				If (GetDropDownValue(NotasHistoricas.ANO_RAMO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.ANO_RAMO.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.ANO_RAMO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_ANO_RAMO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PER_RAMO
				If (GetDropDownValue(NotasHistoricas.PER_RAMO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.PER_RAMO.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.PER_RAMO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_PER_RAMO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field JORNADA
				If (GetDropDownValue(NotasHistoricas.JORNADA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.JORNADA.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.JORNADA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_JORNADA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field DURACION
				If (GetDropDownValue(NotasHistoricas.DURACION)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(NotasHistoricas.DURACION.DropDownValue) Then
					If Not ew_SameStr(NotasHistoricas.DURACION.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_NotasHistoricas_DURACION") Is Nothing Then
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

			' Field FACULTAD
			GetSessionDropDownValue(NotasHistoricas.FACULTAD)

			' Field CARRERA
			GetSessionDropDownValue(NotasHistoricas.CARRERA)

			' Field RAMO
			GetSessionDropDownValue(NotasHistoricas.RAMO)

			' Field RUT
			GetSessionFilterValues(NotasHistoricas.RUT)

			' Field ANOINGRESO
			GetSessionDropDownValue(NotasHistoricas.ANOINGRESO)

			' Field ANO_MAT
			GetSessionDropDownValue(NotasHistoricas.ANO_MAT)

			' Field PER_MAT
			GetSessionDropDownValue(NotasHistoricas.PER_MAT)

			' Field NP
			GetSessionFilterValues(NotasHistoricas.NP)

			' Field ASISTENCIA
			GetSessionFilterValues(NotasHistoricas.ASISTENCIA)

			' Field ESTADO
			GetSessionDropDownValue(NotasHistoricas.ESTADO)

			' Field ANO_RAMO
			GetSessionDropDownValue(NotasHistoricas.ANO_RAMO)

			' Field PER_RAMO
			GetSessionDropDownValue(NotasHistoricas.PER_RAMO)

			' Field JORNADA
			GetSessionDropDownValue(NotasHistoricas.JORNADA)

			' Field DURACION
			GetSessionDropDownValue(NotasHistoricas.DURACION)
		End If

		' Call page filter validated event
		NotasHistoricas.Page_FilterValidated()

		' Build SQL
		' Field FACULTAD

		BuildDropDownFilter(NotasHistoricas.FACULTAD, sFilter, "")

		' Field CARRERA
		BuildDropDownFilter(NotasHistoricas.CARRERA, sFilter, "")

		' Field RAMO
		BuildDropDownFilter(NotasHistoricas.RAMO, sFilter, "")

		' Field RUT
		BuildExtendedFilter(NotasHistoricas.RUT, sFilter)

		' Field ANOINGRESO
		BuildDropDownFilter(NotasHistoricas.ANOINGRESO, sFilter, "")

		' Field ANO_MAT
		BuildDropDownFilter(NotasHistoricas.ANO_MAT, sFilter, "")

		' Field PER_MAT
		BuildDropDownFilter(NotasHistoricas.PER_MAT, sFilter, "")

		' Field NP
		BuildExtendedFilter(NotasHistoricas.NP, sFilter)

		' Field ASISTENCIA
		BuildExtendedFilter(NotasHistoricas.ASISTENCIA, sFilter)

		' Field ESTADO
		BuildDropDownFilter(NotasHistoricas.ESTADO, sFilter, "")

		' Field ANO_RAMO
		BuildDropDownFilter(NotasHistoricas.ANO_RAMO, sFilter, "")

		' Field PER_RAMO
		BuildDropDownFilter(NotasHistoricas.PER_RAMO, sFilter, "")

		' Field JORNADA
		BuildDropDownFilter(NotasHistoricas.JORNADA, sFilter, "")

		' Field DURACION
		BuildDropDownFilter(NotasHistoricas.DURACION, sFilter, "")

		' Save parms to Session
		' Field FACULTAD

		SetSessionDropDownValue(NotasHistoricas.FACULTAD.DropDownValue, NotasHistoricas.FACULTAD)

		' Field CARRERA
		SetSessionDropDownValue(NotasHistoricas.CARRERA.DropDownValue, NotasHistoricas.CARRERA)

		' Field RAMO
		SetSessionDropDownValue(NotasHistoricas.RAMO.DropDownValue, NotasHistoricas.RAMO)

		' Field RUT
		SetSessionFilterValues(NotasHistoricas.RUT)

		' Field ANOINGRESO
		SetSessionDropDownValue(NotasHistoricas.ANOINGRESO.DropDownValue, NotasHistoricas.ANOINGRESO)

		' Field ANO_MAT
		SetSessionDropDownValue(NotasHistoricas.ANO_MAT.DropDownValue, NotasHistoricas.ANO_MAT)

		' Field PER_MAT
		SetSessionDropDownValue(NotasHistoricas.PER_MAT.DropDownValue, NotasHistoricas.PER_MAT)

		' Field NP
		SetSessionFilterValues(NotasHistoricas.NP)

		' Field ASISTENCIA
		SetSessionFilterValues(NotasHistoricas.ASISTENCIA)

		' Field ESTADO
		SetSessionDropDownValue(NotasHistoricas.ESTADO.DropDownValue, NotasHistoricas.ESTADO)

		' Field ANO_RAMO
		SetSessionDropDownValue(NotasHistoricas.ANO_RAMO.DropDownValue, NotasHistoricas.ANO_RAMO)

		' Field PER_RAMO
		SetSessionDropDownValue(NotasHistoricas.PER_RAMO.DropDownValue, NotasHistoricas.PER_RAMO)

		' Field JORNADA
		SetSessionDropDownValue(NotasHistoricas.JORNADA.DropDownValue, NotasHistoricas.JORNADA)

		' Field DURACION
		SetSessionDropDownValue(NotasHistoricas.DURACION.DropDownValue, NotasHistoricas.DURACION)

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
		If ew_Session("sv_NotasHistoricas_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_NotasHistoricas_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_NotasHistoricas_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_NotasHistoricas_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_NotasHistoricas_" + parm)
		End If
		If ew_Session("so1_NotasHistoricas_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_NotasHistoricas_" + parm))
		End If
		If ew_Session("sc_NotasHistoricas_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_NotasHistoricas_" + parm))
		End If
		If ew_Session("sv2_NotasHistoricas_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_NotasHistoricas_" + parm)
		End If
		If ew_Session("so2_NotasHistoricas_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_NotasHistoricas_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_NotasHistoricas_" + parm) = fld.SearchValue
		ew_Session("so1_NotasHistoricas_" + parm) = fld.SearchOperator
		ew_Session("sc_NotasHistoricas_" + parm) = fld.SearchCondition
		ew_Session("sv2_NotasHistoricas_" + parm) = fld.SearchValue2
		ew_Session("so2_NotasHistoricas_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_NotasHistoricas_" + parm) = ""
		ew_Session("so1_NotasHistoricas_" + parm) = "="
		ew_Session("sc_NotasHistoricas_" + parm) = "AND"
		ew_Session("sv2_NotasHistoricas_" + parm) = ""
		ew_Session("so2_NotasHistoricas_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(NotasHistoricas.NP.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= NotasHistoricas.NP.FldErrMsg()
		End If
		If Not ewrpt_CheckNumber(Convert.ToString(NotasHistoricas.ASISTENCIA.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= NotasHistoricas.ASISTENCIA.FldErrMsg()
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
		ew_Session("sel_NotasHistoricas_" & parm) = ""
		ew_Session("rf_NotasHistoricas_" & parm) = ""
		ew_Session("rt_NotasHistoricas_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = NotasHistoricas.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_NotasHistoricas_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_NotasHistoricas_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_NotasHistoricas_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field FACULTAD

			NotasHistoricas.FACULTAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.FACULTAD.DropDownValue = NotasHistoricas.FACULTAD.DefaultDropDownValue

			' Field CARRERA
			NotasHistoricas.CARRERA.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.CARRERA.DropDownValue = NotasHistoricas.CARRERA.DefaultDropDownValue

			' Field RAMO
			NotasHistoricas.RAMO.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.RAMO.DropDownValue = NotasHistoricas.RAMO.DefaultDropDownValue

			' Field ANOINGRESO
			NotasHistoricas.ANOINGRESO.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.ANOINGRESO.DropDownValue = NotasHistoricas.ANOINGRESO.DefaultDropDownValue

			' Field ANO_MAT
			NotasHistoricas.ANO_MAT.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.ANO_MAT.DropDownValue = NotasHistoricas.ANO_MAT.DefaultDropDownValue

			' Field PER_MAT
			NotasHistoricas.PER_MAT.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.PER_MAT.DropDownValue = NotasHistoricas.PER_MAT.DefaultDropDownValue

			' Field ESTADO
			NotasHistoricas.ESTADO.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.ESTADO.DropDownValue = NotasHistoricas.ESTADO.DefaultDropDownValue

			' Field ANO_RAMO
			NotasHistoricas.ANO_RAMO.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.ANO_RAMO.DropDownValue = NotasHistoricas.ANO_RAMO.DefaultDropDownValue

			' Field PER_RAMO
			NotasHistoricas.PER_RAMO.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.PER_RAMO.DropDownValue = NotasHistoricas.PER_RAMO.DefaultDropDownValue

			' Field JORNADA
			NotasHistoricas.JORNADA.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.JORNADA.DropDownValue = NotasHistoricas.JORNADA.DefaultDropDownValue

			' Field DURACION
			NotasHistoricas.DURACION.DefaultDropDownValue = EWRPT_INIT_VALUE
			NotasHistoricas.DURACION.DropDownValue = NotasHistoricas.DURACION.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(NotasHistoricas.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(NotasHistoricas.RUT)	

			' Field NP
			SetDefaultExtFilter(NotasHistoricas.NP, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(NotasHistoricas.NP)	

			' Field ASISTENCIA
			SetDefaultExtFilter(NotasHistoricas.ASISTENCIA, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(NotasHistoricas.ASISTENCIA)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check FACULTAD dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.FACULTAD)) Then bFilterExist = True

		' Check CARRERA dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.CARRERA)) Then bFilterExist = True

		' Check RAMO dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.RAMO)) Then bFilterExist = True

		' Check RUT extended filter
		If (TextFilterApplied(NotasHistoricas.RUT)) Then bFilterExist = True

		' Check ANOINGRESO dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.ANOINGRESO)) Then bFilterExist = True

		' Check ANO_MAT dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.ANO_MAT)) Then bFilterExist = True

		' Check PER_MAT dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.PER_MAT)) Then bFilterExist = True

		' Check NP extended filter
		If (TextFilterApplied(NotasHistoricas.NP)) Then bFilterExist = True

		' Check ASISTENCIA extended filter
		If (TextFilterApplied(NotasHistoricas.ASISTENCIA)) Then bFilterExist = True

		' Check ESTADO dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.ESTADO)) Then bFilterExist = True

		' Check ANO_RAMO dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.ANO_RAMO)) Then bFilterExist = True

		' Check PER_RAMO dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.PER_RAMO)) Then bFilterExist = True

		' Check JORNADA dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.JORNADA)) Then bFilterExist = True

		' Check DURACION dropdown filter
		If (NonTextFilterApplied(NotasHistoricas.DURACION)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field FACULTAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.FACULTAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.FACULTAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CARRERA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.CARRERA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.CARRERA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RAMO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.RAMO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.RAMO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(NotasHistoricas.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANOINGRESO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.ANOINGRESO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.ANOINGRESO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO_MAT
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.ANO_MAT, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.ANO_MAT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PER_MAT
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.PER_MAT, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.PER_MAT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NP
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(NotasHistoricas.NP, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.NP.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ASISTENCIA
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(NotasHistoricas.ASISTENCIA, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.ASISTENCIA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTADO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.ESTADO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.ESTADO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO_RAMO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.ANO_RAMO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.ANO_RAMO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PER_RAMO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.PER_RAMO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.PER_RAMO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field JORNADA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.JORNADA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.JORNADA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field DURACION
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(NotasHistoricas.DURACION, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= NotasHistoricas.DURACION.FldCaption() & "<br>"
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
				NotasHistoricas.OrderBy = ""
				NotasHistoricas.StartGroup = 1
				NotasHistoricas.FACULTAD.Sort = ""
				NotasHistoricas.CARRERA.Sort = ""
				NotasHistoricas.RAMO.Sort = ""
				NotasHistoricas.CODRAMO.Sort = ""
				NotasHistoricas.RUT.Sort = ""
				NotasHistoricas.PATERNO.Sort = ""
				NotasHistoricas.MATERNO.Sort = ""
				NotasHistoricas.NOMBRE.Sort = ""
				NotasHistoricas.SEXO.Sort = ""
				NotasHistoricas.ANOINGRESO.Sort = ""
				NotasHistoricas.ANO_MAT.Sort = ""
				NotasHistoricas.PER_MAT.Sort = ""
				NotasHistoricas.NACIONALIDAD.Sort = ""
				NotasHistoricas.NP.Sort = ""
				NotasHistoricas.NE.Sort = ""
				NotasHistoricas.NPR.Sort = ""
				NotasHistoricas.NER.Sort = ""
				NotasHistoricas.NEP.Sort = ""
				NotasHistoricas.NERP.Sort = ""
				NotasHistoricas.NFP.Sort = ""
				NotasHistoricas.NF.Sort = ""
				NotasHistoricas.ASISTENCIA.Sort = ""
				NotasHistoricas.ESTADO.Sort = ""
				NotasHistoricas.ANO_RAMO.Sort = ""
				NotasHistoricas.PER_RAMO.Sort = ""
				NotasHistoricas.PAT_PROF.Sort = ""
				NotasHistoricas.MAT_PROF.Sort = ""
				NotasHistoricas.NOM_PROF.Sort = ""
				NotasHistoricas.JORNADA.Sort = ""
				NotasHistoricas.DURACION.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			NotasHistoricas.CurrentOrder = ew_Get("order")
			NotasHistoricas.CurrentOrderType = ew_Get("ordertype")
			sSortSql = NotasHistoricas.SortSql()
			NotasHistoricas.OrderBy = sSortSql
			NotasHistoricas.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(NotasHistoricas.OrderBy)) Then
			NotasHistoricas.OrderBy = "[CARRERA] ASC, [RAMO] ASC, [PATERNO] ASC, [MATERNO] ASC"
			NotasHistoricas.CARRERA.Sort = "ASC"
			NotasHistoricas.RAMO.Sort = "ASC"
			NotasHistoricas.PATERNO.Sort = "ASC"
			NotasHistoricas.MATERNO.Sort = "ASC"
		End If
		Return NotasHistoricas.OrderBy
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
		NotasHistoricas_summary = New crNotasHistoricas_summary(Me)
		NotasHistoricas_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		NotasHistoricas_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (NotasHistoricas_summary IsNot Nothing) Then NotasHistoricas_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (NotasHistoricas.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var NotasHistoricas_summary = new ewrpt_Page("NotasHistoricas_summary");
// page properties
NotasHistoricas_summary.PageID = "summary"; // page ID
NotasHistoricas_summary.FormID = "fNotasHistoricassummaryfilter"; // form ID
var EWRPT_PAGE_ID = NotasHistoricas_summary.PageID;
// extend page with ValidateForm function
NotasHistoricas_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_NP;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(NotasHistoricas.NP.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_ASISTENCIA;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(NotasHistoricas.ASISTENCIA.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
NotasHistoricas_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
NotasHistoricas_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
NotasHistoricas_summary.ValidateRequired = false; // no JavaScript validation
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
<% NotasHistoricas_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (NotasHistoricas.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (NotasHistoricas.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="ewTitle"><h1><%= NotasHistoricas.TableCaption() %></h1>
<% If (NotasHistoricas.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= NotasHistoricas_summary.ExportExcelUrl %>"><img src="images/excel.png" /></a>
<% If (NotasHistoricas_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="NotasHistoricassmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% NotasHistoricas_summary.ShowMessage() %>
<% If (NotasHistoricas.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (NotasHistoricas.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (NotasHistoricas.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (NotasHistoricas.FilterPanelOption = 2 OrElse (NotasHistoricas.FilterPanelOption = 3 AndAlso NotasHistoricas_summary.FilterApplied) OrElse NotasHistoricas_summary.Filter = "0=101") Then
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
<form name="fNotasHistoricassummaryfilter" id="fNotasHistoricassummaryfilter" action="NotasHistoricassmry.aspx" class="ewForm" onsubmit="return NotasHistoricas_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = NotasHistoricas.ASISTENCIA.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.FACULTAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FACULTAD" id="sv_FACULTAD"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_FACULTAD", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.FACULTAD.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.FACULTAD.CustomFilters.Count + NotasHistoricas.FACULTAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.FACULTAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "FACULTAD")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.FACULTAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.FACULTAD.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.FACULTAD.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.CARRERA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CARRERA" id="sv_CARRERA"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_CARRERA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.CARRERA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.CARRERA.CustomFilters.Count + NotasHistoricas.CARRERA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.CARRERA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CARRERA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.CARRERA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.CARRERA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.CARRERA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.RAMO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_RAMO" id="sv_RAMO"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_RAMO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.RAMO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.RAMO.CustomFilters.Count + NotasHistoricas.RAMO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.RAMO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "RAMO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.RAMO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.RAMO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.RAMO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.RUT.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_RUT" id="so1_RUT" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="30" value="<%= ew_HtmlEncode(NotasHistoricas.RUT.SearchValue) %>"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.ANOINGRESO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANOINGRESO" id="sv_ANOINGRESO"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_ANOINGRESO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ANOINGRESO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.ANOINGRESO.CustomFilters.Count + NotasHistoricas.ANOINGRESO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.ANOINGRESO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANOINGRESO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ANOINGRESO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.ANOINGRESO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ANOINGRESO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.ANO_MAT.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO_MAT" id="sv_ANO_MAT"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_ANO_MAT", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ANO_MAT.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.ANO_MAT.CustomFilters.Count + NotasHistoricas.ANO_MAT.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.ANO_MAT.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO_MAT")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ANO_MAT.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.ANO_MAT.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ANO_MAT.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.PER_MAT.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PER_MAT" id="sv_PER_MAT"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_PER_MAT", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.PER_MAT.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.PER_MAT.CustomFilters.Count + NotasHistoricas.PER_MAT.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.PER_MAT.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PER_MAT")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.PER_MAT.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.PER_MAT.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.PER_MAT.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.NP.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NP" id="sv1_NP" size="30" value="<%= ew_HtmlEncode(NotasHistoricas.NP.SearchValue) %>"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_NP", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.ASISTENCIA.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_ASISTENCIA" id="sv1_ASISTENCIA" size="30" value="<%= ew_HtmlEncode(NotasHistoricas.ASISTENCIA.SearchValue) %>"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_ASISTENCIA", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.ESTADO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ESTADO" id="sv_ESTADO"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_ESTADO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ESTADO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.ESTADO.CustomFilters.Count + NotasHistoricas.ESTADO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.ESTADO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTADO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ESTADO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.ESTADO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ESTADO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.ANO_RAMO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO_RAMO" id="sv_ANO_RAMO"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_ANO_RAMO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ANO_RAMO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.ANO_RAMO.CustomFilters.Count + NotasHistoricas.ANO_RAMO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.ANO_RAMO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO_RAMO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ANO_RAMO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.ANO_RAMO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.ANO_RAMO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.PER_RAMO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PER_RAMO" id="sv_PER_RAMO"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_PER_RAMO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.PER_RAMO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.PER_RAMO.CustomFilters.Count + NotasHistoricas.PER_RAMO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.PER_RAMO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PER_RAMO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.PER_RAMO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.PER_RAMO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.PER_RAMO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.JORNADA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_JORNADA" id="sv_JORNADA"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_JORNADA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.JORNADA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.JORNADA.CustomFilters.Count + NotasHistoricas.JORNADA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.JORNADA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "JORNADA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.JORNADA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.JORNADA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.JORNADA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= NotasHistoricas.DURACION.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_DURACION" id="sv_DURACION"<%= IIf(NotasHistoricas_summary.ClearExtFilter = "NotasHistoricas_DURACION", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.DURACION.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = NotasHistoricas.DURACION.CustomFilters.Count + NotasHistoricas.DURACION.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In NotasHistoricas.DURACION.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "DURACION")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.DURACION.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In NotasHistoricas.DURACION.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(NotasHistoricas.DURACION.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (NotasHistoricas.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% NotasHistoricas_summary.ShowFilterList() %>
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
If (NotasHistoricas.ExportAll AndAlso ew_NotEmpty(NotasHistoricas.Export)) Then
	NotasHistoricas_summary.StopGrp = NotasHistoricas_summary.TotalGrps
Else
	NotasHistoricas_summary.StopGrp = NotasHistoricas_summary.StartGrp + NotasHistoricas_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (NotasHistoricas_summary.StopGrp > NotasHistoricas_summary.TotalGrps) Then
	NotasHistoricas_summary.StopGrp = NotasHistoricas_summary.TotalGrps
End If
NotasHistoricas_summary.RecCount = 0

' Get first row
If (NotasHistoricas_summary.TotalGrps > 0) Then
	NotasHistoricas_summary.GetRow() ' ASPXRPT
	NotasHistoricas_summary.GrpCount = 1
End If
While ((NotasHistoricas_summary.HasRow AndAlso NotasHistoricas_summary.GrpIndex < NotasHistoricas_summary.StopGrp) OrElse NotasHistoricas_summary.ShowFirstHeader)

	' Show header
	If (NotasHistoricas_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.FACULTAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.FACULTAD))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.FACULTAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.FACULTAD) %>',0);"><%= NotasHistoricas.FACULTAD.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.FACULTAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.FACULTAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.CARRERA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.CARRERA))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.CARRERA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.CARRERA) %>',0);"><%= NotasHistoricas.CARRERA.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.CARRERA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.CARRERA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.RAMO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.RAMO))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.RAMO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.RAMO) %>',0);"><%= NotasHistoricas.RAMO.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.RAMO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.RAMO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.CODRAMO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.CODRAMO))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.CODRAMO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.CODRAMO) %>',0);"><%= NotasHistoricas.CODRAMO.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.CODRAMO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.CODRAMO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.RUT) %>',0);"><%= NotasHistoricas.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.PATERNO) %>',0);"><%= NotasHistoricas.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.MATERNO) %>',0);"><%= NotasHistoricas.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NOMBRE) %>',0);"><%= NotasHistoricas.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.SEXO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.SEXO))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.SEXO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.SEXO) %>',0);"><%= NotasHistoricas.SEXO.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.SEXO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.SEXO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.ANOINGRESO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.ANOINGRESO))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.ANOINGRESO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.ANOINGRESO) %>',0);"><%= NotasHistoricas.ANOINGRESO.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.ANOINGRESO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.ANOINGRESO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.ANO_MAT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.ANO_MAT))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.ANO_MAT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.ANO_MAT) %>',0);"><%= NotasHistoricas.ANO_MAT.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.ANO_MAT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.ANO_MAT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.PER_MAT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.PER_MAT))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.PER_MAT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.PER_MAT) %>',0);"><%= NotasHistoricas.PER_MAT.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.PER_MAT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.PER_MAT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NACIONALIDAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NACIONALIDAD))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NACIONALIDAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NACIONALIDAD) %>',0);"><%= NotasHistoricas.NACIONALIDAD.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NACIONALIDAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NACIONALIDAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NP.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NP))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NP.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NP) %>',0);"><%= NotasHistoricas.NP.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NP.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NP.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NE))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NE) %>',0);"><%= NotasHistoricas.NE.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NPR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NPR))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NPR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NPR) %>',0);"><%= NotasHistoricas.NPR.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NPR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NPR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NER.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NER))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NER.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NER) %>',0);"><%= NotasHistoricas.NER.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NER.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NER.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NEP.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NEP))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NEP.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NEP) %>',0);"><%= NotasHistoricas.NEP.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NEP.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NEP.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NERP.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NERP))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NERP.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NERP) %>',0);"><%= NotasHistoricas.NERP.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NERP.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NERP.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NFP.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NFP))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NFP.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NFP) %>',0);"><%= NotasHistoricas.NFP.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NFP.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NFP.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NF.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NF))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NF.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NF) %>',0);"><%= NotasHistoricas.NF.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NF.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NF.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.ASISTENCIA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.ASISTENCIA))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.ASISTENCIA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.ASISTENCIA) %>',0);"><%= NotasHistoricas.ASISTENCIA.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.ASISTENCIA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.ASISTENCIA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.ESTADO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.ESTADO))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.ESTADO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.ESTADO) %>',0);"><%= NotasHistoricas.ESTADO.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.ESTADO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.ESTADO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.ANO_RAMO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.ANO_RAMO))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.ANO_RAMO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.ANO_RAMO) %>',0);"><%= NotasHistoricas.ANO_RAMO.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.ANO_RAMO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.ANO_RAMO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.PER_RAMO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.PER_RAMO))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.PER_RAMO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.PER_RAMO) %>',0);"><%= NotasHistoricas.PER_RAMO.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.PER_RAMO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.PER_RAMO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.PAT_PROF.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.PAT_PROF))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.PAT_PROF.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.PAT_PROF) %>',0);"><%= NotasHistoricas.PAT_PROF.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.PAT_PROF.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.PAT_PROF.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.MAT_PROF.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.MAT_PROF))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.MAT_PROF.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.MAT_PROF) %>',0);"><%= NotasHistoricas.MAT_PROF.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.MAT_PROF.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.MAT_PROF.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.NOM_PROF.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.NOM_PROF))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.NOM_PROF.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.NOM_PROF) %>',0);"><%= NotasHistoricas.NOM_PROF.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.NOM_PROF.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.NOM_PROF.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.JORNADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.JORNADA))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.JORNADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.JORNADA) %>',0);"><%= NotasHistoricas.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.JORNADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.JORNADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(NotasHistoricas.Export)) Then %>
<%= NotasHistoricas.DURACION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(NotasHistoricas.SortUrl(NotasHistoricas.DURACION))) Then %>
		<td style="vertical-align: bottom;"><%= NotasHistoricas.DURACION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= NotasHistoricas.SortUrl(NotasHistoricas.DURACION) %>',0);"><%= NotasHistoricas.DURACION.FldCaption() %></td><td style="width: 10px;">
		<% If (NotasHistoricas.DURACION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (NotasHistoricas.DURACION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		NotasHistoricas_summary.ShowFirstHeader = False
	End If
	NotasHistoricas_summary.RecCount += 1

		' Render detail row
		NotasHistoricas.ResetCSS()
		NotasHistoricas.RowType = EWRPT_ROWTYPE_DETAIL
		NotasHistoricas_summary.RenderRow()
%>
	<tr<%= NotasHistoricas.RowAttributes() %>>
		<td<%= NotasHistoricas.FACULTAD.CellAttributes %>>
<div<%= NotasHistoricas.FACULTAD.ViewAttributes%>><%= NotasHistoricas.FACULTAD.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.CARRERA.CellAttributes %>>
<div<%= NotasHistoricas.CARRERA.ViewAttributes%>><%= NotasHistoricas.CARRERA.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.RAMO.CellAttributes %>>
<div<%= NotasHistoricas.RAMO.ViewAttributes%>><%= NotasHistoricas.RAMO.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.CODRAMO.CellAttributes %>>
<div<%= NotasHistoricas.CODRAMO.ViewAttributes%>><%= NotasHistoricas.CODRAMO.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.RUT.CellAttributes %>>
<div<%= NotasHistoricas.RUT.ViewAttributes%>><%= NotasHistoricas.RUT.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.PATERNO.CellAttributes %>>
<div<%= NotasHistoricas.PATERNO.ViewAttributes%>><%= NotasHistoricas.PATERNO.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.MATERNO.CellAttributes %>>
<div<%= NotasHistoricas.MATERNO.ViewAttributes%>><%= NotasHistoricas.MATERNO.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NOMBRE.CellAttributes %>>
<div<%= NotasHistoricas.NOMBRE.ViewAttributes%>><%= NotasHistoricas.NOMBRE.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.SEXO.CellAttributes %>>
<div<%= NotasHistoricas.SEXO.ViewAttributes%>><%= NotasHistoricas.SEXO.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.ANOINGRESO.CellAttributes %>>
<div<%= NotasHistoricas.ANOINGRESO.ViewAttributes%>><%= NotasHistoricas.ANOINGRESO.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.ANO_MAT.CellAttributes %>>
<div<%= NotasHistoricas.ANO_MAT.ViewAttributes%>><%= NotasHistoricas.ANO_MAT.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.PER_MAT.CellAttributes %>>
<div<%= NotasHistoricas.PER_MAT.ViewAttributes%>><%= NotasHistoricas.PER_MAT.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NACIONALIDAD.CellAttributes %>>
<div<%= NotasHistoricas.NACIONALIDAD.ViewAttributes%>><%= NotasHistoricas.NACIONALIDAD.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NP.CellAttributes %>>
<div<%= NotasHistoricas.NP.ViewAttributes%>><%= NotasHistoricas.NP.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NE.CellAttributes %>>
<div<%= NotasHistoricas.NE.ViewAttributes%>><%= NotasHistoricas.NE.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NPR.CellAttributes %>>
<div<%= NotasHistoricas.NPR.ViewAttributes%>><%= NotasHistoricas.NPR.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NER.CellAttributes %>>
<div<%= NotasHistoricas.NER.ViewAttributes%>><%= NotasHistoricas.NER.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NEP.CellAttributes %>>
<div<%= NotasHistoricas.NEP.ViewAttributes%>><%= NotasHistoricas.NEP.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NERP.CellAttributes %>>
<div<%= NotasHistoricas.NERP.ViewAttributes%>><%= NotasHistoricas.NERP.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NFP.CellAttributes %>>
<div<%= NotasHistoricas.NFP.ViewAttributes%>><%= NotasHistoricas.NFP.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NF.CellAttributes %>>
<div<%= NotasHistoricas.NF.ViewAttributes%>><%= NotasHistoricas.NF.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.ASISTENCIA.CellAttributes %>>
<div<%= NotasHistoricas.ASISTENCIA.ViewAttributes%>><%= NotasHistoricas.ASISTENCIA.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.ESTADO.CellAttributes %>>
<div<%= NotasHistoricas.ESTADO.ViewAttributes%>><%= NotasHistoricas.ESTADO.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.ANO_RAMO.CellAttributes %>>
<div<%= NotasHistoricas.ANO_RAMO.ViewAttributes%>><%= NotasHistoricas.ANO_RAMO.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.PER_RAMO.CellAttributes %>>
<div<%= NotasHistoricas.PER_RAMO.ViewAttributes%>><%= NotasHistoricas.PER_RAMO.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.PAT_PROF.CellAttributes %>>
<div<%= NotasHistoricas.PAT_PROF.ViewAttributes%>><%= NotasHistoricas.PAT_PROF.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.MAT_PROF.CellAttributes %>>
<div<%= NotasHistoricas.MAT_PROF.ViewAttributes%>><%= NotasHistoricas.MAT_PROF.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.NOM_PROF.CellAttributes %>>
<div<%= NotasHistoricas.NOM_PROF.ViewAttributes%>><%= NotasHistoricas.NOM_PROF.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.JORNADA.CellAttributes %>>
<div<%= NotasHistoricas.JORNADA.ViewAttributes%>><%= NotasHistoricas.JORNADA.ListViewValue%></div>
</td>
		<td<%= NotasHistoricas.DURACION.CellAttributes %>>
<div<%= NotasHistoricas.DURACION.ViewAttributes%>><%= NotasHistoricas.DURACION.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		NotasHistoricas_summary.AccumulateSummary()

		' Get next record
		NotasHistoricas_summary.GetRow() ' ASPXRPT
		NotasHistoricas_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (NotasHistoricas_summary.TotalGrps > 0) Then
	NotasHistoricas.ResetCSS()
	NotasHistoricas.RowType = EWRPT_ROWTYPE_TOTAL
	NotasHistoricas.RowTotalType = EWRPT_ROWTOTAL_GRAND
	NotasHistoricas.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	NotasHistoricas.RowAttrs("class") = "ewRptGrandSummary"
	NotasHistoricas_summary.RenderRow()
%>
	<!-- tr><td colspan="30"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= NotasHistoricas.RowAttributes() %>><td colspan="30"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(NotasHistoricas_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (NotasHistoricas.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If NotasHistoricas_summary.Pager Is Nothing Then NotasHistoricas_summary.Pager = New cPrevNextPager(NotasHistoricas_summary.StartGrp, NotasHistoricas_summary.DisplayGrps, NotasHistoricas_summary.TotalGrps) %>
<% If NotasHistoricas_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If NotasHistoricas_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="NotasHistoricassmry.aspx?start=<%= NotasHistoricas_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If NotasHistoricas_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="NotasHistoricassmry.aspx?start=<%= NotasHistoricas_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= NotasHistoricas_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If NotasHistoricas_summary.Pager.NextButton.Enabled Then %>
	<td><a href="NotasHistoricassmry.aspx?start=<%= NotasHistoricas_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If NotasHistoricas_summary.Pager.LastButton.Enabled Then %>
	<td><a href="NotasHistoricassmry.aspx?start=<%= NotasHistoricas_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= NotasHistoricas_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= NotasHistoricas_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= NotasHistoricas_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= NotasHistoricas_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If NotasHistoricas_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (NotasHistoricas_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If NotasHistoricas_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="15"<% If NotasHistoricas_summary.DisplayGrps = 15 Then Response.Write(" selected=""selected""") %>>15</option>
<option value="20"<% If NotasHistoricas_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If NotasHistoricas_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
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
<% If (NotasHistoricas.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (NotasHistoricas.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (NotasHistoricas.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% NotasHistoricas_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (NotasHistoricas.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
