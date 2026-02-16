<%@ Page ClassName="Consulta_Avance_CrE9ditossmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_consultaAvanceCreditos" %>
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
	Public Consulta_Avance_CrE9ditos As crConsulta_Avance_CrE9ditos = Nothing

	'
	' Table class (for Consulta Avance Créditos)
	'
	Public Class crConsulta_Avance_CrE9ditos
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
				Return "Consulta_Avance_CrE9ditos"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Consulta Avance Créditos"
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

		Public codcli As crField

		Public RUT As crField

		Public paterno As crField

		Public materno As crField

		Public nombre As crField

		Public codcarpr As crField

		Public nivel As crField

		Public estacad As crField

		Public ano As crField

		Public ano_mat As crField

		Public TotalCredMalla As crField

		Public NumTotalRamoMalla As crField

		Public CredAprob As crField

		Public RamosAprob As crField

		Public TotalCredFaltantes As crField

		Public NumRamosFaltantes As crField

		Public TotalCredMallaEle As crField

		Public CredAprobEle As crField

		Public TotalCredFaltantesEle As crField

		Public TotalCredMallaLC As crField

		Public CredAprobLC As crField

		Public TotalCredFaltantesLC As crField

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

			' codcli
			codcli = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_codcli", "codcli", "[codcli]", 200, EWRPT_DATATYPE_STRING, -1)
			codcli.Page = APage
			codcli.ParentPage = APage.ParentPage
			Fields.Add("codcli", codcli)
			codcli.DateFilter = ""
			codcli.SqlSelect = ""
			codcli.SqlOrderBy = ""

			' RUT
			RUT = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' paterno
			paterno = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_paterno", "paterno", "[paterno]", 200, EWRPT_DATATYPE_STRING, -1)
			paterno.Page = APage
			paterno.ParentPage = APage.ParentPage
			Fields.Add("paterno", paterno)
			paterno.DateFilter = ""
			paterno.SqlSelect = ""
			paterno.SqlOrderBy = ""

			' materno
			materno = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_materno", "materno", "[materno]", 200, EWRPT_DATATYPE_STRING, -1)
			materno.Page = APage
			materno.ParentPage = APage.ParentPage
			Fields.Add("materno", materno)
			materno.DateFilter = ""
			materno.SqlSelect = ""
			materno.SqlOrderBy = ""

			' nombre
			nombre = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_nombre", "nombre", "[nombre]", 200, EWRPT_DATATYPE_STRING, -1)
			nombre.Page = APage
			nombre.ParentPage = APage.ParentPage
			Fields.Add("nombre", nombre)
			nombre.DateFilter = ""
			nombre.SqlSelect = ""
			nombre.SqlOrderBy = ""

			' codcarpr
			codcarpr = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_codcarpr", "codcarpr", "[codcarpr]", 200, EWRPT_DATATYPE_STRING, -1)
			codcarpr.Page = APage
			codcarpr.ParentPage = APage.ParentPage
			Fields.Add("codcarpr", codcarpr)
			codcarpr.DateFilter = ""
			codcarpr.SqlSelect = ""
			codcarpr.SqlOrderBy = ""

			' nivel
			nivel = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_nivel", "nivel", "[nivel]", 131, EWRPT_DATATYPE_NUMBER, -1)
			nivel.Page = APage
			nivel.ParentPage = APage.ParentPage
			nivel.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("nivel", nivel)
			nivel.DateFilter = ""
			nivel.SqlSelect = ""
			nivel.SqlOrderBy = ""

			' estacad
			estacad = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_estacad", "estacad", "[estacad]", 200, EWRPT_DATATYPE_STRING, -1)
			estacad.Page = APage
			estacad.ParentPage = APage.ParentPage
			Fields.Add("estacad", estacad)
			estacad.DateFilter = ""
			estacad.SqlSelect = ""
			estacad.SqlOrderBy = ""

			' ano
			ano = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_ano", "ano", "[ano]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ano.Page = APage
			ano.ParentPage = APage.ParentPage
			ano.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ano", ano)
			ano.DateFilter = ""
			ano.SqlSelect = ""
			ano.SqlOrderBy = ""

			' ano_mat
			ano_mat = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_ano_mat", "ano_mat", "[ano_mat]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ano_mat.Page = APage
			ano_mat.ParentPage = APage.ParentPage
			ano_mat.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ano_mat", ano_mat)
			ano_mat.DateFilter = ""
			ano_mat.SqlSelect = ""
			ano_mat.SqlOrderBy = ""

			' TotalCredMalla
			TotalCredMalla = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_TotalCredMalla", "TotalCredMalla", "[TotalCredMalla]", 3, EWRPT_DATATYPE_NUMBER, -1)
			TotalCredMalla.Page = APage
			TotalCredMalla.ParentPage = APage.ParentPage
			TotalCredMalla.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("TotalCredMalla", TotalCredMalla)
			TotalCredMalla.DateFilter = ""
			TotalCredMalla.SqlSelect = ""
			TotalCredMalla.SqlOrderBy = ""

			' NumTotalRamoMalla
			NumTotalRamoMalla = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_NumTotalRamoMalla", "NumTotalRamoMalla", "[NumTotalRamoMalla]", 3, EWRPT_DATATYPE_NUMBER, -1)
			NumTotalRamoMalla.Page = APage
			NumTotalRamoMalla.ParentPage = APage.ParentPage
			NumTotalRamoMalla.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("NumTotalRamoMalla", NumTotalRamoMalla)
			NumTotalRamoMalla.DateFilter = ""
			NumTotalRamoMalla.SqlSelect = ""
			NumTotalRamoMalla.SqlOrderBy = ""

			' CredAprob
			CredAprob = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_CredAprob", "CredAprob", "[CredAprob]", 3, EWRPT_DATATYPE_NUMBER, -1)
			CredAprob.Page = APage
			CredAprob.ParentPage = APage.ParentPage
			CredAprob.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("CredAprob", CredAprob)
			CredAprob.DateFilter = ""
			CredAprob.SqlSelect = ""
			CredAprob.SqlOrderBy = ""

			' RamosAprob
			RamosAprob = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_RamosAprob", "RamosAprob", "[RamosAprob]", 3, EWRPT_DATATYPE_NUMBER, -1)
			RamosAprob.Page = APage
			RamosAprob.ParentPage = APage.ParentPage
			RamosAprob.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("RamosAprob", RamosAprob)
			RamosAprob.DateFilter = ""
			RamosAprob.SqlSelect = ""
			RamosAprob.SqlOrderBy = ""

			' TotalCredFaltantes
			TotalCredFaltantes = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_TotalCredFaltantes", "TotalCredFaltantes", "[TotalCredFaltantes]", 3, EWRPT_DATATYPE_NUMBER, -1)
			TotalCredFaltantes.Page = APage
			TotalCredFaltantes.ParentPage = APage.ParentPage
			TotalCredFaltantes.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("TotalCredFaltantes", TotalCredFaltantes)
			TotalCredFaltantes.DateFilter = ""
			TotalCredFaltantes.SqlSelect = ""
			TotalCredFaltantes.SqlOrderBy = ""

			' NumRamosFaltantes
			NumRamosFaltantes = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_NumRamosFaltantes", "NumRamosFaltantes", "[NumRamosFaltantes]", 3, EWRPT_DATATYPE_NUMBER, -1)
			NumRamosFaltantes.Page = APage
			NumRamosFaltantes.ParentPage = APage.ParentPage
			NumRamosFaltantes.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("NumRamosFaltantes", NumRamosFaltantes)
			NumRamosFaltantes.DateFilter = ""
			NumRamosFaltantes.SqlSelect = ""
			NumRamosFaltantes.SqlOrderBy = ""

			' TotalCredMallaEle
			TotalCredMallaEle = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_TotalCredMallaEle", "TotalCredMallaEle", "[TotalCredMallaEle]", 3, EWRPT_DATATYPE_NUMBER, -1)
			TotalCredMallaEle.Page = APage
			TotalCredMallaEle.ParentPage = APage.ParentPage
			TotalCredMallaEle.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("TotalCredMallaEle", TotalCredMallaEle)
			TotalCredMallaEle.DateFilter = ""
			TotalCredMallaEle.SqlSelect = ""
			TotalCredMallaEle.SqlOrderBy = ""

			' CredAprobEle
			CredAprobEle = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_CredAprobEle", "CredAprobEle", "[CredAprobEle]", 3, EWRPT_DATATYPE_NUMBER, -1)
			CredAprobEle.Page = APage
			CredAprobEle.ParentPage = APage.ParentPage
			CredAprobEle.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("CredAprobEle", CredAprobEle)
			CredAprobEle.DateFilter = ""
			CredAprobEle.SqlSelect = ""
			CredAprobEle.SqlOrderBy = ""

			' TotalCredFaltantesEle
			TotalCredFaltantesEle = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_TotalCredFaltantesEle", "TotalCredFaltantesEle", "[TotalCredFaltantesEle]", 3, EWRPT_DATATYPE_NUMBER, -1)
			TotalCredFaltantesEle.Page = APage
			TotalCredFaltantesEle.ParentPage = APage.ParentPage
			TotalCredFaltantesEle.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("TotalCredFaltantesEle", TotalCredFaltantesEle)
			TotalCredFaltantesEle.DateFilter = ""
			TotalCredFaltantesEle.SqlSelect = ""
			TotalCredFaltantesEle.SqlOrderBy = ""

			' TotalCredMallaLC
			TotalCredMallaLC = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_TotalCredMallaLC", "TotalCredMallaLC", "[TotalCredMallaLC]", 3, EWRPT_DATATYPE_NUMBER, -1)
			TotalCredMallaLC.Page = APage
			TotalCredMallaLC.ParentPage = APage.ParentPage
			TotalCredMallaLC.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("TotalCredMallaLC", TotalCredMallaLC)
			TotalCredMallaLC.DateFilter = ""
			TotalCredMallaLC.SqlSelect = ""
			TotalCredMallaLC.SqlOrderBy = ""

			' CredAprobLC
			CredAprobLC = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_CredAprobLC", "CredAprobLC", "[CredAprobLC]", 3, EWRPT_DATATYPE_NUMBER, -1)
			CredAprobLC.Page = APage
			CredAprobLC.ParentPage = APage.ParentPage
			CredAprobLC.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("CredAprobLC", CredAprobLC)
			CredAprobLC.DateFilter = ""
			CredAprobLC.SqlSelect = ""
			CredAprobLC.SqlOrderBy = ""

			' TotalCredFaltantesLC
			TotalCredFaltantesLC = new crField("Consulta_Avance_CrE9ditos", "Consulta Avance Créditos", "x_TotalCredFaltantesLC", "TotalCredFaltantesLC", "[TotalCredFaltantesLC]", 3, EWRPT_DATATYPE_NUMBER, -1)
			TotalCredFaltantesLC.Page = APage
			TotalCredFaltantesLC.ParentPage = APage.ParentPage
			TotalCredFaltantesLC.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("TotalCredFaltantesLC", TotalCredFaltantesLC)
			TotalCredFaltantesLC.DateFilter = ""
			TotalCredFaltantesLC.SqlSelect = ""
			TotalCredFaltantesLC.SqlOrderBy = ""
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
				Return "[SEK_Consulta_AvanceCreditos]"
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
	Public Consulta_Avance_CrE9ditos_summary As crConsulta_Avance_CrE9ditos_summary

	'
	' Page class
	'
	Public Class crConsulta_Avance_CrE9ditos_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Consulta_Avance_CrE9ditos.UseTokenInUrl) Then
				sUrl &= "t=" & Consulta_Avance_CrE9ditos.TableVar & "&" ' Add page token
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
			If (Consulta_Avance_CrE9ditos.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Consulta_Avance_CrE9ditos.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Consulta_Avance_CrE9ditos.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Consulta_Avance_CrE9ditossmry 
			Get
				Return CType(m_ParentPage, Consulta_Avance_CrE9ditossmry)
			End Get
		End Property

		' Table object (Consulta_Avance_CrE9ditos)
		Public Property Consulta_Avance_CrE9ditos As crConsulta_Avance_CrE9ditos 
			Get		
				Return AspNetPage.Consulta_Avance_CrE9ditos ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crConsulta_Avance_CrE9ditos)
				AspNetPage.Consulta_Avance_CrE9ditos = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_consultaAvanceCreditos)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Consulta_Avance_CrE9ditos_summary"
			m_PageObjTypeName = "crConsulta_Avance_CrE9ditos_summary"

			' Table name
			m_TableName = "Consulta Avance Créditos"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Consulta_Avance_CrE9ditos)
			Consulta_Avance_CrE9ditos = New crConsulta_Avance_CrE9ditos(Me)			

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
				Consulta_Avance_CrE9ditos.Export = ew_Get("export")
			End If
			gsExport = Consulta_Avance_CrE9ditos.Export ' Get export parameter, used in header
			gsExportFile = Consulta_Avance_CrE9ditos.TableVar ' Get export file, used in header
			If (Consulta_Avance_CrE9ditos.Export = "excel") Then
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

		Public Val As Object() = New Object(22) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(22) {}

		Public GrandMn As Object() = New Object(22) {}

		Public GrandMx As Object() = New Object(22) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 23 ' No. of fields
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
			Consulta_Avance_CrE9ditos.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Consulta_Avance_CrE9ditos.SqlSelect, Consulta_Avance_CrE9ditos.SqlWhere, Consulta_Avance_CrE9ditos.SqlGroupBy, Consulta_Avance_CrE9ditos.SqlHaving, Consulta_Avance_CrE9ditos.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Consulta_Avance_CrE9ditos.ExportAll AndAlso ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then
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
				Consulta_Avance_CrE9ditos.codcli.DbValue = Row("codcli")
				Consulta_Avance_CrE9ditos.estacad.DbValue = Row("estacad")
				Consulta_Avance_CrE9ditos.RUT.DbValue = Row("RUT")
				Consulta_Avance_CrE9ditos.ano.DbValue = Row("ano")
				Consulta_Avance_CrE9ditos.paterno.DbValue = Row("paterno")
				Consulta_Avance_CrE9ditos.materno.DbValue = Row("materno")
				Consulta_Avance_CrE9ditos.nombre.DbValue = Row("nombre")
				Consulta_Avance_CrE9ditos.codcarpr.DbValue = Row("codcarpr")
				Consulta_Avance_CrE9ditos.nivel.DbValue = Row("nivel")
				Consulta_Avance_CrE9ditos.TotalCredMalla.DbValue = Row("TotalCredMalla")
				Consulta_Avance_CrE9ditos.NumTotalRamoMalla.DbValue = Row("NumTotalRamoMalla")
				Consulta_Avance_CrE9ditos.CredAprob.DbValue = Row("CredAprob")
				Consulta_Avance_CrE9ditos.RamosAprob.DbValue = Row("RamosAprob")
				Consulta_Avance_CrE9ditos.TotalCredFaltantes.DbValue = Row("TotalCredFaltantes")
				Consulta_Avance_CrE9ditos.NumRamosFaltantes.DbValue = Row("NumRamosFaltantes")
				Consulta_Avance_CrE9ditos.TotalCredMallaEle.DbValue = Row("TotalCredMallaEle")
				Consulta_Avance_CrE9ditos.CredAprobEle.DbValue = Row("CredAprobEle")
				Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.DbValue = Row("TotalCredFaltantesEle")
				Consulta_Avance_CrE9ditos.TotalCredMallaLC.DbValue = Row("TotalCredMallaLC")
				Consulta_Avance_CrE9ditos.CredAprobLC.DbValue = Row("CredAprobLC")
				Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.DbValue = Row("TotalCredFaltantesLC")
				Consulta_Avance_CrE9ditos.ano_mat.DbValue = Row("ano_mat")
				Val(1) = Consulta_Avance_CrE9ditos.codcli.CurrentValue
				Val(2) = Consulta_Avance_CrE9ditos.RUT.CurrentValue
				Val(3) = Consulta_Avance_CrE9ditos.paterno.CurrentValue
				Val(4) = Consulta_Avance_CrE9ditos.materno.CurrentValue
				Val(5) = Consulta_Avance_CrE9ditos.nombre.CurrentValue
				Val(6) = Consulta_Avance_CrE9ditos.codcarpr.CurrentValue
				Val(7) = Consulta_Avance_CrE9ditos.nivel.CurrentValue
				Val(8) = Consulta_Avance_CrE9ditos.estacad.CurrentValue
				Val(9) = Consulta_Avance_CrE9ditos.ano.CurrentValue
				Val(10) = Consulta_Avance_CrE9ditos.ano_mat.CurrentValue
				Val(11) = Consulta_Avance_CrE9ditos.TotalCredMalla.CurrentValue
				Val(12) = Consulta_Avance_CrE9ditos.NumTotalRamoMalla.CurrentValue
				Val(13) = Consulta_Avance_CrE9ditos.CredAprob.CurrentValue
				Val(14) = Consulta_Avance_CrE9ditos.RamosAprob.CurrentValue
				Val(15) = Consulta_Avance_CrE9ditos.TotalCredFaltantes.CurrentValue
				Val(16) = Consulta_Avance_CrE9ditos.NumRamosFaltantes.CurrentValue
				Val(17) = Consulta_Avance_CrE9ditos.TotalCredMallaEle.CurrentValue
				Val(18) = Consulta_Avance_CrE9ditos.CredAprobEle.CurrentValue
				Val(19) = Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.CurrentValue
				Val(20) = Consulta_Avance_CrE9ditos.TotalCredMallaLC.CurrentValue
				Val(21) = Consulta_Avance_CrE9ditos.CredAprobLC.CurrentValue
				Val(22) = Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.CurrentValue
			Else
				Consulta_Avance_CrE9ditos.codcli.DbValue = ""
				Consulta_Avance_CrE9ditos.estacad.DbValue = ""
				Consulta_Avance_CrE9ditos.RUT.DbValue = ""
				Consulta_Avance_CrE9ditos.ano.DbValue = ""
				Consulta_Avance_CrE9ditos.paterno.DbValue = ""
				Consulta_Avance_CrE9ditos.materno.DbValue = ""
				Consulta_Avance_CrE9ditos.nombre.DbValue = ""
				Consulta_Avance_CrE9ditos.codcarpr.DbValue = ""
				Consulta_Avance_CrE9ditos.nivel.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredMalla.DbValue = ""
				Consulta_Avance_CrE9ditos.NumTotalRamoMalla.DbValue = ""
				Consulta_Avance_CrE9ditos.CredAprob.DbValue = ""
				Consulta_Avance_CrE9ditos.RamosAprob.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredFaltantes.DbValue = ""
				Consulta_Avance_CrE9ditos.NumRamosFaltantes.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredMallaEle.DbValue = ""
				Consulta_Avance_CrE9ditos.CredAprobEle.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredMallaLC.DbValue = ""
				Consulta_Avance_CrE9ditos.CredAprobLC.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.DbValue = ""
				Consulta_Avance_CrE9ditos.ano_mat.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Consulta_Avance_CrE9ditos.codcli.DbValue = dr("codcli")
				Consulta_Avance_CrE9ditos.estacad.DbValue = dr("estacad")
				Consulta_Avance_CrE9ditos.RUT.DbValue = dr("RUT")
				Consulta_Avance_CrE9ditos.ano.DbValue = dr("ano")
				Consulta_Avance_CrE9ditos.paterno.DbValue = dr("paterno")
				Consulta_Avance_CrE9ditos.materno.DbValue = dr("materno")
				Consulta_Avance_CrE9ditos.nombre.DbValue = dr("nombre")
				Consulta_Avance_CrE9ditos.codcarpr.DbValue = dr("codcarpr")
				Consulta_Avance_CrE9ditos.nivel.DbValue = dr("nivel")
				Consulta_Avance_CrE9ditos.TotalCredMalla.DbValue = dr("TotalCredMalla")
				Consulta_Avance_CrE9ditos.NumTotalRamoMalla.DbValue = dr("NumTotalRamoMalla")
				Consulta_Avance_CrE9ditos.CredAprob.DbValue = dr("CredAprob")
				Consulta_Avance_CrE9ditos.RamosAprob.DbValue = dr("RamosAprob")
				Consulta_Avance_CrE9ditos.TotalCredFaltantes.DbValue = dr("TotalCredFaltantes")
				Consulta_Avance_CrE9ditos.NumRamosFaltantes.DbValue = dr("NumRamosFaltantes")
				Consulta_Avance_CrE9ditos.TotalCredMallaEle.DbValue = dr("TotalCredMallaEle")
				Consulta_Avance_CrE9ditos.CredAprobEle.DbValue = dr("CredAprobEle")
				Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.DbValue = dr("TotalCredFaltantesEle")
				Consulta_Avance_CrE9ditos.TotalCredMallaLC.DbValue = dr("TotalCredMallaLC")
				Consulta_Avance_CrE9ditos.CredAprobLC.DbValue = dr("CredAprobLC")
				Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.DbValue = dr("TotalCredFaltantesLC")
				Consulta_Avance_CrE9ditos.ano_mat.DbValue = dr("ano_mat")
				Val(1) = Consulta_Avance_CrE9ditos.codcli.CurrentValue
				Val(2) = Consulta_Avance_CrE9ditos.RUT.CurrentValue
				Val(3) = Consulta_Avance_CrE9ditos.paterno.CurrentValue
				Val(4) = Consulta_Avance_CrE9ditos.materno.CurrentValue
				Val(5) = Consulta_Avance_CrE9ditos.nombre.CurrentValue
				Val(6) = Consulta_Avance_CrE9ditos.codcarpr.CurrentValue
				Val(7) = Consulta_Avance_CrE9ditos.nivel.CurrentValue
				Val(8) = Consulta_Avance_CrE9ditos.estacad.CurrentValue
				Val(9) = Consulta_Avance_CrE9ditos.ano.CurrentValue
				Val(10) = Consulta_Avance_CrE9ditos.ano_mat.CurrentValue
				Val(11) = Consulta_Avance_CrE9ditos.TotalCredMalla.CurrentValue
				Val(12) = Consulta_Avance_CrE9ditos.NumTotalRamoMalla.CurrentValue
				Val(13) = Consulta_Avance_CrE9ditos.CredAprob.CurrentValue
				Val(14) = Consulta_Avance_CrE9ditos.RamosAprob.CurrentValue
				Val(15) = Consulta_Avance_CrE9ditos.TotalCredFaltantes.CurrentValue
				Val(16) = Consulta_Avance_CrE9ditos.NumRamosFaltantes.CurrentValue
				Val(17) = Consulta_Avance_CrE9ditos.TotalCredMallaEle.CurrentValue
				Val(18) = Consulta_Avance_CrE9ditos.CredAprobEle.CurrentValue
				Val(19) = Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.CurrentValue
				Val(20) = Consulta_Avance_CrE9ditos.TotalCredMallaLC.CurrentValue
				Val(21) = Consulta_Avance_CrE9ditos.CredAprobLC.CurrentValue
				Val(22) = Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.CurrentValue
			Else				
				Consulta_Avance_CrE9ditos.codcli.DbValue = ""
				Consulta_Avance_CrE9ditos.estacad.DbValue = ""
				Consulta_Avance_CrE9ditos.RUT.DbValue = ""
				Consulta_Avance_CrE9ditos.ano.DbValue = ""
				Consulta_Avance_CrE9ditos.paterno.DbValue = ""
				Consulta_Avance_CrE9ditos.materno.DbValue = ""
				Consulta_Avance_CrE9ditos.nombre.DbValue = ""
				Consulta_Avance_CrE9ditos.codcarpr.DbValue = ""
				Consulta_Avance_CrE9ditos.nivel.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredMalla.DbValue = ""
				Consulta_Avance_CrE9ditos.NumTotalRamoMalla.DbValue = ""
				Consulta_Avance_CrE9ditos.CredAprob.DbValue = ""
				Consulta_Avance_CrE9ditos.RamosAprob.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredFaltantes.DbValue = ""
				Consulta_Avance_CrE9ditos.NumRamosFaltantes.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredMallaEle.DbValue = ""
				Consulta_Avance_CrE9ditos.CredAprobEle.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredMallaLC.DbValue = ""
				Consulta_Avance_CrE9ditos.CredAprobLC.DbValue = ""
				Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.DbValue = ""
				Consulta_Avance_CrE9ditos.ano_mat.DbValue = ""
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
				Consulta_Avance_CrE9ditos.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Consulta_Avance_CrE9ditos.StartGroup = StartGrp
				Else
					StartGrp = Consulta_Avance_CrE9ditos.StartGroup
				End If
			Else
				StartGrp = Consulta_Avance_CrE9ditos.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Consulta_Avance_CrE9ditos.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Consulta_Avance_CrE9ditos.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Consulta_Avance_CrE9ditos.StartGroup = StartGrp
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
			Consulta_Avance_CrE9ditos.StartGroup = StartGrp
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
				Consulta_Avance_CrE9ditos.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Consulta_Avance_CrE9ditos.StartGroup = StartGrp
			Else				
				If (Consulta_Avance_CrE9ditos.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Consulta_Avance_CrE9ditos.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Consulta_Avance_CrE9ditos.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Consulta_Avance_CrE9ditos.SqlSelectCount, Consulta_Avance_CrE9ditos.SqlWhere, Consulta_Avance_CrE9ditos.SqlGroupBy, Consulta_Avance_CrE9ditos.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Consulta_Avance_CrE9ditos.Row_Rendering()

			'
			' Render view codes
			'

			If (Consulta_Avance_CrE9ditos.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' codcli
				Consulta_Avance_CrE9ditos.codcli.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.codcli.Summary)

				' RUT
				Consulta_Avance_CrE9ditos.RUT.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.RUT.Summary)

				' paterno
				Consulta_Avance_CrE9ditos.paterno.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.paterno.Summary)

				' materno
				Consulta_Avance_CrE9ditos.materno.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.materno.Summary)

				' nombre
				Consulta_Avance_CrE9ditos.nombre.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.nombre.Summary)

				' codcarpr
				Consulta_Avance_CrE9ditos.codcarpr.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.codcarpr.Summary)

				' nivel
				Consulta_Avance_CrE9ditos.nivel.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.nivel.Summary)

				' estacad
				Consulta_Avance_CrE9ditos.estacad.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.estacad.Summary)

				' ano
				Consulta_Avance_CrE9ditos.ano.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.ano.Summary)

				' ano_mat
				Consulta_Avance_CrE9ditos.ano_mat.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.ano_mat.Summary)

				' TotalCredMalla
				Consulta_Avance_CrE9ditos.TotalCredMalla.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredMalla.Summary)

				' NumTotalRamoMalla
				Consulta_Avance_CrE9ditos.NumTotalRamoMalla.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.NumTotalRamoMalla.Summary)

				' CredAprob
				Consulta_Avance_CrE9ditos.CredAprob.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.CredAprob.Summary)

				' RamosAprob
				Consulta_Avance_CrE9ditos.RamosAprob.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.RamosAprob.Summary)

				' TotalCredFaltantes
				Consulta_Avance_CrE9ditos.TotalCredFaltantes.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredFaltantes.Summary)

				' NumRamosFaltantes
				Consulta_Avance_CrE9ditos.NumRamosFaltantes.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.NumRamosFaltantes.Summary)

				' TotalCredMallaEle
				Consulta_Avance_CrE9ditos.TotalCredMallaEle.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredMallaEle.Summary)

				' CredAprobEle
				Consulta_Avance_CrE9ditos.CredAprobEle.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.CredAprobEle.Summary)

				' TotalCredFaltantesEle
				Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.Summary)

				' TotalCredMallaLC
				Consulta_Avance_CrE9ditos.TotalCredMallaLC.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredMallaLC.Summary)

				' CredAprobLC
				Consulta_Avance_CrE9ditos.CredAprobLC.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.CredAprobLC.Summary)

				' TotalCredFaltantesLC
				Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.Summary)
			Else

				' codcli
				Consulta_Avance_CrE9ditos.codcli.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.codcli.CurrentValue)
				Consulta_Avance_CrE9ditos.codcli.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				Consulta_Avance_CrE9ditos.RUT.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.RUT.CurrentValue)
				Consulta_Avance_CrE9ditos.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' paterno
				Consulta_Avance_CrE9ditos.paterno.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.paterno.CurrentValue)
				Consulta_Avance_CrE9ditos.paterno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' materno
				Consulta_Avance_CrE9ditos.materno.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.materno.CurrentValue)
				Consulta_Avance_CrE9ditos.materno.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' nombre
				Consulta_Avance_CrE9ditos.nombre.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.nombre.CurrentValue)
				Consulta_Avance_CrE9ditos.nombre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' codcarpr
				Consulta_Avance_CrE9ditos.codcarpr.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.codcarpr.CurrentValue)
				Consulta_Avance_CrE9ditos.codcarpr.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' nivel
				Consulta_Avance_CrE9ditos.nivel.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.nivel.CurrentValue)
				Consulta_Avance_CrE9ditos.nivel.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' estacad
				Consulta_Avance_CrE9ditos.estacad.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.estacad.CurrentValue)
				Consulta_Avance_CrE9ditos.estacad.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ano
				Consulta_Avance_CrE9ditos.ano.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.ano.CurrentValue)
				Consulta_Avance_CrE9ditos.ano.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ano_mat
				Consulta_Avance_CrE9ditos.ano_mat.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.ano_mat.CurrentValue)
				Consulta_Avance_CrE9ditos.ano_mat.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TotalCredMalla
				Consulta_Avance_CrE9ditos.TotalCredMalla.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredMalla.CurrentValue)
				Consulta_Avance_CrE9ditos.TotalCredMalla.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NumTotalRamoMalla
				Consulta_Avance_CrE9ditos.NumTotalRamoMalla.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.NumTotalRamoMalla.CurrentValue)
				Consulta_Avance_CrE9ditos.NumTotalRamoMalla.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CredAprob
				Consulta_Avance_CrE9ditos.CredAprob.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.CredAprob.CurrentValue)
				Consulta_Avance_CrE9ditos.CredAprob.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RamosAprob
				Consulta_Avance_CrE9ditos.RamosAprob.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.RamosAprob.CurrentValue)
				Consulta_Avance_CrE9ditos.RamosAprob.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TotalCredFaltantes
				Consulta_Avance_CrE9ditos.TotalCredFaltantes.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredFaltantes.CurrentValue)
				Consulta_Avance_CrE9ditos.TotalCredFaltantes.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NumRamosFaltantes
				Consulta_Avance_CrE9ditos.NumRamosFaltantes.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.NumRamosFaltantes.CurrentValue)
				Consulta_Avance_CrE9ditos.NumRamosFaltantes.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TotalCredMallaEle
				Consulta_Avance_CrE9ditos.TotalCredMallaEle.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredMallaEle.CurrentValue)
				Consulta_Avance_CrE9ditos.TotalCredMallaEle.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CredAprobEle
				Consulta_Avance_CrE9ditos.CredAprobEle.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.CredAprobEle.CurrentValue)
				Consulta_Avance_CrE9ditos.CredAprobEle.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TotalCredFaltantesEle
				Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.CurrentValue)
				Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TotalCredMallaLC
				Consulta_Avance_CrE9ditos.TotalCredMallaLC.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredMallaLC.CurrentValue)
				Consulta_Avance_CrE9ditos.TotalCredMallaLC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CredAprobLC
				Consulta_Avance_CrE9ditos.CredAprobLC.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.CredAprobLC.CurrentValue)
				Consulta_Avance_CrE9ditos.CredAprobLC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TotalCredFaltantesLC
				Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.ViewValue = Convert.ToString(Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.CurrentValue)
				Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' codcli
			Consulta_Avance_CrE9ditos.codcli.HrefValue = ""

			' RUT
			Consulta_Avance_CrE9ditos.RUT.HrefValue = ""

			' paterno
			Consulta_Avance_CrE9ditos.paterno.HrefValue = ""

			' materno
			Consulta_Avance_CrE9ditos.materno.HrefValue = ""

			' nombre
			Consulta_Avance_CrE9ditos.nombre.HrefValue = ""

			' codcarpr
			Consulta_Avance_CrE9ditos.codcarpr.HrefValue = ""

			' nivel
			Consulta_Avance_CrE9ditos.nivel.HrefValue = ""

			' estacad
			Consulta_Avance_CrE9ditos.estacad.HrefValue = ""

			' ano
			Consulta_Avance_CrE9ditos.ano.HrefValue = ""

			' ano_mat
			Consulta_Avance_CrE9ditos.ano_mat.HrefValue = ""

			' TotalCredMalla
			Consulta_Avance_CrE9ditos.TotalCredMalla.HrefValue = ""

			' NumTotalRamoMalla
			Consulta_Avance_CrE9ditos.NumTotalRamoMalla.HrefValue = ""

			' CredAprob
			Consulta_Avance_CrE9ditos.CredAprob.HrefValue = ""

			' RamosAprob
			Consulta_Avance_CrE9ditos.RamosAprob.HrefValue = ""

			' TotalCredFaltantes
			Consulta_Avance_CrE9ditos.TotalCredFaltantes.HrefValue = ""

			' NumRamosFaltantes
			Consulta_Avance_CrE9ditos.NumRamosFaltantes.HrefValue = ""

			' TotalCredMallaEle
			Consulta_Avance_CrE9ditos.TotalCredMallaEle.HrefValue = ""

			' CredAprobEle
			Consulta_Avance_CrE9ditos.CredAprobEle.HrefValue = ""

			' TotalCredFaltantesEle
			Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.HrefValue = ""

			' TotalCredMallaLC
			Consulta_Avance_CrE9ditos.TotalCredMallaLC.HrefValue = ""

			' CredAprobLC
			Consulta_Avance_CrE9ditos.CredAprobLC.HrefValue = ""

			' TotalCredFaltantesLC
			Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.HrefValue = ""

			' Call Row_Rendered event
			Consulta_Avance_CrE9ditos.Row_Rendered()
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

			' Field codcarpr
			sSelect = "SELECT DISTINCT [codcarpr] FROM " + Consulta_Avance_CrE9ditos.SqlFrom
			sOrderBy = "[codcarpr] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Consulta_Avance_CrE9ditos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Consulta_Avance_CrE9ditos.codcarpr.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field estacad
			sSelect = "SELECT DISTINCT [estacad] FROM " + Consulta_Avance_CrE9ditos.SqlFrom
			sOrderBy = "[estacad] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Consulta_Avance_CrE9ditos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Consulta_Avance_CrE9ditos.estacad.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ano
			sSelect = "SELECT DISTINCT [ano] FROM " + Consulta_Avance_CrE9ditos.SqlFrom
			sOrderBy = "[ano] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Consulta_Avance_CrE9ditos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Consulta_Avance_CrE9ditos.ano.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ano_mat
			sSelect = "SELECT DISTINCT [ano_mat] FROM " + Consulta_Avance_CrE9ditos.SqlFrom
			sOrderBy = "[ano_mat] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Consulta_Avance_CrE9ditos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Consulta_Avance_CrE9ditos.ano_mat.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field codcli
				SetSessionFilterValues(Consulta_Avance_CrE9ditos.codcli)

				' Field RUT
				SetSessionFilterValues(Consulta_Avance_CrE9ditos.RUT)

				' Field paterno
				SetSessionFilterValues(Consulta_Avance_CrE9ditos.paterno)

				' Field materno
				SetSessionFilterValues(Consulta_Avance_CrE9ditos.materno)

				' Field codcarpr
				SetSessionDropDownValue(Consulta_Avance_CrE9ditos.codcarpr.DropDownValue, Consulta_Avance_CrE9ditos.codcarpr)

				' Field nivel
				SetSessionFilterValues(Consulta_Avance_CrE9ditos.nivel)

				' Field estacad
				SetSessionDropDownValue(Consulta_Avance_CrE9ditos.estacad.DropDownValue, Consulta_Avance_CrE9ditos.estacad)

				' Field ano
				SetSessionDropDownValue(Consulta_Avance_CrE9ditos.ano.DropDownValue, Consulta_Avance_CrE9ditos.ano)

				' Field ano_mat
				SetSessionDropDownValue(Consulta_Avance_CrE9ditos.ano_mat.DropDownValue, Consulta_Avance_CrE9ditos.ano_mat)
			bSetupFilter = True ' Set up filter required
		Else

				' Field codcli
				If (GetFilterValues(Consulta_Avance_CrE9ditos.codcli)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field RUT
				If (GetFilterValues(Consulta_Avance_CrE9ditos.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field paterno
				If (GetFilterValues(Consulta_Avance_CrE9ditos.paterno)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field materno
				If (GetFilterValues(Consulta_Avance_CrE9ditos.materno)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field codcarpr
				If (GetDropDownValue(Consulta_Avance_CrE9ditos.codcarpr)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Consulta_Avance_CrE9ditos.codcarpr.DropDownValue) Then
					If Not ew_SameStr(Consulta_Avance_CrE9ditos.codcarpr.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Consulta_Avance_CrE9ditos_codcarpr") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field nivel
				If (GetFilterValues(Consulta_Avance_CrE9ditos.nivel)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field estacad
				If (GetDropDownValue(Consulta_Avance_CrE9ditos.estacad)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Consulta_Avance_CrE9ditos.estacad.DropDownValue) Then
					If Not ew_SameStr(Consulta_Avance_CrE9ditos.estacad.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Consulta_Avance_CrE9ditos_estacad") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ano
				If (GetDropDownValue(Consulta_Avance_CrE9ditos.ano)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Consulta_Avance_CrE9ditos.ano.DropDownValue) Then
					If Not ew_SameStr(Consulta_Avance_CrE9ditos.ano.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Consulta_Avance_CrE9ditos_ano") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ano_mat
				If (GetDropDownValue(Consulta_Avance_CrE9ditos.ano_mat)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Consulta_Avance_CrE9ditos.ano_mat.DropDownValue) Then
					If Not ew_SameStr(Consulta_Avance_CrE9ditos.ano_mat.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Consulta_Avance_CrE9ditos_ano_mat") Is Nothing Then
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

			' Field codcli
			GetSessionFilterValues(Consulta_Avance_CrE9ditos.codcli)

			' Field RUT
			GetSessionFilterValues(Consulta_Avance_CrE9ditos.RUT)

			' Field paterno
			GetSessionFilterValues(Consulta_Avance_CrE9ditos.paterno)

			' Field materno
			GetSessionFilterValues(Consulta_Avance_CrE9ditos.materno)

			' Field codcarpr
			GetSessionDropDownValue(Consulta_Avance_CrE9ditos.codcarpr)

			' Field nivel
			GetSessionFilterValues(Consulta_Avance_CrE9ditos.nivel)

			' Field estacad
			GetSessionDropDownValue(Consulta_Avance_CrE9ditos.estacad)

			' Field ano
			GetSessionDropDownValue(Consulta_Avance_CrE9ditos.ano)

			' Field ano_mat
			GetSessionDropDownValue(Consulta_Avance_CrE9ditos.ano_mat)
		End If

		' Call page filter validated event
		Consulta_Avance_CrE9ditos.Page_FilterValidated()

		' Build SQL
		' Field codcli

		BuildExtendedFilter(Consulta_Avance_CrE9ditos.codcli, sFilter)

		' Field RUT
		BuildExtendedFilter(Consulta_Avance_CrE9ditos.RUT, sFilter)

		' Field paterno
		BuildExtendedFilter(Consulta_Avance_CrE9ditos.paterno, sFilter)

		' Field materno
		BuildExtendedFilter(Consulta_Avance_CrE9ditos.materno, sFilter)

		' Field codcarpr
		BuildDropDownFilter(Consulta_Avance_CrE9ditos.codcarpr, sFilter, "")

		' Field nivel
		BuildExtendedFilter(Consulta_Avance_CrE9ditos.nivel, sFilter)

		' Field estacad
		BuildDropDownFilter(Consulta_Avance_CrE9ditos.estacad, sFilter, "")

		' Field ano
		BuildDropDownFilter(Consulta_Avance_CrE9ditos.ano, sFilter, "")

		' Field ano_mat
		BuildDropDownFilter(Consulta_Avance_CrE9ditos.ano_mat, sFilter, "")

		' Save parms to Session
		' Field codcli

		SetSessionFilterValues(Consulta_Avance_CrE9ditos.codcli)

		' Field RUT
		SetSessionFilterValues(Consulta_Avance_CrE9ditos.RUT)

		' Field paterno
		SetSessionFilterValues(Consulta_Avance_CrE9ditos.paterno)

		' Field materno
		SetSessionFilterValues(Consulta_Avance_CrE9ditos.materno)

		' Field codcarpr
		SetSessionDropDownValue(Consulta_Avance_CrE9ditos.codcarpr.DropDownValue, Consulta_Avance_CrE9ditos.codcarpr)

		' Field nivel
		SetSessionFilterValues(Consulta_Avance_CrE9ditos.nivel)

		' Field estacad
		SetSessionDropDownValue(Consulta_Avance_CrE9ditos.estacad.DropDownValue, Consulta_Avance_CrE9ditos.estacad)

		' Field ano
		SetSessionDropDownValue(Consulta_Avance_CrE9ditos.ano.DropDownValue, Consulta_Avance_CrE9ditos.ano)

		' Field ano_mat
		SetSessionDropDownValue(Consulta_Avance_CrE9ditos.ano_mat.DropDownValue, Consulta_Avance_CrE9ditos.ano_mat)

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
		If ew_Session("sv_Consulta_Avance_CrE9ditos_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Consulta_Avance_CrE9ditos_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Consulta_Avance_CrE9ditos_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Consulta_Avance_CrE9ditos_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Consulta_Avance_CrE9ditos_" + parm)
		End If
		If ew_Session("so1_Consulta_Avance_CrE9ditos_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Consulta_Avance_CrE9ditos_" + parm))
		End If
		If ew_Session("sc_Consulta_Avance_CrE9ditos_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Consulta_Avance_CrE9ditos_" + parm))
		End If
		If ew_Session("sv2_Consulta_Avance_CrE9ditos_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Consulta_Avance_CrE9ditos_" + parm)
		End If
		If ew_Session("so2_Consulta_Avance_CrE9ditos_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Consulta_Avance_CrE9ditos_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Consulta_Avance_CrE9ditos_" + parm) = fld.SearchValue
		ew_Session("so1_Consulta_Avance_CrE9ditos_" + parm) = fld.SearchOperator
		ew_Session("sc_Consulta_Avance_CrE9ditos_" + parm) = fld.SearchCondition
		ew_Session("sv2_Consulta_Avance_CrE9ditos_" + parm) = fld.SearchValue2
		ew_Session("so2_Consulta_Avance_CrE9ditos_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Consulta_Avance_CrE9ditos_" + parm) = ""
		ew_Session("so1_Consulta_Avance_CrE9ditos_" + parm) = "="
		ew_Session("sc_Consulta_Avance_CrE9ditos_" + parm) = "AND"
		ew_Session("sv2_Consulta_Avance_CrE9ditos_" + parm) = ""
		ew_Session("so2_Consulta_Avance_CrE9ditos_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(Consulta_Avance_CrE9ditos.nivel.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Consulta_Avance_CrE9ditos.nivel.FldErrMsg()
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
		ew_Session("sel_Consulta_Avance_CrE9ditos_" & parm) = ""
		ew_Session("rf_Consulta_Avance_CrE9ditos_" & parm) = ""
		ew_Session("rt_Consulta_Avance_CrE9ditos_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Consulta_Avance_CrE9ditos.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Consulta_Avance_CrE9ditos_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Consulta_Avance_CrE9ditos_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Consulta_Avance_CrE9ditos_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field codcarpr

			Consulta_Avance_CrE9ditos.codcarpr.DefaultDropDownValue = EWRPT_INIT_VALUE
			Consulta_Avance_CrE9ditos.codcarpr.DropDownValue = Consulta_Avance_CrE9ditos.codcarpr.DefaultDropDownValue

			' Field estacad
			Consulta_Avance_CrE9ditos.estacad.DefaultDropDownValue = EWRPT_INIT_VALUE
			Consulta_Avance_CrE9ditos.estacad.DropDownValue = Consulta_Avance_CrE9ditos.estacad.DefaultDropDownValue

			' Field ano
			Consulta_Avance_CrE9ditos.ano.DefaultDropDownValue = EWRPT_INIT_VALUE
			Consulta_Avance_CrE9ditos.ano.DropDownValue = Consulta_Avance_CrE9ditos.ano.DefaultDropDownValue

			' Field ano_mat
			Consulta_Avance_CrE9ditos.ano_mat.DefaultDropDownValue = EWRPT_INIT_VALUE
			Consulta_Avance_CrE9ditos.ano_mat.DropDownValue = Consulta_Avance_CrE9ditos.ano_mat.DefaultDropDownValue

		' Set up default values for extended filters
			' Field codcli

			SetDefaultExtFilter(Consulta_Avance_CrE9ditos.codcli, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consulta_Avance_CrE9ditos.codcli)	

			' Field RUT
			SetDefaultExtFilter(Consulta_Avance_CrE9ditos.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consulta_Avance_CrE9ditos.RUT)	

			' Field paterno
			SetDefaultExtFilter(Consulta_Avance_CrE9ditos.paterno, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consulta_Avance_CrE9ditos.paterno)	

			' Field materno
			SetDefaultExtFilter(Consulta_Avance_CrE9ditos.materno, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consulta_Avance_CrE9ditos.materno)	

			' Field nivel
			SetDefaultExtFilter(Consulta_Avance_CrE9ditos.nivel, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consulta_Avance_CrE9ditos.nivel)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check codcli extended filter
		If (TextFilterApplied(Consulta_Avance_CrE9ditos.codcli)) Then bFilterExist = True

		' Check RUT extended filter
		If (TextFilterApplied(Consulta_Avance_CrE9ditos.RUT)) Then bFilterExist = True

		' Check paterno extended filter
		If (TextFilterApplied(Consulta_Avance_CrE9ditos.paterno)) Then bFilterExist = True

		' Check materno extended filter
		If (TextFilterApplied(Consulta_Avance_CrE9ditos.materno)) Then bFilterExist = True

		' Check codcarpr dropdown filter
		If (NonTextFilterApplied(Consulta_Avance_CrE9ditos.codcarpr)) Then bFilterExist = True

		' Check nivel extended filter
		If (TextFilterApplied(Consulta_Avance_CrE9ditos.nivel)) Then bFilterExist = True

		' Check estacad dropdown filter
		If (NonTextFilterApplied(Consulta_Avance_CrE9ditos.estacad)) Then bFilterExist = True

		' Check ano dropdown filter
		If (NonTextFilterApplied(Consulta_Avance_CrE9ditos.ano)) Then bFilterExist = True

		' Check ano_mat dropdown filter
		If (NonTextFilterApplied(Consulta_Avance_CrE9ditos.ano_mat)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field codcli
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consulta_Avance_CrE9ditos.codcli, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consulta_Avance_CrE9ditos.codcli.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consulta_Avance_CrE9ditos.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consulta_Avance_CrE9ditos.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field paterno
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consulta_Avance_CrE9ditos.paterno, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consulta_Avance_CrE9ditos.paterno.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field materno
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consulta_Avance_CrE9ditos.materno, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consulta_Avance_CrE9ditos.materno.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field codcarpr
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Consulta_Avance_CrE9ditos.codcarpr, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consulta_Avance_CrE9ditos.codcarpr.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field nivel
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consulta_Avance_CrE9ditos.nivel, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consulta_Avance_CrE9ditos.nivel.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field estacad
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Consulta_Avance_CrE9ditos.estacad, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consulta_Avance_CrE9ditos.estacad.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ano
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Consulta_Avance_CrE9ditos.ano, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consulta_Avance_CrE9ditos.ano.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ano_mat
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Consulta_Avance_CrE9ditos.ano_mat, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consulta_Avance_CrE9ditos.ano_mat.FldCaption() & "<br>"
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
				Consulta_Avance_CrE9ditos.OrderBy = ""
				Consulta_Avance_CrE9ditos.StartGroup = 1
				Consulta_Avance_CrE9ditos.codcli.Sort = ""
				Consulta_Avance_CrE9ditos.RUT.Sort = ""
				Consulta_Avance_CrE9ditos.paterno.Sort = ""
				Consulta_Avance_CrE9ditos.materno.Sort = ""
				Consulta_Avance_CrE9ditos.nombre.Sort = ""
				Consulta_Avance_CrE9ditos.codcarpr.Sort = ""
				Consulta_Avance_CrE9ditos.nivel.Sort = ""
				Consulta_Avance_CrE9ditos.estacad.Sort = ""
				Consulta_Avance_CrE9ditos.ano.Sort = ""
				Consulta_Avance_CrE9ditos.ano_mat.Sort = ""
				Consulta_Avance_CrE9ditos.TotalCredMalla.Sort = ""
				Consulta_Avance_CrE9ditos.NumTotalRamoMalla.Sort = ""
				Consulta_Avance_CrE9ditos.CredAprob.Sort = ""
				Consulta_Avance_CrE9ditos.RamosAprob.Sort = ""
				Consulta_Avance_CrE9ditos.TotalCredFaltantes.Sort = ""
				Consulta_Avance_CrE9ditos.NumRamosFaltantes.Sort = ""
				Consulta_Avance_CrE9ditos.TotalCredMallaEle.Sort = ""
				Consulta_Avance_CrE9ditos.CredAprobEle.Sort = ""
				Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.Sort = ""
				Consulta_Avance_CrE9ditos.TotalCredMallaLC.Sort = ""
				Consulta_Avance_CrE9ditos.CredAprobLC.Sort = ""
				Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Consulta_Avance_CrE9ditos.CurrentOrder = ew_Get("order")
			Consulta_Avance_CrE9ditos.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Consulta_Avance_CrE9ditos.SortSql()
			Consulta_Avance_CrE9ditos.OrderBy = sSortSql
			Consulta_Avance_CrE9ditos.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Consulta_Avance_CrE9ditos.OrderBy)) Then
			Consulta_Avance_CrE9ditos.OrderBy = "[paterno] ASC, [materno] ASC"
			Consulta_Avance_CrE9ditos.paterno.Sort = "ASC"
			Consulta_Avance_CrE9ditos.materno.Sort = "ASC"
		End If
		Return Consulta_Avance_CrE9ditos.OrderBy
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
		Consulta_Avance_CrE9ditos_summary = New crConsulta_Avance_CrE9ditos_summary(Me)
		Consulta_Avance_CrE9ditos_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Consulta_Avance_CrE9ditos_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Consulta_Avance_CrE9ditos_summary IsNot Nothing) Then Consulta_Avance_CrE9ditos_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Consulta_Avance_CrE9ditos_summary = new ewrpt_Page("Consulta_Avance_CrE9ditos_summary");
// page properties
Consulta_Avance_CrE9ditos_summary.PageID = "summary"; // page ID
Consulta_Avance_CrE9ditos_summary.FormID = "fConsulta_Avance_CrE9ditossummaryfilter"; // form ID
var EWRPT_PAGE_ID = Consulta_Avance_CrE9ditos_summary.PageID;
// extend page with ValidateForm function
Consulta_Avance_CrE9ditos_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_nivel;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Consulta_Avance_CrE9ditos.nivel.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Consulta_Avance_CrE9ditos_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Consulta_Avance_CrE9ditos_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Consulta_Avance_CrE9ditos_summary.ValidateRequired = false; // no JavaScript validation
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
<% Consulta_Avance_CrE9ditos_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Consulta_Avance_CrE9ditos.TableCaption() %></h1></div>
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Consulta_Avance_CrE9ditos_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" alt="Exportar a Excel" title="Exportar a Excel" /></a>
<% If (Consulta_Avance_CrE9ditos_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Consulta_Avance_CrE9ditos_summary.ShowMessage() %>
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Consulta_Avance_CrE9ditos.FilterPanelOption = 2 OrElse (Consulta_Avance_CrE9ditos.FilterPanelOption = 3 AndAlso Consulta_Avance_CrE9ditos_summary.FilterApplied) OrElse Consulta_Avance_CrE9ditos_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Consulta_Avance_CrE9ditossmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fConsulta_Avance_CrE9ditossummaryfilter" id="fConsulta_Avance_CrE9ditossummaryfilter" action="Consulta_Avance_CrE9ditossmry.aspx" class="ewForm" onsubmit="return Consulta_Avance_CrE9ditos_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Consulta_Avance_CrE9ditos.nivel.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consulta_Avance_CrE9ditos.codcli.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_codcli" id="sv1_codcli" size="30" maxlength="30" value="<%= ew_HtmlEncode(Consulta_Avance_CrE9ditos.codcli.SearchValue) %>"<%= IIf(Consulta_Avance_CrE9ditos_summary.ClearExtFilter = "Consulta_Avance_CrE9ditos_codcli", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consulta_Avance_CrE9ditos.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="32" value="<%= ew_HtmlEncode(Consulta_Avance_CrE9ditos.RUT.SearchValue) %>"<%= IIf(Consulta_Avance_CrE9ditos_summary.ClearExtFilter = "Consulta_Avance_CrE9ditos_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consulta_Avance_CrE9ditos.paterno.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_paterno" id="sv1_paterno" size="30" maxlength="30" value="<%= ew_HtmlEncode(Consulta_Avance_CrE9ditos.paterno.SearchValue) %>"<%= IIf(Consulta_Avance_CrE9ditos_summary.ClearExtFilter = "Consulta_Avance_CrE9ditos_paterno", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consulta_Avance_CrE9ditos.materno.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_materno" id="sv1_materno" size="30" maxlength="30" value="<%= ew_HtmlEncode(Consulta_Avance_CrE9ditos.materno.SearchValue) %>"<%= IIf(Consulta_Avance_CrE9ditos_summary.ClearExtFilter = "Consulta_Avance_CrE9ditos_materno", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consulta_Avance_CrE9ditos.codcarpr.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_codcarpr" id="sv_codcarpr"<%= IIf(Consulta_Avance_CrE9ditos_summary.ClearExtFilter = "Consulta_Avance_CrE9ditos_codcarpr", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.codcarpr.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Consulta_Avance_CrE9ditos.codcarpr.CustomFilters.Count + Consulta_Avance_CrE9ditos.codcarpr.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Consulta_Avance_CrE9ditos.codcarpr.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "codcarpr")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.codcarpr.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Consulta_Avance_CrE9ditos.codcarpr.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.codcarpr.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consulta_Avance_CrE9ditos.nivel.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_nivel" id="sv1_nivel" size="30" value="<%= ew_HtmlEncode(Consulta_Avance_CrE9ditos.nivel.SearchValue) %>"<%= IIf(Consulta_Avance_CrE9ditos_summary.ClearExtFilter = "Consulta_Avance_CrE9ditos_nivel", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consulta_Avance_CrE9ditos.estacad.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Consulta_Avance_CrE9ditos.estacad.CustomFilters.Count + Consulta_Avance_CrE9ditos.estacad.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Consulta_Avance_CrE9ditos.estacad.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "estacad")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Consulta_Avance_CrE9ditos.estacad.DropDownValue" id="Consulta_Avance_CrE9ditos.estacad.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.estacad.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Consulta_Avance_CrE9ditos.estacad.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_estacad" id="sv_estacad" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.estacad.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consulta_Avance_CrE9ditos.ano.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ano" id="sv_ano"<%= IIf(Consulta_Avance_CrE9ditos_summary.ClearExtFilter = "Consulta_Avance_CrE9ditos_ano", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.ano.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Consulta_Avance_CrE9ditos.ano.CustomFilters.Count + Consulta_Avance_CrE9ditos.ano.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Consulta_Avance_CrE9ditos.ano.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ano")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.ano.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Consulta_Avance_CrE9ditos.ano.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.ano.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consulta_Avance_CrE9ditos.ano_mat.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ano_mat" id="sv_ano_mat"<%= IIf(Consulta_Avance_CrE9ditos_summary.ClearExtFilter = "Consulta_Avance_CrE9ditos_ano_mat", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.ano_mat.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Consulta_Avance_CrE9ditos.ano_mat.CustomFilters.Count + Consulta_Avance_CrE9ditos.ano_mat.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Consulta_Avance_CrE9ditos.ano_mat.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ano_mat")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.ano_mat.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Consulta_Avance_CrE9ditos.ano_mat.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Consulta_Avance_CrE9ditos.ano_mat.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (Consulta_Avance_CrE9ditos.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Consulta_Avance_CrE9ditos_summary.ShowFilterList() %>
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
If (Consulta_Avance_CrE9ditos.ExportAll AndAlso ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then
	Consulta_Avance_CrE9ditos_summary.StopGrp = Consulta_Avance_CrE9ditos_summary.TotalGrps
Else
	Consulta_Avance_CrE9ditos_summary.StopGrp = Consulta_Avance_CrE9ditos_summary.StartGrp + Consulta_Avance_CrE9ditos_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Consulta_Avance_CrE9ditos_summary.StopGrp > Consulta_Avance_CrE9ditos_summary.TotalGrps) Then
	Consulta_Avance_CrE9ditos_summary.StopGrp = Consulta_Avance_CrE9ditos_summary.TotalGrps
End If
Consulta_Avance_CrE9ditos_summary.RecCount = 0

' Get first row
If (Consulta_Avance_CrE9ditos_summary.TotalGrps > 0) Then
	Consulta_Avance_CrE9ditos_summary.GetRow() ' ASPXRPT
	Consulta_Avance_CrE9ditos_summary.GrpCount = 1
End If
While ((Consulta_Avance_CrE9ditos_summary.HasRow AndAlso Consulta_Avance_CrE9ditos_summary.GrpIndex < Consulta_Avance_CrE9ditos_summary.StopGrp) OrElse Consulta_Avance_CrE9ditos_summary.ShowFirstHeader)

	' Show header
	If (Consulta_Avance_CrE9ditos_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.codcli.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.codcli))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.codcli.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.codcli) %>',0);"><%= Consulta_Avance_CrE9ditos.codcli.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.codcli.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.codcli.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.RUT) %>',0);"><%= Consulta_Avance_CrE9ditos.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.paterno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.paterno))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.paterno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.paterno) %>',0);"><%= Consulta_Avance_CrE9ditos.paterno.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.paterno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.paterno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.materno.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.materno))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.materno.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.materno) %>',0);"><%= Consulta_Avance_CrE9ditos.materno.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.materno.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.materno.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.nombre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.nombre))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.nombre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.nombre) %>',0);"><%= Consulta_Avance_CrE9ditos.nombre.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.nombre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.nombre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.codcarpr.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.codcarpr))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.codcarpr.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.codcarpr) %>',0);"><%= Consulta_Avance_CrE9ditos.codcarpr.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.codcarpr.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.codcarpr.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.nivel.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.nivel))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.nivel.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.nivel) %>',0);"><%= Consulta_Avance_CrE9ditos.nivel.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.nivel.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.nivel.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.estacad.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.estacad))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.estacad.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.estacad) %>',0);"><%= Consulta_Avance_CrE9ditos.estacad.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.estacad.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.estacad.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.ano.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.ano))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.ano.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.ano) %>',0);"><%= Consulta_Avance_CrE9ditos.ano.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.ano.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.ano.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.ano_mat.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.ano_mat))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.ano_mat.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.ano_mat) %>',0);"><%= Consulta_Avance_CrE9ditos.ano_mat.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.ano_mat.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.ano_mat.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.TotalCredMalla.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredMalla))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.TotalCredMalla.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredMalla) %>',0);"><%= Consulta_Avance_CrE9ditos.TotalCredMalla.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.TotalCredMalla.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.TotalCredMalla.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.NumTotalRamoMalla.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.NumTotalRamoMalla))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.NumTotalRamoMalla.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.NumTotalRamoMalla) %>',0);"><%= Consulta_Avance_CrE9ditos.NumTotalRamoMalla.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.NumTotalRamoMalla.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.NumTotalRamoMalla.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.CredAprob.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.CredAprob))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.CredAprob.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.CredAprob) %>',0);"><%= Consulta_Avance_CrE9ditos.CredAprob.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.CredAprob.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.CredAprob.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.RamosAprob.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.RamosAprob))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.RamosAprob.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.RamosAprob) %>',0);"><%= Consulta_Avance_CrE9ditos.RamosAprob.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.RamosAprob.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.RamosAprob.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.TotalCredFaltantes.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredFaltantes))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.TotalCredFaltantes.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredFaltantes) %>',0);"><%= Consulta_Avance_CrE9ditos.TotalCredFaltantes.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.TotalCredFaltantes.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.TotalCredFaltantes.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.NumRamosFaltantes.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.NumRamosFaltantes))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.NumRamosFaltantes.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.NumRamosFaltantes) %>',0);"><%= Consulta_Avance_CrE9ditos.NumRamosFaltantes.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.NumRamosFaltantes.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.NumRamosFaltantes.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.TotalCredMallaEle.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredMallaEle))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.TotalCredMallaEle.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredMallaEle) %>',0);"><%= Consulta_Avance_CrE9ditos.TotalCredMallaEle.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.TotalCredMallaEle.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.TotalCredMallaEle.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.CredAprobEle.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.CredAprobEle))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.CredAprobEle.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.CredAprobEle) %>',0);"><%= Consulta_Avance_CrE9ditos.CredAprobEle.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.CredAprobEle.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.CredAprobEle.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredFaltantesEle))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredFaltantesEle) %>',0);"><%= Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.TotalCredMallaLC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredMallaLC))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.TotalCredMallaLC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredMallaLC) %>',0);"><%= Consulta_Avance_CrE9ditos.TotalCredMallaLC.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.TotalCredMallaLC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.TotalCredMallaLC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.CredAprobLC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.CredAprobLC))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.CredAprobLC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.CredAprobLC) %>',0);"><%= Consulta_Avance_CrE9ditos.CredAprobLC.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.CredAprobLC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.CredAprobLC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consulta_Avance_CrE9ditos.Export)) Then %>
