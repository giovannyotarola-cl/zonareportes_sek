<%@ Page ClassName="Asignaturas_Planificadas_2D_Profesorsmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_asignaturasPlanProfesor_Chile" %>
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
	Public Asignaturas_Planificadas_2D_Profesor As crAsignaturas_Planificadas_2D_Profesor = Nothing

	'
	' Table class (for Asignaturas Planificadas - Profesor)
	'
	Public Class crAsignaturas_Planificadas_2D_Profesor
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
				Return "Asignaturas_Planificadas_2D_Profesor"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Asignaturas Planificadas - Profesor"
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

		Public NOMBRE_C As crField

		Public CODCARR As crField

		Public NOMBRE As crField

		Public CODRAMO As crField

		Public nivel As crField

		Public creditos As crField

		Public CODSECC As crField

		Public ANO As crField

		Public PERIODO As crField

		Public JORNADA As crField

		Public PROFESOR As crField

		Public CODPROF As crField

		Public ASIGNADO As crField

		Public CANT_ALUMNOS As crField

		Public HORARIO As crField

		Public CERRADA As crField

		Public RUT As crField

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

			' NOMBRE_C
			NOMBRE_C = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' CODRAMO
			CODRAMO = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_CODRAMO", "CODRAMO", "[CODRAMO]", 200, EWRPT_DATATYPE_STRING, -1)
			CODRAMO.Page = APage
			CODRAMO.ParentPage = APage.ParentPage
			Fields.Add("CODRAMO", CODRAMO)
			CODRAMO.DateFilter = ""
			CODRAMO.SqlSelect = ""
			CODRAMO.SqlOrderBy = ""

			' nivel
			nivel = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_nivel", "nivel", "[nivel]", 3, EWRPT_DATATYPE_NUMBER, -1)
			nivel.Page = APage
			nivel.ParentPage = APage.ParentPage
			nivel.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("nivel", nivel)
			nivel.DateFilter = ""
			nivel.SqlSelect = ""
			nivel.SqlOrderBy = ""

			' creditos
			creditos = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_creditos", "creditos", "[creditos]", 3, EWRPT_DATATYPE_NUMBER, -1)
			creditos.Page = APage
			creditos.ParentPage = APage.ParentPage
			creditos.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("creditos", creditos)
			creditos.DateFilter = ""
			creditos.SqlSelect = ""
			creditos.SqlOrderBy = ""

			' CODSECC
			CODSECC = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_CODSECC", "CODSECC", "[CODSECC]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CODSECC.Page = APage
			CODSECC.ParentPage = APage.ParentPage
			CODSECC.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CODSECC", CODSECC)
			CODSECC.DateFilter = ""
			CODSECC.SqlSelect = ""
			CODSECC.SqlOrderBy = ""

			' ANO
			ANO = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO.Page = APage
			ANO.ParentPage = APage.ParentPage
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO", ANO)
			ANO.DateFilter = ""
			ANO.SqlSelect = ""
			ANO.SqlOrderBy = ""

			' PERIODO
			PERIODO = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_PERIODO", "PERIODO", "[PERIODO]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO.Page = APage
			PERIODO.ParentPage = APage.ParentPage
			PERIODO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO", PERIODO)
			PERIODO.DateFilter = ""
			PERIODO.SqlSelect = ""
			PERIODO.SqlOrderBy = ""

			' JORNADA
			JORNADA = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			JORNADA.Page = APage
			JORNADA.ParentPage = APage.ParentPage
			Fields.Add("JORNADA", JORNADA)
			JORNADA.DateFilter = ""
			JORNADA.SqlSelect = ""
			JORNADA.SqlOrderBy = ""

			' PROFESOR
			PROFESOR = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_PROFESOR", "PROFESOR", "[PROFESOR]", 200, EWRPT_DATATYPE_STRING, -1)
			PROFESOR.Page = APage
			PROFESOR.ParentPage = APage.ParentPage
			Fields.Add("PROFESOR", PROFESOR)
			PROFESOR.DateFilter = ""
			PROFESOR.SqlSelect = ""
			PROFESOR.SqlOrderBy = ""

			' CODPROF
			CODPROF = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_CODPROF", "CODPROF", "[CODPROF]", 200, EWRPT_DATATYPE_STRING, -1)
			CODPROF.Page = APage
			CODPROF.ParentPage = APage.ParentPage
			Fields.Add("CODPROF", CODPROF)
			CODPROF.DateFilter = ""
			CODPROF.SqlSelect = ""
			CODPROF.SqlOrderBy = ""

			' ASIGNADO
			ASIGNADO = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_ASIGNADO", "ASIGNADO", "[ASIGNADO]", 200, EWRPT_DATATYPE_STRING, -1)
			ASIGNADO.Page = APage
			ASIGNADO.ParentPage = APage.ParentPage
			Fields.Add("ASIGNADO", ASIGNADO)
			ASIGNADO.DateFilter = ""
			ASIGNADO.SqlSelect = ""
			ASIGNADO.SqlOrderBy = ""

			' CANT_ALUMNOS
			CANT_ALUMNOS = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_CANT_ALUMNOS", "CANT_ALUMNOS", "[CANT_ALUMNOS]", 3, EWRPT_DATATYPE_NUMBER, -1)
			CANT_ALUMNOS.Page = APage
			CANT_ALUMNOS.ParentPage = APage.ParentPage
			CANT_ALUMNOS.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("CANT_ALUMNOS", CANT_ALUMNOS)
			CANT_ALUMNOS.DateFilter = ""
			CANT_ALUMNOS.SqlSelect = ""
			CANT_ALUMNOS.SqlOrderBy = ""

			' HORARIO
			HORARIO = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_HORARIO", "HORARIO", "[HORARIO]", 200, EWRPT_DATATYPE_STRING, -1)
			HORARIO.Page = APage
			HORARIO.ParentPage = APage.ParentPage
			Fields.Add("HORARIO", HORARIO)
			HORARIO.DateFilter = ""
			HORARIO.SqlSelect = ""
			HORARIO.SqlOrderBy = ""

			' CERRADA
			CERRADA = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_CERRADA", "CERRADA", "[CERRADA]", 200, EWRPT_DATATYPE_STRING, -1)
			CERRADA.Page = APage
			CERRADA.ParentPage = APage.ParentPage
			Fields.Add("CERRADA", CERRADA)
			CERRADA.DateFilter = ""
			CERRADA.SqlSelect = ""
			CERRADA.SqlOrderBy = ""

			' RUT
			RUT = new crField("Asignaturas_Planificadas_2D_Profesor", "Asignaturas Planificadas - Profesor", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""
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
				Return "[SEK_Asignaturas_Plan_Profesor]"
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
	Public Asignaturas_Planificadas_2D_Profesor_summary As crAsignaturas_Planificadas_2D_Profesor_summary

	'
	' Page class
	'
	Public Class crAsignaturas_Planificadas_2D_Profesor_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Asignaturas_Planificadas_2D_Profesor.UseTokenInUrl) Then
				sUrl &= "t=" & Asignaturas_Planificadas_2D_Profesor.TableVar & "&" ' Add page token
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
			If (Asignaturas_Planificadas_2D_Profesor.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Asignaturas_Planificadas_2D_Profesor.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Asignaturas_Planificadas_2D_Profesor.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Asignaturas_Planificadas_2D_Profesorsmry 
			Get
				Return CType(m_ParentPage, Asignaturas_Planificadas_2D_Profesorsmry)
			End Get
		End Property

		' Table object (Asignaturas_Planificadas_2D_Profesor)
		Public Property Asignaturas_Planificadas_2D_Profesor As crAsignaturas_Planificadas_2D_Profesor 
			Get		
				Return AspNetPage.Asignaturas_Planificadas_2D_Profesor ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAsignaturas_Planificadas_2D_Profesor)
				AspNetPage.Asignaturas_Planificadas_2D_Profesor = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_asignaturasPlanProfesor_Chile)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Asignaturas_Planificadas_2D_Profesor_summary"
			m_PageObjTypeName = "crAsignaturas_Planificadas_2D_Profesor_summary"

			' Table name
			m_TableName = "Asignaturas Planificadas - Profesor"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Asignaturas_Planificadas_2D_Profesor)
			Asignaturas_Planificadas_2D_Profesor = New crAsignaturas_Planificadas_2D_Profesor(Me)			

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
				Asignaturas_Planificadas_2D_Profesor.Export = ew_Get("export")
			End If
			gsExport = Asignaturas_Planificadas_2D_Profesor.Export ' Get export parameter, used in header
			gsExportFile = Asignaturas_Planificadas_2D_Profesor.TableVar ' Get export file, used in header
			If (Asignaturas_Planificadas_2D_Profesor.Export = "excel") Then
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
			Asignaturas_Planificadas_2D_Profesor.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Asignaturas_Planificadas_2D_Profesor.SqlSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, Asignaturas_Planificadas_2D_Profesor.SqlGroupBy, Asignaturas_Planificadas_2D_Profesor.SqlHaving, Asignaturas_Planificadas_2D_Profesor.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Asignaturas_Planificadas_2D_Profesor.ExportAll AndAlso ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then
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
				Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DbValue = Row("NOMBRE_C")
				Asignaturas_Planificadas_2D_Profesor.CODCARR.DbValue = Row("CODCARR")
				Asignaturas_Planificadas_2D_Profesor.CODRAMO.DbValue = Row("CODRAMO")
				Asignaturas_Planificadas_2D_Profesor.NOMBRE.DbValue = Row("NOMBRE")
				Asignaturas_Planificadas_2D_Profesor.CODSECC.DbValue = Row("CODSECC")
				Asignaturas_Planificadas_2D_Profesor.ANO.DbValue = Row("ANO")
				Asignaturas_Planificadas_2D_Profesor.PERIODO.DbValue = Row("PERIODO")
				Asignaturas_Planificadas_2D_Profesor.nivel.DbValue = Row("nivel")
				Asignaturas_Planificadas_2D_Profesor.creditos.DbValue = Row("creditos")
				Asignaturas_Planificadas_2D_Profesor.JORNADA.DbValue = Row("JORNADA")
				Asignaturas_Planificadas_2D_Profesor.PROFESOR.DbValue = Row("PROFESOR")
				Asignaturas_Planificadas_2D_Profesor.RUT.DbValue = Row("RUT")
				Asignaturas_Planificadas_2D_Profesor.CODPROF.DbValue = Row("CODPROF")
				Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DbValue = Row("ASIGNADO")
				Asignaturas_Planificadas_2D_Profesor.HORARIO.DbValue = Row("HORARIO")
				Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.DbValue = Row("CANT_ALUMNOS")
				Asignaturas_Planificadas_2D_Profesor.CERRADA.DbValue = Row("CERRADA")
				Val(1) = Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.CurrentValue
				Val(2) = Asignaturas_Planificadas_2D_Profesor.CODCARR.CurrentValue
				Val(3) = Asignaturas_Planificadas_2D_Profesor.NOMBRE.CurrentValue
				Val(4) = Asignaturas_Planificadas_2D_Profesor.CODRAMO.CurrentValue
				Val(5) = Asignaturas_Planificadas_2D_Profesor.nivel.CurrentValue
				Val(6) = Asignaturas_Planificadas_2D_Profesor.creditos.CurrentValue
				Val(7) = Asignaturas_Planificadas_2D_Profesor.CODSECC.CurrentValue
				Val(8) = Asignaturas_Planificadas_2D_Profesor.ANO.CurrentValue
				Val(9) = Asignaturas_Planificadas_2D_Profesor.PERIODO.CurrentValue
				Val(10) = Asignaturas_Planificadas_2D_Profesor.JORNADA.CurrentValue
				Val(11) = Asignaturas_Planificadas_2D_Profesor.PROFESOR.CurrentValue
				Val(12) = Asignaturas_Planificadas_2D_Profesor.CODPROF.CurrentValue
				Val(13) = Asignaturas_Planificadas_2D_Profesor.ASIGNADO.CurrentValue
				Val(14) = Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.CurrentValue
				Val(15) = Asignaturas_Planificadas_2D_Profesor.HORARIO.CurrentValue
				Val(16) = Asignaturas_Planificadas_2D_Profesor.CERRADA.CurrentValue
			Else
				Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CODCARR.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CODRAMO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.NOMBRE.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CODSECC.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.ANO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.PERIODO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.nivel.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.creditos.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.JORNADA.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.PROFESOR.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.RUT.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CODPROF.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.HORARIO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CERRADA.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DbValue = dr("NOMBRE_C")
				Asignaturas_Planificadas_2D_Profesor.CODCARR.DbValue = dr("CODCARR")
				Asignaturas_Planificadas_2D_Profesor.CODRAMO.DbValue = dr("CODRAMO")
				Asignaturas_Planificadas_2D_Profesor.NOMBRE.DbValue = dr("NOMBRE")
				Asignaturas_Planificadas_2D_Profesor.CODSECC.DbValue = dr("CODSECC")
				Asignaturas_Planificadas_2D_Profesor.ANO.DbValue = dr("ANO")
				Asignaturas_Planificadas_2D_Profesor.PERIODO.DbValue = dr("PERIODO")
				Asignaturas_Planificadas_2D_Profesor.nivel.DbValue = dr("nivel")
				Asignaturas_Planificadas_2D_Profesor.creditos.DbValue = dr("creditos")
				Asignaturas_Planificadas_2D_Profesor.JORNADA.DbValue = dr("JORNADA")
				Asignaturas_Planificadas_2D_Profesor.PROFESOR.DbValue = dr("PROFESOR")
				Asignaturas_Planificadas_2D_Profesor.RUT.DbValue = dr("RUT")
				Asignaturas_Planificadas_2D_Profesor.CODPROF.DbValue = dr("CODPROF")
				Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DbValue = dr("ASIGNADO")
				Asignaturas_Planificadas_2D_Profesor.HORARIO.DbValue = dr("HORARIO")
				Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.DbValue = dr("CANT_ALUMNOS")
				Asignaturas_Planificadas_2D_Profesor.CERRADA.DbValue = dr("CERRADA")
				Val(1) = Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.CurrentValue
				Val(2) = Asignaturas_Planificadas_2D_Profesor.CODCARR.CurrentValue
				Val(3) = Asignaturas_Planificadas_2D_Profesor.NOMBRE.CurrentValue
				Val(4) = Asignaturas_Planificadas_2D_Profesor.CODRAMO.CurrentValue
				Val(5) = Asignaturas_Planificadas_2D_Profesor.nivel.CurrentValue
				Val(6) = Asignaturas_Planificadas_2D_Profesor.creditos.CurrentValue
				Val(7) = Asignaturas_Planificadas_2D_Profesor.CODSECC.CurrentValue
				Val(8) = Asignaturas_Planificadas_2D_Profesor.ANO.CurrentValue
				Val(9) = Asignaturas_Planificadas_2D_Profesor.PERIODO.CurrentValue
				Val(10) = Asignaturas_Planificadas_2D_Profesor.JORNADA.CurrentValue
				Val(11) = Asignaturas_Planificadas_2D_Profesor.PROFESOR.CurrentValue
				Val(12) = Asignaturas_Planificadas_2D_Profesor.CODPROF.CurrentValue
				Val(13) = Asignaturas_Planificadas_2D_Profesor.ASIGNADO.CurrentValue
				Val(14) = Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.CurrentValue
				Val(15) = Asignaturas_Planificadas_2D_Profesor.HORARIO.CurrentValue
				Val(16) = Asignaturas_Planificadas_2D_Profesor.CERRADA.CurrentValue
			Else				
				Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CODCARR.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CODRAMO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.NOMBRE.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CODSECC.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.ANO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.PERIODO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.nivel.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.creditos.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.JORNADA.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.PROFESOR.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.RUT.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CODPROF.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.HORARIO.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.DbValue = ""
				Asignaturas_Planificadas_2D_Profesor.CERRADA.DbValue = ""
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
				Asignaturas_Planificadas_2D_Profesor.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Asignaturas_Planificadas_2D_Profesor.StartGroup = StartGrp
				Else
					StartGrp = Asignaturas_Planificadas_2D_Profesor.StartGroup
				End If
			Else
				StartGrp = Asignaturas_Planificadas_2D_Profesor.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Asignaturas_Planificadas_2D_Profesor.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Asignaturas_Planificadas_2D_Profesor.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Asignaturas_Planificadas_2D_Profesor.StartGroup = StartGrp
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
			Asignaturas_Planificadas_2D_Profesor.StartGroup = StartGrp
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
				Asignaturas_Planificadas_2D_Profesor.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Asignaturas_Planificadas_2D_Profesor.StartGroup = StartGrp
			Else				
				If (Asignaturas_Planificadas_2D_Profesor.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Asignaturas_Planificadas_2D_Profesor.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Asignaturas_Planificadas_2D_Profesor.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Asignaturas_Planificadas_2D_Profesor.SqlSelectCount, Asignaturas_Planificadas_2D_Profesor.SqlWhere, Asignaturas_Planificadas_2D_Profesor.SqlGroupBy, Asignaturas_Planificadas_2D_Profesor.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Asignaturas_Planificadas_2D_Profesor.Row_Rendering()

			'
			' Render view codes
			'

			If (Asignaturas_Planificadas_2D_Profesor.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' NOMBRE_C
				Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.Summary)

				' CODCARR
				Asignaturas_Planificadas_2D_Profesor.CODCARR.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CODCARR.Summary)

				' NOMBRE
				Asignaturas_Planificadas_2D_Profesor.NOMBRE.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.NOMBRE.Summary)

				' CODRAMO
				Asignaturas_Planificadas_2D_Profesor.CODRAMO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CODRAMO.Summary)

				' nivel
				Asignaturas_Planificadas_2D_Profesor.nivel.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.nivel.Summary)

				' creditos
				Asignaturas_Planificadas_2D_Profesor.creditos.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.creditos.Summary)

				' CODSECC
				Asignaturas_Planificadas_2D_Profesor.CODSECC.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CODSECC.Summary)

				' ANO
				Asignaturas_Planificadas_2D_Profesor.ANO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.ANO.Summary)

				' PERIODO
				Asignaturas_Planificadas_2D_Profesor.PERIODO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.PERIODO.Summary)

				' JORNADA
				Asignaturas_Planificadas_2D_Profesor.JORNADA.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.JORNADA.Summary)

				' PROFESOR
				Asignaturas_Planificadas_2D_Profesor.PROFESOR.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.PROFESOR.Summary)

				' CODPROF
				Asignaturas_Planificadas_2D_Profesor.CODPROF.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CODPROF.Summary)

				' ASIGNADO
				Asignaturas_Planificadas_2D_Profesor.ASIGNADO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.ASIGNADO.Summary)

				' CANT_ALUMNOS
				Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.Summary)

				' HORARIO
				Asignaturas_Planificadas_2D_Profesor.HORARIO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.HORARIO.Summary)

				' CERRADA
				Asignaturas_Planificadas_2D_Profesor.CERRADA.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CERRADA.Summary)
			Else

				' NOMBRE_C
				Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Asignaturas_Planificadas_2D_Profesor.CODCARR.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CODCARR.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Asignaturas_Planificadas_2D_Profesor.NOMBRE.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.NOMBRE.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODRAMO
				Asignaturas_Planificadas_2D_Profesor.CODRAMO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CODRAMO.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.CODRAMO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' nivel
				Asignaturas_Planificadas_2D_Profesor.nivel.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.nivel.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.nivel.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' creditos
				Asignaturas_Planificadas_2D_Profesor.creditos.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.creditos.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.creditos.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODSECC
				Asignaturas_Planificadas_2D_Profesor.CODSECC.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CODSECC.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.CODSECC.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO
				Asignaturas_Planificadas_2D_Profesor.ANO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.ANO.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.ANO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO
				Asignaturas_Planificadas_2D_Profesor.PERIODO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.PERIODO.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.PERIODO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' JORNADA
				Asignaturas_Planificadas_2D_Profesor.JORNADA.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.JORNADA.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.JORNADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PROFESOR
				Asignaturas_Planificadas_2D_Profesor.PROFESOR.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.PROFESOR.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.PROFESOR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODPROF
				Asignaturas_Planificadas_2D_Profesor.CODPROF.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CODPROF.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.CODPROF.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ASIGNADO
				Asignaturas_Planificadas_2D_Profesor.ASIGNADO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.ASIGNADO.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.ASIGNADO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CANT_ALUMNOS
				Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' HORARIO
				Asignaturas_Planificadas_2D_Profesor.HORARIO.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.HORARIO.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.HORARIO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CERRADA
				Asignaturas_Planificadas_2D_Profesor.CERRADA.ViewValue = Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CERRADA.CurrentValue)
				Asignaturas_Planificadas_2D_Profesor.CERRADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' NOMBRE_C
			Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.HrefValue = ""

			' CODCARR
			Asignaturas_Planificadas_2D_Profesor.CODCARR.HrefValue = ""

			' NOMBRE
			Asignaturas_Planificadas_2D_Profesor.NOMBRE.HrefValue = ""

			' CODRAMO
			Asignaturas_Planificadas_2D_Profesor.CODRAMO.HrefValue = ""

			' nivel
			Asignaturas_Planificadas_2D_Profesor.nivel.HrefValue = ""

			' creditos
			Asignaturas_Planificadas_2D_Profesor.creditos.HrefValue = ""

			' CODSECC
			Asignaturas_Planificadas_2D_Profesor.CODSECC.HrefValue = ""

			' ANO
			Asignaturas_Planificadas_2D_Profesor.ANO.HrefValue = ""

			' PERIODO
			Asignaturas_Planificadas_2D_Profesor.PERIODO.HrefValue = ""

			' JORNADA
			Asignaturas_Planificadas_2D_Profesor.JORNADA.HrefValue = ""

			' PROFESOR
			Asignaturas_Planificadas_2D_Profesor.PROFESOR.HrefValue = ""

			' CODPROF
			Asignaturas_Planificadas_2D_Profesor.CODPROF.HrefValue = ""

			' ASIGNADO
			Asignaturas_Planificadas_2D_Profesor.ASIGNADO.HrefValue = ""

			' CANT_ALUMNOS
			Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.HrefValue = ""

			' HORARIO
			Asignaturas_Planificadas_2D_Profesor.HORARIO.HrefValue = ""

			' CERRADA
			Asignaturas_Planificadas_2D_Profesor.CERRADA.HrefValue = ""

			' Call Row_Rendered event
			Asignaturas_Planificadas_2D_Profesor.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NOMBRE
			sSelect = "SELECT DISTINCT [NOMBRE] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[NOMBRE] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field nivel
			sSelect = "SELECT DISTINCT [nivel] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[nivel] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.nivel.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field creditos
			sSelect = "SELECT DISTINCT [creditos] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[creditos] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.creditos.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CODSECC
			sSelect = "SELECT DISTINCT [CODSECC] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[CODSECC] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO
			sSelect = "SELECT DISTINCT [ANO] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[ANO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.ANO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PERIODO
			sSelect = "SELECT DISTINCT [PERIODO] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[PERIODO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field JORNADA
			sSelect = "SELECT DISTINCT [JORNADA] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[JORNADA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PROFESOR
			sSelect = "SELECT DISTINCT [PROFESOR] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[PROFESOR] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ASIGNADO
			sSelect = "SELECT DISTINCT [ASIGNADO] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[ASIGNADO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field HORARIO
			sSelect = "SELECT DISTINCT [HORARIO] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[HORARIO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CERRADA
			sSelect = "SELECT DISTINCT [CERRADA] FROM " + Asignaturas_Planificadas_2D_Profesor.SqlFrom
			sOrderBy = "[CERRADA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Asignaturas_Planificadas_2D_Profesor.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field NOMBRE_C
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownValue, Asignaturas_Planificadas_2D_Profesor.NOMBRE_C)

				' Field CODCARR
				SetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CODCARR)

				' Field NOMBRE
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownValue, Asignaturas_Planificadas_2D_Profesor.NOMBRE)

				' Field CODRAMO
				SetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CODRAMO)

				' Field nivel
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.nivel.DropDownValue, Asignaturas_Planificadas_2D_Profesor.nivel)

				' Field creditos
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.creditos.DropDownValue, Asignaturas_Planificadas_2D_Profesor.creditos)

				' Field CODSECC
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownValue, Asignaturas_Planificadas_2D_Profesor.CODSECC)

				' Field ANO
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.ANO.DropDownValue, Asignaturas_Planificadas_2D_Profesor.ANO)

				' Field PERIODO
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownValue, Asignaturas_Planificadas_2D_Profesor.PERIODO)

				' Field JORNADA
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownValue, Asignaturas_Planificadas_2D_Profesor.JORNADA)

				' Field PROFESOR
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownValue, Asignaturas_Planificadas_2D_Profesor.PROFESOR)

				' Field CODPROF
				SetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CODPROF)

				' Field ASIGNADO
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownValue, Asignaturas_Planificadas_2D_Profesor.ASIGNADO)

				' Field CANT_ALUMNOS
				SetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS)

				' Field HORARIO
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownValue, Asignaturas_Planificadas_2D_Profesor.HORARIO)

				' Field CERRADA
				SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownValue, Asignaturas_Planificadas_2D_Profesor.CERRADA)
			bSetupFilter = True ' Set up filter required
		Else

				' Field NOMBRE_C
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CODCARR
				If (GetFilterValues(Asignaturas_Planificadas_2D_Profesor.CODCARR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_NOMBRE") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CODRAMO
				If (GetFilterValues(Asignaturas_Planificadas_2D_Profesor.CODRAMO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field nivel
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.nivel)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.nivel.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.nivel.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_nivel") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field creditos
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.creditos)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.creditos.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.creditos.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_creditos") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CODSECC
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.CODSECC)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_CODSECC") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.ANO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.ANO.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.ANO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_ANO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PERIODO
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.PERIODO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_PERIODO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field JORNADA
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.JORNADA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_JORNADA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PROFESOR
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.PROFESOR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_PROFESOR") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CODPROF
				If (GetFilterValues(Asignaturas_Planificadas_2D_Profesor.CODPROF)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ASIGNADO
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.ASIGNADO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_ASIGNADO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CANT_ALUMNOS
				If (GetFilterValues(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field HORARIO
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.HORARIO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_HORARIO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CERRADA
				If (GetDropDownValue(Asignaturas_Planificadas_2D_Profesor.CERRADA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownValue) Then
					If Not ew_SameStr(Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_CERRADA") Is Nothing Then
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

			' Field NOMBRE_C
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C)

			' Field CODCARR
			GetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CODCARR)

			' Field NOMBRE
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE)

			' Field CODRAMO
			GetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CODRAMO)

			' Field nivel
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.nivel)

			' Field creditos
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.creditos)

			' Field CODSECC
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.CODSECC)

			' Field ANO
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.ANO)

			' Field PERIODO
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.PERIODO)

			' Field JORNADA
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.JORNADA)

			' Field PROFESOR
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.PROFESOR)

			' Field CODPROF
			GetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CODPROF)

			' Field ASIGNADO
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.ASIGNADO)

			' Field CANT_ALUMNOS
			GetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS)

			' Field HORARIO
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.HORARIO)

			' Field CERRADA
			GetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.CERRADA)
		End If

		' Call page filter validated event
		Asignaturas_Planificadas_2D_Profesor.Page_FilterValidated()

		' Build SQL
		' Field NOMBRE_C

		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C, sFilter, "")

		' Field CODCARR
		BuildExtendedFilter(Asignaturas_Planificadas_2D_Profesor.CODCARR, sFilter)

		' Field NOMBRE
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.NOMBRE, sFilter, "")

		' Field CODRAMO
		BuildExtendedFilter(Asignaturas_Planificadas_2D_Profesor.CODRAMO, sFilter)

		' Field nivel
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.nivel, sFilter, "")

		' Field creditos
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.creditos, sFilter, "")

		' Field CODSECC
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.CODSECC, sFilter, "")

		' Field ANO
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.ANO, sFilter, "")

		' Field PERIODO
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.PERIODO, sFilter, "")

		' Field JORNADA
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.JORNADA, sFilter, "")

		' Field PROFESOR
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.PROFESOR, sFilter, "")

		' Field CODPROF
		BuildExtendedFilter(Asignaturas_Planificadas_2D_Profesor.CODPROF, sFilter)

		' Field ASIGNADO
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.ASIGNADO, sFilter, "")

		' Field CANT_ALUMNOS
		BuildExtendedFilter(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS, sFilter)

		' Field HORARIO
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.HORARIO, sFilter, "")

		' Field CERRADA
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.CERRADA, sFilter, "")

		' Save parms to Session
		' Field NOMBRE_C

		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownValue, Asignaturas_Planificadas_2D_Profesor.NOMBRE_C)

		' Field CODCARR
		SetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CODCARR)

		' Field NOMBRE
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownValue, Asignaturas_Planificadas_2D_Profesor.NOMBRE)

		' Field CODRAMO
		SetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CODRAMO)

		' Field nivel
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.nivel.DropDownValue, Asignaturas_Planificadas_2D_Profesor.nivel)

		' Field creditos
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.creditos.DropDownValue, Asignaturas_Planificadas_2D_Profesor.creditos)

		' Field CODSECC
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownValue, Asignaturas_Planificadas_2D_Profesor.CODSECC)

		' Field ANO
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.ANO.DropDownValue, Asignaturas_Planificadas_2D_Profesor.ANO)

		' Field PERIODO
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownValue, Asignaturas_Planificadas_2D_Profesor.PERIODO)

		' Field JORNADA
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownValue, Asignaturas_Planificadas_2D_Profesor.JORNADA)

		' Field PROFESOR
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownValue, Asignaturas_Planificadas_2D_Profesor.PROFESOR)

		' Field CODPROF
		SetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CODPROF)

		' Field ASIGNADO
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownValue, Asignaturas_Planificadas_2D_Profesor.ASIGNADO)

		' Field CANT_ALUMNOS
		SetSessionFilterValues(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS)

		' Field HORARIO
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownValue, Asignaturas_Planificadas_2D_Profesor.HORARIO)

		' Field CERRADA
		SetSessionDropDownValue(Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownValue, Asignaturas_Planificadas_2D_Profesor.CERRADA)

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
		If ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Asignaturas_Planificadas_2D_Profesor_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Asignaturas_Planificadas_2D_Profesor_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Asignaturas_Planificadas_2D_Profesor_" + parm)
		End If
		If ew_Session("so1_Asignaturas_Planificadas_2D_Profesor_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Asignaturas_Planificadas_2D_Profesor_" + parm))
		End If
		If ew_Session("sc_Asignaturas_Planificadas_2D_Profesor_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Asignaturas_Planificadas_2D_Profesor_" + parm))
		End If
		If ew_Session("sv2_Asignaturas_Planificadas_2D_Profesor_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Asignaturas_Planificadas_2D_Profesor_" + parm)
		End If
		If ew_Session("so2_Asignaturas_Planificadas_2D_Profesor_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Asignaturas_Planificadas_2D_Profesor_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Asignaturas_Planificadas_2D_Profesor_" + parm) = fld.SearchValue
		ew_Session("so1_Asignaturas_Planificadas_2D_Profesor_" + parm) = fld.SearchOperator
		ew_Session("sc_Asignaturas_Planificadas_2D_Profesor_" + parm) = fld.SearchCondition
		ew_Session("sv2_Asignaturas_Planificadas_2D_Profesor_" + parm) = fld.SearchValue2
		ew_Session("so2_Asignaturas_Planificadas_2D_Profesor_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Asignaturas_Planificadas_2D_Profesor_" + parm) = ""
		ew_Session("so1_Asignaturas_Planificadas_2D_Profesor_" + parm) = "="
		ew_Session("sc_Asignaturas_Planificadas_2D_Profesor_" + parm) = "AND"
		ew_Session("sv2_Asignaturas_Planificadas_2D_Profesor_" + parm) = ""
		ew_Session("so2_Asignaturas_Planificadas_2D_Profesor_" + parm) = "="
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
		If Not ewrpt_CheckInteger(Convert.ToString(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.FldErrMsg()
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
		ew_Session("sel_Asignaturas_Planificadas_2D_Profesor_" & parm) = ""
		ew_Session("rf_Asignaturas_Planificadas_2D_Profesor_" & parm) = ""
		ew_Session("rt_Asignaturas_Planificadas_2D_Profesor_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Asignaturas_Planificadas_2D_Profesor.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Asignaturas_Planificadas_2D_Profesor_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Asignaturas_Planificadas_2D_Profesor_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Asignaturas_Planificadas_2D_Profesor_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBRE_C

			Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownValue = Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DefaultDropDownValue

			' Field NOMBRE
			Asignaturas_Planificadas_2D_Profesor.NOMBRE.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownValue = Asignaturas_Planificadas_2D_Profesor.NOMBRE.DefaultDropDownValue

			' Field nivel
			Asignaturas_Planificadas_2D_Profesor.nivel.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.nivel.DropDownValue = Asignaturas_Planificadas_2D_Profesor.nivel.DefaultDropDownValue

			' Field creditos
			Asignaturas_Planificadas_2D_Profesor.creditos.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.creditos.DropDownValue = Asignaturas_Planificadas_2D_Profesor.creditos.DefaultDropDownValue

			' Field CODSECC
			Asignaturas_Planificadas_2D_Profesor.CODSECC.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownValue = Asignaturas_Planificadas_2D_Profesor.CODSECC.DefaultDropDownValue

			' Field ANO
			Asignaturas_Planificadas_2D_Profesor.ANO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.ANO.DropDownValue = Asignaturas_Planificadas_2D_Profesor.ANO.DefaultDropDownValue

			' Field PERIODO
			Asignaturas_Planificadas_2D_Profesor.PERIODO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownValue = Asignaturas_Planificadas_2D_Profesor.PERIODO.DefaultDropDownValue

			' Field JORNADA
			Asignaturas_Planificadas_2D_Profesor.JORNADA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownValue = Asignaturas_Planificadas_2D_Profesor.JORNADA.DefaultDropDownValue

			' Field PROFESOR
			Asignaturas_Planificadas_2D_Profesor.PROFESOR.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownValue = Asignaturas_Planificadas_2D_Profesor.PROFESOR.DefaultDropDownValue

			' Field ASIGNADO
			Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownValue = Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DefaultDropDownValue

			' Field HORARIO
			Asignaturas_Planificadas_2D_Profesor.HORARIO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownValue = Asignaturas_Planificadas_2D_Profesor.HORARIO.DefaultDropDownValue

			' Field CERRADA
			Asignaturas_Planificadas_2D_Profesor.CERRADA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownValue = Asignaturas_Planificadas_2D_Profesor.CERRADA.DefaultDropDownValue

		' Set up default values for extended filters
			' Field CODCARR

			SetDefaultExtFilter(Asignaturas_Planificadas_2D_Profesor.CODCARR, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Asignaturas_Planificadas_2D_Profesor.CODCARR)	

			' Field CODRAMO
			SetDefaultExtFilter(Asignaturas_Planificadas_2D_Profesor.CODRAMO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Asignaturas_Planificadas_2D_Profesor.CODRAMO)	

			' Field CODPROF
			SetDefaultExtFilter(Asignaturas_Planificadas_2D_Profesor.CODPROF, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Asignaturas_Planificadas_2D_Profesor.CODPROF)	

			' Field CANT_ALUMNOS
			SetDefaultExtFilter(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C)) Then bFilterExist = True

		' Check CODCARR extended filter
		If (TextFilterApplied(Asignaturas_Planificadas_2D_Profesor.CODCARR)) Then bFilterExist = True

		' Check NOMBRE dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.NOMBRE)) Then bFilterExist = True

		' Check CODRAMO extended filter
		If (TextFilterApplied(Asignaturas_Planificadas_2D_Profesor.CODRAMO)) Then bFilterExist = True

		' Check nivel dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.nivel)) Then bFilterExist = True

		' Check creditos dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.creditos)) Then bFilterExist = True

		' Check CODSECC dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.CODSECC)) Then bFilterExist = True

		' Check ANO dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.ANO)) Then bFilterExist = True

		' Check PERIODO dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.PERIODO)) Then bFilterExist = True

		' Check JORNADA dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.JORNADA)) Then bFilterExist = True

		' Check PROFESOR dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.PROFESOR)) Then bFilterExist = True

		' Check CODPROF extended filter
		If (TextFilterApplied(Asignaturas_Planificadas_2D_Profesor.CODPROF)) Then bFilterExist = True

		' Check ASIGNADO dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.ASIGNADO)) Then bFilterExist = True

		' Check CANT_ALUMNOS extended filter
		If (TextFilterApplied(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS)) Then bFilterExist = True

		' Check HORARIO dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.HORARIO)) Then bFilterExist = True

		' Check CERRADA dropdown filter
		If (NonTextFilterApplied(Asignaturas_Planificadas_2D_Profesor.CERRADA)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODCARR
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Asignaturas_Planificadas_2D_Profesor.CODCARR, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.CODCARR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.NOMBRE, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODRAMO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Asignaturas_Planificadas_2D_Profesor.CODRAMO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.CODRAMO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field nivel
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.nivel, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.nivel.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field creditos
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.creditos, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.creditos.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODSECC
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.CODSECC, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.CODSECC.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.ANO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.ANO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.PERIODO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.PERIODO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field JORNADA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.JORNADA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.JORNADA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PROFESOR
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.PROFESOR, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.PROFESOR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODPROF
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Asignaturas_Planificadas_2D_Profesor.CODPROF, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.CODPROF.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ASIGNADO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.ASIGNADO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.ASIGNADO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CANT_ALUMNOS
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field HORARIO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.HORARIO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.HORARIO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CERRADA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Asignaturas_Planificadas_2D_Profesor.CERRADA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Asignaturas_Planificadas_2D_Profesor.CERRADA.FldCaption() & "<br>"
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
				Asignaturas_Planificadas_2D_Profesor.OrderBy = ""
				Asignaturas_Planificadas_2D_Profesor.StartGroup = 1
				Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.CODCARR.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.NOMBRE.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.CODRAMO.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.nivel.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.creditos.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.CODSECC.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.ANO.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.PERIODO.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.JORNADA.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.PROFESOR.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.CODPROF.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.ASIGNADO.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.HORARIO.Sort = ""
				Asignaturas_Planificadas_2D_Profesor.CERRADA.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Asignaturas_Planificadas_2D_Profesor.CurrentOrder = ew_Get("order")
			Asignaturas_Planificadas_2D_Profesor.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Asignaturas_Planificadas_2D_Profesor.SortSql()
			Asignaturas_Planificadas_2D_Profesor.OrderBy = sSortSql
			Asignaturas_Planificadas_2D_Profesor.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.OrderBy)) Then
			Asignaturas_Planificadas_2D_Profesor.OrderBy = "[NOMBRE_C] ASC, [NOMBRE] ASC"
			Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.Sort = "ASC"
			Asignaturas_Planificadas_2D_Profesor.NOMBRE.Sort = "ASC"
		End If
		Return Asignaturas_Planificadas_2D_Profesor.OrderBy
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
		Asignaturas_Planificadas_2D_Profesor_summary = New crAsignaturas_Planificadas_2D_Profesor_summary(Me)
		Asignaturas_Planificadas_2D_Profesor_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Asignaturas_Planificadas_2D_Profesor_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Asignaturas_Planificadas_2D_Profesor_summary IsNot Nothing) Then Asignaturas_Planificadas_2D_Profesor_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Asignaturas_Planificadas_2D_Profesor_summary = new ewrpt_Page("Asignaturas_Planificadas_2D_Profesor_summary");
