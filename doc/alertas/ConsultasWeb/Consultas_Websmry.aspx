<%@ Page ClassName="Consultas_Websmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_consultasWeb" %>
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
	Public Consultas_Web As crConsultas_Web = Nothing

	'
	' Table class (for Consultas Web)
	'
	Public Class crConsultas_Web
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
				Return "Consultas_Web"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Consultas Web"
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

		Public Nombre As crField

		Public Apellidos As crField

		Public Telefono As crField

		Public Email As crField

		Public Centro As crField

		Public Ciudad As crField

		Public Pais As crField

		Public IP As crField

		Public Motivo As crField

		Public Mensaje As crField

		Public Detalle As crField

		Public ModoContacto As crField

		Public Destinatario As crField

		Public Web As crField

		Public FormularioWeb As crField

		Public FechaHora As crField

		Public ID As crField

		Public CodigoCentro As crField

		Public DestinatarioCC As crField

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

			' Nombre
			Nombre = new crField("Consultas_Web", "Consultas Web", "x_Nombre", "Nombre", "[Nombre]", 201, EWRPT_DATATYPE_MEMO, -1)
			Nombre.Page = APage
			Nombre.ParentPage = APage.ParentPage
			Fields.Add("Nombre", Nombre)
			Nombre.DateFilter = ""
			Nombre.SqlSelect = ""
			Nombre.SqlOrderBy = ""

			' Apellidos
			Apellidos = new crField("Consultas_Web", "Consultas Web", "x_Apellidos", "Apellidos", "[Apellidos]", 201, EWRPT_DATATYPE_MEMO, -1)
			Apellidos.Page = APage
			Apellidos.ParentPage = APage.ParentPage
			Fields.Add("Apellidos", Apellidos)
			Apellidos.DateFilter = ""
			Apellidos.SqlSelect = ""
			Apellidos.SqlOrderBy = ""

			' Telefono
			Telefono = new crField("Consultas_Web", "Consultas Web", "x_Telefono", "Telefono", "[Telefono]", 200, EWRPT_DATATYPE_STRING, -1)
			Telefono.Page = APage
			Telefono.ParentPage = APage.ParentPage
			Fields.Add("Telefono", Telefono)
			Telefono.DateFilter = ""
			Telefono.SqlSelect = ""
			Telefono.SqlOrderBy = ""

			' Email
			Email = new crField("Consultas_Web", "Consultas Web", "x_Email", "Email", "[Email]", 200, EWRPT_DATATYPE_STRING, -1)
			Email.Page = APage
			Email.ParentPage = APage.ParentPage
			Fields.Add("Email", Email)
			Email.DateFilter = ""
			Email.SqlSelect = ""
			Email.SqlOrderBy = ""

			' Centro
			Centro = new crField("Consultas_Web", "Consultas Web", "x_Centro", "Centro", "[Centro]", 200, EWRPT_DATATYPE_STRING, -1)
			Centro.Page = APage
			Centro.ParentPage = APage.ParentPage
			Fields.Add("Centro", Centro)
			Centro.DateFilter = ""
			Centro.SqlSelect = ""
			Centro.SqlOrderBy = ""

			' Ciudad
			Ciudad = new crField("Consultas_Web", "Consultas Web", "x_Ciudad", "Ciudad", "[Ciudad]", 200, EWRPT_DATATYPE_STRING, -1)
			Ciudad.Page = APage
			Ciudad.ParentPage = APage.ParentPage
			Fields.Add("Ciudad", Ciudad)
			Ciudad.DateFilter = ""
			Ciudad.SqlSelect = ""
			Ciudad.SqlOrderBy = ""

			' Pais
			Pais = new crField("Consultas_Web", "Consultas Web", "x_Pais", "Pais", "[Pais]", 200, EWRPT_DATATYPE_STRING, -1)
			Pais.Page = APage
			Pais.ParentPage = APage.ParentPage
			Fields.Add("Pais", Pais)
			Pais.DateFilter = ""
			Pais.SqlSelect = ""
			Pais.SqlOrderBy = ""

			' IP
			IP = new crField("Consultas_Web", "Consultas Web", "x_IP", "IP", "[IP]", 200, EWRPT_DATATYPE_STRING, -1)
			IP.Page = APage
			IP.ParentPage = APage.ParentPage
			Fields.Add("IP", IP)
			IP.DateFilter = ""
			IP.SqlSelect = ""
			IP.SqlOrderBy = ""

			' Motivo
			Motivo = new crField("Consultas_Web", "Consultas Web", "x_Motivo", "Motivo", "[Motivo]", 201, EWRPT_DATATYPE_MEMO, -1)
			Motivo.Page = APage
			Motivo.ParentPage = APage.ParentPage
			Fields.Add("Motivo", Motivo)
			Motivo.DateFilter = ""
			Motivo.SqlSelect = ""
			Motivo.SqlOrderBy = ""

			' Mensaje
			Mensaje = new crField("Consultas_Web", "Consultas Web", "x_Mensaje", "Mensaje", "[Mensaje]", 201, EWRPT_DATATYPE_MEMO, -1)
			Mensaje.Page = APage
			Mensaje.ParentPage = APage.ParentPage
			Fields.Add("Mensaje", Mensaje)
			Mensaje.DateFilter = ""
			Mensaje.SqlSelect = ""
			Mensaje.SqlOrderBy = ""

			' Detalle
			Detalle = new crField("Consultas_Web", "Consultas Web", "x_Detalle", "Detalle", "[Detalle]", 201, EWRPT_DATATYPE_MEMO, -1)
			Detalle.Page = APage
			Detalle.ParentPage = APage.ParentPage
			Fields.Add("Detalle", Detalle)
			Detalle.DateFilter = ""
			Detalle.SqlSelect = ""
			Detalle.SqlOrderBy = ""

			' ModoContacto
			ModoContacto = new crField("Consultas_Web", "Consultas Web", "x_ModoContacto", "ModoContacto", "[ModoContacto]", 201, EWRPT_DATATYPE_MEMO, -1)
			ModoContacto.Page = APage
			ModoContacto.ParentPage = APage.ParentPage
			Fields.Add("ModoContacto", ModoContacto)
			ModoContacto.DateFilter = ""
			ModoContacto.SqlSelect = ""
			ModoContacto.SqlOrderBy = ""

			' Destinatario
			Destinatario = new crField("Consultas_Web", "Consultas Web", "x_Destinatario", "Destinatario", "[Destinatario]", 201, EWRPT_DATATYPE_MEMO, -1)
			Destinatario.Page = APage
			Destinatario.ParentPage = APage.ParentPage
			Fields.Add("Destinatario", Destinatario)
			Destinatario.DateFilter = ""
			Destinatario.SqlSelect = ""
			Destinatario.SqlOrderBy = ""

			' Web
			Web = new crField("Consultas_Web", "Consultas Web", "x_Web", "Web", "[Web]", 200, EWRPT_DATATYPE_STRING, -1)
			Web.Page = APage
			Web.ParentPage = APage.ParentPage
			Fields.Add("Web", Web)
			Web.DateFilter = ""
			Web.SqlSelect = ""
			Web.SqlOrderBy = ""

			' FormularioWeb
			FormularioWeb = new crField("Consultas_Web", "Consultas Web", "x_FormularioWeb", "FormularioWeb", "[FormularioWeb]", 200, EWRPT_DATATYPE_STRING, -1)
			FormularioWeb.Page = APage
			FormularioWeb.ParentPage = APage.ParentPage
			Fields.Add("FormularioWeb", FormularioWeb)
			FormularioWeb.DateFilter = ""
			FormularioWeb.SqlSelect = ""
			FormularioWeb.SqlOrderBy = ""

			' FechaHora
			FechaHora = new crField("Consultas_Web", "Consultas Web", "x_FechaHora", "FechaHora", "[FechaHora]", 135, EWRPT_DATATYPE_DATE, 7)
			FechaHora.Page = APage
			FechaHora.ParentPage = APage.ParentPage
			FechaHora.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FechaHora", FechaHora)
			FechaHora.DateFilter = ""
			FechaHora.SqlSelect = ""
			FechaHora.SqlOrderBy = ""

			' ID
			ID = new crField("Consultas_Web", "Consultas Web", "x_ID", "ID", "[ID]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ID.Page = APage
			ID.ParentPage = APage.ParentPage
			ID.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ID", ID)
			ID.DateFilter = ""
			ID.SqlSelect = ""
			ID.SqlOrderBy = ""

			' CodigoCentro
			CodigoCentro = new crField("Consultas_Web", "Consultas Web", "x_CodigoCentro", "CodigoCentro", "[CodigoCentro]", 130, EWRPT_DATATYPE_STRING, -1)
			CodigoCentro.Page = APage
			CodigoCentro.ParentPage = APage.ParentPage
			Fields.Add("CodigoCentro", CodigoCentro)
			CodigoCentro.DateFilter = ""
			CodigoCentro.SqlSelect = ""
			CodigoCentro.SqlOrderBy = ""

			' DestinatarioCC
			DestinatarioCC = new crField("Consultas_Web", "Consultas Web", "x_DestinatarioCC", "DestinatarioCC", "[DestinatarioCC]", 201, EWRPT_DATATYPE_MEMO, -1)
			DestinatarioCC.Page = APage
			DestinatarioCC.ParentPage = APage.ParentPage
			Fields.Add("DestinatarioCC", DestinatarioCC)
			DestinatarioCC.DateFilter = ""
			DestinatarioCC.SqlSelect = ""
			DestinatarioCC.SqlOrderBy = ""
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
				Return "[SEK_V_ConsultasWeb]"
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
	Public Consultas_Web_summary As crConsultas_Web_summary

	'
	' Page class
	'
	Public Class crConsultas_Web_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Consultas_Web.UseTokenInUrl) Then
				sUrl &= "t=" & Consultas_Web.TableVar & "&" ' Add page token
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
			If (Consultas_Web.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Consultas_Web.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Consultas_Web.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Consultas_Websmry 
			Get
				Return CType(m_ParentPage, Consultas_Websmry)
			End Get
		End Property

		' Table object (Consultas_Web)
		Public Property Consultas_Web As crConsultas_Web 
			Get		
				Return AspNetPage.Consultas_Web ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crConsultas_Web)
				AspNetPage.Consultas_Web = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_consultasWeb)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Consultas_Web_summary"
			m_PageObjTypeName = "crConsultas_Web_summary"

			' Table name
			m_TableName = "Consultas Web"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Consultas_Web)
			Consultas_Web = New crConsultas_Web(Me)			

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
				Consultas_Web.Export = ew_Get("export")
			End If
			gsExport = Consultas_Web.Export ' Get export parameter, used in header
			gsExportFile = Consultas_Web.TableVar ' Get export file, used in header
			If (Consultas_Web.Export = "excel") Then
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

		Public Val As Object() = New Object(16) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(16) {}

		Public GrandMn As Object() = New Object(16) {}

		Public GrandMx As Object() = New Object(16) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 17 ' No. of fields
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
			Consultas_Web.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Consultas_Web.SqlSelect, Consultas_Web.SqlWhere, Consultas_Web.SqlGroupBy, Consultas_Web.SqlHaving, Consultas_Web.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Consultas_Web.ExportAll AndAlso ew_NotEmpty(Consultas_Web.Export)) Then
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
				Consultas_Web.ID.DbValue = Row("ID")
				Consultas_Web.CodigoCentro.DbValue = Row("CodigoCentro")
				Consultas_Web.Nombre.DbValue = Row("Nombre")
				Consultas_Web.Apellidos.DbValue = Row("Apellidos")
				Consultas_Web.Pais.DbValue = Row("Pais")
				Consultas_Web.Telefono.DbValue = Row("Telefono")
				Consultas_Web.Email.DbValue = Row("Email")
				Consultas_Web.Motivo.DbValue = Row("Motivo")
				Consultas_Web.Mensaje.DbValue = Row("Mensaje")
				Consultas_Web.ModoContacto.DbValue = Row("ModoContacto")
				Consultas_Web.Destinatario.DbValue = Row("Destinatario")
				Consultas_Web.DestinatarioCC.DbValue = Row("DestinatarioCC")
				Consultas_Web.IP.DbValue = Row("IP")
				Consultas_Web.Web.DbValue = Row("Web")
				Consultas_Web.FormularioWeb.DbValue = Row("FormularioWeb")
				Consultas_Web.Detalle.DbValue = Row("Detalle")
				Consultas_Web.FechaHora.DbValue = Row("FechaHora")
				Consultas_Web.Centro.DbValue = Row("Centro")
				Consultas_Web.Ciudad.DbValue = Row("Ciudad")
				Val(1) = Consultas_Web.Nombre.CurrentValue
				Val(2) = Consultas_Web.Apellidos.CurrentValue
				Val(3) = Consultas_Web.Telefono.CurrentValue
				Val(4) = Consultas_Web.Email.CurrentValue
				Val(5) = Consultas_Web.Centro.CurrentValue
				Val(6) = Consultas_Web.Ciudad.CurrentValue
				Val(7) = Consultas_Web.Pais.CurrentValue
				Val(8) = Consultas_Web.IP.CurrentValue
				Val(9) = Consultas_Web.Motivo.CurrentValue
				Val(10) = Consultas_Web.Mensaje.CurrentValue
				Val(11) = Consultas_Web.Detalle.CurrentValue
				Val(12) = Consultas_Web.ModoContacto.CurrentValue
				Val(13) = Consultas_Web.Destinatario.CurrentValue
				Val(14) = Consultas_Web.Web.CurrentValue
				Val(15) = Consultas_Web.FormularioWeb.CurrentValue
				Val(16) = Consultas_Web.FechaHora.CurrentValue
			Else
				Consultas_Web.ID.DbValue = ""
				Consultas_Web.CodigoCentro.DbValue = ""
				Consultas_Web.Nombre.DbValue = ""
				Consultas_Web.Apellidos.DbValue = ""
				Consultas_Web.Pais.DbValue = ""
				Consultas_Web.Telefono.DbValue = ""
				Consultas_Web.Email.DbValue = ""
				Consultas_Web.Motivo.DbValue = ""
				Consultas_Web.Mensaje.DbValue = ""
				Consultas_Web.ModoContacto.DbValue = ""
				Consultas_Web.Destinatario.DbValue = ""
				Consultas_Web.DestinatarioCC.DbValue = ""
				Consultas_Web.IP.DbValue = ""
				Consultas_Web.Web.DbValue = ""
				Consultas_Web.FormularioWeb.DbValue = ""
				Consultas_Web.Detalle.DbValue = ""
				Consultas_Web.FechaHora.DbValue = ""
				Consultas_Web.Centro.DbValue = ""
				Consultas_Web.Ciudad.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Consultas_Web.ID.DbValue = dr("ID")
				Consultas_Web.CodigoCentro.DbValue = dr("CodigoCentro")
				Consultas_Web.Nombre.DbValue = dr("Nombre")
				Consultas_Web.Apellidos.DbValue = dr("Apellidos")
				Consultas_Web.Pais.DbValue = dr("Pais")
				Consultas_Web.Telefono.DbValue = dr("Telefono")
				Consultas_Web.Email.DbValue = dr("Email")
				Consultas_Web.Motivo.DbValue = dr("Motivo")
				Consultas_Web.Mensaje.DbValue = dr("Mensaje")
				Consultas_Web.ModoContacto.DbValue = dr("ModoContacto")
				Consultas_Web.Destinatario.DbValue = dr("Destinatario")
				Consultas_Web.DestinatarioCC.DbValue = dr("DestinatarioCC")
				Consultas_Web.IP.DbValue = dr("IP")
				Consultas_Web.Web.DbValue = dr("Web")
				Consultas_Web.FormularioWeb.DbValue = dr("FormularioWeb")
				Consultas_Web.Detalle.DbValue = dr("Detalle")
				Consultas_Web.FechaHora.DbValue = dr("FechaHora")
				Consultas_Web.Centro.DbValue = dr("Centro")
				Consultas_Web.Ciudad.DbValue = dr("Ciudad")
				Val(1) = Consultas_Web.Nombre.CurrentValue
				Val(2) = Consultas_Web.Apellidos.CurrentValue
				Val(3) = Consultas_Web.Telefono.CurrentValue
				Val(4) = Consultas_Web.Email.CurrentValue
				Val(5) = Consultas_Web.Centro.CurrentValue
				Val(6) = Consultas_Web.Ciudad.CurrentValue
				Val(7) = Consultas_Web.Pais.CurrentValue
				Val(8) = Consultas_Web.IP.CurrentValue
				Val(9) = Consultas_Web.Motivo.CurrentValue
				Val(10) = Consultas_Web.Mensaje.CurrentValue
				Val(11) = Consultas_Web.Detalle.CurrentValue
				Val(12) = Consultas_Web.ModoContacto.CurrentValue
				Val(13) = Consultas_Web.Destinatario.CurrentValue
				Val(14) = Consultas_Web.Web.CurrentValue
				Val(15) = Consultas_Web.FormularioWeb.CurrentValue
				Val(16) = Consultas_Web.FechaHora.CurrentValue
			Else				
				Consultas_Web.ID.DbValue = ""
				Consultas_Web.CodigoCentro.DbValue = ""
				Consultas_Web.Nombre.DbValue = ""
				Consultas_Web.Apellidos.DbValue = ""
				Consultas_Web.Pais.DbValue = ""
				Consultas_Web.Telefono.DbValue = ""
				Consultas_Web.Email.DbValue = ""
				Consultas_Web.Motivo.DbValue = ""
				Consultas_Web.Mensaje.DbValue = ""
				Consultas_Web.ModoContacto.DbValue = ""
				Consultas_Web.Destinatario.DbValue = ""
				Consultas_Web.DestinatarioCC.DbValue = ""
				Consultas_Web.IP.DbValue = ""
				Consultas_Web.Web.DbValue = ""
				Consultas_Web.FormularioWeb.DbValue = ""
				Consultas_Web.Detalle.DbValue = ""
				Consultas_Web.FechaHora.DbValue = ""
				Consultas_Web.Centro.DbValue = ""
				Consultas_Web.Ciudad.DbValue = ""
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
				Consultas_Web.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Consultas_Web.StartGroup = StartGrp
				Else
					StartGrp = Consultas_Web.StartGroup
				End If
			Else
				StartGrp = Consultas_Web.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Consultas_Web.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Consultas_Web.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Consultas_Web.StartGroup = StartGrp
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
			Consultas_Web.StartGroup = StartGrp
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
				Consultas_Web.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Consultas_Web.StartGroup = StartGrp
			Else				
				If (Consultas_Web.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Consultas_Web.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Consultas_Web.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Consultas_Web.SqlSelectCount, Consultas_Web.SqlWhere, Consultas_Web.SqlGroupBy, Consultas_Web.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Consultas_Web.Row_Rendering()

			'
			' Render view codes
			'

			If (Consultas_Web.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' Nombre
				Consultas_Web.Nombre.ViewValue = Convert.ToString(Consultas_Web.Nombre.Summary)

				' Apellidos
				Consultas_Web.Apellidos.ViewValue = Convert.ToString(Consultas_Web.Apellidos.Summary)

				' Telefono
				Consultas_Web.Telefono.ViewValue = Convert.ToString(Consultas_Web.Telefono.Summary)

				' Email
				Consultas_Web.Email.ViewValue = Convert.ToString(Consultas_Web.Email.Summary)

				' Centro
				Consultas_Web.Centro.ViewValue = Convert.ToString(Consultas_Web.Centro.Summary)

				' Ciudad
				Consultas_Web.Ciudad.ViewValue = Convert.ToString(Consultas_Web.Ciudad.Summary)

				' Pais
				Consultas_Web.Pais.ViewValue = Convert.ToString(Consultas_Web.Pais.Summary)

				' IP
				Consultas_Web.IP.ViewValue = Convert.ToString(Consultas_Web.IP.Summary)

				' Motivo
				Consultas_Web.Motivo.ViewValue = Convert.ToString(Consultas_Web.Motivo.Summary)

				' Mensaje
				Consultas_Web.Mensaje.ViewValue = Convert.ToString(Consultas_Web.Mensaje.Summary)

				' Detalle
				Consultas_Web.Detalle.ViewValue = Convert.ToString(Consultas_Web.Detalle.Summary)

				' ModoContacto
				Consultas_Web.ModoContacto.ViewValue = Convert.ToString(Consultas_Web.ModoContacto.Summary)

				' Destinatario
				Consultas_Web.Destinatario.ViewValue = Convert.ToString(Consultas_Web.Destinatario.Summary)

				' Web
				Consultas_Web.Web.ViewValue = Convert.ToString(Consultas_Web.Web.Summary)

				' FormularioWeb
				Consultas_Web.FormularioWeb.ViewValue = Convert.ToString(Consultas_Web.FormularioWeb.Summary)

				' FechaHora
				Consultas_Web.FechaHora.ViewValue = Convert.ToString(Consultas_Web.FechaHora.Summary)
				Consultas_Web.FechaHora.ViewValue = ew_FormatDateTime(Consultas_Web.FechaHora.ViewValue, 7)
			Else

				' Nombre
				Consultas_Web.Nombre.ViewValue = Convert.ToString(Consultas_Web.Nombre.CurrentValue)
				Consultas_Web.Nombre.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Apellidos
				Consultas_Web.Apellidos.ViewValue = Convert.ToString(Consultas_Web.Apellidos.CurrentValue)
				Consultas_Web.Apellidos.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Telefono
				Consultas_Web.Telefono.ViewValue = Convert.ToString(Consultas_Web.Telefono.CurrentValue)
				Consultas_Web.Telefono.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Email
				Consultas_Web.Email.ViewValue = Convert.ToString(Consultas_Web.Email.CurrentValue)
				Consultas_Web.Email.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Centro
				Consultas_Web.Centro.ViewValue = Convert.ToString(Consultas_Web.Centro.CurrentValue)
				Consultas_Web.Centro.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Ciudad
				Consultas_Web.Ciudad.ViewValue = Convert.ToString(Consultas_Web.Ciudad.CurrentValue)
				Consultas_Web.Ciudad.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Pais
				Consultas_Web.Pais.ViewValue = Convert.ToString(Consultas_Web.Pais.CurrentValue)
				Consultas_Web.Pais.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' IP
				Consultas_Web.IP.ViewValue = Convert.ToString(Consultas_Web.IP.CurrentValue)
				Consultas_Web.IP.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Motivo
				Consultas_Web.Motivo.ViewValue = Convert.ToString(Consultas_Web.Motivo.CurrentValue)
				Consultas_Web.Motivo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Mensaje
				Consultas_Web.Mensaje.ViewValue = Convert.ToString(Consultas_Web.Mensaje.CurrentValue)
				Consultas_Web.Mensaje.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Detalle
				Consultas_Web.Detalle.ViewValue = Convert.ToString(Consultas_Web.Detalle.CurrentValue)
				Consultas_Web.Detalle.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ModoContacto
				Consultas_Web.ModoContacto.ViewValue = Convert.ToString(Consultas_Web.ModoContacto.CurrentValue)
				Consultas_Web.ModoContacto.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Destinatario
				Consultas_Web.Destinatario.ViewValue = Convert.ToString(Consultas_Web.Destinatario.CurrentValue)
				Consultas_Web.Destinatario.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Web
				Consultas_Web.Web.ViewValue = Convert.ToString(Consultas_Web.Web.CurrentValue)
				Consultas_Web.Web.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FormularioWeb
				Consultas_Web.FormularioWeb.ViewValue = Convert.ToString(Consultas_Web.FormularioWeb.CurrentValue)
				Consultas_Web.FormularioWeb.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FechaHora
				Consultas_Web.FechaHora.ViewValue = Convert.ToString(Consultas_Web.FechaHora.CurrentValue)
				Consultas_Web.FechaHora.ViewValue = ew_FormatDateTime(Consultas_Web.FechaHora.ViewValue, 7)
				Consultas_Web.FechaHora.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' Nombre
			Consultas_Web.Nombre.HrefValue = ""

			' Apellidos
			Consultas_Web.Apellidos.HrefValue = ""

			' Telefono
			Consultas_Web.Telefono.HrefValue = ""

			' Email
			Consultas_Web.Email.HrefValue = ""

			' Centro
			Consultas_Web.Centro.HrefValue = ""

			' Ciudad
			Consultas_Web.Ciudad.HrefValue = ""

			' Pais
			Consultas_Web.Pais.HrefValue = ""

			' IP
			Consultas_Web.IP.HrefValue = ""

			' Motivo
			Consultas_Web.Motivo.HrefValue = ""

			' Mensaje
			Consultas_Web.Mensaje.HrefValue = ""

			' Detalle
			Consultas_Web.Detalle.HrefValue = ""

			' ModoContacto
			Consultas_Web.ModoContacto.HrefValue = ""

			' Destinatario
			Consultas_Web.Destinatario.HrefValue = ""

			' Web
			Consultas_Web.Web.HrefValue = ""

			' FormularioWeb
			Consultas_Web.FormularioWeb.HrefValue = ""

			' FechaHora
			Consultas_Web.FechaHora.HrefValue = ""

			' Call Row_Rendered event
			Consultas_Web.Row_Rendered()
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

			' Field Centro
			sSelect = "SELECT DISTINCT [Centro] FROM " + Consultas_Web.SqlFrom
			sOrderBy = "[Centro] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Consultas_Web.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Consultas_Web.Centro.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Motivo
			sSelect = "SELECT DISTINCT [Motivo] FROM " + Consultas_Web.SqlFrom
			sOrderBy = "[Motivo] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Consultas_Web.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Consultas_Web.Motivo.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ModoContacto
			sSelect = "SELECT DISTINCT [ModoContacto] FROM " + Consultas_Web.SqlFrom
			sOrderBy = "[ModoContacto] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Consultas_Web.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Consultas_Web.ModoContacto.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Web
			sSelect = "SELECT DISTINCT [Web] FROM " + Consultas_Web.SqlFrom
			sOrderBy = "[Web] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Consultas_Web.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Consultas_Web.Web.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field FormularioWeb
			sSelect = "SELECT DISTINCT [FormularioWeb] FROM " + Consultas_Web.SqlFrom
			sOrderBy = "[FormularioWeb] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Consultas_Web.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Consultas_Web.FormularioWeb.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field Apellidos
				SetSessionFilterValues(Consultas_Web.Apellidos)

				' Field Centro
				SetSessionDropDownValue(Consultas_Web.Centro.DropDownValue, Consultas_Web.Centro)

				' Field Ciudad
				SetSessionFilterValues(Consultas_Web.Ciudad)

				' Field Pais
				SetSessionFilterValues(Consultas_Web.Pais)

				' Field IP
				SetSessionFilterValues(Consultas_Web.IP)

				' Field Motivo
				SetSessionDropDownValue(Consultas_Web.Motivo.DropDownValue, Consultas_Web.Motivo)

				' Field Mensaje
				SetSessionFilterValues(Consultas_Web.Mensaje)

				' Field Detalle
				SetSessionFilterValues(Consultas_Web.Detalle)

				' Field ModoContacto
				SetSessionDropDownValue(Consultas_Web.ModoContacto.DropDownValue, Consultas_Web.ModoContacto)

				' Field Web
				SetSessionDropDownValue(Consultas_Web.Web.DropDownValue, Consultas_Web.Web)

				' Field FormularioWeb
				SetSessionDropDownValue(Consultas_Web.FormularioWeb.DropDownValue, Consultas_Web.FormularioWeb)

				' Field FechaHora
				SetSessionFilterValues(Consultas_Web.FechaHora)
			bSetupFilter = True ' Set up filter required
		Else

				' Field Apellidos
				If (GetFilterValues(Consultas_Web.Apellidos)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Centro
				If (GetDropDownValue(Consultas_Web.Centro)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Consultas_Web.Centro.DropDownValue) Then
					If Not ew_SameStr(Consultas_Web.Centro.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Consultas_Web_Centro") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Ciudad
				If (GetFilterValues(Consultas_Web.Ciudad)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Pais
				If (GetFilterValues(Consultas_Web.Pais)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field IP
				If (GetFilterValues(Consultas_Web.IP)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Motivo
				If (GetDropDownValue(Consultas_Web.Motivo)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Consultas_Web.Motivo.DropDownValue) Then
					If Not ew_SameStr(Consultas_Web.Motivo.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Consultas_Web_Motivo") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Mensaje
				If (GetFilterValues(Consultas_Web.Mensaje)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field Detalle
				If (GetFilterValues(Consultas_Web.Detalle)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ModoContacto
				If (GetDropDownValue(Consultas_Web.ModoContacto)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Consultas_Web.ModoContacto.DropDownValue) Then
					If Not ew_SameStr(Consultas_Web.ModoContacto.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Consultas_Web_ModoContacto") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Web
				If (GetDropDownValue(Consultas_Web.Web)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Consultas_Web.Web.DropDownValue) Then
					If Not ew_SameStr(Consultas_Web.Web.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Consultas_Web_Web") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field FormularioWeb
				If (GetDropDownValue(Consultas_Web.FormularioWeb)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Consultas_Web.FormularioWeb.DropDownValue) Then
					If Not ew_SameStr(Consultas_Web.FormularioWeb.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Consultas_Web_FormularioWeb") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field FechaHora
				If (GetFilterValues(Consultas_Web.FechaHora)) Then
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

			' Field Apellidos
			GetSessionFilterValues(Consultas_Web.Apellidos)

			' Field Centro
			GetSessionDropDownValue(Consultas_Web.Centro)

			' Field Ciudad
			GetSessionFilterValues(Consultas_Web.Ciudad)

			' Field Pais
			GetSessionFilterValues(Consultas_Web.Pais)

			' Field IP
			GetSessionFilterValues(Consultas_Web.IP)

			' Field Motivo
			GetSessionDropDownValue(Consultas_Web.Motivo)

			' Field Mensaje
			GetSessionFilterValues(Consultas_Web.Mensaje)

			' Field Detalle
			GetSessionFilterValues(Consultas_Web.Detalle)

			' Field ModoContacto
			GetSessionDropDownValue(Consultas_Web.ModoContacto)

			' Field Web
			GetSessionDropDownValue(Consultas_Web.Web)

			' Field FormularioWeb
			GetSessionDropDownValue(Consultas_Web.FormularioWeb)

			' Field FechaHora
			GetSessionFilterValues(Consultas_Web.FechaHora)
		End If

		' Call page filter validated event
		Consultas_Web.Page_FilterValidated()

		' Build SQL
		' Field Apellidos

		BuildExtendedFilter(Consultas_Web.Apellidos, sFilter)

		' Field Centro
		BuildDropDownFilter(Consultas_Web.Centro, sFilter, "")

		' Field Ciudad
		BuildExtendedFilter(Consultas_Web.Ciudad, sFilter)

		' Field Pais
		BuildExtendedFilter(Consultas_Web.Pais, sFilter)

		' Field IP
		BuildExtendedFilter(Consultas_Web.IP, sFilter)

		' Field Motivo
		BuildDropDownFilter(Consultas_Web.Motivo, sFilter, "")

		' Field Mensaje
		BuildExtendedFilter(Consultas_Web.Mensaje, sFilter)

		' Field Detalle
		BuildExtendedFilter(Consultas_Web.Detalle, sFilter)

		' Field ModoContacto
		BuildDropDownFilter(Consultas_Web.ModoContacto, sFilter, "")

		' Field Web
		BuildDropDownFilter(Consultas_Web.Web, sFilter, "")

		' Field FormularioWeb
		BuildDropDownFilter(Consultas_Web.FormularioWeb, sFilter, "")

		' Field FechaHora
		BuildExtendedFilter(Consultas_Web.FechaHora, sFilter)

		' Save parms to Session
		' Field Apellidos

		SetSessionFilterValues(Consultas_Web.Apellidos)

		' Field Centro
		SetSessionDropDownValue(Consultas_Web.Centro.DropDownValue, Consultas_Web.Centro)

		' Field Ciudad
		SetSessionFilterValues(Consultas_Web.Ciudad)

		' Field Pais
		SetSessionFilterValues(Consultas_Web.Pais)

		' Field IP
		SetSessionFilterValues(Consultas_Web.IP)

		' Field Motivo
		SetSessionDropDownValue(Consultas_Web.Motivo.DropDownValue, Consultas_Web.Motivo)

		' Field Mensaje
		SetSessionFilterValues(Consultas_Web.Mensaje)

		' Field Detalle
		SetSessionFilterValues(Consultas_Web.Detalle)

		' Field ModoContacto
		SetSessionDropDownValue(Consultas_Web.ModoContacto.DropDownValue, Consultas_Web.ModoContacto)

		' Field Web
		SetSessionDropDownValue(Consultas_Web.Web.DropDownValue, Consultas_Web.Web)

		' Field FormularioWeb
		SetSessionDropDownValue(Consultas_Web.FormularioWeb.DropDownValue, Consultas_Web.FormularioWeb)

		' Field FechaHora
		SetSessionFilterValues(Consultas_Web.FechaHora)

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
		If ew_Session("sv_Consultas_Web_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Consultas_Web_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Consultas_Web_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Consultas_Web_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Consultas_Web_" + parm)
		End If
		If ew_Session("so1_Consultas_Web_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Consultas_Web_" + parm))
		End If
		If ew_Session("sc_Consultas_Web_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Consultas_Web_" + parm))
		End If
		If ew_Session("sv2_Consultas_Web_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Consultas_Web_" + parm)
		End If
		If ew_Session("so2_Consultas_Web_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Consultas_Web_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Consultas_Web_" + parm) = fld.SearchValue
		ew_Session("so1_Consultas_Web_" + parm) = fld.SearchOperator
		ew_Session("sc_Consultas_Web_" + parm) = fld.SearchCondition
		ew_Session("sv2_Consultas_Web_" + parm) = fld.SearchValue2
		ew_Session("so2_Consultas_Web_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Consultas_Web_" + parm) = ""
		ew_Session("so1_Consultas_Web_" + parm) = "="
		ew_Session("sc_Consultas_Web_" + parm) = "AND"
		ew_Session("sv2_Consultas_Web_" + parm) = ""
		ew_Session("so2_Consultas_Web_" + parm) = "="
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
		If Not ewrpt_CheckEuroDate(Convert.ToString(Consultas_Web.FechaHora.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Consultas_Web.FechaHora.FldErrMsg()
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
		ew_Session("sel_Consultas_Web_" & parm) = ""
		ew_Session("rf_Consultas_Web_" & parm) = ""
		ew_Session("rt_Consultas_Web_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Consultas_Web.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Consultas_Web_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Consultas_Web_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Consultas_Web_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field Centro

			Consultas_Web.Centro.DefaultDropDownValue = EWRPT_INIT_VALUE
			Consultas_Web.Centro.DropDownValue = Consultas_Web.Centro.DefaultDropDownValue

			' Field Motivo
			Consultas_Web.Motivo.DefaultDropDownValue = EWRPT_INIT_VALUE
			Consultas_Web.Motivo.DropDownValue = Consultas_Web.Motivo.DefaultDropDownValue

			' Field ModoContacto
			Consultas_Web.ModoContacto.DefaultDropDownValue = EWRPT_INIT_VALUE
			Consultas_Web.ModoContacto.DropDownValue = Consultas_Web.ModoContacto.DefaultDropDownValue

			' Field Web
			Consultas_Web.Web.DefaultDropDownValue = EWRPT_INIT_VALUE
			Consultas_Web.Web.DropDownValue = Consultas_Web.Web.DefaultDropDownValue

			' Field FormularioWeb
			Consultas_Web.FormularioWeb.DefaultDropDownValue = EWRPT_INIT_VALUE
			Consultas_Web.FormularioWeb.DropDownValue = Consultas_Web.FormularioWeb.DefaultDropDownValue

		' Set up default values for extended filters
			' Field Apellidos

			SetDefaultExtFilter(Consultas_Web.Apellidos, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consultas_Web.Apellidos)	

			' Field Ciudad
			SetDefaultExtFilter(Consultas_Web.Ciudad, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consultas_Web.Ciudad)	

			' Field Pais
			SetDefaultExtFilter(Consultas_Web.Pais, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consultas_Web.Pais)	

			' Field IP
			SetDefaultExtFilter(Consultas_Web.IP, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consultas_Web.IP)	

			' Field Mensaje
			SetDefaultExtFilter(Consultas_Web.Mensaje, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consultas_Web.Mensaje)	

			' Field Detalle
			SetDefaultExtFilter(Consultas_Web.Detalle, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consultas_Web.Detalle)	

			' Field FechaHora
			SetDefaultExtFilter(Consultas_Web.FechaHora, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Consultas_Web.FechaHora)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check Apellidos extended filter
		If (TextFilterApplied(Consultas_Web.Apellidos)) Then bFilterExist = True

		' Check Centro dropdown filter
		If (NonTextFilterApplied(Consultas_Web.Centro)) Then bFilterExist = True

		' Check Ciudad extended filter
		If (TextFilterApplied(Consultas_Web.Ciudad)) Then bFilterExist = True

		' Check Pais extended filter
		If (TextFilterApplied(Consultas_Web.Pais)) Then bFilterExist = True

		' Check IP extended filter
		If (TextFilterApplied(Consultas_Web.IP)) Then bFilterExist = True

		' Check Motivo dropdown filter
		If (NonTextFilterApplied(Consultas_Web.Motivo)) Then bFilterExist = True

		' Check Mensaje extended filter
		If (TextFilterApplied(Consultas_Web.Mensaje)) Then bFilterExist = True

		' Check Detalle extended filter
		If (TextFilterApplied(Consultas_Web.Detalle)) Then bFilterExist = True

		' Check ModoContacto dropdown filter
		If (NonTextFilterApplied(Consultas_Web.ModoContacto)) Then bFilterExist = True

		' Check Web dropdown filter
		If (NonTextFilterApplied(Consultas_Web.Web)) Then bFilterExist = True

		' Check FormularioWeb dropdown filter
		If (NonTextFilterApplied(Consultas_Web.FormularioWeb)) Then bFilterExist = True

		' Check FechaHora extended filter
		If (TextFilterApplied(Consultas_Web.FechaHora)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field Apellidos
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consultas_Web.Apellidos, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.Apellidos.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Centro
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Consultas_Web.Centro, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.Centro.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Ciudad
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consultas_Web.Ciudad, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.Ciudad.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Pais
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consultas_Web.Pais, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.Pais.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field IP
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consultas_Web.IP, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.IP.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Motivo
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Consultas_Web.Motivo, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.Motivo.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Mensaje
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consultas_Web.Mensaje, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.Mensaje.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Detalle
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consultas_Web.Detalle, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.Detalle.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ModoContacto
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Consultas_Web.ModoContacto, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.ModoContacto.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Web
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Consultas_Web.Web, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.Web.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FormularioWeb
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Consultas_Web.FormularioWeb, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.FormularioWeb.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FechaHora
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Consultas_Web.FechaHora, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Consultas_Web.FechaHora.FldCaption() & "<br>"
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
				Consultas_Web.OrderBy = ""
				Consultas_Web.StartGroup = 1
				Consultas_Web.Nombre.Sort = ""
				Consultas_Web.Apellidos.Sort = ""
				Consultas_Web.Telefono.Sort = ""
				Consultas_Web.Email.Sort = ""
				Consultas_Web.Centro.Sort = ""
				Consultas_Web.Ciudad.Sort = ""
				Consultas_Web.Pais.Sort = ""
				Consultas_Web.IP.Sort = ""
				Consultas_Web.Motivo.Sort = ""
				Consultas_Web.Mensaje.Sort = ""
				Consultas_Web.Detalle.Sort = ""
				Consultas_Web.ModoContacto.Sort = ""
				Consultas_Web.Destinatario.Sort = ""
				Consultas_Web.Web.Sort = ""
				Consultas_Web.FormularioWeb.Sort = ""
				Consultas_Web.FechaHora.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Consultas_Web.CurrentOrder = ew_Get("order")
			Consultas_Web.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Consultas_Web.SortSql()
			Consultas_Web.OrderBy = sSortSql
			Consultas_Web.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Consultas_Web.OrderBy)) Then
			Consultas_Web.OrderBy = "[FechaHora] DESC, [Apellidos] ASC"
			Consultas_Web.FechaHora.Sort = "DESC"
			Consultas_Web.Apellidos.Sort = "ASC"
		End If
		Return Consultas_Web.OrderBy
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
		Consultas_Web_summary = New crConsultas_Web_summary(Me)
		Consultas_Web_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Consultas_Web_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Consultas_Web_summary IsNot Nothing) Then Consultas_Web_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Consultas_Web.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Consultas_Web_summary = new ewrpt_Page("Consultas_Web_summary");
// page properties
Consultas_Web_summary.PageID = "summary"; // page ID
Consultas_Web_summary.FormID = "fConsultas_Websummaryfilter"; // form ID
var EWRPT_PAGE_ID = Consultas_Web_summary.PageID;
// extend page with ValidateForm function
Consultas_Web_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_FechaHora;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Consultas_Web.FechaHora.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Consultas_Web_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Consultas_Web_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Consultas_Web_summary.ValidateRequired = false; // no JavaScript validation
<% End If %>
</script>
<link rel="stylesheet" type="text/css" media="all" href="jscalendar/calendar-win2k-1.css" title="win2k-1" />
<script type="text/javascript" src="jscalendar/calendar.js"></script>
<script type="text/javascript" src="jscalendar/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar/calendar-setup.js"></script>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
// To include another .js script, use:
// ew_ClientScriptInclude("my_javascript.js"); 
//-->
</script>
<% End If %>
<% Consultas_Web_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Consultas_Web.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Consultas_Web.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Consultas_Web.TableCaption() %></h1></div>
<% If (Consultas_Web.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Consultas_Web_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% If (Consultas_Web_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
</div><br>
<% Consultas_Web_summary.ShowMessage() %>
<% If (Consultas_Web.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Consultas_Web.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Consultas_Web.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Consultas_Web.FilterPanelOption = 2 OrElse (Consultas_Web.FilterPanelOption = 3 AndAlso Consultas_Web_summary.FilterApplied) OrElse Consultas_Web_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Consultas_Websmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fConsultas_Websummaryfilter" id="fConsultas_Websummaryfilter" action="Consultas_Websmry.aspx" class="ewForm" onsubmit="return Consultas_Web_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Consultas_Web.FechaHora.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.Apellidos.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Apellidos" id="sv1_Apellidos" value="<%= ew_HtmlEncode(Consultas_Web.Apellidos.SearchValue) %>"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_Apellidos", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.Centro.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Centro" id="sv_Centro"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_Centro", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.Centro.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Consultas_Web.Centro.CustomFilters.Count + Consultas_Web.Centro.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Consultas_Web.Centro.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Centro")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.Centro.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Consultas_Web.Centro.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.Centro.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.Ciudad.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Ciudad" id="sv1_Ciudad" size="30" maxlength="50" value="<%= ew_HtmlEncode(Consultas_Web.Ciudad.SearchValue) %>"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_Ciudad", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.Pais.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Pais" id="sv1_Pais" size="30" maxlength="50" value="<%= ew_HtmlEncode(Consultas_Web.Pais.SearchValue) %>"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_Pais", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.IP.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_IP" id="sv1_IP" size="30" maxlength="50" value="<%= ew_HtmlEncode(Consultas_Web.IP.SearchValue) %>"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_IP", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.Motivo.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Motivo" id="sv_Motivo"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_Motivo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.Motivo.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Consultas_Web.Motivo.CustomFilters.Count + Consultas_Web.Motivo.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Consultas_Web.Motivo.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Motivo")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.Motivo.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Consultas_Web.Motivo.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.Motivo.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.Mensaje.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Mensaje" id="sv1_Mensaje" value="<%= ew_HtmlEncode(Consultas_Web.Mensaje.SearchValue) %>"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_Mensaje", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.Detalle.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_Detalle" id="sv1_Detalle" value="<%= ew_HtmlEncode(Consultas_Web.Detalle.SearchValue) %>"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_Detalle", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.ModoContacto.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ModoContacto" id="sv_ModoContacto"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_ModoContacto", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.ModoContacto.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Consultas_Web.ModoContacto.CustomFilters.Count + Consultas_Web.ModoContacto.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Consultas_Web.ModoContacto.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ModoContacto")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.ModoContacto.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Consultas_Web.ModoContacto.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.ModoContacto.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.Web.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Web" id="sv_Web"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_Web", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.Web.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Consultas_Web.Web.CustomFilters.Count + Consultas_Web.Web.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Consultas_Web.Web.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Web")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.Web.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Consultas_Web.Web.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.Web.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.FormularioWeb.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FormularioWeb" id="sv_FormularioWeb"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_FormularioWeb", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.FormularioWeb.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Consultas_Web.FormularioWeb.CustomFilters.Count + Consultas_Web.FormularioWeb.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Consultas_Web.FormularioWeb.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "FormularioWeb")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.FormularioWeb.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Consultas_Web.FormularioWeb.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Consultas_Web.FormularioWeb.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Consultas_Web.FechaHora.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FechaHora" id="sv1_FechaHora" value="<%= ew_HtmlEncode(Consultas_Web.FechaHora.SearchValue) %>"<%= IIf(Consultas_Web_summary.ClearExtFilter = "Consultas_Web_FechaHora", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv1_FechaHora" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv1_FechaHora", // ID of the input field
ifFormat : "%d/%m/%Y", // the date format
button : "csv1_FechaHora" // ID of the button
})
</script>
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
<% If (Consultas_Web.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Consultas_Web_summary.ShowFilterList() %>
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
If (Consultas_Web.ExportAll AndAlso ew_NotEmpty(Consultas_Web.Export)) Then
	Consultas_Web_summary.StopGrp = Consultas_Web_summary.TotalGrps
Else
	Consultas_Web_summary.StopGrp = Consultas_Web_summary.StartGrp + Consultas_Web_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Consultas_Web_summary.StopGrp > Consultas_Web_summary.TotalGrps) Then
	Consultas_Web_summary.StopGrp = Consultas_Web_summary.TotalGrps
End If
Consultas_Web_summary.RecCount = 0

' Get first row
If (Consultas_Web_summary.TotalGrps > 0) Then
	Consultas_Web_summary.GetRow() ' ASPXRPT
	Consultas_Web_summary.GrpCount = 1
End If
While ((Consultas_Web_summary.HasRow AndAlso Consultas_Web_summary.GrpIndex < Consultas_Web_summary.StopGrp) OrElse Consultas_Web_summary.ShowFirstHeader)

	' Show header
	If (Consultas_Web_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Nombre.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Nombre))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Nombre.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Nombre) %>',0);"><%= Consultas_Web.Nombre.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Nombre.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Nombre.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Apellidos.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Apellidos))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Apellidos.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Apellidos) %>',0);"><%= Consultas_Web.Apellidos.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Apellidos.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Apellidos.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Telefono.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Telefono))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Telefono.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Telefono) %>',0);"><%= Consultas_Web.Telefono.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Telefono.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Telefono.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Email.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Email))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Email.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Email) %>',0);"><%= Consultas_Web.Email.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Email.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Email.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Centro.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Centro))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Centro.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Centro) %>',0);"><%= Consultas_Web.Centro.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Centro.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Centro.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Ciudad.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Ciudad))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Ciudad.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Ciudad) %>',0);"><%= Consultas_Web.Ciudad.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Ciudad.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Ciudad.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Pais.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Pais))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Pais.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Pais) %>',0);"><%= Consultas_Web.Pais.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Pais.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Pais.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.IP.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.IP))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.IP.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.IP) %>',0);"><%= Consultas_Web.IP.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.IP.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.IP.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Motivo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Motivo))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Motivo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Motivo) %>',0);"><%= Consultas_Web.Motivo.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Motivo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Motivo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Mensaje.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Mensaje))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Mensaje.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Mensaje) %>',0);"><%= Consultas_Web.Mensaje.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Mensaje.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Mensaje.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Detalle.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Detalle))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Detalle.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Detalle) %>',0);"><%= Consultas_Web.Detalle.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Detalle.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Detalle.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.ModoContacto.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.ModoContacto))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.ModoContacto.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.ModoContacto) %>',0);"><%= Consultas_Web.ModoContacto.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.ModoContacto.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.ModoContacto.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Destinatario.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Destinatario))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Destinatario.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Destinatario) %>',0);"><%= Consultas_Web.Destinatario.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Destinatario.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Destinatario.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.Web.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.Web))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.Web.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.Web) %>',0);"><%= Consultas_Web.Web.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.Web.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.Web.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.FormularioWeb.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.FormularioWeb))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.FormularioWeb.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.FormularioWeb) %>',0);"><%= Consultas_Web.FormularioWeb.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.FormularioWeb.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.FormularioWeb.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Consultas_Web.Export)) Then %>