<%= Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredFaltantesLC))) Then %>
		<td style="vertical-align: bottom;"><%= Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consulta_Avance_CrE9ditos.SortUrl(Consulta_Avance_CrE9ditos.TotalCredFaltantesLC) %>',0);"><%= Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.FldCaption() %></td><td style="width: 10px;">
		<% If (Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Consulta_Avance_CrE9ditos_summary.ShowFirstHeader = False
	End If
	Consulta_Avance_CrE9ditos_summary.RecCount += 1

		' Render detail row
		Consulta_Avance_CrE9ditos.ResetCSS()
		Consulta_Avance_CrE9ditos.RowType = EWRPT_ROWTYPE_DETAIL
		Consulta_Avance_CrE9ditos_summary.RenderRow()
%>
	<tr<%= Consulta_Avance_CrE9ditos.RowAttributes() %>>
		<td<%= Consulta_Avance_CrE9ditos.codcli.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.codcli.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.codcli.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.RUT.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.RUT.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.RUT.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.paterno.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.paterno.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.paterno.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.materno.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.materno.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.materno.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.nombre.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.nombre.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.nombre.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.codcarpr.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.codcarpr.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.codcarpr.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.nivel.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.nivel.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.nivel.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.estacad.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.estacad.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.estacad.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.ano.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.ano.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.ano.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.ano_mat.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.ano_mat.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.ano_mat.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.TotalCredMalla.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.TotalCredMalla.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.TotalCredMalla.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.NumTotalRamoMalla.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.NumTotalRamoMalla.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.NumTotalRamoMalla.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.CredAprob.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.CredAprob.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.CredAprob.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.RamosAprob.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.RamosAprob.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.RamosAprob.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.TotalCredFaltantes.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.TotalCredFaltantes.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.TotalCredFaltantes.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.NumRamosFaltantes.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.NumRamosFaltantes.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.NumRamosFaltantes.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.TotalCredMallaEle.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.TotalCredMallaEle.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.TotalCredMallaEle.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.CredAprobEle.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.CredAprobEle.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.CredAprobEle.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.TotalCredFaltantesEle.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.TotalCredMallaLC.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.TotalCredMallaLC.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.TotalCredMallaLC.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.CredAprobLC.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.CredAprobLC.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.CredAprobLC.ListViewValue%></div>
</td>
		<td<%= Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.CellAttributes %>>
<div<%= Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.ViewAttributes%>><%= Consulta_Avance_CrE9ditos.TotalCredFaltantesLC.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Consulta_Avance_CrE9ditos_summary.AccumulateSummary()

		' Get next record
		Consulta_Avance_CrE9ditos_summary.GetRow() ' ASPXRPT
		Consulta_Avance_CrE9ditos_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Consulta_Avance_CrE9ditos_summary.TotalGrps > 0) Then
	Consulta_Avance_CrE9ditos.ResetCSS()
	Consulta_Avance_CrE9ditos.RowType = EWRPT_ROWTYPE_TOTAL
	Consulta_Avance_CrE9ditos.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Consulta_Avance_CrE9ditos.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Consulta_Avance_CrE9ditos.RowAttrs("class") = "ewRptGrandSummary"
	Consulta_Avance_CrE9ditos_summary.RenderRow()
