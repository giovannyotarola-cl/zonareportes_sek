<%@ Page ClassName="Detalle_WebPaysmry" Language="VB" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	Public Detalle_WebPay As crDetalle_WebPay = Nothing

	'
	' Table class (for Detalle WebPay)
	'
	Public Class crDetalle_WebPay
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
				Return "Detalle_WebPay"
			End Get
		End Property

		' Table name
		Public ReadOnly Property TableName() As String
			Get
				Return "Detalle WebPay"
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

		Public oc As crField

		Public n_operacion As crField

		Public nro_pagare As crField

		Public codcli As crField

		Public rut As crField

		Public NOMBRE As crField

		Public PATERNO As crField

		Public MATERNO As crField

		Public CODCARR As crField

		Public NOMBRE_CARRERA As crField

		Public cuota As crField

		Public monto As crField

		Public fecha As crField

		Public estado As crField

		Public tbk_tipo_transaccion As crField

		Public tbk_monto As crField

		Public tbk_orden_compra As crField

		Public tbk_id_session As crField

		Public tbk_numero_tarjeta As crField

		Public tbk_fecha_transaccion As crField

		Public tbk_hora_transaccion As crField

		Public tbk_numero_cuotas As crField

		Public tbk_id_transaccion As crField

		Public estadofinal As crField

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

			' oc
			oc = new crField("Detalle_WebPay", "Detalle WebPay", "x_oc", "oc", "[oc]", 200, EWRPT_DATATYPE_STRING, -1)
			oc.Page = APage
			oc.ParentPage = APage.ParentPage
			Fields.Add("oc", oc)
			oc.DateFilter = ""
			oc.SqlSelect = ""
			oc.SqlOrderBy = ""

			' n_operacion
			n_operacion = new crField("Detalle_WebPay", "Detalle WebPay", "x_n_operacion", "n_operacion", "[n_operacion]", 200, EWRPT_DATATYPE_STRING, -1)
			n_operacion.Page = APage
			n_operacion.ParentPage = APage.ParentPage
			Fields.Add("n_operacion", n_operacion)
			n_operacion.DateFilter = ""
			n_operacion.SqlSelect = ""
			n_operacion.SqlOrderBy = ""

			' nro_pagare
			nro_pagare = new crField("Detalle_WebPay", "Detalle WebPay", "x_nro_pagare", "nro_pagare", "[nro_pagare]", 200, EWRPT_DATATYPE_STRING, -1)
			nro_pagare.Page = APage
			nro_pagare.ParentPage = APage.ParentPage
			Fields.Add("nro_pagare", nro_pagare)
			nro_pagare.DateFilter = ""
			nro_pagare.SqlSelect = ""
			nro_pagare.SqlOrderBy = ""

			' codcli
			codcli = new crField("Detalle_WebPay", "Detalle WebPay", "x_codcli", "codcli", "[codcli]", 200, EWRPT_DATATYPE_STRING, -1)
			codcli.Page = APage
			codcli.ParentPage = APage.ParentPage
			Fields.Add("codcli", codcli)
			codcli.DateFilter = ""
			codcli.SqlSelect = ""
			codcli.SqlOrderBy = ""

			' rut
			rut = new crField("Detalle_WebPay", "Detalle WebPay", "x_rut", "rut", "[rut]", 131, EWRPT_DATATYPE_NUMBER, -1)
			rut.Page = APage
			rut.ParentPage = APage.ParentPage
			rut.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("rut", rut)
			rut.DateFilter = ""
			rut.SqlSelect = ""
			rut.SqlOrderBy = ""

			' NOMBRE
			NOMBRE = new crField("Detalle_WebPay", "Detalle WebPay", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE.Page = APage
			NOMBRE.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE", NOMBRE)
			NOMBRE.DateFilter = ""
			NOMBRE.SqlSelect = ""
			NOMBRE.SqlOrderBy = ""

			' PATERNO
			PATERNO = new crField("Detalle_WebPay", "Detalle WebPay", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			PATERNO.Page = APage
			PATERNO.ParentPage = APage.ParentPage
			Fields.Add("PATERNO", PATERNO)
			PATERNO.DateFilter = ""
			PATERNO.SqlSelect = ""
			PATERNO.SqlOrderBy = ""

			' MATERNO
			MATERNO = new crField("Detalle_WebPay", "Detalle WebPay", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
			MATERNO.Page = APage
			MATERNO.ParentPage = APage.ParentPage
			Fields.Add("MATERNO", MATERNO)
			MATERNO.DateFilter = ""
			MATERNO.SqlSelect = ""
			MATERNO.SqlOrderBy = ""

			' CODCARR
			CODCARR = new crField("Detalle_WebPay", "Detalle WebPay", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			CODCARR.Page = APage
			CODCARR.ParentPage = APage.ParentPage
			Fields.Add("CODCARR", CODCARR)
			CODCARR.DateFilter = ""
			CODCARR.SqlSelect = ""
			CODCARR.SqlOrderBy = ""

			' NOMBRE_CARRERA
			NOMBRE_CARRERA = new crField("Detalle_WebPay", "Detalle WebPay", "x_NOMBRE_CARRERA", "NOMBRE_CARRERA", "[NOMBRE_CARRERA]", 200, EWRPT_DATATYPE_STRING, -1)
			NOMBRE_CARRERA.Page = APage
			NOMBRE_CARRERA.ParentPage = APage.ParentPage
			Fields.Add("NOMBRE_CARRERA", NOMBRE_CARRERA)
			NOMBRE_CARRERA.DateFilter = ""
			NOMBRE_CARRERA.SqlSelect = ""
			NOMBRE_CARRERA.SqlOrderBy = ""

			' cuota
			cuota = new crField("Detalle_WebPay", "Detalle WebPay", "x_cuota", "cuota", "[cuota]", 131, EWRPT_DATATYPE_NUMBER, -1)
			cuota.Page = APage
			cuota.ParentPage = APage.ParentPage
			cuota.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("cuota", cuota)
			cuota.DateFilter = ""
			cuota.SqlSelect = ""
			cuota.SqlOrderBy = ""

			' monto
			monto = new crField("Detalle_WebPay", "Detalle WebPay", "x_monto", "monto", "[monto]", 131, EWRPT_DATATYPE_NUMBER, -1)
			monto.Page = APage
			monto.ParentPage = APage.ParentPage
			monto.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("monto", monto)
			monto.DateFilter = ""
			monto.SqlSelect = ""
			monto.SqlOrderBy = ""

			' fecha
			fecha = new crField("Detalle_WebPay", "Detalle WebPay", "x_fecha", "fecha", "[fecha]", 135, EWRPT_DATATYPE_DATE, 7)
			fecha.Page = APage
			fecha.ParentPage = APage.ParentPage
			fecha.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/")
			Fields.Add("fecha", fecha)
			fecha.DateFilter = ""
			fecha.SqlSelect = ""
			fecha.SqlOrderBy = ""

			' estado
			estado = new crField("Detalle_WebPay", "Detalle WebPay", "x_estado", "estado", "[estado]", 131, EWRPT_DATATYPE_NUMBER, -1)
			estado.Page = APage
			estado.ParentPage = APage.ParentPage
			estado.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("estado", estado)
			estado.DateFilter = ""
			estado.SqlSelect = ""
			estado.SqlOrderBy = ""

			' tbk_tipo_transaccion
			tbk_tipo_transaccion = new crField("Detalle_WebPay", "Detalle WebPay", "x_tbk_tipo_transaccion", "tbk_tipo_transaccion", "[tbk_tipo_transaccion]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_tipo_transaccion.Page = APage
			tbk_tipo_transaccion.ParentPage = APage.ParentPage
			Fields.Add("tbk_tipo_transaccion", tbk_tipo_transaccion)
			tbk_tipo_transaccion.DateFilter = ""
			tbk_tipo_transaccion.SqlSelect = ""
			tbk_tipo_transaccion.SqlOrderBy = ""

			' tbk_monto
			tbk_monto = new crField("Detalle_WebPay", "Detalle WebPay", "x_tbk_monto", "tbk_monto", "[tbk_monto]", 131, EWRPT_DATATYPE_NUMBER, -1)
			tbk_monto.Page = APage
			tbk_monto.ParentPage = APage.ParentPage
			tbk_monto.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("tbk_monto", tbk_monto)
			tbk_monto.DateFilter = ""
			tbk_monto.SqlSelect = ""
			tbk_monto.SqlOrderBy = ""

			' tbk_orden_compra
			tbk_orden_compra = new crField("Detalle_WebPay", "Detalle WebPay", "x_tbk_orden_compra", "tbk_orden_compra", "[tbk_orden_compra]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_orden_compra.Page = APage
			tbk_orden_compra.ParentPage = APage.ParentPage
			Fields.Add("tbk_orden_compra", tbk_orden_compra)
			tbk_orden_compra.DateFilter = ""
			tbk_orden_compra.SqlSelect = ""
			tbk_orden_compra.SqlOrderBy = ""

			' tbk_id_session
			tbk_id_session = new crField("Detalle_WebPay", "Detalle WebPay", "x_tbk_id_session", "tbk_id_session", "[tbk_id_session]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_id_session.Page = APage
			tbk_id_session.ParentPage = APage.ParentPage
			Fields.Add("tbk_id_session", tbk_id_session)
			tbk_id_session.DateFilter = ""
			tbk_id_session.SqlSelect = ""
			tbk_id_session.SqlOrderBy = ""

			' tbk_numero_tarjeta
			tbk_numero_tarjeta = new crField("Detalle_WebPay", "Detalle WebPay", "x_tbk_numero_tarjeta", "tbk_numero_tarjeta", "[tbk_numero_tarjeta]", 131, EWRPT_DATATYPE_NUMBER, -1)
			tbk_numero_tarjeta.Page = APage
			tbk_numero_tarjeta.ParentPage = APage.ParentPage
			tbk_numero_tarjeta.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("tbk_numero_tarjeta", tbk_numero_tarjeta)
			tbk_numero_tarjeta.DateFilter = ""
			tbk_numero_tarjeta.SqlSelect = ""
			tbk_numero_tarjeta.SqlOrderBy = ""

			' tbk_fecha_transaccion
			tbk_fecha_transaccion = new crField("Detalle_WebPay", "Detalle WebPay", "x_tbk_fecha_transaccion", "tbk_fecha_transaccion", "[tbk_fecha_transaccion]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_fecha_transaccion.Page = APage
			tbk_fecha_transaccion.ParentPage = APage.ParentPage
			Fields.Add("tbk_fecha_transaccion", tbk_fecha_transaccion)
			tbk_fecha_transaccion.DateFilter = ""
			tbk_fecha_transaccion.SqlSelect = ""
			tbk_fecha_transaccion.SqlOrderBy = ""

			' tbk_hora_transaccion
			tbk_hora_transaccion = new crField("Detalle_WebPay", "Detalle WebPay", "x_tbk_hora_transaccion", "tbk_hora_transaccion", "[tbk_hora_transaccion]", 200, EWRPT_DATATYPE_STRING, -1)
			tbk_hora_transaccion.Page = APage
			tbk_hora_transaccion.ParentPage = APage.ParentPage
			Fields.Add("tbk_hora_transaccion", tbk_hora_transaccion)
			tbk_hora_transaccion.DateFilter = ""
			tbk_hora_transaccion.SqlSelect = ""
			tbk_hora_transaccion.SqlOrderBy = ""

			' tbk_numero_cuotas
			tbk_numero_cuotas = new crField("Detalle_WebPay", "Detalle WebPay", "x_tbk_numero_cuotas", "tbk_numero_cuotas", "[tbk_numero_cuotas]", 131, EWRPT_DATATYPE_NUMBER, -1)
			tbk_numero_cuotas.Page = APage
			tbk_numero_cuotas.ParentPage = APage.ParentPage
			tbk_numero_cuotas.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("tbk_numero_cuotas", tbk_numero_cuotas)
			tbk_numero_cuotas.DateFilter = ""
			tbk_numero_cuotas.SqlSelect = ""
			tbk_numero_cuotas.SqlOrderBy = ""

			' tbk_id_transaccion
			tbk_id_transaccion = new crField("Detalle_WebPay", "Detalle WebPay", "x_tbk_id_transaccion", "tbk_id_transaccion", "[tbk_id_transaccion]", 131, EWRPT_DATATYPE_NUMBER, -1)
			tbk_id_transaccion.Page = APage
			tbk_id_transaccion.ParentPage = APage.ParentPage
			tbk_id_transaccion.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			Fields.Add("tbk_id_transaccion", tbk_id_transaccion)
			tbk_id_transaccion.DateFilter = ""
			tbk_id_transaccion.SqlSelect = ""
			tbk_id_transaccion.SqlOrderBy = ""

			' estadofinal
			estadofinal = new crField("Detalle_WebPay", "Detalle WebPay", "x_estadofinal", "estadofinal", "[estadofinal]", 200, EWRPT_DATATYPE_STRING, -1)
			estadofinal.Page = APage
			estadofinal.ParentPage = APage.ParentPage
			Fields.Add("estadofinal", estadofinal)
			estadofinal.DateFilter = ""
			estadofinal.SqlSelect = ""
			estadofinal.SqlOrderBy = ""
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
	Public Detalle_WebPay_summary As crDetalle_WebPay_summary

	'
	' Page class
	'
	Public Class crDetalle_WebPay_summary
		Inherits AspNetReportMakerPage
		Implements IDisposable

		' Page URL
		Public Function PageUrl() As String
			Dim sUrl As String = ew_CurrentPage() & "?"
			If (Detalle_WebPay.UseTokenInUrl) Then
				sUrl &= "t=" & Detalle_WebPay.TableVar & "&" ' Add page token
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
			If (Detalle_WebPay.UseTokenInUrl) Then
				If (HttpContext.Current.Request.RequestType = "POST") Then
					Return (ew_SameStr(Detalle_WebPay.TableVar, ew_Post("t")))
				End If
				If (ew_NotEmpty(ew_Get("t"))) Then
					Return (ew_SameStr(Detalle_WebPay.TableVar, ew_Get("t")))
				End If
			End If
			Return True
		End Function

		' ASP.NET page object
		Public ReadOnly Property AspNetPage As Detalle_WebPaysmry 
			Get
				Return CType(m_ParentPage, Detalle_WebPaysmry)
			End Get
		End Property

		' Table object (Detalle_WebPay)
		Public Property Detalle_WebPay As crDetalle_WebPay 
			Get		
				Return AspNetPage.Detalle_WebPay ' Unlike ASP.NET Maker, the table object is not in the base class.
			End Get
			Set(ByVal Value As crDetalle_WebPay)
				AspNetPage.Detalle_WebPay = Value	
			End Set	
		End Property

		'
		' Page class constructor
		'
		Public Sub New(APage As AspNetReportMaker4_project1)		
			m_ParentPage = APage
			m_Page = Me
			m_PageID = "summary"
			m_PageObjName = "Detalle_WebPay_summary"
			m_PageObjTypeName = "crDetalle_WebPay_summary"

			' Table name
			m_TableName = "Detalle WebPay"

			' Language object
			ReportLanguage = New crLanguage(Me)

			' Table object (Detalle_WebPay)
			Detalle_WebPay = New crDetalle_WebPay(Me)			

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
				Detalle_WebPay.Export = ew_Get("export")
			End If
			gsExport = Detalle_WebPay.Export ' Get export parameter, used in header
			gsExportFile = Detalle_WebPay.TableVar ' Get export file, used in header
			If (Detalle_WebPay.Export = "excel") Then
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

		Public DisplayGrps As Integer = 30	' Groups per page

		Public GrpRange As Integer = 10

		Public Sort As String = ""

		Public Filter As String = ""

		Public UserIDFilter As String = ""

		' Clear field for ext filter
		Public ClearExtFilter As String = ""

		Public FilterApplied As Boolean

		Public ShowFirstHeader As Boolean

		Public Val As Object() = New Object(24) {}

		Public Cnt As Integer()() = New Integer(0)() {}

		Public Smry As Object()() = New Object(0)() {}

		Public Mn As Object()() = New Object(0)() {}

		Public Mx As Object()() = New Object(0)() {}

		Public GrandSmry As Object() = New Object(24) {}

		Public GrandMn As Object() = New Object(24) {}

		Public GrandMx As Object() = New Object(24) {}

		' Set up if accumulation required
		Public Col() As Boolean = {false, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False}

		Public TotCount As Integer

		'
		' Page main
		'
		Public Sub Page_Main()

			' Aggregate variables		
			Dim nDtls As Integer = 25 ' No. of fields
			Dim nGrps As Integer = 1 ' No. of groups (level 0 used for grand total)
			For i As Integer = 0 To nGrps - 1
				Cnt(i) = New Integer(nDtls-1) {}
				Smry(i) = New Object(nDtls-1) {}
				Mn(i) = New Object(nDtls-1) {}
				Mx(i) = New Object(nDtls-1) {}
			Next

			' Set up groups per page dynamically
			SetUpDisplayGrps()

			' Set up popup filter
			SetupPopup()

			' Extended filter
			Dim sExtendedFilter As String = ""

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

			' No filter
			FilterApplied = False

			' Get sort
			Sort = GetSort()

			' Get total count
			Dim sSql As String = ewrpt_BuildReportSql(Detalle_WebPay.SqlSelect, Detalle_WebPay.SqlWhere, Detalle_WebPay.SqlGroupBy, Detalle_WebPay.SqlHaving, Detalle_WebPay.SqlOrderBy, Filter, Sort)
			TotalGrps = GetCnt(sSql)
			If (DisplayGrps <= 0) Then ' Display all groups
				DisplayGrps = TotalGrps
			End If
			StartGrp = 1

			' Show header
			ShowFirstHeader = (TotalGrps > 0)

			'ShowFirstHeader = True ' Uncomment to always show header
			' Set up start position if not export all

			If (Detalle_WebPay.ExportAll AndAlso ew_NotEmpty(Detalle_WebPay.Export)) Then
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
				Detalle_WebPay.oc.DbValue = Row("oc")
				Detalle_WebPay.cuota.DbValue = Row("cuota")
				Detalle_WebPay.monto.DbValue = Row("monto")
				Detalle_WebPay.rut.DbValue = Row("rut")
				Detalle_WebPay.fecha.DbValue = Row("fecha")
				Detalle_WebPay.estado.DbValue = Row("estado")
				Detalle_WebPay.tbk_tipo_transaccion.DbValue = Row("tbk_tipo_transaccion")
				Detalle_WebPay.tbk_monto.DbValue = Row("tbk_monto")
				Detalle_WebPay.tbk_orden_compra.DbValue = Row("tbk_orden_compra")
				Detalle_WebPay.tbk_id_session.DbValue = Row("tbk_id_session")
				Detalle_WebPay.tbk_numero_tarjeta.DbValue = Row("tbk_numero_tarjeta")
				Detalle_WebPay.tbk_fecha_transaccion.DbValue = Row("tbk_fecha_transaccion")
				Detalle_WebPay.tbk_numero_cuotas.DbValue = Row("tbk_numero_cuotas")
				Detalle_WebPay.tbk_id_transaccion.DbValue = Row("tbk_id_transaccion")
				Detalle_WebPay.tbk_hora_transaccion.DbValue = Row("tbk_hora_transaccion")
				Detalle_WebPay.nro_pagare.DbValue = Row("nro_pagare")
				Detalle_WebPay.n_operacion.DbValue = Row("n_operacion")
				Detalle_WebPay.codcli.DbValue = Row("codcli")
				Detalle_WebPay.PATERNO.DbValue = Row("PATERNO")
				Detalle_WebPay.MATERNO.DbValue = Row("MATERNO")
				Detalle_WebPay.NOMBRE.DbValue = Row("NOMBRE")
				Detalle_WebPay.CODCARR.DbValue = Row("CODCARR")
				Detalle_WebPay.NOMBRE_CARRERA.DbValue = Row("NOMBRE_CARRERA")
				Detalle_WebPay.estadofinal.DbValue = Row("estadofinal")
				Val(1) = Detalle_WebPay.oc.CurrentValue
				Val(2) = Detalle_WebPay.n_operacion.CurrentValue
				Val(3) = Detalle_WebPay.nro_pagare.CurrentValue
				Val(4) = Detalle_WebPay.codcli.CurrentValue
				Val(5) = Detalle_WebPay.rut.CurrentValue
				Val(6) = Detalle_WebPay.NOMBRE.CurrentValue
				Val(7) = Detalle_WebPay.PATERNO.CurrentValue
				Val(8) = Detalle_WebPay.MATERNO.CurrentValue
				Val(9) = Detalle_WebPay.CODCARR.CurrentValue
				Val(10) = Detalle_WebPay.NOMBRE_CARRERA.CurrentValue
				Val(11) = Detalle_WebPay.cuota.CurrentValue
				Val(12) = Detalle_WebPay.monto.CurrentValue
				Val(13) = Detalle_WebPay.fecha.CurrentValue
				Val(14) = Detalle_WebPay.estado.CurrentValue
				Val(15) = Detalle_WebPay.tbk_tipo_transaccion.CurrentValue
				Val(16) = Detalle_WebPay.tbk_monto.CurrentValue
				Val(17) = Detalle_WebPay.tbk_orden_compra.CurrentValue
				Val(18) = Detalle_WebPay.tbk_id_session.CurrentValue
				Val(19) = Detalle_WebPay.tbk_numero_tarjeta.CurrentValue
				Val(20) = Detalle_WebPay.tbk_fecha_transaccion.CurrentValue
				Val(21) = Detalle_WebPay.tbk_hora_transaccion.CurrentValue
				Val(22) = Detalle_WebPay.tbk_numero_cuotas.CurrentValue
				Val(23) = Detalle_WebPay.tbk_id_transaccion.CurrentValue
				Val(24) = Detalle_WebPay.estadofinal.CurrentValue
			Else
				Detalle_WebPay.oc.DbValue = ""
				Detalle_WebPay.cuota.DbValue = ""
				Detalle_WebPay.monto.DbValue = ""
				Detalle_WebPay.rut.DbValue = ""
				Detalle_WebPay.fecha.DbValue = ""
				Detalle_WebPay.estado.DbValue = ""
				Detalle_WebPay.tbk_tipo_transaccion.DbValue = ""
				Detalle_WebPay.tbk_monto.DbValue = ""
				Detalle_WebPay.tbk_orden_compra.DbValue = ""
				Detalle_WebPay.tbk_id_session.DbValue = ""
				Detalle_WebPay.tbk_numero_tarjeta.DbValue = ""
				Detalle_WebPay.tbk_fecha_transaccion.DbValue = ""
				Detalle_WebPay.tbk_numero_cuotas.DbValue = ""
				Detalle_WebPay.tbk_id_transaccion.DbValue = ""
				Detalle_WebPay.tbk_hora_transaccion.DbValue = ""
				Detalle_WebPay.nro_pagare.DbValue = ""
				Detalle_WebPay.n_operacion.DbValue = ""
				Detalle_WebPay.codcli.DbValue = ""
				Detalle_WebPay.PATERNO.DbValue = ""
				Detalle_WebPay.MATERNO.DbValue = ""
				Detalle_WebPay.NOMBRE.DbValue = ""
				Detalle_WebPay.CODCARR.DbValue = ""
				Detalle_WebPay.NOMBRE_CARRERA.DbValue = ""
				Detalle_WebPay.estadofinal.DbValue = ""
			End If
		End Sub

		' Get row values from data reader ' ASPXRPT
		Public Function GetRow() As Boolean
			HasRow = (dr IsNot Nothing AndAlso dr.Read()) 
			If (HasRow) Then
				GrpIndex += 1			
				Detalle_WebPay.oc.DbValue = dr("oc")
				Detalle_WebPay.cuota.DbValue = dr("cuota")
				Detalle_WebPay.monto.DbValue = dr("monto")
				Detalle_WebPay.rut.DbValue = dr("rut")
				Detalle_WebPay.fecha.DbValue = dr("fecha")
				Detalle_WebPay.estado.DbValue = dr("estado")
				Detalle_WebPay.tbk_tipo_transaccion.DbValue = dr("tbk_tipo_transaccion")
				Detalle_WebPay.tbk_monto.DbValue = dr("tbk_monto")
				Detalle_WebPay.tbk_orden_compra.DbValue = dr("tbk_orden_compra")
				Detalle_WebPay.tbk_id_session.DbValue = dr("tbk_id_session")
				Detalle_WebPay.tbk_numero_tarjeta.DbValue = dr("tbk_numero_tarjeta")
				Detalle_WebPay.tbk_fecha_transaccion.DbValue = dr("tbk_fecha_transaccion")
				Detalle_WebPay.tbk_numero_cuotas.DbValue = dr("tbk_numero_cuotas")
				Detalle_WebPay.tbk_id_transaccion.DbValue = dr("tbk_id_transaccion")
				Detalle_WebPay.tbk_hora_transaccion.DbValue = dr("tbk_hora_transaccion")
				Detalle_WebPay.nro_pagare.DbValue = dr("nro_pagare")
				Detalle_WebPay.n_operacion.DbValue = dr("n_operacion")
				Detalle_WebPay.codcli.DbValue = dr("codcli")
				Detalle_WebPay.PATERNO.DbValue = dr("PATERNO")
				Detalle_WebPay.MATERNO.DbValue = dr("MATERNO")
				Detalle_WebPay.NOMBRE.DbValue = dr("NOMBRE")
				Detalle_WebPay.CODCARR.DbValue = dr("CODCARR")
				Detalle_WebPay.NOMBRE_CARRERA.DbValue = dr("NOMBRE_CARRERA")
				Detalle_WebPay.estadofinal.DbValue = dr("estadofinal")
				Val(1) = Detalle_WebPay.oc.CurrentValue
				Val(2) = Detalle_WebPay.n_operacion.CurrentValue
				Val(3) = Detalle_WebPay.nro_pagare.CurrentValue
				Val(4) = Detalle_WebPay.codcli.CurrentValue
				Val(5) = Detalle_WebPay.rut.CurrentValue
				Val(6) = Detalle_WebPay.NOMBRE.CurrentValue
				Val(7) = Detalle_WebPay.PATERNO.CurrentValue
				Val(8) = Detalle_WebPay.MATERNO.CurrentValue
				Val(9) = Detalle_WebPay.CODCARR.CurrentValue
				Val(10) = Detalle_WebPay.NOMBRE_CARRERA.CurrentValue
				Val(11) = Detalle_WebPay.cuota.CurrentValue
				Val(12) = Detalle_WebPay.monto.CurrentValue
				Val(13) = Detalle_WebPay.fecha.CurrentValue
				Val(14) = Detalle_WebPay.estado.CurrentValue
				Val(15) = Detalle_WebPay.tbk_tipo_transaccion.CurrentValue
				Val(16) = Detalle_WebPay.tbk_monto.CurrentValue
				Val(17) = Detalle_WebPay.tbk_orden_compra.CurrentValue
				Val(18) = Detalle_WebPay.tbk_id_session.CurrentValue
				Val(19) = Detalle_WebPay.tbk_numero_tarjeta.CurrentValue
				Val(20) = Detalle_WebPay.tbk_fecha_transaccion.CurrentValue
				Val(21) = Detalle_WebPay.tbk_hora_transaccion.CurrentValue
				Val(22) = Detalle_WebPay.tbk_numero_cuotas.CurrentValue
				Val(23) = Detalle_WebPay.tbk_id_transaccion.CurrentValue
				Val(24) = Detalle_WebPay.estadofinal.CurrentValue
			Else				
				Detalle_WebPay.oc.DbValue = ""
				Detalle_WebPay.cuota.DbValue = ""
				Detalle_WebPay.monto.DbValue = ""
				Detalle_WebPay.rut.DbValue = ""
				Detalle_WebPay.fecha.DbValue = ""
				Detalle_WebPay.estado.DbValue = ""
				Detalle_WebPay.tbk_tipo_transaccion.DbValue = ""
				Detalle_WebPay.tbk_monto.DbValue = ""
				Detalle_WebPay.tbk_orden_compra.DbValue = ""
				Detalle_WebPay.tbk_id_session.DbValue = ""
				Detalle_WebPay.tbk_numero_tarjeta.DbValue = ""
				Detalle_WebPay.tbk_fecha_transaccion.DbValue = ""
				Detalle_WebPay.tbk_numero_cuotas.DbValue = ""
				Detalle_WebPay.tbk_id_transaccion.DbValue = ""
				Detalle_WebPay.tbk_hora_transaccion.DbValue = ""
				Detalle_WebPay.nro_pagare.DbValue = ""
				Detalle_WebPay.n_operacion.DbValue = ""
				Detalle_WebPay.codcli.DbValue = ""
				Detalle_WebPay.PATERNO.DbValue = ""
				Detalle_WebPay.MATERNO.DbValue = ""
				Detalle_WebPay.NOMBRE.DbValue = ""
				Detalle_WebPay.CODCARR.DbValue = ""
				Detalle_WebPay.NOMBRE_CARRERA.DbValue = ""
				Detalle_WebPay.estadofinal.DbValue = ""
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
				Detalle_WebPay.StartGroup = StartGrp
			ElseIf ew_NotEmpty(ew_Get("pageno")) Then
				If ewrpt_IsNumeric(ew_Get("pageno")) Then
					Dim nPageNo As Integer = ew_ConvertToInt(ew_Get("pageno"))
					StartGrp = (nPageNo - 1) * DisplayGrps + 1
					If StartGrp <= 0 Then
						StartGrp = 1
					ElseIf StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 Then
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1
					End If
					Detalle_WebPay.StartGroup = StartGrp
				Else
					StartGrp = Detalle_WebPay.StartGroup
				End If
			Else
				StartGrp = Detalle_WebPay.StartGroup
			End If

			' Check if correct start group counter 
			If StartGrp <= 0 Then	' Avoid invalid start group counter 
				StartGrp = 1 ' Reset start group counter 
				Detalle_WebPay.StartGroup = StartGrp
			ElseIf StartGrp > TotalGrps Then ' Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1 ' Point to last page first group 
				Detalle_WebPay.StartGroup = StartGrp
			ElseIf (StartGrp - 1) Mod DisplayGrps <> 0 Then
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1	' Point to page boundary 
				Detalle_WebPay.StartGroup = StartGrp
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
			Detalle_WebPay.StartGroup = StartGrp
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
						DisplayGrps = 30 ' Non-numeric, load default 
					End If 
				End If				
				Detalle_WebPay.GroupPerPage = DisplayGrps ' Save to session
				StartGrp = 1 ' Reset start position (reset command)				
				Detalle_WebPay.StartGroup = StartGrp
			Else				
				If (Detalle_WebPay.GroupPerPage <> 0) Then 
					DisplayGrps = ew_ConvertToInt(Detalle_WebPay.GroupPerPage) ' Restore from Session 
				Else 
					DisplayGrps = 30 ' Load default 
				End If 
			End If 
		End Sub 

		Public Sub RenderRow()		
			If (Detalle_WebPay.RowTotalType = EWRPT_ROWTOTAL_GRAND) Then ' Grand total

				' Get total count from SQL directly
				Dim sSql As String = ewrpt_BuildReportSql(Detalle_WebPay.SqlSelectCount, Detalle_WebPay.SqlWhere, Detalle_WebPay.SqlGroupBy, Detalle_WebPay.SqlHaving, "", Filter, "")
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql))				
			End If

			' Call Row_Rendering event
			Detalle_WebPay.Row_Rendering()

			'
			' Render view codes
			'

			If (Detalle_WebPay.RowType = EWRPT_ROWTYPE_TOTAL) Then ' Summary row

				' oc
				Detalle_WebPay.oc.ViewValue = Convert.ToString(Detalle_WebPay.oc.Summary)

				' n_operacion
				Detalle_WebPay.n_operacion.ViewValue = Convert.ToString(Detalle_WebPay.n_operacion.Summary)

				' nro_pagare
				Detalle_WebPay.nro_pagare.ViewValue = Convert.ToString(Detalle_WebPay.nro_pagare.Summary)

				' codcli
				Detalle_WebPay.codcli.ViewValue = Convert.ToString(Detalle_WebPay.codcli.Summary)

				' rut
				Detalle_WebPay.rut.ViewValue = Convert.ToString(Detalle_WebPay.rut.Summary)

				' NOMBRE
				Detalle_WebPay.NOMBRE.ViewValue = Convert.ToString(Detalle_WebPay.NOMBRE.Summary)

				' PATERNO
				Detalle_WebPay.PATERNO.ViewValue = Convert.ToString(Detalle_WebPay.PATERNO.Summary)

				' MATERNO
				Detalle_WebPay.MATERNO.ViewValue = Convert.ToString(Detalle_WebPay.MATERNO.Summary)

				' CODCARR
				Detalle_WebPay.CODCARR.ViewValue = Convert.ToString(Detalle_WebPay.CODCARR.Summary)

				' NOMBRE_CARRERA
				Detalle_WebPay.NOMBRE_CARRERA.ViewValue = Convert.ToString(Detalle_WebPay.NOMBRE_CARRERA.Summary)

				' cuota
				Detalle_WebPay.cuota.ViewValue = Convert.ToString(Detalle_WebPay.cuota.Summary)

				' monto
				Detalle_WebPay.monto.ViewValue = Convert.ToString(Detalle_WebPay.monto.Summary)

				' fecha
				Detalle_WebPay.fecha.ViewValue = Convert.ToString(Detalle_WebPay.fecha.Summary)
				Detalle_WebPay.fecha.ViewValue = ew_FormatDateTime(Detalle_WebPay.fecha.ViewValue, 7)

				' estado
				Detalle_WebPay.estado.ViewValue = Convert.ToString(Detalle_WebPay.estado.Summary)

				' tbk_tipo_transaccion
				Detalle_WebPay.tbk_tipo_transaccion.ViewValue = Convert.ToString(Detalle_WebPay.tbk_tipo_transaccion.Summary)

				' tbk_monto
				Detalle_WebPay.tbk_monto.ViewValue = Convert.ToString(Detalle_WebPay.tbk_monto.Summary)

				' tbk_orden_compra
				Detalle_WebPay.tbk_orden_compra.ViewValue = Convert.ToString(Detalle_WebPay.tbk_orden_compra.Summary)

				' tbk_id_session
				Detalle_WebPay.tbk_id_session.ViewValue = Convert.ToString(Detalle_WebPay.tbk_id_session.Summary)

				' tbk_numero_tarjeta
				Detalle_WebPay.tbk_numero_tarjeta.ViewValue = Convert.ToString(Detalle_WebPay.tbk_numero_tarjeta.Summary)

				' tbk_fecha_transaccion
				Detalle_WebPay.tbk_fecha_transaccion.ViewValue = Convert.ToString(Detalle_WebPay.tbk_fecha_transaccion.Summary)

				' tbk_hora_transaccion
				Detalle_WebPay.tbk_hora_transaccion.ViewValue = Convert.ToString(Detalle_WebPay.tbk_hora_transaccion.Summary)

				' tbk_numero_cuotas
				Detalle_WebPay.tbk_numero_cuotas.ViewValue = Convert.ToString(Detalle_WebPay.tbk_numero_cuotas.Summary)

				' tbk_id_transaccion
				Detalle_WebPay.tbk_id_transaccion.ViewValue = Convert.ToString(Detalle_WebPay.tbk_id_transaccion.Summary)

				' estadofinal
				Detalle_WebPay.estadofinal.ViewValue = Convert.ToString(Detalle_WebPay.estadofinal.Summary)
			Else

				' oc
				Detalle_WebPay.oc.ViewValue = Convert.ToString(Detalle_WebPay.oc.CurrentValue)
				Detalle_WebPay.oc.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' n_operacion
				Detalle_WebPay.n_operacion.ViewValue = Convert.ToString(Detalle_WebPay.n_operacion.CurrentValue)
				Detalle_WebPay.n_operacion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' nro_pagare
				Detalle_WebPay.nro_pagare.ViewValue = Convert.ToString(Detalle_WebPay.nro_pagare.CurrentValue)
				Detalle_WebPay.nro_pagare.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' codcli
				Detalle_WebPay.codcli.ViewValue = Convert.ToString(Detalle_WebPay.codcli.CurrentValue)
				Detalle_WebPay.codcli.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' rut
				Detalle_WebPay.rut.ViewValue = Convert.ToString(Detalle_WebPay.rut.CurrentValue)
				Detalle_WebPay.rut.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE
				Detalle_WebPay.NOMBRE.ViewValue = Convert.ToString(Detalle_WebPay.NOMBRE.CurrentValue)
				Detalle_WebPay.NOMBRE.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' PATERNO
				Detalle_WebPay.PATERNO.ViewValue = Convert.ToString(Detalle_WebPay.PATERNO.CurrentValue)
				Detalle_WebPay.PATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' MATERNO
				Detalle_WebPay.MATERNO.ViewValue = Convert.ToString(Detalle_WebPay.MATERNO.CurrentValue)
				Detalle_WebPay.MATERNO.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' CODCARR
				Detalle_WebPay.CODCARR.ViewValue = Convert.ToString(Detalle_WebPay.CODCARR.CurrentValue)
				Detalle_WebPay.CODCARR.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' NOMBRE_CARRERA
				Detalle_WebPay.NOMBRE_CARRERA.ViewValue = Convert.ToString(Detalle_WebPay.NOMBRE_CARRERA.CurrentValue)
				Detalle_WebPay.NOMBRE_CARRERA.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' cuota
				Detalle_WebPay.cuota.ViewValue = Convert.ToString(Detalle_WebPay.cuota.CurrentValue)
				Detalle_WebPay.cuota.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' monto
				Detalle_WebPay.monto.ViewValue = Convert.ToString(Detalle_WebPay.monto.CurrentValue)
				Detalle_WebPay.monto.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' fecha
				Detalle_WebPay.fecha.ViewValue = Convert.ToString(Detalle_WebPay.fecha.CurrentValue)
				Detalle_WebPay.fecha.ViewValue = ew_FormatDateTime(Detalle_WebPay.fecha.ViewValue, 7)
				Detalle_WebPay.fecha.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' estado
				Detalle_WebPay.estado.ViewValue = Convert.ToString(Detalle_WebPay.estado.CurrentValue)
				Detalle_WebPay.estado.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_tipo_transaccion
				Detalle_WebPay.tbk_tipo_transaccion.ViewValue = Convert.ToString(Detalle_WebPay.tbk_tipo_transaccion.CurrentValue)
				Detalle_WebPay.tbk_tipo_transaccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_monto
				Detalle_WebPay.tbk_monto.ViewValue = Convert.ToString(Detalle_WebPay.tbk_monto.CurrentValue)
				Detalle_WebPay.tbk_monto.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_orden_compra
				Detalle_WebPay.tbk_orden_compra.ViewValue = Convert.ToString(Detalle_WebPay.tbk_orden_compra.CurrentValue)
				Detalle_WebPay.tbk_orden_compra.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_id_session
				Detalle_WebPay.tbk_id_session.ViewValue = Convert.ToString(Detalle_WebPay.tbk_id_session.CurrentValue)
				Detalle_WebPay.tbk_id_session.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_numero_tarjeta
				Detalle_WebPay.tbk_numero_tarjeta.ViewValue = Convert.ToString(Detalle_WebPay.tbk_numero_tarjeta.CurrentValue)
				Detalle_WebPay.tbk_numero_tarjeta.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_fecha_transaccion
				Detalle_WebPay.tbk_fecha_transaccion.ViewValue = Convert.ToString(Detalle_WebPay.tbk_fecha_transaccion.CurrentValue)
				Detalle_WebPay.tbk_fecha_transaccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_hora_transaccion
				Detalle_WebPay.tbk_hora_transaccion.ViewValue = Convert.ToString(Detalle_WebPay.tbk_hora_transaccion.CurrentValue)
				Detalle_WebPay.tbk_hora_transaccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_numero_cuotas
				Detalle_WebPay.tbk_numero_cuotas.ViewValue = Convert.ToString(Detalle_WebPay.tbk_numero_cuotas.CurrentValue)
				Detalle_WebPay.tbk_numero_cuotas.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' tbk_id_transaccion
				Detalle_WebPay.tbk_id_transaccion.ViewValue = Convert.ToString(Detalle_WebPay.tbk_id_transaccion.CurrentValue)
				Detalle_WebPay.tbk_id_transaccion.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")

				' estadofinal
				Detalle_WebPay.estadofinal.ViewValue = Convert.ToString(Detalle_WebPay.estadofinal.CurrentValue)
				Detalle_WebPay.estadofinal.CellAttrs("class") = IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow")
			End If

			' oc
			Detalle_WebPay.oc.HrefValue = ""

			' n_operacion
			Detalle_WebPay.n_operacion.HrefValue = ""

			' nro_pagare
			Detalle_WebPay.nro_pagare.HrefValue = ""

			' codcli
			Detalle_WebPay.codcli.HrefValue = ""

			' rut
			Detalle_WebPay.rut.HrefValue = ""

			' NOMBRE
			Detalle_WebPay.NOMBRE.HrefValue = ""

			' PATERNO
			Detalle_WebPay.PATERNO.HrefValue = ""

			' MATERNO
			Detalle_WebPay.MATERNO.HrefValue = ""

			' CODCARR
			Detalle_WebPay.CODCARR.HrefValue = ""

			' NOMBRE_CARRERA
			Detalle_WebPay.NOMBRE_CARRERA.HrefValue = ""

			' cuota
			Detalle_WebPay.cuota.HrefValue = ""

			' monto
			Detalle_WebPay.monto.HrefValue = ""

			' fecha
			Detalle_WebPay.fecha.HrefValue = ""

			' estado
			Detalle_WebPay.estado.HrefValue = ""

			' tbk_tipo_transaccion
			Detalle_WebPay.tbk_tipo_transaccion.HrefValue = ""

			' tbk_monto
			Detalle_WebPay.tbk_monto.HrefValue = ""

			' tbk_orden_compra
			Detalle_WebPay.tbk_orden_compra.HrefValue = ""

			' tbk_id_session
			Detalle_WebPay.tbk_id_session.HrefValue = ""

			' tbk_numero_tarjeta
			Detalle_WebPay.tbk_numero_tarjeta.HrefValue = ""

			' tbk_fecha_transaccion
			Detalle_WebPay.tbk_fecha_transaccion.HrefValue = ""

			' tbk_hora_transaccion
			Detalle_WebPay.tbk_hora_transaccion.HrefValue = ""

			' tbk_numero_cuotas
			Detalle_WebPay.tbk_numero_cuotas.HrefValue = ""

			' tbk_id_transaccion
			Detalle_WebPay.tbk_id_transaccion.HrefValue = ""

			' estadofinal
			Detalle_WebPay.estadofinal.HrefValue = ""

			' Call Row_Rendered event
			Detalle_WebPay.Row_Rendered()
		End Sub

	'
	' Extended filter
	'
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
				Detalle_WebPay.OrderBy = ""
				Detalle_WebPay.StartGroup = 1
				Detalle_WebPay.oc.Sort = ""
				Detalle_WebPay.n_operacion.Sort = ""
				Detalle_WebPay.nro_pagare.Sort = ""
				Detalle_WebPay.codcli.Sort = ""
				Detalle_WebPay.rut.Sort = ""
				Detalle_WebPay.NOMBRE.Sort = ""
				Detalle_WebPay.PATERNO.Sort = ""
				Detalle_WebPay.MATERNO.Sort = ""
				Detalle_WebPay.CODCARR.Sort = ""
				Detalle_WebPay.NOMBRE_CARRERA.Sort = ""
				Detalle_WebPay.cuota.Sort = ""
				Detalle_WebPay.monto.Sort = ""
				Detalle_WebPay.fecha.Sort = ""
				Detalle_WebPay.estado.Sort = ""
				Detalle_WebPay.tbk_tipo_transaccion.Sort = ""
				Detalle_WebPay.tbk_monto.Sort = ""
				Detalle_WebPay.tbk_orden_compra.Sort = ""
				Detalle_WebPay.tbk_id_session.Sort = ""
				Detalle_WebPay.tbk_numero_tarjeta.Sort = ""
				Detalle_WebPay.tbk_fecha_transaccion.Sort = ""
				Detalle_WebPay.tbk_hora_transaccion.Sort = ""
				Detalle_WebPay.tbk_numero_cuotas.Sort = ""
				Detalle_WebPay.tbk_id_transaccion.Sort = ""
				Detalle_WebPay.estadofinal.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf (ew_NotEmpty(ew_Get("order"))) Then
			Detalle_WebPay.CurrentOrder = ew_Get("order")
			Detalle_WebPay.CurrentOrderType = ew_Get("ordertype")
			sSortSql = Detalle_WebPay.SortSql()
			Detalle_WebPay.OrderBy = sSortSql
			Detalle_WebPay.StartGroup = 1
		End If
		Return Detalle_WebPay.OrderBy
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
		Detalle_WebPay_summary = New crDetalle_WebPay_summary(Me)
		Detalle_WebPay_summary.Page_Init()

		' Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Page main processing
		Detalle_WebPay_summary.Page_Main()
	End Sub

	'
	' ASP.NET Page_Unload event
	'

	Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) 

		' Dispose page object
		If (Detalle_WebPay_summary IsNot Nothing) Then Detalle_WebPay_summary.Dispose()
	End Sub
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% If (Detalle_WebPay.Export = "") Then %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
// To include another .js script, use:
// ew_ClientScriptInclude("my_javascript.js"); 
//-->
</script>
<% End If %>
<% Detalle_WebPay_summary.ShowPageHeader() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If (Detalle_WebPay.Export = "") Then %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
// popup fields
</script>
<% End If %>
<% If (Detalle_WebPay.Export = "") Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div class="ewTitle"><%= Detalle_WebPay.TableCaption() %>
<% If (Detalle_WebPay.Export = "") Then %>
&nbsp;&nbsp;<a href="<%= Detalle_WebPay_summary.ExportExcelUrl %>"><%= ReportLanguage.Phrase("ExportToExcel") %></a>
<% End If %>
</div><br><br>
<% Detalle_WebPay_summary.ShowMessage() %>
<% If (Detalle_WebPay.Export = "") Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% End If %>
<% If (Detalle_WebPay.Export = "") Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<% If (Detalle_WebPay.Export = "") Then %>
<div class="ewGridUpperPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Detalle_WebPay_summary.Pager Is Nothing Then Detalle_WebPay_summary.Pager = New cPrevNextPager(Detalle_WebPay_summary.StartGrp, Detalle_WebPay_summary.DisplayGrps, Detalle_WebPay_summary.TotalGrps) %>
<% If Detalle_WebPay_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Detalle_WebPay_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Detalle_WebPaysmry.aspx?start=<%= Detalle_WebPay_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Detalle_WebPay_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Detalle_WebPaysmry.aspx?start=<%= Detalle_WebPay_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Detalle_WebPay_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Detalle_WebPay_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Detalle_WebPaysmry.aspx?start=<%= Detalle_WebPay_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Detalle_WebPay_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Detalle_WebPaysmry.aspx?start=<%= Detalle_WebPay_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Detalle_WebPay_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Detalle_WebPay_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Detalle_WebPay_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Detalle_WebPay_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Detalle_WebPay_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Detalle_WebPay_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If Detalle_WebPay_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="20"<% If Detalle_WebPay_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="30"<% If Detalle_WebPay_summary.DisplayGrps = 30 Then Response.Write(" selected=""selected""") %>>30</option>
<option value="50"<% If Detalle_WebPay_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="ALL"<% If (Detalle_WebPay.GroupPerPage = -1) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("AllRecords") %></option>
</select>
		</span></td>
<% End If %>
	</tr>
</table>
</form>
</div>
<% End If %>
<!-- Report Grid (Begin) -->
<div class="ewGridMiddlePanel">
<table class="ewTable ewTableSeparate" cellspacing="0">
<%

' Set the last group to display if not export all
If (Detalle_WebPay.ExportAll AndAlso ew_NotEmpty(Detalle_WebPay.Export)) Then
	Detalle_WebPay_summary.StopGrp = Detalle_WebPay_summary.TotalGrps
Else
	Detalle_WebPay_summary.StopGrp = Detalle_WebPay_summary.StartGrp + Detalle_WebPay_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If (Detalle_WebPay_summary.StopGrp > Detalle_WebPay_summary.TotalGrps) Then
	Detalle_WebPay_summary.StopGrp = Detalle_WebPay_summary.TotalGrps
End If
Detalle_WebPay_summary.RecCount = 0

' Get first row
If (Detalle_WebPay_summary.TotalGrps > 0) Then
	Detalle_WebPay_summary.GetRow() ' ASPXRPT
	Detalle_WebPay_summary.GrpCount = 1
End If
While ((Detalle_WebPay_summary.HasRow AndAlso Detalle_WebPay_summary.GrpIndex < Detalle_WebPay_summary.StopGrp) OrElse Detalle_WebPay_summary.ShowFirstHeader)

	' Show header
	If (Detalle_WebPay_summary.ShowFirstHeader) Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.oc.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.oc))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.oc.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.oc) %>',0);"><%= Detalle_WebPay.oc.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.oc.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.oc.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.n_operacion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.n_operacion))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.n_operacion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.n_operacion) %>',0);"><%= Detalle_WebPay.n_operacion.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.n_operacion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.n_operacion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.nro_pagare.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.nro_pagare))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.nro_pagare.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.nro_pagare) %>',0);"><%= Detalle_WebPay.nro_pagare.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.nro_pagare.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.nro_pagare.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.codcli.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.codcli))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.codcli.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.codcli) %>',0);"><%= Detalle_WebPay.codcli.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.codcli.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.codcli.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.rut.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.rut))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.rut.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.rut) %>',0);"><%= Detalle_WebPay.rut.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.rut.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.rut.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.NOMBRE.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.NOMBRE))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.NOMBRE.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.NOMBRE) %>',0);"><%= Detalle_WebPay.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.NOMBRE.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.NOMBRE.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.PATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.PATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.PATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.PATERNO) %>',0);"><%= Detalle_WebPay.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.PATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.PATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.MATERNO.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.MATERNO))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.MATERNO.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.MATERNO) %>',0);"><%= Detalle_WebPay.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.MATERNO.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.MATERNO.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.CODCARR.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.CODCARR))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.CODCARR.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.CODCARR) %>',0);"><%= Detalle_WebPay.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.CODCARR.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.CODCARR.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.NOMBRE_CARRERA.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.NOMBRE_CARRERA))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.NOMBRE_CARRERA.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.NOMBRE_CARRERA) %>',0);"><%= Detalle_WebPay.NOMBRE_CARRERA.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.NOMBRE_CARRERA.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.NOMBRE_CARRERA.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.cuota.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.cuota))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.cuota.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.cuota) %>',0);"><%= Detalle_WebPay.cuota.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.cuota.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.cuota.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.monto.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.monto))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.monto.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.monto) %>',0);"><%= Detalle_WebPay.monto.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.monto.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.monto.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.fecha.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.fecha))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.fecha.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.fecha) %>',0);"><%= Detalle_WebPay.fecha.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.fecha.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.fecha.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.estado.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.estado))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.estado.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.estado) %>',0);"><%= Detalle_WebPay.estado.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.estado.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.estado.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.tbk_tipo_transaccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_tipo_transaccion))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.tbk_tipo_transaccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_tipo_transaccion) %>',0);"><%= Detalle_WebPay.tbk_tipo_transaccion.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.tbk_tipo_transaccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.tbk_tipo_transaccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.tbk_monto.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_monto))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.tbk_monto.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_monto) %>',0);"><%= Detalle_WebPay.tbk_monto.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.tbk_monto.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.tbk_monto.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.tbk_orden_compra.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_orden_compra))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.tbk_orden_compra.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_orden_compra) %>',0);"><%= Detalle_WebPay.tbk_orden_compra.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.tbk_orden_compra.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.tbk_orden_compra.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.tbk_id_session.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_id_session))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.tbk_id_session.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_id_session) %>',0);"><%= Detalle_WebPay.tbk_id_session.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.tbk_id_session.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.tbk_id_session.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.tbk_numero_tarjeta.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_numero_tarjeta))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.tbk_numero_tarjeta.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_numero_tarjeta) %>',0);"><%= Detalle_WebPay.tbk_numero_tarjeta.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.tbk_numero_tarjeta.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.tbk_numero_tarjeta.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.tbk_fecha_transaccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_fecha_transaccion))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.tbk_fecha_transaccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_fecha_transaccion) %>',0);"><%= Detalle_WebPay.tbk_fecha_transaccion.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.tbk_fecha_transaccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.tbk_fecha_transaccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.tbk_hora_transaccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_hora_transaccion))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.tbk_hora_transaccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_hora_transaccion) %>',0);"><%= Detalle_WebPay.tbk_hora_transaccion.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.tbk_hora_transaccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.tbk_hora_transaccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.tbk_numero_cuotas.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_numero_cuotas))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.tbk_numero_cuotas.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_numero_cuotas) %>',0);"><%= Detalle_WebPay.tbk_numero_cuotas.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.tbk_numero_cuotas.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.tbk_numero_cuotas.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.tbk_id_transaccion.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_id_transaccion))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.tbk_id_transaccion.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.tbk_id_transaccion) %>',0);"><%= Detalle_WebPay.tbk_id_transaccion.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.tbk_id_transaccion.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.tbk_id_transaccion.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If (ew_NotEmpty(Detalle_WebPay.Export)) Then %>
