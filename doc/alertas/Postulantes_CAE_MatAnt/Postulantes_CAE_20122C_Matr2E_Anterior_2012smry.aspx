<%@ Page ClassName="Postulantes_CAE_20122C_Matr2E_Anterior_2012smry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_postul_cae_2012_mat_anterior" %>
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
	Public Postulantes_CAE_20122C_Matr2E_Anterior_2012 As crPostulantes_CAE_20122C_Matr2E_Anterior_2012 = Nothing

	'
	' Table class (for Postulantes CAE 2012, Matr. Anterior 2012)
	'
	Public Class crPostulantes_CAE_20122C_Matr2E_Anterior_2012
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
				Return "Postulantes_CAE_20122C_Matr2E_Anterior_2012"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Postulantes CAE 2012, Matr. Anterior 2012"
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

		Public CODCLI As crField

		Public NOMBRE_C As crField

		Public NivelEstudios As crField

		Public PorcentajeAprob As crField

		Public ESTACAD As crField

		Public ano_ingreso As crField

		Public REGIMEN As crField

		Public ANO_MAT As crField

		Public Jornada_IES As crField

		Public tipo_IES As crField

		Public IES As crField

		Public nombre_IES As crField

		Public Contado_anterior As crField

		Public Contado_posterior As crField

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
			RUT = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			RUT.GroupingFieldId = 1
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""
			RUT.FldGroupByType = ""
			RUT.FldGroupInt = "0"
			RUT.FldGroupSql = ""

			' NOMBRE
			NOMBRE = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			NOMBRE.GroupingFieldId = 4
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""
			NOMBRE.FldGroupByType = ""
			NOMBRE.FldGroupInt = "0"
			NOMBRE.FldGroupSql = ""

			' PATERNO
			PATERNO = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			PATERNO.GroupingFieldId = 2
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""
			PATERNO.FldGroupByType = ""
			PATERNO.FldGroupInt = "0"
			PATERNO.FldGroupSql = ""

			' MATERNO
			MATERNO = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			MATERNO.GroupingFieldId = 3
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""
			MATERNO.FldGroupByType = ""
			MATERNO.FldGroupInt = "0"
			MATERNO.FldGroupSql = ""

			' CODCLI
			CODCLI = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCLI.Page = APage
			CODCLI.ParentPage = APage.ParentPage
			Fields.Add("CODCLI", CODCLI)
			CODCLI.DateFilter = ""
			CODCLI.SqlSelect = ""
			CODCLI.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' NivelEstudios
			NivelEstudios = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_NivelEstudios", "NivelEstudios", "[NivelEstudios]", 3, EWRPT_DATATYPE_NUMBER, -1)
			NivelEstudios.Page = APage
			NivelEstudios.ParentPage = APage.ParentPage
			NivelEstudios.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("NivelEstudios", NivelEstudios)
			NivelEstudios.DateFilter = ""
			NivelEstudios.SqlSelect = ""
			NivelEstudios.SqlOrderBy = ""

			' PorcentajeAprob
			PorcentajeAprob = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_PorcentajeAprob", "PorcentajeAprob", "[PorcentajeAprob]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PorcentajeAprob.Page = APage
			PorcentajeAprob.ParentPage = APage.ParentPage
			PorcentajeAprob.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PorcentajeAprob", PorcentajeAprob)
			PorcentajeAprob.DateFilter = ""
			PorcentajeAprob.SqlSelect = ""
			PorcentajeAprob.SqlOrderBy = ""

			' ESTACAD
			ESTACAD = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTACAD.Page = APage
			ESTACAD.ParentPage = APage.ParentPage
			Fields.Add("ESTACAD", ESTACAD)
			ESTACAD.DateFilter = ""
			ESTACAD.SqlSelect = ""
			ESTACAD.SqlOrderBy = ""

			' ano_ingreso
			ano_ingreso = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_ano_ingreso", "ano_ingreso", "[ano_ingreso]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ano_ingreso.Page = APage
			ano_ingreso.ParentPage = APage.ParentPage
			ano_ingreso.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ano_ingreso", ano_ingreso)
			ano_ingreso.DateFilter = ""
			ano_ingreso.SqlSelect = ""
			ano_ingreso.SqlOrderBy = ""

			' REGIMEN
			REGIMEN = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_REGIMEN", "REGIMEN", "[REGIMEN]", 200, EWRPT_DATATYPE_STRING, -1)
			REGIMEN.Page = APage
			REGIMEN.ParentPage = APage.ParentPage
			Fields.Add("REGIMEN", REGIMEN)
			REGIMEN.DateFilter = ""
			REGIMEN.SqlSelect = ""
			REGIMEN.SqlOrderBy = ""

			' ANO_MAT
			ANO_MAT = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_ANO_MAT", "ANO_MAT", "[ANO_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO_MAT.Page = APage
			ANO_MAT.ParentPage = APage.ParentPage
			ANO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO_MAT", ANO_MAT)
			ANO_MAT.DateFilter = ""
			ANO_MAT.SqlSelect = ""
			ANO_MAT.SqlOrderBy = ""

			' Jornada_IES
			Jornada_IES = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_Jornada_IES", "Jornada_IES", "[Jornada_IES]", 5, EWRPT_DATATYPE_NUMBER, -1)
			Jornada_IES.Page = APage
			Jornada_IES.ParentPage = APage.ParentPage
			Jornada_IES.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Jornada_IES", Jornada_IES)
			Jornada_IES.DateFilter = ""
			Jornada_IES.SqlSelect = ""
			Jornada_IES.SqlOrderBy = ""

			' tipo_IES
			tipo_IES = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_tipo_IES", "tipo_IES", "[tipo_IES]", 5, EWRPT_DATATYPE_NUMBER, -1)
			tipo_IES.Page = APage
			tipo_IES.ParentPage = APage.ParentPage
			tipo_IES.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("tipo_IES", tipo_IES)
			tipo_IES.DateFilter = ""
			tipo_IES.SqlSelect = ""
			tipo_IES.SqlOrderBy = ""

			' IES
			IES = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_IES", "IES", "[IES]", 202, EWRPT_DATATYPE_STRING, -1)
			IES.Page = APage
			IES.ParentPage = APage.ParentPage
			Fields.Add("IES", IES)
			IES.DateFilter = ""
			IES.SqlSelect = ""
			IES.SqlOrderBy = ""

			' nombre_IES
			nombre_IES = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_nombre_IES", "nombre_IES", "[nombre_IES]", 202, EWRPT_DATATYPE_STRING, -1)
			nombre_IES.Page = APage
			nombre_IES.ParentPage = APage.ParentPage
			Fields.Add("nombre_IES", nombre_IES)
			nombre_IES.DateFilter = ""
			nombre_IES.SqlSelect = ""
			nombre_IES.SqlOrderBy = ""

			' Contado_anterior
			Contado_anterior = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_Contado_anterior", "Contado_anterior", "[Contado_anterior]", 5, EWRPT_DATATYPE_NUMBER, -1)
			Contado_anterior.Page = APage
			Contado_anterior.ParentPage = APage.ParentPage
			Contado_anterior.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Contado_anterior", Contado_anterior)
			Contado_anterior.DateFilter = ""
			Contado_anterior.SqlSelect = ""
			Contado_anterior.SqlOrderBy = ""

			' Contado_posterior
			Contado_posterior = new crField("Postulantes_CAE_20122C_Matr2E_Anterior_2012", "Postulantes CAE 2012, Matr. Anterior 2012", "x_Contado_posterior", "Contado_posterior", "[Contado_posterior]", 5, EWRPT_DATATYPE_NUMBER, -1)
			Contado_posterior.Page = APage
			Contado_posterior.ParentPage = APage.ParentPage
			Contado_posterior.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Contado_posterior", Contado_posterior)
			Contado_posterior.DateFilter = ""
			Contado_posterior.SqlSelect = ""
			Contado_posterior.SqlOrderBy = ""
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
				Return "[SEK_CAE_Postul_2012_MatAnterior]"
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
				Return "[RUT] ASC, [PATERNO] ASC, [MATERNO] ASC, [NOMBRE] ASC"
			End Get
		End Property

		' Table Level Group SQL
		Public ReadOnly Property SqlFirstGroupField As String
			Get
				Return "[RUT]"
			End Get
		End Property

		Public ReadOnly Property SqlSelectGroup As String
			Get
				Return "SELECT DISTINCT " + SqlFirstGroupField + " FROM " + SqlFrom
			End Get
		End Property

		Public ReadOnly Property SqlOrderByGroup As String
			Get
				Return "[RUT] ASC"
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
	Public Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary As crPostulantes_CAE_20122C_Matr2E_Anterior_2012_summary

	'
	' Page class
	'
	Public Class crPostulantes_CAE_20122C_Matr2E_Anterior_2012_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.UseTokenInUrl) Then
				sUrl &= "t=" & Postulantes_CAE_20122C_Matr2E_Anterior_2012.TableVar & "&" ' Add page token
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
			If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Postulantes_CAE_20122C_Matr2E_Anterior_2012smry 
			Get
				Return CType(m_ParentPage, Postulantes_CAE_20122C_Matr2E_Anterior_2012smry)
			End Get
		End Property

		' Table object (Postulantes_CAE_20122C_Matr2E_Anterior_2012)
		Public Property Postulantes_CAE_20122C_Matr2E_Anterior_2012 As crPostulantes_CAE_20122C_Matr2E_Anterior_2012 
			Get		
				Return AspNetPage.Postulantes_CAE_20122C_Matr2E_Anterior_2012 ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crPostulantes_CAE_20122C_Matr2E_Anterior_2012)
				AspNetPage.Postulantes_CAE_20122C_Matr2E_Anterior_2012 = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_postul_cae_2012_mat_anterior)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary"
			m_PageObjTypeName = "crPostulantes_CAE_20122C_Matr2E_Anterior_2012_summary"

			' Table name
			m_TableName = "Postulantes CAE 2012, Matr. Anterior 2012"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Postulantes_CAE_20122C_Matr2E_Anterior_2012)
			Postulantes_CAE_20122C_Matr2E_Anterior_2012 = New crPostulantes_CAE_20122C_Matr2E_Anterior_2012(Me)			

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
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = ew_Get("export")
			End If
			gsExport = Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export ' Get export parameter, used in header
			gsExportFile = Postulantes_CAE_20122C_Matr2E_Anterior_2012.TableVar ' Get export file, used in header
			If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "excel") Then
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

		Public Val As Object() = New Object(14) {}

		Public Cnt As Integer()() = New Integer(4)() {}

		Public Smry As Object()() = New Object(4)() {}

		Public Mn As Object()() = New Object(4)() {}

		Public Mx As Object()() = New Object(4)() {}

		Public GrandSmry As Object() = New Object(14) {}

		Public GrandMn As Object() = New Object(14) {}

		Public GrandMx As Object() = New Object(14) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 15 ' No. of fields
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
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.CustomFilters_Load()

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
			Dim sGrpSort As String = ewrpt_UpdateSortFields(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlOrderByGroup, Sort, 2) ' Get grouping field only
			Dim sSql As String = ewrpt_BuildReportSql(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlSelectGroup, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlWhere, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlGroupBy, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlHaving, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlOrderByGroup, Filter, sGrpSort)
			TotalGrps = GetGrpCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.ExportAll AndAlso ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then
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
					Return (Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.CurrentValue) AndAlso Not Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.OldValue)) OrElse _
						(Not Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.CurrentValue) AndAlso Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.OldValue)) OrElse _
						(Not ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupValue(), Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupOldValue()))
				Case 2
					Return (Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.CurrentValue) AndAlso Not Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.OldValue)) OrElse _
						(Not Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.CurrentValue) AndAlso Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.OldValue)) OrElse _
						(Not ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupValue(), Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupOldValue())) OrElse ChkLvlBreak(1) ' Recurse upper level
				Case 3
					Return (Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.CurrentValue) AndAlso Not Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.OldValue)) OrElse _
						(Not Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.CurrentValue) AndAlso Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.OldValue)) OrElse _
						(Not ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupValue(), Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupOldValue())) OrElse ChkLvlBreak(2) ' Recurse upper level
				Case 4
					Return (Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.CurrentValue) AndAlso Not Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.OldValue)) OrElse _
						(Not Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.CurrentValue) AndAlso Convert.IsDBNull(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.OldValue)) OrElse _
						(Not ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupValue(), Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupOldValue())) OrElse ChkLvlBreak(3) ' Recurse upper level
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
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.DbValue = "" ' Init first value
			Else	' Get next group
				GrpIndex += 1
			End If
			Dim Row As OrderedDictionary
			If GrpIndex >= rsgrp.Count Then
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.DbValue = ""
			Else
				Row = DirectCast(rsgrp(GrpIndex), OrderedDictionary)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.DbValue = Row(0)
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
					If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupDbValues.Count > 0) Then
						Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.DbValue = Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupDbValues(Row("RUT"))
					Else
						Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.DbValue = ewrpt_GroupValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT, Row("RUT"))
					End If
				End If
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.DbValue = Row("NOMBRE")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.DbValue = Row("PATERNO")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.DbValue = Row("MATERNO")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.DbValue = Row("CODCLI")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DbValue = Row("NOMBRE_C")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.DbValue = Row("NivelEstudios")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.DbValue = Row("PorcentajeAprob")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DbValue = Row("ESTACAD")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DbValue = Row("ano_ingreso")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.DbValue = Row("REGIMEN")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DbValue = Row("ANO_MAT")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.DbValue = Row("Jornada_IES")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.DbValue = Row("tipo_IES")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.DbValue = Row("IES")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.DbValue = Row("nombre_IES")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.DbValue = Row("Contado_anterior")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.DbValue = Row("Contado_posterior")
				Val(1) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.CurrentValue
				Val(2) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.CurrentValue
				Val(3) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.CurrentValue
				Val(4) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.CurrentValue
				Val(5) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.CurrentValue
				Val(6) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.CurrentValue
				Val(7) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.CurrentValue
				Val(8) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.CurrentValue
				Val(9) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.CurrentValue
				Val(10) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.CurrentValue
				Val(11) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.CurrentValue
				Val(12) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.CurrentValue
				Val(13) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.CurrentValue
				Val(14) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.CurrentValue
			Else
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.DbValue = dr("RUT")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.DbValue = dr("NOMBRE")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.DbValue = dr("PATERNO")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.DbValue = dr("MATERNO")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.DbValue = dr("CODCLI")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DbValue = dr("NOMBRE_C")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.DbValue = dr("NivelEstudios")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.DbValue = dr("PorcentajeAprob")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DbValue = dr("ESTACAD")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DbValue = dr("ano_ingreso")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.DbValue = dr("REGIMEN")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DbValue = dr("ANO_MAT")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.DbValue = dr("Jornada_IES")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.DbValue = dr("tipo_IES")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.DbValue = dr("IES")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.DbValue = dr("nombre_IES")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.DbValue = dr("Contado_anterior")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.DbValue = dr("Contado_posterior")
				Val(1) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.CurrentValue
				Val(2) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.CurrentValue
				Val(3) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.CurrentValue
				Val(4) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.CurrentValue
				Val(5) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.CurrentValue
				Val(6) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.CurrentValue
				Val(7) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.CurrentValue
				Val(8) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.CurrentValue
				Val(9) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.CurrentValue
				Val(10) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.CurrentValue
				Val(11) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.CurrentValue
				Val(12) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.CurrentValue
				Val(13) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.CurrentValue
				Val(14) = Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.CurrentValue
			Else				
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.DbValue = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.DbValue = ""
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
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup = StartGrp
				Else
					StartGrp = Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup
				End If
			Else
				StartGrp = Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup = StartGrp
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
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup = StartGrp
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
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup = StartGrp
			Else				
				If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Postulantes_CAE_20122C_Matr2E_Anterior_2012.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlSelectCount, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlWhere, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlGroupBy, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.Row_Rendering()

			'
			' Render view codes
			'

			If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUT
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupOldValue())
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.CellAttrs("class") = IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowGroupLevel = 1, "ewRptGrpSummary1", "ewRptGrpField1")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT, Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupViewValue)

				' PATERNO
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupOldValue())
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.CellAttrs("class") = IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowGroupLevel = 2, "ewRptGrpSummary2", "ewRptGrpField2")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO, Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupViewValue)

				' MATERNO
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupOldValue())
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.CellAttrs("class") = IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowGroupLevel = 3, "ewRptGrpSummary3", "ewRptGrpField3")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO, Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupViewValue)

				' NOMBRE
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupOldValue())
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.CellAttrs("class") = IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowGroupLevel = 4, "ewRptGrpSummary4", "ewRptGrpField4")
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE, Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupViewValue)

				' CODCLI
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.Summary)

				' NOMBRE_C
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.Summary)

				' NivelEstudios
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.Summary)

				' PorcentajeAprob
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.Summary)

				' ESTACAD
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.Summary)

				' ano_ingreso
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.Summary)

				' REGIMEN
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.Summary)

				' ANO_MAT
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.Summary)

				' Jornada_IES
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.Summary)

				' tipo_IES
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.Summary)

				' IES
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.Summary)

				' nombre_IES
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.Summary)

				' Contado_anterior
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.Summary)

				' Contado_posterior
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.Summary)
			Else

				' RUT
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupValue())
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.CellAttrs("class") = "ewRptGrpField1"
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT, Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupViewValue)
				If (ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupValue(), Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupOldValue()) AndAlso Not ChkLvlBreak(1))
					Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupViewValue = "&nbsp;"
				End If

				' PATERNO
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupValue())
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.CellAttrs("class") = "ewRptGrpField2"
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO, Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupViewValue)
				If (ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupValue(), Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupOldValue()) AndAlso Not ChkLvlBreak(2))
					Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupViewValue = "&nbsp;"
				End If

				' MATERNO
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupValue())
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.CellAttrs("class") = "ewRptGrpField3"
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO, Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupViewValue)
				If (ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupValue(), Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupOldValue()) AndAlso Not ChkLvlBreak(3))
					Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupViewValue = "&nbsp;"
				End If

				' NOMBRE
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupValue())
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.CellAttrs("class") = "ewRptGrpField4"
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE, Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupViewValue)
				If (ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupValue(), Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupOldValue()) AndAlso Not ChkLvlBreak(4))
					Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupViewValue = "&nbsp;"
				End If

				' CODCLI
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NivelEstudios
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PorcentajeAprob
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTACAD
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ano_ingreso
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' REGIMEN
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO_MAT
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Jornada_IES
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tipo_IES
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' IES
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' nombre_IES
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Contado_anterior
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Contado_posterior
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.ViewValue = Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.CurrentValue)
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUT
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.HrefValue = ""

			' PATERNO
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.HrefValue = ""

			' MATERNO
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.HrefValue = ""

			' NOMBRE
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.HrefValue = ""

			' CODCLI
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.HrefValue = ""

			' NOMBRE_C
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.HrefValue = ""

			' NivelEstudios
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.HrefValue = ""

			' PorcentajeAprob
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.HrefValue = ""

			' ESTACAD
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.HrefValue = ""

			' ano_ingreso
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.HrefValue = ""

			' REGIMEN
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.HrefValue = ""

			' ANO_MAT
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.HrefValue = ""

			' Jornada_IES
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.HrefValue = ""

			' tipo_IES
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.HrefValue = ""

			' IES
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.HrefValue = ""

			' nombre_IES
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.HrefValue = ""

			' Contado_anterior
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.HrefValue = ""

			' Contado_posterior
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.HrefValue = ""

			' Call Row_Rendered event
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.Row_Rendered()
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

			' Field NOMBRE_C
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTACAD
			sSelect = "SELECT DISTINCT [ESTACAD] FROM " + Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlFrom
			sOrderBy = "[ESTACAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ano_ingreso
			sSelect = "SELECT DISTINCT [ano_ingreso] FROM " + Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlFrom
			sOrderBy = "[ano_ingreso] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO_MAT
			sSelect = "SELECT DISTINCT [ANO_MAT] FROM " + Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlFrom
			sOrderBy = "[ANO_MAT] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT)

				' Field NOMBRE
				SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE)

				' Field PATERNO
				SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO)

				' Field CODCLI
				SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI)

				' Field NOMBRE_C
				SetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownValue, Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C)

				' Field NivelEstudios
				SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios)

				' Field PorcentajeAprob
				SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob)

				' Field ESTACAD
				SetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownValue, Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD)

				' Field ano_ingreso
				SetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownValue, Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso)

				' Field ANO_MAT
				SetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownValue, Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT
				If (GetFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field CODCLI
				If (GetFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE_C
				If (GetDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Postulantes_CAE_20122C_Matr2E_Anterior_2012_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field NivelEstudios
				If (GetFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PorcentajeAprob
				If (GetFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ESTACAD
				If (GetDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownValue) Then
					If Not ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Postulantes_CAE_20122C_Matr2E_Anterior_2012_ESTACAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ano_ingreso
				If (GetDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownValue) Then
					If Not ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Postulantes_CAE_20122C_Matr2E_Anterior_2012_ano_ingreso") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO_MAT
				If (GetDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownValue) Then
					If Not ew_SameStr(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Postulantes_CAE_20122C_Matr2E_Anterior_2012_ANO_MAT") Is Nothing Then
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
			GetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT)

			' Field NOMBRE
			GetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE)

			' Field PATERNO
			GetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO)

			' Field CODCLI
			GetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI)

			' Field NOMBRE_C
			GetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C)

			' Field NivelEstudios
			GetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios)

			' Field PorcentajeAprob
			GetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob)

			' Field ESTACAD
			GetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD)

			' Field ano_ingreso
			GetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso)

			' Field ANO_MAT
			GetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT)
		End If

		' Call page filter validated event
		Postulantes_CAE_20122C_Matr2E_Anterior_2012.Page_FilterValidated()

		' Build SQL
		' Field RUT

		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO, sFilter)

		' Field CODCLI
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI, sFilter)

		' Field NOMBRE_C
		BuildDropDownFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C, sFilter, "")

		' Field NivelEstudios
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios, sFilter)

		' Field PorcentajeAprob
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob, sFilter)

		' Field ESTACAD
		BuildDropDownFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD, sFilter, "")

		' Field ano_ingreso
		BuildDropDownFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso, sFilter, "")

		' Field ANO_MAT
		BuildDropDownFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT, sFilter, "")

		' Save parms to Session
		' Field RUT

		SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT)

		' Field NOMBRE
		SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE)

		' Field PATERNO
		SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO)

		' Field CODCLI
		SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI)

		' Field NOMBRE_C
		SetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownValue, Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C)

		' Field NivelEstudios
		SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios)

		' Field PorcentajeAprob
		SetSessionFilterValues(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob)

		' Field ESTACAD
		SetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownValue, Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD)

		' Field ano_ingreso
		SetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownValue, Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso)

		' Field ANO_MAT
		SetSessionDropDownValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownValue, Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT)

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
		If ew_Session("sv_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm)
		End If
		If ew_Session("so1_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm))
		End If
		If ew_Session("sc_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm))
		End If
		If ew_Session("sv2_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm)
		End If
		If ew_Session("so2_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = fld.SearchValue
		ew_Session("so1_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = fld.SearchOperator
		ew_Session("sc_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = fld.SearchCondition
		ew_Session("sv2_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = fld.SearchValue2
		ew_Session("so2_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = ""
		ew_Session("so1_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = "="
		ew_Session("sc_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = "AND"
		ew_Session("sv2_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = ""
		ew_Session("so2_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" + parm) = "="
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
		If Not ewrpt_CheckInteger(Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.FldErrMsg()
		End If
		If Not ewrpt_CheckNumber(Convert.ToString(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.FldErrMsg()
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
		ew_Session("sel_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" & parm) = ""
		ew_Session("rf_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" & parm) = ""
		ew_Session("rt_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Postulantes_CAE_20122C_Matr2E_Anterior_2012.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Postulantes_CAE_20122C_Matr2E_Anterior_2012_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBRE_C

			Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownValue = Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DefaultDropDownValue

			' Field ESTACAD
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownValue = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DefaultDropDownValue

			' Field ano_ingreso
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DefaultDropDownValue = EWRPT_INIT_VALUE
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownValue = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DefaultDropDownValue

			' Field ANO_MAT
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DefaultDropDownValue = EWRPT_INIT_VALUE
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownValue = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT)	

			' Field NOMBRE
			SetDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE)	

			' Field PATERNO
			SetDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO)	

			' Field CODCLI
			SetDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI)	

			' Field NivelEstudios
			SetDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios, "USER SELECT", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios)	

			' Field PorcentajeAprob
			SetDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob, "USER SELECT", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT extended filter
		If (TextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO)) Then bFilterExist = True

		' Check CODCLI extended filter
		If (TextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI)) Then bFilterExist = True

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C)) Then bFilterExist = True

		' Check NivelEstudios extended filter
		If (TextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios)) Then bFilterExist = True

		' Check PorcentajeAprob extended filter
		If (TextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob)) Then bFilterExist = True

		' Check ESTACAD dropdown filter
		If (NonTextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD)) Then bFilterExist = True

		' Check ano_ingreso dropdown filter
		If (NonTextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso)) Then bFilterExist = True

		' Check ANO_MAT dropdown filter
		If (NonTextFilterApplied(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT)) Then bFilterExist = True
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
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODCLI
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NivelEstudios
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PorcentajeAprob
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTACAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ano_ingreso
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO_MAT
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.FldCaption() & "<br>"
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
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.OrderBy = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup = 1
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.Sort = ""
				Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.CurrentOrder = ew_Get("order")
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortSql()
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.OrderBy = sSortSql
			Postulantes_CAE_20122C_Matr2E_Anterior_2012.StartGroup = 1
		End If
		Return Postulantes_CAE_20122C_Matr2E_Anterior_2012.OrderBy
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
		Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary = New crPostulantes_CAE_20122C_Matr2E_Anterior_2012_summary(Me)
		Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary IsNot Nothing) Then Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary = new ewrpt_Page("Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary");
// page properties
Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.PageID = "summary"; // page ID
Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.FormID = "fPostulantes_CAE_20122C_Matr2E_Anterior_2012summaryfilter"; // form ID
var EWRPT_PAGE_ID = Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.PageID;
// extend page with ValidateForm function
Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_NivelEstudios;
if (elm && !ewrpt_CheckInteger(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_PorcentajeAprob;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ValidateRequired = false; // no JavaScript validation
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
<% Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.TableCaption() %></h1></div>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ExportExcelUrl %>"><img src="images/excel.png" title="Exportar a Excel" alt="Exportar a Excel" border="0" /></a>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ShowMessage() %>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.FilterPanelOption = 2 OrElse (Postulantes_CAE_20122C_Matr2E_Anterior_2012.FilterPanelOption = 3 AndAlso Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.FilterApplied) OrElse Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Postulantes_CAE_20122C_Matr2E_Anterior_2012smry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fPostulantes_CAE_20122C_Matr2E_Anterior_2012summaryfilter" id="fPostulantes_CAE_20122C_Matr2E_Anterior_2012summaryfilter" action="Postulantes_CAE_20122C_Matr2E_Anterior_2012smry.aspx" class="ewForm" onsubmit="return Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="32" value="<%= ew_HtmlEncode(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.SearchValue) %>"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.SearchValue) %>"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_NOMBRE", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.SearchValue) %>"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.SearchValue) %>"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODCLI" id="sv1_CODCLI" size="30" maxlength="30" value="<%= ew_HtmlEncode(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.SearchValue) %>"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_CODCLI", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.CustomFilters.Count + Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><select name="so1_NivelEstudios" id="so1_NivelEstudios" onchange="ewrpt_SrchOprChanged('so1_NivelEstudios')"><option value="="<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchOperator = "=") Then Response.Write(" selected=""selected""") %>>=</option><option value="<>"<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchOperator = "<>") Then Response.Write(" selected=""selected""") %>><></option><option value="<"<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchOperator = "<") Then Response.Write(" selected=""selected""") %>><</option><option value="<="<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchOperator = "<=") Then Response.Write(" selected=""selected""") %>><=</option><option value=">"<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchOperator = ">") Then Response.Write(" selected=""selected""") %>>></option><option value=">="<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchOperator = ">=") Then Response.Write(" selected=""selected""") %>>>=</option><option value="BETWEEN"<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchOperator = "BETWEEN") Then Response.Write(" selected=""selected""") %>>ENTRE</option></select></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NivelEstudios" id="sv1_NivelEstudios" size="30" value="<%= ew_HtmlEncode(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchValue) %>"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_NivelEstudios", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
					<td><span class="ewRptSearchOpr" style="display: none" id="btw1_NivelEstudios" name="btw1_NivelEstudios">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
					<td><span class="aspnetreportmaker" style="display: none" id="btw1_NivelEstudios" name="btw1_NivelEstudios">