%>
	<!-- tr><td colspan="22"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Consulta_Avance_CrE9ditos.RowAttributes() %>><td colspan="22"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Consulta_Avance_CrE9ditos_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Consulta_Avance_CrE9ditos_summary.Pager Is Nothing Then Consulta_Avance_CrE9ditos_summary.Pager = New cPrevNextPager(Consulta_Avance_CrE9ditos_summary.StartGrp, Consulta_Avance_CrE9ditos_summary.DisplayGrps, Consulta_Avance_CrE9ditos_summary.TotalGrps) %>
<% If Consulta_Avance_CrE9ditos_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Consulta_Avance_CrE9ditos_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Consulta_Avance_CrE9ditossmry.aspx?start=<%= Consulta_Avance_CrE9ditos_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Consulta_Avance_CrE9ditos_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Consulta_Avance_CrE9ditossmry.aspx?start=<%= Consulta_Avance_CrE9ditos_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Consulta_Avance_CrE9ditos_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Consulta_Avance_CrE9ditos_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Consulta_Avance_CrE9ditossmry.aspx?start=<%= Consulta_Avance_CrE9ditos_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Consulta_Avance_CrE9ditos_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Consulta_Avance_CrE9ditossmry.aspx?start=<%= Consulta_Avance_CrE9ditos_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Consulta_Avance_CrE9ditos_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Consulta_Avance_CrE9ditos_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Consulta_Avance_CrE9ditos_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Consulta_Avance_CrE9ditos_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Consulta_Avance_CrE9ditos_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Consulta_Avance_CrE9ditos_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Consulta_Avance_CrE9ditos_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Consulta_Avance_CrE9ditos_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Consulta_Avance_CrE9ditos_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Consulta_Avance_CrE9ditos_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Consulta_Avance_CrE9ditos.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
