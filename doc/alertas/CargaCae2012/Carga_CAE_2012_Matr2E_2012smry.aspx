<%@ Page ClassName="Carga_CAE_2012_Matr2E_2012smry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_cargaCae2012" %>
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
	Public Carga_CAE_2012_Matr2E_2012 As crCarga_CAE_2012_Matr2E_2012 = Nothing

	'
	' Table class (for Carga CAE 2012 Matr. 2012)
	'
	Public Class crCarga_CAE_2012_Matr2E_2012
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
				Return "Carga_CAE_2012_Matr2E_2012"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Carga CAE 2012 Matr. 2012"
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

		Public DV As crField

		Public APELLIDO_PATERNO As crField

		Public APELLIDO_MATERNO As crField

		Public NOMBRES As crField

		Public CD3DIGO_TIPO_IES As crField

		Public CD3DIGO_DE_IES As crField

		Public CD3DIGO_DE_SEDE As crField

		Public CD3DIGO_DE_CARRERA As crField

		Public AD1O_DE_INGRESO As crField

		Public JORNADA As crField

		Public ARANCEL_REAL As crField

		Public ESTACAD As crField

		Public CODCARR As crField

		Public NOMBRE_C As crField

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
			RUT = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
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

			' DV
			DV = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_DV", "DV", "[DV]", 200, EWRPT_DATATYPE_STRING, -1)
			DV.Page = APage
			DV.ParentPage = APage.ParentPage
			DV.GroupingFieldId = 2
			Fields.Add("DV", DV)
			DV.DateFilter = ""
			DV.SqlSelect = ""
			DV.SqlOrderBy = ""
			DV.FldGroupByType = ""
			DV.FldGroupInt = "0"
			DV.FldGroupSql = ""

			' APELLIDO PATERNO
			APELLIDO_PATERNO = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_APELLIDO_PATERNO", "APELLIDO PATERNO", "[APELLIDO PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			APELLIDO_PATERNO.Page = APage
			APELLIDO_PATERNO.ParentPage = APage.ParentPage
			APELLIDO_PATERNO.GroupingFieldId = 3
			Fields.Add("APELLIDO_PATERNO", APELLIDO_PATERNO)
			APELLIDO_PATERNO.DateFilter = ""
			APELLIDO_PATERNO.SqlSelect = ""
			APELLIDO_PATERNO.SqlOrderBy = ""
			APELLIDO_PATERNO.FldGroupByType = ""
			APELLIDO_PATERNO.FldGroupInt = "0"
			APELLIDO_PATERNO.FldGroupSql = ""

			' APELLIDO MATERNO
			APELLIDO_MATERNO = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_APELLIDO_MATERNO", "APELLIDO MATERNO", "[APELLIDO MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			APELLIDO_MATERNO.Page = APage
			APELLIDO_MATERNO.ParentPage = APage.ParentPage
			APELLIDO_MATERNO.GroupingFieldId = 4
			Fields.Add("APELLIDO_MATERNO", APELLIDO_MATERNO)
			APELLIDO_MATERNO.DateFilter = ""
			APELLIDO_MATERNO.SqlSelect = ""
			APELLIDO_MATERNO.SqlOrderBy = ""
			APELLIDO_MATERNO.FldGroupByType = ""
			APELLIDO_MATERNO.FldGroupInt = "0"
			APELLIDO_MATERNO.FldGroupSql = ""

			' NOMBRES
			NOMBRES = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_NOMBRES", "NOMBRES", "[NOMBRES]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRES.Page = APage
			NOMBRES.ParentPage = APage.ParentPage
			NOMBRES.GroupingFieldId = 5
			Fields.Add("NOMBRES", NOMBRES)
			NOMBRES.DateFilter = ""
			NOMBRES.SqlSelect = ""
			NOMBRES.SqlOrderBy = ""
			NOMBRES.FldGroupByType = ""
			NOMBRES.FldGroupInt = "0"
			NOMBRES.FldGroupSql = ""

			' CÓDIGO TIPO IES
			CD3DIGO_TIPO_IES = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_CD3DIGO_TIPO_IES", "CÓDIGO TIPO IES", "[CÓDIGO TIPO IES]", 5, EWRPT_DATATYPE_NUMBER, -1)
			CD3DIGO_TIPO_IES.Page = APage
			CD3DIGO_TIPO_IES.ParentPage = APage.ParentPage
			CD3DIGO_TIPO_IES.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CD3DIGO_TIPO_IES", CD3DIGO_TIPO_IES)
			CD3DIGO_TIPO_IES.DateFilter = ""
			CD3DIGO_TIPO_IES.SqlSelect = ""
			CD3DIGO_TIPO_IES.SqlOrderBy = ""

			' CÓDIGO DE IES
			CD3DIGO_DE_IES = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_CD3DIGO_DE_IES", "CÓDIGO DE IES", "[CÓDIGO DE IES]", 202, EWRPT_DATATYPE_STRING, -1)
			CD3DIGO_DE_IES.Page = APage
			CD3DIGO_DE_IES.ParentPage = APage.ParentPage
			Fields.Add("CD3DIGO_DE_IES", CD3DIGO_DE_IES)
			CD3DIGO_DE_IES.DateFilter = ""
			CD3DIGO_DE_IES.SqlSelect = ""
			CD3DIGO_DE_IES.SqlOrderBy = ""

			' CÓDIGO DE SEDE
			CD3DIGO_DE_SEDE = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_CD3DIGO_DE_SEDE", "CÓDIGO DE SEDE", "[CÓDIGO DE SEDE]", 202, EWRPT_DATATYPE_STRING, -1)
			CD3DIGO_DE_SEDE.Page = APage
			CD3DIGO_DE_SEDE.ParentPage = APage.ParentPage
			Fields.Add("CD3DIGO_DE_SEDE", CD3DIGO_DE_SEDE)
			CD3DIGO_DE_SEDE.DateFilter = ""
			CD3DIGO_DE_SEDE.SqlSelect = ""
			CD3DIGO_DE_SEDE.SqlOrderBy = ""

			' CÓDIGO DE CARRERA
			CD3DIGO_DE_CARRERA = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_CD3DIGO_DE_CARRERA", "CÓDIGO DE CARRERA", "[CÓDIGO DE CARRERA]", 202, EWRPT_DATATYPE_STRING, -1)
			CD3DIGO_DE_CARRERA.Page = APage
			CD3DIGO_DE_CARRERA.ParentPage = APage.ParentPage
			Fields.Add("CD3DIGO_DE_CARRERA", CD3DIGO_DE_CARRERA)
			CD3DIGO_DE_CARRERA.DateFilter = ""
			CD3DIGO_DE_CARRERA.SqlSelect = ""
			CD3DIGO_DE_CARRERA.SqlOrderBy = ""

			' AÑO DE INGRESO
			AD1O_DE_INGRESO = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_AD1O_DE_INGRESO", "AÑO DE INGRESO", "[AÑO DE INGRESO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			AD1O_DE_INGRESO.Page = APage
			AD1O_DE_INGRESO.ParentPage = APage.ParentPage
			AD1O_DE_INGRESO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("AD1O_DE_INGRESO", AD1O_DE_INGRESO)
			AD1O_DE_INGRESO.DateFilter = ""
			AD1O_DE_INGRESO.SqlSelect = ""
			AD1O_DE_INGRESO.SqlOrderBy = ""

			' JORNADA
			JORNADA = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_JORNADA", "JORNADA", "[JORNADA]", 5, EWRPT_DATATYPE_NUMBER, -1)
			JORNADA.Page = APage
			JORNADA.ParentPage = APage.ParentPage
			JORNADA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("JORNADA", JORNADA)
			JORNADA.DateFilter = ""
			JORNADA.SqlSelect = ""
			JORNADA.SqlOrderBy = ""

			' ARANCEL REAL
			ARANCEL_REAL = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_ARANCEL_REAL", "ARANCEL REAL", "[ARANCEL REAL]", 5, EWRPT_DATATYPE_NUMBER, -1)
			ARANCEL_REAL.Page = APage
			ARANCEL_REAL.ParentPage = APage.ParentPage
			ARANCEL_REAL.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ARANCEL_REAL", ARANCEL_REAL)
			ARANCEL_REAL.DateFilter = ""
			ARANCEL_REAL.SqlSelect = ""
			ARANCEL_REAL.SqlOrderBy = ""

			' ESTACAD
			ESTACAD = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTACAD.Page = APage
			ESTACAD.ParentPage = APage.ParentPage
			Fields.Add("ESTACAD", ESTACAD)
			ESTACAD.DateFilter = ""
			ESTACAD.SqlSelect = ""
			ESTACAD.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("Carga_CAE_2012_Matr2E_2012", "Carga CAE 2012 Matr. 2012", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""
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
				Return "[SEK_CAE_Carga_Mat2012]"
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
				Return "[RUT] ASC, [DV] ASC, [APELLIDO PATERNO] ASC, [APELLIDO MATERNO] ASC, [NOMBRES] ASC"
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
	Public Carga_CAE_2012_Matr2E_2012_summary As crCarga_CAE_2012_Matr2E_2012_summary

	'
	' Page class
	'
	Public Class crCarga_CAE_2012_Matr2E_2012_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Carga_CAE_2012_Matr2E_2012.UseTokenInUrl) Then
				sUrl &= "t=" & Carga_CAE_2012_Matr2E_2012.TableVar & "&" ' Add page token
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
			If (Carga_CAE_2012_Matr2E_2012.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Carga_CAE_2012_Matr2E_2012.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Carga_CAE_2012_Matr2E_2012.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Carga_CAE_2012_Matr2E_2012smry 
			Get
				Return CType(m_ParentPage, Carga_CAE_2012_Matr2E_2012smry)
			End Get
		End Property

		' Table object (Carga_CAE_2012_Matr2E_2012)
		Public Property Carga_CAE_2012_Matr2E_2012 As crCarga_CAE_2012_Matr2E_2012 
			Get		
				Return AspNetPage.Carga_CAE_2012_Matr2E_2012 ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crCarga_CAE_2012_Matr2E_2012)
				AspNetPage.Carga_CAE_2012_Matr2E_2012 = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_cargaCae2012)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Carga_CAE_2012_Matr2E_2012_summary"
			m_PageObjTypeName = "crCarga_CAE_2012_Matr2E_2012_summary"

			' Table name
			m_TableName = "Carga CAE 2012 Matr. 2012"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Carga_CAE_2012_Matr2E_2012)
			Carga_CAE_2012_Matr2E_2012 = New crCarga_CAE_2012_Matr2E_2012(Me)			

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
				Carga_CAE_2012_Matr2E_2012.Export = ew_Get("export")
			End If
			gsExport = Carga_CAE_2012_Matr2E_2012.Export ' Get export parameter, used in header
			gsExportFile = Carga_CAE_2012_Matr2E_2012.TableVar ' Get export file, used in header
			If (Carga_CAE_2012_Matr2E_2012.Export = "excel") Then
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

		Public Val As Object() = New Object(10) {}

		Public Cnt As Integer()() = New Integer(5)() {}

		Public Smry As Object()() = New Object(5)() {}

		Public Mn As Object()() = New Object(5)() {}

		Public Mx As Object()() = New Object(5)() {}

		Public GrandSmry As Object() = New Object(10) {}

		Public GrandMn As Object() = New Object(10) {}

		Public GrandMx As Object() = New Object(10) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 11 ' No. of fields
			Dim nGrps As Integer = 6 ' No. of groups (level 0 used for grand total)
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
			Carga_CAE_2012_Matr2E_2012.CustomFilters_Load()

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
			Dim sGrpSort As String = ewrpt_UpdateSortFields(Carga_CAE_2012_Matr2E_2012.SqlOrderByGroup, Sort, 2) ' Get grouping field only
			Dim sSql As String = ewrpt_BuildReportSql(Carga_CAE_2012_Matr2E_2012.SqlSelectGroup, Carga_CAE_2012_Matr2E_2012.SqlWhere, Carga_CAE_2012_Matr2E_2012.SqlGroupBy, Carga_CAE_2012_Matr2E_2012.SqlHaving, Carga_CAE_2012_Matr2E_2012.SqlOrderByGroup, Filter, sGrpSort)
			TotalGrps = GetGrpCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Carga_CAE_2012_Matr2E_2012.ExportAll AndAlso ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then
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
					Return (Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.RUT.CurrentValue) AndAlso Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.RUT.OldValue)) OrElse _
						(Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.RUT.CurrentValue) AndAlso Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.RUT.OldValue)) OrElse _
						(Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.RUT.GroupValue(), Carga_CAE_2012_Matr2E_2012.RUT.GroupOldValue()))
				Case 2
					Return (Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.DV.CurrentValue) AndAlso Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.DV.OldValue)) OrElse _
						(Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.DV.CurrentValue) AndAlso Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.DV.OldValue)) OrElse _
						(Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.DV.GroupValue(), Carga_CAE_2012_Matr2E_2012.DV.GroupOldValue())) OrElse ChkLvlBreak(1) ' Recurse upper level
				Case 3
					Return (Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.CurrentValue) AndAlso Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.OldValue)) OrElse _
						(Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.CurrentValue) AndAlso Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.OldValue)) OrElse _
						(Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupValue(), Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupOldValue())) OrElse ChkLvlBreak(2) ' Recurse upper level
				Case 4
					Return (Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.CurrentValue) AndAlso Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.OldValue)) OrElse _
						(Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.CurrentValue) AndAlso Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.OldValue)) OrElse _
						(Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupValue(), Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupOldValue())) OrElse ChkLvlBreak(3) ' Recurse upper level
				Case 5
					Return (Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.NOMBRES.CurrentValue) AndAlso Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.NOMBRES.OldValue)) OrElse _
						(Not Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.NOMBRES.CurrentValue) AndAlso Convert.IsDBNull(Carga_CAE_2012_Matr2E_2012.NOMBRES.OldValue)) OrElse _
						(Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupValue(), Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupOldValue())) OrElse ChkLvlBreak(4) ' Recurse upper level
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
				Carga_CAE_2012_Matr2E_2012.RUT.DbValue = "" ' Init first value
			Else	' Get next group
				GrpIndex += 1
			End If
			Dim Row As OrderedDictionary
			If GrpIndex >= rsgrp.Count Then
				Carga_CAE_2012_Matr2E_2012.RUT.DbValue = ""
			Else
				Row = DirectCast(rsgrp(GrpIndex), OrderedDictionary)
				Carga_CAE_2012_Matr2E_2012.RUT.DbValue = Row(0)
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
					If (Carga_CAE_2012_Matr2E_2012.RUT.GroupDbValues.Count > 0) Then
						Carga_CAE_2012_Matr2E_2012.RUT.DbValue = Carga_CAE_2012_Matr2E_2012.RUT.GroupDbValues(Row("RUT"))
					Else
						Carga_CAE_2012_Matr2E_2012.RUT.DbValue = ewrpt_GroupValue(Carga_CAE_2012_Matr2E_2012.RUT, Row("RUT"))
					End If
				End If
				Carga_CAE_2012_Matr2E_2012.DV.DbValue = Row("DV")
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.DbValue = Row("APELLIDO PATERNO")
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.DbValue = Row("APELLIDO MATERNO")
				Carga_CAE_2012_Matr2E_2012.NOMBRES.DbValue = Row("NOMBRES")
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DbValue = Row("CÓDIGO TIPO IES")
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DbValue = Row("CÓDIGO DE IES")
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DbValue = Row("CÓDIGO DE SEDE")
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DbValue = Row("CÓDIGO DE CARRERA")
				Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DbValue = Row("AÑO DE INGRESO")
				Carga_CAE_2012_Matr2E_2012.JORNADA.DbValue = Row("JORNADA")
				Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.DbValue = Row("ARANCEL REAL")
				Carga_CAE_2012_Matr2E_2012.ESTACAD.DbValue = Row("ESTACAD")
				Carga_CAE_2012_Matr2E_2012.CODCARR.DbValue = Row("CODCARR")
				Carga_CAE_2012_Matr2E_2012.NOMBRE_C.DbValue = Row("NOMBRE_C")
				Val(1) = Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.CurrentValue
				Val(2) = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.CurrentValue
				Val(3) = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.CurrentValue
				Val(4) = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.CurrentValue
				Val(5) = Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.CurrentValue
				Val(6) = Carga_CAE_2012_Matr2E_2012.JORNADA.CurrentValue
				Val(7) = Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.CurrentValue
				Val(8) = Carga_CAE_2012_Matr2E_2012.ESTACAD.CurrentValue
				Val(9) = Carga_CAE_2012_Matr2E_2012.CODCARR.CurrentValue
				Val(10) = Carga_CAE_2012_Matr2E_2012.NOMBRE_C.CurrentValue
			Else
				Carga_CAE_2012_Matr2E_2012.RUT.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.DV.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.NOMBRES.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.JORNADA.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.ESTACAD.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CODCARR.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.NOMBRE_C.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Carga_CAE_2012_Matr2E_2012.RUT.DbValue = dr("RUT")
				Carga_CAE_2012_Matr2E_2012.DV.DbValue = dr("DV")
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.DbValue = dr("APELLIDO PATERNO")
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.DbValue = dr("APELLIDO MATERNO")
				Carga_CAE_2012_Matr2E_2012.NOMBRES.DbValue = dr("NOMBRES")
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DbValue = dr("CÓDIGO TIPO IES")
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DbValue = dr("CÓDIGO DE IES")
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DbValue = dr("CÓDIGO DE SEDE")
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DbValue = dr("CÓDIGO DE CARRERA")
				Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DbValue = dr("AÑO DE INGRESO")
				Carga_CAE_2012_Matr2E_2012.JORNADA.DbValue = dr("JORNADA")
				Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.DbValue = dr("ARANCEL REAL")
				Carga_CAE_2012_Matr2E_2012.ESTACAD.DbValue = dr("ESTACAD")
				Carga_CAE_2012_Matr2E_2012.CODCARR.DbValue = dr("CODCARR")
				Carga_CAE_2012_Matr2E_2012.NOMBRE_C.DbValue = dr("NOMBRE_C")
				Val(1) = Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.CurrentValue
				Val(2) = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.CurrentValue
				Val(3) = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.CurrentValue
				Val(4) = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.CurrentValue
				Val(5) = Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.CurrentValue
				Val(6) = Carga_CAE_2012_Matr2E_2012.JORNADA.CurrentValue
				Val(7) = Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.CurrentValue
				Val(8) = Carga_CAE_2012_Matr2E_2012.ESTACAD.CurrentValue
				Val(9) = Carga_CAE_2012_Matr2E_2012.CODCARR.CurrentValue
				Val(10) = Carga_CAE_2012_Matr2E_2012.NOMBRE_C.CurrentValue
			Else				
				Carga_CAE_2012_Matr2E_2012.DV.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.NOMBRES.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.JORNADA.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.ESTACAD.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.CODCARR.DbValue = ""
				Carga_CAE_2012_Matr2E_2012.NOMBRE_C.DbValue = ""
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
				Carga_CAE_2012_Matr2E_2012.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Carga_CAE_2012_Matr2E_2012.StartGroup = StartGrp
				Else
					StartGrp = Carga_CAE_2012_Matr2E_2012.StartGroup
				End If
			Else
				StartGrp = Carga_CAE_2012_Matr2E_2012.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Carga_CAE_2012_Matr2E_2012.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Carga_CAE_2012_Matr2E_2012.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Carga_CAE_2012_Matr2E_2012.StartGroup = StartGrp
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
			Carga_CAE_2012_Matr2E_2012.StartGroup = StartGrp
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
				Carga_CAE_2012_Matr2E_2012.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Carga_CAE_2012_Matr2E_2012.StartGroup = StartGrp
			Else				
				If (Carga_CAE_2012_Matr2E_2012.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Carga_CAE_2012_Matr2E_2012.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Carga_CAE_2012_Matr2E_2012.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Carga_CAE_2012_Matr2E_2012.SqlSelectCount, Carga_CAE_2012_Matr2E_2012.SqlWhere, Carga_CAE_2012_Matr2E_2012.SqlGroupBy, Carga_CAE_2012_Matr2E_2012.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Carga_CAE_2012_Matr2E_2012.Row_Rendering()

			'
			' Render view codes
			'

			If (Carga_CAE_2012_Matr2E_2012.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUT
				Carga_CAE_2012_Matr2E_2012.RUT.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.RUT.GroupOldValue())
				Carga_CAE_2012_Matr2E_2012.RUT.CellAttrs("class") = IIf(Carga_CAE_2012_Matr2E_2012.RowGroupLevel = 1, "ewRptGrpSummary1", "ewRptGrpField1")
				Carga_CAE_2012_Matr2E_2012.RUT.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.RUT, Carga_CAE_2012_Matr2E_2012.RUT.GroupViewValue)

				' DV
				Carga_CAE_2012_Matr2E_2012.DV.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.DV.GroupOldValue())
				Carga_CAE_2012_Matr2E_2012.DV.CellAttrs("class") = IIf(Carga_CAE_2012_Matr2E_2012.RowGroupLevel = 2, "ewRptGrpSummary2", "ewRptGrpField2")
				Carga_CAE_2012_Matr2E_2012.DV.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.DV, Carga_CAE_2012_Matr2E_2012.DV.GroupViewValue)

				' APELLIDO PATERNO
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupOldValue())
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.CellAttrs("class") = IIf(Carga_CAE_2012_Matr2E_2012.RowGroupLevel = 3, "ewRptGrpSummary3", "ewRptGrpField3")
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO, Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupViewValue)

				' APELLIDO MATERNO
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupOldValue())
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.CellAttrs("class") = IIf(Carga_CAE_2012_Matr2E_2012.RowGroupLevel = 4, "ewRptGrpSummary4", "ewRptGrpField4")
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO, Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupViewValue)

				' NOMBRES
				Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupOldValue())
				Carga_CAE_2012_Matr2E_2012.NOMBRES.CellAttrs("class") = IIf(Carga_CAE_2012_Matr2E_2012.RowGroupLevel = 5, "ewRptGrpSummary5", "ewRptGrpField5")
				Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.NOMBRES, Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupViewValue)

				' CÓDIGO TIPO IES
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.Summary)

				' CÓDIGO DE IES
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.Summary)

				' CÓDIGO DE SEDE
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.Summary)

				' CÓDIGO DE CARRERA
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.Summary)

				' AÑO DE INGRESO
				Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.Summary)

				' JORNADA
				Carga_CAE_2012_Matr2E_2012.JORNADA.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.JORNADA.Summary)

				' ARANCEL REAL
				Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.Summary)

				' ESTACAD
				Carga_CAE_2012_Matr2E_2012.ESTACAD.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.ESTACAD.Summary)

				' CODCARR
				Carga_CAE_2012_Matr2E_2012.CODCARR.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CODCARR.Summary)

				' NOMBRE_C
				Carga_CAE_2012_Matr2E_2012.NOMBRE_C.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.NOMBRE_C.Summary)
			Else

				' RUT
				Carga_CAE_2012_Matr2E_2012.RUT.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.RUT.GroupValue())
				Carga_CAE_2012_Matr2E_2012.RUT.CellAttrs("class") = "ewRptGrpField1"
				Carga_CAE_2012_Matr2E_2012.RUT.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.RUT, Carga_CAE_2012_Matr2E_2012.RUT.GroupViewValue)
				If (ew_SameStr(Carga_CAE_2012_Matr2E_2012.RUT.GroupValue(), Carga_CAE_2012_Matr2E_2012.RUT.GroupOldValue()) AndAlso Not ChkLvlBreak(1))
					Carga_CAE_2012_Matr2E_2012.RUT.GroupViewValue = "&nbsp;"
				End If

				' DV
				Carga_CAE_2012_Matr2E_2012.DV.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.DV.GroupValue())
				Carga_CAE_2012_Matr2E_2012.DV.CellAttrs("class") = "ewRptGrpField2"
				Carga_CAE_2012_Matr2E_2012.DV.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.DV, Carga_CAE_2012_Matr2E_2012.DV.GroupViewValue)
				If (ew_SameStr(Carga_CAE_2012_Matr2E_2012.DV.GroupValue(), Carga_CAE_2012_Matr2E_2012.DV.GroupOldValue()) AndAlso Not ChkLvlBreak(2))
					Carga_CAE_2012_Matr2E_2012.DV.GroupViewValue = "&nbsp;"
				End If

				' APELLIDO PATERNO
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupValue())
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.CellAttrs("class") = "ewRptGrpField3"
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO, Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupViewValue)
				If (ew_SameStr(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupValue(), Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupOldValue()) AndAlso Not ChkLvlBreak(3))
					Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupViewValue = "&nbsp;"
				End If

				' APELLIDO MATERNO
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupValue())
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.CellAttrs("class") = "ewRptGrpField4"
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO, Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupViewValue)
				If (ew_SameStr(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupValue(), Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupOldValue()) AndAlso Not ChkLvlBreak(4))
					Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupViewValue = "&nbsp;"
				End If

				' NOMBRES
				Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupValue())
				Carga_CAE_2012_Matr2E_2012.NOMBRES.CellAttrs("class") = "ewRptGrpField5"
				Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupViewValue = ParentPage.ewrpt_DisplayGroupValue(Carga_CAE_2012_Matr2E_2012.NOMBRES, Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupViewValue)
				If (ew_SameStr(Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupValue(), Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupOldValue()) AndAlso Not ChkLvlBreak(5))
					Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupViewValue = "&nbsp;"
				End If

				' CÓDIGO TIPO IES
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CÓDIGO DE IES
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CÓDIGO DE SEDE
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CÓDIGO DE CARRERA
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' AÑO DE INGRESO
				Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' JORNADA
				Carga_CAE_2012_Matr2E_2012.JORNADA.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.JORNADA.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.JORNADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ARANCEL REAL
				Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTACAD
				Carga_CAE_2012_Matr2E_2012.ESTACAD.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.ESTACAD.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.ESTACAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Carga_CAE_2012_Matr2E_2012.CODCARR.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.CODCARR.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				Carga_CAE_2012_Matr2E_2012.NOMBRE_C.ViewValue = Convert.ToString(Carga_CAE_2012_Matr2E_2012.NOMBRE_C.CurrentValue)
				Carga_CAE_2012_Matr2E_2012.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUT
			Carga_CAE_2012_Matr2E_2012.RUT.HrefValue = ""

			' DV
			Carga_CAE_2012_Matr2E_2012.DV.HrefValue = ""

			' APELLIDO PATERNO
			Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.HrefValue = ""

			' APELLIDO MATERNO
			Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.HrefValue = ""

			' NOMBRES
			Carga_CAE_2012_Matr2E_2012.NOMBRES.HrefValue = ""

			' CÓDIGO TIPO IES
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.HrefValue = ""

			' CÓDIGO DE IES
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.HrefValue = ""

			' CÓDIGO DE SEDE
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.HrefValue = ""

			' CÓDIGO DE CARRERA
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.HrefValue = ""

			' AÑO DE INGRESO
			Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.HrefValue = ""

			' JORNADA
			Carga_CAE_2012_Matr2E_2012.JORNADA.HrefValue = ""

			' ARANCEL REAL
			Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.HrefValue = ""

			' ESTACAD
			Carga_CAE_2012_Matr2E_2012.ESTACAD.HrefValue = ""

			' CODCARR
			Carga_CAE_2012_Matr2E_2012.CODCARR.HrefValue = ""

			' NOMBRE_C
			Carga_CAE_2012_Matr2E_2012.NOMBRE_C.HrefValue = ""

			' Call Row_Rendered event
			Carga_CAE_2012_Matr2E_2012.Row_Rendered()
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

			' Field CÓDIGO TIPO IES
			sSelect = "SELECT DISTINCT [CÓDIGO TIPO IES] FROM " + Carga_CAE_2012_Matr2E_2012.SqlFrom
			sOrderBy = "[CÓDIGO TIPO IES] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Carga_CAE_2012_Matr2E_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CÓDIGO DE IES
			sSelect = "SELECT DISTINCT [CÓDIGO DE IES] FROM " + Carga_CAE_2012_Matr2E_2012.SqlFrom
			sOrderBy = "[CÓDIGO DE IES] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Carga_CAE_2012_Matr2E_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CÓDIGO DE SEDE
			sSelect = "SELECT DISTINCT [CÓDIGO DE SEDE] FROM " + Carga_CAE_2012_Matr2E_2012.SqlFrom
			sOrderBy = "[CÓDIGO DE SEDE] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Carga_CAE_2012_Matr2E_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CÓDIGO DE CARRERA
			sSelect = "SELECT DISTINCT [CÓDIGO DE CARRERA] FROM " + Carga_CAE_2012_Matr2E_2012.SqlFrom
			sOrderBy = "[CÓDIGO DE CARRERA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Carga_CAE_2012_Matr2E_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field AÑO DE INGRESO
			sSelect = "SELECT DISTINCT [AÑO DE INGRESO] FROM " + Carga_CAE_2012_Matr2E_2012.SqlFrom
			sOrderBy = "[AÑO DE INGRESO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Carga_CAE_2012_Matr2E_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field JORNADA
			sSelect = "SELECT DISTINCT [JORNADA] FROM " + Carga_CAE_2012_Matr2E_2012.SqlFrom
			sOrderBy = "[JORNADA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Carga_CAE_2012_Matr2E_2012.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.RUT)

				' Field APELLIDO PATERNO
				SetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO)

				' Field APELLIDO MATERNO
				SetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO)

				' Field NOMBRES
				SetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.NOMBRES)

				' Field CÓDIGO TIPO IES
				SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownValue, Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES)

				' Field CÓDIGO DE IES
				SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownValue, Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES)

				' Field CÓDIGO DE SEDE
				SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownValue, Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE)

				' Field CÓDIGO DE CARRERA
				SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownValue, Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA)

				' Field AÑO DE INGRESO
				SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownValue, Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO)

				' Field JORNADA
				SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownValue, Carga_CAE_2012_Matr2E_2012.JORNADA)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT
				If (GetFilterValues(Carga_CAE_2012_Matr2E_2012.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field APELLIDO PATERNO
				If (GetFilterValues(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field APELLIDO MATERNO
				If (GetFilterValues(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRES
				If (GetFilterValues(Carga_CAE_2012_Matr2E_2012.NOMBRES)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field CÓDIGO TIPO IES
				If (GetDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownValue) Then
					If Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Carga_CAE_2012_Matr2E_2012_CD3DIGO_TIPO_IES") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CÓDIGO DE IES
				If (GetDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownValue) Then
					If Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Carga_CAE_2012_Matr2E_2012_CD3DIGO_DE_IES") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CÓDIGO DE SEDE
				If (GetDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownValue) Then
					If Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Carga_CAE_2012_Matr2E_2012_CD3DIGO_DE_SEDE") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CÓDIGO DE CARRERA
				If (GetDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownValue) Then
					If Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Carga_CAE_2012_Matr2E_2012_CD3DIGO_DE_CARRERA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field AÑO DE INGRESO
				If (GetDropDownValue(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownValue) Then
					If Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Carga_CAE_2012_Matr2E_2012_AD1O_DE_INGRESO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field JORNADA
				If (GetDropDownValue(Carga_CAE_2012_Matr2E_2012.JORNADA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownValue) Then
					If Not ew_SameStr(Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Carga_CAE_2012_Matr2E_2012_JORNADA") Is Nothing Then
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
			GetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.RUT)

			' Field APELLIDO PATERNO
			GetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO)

			' Field APELLIDO MATERNO
			GetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO)

			' Field NOMBRES
			GetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.NOMBRES)

			' Field CÓDIGO TIPO IES
			GetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES)

			' Field CÓDIGO DE IES
			GetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES)

			' Field CÓDIGO DE SEDE
			GetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE)

			' Field CÓDIGO DE CARRERA
			GetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA)

			' Field AÑO DE INGRESO
			GetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO)

			' Field JORNADA
			GetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.JORNADA)
		End If

		' Call page filter validated event
		Carga_CAE_2012_Matr2E_2012.Page_FilterValidated()

		' Build SQL
		' Field RUT

		BuildExtendedFilter(Carga_CAE_2012_Matr2E_2012.RUT, sFilter)

		' Field APELLIDO PATERNO
		BuildExtendedFilter(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO, sFilter)

		' Field APELLIDO MATERNO
		BuildExtendedFilter(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO, sFilter)

		' Field NOMBRES
		BuildExtendedFilter(Carga_CAE_2012_Matr2E_2012.NOMBRES, sFilter)

		' Field CÓDIGO TIPO IES
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES, sFilter, "")

		' Field CÓDIGO DE IES
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES, sFilter, "")

		' Field CÓDIGO DE SEDE
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE, sFilter, "")

		' Field CÓDIGO DE CARRERA
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA, sFilter, "")

		' Field AÑO DE INGRESO
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO, sFilter, "")

		' Field JORNADA
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.JORNADA, sFilter, "")

		' Save parms to Session
		' Field RUT

		SetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.RUT)

		' Field APELLIDO PATERNO
		SetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO)

		' Field APELLIDO MATERNO
		SetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO)

		' Field NOMBRES
		SetSessionFilterValues(Carga_CAE_2012_Matr2E_2012.NOMBRES)

		' Field CÓDIGO TIPO IES
		SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownValue, Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES)

		' Field CÓDIGO DE IES
		SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownValue, Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES)

		' Field CÓDIGO DE SEDE
		SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownValue, Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE)

		' Field CÓDIGO DE CARRERA
		SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownValue, Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA)

		' Field AÑO DE INGRESO
		SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownValue, Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO)

		' Field JORNADA
		SetSessionDropDownValue(Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownValue, Carga_CAE_2012_Matr2E_2012.JORNADA)

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
		If ew_Session("sv_Carga_CAE_2012_Matr2E_2012_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Carga_CAE_2012_Matr2E_2012_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Carga_CAE_2012_Matr2E_2012_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Carga_CAE_2012_Matr2E_2012_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Carga_CAE_2012_Matr2E_2012_" + parm)
		End If
		If ew_Session("so1_Carga_CAE_2012_Matr2E_2012_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Carga_CAE_2012_Matr2E_2012_" + parm))
		End If
		If ew_Session("sc_Carga_CAE_2012_Matr2E_2012_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Carga_CAE_2012_Matr2E_2012_" + parm))
		End If
		If ew_Session("sv2_Carga_CAE_2012_Matr2E_2012_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Carga_CAE_2012_Matr2E_2012_" + parm)
		End If
		If ew_Session("so2_Carga_CAE_2012_Matr2E_2012_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Carga_CAE_2012_Matr2E_2012_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Carga_CAE_2012_Matr2E_2012_" + parm) = fld.SearchValue
		ew_Session("so1_Carga_CAE_2012_Matr2E_2012_" + parm) = fld.SearchOperator
		ew_Session("sc_Carga_CAE_2012_Matr2E_2012_" + parm) = fld.SearchCondition
		ew_Session("sv2_Carga_CAE_2012_Matr2E_2012_" + parm) = fld.SearchValue2
		ew_Session("so2_Carga_CAE_2012_Matr2E_2012_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Carga_CAE_2012_Matr2E_2012_" + parm) = ""
		ew_Session("so1_Carga_CAE_2012_Matr2E_2012_" + parm) = "="
		ew_Session("sc_Carga_CAE_2012_Matr2E_2012_" + parm) = "AND"
		ew_Session("sv2_Carga_CAE_2012_Matr2E_2012_" + parm) = ""
		ew_Session("so2_Carga_CAE_2012_Matr2E_2012_" + parm) = "="
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
		ew_Session("sel_Carga_CAE_2012_Matr2E_2012_" & parm) = ""
		ew_Session("rf_Carga_CAE_2012_Matr2E_2012_" & parm) = ""
		ew_Session("rt_Carga_CAE_2012_Matr2E_2012_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Carga_CAE_2012_Matr2E_2012.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Carga_CAE_2012_Matr2E_2012_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Carga_CAE_2012_Matr2E_2012_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Carga_CAE_2012_Matr2E_2012_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field CÓDIGO TIPO IES

			Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DefaultDropDownValue = EWRPT_INIT_VALUE
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownValue = Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DefaultDropDownValue

			' Field CÓDIGO DE IES
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DefaultDropDownValue = EWRPT_INIT_VALUE
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownValue = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DefaultDropDownValue

			' Field CÓDIGO DE SEDE
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DefaultDropDownValue = EWRPT_INIT_VALUE
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownValue = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DefaultDropDownValue

			' Field CÓDIGO DE CARRERA
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownValue = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DefaultDropDownValue

			' Field AÑO DE INGRESO
			Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownValue = Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DefaultDropDownValue

			' Field JORNADA
			Carga_CAE_2012_Matr2E_2012.JORNADA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownValue = Carga_CAE_2012_Matr2E_2012.JORNADA.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(Carga_CAE_2012_Matr2E_2012.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Carga_CAE_2012_Matr2E_2012.RUT)	

			' Field APELLIDO PATERNO
			SetDefaultExtFilter(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO)	

			' Field APELLIDO MATERNO
			SetDefaultExtFilter(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO)	

			' Field NOMBRES
			SetDefaultExtFilter(Carga_CAE_2012_Matr2E_2012.NOMBRES, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Carga_CAE_2012_Matr2E_2012.NOMBRES)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT extended filter
		If (TextFilterApplied(Carga_CAE_2012_Matr2E_2012.RUT)) Then bFilterExist = True

		' Check APELLIDO PATERNO extended filter
		If (TextFilterApplied(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO)) Then bFilterExist = True

		' Check APELLIDO MATERNO extended filter
		If (TextFilterApplied(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO)) Then bFilterExist = True

		' Check NOMBRES extended filter
		If (TextFilterApplied(Carga_CAE_2012_Matr2E_2012.NOMBRES)) Then bFilterExist = True

		' Check CÓDIGO TIPO IES dropdown filter
		If (NonTextFilterApplied(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES)) Then bFilterExist = True

		' Check CÓDIGO DE IES dropdown filter
		If (NonTextFilterApplied(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES)) Then bFilterExist = True

		' Check CÓDIGO DE SEDE dropdown filter
		If (NonTextFilterApplied(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE)) Then bFilterExist = True

		' Check CÓDIGO DE CARRERA dropdown filter
		If (NonTextFilterApplied(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA)) Then bFilterExist = True

		' Check AÑO DE INGRESO dropdown filter
		If (NonTextFilterApplied(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO)) Then bFilterExist = True

		' Check JORNADA dropdown filter
		If (NonTextFilterApplied(Carga_CAE_2012_Matr2E_2012.JORNADA)) Then bFilterExist = True
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
		BuildExtendedFilter(Carga_CAE_2012_Matr2E_2012.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field APELLIDO PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field APELLIDO MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRES
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Carga_CAE_2012_Matr2E_2012.NOMBRES, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.NOMBRES.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CÓDIGO TIPO IES
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CÓDIGO DE IES
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CÓDIGO DE SEDE
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CÓDIGO DE CARRERA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AÑO DE INGRESO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field JORNADA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Carga_CAE_2012_Matr2E_2012.JORNADA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Carga_CAE_2012_Matr2E_2012.JORNADA.FldCaption() & "<br>"
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
				Carga_CAE_2012_Matr2E_2012.OrderBy = ""
				Carga_CAE_2012_Matr2E_2012.StartGroup = 1
				Carga_CAE_2012_Matr2E_2012.RUT.Sort = ""
				Carga_CAE_2012_Matr2E_2012.DV.Sort = ""
				Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.Sort = ""
				Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.Sort = ""
				Carga_CAE_2012_Matr2E_2012.NOMBRES.Sort = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.Sort = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.Sort = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.Sort = ""
				Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.Sort = ""
				Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.Sort = ""
				Carga_CAE_2012_Matr2E_2012.JORNADA.Sort = ""
				Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.Sort = ""
				Carga_CAE_2012_Matr2E_2012.ESTACAD.Sort = ""
				Carga_CAE_2012_Matr2E_2012.CODCARR.Sort = ""
				Carga_CAE_2012_Matr2E_2012.NOMBRE_C.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Carga_CAE_2012_Matr2E_2012.CurrentOrder = ew_Get("order")
			Carga_CAE_2012_Matr2E_2012.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Carga_CAE_2012_Matr2E_2012.SortSql()
			Carga_CAE_2012_Matr2E_2012.OrderBy = sSortSql
			Carga_CAE_2012_Matr2E_2012.StartGroup = 1
		End If
		Return Carga_CAE_2012_Matr2E_2012.OrderBy
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
		Carga_CAE_2012_Matr2E_2012_summary = New crCarga_CAE_2012_Matr2E_2012_summary(Me)
		Carga_CAE_2012_Matr2E_2012_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Carga_CAE_2012_Matr2E_2012_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Carga_CAE_2012_Matr2E_2012_summary IsNot Nothing) Then Carga_CAE_2012_Matr2E_2012_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Carga_CAE_2012_Matr2E_2012_summary = new ewrpt_Page("Carga_CAE_2012_Matr2E_2012_summary");
// page properties
Carga_CAE_2012_Matr2E_2012_summary.PageID = "summary"; // page ID
Carga_CAE_2012_Matr2E_2012_summary.FormID = "fCarga_CAE_2012_Matr2E_2012summaryfilter"; // form ID
var EWRPT_PAGE_ID = Carga_CAE_2012_Matr2E_2012_summary.PageID;
// extend page with ValidateForm function
Carga_CAE_2012_Matr2E_2012_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Carga_CAE_2012_Matr2E_2012_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Carga_CAE_2012_Matr2E_2012_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Carga_CAE_2012_Matr2E_2012_summary.ValidateRequired = false; // no JavaScript validation
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
<% Carga_CAE_2012_Matr2E_2012_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Carga_CAE_2012_Matr2E_2012.TableCaption() %></h1></div>
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Carga_CAE_2012_Matr2E_2012_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% If (Carga_CAE_2012_Matr2E_2012_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Carga_CAE_2012_Matr2E_2012_summary.ShowMessage() %>
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Carga_CAE_2012_Matr2E_2012.FilterPanelOption = 2 OrElse (Carga_CAE_2012_Matr2E_2012.FilterPanelOption = 3 AndAlso Carga_CAE_2012_Matr2E_2012_summary.FilterApplied) OrElse Carga_CAE_2012_Matr2E_2012_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Carga_CAE_2012_Matr2E_2012smry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fCarga_CAE_2012_Matr2E_2012summaryfilter" id="fCarga_CAE_2012_Matr2E_2012summaryfilter" action="Carga_CAE_2012_Matr2E_2012smry.aspx" class="ewForm" onsubmit="return Carga_CAE_2012_Matr2E_2012_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Carga_CAE_2012_Matr2E_2012.NOMBRES.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="30" value="<%= ew_HtmlEncode(Carga_CAE_2012_Matr2E_2012.RUT.SearchValue) %>"<%= IIf(Carga_CAE_2012_Matr2E_2012_summary.ClearExtFilter = "Carga_CAE_2012_Matr2E_2012_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_APELLIDO_PATERNO" id="sv1_APELLIDO_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.SearchValue) %>"<%= IIf(Carga_CAE_2012_Matr2E_2012_summary.ClearExtFilter = "Carga_CAE_2012_Matr2E_2012_APELLIDO_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_APELLIDO_MATERNO" id="sv1_APELLIDO_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.SearchValue) %>"<%= IIf(Carga_CAE_2012_Matr2E_2012_summary.ClearExtFilter = "Carga_CAE_2012_Matr2E_2012_APELLIDO_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.NOMBRES.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRES" id="sv1_NOMBRES" size="30" maxlength="32" value="<%= ew_HtmlEncode(Carga_CAE_2012_Matr2E_2012.NOMBRES.SearchValue) %>"<%= IIf(Carga_CAE_2012_Matr2E_2012_summary.ClearExtFilter = "Carga_CAE_2012_Matr2E_2012_NOMBRES", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CD3DIGO_TIPO_IES" id="sv_CD3DIGO_TIPO_IES"<%= IIf(Carga_CAE_2012_Matr2E_2012_summary.ClearExtFilter = "Carga_CAE_2012_Matr2E_2012_CD3DIGO_TIPO_IES", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.CustomFilters.Count + Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CÓDIGO TIPO IES")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CD3DIGO_DE_IES" id="sv_CD3DIGO_DE_IES"<%= IIf(Carga_CAE_2012_Matr2E_2012_summary.ClearExtFilter = "Carga_CAE_2012_Matr2E_2012_CD3DIGO_DE_IES", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.CustomFilters.Count + Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CÓDIGO DE IES")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CD3DIGO_DE_SEDE" id="sv_CD3DIGO_DE_SEDE"<%= IIf(Carga_CAE_2012_Matr2E_2012_summary.ClearExtFilter = "Carga_CAE_2012_Matr2E_2012_CD3DIGO_DE_SEDE", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.CustomFilters.Count + Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CÓDIGO DE SEDE")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CD3DIGO_DE_CARRERA" id="sv_CD3DIGO_DE_CARRERA"<%= IIf(Carga_CAE_2012_Matr2E_2012_summary.ClearExtFilter = "Carga_CAE_2012_Matr2E_2012_CD3DIGO_DE_CARRERA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.CustomFilters.Count + Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CÓDIGO DE CARRERA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AD1O_DE_INGRESO" id="sv_AD1O_DE_INGRESO"<%= IIf(Carga_CAE_2012_Matr2E_2012_summary.ClearExtFilter = "Carga_CAE_2012_Matr2E_2012_AD1O_DE_INGRESO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.CustomFilters.Count + Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "AÑO DE INGRESO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Carga_CAE_2012_Matr2E_2012.JORNADA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Carga_CAE_2012_Matr2E_2012.JORNADA.CustomFilters.Count + Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Carga_CAE_2012_Matr2E_2012.JORNADA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "JORNADA")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownValue" id="Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_JORNADA" id="sv_JORNADA" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Carga_CAE_2012_Matr2E_2012.JORNADA.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (Carga_CAE_2012_Matr2E_2012.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Carga_CAE_2012_Matr2E_2012_summary.ShowFilterList() %>
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
If (Carga_CAE_2012_Matr2E_2012.ExportAll AndAlso ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then
	Carga_CAE_2012_Matr2E_2012_summary.StopGrp = Carga_CAE_2012_Matr2E_2012_summary.TotalGrps
Else
	Carga_CAE_2012_Matr2E_2012_summary.StopGrp = Carga_CAE_2012_Matr2E_2012_summary.StartGrp + Carga_CAE_2012_Matr2E_2012_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Carga_CAE_2012_Matr2E_2012_summary.StopGrp > Carga_CAE_2012_Matr2E_2012_summary.TotalGrps) Then
	Carga_CAE_2012_Matr2E_2012_summary.StopGrp = Carga_CAE_2012_Matr2E_2012_summary.TotalGrps
End If
Carga_CAE_2012_Matr2E_2012_summary.RecCount = 0

' Get first row
If (Carga_CAE_2012_Matr2E_2012_summary.TotalGrps > 0) Then
	Carga_CAE_2012_Matr2E_2012_summary.GetGrpRow(1)
	Carga_CAE_2012_Matr2E_2012_summary.GrpCount = 1
End If
While (Carga_CAE_2012_Matr2E_2012_summary.GrpIndex < Carga_CAE_2012_Matr2E_2012_summary.StopGrp OrElse Carga_CAE_2012_Matr2E_2012_summary.ShowFirstHeader)

	' Show header
	If (Carga_CAE_2012_Matr2E_2012_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.RUT) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.DV.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.DV))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.DV.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.DV) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.DV.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.DV.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.DV.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.NOMBRES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.NOMBRES))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.NOMBRES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.NOMBRES) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.NOMBRES.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.NOMBRES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.NOMBRES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.JORNADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.JORNADA))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.JORNADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.JORNADA) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.JORNADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.JORNADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.ESTACAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.ESTACAD))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.ESTACAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.ESTACAD) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.ESTACAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.ESTACAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.CODCARR) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012.Export)) Then %>
