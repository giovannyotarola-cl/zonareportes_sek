<%@ Page ClassName="DAE_Estado_Alumnossmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_DAE_Alumnos" %>
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
	Public DAE_Estado_Alumnos As crDAE_Estado_Alumnos = Nothing

	'
	' Table class (for DAE Estado Alumnos)
	'
	Public Class crDAE_Estado_Alumnos
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
				Return "DAE_Estado_Alumnos"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "DAE Estado Alumnos"
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

		Public CODCLI As crField

		Public RUT As crField

		Public NOMBRE As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public NOMBRE_C As crField

		Public ESTACAD As crField

		Public NivelEstudios As crField

		Public PorcentajeAprob As crField

		Public ano_ingreso As crField

		Public REGIMEN As crField

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
			CODCLI = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCLI.Page = APage
			CODCLI.ParentPage = APage.ParentPage
			Fields.Add("CODCLI", CODCLI)
			CODCLI.DateFilter = ""
			CODCLI.SqlSelect = ""
			CODCLI.SqlOrderBy = ""

			' RUT
			RUT = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' NOMBRE_C
			NOMBRE_C = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_C.Page = APage
			NOMBRE_C.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_C", NOMBRE_C)
			NOMBRE_C.DateFilter = ""
			NOMBRE_C.SqlSelect = ""
			NOMBRE_C.SqlOrderBy = ""

			' ESTACAD
			ESTACAD = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			ESTACAD.Page = APage
			ESTACAD.ParentPage = APage.ParentPage
			Fields.Add("ESTACAD", ESTACAD)
			ESTACAD.DateFilter = ""
			ESTACAD.SqlSelect = ""
			ESTACAD.SqlOrderBy = ""

			' NivelEstudios
			NivelEstudios = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_NivelEstudios", "NivelEstudios", "[NivelEstudios]", 3, EWRPT_DATATYPE_NUMBER, -1)
			NivelEstudios.Page = APage
			NivelEstudios.ParentPage = APage.ParentPage
			NivelEstudios.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger")
			Fields.Add("NivelEstudios", NivelEstudios)
			NivelEstudios.DateFilter = ""
			NivelEstudios.SqlSelect = ""
			NivelEstudios.SqlOrderBy = ""

			' PorcentajeAprob
			PorcentajeAprob = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_PorcentajeAprob", "PorcentajeAprob", "[PorcentajeAprob]", 131, EWRPT_DATATYPE_NUMBER, -1)
			PorcentajeAprob.Page = APage
			PorcentajeAprob.ParentPage = APage.ParentPage
			PorcentajeAprob.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("PorcentajeAprob", PorcentajeAprob)
			PorcentajeAprob.DateFilter = ""
			PorcentajeAprob.SqlSelect = ""
			PorcentajeAprob.SqlOrderBy = ""

			' ano_ingreso
			ano_ingreso = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_ano_ingreso", "ano_ingreso", "[ano_ingreso]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ano_ingreso.Page = APage
			ano_ingreso.ParentPage = APage.ParentPage
			ano_ingreso.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ano_ingreso", ano_ingreso)
			ano_ingreso.DateFilter = ""
			ano_ingreso.SqlSelect = ""
			ano_ingreso.SqlOrderBy = ""

			' REGIMEN
			REGIMEN = new crField("DAE_Estado_Alumnos", "DAE Estado Alumnos", "x_REGIMEN", "REGIMEN", "[REGIMEN]", 200, EWRPT_DATATYPE_STRING, -1)
			REGIMEN.Page = APage
			REGIMEN.ParentPage = APage.ParentPage
			Fields.Add("REGIMEN", REGIMEN)
			REGIMEN.DateFilter = ""
			REGIMEN.SqlSelect = ""
			REGIMEN.SqlOrderBy = ""
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
				Return "[SEK_V_DAE_Alumnos]"
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
	Public DAE_Estado_Alumnos_summary As crDAE_Estado_Alumnos_summary

	'
	' Page class
	'
	Public Class crDAE_Estado_Alumnos_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (DAE_Estado_Alumnos.UseTokenInUrl) Then
				sUrl &= "t=" & DAE_Estado_Alumnos.TableVar & "&" ' Add page token
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
			If (DAE_Estado_Alumnos.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(DAE_Estado_Alumnos.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(DAE_Estado_Alumnos.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As DAE_Estado_Alumnossmry 
			Get
				Return CType(m_ParentPage, DAE_Estado_Alumnossmry)
			End Get
		End Property

		' Table object (DAE_Estado_Alumnos)
		Public Property DAE_Estado_Alumnos As crDAE_Estado_Alumnos 
			Get		
				Return AspNetPage.DAE_Estado_Alumnos ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crDAE_Estado_Alumnos)
				AspNetPage.DAE_Estado_Alumnos = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_DAE_Alumnos)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "DAE_Estado_Alumnos_summary"
			m_PageObjTypeName = "crDAE_Estado_Alumnos_summary"

			' Table name
			m_TableName = "DAE Estado Alumnos"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (DAE_Estado_Alumnos)
			DAE_Estado_Alumnos = New crDAE_Estado_Alumnos(Me)			

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
				DAE_Estado_Alumnos.Export = ew_Get("export")
			End If
			gsExport = DAE_Estado_Alumnos.Export ' Get export parameter, used in header
			gsExportFile = DAE_Estado_Alumnos.TableVar ' Get export file, used in header
			If (DAE_Estado_Alumnos.Export = "excel") Then
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

		Public Val As Object() = New Object(11) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(11) {}

		Public GrandMn As Object() = New Object(11) {}

		Public GrandMx As Object() = New Object(11) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 12 ' No. of fields
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
			DAE_Estado_Alumnos.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(DAE_Estado_Alumnos.SqlSelect, DAE_Estado_Alumnos.SqlWhere, DAE_Estado_Alumnos.SqlGroupBy, DAE_Estado_Alumnos.SqlHaving, DAE_Estado_Alumnos.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (DAE_Estado_Alumnos.ExportAll AndAlso ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then
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
				DAE_Estado_Alumnos.CODCLI.DbValue = Row("CODCLI")
				DAE_Estado_Alumnos.RUT.DbValue = Row("RUT")
				DAE_Estado_Alumnos.NOMBRE.DbValue = Row("NOMBRE")
				DAE_Estado_Alumnos.PATERNO.DbValue = Row("PATERNO")
				DAE_Estado_Alumnos.MATERNO.DbValue = Row("MATERNO")
				DAE_Estado_Alumnos.NOMBRE_C.DbValue = Row("NOMBRE_C")
				DAE_Estado_Alumnos.ESTACAD.DbValue = Row("ESTACAD")
				DAE_Estado_Alumnos.NivelEstudios.DbValue = Row("NivelEstudios")
				DAE_Estado_Alumnos.PorcentajeAprob.DbValue = Row("PorcentajeAprob")
				DAE_Estado_Alumnos.ano_ingreso.DbValue = Row("ano_ingreso")
				DAE_Estado_Alumnos.REGIMEN.DbValue = Row("REGIMEN")
				Val(1) = DAE_Estado_Alumnos.CODCLI.CurrentValue
				Val(2) = DAE_Estado_Alumnos.RUT.CurrentValue
				Val(3) = DAE_Estado_Alumnos.NOMBRE.CurrentValue
				Val(4) = DAE_Estado_Alumnos.PATERNO.CurrentValue
				Val(5) = DAE_Estado_Alumnos.MATERNO.CurrentValue
				Val(6) = DAE_Estado_Alumnos.NOMBRE_C.CurrentValue
				Val(7) = DAE_Estado_Alumnos.ESTACAD.CurrentValue
				Val(8) = DAE_Estado_Alumnos.NivelEstudios.CurrentValue
				Val(9) = DAE_Estado_Alumnos.PorcentajeAprob.CurrentValue
				Val(10) = DAE_Estado_Alumnos.ano_ingreso.CurrentValue
				Val(11) = DAE_Estado_Alumnos.REGIMEN.CurrentValue
			Else
				DAE_Estado_Alumnos.CODCLI.DbValue = ""
				DAE_Estado_Alumnos.RUT.DbValue = ""
				DAE_Estado_Alumnos.NOMBRE.DbValue = ""
				DAE_Estado_Alumnos.PATERNO.DbValue = ""
				DAE_Estado_Alumnos.MATERNO.DbValue = ""
				DAE_Estado_Alumnos.NOMBRE_C.DbValue = ""
				DAE_Estado_Alumnos.ESTACAD.DbValue = ""
				DAE_Estado_Alumnos.NivelEstudios.DbValue = ""
				DAE_Estado_Alumnos.PorcentajeAprob.DbValue = ""
				DAE_Estado_Alumnos.ano_ingreso.DbValue = ""
				DAE_Estado_Alumnos.REGIMEN.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				DAE_Estado_Alumnos.CODCLI.DbValue = dr("CODCLI")
				DAE_Estado_Alumnos.RUT.DbValue = dr("RUT")
				DAE_Estado_Alumnos.NOMBRE.DbValue = dr("NOMBRE")
				DAE_Estado_Alumnos.PATERNO.DbValue = dr("PATERNO")
				DAE_Estado_Alumnos.MATERNO.DbValue = dr("MATERNO")
				DAE_Estado_Alumnos.NOMBRE_C.DbValue = dr("NOMBRE_C")
				DAE_Estado_Alumnos.ESTACAD.DbValue = dr("ESTACAD")
				DAE_Estado_Alumnos.NivelEstudios.DbValue = dr("NivelEstudios")
				DAE_Estado_Alumnos.PorcentajeAprob.DbValue = dr("PorcentajeAprob")
				DAE_Estado_Alumnos.ano_ingreso.DbValue = dr("ano_ingreso")
				DAE_Estado_Alumnos.REGIMEN.DbValue = dr("REGIMEN")
				Val(1) = DAE_Estado_Alumnos.CODCLI.CurrentValue
				Val(2) = DAE_Estado_Alumnos.RUT.CurrentValue
				Val(3) = DAE_Estado_Alumnos.NOMBRE.CurrentValue
				Val(4) = DAE_Estado_Alumnos.PATERNO.CurrentValue
				Val(5) = DAE_Estado_Alumnos.MATERNO.CurrentValue
				Val(6) = DAE_Estado_Alumnos.NOMBRE_C.CurrentValue
				Val(7) = DAE_Estado_Alumnos.ESTACAD.CurrentValue
				Val(8) = DAE_Estado_Alumnos.NivelEstudios.CurrentValue
				Val(9) = DAE_Estado_Alumnos.PorcentajeAprob.CurrentValue
				Val(10) = DAE_Estado_Alumnos.ano_ingreso.CurrentValue
				Val(11) = DAE_Estado_Alumnos.REGIMEN.CurrentValue
			Else				
				DAE_Estado_Alumnos.CODCLI.DbValue = ""
				DAE_Estado_Alumnos.RUT.DbValue = ""
				DAE_Estado_Alumnos.NOMBRE.DbValue = ""
				DAE_Estado_Alumnos.PATERNO.DbValue = ""
				DAE_Estado_Alumnos.MATERNO.DbValue = ""
				DAE_Estado_Alumnos.NOMBRE_C.DbValue = ""
				DAE_Estado_Alumnos.ESTACAD.DbValue = ""
				DAE_Estado_Alumnos.NivelEstudios.DbValue = ""
				DAE_Estado_Alumnos.PorcentajeAprob.DbValue = ""
				DAE_Estado_Alumnos.ano_ingreso.DbValue = ""
				DAE_Estado_Alumnos.REGIMEN.DbValue = ""
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
				DAE_Estado_Alumnos.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					DAE_Estado_Alumnos.StartGroup = StartGrp
				Else
					StartGrp = DAE_Estado_Alumnos.StartGroup
				End If
			Else
				StartGrp = DAE_Estado_Alumnos.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				DAE_Estado_Alumnos.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				DAE_Estado_Alumnos.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				DAE_Estado_Alumnos.StartGroup = StartGrp
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
			DAE_Estado_Alumnos.StartGroup = StartGrp
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
				DAE_Estado_Alumnos.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				DAE_Estado_Alumnos.StartGroup = StartGrp
			Else				
				If (DAE_Estado_Alumnos.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(DAE_Estado_Alumnos.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (DAE_Estado_Alumnos.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(DAE_Estado_Alumnos.SqlSelectCount, DAE_Estado_Alumnos.SqlWhere, DAE_Estado_Alumnos.SqlGroupBy, DAE_Estado_Alumnos.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			DAE_Estado_Alumnos.Row_Rendering()

			'
			' Render view codes
			'

			If (DAE_Estado_Alumnos.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' CODCLI
				DAE_Estado_Alumnos.CODCLI.ViewValue = Convert.ToString(DAE_Estado_Alumnos.CODCLI.Summary)

				' RUT
				DAE_Estado_Alumnos.RUT.ViewValue = Convert.ToString(DAE_Estado_Alumnos.RUT.Summary)

				' NOMBRE
				DAE_Estado_Alumnos.NOMBRE.ViewValue = Convert.ToString(DAE_Estado_Alumnos.NOMBRE.Summary)

				' PATERNO
				DAE_Estado_Alumnos.PATERNO.ViewValue = Convert.ToString(DAE_Estado_Alumnos.PATERNO.Summary)

				' MATERNO
				DAE_Estado_Alumnos.MATERNO.ViewValue = Convert.ToString(DAE_Estado_Alumnos.MATERNO.Summary)

				' NOMBRE_C
				DAE_Estado_Alumnos.NOMBRE_C.ViewValue = Convert.ToString(DAE_Estado_Alumnos.NOMBRE_C.Summary)

				' ESTACAD
				DAE_Estado_Alumnos.ESTACAD.ViewValue = Convert.ToString(DAE_Estado_Alumnos.ESTACAD.Summary)

				' NivelEstudios
				DAE_Estado_Alumnos.NivelEstudios.ViewValue = Convert.ToString(DAE_Estado_Alumnos.NivelEstudios.Summary)

				' PorcentajeAprob
				DAE_Estado_Alumnos.PorcentajeAprob.ViewValue = Convert.ToString(DAE_Estado_Alumnos.PorcentajeAprob.Summary)

				' ano_ingreso
				DAE_Estado_Alumnos.ano_ingreso.ViewValue = Convert.ToString(DAE_Estado_Alumnos.ano_ingreso.Summary)

				' REGIMEN
				DAE_Estado_Alumnos.REGIMEN.ViewValue = Convert.ToString(DAE_Estado_Alumnos.REGIMEN.Summary)
			Else

				' CODCLI
				DAE_Estado_Alumnos.CODCLI.ViewValue = Convert.ToString(DAE_Estado_Alumnos.CODCLI.CurrentValue)
				DAE_Estado_Alumnos.CODCLI.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				DAE_Estado_Alumnos.RUT.ViewValue = Convert.ToString(DAE_Estado_Alumnos.RUT.CurrentValue)
				DAE_Estado_Alumnos.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				DAE_Estado_Alumnos.NOMBRE.ViewValue = Convert.ToString(DAE_Estado_Alumnos.NOMBRE.CurrentValue)
				DAE_Estado_Alumnos.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				DAE_Estado_Alumnos.PATERNO.ViewValue = Convert.ToString(DAE_Estado_Alumnos.PATERNO.CurrentValue)
				DAE_Estado_Alumnos.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				DAE_Estado_Alumnos.MATERNO.ViewValue = Convert.ToString(DAE_Estado_Alumnos.MATERNO.CurrentValue)
				DAE_Estado_Alumnos.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_C
				DAE_Estado_Alumnos.NOMBRE_C.ViewValue = Convert.ToString(DAE_Estado_Alumnos.NOMBRE_C.CurrentValue)
				DAE_Estado_Alumnos.NOMBRE_C.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ESTACAD
				DAE_Estado_Alumnos.ESTACAD.ViewValue = Convert.ToString(DAE_Estado_Alumnos.ESTACAD.CurrentValue)
				DAE_Estado_Alumnos.ESTACAD.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NivelEstudios
				DAE_Estado_Alumnos.NivelEstudios.ViewValue = Convert.ToString(DAE_Estado_Alumnos.NivelEstudios.CurrentValue)
				DAE_Estado_Alumnos.NivelEstudios.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PorcentajeAprob
				DAE_Estado_Alumnos.PorcentajeAprob.ViewValue = Convert.ToString(DAE_Estado_Alumnos.PorcentajeAprob.CurrentValue)
				DAE_Estado_Alumnos.PorcentajeAprob.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ano_ingreso
				DAE_Estado_Alumnos.ano_ingreso.ViewValue = Convert.ToString(DAE_Estado_Alumnos.ano_ingreso.CurrentValue)
				DAE_Estado_Alumnos.ano_ingreso.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' REGIMEN
				DAE_Estado_Alumnos.REGIMEN.ViewValue = Convert.ToString(DAE_Estado_Alumnos.REGIMEN.CurrentValue)
				DAE_Estado_Alumnos.REGIMEN.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' CODCLI
			DAE_Estado_Alumnos.CODCLI.HrefValue = ""

			' RUT
			DAE_Estado_Alumnos.RUT.HrefValue = ""

			' NOMBRE
			DAE_Estado_Alumnos.NOMBRE.HrefValue = ""

			' PATERNO
			DAE_Estado_Alumnos.PATERNO.HrefValue = ""

			' MATERNO
			DAE_Estado_Alumnos.MATERNO.HrefValue = ""

			' NOMBRE_C
			DAE_Estado_Alumnos.NOMBRE_C.HrefValue = ""

			' ESTACAD
			DAE_Estado_Alumnos.ESTACAD.HrefValue = ""

			' NivelEstudios
			DAE_Estado_Alumnos.NivelEstudios.HrefValue = ""

			' PorcentajeAprob
			DAE_Estado_Alumnos.PorcentajeAprob.HrefValue = ""

			' ano_ingreso
			DAE_Estado_Alumnos.ano_ingreso.HrefValue = ""

			' REGIMEN
			DAE_Estado_Alumnos.REGIMEN.HrefValue = ""

			' Call Row_Rendered event
			DAE_Estado_Alumnos.Row_Rendered()
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
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + DAE_Estado_Alumnos.SqlFrom
			sOrderBy = "[NOMBRE_C] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, DAE_Estado_Alumnos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			DAE_Estado_Alumnos.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field ESTACAD
			sSelect = "SELECT DISTINCT [ESTACAD] FROM " + DAE_Estado_Alumnos.SqlFrom
			sOrderBy = "[ESTACAD] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, DAE_Estado_Alumnos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			DAE_Estado_Alumnos.ESTACAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field NivelEstudios
			sSelect = "SELECT DISTINCT [NivelEstudios] FROM " + DAE_Estado_Alumnos.SqlFrom
			sOrderBy = "[NivelEstudios] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, DAE_Estado_Alumnos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			DAE_Estado_Alumnos.NivelEstudios.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field REGIMEN
			sSelect = "SELECT DISTINCT [REGIMEN] FROM " + DAE_Estado_Alumnos.SqlFrom
			sOrderBy = "[REGIMEN] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, DAE_Estado_Alumnos.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			DAE_Estado_Alumnos.REGIMEN.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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
				SetSessionFilterValues(DAE_Estado_Alumnos.RUT)

				' Field PATERNO
				SetSessionFilterValues(DAE_Estado_Alumnos.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(DAE_Estado_Alumnos.MATERNO)

				' Field NOMBRE_C
				SetSessionDropDownValue(DAE_Estado_Alumnos.NOMBRE_C.DropDownValue, DAE_Estado_Alumnos.NOMBRE_C)

				' Field ESTACAD
				SetSessionDropDownValue(DAE_Estado_Alumnos.ESTACAD.DropDownValue, DAE_Estado_Alumnos.ESTACAD)

				' Field NivelEstudios
				SetSessionDropDownValue(DAE_Estado_Alumnos.NivelEstudios.DropDownValue, DAE_Estado_Alumnos.NivelEstudios)

				' Field PorcentajeAprob
				SetSessionFilterValues(DAE_Estado_Alumnos.PorcentajeAprob)

				' Field ano_ingreso
				SetSessionFilterValues(DAE_Estado_Alumnos.ano_ingreso)

				' Field REGIMEN
				SetSessionDropDownValue(DAE_Estado_Alumnos.REGIMEN.DropDownValue, DAE_Estado_Alumnos.REGIMEN)
			bSetupFilter = True ' Set up filter required
		Else

				' Field RUT
				If (GetFilterValues(DAE_Estado_Alumnos.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field PATERNO
				If (GetFilterValues(DAE_Estado_Alumnos.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(DAE_Estado_Alumnos.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE_C
				If (GetDropDownValue(DAE_Estado_Alumnos.NOMBRE_C)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(DAE_Estado_Alumnos.NOMBRE_C.DropDownValue) Then
					If Not ew_SameStr(DAE_Estado_Alumnos.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_DAE_Estado_Alumnos_NOMBRE_C") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field ESTACAD
				If (GetDropDownValue(DAE_Estado_Alumnos.ESTACAD)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(DAE_Estado_Alumnos.ESTACAD.DropDownValue) Then
					If Not ew_SameStr(DAE_Estado_Alumnos.ESTACAD.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_DAE_Estado_Alumnos_ESTACAD") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field NivelEstudios
				If (GetDropDownValue(DAE_Estado_Alumnos.NivelEstudios)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(DAE_Estado_Alumnos.NivelEstudios.DropDownValue) Then
					If Not ew_SameStr(DAE_Estado_Alumnos.NivelEstudios.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_DAE_Estado_Alumnos_NivelEstudios") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field PorcentajeAprob
				If (GetFilterValues(DAE_Estado_Alumnos.PorcentajeAprob)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field ano_ingreso
				If (GetFilterValues(DAE_Estado_Alumnos.ano_ingreso)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field REGIMEN
				If (GetDropDownValue(DAE_Estado_Alumnos.REGIMEN)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(DAE_Estado_Alumnos.REGIMEN.DropDownValue) Then
					If Not ew_SameStr(DAE_Estado_Alumnos.REGIMEN.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_DAE_Estado_Alumnos_REGIMEN") Is Nothing Then
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
			GetSessionFilterValues(DAE_Estado_Alumnos.RUT)

			' Field PATERNO
			GetSessionFilterValues(DAE_Estado_Alumnos.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(DAE_Estado_Alumnos.MATERNO)

			' Field NOMBRE_C
			GetSessionDropDownValue(DAE_Estado_Alumnos.NOMBRE_C)

			' Field ESTACAD
			GetSessionDropDownValue(DAE_Estado_Alumnos.ESTACAD)

			' Field NivelEstudios
			GetSessionDropDownValue(DAE_Estado_Alumnos.NivelEstudios)

			' Field PorcentajeAprob
			GetSessionFilterValues(DAE_Estado_Alumnos.PorcentajeAprob)

			' Field ano_ingreso
			GetSessionFilterValues(DAE_Estado_Alumnos.ano_ingreso)

			' Field REGIMEN
			GetSessionDropDownValue(DAE_Estado_Alumnos.REGIMEN)
		End If

		' Call page filter validated event
		DAE_Estado_Alumnos.Page_FilterValidated()

		' Build SQL
		' Field RUT

		BuildExtendedFilter(DAE_Estado_Alumnos.RUT, sFilter)

		' Field PATERNO
		BuildExtendedFilter(DAE_Estado_Alumnos.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(DAE_Estado_Alumnos.MATERNO, sFilter)

		' Field NOMBRE_C
		BuildDropDownFilter(DAE_Estado_Alumnos.NOMBRE_C, sFilter, "")

		' Field ESTACAD
		BuildDropDownFilter(DAE_Estado_Alumnos.ESTACAD, sFilter, "")

		' Field NivelEstudios
		BuildDropDownFilter(DAE_Estado_Alumnos.NivelEstudios, sFilter, "")

		' Field PorcentajeAprob
		BuildExtendedFilter(DAE_Estado_Alumnos.PorcentajeAprob, sFilter)

		' Field ano_ingreso
		BuildExtendedFilter(DAE_Estado_Alumnos.ano_ingreso, sFilter)

		' Field REGIMEN
		BuildDropDownFilter(DAE_Estado_Alumnos.REGIMEN, sFilter, "")

		' Save parms to Session
		' Field RUT

		SetSessionFilterValues(DAE_Estado_Alumnos.RUT)

		' Field PATERNO
		SetSessionFilterValues(DAE_Estado_Alumnos.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(DAE_Estado_Alumnos.MATERNO)

		' Field NOMBRE_C
		SetSessionDropDownValue(DAE_Estado_Alumnos.NOMBRE_C.DropDownValue, DAE_Estado_Alumnos.NOMBRE_C)

		' Field ESTACAD
		SetSessionDropDownValue(DAE_Estado_Alumnos.ESTACAD.DropDownValue, DAE_Estado_Alumnos.ESTACAD)

		' Field NivelEstudios
		SetSessionDropDownValue(DAE_Estado_Alumnos.NivelEstudios.DropDownValue, DAE_Estado_Alumnos.NivelEstudios)

		' Field PorcentajeAprob
		SetSessionFilterValues(DAE_Estado_Alumnos.PorcentajeAprob)

		' Field ano_ingreso
		SetSessionFilterValues(DAE_Estado_Alumnos.ano_ingreso)

		' Field REGIMEN
		SetSessionDropDownValue(DAE_Estado_Alumnos.REGIMEN.DropDownValue, DAE_Estado_Alumnos.REGIMEN)

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
		If ew_Session("sv_DAE_Estado_Alumnos_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_DAE_Estado_Alumnos_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_DAE_Estado_Alumnos_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_DAE_Estado_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_DAE_Estado_Alumnos_" + parm)
		End If
		If ew_Session("so1_DAE_Estado_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_DAE_Estado_Alumnos_" + parm))
		End If
		If ew_Session("sc_DAE_Estado_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_DAE_Estado_Alumnos_" + parm))
		End If
		If ew_Session("sv2_DAE_Estado_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_DAE_Estado_Alumnos_" + parm)
		End If
		If ew_Session("so2_DAE_Estado_Alumnos_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_DAE_Estado_Alumnos_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_DAE_Estado_Alumnos_" + parm) = fld.SearchValue
		ew_Session("so1_DAE_Estado_Alumnos_" + parm) = fld.SearchOperator
		ew_Session("sc_DAE_Estado_Alumnos_" + parm) = fld.SearchCondition
		ew_Session("sv2_DAE_Estado_Alumnos_" + parm) = fld.SearchValue2
		ew_Session("so2_DAE_Estado_Alumnos_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_DAE_Estado_Alumnos_" + parm) = ""
		ew_Session("so1_DAE_Estado_Alumnos_" + parm) = "="
		ew_Session("sc_DAE_Estado_Alumnos_" + parm) = "AND"
		ew_Session("sv2_DAE_Estado_Alumnos_" + parm) = ""
		ew_Session("so2_DAE_Estado_Alumnos_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(DAE_Estado_Alumnos.PorcentajeAprob.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= DAE_Estado_Alumnos.PorcentajeAprob.FldErrMsg()
		End If
		If Not ewrpt_CheckNumber(Convert.ToString(DAE_Estado_Alumnos.ano_ingreso.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= DAE_Estado_Alumnos.ano_ingreso.FldErrMsg()
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
		ew_Session("sel_DAE_Estado_Alumnos_" & parm) = ""
		ew_Session("rf_DAE_Estado_Alumnos_" & parm) = ""
		ew_Session("rt_DAE_Estado_Alumnos_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = DAE_Estado_Alumnos.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_DAE_Estado_Alumnos_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_DAE_Estado_Alumnos_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_DAE_Estado_Alumnos_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBRE_C

			DAE_Estado_Alumnos.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
			DAE_Estado_Alumnos.NOMBRE_C.DropDownValue = DAE_Estado_Alumnos.NOMBRE_C.DefaultDropDownValue

			' Field ESTACAD
			DAE_Estado_Alumnos.ESTACAD.DefaultDropDownValue = EWRPT_INIT_VALUE
			DAE_Estado_Alumnos.ESTACAD.DropDownValue = DAE_Estado_Alumnos.ESTACAD.DefaultDropDownValue

			' Field NivelEstudios
			DAE_Estado_Alumnos.NivelEstudios.DefaultDropDownValue = EWRPT_INIT_VALUE
			DAE_Estado_Alumnos.NivelEstudios.DropDownValue = DAE_Estado_Alumnos.NivelEstudios.DefaultDropDownValue

			' Field REGIMEN
			DAE_Estado_Alumnos.REGIMEN.DefaultDropDownValue = EWRPT_INIT_VALUE
			DAE_Estado_Alumnos.REGIMEN.DropDownValue = DAE_Estado_Alumnos.REGIMEN.DefaultDropDownValue

		' Set up default values for extended filters
			' Field RUT

			SetDefaultExtFilter(DAE_Estado_Alumnos.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(DAE_Estado_Alumnos.RUT)	

			' Field PATERNO
			SetDefaultExtFilter(DAE_Estado_Alumnos.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(DAE_Estado_Alumnos.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(DAE_Estado_Alumnos.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(DAE_Estado_Alumnos.MATERNO)	

			' Field PorcentajeAprob
			SetDefaultExtFilter(DAE_Estado_Alumnos.PorcentajeAprob, "USER SELECT", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(DAE_Estado_Alumnos.PorcentajeAprob)	

			' Field ano_ingreso
			SetDefaultExtFilter(DAE_Estado_Alumnos.ano_ingreso, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(DAE_Estado_Alumnos.ano_ingreso)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check RUT extended filter
		If (TextFilterApplied(DAE_Estado_Alumnos.RUT)) Then bFilterExist = True

		' Check PATERNO extended filter
		If (TextFilterApplied(DAE_Estado_Alumnos.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(DAE_Estado_Alumnos.MATERNO)) Then bFilterExist = True

		' Check NOMBRE_C dropdown filter
		If (NonTextFilterApplied(DAE_Estado_Alumnos.NOMBRE_C)) Then bFilterExist = True

		' Check ESTACAD dropdown filter
		If (NonTextFilterApplied(DAE_Estado_Alumnos.ESTACAD)) Then bFilterExist = True

		' Check NivelEstudios dropdown filter
		If (NonTextFilterApplied(DAE_Estado_Alumnos.NivelEstudios)) Then bFilterExist = True

		' Check PorcentajeAprob extended filter
		If (TextFilterApplied(DAE_Estado_Alumnos.PorcentajeAprob)) Then bFilterExist = True

		' Check ano_ingreso extended filter
		If (TextFilterApplied(DAE_Estado_Alumnos.ano_ingreso)) Then bFilterExist = True

		' Check REGIMEN dropdown filter
		If (NonTextFilterApplied(DAE_Estado_Alumnos.REGIMEN)) Then bFilterExist = True
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
		BuildExtendedFilter(DAE_Estado_Alumnos.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= DAE_Estado_Alumnos.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(DAE_Estado_Alumnos.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= DAE_Estado_Alumnos.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(DAE_Estado_Alumnos.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= DAE_Estado_Alumnos.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(DAE_Estado_Alumnos.NOMBRE_C, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= DAE_Estado_Alumnos.NOMBRE_C.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTACAD
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(DAE_Estado_Alumnos.ESTACAD, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= DAE_Estado_Alumnos.ESTACAD.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NivelEstudios
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(DAE_Estado_Alumnos.NivelEstudios, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= DAE_Estado_Alumnos.NivelEstudios.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PorcentajeAprob
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(DAE_Estado_Alumnos.PorcentajeAprob, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= DAE_Estado_Alumnos.PorcentajeAprob.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ano_ingreso
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(DAE_Estado_Alumnos.ano_ingreso, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= DAE_Estado_Alumnos.ano_ingreso.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field REGIMEN
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(DAE_Estado_Alumnos.REGIMEN, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= DAE_Estado_Alumnos.REGIMEN.FldCaption() & "<br>"
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
				DAE_Estado_Alumnos.OrderBy = ""
				DAE_Estado_Alumnos.StartGroup = 1
				DAE_Estado_Alumnos.CODCLI.Sort = ""
				DAE_Estado_Alumnos.RUT.Sort = ""
				DAE_Estado_Alumnos.NOMBRE.Sort = ""
				DAE_Estado_Alumnos.PATERNO.Sort = ""
				DAE_Estado_Alumnos.MATERNO.Sort = ""
				DAE_Estado_Alumnos.NOMBRE_C.Sort = ""
				DAE_Estado_Alumnos.ESTACAD.Sort = ""
				DAE_Estado_Alumnos.NivelEstudios.Sort = ""
				DAE_Estado_Alumnos.PorcentajeAprob.Sort = ""
				DAE_Estado_Alumnos.ano_ingreso.Sort = ""
				DAE_Estado_Alumnos.REGIMEN.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			DAE_Estado_Alumnos.CurrentOrder = ew_Get("order")
			DAE_Estado_Alumnos.CurrentOrderType = ew_Get("ordertype")
			sSortSql = DAE_Estado_Alumnos.SortSql()
			DAE_Estado_Alumnos.OrderBy = sSortSql
			DAE_Estado_Alumnos.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(DAE_Estado_Alumnos.OrderBy)) Then
			DAE_Estado_Alumnos.OrderBy = "[PATERNO] ASC, [MATERNO] ASC"
			DAE_Estado_Alumnos.PATERNO.Sort = "ASC"
			DAE_Estado_Alumnos.MATERNO.Sort = "ASC"
		End If
		Return DAE_Estado_Alumnos.OrderBy
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
		DAE_Estado_Alumnos_summary = New crDAE_Estado_Alumnos_summary(Me)
		DAE_Estado_Alumnos_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		DAE_Estado_Alumnos_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (DAE_Estado_Alumnos_summary IsNot Nothing) Then DAE_Estado_Alumnos_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (DAE_Estado_Alumnos.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var DAE_Estado_Alumnos_summary = new ewrpt_Page("DAE_Estado_Alumnos_summary");
// page properties
DAE_Estado_Alumnos_summary.PageID = "summary"; // page ID
DAE_Estado_Alumnos_summary.FormID = "fDAE_Estado_Alumnossummaryfilter"; // form ID
var EWRPT_PAGE_ID = DAE_Estado_Alumnos_summary.PageID;
// extend page with ValidateForm function
DAE_Estado_Alumnos_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_PorcentajeAprob;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(DAE_Estado_Alumnos.PorcentajeAprob.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_ano_ingreso;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(DAE_Estado_Alumnos.ano_ingreso.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
DAE_Estado_Alumnos_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
DAE_Estado_Alumnos_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
DAE_Estado_Alumnos_summary.ValidateRequired = false; // no JavaScript validation
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
<% DAE_Estado_Alumnos_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (DAE_Estado_Alumnos.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (DAE_Estado_Alumnos.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= DAE_Estado_Alumnos.TableCaption() %></h1></div>
<% If (DAE_Estado_Alumnos.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= DAE_Estado_Alumnos_summary.ExportExcelUrl %>"><img src="images/excel.png" border="0" title="Exportar a Excel" alt="Exportar a Excel" /></a>
<% If (DAE_Estado_Alumnos_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br>
<% DAE_Estado_Alumnos_summary.ShowMessage() %>
<% If (DAE_Estado_Alumnos.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (DAE_Estado_Alumnos.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (DAE_Estado_Alumnos.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (DAE_Estado_Alumnos.FilterPanelOption = 2 OrElse (DAE_Estado_Alumnos.FilterPanelOption = 3 AndAlso DAE_Estado_Alumnos_summary.FilterApplied) OrElse DAE_Estado_Alumnos_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="DAE_Estado_Alumnossmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fDAE_Estado_Alumnossummaryfilter" id="fDAE_Estado_Alumnossummaryfilter" action="DAE_Estado_Alumnossmry.aspx" class="ewForm" onsubmit="return DAE_Estado_Alumnos_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = DAE_Estado_Alumnos.ano_ingreso.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= DAE_Estado_Alumnos.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="32" value="<%= ew_HtmlEncode(DAE_Estado_Alumnos.RUT.SearchValue) %>"<%= IIf(DAE_Estado_Alumnos_summary.ClearExtFilter = "DAE_Estado_Alumnos_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= DAE_Estado_Alumnos.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(DAE_Estado_Alumnos.PATERNO.SearchValue) %>"<%= IIf(DAE_Estado_Alumnos_summary.ClearExtFilter = "DAE_Estado_Alumnos_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= DAE_Estado_Alumnos.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(DAE_Estado_Alumnos.MATERNO.SearchValue) %>"<%= IIf(DAE_Estado_Alumnos_summary.ClearExtFilter = "DAE_Estado_Alumnos_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= DAE_Estado_Alumnos.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= IIf(DAE_Estado_Alumnos_summary.ClearExtFilter = "DAE_Estado_Alumnos_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = DAE_Estado_Alumnos.NOMBRE_C.CustomFilters.Count + DAE_Estado_Alumnos.NOMBRE_C.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In DAE_Estado_Alumnos.NOMBRE_C.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.NOMBRE_C.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In DAE_Estado_Alumnos.NOMBRE_C.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.NOMBRE_C.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= DAE_Estado_Alumnos.ESTACAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = DAE_Estado_Alumnos.ESTACAD.CustomFilters.Count + DAE_Estado_Alumnos.ESTACAD.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In DAE_Estado_Alumnos.ESTACAD.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "ESTACAD")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="DAE_Estado_Alumnos.ESTACAD.DropDownValue" id="DAE_Estado_Alumnos.ESTACAD.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.ESTACAD.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In DAE_Estado_Alumnos.ESTACAD.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_ESTACAD" id="sv_ESTACAD" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.ESTACAD.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= DAE_Estado_Alumnos.NivelEstudios.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NivelEstudios" id="sv_NivelEstudios"<%= IIf(DAE_Estado_Alumnos_summary.ClearExtFilter = "DAE_Estado_Alumnos_NivelEstudios", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.NivelEstudios.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = DAE_Estado_Alumnos.NivelEstudios.CustomFilters.Count + DAE_Estado_Alumnos.NivelEstudios.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In DAE_Estado_Alumnos.NivelEstudios.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NivelEstudios")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.NivelEstudios.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In DAE_Estado_Alumnos.NivelEstudios.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.NivelEstudios.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= DAE_Estado_Alumnos.PorcentajeAprob.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><select name="so1_PorcentajeAprob" id="so1_PorcentajeAprob" onchange="ewrpt_SrchOprChanged('so1_PorcentajeAprob')"><option value="="<% If (DAE_Estado_Alumnos.PorcentajeAprob.SearchOperator = "=") Then Response.Write(" selected=""selected""") %>>=</option><option value="<>"<% If (DAE_Estado_Alumnos.PorcentajeAprob.SearchOperator = "<>") Then Response.Write(" selected=""selected""") %>><></option><option value="<"<% If (DAE_Estado_Alumnos.PorcentajeAprob.SearchOperator = "<") Then Response.Write(" selected=""selected""") %>><</option><option value="<="<% If (DAE_Estado_Alumnos.PorcentajeAprob.SearchOperator = "<=") Then Response.Write(" selected=""selected""") %>><=</option><option value=">"<% If (DAE_Estado_Alumnos.PorcentajeAprob.SearchOperator = ">") Then Response.Write(" selected=""selected""") %>>></option><option value=">="<% If (DAE_Estado_Alumnos.PorcentajeAprob.SearchOperator = ">=") Then Response.Write(" selected=""selected""") %>>>=</option><option value="BETWEEN"<% If (DAE_Estado_Alumnos.PorcentajeAprob.SearchOperator = "BETWEEN") Then Response.Write(" selected=""selected""") %>>BETWEEN</option></select></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PorcentajeAprob" id="sv1_PorcentajeAprob" size="30" value="<%= ew_HtmlEncode(DAE_Estado_Alumnos.PorcentajeAprob.SearchValue) %>"<%= IIf(DAE_Estado_Alumnos_summary.ClearExtFilter = "DAE_Estado_Alumnos_PorcentajeAprob", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
					<td><span class="ewRptSearchOpr" style="display: none" id="btw1_PorcentajeAprob" name="btw1_PorcentajeAprob">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
					<td><span class="aspnetreportmaker" style="display: none" id="btw1_PorcentajeAprob" name="btw1_PorcentajeAprob">
<input type="text" name="sv2_PorcentajeAprob" id="sv2_PorcentajeAprob" size="30" value="<%= ew_HtmlEncode(DAE_Estado_Alumnos.PorcentajeAprob.SearchValue2) %>"<%= IIf(DAE_Estado_Alumnos_summary.ClearExtFilter = "DAE_Estado_Alumnos_PorcentajeAprob", " class=""ewInputCleared""", "") %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= DAE_Estado_Alumnos.ano_ingreso.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_ano_ingreso" id="sv1_ano_ingreso" size="30" value="<%= ew_HtmlEncode(DAE_Estado_Alumnos.ano_ingreso.SearchValue) %>"<%= IIf(DAE_Estado_Alumnos_summary.ClearExtFilter = "DAE_Estado_Alumnos_ano_ingreso", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= DAE_Estado_Alumnos.REGIMEN.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = DAE_Estado_Alumnos.REGIMEN.CustomFilters.Count + DAE_Estado_Alumnos.REGIMEN.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In DAE_Estado_Alumnos.REGIMEN.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "REGIMEN")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="DAE_Estado_Alumnos.REGIMEN.DropDownValue" id="DAE_Estado_Alumnos.REGIMEN.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.REGIMEN.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In DAE_Estado_Alumnos.REGIMEN.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_REGIMEN" id="sv_REGIMEN" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(DAE_Estado_Alumnos.REGIMEN.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<script type="text/javascript">
ewrpt_SrchOprChanged('so1_PorcentajeAprob');
</script>
<!-- Search form (end) -->
</div>
<br>
<% End If %>
<% If (DAE_Estado_Alumnos.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% DAE_Estado_Alumnos_summary.ShowFilterList() %>
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
If (DAE_Estado_Alumnos.ExportAll AndAlso ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then
	DAE_Estado_Alumnos_summary.StopGrp = DAE_Estado_Alumnos_summary.TotalGrps
Else
	DAE_Estado_Alumnos_summary.StopGrp = DAE_Estado_Alumnos_summary.StartGrp + DAE_Estado_Alumnos_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (DAE_Estado_Alumnos_summary.StopGrp > DAE_Estado_Alumnos_summary.TotalGrps) Then
	DAE_Estado_Alumnos_summary.StopGrp = DAE_Estado_Alumnos_summary.TotalGrps
End If
DAE_Estado_Alumnos_summary.RecCount = 0

' Get first row
If (DAE_Estado_Alumnos_summary.TotalGrps > 0) Then
	DAE_Estado_Alumnos_summary.GetRow() ' ASPXRPT
	DAE_Estado_Alumnos_summary.GrpCount = 1
End If
While ((DAE_Estado_Alumnos_summary.HasRow AndAlso DAE_Estado_Alumnos_summary.GrpIndex < DAE_Estado_Alumnos_summary.StopGrp) OrElse DAE_Estado_Alumnos_summary.ShowFirstHeader)

	' Show header
	If (DAE_Estado_Alumnos_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.CODCLI.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.CODCLI))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.CODCLI.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.CODCLI) %>',0);"><%= DAE_Estado_Alumnos.CODCLI.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.CODCLI.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.CODCLI.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.RUT) %>',0);"><%= DAE_Estado_Alumnos.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.NOMBRE) %>',0);"><%= DAE_Estado_Alumnos.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.PATERNO) %>',0);"><%= DAE_Estado_Alumnos.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.MATERNO) %>',0);"><%= DAE_Estado_Alumnos.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.NOMBRE_C.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.NOMBRE_C))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.NOMBRE_C.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.NOMBRE_C) %>',0);"><%= DAE_Estado_Alumnos.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.NOMBRE_C.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.NOMBRE_C.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.ESTACAD.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.ESTACAD))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.ESTACAD.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.ESTACAD) %>',0);"><%= DAE_Estado_Alumnos.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.ESTACAD.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.ESTACAD.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.NivelEstudios.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.NivelEstudios))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.NivelEstudios.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.NivelEstudios) %>',0);"><%= DAE_Estado_Alumnos.NivelEstudios.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.NivelEstudios.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.NivelEstudios.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.PorcentajeAprob.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.PorcentajeAprob))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.PorcentajeAprob.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.PorcentajeAprob) %>',0);"><%= DAE_Estado_Alumnos.PorcentajeAprob.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.PorcentajeAprob.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.PorcentajeAprob.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.ano_ingreso.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.ano_ingreso))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.ano_ingreso.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.ano_ingreso) %>',0);"><%= DAE_Estado_Alumnos.ano_ingreso.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.ano_ingreso.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.ano_ingreso.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(DAE_Estado_Alumnos.Export)) Then %>
<%= DAE_Estado_Alumnos.REGIMEN.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.REGIMEN))) Then %>
		<td style="vertical-align: bottom;"><%= DAE_Estado_Alumnos.REGIMEN.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= DAE_Estado_Alumnos.SortUrl(DAE_Estado_Alumnos.REGIMEN) %>',0);"><%= DAE_Estado_Alumnos.REGIMEN.FldCaption() %></td><td style="width: 10px;">
		<% If (DAE_Estado_Alumnos.REGIMEN.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (DAE_Estado_Alumnos.REGIMEN.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		DAE_Estado_Alumnos_summary.ShowFirstHeader = False
	End If
	DAE_Estado_Alumnos_summary.RecCount += 1

		' Render detail row
		DAE_Estado_Alumnos.ResetCSS()
		DAE_Estado_Alumnos.RowType = EWRPT_ROWTYPE_DETAIL
		DAE_Estado_Alumnos_summary.RenderRow()
%>
	<tr<%= DAE_Estado_Alumnos.RowAttributes() %>>
		<td<%= DAE_Estado_Alumnos.CODCLI.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.CODCLI.ViewAttributes%>><%= DAE_Estado_Alumnos.CODCLI.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.RUT.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.RUT.ViewAttributes%>><%= DAE_Estado_Alumnos.RUT.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.NOMBRE.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.NOMBRE.ViewAttributes%>><%= DAE_Estado_Alumnos.NOMBRE.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.PATERNO.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.PATERNO.ViewAttributes%>><%= DAE_Estado_Alumnos.PATERNO.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.MATERNO.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.MATERNO.ViewAttributes%>><%= DAE_Estado_Alumnos.MATERNO.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.NOMBRE_C.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.NOMBRE_C.ViewAttributes%>><%= DAE_Estado_Alumnos.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.ESTACAD.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.ESTACAD.ViewAttributes%>><%= DAE_Estado_Alumnos.ESTACAD.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.NivelEstudios.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.NivelEstudios.ViewAttributes%>><%= DAE_Estado_Alumnos.NivelEstudios.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.PorcentajeAprob.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.PorcentajeAprob.ViewAttributes%>><%= DAE_Estado_Alumnos.PorcentajeAprob.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.ano_ingreso.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.ano_ingreso.ViewAttributes%>><%= DAE_Estado_Alumnos.ano_ingreso.ListViewValue%></div>
</td>
		<td<%= DAE_Estado_Alumnos.REGIMEN.CellAttributes %>>
<div<%= DAE_Estado_Alumnos.REGIMEN.ViewAttributes%>><%= DAE_Estado_Alumnos.REGIMEN.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		DAE_Estado_Alumnos_summary.AccumulateSummary()

		' Get next record
		DAE_Estado_Alumnos_summary.GetRow() ' ASPXRPT
		DAE_Estado_Alumnos_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (DAE_Estado_Alumnos_summary.TotalGrps > 0) Then
	DAE_Estado_Alumnos.ResetCSS()
	DAE_Estado_Alumnos.RowType = EWRPT_ROWTYPE_TOTAL
	DAE_Estado_Alumnos.RowTotalType = EWRPT_ROWTOTAL_GRAND
	DAE_Estado_Alumnos.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	DAE_Estado_Alumnos.RowAttrs("class") = "ewRptGrandSummary"
	DAE_Estado_Alumnos_summary.RenderRow()
%>
	<!-- tr><td colspan="11"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= DAE_Estado_Alumnos.RowAttributes() %>><td colspan="11"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(DAE_Estado_Alumnos_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (DAE_Estado_Alumnos.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If DAE_Estado_Alumnos_summary.Pager Is Nothing Then DAE_Estado_Alumnos_summary.Pager = New cPrevNextPager(DAE_Estado_Alumnos_summary.StartGrp, DAE_Estado_Alumnos_summary.DisplayGrps, DAE_Estado_Alumnos_summary.TotalGrps) %>
<% If DAE_Estado_Alumnos_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If DAE_Estado_Alumnos_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="DAE_Estado_Alumnossmry.aspx?start=<%= DAE_Estado_Alumnos_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If DAE_Estado_Alumnos_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="DAE_Estado_Alumnossmry.aspx?start=<%= DAE_Estado_Alumnos_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= DAE_Estado_Alumnos_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If DAE_Estado_Alumnos_summary.Pager.NextButton.Enabled Then %>
	<td><a href="DAE_Estado_Alumnossmry.aspx?start=<%= DAE_Estado_Alumnos_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If DAE_Estado_Alumnos_summary.Pager.LastButton.Enabled Then %>
	<td><a href="DAE_Estado_Alumnossmry.aspx?start=<%= DAE_Estado_Alumnos_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= DAE_Estado_Alumnos_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= DAE_Estado_Alumnos_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= DAE_Estado_Alumnos_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= DAE_Estado_Alumnos_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If DAE_Estado_Alumnos_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (DAE_Estado_Alumnos_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If DAE_Estado_Alumnos_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If DAE_Estado_Alumnos_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If DAE_Estado_Alumnos_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (DAE_Estado_Alumnos.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (DAE_Estado_Alumnos.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (DAE_Estado_Alumnos.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% DAE_Estado_Alumnos_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (DAE_Estado_Alumnos.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