<input type="text" name="sv2_NivelEstudios" id="sv2_NivelEstudios" size="30" value="<%= ew_HtmlEncode(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.SearchValue2) %>"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_NivelEstudios", " class=""ewInputCleared""", "") %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><select name="so1_PorcentajeAprob" id="so1_PorcentajeAprob" onchange="ewrpt_SrchOprChanged('so1_PorcentajeAprob')"><option value="="<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchOperator = "=") Then Response.Write(" selected=""selected""") %>>=</option><option value="<>"<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchOperator = "<>") Then Response.Write(" selected=""selected""") %>><></option><option value="<"<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchOperator = "<") Then Response.Write(" selected=""selected""") %>><</option><option value="<="<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchOperator = "<=") Then Response.Write(" selected=""selected""") %>><=</option><option value=">"<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchOperator = ">") Then Response.Write(" selected=""selected""") %>>></option><option value=">="<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchOperator = ">=") Then Response.Write(" selected=""selected""") %>>>=</option><option value="BETWEEN"<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchOperator = "BETWEEN") Then Response.Write(" selected=""selected""") %>>ENTRE</option></select></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PorcentajeAprob" id="sv1_PorcentajeAprob" size="30" value="<%= ew_HtmlEncode(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchValue) %>"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_PorcentajeAprob", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
					<td><span class="ewRptSearchOpr" style="display: none" id="btw1_PorcentajeAprob" name="btw1_PorcentajeAprob">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
					<td><span class="aspnetreportmaker" style="display: none" id="btw1_PorcentajeAprob" name="btw1_PorcentajeAprob">