<%= Carga_CAE_2012_Matr2E_2012.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= Carga_CAE_2012_Matr2E_2012.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Carga_CAE_2012_Matr2E_2012.SortUrl(Carga_CAE_2012_Matr2E_2012.NOMBRE_C) %>',0);"><%= Carga_CAE_2012_Matr2E_2012.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (Carga_CAE_2012_Matr2E_2012.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Carga_CAE_2012_Matr2E_2012.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Carga_CAE_2012_Matr2E_2012_summary.ShowFirstHeader = False
	End If

	' Build detail SQL
	Dim sWhere As String = ewrpt_DetailFilterSQL(Carga_CAE_2012_Matr2E_2012.RUT, Carga_CAE_2012_Matr2E_2012.SqlFirstGroupField, Carga_CAE_2012_Matr2E_2012.RUT.GroupValue())
	If (ew_NotEmpty(Carga_CAE_2012_Matr2E_2012_summary.Filter)) Then
		sWhere = "(" + Carga_CAE_2012_Matr2E_2012_summary.Filter + ") AND (" + sWhere + ")"
	End If
	sSql = ewrpt_BuildReportSql(Carga_CAE_2012_Matr2E_2012.SqlSelect, Carga_CAE_2012_Matr2E_2012.SqlWhere, Carga_CAE_2012_Matr2E_2012.SqlGroupBy, Carga_CAE_2012_Matr2E_2012.SqlHaving, Carga_CAE_2012_Matr2E_2012.SqlOrderBy, sWhere, Carga_CAE_2012_Matr2E_2012_summary.Sort)
	Carga_CAE_2012_Matr2E_2012_summary.rs = Conn.GetRows(sSql)
	Dim rsdtlcnt As Integer = Carga_CAE_2012_Matr2E_2012_summary.rs.Count
	Carga_CAE_2012_Matr2E_2012_summary.RowIndex = 0	
	If (rsdtlcnt > 0) Then
		Carga_CAE_2012_Matr2E_2012_summary.GetRow(1)
	End If

	' Loop detail records
	While (Carga_CAE_2012_Matr2E_2012_summary.RowIndex < Carga_CAE_2012_Matr2E_2012_summary.rs.Count) 
		Carga_CAE_2012_Matr2E_2012_summary.RecCount += 1

		' Render detail row
		Carga_CAE_2012_Matr2E_2012.ResetCSS()
		Carga_CAE_2012_Matr2E_2012.RowType = EWRPT_ROWTYPE_DETAIL
		Carga_CAE_2012_Matr2E_2012_summary.RenderRow()
