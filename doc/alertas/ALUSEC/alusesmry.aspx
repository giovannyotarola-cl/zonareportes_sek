<%@ Page ClassName="alusesmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_Alumnos_Lista_Clase" %>
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
	Public AlumnosListaClase As crAlumnosListaClase = Nothing

	'
	' Table class (for AlumnosListaClase)
	'
	Public Class crAlumnosListaClase
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
				Return "AlumnosListaClase"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "AlumnosListaClase"
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

		Public ANO_MAT As crField

		Public PERIODO_MAT As crField

		Public CODSECC_I As crField

		Public CODSECC As crField

		Public RAMOEQUIV_I As crField

		Public CODRAMO As crField

		Public Nombre_Ramo As crField

		Public NOMBRE_C As crField

		Public JORNADA As crField

		Public ESTADO As crField

		Public ANO_IN As crField

		Public CODCLI As crField

		Public CODCARR As crField

		Public RAMOEQUIV As crField

		Public INSCRITO As crField

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
			RUT = new crField("AlumnosListaClase", "AlumnosListaClase", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("AlumnosListaClase", "AlumnosListaClase", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("AlumnosListaClase", "AlumnosListaClase", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("AlumnosListaClase", "AlumnosListaClase", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' ANO_MAT
			ANO_MAT = new crField("AlumnosListaClase", "AlumnosListaClase", "x_ANO_MAT", "ANO_MAT", "[ANO_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO_MAT.Page = APage
			ANO_MAT.ParentPage = APage.ParentPage
			ANO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO_MAT", ANO_MAT)
			ANO_MAT.DateFilter = ""
			ANO_MAT.SqlSelect = ""
			ANO_MAT.SqlOrderBy = ""

			' PERIODO_MAT
			PERIODO_MAT = new crField("AlumnosListaClase", "AlumnosListaClase", "x_PERIODO_MAT", "PERIODO_MAT", "[PERIODO_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PERIODO_MAT.Page = APage
			PERIODO_MAT.ParentPage = APage.ParentPage
			PERIODO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PERIODO_MAT", PERIODO_MAT)
			PERIODO_MAT.DateFilter = ""
			PERIODO_MAT.SqlSelect = ""
			PERIODO_MAT.SqlOrderBy = ""

			' CODSECC_I
			CODSECC_I = new crField("AlumnosListaClase", "AlumnosListaClase", "x_CODSECC_I", "CODSECC_I", "[CODSECC_I]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CODSECC_I.Page = APage
			CODSECC_I.ParentPage = APage.ParentPage
			CODSECC_I.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CODSECC_I", CODSECC_I)
			CODSECC_I.DateFilter = ""
			CODSECC_I.SqlSelect = ""
			CODSECC_I.SqlOrderBy = ""

			' CODSECC
			CODSECC = new crField("AlumnosListaClase", "AlumnosListaClase", "x_CODSECC", "CODSECC", "[CODSECC]", 131, EWRPT_DATATYPE_NUMBER, -1)
			CODSECC.Page = APage
			CODSECC.ParentPage = APage.ParentPage
			CODSECC.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("CODSECC", CODSECC)
			CODSECC.DateFilter = ""
			CODSECC.SqlSelect = ""
			CODSECC.SqlOrderBy = ""

			' RAMOEQUIV_I
			RAMOEQUIV_I = new crField("AlumnosListaClase", "AlumnosListaClase", "x_RAMOEQUIV_I", "RAMOEQUIV_I", "[RAMOEQUIV_I]", 200, EWRPT_DATATYPE_STRING, -1)
			RAMOEQUIV_I.Page = APage
			RAMOEQUIV_I.ParentPage = APage.ParentPage
			Fields.Add("RAMOEQUIV_I", RAMOEQUIV_I)
			RAMOEQUIV_I.DateFilter = ""
			RAMOEQUIV_I.SqlSelect = ""
			RAMOEQUIV_I.SqlOrderBy = ""

			' CODRAMO
			CODRAMO = new crField("AlumnosListaClase", "AlumnosListaClase", "x_CODRAMO", "CODRAMO", "[CODRAMO]", 200, EWRPT_DATATYPE_STRING, -1)
			CODRAMO.Page = APage
			CODRAMO.ParentPage = APage.ParentPage
			Fields.Add("CODRAMO", CODRAMO)
			CODRAMO.DateFilter = ""
			CODRAMO.SqlSelect = ""
			CODRAMO.SqlOrderBy = ""

			' Nombre_Ramo
			Nombre_Ramo = new crField("AlumnosListaClase", "AlumnosListaClase", "x_Nombre_Ramo", "Nombre_Ramo", "[Nombre_Ramo]", 200, EWRPT_DATATYPE_STRING, -1)
			Nombre_Ramo.Page = APage
			Nombre_Ramo.ParentPage = APage.ParentPage
			Fields.Add("Nombre_Ramo", Nombre_Ramo)
			Nombre_Ramo.DateFilter = ""
			Nombre_Ramo.SqlSelect = ""
			Nombre_Ramo.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("AlumnosListaClase", "AlumnosListaClase", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' JORNADA
			JORNADA = new crField("AlumnosListaClase", "AlumnosListaClase", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			JORNADA.Page = APage
			JORNADA.ParentPage = APage.ParentPage
			Fields.Add("JORNADA", JORNADA)
			JORNADA.DateFilter = ""
			JORNADA.SqlSelect = ""
			JORNADA.SqlOrderBy = ""

			' ESTADO
			ESTADO = new crField("AlumnosListaClase", "AlumnosListaClase", "x_ESTADO", "ESTADO", "[ESTADO]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTADO.Page = APage
			ESTADO.ParentPage = APage.ParentPage
			Fields.Add("ESTADO", ESTADO)
			ESTADO.DateFilter = ""
			ESTADO.SqlSelect = ""
			ESTADO.SqlOrderBy = ""

			' ANO_IN
			ANO_IN = new crField("AlumnosListaClase", "AlumnosListaClase", "x_ANO_IN", "ANO_IN", "[ANO_IN]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ANO_IN.Page = APage
			ANO_IN.ParentPage = APage.ParentPage
			ANO_IN.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ANO_IN", ANO_IN)
			ANO_IN.DateFilter = ""
			ANO_IN.SqlSelect = ""
			ANO_IN.SqlOrderBy = ""

			' CODCLI
			CODCLI = new crField("AlumnosListaClase", "AlumnosListaClase", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCLI.Page = APage
			CODCLI.ParentPage = APage.ParentPage
			Fields.Add("CODCLI", CODCLI)
			CODCLI.DateFilter = ""
			CODCLI.SqlSelect = ""
			CODCLI.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("AlumnosListaClase", "AlumnosListaClase", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' RAMOEQUIV
			RAMOEQUIV = new crField("AlumnosListaClase", "AlumnosListaClase", "x_RAMOEQUIV", "RAMOEQUIV", "[RAMOEQUIV]", 200, EWRPT_DATATYPE_STRING, -1)
			RAMOEQUIV.Page = APage
			RAMOEQUIV.ParentPage = APage.ParentPage
			Fields.Add("RAMOEQUIV", RAMOEQUIV)
			RAMOEQUIV.DateFilter = ""
			RAMOEQUIV.SqlSelect = ""
			RAMOEQUIV.SqlOrderBy = ""

			' INSCRITO
			INSCRITO = new crField("AlumnosListaClase", "AlumnosListaClase", "x_INSCRITO", "INSCRITO", "[INSCRITO]", 200, EWRPT_DATATYPE_STRING, -1)
			INSCRITO.Page = APage
			INSCRITO.ParentPage = APage.ParentPage
			Fields.Add("INSCRITO", INSCRITO)
			INSCRITO.DateFilter = ""
			INSCRITO.SqlSelect = ""
			INSCRITO.SqlOrderBy = ""
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
				Return "[SEK_Alumnos_Lista_Clase]"
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
	Public AlumnosListaClase_summary As crAlumnosListaClase_summary

	'
	' Page class
	'
	Public Class crAlumnosListaClase_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (AlumnosListaClase.UseTokenInUrl) Then
				sUrl &= "t=" & AlumnosListaClase.TableVar & "&" ' Add page token
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
			If (AlumnosListaClase.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(AlumnosListaClase.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(AlumnosListaClase.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
                            Public ReadOnly Property AspNetPage As alusesmry
                                Get
                                    Return CType(m_ParentPage, alusesmry)
                                End Get
                            End Property

		' Table object (AlumnosListaClase)
		Public Property AlumnosListaClase As crAlumnosListaClase 
			Get		
				Return AspNetPage.AlumnosListaClase ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crAlumnosListaClase)
				AspNetPage.AlumnosListaClase = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_Alumnos_Lista_Clase)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "AlumnosListaClase_summary"
			m_PageObjTypeName = "crAlumnosListaClase_summary"

			' Table name
			m_TableName = "AlumnosListaClase"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (AlumnosListaClase)
			AlumnosListaClase = New crAlumnosListaClase(Me)			

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
				AlumnosListaClase.Export = ew_Get("export")
			End If
			gsExport = AlumnosListaClase.Export ' Get export parameter, used in header
			gsExportFile = AlumnosListaClase.TableVar ' Get export file, used in header
			If (AlumnosListaClase.Export = "excel") Then
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
			AlumnosListaClase.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(AlumnosListaClase.SqlSelect, AlumnosListaClase.SqlWhere, AlumnosListaClase.SqlGroupBy, AlumnosListaClase.SqlHaving, AlumnosListaClase.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (AlumnosListaClase.ExportAll AndAlso ew_NotEmpty(AlumnosListaClase.Export)) Then
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
				AlumnosListaClase.RUT.DbValue = Row("RUT")
				AlumnosListaClase.CODSECC.DbValue = Row("CODSECC")
				AlumnosListaClase.CODRAMO.DbValue = Row("CODRAMO")
				AlumnosListaClase.CODCLI.DbValue = Row("CODCLI")
				AlumnosListaClase.ESTADO.DbValue = Row("ESTADO")
				AlumnosListaClase.CODCARR.DbValue = Row("CODCARR")
				AlumnosListaClase.RAMOEQUIV_I.DbValue = Row("RAMOEQUIV_I")
				AlumnosListaClase.CODSECC_I.DbValue = Row("CODSECC_I")
				AlumnosListaClase.PATERNO.DbValue = Row("PATERNO")
				AlumnosListaClase.MATERNO.DbValue = Row("MATERNO")
				AlumnosListaClase.NOMBRE.DbValue = Row("NOMBRE")
				AlumnosListaClase.RAMOEQUIV.DbValue = Row("RAMOEQUIV")
				AlumnosListaClase.INSCRITO.DbValue = Row("INSCRITO")
				AlumnosListaClase.ANO_IN.DbValue = Row("ANO_IN")
				AlumnosListaClase.ANO_MAT.DbValue = Row("ANO_MAT")
				AlumnosListaClase.PERIODO_MAT.DbValue = Row("PERIODO_MAT")
				AlumnosListaClase.JORNADA.DbValue = Row("JORNADA")
				AlumnosListaClase.NOMBRE_C.DbValue = Row("NOMBRE_C")
				AlumnosListaClase.Nombre_Ramo.DbValue = Row("Nombre_Ramo")
				Val(1) = AlumnosListaClase.RUT.CurrentValue
				Val(2) = AlumnosListaClase.NOMBRE.CurrentValue
				Val(3) = AlumnosListaClase.PATERNO.CurrentValue
				Val(4) = AlumnosListaClase.MATERNO.CurrentValue
				Val(5) = AlumnosListaClase.ANO_MAT.CurrentValue
				Val(6) = AlumnosListaClase.PERIODO_MAT.CurrentValue
				Val(7) = AlumnosListaClase.CODSECC_I.CurrentValue
				Val(8) = AlumnosListaClase.RAMOEQUIV_I.CurrentValue
				Val(9) = AlumnosListaClase.Nombre_Ramo.CurrentValue
				Val(10) = AlumnosListaClase.NOMBRE_C.CurrentValue
				Val(11) = AlumnosListaClase.JORNADA.CurrentValue
				Val(12) = AlumnosListaClase.ESTADO.CurrentValue
				Val(13) = AlumnosListaClase.ANO_IN.CurrentValue
				Val(14) = AlumnosListaClase.INSCRITO.CurrentValue
			Else
				AlumnosListaClase.RUT.DbValue = ""
				AlumnosListaClase.CODSECC.DbValue = ""
				AlumnosListaClase.CODRAMO.DbValue = ""
				AlumnosListaClase.CODCLI.DbValue = ""
				AlumnosListaClase.ESTADO.DbValue = ""
				AlumnosListaClase.CODCARR.DbValue = ""
				AlumnosListaClase.RAMOEQUIV_I.DbValue = ""
				AlumnosListaClase.CODSECC_I.DbValue = ""
				AlumnosListaClase.PATERNO.DbValue = ""
				AlumnosListaClase.MATERNO.DbValue = ""
				AlumnosListaClase.NOMBRE.DbValue = ""
				AlumnosListaClase.RAMOEQUIV.DbValue = ""
				AlumnosListaClase.INSCRITO.DbValue = ""
				AlumnosListaClase.ANO_IN.DbValue = ""
				AlumnosListaClase.ANO_MAT.DbValue = ""
				AlumnosListaClase.PERIODO_MAT.DbValue = ""
				AlumnosListaClase.JORNADA.DbValue = ""
				AlumnosListaClase.NOMBRE_C.DbValue = ""
				AlumnosListaClase.Nombre_Ramo.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				AlumnosListaClase.RUT.DbValue = dr("RUT")
				AlumnosListaClase.CODSECC.DbValue = dr("CODSECC")
				AlumnosListaClase.CODRAMO.DbValue = dr("CODRAMO")
				AlumnosListaClase.CODCLI.DbValue = dr("CODCLI")
				AlumnosListaClase.ESTADO.DbValue = dr("ESTADO")
				AlumnosListaClase.CODCARR.DbValue = dr("CODCARR")
				AlumnosListaClase.RAMOEQUIV_I.DbValue = dr("RAMOEQUIV_I")
				AlumnosListaClase.CODSECC_I.DbValue = dr("CODSECC_I")
				AlumnosListaClase.PATERNO.DbValue = dr("PATERNO")
				AlumnosListaClase.MATERNO.DbValue = dr("MATERNO")
				AlumnosListaClase.NOMBRE.DbValue = dr("NOMBRE")
				AlumnosListaClase.RAMOEQUIV.DbValue = dr("RAMOEQUIV")
				AlumnosListaClase.INSCRITO.DbValue = dr("INSCRITO")
				AlumnosListaClase.ANO_IN.DbValue = dr("ANO_IN")
				AlumnosListaClase.ANO_MAT.DbValue = dr("ANO_MAT")
				AlumnosListaClase.PERIODO_MAT.DbValue = dr("PERIODO_MAT")
				AlumnosListaClase.JORNADA.DbValue = dr("JORNADA")
				AlumnosListaClase.NOMBRE_C.DbValue = dr("NOMBRE_C")
				AlumnosListaClase.Nombre_Ramo.DbValue = dr("Nombre_Ramo")
				Val(1) = AlumnosListaClase.RUT.CurrentValue
				Val(2) = AlumnosListaClase.NOMBRE.CurrentValue
				Val(3) = AlumnosListaClase.PATERNO.CurrentValue
				Val(4) = AlumnosListaClase.MATERNO.CurrentValue
				Val(5) = AlumnosListaClase.ANO_MAT.CurrentValue
				Val(6) = AlumnosListaClase.PERIODO_MAT.CurrentValue
				Val(7) = AlumnosListaClase.CODSECC_I.CurrentValue
				Val(8) = AlumnosListaClase.RAMOEQUIV_I.CurrentValue
				Val(9) = AlumnosListaClase.Nombre_Ramo.CurrentValue
				Val(10) = AlumnosListaClase.NOMBRE_C.CurrentValue
				Val(11) = AlumnosListaClase.JORNADA.CurrentValue
				Val(12) = AlumnosListaClase.ESTADO.CurrentValue
				Val(13) = AlumnosListaClase.ANO_IN.CurrentValue
				Val(14) = AlumnosListaClase.INSCRITO.CurrentValue
			Else				
				AlumnosListaClase.RUT.DbValue = ""
				AlumnosListaClase.CODSECC.DbValue = ""
				AlumnosListaClase.CODRAMO.DbValue = ""
				AlumnosListaClase.CODCLI.DbValue = ""
				AlumnosListaClase.ESTADO.DbValue = ""
				AlumnosListaClase.CODCARR.DbValue = ""
				AlumnosListaClase.RAMOEQUIV_I.DbValue = ""
				AlumnosListaClase.CODSECC_I.DbValue = ""
				AlumnosListaClase.PATERNO.DbValue = ""
				AlumnosListaClase.MATERNO.DbValue = ""
				AlumnosListaClase.NOMBRE.DbValue = ""
				AlumnosListaClase.RAMOEQUIV.DbValue = ""
				AlumnosListaClase.INSCRITO.DbValue = ""
				AlumnosListaClase.ANO_IN.DbValue = ""
				AlumnosListaClase.ANO_MAT.DbValue = ""
				AlumnosListaClase.PERIODO_MAT.DbValue = ""
				AlumnosListaClase.JORNADA.DbValue = ""
				AlumnosListaClase.NOMBRE_C.DbValue = ""
				AlumnosListaClase.Nombre_Ramo.DbValue = ""
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
				AlumnosListaClase.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					AlumnosListaClase.StartGroup = StartGrp
				Else
					StartGrp = AlumnosListaClase.StartGroup
				End If
			Else
				StartGrp = AlumnosListaClase.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				AlumnosListaClase.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				AlumnosListaClase.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				AlumnosListaClase.StartGroup = StartGrp
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
			AlumnosListaClase.StartGroup = StartGrp
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
				AlumnosListaClase.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				AlumnosListaClase.StartGroup = StartGrp
			Else				
				If (AlumnosListaClase.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(AlumnosListaClase.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (AlumnosListaClase.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(AlumnosListaClase.SqlSelectCount, AlumnosListaClase.SqlWhere, AlumnosListaClase.SqlGroupBy, AlumnosListaClase.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			AlumnosListaClase.Row_Rendering()

			'
			' Render view codes
			'

			If (AlumnosListaClase.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' RUT
				AlumnosListaClase.RUT.ViewValue = Convert.ToString(AlumnosListaClase.RUT.Summary)
				AlumnosListaClase.RUT.ViewAttrs("style") = "font-weight:bold;"

				' NOMBRE
				AlumnosListaClase.NOMBRE.ViewValue = Convert.ToString(AlumnosListaClase.NOMBRE.Summary)

				' PATERNO
				AlumnosListaClase.PATERNO.ViewValue = Convert.ToString(AlumnosListaClase.PATERNO.Summary)

				' MATERNO
				AlumnosListaClase.MATERNO.ViewValue = Convert.ToString(AlumnosListaClase.MATERNO.Summary)

				' ANO_MAT
				AlumnosListaClase.ANO_MAT.ViewValue = Convert.ToString(AlumnosListaClase.ANO_MAT.Summary)
				AlumnosListaClase.ANO_MAT.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' PERIODO_MAT
				AlumnosListaClase.PERIODO_MAT.ViewValue = Convert.ToString(AlumnosListaClase.PERIODO_MAT.Summary)
				AlumnosListaClase.PERIODO_MAT.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' CODSECC_I
				AlumnosListaClase.CODSECC_I.ViewValue = Convert.ToString(AlumnosListaClase.CODSECC_I.Summary)
				AlumnosListaClase.CODSECC_I.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' RAMOEQUIV_I
				AlumnosListaClase.RAMOEQUIV_I.ViewValue = Convert.ToString(AlumnosListaClase.RAMOEQUIV_I.Summary)
				AlumnosListaClase.RAMOEQUIV_I.ViewAttrs("style") = "font-weight:bold;"

				' Nombre_Ramo
				AlumnosListaClase.Nombre_Ramo.ViewValue = Convert.ToString(AlumnosListaClase.Nombre_Ramo.Summary)

				' NOMBRE_C
				AlumnosListaClase.NOMBRE_C.ViewValue = Convert.ToString(AlumnosListaClase.NOMBRE_C.Summary)

				' JORNADA
				AlumnosListaClase.JORNADA.ViewValue = Convert.ToString(AlumnosListaClase.JORNADA.Summary)
				AlumnosListaClase.JORNADA.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' ESTADO
				AlumnosListaClase.ESTADO.ViewValue = Convert.ToString(AlumnosListaClase.ESTADO.Summary)

				' ANO_IN
				AlumnosListaClase.ANO_IN.ViewValue = Convert.ToString(AlumnosListaClase.ANO_IN.Summary)
				AlumnosListaClase.ANO_IN.ViewAttrs("style") = "font-weight:bold;text-align:center;"

				' INSCRITO
				AlumnosListaClase.INSCRITO.ViewValue = Convert.ToString(AlumnosListaClase.INSCRITO.Summary)
				AlumnosListaClase.INSCRITO.ViewAttrs("style") = "font-weight:bold;text-align:center;"
			Else

				' RUT
				AlumnosListaClase.RUT.ViewValue = Convert.ToString(AlumnosListaClase.RUT.CurrentValue)
				AlumnosListaClase.RUT.ViewAttrs("style") = "font-weight:bold;"
				AlumnosListaClase.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				AlumnosListaClase.NOMBRE.ViewValue = Convert.ToString(AlumnosListaClase.NOMBRE.CurrentValue)
				AlumnosListaClase.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				AlumnosListaClase.PATERNO.ViewValue = Convert.ToString(AlumnosListaClase.PATERNO.CurrentValue)
				AlumnosListaClase.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				AlumnosListaClase.MATERNO.ViewValue = Convert.ToString(AlumnosListaClase.MATERNO.CurrentValue)
				AlumnosListaClase.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO_MAT
				AlumnosListaClase.ANO_MAT.ViewValue = Convert.ToString(AlumnosListaClase.ANO_MAT.CurrentValue)
				AlumnosListaClase.ANO_MAT.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				AlumnosListaClase.ANO_MAT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PERIODO_MAT
				AlumnosListaClase.PERIODO_MAT.ViewValue = Convert.ToString(AlumnosListaClase.PERIODO_MAT.CurrentValue)
				AlumnosListaClase.PERIODO_MAT.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				AlumnosListaClase.PERIODO_MAT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODSECC_I
				AlumnosListaClase.CODSECC_I.ViewValue = Convert.ToString(AlumnosListaClase.CODSECC_I.CurrentValue)
				AlumnosListaClase.CODSECC_I.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				AlumnosListaClase.CODSECC_I.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RAMOEQUIV_I
				AlumnosListaClase.RAMOEQUIV_I.ViewValue = Convert.ToString(AlumnosListaClase.RAMOEQUIV_I.CurrentValue)
				AlumnosListaClase.RAMOEQUIV_I.ViewAttrs("style") = "font-weight:bold;"
				AlumnosListaClase.RAMOEQUIV_I.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' Nombre_Ramo
				AlumnosListaClase.Nombre_Ramo.ViewValue = Convert.ToString(AlumnosListaClase.Nombre_Ramo.CurrentValue)
				AlumnosListaClase.Nombre_Ramo.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				AlumnosListaClase.NOMBRE_C.ViewValue = Convert.ToString(AlumnosListaClase.NOMBRE_C.CurrentValue)
				AlumnosListaClase.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' JORNADA
				AlumnosListaClase.JORNADA.ViewValue = Convert.ToString(AlumnosListaClase.JORNADA.CurrentValue)
				AlumnosListaClase.JORNADA.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				AlumnosListaClase.JORNADA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTADO
				AlumnosListaClase.ESTADO.ViewValue = Convert.ToString(AlumnosListaClase.ESTADO.CurrentValue)
				AlumnosListaClase.ESTADO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ANO_IN
				AlumnosListaClase.ANO_IN.ViewValue = Convert.ToString(AlumnosListaClase.ANO_IN.CurrentValue)
				AlumnosListaClase.ANO_IN.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				AlumnosListaClase.ANO_IN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' INSCRITO
				AlumnosListaClase.INSCRITO.ViewValue = Convert.ToString(AlumnosListaClase.INSCRITO.CurrentValue)
				AlumnosListaClase.INSCRITO.ViewAttrs("style") = "font-weight:bold;text-align:center;"
				AlumnosListaClase.INSCRITO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' RUT
			AlumnosListaClase.RUT.HrefValue = ""

			' NOMBRE
			AlumnosListaClase.NOMBRE.HrefValue = ""

			' PATERNO
			AlumnosListaClase.PATERNO.HrefValue = ""

			' MATERNO
			AlumnosListaClase.MATERNO.HrefValue = ""

			' ANO_MAT
			AlumnosListaClase.ANO_MAT.HrefValue = ""

			' PERIODO_MAT
			AlumnosListaClase.PERIODO_MAT.HrefValue = ""

			' CODSECC_I
			AlumnosListaClase.CODSECC_I.HrefValue = ""

			' RAMOEQUIV_I
			AlumnosListaClase.RAMOEQUIV_I.HrefValue = ""

			' Nombre_Ramo
			AlumnosListaClase.Nombre_Ramo.HrefValue = ""

			' NOMBRE_C
			AlumnosListaClase.NOMBRE_C.HrefValue = ""

			' JORNADA
			AlumnosListaClase.JORNADA.HrefValue = ""

			' ESTADO
			AlumnosListaClase.ESTADO.HrefValue = ""

			' ANO_IN
			AlumnosListaClase.ANO_IN.HrefValue = ""

			' INSCRITO
			AlumnosListaClase.INSCRITO.HrefValue = ""

			' Call Row_Rendered event
			AlumnosListaClase.Row_Rendered()
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

			' Field ANO_MAT
			sSelect = "SELECT DISTINCT [ANO_MAT] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[ANO_MAT] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.ANO_MAT.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field PERIODO_MAT
			sSelect = "SELECT DISTINCT [PERIODO_MAT] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[PERIODO_MAT] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.PERIODO_MAT.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CODSECC_I
			sSelect = "SELECT DISTINCT [CODSECC_I] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[CODSECC_I] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.CODSECC_I.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field RAMOEQUIV_I
			sSelect = "SELECT DISTINCT [RAMOEQUIV_I] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[RAMOEQUIV_I] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.RAMOEQUIV_I.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field Nombre_Ramo
			sSelect = "SELECT DISTINCT [Nombre_Ramo] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[Nombre_Ramo] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.Nombre_Ramo.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NOMBRE_C
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field JORNADA
			sSelect = "SELECT DISTINCT [JORNADA] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[JORNADA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.JORNADA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTADO
			sSelect = "SELECT DISTINCT [ESTADO] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[ESTADO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.ESTADO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ANO_IN
			sSelect = "SELECT DISTINCT [ANO_IN] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[ANO_IN] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.ANO_IN.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field INSCRITO
			sSelect = "SELECT DISTINCT [INSCRITO] FROM " + AlumnosListaClase.SqlFrom
			sOrderBy = "[INSCRITO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, AlumnosListaClase.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			AlumnosListaClase.INSCRITO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(AlumnosListaClase.RUT)

				' Field NOMBRE
				SetSessionFilterValues(AlumnosListaClase.NOMBRE)

				' Field PATERNO
				SetSessionFilterValues(AlumnosListaClase.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(AlumnosListaClase.MATERNO)

				' Field ANO_MAT
				SetSessionDropDownValue(AlumnosListaClase.ANO_MAT.DropDownValue, AlumnosListaClase.ANO_MAT)

				' Field PERIODO_MAT
				SetSessionDropDownValue(AlumnosListaClase.PERIODO_MAT.DropDownValue, AlumnosListaClase.PERIODO_MAT)

				' Field CODSECC_I
				SetSessionDropDownValue(AlumnosListaClase.CODSECC_I.DropDownValue, AlumnosListaClase.CODSECC_I)

				' Field RAMOEQUIV_I
				SetSessionDropDownValue(AlumnosListaClase.RAMOEQUIV_I.DropDownValue, AlumnosListaClase.RAMOEQUIV_I)

				' Field Nombre_Ramo
				SetSessionDropDownValue(AlumnosListaClase.Nombre_Ramo.DropDownValue, AlumnosListaClase.Nombre_Ramo)

				' Field NOMBRE_C
				SetSessionDropDownValue(AlumnosListaClase.NOMBRE_C.DropDownValue, AlumnosListaClase.NOMBRE_C)

				' Field JORNADA
				SetSessionDropDownValue(AlumnosListaClase.JORNADA.DropDownValue, AlumnosListaClase.JORNADA)

				' Field ESTADO
				SetSessionDropDownValue(AlumnosListaClase.ESTADO.DropDownValue, AlumnosListaClase.ESTADO)

				' Field ANO_IN
				SetSessionDropDownValue(AlumnosListaClase.ANO_IN.DropDownValue, AlumnosListaClase.ANO_IN)

				' Field INSCRITO
				SetSessionDropDownValue(AlumnosListaClase.INSCRITO.DropDownValue, AlumnosListaClase.INSCRITO)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT
				If (GetFilterValues(AlumnosListaClase.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE
				If (GetFilterValues(AlumnosListaClase.NOMBRE)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(AlumnosListaClase.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(AlumnosListaClase.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ANO_MAT
				If (GetDropDownValue(AlumnosListaClase.ANO_MAT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.ANO_MAT.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.ANO_MAT.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_ANO_MAT") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PERIODO_MAT
				If (GetDropDownValue(AlumnosListaClase.PERIODO_MAT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.PERIODO_MAT.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.PERIODO_MAT.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_PERIODO_MAT") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CODSECC_I
				If (GetDropDownValue(AlumnosListaClase.CODSECC_I)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.CODSECC_I.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.CODSECC_I.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_CODSECC_I") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field RAMOEQUIV_I
				If (GetDropDownValue(AlumnosListaClase.RAMOEQUIV_I)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.RAMOEQUIV_I.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.RAMOEQUIV_I.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_RAMOEQUIV_I") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field Nombre_Ramo
				If (GetDropDownValue(AlumnosListaClase.Nombre_Ramo)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.Nombre_Ramo.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.Nombre_Ramo.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_Nombre_Ramo") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field NOMBRE_C
				If (GetDropDownValue(AlumnosListaClase.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field JORNADA
				If (GetDropDownValue(AlumnosListaClase.JORNADA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.JORNADA.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.JORNADA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_JORNADA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ESTADO
				If (GetDropDownValue(AlumnosListaClase.ESTADO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.ESTADO.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.ESTADO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_ESTADO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ANO_IN
				If (GetDropDownValue(AlumnosListaClase.ANO_IN)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.ANO_IN.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.ANO_IN.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_ANO_IN") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field INSCRITO
				If (GetDropDownValue(AlumnosListaClase.INSCRITO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(AlumnosListaClase.INSCRITO.DropDownValue) Then
					If Not ew_SameStr(AlumnosListaClase.INSCRITO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_AlumnosListaClase_INSCRITO") Is Nothing Then
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
			GetSessionFilterValues(AlumnosListaClase.RUT)

			' Field NOMBRE
			GetSessionFilterValues(AlumnosListaClase.NOMBRE)

			' Field PATERNO
			GetSessionFilterValues(AlumnosListaClase.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(AlumnosListaClase.MATERNO)

			' Field ANO_MAT
			GetSessionDropDownValue(AlumnosListaClase.ANO_MAT)

			' Field PERIODO_MAT
			GetSessionDropDownValue(AlumnosListaClase.PERIODO_MAT)

			' Field CODSECC_I
			GetSessionDropDownValue(AlumnosListaClase.CODSECC_I)

			' Field RAMOEQUIV_I
			GetSessionDropDownValue(AlumnosListaClase.RAMOEQUIV_I)

			' Field Nombre_Ramo
			GetSessionDropDownValue(AlumnosListaClase.Nombre_Ramo)

			' Field NOMBRE_C
			GetSessionDropDownValue(AlumnosListaClase.NOMBRE_C)

			' Field JORNADA
			GetSessionDropDownValue(AlumnosListaClase.JORNADA)

			' Field ESTADO
			GetSessionDropDownValue(AlumnosListaClase.ESTADO)

			' Field ANO_IN
			GetSessionDropDownValue(AlumnosListaClase.ANO_IN)

			' Field INSCRITO
			GetSessionDropDownValue(AlumnosListaClase.INSCRITO)
		End If

		' Call page filter validated event
		AlumnosListaClase.Page_FilterValidated()

		' Build SQL
		' Field RUT

		BuildExtendedFilter(AlumnosListaClase.RUT, sFilter)

		' Field NOMBRE
		BuildExtendedFilter(AlumnosListaClase.NOMBRE, sFilter)

		' Field PATERNO
		BuildExtendedFilter(AlumnosListaClase.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(AlumnosListaClase.MATERNO, sFilter)

		' Field ANO_MAT
		BuildDropDownFilter(AlumnosListaClase.ANO_MAT, sFilter, "")

		' Field PERIODO_MAT
		BuildDropDownFilter(AlumnosListaClase.PERIODO_MAT, sFilter, "")

		' Field CODSECC_I
		BuildDropDownFilter(AlumnosListaClase.CODSECC_I, sFilter, "")

		' Field RAMOEQUIV_I
		BuildDropDownFilter(AlumnosListaClase.RAMOEQUIV_I, sFilter, "")

		' Field Nombre_Ramo
		BuildDropDownFilter(AlumnosListaClase.Nombre_Ramo, sFilter, "")

		' Field NOMBRE_C
		BuildDropDownFilter(AlumnosListaClase.NOMBRE_C, sFilter, "")

		' Field JORNADA
		BuildDropDownFilter(AlumnosListaClase.JORNADA, sFilter, "")

		' Field ESTADO
		BuildDropDownFilter(AlumnosListaClase.ESTADO, sFilter, "")

		' Field ANO_IN
		BuildDropDownFilter(AlumnosListaClase.ANO_IN, sFilter, "")

		' Field INSCRITO
		BuildDropDownFilter(AlumnosListaClase.INSCRITO, sFilter, "")

		' Save parms to Session
		' Field RUT

		SetSessionFilterValues(AlumnosListaClase.RUT)

		' Field NOMBRE
		SetSessionFilterValues(AlumnosListaClase.NOMBRE)

		' Field PATERNO
		SetSessionFilterValues(AlumnosListaClase.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(AlumnosListaClase.MATERNO)

		' Field ANO_MAT
		SetSessionDropDownValue(AlumnosListaClase.ANO_MAT.DropDownValue, AlumnosListaClase.ANO_MAT)

		' Field PERIODO_MAT
		SetSessionDropDownValue(AlumnosListaClase.PERIODO_MAT.DropDownValue, AlumnosListaClase.PERIODO_MAT)

		' Field CODSECC_I
		SetSessionDropDownValue(AlumnosListaClase.CODSECC_I.DropDownValue, AlumnosListaClase.CODSECC_I)

		' Field RAMOEQUIV_I
		SetSessionDropDownValue(AlumnosListaClase.RAMOEQUIV_I.DropDownValue, AlumnosListaClase.RAMOEQUIV_I)

		' Field Nombre_Ramo
		SetSessionDropDownValue(AlumnosListaClase.Nombre_Ramo.DropDownValue, AlumnosListaClase.Nombre_Ramo)

		' Field NOMBRE_C
		SetSessionDropDownValue(AlumnosListaClase.NOMBRE_C.DropDownValue, AlumnosListaClase.NOMBRE_C)

		' Field JORNADA
		SetSessionDropDownValue(AlumnosListaClase.JORNADA.DropDownValue, AlumnosListaClase.JORNADA)

		' Field ESTADO
		SetSessionDropDownValue(AlumnosListaClase.ESTADO.DropDownValue, AlumnosListaClase.ESTADO)

		' Field ANO_IN
		SetSessionDropDownValue(AlumnosListaClase.ANO_IN.DropDownValue, AlumnosListaClase.ANO_IN)

		' Field INSCRITO
		SetSessionDropDownValue(AlumnosListaClase.INSCRITO.DropDownValue, AlumnosListaClase.INSCRITO)

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
		If ew_Session("sv_AlumnosListaClase_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_AlumnosListaClase_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_AlumnosListaClase_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_AlumnosListaClase_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_AlumnosListaClase_" + parm)
		End If
		If ew_Session("so1_AlumnosListaClase_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_AlumnosListaClase_" + parm))
		End If
		If ew_Session("sc_AlumnosListaClase_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_AlumnosListaClase_" + parm))
		End If
		If ew_Session("sv2_AlumnosListaClase_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_AlumnosListaClase_" + parm)
		End If
		If ew_Session("so2_AlumnosListaClase_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_AlumnosListaClase_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_AlumnosListaClase_" + parm) = fld.SearchValue
		ew_Session("so1_AlumnosListaClase_" + parm) = fld.SearchOperator
		ew_Session("sc_AlumnosListaClase_" + parm) = fld.SearchCondition
		ew_Session("sv2_AlumnosListaClase_" + parm) = fld.SearchValue2
		ew_Session("so2_AlumnosListaClase_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_AlumnosListaClase_" + parm) = ""
		ew_Session("so1_AlumnosListaClase_" + parm) = "="
		ew_Session("sc_AlumnosListaClase_" + parm) = "AND"
		ew_Session("sv2_AlumnosListaClase_" + parm) = ""
		ew_Session("so2_AlumnosListaClase_" + parm) = "="
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
		ew_Session("sel_AlumnosListaClase_" & parm) = ""
		ew_Session("rf_AlumnosListaClase_" & parm) = ""
		ew_Session("rt_AlumnosListaClase_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = AlumnosListaClase.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_AlumnosListaClase_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_AlumnosListaClase_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_AlumnosListaClase_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field ANO_MAT

			AlumnosListaClase.ANO_MAT.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.ANO_MAT.DropDownValue = AlumnosListaClase.ANO_MAT.DefaultDropDownValue

			' Field PERIODO_MAT
			AlumnosListaClase.PERIODO_MAT.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.PERIODO_MAT.DropDownValue = AlumnosListaClase.PERIODO_MAT.DefaultDropDownValue

			' Field CODSECC_I
			AlumnosListaClase.CODSECC_I.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.CODSECC_I.DropDownValue = AlumnosListaClase.CODSECC_I.DefaultDropDownValue

			' Field RAMOEQUIV_I
			AlumnosListaClase.RAMOEQUIV_I.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.RAMOEQUIV_I.DropDownValue = AlumnosListaClase.RAMOEQUIV_I.DefaultDropDownValue

			' Field Nombre_Ramo
			AlumnosListaClase.Nombre_Ramo.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.Nombre_Ramo.DropDownValue = AlumnosListaClase.Nombre_Ramo.DefaultDropDownValue

			' Field NOMBRE_C
			AlumnosListaClase.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.NOMBRE_C.DropDownValue = AlumnosListaClase.NOMBRE_C.DefaultDropDownValue

			' Field JORNADA
			AlumnosListaClase.JORNADA.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.JORNADA.DropDownValue = AlumnosListaClase.JORNADA.DefaultDropDownValue

			' Field ESTADO
			AlumnosListaClase.ESTADO.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.ESTADO.DropDownValue = AlumnosListaClase.ESTADO.DefaultDropDownValue

			' Field ANO_IN
			AlumnosListaClase.ANO_IN.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.ANO_IN.DropDownValue = AlumnosListaClase.ANO_IN.DefaultDropDownValue

			' Field INSCRITO
			AlumnosListaClase.INSCRITO.DefaultDropDownValue = EWRPT_INIT_VALUE
			AlumnosListaClase.INSCRITO.DropDownValue = AlumnosListaClase.INSCRITO.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(AlumnosListaClase.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AlumnosListaClase.RUT)	

			' Field NOMBRE
			SetDefaultExtFilter(AlumnosListaClase.NOMBRE, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AlumnosListaClase.NOMBRE)	

			' Field PATERNO
			SetDefaultExtFilter(AlumnosListaClase.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AlumnosListaClase.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(AlumnosListaClase.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(AlumnosListaClase.MATERNO)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT extended filter
		If (TextFilterApplied(AlumnosListaClase.RUT)) Then bFilterExist = True

		' Check NOMBRE extended filter
		If (TextFilterApplied(AlumnosListaClase.NOMBRE)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(AlumnosListaClase.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(AlumnosListaClase.MATERNO)) Then bFilterExist = True

		' Check ANO_MAT dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.ANO_MAT)) Then bFilterExist = True

		' Check PERIODO_MAT dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.PERIODO_MAT)) Then bFilterExist = True

		' Check CODSECC_I dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.CODSECC_I)) Then bFilterExist = True

		' Check RAMOEQUIV_I dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.RAMOEQUIV_I)) Then bFilterExist = True

		' Check Nombre_Ramo dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.Nombre_Ramo)) Then bFilterExist = True

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.NOMBRE_C)) Then bFilterExist = True

		' Check JORNADA dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.JORNADA)) Then bFilterExist = True

		' Check ESTADO dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.ESTADO)) Then bFilterExist = True

		' Check ANO_IN dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.ANO_IN)) Then bFilterExist = True

		' Check INSCRITO dropdown filter
		If (NonTextFilterApplied(AlumnosListaClase.INSCRITO)) Then bFilterExist = True
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
		BuildExtendedFilter(AlumnosListaClase.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AlumnosListaClase.NOMBRE, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.NOMBRE.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AlumnosListaClase.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(AlumnosListaClase.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO_MAT
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.ANO_MAT, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.ANO_MAT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO_MAT
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.PERIODO_MAT, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.PERIODO_MAT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODSECC_I
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.CODSECC_I, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.CODSECC_I.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RAMOEQUIV_I
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.RAMOEQUIV_I, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.RAMOEQUIV_I.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field Nombre_Ramo
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.Nombre_Ramo, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.Nombre_Ramo.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field JORNADA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.JORNADA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.JORNADA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTADO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.ESTADO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.ESTADO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO_IN
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.ANO_IN, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.ANO_IN.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field INSCRITO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(AlumnosListaClase.INSCRITO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= AlumnosListaClase.INSCRITO.FldCaption() & "<br>"
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
				AlumnosListaClase.OrderBy = ""
				AlumnosListaClase.StartGroup = 1
				AlumnosListaClase.RUT.Sort = ""
				AlumnosListaClase.NOMBRE.Sort = ""
				AlumnosListaClase.PATERNO.Sort = ""
				AlumnosListaClase.MATERNO.Sort = ""
				AlumnosListaClase.ANO_MAT.Sort = ""
				AlumnosListaClase.PERIODO_MAT.Sort = ""
				AlumnosListaClase.CODSECC_I.Sort = ""
				AlumnosListaClase.RAMOEQUIV_I.Sort = ""
				AlumnosListaClase.Nombre_Ramo.Sort = ""
				AlumnosListaClase.NOMBRE_C.Sort = ""
				AlumnosListaClase.JORNADA.Sort = ""
				AlumnosListaClase.ESTADO.Sort = ""
				AlumnosListaClase.ANO_IN.Sort = ""
				AlumnosListaClase.INSCRITO.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			AlumnosListaClase.CurrentOrder = ew_Get("order")
			AlumnosListaClase.CurrentOrderType = ew_Get("ordertype")
			sSortSql = AlumnosListaClase.SortSql()
			AlumnosListaClase.OrderBy = sSortSql
			AlumnosListaClase.StartGroup = 1
		End If
		Return AlumnosListaClase.OrderBy
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
		AlumnosListaClase_summary = New crAlumnosListaClase_summary(Me)
		AlumnosListaClase_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		AlumnosListaClase_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (AlumnosListaClase_summary IsNot Nothing) Then AlumnosListaClase_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (AlumnosListaClase.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var AlumnosListaClase_summary = new ewrpt_Page("AlumnosListaClase_summary");
// page properties
AlumnosListaClase_summary.PageID = "summary"; // page ID
AlumnosListaClase_summary.FormID = "fAlumnosListaClasesummaryfilter"; // form ID
var EWRPT_PAGE_ID = AlumnosListaClase_summary.PageID;
// extend page with ValidateForm function
AlumnosListaClase_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
AlumnosListaClase_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
AlumnosListaClase_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
AlumnosListaClase_summary.ValidateRequired = false; // no JavaScript validation
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
<% AlumnosListaClase_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (AlumnosListaClase.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (AlumnosListaClase.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="underline"><h1>Alumnos por Sección<h1></div>
  <% If (AlumnosListaClase.Export = "") Then %>
  </p>
  <p>&nbsp;&nbsp;<a href="<%= AlumnosListaClase_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
    <% If (AlumnosListaClase_summary.FilterApplied) Then %>
    &nbsp;&nbsp;<a href="alusesmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
    <% End If %>
    <% End If %>
  </p>
<br><br>
<% AlumnosListaClase_summary.ShowMessage() %>
<% If (AlumnosListaClase.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (AlumnosListaClase.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If (AlumnosListaClase.Export = "") Then %>
<%
Dim sButtonImage As String, sDivDisplay As String
If (AlumnosListaClase.FilterPanelOption = 2 OrElse (AlumnosListaClase.FilterPanelOption = 3 AndAlso AlumnosListaClase_summary.FilterApplied) OrElse AlumnosListaClase_summary.Filter = "0=101") Then
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
<form name="fAlumnosListaClasesummaryfilter" id="fAlumnosListaClasesummaryfilter" action="alusesmry.aspx" class="ewForm" onsubmit="return AlumnosListaClase_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = AlumnosListaClase.MATERNO.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.RUT.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="30" value="<%= ew_HtmlEncode(AlumnosListaClase.RUT.SearchValue) %>"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.NOMBRE.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_NOMBRE" id="sv1_NOMBRE" size="30" maxlength="32" value="<%= ew_HtmlEncode(AlumnosListaClase.NOMBRE.SearchValue) %>"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_NOMBRE", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.PATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(AlumnosListaClase.PATERNO.SearchValue) %>"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(AlumnosListaClase.MATERNO.SearchValue) %>"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.ANO_MAT.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO_MAT" id="sv_ANO_MAT"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_ANO_MAT", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.ANO_MAT.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosListaClase.ANO_MAT.CustomFilters.Count + AlumnosListaClase.ANO_MAT.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.ANO_MAT.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO_MAT")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.ANO_MAT.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.ANO_MAT.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.ANO_MAT.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.PERIODO_MAT.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = AlumnosListaClase.PERIODO_MAT.CustomFilters.Count + AlumnosListaClase.PERIODO_MAT.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.PERIODO_MAT.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "PERIODO_MAT")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="AlumnosListaClase.PERIODO_MAT.DropDownValue" id="AlumnosListaClase.PERIODO_MAT.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.PERIODO_MAT.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.PERIODO_MAT.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_PERIODO_MAT" id="sv_PERIODO_MAT" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.PERIODO_MAT.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.CODSECC_I.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = AlumnosListaClase.CODSECC_I.CustomFilters.Count + AlumnosListaClase.CODSECC_I.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.CODSECC_I.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CODSECC_I")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="AlumnosListaClase.CODSECC_I.DropDownValue" id="AlumnosListaClase.CODSECC_I.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.CODSECC_I.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.CODSECC_I.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_CODSECC_I" id="sv_CODSECC_I" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.CODSECC_I.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.RAMOEQUIV_I.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_RAMOEQUIV_I" id="sv_RAMOEQUIV_I"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_RAMOEQUIV_I", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.RAMOEQUIV_I.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosListaClase.RAMOEQUIV_I.CustomFilters.Count + AlumnosListaClase.RAMOEQUIV_I.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.RAMOEQUIV_I.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "RAMOEQUIV_I")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.RAMOEQUIV_I.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.RAMOEQUIV_I.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.RAMOEQUIV_I.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.Nombre_Ramo.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_Nombre_Ramo" id="sv_Nombre_Ramo"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_Nombre_Ramo", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.Nombre_Ramo.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosListaClase.Nombre_Ramo.CustomFilters.Count + AlumnosListaClase.Nombre_Ramo.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.Nombre_Ramo.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "Nombre_Ramo")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.Nombre_Ramo.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.Nombre_Ramo.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.Nombre_Ramo.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosListaClase.NOMBRE_C.CustomFilters.Count + AlumnosListaClase.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.JORNADA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_JORNADA" id="sv_JORNADA"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_JORNADA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.JORNADA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosListaClase.JORNADA.CustomFilters.Count + AlumnosListaClase.JORNADA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.JORNADA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "JORNADA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.JORNADA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.JORNADA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.JORNADA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.ESTADO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ESTADO" id="sv_ESTADO"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_ESTADO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.ESTADO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosListaClase.ESTADO.CustomFilters.Count + AlumnosListaClase.ESTADO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.ESTADO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTADO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.ESTADO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.ESTADO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.ESTADO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.ANO_IN.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO_IN" id="sv_ANO_IN"<%= IIf(AlumnosListaClase_summary.ClearExtFilter = "AlumnosListaClase_ANO_IN", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.ANO_IN.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = AlumnosListaClase.ANO_IN.CustomFilters.Count + AlumnosListaClase.ANO_IN.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.ANO_IN.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ANO_IN")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.ANO_IN.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.ANO_IN.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.ANO_IN.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= AlumnosListaClase.INSCRITO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = AlumnosListaClase.INSCRITO.CustomFilters.Count + AlumnosListaClase.INSCRITO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In AlumnosListaClase.INSCRITO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "INSCRITO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="AlumnosListaClase.INSCRITO.DropDownValue" id="AlumnosListaClase.INSCRITO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.INSCRITO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In AlumnosListaClase.INSCRITO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_INSCRITO" id="sv_INSCRITO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(AlumnosListaClase.INSCRITO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (AlumnosListaClase.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% AlumnosListaClase_summary.ShowFilterList() %>
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
If (AlumnosListaClase.ExportAll AndAlso ew_NotEmpty(AlumnosListaClase.Export)) Then
	AlumnosListaClase_summary.StopGrp = AlumnosListaClase_summary.TotalGrps
Else
	AlumnosListaClase_summary.StopGrp = AlumnosListaClase_summary.StartGrp + AlumnosListaClase_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (AlumnosListaClase_summary.StopGrp > AlumnosListaClase_summary.TotalGrps) Then
	AlumnosListaClase_summary.StopGrp = AlumnosListaClase_summary.TotalGrps
End If
AlumnosListaClase_summary.RecCount = 0

' Get first row
If (AlumnosListaClase_summary.TotalGrps > 0) Then
	AlumnosListaClase_summary.GetRow() ' ASPXRPT
	AlumnosListaClase_summary.GrpCount = 1
End If
While ((AlumnosListaClase_summary.HasRow AndAlso AlumnosListaClase_summary.GrpIndex < AlumnosListaClase_summary.StopGrp) OrElse AlumnosListaClase_summary.ShowFirstHeader)

	' Show header
	If (AlumnosListaClase_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.RUT) %>',0);"><%= AlumnosListaClase.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.NOMBRE) %>',0);"><%= AlumnosListaClase.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.PATERNO) %>',0);"><%= AlumnosListaClase.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.MATERNO) %>',0);"><%= AlumnosListaClase.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.ANO_MAT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.ANO_MAT))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.ANO_MAT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.ANO_MAT) %>',0);"><%= AlumnosListaClase.ANO_MAT.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.ANO_MAT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.ANO_MAT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.PERIODO_MAT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.PERIODO_MAT))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.PERIODO_MAT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.PERIODO_MAT) %>',0);"><%= AlumnosListaClase.PERIODO_MAT.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.PERIODO_MAT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.PERIODO_MAT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.CODSECC_I.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.CODSECC_I))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.CODSECC_I.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.CODSECC_I) %>',0);"><%= AlumnosListaClase.CODSECC_I.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.CODSECC_I.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.CODSECC_I.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.RAMOEQUIV_I.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.RAMOEQUIV_I))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.RAMOEQUIV_I.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.RAMOEQUIV_I) %>',0);"><%= AlumnosListaClase.RAMOEQUIV_I.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.RAMOEQUIV_I.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.RAMOEQUIV_I.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.Nombre_Ramo.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.Nombre_Ramo))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.Nombre_Ramo.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.Nombre_Ramo) %>',0);"><%= AlumnosListaClase.Nombre_Ramo.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.Nombre_Ramo.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.Nombre_Ramo.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.NOMBRE_C) %>',0);"><%= AlumnosListaClase.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.JORNADA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.JORNADA))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.JORNADA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.JORNADA) %>',0);"><%= AlumnosListaClase.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.JORNADA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.JORNADA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.ESTADO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.ESTADO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.ESTADO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.ESTADO) %>',0);"><%= AlumnosListaClase.ESTADO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.ESTADO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.ESTADO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.ANO_IN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.ANO_IN))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.ANO_IN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.ANO_IN) %>',0);"><%= AlumnosListaClase.ANO_IN.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.ANO_IN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.ANO_IN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(AlumnosListaClase.Export)) Then %>
<%= AlumnosListaClase.INSCRITO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(AlumnosListaClase.SortUrl(AlumnosListaClase.INSCRITO))) Then %>
		<td style="vertical-align: bottom;"><%= AlumnosListaClase.INSCRITO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= AlumnosListaClase.SortUrl(AlumnosListaClase.INSCRITO) %>',0);"><%= AlumnosListaClase.INSCRITO.FldCaption() %></td><td style="width: 10px;">
		<% If (AlumnosListaClase.INSCRITO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (AlumnosListaClase.INSCRITO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		AlumnosListaClase_summary.ShowFirstHeader = False
	End If
	AlumnosListaClase_summary.RecCount += 1

		' Render detail row
		AlumnosListaClase.ResetCSS()
		AlumnosListaClase.RowType = EWRPT_ROWTYPE_DETAIL
		AlumnosListaClase_summary.RenderRow()
%>
	<tr<%= AlumnosListaClase.RowAttributes() %>>
		<td<%= AlumnosListaClase.RUT.CellAttributes %>>
<div<%= AlumnosListaClase.RUT.ViewAttributes%>><%= AlumnosListaClase.RUT.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.NOMBRE.CellAttributes %>>
<div<%= AlumnosListaClase.NOMBRE.ViewAttributes%>><%= AlumnosListaClase.NOMBRE.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.PATERNO.CellAttributes %>>
<div<%= AlumnosListaClase.PATERNO.ViewAttributes%>><%= AlumnosListaClase.PATERNO.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.MATERNO.CellAttributes %>>
<div<%= AlumnosListaClase.MATERNO.ViewAttributes%>><%= AlumnosListaClase.MATERNO.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.ANO_MAT.CellAttributes %>>
<div<%= AlumnosListaClase.ANO_MAT.ViewAttributes%>><%= AlumnosListaClase.ANO_MAT.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.PERIODO_MAT.CellAttributes %>>
<div<%= AlumnosListaClase.PERIODO_MAT.ViewAttributes%>><%= AlumnosListaClase.PERIODO_MAT.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.CODSECC_I.CellAttributes %>>
<div<%= AlumnosListaClase.CODSECC_I.ViewAttributes%>><%= AlumnosListaClase.CODSECC_I.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.RAMOEQUIV_I.CellAttributes %>>
<div<%= AlumnosListaClase.RAMOEQUIV_I.ViewAttributes%>><%= AlumnosListaClase.RAMOEQUIV_I.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.Nombre_Ramo.CellAttributes %>>
<div<%= AlumnosListaClase.Nombre_Ramo.ViewAttributes%>><%= AlumnosListaClase.Nombre_Ramo.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.NOMBRE_C.CellAttributes %>>
<div<%= AlumnosListaClase.NOMBRE_C.ViewAttributes%>><%= AlumnosListaClase.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.JORNADA.CellAttributes %>>
<div<%= AlumnosListaClase.JORNADA.ViewAttributes%>><%= AlumnosListaClase.JORNADA.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.ESTADO.CellAttributes %>>
<div<%= AlumnosListaClase.ESTADO.ViewAttributes%>><%= AlumnosListaClase.ESTADO.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.ANO_IN.CellAttributes %>>
<div<%= AlumnosListaClase.ANO_IN.ViewAttributes%>><%= AlumnosListaClase.ANO_IN.ListViewValue%></div>
</td>
		<td<%= AlumnosListaClase.INSCRITO.CellAttributes %>>
<div<%= AlumnosListaClase.INSCRITO.ViewAttributes%>><%= AlumnosListaClase.INSCRITO.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		AlumnosListaClase_summary.AccumulateSummary()

		' Get next record
		AlumnosListaClase_summary.GetRow() ' ASPXRPT
		AlumnosListaClase_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (AlumnosListaClase_summary.TotalGrps > 0) Then
	AlumnosListaClase.ResetCSS()
	AlumnosListaClase.RowType = EWRPT_ROWTYPE_TOTAL
	AlumnosListaClase.RowTotalType = EWRPT_ROWTOTAL_GRAND
	AlumnosListaClase.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	AlumnosListaClase.RowAttrs("class") = "ewRptGrandSummary"
	AlumnosListaClase_summary.RenderRow()
%>
	<!-- tr><td colspan="14"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= AlumnosListaClase.RowAttributes() %>><td colspan="14"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(AlumnosListaClase_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (AlumnosListaClase.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If AlumnosListaClase_summary.Pager Is Nothing Then AlumnosListaClase_summary.Pager = New cPrevNextPager(AlumnosListaClase_summary.StartGrp, AlumnosListaClase_summary.DisplayGrps, AlumnosListaClase_summary.TotalGrps) %>
<% If AlumnosListaClase_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If AlumnosListaClase_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="alusesmry.aspx?start=<%= AlumnosListaClase_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If AlumnosListaClase_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="alusesmry.aspx?start=<%= AlumnosListaClase_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= AlumnosListaClase_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If AlumnosListaClase_summary.Pager.NextButton.Enabled Then %>
	<td><a href="alusesmry.aspx?start=<%= AlumnosListaClase_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If AlumnosListaClase_summary.Pager.LastButton.Enabled Then %>
	<td><a href="alusesmry.aspx?start=<%= AlumnosListaClase_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= AlumnosListaClase_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= AlumnosListaClase_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= AlumnosListaClase_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= AlumnosListaClase_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If AlumnosListaClase_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (AlumnosListaClase_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If AlumnosListaClase_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If AlumnosListaClase_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="ALL"<% If (AlumnosListaClase.GroupPerPage = -1) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("AllRecords") %></option>
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
<% If (AlumnosListaClase.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (AlumnosListaClase.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (AlumnosListaClase.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% AlumnosListaClase_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (AlumnosListaClase.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