// page properties
Asignaturas_Planificadas_2D_Profesor_summary.PageID = "summary"; // page ID
Asignaturas_Planificadas_2D_Profesor_summary.FormID = "fAsignaturas_Planificadas_2D_Profesorsummaryfilter"; // form ID
var EWRPT_PAGE_ID = Asignaturas_Planificadas_2D_Profesor_summary.PageID;
// extend page with ValidateForm function
Asignaturas_Planificadas_2D_Profesor_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_CANT_ALUMNOS;
if (elm && !ewrpt_CheckInteger(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Asignaturas_Planificadas_2D_Profesor_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Asignaturas_Planificadas_2D_Profesor_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Asignaturas_Planificadas_2D_Profesor_summary.ValidateRequired = false; // no JavaScript validation
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
<% Asignaturas_Planificadas_2D_Profesor_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Asignaturas_Planificadas_2D_Profesor.TableCaption() %></h1></div>
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Asignaturas_Planificadas_2D_Profesor_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" alt="Exportar a Excel" title="Exportar a Excel" /></a>
<% If (Asignaturas_Planificadas_2D_Profesor_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Asignaturas_Planificadas_2D_Profesor_summary.ShowMessage() %>
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Asignaturas_Planificadas_2D_Profesor.FilterPanelOption = 2 OrElse (Asignaturas_Planificadas_2D_Profesor.FilterPanelOption = 3 AndAlso Asignaturas_Planificadas_2D_Profesor_summary.FilterApplied) OrElse Asignaturas_Planificadas_2D_Profesor_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Asignaturas_Planificadas_2D_Profesorsmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fAsignaturas_Planificadas_2D_Profesorsummaryfilter" id="fAsignaturas_Planificadas_2D_Profesorsummaryfilter" action="Asignaturas_Planificadas_2D_Profesorsmry.aspx" class="ewForm" onsubmit="return Asignaturas_Planificadas_2D_Profesor_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.CODCARR.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODCARR" id="sv1_CODCARR" size="30" maxlength="30" value="<%= ew_HtmlEncode(Asignaturas_Planificadas_2D_Profesor.CODCARR.SearchValue) %>"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_CODCARR", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.NOMBRE.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE" id="sv_NOMBRE"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_NOMBRE", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.NOMBRE.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.NOMBRE.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.NOMBRE.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.CODRAMO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODRAMO" id="sv1_CODRAMO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Asignaturas_Planificadas_2D_Profesor.CODRAMO.SearchValue) %>"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_CODRAMO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.nivel.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_nivel" id="sv_nivel"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_nivel", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.nivel.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.nivel.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.nivel.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.nivel.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "nivel")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.nivel.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.nivel.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.nivel.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.creditos.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_creditos" id="sv_creditos"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_creditos", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.creditos.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.creditos.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.creditos.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.creditos.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "creditos")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.creditos.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.creditos.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.creditos.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.CODSECC.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CODSECC" id="sv_CODSECC"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_CODSECC", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.CODSECC.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.CODSECC.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CODSECC")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.CODSECC.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.ANO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO" id="sv_ANO"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_ANO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.ANO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.ANO.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.ANO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.ANO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.ANO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.ANO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.ANO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.PERIODO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO" id="sv_PERIODO"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_PERIODO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.PERIODO.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.PERIODO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PERIODO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.PERIODO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.JORNADA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_JORNADA" id="sv_JORNADA"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_JORNADA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.JORNADA.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.JORNADA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "JORNADA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.JORNADA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.PROFESOR.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PROFESOR" id="sv_PROFESOR"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_PROFESOR", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.PROFESOR.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.PROFESOR.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PROFESOR")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.PROFESOR.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.CODPROF.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODPROF" id="sv1_CODPROF" size="30" maxlength="30" value="<%= ew_HtmlEncode(Asignaturas_Planificadas_2D_Profesor.CODPROF.SearchValue) %>"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_CODPROF", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.ASIGNADO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.ASIGNADO.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.ASIGNADO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ASIGNADO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownValue" id="Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ASIGNADO" id="sv_ASIGNADO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.ASIGNADO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CANT_ALUMNOS" id="sv1_CANT_ALUMNOS" size="30" value="<%= ew_HtmlEncode(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.SearchValue) %>"<%= IIf(Asignaturas_Planificadas_2D_Profesor_summary.ClearExtFilter = "Asignaturas_Planificadas_2D_Profesor_CANT_ALUMNOS", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.HORARIO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.HORARIO.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.HORARIO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "HORARIO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownValue" id="Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_HORARIO" id="sv_HORARIO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.HORARIO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Asignaturas_Planificadas_2D_Profesor.CERRADA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Asignaturas_Planificadas_2D_Profesor.CERRADA.CustomFilters.Count + Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Asignaturas_Planificadas_2D_Profesor.CERRADA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CERRADA")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownValue" id="Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_CERRADA" id="sv_CERRADA" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Asignaturas_Planificadas_2D_Profesor.CERRADA.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (Asignaturas_Planificadas_2D_Profesor.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Asignaturas_Planificadas_2D_Profesor_summary.ShowFilterList() %>
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
If (Asignaturas_Planificadas_2D_Profesor.ExportAll AndAlso ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then
	Asignaturas_Planificadas_2D_Profesor_summary.StopGrp = Asignaturas_Planificadas_2D_Profesor_summary.TotalGrps
Else
	Asignaturas_Planificadas_2D_Profesor_summary.StopGrp = Asignaturas_Planificadas_2D_Profesor_summary.StartGrp + Asignaturas_Planificadas_2D_Profesor_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Asignaturas_Planificadas_2D_Profesor_summary.StopGrp > Asignaturas_Planificadas_2D_Profesor_summary.TotalGrps) Then
	Asignaturas_Planificadas_2D_Profesor_summary.StopGrp = Asignaturas_Planificadas_2D_Profesor_summary.TotalGrps
End If
Asignaturas_Planificadas_2D_Profesor_summary.RecCount = 0

' Get first row
If (Asignaturas_Planificadas_2D_Profesor_summary.TotalGrps > 0) Then
	Asignaturas_Planificadas_2D_Profesor_summary.GetRow() ' ASPXRPT
	Asignaturas_Planificadas_2D_Profesor_summary.GrpCount = 1
End If
While ((Asignaturas_Planificadas_2D_Profesor_summary.HasRow AndAlso Asignaturas_Planificadas_2D_Profesor_summary.GrpIndex < Asignaturas_Planificadas_2D_Profesor_summary.StopGrp) OrElse Asignaturas_Planificadas_2D_Profesor_summary.ShowFirstHeader)

	' Show header
	If (Asignaturas_Planificadas_2D_Profesor_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.NOMBRE_C) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CODCARR) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.NOMBRE) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.CODRAMO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CODRAMO))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.CODRAMO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CODRAMO) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.CODRAMO.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.CODRAMO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.CODRAMO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.nivel.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.nivel))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.nivel.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.nivel) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.nivel.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.nivel.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.nivel.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.creditos.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.creditos))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.creditos.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.creditos) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.creditos.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.creditos.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.creditos.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.CODSECC.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CODSECC))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.CODSECC.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CODSECC) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.CODSECC.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.CODSECC.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.CODSECC.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.ANO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.ANO))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.ANO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.ANO) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.ANO.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.ANO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.ANO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.PERIODO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.PERIODO))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.PERIODO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.PERIODO) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.PERIODO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.PERIODO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.JORNADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.JORNADA))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.JORNADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.JORNADA) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.JORNADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.JORNADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.PROFESOR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.PROFESOR))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.PROFESOR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.PROFESOR) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.PROFESOR.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.PROFESOR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.PROFESOR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.CODPROF.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CODPROF))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.CODPROF.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CODPROF) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.CODPROF.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.CODPROF.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.CODPROF.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.ASIGNADO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.ASIGNADO))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.ASIGNADO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.ASIGNADO) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.ASIGNADO.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.ASIGNADO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.ASIGNADO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.HORARIO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.HORARIO))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.HORARIO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.HORARIO) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.HORARIO.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.HORARIO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.HORARIO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Asignaturas_Planificadas_2D_Profesor.Export)) Then %>