%>
	<tr<%= Carga_CAE_2012_Matr2E_2012.RowAttributes() %>>
		<td<%= Carga_CAE_2012_Matr2E_2012.RUT.CellAttributes %>><div<%= Carga_CAE_2012_Matr2E_2012.RUT.ViewAttributes %>><%= Carga_CAE_2012_Matr2E_2012.RUT.GroupViewValue %></div></td>
		<td<%= Carga_CAE_2012_Matr2E_2012.DV.CellAttributes %>><div<%= Carga_CAE_2012_Matr2E_2012.DV.ViewAttributes %>><%= Carga_CAE_2012_Matr2E_2012.DV.GroupViewValue %></div></td>
		<td<%= Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.CellAttributes %>><div<%= Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.ViewAttributes %>><%= Carga_CAE_2012_Matr2E_2012.APELLIDO_PATERNO.GroupViewValue %></div></td>
		<td<%= Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.CellAttributes %>><div<%= Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.ViewAttributes %>><%= Carga_CAE_2012_Matr2E_2012.APELLIDO_MATERNO.GroupViewValue %></div></td>
		<td<%= Carga_CAE_2012_Matr2E_2012.NOMBRES.CellAttributes %>><div<%= Carga_CAE_2012_Matr2E_2012.NOMBRES.ViewAttributes %>><%= Carga_CAE_2012_Matr2E_2012.NOMBRES.GroupViewValue %></div></td>
		<td<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_TIPO_IES.ListViewValue%></div>
