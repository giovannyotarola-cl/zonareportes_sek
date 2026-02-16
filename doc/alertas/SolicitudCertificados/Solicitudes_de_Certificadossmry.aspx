<%@ Page ClassName="Solicitudes_de_Certificadossmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_solicitudesCertificados" %>
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
	Public Solicitudes_de_Certificados As crSolicitudes_de_Certificados = Nothing

	'
	' Table class (for Solicitudes de Certificados)
	'
	Public Class crSolicitudes_de_Certificados
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
				Return "Solicitudes_de_Certificados"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Solicitudes de Certificados"
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

		Public ID As crField

		Public IPENVIO As crField

		Public FECHAHORA As crField

		Public HORA As crField

		Public NOMBRE As crField

		Public APELLIDOS As crField

		Public EMAIL As crField

		Public RUT As crField

		Public CURSO As crField

		Public CARRERA As crField

		Public OBESERVACION As crField

		Public SEDERETIRO As crField

		Public DESTINATARIO As crField

		Public OTROPROGRAMA As crField

		Public ASIGFAMILIAR As crField

		Public ALUMREGULAR As crField

		Public MATRICULA As crField

		Public NOTAS As crField

		Public CONCENTNOTA As crField

		Public PLANES As crField

		Public TITULOTRAMITE As crField

		Public COPIADIPLOMA As crField

		Public CERTIFICADOS As crField

		Public CORTESUPREMA As crField

		Public EGRESO As crField

		Public PLANESPROGRAM As crField

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

			' ID
			ID = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_ID", "ID", "[ID]", 131, EWRPT_DATATYPE_NUMBER, -1)
			ID.Page = APage
			ID.ParentPage = APage.ParentPage
			ID.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("ID", ID)
			ID.DateFilter = ""
			ID.SqlSelect = ""
			ID.SqlOrderBy = ""

			' IPENVIO
			IPENVIO = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_IPENVIO", "IPENVIO", "[IPENVIO]", 200, EWRPT_DATATYPE_STRING, -1)
			IPENVIO.Page = APage
			IPENVIO.ParentPage = APage.ParentPage
			Fields.Add("IPENVIO", IPENVIO)
			IPENVIO.DateFilter = ""
			IPENVIO.SqlSelect = ""
			IPENVIO.SqlOrderBy = ""

			' FECHAHORA
			FECHAHORA = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_FECHAHORA", "FECHAHORA", "[FECHAHORA]", 135, EWRPT_DATATYPE_DATE, 7)
			FECHAHORA.Page = APage
			FECHAHORA.ParentPage = APage.ParentPage
			FECHAHORA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("FECHAHORA", FECHAHORA)
			FECHAHORA.DateFilter = ""
			FECHAHORA.SqlSelect = ""
			FECHAHORA.SqlOrderBy = ""

			' HORA
			HORA = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_HORA", "HORA", "[HORA]", 200, EWRPT_DATATYPE_STRING, -1)
			HORA.Page = APage
			HORA.ParentPage = APage.ParentPage
			Fields.Add("HORA", HORA)
			HORA.DateFilter = ""
			HORA.SqlSelect = ""
			HORA.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' APELLIDOS
			APELLIDOS = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_APELLIDOS", "APELLIDOS", "[APELLIDOS]", 200, EWRPT_DATATYPE_STRING, -1)
			APELLIDOS.Page = APage
			APELLIDOS.ParentPage = APage.ParentPage
			Fields.Add("APELLIDOS", APELLIDOS)
			APELLIDOS.DateFilter = ""
			APELLIDOS.SqlSelect = ""
			APELLIDOS.SqlOrderBy = ""

			' EMAIL
			EMAIL = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_EMAIL", "EMAIL", "[EMAIL]", 200, EWRPT_DATATYPE_STRING, -1)
			EMAIL.Page = APage
			EMAIL.ParentPage = APage.ParentPage
			Fields.Add("EMAIL", EMAIL)
			EMAIL.DateFilter = ""
			EMAIL.SqlSelect = ""
			EMAIL.SqlOrderBy = ""

			' RUT
			RUT = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1)
			RUT.Page = APage
			RUT.ParentPage = APage.ParentPage
			Fields.Add("RUT", RUT)
			RUT.DateFilter = ""
			RUT.SqlSelect = ""
			RUT.SqlOrderBy = ""

			' CURSO
			CURSO = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_CURSO", "CURSO", "[CURSO]", 200, EWRPT_DATATYPE_STRING, -1)
			CURSO.Page = APage
			CURSO.ParentPage = APage.ParentPage
			Fields.Add("CURSO", CURSO)
			CURSO.DateFilter = ""
			CURSO.SqlSelect = ""
			CURSO.SqlOrderBy = ""

			' CARRERA
			CARRERA = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_CARRERA", "CARRERA", "[CARRERA]", 200, EWRPT_DATATYPE_STRING, -1)
			CARRERA.Page = APage
			CARRERA.ParentPage = APage.ParentPage
			Fields.Add("CARRERA", CARRERA)
			CARRERA.DateFilter = ""
			CARRERA.SqlSelect = ""
			CARRERA.SqlOrderBy = ""

			' OBESERVACION
			OBESERVACION = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_OBESERVACION", "OBESERVACION", "[OBESERVACION]", 200, EWRPT_DATATYPE_STRING, -1)
			OBESERVACION.Page = APage
			OBESERVACION.ParentPage = APage.ParentPage
			Fields.Add("OBESERVACION", OBESERVACION)
			OBESERVACION.DateFilter = ""
			OBESERVACION.SqlSelect = ""
			OBESERVACION.SqlOrderBy = ""

			' SEDERETIRO
			SEDERETIRO = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_SEDERETIRO", "SEDERETIRO", "[SEDERETIRO]", 200, EWRPT_DATATYPE_STRING, -1)
			SEDERETIRO.Page = APage
			SEDERETIRO.ParentPage = APage.ParentPage
			Fields.Add("SEDERETIRO", SEDERETIRO)
			SEDERETIRO.DateFilter = ""
			SEDERETIRO.SqlSelect = ""
			SEDERETIRO.SqlOrderBy = ""

			' DESTINATARIO
			DESTINATARIO = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_DESTINATARIO", "DESTINATARIO", "[DESTINATARIO]", 200, EWRPT_DATATYPE_STRING, -1)
			DESTINATARIO.Page = APage
			DESTINATARIO.ParentPage = APage.ParentPage
			Fields.Add("DESTINATARIO", DESTINATARIO)
			DESTINATARIO.DateFilter = ""
			DESTINATARIO.SqlSelect = ""
			DESTINATARIO.SqlOrderBy = ""

			' OTROPROGRAMA
			OTROPROGRAMA = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_OTROPROGRAMA", "OTROPROGRAMA", "[OTROPROGRAMA]", 200, EWRPT_DATATYPE_STRING, -1)
			OTROPROGRAMA.Page = APage
			OTROPROGRAMA.ParentPage = APage.ParentPage
			Fields.Add("OTROPROGRAMA", OTROPROGRAMA)
			OTROPROGRAMA.DateFilter = ""
			OTROPROGRAMA.SqlSelect = ""
			OTROPROGRAMA.SqlOrderBy = ""

			' ASIGFAMILIAR
			ASIGFAMILIAR = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_ASIGFAMILIAR", "ASIGFAMILIAR", "[ASIGFAMILIAR]", 200, EWRPT_DATATYPE_STRING, -1)
			ASIGFAMILIAR.Page = APage
			ASIGFAMILIAR.ParentPage = APage.ParentPage
			Fields.Add("ASIGFAMILIAR", ASIGFAMILIAR)
			ASIGFAMILIAR.DateFilter = ""
			ASIGFAMILIAR.SqlSelect = ""
			ASIGFAMILIAR.SqlOrderBy = ""

			' ALUMREGULAR
			ALUMREGULAR = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_ALUMREGULAR", "ALUMREGULAR", "[ALUMREGULAR]", 200, EWRPT_DATATYPE_STRING, -1)
			ALUMREGULAR.Page = APage
			ALUMREGULAR.ParentPage = APage.ParentPage
			Fields.Add("ALUMREGULAR", ALUMREGULAR)
			ALUMREGULAR.DateFilter = ""
			ALUMREGULAR.SqlSelect = ""
			ALUMREGULAR.SqlOrderBy = ""

			' MATRICULA
			MATRICULA = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_MATRICULA", "MATRICULA", "[MATRICULA]", 200, EWRPT_DATATYPE_STRING, -1)
			MATRICULA.Page = APage
			MATRICULA.ParentPage = APage.ParentPage
			Fields.Add("MATRICULA", MATRICULA)
			MATRICULA.DateFilter = ""
			MATRICULA.SqlSelect = ""
			MATRICULA.SqlOrderBy = ""

			' NOTAS
			NOTAS = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_NOTAS", "NOTAS", "[NOTAS]", 200, EWRPT_DATATYPE_STRING, -1)
			NOTAS.Page = APage
			NOTAS.ParentPage = APage.ParentPage
			Fields.Add("NOTAS", NOTAS)
			NOTAS.DateFilter = ""
			NOTAS.SqlSelect = ""
			NOTAS.SqlOrderBy = ""

			' CONCENTNOTA
			CONCENTNOTA = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_CONCENTNOTA", "CONCENTNOTA", "[CONCENTNOTA]", 200, EWRPT_DATATYPE_STRING, -1)
			CONCENTNOTA.Page = APage
			CONCENTNOTA.ParentPage = APage.ParentPage
			Fields.Add("CONCENTNOTA", CONCENTNOTA)
			CONCENTNOTA.DateFilter = ""
			CONCENTNOTA.SqlSelect = ""
			CONCENTNOTA.SqlOrderBy = ""

			' PLANES
			PLANES = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_PLANES", "PLANES", "[PLANES]", 200, EWRPT_DATATYPE_STRING, -1)
			PLANES.Page = APage
			PLANES.ParentPage = APage.ParentPage
			Fields.Add("PLANES", PLANES)
			PLANES.DateFilter = ""
			PLANES.SqlSelect = ""
			PLANES.SqlOrderBy = ""

			' TITULOTRAMITE
			TITULOTRAMITE = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_TITULOTRAMITE", "TITULOTRAMITE", "[TITULOTRAMITE]", 200, EWRPT_DATATYPE_STRING, -1)
			TITULOTRAMITE.Page = APage
			TITULOTRAMITE.ParentPage = APage.ParentPage
			Fields.Add("TITULOTRAMITE", TITULOTRAMITE)
			TITULOTRAMITE.DateFilter = ""
			TITULOTRAMITE.SqlSelect = ""
			TITULOTRAMITE.SqlOrderBy = ""

			' COPIADIPLOMA
			COPIADIPLOMA = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_COPIADIPLOMA", "COPIADIPLOMA", "[COPIADIPLOMA]", 200, EWRPT_DATATYPE_STRING, -1)
			COPIADIPLOMA.Page = APage
			COPIADIPLOMA.ParentPage = APage.ParentPage
			Fields.Add("COPIADIPLOMA", COPIADIPLOMA)
			COPIADIPLOMA.DateFilter = ""
			COPIADIPLOMA.SqlSelect = ""
			COPIADIPLOMA.SqlOrderBy = ""

			' CERTIFICADOS
			CERTIFICADOS = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_CERTIFICADOS", "CERTIFICADOS", "[CERTIFICADOS]", 200, EWRPT_DATATYPE_STRING, -1)
			CERTIFICADOS.Page = APage
			CERTIFICADOS.ParentPage = APage.ParentPage
			Fields.Add("CERTIFICADOS", CERTIFICADOS)
			CERTIFICADOS.DateFilter = ""
			CERTIFICADOS.SqlSelect = ""
			CERTIFICADOS.SqlOrderBy = ""

			' CORTESUPREMA
			CORTESUPREMA = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_CORTESUPREMA", "CORTESUPREMA", "[CORTESUPREMA]", 200, EWRPT_DATATYPE_STRING, -1)
			CORTESUPREMA.Page = APage
			CORTESUPREMA.ParentPage = APage.ParentPage
			Fields.Add("CORTESUPREMA", CORTESUPREMA)
			CORTESUPREMA.DateFilter = ""
			CORTESUPREMA.SqlSelect = ""
			CORTESUPREMA.SqlOrderBy = ""

			' EGRESO
			EGRESO = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_EGRESO", "EGRESO", "[EGRESO]", 200, EWRPT_DATATYPE_STRING, -1)
			EGRESO.Page = APage
			EGRESO.ParentPage = APage.ParentPage
			Fields.Add("EGRESO", EGRESO)
			EGRESO.DateFilter = ""
			EGRESO.SqlSelect = ""
			EGRESO.SqlOrderBy = ""

			' PLANESPROGRAM
			PLANESPROGRAM = new crField("Solicitudes_de_Certificados", "Solicitudes de Certificados", "x_PLANESPROGRAM", "PLANESPROGRAM", "[PLANESPROGRAM]", 200, EWRPT_DATATYPE_STRING, -1)
			PLANESPROGRAM.Page = APage
			PLANESPROGRAM.ParentPage = APage.ParentPage
			Fields.Add("PLANESPROGRAM", PLANESPROGRAM)
			PLANESPROGRAM.DateFilter = ""
			PLANESPROGRAM.SqlSelect = ""
			PLANESPROGRAM.SqlOrderBy = ""
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
				Return "[SEK_Solicitud_Certificados]"
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
	Public Solicitudes_de_Certificados_summary As crSolicitudes_de_Certificados_summary

	'
	' Page class
	'
	Public Class crSolicitudes_de_Certificados_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Solicitudes_de_Certificados.UseTokenInUrl) Then
				sUrl &= "t=" & Solicitudes_de_Certificados.TableVar & "&" ' Add page token
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
			If (Solicitudes_de_Certificados.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Solicitudes_de_Certificados.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Solicitudes_de_Certificados.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Solicitudes_de_Certificadossmry 
			Get
				Return CType(m_ParentPage, Solicitudes_de_Certificadossmry)
			End Get
		End Property

		' Table object (Solicitudes_de_Certificados)
		Public Property Solicitudes_de_Certificados As crSolicitudes_de_Certificados 
			Get		
				Return AspNetPage.Solicitudes_de_Certificados ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crSolicitudes_de_Certificados)
				AspNetPage.Solicitudes_de_Certificados = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_solicitudesCertificados)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Solicitudes_de_Certificados_summary"
			m_PageObjTypeName = "crSolicitudes_de_Certificados_summary"

			' Table name
			m_TableName = "Solicitudes de Certificados"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Solicitudes_de_Certificados)
			Solicitudes_de_Certificados = New crSolicitudes_de_Certificados(Me)			

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
				Solicitudes_de_Certificados.Export = ew_Get("export")
			End If
			gsExport = Solicitudes_de_Certificados.Export ' Get export parameter, used in header
			gsExportFile = Solicitudes_de_Certificados.TableVar ' Get export file, used in header
			If (Solicitudes_de_Certificados.Export = "excel") Then
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

		Public Val As Object() = New Object(23) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(23) {}

		Public GrandMn As Object() = New Object(23) {}

		Public GrandMx As Object() = New Object(23) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 24 ' No. of fields
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
			Solicitudes_de_Certificados.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Solicitudes_de_Certificados.SqlSelect, Solicitudes_de_Certificados.SqlWhere, Solicitudes_de_Certificados.SqlGroupBy, Solicitudes_de_Certificados.SqlHaving, Solicitudes_de_Certificados.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Solicitudes_de_Certificados.ExportAll AndAlso ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then
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
				Solicitudes_de_Certificados.ID.DbValue = Row("ID")
				Solicitudes_de_Certificados.IPENVIO.DbValue = Row("IPENVIO")
				Solicitudes_de_Certificados.FECHAHORA.DbValue = Row("FECHAHORA")
				Solicitudes_de_Certificados.HORA.DbValue = Row("HORA")
				Solicitudes_de_Certificados.NOMBRE.DbValue = Row("NOMBRE")
				Solicitudes_de_Certificados.APELLIDOS.DbValue = Row("APELLIDOS")
				Solicitudes_de_Certificados.EMAIL.DbValue = Row("EMAIL")
				Solicitudes_de_Certificados.RUT.DbValue = Row("RUT")
				Solicitudes_de_Certificados.CURSO.DbValue = Row("CURSO")
				Solicitudes_de_Certificados.CARRERA.DbValue = Row("CARRERA")
				Solicitudes_de_Certificados.OBESERVACION.DbValue = Row("OBESERVACION")
				Solicitudes_de_Certificados.SEDERETIRO.DbValue = Row("SEDERETIRO")
				Solicitudes_de_Certificados.DESTINATARIO.DbValue = Row("DESTINATARIO")
				Solicitudes_de_Certificados.OTROPROGRAMA.DbValue = Row("OTROPROGRAMA")
				Solicitudes_de_Certificados.ASIGFAMILIAR.DbValue = Row("ASIGFAMILIAR")
				Solicitudes_de_Certificados.ALUMREGULAR.DbValue = Row("ALUMREGULAR")
				Solicitudes_de_Certificados.MATRICULA.DbValue = Row("MATRICULA")
				Solicitudes_de_Certificados.NOTAS.DbValue = Row("NOTAS")
				Solicitudes_de_Certificados.CONCENTNOTA.DbValue = Row("CONCENTNOTA")
				Solicitudes_de_Certificados.PLANES.DbValue = Row("PLANES")
				Solicitudes_de_Certificados.TITULOTRAMITE.DbValue = Row("TITULOTRAMITE")
				Solicitudes_de_Certificados.COPIADIPLOMA.DbValue = Row("COPIADIPLOMA")
				Solicitudes_de_Certificados.CERTIFICADOS.DbValue = Row("CERTIFICADOS")
				Solicitudes_de_Certificados.CORTESUPREMA.DbValue = Row("CORTESUPREMA")
				Solicitudes_de_Certificados.EGRESO.DbValue = Row("EGRESO")
				Solicitudes_de_Certificados.PLANESPROGRAM.DbValue = Row("PLANESPROGRAM")
				Val(1) = Solicitudes_de_Certificados.FECHAHORA.CurrentValue
				Val(2) = Solicitudes_de_Certificados.NOMBRE.CurrentValue
				Val(3) = Solicitudes_de_Certificados.APELLIDOS.CurrentValue
				Val(4) = Solicitudes_de_Certificados.EMAIL.CurrentValue
				Val(5) = Solicitudes_de_Certificados.RUT.CurrentValue
				Val(6) = Solicitudes_de_Certificados.CURSO.CurrentValue
				Val(7) = Solicitudes_de_Certificados.CARRERA.CurrentValue
				Val(8) = Solicitudes_de_Certificados.OBESERVACION.CurrentValue
				Val(9) = Solicitudes_de_Certificados.SEDERETIRO.CurrentValue
				Val(10) = Solicitudes_de_Certificados.DESTINATARIO.CurrentValue
				Val(11) = Solicitudes_de_Certificados.OTROPROGRAMA.CurrentValue
				Val(12) = Solicitudes_de_Certificados.ASIGFAMILIAR.CurrentValue
				Val(13) = Solicitudes_de_Certificados.ALUMREGULAR.CurrentValue
				Val(14) = Solicitudes_de_Certificados.MATRICULA.CurrentValue
				Val(15) = Solicitudes_de_Certificados.NOTAS.CurrentValue
				Val(16) = Solicitudes_de_Certificados.CONCENTNOTA.CurrentValue
				Val(17) = Solicitudes_de_Certificados.PLANES.CurrentValue
				Val(18) = Solicitudes_de_Certificados.TITULOTRAMITE.CurrentValue
				Val(19) = Solicitudes_de_Certificados.COPIADIPLOMA.CurrentValue
				Val(20) = Solicitudes_de_Certificados.CERTIFICADOS.CurrentValue
				Val(21) = Solicitudes_de_Certificados.CORTESUPREMA.CurrentValue
				Val(22) = Solicitudes_de_Certificados.EGRESO.CurrentValue
				Val(23) = Solicitudes_de_Certificados.PLANESPROGRAM.CurrentValue
			Else
				Solicitudes_de_Certificados.ID.DbValue = ""
				Solicitudes_de_Certificados.IPENVIO.DbValue = ""
				Solicitudes_de_Certificados.FECHAHORA.DbValue = ""
				Solicitudes_de_Certificados.HORA.DbValue = ""
				Solicitudes_de_Certificados.NOMBRE.DbValue = ""
				Solicitudes_de_Certificados.APELLIDOS.DbValue = ""
				Solicitudes_de_Certificados.EMAIL.DbValue = ""
				Solicitudes_de_Certificados.RUT.DbValue = ""
				Solicitudes_de_Certificados.CURSO.DbValue = ""
				Solicitudes_de_Certificados.CARRERA.DbValue = ""
				Solicitudes_de_Certificados.OBESERVACION.DbValue = ""
				Solicitudes_de_Certificados.SEDERETIRO.DbValue = ""
				Solicitudes_de_Certificados.DESTINATARIO.DbValue = ""
				Solicitudes_de_Certificados.OTROPROGRAMA.DbValue = ""
				Solicitudes_de_Certificados.ASIGFAMILIAR.DbValue = ""
				Solicitudes_de_Certificados.ALUMREGULAR.DbValue = ""
				Solicitudes_de_Certificados.MATRICULA.DbValue = ""
				Solicitudes_de_Certificados.NOTAS.DbValue = ""
				Solicitudes_de_Certificados.CONCENTNOTA.DbValue = ""
				Solicitudes_de_Certificados.PLANES.DbValue = ""
				Solicitudes_de_Certificados.TITULOTRAMITE.DbValue = ""
				Solicitudes_de_Certificados.COPIADIPLOMA.DbValue = ""
				Solicitudes_de_Certificados.CERTIFICADOS.DbValue = ""
				Solicitudes_de_Certificados.CORTESUPREMA.DbValue = ""
				Solicitudes_de_Certificados.EGRESO.DbValue = ""
				Solicitudes_de_Certificados.PLANESPROGRAM.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Solicitudes_de_Certificados.ID.DbValue = dr("ID")
				Solicitudes_de_Certificados.IPENVIO.DbValue = dr("IPENVIO")
				Solicitudes_de_Certificados.FECHAHORA.DbValue = dr("FECHAHORA")
				Solicitudes_de_Certificados.HORA.DbValue = dr("HORA")
				Solicitudes_de_Certificados.NOMBRE.DbValue = dr("NOMBRE")
				Solicitudes_de_Certificados.APELLIDOS.DbValue = dr("APELLIDOS")
				Solicitudes_de_Certificados.EMAIL.DbValue = dr("EMAIL")
				Solicitudes_de_Certificados.RUT.DbValue = dr("RUT")
				Solicitudes_de_Certificados.CURSO.DbValue = dr("CURSO")
				Solicitudes_de_Certificados.CARRERA.DbValue = dr("CARRERA")
				Solicitudes_de_Certificados.OBESERVACION.DbValue = dr("OBESERVACION")
				Solicitudes_de_Certificados.SEDERETIRO.DbValue = dr("SEDERETIRO")
				Solicitudes_de_Certificados.DESTINATARIO.DbValue = dr("DESTINATARIO")
				Solicitudes_de_Certificados.OTROPROGRAMA.DbValue = dr("OTROPROGRAMA")
				Solicitudes_de_Certificados.ASIGFAMILIAR.DbValue = dr("ASIGFAMILIAR")
				Solicitudes_de_Certificados.ALUMREGULAR.DbValue = dr("ALUMREGULAR")
				Solicitudes_de_Certificados.MATRICULA.DbValue = dr("MATRICULA")
				Solicitudes_de_Certificados.NOTAS.DbValue = dr("NOTAS")
				Solicitudes_de_Certificados.CONCENTNOTA.DbValue = dr("CONCENTNOTA")
				Solicitudes_de_Certificados.PLANES.DbValue = dr("PLANES")
				Solicitudes_de_Certificados.TITULOTRAMITE.DbValue = dr("TITULOTRAMITE")
				Solicitudes_de_Certificados.COPIADIPLOMA.DbValue = dr("COPIADIPLOMA")
				Solicitudes_de_Certificados.CERTIFICADOS.DbValue = dr("CERTIFICADOS")
				Solicitudes_de_Certificados.CORTESUPREMA.DbValue = dr("CORTESUPREMA")
				Solicitudes_de_Certificados.EGRESO.DbValue = dr("EGRESO")
				Solicitudes_de_Certificados.PLANESPROGRAM.DbValue = dr("PLANESPROGRAM")
				Val(1) = Solicitudes_de_Certificados.FECHAHORA.CurrentValue
				Val(2) = Solicitudes_de_Certificados.NOMBRE.CurrentValue
				Val(3) = Solicitudes_de_Certificados.APELLIDOS.CurrentValue
				Val(4) = Solicitudes_de_Certificados.EMAIL.CurrentValue
				Val(5) = Solicitudes_de_Certificados.RUT.CurrentValue
				Val(6) = Solicitudes_de_Certificados.CURSO.CurrentValue
				Val(7) = Solicitudes_de_Certificados.CARRERA.CurrentValue
				Val(8) = Solicitudes_de_Certificados.OBESERVACION.CurrentValue
				Val(9) = Solicitudes_de_Certificados.SEDERETIRO.CurrentValue
				Val(10) = Solicitudes_de_Certificados.DESTINATARIO.CurrentValue
				Val(11) = Solicitudes_de_Certificados.OTROPROGRAMA.CurrentValue
				Val(12) = Solicitudes_de_Certificados.ASIGFAMILIAR.CurrentValue
				Val(13) = Solicitudes_de_Certificados.ALUMREGULAR.CurrentValue
				Val(14) = Solicitudes_de_Certificados.MATRICULA.CurrentValue
				Val(15) = Solicitudes_de_Certificados.NOTAS.CurrentValue
				Val(16) = Solicitudes_de_Certificados.CONCENTNOTA.CurrentValue
				Val(17) = Solicitudes_de_Certificados.PLANES.CurrentValue
				Val(18) = Solicitudes_de_Certificados.TITULOTRAMITE.CurrentValue
				Val(19) = Solicitudes_de_Certificados.COPIADIPLOMA.CurrentValue
				Val(20) = Solicitudes_de_Certificados.CERTIFICADOS.CurrentValue
				Val(21) = Solicitudes_de_Certificados.CORTESUPREMA.CurrentValue
				Val(22) = Solicitudes_de_Certificados.EGRESO.CurrentValue
				Val(23) = Solicitudes_de_Certificados.PLANESPROGRAM.CurrentValue
			Else				
				Solicitudes_de_Certificados.ID.DbValue = ""
				Solicitudes_de_Certificados.IPENVIO.DbValue = ""
				Solicitudes_de_Certificados.FECHAHORA.DbValue = ""
				Solicitudes_de_Certificados.HORA.DbValue = ""
				Solicitudes_de_Certificados.NOMBRE.DbValue = ""
				Solicitudes_de_Certificados.APELLIDOS.DbValue = ""
				Solicitudes_de_Certificados.EMAIL.DbValue = ""
				Solicitudes_de_Certificados.RUT.DbValue = ""
				Solicitudes_de_Certificados.CURSO.DbValue = ""
				Solicitudes_de_Certificados.CARRERA.DbValue = ""
				Solicitudes_de_Certificados.OBESERVACION.DbValue = ""
				Solicitudes_de_Certificados.SEDERETIRO.DbValue = ""
				Solicitudes_de_Certificados.DESTINATARIO.DbValue = ""
				Solicitudes_de_Certificados.OTROPROGRAMA.DbValue = ""
				Solicitudes_de_Certificados.ASIGFAMILIAR.DbValue = ""
				Solicitudes_de_Certificados.ALUMREGULAR.DbValue = ""
				Solicitudes_de_Certificados.MATRICULA.DbValue = ""
				Solicitudes_de_Certificados.NOTAS.DbValue = ""
				Solicitudes_de_Certificados.CONCENTNOTA.DbValue = ""
				Solicitudes_de_Certificados.PLANES.DbValue = ""
				Solicitudes_de_Certificados.TITULOTRAMITE.DbValue = ""
				Solicitudes_de_Certificados.COPIADIPLOMA.DbValue = ""
				Solicitudes_de_Certificados.CERTIFICADOS.DbValue = ""
				Solicitudes_de_Certificados.CORTESUPREMA.DbValue = ""
				Solicitudes_de_Certificados.EGRESO.DbValue = ""
				Solicitudes_de_Certificados.PLANESPROGRAM.DbValue = ""
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
				Solicitudes_de_Certificados.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Solicitudes_de_Certificados.StartGroup = StartGrp
				Else
					StartGrp = Solicitudes_de_Certificados.StartGroup
				End If
			Else
				StartGrp = Solicitudes_de_Certificados.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Solicitudes_de_Certificados.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Solicitudes_de_Certificados.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Solicitudes_de_Certificados.StartGroup = StartGrp
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
			Solicitudes_de_Certificados.StartGroup = StartGrp
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
				Solicitudes_de_Certificados.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Solicitudes_de_Certificados.StartGroup = StartGrp
			Else				
				If (Solicitudes_de_Certificados.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Solicitudes_de_Certificados.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Solicitudes_de_Certificados.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Solicitudes_de_Certificados.SqlSelectCount, Solicitudes_de_Certificados.SqlWhere, Solicitudes_de_Certificados.SqlGroupBy, Solicitudes_de_Certificados.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Solicitudes_de_Certificados.Row_Rendering()

			'
			' Render view codes
			'

			If (Solicitudes_de_Certificados.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' FECHAHORA
				Solicitudes_de_Certificados.FECHAHORA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.FECHAHORA.Summary)
				Solicitudes_de_Certificados.FECHAHORA.ViewValue = ew_FormatDateTime(Solicitudes_de_Certificados.FECHAHORA.ViewValue, 7)

				' NOMBRE
				Solicitudes_de_Certificados.NOMBRE.ViewValue = Convert.ToString(Solicitudes_de_Certificados.NOMBRE.Summary)

				' APELLIDOS
				Solicitudes_de_Certificados.APELLIDOS.ViewValue = Convert.ToString(Solicitudes_de_Certificados.APELLIDOS.Summary)

				' EMAIL
				Solicitudes_de_Certificados.EMAIL.ViewValue = Convert.ToString(Solicitudes_de_Certificados.EMAIL.Summary)

				' RUT
				Solicitudes_de_Certificados.RUT.ViewValue = Convert.ToString(Solicitudes_de_Certificados.RUT.Summary)

				' CURSO
				Solicitudes_de_Certificados.CURSO.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CURSO.Summary)

				' CARRERA
				Solicitudes_de_Certificados.CARRERA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CARRERA.Summary)

				' OBESERVACION
				Solicitudes_de_Certificados.OBESERVACION.ViewValue = Convert.ToString(Solicitudes_de_Certificados.OBESERVACION.Summary)

				' SEDERETIRO
				Solicitudes_de_Certificados.SEDERETIRO.ViewValue = Convert.ToString(Solicitudes_de_Certificados.SEDERETIRO.Summary)

				' DESTINATARIO
				Solicitudes_de_Certificados.DESTINATARIO.ViewValue = Convert.ToString(Solicitudes_de_Certificados.DESTINATARIO.Summary)

				' OTROPROGRAMA
				Solicitudes_de_Certificados.OTROPROGRAMA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.OTROPROGRAMA.Summary)

				' ASIGFAMILIAR
				Solicitudes_de_Certificados.ASIGFAMILIAR.ViewValue = Convert.ToString(Solicitudes_de_Certificados.ASIGFAMILIAR.Summary)

				' ALUMREGULAR
				Solicitudes_de_Certificados.ALUMREGULAR.ViewValue = Convert.ToString(Solicitudes_de_Certificados.ALUMREGULAR.Summary)

				' MATRICULA
				Solicitudes_de_Certificados.MATRICULA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.MATRICULA.Summary)

				' NOTAS
				Solicitudes_de_Certificados.NOTAS.ViewValue = Convert.ToString(Solicitudes_de_Certificados.NOTAS.Summary)

				' CONCENTNOTA
				Solicitudes_de_Certificados.CONCENTNOTA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CONCENTNOTA.Summary)

				' PLANES
				Solicitudes_de_Certificados.PLANES.ViewValue = Convert.ToString(Solicitudes_de_Certificados.PLANES.Summary)

				' TITULOTRAMITE
				Solicitudes_de_Certificados.TITULOTRAMITE.ViewValue = Convert.ToString(Solicitudes_de_Certificados.TITULOTRAMITE.Summary)

				' COPIADIPLOMA
				Solicitudes_de_Certificados.COPIADIPLOMA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.COPIADIPLOMA.Summary)

				' CERTIFICADOS
				Solicitudes_de_Certificados.CERTIFICADOS.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CERTIFICADOS.Summary)

				' CORTESUPREMA
				Solicitudes_de_Certificados.CORTESUPREMA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CORTESUPREMA.Summary)

				' EGRESO
				Solicitudes_de_Certificados.EGRESO.ViewValue = Convert.ToString(Solicitudes_de_Certificados.EGRESO.Summary)

				' PLANESPROGRAM
				Solicitudes_de_Certificados.PLANESPROGRAM.ViewValue = Convert.ToString(Solicitudes_de_Certificados.PLANESPROGRAM.Summary)
			Else

				' FECHAHORA
				Solicitudes_de_Certificados.FECHAHORA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.FECHAHORA.CurrentValue)
				Solicitudes_de_Certificados.FECHAHORA.ViewValue = ew_FormatDateTime(Solicitudes_de_Certificados.FECHAHORA.ViewValue, 7)
				Solicitudes_de_Certificados.FECHAHORA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Solicitudes_de_Certificados.NOMBRE.ViewValue = Convert.ToString(Solicitudes_de_Certificados.NOMBRE.CurrentValue)
				Solicitudes_de_Certificados.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' APELLIDOS
				Solicitudes_de_Certificados.APELLIDOS.ViewValue = Convert.ToString(Solicitudes_de_Certificados.APELLIDOS.CurrentValue)
				Solicitudes_de_Certificados.APELLIDOS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' EMAIL
				Solicitudes_de_Certificados.EMAIL.ViewValue = Convert.ToString(Solicitudes_de_Certificados.EMAIL.CurrentValue)
				Solicitudes_de_Certificados.EMAIL.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' RUT
				Solicitudes_de_Certificados.RUT.ViewValue = Convert.ToString(Solicitudes_de_Certificados.RUT.CurrentValue)
				Solicitudes_de_Certificados.RUT.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CURSO
				Solicitudes_de_Certificados.CURSO.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CURSO.CurrentValue)
				Solicitudes_de_Certificados.CURSO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CARRERA
				Solicitudes_de_Certificados.CARRERA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CARRERA.CurrentValue)
				Solicitudes_de_Certificados.CARRERA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' OBESERVACION
				Solicitudes_de_Certificados.OBESERVACION.ViewValue = Convert.ToString(Solicitudes_de_Certificados.OBESERVACION.CurrentValue)
				Solicitudes_de_Certificados.OBESERVACION.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' SEDERETIRO
				Solicitudes_de_Certificados.SEDERETIRO.ViewValue = Convert.ToString(Solicitudes_de_Certificados.SEDERETIRO.CurrentValue)
				Solicitudes_de_Certificados.SEDERETIRO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' DESTINATARIO
				Solicitudes_de_Certificados.DESTINATARIO.ViewValue = Convert.ToString(Solicitudes_de_Certificados.DESTINATARIO.CurrentValue)
				Solicitudes_de_Certificados.DESTINATARIO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' OTROPROGRAMA
				Solicitudes_de_Certificados.OTROPROGRAMA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.OTROPROGRAMA.CurrentValue)
				Solicitudes_de_Certificados.OTROPROGRAMA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ASIGFAMILIAR
				Solicitudes_de_Certificados.ASIGFAMILIAR.ViewValue = Convert.ToString(Solicitudes_de_Certificados.ASIGFAMILIAR.CurrentValue)
				Solicitudes_de_Certificados.ASIGFAMILIAR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' ALUMREGULAR
				Solicitudes_de_Certificados.ALUMREGULAR.ViewValue = Convert.ToString(Solicitudes_de_Certificados.ALUMREGULAR.CurrentValue)
				Solicitudes_de_Certificados.ALUMREGULAR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATRICULA
				Solicitudes_de_Certificados.MATRICULA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.MATRICULA.CurrentValue)
				Solicitudes_de_Certificados.MATRICULA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOTAS
				Solicitudes_de_Certificados.NOTAS.ViewValue = Convert.ToString(Solicitudes_de_Certificados.NOTAS.CurrentValue)
				Solicitudes_de_Certificados.NOTAS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CONCENTNOTA
				Solicitudes_de_Certificados.CONCENTNOTA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CONCENTNOTA.CurrentValue)
				Solicitudes_de_Certificados.CONCENTNOTA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PLANES
				Solicitudes_de_Certificados.PLANES.ViewValue = Convert.ToString(Solicitudes_de_Certificados.PLANES.CurrentValue)
				Solicitudes_de_Certificados.PLANES.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' TITULOTRAMITE
				Solicitudes_de_Certificados.TITULOTRAMITE.ViewValue = Convert.ToString(Solicitudes_de_Certificados.TITULOTRAMITE.CurrentValue)
				Solicitudes_de_Certificados.TITULOTRAMITE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' COPIADIPLOMA
				Solicitudes_de_Certificados.COPIADIPLOMA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.COPIADIPLOMA.CurrentValue)
				Solicitudes_de_Certificados.COPIADIPLOMA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CERTIFICADOS
				Solicitudes_de_Certificados.CERTIFICADOS.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CERTIFICADOS.CurrentValue)
				Solicitudes_de_Certificados.CERTIFICADOS.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CORTESUPREMA
				Solicitudes_de_Certificados.CORTESUPREMA.ViewValue = Convert.ToString(Solicitudes_de_Certificados.CORTESUPREMA.CurrentValue)
				Solicitudes_de_Certificados.CORTESUPREMA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' EGRESO
				Solicitudes_de_Certificados.EGRESO.ViewValue = Convert.ToString(Solicitudes_de_Certificados.EGRESO.CurrentValue)
				Solicitudes_de_Certificados.EGRESO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PLANESPROGRAM
				Solicitudes_de_Certificados.PLANESPROGRAM.ViewValue = Convert.ToString(Solicitudes_de_Certificados.PLANESPROGRAM.CurrentValue)
				Solicitudes_de_Certificados.PLANESPROGRAM.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' FECHAHORA
			Solicitudes_de_Certificados.FECHAHORA.HrefValue = ""

			' NOMBRE
			Solicitudes_de_Certificados.NOMBRE.HrefValue = ""

			' APELLIDOS
			Solicitudes_de_Certificados.APELLIDOS.HrefValue = ""

			' EMAIL
			Solicitudes_de_Certificados.EMAIL.HrefValue = ""

			' RUT
			Solicitudes_de_Certificados.RUT.HrefValue = ""

			' CURSO
			Solicitudes_de_Certificados.CURSO.HrefValue = ""

			' CARRERA
			Solicitudes_de_Certificados.CARRERA.HrefValue = ""

			' OBESERVACION
			Solicitudes_de_Certificados.OBESERVACION.HrefValue = ""

			' SEDERETIRO
			Solicitudes_de_Certificados.SEDERETIRO.HrefValue = ""

			' DESTINATARIO
			Solicitudes_de_Certificados.DESTINATARIO.HrefValue = ""

			' OTROPROGRAMA
			Solicitudes_de_Certificados.OTROPROGRAMA.HrefValue = ""

			' ASIGFAMILIAR
			Solicitudes_de_Certificados.ASIGFAMILIAR.HrefValue = ""

			' ALUMREGULAR
			Solicitudes_de_Certificados.ALUMREGULAR.HrefValue = ""

			' MATRICULA
			Solicitudes_de_Certificados.MATRICULA.HrefValue = ""

			' NOTAS
			Solicitudes_de_Certificados.NOTAS.HrefValue = ""

			' CONCENTNOTA
			Solicitudes_de_Certificados.CONCENTNOTA.HrefValue = ""

			' PLANES
			Solicitudes_de_Certificados.PLANES.HrefValue = ""

			' TITULOTRAMITE
			Solicitudes_de_Certificados.TITULOTRAMITE.HrefValue = ""

			' COPIADIPLOMA
			Solicitudes_de_Certificados.COPIADIPLOMA.HrefValue = ""

			' CERTIFICADOS
			Solicitudes_de_Certificados.CERTIFICADOS.HrefValue = ""

			' CORTESUPREMA
			Solicitudes_de_Certificados.CORTESUPREMA.HrefValue = ""

			' EGRESO
			Solicitudes_de_Certificados.EGRESO.HrefValue = ""

			' PLANESPROGRAM
			Solicitudes_de_Certificados.PLANESPROGRAM.HrefValue = ""

			' Call Row_Rendered event
			Solicitudes_de_Certificados.Row_Rendered()
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

			' Field CURSO
			sSelect = "SELECT DISTINCT [CURSO] FROM " + Solicitudes_de_Certificados.SqlFrom
			sOrderBy = "[CURSO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Solicitudes_de_Certificados.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Solicitudes_de_Certificados.CURSO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field CARRERA
			sSelect = "SELECT DISTINCT [CARRERA] FROM " + Solicitudes_de_Certificados.SqlFrom
			sOrderBy = "[CARRERA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Solicitudes_de_Certificados.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Solicitudes_de_Certificados.CARRERA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field SEDERETIRO
			sSelect = "SELECT DISTINCT [SEDERETIRO] FROM " + Solicitudes_de_Certificados.SqlFrom
			sOrderBy = "[SEDERETIRO] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Solicitudes_de_Certificados.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Solicitudes_de_Certificados.SEDERETIRO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field FECHAHORA
				SetSessionFilterValues(Solicitudes_de_Certificados.FECHAHORA)

				' Field APELLIDOS
				SetSessionFilterValues(Solicitudes_de_Certificados.APELLIDOS)

				' Field EMAIL
				SetSessionFilterValues(Solicitudes_de_Certificados.EMAIL)

				' Field RUT
				SetSessionFilterValues(Solicitudes_de_Certificados.RUT)

				' Field CURSO
				SetSessionDropDownValue(Solicitudes_de_Certificados.CURSO.DropDownValue, Solicitudes_de_Certificados.CURSO)

				' Field CARRERA
				SetSessionDropDownValue(Solicitudes_de_Certificados.CARRERA.DropDownValue, Solicitudes_de_Certificados.CARRERA)

				' Field SEDERETIRO
				SetSessionDropDownValue(Solicitudes_de_Certificados.SEDERETIRO.DropDownValue, Solicitudes_de_Certificados.SEDERETIRO)
			bSetupFilter = True ' Set up filter required
		Else

				' Field FECHAHORA
				If (GetFilterValues(Solicitudes_de_Certificados.FECHAHORA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field APELLIDOS
				If (GetFilterValues(Solicitudes_de_Certificados.APELLIDOS)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field EMAIL
				If (GetFilterValues(Solicitudes_de_Certificados.EMAIL)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field RUT
				If (GetFilterValues(Solicitudes_de_Certificados.RUT)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field CURSO
				If (GetDropDownValue(Solicitudes_de_Certificados.CURSO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Solicitudes_de_Certificados.CURSO.DropDownValue) Then
					If Not ew_SameStr(Solicitudes_de_Certificados.CURSO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Solicitudes_de_Certificados_CURSO") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field CARRERA
				If (GetDropDownValue(Solicitudes_de_Certificados.CARRERA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Solicitudes_de_Certificados.CARRERA.DropDownValue) Then
					If Not ew_SameStr(Solicitudes_de_Certificados.CARRERA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Solicitudes_de_Certificados_CARRERA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field SEDERETIRO
				If (GetDropDownValue(Solicitudes_de_Certificados.SEDERETIRO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Solicitudes_de_Certificados.SEDERETIRO.DropDownValue) Then
					If Not ew_SameStr(Solicitudes_de_Certificados.SEDERETIRO.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Solicitudes_de_Certificados_SEDERETIRO") Is Nothing Then
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

			' Field FECHAHORA
			GetSessionFilterValues(Solicitudes_de_Certificados.FECHAHORA)

			' Field APELLIDOS
			GetSessionFilterValues(Solicitudes_de_Certificados.APELLIDOS)

			' Field EMAIL
			GetSessionFilterValues(Solicitudes_de_Certificados.EMAIL)

			' Field RUT
			GetSessionFilterValues(Solicitudes_de_Certificados.RUT)

			' Field CURSO
			GetSessionDropDownValue(Solicitudes_de_Certificados.CURSO)

			' Field CARRERA
			GetSessionDropDownValue(Solicitudes_de_Certificados.CARRERA)

			' Field SEDERETIRO
			GetSessionDropDownValue(Solicitudes_de_Certificados.SEDERETIRO)
		End If

		' Call page filter validated event
		Solicitudes_de_Certificados.Page_FilterValidated()

		' Build SQL
		' Field FECHAHORA

		BuildExtendedFilter(Solicitudes_de_Certificados.FECHAHORA, sFilter)

		' Field APELLIDOS
		BuildExtendedFilter(Solicitudes_de_Certificados.APELLIDOS, sFilter)

		' Field EMAIL
		BuildExtendedFilter(Solicitudes_de_Certificados.EMAIL, sFilter)

		' Field RUT
		BuildExtendedFilter(Solicitudes_de_Certificados.RUT, sFilter)

		' Field CURSO
		BuildDropDownFilter(Solicitudes_de_Certificados.CURSO, sFilter, "")

		' Field CARRERA
		BuildDropDownFilter(Solicitudes_de_Certificados.CARRERA, sFilter, "")

		' Field SEDERETIRO
		BuildDropDownFilter(Solicitudes_de_Certificados.SEDERETIRO, sFilter, "")

		' Save parms to Session
		' Field FECHAHORA

		SetSessionFilterValues(Solicitudes_de_Certificados.FECHAHORA)

		' Field APELLIDOS
		SetSessionFilterValues(Solicitudes_de_Certificados.APELLIDOS)

		' Field EMAIL
		SetSessionFilterValues(Solicitudes_de_Certificados.EMAIL)

		' Field RUT
		SetSessionFilterValues(Solicitudes_de_Certificados.RUT)

		' Field CURSO
		SetSessionDropDownValue(Solicitudes_de_Certificados.CURSO.DropDownValue, Solicitudes_de_Certificados.CURSO)

		' Field CARRERA
		SetSessionDropDownValue(Solicitudes_de_Certificados.CARRERA.DropDownValue, Solicitudes_de_Certificados.CARRERA)

		' Field SEDERETIRO
		SetSessionDropDownValue(Solicitudes_de_Certificados.SEDERETIRO.DropDownValue, Solicitudes_de_Certificados.SEDERETIRO)

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
		If ew_Session("sv_Solicitudes_de_Certificados_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Solicitudes_de_Certificados_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Solicitudes_de_Certificados_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Solicitudes_de_Certificados_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Solicitudes_de_Certificados_" + parm)
		End If
		If ew_Session("so1_Solicitudes_de_Certificados_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Solicitudes_de_Certificados_" + parm))
		End If
		If ew_Session("sc_Solicitudes_de_Certificados_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Solicitudes_de_Certificados_" + parm))
		End If
		If ew_Session("sv2_Solicitudes_de_Certificados_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Solicitudes_de_Certificados_" + parm)
		End If
		If ew_Session("so2_Solicitudes_de_Certificados_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Solicitudes_de_Certificados_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Solicitudes_de_Certificados_" + parm) = fld.SearchValue
		ew_Session("so1_Solicitudes_de_Certificados_" + parm) = fld.SearchOperator
		ew_Session("sc_Solicitudes_de_Certificados_" + parm) = fld.SearchCondition
		ew_Session("sv2_Solicitudes_de_Certificados_" + parm) = fld.SearchValue2
		ew_Session("so2_Solicitudes_de_Certificados_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Solicitudes_de_Certificados_" + parm) = ""
		ew_Session("so1_Solicitudes_de_Certificados_" + parm) = "="
		ew_Session("sc_Solicitudes_de_Certificados_" + parm) = "AND"
		ew_Session("sv2_Solicitudes_de_Certificados_" + parm) = ""
		ew_Session("so2_Solicitudes_de_Certificados_" + parm) = "="
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
		If Not ewrpt_CheckEuroDate(Convert.ToString(Solicitudes_de_Certificados.FECHAHORA.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Solicitudes_de_Certificados.FECHAHORA.FldErrMsg()
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
		ew_Session("sel_Solicitudes_de_Certificados_" & parm) = ""
		ew_Session("rf_Solicitudes_de_Certificados_" & parm) = ""
		ew_Session("rt_Solicitudes_de_Certificados_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Solicitudes_de_Certificados.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Solicitudes_de_Certificados_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Solicitudes_de_Certificados_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Solicitudes_de_Certificados_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field CURSO

			Solicitudes_de_Certificados.CURSO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Solicitudes_de_Certificados.CURSO.DropDownValue = Solicitudes_de_Certificados.CURSO.DefaultDropDownValue

			' Field CARRERA
			Solicitudes_de_Certificados.CARRERA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Solicitudes_de_Certificados.CARRERA.DropDownValue = Solicitudes_de_Certificados.CARRERA.DefaultDropDownValue

			' Field SEDERETIRO
			Solicitudes_de_Certificados.SEDERETIRO.DefaultDropDownValue = EWRPT_INIT_VALUE
			Solicitudes_de_Certificados.SEDERETIRO.DropDownValue = Solicitudes_de_Certificados.SEDERETIRO.DefaultDropDownValue

		' Set up default values for extended filters
			' Field FECHAHORA

			SetDefaultExtFilter(Solicitudes_de_Certificados.FECHAHORA, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Solicitudes_de_Certificados.FECHAHORA)	

			' Field APELLIDOS
			SetDefaultExtFilter(Solicitudes_de_Certificados.APELLIDOS, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Solicitudes_de_Certificados.APELLIDOS)	

			' Field EMAIL
			SetDefaultExtFilter(Solicitudes_de_Certificados.EMAIL, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Solicitudes_de_Certificados.EMAIL)	

			' Field RUT
			SetDefaultExtFilter(Solicitudes_de_Certificados.RUT, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Solicitudes_de_Certificados.RUT)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check FECHAHORA extended filter
		If (TextFilterApplied(Solicitudes_de_Certificados.FECHAHORA)) Then bFilterExist = True

		' Check APELLIDOS extended filter
		If (TextFilterApplied(Solicitudes_de_Certificados.APELLIDOS)) Then bFilterExist = True

		' Check EMAIL extended filter
		If (TextFilterApplied(Solicitudes_de_Certificados.EMAIL)) Then bFilterExist = True

		' Check RUT extended filter
		If (TextFilterApplied(Solicitudes_de_Certificados.RUT)) Then bFilterExist = True

		' Check CURSO dropdown filter
		If (NonTextFilterApplied(Solicitudes_de_Certificados.CURSO)) Then bFilterExist = True

		' Check CARRERA dropdown filter
		If (NonTextFilterApplied(Solicitudes_de_Certificados.CARRERA)) Then bFilterExist = True

		' Check SEDERETIRO dropdown filter
		If (NonTextFilterApplied(Solicitudes_de_Certificados.SEDERETIRO)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field FECHAHORA
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Solicitudes_de_Certificados.FECHAHORA, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Solicitudes_de_Certificados.FECHAHORA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field APELLIDOS
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Solicitudes_de_Certificados.APELLIDOS, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Solicitudes_de_Certificados.APELLIDOS.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field EMAIL
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Solicitudes_de_Certificados.EMAIL, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Solicitudes_de_Certificados.EMAIL.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field RUT
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Solicitudes_de_Certificados.RUT, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Solicitudes_de_Certificados.RUT.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CURSO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Solicitudes_de_Certificados.CURSO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Solicitudes_de_Certificados.CURSO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CARRERA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Solicitudes_de_Certificados.CARRERA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Solicitudes_de_Certificados.CARRERA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field SEDERETIRO
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Solicitudes_de_Certificados.SEDERETIRO, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Solicitudes_de_Certificados.SEDERETIRO.FldCaption() & "<br>"
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
				Solicitudes_de_Certificados.OrderBy = ""
				Solicitudes_de_Certificados.StartGroup = 1
				Solicitudes_de_Certificados.FECHAHORA.Sort = ""
				Solicitudes_de_Certificados.NOMBRE.Sort = ""
				Solicitudes_de_Certificados.APELLIDOS.Sort = ""
				Solicitudes_de_Certificados.EMAIL.Sort = ""
				Solicitudes_de_Certificados.RUT.Sort = ""
				Solicitudes_de_Certificados.CURSO.Sort = ""
				Solicitudes_de_Certificados.CARRERA.Sort = ""
				Solicitudes_de_Certificados.OBESERVACION.Sort = ""
				Solicitudes_de_Certificados.SEDERETIRO.Sort = ""
				Solicitudes_de_Certificados.DESTINATARIO.Sort = ""
				Solicitudes_de_Certificados.OTROPROGRAMA.Sort = ""
				Solicitudes_de_Certificados.ASIGFAMILIAR.Sort = ""
				Solicitudes_de_Certificados.ALUMREGULAR.Sort = ""
				Solicitudes_de_Certificados.MATRICULA.Sort = ""
				Solicitudes_de_Certificados.NOTAS.Sort = ""
				Solicitudes_de_Certificados.CONCENTNOTA.Sort = ""
				Solicitudes_de_Certificados.PLANES.Sort = ""
				Solicitudes_de_Certificados.TITULOTRAMITE.Sort = ""
				Solicitudes_de_Certificados.COPIADIPLOMA.Sort = ""
				Solicitudes_de_Certificados.CERTIFICADOS.Sort = ""
				Solicitudes_de_Certificados.CORTESUPREMA.Sort = ""
				Solicitudes_de_Certificados.EGRESO.Sort = ""
				Solicitudes_de_Certificados.PLANESPROGRAM.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Solicitudes_de_Certificados.CurrentOrder = ew_Get("order")
			Solicitudes_de_Certificados.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Solicitudes_de_Certificados.SortSql()
			Solicitudes_de_Certificados.OrderBy = sSortSql
			Solicitudes_de_Certificados.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Solicitudes_de_Certificados.OrderBy)) Then
			Solicitudes_de_Certificados.OrderBy = "[APELLIDOS] ASC, [NOMBRE] ASC"
			Solicitudes_de_Certificados.APELLIDOS.Sort = "ASC"
			Solicitudes_de_Certificados.NOMBRE.Sort = "ASC"
		End If
		Return Solicitudes_de_Certificados.OrderBy
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
		Solicitudes_de_Certificados_summary = New crSolicitudes_de_Certificados_summary(Me)
		Solicitudes_de_Certificados_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Solicitudes_de_Certificados_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Solicitudes_de_Certificados_summary IsNot Nothing) Then Solicitudes_de_Certificados_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Solicitudes_de_Certificados.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Solicitudes_de_Certificados_summary = new ewrpt_Page("Solicitudes_de_Certificados_summary");
// page properties
Solicitudes_de_Certificados_summary.PageID = "summary"; // page ID
Solicitudes_de_Certificados_summary.FormID = "fSolicitudes_de_Certificadossummaryfilter"; // form ID
var EWRPT_PAGE_ID = Solicitudes_de_Certificados_summary.PageID;
// extend page with ValidateForm function
Solicitudes_de_Certificados_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_FECHAHORA;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Solicitudes_de_Certificados.FECHAHORA.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Solicitudes_de_Certificados_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Solicitudes_de_Certificados_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Solicitudes_de_Certificados_summary.ValidateRequired = false; // no JavaScript validation
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
<% Solicitudes_de_Certificados_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Solicitudes_de_Certificados.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Solicitudes_de_Certificados.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Solicitudes_de_Certificados.TableCaption() %></h1></div>
<% If (Solicitudes_de_Certificados.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Solicitudes_de_Certificados_summary.ExportExcelUrl %>"><img src="images/excel.png" title="Exportar a Excel" alt="Exportar a Excel" border="0" /></a>
<% If (Solicitudes_de_Certificados_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
</div><br><br>
<% Solicitudes_de_Certificados_summary.ShowMessage() %>
<% If (Solicitudes_de_Certificados.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Solicitudes_de_Certificados.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Solicitudes_de_Certificados.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Solicitudes_de_Certificados.FilterPanelOption = 2 OrElse (Solicitudes_de_Certificados.FilterPanelOption = 3 AndAlso Solicitudes_de_Certificados_summary.FilterApplied) OrElse Solicitudes_de_Certificados_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Solicitudes_de_Certificadossmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fSolicitudes_de_Certificadossummaryfilter" id="fSolicitudes_de_Certificadossummaryfilter" action="Solicitudes_de_Certificadossmry.aspx" class="ewForm" onsubmit="return Solicitudes_de_Certificados_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Solicitudes_de_Certificados.RUT.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Solicitudes_de_Certificados.FECHAHORA.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_FECHAHORA" id="sv1_FECHAHORA" value="<%= ew_HtmlEncode(Solicitudes_de_Certificados.FECHAHORA.SearchValue) %>"<%= IIf(Solicitudes_de_Certificados_summary.ClearExtFilter = "Solicitudes_de_Certificados_FECHAHORA", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv1_FECHAHORA" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv1_FECHAHORA", // ID of the input field
ifFormat : "%m/%d/%Y", // the date format
button : "csv1_FECHAHORA" // ID of the button
})
</script>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Solicitudes_de_Certificados.APELLIDOS.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_APELLIDOS" id="sv1_APELLIDOS" size="30" maxlength="100" value="<%= ew_HtmlEncode(Solicitudes_de_Certificados.APELLIDOS.SearchValue) %>"<%= IIf(Solicitudes_de_Certificados_summary.ClearExtFilter = "Solicitudes_de_Certificados_APELLIDOS", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Solicitudes_de_Certificados.EMAIL.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_EMAIL" id="sv1_EMAIL" size="30" maxlength="100" value="<%= ew_HtmlEncode(Solicitudes_de_Certificados.EMAIL.SearchValue) %>"<%= IIf(Solicitudes_de_Certificados_summary.ClearExtFilter = "Solicitudes_de_Certificados_EMAIL", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Solicitudes_de_Certificados.RUT.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="50" value="<%= ew_HtmlEncode(Solicitudes_de_Certificados.RUT.SearchValue) %>"<%= IIf(Solicitudes_de_Certificados_summary.ClearExtFilter = "Solicitudes_de_Certificados_RUT", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Solicitudes_de_Certificados.CURSO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CURSO" id="sv_CURSO"<%= IIf(Solicitudes_de_Certificados_summary.ClearExtFilter = "Solicitudes_de_Certificados_CURSO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Solicitudes_de_Certificados.CURSO.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Solicitudes_de_Certificados.CURSO.CustomFilters.Count + Solicitudes_de_Certificados.CURSO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Solicitudes_de_Certificados.CURSO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CURSO")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Solicitudes_de_Certificados.CURSO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Solicitudes_de_Certificados.CURSO.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Solicitudes_de_Certificados.CURSO.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Solicitudes_de_Certificados.CARRERA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CARRERA" id="sv_CARRERA"<%= IIf(Solicitudes_de_Certificados_summary.ClearExtFilter = "Solicitudes_de_Certificados_CARRERA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Solicitudes_de_Certificados.CARRERA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Solicitudes_de_Certificados.CARRERA.CustomFilters.Count + Solicitudes_de_Certificados.CARRERA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Solicitudes_de_Certificados.CARRERA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "CARRERA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Solicitudes_de_Certificados.CARRERA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Solicitudes_de_Certificados.CARRERA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Solicitudes_de_Certificados.CARRERA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Solicitudes_de_Certificados.SEDERETIRO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Solicitudes_de_Certificados.SEDERETIRO.CustomFilters.Count + Solicitudes_de_Certificados.SEDERETIRO.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Solicitudes_de_Certificados.SEDERETIRO.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "SEDERETIRO")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Solicitudes_de_Certificados.SEDERETIRO.DropDownValue" id="Solicitudes_de_Certificados.SEDERETIRO.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Solicitudes_de_Certificados.SEDERETIRO.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Solicitudes_de_Certificados.SEDERETIRO.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_SEDERETIRO" id="sv_SEDERETIRO" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Solicitudes_de_Certificados.SEDERETIRO.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
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
<% If (Solicitudes_de_Certificados.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Solicitudes_de_Certificados_summary.ShowFilterList() %>
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
If (Solicitudes_de_Certificados.ExportAll AndAlso ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then
	Solicitudes_de_Certificados_summary.StopGrp = Solicitudes_de_Certificados_summary.TotalGrps
Else
	Solicitudes_de_Certificados_summary.StopGrp = Solicitudes_de_Certificados_summary.StartGrp + Solicitudes_de_Certificados_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Solicitudes_de_Certificados_summary.StopGrp > Solicitudes_de_Certificados_summary.TotalGrps) Then
	Solicitudes_de_Certificados_summary.StopGrp = Solicitudes_de_Certificados_summary.TotalGrps
End If
Solicitudes_de_Certificados_summary.RecCount = 0

' Get first row
If (Solicitudes_de_Certificados_summary.TotalGrps > 0) Then
	Solicitudes_de_Certificados_summary.GetRow() ' ASPXRPT
	Solicitudes_de_Certificados_summary.GrpCount = 1
End If
While ((Solicitudes_de_Certificados_summary.HasRow AndAlso Solicitudes_de_Certificados_summary.GrpIndex < Solicitudes_de_Certificados_summary.StopGrp) OrElse Solicitudes_de_Certificados_summary.ShowFirstHeader)

	' Show header
	If (Solicitudes_de_Certificados_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.FECHAHORA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.FECHAHORA))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.FECHAHORA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.FECHAHORA) %>',0);"><%= Solicitudes_de_Certificados.FECHAHORA.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.FECHAHORA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.FECHAHORA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.NOMBRE) %>',0);"><%= Solicitudes_de_Certificados.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.APELLIDOS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.APELLIDOS))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.APELLIDOS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.APELLIDOS) %>',0);"><%= Solicitudes_de_Certificados.APELLIDOS.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.APELLIDOS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.APELLIDOS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.EMAIL.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.EMAIL))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.EMAIL.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.EMAIL) %>',0);"><%= Solicitudes_de_Certificados.EMAIL.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.EMAIL.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.EMAIL.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.RUT.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.RUT))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.RUT.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.RUT) %>',0);"><%= Solicitudes_de_Certificados.RUT.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.RUT.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.RUT.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.CURSO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CURSO))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.CURSO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CURSO) %>',0);"><%= Solicitudes_de_Certificados.CURSO.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.CURSO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.CURSO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.CARRERA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CARRERA))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.CARRERA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CARRERA) %>',0);"><%= Solicitudes_de_Certificados.CARRERA.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.CARRERA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.CARRERA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.OBESERVACION.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.OBESERVACION))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.OBESERVACION.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.OBESERVACION) %>',0);"><%= Solicitudes_de_Certificados.OBESERVACION.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.OBESERVACION.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.OBESERVACION.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.SEDERETIRO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.SEDERETIRO))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.SEDERETIRO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.SEDERETIRO) %>',0);"><%= Solicitudes_de_Certificados.SEDERETIRO.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.SEDERETIRO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.SEDERETIRO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.DESTINATARIO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.DESTINATARIO))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.DESTINATARIO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.DESTINATARIO) %>',0);"><%= Solicitudes_de_Certificados.DESTINATARIO.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.DESTINATARIO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.DESTINATARIO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.OTROPROGRAMA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.OTROPROGRAMA))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.OTROPROGRAMA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.OTROPROGRAMA) %>',0);"><%= Solicitudes_de_Certificados.OTROPROGRAMA.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.OTROPROGRAMA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.OTROPROGRAMA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.ASIGFAMILIAR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.ASIGFAMILIAR))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.ASIGFAMILIAR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.ASIGFAMILIAR) %>',0);"><%= Solicitudes_de_Certificados.ASIGFAMILIAR.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.ASIGFAMILIAR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.ASIGFAMILIAR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.ALUMREGULAR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.ALUMREGULAR))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.ALUMREGULAR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.ALUMREGULAR) %>',0);"><%= Solicitudes_de_Certificados.ALUMREGULAR.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.ALUMREGULAR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.ALUMREGULAR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.MATRICULA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.MATRICULA))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.MATRICULA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.MATRICULA) %>',0);"><%= Solicitudes_de_Certificados.MATRICULA.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.MATRICULA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.MATRICULA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.NOTAS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.NOTAS))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.NOTAS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.NOTAS) %>',0);"><%= Solicitudes_de_Certificados.NOTAS.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.NOTAS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.NOTAS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.CONCENTNOTA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CONCENTNOTA))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.CONCENTNOTA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CONCENTNOTA) %>',0);"><%= Solicitudes_de_Certificados.CONCENTNOTA.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.CONCENTNOTA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.CONCENTNOTA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.PLANES.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.PLANES))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.PLANES.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.PLANES) %>',0);"><%= Solicitudes_de_Certificados.PLANES.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.PLANES.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.PLANES.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.TITULOTRAMITE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.TITULOTRAMITE))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.TITULOTRAMITE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.TITULOTRAMITE) %>',0);"><%= Solicitudes_de_Certificados.TITULOTRAMITE.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.TITULOTRAMITE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.TITULOTRAMITE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.COPIADIPLOMA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.COPIADIPLOMA))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.COPIADIPLOMA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.COPIADIPLOMA) %>',0);"><%= Solicitudes_de_Certificados.COPIADIPLOMA.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.COPIADIPLOMA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.COPIADIPLOMA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.CERTIFICADOS.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CERTIFICADOS))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.CERTIFICADOS.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CERTIFICADOS) %>',0);"><%= Solicitudes_de_Certificados.CERTIFICADOS.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.CERTIFICADOS.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.CERTIFICADOS.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.CORTESUPREMA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CORTESUPREMA))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.CORTESUPREMA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.CORTESUPREMA) %>',0);"><%= Solicitudes_de_Certificados.CORTESUPREMA.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.CORTESUPREMA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.CORTESUPREMA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.EGRESO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.EGRESO))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.EGRESO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.EGRESO) %>',0);"><%= Solicitudes_de_Certificados.EGRESO.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.EGRESO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.EGRESO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Solicitudes_de_Certificados.Export)) Then %>