<input type="text" name="sv2_PorcentajeAprob" id="sv2_PorcentajeAprob" size="30" value="<%= ew_HtmlEncode(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.SearchValue2) %>"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_PorcentajeAprob", " class=""ewInputCleared""", "") %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.CustomFilters.Count + Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTACAD")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownValue" id="Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTACAD" id="sv_ESTACAD" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ano_ingreso" id="sv_ano_ingreso"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_ano_ingreso", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.CustomFilters.Count + Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ano_ingreso")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO_MAT" id="sv_ANO_MAT"<%= IIf(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ClearExtFilter = "Postulantes_CAE_20122C_Matr2E_Anterior_2012_ANO_MAT", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.CustomFilters.Count + Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO_MAT")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<script type="text/javascript">
ewrpt_SrchOprChanged('so1_NivelEstudios');
ewrpt_SrchOprChanged('so1_PorcentajeAprob');
</script>
<!-- Search form (end) -->
</div>
<br>
<% End If %>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ShowFilterList() %>
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
If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.ExportAll AndAlso ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.StopGrp = Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.TotalGrps
Else
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.StopGrp = Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.StartGrp + Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.StopGrp > Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.TotalGrps) Then
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.StopGrp = Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.TotalGrps
End If
Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.RecCount = 0

' Get first row
If (Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.TotalGrps > 0) Then
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.GetGrpRow(1)
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.GrpCount = 1
End If
While (Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.GrpIndex < Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.StopGrp OrElse Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ShowFirstHeader)

	' Show header
	If (Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export)) Then %>
<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior))) Then %>
		<td style="vertical-align: bottom;"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.SortUrl(Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior) %>',0);"><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.FldCaption() %></td><td style="width: 10px;">
		<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ShowFirstHeader = False
	End If

	' Build detail SQL
	Dim sWhere As String = ewrpt_DetailFilterSQL(Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlFirstGroupField, Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupValue())
	If (ew_NotEmpty(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Filter)) Then
		sWhere = "(" + Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Filter + ") AND (" + sWhere + ")"
	End If
	sSql = ewrpt_BuildReportSql(Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlSelect, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlWhere, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlGroupBy, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlHaving, Postulantes_CAE_20122C_Matr2E_Anterior_2012.SqlOrderBy, sWhere, Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Sort)
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.rs = Conn.GetRows(sSql)
	Dim rsdtlcnt As Integer = Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.rs.Count
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.RowIndex = 0	
	If (rsdtlcnt > 0) Then
		Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.GetRow(1)
	End If

	' Loop detail records
	While (Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.RowIndex < Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.rs.Count) 
		Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.RecCount += 1

		' Render detail row
		Postulantes_CAE_20122C_Matr2E_Anterior_2012.ResetCSS()
		Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowType = EWRPT_ROWTYPE_DETAIL
		Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.RenderRow()
%>
	<tr<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowAttributes() %>>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.CellAttributes %>><div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.ViewAttributes %>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RUT.GroupViewValue %></div></td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.CellAttributes %>><div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.ViewAttributes %>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PATERNO.GroupViewValue %></div></td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.CellAttributes %>><div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.ViewAttributes %>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.MATERNO.GroupViewValue %></div></td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.CellAttributes %>><div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.ViewAttributes %>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE.GroupViewValue %></div></td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.CODCLI.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.NivelEstudios.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.PorcentajeAprob.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ESTACAD.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ano_ingreso.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.REGIMEN.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.ANO_MAT.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Jornada_IES.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.tipo_IES.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.IES.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.nombre_IES.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_anterior.ListViewValue%></div>
</td>
		<td<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.CellAttributes %>>
<div<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.ViewAttributes%>><%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.Contado_posterior.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.AccumulateSummary()

		' Get next record
		Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.GetRow(2)

		' Show Footers
%>
<%
	End While ' End detail records loop
%>
<%

	' Next group
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.GetGrpRow(2)
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.TotalGrps > 0) Then
	Postulantes_CAE_20122C_Matr2E_Anterior_2012.ResetCSS()
	Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowType = EWRPT_ROWTYPE_TOTAL
	Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowAttrs("class") = "ewRptGrandSummary"
	Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.RenderRow()
%>
	<!-- tr><td colspan="18"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012.RowAttributes() %>><td colspan="18"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager Is Nothing Then Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager = New cPrevNextPager(Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.StartGrp, Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.DisplayGrps, Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.TotalGrps) %>
<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Postulantes_CAE_20122C_Matr2E_Anterior_2012smry.aspx?start=<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Postulantes_CAE_20122C_Matr2E_Anterior_2012smry.aspx?start=<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Postulantes_CAE_20122C_Matr2E_Anterior_2012smry.aspx?start=<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Postulantes_CAE_20122C_Matr2E_Anterior_2012smry.aspx?start=<%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Postulantes_CAE_20122C_Matr2E_Anterior_2012_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Postulantes_CAE_20122C_Matr2E_Anterior_2012.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