</td>
		<td<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_IES.ListViewValue%></div>
</td>
		<td<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_SEDE.ListViewValue%></div>
</td>
		<td<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.CD3DIGO_DE_CARRERA.ListViewValue%></div>
</td>
		<td<%= Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.AD1O_DE_INGRESO.ListViewValue%></div>
</td>
		<td<%= Carga_CAE_2012_Matr2E_2012.JORNADA.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.JORNADA.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.JORNADA.ListViewValue%></div>
</td>
		<td<%= Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.ARANCEL_REAL.ListViewValue%></div>
</td>
		<td<%= Carga_CAE_2012_Matr2E_2012.ESTACAD.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.ESTACAD.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.ESTACAD.ListViewValue%></div>
</td>
		<td<%= Carga_CAE_2012_Matr2E_2012.CODCARR.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.CODCARR.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.CODCARR.ListViewValue%></div>
</td>
		<td<%= Carga_CAE_2012_Matr2E_2012.NOMBRE_C.CellAttributes %>>
<div<%= Carga_CAE_2012_Matr2E_2012.NOMBRE_C.ViewAttributes%>><%= Carga_CAE_2012_Matr2E_2012.NOMBRE_C.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Carga_CAE_2012_Matr2E_2012_summary.AccumulateSummary()

		' Get next record
		Carga_CAE_2012_Matr2E_2012_summary.GetRow(2)

		' Show Footers