<%= Solicitudes_de_Certificados.PLANESPROGRAM.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.PLANESPROGRAM))) Then %>
		<td style="vertical-align: bottom;"><%= Solicitudes_de_Certificados.PLANESPROGRAM.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Solicitudes_de_Certificados.SortUrl(Solicitudes_de_Certificados.PLANESPROGRAM) %>',0);"><%= Solicitudes_de_Certificados.PLANESPROGRAM.FldCaption() %></td><td style="width: 10px;">
		<% If (Solicitudes_de_Certificados.PLANESPROGRAM.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Solicitudes_de_Certificados.PLANESPROGRAM.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Solicitudes_de_Certificados_summary.ShowFirstHeader = False
	End If
	Solicitudes_de_Certificados_summary.RecCount += 1

		' Render detail row
		Solicitudes_de_Certificados.ResetCSS()
		Solicitudes_de_Certificados.RowType = EWRPT_ROWTYPE_DETAIL
		Solicitudes_de_Certificados_summary.RenderRow()
%>
	<tr<%= Solicitudes_de_Certificados.RowAttributes() %>>
		<td<%= Solicitudes_de_Certificados.FECHAHORA.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.FECHAHORA.ViewAttributes%>><%= Solicitudes_de_Certificados.FECHAHORA.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.NOMBRE.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.NOMBRE.ViewAttributes%>><%= Solicitudes_de_Certificados.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.APELLIDOS.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.APELLIDOS.ViewAttributes%>><%= Solicitudes_de_Certificados.APELLIDOS.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.EMAIL.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.EMAIL.ViewAttributes%>><%= Solicitudes_de_Certificados.EMAIL.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.RUT.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.RUT.ViewAttributes%>><%= Solicitudes_de_Certificados.RUT.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.CURSO.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.CURSO.ViewAttributes%>><%= Solicitudes_de_Certificados.CURSO.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.CARRERA.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.CARRERA.ViewAttributes%>><%= Solicitudes_de_Certificados.CARRERA.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.OBESERVACION.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.OBESERVACION.ViewAttributes%>><%= Solicitudes_de_Certificados.OBESERVACION.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.SEDERETIRO.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.SEDERETIRO.ViewAttributes%>><%= Solicitudes_de_Certificados.SEDERETIRO.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.DESTINATARIO.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.DESTINATARIO.ViewAttributes%>><%= Solicitudes_de_Certificados.DESTINATARIO.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.OTROPROGRAMA.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.OTROPROGRAMA.ViewAttributes%>><%= Solicitudes_de_Certificados.OTROPROGRAMA.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.ASIGFAMILIAR.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.ASIGFAMILIAR.ViewAttributes%>><%= Solicitudes_de_Certificados.ASIGFAMILIAR.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.ALUMREGULAR.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.ALUMREGULAR.ViewAttributes%>><%= Solicitudes_de_Certificados.ALUMREGULAR.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.MATRICULA.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.MATRICULA.ViewAttributes%>><%= Solicitudes_de_Certificados.MATRICULA.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.NOTAS.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.NOTAS.ViewAttributes%>><%= Solicitudes_de_Certificados.NOTAS.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.CONCENTNOTA.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.CONCENTNOTA.ViewAttributes%>><%= Solicitudes_de_Certificados.CONCENTNOTA.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.PLANES.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.PLANES.ViewAttributes%>><%= Solicitudes_de_Certificados.PLANES.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.TITULOTRAMITE.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.TITULOTRAMITE.ViewAttributes%>><%= Solicitudes_de_Certificados.TITULOTRAMITE.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.COPIADIPLOMA.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.COPIADIPLOMA.ViewAttributes%>><%= Solicitudes_de_Certificados.COPIADIPLOMA.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.CERTIFICADOS.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.CERTIFICADOS.ViewAttributes%>><%= Solicitudes_de_Certificados.CERTIFICADOS.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.CORTESUPREMA.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.CORTESUPREMA.ViewAttributes%>><%= Solicitudes_de_Certificados.CORTESUPREMA.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.EGRESO.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.EGRESO.ViewAttributes%>><%= Solicitudes_de_Certificados.EGRESO.ListViewValue%></div>
</td>
		<td<%= Solicitudes_de_Certificados.PLANESPROGRAM.CellAttributes %>>
<div<%= Solicitudes_de_Certificados.PLANESPROGRAM.ViewAttributes%>><%= Solicitudes_de_Certificados.PLANESPROGRAM.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Solicitudes_de_Certificados_summary.AccumulateSummary()

		' Get next record
		Solicitudes_de_Certificados_summary.GetRow() ' ASPXRPT
		Solicitudes_de_Certificados_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Solicitudes_de_Certificados_summary.TotalGrps > 0) Then
	Solicitudes_de_Certificados.ResetCSS()
	Solicitudes_de_Certificados.RowType = EWRPT_ROWTYPE_TOTAL
	Solicitudes_de_Certificados.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Solicitudes_de_Certificados.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Solicitudes_de_Certificados.RowAttrs("class") = "ewRptGrandSummary"
	Solicitudes_de_Certificados_summary.RenderRow()
