<%@ Page ClassName="ReporteCuponerasmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public ReporteCuponera As crReporteCuponera = Nothing

	'
	' Table class (for ReporteCuponera)
	'
	Public Class crReporteCuponera
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
				Return "ReporteCuponera"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "ReporteCuponera"
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

		Public TIPO_DE_REGISTRO As crField

		Public PRIMER_IDENTIFICADOR As crField

		Public Filler As crField

		Public SEGUNDO_INDENTIFICADOR As crField

		Public RUT_ACEPTANTE As crField

		Public DIGITO_VERIFICADOR As crField

		Public NOMBRE_DEUDOR As crField

		Public CODIGO_MONEDA As crField

		Public MONTO_CUOTA As crField

		Public FECHA_VENCIMIENTO As crField

		Public RECARGO As crField

		Public Filler2 As crField

		Public CODBEN As crField

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

			' TIPO DE REGISTRO
			TIPO_DE_REGISTRO = new crField("ReporteCuponera", "ReporteCuponera", "x_TIPO_DE_REGISTRO", "TIPO DE REGISTRO", "[TIPO DE REGISTRO]", 3, EWRPT_DATATYPE_NUMBER, -1)
			TIPO_DE_REGISTRO.Page = APage
			TIPO_DE_REGISTRO.ParentPage = APage.ParentPage
			TIPO_DE_REGISTRO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("TIPO_DE_REGISTRO", TIPO_DE_REGISTRO)
			TIPO_DE_REGISTRO.DateFilter = ""
			TIPO_DE_REGISTRO.SqlSelect = ""
			TIPO_DE_REGISTRO.SqlOrderBy = ""

			' PRIMER IDENTIFICADOR
			PRIMER_IDENTIFICADOR = new crField("ReporteCuponera", "ReporteCuponera", "x_PRIMER_IDENTIFICADOR", "PRIMER IDENTIFICADOR", "[PRIMER IDENTIFICADOR]", 200, EWRPT_DATATYPE_STRING, -1)
			PRIMER_IDENTIFICADOR.Page = APage
			PRIMER_IDENTIFICADOR.ParentPage = APage.ParentPage
			Fields.Add("PRIMER_IDENTIFICADOR", PRIMER_IDENTIFICADOR)
			PRIMER_IDENTIFICADOR.DateFilter = ""
			PRIMER_IDENTIFICADOR.SqlSelect = ""
			PRIMER_IDENTIFICADOR.SqlOrderBy = ""

			' Filler
			Filler = new crField("ReporteCuponera", "ReporteCuponera", "x_Filler", "Filler", "[Filler]", 200, EWRPT_DATATYPE_STRING, -1)
			Filler.Page = APage
			Filler.ParentPage = APage.ParentPage
			Fields.Add("Filler", Filler)
			Filler.DateFilter = ""
			Filler.SqlSelect = ""
			Filler.SqlOrderBy = ""

			' SEGUNDO INDENTIFICADOR
			SEGUNDO_INDENTIFICADOR = new crField("ReporteCuponera", "ReporteCuponera", "x_SEGUNDO_INDENTIFICADOR", "SEGUNDO INDENTIFICADOR", "[SEGUNDO INDENTIFICADOR]", 131, EWRPT_DATATYPE_NUMBER, -1)
			SEGUNDO_INDENTIFICADOR.Page = APage
			SEGUNDO_INDENTIFICADOR.ParentPage = APage.ParentPage
			SEGUNDO_INDENTIFICADOR.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("SEGUNDO_INDENTIFICADOR", SEGUNDO_INDENTIFICADOR)
			SEGUNDO_INDENTIFICADOR.DateFilter = ""
			SEGUNDO_INDENTIFICADOR.SqlSelect = ""
			SEGUNDO_INDENTIFICADOR.SqlOrderBy = ""

			' RUT ACEPTANTE
			RUT_ACEPTANTE = new crField("ReporteCuponera", "ReporteCuponera", "x_RUT_ACEPTANTE", "RUT ACEPTANTE", "[RUT ACEPTANTE]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT_ACEPTANTE.Page = APage
			RUT_ACEPTANTE.ParentPage = APage.ParentPage
			Fields.Add("RUT_ACEPTANTE", RUT_ACEPTANTE)
			RUT_ACEPTANTE.DateFilter = ""
			RUT_ACEPTANTE.SqlSelect = ""
			RUT_ACEPTANTE.SqlOrderBy = ""

			' DIGITO VERIFICADOR
			DIGITO_VERIFICADOR = new crField("ReporteCuponera", "ReporteCuponera", "x_DIGITO_VERIFICADOR", "DIGITO VERIFICADOR", "[DIGITO VERIFICADOR]", 200, EWRPT_DATATYPE_STRING, -1)
			DIGITO_VERIFICADOR.Page = APage
			DIGITO_VERIFICADOR.ParentPage = APage.ParentPage
			Fields.Add("DIGITO_VERIFICADOR", DIGITO_VERIFICADOR)
			DIGITO_VERIFICADOR.DateFilter = ""
			DIGITO_VERIFICADOR.SqlSelect = ""
			DIGITO_VERIFICADOR.SqlOrderBy = ""

			' NOMBRE DEUDOR
			NOMBRE_DEUDOR = new crField("ReporteCuponera", "ReporteCuponera", "x_NOMBRE_DEUDOR", "NOMBRE DEUDOR", "[NOMBRE DEUDOR]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_DEUDOR.Page = APage
			NOMBRE_DEUDOR.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_DEUDOR", NOMBRE_DEUDOR)
			NOMBRE_DEUDOR.DateFilter = ""
			NOMBRE_DEUDOR.SqlSelect = ""
			NOMBRE_DEUDOR.SqlOrderBy = ""

			' CODIGO MONEDA
			CODIGO_MONEDA = new crField("ReporteCuponera", "ReporteCuponera", "x_CODIGO_MONEDA", "CODIGO MONEDA", "[CODIGO MONEDA]", 3, EWRPT_DATATYPE_NUMBER, -1)
			CODIGO_MONEDA.Page = APage
			CODIGO_MONEDA.ParentPage = APage.ParentPage
			CODIGO_MONEDA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("CODIGO_MONEDA", CODIGO_MONEDA)
			CODIGO_MONEDA.DateFilter = ""
			CODIGO_MONEDA.SqlSelect = ""
			CODIGO_MONEDA.SqlOrderBy = ""

			' MONTO CUOTA
			MONTO_CUOTA = new crField("ReporteCuponera", "ReporteCuponera", "x_MONTO_CUOTA", "MONTO CUOTA", "[MONTO CUOTA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			MONTO_CUOTA.Page = APage
			MONTO_CUOTA.ParentPage = APage.ParentPage
			MONTO_CUOTA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("MONTO_CUOTA", MONTO_CUOTA)
			MONTO_CUOTA.DateFilter = ""
			MONTO_CUOTA.SqlSelect = ""
			MONTO_CUOTA.SqlOrderBy = ""

			' FECHA VENCIMIENTO
			FECHA_VENCIMIENTO = new crField("ReporteCuponera", "ReporteCuponera", "x_FECHA_VENCIMIENTO", "FECHA VENCIMIENTO", "[FECHA VENCIMIENTO]", 200, EWRPT_DATATYPE_STRING, -1)
			FECHA_VENCIMIENTO.Page = APage
			FECHA_VENCIMIENTO.ParentPage = APage.ParentPage
			Fields.Add("FECHA_VENCIMIENTO", FECHA_VENCIMIENTO)
			FECHA_VENCIMIENTO.DateFilter = ""
			FECHA_VENCIMIENTO.SqlSelect = ""
			FECHA_VENCIMIENTO.SqlOrderBy = ""

			' RECARGO
			RECARGO = new crField("ReporteCuponera", "ReporteCuponera", "x_RECARGO", "RECARGO", "[RECARGO]", 200, EWRPT_DATATYPE_STRING, -1)
			RECARGO.Page = APage
			RECARGO.ParentPage = APage.ParentPage
			Fields.Add("RECARGO", RECARGO)
			RECARGO.DateFilter = ""
			RECARGO.SqlSelect = ""
			RECARGO.SqlOrderBy = ""

			' Filler2
			Filler2 = new crField("ReporteCuponera", "ReporteCuponera", "x_Filler2", "Filler2", "[Filler2]", 200, EWRPT_DATATYPE_STRING, -1)
			Filler2.Page = APage
			Filler2.ParentPage = APage.ParentPage
			Fields.Add("Filler2", Filler2)
			Filler2.DateFilter = ""
			Filler2.SqlSelect = ""
			Filler2.SqlOrderBy = ""

			' CODBEN
			CODBEN = new crField("ReporteCuponera", "ReporteCuponera", "x_CODBEN", "CODBEN", "[CODBEN]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CODBEN.Page = APage
			CODBEN.ParentPage = APage.ParentPage
			CODBEN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CODBEN", CODBEN)
			CODBEN.DateFilter = ""
			CODBEN.SqlSelect = ""
			CODBEN.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("ReporteCuponera", "ReporteCuponera", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
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
				Return "[SEK_V_Reporte_Cuponera]"
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
	Public ReporteCuponera_summary As crReporteCuponera_summary

	'
	' Page class
	'
	Public Class crReporteCuponera_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (ReporteCuponera.UseTokenInUrl) Then
				sUrl &= "t=" & ReporteCuponera.TableVar & "&" ' Add page token
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
			If (ReporteCuponera.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(ReporteCuponera.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(ReporteCuponera.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As ReporteCuponerasmry 
			Get
				Return CType(m_ParentPage, ReporteCuponerasmry)
			End Get
		End Property

		' Table object (ReporteCuponera)
		Public Property ReporteCuponera As crReporteCuponera 
			Get		
				Return AspNetPage.ReporteCuponera ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crReporteCuponera)
				AspNetPage.ReporteCuponera = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "ReporteCuponera_summary"
			m_PageObjTypeName = "crReporteCuponera_summary"

			' Table name
			m_TableName = "ReporteCuponera"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (ReporteCuponera)
			ReporteCuponera = New crReporteCuponera(Me)			

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
				ReporteCuponera.Export = ew_Get("export")
			End If
			gsExport = ReporteCuponera.Export ' Get export parameter, used in header
			gsExportFile = ReporteCuponera.TableVar ' Get export file, used in header
			If (ReporteCuponera.Export = "excel") Then
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

		Public Val As Object() = New Object(12) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(12) {}

		Public GrandMn As Object() = New Object(12) {}

		Public GrandMx As Object() = New Object(12) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 13 ' No. of fields
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
			ReporteCuponera.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(ReporteCuponera.SqlSelect, ReporteCuponera.SqlWhere, ReporteCuponera.SqlGroupBy, ReporteCuponera.SqlHaving, ReporteCuponera.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (ReporteCuponera.ExportAll AndAlso ew_NotEmpty(ReporteCuponera.Export)) Then
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
				ReporteCuponera.TIPO_DE_REGISTRO.DbValue = Row("TIPO DE REGISTRO")
				ReporteCuponera.PRIMER_IDENTIFICADOR.DbValue = Row("PRIMER IDENTIFICADOR")
				ReporteCuponera.Filler.DbValue = Row("Filler")
				ReporteCuponera.SEGUNDO_INDENTIFICADOR.DbValue = Row("SEGUNDO INDENTIFICADOR")
				ReporteCuponera.RUT_ACEPTANTE.DbValue = Row("RUT ACEPTANTE")
				ReporteCuponera.DIGITO_VERIFICADOR.DbValue = Row("DIGITO VERIFICADOR")
				ReporteCuponera.NOMBRE_DEUDOR.DbValue = Row("NOMBRE DEUDOR")
				ReporteCuponera.CODIGO_MONEDA.DbValue = Row("CODIGO MONEDA")
				ReporteCuponera.MONTO_CUOTA.DbValue = Row("MONTO CUOTA")
				ReporteCuponera.FECHA_VENCIMIENTO.DbValue = Row("FECHA VENCIMIENTO")
				ReporteCuponera.RECARGO.DbValue = Row("RECARGO")
				ReporteCuponera.Filler2.DbValue = Row("Filler2")
				ReporteCuponera.CODBEN.DbValue = Row("CODBEN")
				ReporteCuponera.NOMBRE_C.DbValue = Row("NOMBRE_C")
				Val(1) = ReporteCuponera.TIPO_DE_REGISTRO.CurrentValue
				Val(2) = ReporteCuponera.PRIMER_IDENTIFICADOR.CurrentValue
				Val(3) = ReporteCuponera.Filler.CurrentValue
				Val(4) = ReporteCuponera.SEGUNDO_INDENTIFICADOR.CurrentValue
				Val(5) = ReporteCuponera.RUT_ACEPTANTE.CurrentValue
				Val(6) = ReporteCuponera.DIGITO_VERIFICADOR.CurrentValue
				Val(7) = ReporteCuponera.NOMBRE_DEUDOR.CurrentValue
				Val(8) = ReporteCuponera.CODIGO_MONEDA.CurrentValue
				Val(9) = ReporteCuponera.MONTO_CUOTA.CurrentValue
				Val(10) = ReporteCuponera.FECHA_VENCIMIENTO.CurrentValue
				Val(11) = ReporteCuponera.RECARGO.CurrentValue
				Val(12) = ReporteCuponera.Filler2.CurrentValue
			Else
				ReporteCuponera.TIPO_DE_REGISTRO.DbValue = ""
				ReporteCuponera.PRIMER_IDENTIFICADOR.DbValue = ""
				ReporteCuponera.Filler.DbValue = ""
				ReporteCuponera.SEGUNDO_INDENTIFICADOR.DbValue = ""
				ReporteCuponera.RUT_ACEPTANTE.DbValue = ""
				ReporteCuponera.DIGITO_VERIFICADOR.DbValue = ""
				ReporteCuponera.NOMBRE_DEUDOR.DbValue = ""
				ReporteCuponera.CODIGO_MONEDA.DbValue = ""
				ReporteCuponera.MONTO_CUOTA.DbValue = ""
				ReporteCuponera.FECHA_VENCIMIENTO.DbValue = ""
				ReporteCuponera.RECARGO.DbValue = ""
				ReporteCuponera.Filler2.DbValue = ""
				ReporteCuponera.CODBEN.DbValue = ""
				ReporteCuponera.NOMBRE_C.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				ReporteCuponera.TIPO_DE_REGISTRO.DbValue = dr("TIPO DE REGISTRO")
				ReporteCuponera.PRIMER_IDENTIFICADOR.DbValue = dr("PRIMER IDENTIFICADOR")
				ReporteCuponera.Filler.DbValue = dr("Filler")
				ReporteCuponera.SEGUNDO_INDENTIFICADOR.DbValue = dr("SEGUNDO INDENTIFICADOR")
				ReporteCuponera.RUT_ACEPTANTE.DbValue = dr("RUT ACEPTANTE")
				ReporteCuponera.DIGITO_VERIFICADOR.DbValue = dr("DIGITO VERIFICADOR")
				ReporteCuponera.NOMBRE_DEUDOR.DbValue = dr("NOMBRE DEUDOR")
				ReporteCuponera.CODIGO_MONEDA.DbValue = dr("CODIGO MONEDA")
				ReporteCuponera.MONTO_CUOTA.DbValue = dr("MONTO CUOTA")
				ReporteCuponera.FECHA_VENCIMIENTO.DbValue = dr("FECHA VENCIMIENTO")
				ReporteCuponera.RECARGO.DbValue = dr("RECARGO")
				ReporteCuponera.Filler2.DbValue = dr("Filler2")
				ReporteCuponera.CODBEN.DbValue = dr("CODBEN")
				ReporteCuponera.NOMBRE_C.DbValue = dr("NOMBRE_C")
				Val(1) = ReporteCuponera.TIPO_DE_REGISTRO.CurrentValue
				Val(2) = ReporteCuponera.PRIMER_IDENTIFICADOR.CurrentValue
				Val(3) = ReporteCuponera.Filler.CurrentValue
				Val(4) = ReporteCuponera.SEGUNDO_INDENTIFICADOR.CurrentValue
				Val(5) = ReporteCuponera.RUT_ACEPTANTE.CurrentValue
				Val(6) = ReporteCuponera.DIGITO_VERIFICADOR.CurrentValue
				Val(7) = ReporteCuponera.NOMBRE_DEUDOR.CurrentValue
				Val(8) = ReporteCuponera.CODIGO_MONEDA.CurrentValue
				Val(9) = ReporteCuponera.MONTO_CUOTA.CurrentValue
				Val(10) = ReporteCuponera.FECHA_VENCIMIENTO.CurrentValue
				Val(11) = ReporteCuponera.RECARGO.CurrentValue
				Val(12) = ReporteCuponera.Filler2.CurrentValue
			Else				
				ReporteCuponera.TIPO_DE_REGISTRO.DbValue = ""
				ReporteCuponera.PRIMER_IDENTIFICADOR.DbValue = ""
				ReporteCuponera.Filler.DbValue = ""
				ReporteCuponera.SEGUNDO_INDENTIFICADOR.DbValue = ""
				ReporteCuponera.RUT_ACEPTANTE.DbValue = ""
				ReporteCuponera.DIGITO_VERIFICADOR.DbValue = ""
				ReporteCuponera.NOMBRE_DEUDOR.DbValue = ""
				ReporteCuponera.CODIGO_MONEDA.DbValue = ""
				ReporteCuponera.MONTO_CUOTA.DbValue = ""
				ReporteCuponera.FECHA_VENCIMIENTO.DbValue = ""
				ReporteCuponera.RECARGO.DbValue = ""
				ReporteCuponera.Filler2.DbValue = ""
				ReporteCuponera.CODBEN.DbValue = ""
				ReporteCuponera.NOMBRE_C.DbValue = ""
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
				ReporteCuponera.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					ReporteCuponera.StartGroup = StartGrp
				Else
					StartGrp = ReporteCuponera.StartGroup
				End If
			Else
				StartGrp = ReporteCuponera.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				ReporteCuponera.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				ReporteCuponera.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				ReporteCuponera.StartGroup = StartGrp
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
			ReporteCuponera.StartGroup = StartGrp
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
				ReporteCuponera.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				ReporteCuponera.StartGroup = StartGrp
			Else				
				If (ReporteCuponera.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(ReporteCuponera.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (ReporteCuponera.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(ReporteCuponera.SqlSelectCount, ReporteCuponera.SqlWhere, ReporteCuponera.SqlGroupBy, ReporteCuponera.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			ReporteCuponera.Row_Rendering()

			'
			' Render view codes
			'

			If (ReporteCuponera.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' TIPO DE REGISTRO
				ReporteCuponera.TIPO_DE_REGISTRO.ViewValue = Convert.ToString(ReporteCuponera.TIPO_DE_REGISTRO.Summary)

				' PRIMER IDENTIFICADOR
				ReporteCuponera.PRIMER_IDENTIFICADOR.ViewValue = Convert.ToString(ReporteCuponera.PRIMER_IDENTIFICADOR.Summary)

				' Filler
				ReporteCuponera.Filler.ViewValue = Convert.ToString(ReporteCuponera.Filler.Summary)

				' SEGUNDO INDENTIFICADOR
				ReporteCuponera.SEGUNDO_INDENTIFICADOR.ViewValue = Convert.ToString(ReporteCuponera.SEGUNDO_INDENTIFICADOR.Summary)

				' RUT ACEPTANTE
				ReporteCuponera.RUT_ACEPTANTE.ViewValue = Convert.ToString(ReporteCuponera.RUT_ACEPTANTE.Summary)

				' DIGITO VERIFICADOR
				ReporteCuponera.DIGITO_VERIFICADOR.ViewValue = Convert.ToString(ReporteCuponera.DIGITO_VERIFICADOR.Summary)

				' NOMBRE DEUDOR
				ReporteCuponera.NOMBRE_DEUDOR.ViewValue = Convert.ToString(ReporteCuponera.NOMBRE_DEUDOR.Summary)

				' CODIGO MONEDA
				ReporteCuponera.CODIGO_MONEDA.ViewValue = Convert.ToString(ReporteCuponera.CODIGO_MONEDA.Summary)

				' MONTO CUOTA
				ReporteCuponera.MONTO_CUOTA.ViewValue = Convert.ToString(ReporteCuponera.MONTO_CUOTA.Summary)

				' FECHA VENCIMIENTO
				ReporteCuponera.FECHA_VENCIMIENTO.ViewValue = Convert.ToString(ReporteCuponera.FECHA_VENCIMIENTO.Summary)

				' RECARGO
				ReporteCuponera.RECARGO.ViewValue = Convert.ToString(ReporteCuponera.RECARGO.Summary)

				' Filler2
				ReporteCuponera.Filler2.ViewValue = Convert.ToString(ReporteCuponera.Filler2.Summary)
			Else

				' TIPO DE REGISTRO
				ReporteCuponera.TIPO_DE_REGISTRO.ViewValue = Convert.ToString(ReporteCuponera.TIPO_DE_REGISTRO.CurrentValue)
				ReporteCuponera.TIPO_DE_REGISTRO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PRIMER IDENTIFICADOR
				ReporteCuponera.PRIMER_IDENTIFICADOR.ViewValue = Convert.ToString(ReporteCuponera.PRIMER_IDENTIFICADOR.CurrentValue)
				ReporteCuponera.PRIMER_IDENTIFICADOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Filler
				ReporteCuponera.Filler.ViewValue = Convert.ToString(ReporteCuponera.Filler.CurrentValue)
				ReporteCuponera.Filler.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SEGUNDO INDENTIFICADOR
				ReporteCuponera.SEGUNDO_INDENTIFICADOR.ViewValue = Convert.ToString(ReporteCuponera.SEGUNDO_INDENTIFICADOR.CurrentValue)
				ReporteCuponera.SEGUNDO_INDENTIFICADOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT ACEPTANTE
				ReporteCuponera.RUT_ACEPTANTE.ViewValue = Convert.ToString(ReporteCuponera.RUT_ACEPTANTE.CurrentValue)
				ReporteCuponera.RUT_ACEPTANTE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DIGITO VERIFICADOR
				ReporteCuponera.DIGITO_VERIFICADOR.ViewValue = Convert.ToString(ReporteCuponera.DIGITO_VERIFICADOR.CurrentValue)
				ReporteCuponera.DIGITO_VERIFICADOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE DEUDOR
				ReporteCuponera.NOMBRE_DEUDOR.ViewValue = Convert.ToString(ReporteCuponera.NOMBRE_DEUDOR.CurrentValue)
				ReporteCuponera.NOMBRE_DEUDOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODIGO MONEDA
				ReporteCuponera.CODIGO_MONEDA.ViewValue = Convert.ToString(ReporteCuponera.CODIGO_MONEDA.CurrentValue)
				ReporteCuponera.CODIGO_MONEDA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MONTO CUOTA
				ReporteCuponera.MONTO_CUOTA.ViewValue = Convert.ToString(ReporteCuponera.MONTO_CUOTA.CurrentValue)
				ReporteCuponera.MONTO_CUOTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECHA VENCIMIENTO
				ReporteCuponera.FECHA_VENCIMIENTO.ViewValue = Convert.ToString(ReporteCuponera.FECHA_VENCIMIENTO.CurrentValue)
				ReporteCuponera.FECHA_VENCIMIENTO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RECARGO
				ReporteCuponera.RECARGO.ViewValue = Convert.ToString(ReporteCuponera.RECARGO.CurrentValue)
				ReporteCuponera.RECARGO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Filler2
				ReporteCuponera.Filler2.ViewValue = Convert.ToString(ReporteCuponera.Filler2.CurrentValue)
				ReporteCuponera.Filler2.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' TIPO DE REGISTRO
			ReporteCuponera.TIPO_DE_REGISTRO.HrefValue = ""

			' PRIMER IDENTIFICADOR
			ReporteCuponera.PRIMER_IDENTIFICADOR.HrefValue = ""

			' Filler
			ReporteCuponera.Filler.HrefValue = ""

			' SEGUNDO INDENTIFICADOR
			ReporteCuponera.SEGUNDO_INDENTIFICADOR.HrefValue = ""

			' RUT ACEPTANTE
			ReporteCuponera.RUT_ACEPTANTE.HrefValue = ""

			' DIGITO VERIFICADOR
			ReporteCuponera.DIGITO_VERIFICADOR.HrefValue = ""

			' NOMBRE DEUDOR
			ReporteCuponera.NOMBRE_DEUDOR.HrefValue = ""

			' CODIGO MONEDA
			ReporteCuponera.CODIGO_MONEDA.HrefValue = ""

			' MONTO CUOTA
			ReporteCuponera.MONTO_CUOTA.HrefValue = ""

			' FECHA VENCIMIENTO
			ReporteCuponera.FECHA_VENCIMIENTO.HrefValue = ""

			' RECARGO
			ReporteCuponera.RECARGO.HrefValue = ""

			' Filler2
			ReporteCuponera.Filler2.HrefValue = ""

			' Call Row_Rendered event
			ReporteCuponera.Row_Rendered()
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

			' Field CODBEN
			sSelect = "SELECT DISTINCT [CODBEN] FROM " + ReporteCuponera.SqlFrom
			sOrderBy = "[CODBEN] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, ReporteCuponera.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			ReporteCuponera.CODBEN.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NOMBRE_C
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + ReporteCuponera.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, ReporteCuponera.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			ReporteCuponera.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field CODBEN
				SetSessionDropDownValue(ReporteCuponera.CODBEN.DropDownValue, ReporteCuponera.CODBEN)

				' Field NOMBRE_C
				SetSessionDropDownValue(ReporteCuponera.NOMBRE_C.DropDownValue, ReporteCuponera.NOMBRE_C)
			bSetupFilter = True ' Set up filter required
		Else

				' Field CODBEN
				If (GetDropDownValue(ReporteCuponera.CODBEN)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(ReporteCuponera.CODBEN.DropDownValue) Then
					If Not ew_SameStr(ReporteCuponera.CODBEN.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_ReporteCuponera_CODBEN") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field NOMBRE_C
				If (GetDropDownValue(ReporteCuponera.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(ReporteCuponera.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(ReporteCuponera.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_ReporteCuponera_NOMBRE_C") Is Nothing Then
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

			' Field CODBEN
			GetSessionDropDownValue(ReporteCuponera.CODBEN)

			' Field NOMBRE_C
			GetSessionDropDownValue(ReporteCuponera.NOMBRE_C)
		End If

		' Call page filter validated event
		ReporteCuponera.Page_FilterValidated()

		' Build SQL
		' Field CODBEN

		BuildDropDownFilter(ReporteCuponera.CODBEN, sFilter, "")

		' Field NOMBRE_C
		BuildDropDownFilter(ReporteCuponera.NOMBRE_C, sFilter, "")

		' Save parms to Session
		' Field CODBEN

		SetSessionDropDownValue(ReporteCuponera.CODBEN.DropDownValue, ReporteCuponera.CODBEN)

		' Field NOMBRE_C
		SetSessionDropDownValue(ReporteCuponera.NOMBRE_C.DropDownValue, ReporteCuponera.NOMBRE_C)

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
		If ew_Session("sv_ReporteCuponera_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_ReporteCuponera_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_ReporteCuponera_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_ReporteCuponera_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_ReporteCuponera_" + parm)
		End If
		If ew_Session("so1_ReporteCuponera_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_ReporteCuponera_" + parm))
		End If
		If ew_Session("sc_ReporteCuponera_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_ReporteCuponera_" + parm))
		End If
		If ew_Session("sv2_ReporteCuponera_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_ReporteCuponera_" + parm)
		End If
		If ew_Session("so2_ReporteCuponera_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_ReporteCuponera_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_ReporteCuponera_" + parm) = fld.SearchValue
		ew_Session("so1_ReporteCuponera_" + parm) = fld.SearchOperator
		ew_Session("sc_ReporteCuponera_" + parm) = fld.SearchCondition
		ew_Session("sv2_ReporteCuponera_" + parm) = fld.SearchValue2
		ew_Session("so2_ReporteCuponera_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_ReporteCuponera_" + parm) = ""
		ew_Session("so1_ReporteCuponera_" + parm) = "="
		ew_Session("sc_ReporteCuponera_" + parm) = "AND"
		ew_Session("sv2_ReporteCuponera_" + parm) = ""
		ew_Session("so2_ReporteCuponera_" + parm) = "="
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
		ew_Session("sel_ReporteCuponera_" & parm) = ""
		ew_Session("rf_ReporteCuponera_" & parm) = ""
		ew_Session("rt_ReporteCuponera_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = ReporteCuponera.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_ReporteCuponera_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_ReporteCuponera_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_ReporteCuponera_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field CODBEN

			ReporteCuponera.CODBEN.DefaultDropDownValue = -1
			ReporteCuponera.CODBEN.DropDownValue = ReporteCuponera.CODBEN.DefaultDropDownValue

			' Field NOMBRE_C
			ReporteCuponera.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			ReporteCuponera.NOMBRE_C.DropDownValue = ReporteCuponera.NOMBRE_C.DefaultDropDownValue

		' Set up default values for extended filters
		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check CODBEN dropdown filter
		If (NonTextFilterApplied(ReporteCuponera.CODBEN)) Then bFilterExist = True

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(ReporteCuponera.NOMBRE_C)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field CODBEN
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(ReporteCuponera.CODBEN, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= ReporteCuponera.CODBEN.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(ReporteCuponera.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= ReporteCuponera.NOMBRE_C.FldCaption() & "<br>"
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
				ReporteCuponera.OrderBy = ""
				ReporteCuponera.StartGroup = 1
				ReporteCuponera.TIPO_DE_REGISTRO.Sort = ""
				ReporteCuponera.PRIMER_IDENTIFICADOR.Sort = ""
				ReporteCuponera.Filler.Sort = ""
				ReporteCuponera.SEGUNDO_INDENTIFICADOR.Sort = ""
				ReporteCuponera.RUT_ACEPTANTE.Sort = ""
				ReporteCuponera.DIGITO_VERIFICADOR.Sort = ""
				ReporteCuponera.NOMBRE_DEUDOR.Sort = ""
				ReporteCuponera.CODIGO_MONEDA.Sort = ""
				ReporteCuponera.MONTO_CUOTA.Sort = ""
				ReporteCuponera.FECHA_VENCIMIENTO.Sort = ""
				ReporteCuponera.RECARGO.Sort = ""
				ReporteCuponera.Filler2.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			ReporteCuponera.CurrentOrder = ew_Get("order")
			ReporteCuponera.CurrentOrderType = ew_Get("ordertype")
			sSortSql = ReporteCuponera.SortSql()
			ReporteCuponera.OrderBy = sSortSql
			ReporteCuponera.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(ReporteCuponera.OrderBy)) Then
			ReporteCuponera.OrderBy = "[NOMBRE DEUDOR] ASC, [FECHA VENCIMIENTO] ASC"
			ReporteCuponera.NOMBRE_DEUDOR.Sort = "ASC"
			ReporteCuponera.FECHA_VENCIMIENTO.Sort = "ASC"
		End If
		Return ReporteCuponera.OrderBy
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
		ReporteCuponera_summary = New crReporteCuponera_summary(Me)
		ReporteCuponera_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		ReporteCuponera_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (ReporteCuponera_summary IsNot Nothing) Then ReporteCuponera_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (ReporteCuponera.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var ReporteCuponera_summary = new ewrpt_Page("ReporteCuponera_summary");
// page properties
ReporteCuponera_summary.PageID = "summary"; // page ID
ReporteCuponera_summary.FormID = "fReporteCuponerasummaryfilter"; // form ID
var EWRPT_PAGE_ID = ReporteCuponera_summary.PageID;
// extend page with ValidateForm function
ReporteCuponera_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
ReporteCuponera_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
ReporteCuponera_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
ReporteCuponera_summary.ValidateRequired = false; // no JavaScript validation
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
<% ReporteCuponera_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (ReporteCuponera.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (ReporteCuponera.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="ewTitle"><h1><%= ReporteCuponera.TableCaption() %></h1>
<% If (ReporteCuponera.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= ReporteCuponera_summary.ExportExcelUrl %>"><img src="images/excel.png" /></a>
<% If (ReporteCuponera_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="ReporteCuponerasmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% ReporteCuponera_summary.ShowMessage() %>
<% If (ReporteCuponera.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (ReporteCuponera.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (ReporteCuponera.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (ReporteCuponera.FilterPanelOption = 2 OrElse (ReporteCuponera.FilterPanelOption = 3 AndAlso ReporteCuponera_summary.FilterApplied) OrElse ReporteCuponera_summary.Filter = "0=101") Then
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
<form name="fReporteCuponerasummaryfilter" id="fReporteCuponerasummaryfilter" action="ReporteCuponerasmry.aspx" class="ewForm" onsubmit="return ReporteCuponera_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = ReporteCuponera.FECHA_VENCIMIENTO.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= ReporteCuponera.CODBEN.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CODBEN" id="sv_CODBEN"<%= IIf(ReporteCuponera_summary.ClearExtFilter = "ReporteCuponera_CODBEN", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(ReporteCuponera.CODBEN.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = ReporteCuponera.CODBEN.CustomFilters.Count + ReporteCuponera.CODBEN.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In ReporteCuponera.CODBEN.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CODBEN")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(ReporteCuponera.CODBEN.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In ReporteCuponera.CODBEN.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(ReporteCuponera.CODBEN.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= ReporteCuponera.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(ReporteCuponera_summary.ClearExtFilter = "ReporteCuponera_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(ReporteCuponera.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = ReporteCuponera.NOMBRE_C.CustomFilters.Count + ReporteCuponera.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In ReporteCuponera.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(ReporteCuponera.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In ReporteCuponera.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(ReporteCuponera.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (ReporteCuponera.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% ReporteCuponera_summary.ShowFilterList() %>
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
If (ReporteCuponera.ExportAll AndAlso ew_NotEmpty(ReporteCuponera.Export)) Then
	ReporteCuponera_summary.StopGrp = ReporteCuponera_summary.TotalGrps
Else
	ReporteCuponera_summary.StopGrp = ReporteCuponera_summary.StartGrp + ReporteCuponera_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (ReporteCuponera_summary.StopGrp > ReporteCuponera_summary.TotalGrps) Then
	ReporteCuponera_summary.StopGrp = ReporteCuponera_summary.TotalGrps
End If
ReporteCuponera_summary.RecCount = 0

' Get first row
If (ReporteCuponera_summary.TotalGrps > 0) Then
	ReporteCuponera_summary.GetRow() ' ASPXRPT
	ReporteCuponera_summary.GrpCount = 1
End If
While ((ReporteCuponera_summary.HasRow AndAlso ReporteCuponera_summary.GrpIndex < ReporteCuponera_summary.StopGrp) OrElse ReporteCuponera_summary.ShowFirstHeader)

	' Show header
	If (ReporteCuponera_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.TIPO_DE_REGISTRO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.TIPO_DE_REGISTRO))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.TIPO_DE_REGISTRO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.TIPO_DE_REGISTRO) %>',0);"><%= ReporteCuponera.TIPO_DE_REGISTRO.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.TIPO_DE_REGISTRO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.TIPO_DE_REGISTRO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.PRIMER_IDENTIFICADOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.PRIMER_IDENTIFICADOR))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.PRIMER_IDENTIFICADOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.PRIMER_IDENTIFICADOR) %>',0);"><%= ReporteCuponera.PRIMER_IDENTIFICADOR.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.PRIMER_IDENTIFICADOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.PRIMER_IDENTIFICADOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.Filler.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.Filler))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.Filler.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.Filler) %>',0);"><%= ReporteCuponera.Filler.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.Filler.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.Filler.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.SEGUNDO_INDENTIFICADOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.SEGUNDO_INDENTIFICADOR))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.SEGUNDO_INDENTIFICADOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.SEGUNDO_INDENTIFICADOR) %>',0);"><%= ReporteCuponera.SEGUNDO_INDENTIFICADOR.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.SEGUNDO_INDENTIFICADOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.SEGUNDO_INDENTIFICADOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.RUT_ACEPTANTE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.RUT_ACEPTANTE))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.RUT_ACEPTANTE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.RUT_ACEPTANTE) %>',0);"><%= ReporteCuponera.RUT_ACEPTANTE.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.RUT_ACEPTANTE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.RUT_ACEPTANTE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.DIGITO_VERIFICADOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.DIGITO_VERIFICADOR))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.DIGITO_VERIFICADOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.DIGITO_VERIFICADOR) %>',0);"><%= ReporteCuponera.DIGITO_VERIFICADOR.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.DIGITO_VERIFICADOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.DIGITO_VERIFICADOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.NOMBRE_DEUDOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.NOMBRE_DEUDOR))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.NOMBRE_DEUDOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.NOMBRE_DEUDOR) %>',0);"><%= ReporteCuponera.NOMBRE_DEUDOR.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.NOMBRE_DEUDOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.NOMBRE_DEUDOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.CODIGO_MONEDA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.CODIGO_MONEDA))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.CODIGO_MONEDA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.CODIGO_MONEDA) %>',0);"><%= ReporteCuponera.CODIGO_MONEDA.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.CODIGO_MONEDA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.CODIGO_MONEDA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.MONTO_CUOTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.MONTO_CUOTA))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.MONTO_CUOTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.MONTO_CUOTA) %>',0);"><%= ReporteCuponera.MONTO_CUOTA.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.MONTO_CUOTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.MONTO_CUOTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.FECHA_VENCIMIENTO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.FECHA_VENCIMIENTO))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.FECHA_VENCIMIENTO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.FECHA_VENCIMIENTO) %>',0);"><%= ReporteCuponera.FECHA_VENCIMIENTO.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.FECHA_VENCIMIENTO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.FECHA_VENCIMIENTO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.RECARGO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.RECARGO))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.RECARGO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.RECARGO) %>',0);"><%= ReporteCuponera.RECARGO.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.RECARGO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.RECARGO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(ReporteCuponera.Export)) Then %>
<%= ReporteCuponera.Filler2.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(ReporteCuponera.SortUrl(ReporteCuponera.Filler2))) Then %>
		<td style="vertical-align: bottom;"><%= ReporteCuponera.Filler2.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= ReporteCuponera.SortUrl(ReporteCuponera.Filler2) %>',0);"><%= ReporteCuponera.Filler2.FldCaption() %></td><td style="width: 10px;">
		<% If (ReporteCuponera.Filler2.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (ReporteCuponera.Filler2.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		ReporteCuponera_summary.ShowFirstHeader = False
	End If
	ReporteCuponera_summary.RecCount += 1

		' Render detail row
		ReporteCuponera.ResetCSS()
		ReporteCuponera.RowType = EWRPT_ROWTYPE_DETAIL
		ReporteCuponera_summary.RenderRow()
%>
	<tr<%= ReporteCuponera.RowAttributes() %>>
		<td<%= ReporteCuponera.TIPO_DE_REGISTRO.CellAttributes %>>
<div<%= ReporteCuponera.TIPO_DE_REGISTRO.ViewAttributes%>><%= ReporteCuponera.TIPO_DE_REGISTRO.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.PRIMER_IDENTIFICADOR.CellAttributes %>>
<div<%= ReporteCuponera.PRIMER_IDENTIFICADOR.ViewAttributes%>><%= ReporteCuponera.PRIMER_IDENTIFICADOR.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.Filler.CellAttributes %>>
<div<%= ReporteCuponera.Filler.ViewAttributes%>><%= ReporteCuponera.Filler.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.SEGUNDO_INDENTIFICADOR.CellAttributes %>>
<div<%= ReporteCuponera.SEGUNDO_INDENTIFICADOR.ViewAttributes%>><%= ReporteCuponera.SEGUNDO_INDENTIFICADOR.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.RUT_ACEPTANTE.CellAttributes %>>
<div<%= ReporteCuponera.RUT_ACEPTANTE.ViewAttributes%>><%= ReporteCuponera.RUT_ACEPTANTE.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.DIGITO_VERIFICADOR.CellAttributes %>>
<div<%= ReporteCuponera.DIGITO_VERIFICADOR.ViewAttributes%>><%= ReporteCuponera.DIGITO_VERIFICADOR.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.NOMBRE_DEUDOR.CellAttributes %>>
<div<%= ReporteCuponera.NOMBRE_DEUDOR.ViewAttributes%>><%= ReporteCuponera.NOMBRE_DEUDOR.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.CODIGO_MONEDA.CellAttributes %>>
<div<%= ReporteCuponera.CODIGO_MONEDA.ViewAttributes%>><%= ReporteCuponera.CODIGO_MONEDA.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.MONTO_CUOTA.CellAttributes %>>
<div<%= ReporteCuponera.MONTO_CUOTA.ViewAttributes%>><%= ReporteCuponera.MONTO_CUOTA.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.FECHA_VENCIMIENTO.CellAttributes %>>
<div<%= ReporteCuponera.FECHA_VENCIMIENTO.ViewAttributes%>><%= ReporteCuponera.FECHA_VENCIMIENTO.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.RECARGO.CellAttributes %>>
<div<%= ReporteCuponera.RECARGO.ViewAttributes%>><%= ReporteCuponera.RECARGO.ListViewValue%></div>
</td>
		<td<%= ReporteCuponera.Filler2.CellAttributes %>>
<div<%= ReporteCuponera.Filler2.ViewAttributes%>><%= ReporteCuponera.Filler2.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		ReporteCuponera_summary.AccumulateSummary()

		' Get next record
		ReporteCuponera_summary.GetRow() ' ASPXRPT
		ReporteCuponera_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (ReporteCuponera_summary.TotalGrps > 0) Then
	ReporteCuponera.ResetCSS()
	ReporteCuponera.RowType = EWRPT_ROWTYPE_TOTAL
	ReporteCuponera.RowTotalType = EWRPT_ROWTOTAL_GRAND
	ReporteCuponera.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	ReporteCuponera.RowAttrs("class") = "ewRptGrandSummary"
	ReporteCuponera_summary.RenderRow()
%>
	<!-- tr><td colspan="12"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= ReporteCuponera.RowAttributes() %>><td colspan="12"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(ReporteCuponera_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (ReporteCuponera.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If ReporteCuponera_summary.Pager Is Nothing Then ReporteCuponera_summary.Pager = New cPrevNextPager(ReporteCuponera_summary.StartGrp, ReporteCuponera_summary.DisplayGrps, ReporteCuponera_summary.TotalGrps) %>
<% If ReporteCuponera_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If ReporteCuponera_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="ReporteCuponerasmry.aspx?start=<%= ReporteCuponera_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If ReporteCuponera_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="ReporteCuponerasmry.aspx?start=<%= ReporteCuponera_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= ReporteCuponera_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If ReporteCuponera_summary.Pager.NextButton.Enabled Then %>
	<td><a href="ReporteCuponerasmry.aspx?start=<%= ReporteCuponera_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If ReporteCuponera_summary.Pager.LastButton.Enabled Then %>
	<td><a href="ReporteCuponerasmry.aspx?start=<%= ReporteCuponera_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= ReporteCuponera_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= ReporteCuponera_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= ReporteCuponera_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= ReporteCuponera_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If ReporteCuponera_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (ReporteCuponera_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If ReporteCuponera_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="20"<% If ReporteCuponera_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If ReporteCuponera_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
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
<% If (ReporteCuponera.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (ReporteCuponera.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (ReporteCuponera.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% ReporteCuponera_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (ReporteCuponera.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