%>
<%
	End While ' End detail records loop
%>
<%

	' Next group
	Carga_CAE_2012_Matr2E_2012_summary.GetGrpRow(2)
	Carga_CAE_2012_Matr2E_2012_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Carga_CAE_2012_Matr2E_2012_summary.TotalGrps > 0) Then
	Carga_CAE_2012_Matr2E_2012.ResetCSS()
	Carga_CAE_2012_Matr2E_2012.RowType = EWRPT_ROWTYPE_TOTAL
	Carga_CAE_2012_Matr2E_2012.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Carga_CAE_2012_Matr2E_2012.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Carga_CAE_2012_Matr2E_2012.RowAttrs("class") = "ewRptGrandSummary"
	Carga_CAE_2012_Matr2E_2012_summary.RenderRow()
%>
	<!-- tr><td colspan="15"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Carga_CAE_2012_Matr2E_2012.RowAttributes() %>><td colspan="15"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Carga_CAE_2012_Matr2E_2012_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Carga_CAE_2012_Matr2E_2012_summary.Pager Is Nothing Then Carga_CAE_2012_Matr2E_2012_summary.Pager = New cPrevNextPager(Carga_CAE_2012_Matr2E_2012_summary.StartGrp, Carga_CAE_2012_Matr2E_2012_summary.DisplayGrps, Carga_CAE_2012_Matr2E_2012_summary.TotalGrps) %>
