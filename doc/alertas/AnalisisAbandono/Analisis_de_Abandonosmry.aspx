<%@ Page ClassName="Analisis_de_Abandonosmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public Analisis_de_Abandono As crAnalisis_de_Abandono = Nothing

	'
	' Table class (for Analisis de Abandono)
	'
	Public Class crAnalisis_de_Abandono
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
				Return "Analisis_de_Abandono"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Analisis de Abandono"
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

		Public Analisis_de_Abandono_1 As crChart

		Public Fields As New Dictionary(Of String, crField)()

		Public CODCLI As crField

		Public RUT As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRE As crField

		Public SEXO As crField

		Public Cod2ECarrera As crField

		Public Carrera As crField

		Public Plan_Estudios As crField

		Public JORNADA As crField

		Public Anyo_Ingreso As crField

		Public Periodo_Ingreso As crField

		Public Estado_Actual As crField

		Public EstadoProbable As crField

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

			' CODCLI
			CODCLI = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCLI.Page = APage
			CODCLI.ParentPage = APage.ParentPage
			Fields.Add("CODCLI", CODCLI)
			CODCLI.DateFilter = ""
			CODCLI.SqlSelect = ""
			CODCLI.SqlOrderBy = ""

			' RUT
			RUT = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' SEXO
			SEXO = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1)
			SEXO.Page = APage
			SEXO.ParentPage = APage.ParentPage
			Fields.Add("SEXO", SEXO)
			SEXO.DateFilter = ""
			SEXO.SqlSelect = ""
			SEXO.SqlOrderBy = ""

			' Cod.Carrera
			Cod2ECarrera = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_Cod2ECarrera", "Cod.Carrera", "[Cod.Carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			Cod2ECarrera.Page = APage
			Cod2ECarrera.ParentPage = APage.ParentPage
			Fields.Add("Cod2ECarrera", Cod2ECarrera)
			Cod2ECarrera.DateFilter = ""
			Cod2ECarrera.SqlSelect = ""
			Cod2ECarrera.SqlOrderBy = ""

			' Carrera
			Carrera = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_Carrera", "Carrera", "[Carrera]", 200, EWRPT_DATATYPE_STRING, -1)
			Carrera.Page = APage
			Carrera.ParentPage = APage.ParentPage
			Fields.Add("Carrera", Carrera)
			Carrera.DateFilter = ""
			Carrera.SqlSelect = ""
			Carrera.SqlOrderBy = ""

			' Plan Estudios
			Plan_Estudios = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_Plan_Estudios", "Plan Estudios", "[Plan Estudios]", 200, EWRPT_DATATYPE_STRING, -1)
			Plan_Estudios.Page = APage
			Plan_Estudios.ParentPage = APage.ParentPage
			Fields.Add("Plan_Estudios", Plan_Estudios)
			Plan_Estudios.DateFilter = ""
			Plan_Estudios.SqlSelect = ""
			Plan_Estudios.SqlOrderBy = ""

			' JORNADA
			JORNADA = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			JORNADA.Page = APage
			JORNADA.ParentPage = APage.ParentPage
			Fields.Add("JORNADA", JORNADA)
			JORNADA.DateFilter = ""
			JORNADA.SqlSelect = ""
			JORNADA.SqlOrderBy = ""

			' Anyo Ingreso
			Anyo_Ingreso = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_Anyo_Ingreso", "Anyo Ingreso", "[Anyo Ingreso]", 131, EWRPT_DATATYPE_NUMBER, -1)
			Anyo_Ingreso.Page = APage
			Anyo_Ingreso.ParentPage = APage.ParentPage
			Anyo_Ingreso.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("Anyo_Ingreso", Anyo_Ingreso)
			Anyo_Ingreso.DateFilter = ""
			Anyo_Ingreso.SqlSelect = ""
			Anyo_Ingreso.SqlOrderBy = ""

			' Periodo Ingreso
			Periodo_Ingreso = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_Periodo_Ingreso", "Periodo Ingreso", "[Periodo Ingreso]", 200, EWRPT_DATATYPE_STRING, -1)
			Periodo_Ingreso.Page = APage
			Periodo_Ingreso.ParentPage = APage.ParentPage
			Fields.Add("Periodo_Ingreso", Periodo_Ingreso)
			Periodo_Ingreso.DateFilter = ""
			Periodo_Ingreso.SqlSelect = ""
			Periodo_Ingreso.SqlOrderBy = ""

			' Estado Actual
			Estado_Actual = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_Estado_Actual", "Estado Actual", "[Estado Actual]", 200, EWRPT_DATATYPE_STRING, -1)
			Estado_Actual.Page = APage
			Estado_Actual.ParentPage = APage.ParentPage
			Fields.Add("Estado_Actual", Estado_Actual)
			Estado_Actual.DateFilter = ""
			Estado_Actual.SqlSelect = ""
			Estado_Actual.SqlOrderBy = ""

			' EstadoProbable
			EstadoProbable = new crField("Analisis_de_Abandono", "Analisis de Abandono", "x_EstadoProbable", "EstadoProbable", "[EstadoProbable]", 200, EWRPT_DATATYPE_STRING, -1)
			EstadoProbable.Page = APage
			EstadoProbable.ParentPage = APage.ParentPage
			Fields.Add("EstadoProbable", EstadoProbable)
			EstadoProbable.DateFilter = ""
			EstadoProbable.SqlSelect = ""
			EstadoProbable.SqlOrderBy = ""

			' Analisis de Abandono
			Analisis_de_Abandono_1 = New crChart("Analisis_de_Abandono", "Analisis de Abandono", "Analisis_de_Abandono_1", "Analisis de Abandono", "Carrera", "EstadoProbable", "", 3, "COUNT", 1280, 440, "")
			Analisis_de_Abandono_1.Page = APage
			Analisis_de_Abandono_1.ParentPage = APage.ParentPage		
			Analisis_de_Abandono_1.SqlSelect = "SELECT [Carrera], '', COUNT([EstadoProbable]) FROM "
			Analisis_de_Abandono_1.SqlGroupBy = "[Carrera]"
			Analisis_de_Abandono_1.SqlOrderBy = ""
			Analisis_de_Abandono_1.SeriesDateType = ""
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
				Return "[VAnalisisAbandono]"
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
	Public Analisis_de_Abandono_summary As crAnalisis_de_Abandono_summary

	'
	' Page class
	'
	Public Class crAnalisis_de_Abandono_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Analisis_de_Abandono.UseTokenInUrl) Then
				sUrl &= "t=" & Analisis_de_Abandono.TableVar & "&" ' Add page token
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
			If (Analisis_de_Abandono.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Analisis_de_Abandono.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Analisis_de_Abandono.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Analisis_de_Abandonosmry 
			Get
				Return CType(m_ParentPage, Analisis_de_Abandonosmry)
			End Get
		End Property

		' Table object (Analisis_de_Abandono)
		Public Property Analisis_de_Abandono As crAnalisis_de_Abandono 
			Get		
				Return AspNetPage.Analisis_de_Abandono ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAnalisis_de_Abandono)
				AspNetPage.Analisis_de_Abandono = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Analisis_de_Abandono_summary"
			m_PageObjTypeName = "crAnalisis_de_Abandono_summary"

			' Table name
			m_TableName = "Analisis de Abandono"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Analisis_de_Abandono)
			Analisis_de_Abandono = New crAnalisis_de_Abandono(Me)			

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
				Analisis_de_Abandono.Export = ew_Get("export")
			End If
			gsExport = Analisis_de_Abandono.Export ' Get export parameter, used in header
			gsExportFile = Analisis_de_Abandono.TableVar ' Get export file, used in header
			If (Analisis_de_Abandono.Export = "excel") Then
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

		Public Val As Object() = New Object(14) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

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
			Analisis_de_Abandono.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Analisis_de_Abandono.SqlSelect, Analisis_de_Abandono.SqlWhere, Analisis_de_Abandono.SqlGroupBy, Analisis_de_Abandono.SqlHaving, Analisis_de_Abandono.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Analisis_de_Abandono.ExportAll AndAlso ew_NotEmpty(Analisis_de_Abandono.Export)) Then
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
				Analisis_de_Abandono.CODCLI.DbValue = Row("CODCLI")
				Analisis_de_Abandono.RUT.DbValue = Row("RUT")
				Analisis_de_Abandono.PATERNO.DbValue = Row("PATERNO")
				Analisis_de_Abandono.MATERNO.DbValue = Row("MATERNO")
				Analisis_de_Abandono.NOMBRE.DbValue = Row("NOMBRE")
				Analisis_de_Abandono.SEXO.DbValue = Row("SEXO")
				Analisis_de_Abandono.Cod2ECarrera.DbValue = Row("Cod.Carrera")
				Analisis_de_Abandono.Carrera.DbValue = Row("Carrera")
				Analisis_de_Abandono.Plan_Estudios.DbValue = Row("Plan Estudios")
				Analisis_de_Abandono.JORNADA.DbValue = Row("JORNADA")
				Analisis_de_Abandono.Anyo_Ingreso.DbValue = Row("Anyo Ingreso")
				Analisis_de_Abandono.Periodo_Ingreso.DbValue = Row("Periodo Ingreso")
				Analisis_de_Abandono.Estado_Actual.DbValue = Row("Estado Actual")
				Analisis_de_Abandono.EstadoProbable.DbValue = Row("EstadoProbable")
				Val(1) = Analisis_de_Abandono.CODCLI.CurrentValue
				Val(2) = Analisis_de_Abandono.RUT.CurrentValue
				Val(3) = Analisis_de_Abandono.PATERNO.CurrentValue
				Val(4) = Analisis_de_Abandono.MATERNO.CurrentValue
				Val(5) = Analisis_de_Abandono.NOMBRE.CurrentValue
				Val(6) = Analisis_de_Abandono.SEXO.CurrentValue
				Val(7) = Analisis_de_Abandono.Cod2ECarrera.CurrentValue
				Val(8) = Analisis_de_Abandono.Carrera.CurrentValue
				Val(9) = Analisis_de_Abandono.Plan_Estudios.CurrentValue
				Val(10) = Analisis_de_Abandono.JORNADA.CurrentValue
				Val(11) = Analisis_de_Abandono.Anyo_Ingreso.CurrentValue
				Val(12) = Analisis_de_Abandono.Periodo_Ingreso.CurrentValue
				Val(13) = Analisis_de_Abandono.Estado_Actual.CurrentValue
				Val(14) = Analisis_de_Abandono.EstadoProbable.CurrentValue
			Else
				Analisis_de_Abandono.CODCLI.DbValue = ""
				Analisis_de_Abandono.RUT.DbValue = ""
				Analisis_de_Abandono.PATERNO.DbValue = ""
				Analisis_de_Abandono.MATERNO.DbValue = ""
				Analisis_de_Abandono.NOMBRE.DbValue = ""
				Analisis_de_Abandono.SEXO.DbValue = ""
				Analisis_de_Abandono.Cod2ECarrera.DbValue = ""
				Analisis_de_Abandono.Carrera.DbValue = ""
				Analisis_de_Abandono.Plan_Estudios.DbValue = ""
				Analisis_de_Abandono.JORNADA.DbValue = ""
				Analisis_de_Abandono.Anyo_Ingreso.DbValue = ""
				Analisis_de_Abandono.Periodo_Ingreso.DbValue = ""
				Analisis_de_Abandono.Estado_Actual.DbValue = ""
				Analisis_de_Abandono.EstadoProbable.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Analisis_de_Abandono.CODCLI.DbValue = dr("CODCLI")
				Analisis_de_Abandono.RUT.DbValue = dr("RUT")
				Analisis_de_Abandono.PATERNO.DbValue = dr("PATERNO")
				Analisis_de_Abandono.MATERNO.DbValue = dr("MATERNO")
				Analisis_de_Abandono.NOMBRE.DbValue = dr("NOMBRE")
				Analisis_de_Abandono.SEXO.DbValue = dr("SEXO")
				Analisis_de_Abandono.Cod2ECarrera.DbValue = dr("Cod.Carrera")
				Analisis_de_Abandono.Carrera.DbValue = dr("Carrera")
				Analisis_de_Abandono.Plan_Estudios.DbValue = dr("Plan Estudios")
				Analisis_de_Abandono.JORNADA.DbValue = dr("JORNADA")
				Analisis_de_Abandono.Anyo_Ingreso.DbValue = dr("Anyo Ingreso")
				Analisis_de_Abandono.Periodo_Ingreso.DbValue = dr("Periodo Ingreso")
				Analisis_de_Abandono.Estado_Actual.DbValue = dr("Estado Actual")
				Analisis_de_Abandono.EstadoProbable.DbValue = dr("EstadoProbable")
				Val(1) = Analisis_de_Abandono.CODCLI.CurrentValue
				Val(2) = Analisis_de_Abandono.RUT.CurrentValue
				Val(3) = Analisis_de_Abandono.PATERNO.CurrentValue
				Val(4) = Analisis_de_Abandono.MATERNO.CurrentValue
				Val(5) = Analisis_de_Abandono.NOMBRE.CurrentValue
				Val(6) = Analisis_de_Abandono.SEXO.CurrentValue
				Val(7) = Analisis_de_Abandono.Cod2ECarrera.CurrentValue
				Val(8) = Analisis_de_Abandono.Carrera.CurrentValue
				Val(9) = Analisis_de_Abandono.Plan_Estudios.CurrentValue
				Val(10) = Analisis_de_Abandono.JORNADA.CurrentValue
				Val(11) = Analisis_de_Abandono.Anyo_Ingreso.CurrentValue
				Val(12) = Analisis_de_Abandono.Periodo_Ingreso.CurrentValue
				Val(13) = Analisis_de_Abandono.Estado_Actual.CurrentValue
				Val(14) = Analisis_de_Abandono.EstadoProbable.CurrentValue
			Else				
				Analisis_de_Abandono.CODCLI.DbValue = ""
				Analisis_de_Abandono.RUT.DbValue = ""
				Analisis_de_Abandono.PATERNO.DbValue = ""
				Analisis_de_Abandono.MATERNO.DbValue = ""
				Analisis_de_Abandono.NOMBRE.DbValue = ""
				Analisis_de_Abandono.SEXO.DbValue = ""
				Analisis_de_Abandono.Cod2ECarrera.DbValue = ""
				Analisis_de_Abandono.Carrera.DbValue = ""
				Analisis_de_Abandono.Plan_Estudios.DbValue = ""
				Analisis_de_Abandono.JORNADA.DbValue = ""
				Analisis_de_Abandono.Anyo_Ingreso.DbValue = ""
				Analisis_de_Abandono.Periodo_Ingreso.DbValue = ""
				Analisis_de_Abandono.Estado_Actual.DbValue = ""
				Analisis_de_Abandono.EstadoProbable.DbValue = ""
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
				Analisis_de_Abandono.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Analisis_de_Abandono.StartGroup = StartGrp
				Else
					StartGrp = Analisis_de_Abandono.StartGroup
				End If
			Else
				StartGrp = Analisis_de_Abandono.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Analisis_de_Abandono.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Analisis_de_Abandono.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Analisis_de_Abandono.StartGroup = StartGrp
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
			Analisis_de_Abandono.StartGroup = StartGrp
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
				Analisis_de_Abandono.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Analisis_de_Abandono.StartGroup = StartGrp
			Else				
				If (Analisis_de_Abandono.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Analisis_de_Abandono.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 15 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Analisis_de_Abandono.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Analisis_de_Abandono.SqlSelectCount, Analisis_de_Abandono.SqlWhere, Analisis_de_Abandono.SqlGroupBy, Analisis_de_Abandono.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Analisis_de_Abandono.Row_Rendering()

			'
			' Render view codes
			'

			If (Analisis_de_Abandono.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' CODCLI
				Analisis_de_Abandono.CODCLI.ViewValue = Convert.ToString(Analisis_de_Abandono.CODCLI.Summary)

				' RUT
				Analisis_de_Abandono.RUT.ViewValue = Convert.ToString(Analisis_de_Abandono.RUT.Summary)

				' PATERNO
				Analisis_de_Abandono.PATERNO.ViewValue = Convert.ToString(Analisis_de_Abandono.PATERNO.Summary)

				' MATERNO
				Analisis_de_Abandono.MATERNO.ViewValue = Convert.ToString(Analisis_de_Abandono.MATERNO.Summary)

				' NOMBRE
				Analisis_de_Abandono.NOMBRE.ViewValue = Convert.ToString(Analisis_de_Abandono.NOMBRE.Summary)

				' SEXO
				Analisis_de_Abandono.SEXO.ViewValue = Convert.ToString(Analisis_de_Abandono.SEXO.Summary)

				' Cod.Carrera
				Analisis_de_Abandono.Cod2ECarrera.ViewValue = Convert.ToString(Analisis_de_Abandono.Cod2ECarrera.Summary)

				' Carrera
				Analisis_de_Abandono.Carrera.ViewValue = Convert.ToString(Analisis_de_Abandono.Carrera.Summary)

				' Plan Estudios
				Analisis_de_Abandono.Plan_Estudios.ViewValue = Convert.ToString(Analisis_de_Abandono.Plan_Estudios.Summary)

				' JORNADA
				Analisis_de_Abandono.JORNADA.ViewValue = Convert.ToString(Analisis_de_Abandono.JORNADA.Summary)
				Analisis_de_Abandono.JORNADA.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Anyo Ingreso
				Analisis_de_Abandono.Anyo_Ingreso.ViewValue = Convert.ToString(Analisis_de_Abandono.Anyo_Ingreso.Summary)
				Analisis_de_Abandono.Anyo_Ingreso.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Periodo Ingreso
				Analisis_de_Abandono.Periodo_Ingreso.ViewValue = Convert.ToString(Analisis_de_Abandono.Periodo_Ingreso.Summary)
				Analisis_de_Abandono.Periodo_Ingreso.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' Estado Actual
				Analisis_de_Abandono.Estado_Actual.ViewValue = Convert.ToString(Analisis_de_Abandono.Estado_Actual.Summary)

				' EstadoProbable
				Analisis_de_Abandono.EstadoProbable.ViewValue = Convert.ToString(Analisis_de_Abandono.EstadoProbable.Summary)
			Else

				' CODCLI
				Analisis_de_Abandono.CODCLI.ViewValue = Convert.ToString(Analisis_de_Abandono.CODCLI.CurrentValue)
				Analisis_de_Abandono.CODCLI.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				Analisis_de_Abandono.RUT.ViewValue = Convert.ToString(Analisis_de_Abandono.RUT.CurrentValue)
				Analisis_de_Abandono.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Analisis_de_Abandono.PATERNO.ViewValue = Convert.ToString(Analisis_de_Abandono.PATERNO.CurrentValue)
				Analisis_de_Abandono.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Analisis_de_Abandono.MATERNO.ViewValue = Convert.ToString(Analisis_de_Abandono.MATERNO.CurrentValue)
				Analisis_de_Abandono.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Analisis_de_Abandono.NOMBRE.ViewValue = Convert.ToString(Analisis_de_Abandono.NOMBRE.CurrentValue)
				Analisis_de_Abandono.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SEXO
				Analisis_de_Abandono.SEXO.ViewValue = Convert.ToString(Analisis_de_Abandono.SEXO.CurrentValue)
				Analisis_de_Abandono.SEXO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Cod.Carrera
				Analisis_de_Abandono.Cod2ECarrera.ViewValue = Convert.ToString(Analisis_de_Abandono.Cod2ECarrera.CurrentValue)
				Analisis_de_Abandono.Cod2ECarrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Carrera
				Analisis_de_Abandono.Carrera.ViewValue = Convert.ToString(Analisis_de_Abandono.Carrera.CurrentValue)
				Analisis_de_Abandono.Carrera.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Plan Estudios
				Analisis_de_Abandono.Plan_Estudios.ViewValue = Convert.ToString(Analisis_de_Abandono.Plan_Estudios.CurrentValue)
				Analisis_de_Abandono.Plan_Estudios.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' JORNADA
				Analisis_de_Abandono.JORNADA.ViewValue = Convert.ToString(Analisis_de_Abandono.JORNADA.CurrentValue)
				Analisis_de_Abandono.JORNADA.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Analisis_de_Abandono.JORNADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Anyo Ingreso
				Analisis_de_Abandono.Anyo_Ingreso.ViewValue = Convert.ToString(Analisis_de_Abandono.Anyo_Ingreso.CurrentValue)
				Analisis_de_Abandono.Anyo_Ingreso.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Analisis_de_Abandono.Anyo_Ingreso.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Periodo Ingreso
				Analisis_de_Abandono.Periodo_Ingreso.ViewValue = Convert.ToString(Analisis_de_Abandono.Periodo_Ingreso.CurrentValue)
				Analisis_de_Abandono.Periodo_Ingreso.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				Analisis_de_Abandono.Periodo_Ingreso.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Estado Actual
				Analisis_de_Abandono.Estado_Actual.ViewValue = Convert.ToString(Analisis_de_Abandono.Estado_Actual.CurrentValue)
				Analisis_de_Abandono.Estado_Actual.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' EstadoProbable
				Analisis_de_Abandono.EstadoProbable.ViewValue = Convert.ToString(Analisis_de_Abandono.EstadoProbable.CurrentValue)
				Analisis_de_Abandono.EstadoProbable.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' CODCLI
			Analisis_de_Abandono.CODCLI.HrefValue = ""

			' RUT
			Analisis_de_Abandono.RUT.HrefValue = ""

			' PATERNO
			Analisis_de_Abandono.PATERNO.HrefValue = ""

			' MATERNO
			Analisis_de_Abandono.MATERNO.HrefValue = ""

			' NOMBRE
			Analisis_de_Abandono.NOMBRE.HrefValue = ""

			' SEXO
			Analisis_de_Abandono.SEXO.HrefValue = ""

			' Cod.Carrera
			Analisis_de_Abandono.Cod2ECarrera.HrefValue = ""

			' Carrera
			Analisis_de_Abandono.Carrera.HrefValue = ""

			' Plan Estudios
			Analisis_de_Abandono.Plan_Estudios.HrefValue = ""

			' JORNADA
			Analisis_de_Abandono.JORNADA.HrefValue = ""

			' Anyo Ingreso
			Analisis_de_Abandono.Anyo_Ingreso.HrefValue = ""

			' Periodo Ingreso
			Analisis_de_Abandono.Periodo_Ingreso.HrefValue = ""

			' Estado Actual
			Analisis_de_Abandono.Estado_Actual.HrefValue = ""

			' EstadoProbable
			Analisis_de_Abandono.EstadoProbable.HrefValue = ""

			' Call Row_Rendered event
			Analisis_de_Abandono.Row_Rendered()
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

			' Field SEXO
			sSelect = "SELECT DISTINCT [SEXO] FROM " + Analisis_de_Abandono.SqlFrom
			sOrderBy = "[SEXO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_de_Abandono.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_de_Abandono.SEXO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Carrera
			sSelect = "SELECT DISTINCT [Carrera] FROM " + Analisis_de_Abandono.SqlFrom
			sOrderBy = "[Carrera] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_de_Abandono.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_de_Abandono.Carrera.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Plan Estudios
			sSelect = "SELECT DISTINCT [Plan Estudios] FROM " + Analisis_de_Abandono.SqlFrom
			sOrderBy = "[Plan Estudios] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_de_Abandono.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_de_Abandono.Plan_Estudios.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Periodo Ingreso
			sSelect = "SELECT DISTINCT [Periodo Ingreso] FROM " + Analisis_de_Abandono.SqlFrom
			sOrderBy = "[Periodo Ingreso] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_de_Abandono.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_de_Abandono.Periodo_Ingreso.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Estado Actual
			sSelect = "SELECT DISTINCT [Estado Actual] FROM " + Analisis_de_Abandono.SqlFrom
			sOrderBy = "[Estado Actual] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_de_Abandono.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_de_Abandono.Estado_Actual.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field EstadoProbable
			sSelect = "SELECT DISTINCT [EstadoProbable] FROM " + Analisis_de_Abandono.SqlFrom
			sOrderBy = "[EstadoProbable] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Analisis_de_Abandono.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Analisis_de_Abandono.EstadoProbable.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(Analisis_de_Abandono.RUT)

				' Field PATERNO
				SetSessionFilterValues(Analisis_de_Abandono.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Analisis_de_Abandono.MATERNO)

				' Field NOMBRE
				SetSessionFilterValues(Analisis_de_Abandono.NOMBRE)

				' Field SEXO
				SetSessionDropDownValue(Analisis_de_Abandono.SEXO.DropDownValue, Analisis_de_Abandono.SEXO)

				' Field Carrera
				SetSessionDropDownValue(Analisis_de_Abandono.Carrera.DropDownValue, Analisis_de_Abandono.Carrera)

				' Field Plan Estudios
				SetSessionDropDownValue(Analisis_de_Abandono.Plan_Estudios.DropDownValue, Analisis_de_Abandono.Plan_Estudios)

				' Field Periodo Ingreso
				SetSessionDropDownValue(Analisis_de_Abandono.Periodo_Ingreso.DropDownValue, Analisis_de_Abandono.Periodo_Ingreso)

				' Field Estado Actual
				SetSessionDropDownValue(Analisis_de_Abandono.Estado_Actual.DropDownValue, Analisis_de_Abandono.Estado_Actual)

				' Field EstadoProbable
				SetSessionDropDownValue(Analisis_de_Abandono.EstadoProbable.DropDownValue, Analisis_de_Abandono.EstadoProbable)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT
				If (GetFilterValues(Analisis_de_Abandono.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(Analisis_de_Abandono.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Analisis_de_Abandono.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(Analisis_de_Abandono.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field SEXO
				If (GetDropDownValue(Analisis_de_Abandono.SEXO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_de_Abandono.SEXO.DropDownValue) Then
					If Not ew_SameStr(Analisis_de_Abandono.SEXO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_de_Abandono_SEXO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Carrera
				If (GetDropDownValue(Analisis_de_Abandono.Carrera)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_de_Abandono.Carrera.DropDownValue) Then
					If Not ew_SameStr(Analisis_de_Abandono.Carrera.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_de_Abandono_Carrera") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Plan Estudios
				If (GetDropDownValue(Analisis_de_Abandono.Plan_Estudios)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_de_Abandono.Plan_Estudios.DropDownValue) Then
					If Not ew_SameStr(Analisis_de_Abandono.Plan_Estudios.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_de_Abandono_Plan_Estudios") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Periodo Ingreso
				If (GetDropDownValue(Analisis_de_Abandono.Periodo_Ingreso)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_de_Abandono.Periodo_Ingreso.DropDownValue) Then
					If Not ew_SameStr(Analisis_de_Abandono.Periodo_Ingreso.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_de_Abandono_Periodo_Ingreso") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Estado Actual
				If (GetDropDownValue(Analisis_de_Abandono.Estado_Actual)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_de_Abandono.Estado_Actual.DropDownValue) Then
					If Not ew_SameStr(Analisis_de_Abandono.Estado_Actual.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_de_Abandono_Estado_Actual") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field EstadoProbable
				If (GetDropDownValue(Analisis_de_Abandono.EstadoProbable)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Analisis_de_Abandono.EstadoProbable.DropDownValue) Then
					If Not ew_SameStr(Analisis_de_Abandono.EstadoProbable.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Analisis_de_Abandono_EstadoProbable") Is Nothing Then
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
			GetSessionFilterValues(Analisis_de_Abandono.RUT)

			' Field PATERNO
			GetSessionFilterValues(Analisis_de_Abandono.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Analisis_de_Abandono.MATERNO)

			' Field NOMBRE
			GetSessionFilterValues(Analisis_de_Abandono.NOMBRE)

			' Field SEXO
			GetSessionDropDownValue(Analisis_de_Abandono.SEXO)

			' Field Carrera
			GetSessionDropDownValue(Analisis_de_Abandono.Carrera)

			' Field Plan Estudios
			GetSessionDropDownValue(Analisis_de_Abandono.Plan_Estudios)

			' Field Periodo Ingreso
			GetSessionDropDownValue(Analisis_de_Abandono.Periodo_Ingreso)

			' Field Estado Actual
			GetSessionDropDownValue(Analisis_de_Abandono.Estado_Actual)

			' Field EstadoProbable
			GetSessionDropDownValue(Analisis_de_Abandono.EstadoProbable)
		End If

		' Call page filter validated event
		Analisis_de_Abandono.Page_FilterValidated()

		' Build SQL
		' Field RUT

		BuildExtendedFilter(Analisis_de_Abandono.RUT, sFilter)

		' Field PATERNO
		BuildExtendedFilter(Analisis_de_Abandono.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Analisis_de_Abandono.MATERNO, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(Analisis_de_Abandono.NOMBRE, sFilter)

		' Field SEXO
		BuildDropDownFilter(Analisis_de_Abandono.SEXO, sFilter, "")

		' Field Carrera
		BuildDropDownFilter(Analisis_de_Abandono.Carrera, sFilter, "")

		' Field Plan Estudios
		BuildDropDownFilter(Analisis_de_Abandono.Plan_Estudios, sFilter, "")

		' Field Periodo Ingreso
		BuildDropDownFilter(Analisis_de_Abandono.Periodo_Ingreso, sFilter, "")

		' Field Estado Actual
		BuildDropDownFilter(Analisis_de_Abandono.Estado_Actual, sFilter, "")

		' Field EstadoProbable
		BuildDropDownFilter(Analisis_de_Abandono.EstadoProbable, sFilter, "")

		' Save parms to Session
		' Field RUT

		SetSessionFilterValues(Analisis_de_Abandono.RUT)

		' Field PATERNO
		SetSessionFilterValues(Analisis_de_Abandono.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Analisis_de_Abandono.MATERNO)

		' Field NOMBRE
		SetSessionFilterValues(Analisis_de_Abandono.NOMBRE)

		' Field SEXO
		SetSessionDropDownValue(Analisis_de_Abandono.SEXO.DropDownValue, Analisis_de_Abandono.SEXO)

		' Field Carrera
		SetSessionDropDownValue(Analisis_de_Abandono.Carrera.DropDownValue, Analisis_de_Abandono.Carrera)

		' Field Plan Estudios
		SetSessionDropDownValue(Analisis_de_Abandono.Plan_Estudios.DropDownValue, Analisis_de_Abandono.Plan_Estudios)

		' Field Periodo Ingreso
		SetSessionDropDownValue(Analisis_de_Abandono.Periodo_Ingreso.DropDownValue, Analisis_de_Abandono.Periodo_Ingreso)

		' Field Estado Actual
		SetSessionDropDownValue(Analisis_de_Abandono.Estado_Actual.DropDownValue, Analisis_de_Abandono.Estado_Actual)

		' Field EstadoProbable
		SetSessionDropDownValue(Analisis_de_Abandono.EstadoProbable.DropDownValue, Analisis_de_Abandono.EstadoProbable)

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
		If ew_Session("sv_Analisis_de_Abandono_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Analisis_de_Abandono_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Analisis_de_Abandono_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Analisis_de_Abandono_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Analisis_de_Abandono_" + parm)
		End If
		If ew_Session("so1_Analisis_de_Abandono_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Analisis_de_Abandono_" + parm))
		End If
		If ew_Session("sc_Analisis_de_Abandono_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Analisis_de_Abandono_" + parm))
		End If
		If ew_Session("sv2_Analisis_de_Abandono_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Analisis_de_Abandono_" + parm)
		End If
		If ew_Session("so2_Analisis_de_Abandono_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Analisis_de_Abandono_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Analisis_de_Abandono_" + parm) = fld.SearchValue
		ew_Session("so1_Analisis_de_Abandono_" + parm) = fld.SearchOperator
		ew_Session("sc_Analisis_de_Abandono_" + parm) = fld.SearchCondition
		ew_Session("sv2_Analisis_de_Abandono_" + parm) = fld.SearchValue2
		ew_Session("so2_Analisis_de_Abandono_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Analisis_de_Abandono_" + parm) = ""
		ew_Session("so1_Analisis_de_Abandono_" + parm) = "="
		ew_Session("sc_Analisis_de_Abandono_" + parm) = "AND"
		ew_Session("sv2_Analisis_de_Abandono_" + parm) = ""
		ew_Session("so2_Analisis_de_Abandono_" + parm) = "="
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
		ew_Session("sel_Analisis_de_Abandono_" & parm) = ""
		ew_Session("rf_Analisis_de_Abandono_" & parm) = ""
		ew_Session("rt_Analisis_de_Abandono_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Analisis_de_Abandono.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Analisis_de_Abandono_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Analisis_de_Abandono_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Analisis_de_Abandono_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field SEXO

			Analisis_de_Abandono.SEXO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_de_Abandono.SEXO.DropDownValue = Analisis_de_Abandono.SEXO.DefaultDropDownValue

			' Field Carrera
			Analisis_de_Abandono.Carrera.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_de_Abandono.Carrera.DropDownValue = Analisis_de_Abandono.Carrera.DefaultDropDownValue

			' Field Plan Estudios
			Analisis_de_Abandono.Plan_Estudios.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_de_Abandono.Plan_Estudios.DropDownValue = Analisis_de_Abandono.Plan_Estudios.DefaultDropDownValue

			' Field Periodo Ingreso
			Analisis_de_Abandono.Periodo_Ingreso.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_de_Abandono.Periodo_Ingreso.DropDownValue = Analisis_de_Abandono.Periodo_Ingreso.DefaultDropDownValue

			' Field Estado Actual
			Analisis_de_Abandono.Estado_Actual.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_de_Abandono.Estado_Actual.DropDownValue = Analisis_de_Abandono.Estado_Actual.DefaultDropDownValue

			' Field EstadoProbable
			Analisis_de_Abandono.EstadoProbable.DefaultDropDownValue = EWRPT_INIT_VALUE
			Analisis_de_Abandono.EstadoProbable.DropDownValue = Analisis_de_Abandono.EstadoProbable.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(Analisis_de_Abandono.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Analisis_de_Abandono.RUT)	

			' Field PATERNO
			SetDefaultExtFilter(Analisis_de_Abandono.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Analisis_de_Abandono.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Analisis_de_Abandono.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Analisis_de_Abandono.MATERNO)	

			' Field NOMBRE
			SetDefaultExtFilter(Analisis_de_Abandono.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Analisis_de_Abandono.NOMBRE)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT extended filter
		If (TextFilterApplied(Analisis_de_Abandono.RUT)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(Analisis_de_Abandono.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Analisis_de_Abandono.MATERNO)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(Analisis_de_Abandono.NOMBRE)) Then bFilterExist = True

		' Check SEXO dropdown filter
		If (NonTextFilterApplied(Analisis_de_Abandono.SEXO)) Then bFilterExist = True

		' Check Carrera dropdown filter
		If (NonTextFilterApplied(Analisis_de_Abandono.Carrera)) Then bFilterExist = True

		' Check Plan Estudios dropdown filter
		If (NonTextFilterApplied(Analisis_de_Abandono.Plan_Estudios)) Then bFilterExist = True

		' Check Periodo Ingreso dropdown filter
		If (NonTextFilterApplied(Analisis_de_Abandono.Periodo_Ingreso)) Then bFilterExist = True

		' Check Estado Actual dropdown filter
		If (NonTextFilterApplied(Analisis_de_Abandono.Estado_Actual)) Then bFilterExist = True

		' Check EstadoProbable dropdown filter
		If (NonTextFilterApplied(Analisis_de_Abandono.EstadoProbable)) Then bFilterExist = True
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
		BuildExtendedFilter(Analisis_de_Abandono.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Analisis_de_Abandono.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Analisis_de_Abandono.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Analisis_de_Abandono.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field SEXO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_de_Abandono.SEXO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.SEXO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Carrera
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_de_Abandono.Carrera, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.Carrera.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Plan Estudios
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_de_Abandono.Plan_Estudios, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.Plan_Estudios.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Periodo Ingreso
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_de_Abandono.Periodo_Ingreso, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.Periodo_Ingreso.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Estado Actual
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_de_Abandono.Estado_Actual, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.Estado_Actual.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field EstadoProbable
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Analisis_de_Abandono.EstadoProbable, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Analisis_de_Abandono.EstadoProbable.FldCaption() & "<br>"
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
				Analisis_de_Abandono.OrderBy = ""
				Analisis_de_Abandono.StartGroup = 1
				Analisis_de_Abandono.CODCLI.Sort = ""
				Analisis_de_Abandono.RUT.Sort = ""
				Analisis_de_Abandono.PATERNO.Sort = ""
				Analisis_de_Abandono.MATERNO.Sort = ""
				Analisis_de_Abandono.NOMBRE.Sort = ""
				Analisis_de_Abandono.SEXO.Sort = ""
				Analisis_de_Abandono.Cod2ECarrera.Sort = ""
				Analisis_de_Abandono.Carrera.Sort = ""
				Analisis_de_Abandono.Plan_Estudios.Sort = ""
				Analisis_de_Abandono.JORNADA.Sort = ""
				Analisis_de_Abandono.Anyo_Ingreso.Sort = ""
				Analisis_de_Abandono.Periodo_Ingreso.Sort = ""
				Analisis_de_Abandono.Estado_Actual.Sort = ""
				Analisis_de_Abandono.EstadoProbable.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Analisis_de_Abandono.CurrentOrder = ew_Get("order")
			Analisis_de_Abandono.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Analisis_de_Abandono.SortSql()
			Analisis_de_Abandono.OrderBy = sSortSql
			Analisis_de_Abandono.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Analisis_de_Abandono.OrderBy)) Then
			Analisis_de_Abandono.OrderBy = "[Carrera] ASC"
			Analisis_de_Abandono.Carrera.Sort = "ASC"
		End If
		Return Analisis_de_Abandono.OrderBy
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
		Analisis_de_Abandono_summary = New crAnalisis_de_Abandono_summary(Me)
		Analisis_de_Abandono_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Analisis_de_Abandono_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Analisis_de_Abandono_summary IsNot Nothing) Then Analisis_de_Abandono_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Analisis_de_Abandono.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Analisis_de_Abandono_summary = new ewrpt_Page("Analisis_de_Abandono_summary");
// page properties
Analisis_de_Abandono_summary.PageID = "summary"; // page ID
Analisis_de_Abandono_summary.FormID = "fAnalisis_de_Abandonosummaryfilter"; // form ID
var EWRPT_PAGE_ID = Analisis_de_Abandono_summary.PageID;
// extend page with ValidateForm function
Analisis_de_Abandono_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Analisis_de_Abandono_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Analisis_de_Abandono_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Analisis_de_Abandono_summary.ValidateRequired = false; // no JavaScript validation
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
<% Analisis_de_Abandono_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Analisis_de_Abandono.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Analisis_de_Abandono.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>

    <div id="underline">
<h1><%= Analisis_de_Abandono.TableCaption() %></h1>
</div>
<% If (Analisis_de_Abandono.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Analisis_de_Abandono_summary.ExportExcelUrl %>"><img src="images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
<% If (Analisis_de_Abandono_summary.FilterApplied) Then %>
&nbsp;&nbsp;<a href="Analisis_de_Abandonosmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
</div><br><br>
<% Analisis_de_Abandono_summary.ShowMessage() %>
<% If (Analisis_de_Abandono.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Analisis_de_Abandono.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (Analisis_de_Abandono.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (Analisis_de_Abandono.FilterPanelOption = 2 OrElse (Analisis_de_Abandono.FilterPanelOption = 3 AndAlso Analisis_de_Abandono_summary.FilterApplied) OrElse Analisis_de_Abandono_summary.Filter = "0=101") Then
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
<form name="fAnalisis_de_Abandonosummaryfilter" id="fAnalisis_de_Abandonosummaryfilter" action="Analisis_de_Abandonosmry.aspx" class="ewForm" onsubmit="return Analisis_de_Abandono_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Analisis_de_Abandono.NOMBRE.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.RUT.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_RUT" id="so1_RUT" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="30" value="<%= ew_HtmlEncode(Analisis_de_Abandono.RUT.SearchValue) %>"<%= IIf(Analisis_de_Abandono_summary.ClearExtFilter = "Analisis_de_Abandono_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.PATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_PATERNO" id="so1_PATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Analisis_de_Abandono.PATERNO.SearchValue) %>"<%= IIf(Analisis_de_Abandono_summary.ClearExtFilter = "Analisis_de_Abandono_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.MATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_MATERNO" id="so1_MATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Analisis_de_Abandono.MATERNO.SearchValue) %>"<%= IIf(Analisis_de_Abandono_summary.ClearExtFilter = "Analisis_de_Abandono_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.NOMBRE.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_NOMBRE" id="so1_NOMBRE" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(Analisis_de_Abandono.NOMBRE.SearchValue) %>"<%= IIf(Analisis_de_Abandono_summary.ClearExtFilter = "Analisis_de_Abandono_NOMBRE", " class=""ewInputCleared""", "") %>>
</span></td>
				<td><span style="color: rgb(34, 34, 34); font-family: Consolas, 'Lucida Console', monospace; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;"></span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.SEXO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Analisis_de_Abandono.SEXO.CustomFilters.Count + Analisis_de_Abandono.SEXO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_de_Abandono.SEXO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "SEXO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="radio" name="Analisis_de_Abandono.SEXO.DropDownValue" id="Analisis_de_Abandono.SEXO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.SEXO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_de_Abandono.SEXO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="radio" name="sv_SEXO" id="sv_SEXO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.SEXO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.Carrera.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Carrera" id="sv_Carrera"<%= IIf(Analisis_de_Abandono_summary.ClearExtFilter = "Analisis_de_Abandono_Carrera", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Carrera.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Analisis_de_Abandono.Carrera.CustomFilters.Count + Analisis_de_Abandono.Carrera.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_de_Abandono.Carrera.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Carrera")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Carrera.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_de_Abandono.Carrera.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Carrera.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.Plan_Estudios.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Plan_Estudios" id="sv_Plan_Estudios"<%= IIf(Analisis_de_Abandono_summary.ClearExtFilter = "Analisis_de_Abandono_Plan_Estudios", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Plan_Estudios.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Analisis_de_Abandono.Plan_Estudios.CustomFilters.Count + Analisis_de_Abandono.Plan_Estudios.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_de_Abandono.Plan_Estudios.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Plan Estudios")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Plan_Estudios.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_de_Abandono.Plan_Estudios.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Plan_Estudios.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.Periodo_Ingreso.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Periodo_Ingreso" id="sv_Periodo_Ingreso"<%= IIf(Analisis_de_Abandono_summary.ClearExtFilter = "Analisis_de_Abandono_Periodo_Ingreso", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Periodo_Ingreso.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Analisis_de_Abandono.Periodo_Ingreso.CustomFilters.Count + Analisis_de_Abandono.Periodo_Ingreso.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_de_Abandono.Periodo_Ingreso.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Periodo Ingreso")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Periodo_Ingreso.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_de_Abandono.Periodo_Ingreso.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Periodo_Ingreso.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.Estado_Actual.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Estado_Actual" id="sv_Estado_Actual"<%= IIf(Analisis_de_Abandono_summary.ClearExtFilter = "Analisis_de_Abandono_Estado_Actual", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Estado_Actual.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Analisis_de_Abandono.Estado_Actual.CustomFilters.Count + Analisis_de_Abandono.Estado_Actual.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_de_Abandono.Estado_Actual.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Estado Actual")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Estado_Actual.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_de_Abandono.Estado_Actual.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.Estado_Actual.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Analisis_de_Abandono.EstadoProbable.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_EstadoProbable" id="sv_EstadoProbable"<%= IIf(Analisis_de_Abandono_summary.ClearExtFilter = "Analisis_de_Abandono_EstadoProbable", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.EstadoProbable.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Analisis_de_Abandono.EstadoProbable.CustomFilters.Count + Analisis_de_Abandono.EstadoProbable.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Analisis_de_Abandono.EstadoProbable.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "EstadoProbable")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.EstadoProbable.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Analisis_de_Abandono.EstadoProbable.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Analisis_de_Abandono.EstadoProbable.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% If (Analisis_de_Abandono.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Analisis_de_Abandono_summary.ShowFilterList() %>
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
If (Analisis_de_Abandono.ExportAll AndAlso ew_NotEmpty(Analisis_de_Abandono.Export)) Then
	Analisis_de_Abandono_summary.StopGrp = Analisis_de_Abandono_summary.TotalGrps
Else
	Analisis_de_Abandono_summary.StopGrp = Analisis_de_Abandono_summary.StartGrp + Analisis_de_Abandono_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Analisis_de_Abandono_summary.StopGrp > Analisis_de_Abandono_summary.TotalGrps) Then
	Analisis_de_Abandono_summary.StopGrp = Analisis_de_Abandono_summary.TotalGrps
End If
Analisis_de_Abandono_summary.RecCount = 0

' Get first row
If (Analisis_de_Abandono_summary.TotalGrps > 0) Then
	Analisis_de_Abandono_summary.GetRow() ' ASPXRPT
	Analisis_de_Abandono_summary.GrpCount = 1
End If
While ((Analisis_de_Abandono_summary.HasRow AndAlso Analisis_de_Abandono_summary.GrpIndex < Analisis_de_Abandono_summary.StopGrp) OrElse Analisis_de_Abandono_summary.ShowFirstHeader)

	' Show header
	If (Analisis_de_Abandono_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.CODCLI.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.CODCLI))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.CODCLI.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.CODCLI) %>',0);"><%= Analisis_de_Abandono.CODCLI.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.CODCLI.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.CODCLI.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.RUT) %>',0);"><%= Analisis_de_Abandono.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.PATERNO) %>',0);"><%= Analisis_de_Abandono.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.MATERNO) %>',0);"><%= Analisis_de_Abandono.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.NOMBRE) %>',0);"><%= Analisis_de_Abandono.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.SEXO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.SEXO))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.SEXO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.SEXO) %>',0);"><%= Analisis_de_Abandono.SEXO.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.SEXO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.SEXO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.Cod2ECarrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Cod2ECarrera))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.Cod2ECarrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Cod2ECarrera) %>',0);"><%= Analisis_de_Abandono.Cod2ECarrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.Cod2ECarrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.Cod2ECarrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.Carrera.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Carrera))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.Carrera.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Carrera) %>',0);"><%= Analisis_de_Abandono.Carrera.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.Carrera.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.Carrera.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.Plan_Estudios.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Plan_Estudios))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.Plan_Estudios.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Plan_Estudios) %>',0);"><%= Analisis_de_Abandono.Plan_Estudios.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.Plan_Estudios.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.Plan_Estudios.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.JORNADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.JORNADA))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.JORNADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.JORNADA) %>',0);"><%= Analisis_de_Abandono.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.JORNADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.JORNADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.Anyo_Ingreso.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Anyo_Ingreso))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.Anyo_Ingreso.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Anyo_Ingreso) %>',0);"><%= Analisis_de_Abandono.Anyo_Ingreso.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.Anyo_Ingreso.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.Anyo_Ingreso.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.Periodo_Ingreso.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Periodo_Ingreso))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.Periodo_Ingreso.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Periodo_Ingreso) %>',0);"><%= Analisis_de_Abandono.Periodo_Ingreso.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.Periodo_Ingreso.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.Periodo_Ingreso.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.Estado_Actual.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Estado_Actual))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.Estado_Actual.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.Estado_Actual) %>',0);"><%= Analisis_de_Abandono.Estado_Actual.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.Estado_Actual.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.Estado_Actual.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Analisis_de_Abandono.Export)) Then %>
<%= Analisis_de_Abandono.EstadoProbable.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.EstadoProbable))) Then %>
		<td style="vertical-align: bottom;"><%= Analisis_de_Abandono.EstadoProbable.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Analisis_de_Abandono.SortUrl(Analisis_de_Abandono.EstadoProbable) %>',0);"><%= Analisis_de_Abandono.EstadoProbable.FldCaption() %></td><td style="width: 10px;">
		<% If (Analisis_de_Abandono.EstadoProbable.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Analisis_de_Abandono.EstadoProbable.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Analisis_de_Abandono_summary.ShowFirstHeader = False
	End If
	Analisis_de_Abandono_summary.RecCount += 1

		' Render detail row
		Analisis_de_Abandono.ResetCSS()
		Analisis_de_Abandono.RowType = EWRPT_ROWTYPE_DETAIL
		Analisis_de_Abandono_summary.RenderRow()
%>
	<tr<%= Analisis_de_Abandono.RowAttributes() %>>
		<td<%= Analisis_de_Abandono.CODCLI.CellAttributes %>>
<div<%= Analisis_de_Abandono.CODCLI.ViewAttributes%>><%= Analisis_de_Abandono.CODCLI.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.RUT.CellAttributes %>>
<div<%= Analisis_de_Abandono.RUT.ViewAttributes%>><%= Analisis_de_Abandono.RUT.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.PATERNO.CellAttributes %>>
<div<%= Analisis_de_Abandono.PATERNO.ViewAttributes%>><%= Analisis_de_Abandono.PATERNO.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.MATERNO.CellAttributes %>>
<div<%= Analisis_de_Abandono.MATERNO.ViewAttributes%>><%= Analisis_de_Abandono.MATERNO.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.NOMBRE.CellAttributes %>>
<div<%= Analisis_de_Abandono.NOMBRE.ViewAttributes%>><%= Analisis_de_Abandono.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.SEXO.CellAttributes %>>
<div<%= Analisis_de_Abandono.SEXO.ViewAttributes%>><%= Analisis_de_Abandono.SEXO.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.Cod2ECarrera.CellAttributes %>>
<div<%= Analisis_de_Abandono.Cod2ECarrera.ViewAttributes%>><%= Analisis_de_Abandono.Cod2ECarrera.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.Carrera.CellAttributes %>>
<div<%= Analisis_de_Abandono.Carrera.ViewAttributes%>><%= Analisis_de_Abandono.Carrera.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.Plan_Estudios.CellAttributes %>>
<div<%= Analisis_de_Abandono.Plan_Estudios.ViewAttributes%>><%= Analisis_de_Abandono.Plan_Estudios.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.JORNADA.CellAttributes %>>
<div<%= Analisis_de_Abandono.JORNADA.ViewAttributes%>><%= Analisis_de_Abandono.JORNADA.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.Anyo_Ingreso.CellAttributes %>>
<div<%= Analisis_de_Abandono.Anyo_Ingreso.ViewAttributes%>><%= Analisis_de_Abandono.Anyo_Ingreso.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.Periodo_Ingreso.CellAttributes %>>
<div<%= Analisis_de_Abandono.Periodo_Ingreso.ViewAttributes%>><%= Analisis_de_Abandono.Periodo_Ingreso.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.Estado_Actual.CellAttributes %>>
<div<%= Analisis_de_Abandono.Estado_Actual.ViewAttributes%>><%= Analisis_de_Abandono.Estado_Actual.ListViewValue%></div>
</td>
		<td<%= Analisis_de_Abandono.EstadoProbable.CellAttributes %>>
<div<%= Analisis_de_Abandono.EstadoProbable.ViewAttributes%>><%= Analisis_de_Abandono.EstadoProbable.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Analisis_de_Abandono_summary.AccumulateSummary()

		' Get next record
		Analisis_de_Abandono_summary.GetRow() ' ASPXRPT
		Analisis_de_Abandono_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Analisis_de_Abandono_summary.TotalGrps > 0) Then
	Analisis_de_Abandono.ResetCSS()
	Analisis_de_Abandono.RowType = EWRPT_ROWTYPE_TOTAL
	Analisis_de_Abandono.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Analisis_de_Abandono.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Analisis_de_Abandono.RowAttrs("class") = "ewRptGrandSummary"
	Analisis_de_Abandono_summary.RenderRow()
%>
	<!-- tr><td colspan="14"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Analisis_de_Abandono.RowAttributes() %>><td colspan="14"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Analisis_de_Abandono_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Analisis_de_Abandono.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Analisis_de_Abandono_summary.Pager Is Nothing Then Analisis_de_Abandono_summary.Pager = New cPrevNextPager(Analisis_de_Abandono_summary.StartGrp, Analisis_de_Abandono_summary.DisplayGrps, Analisis_de_Abandono_summary.TotalGrps) %>
<% If Analisis_de_Abandono_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Analisis_de_Abandono_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Analisis_de_Abandonosmry.aspx?start=<%= Analisis_de_Abandono_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Analisis_de_Abandono_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Analisis_de_Abandonosmry.aspx?start=<%= Analisis_de_Abandono_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Analisis_de_Abandono_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Analisis_de_Abandono_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Analisis_de_Abandonosmry.aspx?start=<%= Analisis_de_Abandono_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Analisis_de_Abandono_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Analisis_de_Abandonosmry.aspx?start=<%= Analisis_de_Abandono_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Analisis_de_Abandono_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Analisis_de_Abandono_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Analisis_de_Abandono_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Analisis_de_Abandono_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Analisis_de_Abandono_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Analisis_de_Abandono_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If Analisis_de_Abandono_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="15"<% If Analisis_de_Abandono_summary.DisplayGrps = 15 Then Response.Write(" selected=""selected""") %>>15</option>
<option value="20"<% If Analisis_de_Abandono_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Analisis_de_Abandono_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
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
<% If (Analisis_de_Abandono.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Analisis_de_Abandono.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3" class="ewPadding"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<a name="cht_Analisis_de_Abandono_1"></a>
<div id="div_Analisis_de_Abandono_Analisis_de_Abandono_1"></div>
<%

' Initialize chart data
Analisis_de_Abandono.Analisis_de_Abandono_1.ID = "Analisis_de_Abandono_Analisis_de_Abandono_1" ' Chart ID
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("type", "3", False) ' Chart type
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("seriestype", "0", False) ' Chart series type
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("bgcolor", "#FCFCFC", True) ' Background color
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("caption", Analisis_de_Abandono.Analisis_de_Abandono_1.ChartCaption(), True) ' Chart caption
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("xaxisname", Analisis_de_Abandono.Analisis_de_Abandono_1.ChartXAxisName(), True) ' X axis name
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("yaxisname", Analisis_de_Abandono.Analisis_de_Abandono_1.ChartYAxisName(), True) ' Y axis name
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("shownames", "1", True) ' Show names
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showvalues", "1", True) ' Show values
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showhovercap", "0", True) ' Show hover
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("alpha", "50", False) ' Chart alpha
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("colorpalette", "#FF0000|#FF0080|#FF00FF|#8000FF|#FF8000|#FF3D3D|#7AFFFF|#0000FF|#FFFF00|#FF7A7A|#3DFFFF|#0080FF|#80FF00|#00FF00|#00FF80|#00FFFF", False) ' Chart color palette
%>
<%
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showCanvasBg", "1", True) ' showCanvasBg ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showCanvasBase", "1", True) ' showCanvasBase ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showLimits", "1", True) ' showLimits ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("animation", "1", True) ' animation ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("rotateNames", "0", True) ' rotateNames ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("yAxisMinValue", "0", True) ' yAxisMinValue ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("yAxisMaxValue", "0", True) ' yAxisMaxValue ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("PYAxisMinValue", "0", True) ' PYAxisMinValue ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("PYAxisMaxValue", "0", True) ' PYAxisMaxValue ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("SYAxisMinValue", "0", True) ' SYAxisMinValue ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("SYAxisMaxValue", "0", True) ' SYAxisMaxValue ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showColumnShadow", "0", True) ' showColumnShadow ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showPercentageValues", "1", True) ' showPercentageValues ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showPercentageInLabel", "1", True) ' showPercentageInLabel ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showBarShadow", "0", True) ' showBarShadow ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showAnchors", "1", True) ' showAnchors ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showAreaBorder", "1", True) ' showAreaBorder ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("isSliced", "1", True) ' isSliced ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showAsBars", "0", True) ' showAsBars ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showShadow", "0", True) ' showShadow ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("formatNumber", "0", True) ' formatNumber ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("formatNumberScale", "0", True) ' formatNumberScale ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("decimalSeparator", ".", True) ' decimalSeparator ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("thousandSeparator", ",", True) ' thousandSeparator ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("decimalPrecision", "2", True) ' decimalPrecision ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("divLineDecimalPrecision", "2", True) ' divLineDecimalPrecision ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("limitsDecimalPrecision", "2", True) ' limitsDecimalPrecision ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("zeroPlaneShowBorder", "1", True) ' zeroPlaneShowBorder ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showDivLineValue", "1", True) ' showDivLineValue ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showAlternateHGridColor", "0", True) ' showAlternateHGridColor ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("showAlternateVGridColor", "0", True) ' showAlternateVGridColor ### v4 // VB
Analisis_de_Abandono.Analisis_de_Abandono_1.SetChartParam("hoverCapSepChar", ":", True) ' hoverCapSepChar ### v4 // VB

' Define trend lines
%>
<%
SqlSelect = Analisis_de_Abandono.SqlSelect
SqlChartSelect = Analisis_de_Abandono.Analisis_de_Abandono_1.SqlSelect
SqlChartBase = Analisis_de_Abandono.SqlFrom

' Load chart series from SQL directly
sSql = SqlChartSelect + SqlChartBase
sSql = ewrpt_BuildReportSql(sSql, Analisis_de_Abandono.SqlWhere, Analisis_de_Abandono.Analisis_de_Abandono_1.SqlGroupBy, "", Analisis_de_Abandono.Analisis_de_Abandono_1.SqlOrderBy, Analisis_de_Abandono_summary.Filter, "")
If (EWRPT_DEBUG_ENABLED) Then Response.Write("(Chart SQL): " & sSql & "<br>")
ewrpt_LoadChartData(sSql, Analisis_de_Abandono.Analisis_de_Abandono_1)
ewrpt_SortChartData(Analisis_de_Abandono.Analisis_de_Abandono_1.Data, 0, "")

' Call Chart_Rendering event
ChartObj = Analisis_de_Abandono.Analisis_de_Abandono_1
Analisis_de_Abandono.Chart_Rendering(ChartObj)
chartxml = Analisis_de_Abandono.Analisis_de_Abandono_1.ChartXml()

' Call Chart_Rendered event
Analisis_de_Abandono.Chart_Rendered(ChartObj, chartxml)
%>
<%= Analisis_de_Abandono.Analisis_de_Abandono_1.ShowChartFCF(chartxml) %>
<a href="#top"><%= ReportLanguage.Phrase("Top") %></a>
<br><br>
<% If (Analisis_de_Abandono.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Analisis_de_Abandono_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Analisis_de_Abandono.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