<%= Detalle_WebPay.estadofinal.FldCaption() %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If (ew_Empty(Detalle_WebPay.SortUrl(Detalle_WebPay.estadofinal))) Then %>
		<td style="vertical-align: bottom;"><%= Detalle_WebPay.estadofinal.FldCaption() %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Detalle_WebPay.SortUrl(Detalle_WebPay.estadofinal) %>',0);"><%= Detalle_WebPay.estadofinal.FldCaption() %></td><td style="width: 10px;">
		<% If (Detalle_WebPay.estadofinal.Sort = "ASC") Then %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf (Detalle_WebPay.estadofinal.Sort = "DESC") Then %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Detalle_WebPay_summary.ShowFirstHeader = False
	End If
	Detalle_WebPay_summary.RecCount += 1

		' Render detail row
		Detalle_WebPay.ResetCSS()
		Detalle_WebPay.RowType = EWRPT_ROWTYPE_DETAIL
		Detalle_WebPay_summary.RenderRow()
%>
	<tr<%= Detalle_WebPay.RowAttributes() %>>
		<td<%= Detalle_WebPay.oc.CellAttributes %>>
<div<%= Detalle_WebPay.oc.ViewAttributes%>><%= Detalle_WebPay.oc.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.n_operacion.CellAttributes %>>
<div<%= Detalle_WebPay.n_operacion.ViewAttributes%>><%= Detalle_WebPay.n_operacion.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.nro_pagare.CellAttributes %>>
<div<%= Detalle_WebPay.nro_pagare.ViewAttributes%>><%= Detalle_WebPay.nro_pagare.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.codcli.CellAttributes %>>
<div<%= Detalle_WebPay.codcli.ViewAttributes%>><%= Detalle_WebPay.codcli.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.rut.CellAttributes %>>
<div<%= Detalle_WebPay.rut.ViewAttributes%>><%= Detalle_WebPay.rut.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.NOMBRE.CellAttributes %>>
<div<%= Detalle_WebPay.NOMBRE.ViewAttributes%>><%= Detalle_WebPay.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.PATERNO.CellAttributes %>>
<div<%= Detalle_WebPay.PATERNO.ViewAttributes%>><%= Detalle_WebPay.PATERNO.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.MATERNO.CellAttributes %>>
<div<%= Detalle_WebPay.MATERNO.ViewAttributes%>><%= Detalle_WebPay.MATERNO.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.CODCARR.CellAttributes %>>
<div<%= Detalle_WebPay.CODCARR.ViewAttributes%>><%= Detalle_WebPay.CODCARR.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.NOMBRE_CARRERA.CellAttributes %>>
<div<%= Detalle_WebPay.NOMBRE_CARRERA.ViewAttributes%>><%= Detalle_WebPay.NOMBRE_CARRERA.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.cuota.CellAttributes %>>
<div<%= Detalle_WebPay.cuota.ViewAttributes%>><%= Detalle_WebPay.cuota.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.monto.CellAttributes %>>
<div<%= Detalle_WebPay.monto.ViewAttributes%>><%= Detalle_WebPay.monto.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.fecha.CellAttributes %>>
<div<%= Detalle_WebPay.fecha.ViewAttributes%>><%= Detalle_WebPay.fecha.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.estado.CellAttributes %>>
<div<%= Detalle_WebPay.estado.ViewAttributes%>><%= Detalle_WebPay.estado.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.tbk_tipo_transaccion.CellAttributes %>>
<div<%= Detalle_WebPay.tbk_tipo_transaccion.ViewAttributes%>><%= Detalle_WebPay.tbk_tipo_transaccion.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.tbk_monto.CellAttributes %>>
<div<%= Detalle_WebPay.tbk_monto.ViewAttributes%>><%= Detalle_WebPay.tbk_monto.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.tbk_orden_compra.CellAttributes %>>
<div<%= Detalle_WebPay.tbk_orden_compra.ViewAttributes%>><%= Detalle_WebPay.tbk_orden_compra.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.tbk_id_session.CellAttributes %>>
<div<%= Detalle_WebPay.tbk_id_session.ViewAttributes%>><%= Detalle_WebPay.tbk_id_session.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.tbk_numero_tarjeta.CellAttributes %>>
<div<%= Detalle_WebPay.tbk_numero_tarjeta.ViewAttributes%>><%= Detalle_WebPay.tbk_numero_tarjeta.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.tbk_fecha_transaccion.CellAttributes %>>
<div<%= Detalle_WebPay.tbk_fecha_transaccion.ViewAttributes%>><%= Detalle_WebPay.tbk_fecha_transaccion.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.tbk_hora_transaccion.CellAttributes %>>
<div<%= Detalle_WebPay.tbk_hora_transaccion.ViewAttributes%>><%= Detalle_WebPay.tbk_hora_transaccion.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.tbk_numero_cuotas.CellAttributes %>>
<div<%= Detalle_WebPay.tbk_numero_cuotas.ViewAttributes%>><%= Detalle_WebPay.tbk_numero_cuotas.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.tbk_id_transaccion.CellAttributes %>>
<div<%= Detalle_WebPay.tbk_id_transaccion.ViewAttributes%>><%= Detalle_WebPay.tbk_id_transaccion.ListViewValue%></div>
</td>
		<td<%= Detalle_WebPay.estadofinal.CellAttributes %>>