<%= Asignaturas_Planificadas_2D_Profesor.CERRADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CERRADA))) Then %>
		<td style="vertical-align: bottom;"><%= Asignaturas_Planificadas_2D_Profesor.CERRADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Asignaturas_Planificadas_2D_Profesor.SortUrl(Asignaturas_Planificadas_2D_Profesor.CERRADA) %>',0);"><%= Asignaturas_Planificadas_2D_Profesor.CERRADA.FldCaption() %></td><td style="width: 10px;">
		<% If (Asignaturas_Planificadas_2D_Profesor.CERRADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Asignaturas_Planificadas_2D_Profesor.CERRADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Asignaturas_Planificadas_2D_Profesor_summary.ShowFirstHeader = False
	End If
	Asignaturas_Planificadas_2D_Profesor_summary.RecCount += 1

		' Render detail row
		Asignaturas_Planificadas_2D_Profesor.ResetCSS()
		Asignaturas_Planificadas_2D_Profesor.RowType = EWRPT_ROWTYPE_DETAIL
		Asignaturas_Planificadas_2D_Profesor_summary.RenderRow()
%>
	<tr<%= Asignaturas_Planificadas_2D_Profesor.RowAttributes() %>>
		<td<%= Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.CODCARR.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.CODCARR.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.CODCARR.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.NOMBRE.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.NOMBRE.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.CODRAMO.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.CODRAMO.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.CODRAMO.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.nivel.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.nivel.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.nivel.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.creditos.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.creditos.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.creditos.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.CODSECC.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.CODSECC.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.CODSECC.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.ANO.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.ANO.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.ANO.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.PERIODO.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.PERIODO.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.PERIODO.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.JORNADA.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.JORNADA.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.JORNADA.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.PROFESOR.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.PROFESOR.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.PROFESOR.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.CODPROF.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.CODPROF.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.CODPROF.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.ASIGNADO.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.ASIGNADO.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.ASIGNADO.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.CANT_ALUMNOS.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.HORARIO.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.HORARIO.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.HORARIO.ListViewValue%></div>
</td>
		<td<%= Asignaturas_Planificadas_2D_Profesor.CERRADA.CellAttributes %>>
<div<%= Asignaturas_Planificadas_2D_Profesor.CERRADA.ViewAttributes%>><%= Asignaturas_Planificadas_2D_Profesor.CERRADA.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Asignaturas_Planificadas_2D_Profesor_summary.AccumulateSummary()

		' Get next record
		Asignaturas_Planificadas_2D_Profesor_summary.GetRow() ' ASPXRPT
		Asignaturas_Planificadas_2D_Profesor_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Asignaturas_Planificadas_2D_Profesor_summary.TotalGrps > 0) Then
	Asignaturas_Planificadas_2D_Profesor.ResetCSS()
	Asignaturas_Planificadas_2D_Profesor.RowType = EWRPT_ROWTYPE_TOTAL
	Asignaturas_Planificadas_2D_Profesor.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Asignaturas_Planificadas_2D_Profesor.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Asignaturas_Planificadas_2D_Profesor.RowAttrs("class") = "ewRptGrandSummary"
	Asignaturas_Planificadas_2D_Profesor_summary.RenderRow()