<%= Consultas_Web.FechaHora.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Consultas_Web.SortUrl(Consultas_Web.FechaHora))) Then %>
		<td style="vertical-align: bottom;"><%= Consultas_Web.FechaHora.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Consultas_Web.SortUrl(Consultas_Web.FechaHora) %>',0);"><%= Consultas_Web.FechaHora.FldCaption() %></td><td style="width: 10px;">
		<% If (Consultas_Web.FechaHora.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Consultas_Web.FechaHora.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Consultas_Web_summary.ShowFirstHeader = False
	End If
	Consultas_Web_summary.RecCount += 1

		' Render detail row
		Consultas_Web.ResetCSS()
		Consultas_Web.RowType = EWRPT_ROWTYPE_DETAIL
		Consultas_Web_summary.RenderRow()
%>
	<tr<%= Consultas_Web.RowAttributes() %>>
		<td<%= Consultas_Web.Nombre.CellAttributes %>>
<div<%= Consultas_Web.Nombre.ViewAttributes%>><%= Consultas_Web.Nombre.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Apellidos.CellAttributes %>>
<div<%= Consultas_Web.Apellidos.ViewAttributes%>><%= Consultas_Web.Apellidos.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Telefono.CellAttributes %>>
<div<%= Consultas_Web.Telefono.ViewAttributes%>><%= Consultas_Web.Telefono.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Email.CellAttributes %>>
<div<%= Consultas_Web.Email.ViewAttributes%>><%= Consultas_Web.Email.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Centro.CellAttributes %>>
<div<%= Consultas_Web.Centro.ViewAttributes%>><%= Consultas_Web.Centro.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Ciudad.CellAttributes %>>
<div<%= Consultas_Web.Ciudad.ViewAttributes%>><%= Consultas_Web.Ciudad.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Pais.CellAttributes %>>
<div<%= Consultas_Web.Pais.ViewAttributes%>><%= Consultas_Web.Pais.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.IP.CellAttributes %>>
<div<%= Consultas_Web.IP.ViewAttributes%>><%= Consultas_Web.IP.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Motivo.CellAttributes %>>
<div<%= Consultas_Web.Motivo.ViewAttributes%>><%= Consultas_Web.Motivo.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Mensaje.CellAttributes %>>
<div<%= Consultas_Web.Mensaje.ViewAttributes%>><%= Consultas_Web.Mensaje.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Detalle.CellAttributes %>>
<div<%= Consultas_Web.Detalle.ViewAttributes%>><%= Consultas_Web.Detalle.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.ModoContacto.CellAttributes %>>
<div<%= Consultas_Web.ModoContacto.ViewAttributes%>><%= Consultas_Web.ModoContacto.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Destinatario.CellAttributes %>>
<div<%= Consultas_Web.Destinatario.ViewAttributes%>><%= Consultas_Web.Destinatario.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.Web.CellAttributes %>>
<div<%= Consultas_Web.Web.ViewAttributes%>><%= Consultas_Web.Web.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.FormularioWeb.CellAttributes %>>
<div<%= Consultas_Web.FormularioWeb.ViewAttributes%>><%= Consultas_Web.FormularioWeb.ListViewValue%></div>
</td>
		<td<%= Consultas_Web.FechaHora.CellAttributes %>>
<div<%= Consultas_Web.FechaHora.ViewAttributes%>><%= Consultas_Web.FechaHora.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Consultas_Web_summary.AccumulateSummary()

		' Get next record
		Consultas_Web_summary.GetRow() ' ASPXRPT
		Consultas_Web_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Consultas_Web_summary.TotalGrps > 0) Then
	Consultas_Web.ResetCSS()
	Consultas_Web.RowType = EWRPT_ROWTYPE_TOTAL
	Consultas_Web.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Consultas_Web.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Consultas_Web.RowAttrs("class") = "ewRptGrandSummary"
	Consultas_Web_summary.RenderRow()
%>
	<!-- tr><td colspan="16"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Consultas_Web.RowAttributes() %>><td colspan="16"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Consultas_Web_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Consultas_Web.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Consultas_Web_summary.Pager Is Nothing Then Consultas_Web_summary.Pager = New cPrevNextPager(Consultas_Web_summary.StartGrp, Consultas_Web_summary.DisplayGrps, Consultas_Web_summary.TotalGrps) %>
<% If Consultas_Web_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Consultas_Web_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Consultas_Websmry.aspx?start=<%= Consultas_Web_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Consultas_Web_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Consultas_Websmry.aspx?start=<%= Consultas_Web_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Consultas_Web_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Consultas_Web_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Consultas_Websmry.aspx?start=<%= Consultas_Web_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Consultas_Web_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Consultas_Websmry.aspx?start=<%= Consultas_Web_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Consultas_Web_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Consultas_Web_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Consultas_Web_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Consultas_Web_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Consultas_Web_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Consultas_Web_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Consultas_Web_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Consultas_Web_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Consultas_Web_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Consultas_Web.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Consultas_Web.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Consultas_Web.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Consultas_Web_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Consultas_Web.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