<% If Carga_CAE_2012_Matr2E_2012_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Carga_CAE_2012_Matr2E_2012_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Carga_CAE_2012_Matr2E_2012smry.aspx?start=<%= Carga_CAE_2012_Matr2E_2012_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Carga_CAE_2012_Matr2E_2012_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Carga_CAE_2012_Matr2E_2012smry.aspx?start=<%= Carga_CAE_2012_Matr2E_2012_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Carga_CAE_2012_Matr2E_2012_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Carga_CAE_2012_Matr2E_2012_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Carga_CAE_2012_Matr2E_2012smry.aspx?start=<%= Carga_CAE_2012_Matr2E_2012_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Carga_CAE_2012_Matr2E_2012_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Carga_CAE_2012_Matr2E_2012smry.aspx?start=<%= Carga_CAE_2012_Matr2E_2012_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Carga_CAE_2012_Matr2E_2012_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Carga_CAE_2012_Matr2E_2012_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Carga_CAE_2012_Matr2E_2012_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Carga_CAE_2012_Matr2E_2012_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Carga_CAE_2012_Matr2E_2012_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Carga_CAE_2012_Matr2E_2012_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Carga_CAE_2012_Matr2E_2012_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Carga_CAE_2012_Matr2E_2012_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Carga_CAE_2012_Matr2E_2012_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Carga_CAE_2012_Matr2E_2012_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Carga_CAE_2012_Matr2E_2012.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