%>
	<!-- tr><td colspan="16"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Asignaturas_Planificadas_2D_Profesor.RowAttributes() %>><td colspan="16"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Asignaturas_Planificadas_2D_Profesor_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Asignaturas_Planificadas_2D_Profesor_summary.Pager Is Nothing Then Asignaturas_Planificadas_2D_Profesor_summary.Pager = New cPrevNextPager(Asignaturas_Planificadas_2D_Profesor_summary.StartGrp, Asignaturas_Planificadas_2D_Profesor_summary.DisplayGrps, Asignaturas_Planificadas_2D_Profesor_summary.TotalGrps) %>
<% If Asignaturas_Planificadas_2D_Profesor_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Asignaturas_Planificadas_2D_Profesor_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Asignaturas_Planificadas_2D_Profesorsmry.aspx?start=<%= Asignaturas_Planificadas_2D_Profesor_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Asignaturas_Planificadas_2D_Profesor_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Asignaturas_Planificadas_2D_Profesorsmry.aspx?start=<%= Asignaturas_Planificadas_2D_Profesor_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Asignaturas_Planificadas_2D_Profesor_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Asignaturas_Planificadas_2D_Profesor_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Asignaturas_Planificadas_2D_Profesorsmry.aspx?start=<%= Asignaturas_Planificadas_2D_Profesor_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Asignaturas_Planificadas_2D_Profesor_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Asignaturas_Planificadas_2D_Profesorsmry.aspx?start=<%= Asignaturas_Planificadas_2D_Profesor_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Asignaturas_Planificadas_2D_Profesor_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Asignaturas_Planificadas_2D_Profesor_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Asignaturas_Planificadas_2D_Profesor_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Asignaturas_Planificadas_2D_Profesor_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Asignaturas_Planificadas_2D_Profesor_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Asignaturas_Planificadas_2D_Profesor_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Asignaturas_Planificadas_2D_Profesor_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Asignaturas_Planificadas_2D_Profesor_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Asignaturas_Planificadas_2D_Profesor_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Asignaturas_Planificadas_2D_Profesor_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Asignaturas_Planificadas_2D_Profesor.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