<div<%= Detalle_WebPay.estadofinal.ViewAttributes%>><%= Detalle_WebPay.estadofinal.ListViewValue%></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Detalle_WebPay_summary.AccumulateSummary()

		' Get next record
		Detalle_WebPay_summary.GetRow() ' ASPXRPT
		Detalle_WebPay_summary.GrpCount += 1
End while
%>
	</tbody>
	<tfoot>
<%
If (Detalle_WebPay_summary.TotalGrps > 0) Then
	Detalle_WebPay.ResetCSS()
	Detalle_WebPay.RowType = EWRPT_ROWTYPE_TOTAL
	Detalle_WebPay.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Detalle_WebPay.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Detalle_WebPay.RowAttrs("class") = "ewRptGrandSummary"
	Detalle_WebPay_summary.RenderRow()
%>
	<!-- tr><td colspan="24"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Detalle_WebPay.RowAttributes() %>><td colspan="24"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Detalle_WebPay_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If (Detalle_WebPay_summary.TotalGrps > 0) Then %>
<% If (Detalle_WebPay.Export = "") Then %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Detalle_WebPay_summary.Pager Is Nothing Then Detalle_WebPay_summary.Pager = New cPrevNextPager(Detalle_WebPay_summary.StartGrp, Detalle_WebPay_summary.DisplayGrps, Detalle_WebPay_summary.TotalGrps) %>
<% If Detalle_WebPay_summary.Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Detalle_WebPay_summary.Pager.FirstButton.Enabled Then %>
	<td><a href="Detalle_WebPaysmry.aspx?start=<%= Detalle_WebPay_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Detalle_WebPay_summary.Pager.PrevButton.Enabled Then %>
	<td><a href="Detalle_WebPaysmry.aspx?start=<%= Detalle_WebPay_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Detalle_WebPay_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% If Detalle_WebPay_summary.Pager.NextButton.Enabled Then %>
	<td><a href="Detalle_WebPaysmry.aspx?start=<%= Detalle_WebPay_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Detalle_WebPay_summary.Pager.LastButton.Enabled Then %>
	<td><a href="Detalle_WebPaysmry.aspx?start=<%= Detalle_WebPay_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Detalle_WebPay_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Detalle_WebPay_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Detalle_WebPay_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Detalle_WebPay_summary.Pager.RecordCount %></span>	
