<%@ Page ClassName="Reporte_WebPaysmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public Reporte_WebPay As crReporte_WebPay = Nothing

	'
	' Table class (for Reporte WebPay)
	'
	Public Class crReporte_WebPay
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
				Return "Reporte_WebPay"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Reporte WebPay"
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

		Public NOMBRE As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public rut As crField

		Public codcli As crField

		Public CODCARR As crField

		Public NOMBRE_CARRERA As crField

		Public fecha As crField

		Public cuota As crField

		Public monto As crField

		Public estado As crField

		Public nro_pagare As crField

		Public n_operacion As crField

		Public oc As crField

		Public tbk_tipo_transaccion As crField

		Public tbk_monto As crField

		Public tbk_orden_compra As crField

		Public tbk_id_session As crField

		Public tbk_numero_tarjeta As crField

		Public tbk_fecha_transaccion As crField

		Public tbk_numero_cuotas As crField

		Public tbk_id_transaccion As crField

		Public tbk_hora_transaccion As crField

		Public Export As String = ""	' Export

		Public ExportAll As Boolean = False

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

			' NOMBRE
			NOMBRE = new crField("Reporte_WebPay", "Reporte WebPay", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Reporte_WebPay", "Reporte WebPay", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Reporte_WebPay", "Reporte WebPay", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' rut
			rut = new crField("Reporte_WebPay", "Reporte WebPay", "x_rut", "rut", "[rut]", 131, EWRPT_DATATYPE_NUMBER, -1)
			rut.Page = APage
			rut.ParentPage = APage.ParentPage
			rut.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("rut", rut)
			rut.DateFilter = ""
			rut.SqlSelect = ""
			rut.SqlOrderBy = ""

			' codcli
			codcli = new crField("Reporte_WebPay", "Reporte WebPay", "x_codcli", "codcli", "[codcli]", 200, EWRPT_DATATYPE_STRING, -1)
			codcli.Page = APage
			codcli.ParentPage = APage.ParentPage
			Fields.Add("codcli", codcli)
			codcli.DateFilter = ""
			codcli.SqlSelect = ""
			codcli.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Reporte_WebPay", "Reporte WebPay", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' NOMBRE_CARRERA
			NOMBRE_CARRERA = new crField("Reporte_WebPay", "Reporte WebPay", "x_NOMBRE_CARRERA", "NOMBRE_CARRERA", "[NOMBRE_CARRERA]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_CARRERA.Page = APage
			NOMBRE_CARRERA.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_CARRERA", NOMBRE_CARRERA)
			NOMBRE_CARRERA.DateFilter = ""
			NOMBRE_CARRERA.SqlSelect = ""
			NOMBRE_CARRERA.SqlOrderBy = ""

			' fecha
			fecha = new crField("Reporte_WebPay", "Reporte WebPay", "x_fecha", "fecha", "[fecha]", 135, EWRPT_DATATYPE_DATE, 7)
			fecha.Page = APage
			fecha.ParentPage = APage.ParentPage
			fecha.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("fecha", fecha)
			fecha.DateFilter = ""
			fecha.SqlSelect = ""
			fecha.SqlOrderBy = ""

			' cuota
			cuota = new crField("Reporte_WebPay", "Reporte WebPay", "x_cuota", "cuota", "[cuota]", 131, EWRPT_DATATYPE_NUMBER, -1)
			cuota.Page = APage
			cuota.ParentPage = APage.ParentPage
			cuota.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("cuota", cuota)
			cuota.DateFilter = ""
			cuota.SqlSelect = ""
			cuota.SqlOrderBy = ""

			' monto
			monto = new crField("Reporte_WebPay", "Reporte WebPay", "x_monto", "monto", "[monto]", 131, EWRPT_DATATYPE_NUMBER, -1)
			monto.Page = APage
			monto.ParentPage = APage.ParentPage
			monto.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("monto", monto)
			monto.DateFilter = ""
			monto.SqlSelect = ""
			monto.SqlOrderBy = ""

			' estado
			estado = new crField("Reporte_WebPay", "Reporte WebPay", "x_estado", "estado", "[estado]", 131, EWRPT_DATATYPE_NUMBER, -1)
			estado.Page = APage
			estado.ParentPage = APage.ParentPage
			estado.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("estado", estado)
			estado.DateFilter = ""
			estado.SqlSelect = ""
			estado.SqlOrderBy = ""

			' nro_pagare
			nro_pagare = new crField("Reporte_WebPay", "Reporte WebPay", "x_nro_pagare", "nro_pagare", "[nro_pagare]", 200, EWRPT_DATATYPE_STRING, -1)
			nro_pagare.Page = APage
			nro_pagare.ParentPage = APage.ParentPage
			Fields.Add("nro_pagare", nro_pagare)
			nro_pagare.DateFilter = ""
			nro_pagare.SqlSelect = ""
			nro_pagare.SqlOrderBy = ""

			' n_operacion
			n_operacion = new crField("Reporte_WebPay", "Reporte WebPay", "x_n_operacion", "n_operacion", "[n_operacion]", 200, EWRPT_DATATYPE_STRING, -1)
			n_operacion.Page = APage
			n_operacion.ParentPage = APage.ParentPage
			Fields.Add("n_operacion", n_operacion)
			n_operacion.DateFilter = ""
			n_operacion.SqlSelect = ""
			n_operacion.SqlOrderBy = ""

			' oc
			oc = new crField("Reporte_WebPay", "Reporte WebPay", "x_oc", "oc", "[oc]", 200, EWRPT_DATATYPE_STRING, -1)
			oc.Page = APage
			oc.ParentPage = APage.ParentPage
			Fields.Add("oc", oc)
			oc.DateFilter = ""
			oc.SqlSelect = ""
			oc.SqlOrderBy = ""

			' tbk_tipo_transaccion
			tbk_tipo_transaccion = new crField("Reporte_WebPay", "Reporte WebPay", "x_tbk_tipo_transaccion", "tbk_tipo_transaccion", "[tbk_tipo_transaccion]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_tipo_transaccion.Page = APage
			tbk_tipo_transaccion.ParentPage = APage.ParentPage
			Fields.Add("tbk_tipo_transaccion", tbk_tipo_transaccion)
			tbk_tipo_transaccion.DateFilter = ""
			tbk_tipo_transaccion.SqlSelect = ""
			tbk_tipo_transaccion.SqlOrderBy = ""

			' tbk_monto
			tbk_monto = new crField("Reporte_WebPay", "Reporte WebPay", "x_tbk_monto", "tbk_monto", "[tbk_monto]", 131, EWRPT_DATATYPE_NUMBER, -1)
			tbk_monto.Page = APage
			tbk_monto.ParentPage = APage.ParentPage
			tbk_monto.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("tbk_monto", tbk_monto)
			tbk_monto.DateFilter = ""
			tbk_monto.SqlSelect = ""
			tbk_monto.SqlOrderBy = ""

			' tbk_orden_compra
			tbk_orden_compra = new crField("Reporte_WebPay", "Reporte WebPay", "x_tbk_orden_compra", "tbk_orden_compra", "[tbk_orden_compra]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_orden_compra.Page = APage
			tbk_orden_compra.ParentPage = APage.ParentPage
			Fields.Add("tbk_orden_compra", tbk_orden_compra)
			tbk_orden_compra.DateFilter = ""
			tbk_orden_compra.SqlSelect = ""
			tbk_orden_compra.SqlOrderBy = ""

			' tbk_id_session
			tbk_id_session = new crField("Reporte_WebPay", "Reporte WebPay", "x_tbk_id_session", "tbk_id_session", "[tbk_id_session]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_id_session.Page = APage
			tbk_id_session.ParentPage = APage.ParentPage
			Fields.Add("tbk_id_session", tbk_id_session)
			tbk_id_session.DateFilter = ""
			tbk_id_session.SqlSelect = ""
			tbk_id_session.SqlOrderBy = ""

			' tbk_numero_tarjeta
			tbk_numero_tarjeta = new crField("Reporte_WebPay", "Reporte WebPay", "x_tbk_numero_tarjeta", "tbk_numero_tarjeta", "[tbk_numero_tarjeta]", 131, EWRPT_DATATYPE_NUMBER, -1)
			tbk_numero_tarjeta.Page = APage
			tbk_numero_tarjeta.ParentPage = APage.ParentPage
			tbk_numero_tarjeta.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("tbk_numero_tarjeta", tbk_numero_tarjeta)
			tbk_numero_tarjeta.DateFilter = ""
			tbk_numero_tarjeta.SqlSelect = ""
			tbk_numero_tarjeta.SqlOrderBy = ""

			' tbk_fecha_transaccion
			tbk_fecha_transaccion = new crField("Reporte_WebPay", "Reporte WebPay", "x_tbk_fecha_transaccion", "tbk_fecha_transaccion", "[tbk_fecha_transaccion]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_fecha_transaccion.Page = APage
			tbk_fecha_transaccion.ParentPage = APage.ParentPage
			Fields.Add("tbk_fecha_transaccion", tbk_fecha_transaccion)
			tbk_fecha_transaccion.DateFilter = ""
			tbk_fecha_transaccion.SqlSelect = ""
			tbk_fecha_transaccion.SqlOrderBy = ""

			' tbk_numero_cuotas
			tbk_numero_cuotas = new crField("Reporte_WebPay", "Reporte WebPay", "x_tbk_numero_cuotas", "tbk_numero_cuotas", "[tbk_numero_cuotas]", 131, EWRPT_DATATYPE_NUMBER, -1)
			tbk_numero_cuotas.Page = APage
			tbk_numero_cuotas.ParentPage = APage.ParentPage
			tbk_numero_cuotas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("tbk_numero_cuotas", tbk_numero_cuotas)
			tbk_numero_cuotas.DateFilter = ""
			tbk_numero_cuotas.SqlSelect = ""
			tbk_numero_cuotas.SqlOrderBy = ""

			' tbk_id_transaccion
			tbk_id_transaccion = new crField("Reporte_WebPay", "Reporte WebPay", "x_tbk_id_transaccion", "tbk_id_transaccion", "[tbk_id_transaccion]", 131, EWRPT_DATATYPE_NUMBER, -1)
			tbk_id_transaccion.Page = APage
			tbk_id_transaccion.ParentPage = APage.ParentPage
			tbk_id_transaccion.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("tbk_id_transaccion", tbk_id_transaccion)
			tbk_id_transaccion.DateFilter = ""
			tbk_id_transaccion.SqlSelect = ""
			tbk_id_transaccion.SqlOrderBy = ""

			' tbk_hora_transaccion
			tbk_hora_transaccion = new crField("Reporte_WebPay", "Reporte WebPay", "x_tbk_hora_transaccion", "tbk_hora_transaccion", "[tbk_hora_transaccion]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_hora_transaccion.Page = APage
			tbk_hora_transaccion.ParentPage = APage.ParentPage
			Fields.Add("tbk_hora_transaccion", tbk_hora_transaccion)
			tbk_hora_transaccion.DateFilter = ""
			tbk_hora_transaccion.SqlSelect = ""
			tbk_hora_transaccion.SqlOrderBy = ""
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
				Return "[SEK_detalle_webpay]"
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
	Public Reporte_WebPay_summary As crReporte_WebPay_summary

	'
	' Page class
	'
	Public Class crReporte_WebPay_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Reporte_WebPay.UseTokenInUrl) Then
				sUrl &= "t=" & Reporte_WebPay.TableVar & "&" ' Add page token
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
			If (Reporte_WebPay.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Reporte_WebPay.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Reporte_WebPay.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Reporte_WebPaysmry 
			Get
				Return CType(m_ParentPage, Reporte_WebPaysmry)
			End Get
		End Property

		' Table object (Reporte_WebPay)
		Public Property Reporte_WebPay As crReporte_WebPay 
			Get		
				Return AspNetPage.Reporte_WebPay ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crReporte_WebPay)
				AspNetPage.Reporte_WebPay = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Reporte_WebPay_summary"
			m_PageObjTypeName = "crReporte_WebPay_summary"

			' Table name
			m_TableName = "Reporte WebPay"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Reporte_WebPay)
			Reporte_WebPay = New crReporte_WebPay(Me)			

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
				Reporte_WebPay.Export = ew_Get("export")
			End If
			gsExport = Reporte_WebPay.Export ' Get export parameter, used in header
			gsExportFile = Reporte_WebPay.TableVar ' Get export file, used in header
			If (Reporte_WebPay.Export = "excel") Then
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
			Reporte_WebPay.CustomFilters_Load()

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
			Dim sSql As String = ewrpt_BuildReportSql(Reporte_WebPay.SqlSelect, Reporte_WebPay.SqlWhere, Reporte_WebPay.SqlGroupBy, Reporte_WebPay.SqlHaving, Reporte_WebPay.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Reporte_WebPay.ExportAll AndAlso ew_NotEmpty(Reporte_WebPay.Export)) Then
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
				Reporte_WebPay.oc.DbValue = Row("oc")
				Reporte_WebPay.cuota.DbValue = Row("cuota")
				Reporte_WebPay.monto.DbValue = Row("monto")
				Reporte_WebPay.rut.DbValue = Row("rut")
				Reporte_WebPay.fecha.DbValue = Row("fecha")
				Reporte_WebPay.estado.DbValue = Row("estado")
				Reporte_WebPay.tbk_tipo_transaccion.DbValue = Row("tbk_tipo_transaccion")
				Reporte_WebPay.tbk_monto.DbValue = Row("tbk_monto")
				Reporte_WebPay.tbk_orden_compra.DbValue = Row("tbk_orden_compra")
				Reporte_WebPay.tbk_id_session.DbValue = Row("tbk_id_session")
				Reporte_WebPay.tbk_numero_tarjeta.DbValue = Row("tbk_numero_tarjeta")
				Reporte_WebPay.tbk_fecha_transaccion.DbValue = Row("tbk_fecha_transaccion")
				Reporte_WebPay.tbk_numero_cuotas.DbValue = Row("tbk_numero_cuotas")
				Reporte_WebPay.tbk_id_transaccion.DbValue = Row("tbk_id_transaccion")
				Reporte_WebPay.tbk_hora_transaccion.DbValue = Row("tbk_hora_transaccion")
				Reporte_WebPay.nro_pagare.DbValue = Row("nro_pagare")
				Reporte_WebPay.n_operacion.DbValue = Row("n_operacion")
				Reporte_WebPay.codcli.DbValue = Row("codcli")
				Reporte_WebPay.PATERNO.DbValue = Row("PATERNO")
				Reporte_WebPay.MATERNO.DbValue = Row("MATERNO")
				Reporte_WebPay.NOMBRE.DbValue = Row("NOMBRE")
				Reporte_WebPay.CODCARR.DbValue = Row("CODCARR")
				Reporte_WebPay.NOMBRE_CARRERA.DbValue = Row("NOMBRE_CARRERA")
				Val(1) = Reporte_WebPay.NOMBRE.CurrentValue
				Val(2) = Reporte_WebPay.PATERNO.CurrentValue
				Val(3) = Reporte_WebPay.MATERNO.CurrentValue
				Val(4) = Reporte_WebPay.rut.CurrentValue
				Val(5) = Reporte_WebPay.codcli.CurrentValue
				Val(6) = Reporte_WebPay.CODCARR.CurrentValue
				Val(7) = Reporte_WebPay.NOMBRE_CARRERA.CurrentValue
				Val(8) = Reporte_WebPay.fecha.CurrentValue
				Val(9) = Reporte_WebPay.cuota.CurrentValue
				Val(10) = Reporte_WebPay.monto.CurrentValue
				Val(11) = Reporte_WebPay.estado.CurrentValue
				Val(12) = Reporte_WebPay.nro_pagare.CurrentValue
				Val(13) = Reporte_WebPay.n_operacion.CurrentValue
				Val(14) = Reporte_WebPay.oc.CurrentValue
				Val(15) = Reporte_WebPay.tbk_tipo_transaccion.CurrentValue
				Val(16) = Reporte_WebPay.tbk_monto.CurrentValue
				Val(17) = Reporte_WebPay.tbk_orden_compra.CurrentValue
				Val(18) = Reporte_WebPay.tbk_id_session.CurrentValue
				Val(19) = Reporte_WebPay.tbk_numero_tarjeta.CurrentValue
				Val(20) = Reporte_WebPay.tbk_fecha_transaccion.CurrentValue
				Val(21) = Reporte_WebPay.tbk_numero_cuotas.CurrentValue
				Val(22) = Reporte_WebPay.tbk_id_transaccion.CurrentValue
				Val(23) = Reporte_WebPay.tbk_hora_transaccion.CurrentValue
			Else
				Reporte_WebPay.oc.DbValue = ""
				Reporte_WebPay.cuota.DbValue = ""
				Reporte_WebPay.monto.DbValue = ""
				Reporte_WebPay.rut.DbValue = ""
				Reporte_WebPay.fecha.DbValue = ""
				Reporte_WebPay.estado.DbValue = ""
				Reporte_WebPay.tbk_tipo_transaccion.DbValue = ""
				Reporte_WebPay.tbk_monto.DbValue = ""
				Reporte_WebPay.tbk_orden_compra.DbValue = ""
				Reporte_WebPay.tbk_id_session.DbValue = ""
				Reporte_WebPay.tbk_numero_tarjeta.DbValue = ""
				Reporte_WebPay.tbk_fecha_transaccion.DbValue = ""
				Reporte_WebPay.tbk_numero_cuotas.DbValue = ""
				Reporte_WebPay.tbk_id_transaccion.DbValue = ""
				Reporte_WebPay.tbk_hora_transaccion.DbValue = ""
				Reporte_WebPay.nro_pagare.DbValue = ""
				Reporte_WebPay.n_operacion.DbValue = ""
				Reporte_WebPay.codcli.DbValue = ""
				Reporte_WebPay.PATERNO.DbValue = ""
				Reporte_WebPay.MATERNO.DbValue = ""
				Reporte_WebPay.NOMBRE.DbValue = ""
				Reporte_WebPay.CODCARR.DbValue = ""
				Reporte_WebPay.NOMBRE_CARRERA.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Reporte_WebPay.oc.DbValue = dr("oc")
				Reporte_WebPay.cuota.DbValue = dr("cuota")
				Reporte_WebPay.monto.DbValue = dr("monto")
				Reporte_WebPay.rut.DbValue = dr("rut")
				Reporte_WebPay.fecha.DbValue = dr("fecha")
				Reporte_WebPay.estado.DbValue = dr("estado")
				Reporte_WebPay.tbk_tipo_transaccion.DbValue = dr("tbk_tipo_transaccion")
				Reporte_WebPay.tbk_monto.DbValue = dr("tbk_monto")
				Reporte_WebPay.tbk_orden_compra.DbValue = dr("tbk_orden_compra")
				Reporte_WebPay.tbk_id_session.DbValue = dr("tbk_id_session")
				Reporte_WebPay.tbk_numero_tarjeta.DbValue = dr("tbk_numero_tarjeta")
				Reporte_WebPay.tbk_fecha_transaccion.DbValue = dr("tbk_fecha_transaccion")
				Reporte_WebPay.tbk_numero_cuotas.DbValue = dr("tbk_numero_cuotas")
				Reporte_WebPay.tbk_id_transaccion.DbValue = dr("tbk_id_transaccion")
				Reporte_WebPay.tbk_hora_transaccion.DbValue = dr("tbk_hora_transaccion")
				Reporte_WebPay.nro_pagare.DbValue = dr("nro_pagare")
				Reporte_WebPay.n_operacion.DbValue = dr("n_operacion")
				Reporte_WebPay.codcli.DbValue = dr("codcli")
				Reporte_WebPay.PATERNO.DbValue = dr("PATERNO")
				Reporte_WebPay.MATERNO.DbValue = dr("MATERNO")
				Reporte_WebPay.NOMBRE.DbValue = dr("NOMBRE")
				Reporte_WebPay.CODCARR.DbValue = dr("CODCARR")
				Reporte_WebPay.NOMBRE_CARRERA.DbValue = dr("NOMBRE_CARRERA")
				Val(1) = Reporte_WebPay.NOMBRE.CurrentValue
				Val(2) = Reporte_WebPay.PATERNO.CurrentValue
				Val(3) = Reporte_WebPay.MATERNO.CurrentValue
				Val(4) = Reporte_WebPay.rut.CurrentValue
				Val(5) = Reporte_WebPay.codcli.CurrentValue
				Val(6) = Reporte_WebPay.CODCARR.CurrentValue
				Val(7) = Reporte_WebPay.NOMBRE_CARRERA.CurrentValue
				Val(8) = Reporte_WebPay.fecha.CurrentValue
				Val(9) = Reporte_WebPay.cuota.CurrentValue
				Val(10) = Reporte_WebPay.monto.CurrentValue
				Val(11) = Reporte_WebPay.estado.CurrentValue
				Val(12) = Reporte_WebPay.nro_pagare.CurrentValue
				Val(13) = Reporte_WebPay.n_operacion.CurrentValue
				Val(14) = Reporte_WebPay.oc.CurrentValue
				Val(15) = Reporte_WebPay.tbk_tipo_transaccion.CurrentValue
				Val(16) = Reporte_WebPay.tbk_monto.CurrentValue
				Val(17) = Reporte_WebPay.tbk_orden_compra.CurrentValue
				Val(18) = Reporte_WebPay.tbk_id_session.CurrentValue
				Val(19) = Reporte_WebPay.tbk_numero_tarjeta.CurrentValue
				Val(20) = Reporte_WebPay.tbk_fecha_transaccion.CurrentValue
				Val(21) = Reporte_WebPay.tbk_numero_cuotas.CurrentValue
				Val(22) = Reporte_WebPay.tbk_id_transaccion.CurrentValue
				Val(23) = Reporte_WebPay.tbk_hora_transaccion.CurrentValue
			Else				
				Reporte_WebPay.oc.DbValue = ""
				Reporte_WebPay.cuota.DbValue = ""
				Reporte_WebPay.monto.DbValue = ""
				Reporte_WebPay.rut.DbValue = ""
				Reporte_WebPay.fecha.DbValue = ""
				Reporte_WebPay.estado.DbValue = ""
				Reporte_WebPay.tbk_tipo_transaccion.DbValue = ""
				Reporte_WebPay.tbk_monto.DbValue = ""
				Reporte_WebPay.tbk_orden_compra.DbValue = ""
				Reporte_WebPay.tbk_id_session.DbValue = ""
				Reporte_WebPay.tbk_numero_tarjeta.DbValue = ""
				Reporte_WebPay.tbk_fecha_transaccion.DbValue = ""
				Reporte_WebPay.tbk_numero_cuotas.DbValue = ""
				Reporte_WebPay.tbk_id_transaccion.DbValue = ""
				Reporte_WebPay.tbk_hora_transaccion.DbValue = ""
				Reporte_WebPay.nro_pagare.DbValue = ""
				Reporte_WebPay.n_operacion.DbValue = ""
				Reporte_WebPay.codcli.DbValue = ""
				Reporte_WebPay.PATERNO.DbValue = ""
				Reporte_WebPay.MATERNO.DbValue = ""
				Reporte_WebPay.NOMBRE.DbValue = ""
				Reporte_WebPay.CODCARR.DbValue = ""
				Reporte_WebPay.NOMBRE_CARRERA.DbValue = ""
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
				Reporte_WebPay.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Reporte_WebPay.StartGroup = StartGrp
				Else
					StartGrp = Reporte_WebPay.StartGroup
				End If
			Else
				StartGrp = Reporte_WebPay.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Reporte_WebPay.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Reporte_WebPay.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Reporte_WebPay.StartGroup = StartGrp
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
			Reporte_WebPay.StartGroup = StartGrp
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
				Reporte_WebPay.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Reporte_WebPay.StartGroup = StartGrp
			Else				
				If (Reporte_WebPay.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Reporte_WebPay.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 20 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Reporte_WebPay.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Reporte_WebPay.SqlSelectCount, Reporte_WebPay.SqlWhere, Reporte_WebPay.SqlGroupBy, Reporte_WebPay.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Reporte_WebPay.Row_Rendering()

			'
			' Render view codes
			'

			If (Reporte_WebPay.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' NOMBRE
				Reporte_WebPay.NOMBRE.ViewValue = Convert.ToString(Reporte_WebPay.NOMBRE.Summary)

				' PATERNO
				Reporte_WebPay.PATERNO.ViewValue = Convert.ToString(Reporte_WebPay.PATERNO.Summary)

				' MATERNO
				Reporte_WebPay.MATERNO.ViewValue = Convert.ToString(Reporte_WebPay.MATERNO.Summary)

				' rut
				Reporte_WebPay.rut.ViewValue = Convert.ToString(Reporte_WebPay.rut.Summary)

				' codcli
				Reporte_WebPay.codcli.ViewValue = Convert.ToString(Reporte_WebPay.codcli.Summary)

				' CODCARR
				Reporte_WebPay.CODCARR.ViewValue = Convert.ToString(Reporte_WebPay.CODCARR.Summary)

				' NOMBRE_CARRERA
				Reporte_WebPay.NOMBRE_CARRERA.ViewValue = Convert.ToString(Reporte_WebPay.NOMBRE_CARRERA.Summary)

				' fecha
				Reporte_WebPay.fecha.ViewValue = Convert.ToString(Reporte_WebPay.fecha.Summary)
				Reporte_WebPay.fecha.ViewValue = ew_FormatDateTime(Reporte_WebPay.fecha.ViewValue, 7)

				' cuota
				Reporte_WebPay.cuota.ViewValue = Convert.ToString(Reporte_WebPay.cuota.Summary)

				' monto
				Reporte_WebPay.monto.ViewValue = Convert.ToString(Reporte_WebPay.monto.Summary)

				' estado
				Reporte_WebPay.estado.ViewValue = Convert.ToString(Reporte_WebPay.estado.Summary)

				' nro_pagare
				Reporte_WebPay.nro_pagare.ViewValue = Convert.ToString(Reporte_WebPay.nro_pagare.Summary)

				' n_operacion
				Reporte_WebPay.n_operacion.ViewValue = Convert.ToString(Reporte_WebPay.n_operacion.Summary)

				' oc
				Reporte_WebPay.oc.ViewValue = Convert.ToString(Reporte_WebPay.oc.Summary)

				' tbk_tipo_transaccion
				Reporte_WebPay.tbk_tipo_transaccion.ViewValue = Convert.ToString(Reporte_WebPay.tbk_tipo_transaccion.Summary)

				' tbk_monto
				Reporte_WebPay.tbk_monto.ViewValue = Convert.ToString(Reporte_WebPay.tbk_monto.Summary)

				' tbk_orden_compra
				Reporte_WebPay.tbk_orden_compra.ViewValue = Convert.ToString(Reporte_WebPay.tbk_orden_compra.Summary)

				' tbk_id_session
				Reporte_WebPay.tbk_id_session.ViewValue = Convert.ToString(Reporte_WebPay.tbk_id_session.Summary)

				' tbk_numero_tarjeta
				Reporte_WebPay.tbk_numero_tarjeta.ViewValue = Convert.ToString(Reporte_WebPay.tbk_numero_tarjeta.Summary)

				' tbk_fecha_transaccion
				Reporte_WebPay.tbk_fecha_transaccion.ViewValue = Convert.ToString(Reporte_WebPay.tbk_fecha_transaccion.Summary)

				' tbk_numero_cuotas
				Reporte_WebPay.tbk_numero_cuotas.ViewValue = Convert.ToString(Reporte_WebPay.tbk_numero_cuotas.Summary)

				' tbk_id_transaccion
				Reporte_WebPay.tbk_id_transaccion.ViewValue = Convert.ToString(Reporte_WebPay.tbk_id_transaccion.Summary)

				' tbk_hora_transaccion
				Reporte_WebPay.tbk_hora_transaccion.ViewValue = Convert.ToString(Reporte_WebPay.tbk_hora_transaccion.Summary)
			Else

				' NOMBRE
				Reporte_WebPay.NOMBRE.ViewValue = Convert.ToString(Reporte_WebPay.NOMBRE.CurrentValue)
				Reporte_WebPay.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Reporte_WebPay.PATERNO.ViewValue = Convert.ToString(Reporte_WebPay.PATERNO.CurrentValue)
				Reporte_WebPay.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Reporte_WebPay.MATERNO.ViewValue = Convert.ToString(Reporte_WebPay.MATERNO.CurrentValue)
				Reporte_WebPay.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' rut
				Reporte_WebPay.rut.ViewValue = Convert.ToString(Reporte_WebPay.rut.CurrentValue)
				Reporte_WebPay.rut.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' codcli
				Reporte_WebPay.codcli.ViewValue = Convert.ToString(Reporte_WebPay.codcli.CurrentValue)
				Reporte_WebPay.codcli.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Reporte_WebPay.CODCARR.ViewValue = Convert.ToString(Reporte_WebPay.CODCARR.CurrentValue)
				Reporte_WebPay.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_CARRERA
				Reporte_WebPay.NOMBRE_CARRERA.ViewValue = Convert.ToString(Reporte_WebPay.NOMBRE_CARRERA.CurrentValue)
				Reporte_WebPay.NOMBRE_CARRERA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' fecha
				Reporte_WebPay.fecha.ViewValue = Convert.ToString(Reporte_WebPay.fecha.CurrentValue)
				Reporte_WebPay.fecha.ViewValue = ew_FormatDateTime(Reporte_WebPay.fecha.ViewValue, 7)
				Reporte_WebPay.fecha.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' cuota
				Reporte_WebPay.cuota.ViewValue = Convert.ToString(Reporte_WebPay.cuota.CurrentValue)
				Reporte_WebPay.cuota.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' monto
				Reporte_WebPay.monto.ViewValue = Convert.ToString(Reporte_WebPay.monto.CurrentValue)
				Reporte_WebPay.monto.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' estado
				Reporte_WebPay.estado.ViewValue = Convert.ToString(Reporte_WebPay.estado.CurrentValue)
				Reporte_WebPay.estado.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' nro_pagare
				Reporte_WebPay.nro_pagare.ViewValue = Convert.ToString(Reporte_WebPay.nro_pagare.CurrentValue)
				Reporte_WebPay.nro_pagare.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' n_operacion
				Reporte_WebPay.n_operacion.ViewValue = Convert.ToString(Reporte_WebPay.n_operacion.CurrentValue)
				Reporte_WebPay.n_operacion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' oc
				Reporte_WebPay.oc.ViewValue = Convert.ToString(Reporte_WebPay.oc.CurrentValue)
				Reporte_WebPay.oc.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_tipo_transaccion
				Reporte_WebPay.tbk_tipo_transaccion.ViewValue = Convert.ToString(Reporte_WebPay.tbk_tipo_transaccion.CurrentValue)
				Reporte_WebPay.tbk_tipo_transaccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_monto
				Reporte_WebPay.tbk_monto.ViewValue = Convert.ToString(Reporte_WebPay.tbk_monto.CurrentValue)
				Reporte_WebPay.tbk_monto.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_orden_compra
				Reporte_WebPay.tbk_orden_compra.ViewValue = Convert.ToString(Reporte_WebPay.tbk_orden_compra.CurrentValue)
				Reporte_WebPay.tbk_orden_compra.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_id_session
				Reporte_WebPay.tbk_id_session.ViewValue = Convert.ToString(Reporte_WebPay.tbk_id_session.CurrentValue)
				Reporte_WebPay.tbk_id_session.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_numero_tarjeta
				Reporte_WebPay.tbk_numero_tarjeta.ViewValue = Convert.ToString(Reporte_WebPay.tbk_numero_tarjeta.CurrentValue)
				Reporte_WebPay.tbk_numero_tarjeta.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_fecha_transaccion
				Reporte_WebPay.tbk_fecha_transaccion.ViewValue = Convert.ToString(Reporte_WebPay.tbk_fecha_transaccion.CurrentValue)
				Reporte_WebPay.tbk_fecha_transaccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_numero_cuotas
				Reporte_WebPay.tbk_numero_cuotas.ViewValue = Convert.ToString(Reporte_WebPay.tbk_numero_cuotas.CurrentValue)
				Reporte_WebPay.tbk_numero_cuotas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_id_transaccion
				Reporte_WebPay.tbk_id_transaccion.ViewValue = Convert.ToString(Reporte_WebPay.tbk_id_transaccion.CurrentValue)
				Reporte_WebPay.tbk_id_transaccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_hora_transaccion
				Reporte_WebPay.tbk_hora_transaccion.ViewValue = Convert.ToString(Reporte_WebPay.tbk_hora_transaccion.CurrentValue)
				Reporte_WebPay.tbk_hora_transaccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' NOMBRE
			Reporte_WebPay.NOMBRE.HrefValue = ""

			' PATERNO
			Reporte_WebPay.PATERNO.HrefValue = ""

			' MATERNO
			Reporte_WebPay.MATERNO.HrefValue = ""

			' rut
			Reporte_WebPay.rut.HrefValue = ""

			' codcli
			Reporte_WebPay.codcli.HrefValue = ""

			' CODCARR
			Reporte_WebPay.CODCARR.HrefValue = ""

			' NOMBRE_CARRERA
			Reporte_WebPay.NOMBRE_CARRERA.HrefValue = ""

			' fecha
			Reporte_WebPay.fecha.HrefValue = ""

			' cuota
			Reporte_WebPay.cuota.HrefValue = ""

			' monto
			Reporte_WebPay.monto.HrefValue = ""

			' estado
			Reporte_WebPay.estado.HrefValue = ""

			' nro_pagare
			Reporte_WebPay.nro_pagare.HrefValue = ""

			' n_operacion
			Reporte_WebPay.n_operacion.HrefValue = ""

			' oc
			Reporte_WebPay.oc.HrefValue = ""

			' tbk_tipo_transaccion
			Reporte_WebPay.tbk_tipo_transaccion.HrefValue = ""

			' tbk_monto
			Reporte_WebPay.tbk_monto.HrefValue = ""

			' tbk_orden_compra
			Reporte_WebPay.tbk_orden_compra.HrefValue = ""

			' tbk_id_session
			Reporte_WebPay.tbk_id_session.HrefValue = ""

			' tbk_numero_tarjeta
			Reporte_WebPay.tbk_numero_tarjeta.HrefValue = ""

			' tbk_fecha_transaccion
			Reporte_WebPay.tbk_fecha_transaccion.HrefValue = ""

			' tbk_numero_cuotas
			Reporte_WebPay.tbk_numero_cuotas.HrefValue = ""

			' tbk_id_transaccion
			Reporte_WebPay.tbk_id_transaccion.HrefValue = ""

			' tbk_hora_transaccion
			Reporte_WebPay.tbk_hora_transaccion.HrefValue = ""

			' Call Row_Rendered event
			Reporte_WebPay.Row_Rendered()
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

			' Field NOMBRE_CARRERA
			sSelect = "SELECT DISTINCT [NOMBRE_CARRERA] FROM " + Reporte_WebPay.SqlFrom
			sOrderBy = "[NOMBRE_CARRERA] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reporte_WebPay.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reporte_WebPay.NOMBRE_CARRERA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)

			' Field estado
			sSelect = "SELECT DISTINCT [estado] FROM " + Reporte_WebPay.SqlFrom
			sOrderBy = "[estado] ASC"
			wrkSql = ewrpt_BuildReportSql(sSelect, Reporte_WebPay.SqlWhere, "", "", sOrderBy, UserIDFilter, "")
			Reporte_WebPay.estado.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql)
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

				' Field PATERNO
				SetSessionFilterValues(Reporte_WebPay.PATERNO)

				' Field MATERNO
				SetSessionFilterValues(Reporte_WebPay.MATERNO)

				' Field rut
				SetSessionFilterValues(Reporte_WebPay.rut)

				' Field codcli
				SetSessionFilterValues(Reporte_WebPay.codcli)

				' Field CODCARR
				SetSessionFilterValues(Reporte_WebPay.CODCARR)

				' Field NOMBRE_CARRERA
				SetSessionDropDownValue(Reporte_WebPay.NOMBRE_CARRERA.DropDownValue, Reporte_WebPay.NOMBRE_CARRERA)

				' Field fecha
				SetSessionFilterValues(Reporte_WebPay.fecha)

				' Field estado
				SetSessionDropDownValue(Reporte_WebPay.estado.DropDownValue, Reporte_WebPay.estado)

				' Field n_operacion
				SetSessionFilterValues(Reporte_WebPay.n_operacion)

				' Field oc
				SetSessionFilterValues(Reporte_WebPay.oc)
			bSetupFilter = True ' Set up filter required
		Else

				' Field PATERNO
				If (GetFilterValues(Reporte_WebPay.PATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field MATERNO
				If (GetFilterValues(Reporte_WebPay.MATERNO)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field rut
				If (GetFilterValues(Reporte_WebPay.rut)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field codcli
				If (GetFilterValues(Reporte_WebPay.codcli)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field CODCARR
				If (GetFilterValues(Reporte_WebPay.CODCARR)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field NOMBRE_CARRERA
				If (GetDropDownValue(Reporte_WebPay.NOMBRE_CARRERA)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reporte_WebPay.NOMBRE_CARRERA.DropDownValue) Then
					If Not ew_SameStr(Reporte_WebPay.NOMBRE_CARRERA.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reporte_WebPay_NOMBRE_CARRERA") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field fecha
				If (GetFilterValues(Reporte_WebPay.fecha)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field estado
				If (GetDropDownValue(Reporte_WebPay.estado)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				ElseIf Not ew_IsArrayList(Reporte_WebPay.estado.DropDownValue) Then
					If Not ew_SameStr(Reporte_WebPay.estado.DropDownValue, EWRPT_INIT_VALUE) AndAlso ew_Session("sv_Reporte_WebPay_estado") Is Nothing Then
						bSetupFilter = True ' Set up filter required
					End If
				End If

				' Field n_operacion
				If (GetFilterValues(Reporte_WebPay.n_operacion)) Then
					bSetupFilter = True ' Set up filter required
					bRestoreSession = False ' Do not restore from session
				End If

				' Field oc
				If (GetFilterValues(Reporte_WebPay.oc)) Then
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

			' Field PATERNO
			GetSessionFilterValues(Reporte_WebPay.PATERNO)

			' Field MATERNO
			GetSessionFilterValues(Reporte_WebPay.MATERNO)

			' Field rut
			GetSessionFilterValues(Reporte_WebPay.rut)

			' Field codcli
			GetSessionFilterValues(Reporte_WebPay.codcli)

			' Field CODCARR
			GetSessionFilterValues(Reporte_WebPay.CODCARR)

			' Field NOMBRE_CARRERA
			GetSessionDropDownValue(Reporte_WebPay.NOMBRE_CARRERA)

			' Field fecha
			GetSessionFilterValues(Reporte_WebPay.fecha)

			' Field estado
			GetSessionDropDownValue(Reporte_WebPay.estado)

			' Field n_operacion
			GetSessionFilterValues(Reporte_WebPay.n_operacion)

			' Field oc
			GetSessionFilterValues(Reporte_WebPay.oc)
		End If

		' Call page filter validated event
		Reporte_WebPay.Page_FilterValidated()

		' Build SQL
		' Field PATERNO

		BuildExtendedFilter(Reporte_WebPay.PATERNO, sFilter)

		' Field MATERNO
		BuildExtendedFilter(Reporte_WebPay.MATERNO, sFilter)

		' Field rut
		BuildExtendedFilter(Reporte_WebPay.rut, sFilter)

		' Field codcli
		BuildExtendedFilter(Reporte_WebPay.codcli, sFilter)

		' Field CODCARR
		BuildExtendedFilter(Reporte_WebPay.CODCARR, sFilter)

		' Field NOMBRE_CARRERA
		BuildDropDownFilter(Reporte_WebPay.NOMBRE_CARRERA, sFilter, "")

		' Field fecha
		BuildExtendedFilter(Reporte_WebPay.fecha, sFilter)

		' Field estado
		BuildDropDownFilter(Reporte_WebPay.estado, sFilter, "")

		' Field n_operacion
		BuildExtendedFilter(Reporte_WebPay.n_operacion, sFilter)

		' Field oc
		BuildExtendedFilter(Reporte_WebPay.oc, sFilter)

		' Save parms to Session
		' Field PATERNO

		SetSessionFilterValues(Reporte_WebPay.PATERNO)

		' Field MATERNO
		SetSessionFilterValues(Reporte_WebPay.MATERNO)

		' Field rut
		SetSessionFilterValues(Reporte_WebPay.rut)

		' Field codcli
		SetSessionFilterValues(Reporte_WebPay.codcli)

		' Field CODCARR
		SetSessionFilterValues(Reporte_WebPay.CODCARR)

		' Field NOMBRE_CARRERA
		SetSessionDropDownValue(Reporte_WebPay.NOMBRE_CARRERA.DropDownValue, Reporte_WebPay.NOMBRE_CARRERA)

		' Field fecha
		SetSessionFilterValues(Reporte_WebPay.fecha)

		' Field estado
		SetSessionDropDownValue(Reporte_WebPay.estado.DropDownValue, Reporte_WebPay.estado)

		' Field n_operacion
		SetSessionFilterValues(Reporte_WebPay.n_operacion)

		' Field oc
		SetSessionFilterValues(Reporte_WebPay.oc)

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
		If ew_Session("sv_Reporte_WebPay_" + parm) IsNot Nothing Then
			fld.DropDownValue = ew_Session("sv_Reporte_WebPay_" + parm)
		End If
	End Sub

	' Set dropdown value to Session 
	Public Sub SetSessionDropDownValue(ByVal sv As Object, ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv_Reporte_WebPay_" + parm) = sv
	End Sub

	' Get filter values from Session 
	Public Sub GetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		If ew_Session("sv1_Reporte_WebPay_" + parm) IsNot Nothing Then
			fld.SearchValue = ew_Session("sv1_Reporte_WebPay_" + parm)
		End If
		If ew_Session("so1_Reporte_WebPay_" + parm) IsNot Nothing Then
			fld.SearchOperator = Convert.ToString(ew_Session("so1_Reporte_WebPay_" + parm))
		End If
		If ew_Session("sc_Reporte_WebPay_" + parm) IsNot Nothing Then
			fld.SearchCondition = Convert.ToString(ew_Session("sc_Reporte_WebPay_" + parm))
		End If
		If ew_Session("sv2_Reporte_WebPay_" + parm) IsNot Nothing Then
			fld.SearchValue2 = ew_Session("sv2_Reporte_WebPay_" + parm)
		End If
		If ew_Session("so2_Reporte_WebPay_" + parm) IsNot Nothing Then
			fld.SearchOperator2 = Convert.ToString(ew_Session("so2_Reporte_WebPay_" + parm))
		End If
	End Sub

	' Set filter values to Session		
	Public Sub SetSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Reporte_WebPay_" + parm) = fld.SearchValue
		ew_Session("so1_Reporte_WebPay_" + parm) = fld.SearchOperator
		ew_Session("sc_Reporte_WebPay_" + parm) = fld.SearchCondition
		ew_Session("sv2_Reporte_WebPay_" + parm) = fld.SearchValue2
		ew_Session("so2_Reporte_WebPay_" + parm) = fld.SearchOperator2
	End Sub

	' Clear filter values from Session		
	Public Sub ClearSessionFilterValues(ByRef fld As crField)
		Dim parm As String = fld.FldVar.Substring(2)
		ew_Session("sv1_Reporte_WebPay_" + parm) = ""
		ew_Session("so1_Reporte_WebPay_" + parm) = "="
		ew_Session("sc_Reporte_WebPay_" + parm) = "AND"
		ew_Session("sv2_Reporte_WebPay_" + parm) = ""
		ew_Session("so2_Reporte_WebPay_" + parm) = "="
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
		If Not ewrpt_CheckNumber(Convert.ToString(Reporte_WebPay.rut.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Reporte_WebPay.rut.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Reporte_WebPay.fecha.SearchValue)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Reporte_WebPay.fecha.FldErrMsg()
		End If
		If Not ewrpt_CheckEuroDate(Convert.ToString(Reporte_WebPay.fecha.SearchValue2)) Then
			If ew_NotEmpty(gsFormError) Then gsFormError &= "<br>"
			gsFormError &= Reporte_WebPay.fecha.FldErrMsg()
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
		ew_Session("sel_Reporte_WebPay_" & parm) = ""
		ew_Session("rf_Reporte_WebPay_" & parm) = ""
		ew_Session("rt_Reporte_WebPay_" & parm) = ""
	End Sub

	' Load selection from session
	Public Sub LoadSelectionFromSession(parm As String)
		Dim fld As crField = Reporte_WebPay.Fields(parm)
		fld.SelectionList = CType(ew_Session("sel_Reporte_WebPay_" & parm), String())
		fld.RangeFrom = Convert.ToString(ew_Session("rf_Reporte_WebPay_" & parm))
		fld.RangeTo = Convert.ToString(ew_Session("rt_Reporte_WebPay_" & parm))
	End Sub		

	' Load default value for filters
	Public Sub LoadDefaultFilters()	
		Dim sWrk As String
	  Dim sSql As String 

		' Set up default values for dropdown filters
			' Field NOMBRE_CARRERA

			Reporte_WebPay.NOMBRE_CARRERA.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reporte_WebPay.NOMBRE_CARRERA.DropDownValue = Reporte_WebPay.NOMBRE_CARRERA.DefaultDropDownValue

			' Field estado
			Reporte_WebPay.estado.DefaultDropDownValue = EWRPT_INIT_VALUE
			Reporte_WebPay.estado.DropDownValue = Reporte_WebPay.estado.DefaultDropDownValue

		' Set up default values for extended filters
			' Field PATERNO

			SetDefaultExtFilter(Reporte_WebPay.PATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_WebPay.PATERNO)	

			' Field MATERNO
			SetDefaultExtFilter(Reporte_WebPay.MATERNO, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_WebPay.MATERNO)	

			' Field rut
			SetDefaultExtFilter(Reporte_WebPay.rut, "=", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_WebPay.rut)	

			' Field codcli
			SetDefaultExtFilter(Reporte_WebPay.codcli, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_WebPay.codcli)	

			' Field CODCARR
			SetDefaultExtFilter(Reporte_WebPay.CODCARR, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_WebPay.CODCARR)	

			' Field fecha
			SetDefaultExtFilter(Reporte_WebPay.fecha, "BETWEEN", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_WebPay.fecha)	

			' Field n_operacion
			SetDefaultExtFilter(Reporte_WebPay.n_operacion, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_WebPay.n_operacion)	

			' Field oc
			SetDefaultExtFilter(Reporte_WebPay.oc, "LIKE", Nothing, "AND", "=", Nothing)
			ApplyDefaultExtFilter(Reporte_WebPay.oc)	

		' Set up default values for popup filters
		' - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Public Function CheckFilter() As Boolean
	  Dim bFilterExist As Boolean = False

		' Check PATERNO extended filter
		If (TextFilterApplied(Reporte_WebPay.PATERNO)) Then bFilterExist = True

		' Check MATERNO extended filter
		If (TextFilterApplied(Reporte_WebPay.MATERNO)) Then bFilterExist = True

		' Check rut extended filter
		If (TextFilterApplied(Reporte_WebPay.rut)) Then bFilterExist = True

		' Check codcli extended filter
		If (TextFilterApplied(Reporte_WebPay.codcli)) Then bFilterExist = True

		' Check CODCARR extended filter
		If (TextFilterApplied(Reporte_WebPay.CODCARR)) Then bFilterExist = True

		' Check NOMBRE_CARRERA dropdown filter
		If (NonTextFilterApplied(Reporte_WebPay.NOMBRE_CARRERA)) Then bFilterExist = True

		' Check fecha extended filter
		If (TextFilterApplied(Reporte_WebPay.fecha)) Then bFilterExist = True

		' Check estado dropdown filter
		If (NonTextFilterApplied(Reporte_WebPay.estado)) Then bFilterExist = True

		' Check n_operacion extended filter
		If (TextFilterApplied(Reporte_WebPay.n_operacion)) Then bFilterExist = True

		' Check oc extended filter
		If (TextFilterApplied(Reporte_WebPay.oc)) Then bFilterExist = True
		Return bFilterExist
	End Function	

	' Show list of filters
	Public Sub ShowFilterList()
		Dim sFilterList As String = ""
	  Dim sExtWrk As String
	  Dim sWrk As String

		' Field PATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_WebPay.PATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.PATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATERNO
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_WebPay.MATERNO, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.MATERNO.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field rut
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_WebPay.rut, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.rut.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field codcli
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_WebPay.codcli, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.codcli.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CODCARR
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_WebPay.CODCARR, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.CODCARR.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_CARRERA
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reporte_WebPay.NOMBRE_CARRERA, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.NOMBRE_CARRERA.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field fecha
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_WebPay.fecha, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.fecha.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field estado
		sExtWrk = ""
		sWrk = ""
		BuildDropDownFilter(Reporte_WebPay.estado, sExtWrk, "")
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.estado.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field n_operacion
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_WebPay.n_operacion, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.n_operacion.FldCaption() & "<br>"
		If (ew_NotEmpty(sExtWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If (ew_NotEmpty(sWrk)) Then sFilterList &= "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field oc
		sExtWrk = ""
		sWrk = ""
		BuildExtendedFilter(Reporte_WebPay.oc, sExtWrk)
		If (ew_NotEmpty(sExtWrk) OrElse ew_NotEmpty(sWrk)) Then sFilterList &= Reporte_WebPay.oc.FldCaption() & "<br>"
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
				Reporte_WebPay.OrderBy = ""
				Reporte_WebPay.StartGroup = 1
				Reporte_WebPay.NOMBRE.Sort = ""
				Reporte_WebPay.PATERNO.Sort = ""
				Reporte_WebPay.MATERNO.Sort = ""
				Reporte_WebPay.rut.Sort = ""
				Reporte_WebPay.codcli.Sort = ""
				Reporte_WebPay.CODCARR.Sort = ""
				Reporte_WebPay.NOMBRE_CARRERA.Sort = ""
				Reporte_WebPay.fecha.Sort = ""
				Reporte_WebPay.cuota.Sort = ""
				Reporte_WebPay.monto.Sort = ""
				Reporte_WebPay.estado.Sort = ""
				Reporte_WebPay.nro_pagare.Sort = ""
				Reporte_WebPay.n_operacion.Sort = ""
				Reporte_WebPay.oc.Sort = ""
				Reporte_WebPay.tbk_tipo_transaccion.Sort = ""
				Reporte_WebPay.tbk_monto.Sort = ""
				Reporte_WebPay.tbk_orden_compra.Sort = ""
				Reporte_WebPay.tbk_id_session.Sort = ""
				Reporte_WebPay.tbk_numero_tarjeta.Sort = ""
				Reporte_WebPay.tbk_fecha_transaccion.Sort = ""
				Reporte_WebPay.tbk_numero_cuotas.Sort = ""
				Reporte_WebPay.tbk_id_transaccion.Sort = ""
				Reporte_WebPay.tbk_hora_transaccion.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Reporte_WebPay.CurrentOrder = ew_Get("order")
			Reporte_WebPay.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Reporte_WebPay.SortSql()
			Reporte_WebPay.OrderBy = sSortSql
			Reporte_WebPay.StartGroup = 1
		End If

		' Set up default sort
		If (ew_Empty(Reporte_WebPay.OrderBy)) Then
			Reporte_WebPay.OrderBy = "[PATERNO] ASC, [MATERNO] ASC"
			Reporte_WebPay.PATERNO.Sort = "ASC"
			Reporte_WebPay.MATERNO.Sort = "ASC"
		End If
		Return Reporte_WebPay.OrderBy
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
		Reporte_WebPay_summary = New crReporte_WebPay_summary(Me)
		Reporte_WebPay_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Reporte_WebPay_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Reporte_WebPay_summary IsNot Nothing) Then Reporte_WebPay_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Reporte_WebPay.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">
// Create page object
var Reporte_WebPay_summary = new ewrpt_Page("Reporte_WebPay_summary");
// page properties
Reporte_WebPay_summary.PageID = "summary"; // page ID
Reporte_WebPay_summary.FormID = "fReporte_WebPaysummaryfilter"; // form ID
var EWRPT_PAGE_ID = Reporte_WebPay_summary.PageID;
// extend page with ValidateForm function
Reporte_WebPay_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_rut;
if (elm && !ewrpt_CheckNumber(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Reporte_WebPay.rut.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv1_fecha;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Reporte_WebPay.fecha.FldErrMsg()) %>"))
		return false;
}
	var elm = fobj.sv2_fecha;
if (elm && !ewrpt_CheckEuroDate(elm.value)) {
	if (!ewrpt_OnError(elm, "<%= ew_JsEncode2(Reporte_WebPay.fecha.FldErrMsg()) %>"))
		return false;
}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Reporte_WebPay_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If (EWRPT_CLIENT_VALIDATE) Then %>
Reporte_WebPay_summary.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Reporte_WebPay_summary.ValidateRequired = false; // no JavaScript validation
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
<% Reporte_WebPay_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Reporte_WebPay.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Reporte_WebPay.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline"><h1><%= Reporte_WebPay.TableCaption() %></h1></div>
<% If (Reporte_WebPay.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Reporte_WebPay_summary.ExportExcelUrl %>"><img src="images/excel.png" title="Exportar a Excel" alt ="Exportar a Excel" border="0" /></a>
<% If (Reporte_WebPay_summary.FilterApplied) Then %>
&nbsp;&nbsp;
<% End If %>
<% End If %>
<br><br>
<% Reporte_WebPay_summary.ShowMessage() %>
<% If (Reporte_WebPay.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Reporte_WebPay.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<p>
  <% If (Reporte_WebPay.Export = "") Then %>
  <%
Dim sButtonImage As String, sDivDisplay As String
If (Reporte_WebPay.FilterPanelOption = 2 OrElse (Reporte_WebPay.FilterPanelOption = 3 AndAlso Reporte_WebPay_summary.FilterApplied) OrElse Reporte_WebPay_summary.Filter = "0=101") Then
	sButtonImage = "aspxrptimages/collapse.gif"
	sDivDisplay = ""
Else 
	sButtonImage = "aspxrptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
  <a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span></p>
<p><a href="Reporte_WebPaysmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a><br><br>
</p>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
  <!-- Search form (begin) -->
  <form name="fReporte_WebPaysummaryfilter" id="fReporte_WebPaysummaryfilter" action="Reporte_WebPaysmry.aspx" class="ewForm" onsubmit="return Reporte_WebPay_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

' Popup Filter
Dim cntf As Integer = Reporte_WebPay.oc.CustomFilters.Count
Dim totcnt As Integer, wrkcnt As Integer
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.PATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Reporte_WebPay.PATERNO.SearchValue) %>"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_PATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.MATERNO.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Reporte_WebPay.MATERNO.SearchValue) %>"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_MATERNO", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.rut.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_rut" id="sv1_rut" size="30" value="<%= ew_HtmlEncode(Reporte_WebPay.rut.SearchValue) %>"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_rut", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.codcli.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_codcli" id="sv1_codcli" size="30" maxlength="100" value="<%= ew_HtmlEncode(Reporte_WebPay.codcli.SearchValue) %>"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_codcli", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.CODCARR.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODCARR" id="sv1_CODCARR" size="30" maxlength="30" value="<%= ew_HtmlEncode(Reporte_WebPay.CODCARR.SearchValue) %>"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_CODCARR", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.NOMBRE_CARRERA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_CARRERA" id="sv_NOMBRE_CARRERA"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_NOMBRE_CARRERA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If (ewrpt_MatchedFilterValue(Reporte_WebPay.NOMBRE_CARRERA.DropDownValue, EWRPT_ALL_VALUE)) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filters
totcnt = Reporte_WebPay.NOMBRE_CARRERA.CustomFilters.Count + Reporte_WebPay.NOMBRE_CARRERA.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reporte_WebPay.NOMBRE_CARRERA.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "NOMBRE_CARRERA")) Then		
%>
		<option value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reporte_WebPay.NOMBRE_CARRERA.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" selected=""selected""") %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reporte_WebPay.NOMBRE_CARRERA.DropDownList		
%>
		<option value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reporte_WebPay.NOMBRE_CARRERA.DropDownValue, value)) Then Response.Write(" selected=""selected""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt += 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.fecha.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("BETWEEN") %><input type="hidden" name="so1_fecha" id="so1_fecha" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_fecha" id="sv1_fecha" value="<%= ew_HtmlEncode(Reporte_WebPay.fecha.SearchValue) %>"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_fecha", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv1_fecha" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv1_fecha", // ID of the input field
ifFormat : "%m/%d/%Y", // the date format
button : "csv1_fecha" // ID of the button
})
</script>
</span></td>
				<td></td>
					<td><span class="ewRptSearchOpr" id="btw1_fecha" name="btw1_fecha">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
					<td><span class="aspnetreportmaker" id="btw1_fecha" name="btw1_fecha">
<input type="text" name="sv2_fecha" id="sv2_fecha" value="<%= ew_HtmlEncode(Reporte_WebPay.fecha.SearchValue2) %>"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_fecha", " class=""ewInputCleared""", "") %>>
<img src="aspxrptimages/calendar.png" id="csv2_fecha" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
inputField : "sv2_fecha", // ID of the input field
ifFormat : "%m/%d/%Y", // the date format
button : "csv2_fecha" // ID of the button
})
</script>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.estado.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filters
totcnt = Reporte_WebPay.estado.CustomFilters.Count + Reporte_WebPay.estado.DropDownList.Count
wrkcnt = 0

' Custom filters
For Each CustomFilter As crCustomFilter In Reporte_WebPay.estado.CustomFilters
	If (ew_SameStr(CustomFilter.FldName, "estado")) Then		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Reporte_WebPay.estado.DropDownValue" id="Reporte_WebPay.estado.DropDownValue" value="<%= "@@" & CustomFilter.FilterName %>"<% If (ewrpt_MatchedFilterValue(Reporte_WebPay.estado.DropDownValue, "@@" & CustomFilter.FilterName)) Then Response.Write(" checked=""checked""") %>><%= CustomFilter.DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
	End If
Next
For Each value As Object In Reporte_WebPay.estado.DropDownList		
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_estado" id="sv_estado" value="<%= value %>"<% If (ewrpt_MatchedFilterValue(Reporte_WebPay.estado.DropDownValue, value)) Then Response.Write(" checked=""checked""") %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
		wrkcnt += 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.n_operacion.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_n_operacion" id="sv1_n_operacion" size="30" maxlength="100" value="<%= ew_HtmlEncode(Reporte_WebPay.n_operacion.SearchValue) %>"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_n_operacion", " class=""ewInputCleared""", "") %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Reporte_WebPay.oc.FldCaption() %></span></td>
		<td>&nbsp;</td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_oc" id="sv1_oc" size="30" maxlength="200" value="<%= ew_HtmlEncode(Reporte_WebPay.oc.SearchValue) %>"<%= IIf(Reporte_WebPay_summary.ClearExtFilter = "Reporte_WebPay_oc", " class=""ewInputCleared""", "") %>>
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
<% If (Reporte_WebPay.ShowCurrentFilter) Then %>
<div id="ewrptFilterList">
<% Reporte_WebPay_summary.ShowFilterList() %>
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
If (Reporte_WebPay.ExportAll AndAlso ew_NotEmpty(Reporte_WebPay.Export)) Then
	Reporte_WebPay_summary.StopGrp = Reporte_WebPay_summary.TotalGrps
Else
	Reporte_WebPay_summary.StopGrp = Reporte_WebPay_summary.StartGrp + Reporte_WebPay_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Reporte_WebPay_summary.StopGrp > Reporte_WebPay_summary.TotalGrps) Then
	Reporte_WebPay_summary.StopGrp = Reporte_WebPay_summary.TotalGrps
End If
Reporte_WebPay_summary.RecCount = 0

' Get first row
If (Reporte_WebPay_summary.TotalGrps > 0) Then
	Reporte_WebPay_summary.GetRow() ' ASPXRPT
	Reporte_WebPay_summary.GrpCount = 1
End If
While ((Reporte_WebPay_summary.HasRow AndAlso Reporte_WebPay_summary.GrpIndex < Reporte_WebPay_summary.StopGrp) OrElse Reporte_WebPay_summary.ShowFirstHeader)

	' Show header
	If (Reporte_WebPay_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.NOMBRE) %>',0);"><%= Reporte_WebPay.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.PATERNO) %>',0);"><%= Reporte_WebPay.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.MATERNO) %>',0);"><%= Reporte_WebPay.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.rut.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.rut))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.rut.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.rut) %>',0);"><%= Reporte_WebPay.rut.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.rut.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.rut.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.codcli.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.codcli))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.codcli.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.codcli) %>',0);"><%= Reporte_WebPay.codcli.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.codcli.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.codcli.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.CODCARR) %>',0);"><%= Reporte_WebPay.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.NOMBRE_CARRERA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.NOMBRE_CARRERA))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.NOMBRE_CARRERA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.NOMBRE_CARRERA) %>',0);"><%= Reporte_WebPay.NOMBRE_CARRERA.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.NOMBRE_CARRERA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.NOMBRE_CARRERA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.fecha.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.fecha))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.fecha.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.fecha) %>',0);"><%= Reporte_WebPay.fecha.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.fecha.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.fecha.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.cuota.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.cuota))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.cuota.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.cuota) %>',0);"><%= Reporte_WebPay.cuota.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.cuota.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.cuota.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.monto.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.monto))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.monto.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.monto) %>',0);"><%= Reporte_WebPay.monto.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.monto.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.monto.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.estado.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.estado))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.estado.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.estado) %>',0);"><%= Reporte_WebPay.estado.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.estado.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.estado.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.nro_pagare.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.nro_pagare))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.nro_pagare.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.nro_pagare) %>',0);"><%= Reporte_WebPay.nro_pagare.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.nro_pagare.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.nro_pagare.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.n_operacion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.n_operacion))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.n_operacion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.n_operacion) %>',0);"><%= Reporte_WebPay.n_operacion.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.n_operacion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.n_operacion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.oc.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.oc))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.oc.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.oc) %>',0);"><%= Reporte_WebPay.oc.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.oc.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.oc.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.tbk_tipo_transaccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_tipo_transaccion))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.tbk_tipo_transaccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_tipo_transaccion) %>',0);"><%= Reporte_WebPay.tbk_tipo_transaccion.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.tbk_tipo_transaccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.tbk_tipo_transaccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.tbk_monto.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_monto))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.tbk_monto.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_monto) %>',0);"><%= Reporte_WebPay.tbk_monto.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.tbk_monto.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.tbk_monto.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.tbk_orden_compra.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_orden_compra))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.tbk_orden_compra.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_orden_compra) %>',0);"><%= Reporte_WebPay.tbk_orden_compra.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.tbk_orden_compra.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.tbk_orden_compra.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.tbk_id_session.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_id_session))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.tbk_id_session.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_id_session) %>',0);"><%= Reporte_WebPay.tbk_id_session.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.tbk_id_session.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.tbk_id_session.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.tbk_numero_tarjeta.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_numero_tarjeta))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.tbk_numero_tarjeta.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_numero_tarjeta) %>',0);"><%= Reporte_WebPay.tbk_numero_tarjeta.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.tbk_numero_tarjeta.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.tbk_numero_tarjeta.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.tbk_fecha_transaccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_fecha_transaccion))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.tbk_fecha_transaccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_fecha_transaccion) %>',0);"><%= Reporte_WebPay.tbk_fecha_transaccion.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.tbk_fecha_transaccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.tbk_fecha_transaccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.tbk_numero_cuotas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_numero_cuotas))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.tbk_numero_cuotas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_numero_cuotas) %>',0);"><%= Reporte_WebPay.tbk_numero_cuotas.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.tbk_numero_cuotas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.tbk_numero_cuotas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.tbk_id_transaccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_id_transaccion))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.tbk_id_transaccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_id_transaccion) %>',0);"><%= Reporte_WebPay.tbk_id_transaccion.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.tbk_id_transaccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.tbk_id_transaccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Reporte_WebPay.Export)) Then %>
<%= Reporte_WebPay.tbk_hora_transaccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_hora_transaccion))) Then %>
		<td style="vertical-align: bottom;"><%= Reporte_WebPay.tbk_hora_transaccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Reporte_WebPay.SortUrl(Reporte_WebPay.tbk_hora_transaccion) %>',0);"><%= Reporte_WebPay.tbk_hora_transaccion.FldCaption() %></td><td style="width: 10px;">
		<% If (Reporte_WebPay.tbk_hora_transaccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Reporte_WebPay.tbk_hora_transaccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Reporte_WebPay_summary.ShowFirstHeader = False
	End If
	Reporte_WebPay_summary.RecCount += 1

		' Render detail row
		Reporte_WebPay.ResetCSS()
		Reporte_WebPay.RowType = EWRPT_ROWTYPE_DETAIL
		Reporte_WebPay_summary.RenderRow()
%>
	<tr<%= Reporte_WebPay.RowAttributes() %>>
		<td<%= Reporte_WebPay.NOMBRE.CellAttributes %>>
<div<%= Reporte_WebPay.NOMBRE.ViewAttributes%>><%= Reporte_WebPay.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.PATERNO.CellAttributes %>>
<div<%= Reporte_WebPay.PATERNO.ViewAttributes%>><%= Reporte_WebPay.PATERNO.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.MATERNO.CellAttributes %>>
<div<%= Reporte_WebPay.MATERNO.ViewAttributes%>><%= Reporte_WebPay.MATERNO.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.rut.CellAttributes %>>
<div<%= Reporte_WebPay.rut.ViewAttributes%>><%= Reporte_WebPay.rut.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.codcli.CellAttributes %>>
<div<%= Reporte_WebPay.codcli.ViewAttributes%>><%= Reporte_WebPay.codcli.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.CODCARR.CellAttributes %>>
<div<%= Reporte_WebPay.CODCARR.ViewAttributes%>><%= Reporte_WebPay.CODCARR.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.NOMBRE_CARRERA.CellAttributes %>>
<div<%= Reporte_WebPay.NOMBRE_CARRERA.ViewAttributes%>><%= Reporte_WebPay.NOMBRE_CARRERA.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.fecha.CellAttributes %>>
<div<%= Reporte_WebPay.fecha.ViewAttributes%>><%= Reporte_WebPay.fecha.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.cuota.CellAttributes %>>
<div<%= Reporte_WebPay.cuota.ViewAttributes%>><%= Reporte_WebPay.cuota.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.monto.CellAttributes %>>
<div<%= Reporte_WebPay.monto.ViewAttributes%>><%= Reporte_WebPay.monto.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.estado.CellAttributes %>>
<div<%= Reporte_WebPay.estado.ViewAttributes%>><%= Reporte_WebPay.estado.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.nro_pagare.CellAttributes %>>
<div<%= Reporte_WebPay.nro_pagare.ViewAttributes%>><%= Reporte_WebPay.nro_pagare.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.n_operacion.CellAttributes %>>
<div<%= Reporte_WebPay.n_operacion.ViewAttributes%>><%= Reporte_WebPay.n_operacion.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.oc.CellAttributes %>>
<div<%= Reporte_WebPay.oc.ViewAttributes%>><%= Reporte_WebPay.oc.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.tbk_tipo_transaccion.CellAttributes %>>
<div<%= Reporte_WebPay.tbk_tipo_transaccion.ViewAttributes%>><%= Reporte_WebPay.tbk_tipo_transaccion.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.tbk_monto.CellAttributes %>>
<div<%= Reporte_WebPay.tbk_monto.ViewAttributes%>><%= Reporte_WebPay.tbk_monto.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.tbk_orden_compra.CellAttributes %>>
<div<%= Reporte_WebPay.tbk_orden_compra.ViewAttributes%>><%= Reporte_WebPay.tbk_orden_compra.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.tbk_id_session.CellAttributes %>>
<div<%= Reporte_WebPay.tbk_id_session.ViewAttributes%>><%= Reporte_WebPay.tbk_id_session.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.tbk_numero_tarjeta.CellAttributes %>>
<div<%= Reporte_WebPay.tbk_numero_tarjeta.ViewAttributes%>><%= Reporte_WebPay.tbk_numero_tarjeta.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.tbk_fecha_transaccion.CellAttributes %>>
<div<%= Reporte_WebPay.tbk_fecha_transaccion.ViewAttributes%>><%= Reporte_WebPay.tbk_fecha_transaccion.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.tbk_numero_cuotas.CellAttributes %>>
<div<%= Reporte_WebPay.tbk_numero_cuotas.ViewAttributes%>><%= Reporte_WebPay.tbk_numero_cuotas.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.tbk_id_transaccion.CellAttributes %>>
<div<%= Reporte_WebPay.tbk_id_transaccion.ViewAttributes%>><%= Reporte_WebPay.tbk_id_transaccion.ListViewValue%></div>
</td>
		<td<%= Reporte_WebPay.tbk_hora_transaccion.CellAttributes %>>
<div<%= Reporte_WebPay.tbk_hora_transaccion.ViewAttributes%>><%= Reporte_WebPay.tbk_hora_transaccion.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Reporte_WebPay_summary.AccumulateSummary()

		' Get next record
		Reporte_WebPay_summary.GetRow() ' ASPXRPT
		Reporte_WebPay_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Reporte_WebPay_summary.TotalGrps > 0) Then
	Reporte_WebPay.ResetCSS()
	Reporte_WebPay.RowType = EWRPT_ROWTYPE_TOTAL
	Reporte_WebPay.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Reporte_WebPay.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Reporte_WebPay.RowAttrs("class") = "ewRptGrandSummary"
	Reporte_WebPay_summary.RenderRow()
%>
	<!-- tr><td colspan="23"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Reporte_WebPay.RowAttributes() %>><td colspan="23"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Reporte_WebPay_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Reporte_WebPay.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Reporte_WebPay_summary.Pager Is Nothing Then Reporte_WebPay_summary.Pager = New cPrevNextPager(Reporte_WebPay_summary.StartGrp, Reporte_WebPay_summary.DisplayGrps, Reporte_WebPay_summary.TotalGrps) %>
<% If Reporte_WebPay_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Reporte_WebPay_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Reporte_WebPaysmry.aspx?start=<%= Reporte_WebPay_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Reporte_WebPay_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Reporte_WebPaysmry.aspx?start=<%= Reporte_WebPay_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Reporte_WebPay_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Reporte_WebPay_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Reporte_WebPaysmry.aspx?start=<%= Reporte_WebPay_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Reporte_WebPay_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Reporte_WebPaysmry.aspx?start=<%= Reporte_WebPay_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Reporte_WebPay_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Reporte_WebPay_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Reporte_WebPay_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Reporte_WebPay_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Reporte_WebPay_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Reporte_WebPay_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="20"<% If Reporte_WebPay_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="50"<% If Reporte_WebPay_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="100"<% If Reporte_WebPay_summary.DisplayGrps = 100 Then Response.Write(" selected=""selected""") %>>100</option>
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
<% If (Reporte_WebPay.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Reporte_WebPay.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Reporte_WebPay.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Reporte_WebPay_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Reporte_WebPay.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