%>
	<!-- tr><td colspan="23"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Solicitudes_de_Certificados.RowAttributes() %>><td colspan="23"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Solicitudes_de_Certificados_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Solicitudes_de_Certificados.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Solicitudes_de_Certificados_summary.Pager Is Nothing Then Solicitudes_de_Certificados_summary.Pager = New cPrevNextPager(Solicitudes_de_Certificados_summary.StartGrp, Solicitudes_de_Certificados_summary.DisplayGrps, Solicitudes_de_Certificados_summary.TotalGrps) %>
<% If Solicitudes_de_Certificados_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Solicitudes_de_Certificados_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Solicitudes_de_Certificadossmry.aspx?start=<%= Solicitudes_de_Certificados_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Solicitudes_de_Certificados_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Solicitudes_de_Certificadossmry.aspx?start=<%= Solicitudes_de_Certificados_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Solicitudes_de_Certificados_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Solicitudes_de_Certificados_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Solicitudes_de_Certificadossmry.aspx?start=<%= Solicitudes_de_Certificados_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Solicitudes_de_Certificados_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Solicitudes_de_Certificadossmry.aspx?start=<%= Solicitudes_de_Certificados_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Solicitudes_de_Certificados_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Solicitudes_de_Certificados_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Solicitudes_de_Certificados_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Solicitudes_de_Certificados_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Solicitudes_de_Certificados_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Solicitudes_de_Certificados_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Solicitudes_de_Certificados_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Solicitudes_de_Certificados_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Solicitudes_de_Certificados_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Solicitudes_de_Certificados.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Solicitudes_de_Certificados.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Solicitudes_de_Certificados.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Solicitudes_de_Certificados_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Solicitudes_de_Certificados.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
