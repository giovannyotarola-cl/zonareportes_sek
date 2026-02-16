<%@ Page ClassName="Estado_Alumnos_Globalsmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_EstadoAlumnosGlobal" %>
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
	Public Estado_Alumnos_Global As crEstado_Alumnos_Global = Nothing

	'
	' Table class (for Estado Alumnos Global)
	'
	Public Class crEstado_Alumnos_Global
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
				Return "Estado_Alumnos_Global"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Estado Alumnos Global"
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

		Public CODIGO_CLIENTE As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRE As crField

		Public NOMBRE_C As crField

		Public JORNADA As crField

		Public FACULTAD As crField

		Public AD1O_PRIMERA_MATRICULA As crField

		Public FECHA_MATRICULA As crField

		Public AD1O_MATRICULA As crField

		Public ESTADO_ACADEMICO As crField

		Public TIPO_SITUACION As crField

		Public DESCRIPCION_ESTADO As crField

		Public ESTADO As crField

		Public MATRICULADO As crField

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
			RUT = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' CODIGO CLIENTE
			CODIGO_CLIENTE = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_CODIGO_CLIENTE", "CODIGO CLIENTE", "[CODIGO CLIENTE]", 200, EWRPT_DATATYPE_STRING, -1)
			CODIGO_CLIENTE.Page = APage
			CODIGO_CLIENTE.ParentPage = APage.ParentPage
			Fields.Add("CODIGO_CLIENTE", CODIGO_CLIENTE)
			CODIGO_CLIENTE.DateFilter = ""
			CODIGO_CLIENTE.SqlSelect = ""
			CODIGO_CLIENTE.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + SqlFrom
			NOMBRE_C.SqlOrderBy = "[NOMBRE_C]"

			' JORNADA
			JORNADA = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			JORNADA.Page = APage
			JORNADA.ParentPage = APage.ParentPage
			Fields.Add("JORNADA", JORNADA)
			JORNADA.DateFilter = ""
			JORNADA.SqlSelect = ""
			JORNADA.SqlOrderBy = ""

			' FACULTAD
			FACULTAD = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_FACULTAD", "FACULTAD", "[FACULTAD]", 200, EWRPT_DATATYPE_STRING, -1)
			FACULTAD.Page = APage
			FACULTAD.ParentPage = APage.ParentPage
			Fields.Add("FACULTAD", FACULTAD)
			FACULTAD.DateFilter = ""
			FACULTAD.SqlSelect = ""
			FACULTAD.SqlOrderBy = ""

			' AÑO PRIMERA MATRICULA
			AD1O_PRIMERA_MATRICULA = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_AD1O_PRIMERA_MATRICULA", "AÑO PRIMERA MATRICULA", "[AÑO PRIMERA MATRICULA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			AD1O_PRIMERA_MATRICULA.Page = APage
			AD1O_PRIMERA_MATRICULA.ParentPage = APage.ParentPage
			AD1O_PRIMERA_MATRICULA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("AD1O_PRIMERA_MATRICULA", AD1O_PRIMERA_MATRICULA)
			AD1O_PRIMERA_MATRICULA.DateFilter = ""
			AD1O_PRIMERA_MATRICULA.SqlSelect = ""
			AD1O_PRIMERA_MATRICULA.SqlOrderBy = ""

			' FECHA MATRICULA
			FECHA_MATRICULA = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_FECHA_MATRICULA", "FECHA MATRICULA", "[FECHA MATRICULA]", 135, EWRPT_DATATYPE_DATE, 7)
			FECHA_MATRICULA.Page = APage
			FECHA_MATRICULA.ParentPage = APage.ParentPage
			FECHA_MATRICULA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECHA_MATRICULA", FECHA_MATRICULA)
			FECHA_MATRICULA.DateFilter = ""
			FECHA_MATRICULA.SqlSelect = ""
			FECHA_MATRICULA.SqlOrderBy = ""

			' AÑO MATRICULA
			AD1O_MATRICULA = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_AD1O_MATRICULA", "AÑO MATRICULA", "[AÑO MATRICULA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			AD1O_MATRICULA.Page = APage
			AD1O_MATRICULA.ParentPage = APage.ParentPage
			AD1O_MATRICULA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("AD1O_MATRICULA", AD1O_MATRICULA)
			AD1O_MATRICULA.DateFilter = ""
			AD1O_MATRICULA.SqlSelect = ""
			AD1O_MATRICULA.SqlOrderBy = ""

			' ESTADO ACADEMICO
			ESTADO_ACADEMICO = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_ESTADO_ACADEMICO", "ESTADO ACADEMICO", "[ESTADO ACADEMICO]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTADO_ACADEMICO.Page = APage
			ESTADO_ACADEMICO.ParentPage = APage.ParentPage
			Fields.Add("ESTADO_ACADEMICO", ESTADO_ACADEMICO)
			ESTADO_ACADEMICO.DateFilter = ""
			ESTADO_ACADEMICO.SqlSelect = ""
			ESTADO_ACADEMICO.SqlOrderBy = ""

			' TIPO SITUACION
			TIPO_SITUACION = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_TIPO_SITUACION", "TIPO SITUACION", "[TIPO SITUACION]", 131, EWRPT_DATATYPE_NUMBER, -1)
			TIPO_SITUACION.Page = APage
			TIPO_SITUACION.ParentPage = APage.ParentPage
			TIPO_SITUACION.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("TIPO_SITUACION", TIPO_SITUACION)
			TIPO_SITUACION.DateFilter = ""
			TIPO_SITUACION.SqlSelect = ""
			TIPO_SITUACION.SqlOrderBy = ""

			' DESCRIPCION ESTADO
			DESCRIPCION_ESTADO = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_DESCRIPCION_ESTADO", "DESCRIPCION ESTADO", "[DESCRIPCION ESTADO]", 200, EWRPT_DATATYPE_STRING, -1)
			DESCRIPCION_ESTADO.Page = APage
			DESCRIPCION_ESTADO.ParentPage = APage.ParentPage
			Fields.Add("DESCRIPCION_ESTADO", DESCRIPCION_ESTADO)
			DESCRIPCION_ESTADO.DateFilter = ""
			DESCRIPCION_ESTADO.SqlSelect = ""
			DESCRIPCION_ESTADO.SqlOrderBy = ""

			' ESTADO
			ESTADO = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_ESTADO", "ESTADO", "[ESTADO]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTADO.Page = APage
			ESTADO.ParentPage = APage.ParentPage
			Fields.Add("ESTADO", ESTADO)
			ESTADO.DateFilter = ""
			ESTADO.SqlSelect = ""
			ESTADO.SqlOrderBy = ""

			' MATRICULADO
			MATRICULADO = new crField("Estado_Alumnos_Global", "Estado Alumnos Global", "x_MATRICULADO", "MATRICULADO", "[MATRICULADO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATRICULADO.Page = APage
			MATRICULADO.ParentPage = APage.ParentPage
			Fields.Add("MATRICULADO", MATRICULADO)
			MATRICULADO.DateFilter = ""
			MATRICULADO.SqlSelect = ""
			MATRICULADO.SqlOrderBy = ""
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
				Return "[vista_Alumnos_totales]"
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
	Public Estado_Alumnos_Global_summary As crEstado_Alumnos_Global_summary

	'
	' Page class
	'
	Public Class crEstado_Alumnos_Global_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Estado_Alumnos_Global.UseTokenInUrl) Then
				sUrl &= "t=" & Estado_Alumnos_Global.TableVar & "&" ' Add page token
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
			If (Estado_Alumnos_Global.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Estado_Alumnos_Global.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Estado_Alumnos_Global.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Estado_Alumnos_Globalsmry 
			Get
				Return CType(m_ParentPage, Estado_Alumnos_Globalsmry)
			End Get
		End Property

		' Table object (Estado_Alumnos_Global)
		Public Property Estado_Alumnos_Global As crEstado_Alumnos_Global 
			Get		
				Return AspNetPage.Estado_Alumnos_Global ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crEstado_Alumnos_Global)
				AspNetPage.Estado_Alumnos_Global = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_EstadoAlumnosGlobal)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Estado_Alumnos_Global_summary"
			m_PageObjTypeName = "crEstado_Alumnos_Global_summary"

			' Table name
			m_TableName = "Estado Alumnos Global"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Estado_Alumnos_Global)
			Estado_Alumnos_Global = New crEstado_Alumnos_Global(Me)			

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
				Estado_Alumnos_Global.Export = ew_Get("export")
			End If
			gsExport = Estado_Alumnos_Global.Export ' Get export parameter, used in header
			gsExportFile = Estado_Alumnos_Global.TableVar ' Get export file, used in header
			If (Estado_Alumnos_Global.Export = "excel") Then
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
			Estado_Alumnos_Global.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Estado_Alumnos_Global.SqlSelect, Estado_Alumnos_Global.SqlWhere, Estado_Alumnos_Global.SqlGroupBy, Estado_Alumnos_Global.SqlHaving, Estado_Alumnos_Global.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Estado_Alumnos_Global.ExportAll AndAlso ew_NotEmpty(Estado_Alumnos_Global.Export)) Then
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
				Estado_Alumnos_Global.NOMBRE_C.DbValue = Row("NOMBRE_C")
				Estado_Alumnos_Global.JORNADA.DbValue = Row("JORNADA")
				Estado_Alumnos_Global.FACULTAD.DbValue = Row("FACULTAD")
				Estado_Alumnos_Global.ESTADO_ACADEMICO.DbValue = Row("ESTADO ACADEMICO")
				Estado_Alumnos_Global.CODIGO_CLIENTE.DbValue = Row("CODIGO CLIENTE")
				Estado_Alumnos_Global.RUT.DbValue = Row("RUT")
				Estado_Alumnos_Global.PATERNO.DbValue = Row("PATERNO")
				Estado_Alumnos_Global.MATERNO.DbValue = Row("MATERNO")
				Estado_Alumnos_Global.NOMBRE.DbValue = Row("NOMBRE")
				Estado_Alumnos_Global.FECHA_MATRICULA.DbValue = Row("FECHA MATRICULA")
				Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DbValue = Row("AÑO PRIMERA MATRICULA")
				Estado_Alumnos_Global.AD1O_MATRICULA.DbValue = Row("AÑO MATRICULA")
				Estado_Alumnos_Global.TIPO_SITUACION.DbValue = Row("TIPO SITUACION")
				Estado_Alumnos_Global.DESCRIPCION_ESTADO.DbValue = Row("DESCRIPCION ESTADO")
				Estado_Alumnos_Global.MATRICULADO.DbValue = Row("MATRICULADO")
				Estado_Alumnos_Global.ESTADO.DbValue = Row("ESTADO")
				Val(1) = Estado_Alumnos_Global.RUT.CurrentValue
				Val(2) = Estado_Alumnos_Global.CODIGO_CLIENTE.CurrentValue
				Val(3) = Estado_Alumnos_Global.PATERNO.CurrentValue
				Val(4) = Estado_Alumnos_Global.MATERNO.CurrentValue
				Val(5) = Estado_Alumnos_Global.NOMBRE.CurrentValue
				Val(6) = Estado_Alumnos_Global.NOMBRE_C.CurrentValue
				Val(7) = Estado_Alumnos_Global.JORNADA.CurrentValue
				Val(8) = Estado_Alumnos_Global.FACULTAD.CurrentValue
				Val(9) = Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.CurrentValue
				Val(10) = Estado_Alumnos_Global.FECHA_MATRICULA.CurrentValue
				Val(11) = Estado_Alumnos_Global.AD1O_MATRICULA.CurrentValue
				Val(12) = Estado_Alumnos_Global.ESTADO_ACADEMICO.CurrentValue
				Val(13) = Estado_Alumnos_Global.TIPO_SITUACION.CurrentValue
				Val(14) = Estado_Alumnos_Global.DESCRIPCION_ESTADO.CurrentValue
				Val(15) = Estado_Alumnos_Global.ESTADO.CurrentValue
				Val(16) = Estado_Alumnos_Global.MATRICULADO.CurrentValue
			Else
				Estado_Alumnos_Global.NOMBRE_C.DbValue = ""
				Estado_Alumnos_Global.JORNADA.DbValue = ""
				Estado_Alumnos_Global.FACULTAD.DbValue = ""
				Estado_Alumnos_Global.ESTADO_ACADEMICO.DbValue = ""
				Estado_Alumnos_Global.CODIGO_CLIENTE.DbValue = ""
				Estado_Alumnos_Global.RUT.DbValue = ""
				Estado_Alumnos_Global.PATERNO.DbValue = ""
				Estado_Alumnos_Global.MATERNO.DbValue = ""
				Estado_Alumnos_Global.NOMBRE.DbValue = ""
				Estado_Alumnos_Global.FECHA_MATRICULA.DbValue = ""
				Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DbValue = ""
				Estado_Alumnos_Global.AD1O_MATRICULA.DbValue = ""
				Estado_Alumnos_Global.TIPO_SITUACION.DbValue = ""
				Estado_Alumnos_Global.DESCRIPCION_ESTADO.DbValue = ""
				Estado_Alumnos_Global.MATRICULADO.DbValue = ""
				Estado_Alumnos_Global.ESTADO.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Estado_Alumnos_Global.NOMBRE_C.DbValue = dr("NOMBRE_C")
				Estado_Alumnos_Global.JORNADA.DbValue = dr("JORNADA")
				Estado_Alumnos_Global.FACULTAD.DbValue = dr("FACULTAD")
				Estado_Alumnos_Global.ESTADO_ACADEMICO.DbValue = dr("ESTADO ACADEMICO")
				Estado_Alumnos_Global.CODIGO_CLIENTE.DbValue = dr("CODIGO CLIENTE")
				Estado_Alumnos_Global.RUT.DbValue = dr("RUT")
				Estado_Alumnos_Global.PATERNO.DbValue = dr("PATERNO")
				Estado_Alumnos_Global.MATERNO.DbValue = dr("MATERNO")
				Estado_Alumnos_Global.NOMBRE.DbValue = dr("NOMBRE")
				Estado_Alumnos_Global.FECHA_MATRICULA.DbValue = dr("FECHA MATRICULA")
				Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DbValue = dr("AÑO PRIMERA MATRICULA")
				Estado_Alumnos_Global.AD1O_MATRICULA.DbValue = dr("AÑO MATRICULA")
				Estado_Alumnos_Global.TIPO_SITUACION.DbValue = dr("TIPO SITUACION")
				Estado_Alumnos_Global.DESCRIPCION_ESTADO.DbValue = dr("DESCRIPCION ESTADO")
				Estado_Alumnos_Global.MATRICULADO.DbValue = dr("MATRICULADO")
				Estado_Alumnos_Global.ESTADO.DbValue = dr("ESTADO")
				Val(1) = Estado_Alumnos_Global.RUT.CurrentValue
				Val(2) = Estado_Alumnos_Global.CODIGO_CLIENTE.CurrentValue
				Val(3) = Estado_Alumnos_Global.PATERNO.CurrentValue
				Val(4) = Estado_Alumnos_Global.MATERNO.CurrentValue
				Val(5) = Estado_Alumnos_Global.NOMBRE.CurrentValue
				Val(6) = Estado_Alumnos_Global.NOMBRE_C.CurrentValue
				Val(7) = Estado_Alumnos_Global.JORNADA.CurrentValue
				Val(8) = Estado_Alumnos_Global.FACULTAD.CurrentValue
				Val(9) = Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.CurrentValue
				Val(10) = Estado_Alumnos_Global.FECHA_MATRICULA.CurrentValue
				Val(11) = Estado_Alumnos_Global.AD1O_MATRICULA.CurrentValue
				Val(12) = Estado_Alumnos_Global.ESTADO_ACADEMICO.CurrentValue
				Val(13) = Estado_Alumnos_Global.TIPO_SITUACION.CurrentValue
				Val(14) = Estado_Alumnos_Global.DESCRIPCION_ESTADO.CurrentValue
				Val(15) = Estado_Alumnos_Global.ESTADO.CurrentValue
				Val(16) = Estado_Alumnos_Global.MATRICULADO.CurrentValue
			Else				
				Estado_Alumnos_Global.NOMBRE_C.DbValue = ""
				Estado_Alumnos_Global.JORNADA.DbValue = ""
				Estado_Alumnos_Global.FACULTAD.DbValue = ""
				Estado_Alumnos_Global.ESTADO_ACADEMICO.DbValue = ""
				Estado_Alumnos_Global.CODIGO_CLIENTE.DbValue = ""
				Estado_Alumnos_Global.RUT.DbValue = ""
				Estado_Alumnos_Global.PATERNO.DbValue = ""
				Estado_Alumnos_Global.MATERNO.DbValue = ""
				Estado_Alumnos_Global.NOMBRE.DbValue = ""
				Estado_Alumnos_Global.FECHA_MATRICULA.DbValue = ""
				Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DbValue = ""
				Estado_Alumnos_Global.AD1O_MATRICULA.DbValue = ""
				Estado_Alumnos_Global.TIPO_SITUACION.DbValue = ""
				Estado_Alumnos_Global.DESCRIPCION_ESTADO.DbValue = ""
				Estado_Alumnos_Global.MATRICULADO.DbValue = ""
				Estado_Alumnos_Global.ESTADO.DbValue = ""
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
				Estado_Alumnos_Global.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Estado_Alumnos_Global.StartGroup = StartGrp
				Else
					StartGrp = Estado_Alumnos_Global.StartGroup
				End If
			Else
				StartGrp = Estado_Alumnos_Global.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Estado_Alumnos_Global.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Estado_Alumnos_Global.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Estado_Alumnos_Global.StartGroup = StartGrp
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
			' Build distinct values for NOMBRE_C

			bNullValue = False
			bEmptyValue = False
			sSql = ewrpt_BuildReportSql(Estado_Alumnos_Global.NOMBRE_C.SqlSelect, Estado_Alumnos_Global.SqlWhere, Estado_Alumnos_Global.SqlGroupBy, Estado_Alumnos_Global.SqlHaving, Estado_Alumnos_Global.NOMBRE_C.SqlOrderBy, Filter, "")
			rswrk = Conn.GetTempDataReader(sSql)
			If rswrk IsNot Nothing Then
				While (rswrk.Read())
					Estado_Alumnos_Global.NOMBRE_C.DbValue = rswrk(0)
					If (Convert.IsDBNull(Estado_Alumnos_Global.NOMBRE_C.CurrentValue)) Then
						bNullValue = True
					ElseIf (ew_Empty(Estado_Alumnos_Global.NOMBRE_C.CurrentValue)) Then
						bEmptyValue = True
					Else
						Estado_Alumnos_Global.NOMBRE_C.ViewValue = Convert.ToString(Estado_Alumnos_Global.NOMBRE_C.CurrentValue)
						ewrpt_SetupDistinctValues(Estado_Alumnos_Global.NOMBRE_C.ValueList, Estado_Alumnos_Global.NOMBRE_C.CurrentValue, Estado_Alumnos_Global.NOMBRE_C.ViewValue, False)
					End If
				End While
			End If
			Conn.CloseTempDataReader()
			If (bEmptyValue) Then
				ewrpt_SetupDistinctValues(Estado_Alumnos_Global.NOMBRE_C.ValueList, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
			End If
			If (bNullValue) Then
				ewrpt_SetupDistinctValues(Estado_Alumnos_Global.NOMBRE_C.ValueList, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
			End If

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
					ClearSessionSelection("NOMBRE_C")
					ResetPager()
				End If
			End If

			' Load selection criteria to array
			' Get Carrera selected values

			If (ewrpt_IsArray(ew_Session("sel_Estado_Alumnos_Global_NOMBRE_C"))) Then
				LoadSelectionFromSession("NOMBRE_C")
			ElseIf (ew_SameStr(ew_Session("sel_Estado_Alumnos_Global_NOMBRE_C"), EWRPT_INIT_VALUE)) Then ' Select all
				Estado_Alumnos_Global.NOMBRE_C.SelectionList = Nothing
			End If
		End Sub

		' Reset pager to starting position
		Public Sub ResetPager()
			StartGrp = 1
			Estado_Alumnos_Global.StartGroup = StartGrp
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
				Estado_Alumnos_Global.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Estado_Alumnos_Global.StartGroup = StartGrp
			Else				
				If (Estado_Alumnos_Global.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Estado_Alumnos_Global.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Estado_Alumnos_Global.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Estado_Alumnos_Global.SqlSelectCount, Estado_Alumnos_Global.SqlWhere, Estado_Alumnos_Global.SqlGroupBy, Estado_Alumnos_Global.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Estado_Alumnos_Global.Row_Rendering()

			'
			' Render view codes
			'

			If (Estado_Alumnos_Global.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUT
				Estado_Alumnos_Global.RUT.ViewValue = Convert.ToString(Estado_Alumnos_Global.RUT.Summary)

				' CODIGO CLIENTE
				Estado_Alumnos_Global.CODIGO_CLIENTE.ViewValue = Convert.ToString(Estado_Alumnos_Global.CODIGO_CLIENTE.Summary)

				' PATERNO
				Estado_Alumnos_Global.PATERNO.ViewValue = Convert.ToString(Estado_Alumnos_Global.PATERNO.Summary)

				' MATERNO
				Estado_Alumnos_Global.MATERNO.ViewValue = Convert.ToString(Estado_Alumnos_Global.MATERNO.Summary)

				' NOMBRE
				Estado_Alumnos_Global.NOMBRE.ViewValue = Convert.ToString(Estado_Alumnos_Global.NOMBRE.Summary)

				' NOMBRE_C
				Estado_Alumnos_Global.NOMBRE_C.ViewValue = Convert.ToString(Estado_Alumnos_Global.NOMBRE_C.Summary)

				' JORNADA
				Estado_Alumnos_Global.JORNADA.ViewValue = Convert.ToString(Estado_Alumnos_Global.JORNADA.Summary)

				' FACULTAD
				Estado_Alumnos_Global.FACULTAD.ViewValue = Convert.ToString(Estado_Alumnos_Global.FACULTAD.Summary)

				' AÑO PRIMERA MATRICULA
				Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.ViewValue = Convert.ToString(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.Summary)

				' FECHA MATRICULA
				Estado_Alumnos_Global.FECHA_MATRICULA.ViewValue = Convert.ToString(Estado_Alumnos_Global.FECHA_MATRICULA.Summary)
				Estado_Alumnos_Global.FECHA_MATRICULA.ViewValue = ew_FormatDateTime(Estado_Alumnos_Global.FECHA_MATRICULA.ViewValue, 7)

				' AÑO MATRICULA
				Estado_Alumnos_Global.AD1O_MATRICULA.ViewValue = Convert.ToString(Estado_Alumnos_Global.AD1O_MATRICULA.Summary)

				' ESTADO ACADEMICO
				Estado_Alumnos_Global.ESTADO_ACADEMICO.ViewValue = Convert.ToString(Estado_Alumnos_Global.ESTADO_ACADEMICO.Summary)

				' TIPO SITUACION
				Estado_Alumnos_Global.TIPO_SITUACION.ViewValue = Convert.ToString(Estado_Alumnos_Global.TIPO_SITUACION.Summary)

				' DESCRIPCION ESTADO
				Estado_Alumnos_Global.DESCRIPCION_ESTADO.ViewValue = Convert.ToString(Estado_Alumnos_Global.DESCRIPCION_ESTADO.Summary)

				' ESTADO
				Estado_Alumnos_Global.ESTADO.ViewValue = Convert.ToString(Estado_Alumnos_Global.ESTADO.Summary)

				' MATRICULADO
				Estado_Alumnos_Global.MATRICULADO.ViewValue = Convert.ToString(Estado_Alumnos_Global.MATRICULADO.Summary)
			Else

				' RUT
				Estado_Alumnos_Global.RUT.ViewValue = Convert.ToString(Estado_Alumnos_Global.RUT.CurrentValue)
				Estado_Alumnos_Global.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODIGO CLIENTE
				Estado_Alumnos_Global.CODIGO_CLIENTE.ViewValue = Convert.ToString(Estado_Alumnos_Global.CODIGO_CLIENTE.CurrentValue)
				Estado_Alumnos_Global.CODIGO_CLIENTE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Estado_Alumnos_Global.PATERNO.ViewValue = Convert.ToString(Estado_Alumnos_Global.PATERNO.CurrentValue)
				Estado_Alumnos_Global.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Estado_Alumnos_Global.MATERNO.ViewValue = Convert.ToString(Estado_Alumnos_Global.MATERNO.CurrentValue)
				Estado_Alumnos_Global.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Estado_Alumnos_Global.NOMBRE.ViewValue = Convert.ToString(Estado_Alumnos_Global.NOMBRE.CurrentValue)
				Estado_Alumnos_Global.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				Estado_Alumnos_Global.NOMBRE_C.ViewValue = Convert.ToString(Estado_Alumnos_Global.NOMBRE_C.CurrentValue)
				Estado_Alumnos_Global.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' JORNADA
				Estado_Alumnos_Global.JORNADA.ViewValue = Convert.ToString(Estado_Alumnos_Global.JORNADA.CurrentValue)
				Estado_Alumnos_Global.JORNADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FACULTAD
				Estado_Alumnos_Global.FACULTAD.ViewValue = Convert.ToString(Estado_Alumnos_Global.FACULTAD.CurrentValue)
				Estado_Alumnos_Global.FACULTAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' AÑO PRIMERA MATRICULA
				Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.ViewValue = Convert.ToString(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.CurrentValue)
				Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' FECHA MATRICULA
				Estado_Alumnos_Global.FECHA_MATRICULA.ViewValue = Convert.ToString(Estado_Alumnos_Global.FECHA_MATRICULA.CurrentValue)
				Estado_Alumnos_Global.FECHA_MATRICULA.ViewValue = ew_FormatDateTime(Estado_Alumnos_Global.FECHA_MATRICULA.ViewValue, 7)
				Estado_Alumnos_Global.FECHA_MATRICULA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' AÑO MATRICULA
				Estado_Alumnos_Global.AD1O_MATRICULA.ViewValue = Convert.ToString(Estado_Alumnos_Global.AD1O_MATRICULA.CurrentValue)
				Estado_Alumnos_Global.AD1O_MATRICULA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTADO ACADEMICO
				Estado_Alumnos_Global.ESTADO_ACADEMICO.ViewValue = Convert.ToString(Estado_Alumnos_Global.ESTADO_ACADEMICO.CurrentValue)
				Estado_Alumnos_Global.ESTADO_ACADEMICO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TIPO SITUACION
				Estado_Alumnos_Global.TIPO_SITUACION.ViewValue = Convert.ToString(Estado_Alumnos_Global.TIPO_SITUACION.CurrentValue)
				Estado_Alumnos_Global.TIPO_SITUACION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DESCRIPCION ESTADO
				Estado_Alumnos_Global.DESCRIPCION_ESTADO.ViewValue = Convert.ToString(Estado_Alumnos_Global.DESCRIPCION_ESTADO.CurrentValue)
				Estado_Alumnos_Global.DESCRIPCION_ESTADO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTADO
				Estado_Alumnos_Global.ESTADO.ViewValue = Convert.ToString(Estado_Alumnos_Global.ESTADO.CurrentValue)
				Estado_Alumnos_Global.ESTADO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATRICULADO
				Estado_Alumnos_Global.MATRICULADO.ViewValue = Convert.ToString(Estado_Alumnos_Global.MATRICULADO.CurrentValue)
				Estado_Alumnos_Global.MATRICULADO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUT
			Estado_Alumnos_Global.RUT.HrefValue = ""

			' CODIGO CLIENTE
			Estado_Alumnos_Global.CODIGO_CLIENTE.HrefValue = ""

			' PATERNO
			Estado_Alumnos_Global.PATERNO.HrefValue = ""

			' MATERNO
			Estado_Alumnos_Global.MATERNO.HrefValue = ""

			' NOMBRE
			Estado_Alumnos_Global.NOMBRE.HrefValue = ""

			' NOMBRE_C
			Estado_Alumnos_Global.NOMBRE_C.HrefValue = ""

			' JORNADA
			Estado_Alumnos_Global.JORNADA.HrefValue = ""

			' FACULTAD
			Estado_Alumnos_Global.FACULTAD.HrefValue = ""

			' AÑO PRIMERA MATRICULA
			Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.HrefValue = ""

			' FECHA MATRICULA
			Estado_Alumnos_Global.FECHA_MATRICULA.HrefValue = ""

			' AÑO MATRICULA
			Estado_Alumnos_Global.AD1O_MATRICULA.HrefValue = ""

			' ESTADO ACADEMICO
			Estado_Alumnos_Global.ESTADO_ACADEMICO.HrefValue = ""

			' TIPO SITUACION
			Estado_Alumnos_Global.TIPO_SITUACION.HrefValue = ""

			' DESCRIPCION ESTADO
			Estado_Alumnos_Global.DESCRIPCION_ESTADO.HrefValue = ""

			' ESTADO
			Estado_Alumnos_Global.ESTADO.HrefValue = ""

			' MATRICULADO
			Estado_Alumnos_Global.MATRICULADO.HrefValue = ""

			' Call Row_Rendered event
			Estado_Alumnos_Global.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + Estado_Alumnos_Global.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Estado_Alumnos_Global.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Estado_Alumnos_Global.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field JORNADA
			sSelect = "SELECT DISTINCT [JORNADA] FROM " + Estado_Alumnos_Global.SqlFrom
			sOrderBy = "[JORNADA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Estado_Alumnos_Global.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Estado_Alumnos_Global.JORNADA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field FACULTAD
			sSelect = "SELECT DISTINCT [FACULTAD] FROM " + Estado_Alumnos_Global.SqlFrom
			sOrderBy = "[FACULTAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Estado_Alumnos_Global.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Estado_Alumnos_Global.FACULTAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field AÑO PRIMERA MATRICULA
			sSelect = "SELECT DISTINCT [AÑO PRIMERA MATRICULA] FROM " + Estado_Alumnos_Global.SqlFrom
			sOrderBy = "[AÑO PRIMERA MATRICULA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Estado_Alumnos_Global.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field AÑO MATRICULA
			sSelect = "SELECT DISTINCT [AÑO MATRICULA] FROM " + Estado_Alumnos_Global.SqlFrom
			sOrderBy = "[AÑO MATRICULA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Estado_Alumnos_Global.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Estado_Alumnos_Global.AD1O_MATRICULA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTADO ACADEMICO
			sSelect = "SELECT DISTINCT [ESTADO ACADEMICO] FROM " + Estado_Alumnos_Global.SqlFrom
			sOrderBy = "[ESTADO ACADEMICO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Estado_Alumnos_Global.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field DESCRIPCION ESTADO
			sSelect = "SELECT DISTINCT [DESCRIPCION ESTADO] FROM " + Estado_Alumnos_Global.SqlFrom
			sOrderBy = "[DESCRIPCION ESTADO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Estado_Alumnos_Global.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTADO
			sSelect = "SELECT DISTINCT [ESTADO] FROM " + Estado_Alumnos_Global.SqlFrom
			sOrderBy = "[ESTADO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Estado_Alumnos_Global.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Estado_Alumnos_Global.ESTADO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field MATRICULADO
			sSelect = "SELECT DISTINCT [MATRICULADO] FROM " + Estado_Alumnos_Global.SqlFrom
			sOrderBy = "[MATRICULADO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Estado_Alumnos_Global.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Estado_Alumnos_Global.MATRICULADO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
	End Sub

	' Return extended filter
	Public Function GetExtendedFilter() As String
		Dim sFilter As String = ""
	  Dim sWrk As String
	  Dim bPostBack As Boolean = (HttpContext.Current.Request.Form.Count > 0)
	  Dim bRestoreSession As Boolean = True
		Dim bSetupFilter As Boolean = False		
		If bPostBack Then ' Reset extended filter if filter changed

			' Clear dropdown for field NOMBRE_C
			If ClearExtFilter = "Estado_Alumnos_Global_NOMBRE_C" Then
				SetSessionDropDownValue(EWRPT_INIT_VALUE, Estado_Alumnos_Global.NOMBRE_C)
			End If
		ElseIf ew_SameText(ew_Get("cmd"), "reset") Then ' Reset search command

				' Field RUT
				SetSessionFilterValues(Estado_Alumnos_Global.RUT)

				' Field PATERNO
				SetSessionFilterValues(Estado_Alumnos_Global.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Estado_Alumnos_Global.MATERNO)

				' Field NOMBRE
				SetSessionFilterValues(Estado_Alumnos_Global.NOMBRE)

				' Field NOMBRE_C
				SetSessionDropDownValue(Estado_Alumnos_Global.NOMBRE_C.DropDownValue, Estado_Alumnos_Global.NOMBRE_C)

				' Field JORNADA
				SetSessionDropDownValue(Estado_Alumnos_Global.JORNADA.DropDownValue, Estado_Alumnos_Global.JORNADA)

				' Field FACULTAD
				SetSessionDropDownValue(Estado_Alumnos_Global.FACULTAD.DropDownValue, Estado_Alumnos_Global.FACULTAD)

				' Field AÑO PRIMERA MATRICULA
				SetSessionDropDownValue(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownValue, Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA)

				' Field AÑO MATRICULA
				SetSessionDropDownValue(Estado_Alumnos_Global.AD1O_MATRICULA.DropDownValue, Estado_Alumnos_Global.AD1O_MATRICULA)

				' Field ESTADO ACADEMICO
				SetSessionDropDownValue(Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownValue, Estado_Alumnos_Global.ESTADO_ACADEMICO)

				' Field DESCRIPCION ESTADO
				SetSessionDropDownValue(Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownValue, Estado_Alumnos_Global.DESCRIPCION_ESTADO)

				' Field ESTADO
				SetSessionDropDownValue(Estado_Alumnos_Global.ESTADO.DropDownValue, Estado_Alumnos_Global.ESTADO)

				' Field MATRICULADO
				SetSessionDropDownValue(Estado_Alumnos_Global.MATRICULADO.DropDownValue, Estado_Alumnos_Global.MATRICULADO)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT
				If (GetFilterValues(Estado_Alumnos_Global.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Estado_Alumnos_Global.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Estado_Alumnos_Global.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(Estado_Alumnos_Global.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE_C
				If (GetDropDownValue(Estado_Alumnos_Global.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Estado_Alumnos_Global.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(Estado_Alumnos_Global.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Estado_Alumnos_Global_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field JORNADA
				If (GetDropDownValue(Estado_Alumnos_Global.JORNADA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Estado_Alumnos_Global.JORNADA.DropDownValue) Then
					If Not ew_SameStr(Estado_Alumnos_Global.JORNADA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Estado_Alumnos_Global_JORNADA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field FACULTAD
				If (GetDropDownValue(Estado_Alumnos_Global.FACULTAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Estado_Alumnos_Global.FACULTAD.DropDownValue) Then
					If Not ew_SameStr(Estado_Alumnos_Global.FACULTAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Estado_Alumnos_Global_FACULTAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field AÑO PRIMERA MATRICULA
				If (GetDropDownValue(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownValue) Then
					If Not ew_SameStr(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Estado_Alumnos_Global_AD1O_PRIMERA_MATRICULA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field AÑO MATRICULA
				If (GetDropDownValue(Estado_Alumnos_Global.AD1O_MATRICULA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Estado_Alumnos_Global.AD1O_MATRICULA.DropDownValue) Then
					If Not ew_SameStr(Estado_Alumnos_Global.AD1O_MATRICULA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Estado_Alumnos_Global_AD1O_MATRICULA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ESTADO ACADEMICO
				If (GetDropDownValue(Estado_Alumnos_Global.ESTADO_ACADEMICO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownValue) Then
					If Not ew_SameStr(Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Estado_Alumnos_Global_ESTADO_ACADEMICO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field DESCRIPCION ESTADO
				If (GetDropDownValue(Estado_Alumnos_Global.DESCRIPCION_ESTADO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownValue) Then
					If Not ew_SameStr(Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Estado_Alumnos_Global_DESCRIPCION_ESTADO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ESTADO
				If (GetDropDownValue(Estado_Alumnos_Global.ESTADO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Estado_Alumnos_Global.ESTADO.DropDownValue) Then
					If Not ew_SameStr(Estado_Alumnos_Global.ESTADO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Estado_Alumnos_Global_ESTADO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field MATRICULADO
				If (GetDropDownValue(Estado_Alumnos_Global.MATRICULADO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Estado_Alumnos_Global.MATRICULADO.DropDownValue) Then
					If Not ew_SameStr(Estado_Alumnos_Global.MATRICULADO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Estado_Alumnos_Global_MATRICULADO") Is Nothing Then
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
			GetSessionFilterValues(Estado_Alumnos_Global.RUT)

			' Field PATERNO
			GetSessionFilterValues(Estado_Alumnos_Global.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Estado_Alumnos_Global.MATERNO)

			' Field NOMBRE
			GetSessionFilterValues(Estado_Alumnos_Global.NOMBRE)

			' Field NOMBRE_C
			GetSessionDropDownValue(Estado_Alumnos_Global.NOMBRE_C)

			' Field JORNADA
			GetSessionDropDownValue(Estado_Alumnos_Global.JORNADA)

			' Field FACULTAD
			GetSessionDropDownValue(Estado_Alumnos_Global.FACULTAD)

			' Field AÑO PRIMERA MATRICULA
			GetSessionDropDownValue(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA)

			' Field AÑO MATRICULA
			GetSessionDropDownValue(Estado_Alumnos_Global.AD1O_MATRICULA)

			' Field ESTADO ACADEMICO
			GetSessionDropDownValue(Estado_Alumnos_Global.ESTADO_ACADEMICO)

			' Field DESCRIPCION ESTADO
			GetSessionDropDownValue(Estado_Alumnos_Global.DESCRIPCION_ESTADO)

			' Field ESTADO
			GetSessionDropDownValue(Estado_Alumnos_Global.ESTADO)

			' Field MATRICULADO
			GetSessionDropDownValue(Estado_Alumnos_Global.MATRICULADO)
		End If

		' Call page filter validated event
		Estado_Alumnos_Global.Page_FilterValidated()

		' Build SQL
		' Field RUT

		BuildExtendedFilter(Estado_Alumnos_Global.RUT, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Estado_Alumnos_Global.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Estado_Alumnos_Global.MATERNO, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(Estado_Alumnos_Global.NOMBRE, sFilter)

		' Field NOMBRE_C
		BuildDropDownFilter(Estado_Alumnos_Global.NOMBRE_C, sFilter, "")

		' Field JORNADA
		BuildDropDownFilter(Estado_Alumnos_Global.JORNADA, sFilter, "")

		' Field FACULTAD
		BuildDropDownFilter(Estado_Alumnos_Global.FACULTAD, sFilter, "")

		' Field AÑO PRIMERA MATRICULA
		BuildDropDownFilter(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA, sFilter, "")

		' Field AÑO MATRICULA
		BuildDropDownFilter(Estado_Alumnos_Global.AD1O_MATRICULA, sFilter, "")

		' Field ESTADO ACADEMICO
		BuildDropDownFilter(Estado_Alumnos_Global.ESTADO_ACADEMICO, sFilter, "")

		' Field DESCRIPCION ESTADO
		BuildDropDownFilter(Estado_Alumnos_Global.DESCRIPCION_ESTADO, sFilter, "")

		' Field ESTADO
		BuildDropDownFilter(Estado_Alumnos_Global.ESTADO, sFilter, "")

		' Field MATRICULADO
		BuildDropDownFilter(Estado_Alumnos_Global.MATRICULADO, sFilter, "")

		' Save parms to Session
		' Field RUT

		SetSessionFilterValues(Estado_Alumnos_Global.RUT)

		' Field PATERNO
		SetSessionFilterValues(Estado_Alumnos_Global.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Estado_Alumnos_Global.MATERNO)

		' Field NOMBRE
		SetSessionFilterValues(Estado_Alumnos_Global.NOMBRE)

		' Field NOMBRE_C
		SetSessionDropDownValue(Estado_Alumnos_Global.NOMBRE_C.DropDownValue, Estado_Alumnos_Global.NOMBRE_C)

		' Field JORNADA
		SetSessionDropDownValue(Estado_Alumnos_Global.JORNADA.DropDownValue, Estado_Alumnos_Global.JORNADA)

		' Field FACULTAD
		SetSessionDropDownValue(Estado_Alumnos_Global.FACULTAD.DropDownValue, Estado_Alumnos_Global.FACULTAD)

		' Field AÑO PRIMERA MATRICULA
		SetSessionDropDownValue(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownValue, Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA)

		' Field AÑO MATRICULA
		SetSessionDropDownValue(Estado_Alumnos_Global.AD1O_MATRICULA.DropDownValue, Estado_Alumnos_Global.AD1O_MATRICULA)

		' Field ESTADO ACADEMICO
		SetSessionDropDownValue(Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownValue, Estado_Alumnos_Global.ESTADO_ACADEMICO)

		' Field DESCRIPCION ESTADO
		SetSessionDropDownValue(Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownValue, Estado_Alumnos_Global.DESCRIPCION_ESTADO)

		' Field ESTADO
		SetSessionDropDownValue(Estado_Alumnos_Global.ESTADO.DropDownValue, Estado_Alumnos_Global.ESTADO)

		' Field MATRICULADO
		SetSessionDropDownValue(Estado_Alumnos_Global.MATRICULADO.DropDownValue, Estado_Alumnos_Global.MATRICULADO)

		' Setup filter
		If bSetupFilter Then
			Dim sSql As String

			' Field NOMBRE_C
			sWrk = ""
			BuildDropDownFilter(Estado_Alumnos_Global.NOMBRE_C, sWrk, "")
			LoadSelectionFromFilter(Estado_Alumnos_Global.NOMBRE_C, sWrk, Estado_Alumnos_Global.NOMBRE_C.SelectionList)
			If (Estado_Alumnos_Global.NOMBRE_C.SelectionList Is Nothing OrElse Estado_Alumnos_Global.NOMBRE_C.SelectionList.Length = 0) Then
				ew_Session("sel_Estado_Alumnos_Global_NOMBRE_C") = EWRPT_INIT_VALUE
			Else
				ew_Session("sel_Estado_Alumnos_Global_NOMBRE_C") = Estado_Alumnos_Global.NOMBRE_C.SelectionList
			End If
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
		If ew_Session("sv_Estado_Alumnos_Global_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Estado_Alumnos_Global_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Estado_Alumnos_Global_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Estado_Alumnos_Global_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Estado_Alumnos_Global_" + parm)
		End If
		If ew_Session("so1_Estado_Alumnos_Global_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Estado_Alumnos_Global_" + parm))
		End If
		If ew_Session("sc_Estado_Alumnos_Global_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Estado_Alumnos_Global_" + parm))
		End If
		If ew_Session("sv2_Estado_Alumnos_Global_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Estado_Alumnos_Global_" + parm)
		End If
		If ew_Session("so2_Estado_Alumnos_Global_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Estado_Alumnos_Global_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Estado_Alumnos_Global_" + parm) = fld.SearchValue
		ew_Session("so1_Estado_Alumnos_Global_" + parm) = fld.SearchOperator
		ew_Session("sc_Estado_Alumnos_Global_" + parm) = fld.SearchCondition
		ew_Session("sv2_Estado_Alumnos_Global_" + parm) = fld.SearchValue2
		ew_Session("so2_Estado_Alumnos_Global_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Estado_Alumnos_Global_" + parm) = ""
		ew_Session("so1_Estado_Alumnos_Global_" + parm) = "="
		ew_Session("sc_Estado_Alumnos_Global_" + parm) = "AND"
		ew_Session("sv2_Estado_Alumnos_Global_" + parm) = ""
		ew_Session("so2_Estado_Alumnos_Global_" + parm) = "="
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
		ew_Session("sel_Estado_Alumnos_Global_" & parm) = ""
		ew_Session("rf_Estado_Alumnos_Global_" & parm) = ""
		ew_Session("rt_Estado_Alumnos_Global_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Estado_Alumnos_Global.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Estado_Alumnos_Global_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Estado_Alumnos_Global_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Estado_Alumnos_Global_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBRE_C

			Estado_Alumnos_Global.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			Estado_Alumnos_Global.NOMBRE_C.DropDownValue = Estado_Alumnos_Global.NOMBRE_C.DefaultDropDownValue
			sWrk = ""
			BuildDropDownFilter(Estado_Alumnos_Global.NOMBRE_C, sWrk, "")
			LoadSelectionFromFilter(Estado_Alumnos_Global.NOMBRE_C, sWrk, Estado_Alumnos_Global.NOMBRE_C.DefaultSelectionList)

			' Field JORNADA
			Estado_Alumnos_Global.JORNADA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Estado_Alumnos_Global.JORNADA.DropDownValue = Estado_Alumnos_Global.JORNADA.DefaultDropDownValue

			' Field FACULTAD
			Estado_Alumnos_Global.FACULTAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			Estado_Alumnos_Global.FACULTAD.DropDownValue = Estado_Alumnos_Global.FACULTAD.DefaultDropDownValue

			' Field AÑO PRIMERA MATRICULA
			Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownValue = Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DefaultDropDownValue

			' Field AÑO MATRICULA
			Estado_Alumnos_Global.AD1O_MATRICULA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Estado_Alumnos_Global.AD1O_MATRICULA.DropDownValue = Estado_Alumnos_Global.AD1O_MATRICULA.DefaultDropDownValue

			' Field ESTADO ACADEMICO
			Estado_Alumnos_Global.ESTADO_ACADEMICO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownValue = Estado_Alumnos_Global.ESTADO_ACADEMICO.DefaultDropDownValue

			' Field DESCRIPCION ESTADO
			Estado_Alumnos_Global.DESCRIPCION_ESTADO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownValue = Estado_Alumnos_Global.DESCRIPCION_ESTADO.DefaultDropDownValue

			' Field ESTADO
			Estado_Alumnos_Global.ESTADO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Estado_Alumnos_Global.ESTADO.DropDownValue = Estado_Alumnos_Global.ESTADO.DefaultDropDownValue

			' Field MATRICULADO
			Estado_Alumnos_Global.MATRICULADO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Estado_Alumnos_Global.MATRICULADO.DropDownValue = Estado_Alumnos_Global.MATRICULADO.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(Estado_Alumnos_Global.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Estado_Alumnos_Global.RUT)	

			' Field PATERNO
			SetDefaultExtFilter(Estado_Alumnos_Global.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Estado_Alumnos_Global.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Estado_Alumnos_Global.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Estado_Alumnos_Global.MATERNO)	

			' Field NOMBRE
			SetDefaultExtFilter(Estado_Alumnos_Global.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Estado_Alumnos_Global.NOMBRE)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT extended filter
		If (TextFilterApplied(Estado_Alumnos_Global.RUT)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Estado_Alumnos_Global.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Estado_Alumnos_Global.MATERNO)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(Estado_Alumnos_Global.NOMBRE)) Then bFilterExist = True

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(Estado_Alumnos_Global.NOMBRE_C)) Then bFilterExist = True

		' Check NOMBRE_C popup filter
		If Not ewrpt_MatchedArray(CTYpe(Estado_Alumnos_Global.NOMBRE_C.DefaultSelectionList.ToArray(GetType(String)), String()), Estado_Alumnos_Global.NOMBRE_C.SelectionList) Then bFilterExist = True

		' Check JORNADA dropdown filter
		If (NonTextFilterApplied(Estado_Alumnos_Global.JORNADA)) Then bFilterExist = True

		' Check FACULTAD dropdown filter
		If (NonTextFilterApplied(Estado_Alumnos_Global.FACULTAD)) Then bFilterExist = True

		' Check AÑO PRIMERA MATRICULA dropdown filter
		If (NonTextFilterApplied(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA)) Then bFilterExist = True

		' Check AÑO MATRICULA dropdown filter
		If (NonTextFilterApplied(Estado_Alumnos_Global.AD1O_MATRICULA)) Then bFilterExist = True

		' Check ESTADO ACADEMICO dropdown filter
		If (NonTextFilterApplied(Estado_Alumnos_Global.ESTADO_ACADEMICO)) Then bFilterExist = True

		' Check DESCRIPCION ESTADO dropdown filter
		If (NonTextFilterApplied(Estado_Alumnos_Global.DESCRIPCION_ESTADO)) Then bFilterExist = True

		' Check ESTADO dropdown filter
		If (NonTextFilterApplied(Estado_Alumnos_Global.ESTADO)) Then bFilterExist = True

		' Check MATRICULADO dropdown filter
		If (NonTextFilterApplied(Estado_Alumnos_Global.MATRICULADO)) Then bFilterExist = True
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
		BuildExtendedFilter(Estado_Alumnos_Global.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Estado_Alumnos_Global.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Estado_Alumnos_Global.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Estado_Alumnos_Global.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Estado_Alumnos_Global.NOMBRE_C, sExtWrk, "")
		If (ewrpt_IsArray(Estado_Alumnos_Global.NOMBRE_C.SelectionList) AndAlso Estado_Alumnos_Global.NOMBRE_C.SelectionList.Length > 0) Then
			sWrk = ewrpt_JoinArray(Estado_Alumnos_Global.NOMBRE_C.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field JORNADA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Estado_Alumnos_Global.JORNADA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.JORNADA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FACULTAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Estado_Alumnos_Global.FACULTAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.FACULTAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AÑO PRIMERA MATRICULA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AÑO MATRICULA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Estado_Alumnos_Global.AD1O_MATRICULA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.AD1O_MATRICULA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTADO ACADEMICO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Estado_Alumnos_Global.ESTADO_ACADEMICO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.ESTADO_ACADEMICO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field DESCRIPCION ESTADO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Estado_Alumnos_Global.DESCRIPCION_ESTADO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.DESCRIPCION_ESTADO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTADO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Estado_Alumnos_Global.ESTADO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.ESTADO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATRICULADO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Estado_Alumnos_Global.MATRICULADO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Estado_Alumnos_Global.MATRICULADO.FldCaption() & "<br>"
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
		If Not DropDownFilterExist(Estado_Alumnos_Global.NOMBRE_C, "") Then
			If (ewrpt_IsArray(Estado_Alumnos_Global.NOMBRE_C.SelectionList) AndAlso Estado_Alumnos_Global.NOMBRE_C.SelectionList.Length > 0) Then
				If ew_NotEmpty(sWrk) Then sWrk &= " AND "
				sWrk += ewrpt_FilterSQL(Estado_Alumnos_Global.NOMBRE_C, "[NOMBRE_C]", EWRPT_DATATYPE_STRING)
			End If		
		End If
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
				Estado_Alumnos_Global.OrderBy = ""
				Estado_Alumnos_Global.StartGroup = 1
				Estado_Alumnos_Global.RUT.Sort = ""
				Estado_Alumnos_Global.CODIGO_CLIENTE.Sort = ""
				Estado_Alumnos_Global.PATERNO.Sort = ""
				Estado_Alumnos_Global.MATERNO.Sort = ""
				Estado_Alumnos_Global.NOMBRE.Sort = ""
				Estado_Alumnos_Global.NOMBRE_C.Sort = ""
				Estado_Alumnos_Global.JORNADA.Sort = ""
				Estado_Alumnos_Global.FACULTAD.Sort = ""
				Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.Sort = ""
				Estado_Alumnos_Global.FECHA_MATRICULA.Sort = ""
				Estado_Alumnos_Global.AD1O_MATRICULA.Sort = ""
				Estado_Alumnos_Global.ESTADO_ACADEMICO.Sort = ""
				Estado_Alumnos_Global.TIPO_SITUACION.Sort = ""
				Estado_Alumnos_Global.DESCRIPCION_ESTADO.Sort = ""
				Estado_Alumnos_Global.ESTADO.Sort = ""
				Estado_Alumnos_Global.MATRICULADO.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Estado_Alumnos_Global.CurrentOrder = ew_Get("order")
			Estado_Alumnos_Global.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Estado_Alumnos_Global.SortSql()
			Estado_Alumnos_Global.OrderBy = sSortSql
			Estado_Alumnos_Global.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Estado_Alumnos_Global.OrderBy)) Then
			Estado_Alumnos_Global.OrderBy = "[PATERNO] ASC, [MATERNO] ASC"
			Estado_Alumnos_Global.PATERNO.Sort = "ASC"
			Estado_Alumnos_Global.MATERNO.Sort = "ASC"
		End If
		Return Estado_Alumnos_Global.OrderBy
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
		Estado_Alumnos_Global_summary = New crEstado_Alumnos_Global_summary(Me)
		Estado_Alumnos_Global_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Estado_Alumnos_Global_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Estado_Alumnos_Global_summary IsNot Nothing) Then Estado_Alumnos_Global_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Estado_Alumnos_Global.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Estado_Alumnos_Global_summary = new ewrpt_Page("Estado_Alumnos_Global_summary");
// page properties
Estado_Alumnos_Global_summary.PageID = "summary"; // page ID
Estado_Alumnos_Global_summary.FormID = "fEstado_Alumnos_Globalsummaryfilter"; // form ID
var EWRPT_PAGE_ID = Estado_Alumnos_Global_summary.PageID;
// extend page with ValidateForm function
Estado_Alumnos_Global_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Estado_Alumnos_Global_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Estado_Alumnos_Global_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Estado_Alumnos_Global_summary.ValidateRequired = false; // no JavaScript validation
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
<% Estado_Alumnos_Global_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Estado_Alumnos_Global.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
ewrpt_CreatePopup("Estado_Alumnos_Global_NOMBRE_C", [<%= ewrpt_GetJsData(Estado_Alumnos_Global.NOMBRE_C, Estado_Alumnos_Global.NOMBRE_C.FldType) %>]);
</script>
<div id="Estado_Alumnos_Global_NOMBRE_C_Popup" class="ewPopup">
<span class="aspnetreportmaker"></span>
</div>
<% End If %>
<% If (Estado_Alumnos_Global.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Estado_Alumnos_Global.TableCaption() %></h1></div>
<% If (Estado_Alumnos_Global.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Estado_Alumnos_Global_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" alt="Exportar a Excel" title="Exportar a Excel" /></a>
<% If (Estado_Alumnos_Global_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Estado_Alumnos_Global_summary.ShowMessage() %>
<% If (Estado_Alumnos_Global.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Estado_Alumnos_Global.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Estado_Alumnos_Global.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Estado_Alumnos_Global.FilterPanelOption = 2 OrElse (Estado_Alumnos_Global.FilterPanelOption = 3 AndAlso Estado_Alumnos_Global_summary.FilterApplied) OrElse Estado_Alumnos_Global_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Estado_Alumnos_Globalsmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fEstado_Alumnos_Globalsummaryfilter" id="fEstado_Alumnos_Globalsummaryfilter" action="Estado_Alumnos_Globalsmry.aspx" class="ewForm" onsubmit="return Estado_Alumnos_Global_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Estado_Alumnos_Global.NOMBRE_C.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="30" value="<%= ew_HtmlEncode(Estado_Alumnos_Global.RUT.SearchValue) %>"<%= IIf(Estado_Alumnos_Global_summary.ClearExtFilter = "Estado_Alumnos_Global_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Estado_Alumnos_Global.PATERNO.SearchValue) %>"<%= IIf(Estado_Alumnos_Global_summary.ClearExtFilter = "Estado_Alumnos_Global_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Estado_Alumnos_Global.MATERNO.SearchValue) %>"<%= IIf(Estado_Alumnos_Global_summary.ClearExtFilter = "Estado_Alumnos_Global_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.NOMBRE.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(Estado_Alumnos_Global.NOMBRE.SearchValue) %>"<%= IIf(Estado_Alumnos_Global_summary.ClearExtFilter = "Estado_Alumnos_Global_NOMBRE", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(Estado_Alumnos_Global_summary.ClearExtFilter = "Estado_Alumnos_Global_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Estado_Alumnos_Global.NOMBRE_C.CustomFilters.Count + Estado_Alumnos_Global.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Estado_Alumnos_Global.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Estado_Alumnos_Global.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.JORNADA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Estado_Alumnos_Global.JORNADA.CustomFilters.Count + Estado_Alumnos_Global.JORNADA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Estado_Alumnos_Global.JORNADA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "JORNADA")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Estado_Alumnos_Global.JORNADA.DropDownValue" id="Estado_Alumnos_Global.JORNADA.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.JORNADA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Estado_Alumnos_Global.JORNADA.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_JORNADA" id="sv_JORNADA" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.JORNADA.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.FACULTAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FACULTAD" id="sv_FACULTAD"<%= IIf(Estado_Alumnos_Global_summary.ClearExtFilter = "Estado_Alumnos_Global_FACULTAD", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.FACULTAD.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Estado_Alumnos_Global.FACULTAD.CustomFilters.Count + Estado_Alumnos_Global.FACULTAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Estado_Alumnos_Global.FACULTAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "FACULTAD")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.FACULTAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Estado_Alumnos_Global.FACULTAD.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.FACULTAD.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AD1O_PRIMERA_MATRICULA" id="sv_AD1O_PRIMERA_MATRICULA"<%= IIf(Estado_Alumnos_Global_summary.ClearExtFilter = "Estado_Alumnos_Global_AD1O_PRIMERA_MATRICULA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.CustomFilters.Count + Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "AÑO PRIMERA MATRICULA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.AD1O_MATRICULA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AD1O_MATRICULA" id="sv_AD1O_MATRICULA"<%= IIf(Estado_Alumnos_Global_summary.ClearExtFilter = "Estado_Alumnos_Global_AD1O_MATRICULA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.AD1O_MATRICULA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Estado_Alumnos_Global.AD1O_MATRICULA.CustomFilters.Count + Estado_Alumnos_Global.AD1O_MATRICULA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Estado_Alumnos_Global.AD1O_MATRICULA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "AÑO MATRICULA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.AD1O_MATRICULA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Estado_Alumnos_Global.AD1O_MATRICULA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.AD1O_MATRICULA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.ESTADO_ACADEMICO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Estado_Alumnos_Global.ESTADO_ACADEMICO.CustomFilters.Count + Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Estado_Alumnos_Global.ESTADO_ACADEMICO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTADO ACADEMICO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownValue" id="Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTADO_ACADEMICO" id="sv_ESTADO_ACADEMICO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.ESTADO_ACADEMICO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.DESCRIPCION_ESTADO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_DESCRIPCION_ESTADO" id="sv_DESCRIPCION_ESTADO"<%= IIf(Estado_Alumnos_Global_summary.ClearExtFilter = "Estado_Alumnos_Global_DESCRIPCION_ESTADO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Estado_Alumnos_Global.DESCRIPCION_ESTADO.CustomFilters.Count + Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Estado_Alumnos_Global.DESCRIPCION_ESTADO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "DESCRIPCION ESTADO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.DESCRIPCION_ESTADO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.ESTADO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Estado_Alumnos_Global.ESTADO.CustomFilters.Count + Estado_Alumnos_Global.ESTADO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Estado_Alumnos_Global.ESTADO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTADO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Estado_Alumnos_Global.ESTADO.DropDownValue" id="Estado_Alumnos_Global.ESTADO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.ESTADO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Estado_Alumnos_Global.ESTADO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTADO" id="sv_ESTADO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.ESTADO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Estado_Alumnos_Global.MATRICULADO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Estado_Alumnos_Global.MATRICULADO.CustomFilters.Count + Estado_Alumnos_Global.MATRICULADO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Estado_Alumnos_Global.MATRICULADO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "MATRICULADO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Estado_Alumnos_Global.MATRICULADO.DropDownValue" id="Estado_Alumnos_Global.MATRICULADO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.MATRICULADO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Estado_Alumnos_Global.MATRICULADO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_MATRICULADO" id="sv_MATRICULADO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Estado_Alumnos_Global.MATRICULADO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (Estado_Alumnos_Global.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Estado_Alumnos_Global_summary.ShowFilterList() %>
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
If (Estado_Alumnos_Global.ExportAll AndAlso ew_NotEmpty(Estado_Alumnos_Global.Export)) Then
	Estado_Alumnos_Global_summary.StopGrp = Estado_Alumnos_Global_summary.TotalGrps
Else
	Estado_Alumnos_Global_summary.StopGrp = Estado_Alumnos_Global_summary.StartGrp + Estado_Alumnos_Global_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Estado_Alumnos_Global_summary.StopGrp > Estado_Alumnos_Global_summary.TotalGrps) Then
	Estado_Alumnos_Global_summary.StopGrp = Estado_Alumnos_Global_summary.TotalGrps
End If
Estado_Alumnos_Global_summary.RecCount = 0

' Get first row
If (Estado_Alumnos_Global_summary.TotalGrps > 0) Then
	Estado_Alumnos_Global_summary.GetRow() ' ASPXRPT
	Estado_Alumnos_Global_summary.GrpCount = 1
End If
While ((Estado_Alumnos_Global_summary.HasRow AndAlso Estado_Alumnos_Global_summary.GrpIndex < Estado_Alumnos_Global_summary.StopGrp) OrElse Estado_Alumnos_Global_summary.ShowFirstHeader)

	' Show header
	If (Estado_Alumnos_Global_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.RUT) %>',0);"><%= Estado_Alumnos_Global.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.CODIGO_CLIENTE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.CODIGO_CLIENTE))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.CODIGO_CLIENTE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.CODIGO_CLIENTE) %>',0);"><%= Estado_Alumnos_Global.CODIGO_CLIENTE.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.CODIGO_CLIENTE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.CODIGO_CLIENTE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.PATERNO) %>',0);"><%= Estado_Alumnos_Global.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.MATERNO) %>',0);"><%= Estado_Alumnos_Global.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.NOMBRE) %>',0);"><%= Estado_Alumnos_Global.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.NOMBRE_C) %>',0);"><%= Estado_Alumnos_Global.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Estado_Alumnos_Global_NOMBRE_C', false, '<%= Estado_Alumnos_Global.NOMBRE_C.RangeFrom %>', '<%= Estado_Alumnos_Global.NOMBRE_C.RangeTo %>');return false;" name="x_NOMBRE_C<%= Estado_Alumnos_Global_summary.Cnt(0)(0) %>" id="x_NOMBRE_C<%= Estado_Alumnos_Global_summary.Cnt(0)(0) %>"><img src="aspxrptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.JORNADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.JORNADA))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.JORNADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.JORNADA) %>',0);"><%= Estado_Alumnos_Global.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.JORNADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.JORNADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.FACULTAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.FACULTAD))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.FACULTAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.FACULTAD) %>',0);"><%= Estado_Alumnos_Global.FACULTAD.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.FACULTAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.FACULTAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA) %>',0);"><%= Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.FECHA_MATRICULA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.FECHA_MATRICULA))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.FECHA_MATRICULA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.FECHA_MATRICULA) %>',0);"><%= Estado_Alumnos_Global.FECHA_MATRICULA.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.FECHA_MATRICULA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.FECHA_MATRICULA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.AD1O_MATRICULA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.AD1O_MATRICULA))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.AD1O_MATRICULA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.AD1O_MATRICULA) %>',0);"><%= Estado_Alumnos_Global.AD1O_MATRICULA.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.AD1O_MATRICULA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.AD1O_MATRICULA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.ESTADO_ACADEMICO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.ESTADO_ACADEMICO))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.ESTADO_ACADEMICO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.ESTADO_ACADEMICO) %>',0);"><%= Estado_Alumnos_Global.ESTADO_ACADEMICO.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.ESTADO_ACADEMICO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.ESTADO_ACADEMICO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.TIPO_SITUACION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.TIPO_SITUACION))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.TIPO_SITUACION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.TIPO_SITUACION) %>',0);"><%= Estado_Alumnos_Global.TIPO_SITUACION.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.TIPO_SITUACION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.TIPO_SITUACION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.DESCRIPCION_ESTADO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.DESCRIPCION_ESTADO))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.DESCRIPCION_ESTADO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.DESCRIPCION_ESTADO) %>',0);"><%= Estado_Alumnos_Global.DESCRIPCION_ESTADO.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.DESCRIPCION_ESTADO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.DESCRIPCION_ESTADO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.ESTADO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.ESTADO))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.ESTADO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.ESTADO) %>',0);"><%= Estado_Alumnos_Global.ESTADO.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.ESTADO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.ESTADO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Estado_Alumnos_Global.Export)) Then %>
<%= Estado_Alumnos_Global.MATRICULADO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.MATRICULADO))) Then %>
		<td style="vertical-align: bottom;"><%= Estado_Alumnos_Global.MATRICULADO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Estado_Alumnos_Global.SortUrl(Estado_Alumnos_Global.MATRICULADO) %>',0);"><%= Estado_Alumnos_Global.MATRICULADO.FldCaption() %></td><td style="width: 10px;">
		<% If (Estado_Alumnos_Global.MATRICULADO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Estado_Alumnos_Global.MATRICULADO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Estado_Alumnos_Global_summary.ShowFirstHeader = False
	End If
	Estado_Alumnos_Global_summary.RecCount += 1

		' Render detail row
		Estado_Alumnos_Global.ResetCSS()
		Estado_Alumnos_Global.RowType = EWRPT_ROWTYPE_DETAIL
		Estado_Alumnos_Global_summary.RenderRow()
%>
	<tr<%= Estado_Alumnos_Global.RowAttributes() %>>
		<td<%= Estado_Alumnos_Global.RUT.CellAttributes %>>
<div<%= Estado_Alumnos_Global.RUT.ViewAttributes%>><%= Estado_Alumnos_Global.RUT.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.CODIGO_CLIENTE.CellAttributes %>>
<div<%= Estado_Alumnos_Global.CODIGO_CLIENTE.ViewAttributes%>><%= Estado_Alumnos_Global.CODIGO_CLIENTE.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.PATERNO.CellAttributes %>>
<div<%= Estado_Alumnos_Global.PATERNO.ViewAttributes%>><%= Estado_Alumnos_Global.PATERNO.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.MATERNO.CellAttributes %>>
<div<%= Estado_Alumnos_Global.MATERNO.ViewAttributes%>><%= Estado_Alumnos_Global.MATERNO.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.NOMBRE.CellAttributes %>>
<div<%= Estado_Alumnos_Global.NOMBRE.ViewAttributes%>><%= Estado_Alumnos_Global.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.NOMBRE_C.CellAttributes %>>
<div<%= Estado_Alumnos_Global.NOMBRE_C.ViewAttributes%>><%= Estado_Alumnos_Global.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.JORNADA.CellAttributes %>>
<div<%= Estado_Alumnos_Global.JORNADA.ViewAttributes%>><%= Estado_Alumnos_Global.JORNADA.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.FACULTAD.CellAttributes %>>
<div<%= Estado_Alumnos_Global.FACULTAD.ViewAttributes%>><%= Estado_Alumnos_Global.FACULTAD.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.CellAttributes %>>
<div<%= Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.ViewAttributes%>><%= Estado_Alumnos_Global.AD1O_PRIMERA_MATRICULA.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.FECHA_MATRICULA.CellAttributes %>>
<div<%= Estado_Alumnos_Global.FECHA_MATRICULA.ViewAttributes%>><%= Estado_Alumnos_Global.FECHA_MATRICULA.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.AD1O_MATRICULA.CellAttributes %>>
<div<%= Estado_Alumnos_Global.AD1O_MATRICULA.ViewAttributes%>><%= Estado_Alumnos_Global.AD1O_MATRICULA.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.ESTADO_ACADEMICO.CellAttributes %>>
<div<%= Estado_Alumnos_Global.ESTADO_ACADEMICO.ViewAttributes%>><%= Estado_Alumnos_Global.ESTADO_ACADEMICO.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.TIPO_SITUACION.CellAttributes %>>
<div<%= Estado_Alumnos_Global.TIPO_SITUACION.ViewAttributes%>><%= Estado_Alumnos_Global.TIPO_SITUACION.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.DESCRIPCION_ESTADO.CellAttributes %>>
<div<%= Estado_Alumnos_Global.DESCRIPCION_ESTADO.ViewAttributes%>><%= Estado_Alumnos_Global.DESCRIPCION_ESTADO.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.ESTADO.CellAttributes %>>
<div<%= Estado_Alumnos_Global.ESTADO.ViewAttributes%>><%= Estado_Alumnos_Global.ESTADO.ListViewValue%></div>
</td>
		<td<%= Estado_Alumnos_Global.MATRICULADO.CellAttributes %>>
<div<%= Estado_Alumnos_Global.MATRICULADO.ViewAttributes%>><%= Estado_Alumnos_Global.MATRICULADO.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Estado_Alumnos_Global_summary.AccumulateSummary()

		' Get next record
		Estado_Alumnos_Global_summary.GetRow() ' ASPXRPT
		Estado_Alumnos_Global_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Estado_Alumnos_Global_summary.TotalGrps > 0) Then
	Estado_Alumnos_Global.ResetCSS()
	Estado_Alumnos_Global.RowType = EWRPT_ROWTYPE_TOTAL
	Estado_Alumnos_Global.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Estado_Alumnos_Global.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Estado_Alumnos_Global.RowAttrs("class") = "ewRptGrandSummary"
	Estado_Alumnos_Global_summary.RenderRow()
%>
	<!-- tr><td colspan="16"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Estado_Alumnos_Global.RowAttributes() %>><td colspan="16"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Estado_Alumnos_Global_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Estado_Alumnos_Global.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Estado_Alumnos_Global_summary.Pager Is Nothing Then Estado_Alumnos_Global_summary.Pager = New cPrevNextPager(Estado_Alumnos_Global_summary.StartGrp, Estado_Alumnos_Global_summary.DisplayGrps, Estado_Alumnos_Global_summary.TotalGrps) %>
<% If Estado_Alumnos_Global_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Estado_Alumnos_Global_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Estado_Alumnos_Globalsmry.aspx?start=<%= Estado_Alumnos_Global_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Estado_Alumnos_Global_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Estado_Alumnos_Globalsmry.aspx?start=<%= Estado_Alumnos_Global_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Estado_Alumnos_Global_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Estado_Alumnos_Global_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Estado_Alumnos_Globalsmry.aspx?start=<%= Estado_Alumnos_Global_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Estado_Alumnos_Global_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Estado_Alumnos_Globalsmry.aspx?start=<%= Estado_Alumnos_Global_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Estado_Alumnos_Global_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Estado_Alumnos_Global_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Estado_Alumnos_Global_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Estado_Alumnos_Global_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Estado_Alumnos_Global_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Estado_Alumnos_Global_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Estado_Alumnos_Global_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Estado_Alumnos_Global_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Estado_Alumnos_Global_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Estado_Alumnos_Global.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Estado_Alumnos_Global.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Estado_Alumnos_Global.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Estado_Alumnos_Global_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Estado_Alumnos_Global.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