<% Else %>
	<% If Detalle_WebPay_summary.Filter = "0=101" Then %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If (Detalle_WebPay_summary.TotalGrps > 0) Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% If Detalle_WebPay_summary.DisplayGrps = 10 Then Response.Write(" selected=""selected""") %>>10</option>
<option value="20"<% If Detalle_WebPay_summary.DisplayGrps = 20 Then Response.Write(" selected=""selected""") %>>20</option>
<option value="30"<% If Detalle_WebPay_summary.DisplayGrps = 30 Then Response.Write(" selected=""selected""") %>>30</option>
<option value="50"<% If Detalle_WebPay_summary.DisplayGrps = 50 Then Response.Write(" selected=""selected""") %>>50</option>
<option value="ALL"<% If (Detalle_WebPay.GroupPerPage = -1) Then Response.Write(" selected=""selected""") %>><%= ReportLanguage.Phrase("AllRecords") %></option>
</select>
		</span></td>
<% End If %>
	</tr>
</table>
</form>
</div>
<% End If %>
<% End If %>
</td></tr></table>
</div>
<!-- Summary Report Ends -->
<% If (Detalle_WebPay.Export = "") Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% End If %>
<% If (Detalle_WebPay.Export = "") Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If (Detalle_WebPay.Export = "") Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Detalle_WebPay_summary.ShowPageFooter() %>
<% If (EWRPT_DEBUG_ENABLED) Then ew_Write(ew_DebugMsg()) %>
<% If (Detalle_WebPay.Export = "") Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
</asp:Content>
