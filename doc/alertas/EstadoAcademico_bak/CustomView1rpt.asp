<%@ CodePage=65001 LCID=13322 %>
<!--#include file="rptinc/ewrcfg4.asp"-->
<!--#include file="rptinc/ewrfn4.asp"-->
<!--#include file="rptinc/ewrusrfn.asp"-->
<%
If (Session("idusuario") = False) Then
	Response.Redirect("../../default.asp?s=out")
	
End If

Dim uPermiso 
Set conn = Server.CreateObject("ADODB.Connection")
Set uPermiso = Server.CreateObject ("ADODB.Recordset")
conn.Open EWRPT_DB_CONNECTION_STRING

' ASP Report Maker 3.0+ - Table level configuration (Asignaturas Historicas)
' Table Level Constants
uPermiso.Open "SELECT * FROM IF_USUARIO_ACCESO WHERE USERID = '" & Session("idusuario") & "' AND CODLINK = '" &Request("acc") & "'", conn

If (uPermiso.EOF = true) then
	Response.Redirect("../../report.asp?aut=false")
End If	
' Variable for table object
Dim CustomView1

' Define table class
Class crCustomView1
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "CustomView1"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "CustomView1"
	End Property

	' Table type
	Public Property Get TableType()
		TableType = "CUSTOMVIEW"
	End Property

	' Table caption
	Public Property Get TableCaption()
		TableCaption = ReportLanguage.TablePhrase(TableVar, "TblCaption")
	End Property

	' Session Group Per Page
	Public Property Get GroupPerPage()
		GroupPerPage = Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_grpperpage")
	End Property

	Public Property Let GroupPerPage(v)
		Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_grpperpage") = v
	End Property

	' Session Start Group
	Public Property Get StartGroup()
		StartGroup = Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_start")
	End Property

	Public Property Let StartGroup(v)
		Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_start") = v
	End Property

	' Session Order By
	Public Property Get OrderBy()
		OrderBy = Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_orderby")
	End Property

	Public Property Let OrderBy(v)
		Session(EWRPT_PROJECT_VAR & "_" & TableVar & "_orderby") = v
	End Property

	' Create new chart object
	Private Function NewChtObj(tblvar, tblname, chtvar, chtname, xfldname, yfldname, sfldname, chttype, chtsmrytype, width, height)
		Dim cht
		Set cht = New crChart
		cht.TblVar = tblvar
		cht.TblName = tblname
		cht.ChartVar = chtvar
		cht.ChartName = chtname
		cht.ChartXFldName = xfldname
		cht.ChartYFldName = yfldname
		cht.ChartSFldName = sfldname
		cht.ChartType = chttype
		cht.ChartSummaryType = chtsmrytype
		cht.ChartWidth = width
		cht.ChartHeight = height
		Set NewChtObj = cht
	End Function

	' CODCLI
	Private m_CODCLI

	Public Property Get CODCLI()
		Dim ar
		If Not IsObject(m_CODCLI) Then
			Set m_CODCLI = NewFldObj("CustomView1", "CustomView1", "x_CODCLI", "CODCLI", "SEK_matriculados_estados.CODCLI", 200, EWRPT_DATATYPE_STRING, -1)
			m_CODCLI.DateFilter = ""
			m_CODCLI.SqlSelect = ""
			m_CODCLI.SqlOrderBy = ""
		End If
		Set CODCLI = m_CODCLI
	End Property

	' DIG
	Private m_DIG

	Public Property Get DIG()
		Dim ar
		If Not IsObject(m_DIG) Then
			Set m_DIG = NewFldObj("CustomView1", "CustomView1", "x_DIG", "DIG", "SEK_matriculados_estados.DIG", 200, EWRPT_DATATYPE_STRING, -1)
			m_DIG.DateFilter = ""
			m_DIG.SqlSelect = ""
			m_DIG.SqlOrderBy = ""
		End If
		Set DIG = m_DIG
	End Property

	' PATERNO
	Private m_PATERNO

	Public Property Get PATERNO()
		Dim ar
		If Not IsObject(m_PATERNO) Then
			Set m_PATERNO = NewFldObj("CustomView1", "CustomView1", "x_PATERNO", "PATERNO", "SEK_matriculados_estados.PATERNO", 200, EWRPT_DATATYPE_STRING, -1)
			m_PATERNO.DateFilter = ""
			m_PATERNO.SqlSelect = ""
			m_PATERNO.SqlOrderBy = ""
		End If
		Set PATERNO = m_PATERNO
	End Property

	' MATERNO
	Private m_MATERNO

	Public Property Get MATERNO()
		Dim ar
		If Not IsObject(m_MATERNO) Then
			Set m_MATERNO = NewFldObj("CustomView1", "CustomView1", "x_MATERNO", "MATERNO", "SEK_matriculados_estados.MATERNO", 200, EWRPT_DATATYPE_STRING, -1)
			m_MATERNO.DateFilter = ""
			m_MATERNO.SqlSelect = ""
			m_MATERNO.SqlOrderBy = ""
		End If
		Set MATERNO = m_MATERNO
	End Property

	' NOMBRE
	Private m_NOMBRE

	Public Property Get NOMBRE()
		Dim ar
		If Not IsObject(m_NOMBRE) Then
			Set m_NOMBRE = NewFldObj("CustomView1", "CustomView1", "x_NOMBRE", "NOMBRE", "SEK_matriculados_estados.NOMBRE", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE.DateFilter = ""
			m_NOMBRE.SqlSelect = ""
			m_NOMBRE.SqlOrderBy = ""
		End If
		Set NOMBRE = m_NOMBRE
	End Property

	' NOMBRE_C
	Private m_NOMBRE_C

	Public Property Get NOMBRE_C()
		Dim ar
		If Not IsObject(m_NOMBRE_C) Then
			Set m_NOMBRE_C = NewFldObj("CustomView1", "CustomView1", "x_NOMBRE_C", "NOMBRE_C", "SEK_matriculados_estados.NOMBRE_C", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE_C.DateFilter = ""
			m_NOMBRE_C.SqlSelect = ""
			m_NOMBRE_C.SqlOrderBy = ""
		End If
		Set NOMBRE_C = m_NOMBRE_C
	End Property

	' JORNADA
	Private m_JORNADA

	Public Property Get JORNADA()
		Dim ar
		If Not IsObject(m_JORNADA) Then
			Set m_JORNADA = NewFldObj("CustomView1", "CustomView1", "x_JORNADA", "JORNADA", "SEK_matriculados_estados.JORNADA", 200, EWRPT_DATATYPE_STRING, -1)
			m_JORNADA.DateFilter = ""
			m_JORNADA.SqlSelect = ""
			m_JORNADA.SqlOrderBy = ""
		End If
		Set JORNADA = m_JORNADA
	End Property

	' CODCARR
	Private m_CODCARR

	Public Property Get CODCARR()
		Dim ar
		If Not IsObject(m_CODCARR) Then
			Set m_CODCARR = NewFldObj("CustomView1", "CustomView1", "x_CODCARR", "CODCARR", "SEK_matriculados_estados.CODCARR", 200, EWRPT_DATATYPE_STRING, -1)
			m_CODCARR.DateFilter = ""
			m_CODCARR.SqlSelect = ""
			m_CODCARR.SqlOrderBy = ""
		End If
		Set CODCARR = m_CODCARR
	End Property

	' ESTACAD
	Private m_ESTACAD

	Public Property Get ESTACAD()
		Dim ar
		If Not IsObject(m_ESTACAD) Then
			Set m_ESTACAD = NewFldObj("CustomView1", "CustomView1", "x_ESTACAD", "ESTACAD", "SEK_matriculados_estados.ESTACAD", 200, EWRPT_DATATYPE_STRING, -1)
			m_ESTACAD.DateFilter = ""
			m_ESTACAD.SqlSelect = ""
			m_ESTACAD.SqlOrderBy = ""
		End If
		Set ESTACAD = m_ESTACAD
	End Property

	' INGRESO
	Private m_INGRESO

	Public Property Get INGRESO()
		Dim ar
		If Not IsObject(m_INGRESO) Then
			Set m_INGRESO = NewFldObj("CustomView1", "CustomView1", "x_INGRESO", "INGRESO", "SEK_matriculados_estados.INGRESO", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_INGRESO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_INGRESO.DateFilter = ""
			m_INGRESO.SqlSelect = ""
			m_INGRESO.SqlOrderBy = ""
		End If
		Set INGRESO = m_INGRESO
	End Property

	' DIRECCION
	Private m_DIRECCION

	Public Property Get DIRECCION()
		Dim ar
		If Not IsObject(m_DIRECCION) Then
			Set m_DIRECCION = NewFldObj("CustomView1", "CustomView1", "x_DIRECCION", "DIRECCION", "SEK_matriculados_estados.DIRECCION", 200, EWRPT_DATATYPE_STRING, -1)
			m_DIRECCION.DateFilter = ""
			m_DIRECCION.SqlSelect = ""
			m_DIRECCION.SqlOrderBy = ""
		End If
		Set DIRECCION = m_DIRECCION
	End Property

	' COMUNA
	Private m_COMUNA

	Public Property Get COMUNA()
		Dim ar
		If Not IsObject(m_COMUNA) Then
			Set m_COMUNA = NewFldObj("CustomView1", "CustomView1", "x_COMUNA", "COMUNA", "SEK_matriculados_estados.COMUNA", 200, EWRPT_DATATYPE_STRING, -1)
			m_COMUNA.DateFilter = ""
			m_COMUNA.SqlSelect = ""
			m_COMUNA.SqlOrderBy = ""
		End If
		Set COMUNA = m_COMUNA
	End Property

	' CIUDAD
	Private m_CIUDAD

	Public Property Get CIUDAD()
		Dim ar
		If Not IsObject(m_CIUDAD) Then
			Set m_CIUDAD = NewFldObj("CustomView1", "CustomView1", "x_CIUDAD", "CIUDAD", "SEK_matriculados_estados.CIUDAD", 200, EWRPT_DATATYPE_STRING, -1)
			m_CIUDAD.DateFilter = ""
			m_CIUDAD.SqlSelect = ""
			m_CIUDAD.SqlOrderBy = ""
		End If
		Set CIUDAD = m_CIUDAD
	End Property

	' FONO
	Private m_FONO

	Public Property Get FONO()
		Dim ar
		If Not IsObject(m_FONO) Then
			Set m_FONO = NewFldObj("CustomView1", "CustomView1", "x_FONO", "FONO", "SEK_matriculados_estados.FONO", 200, EWRPT_DATATYPE_STRING, -1)
			m_FONO.DateFilter = ""
			m_FONO.SqlSelect = ""
			m_FONO.SqlOrderBy = ""
		End If
		Set FONO = m_FONO
	End Property

	' MAIL
	Private m_MAIL

	Public Property Get MAIL()
		Dim ar
		If Not IsObject(m_MAIL) Then
			Set m_MAIL = NewFldObj("CustomView1", "CustomView1", "x_MAIL", "MAIL", "SEK_matriculados_estados.MAIL", 200, EWRPT_DATATYPE_STRING, -1)
			m_MAIL.DateFilter = ""
			m_MAIL.SqlSelect = ""
			m_MAIL.SqlOrderBy = ""
		End If
		Set MAIL = m_MAIL
	End Property

	' SEXO
	Private m_SEXO

	Public Property Get SEXO()
		Dim ar
		If Not IsObject(m_SEXO) Then
			Set m_SEXO = NewFldObj("CustomView1", "CustomView1", "x_SEXO", "SEXO", "SEK_matriculados_estados.SEXO", 200, EWRPT_DATATYPE_STRING, -1)
			m_SEXO.DateFilter = ""
			m_SEXO.SqlSelect = ""
			m_SEXO.SqlOrderBy = ""
		End If
		Set SEXO = m_SEXO
	End Property

	' NACIONALIDAD
	Private m_NACIONALIDAD

	Public Property Get NACIONALIDAD()
		Dim ar
		If Not IsObject(m_NACIONALIDAD) Then
			Set m_NACIONALIDAD = NewFldObj("CustomView1", "CustomView1", "x_NACIONALIDAD", "NACIONALIDAD", "SEK_matriculados_estados.NACIONALIDAD", 200, EWRPT_DATATYPE_STRING, -1)
			m_NACIONALIDAD.DateFilter = ""
			m_NACIONALIDAD.SqlSelect = ""
			m_NACIONALIDAD.SqlOrderBy = ""
		End If
		Set NACIONALIDAD = m_NACIONALIDAD
	End Property

	' FACULTAD
	Private m_FACULTAD

	Public Property Get FACULTAD()
		Dim ar
		If Not IsObject(m_FACULTAD) Then
			Set m_FACULTAD = NewFldObj("CustomView1", "CustomView1", "x_FACULTAD", "FACULTAD", "SEK_matriculados_estados.FACULTAD", 200, EWRPT_DATATYPE_STRING, -1)
			m_FACULTAD.DateFilter = ""
			m_FACULTAD.SqlSelect = ""
			m_FACULTAD.SqlOrderBy = ""
		End If
		Set FACULTAD = m_FACULTAD
	End Property

	' codigo
	Private m_codigo

	Public Property Get codigo()
		Dim ar
		If Not IsObject(m_codigo) Then
			Set m_codigo = NewFldObj("CustomView1", "CustomView1", "x_codigo", "codigo", "SEK_matriculados_estados.codigo", 200, EWRPT_DATATYPE_STRING, -1)
			m_codigo.DateFilter = ""
			m_codigo.SqlSelect = ""
			m_codigo.SqlOrderBy = ""
		End If
		Set codigo = m_codigo
	End Property

	' ANO_MAT
	Private m_ANO_MAT

	Public Property Get ANO_MAT()
		Dim ar
		If Not IsObject(m_ANO_MAT) Then
			Set m_ANO_MAT = NewFldObj("CustomView1", "CustomView1", "x_ANO_MAT", "ANO_MAT", "SEK_matriculados_estados.ANO_MAT", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_ANO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_ANO_MAT.DateFilter = ""
			m_ANO_MAT.SqlSelect = ""
			m_ANO_MAT.SqlOrderBy = ""
		End If
		Set ANO_MAT = m_ANO_MAT
	End Property

	' PERIODO_MAT
	Private m_PERIODO_MAT

	Public Property Get PERIODO_MAT()
		Dim ar
		If Not IsObject(m_PERIODO_MAT) Then
			Set m_PERIODO_MAT = NewFldObj("CustomView1", "CustomView1", "x_PERIODO_MAT", "PERIODO_MAT", "SEK_matriculados_estados.PERIODO_MAT", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PERIODO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PERIODO_MAT.DateFilter = ""
			m_PERIODO_MAT.SqlSelect = ""
			m_PERIODO_MAT.SqlOrderBy = ""
		End If
		Set PERIODO_MAT = m_PERIODO_MAT
	End Property

	' TIPOSITU
	Private m_TIPOSITU

	Public Property Get TIPOSITU()
		Dim ar
		If Not IsObject(m_TIPOSITU) Then
			Set m_TIPOSITU = NewFldObj("CustomView1", "CustomView1", "x_TIPOSITU", "TIPOSITU", "SEK_matriculados_estados.TIPOSITU", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_TIPOSITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_TIPOSITU.DateFilter = ""
			m_TIPOSITU.SqlSelect = ""
			m_TIPOSITU.SqlOrderBy = ""
		End If
		Set TIPOSITU = m_TIPOSITU
	End Property

	' DESCRIPCION
	Private m_DESCRIPCION

	Public Property Get DESCRIPCION()
		Dim ar
		If Not IsObject(m_DESCRIPCION) Then
			Set m_DESCRIPCION = NewFldObj("CustomView1", "CustomView1", "x_DESCRIPCION", "DESCRIPCION", "SEK_matriculados_estados.DESCRIPCION", 200, EWRPT_DATATYPE_STRING, -1)
			m_DESCRIPCION.DateFilter = ""
			m_DESCRIPCION.SqlSelect = ""
			m_DESCRIPCION.SqlOrderBy = ""
		End If
		Set DESCRIPCION = m_DESCRIPCION
	End Property

	' Create new field object
	Private Function NewFldObj(tblvar, tblname, fldvar, fldname, fldexpression, fldtype, flddatatype, flddtformat)
		Dim fld
		Set fld = New crField
		fld.TblVar = tblvar
		fld.TblName = tblname
		fld.FldVar = fldvar
		fld.FldName = fldname
		fld.FldExpression = fldexpression
		fld.FldType = fldtype
		fld.FldDataType = flddatatype
		fld.FldDateTimeFormat = flddtformat
		Set NewFldObj = fld
	End Function
	Dim Fields ' Fields
	Dim Export ' Export
	Dim ExportAll
	Dim UseTokenInUrl
	Dim RowType ' Row type
	Dim RowTotalType ' Row total type
	Dim RowTotalSubType ' Row total subtype
	Dim RowGroupLevel ' Row group level
	Dim RowAttrs  ' Row attributes

	' Reset CSS styles for table object
	Sub ResetCSS()
		Call ewrpt_SetAttr(RowAttrs, "style", "")
		Call ewrpt_SetAttr(RowAttrs, "class", "")
		If IsArray(Fields) Then
			For i = 0 to UBound(Fields,2)
				Set fld = Fields(1,i)
				Call fld.ResetCSS()
			Next
		End If
	End Sub

	'
	' Class Initialize
	'
	Private Sub Class_Initialize()
		RestoreSession = False
		ExportAll = False
		UseTokenInUrl = EWRPT_USE_TOKEN_IN_URL
		ShowCurrentFilter = EWRPT_SHOW_CURRENT_FILTER
		FilterPanelOption = EWRPT_FILTER_PANEL_OPTION
		Set RowAttrs = Server.CreateObject("Scripting.Dictionary") ' Row attributes
		Call ewrpt_SetArObj(Fields, "CODCLI", CODCLI)
		Call ewrpt_SetArObj(Fields, "DIG", DIG)
		Call ewrpt_SetArObj(Fields, "PATERNO", PATERNO)
		Call ewrpt_SetArObj(Fields, "MATERNO", MATERNO)
		Call ewrpt_SetArObj(Fields, "NOMBRE", NOMBRE)
		Call ewrpt_SetArObj(Fields, "NOMBRE_C", NOMBRE_C)
		Call ewrpt_SetArObj(Fields, "JORNADA", JORNADA)
		Call ewrpt_SetArObj(Fields, "CODCARR", CODCARR)
		Call ewrpt_SetArObj(Fields, "ESTACAD", ESTACAD)
		Call ewrpt_SetArObj(Fields, "INGRESO", INGRESO)
		Call ewrpt_SetArObj(Fields, "DIRECCION", DIRECCION)
		Call ewrpt_SetArObj(Fields, "COMUNA", COMUNA)
		Call ewrpt_SetArObj(Fields, "CIUDAD", CIUDAD)
		Call ewrpt_SetArObj(Fields, "FONO", FONO)
		Call ewrpt_SetArObj(Fields, "MAIL", MAIL)
		Call ewrpt_SetArObj(Fields, "SEXO", SEXO)
		Call ewrpt_SetArObj(Fields, "NACIONALIDAD", NACIONALIDAD)
		Call ewrpt_SetArObj(Fields, "FACULTAD", FACULTAD)
		Call ewrpt_SetArObj(Fields, "codigo", codigo)
		Call ewrpt_SetArObj(Fields, "ANO_MAT", ANO_MAT)
		Call ewrpt_SetArObj(Fields, "PERIODO_MAT", PERIODO_MAT)
		Call ewrpt_SetArObj(Fields, "TIPOSITU", TIPOSITU)
		Call ewrpt_SetArObj(Fields, "DESCRIPCION", DESCRIPCION)
	End Sub

	' Terminate
	Private Sub Class_Terminate()
		Set RowAttrs = Nothing
	End Sub

	' Single column sort
	Public Sub UpdateSort(ofld)
		Dim sLastSort, sThisSort
		If (CurrentOrder = ofld.FldName) Then
			sLastSort = ofld.Sort
			If CurrentOrderType = "ASC" Or CurrentOrderType = "DESC" Then
				sThisSort = CurrentOrderType
			Else
				sThisSort = ewrpt_IIf(sLastSort = "ASC", "DESC", "ASC")
			End If
			ofld.Sort = sThisSort
		Else
			If ofld.GroupingFieldId = 0 Then ofld.Sort = ""
		End If
	End Sub

	' Get Sort SQL
	Public Function SortSql()
		Dim sSortSql
		sSortSql = ""
		Dim i, fld
		If IsArray(Fields) Then
			For i = 0 to UBound(Fields,2)
				Set fld = Fields(1,i)
				If fld.Sort <> "" Then
					If sSortSql <> "" Then sSortSql = sSortSql & ", "
					If (fld.FldGroupSql <> "") Then
						sSortSql = sSortSql & Replace(fld.FldGroupSql, "%s", fld.FldExpression) & " " & fld.Sort
					Else
						sSortSql = sSortSql & fld.FldExpression & " " & fld.Sort
					End If
				End If
			Next
		End If
		SortSql = sSortSql
	End Function

	' Table level SQL
	Public Property Get SqlFrom() ' From
		SqlFrom = "SEK_matriculados_estados"
	End Property

	Public Property Get SqlSelect() ' Select
		SqlSelect = "SELECT SEK_matriculados_estados.CODCLI, SEK_matriculados_estados.DIG, SEK_matriculados_estados.PATERNO, SEK_matriculados_estados.MATERNO, SEK_matriculados_estados.NOMBRE, SEK_matriculados_estados.NOMBRE_C, SEK_matriculados_estados.JORNADA, SEK_matriculados_estados.CODCARR, SEK_matriculados_estados.ESTACAD, SEK_matriculados_estados.INGRESO, SEK_matriculados_estados.DIRECCION, SEK_matriculados_estados.COMUNA, SEK_matriculados_estados.CIUDAD, SEK_matriculados_estados.FONO, SEK_matriculados_estados.MAIL, SEK_matriculados_estados.SEXO, SEK_matriculados_estados.NACIONALIDAD, SEK_matriculados_estados.FACULTAD, SEK_matriculados_estados.codigo, SEK_matriculados_estados.ANO_MAT, SEK_matriculados_estados.PERIODO_MAT, SEK_matriculados_estados.TIPOSITU, SEK_matriculados_estados.DESCRIPCION FROM " & SqlFrom
	End Property

	Public Property Get SqlWhere() ' Where
		SqlWhere = ""
	End Property

	Public Property Get SqlGroupBy() ' Group By
		SqlGroupBy = ""
	End Property

	Public Property Get SqlHaving() ' Having
		SqlHaving = ""
	End Property

	Public Property Get SqlOrderBy() ' Order By
		SqlOrderBy = ""
	End Property

	' Sort URL
	Function SortUrl(fld)
		if Export <> "" Or _
			(fld.FldType = 141 Or fld.FldType = 201 Or fld.FldType = 203 Or fld.FldType = 128 Or fld.FldType = 204 Or fld.FldType = 205) Then ' Unsortable data type
			SortUrl = ""
		ElseIf fld.Sortable Then
			Dim sUrlParm
			sUrlParm = "order=" & Server.URLEncode(fld.FldName) & "&ordertype=" & fld.ReverseSort
			SortUrl = ewrpt_CurrentPage() & "?" & sUrlParm
		Else
			SortUrl = ""
		End If
	End Function

	' Row attributes
	Function RowAttributes()
		Dim sAtt, Attr
		sAtt = ""
		For Each Attr In RowAttrs
			If RowAttrs.Item(Attr) <> "" Then
				sAtt = sAtt & " " & Attr & "=""" & RowAttrs.Item(Attr) & """"
			End If
		Next
		RowAttributes = sAtt
	End Function

	' Field object by fldvar
	Function GetField(fldvar)
		Dim i
		If IsArray(Fields) Then
			For i = 0 to UBound(Fields,2)
				If Fields(0,i) = fldvar Then
					Set GetField = Fields(1,i)
					Exit Function
				End If
			Next
		End If
		Set GetField = Nothing
	End Function

	' Table level events
	' Row Rendering event
	Sub Row_Rendering()

		' Enter your code here	
	End Sub

	' Row Rendered event
	Sub Row_Rendered()

		' To view properties of field class, use:
		' Response.Write <FieldName>.AsString

	End Sub

	' Load Custom Filters event
	Sub CustomFilters_Load()

		' Enter your code here	
		' ewrpt_RegisterCustomFilter <Field>, "LastMonth", "Last Month", "GetLastMonthFilter" ' Date example
		' ewrpt_RegisterCustomFilter <Field>, "StartsWithA", "Starts With A", "GetStartsWithAFilter" ' String example

	End Sub

	' Page Filter Validated event
	Sub Page_FilterValidated()

		' Example:
		'Table.Field.SearchValue = "your search criteria" ' Search value

	End Sub

	' Chart Rendering event
	Sub Chart_Rendering(chart)

		' To view properties of chart class, use:
		' Response.Write chart.AsString

	End Sub

	' Chart Rendered event
	Sub Chart_Rendered(chart, chartxml)

		' To view properties of chart class, use:
		' Response.Write chart.AsString

	End Sub

	' Email Sending event
	Function Email_Sending(Email, Args)

		'Response.Write Email.AsString
		'Response.Write "Keys of Args: " & Join(Args.Keys, ", ")
		'Response.End

		Email_Sending = True
	End Function
End Class
%>
<%

' Define page object
Dim CustomView1_rpt
Set CustomView1_rpt = New crCustomView1_rpt
Set Page = CustomView1_rpt

' Page init processing
Call CustomView1_rpt.Page_Init()

' Page main processing
Call CustomView1_rpt.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<% If CustomView1.Export = "" Then %>
<script type="text/javascript">
<!--
// Create page object
var CustomView1_rpt = new ewrpt_Page("CustomView1_rpt");
// page properties
CustomView1_rpt.PageID = "rpt"; // page ID
CustomView1_rpt.FormID = "fCustomView1rptfilter"; // form ID
var EWRPT_PAGE_ID = CustomView1_rpt.PageID;
// extend page with ValidateForm function
CustomView1_rpt.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_ANO_MAT;
	if (elm && !ewrpt_CheckNumber(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(CustomView1.ANO_MAT.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv1_PERIODO_MAT;
	if (elm && !ewrpt_CheckNumber(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(CustomView1.PERIODO_MAT.FldErrMsg) %>"))
			return false;
	}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
CustomView1_rpt.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If EWRPT_CLIENT_VALIDATE Then %>
CustomView1_rpt.ValidateRequired = true; // uses JavaScript validation
<% Else %>
CustomView1_rpt.ValidateRequired = false; // no JavaScript validation
<% End If %>
//-->
</script>
<link rel="stylesheet" type="text/css" media="all" href="css/titles.css"/>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
//-->
</script>
<% End If %>
<% CustomView1_rpt.ShowPageHeader() %>
<% If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg() %>
<% CustomView1_rpt.ShowMessage() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If CustomView1.Export = "" Then %>
<script src="rptjs/popup.js" type="text/javascript"></script>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
</script>
<% End If %>
<% If CustomView1.Export = "" Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<div id="underline">
	<h1><%= CustomView1.TableCaption %></h1>
</div>
<% If CustomView1.Export = "" Then %>
&nbsp;&nbsp;<a href="<%= CustomView1_rpt.ExportExcelUrl %>&acc=<%=Request("acc")%>"><img src="images/Talwayseb - Excel 2007.png" border="0" title="Exportar a Excel" /></a>
<% End If %>
<br><br>
<% If CustomView1.Export = "" Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspreportmaker">
	<!-- Left slot -->
<% End If %>
<% If CustomView1.Export = "" Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If CustomView1.Export = "" Then %>
<%
If (CustomView1.FilterPanelOption = 2) Or (CustomView1.FilterPanelOption = 3 And CustomView1_rpt.FilterApplied) Or (CustomView1_rpt.Filter = "0=101") Then
	sButtonImage = "rptimages/collapse.gif"
	sDivDisplay = ""
Else
	sButtonImage = "rptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span>
<% If CustomView1_rpt.FilterApplied Then %>
&nbsp;&nbsp;<a href="CustomView1rpt.asp?cmd=reset&acc=<%=Request("acc")%>"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fCustomView1rptfilter" id="fCustomView1rptfilter" action="CustomView1rpt.asp?acc=<%=Request("acc")%>" class="ewForm" onsubmit="return CustomView1_rpt.ValidateForm(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.NOMBRE_C.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= ewrpt_IIf(CustomView1_rpt.ClearExtFilter = "CustomView1_NOMBRE_C", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(CustomView1.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(CustomView1.NOMBRE_C.CustomFilters) Then
	cntf = UBound(CustomView1.NOMBRE_C.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(CustomView1.NOMBRE_C.DropDownList) Then
	cntd = UBound(CustomView1.NOMBRE_C.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If CustomView1.NOMBRE_C.CustomFilters(i).FldName = "NOMBRE_C" Then
%>
		<option value="<%= "@@" & CustomView1.NOMBRE_C.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(CustomView1.NOMBRE_C.DropDownValue, "@@" & CustomView1.NOMBRE_C.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= CustomView1.NOMBRE_C.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= CustomView1.NOMBRE_C.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(CustomView1.NOMBRE_C.DropDownValue, CustomView1.NOMBRE_C.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(CustomView1.NOMBRE_C.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.ESTACAD.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ESTACAD" id="sv_ESTACAD"<%= ewrpt_IIf(CustomView1_rpt.ClearExtFilter = "CustomView1_ESTACAD", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(CustomView1.ESTACAD.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(CustomView1.ESTACAD.CustomFilters) Then
	cntf = UBound(CustomView1.ESTACAD.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(CustomView1.ESTACAD.DropDownList) Then
	cntd = UBound(CustomView1.ESTACAD.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If CustomView1.ESTACAD.CustomFilters(i).FldName = "ESTACAD" Then
%>
		<option value="<%= "@@" & CustomView1.ESTACAD.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(CustomView1.ESTACAD.DropDownValue, "@@" & CustomView1.ESTACAD.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= CustomView1.ESTACAD.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= CustomView1.ESTACAD.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(CustomView1.ESTACAD.DropDownValue, CustomView1.ESTACAD.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(CustomView1.ESTACAD.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.FACULTAD.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FACULTAD" id="sv_FACULTAD"<%= ewrpt_IIf(CustomView1_rpt.ClearExtFilter = "CustomView1_FACULTAD", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(CustomView1.FACULTAD.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(CustomView1.FACULTAD.CustomFilters) Then
	cntf = UBound(CustomView1.FACULTAD.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(CustomView1.FACULTAD.DropDownList) Then
	cntd = UBound(CustomView1.FACULTAD.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If CustomView1.FACULTAD.CustomFilters(i).FldName = "FACULTAD" Then
%>
		<option value="<%= "@@" & CustomView1.FACULTAD.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(CustomView1.FACULTAD.DropDownValue, "@@" & CustomView1.FACULTAD.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= CustomView1.FACULTAD.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= CustomView1.FACULTAD.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(CustomView1.FACULTAD.DropDownValue, CustomView1.FACULTAD.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(CustomView1.FACULTAD.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.ANO_MAT.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_ANO_MAT" id="so1_ANO_MAT" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_ANO_MAT" id="sv1_ANO_MAT" size="30" value="<%= ewrpt_HtmlEncode(CustomView1.ANO_MAT.SearchValue) %>"<% If CustomView1_rpt.ClearExtFilter = "CustomView1_ANO_MAT" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.PERIODO_MAT.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("=") %><input type="hidden" name="so1_PERIODO_MAT" id="so1_PERIODO_MAT" value="="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_PERIODO_MAT" id="sv1_PERIODO_MAT" size="30" value="<%= ewrpt_HtmlEncode(CustomView1.PERIODO_MAT.SearchValue) %>"<% If CustomView1_rpt.ClearExtFilter = "CustomView1_PERIODO_MAT" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= CustomView1.TIPOSITU.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_TIPOSITU" id="sv_TIPOSITU"<%= ewrpt_IIf(CustomView1_rpt.ClearExtFilter = "CustomView1_TIPOSITU", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(CustomView1.TIPOSITU.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(CustomView1.TIPOSITU.CustomFilters) Then
	cntf = UBound(CustomView1.TIPOSITU.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(CustomView1.TIPOSITU.DropDownList) Then
	cntd = UBound(CustomView1.TIPOSITU.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If CustomView1.TIPOSITU.CustomFilters(i).FldName = "TIPOSITU" Then
%>
		<option value="<%= "@@" & CustomView1.TIPOSITU.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(CustomView1.TIPOSITU.DropDownValue, "@@" & CustomView1.TIPOSITU.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= CustomView1.TIPOSITU.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= CustomView1.TIPOSITU.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(CustomView1.TIPOSITU.DropDownValue, CustomView1.TIPOSITU.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(CustomView1.TIPOSITU.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
</table>
<table class="ewRptExtFilter">
	<tr>
		<td><span class="aspreportmaker">
        	<input type="hidden" name="acc" value="<%=Request("acc")%>">
			<input type="Submit" name="Submit" id="Submit" value="<%= ReportLanguage.Phrase("Search") %>">&nbsp;
			<input type="Reset" name="Reset" id="Reset" value="<%= ReportLanguage.Phrase("Reset") %>">&nbsp;
		</span></td>
	</tr>
</table>
</form>
<!-- Search form (end) -->
</div>
<br>
<% End If %>
<% If CustomView1.ShowCurrentFilter Then %>
<div id="ewrptFilterList">
<% Call CustomView1_rpt.ShowFilterList() %>
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
If (CustomView1.ExportAll And CustomView1.Export <> "") Then
	CustomView1_rpt.StopGrp = CustomView1_rpt.TotalGrps
Else
	CustomView1_rpt.StopGrp = CustomView1_rpt.StartGrp + CustomView1_rpt.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(CustomView1_rpt.StopGrp) > CLng(CustomView1_rpt.TotalGrps) Then
	CustomView1_rpt.StopGrp = CustomView1_rpt.TotalGrps
End If
CustomView1_rpt.RecCount = 0

' Init Summary Values
Call CustomView1_rpt.ResetLevelSummary(0)

' Get first row
If CustomView1_rpt.TotalGrps > 0 Then
	Call CustomView1_rpt.GetRow(1)
	CustomView1_rpt.GrpCount = 1
End If
Do While (Not rs.Eof And CustomView1_rpt.GrpCount <= CustomView1_rpt.DisplayGrps) Or (CustomView1_rpt.ShowFirstHeader)

	' Show Header
	If CustomView1_rpt.ShowFirstHeader Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.CODCLI.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.CODCLI) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.CODCLI.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.CODCLI)%>&acc=<%=Request("acc")%>',1);"><%= CustomView1.CODCLI.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.CODCLI.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.CODCLI.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.DIG.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.DIG) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.DIG.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.DIG) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.DIG.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.DIG.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.DIG.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.PATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.PATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.PATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.PATERNO) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.PATERNO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.PATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.PATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.MATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.MATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.MATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.MATERNO) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.MATERNO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.MATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.MATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.NOMBRE.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.NOMBRE) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.NOMBRE.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.NOMBRE) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.NOMBRE.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.NOMBRE.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.NOMBRE.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.NOMBRE_C.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.NOMBRE_C) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.NOMBRE_C.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.NOMBRE_C) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.NOMBRE_C.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.NOMBRE_C.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.NOMBRE_C.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.JORNADA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.JORNADA) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.JORNADA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.JORNADA) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.JORNADA.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.JORNADA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.JORNADA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.CODCARR.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.CODCARR) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.CODCARR.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.CODCARR) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.CODCARR.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.CODCARR.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.CODCARR.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.ESTACAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.ESTACAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.ESTACAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.ESTACAD) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.ESTACAD.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.ESTACAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.ESTACAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.INGRESO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.INGRESO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.INGRESO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.INGRESO) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.INGRESO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.INGRESO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.INGRESO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.DIRECCION.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.DIRECCION) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.DIRECCION.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.DIRECCION) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.DIRECCION.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.DIRECCION.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.DIRECCION.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.COMUNA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.COMUNA) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.COMUNA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.COMUNA) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.COMUNA.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.COMUNA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.COMUNA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.CIUDAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.CIUDAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.CIUDAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.CIUDAD) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.CIUDAD.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.CIUDAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.CIUDAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.FONO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.FONO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.FONO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.FONO) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.FONO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.FONO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.FONO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.MAIL.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.MAIL) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.MAIL.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.MAIL) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.MAIL.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.MAIL.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.MAIL.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.SEXO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.SEXO) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.SEXO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.SEXO) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.SEXO.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.SEXO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.SEXO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.NACIONALIDAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.NACIONALIDAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.NACIONALIDAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.NACIONALIDAD) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.NACIONALIDAD.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.NACIONALIDAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.NACIONALIDAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.FACULTAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.FACULTAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.FACULTAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.FACULTAD) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.FACULTAD.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.FACULTAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.FACULTAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.codigo.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.codigo) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.codigo.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.codigo) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.codigo.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.codigo.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.codigo.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.ANO_MAT.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.ANO_MAT) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.ANO_MAT.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.ANO_MAT) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.ANO_MAT.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.ANO_MAT.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.ANO_MAT.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.PERIODO_MAT.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.PERIODO_MAT) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.PERIODO_MAT.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.PERIODO_MAT) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.PERIODO_MAT.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.PERIODO_MAT.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.PERIODO_MAT.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.TIPOSITU.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.TIPOSITU) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.TIPOSITU.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.TIPOSITU) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.TIPOSITU.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.TIPOSITU.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.TIPOSITU.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If CustomView1.Export <> "" Then %>
<%= CustomView1.DESCRIPCION.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If CustomView1.SortUrl(CustomView1.DESCRIPCION) = "" Then %>
		<td style="vertical-align: bottom;"><%= CustomView1.DESCRIPCION.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= CustomView1.SortUrl(CustomView1.DESCRIPCION) %>&acc=<%=Request("acc")%>',1);"><%= CustomView1.DESCRIPCION.FldCaption %></td><td style="width: 10px;">
		<% If CustomView1.DESCRIPCION.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf CustomView1.DESCRIPCION.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		CustomView1_rpt.ShowFirstHeader = False
	End If
	CustomView1_rpt.RecCount = CustomView1_rpt.RecCount + 1

		' Render detail row
		Call CustomView1.ResetCSS()
		CustomView1.RowType = EWRPT_ROWTYPE_DETAIL
		Call CustomView1_rpt.RenderRow()
%>
	<tr<%= CustomView1.RowAttributes %>>
		<td<%= CustomView1.CODCLI.CellAttributes %>>
<div<%= CustomView1.CODCLI.ViewAttributes %>><%= CustomView1.CODCLI.ListViewValue %></div>
</td>
		<td<%= CustomView1.DIG.CellAttributes %>>
<div<%= CustomView1.DIG.ViewAttributes %>><%= CustomView1.DIG.ListViewValue %></div>
</td>
		<td<%= CustomView1.PATERNO.CellAttributes %>>
<div<%= CustomView1.PATERNO.ViewAttributes %>><%= CustomView1.PATERNO.ListViewValue %></div>
</td>
		<td<%= CustomView1.MATERNO.CellAttributes %>>
<div<%= CustomView1.MATERNO.ViewAttributes %>><%= CustomView1.MATERNO.ListViewValue %></div>
</td>
		<td<%= CustomView1.NOMBRE.CellAttributes %>>
<div<%= CustomView1.NOMBRE.ViewAttributes %>><%= CustomView1.NOMBRE.ListViewValue %></div>
</td>
		<td<%= CustomView1.NOMBRE_C.CellAttributes %>>
<div<%= CustomView1.NOMBRE_C.ViewAttributes %>><%= CustomView1.NOMBRE_C.ListViewValue %></div>
</td>
		<td<%= CustomView1.JORNADA.CellAttributes %>>
<div<%= CustomView1.JORNADA.ViewAttributes %>><%= CustomView1.JORNADA.ListViewValue %></div>
</td>
		<td<%= CustomView1.CODCARR.CellAttributes %>>
<div<%= CustomView1.CODCARR.ViewAttributes %>><%= CustomView1.CODCARR.ListViewValue %></div>
</td>
		<td<%= CustomView1.ESTACAD.CellAttributes %>>
<div<%= CustomView1.ESTACAD.ViewAttributes %>><%= CustomView1.ESTACAD.ListViewValue %></div>
</td>
		<td<%= CustomView1.INGRESO.CellAttributes %>>
<div<%= CustomView1.INGRESO.ViewAttributes %>><%= CustomView1.INGRESO.ListViewValue %></div>
</td>
		<td<%= CustomView1.DIRECCION.CellAttributes %>>
<div<%= CustomView1.DIRECCION.ViewAttributes %>><%= CustomView1.DIRECCION.ListViewValue %></div>
</td>
		<td<%= CustomView1.COMUNA.CellAttributes %>>
<div<%= CustomView1.COMUNA.ViewAttributes %>><%= CustomView1.COMUNA.ListViewValue %></div>
</td>
		<td<%= CustomView1.CIUDAD.CellAttributes %>>
<div<%= CustomView1.CIUDAD.ViewAttributes %>><%= CustomView1.CIUDAD.ListViewValue %></div>
</td>
		<td<%= CustomView1.FONO.CellAttributes %>>
<div<%= CustomView1.FONO.ViewAttributes %>><%= CustomView1.FONO.ListViewValue %></div>
</td>
		<td<%= CustomView1.MAIL.CellAttributes %>>
<div<%= CustomView1.MAIL.ViewAttributes %>><%= CustomView1.MAIL.ListViewValue %></div>
</td>
		<td<%= CustomView1.SEXO.CellAttributes %>>
<div<%= CustomView1.SEXO.ViewAttributes %>><%= CustomView1.SEXO.ListViewValue %></div>
</td>
		<td<%= CustomView1.NACIONALIDAD.CellAttributes %>>
<div<%= CustomView1.NACIONALIDAD.ViewAttributes %>><%= CustomView1.NACIONALIDAD.ListViewValue %></div>
</td>
		<td<%= CustomView1.FACULTAD.CellAttributes %>>
<div<%= CustomView1.FACULTAD.ViewAttributes %>><%= CustomView1.FACULTAD.ListViewValue %></div>
</td>
		<td<%= CustomView1.codigo.CellAttributes %>>
<div<%= CustomView1.codigo.ViewAttributes %>><%= CustomView1.codigo.ListViewValue %></div>
</td>
		<td<%= CustomView1.ANO_MAT.CellAttributes %>>
<div<%= CustomView1.ANO_MAT.ViewAttributes %>><%= CustomView1.ANO_MAT.ListViewValue %></div>
</td>
		<td<%= CustomView1.PERIODO_MAT.CellAttributes %>>
<div<%= CustomView1.PERIODO_MAT.ViewAttributes %>><%= CustomView1.PERIODO_MAT.ListViewValue %></div>
</td>
		<td<%= CustomView1.TIPOSITU.CellAttributes %>>
<div<%= CustomView1.TIPOSITU.ViewAttributes %>><%= CustomView1.TIPOSITU.ListViewValue %></div>
</td>
		<td<%= CustomView1.DESCRIPCION.CellAttributes %>>
<div<%= CustomView1.DESCRIPCION.ViewAttributes %>><%= CustomView1.DESCRIPCION.ListViewValue %></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Call CustomView1_rpt.AccumulateSummary()

		' Get next record
		Call CustomView1_rpt.GetRow(2)
		CustomView1_rpt.GrpCount = CustomView1_rpt.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
	</tfoot>
</table>
</div>
<% If CustomView1.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="CustomView1rpt.asp?acc=<%=Request("acc")%>" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(CustomView1_rpt.StartGrp, CustomView1_rpt.DisplayGrps, CustomView1_rpt.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.FirstButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.PrevButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.NextButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="CustomView1rpt.asp?start=<%= Pager.LastButton.Start %>&acc=<%=Request("acc")%>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% End If %>
	<td><span class="aspreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %>&nbsp;<%= Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("Record") %>&nbsp;<%= Pager.FromIndex %>&nbsp;<%= ReportLanguage.Phrase("To") %>&nbsp;<%= Pager.ToIndex %>&nbsp;<%= ReportLanguage.Phrase("Of") %>&nbsp;<%=  Pager.RecordCount %></span>
<% Else %>
	<% If CustomView1_rpt.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If CustomView1_rpt.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("RecordsPerPage") %>&nbsp;
<input type="hidden" name="acc" value="<%=Request("acc")%>">
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="10"<% If CustomView1_rpt.DisplayGrps = 10 Then Response.Write " selected=""selected""" %>>10</option>
<option value="20"<% If CustomView1_rpt.DisplayGrps = 20 Then Response.Write " selected=""selected""" %>>20</option>
<option value="50"<% If CustomView1_rpt.DisplayGrps = 50 Then Response.Write " selected=""selected""" %>>50</option>
<option value="100"<% If CustomView1_rpt.DisplayGrps = 100 Then Response.Write " selected=""selected""" %>>100</option>
<option value="200"<% If CustomView1_rpt.DisplayGrps = 200 Then Response.Write " selected=""selected""" %>>200</option>
<option value="ALL"<% If CustomView1.GroupPerPage = -1 Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("AllRecords") %></option>
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
<% If CustomView1.Export = "" Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspreportmaker">
	<!-- Right slot -->
<% End If %>
<% If CustomView1.Export = "" Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If CustomView1.Export = "" Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% CustomView1_rpt.ShowPageFooter() %>
<%

' Close recordset and connection
rs.Close
Set rs = Nothing
%>
<% If CustomView1.Export = "" Then %>
<script language="JavaScript" type="text/javascript">
<!--
// Write your table-specific startup script here
// document.write("page loaded");
//-->
</script>
<% End If %>
<!--#include file="rptinc/footer.asp"-->
<%

' Drop page object
Set CustomView1_rpt = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crCustomView1_rpt

	' Page ID
	Public Property Get PageID()
		PageID = "rpt"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "CustomView1"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "CustomView1_rpt"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If CustomView1.UseTokenInUrl Then PageUrl = PageUrl & "t=" & CustomView1.TableVar & "&" ' add page token
	End Property

	' Export URLs
	Dim ExportPrintUrl
	Dim ExportExcelUrl
	Dim ExportWordUrl

	' Message
	Public Property Get Message()
		Message = Session(EWRPT_SESSION_MESSAGE)
	End Property

	Public Property Let Message(v)
		If Session(EWRPT_SESSION_MESSAGE) <> "" Then ' Append
			Session(EWRPT_SESSION_MESSAGE) = Session(EWRPT_SESSION_MESSAGE) & "<br />" & v
		Else
			Session(EWRPT_SESSION_MESSAGE) = v
		End If
	End Property

	' Show Message
	Public Sub ShowMessage()
		Dim sMessage
		sMessage = Message
		Call Message_Showing(sMessage)
		If sMessage <> "" Then Response.Write "<p><span class=""ewMessage"">" & sMessage & "</span></p>"
		Session(EWRPT_SESSION_MESSAGE) = "" ' Clear message in Session
	End Sub
	Dim PageHeader
	Dim PageFooter

	' Show Page Header
	Sub ShowPageHeader()
		Dim sHeader
		sHeader = PageHeader
		Call Page_DataRendering(sHeader)
		If sHeader <> "" Then ' Header exists, display
			Response.Write "<p><span class=""aspreportmaker"">" & sHeader & "</span></p>"
		End If
	End Sub

	' Show Page Footer
	Sub ShowPageFooter()
		sFooter = PageFooter
		Call Page_DataRendered(sFooter)
		If sFooter <> "" Then ' Fotoer exists, display
			Response.Write "<p><span class=""aspreportmaker"">" & sFooter & "</span></p>"
		End If
	End Sub

	' Validate page request
	Public Function IsPageRequest()
		If CustomView1.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (CustomView1.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (CustomView1.TableVar = Request.QueryString("t"))
			End If
		Else
			IsPageRequest = True
		End If
	End Function

	' -----------------------------------------------------------------
	'  Class initialize
	'  - init objects
	'  - open ADO connection
	'
	Private Sub Class_Initialize()
		StartTimer = Timer ' Init start time

		' Language object
		Set ReportLanguage = New crLanguage

		' Initialize table object
		Set CustomView1 = New crCustomView1

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "rpt"

		' Initialize table name
		EWRPT_TABLE_NAME = "CustomView1"

		' Open connection
		Call ewrpt_Connect()
	End Sub

	' 
	'  Page_Init
	'
	Sub Page_Init()

		' Restore session
		If Request.QueryString("session").Count > 0 Then
			Call RestoreFromSession()
		End If

		' Get export parameters
		If Request.QueryString("export").Count > 0 Then
			CustomView1.Export = Request.QueryString("export")
		End If
		gsExport = CustomView1.Export ' Get export parameter, used in header
		gsExportFile = CustomView1.TableVar ' Get export file, used in header
		If CustomView1.Export = "excel" Then
			Response.ContentType = "application/vnd.ms-excel;charset=utf-8"
			Response.AddHeader "Content-Disposition", "attachment; filename=" & gsExportFile & ".xls"
		End If

		' Global page loading event
		Call Page_Loading()

		' Page load event
		Call Page_Load()

		' Export to Email (Load content via XMLHttp)
		If CustomView1.Export = "email" Then
			Dim sContent, sPage, sParm
			sPage = ewrpt_CurrentPage
			sParm = "export=print&session=" & GetSessionValues()
			sContent = ewrpt_LoadContentFromUrl(ewrpt_ConvertFullUrl(sPage) & "?" & sParm)
			Call ExportEmail(sContent)
			Call Page_Terminate(sPage)
		End If
	End Sub

	Private Function GetSessionValues()
		Dim wrkstr, i, ar
		wrkstr = "cmd=restoresession"

		'wrkstr = "&filter=" & CustomView1.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(CustomView1.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(CustomView1.StartGroup&""))
		wrkstr = ew_Encode(TEAencrypt(wrkstr, EWRPT_RANDOM_KEY))
		GetSessionValues = wrkstr
	End Function

	Private Sub RestoreFromSession()
		Dim QS, wrkstr, cmd, usr, pwd
		QS = Split(Request.Querystring, "&")
		wrkstr = GetQSValue(QS, "session")
		wrkstr = TEAdecrypt(wrkstr, EWRPT_RANDOM_KEY)
		QS = Split(wrkstr, "&")
		cmd = GetQSValue(QS, "cmd")
		If cmd = "restoresession" Then
			usr = GetQSValue(QS, "u")
			usr = TEAdecrypt(usr, EWRPT_RANDOM_KEY)
			pwd = GetQSValue(QS, "p")
			pwd = TEAdecrypt(pwd, EWRPT_RANDOM_KEY)
			Call Security.ValidateUser(usr, pwd, True)
			Session(EWRPT_SESSION_FILTER) = GetQSValue(QS, "f")
			Session(EWRPT_SESSION_COLUMN_SELECTION) = GetQSArray(QS, "c")
			CustomView1.OrderBy = GetQSValue(QS, "o")
			CustomView1.StartGroup = GetQSValue(QS, "s")
			CustomView1.RestoreSession = True
		End If
	End Sub

	Private Function GetQSValue(QS, Key)
		Dim kv, i
		If IsArray(QS) Then
			For i = 0 To UBound(QS)
				kv = Split(QS(i), "=")
				If kv(0) = Key And UBound(kv) >= 1 Then
					GetQSValue = ew_Decode(kv(1))
					Exit Function
				End If
			Next
		End If
		GetQSValue = ""
	End Function

	Private Function GetQSArray(QS, Key)
		Dim kv, i, ar, val
		ar = ""
		If IsArray(QS) Then
			For i = 0 To UBound(QS)
				kv = Split(QS(i), "=")
				If kv(0) = Key And UBound(kv) >= 1 Then
					val = ew_Decode(kv(1))
					If IsArray(ar) Then
						ReDim Preserve ar(UBound(ar)+1)
					Else
						ReDim ar(0)
					End If
					ar(UBound(ar)) = val
				End If
			Next
		End If
		GetQSArray = ar
	End Function

	'
	' Class_Terminate
	'
	Private Sub Class_Terminate()
		Call Page_Terminate("")
	End Sub

	'
	' Page_Terminate
	'
	Sub Page_Terminate(url)

		' Page unload event
		Call Page_Unload()

		' Global page unloaded event
		Call Page_Unloaded()

		' Close connection
		If Not (conn Is Nothing) Then conn.Close
		Set conn = Nothing
		Set CustomView1 = Nothing

		' Go to url if specified
		Dim sRedirectUrl
		sReDirectUrl = url
		If sReDirectUrl <> "" Then
			If Response.Buffer Then Response.Clear
			Response.Redirect sReDirectUrl
		End If
	End Sub

	' Initialize common variables
	' Paging variables

	Dim RecCount ' Record count
	Dim StartGrp ' Start group
	Dim StopGrp ' Stop group
	Dim TotalGrps ' Total groups
	Dim GrpCount ' Group count
	Dim DisplayGrps ' Groups per page
	Dim GrpRange
	Dim Sort
	Dim Filter
	Dim UserIDFilter

	' Clear field for ext filter
	Dim ClearExtFilter
	Dim FilterApplied
	Dim ShowFirstHeader
	Dim Cnt, Col, Val, Smry, Mn, Mx, GrandSmry, GrandMn, GrandMx
	Dim TotCount

	'
	' Page main
	'
	Sub Page_Main()
		RecCount = 0 ' Record count
		StartGrp = 0 ' Start group
		StopGrp = 0 ' Stop group
		TotalGrps = 0 ' Total groups
		GrpCount = 0 ' Group count
		DisplayGrps = 50 ' Groups per page
		GrpRange = 10

		' Clear field for ext filter
		ClearExtFilter = ""

		' Filter
		UserIDFilter = ""
		Filter = ""

		' 1st dimension = no of groups (level 0 used for grand total)
		' 2nd dimension = no of fields

		Dim nDtls, nGrps
		nDtls = 23
		nGrps = 0
		ReDim Col(nDtls), Val(nDtls), Cnt(nGrps, nDtls)
		ReDim Smry(nGrps, nDtls), Mn(nGrps, nDtls), Mx(nGrps, nDtls)
		ReDim GrandSmry(nDtls), GrandMn(nDtls), GrandMx(nDtls)

		' Set up if accumulation required
		Col(1) = False
		Col(2) = False
		Col(3) = False
		Col(4) = False
		Col(5) = False
		Col(6) = False
		Col(7) = False
		Col(8) = False
		Col(9) = False
		Col(10) = False
		Col(11) = False
		Col(12) = False
		Col(13) = False
		Col(14) = False
		Col(15) = False
		Col(16) = False
		Col(17) = False
		Col(18) = False
		Col(19) = False
		Col(20) = False
		Col(21) = False
		Col(22) = False
		Col(23) = False

		' Set up groups per page dynamically
		SetUpDisplayGrps()

		' Load default filter values
		Call LoadDefaultFilters()

		' Set up popup filter
		Call SetupPopup()

		' Extended filter
		Dim sExtendedFilter
		sExtendedFilter = ""

		' Get dropdown values
		Call GetExtendedFilterValues()

		' Load custom filters
		Call CustomView1.CustomFilters_Load()

		' Build extended filter
		sExtendedFilter = GetExtendedFilter()
		If sExtendedFilter <> "" Then
			If Filter <> "" Then
				Filter = "(" & Filter & ") AND (" & sExtendedFilter & ")"
			Else
				Filter = sExtendedFilter
			End If
		End If

		' Build popup filter
		Dim sPopupFilter
		sPopupFilter = GetPopupFilter()
		IF sPopupFilter <> "" Then
			If Filter <> "" Then
				Filter = "(" & Filter & ") AND (" & sPopupFilter & ")"
			Else
				Filter = sPopupFilter
			End If
		End If

		' Check if filter applied
		FilterApplied = CheckFilter()

		' Get sort
		Sort = GetSort()

		' Restore filter/sort from Session
		If CustomView1.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total count
		Dim sSql
		sSql = ewrpt_BuildReportSql(CustomView1.SqlSelect, CustomView1.SqlWhere, CustomView1.SqlGroupBy, CustomView1.SqlHaving, CustomView1.SqlOrderBy, Filter, Sort)
		Call ewrpt_SetDebugMsg("(SQL): " & sSql)
		TotalGrps = ewrpt_LoadRecordCount(sSql)

		' Display all records
		If DisplayGrps <= 0 Then
			DisplayGrps = TotalGrps
		End If
		StartGrp = 1

		' Show header
		ShowFirstHeader = (TotalGrps > 0)

		'ShowFirstHeader = True ' Uncomment to always show header
		' Set up start position if not export all

		If CustomView1.ExportAll And CustomView1.Export <> "" Then
			DisplayGrps = TotalGrps
		Else
			Call SetUpStartGroup()
		End If

		' Get current page records
		Set rs = GetRs(sSql, StartGrp, DisplayGrps)
	End Sub

	' Accummulate summary
	Sub AccumulateSummary()
		Dim valwrk, ix, iy
		For ix = 0 to UBound(Smry,1)
			For iy = 1 to UBound(Smry,2)
				Cnt(ix,iy) = Cnt(ix,iy) + 1
				If Col(iy) Then
					valwrk = Val(iy)
					If IsNull(valwrk) Or Not IsNumeric(valwrk) Then

						' skip
					Else
						Smry(ix,iy) = Smry(ix,iy) + valwrk
						If IsNull(Mn(ix,iy)) Then
							Mn(ix,iy) = valwrk
							Mx(ix,iy) = valwrk
						Else
							If Mn(ix,iy) > valwrk Then Mn(ix,iy) = valwrk
							If Mx(ix,iy) < valwrk Then Mx(ix,iy) = valwrk
						End If
					End If
				End If
			Next
		Next
		For ix = 1 to UBound(Smry,1)
			Cnt(ix,0) = Cnt(ix,0) + 1
		Next
	End Sub

	' Reset level summary
	Sub ResetLevelSummary(lvl)
		Dim ix, iy

		' Clear summary values
		For ix = lvl to UBound(Smry,1)
			For iy = 1 to UBound(Smry,2)
				Cnt(ix,iy) = 0
				If Col(iy) Then
					Smry(ix,iy) = 0
					Mn(ix,iy) = Null
					Mx(ix,iy) = Null
				End If
			Next
		Next
		For ix = lvl to UBound(Smry,1)
			Cnt(ix,0) = 0
		Next

		' Reset record count
		RecCount = 0
	End Sub

	' Accummulate grand summary
	Sub AccumulateGrandSummary()
		Dim iy, valwrk
		Cnt(0,0) = Cnt(0,0) + 1
		For iy = 1 to UBound(GrandSmry)
			If Col(iy) Then
				valwrk = Val(iy)
				If IsNull(valwrk) Or Not IsNumeric(valwrk) Then

					' skip
				Else
					GrandSmry(iy) = GrandSmry(iy) + valwrk
					If IsNull(GrandMn(iy)) Then
						GrandMn(iy) = valwrk
						GrandMx(iy) = valwrk
					Else
						If GrandMn(iy) > valwrk Then GrandMn(iy) = valwrk
						If GrandMx(iy) < valwrk Then GrandMx(iy) = valwrk
					End If
				End If
			End If
		Next
	End Sub

	' Get rs
	Function GetRs(sql, start, grps)
		Dim rswrk, wrksql
		wrksql = sql
		Set rswrk = ewrpt_LoadRs(wrksql)
		If Not rswrk.Eof And start > 1 Then rswrk.Move (start-1)
		Set GetRs = rswrk
	End Function

	' Get row values
	Sub GetRow(opt)
		If opt = 1 Then ' Get first row

			'If Not rs.Eof Then rs.MoveFirst ' NOTE: no need to move position
		Else ' Get next row
			If Not rs.Eof Then rs.MoveNext
		End If
		If Not rs.Eof Then
			CustomView1.CODCLI.DbValue = ewrpt_GetValue(rs("CODCLI"))
			CustomView1.DIG.DbValue = ewrpt_GetValue(rs("DIG"))
			CustomView1.PATERNO.DbValue = ewrpt_GetValue(rs("PATERNO"))
			CustomView1.MATERNO.DbValue = ewrpt_GetValue(rs("MATERNO"))
			CustomView1.NOMBRE.DbValue = ewrpt_GetValue(rs("NOMBRE"))
			CustomView1.NOMBRE_C.DbValue = ewrpt_GetValue(rs("NOMBRE_C"))
			CustomView1.JORNADA.DbValue = ewrpt_GetValue(rs("JORNADA"))
			CustomView1.CODCARR.DbValue = ewrpt_GetValue(rs("CODCARR"))
			CustomView1.ESTACAD.DbValue = ewrpt_GetValue(rs("ESTACAD"))
			CustomView1.INGRESO.DbValue = ewrpt_GetValue(rs("INGRESO"))
			CustomView1.DIRECCION.DbValue = ewrpt_GetValue(rs("DIRECCION"))
			CustomView1.COMUNA.DbValue = ewrpt_GetValue(rs("COMUNA"))
			CustomView1.CIUDAD.DbValue = ewrpt_GetValue(rs("CIUDAD"))
			CustomView1.FONO.DbValue = ewrpt_GetValue(rs("FONO"))
			CustomView1.MAIL.DbValue = ewrpt_GetValue(rs("MAIL"))
			CustomView1.SEXO.DbValue = ewrpt_GetValue(rs("SEXO"))
			CustomView1.NACIONALIDAD.DbValue = ewrpt_GetValue(rs("NACIONALIDAD"))
			CustomView1.FACULTAD.DbValue = ewrpt_GetValue(rs("FACULTAD"))
			CustomView1.codigo.DbValue = ewrpt_GetValue(rs("codigo"))
			CustomView1.ANO_MAT.DbValue = ewrpt_GetValue(rs("ANO_MAT"))
			CustomView1.PERIODO_MAT.DbValue = ewrpt_GetValue(rs("PERIODO_MAT"))
			CustomView1.TIPOSITU.DbValue = ewrpt_GetValue(rs("TIPOSITU"))
			CustomView1.DESCRIPCION.DbValue = ewrpt_GetValue(rs("DESCRIPCION"))
			Val(1) = CustomView1.CODCLI.CurrentValue
			Val(2) = CustomView1.DIG.CurrentValue
			Val(3) = CustomView1.PATERNO.CurrentValue
			Val(4) = CustomView1.MATERNO.CurrentValue
			Val(5) = CustomView1.NOMBRE.CurrentValue
			Val(6) = CustomView1.NOMBRE_C.CurrentValue
			Val(7) = CustomView1.JORNADA.CurrentValue
			Val(8) = CustomView1.CODCARR.CurrentValue
			Val(9) = CustomView1.ESTACAD.CurrentValue
			Val(10) = CustomView1.INGRESO.CurrentValue
			Val(11) = CustomView1.DIRECCION.CurrentValue
			Val(12) = CustomView1.COMUNA.CurrentValue
			Val(13) = CustomView1.CIUDAD.CurrentValue
			Val(14) = CustomView1.FONO.CurrentValue
			Val(15) = CustomView1.MAIL.CurrentValue
			Val(16) = CustomView1.SEXO.CurrentValue
			Val(17) = CustomView1.NACIONALIDAD.CurrentValue
			Val(18) = CustomView1.FACULTAD.CurrentValue
			Val(19) = CustomView1.codigo.CurrentValue
			Val(20) = CustomView1.ANO_MAT.CurrentValue
			Val(21) = CustomView1.PERIODO_MAT.CurrentValue
			Val(22) = CustomView1.TIPOSITU.CurrentValue
			Val(23) = CustomView1.DESCRIPCION.CurrentValue
		Else
			CustomView1.CODCLI.DbValue = ""
			CustomView1.DIG.DbValue = ""
			CustomView1.PATERNO.DbValue = ""
			CustomView1.MATERNO.DbValue = ""
			CustomView1.NOMBRE.DbValue = ""
			CustomView1.NOMBRE_C.DbValue = ""
			CustomView1.JORNADA.DbValue = ""
			CustomView1.CODCARR.DbValue = ""
			CustomView1.ESTACAD.DbValue = ""
			CustomView1.INGRESO.DbValue = ""
			CustomView1.DIRECCION.DbValue = ""
			CustomView1.COMUNA.DbValue = ""
			CustomView1.CIUDAD.DbValue = ""
			CustomView1.FONO.DbValue = ""
			CustomView1.MAIL.DbValue = ""
			CustomView1.SEXO.DbValue = ""
			CustomView1.NACIONALIDAD.DbValue = ""
			CustomView1.FACULTAD.DbValue = ""
			CustomView1.codigo.DbValue = ""
			CustomView1.ANO_MAT.DbValue = ""
			CustomView1.PERIODO_MAT.DbValue = ""
			CustomView1.TIPOSITU.DbValue = ""
			CustomView1.DESCRIPCION.DbValue = ""
		End If
	End Sub

	'-------------------------------------------------------------------------------
	' Function SetUpStartGroup
	' - Set up Starting Record parameters based on Pager Navigation
	' - Variables setup: StartGrp
	Sub SetUpStartGroup()
		Dim nPageNo

		' Exit if DisplayGrps = 0
		If DisplayGrps = 0 Then Exit Sub

		' Check for a START parameter
		If Request.QueryString(EWRPT_TABLE_START_GROUP).Count > 0 Then
			StartGrp = Request.QueryString(EWRPT_TABLE_START_GROUP)
			CustomView1.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				CustomView1.StartGroup = nStartGrp
			Else
				StartGrp = CustomView1.StartGroup
			End If
		Else
			StartGrp = CustomView1.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			CustomView1.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			CustomView1.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			CustomView1.StartGroup = StartGrp
		End If
	End Sub

	' Set up popup
	Sub SetupPopup()
		Dim sName, arValues, cntValues
		Dim i, ar
		Dim sSql, rswrk
		Dim bNullValue, bEmptyValue
		Dim grpval

		' Initialize popup
		' Process post back form

		If Request.Form.Count > 0 Then
			sName = Request.Form("popup") ' Get popup form name
			If sName <> "" Then
				cntValues = Request.Form("sel_" & sName).Count
				If cntValues > 0 Then
					Redim arValues(cntValues-1)
					For i = 1 to cntValues
						arValues(i-1) = Request.Form("sel_" & sName)(i)
					Next
					If Trim(arValues(0)) = "" Then ' Select all
						arValues = EWRPT_INIT_VALUE
					End If
					If Not ewrpt_MatchedArray(arValues, Session("sel_" & sName)) Then
						If HasSessionFilterValues(sName) Then
							ClearExtFilter = sName ' Clear extended filter for this field
						End If
					End If
					Session("sel_" & sName) = arValues
					Session("rf_" & sName) = Request.Form("rf_" & sName)
					Session("rt_" & sName) = Request.Form("rt_" & sName)
					Call ResetPager()
				End If
			End If

		' Get Reset Cmd
		ElseIf Request.QueryString("cmd").Count > 0 Then
			Dim sCmd
			sCmd = Request.QueryString("cmd")
			If LCase(sCmd) = "reset" Then
				Call ResetPager()
			End If
		End If

		' Load selection criteria to array
	End Sub

	' Reset pager to starting position
	Sub ResetPager()
		StartGrp = 1
		CustomView1.StartGroup = StartGrp
	End Sub

	'-------------------------------------------------------------------------------
	' Function SetUpDisplayGrps
	' - Set up Number of Groups displayed per page based on Form element GrpPerPage
	' - Variables setup: nDisplayGrps
	Sub SetUpDisplayGrps()
		Dim sWrk
		sWrk = Request.QueryString(EWRPT_TABLE_GROUP_PER_PAGE)
		If sWrk <> "" Then
			If IsNumeric(sWrk) Then
				DisplayGrps = CInt(sWrk)
			Else
				If UCase(sWrk) = "ALL" Then ' Display All Records
					DisplayGrps = -1
				Else
					DisplayGrps = 50 ' Non-numeric, Load Default
				End If
			End If
			CustomView1.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			CustomView1.StartGroup = nStartGrp
		Else
			If CustomView1.GroupPerPage <> "" Then
				DisplayGrps = CustomView1.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 50 ' Load Default
			End If
		End If
	End Sub

	' Render row
	Sub RenderRow()
		If CustomView1.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' Get total count from sql directly
			Dim sSql, rstot
			sSql = ewrpt_BuildReportSql(CustomView1.SqlSelectCount, CustomView1.SqlWhere, CustomView1SqlGroupBy, CustomView1.SqlHaving, "", Filter, "")
			If EWRPT_DEBUG_ENABLED Then Response.Write "(Total SQL): " & sSql & "<br>"
			Set rstot = ewrpt_LoadRs(sSql)
			If Not rstot.Eof Then
				TotCount = ewrpt_GetValue(rstot(0))
			Else
				TotCount = 0
			End If
		End If

		' Call Row_Rendering event
		Call CustomView1.Row_Rendering()

		' --------------------
		'  Render view codes
		' --------------------

		If CustomView1.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' CODCLI
			CustomView1.CODCLI.ViewValue = CustomView1.CODCLI.Summary

			' DIG
			CustomView1.DIG.ViewValue = CustomView1.DIG.Summary

			' PATERNO
			CustomView1.PATERNO.ViewValue = CustomView1.PATERNO.Summary

			' MATERNO
			CustomView1.MATERNO.ViewValue = CustomView1.MATERNO.Summary

			' NOMBRE
			CustomView1.NOMBRE.ViewValue = CustomView1.NOMBRE.Summary

			' NOMBRE_C
			CustomView1.NOMBRE_C.ViewValue = CustomView1.NOMBRE_C.Summary

			' JORNADA
			CustomView1.JORNADA.ViewValue = CustomView1.JORNADA.Summary

			' CODCARR
			CustomView1.CODCARR.ViewValue = CustomView1.CODCARR.Summary

			' ESTACAD
			CustomView1.ESTACAD.ViewValue = CustomView1.ESTACAD.Summary

			' INGRESO
			CustomView1.INGRESO.ViewValue = CustomView1.INGRESO.Summary

			' DIRECCION
			CustomView1.DIRECCION.ViewValue = CustomView1.DIRECCION.Summary

			' COMUNA
			CustomView1.COMUNA.ViewValue = CustomView1.COMUNA.Summary

			' CIUDAD
			CustomView1.CIUDAD.ViewValue = CustomView1.CIUDAD.Summary

			' FONO
			CustomView1.FONO.ViewValue = CustomView1.FONO.Summary

			' MAIL
			CustomView1.MAIL.ViewValue = CustomView1.MAIL.Summary

			' SEXO
			CustomView1.SEXO.ViewValue = CustomView1.SEXO.Summary

			' NACIONALIDAD
			CustomView1.NACIONALIDAD.ViewValue = CustomView1.NACIONALIDAD.Summary

			' FACULTAD
			CustomView1.FACULTAD.ViewValue = CustomView1.FACULTAD.Summary

			' codigo
			CustomView1.codigo.ViewValue = CustomView1.codigo.Summary

			' ANO_MAT
			CustomView1.ANO_MAT.ViewValue = CustomView1.ANO_MAT.Summary

			' PERIODO_MAT
			CustomView1.PERIODO_MAT.ViewValue = CustomView1.PERIODO_MAT.Summary

			' TIPOSITU
			CustomView1.TIPOSITU.ViewValue = CustomView1.TIPOSITU.Summary

			' DESCRIPCION
			CustomView1.DESCRIPCION.ViewValue = CustomView1.DESCRIPCION.Summary
		Else

			' CODCLI
			CustomView1.CODCLI.ViewValue = CustomView1.CODCLI.CurrentValue
			Call ewrpt_SetAttr(CustomView1.CODCLI.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' DIG
			CustomView1.DIG.ViewValue = CustomView1.DIG.CurrentValue
			Call ewrpt_SetAttr(CustomView1.DIG.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PATERNO
			CustomView1.PATERNO.ViewValue = CustomView1.PATERNO.CurrentValue
			Call ewrpt_SetAttr(CustomView1.PATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' MATERNO
			CustomView1.MATERNO.ViewValue = CustomView1.MATERNO.CurrentValue
			Call ewrpt_SetAttr(CustomView1.MATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE
			CustomView1.NOMBRE.ViewValue = CustomView1.NOMBRE.CurrentValue
			Call ewrpt_SetAttr(CustomView1.NOMBRE.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE_C
			CustomView1.NOMBRE_C.ViewValue = CustomView1.NOMBRE_C.CurrentValue
			Call ewrpt_SetAttr(CustomView1.NOMBRE_C.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' JORNADA
			CustomView1.JORNADA.ViewValue = CustomView1.JORNADA.CurrentValue
			Call ewrpt_SetAttr(CustomView1.JORNADA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CODCARR
			CustomView1.CODCARR.ViewValue = CustomView1.CODCARR.CurrentValue
			Call ewrpt_SetAttr(CustomView1.CODCARR.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ESTACAD
			CustomView1.ESTACAD.ViewValue = CustomView1.ESTACAD.CurrentValue
			Call ewrpt_SetAttr(CustomView1.ESTACAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' INGRESO
			CustomView1.INGRESO.ViewValue = CustomView1.INGRESO.CurrentValue
			Call ewrpt_SetAttr(CustomView1.INGRESO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' DIRECCION
			CustomView1.DIRECCION.ViewValue = CustomView1.DIRECCION.CurrentValue
			Call ewrpt_SetAttr(CustomView1.DIRECCION.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' COMUNA
			CustomView1.COMUNA.ViewValue = CustomView1.COMUNA.CurrentValue
			Call ewrpt_SetAttr(CustomView1.COMUNA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CIUDAD
			CustomView1.CIUDAD.ViewValue = CustomView1.CIUDAD.CurrentValue
			Call ewrpt_SetAttr(CustomView1.CIUDAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' FONO
			CustomView1.FONO.ViewValue = CustomView1.FONO.CurrentValue
			Call ewrpt_SetAttr(CustomView1.FONO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' MAIL
			CustomView1.MAIL.ViewValue = CustomView1.MAIL.CurrentValue
			Call ewrpt_SetAttr(CustomView1.MAIL.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' SEXO
			CustomView1.SEXO.ViewValue = CustomView1.SEXO.CurrentValue
			Call ewrpt_SetAttr(CustomView1.SEXO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NACIONALIDAD
			CustomView1.NACIONALIDAD.ViewValue = CustomView1.NACIONALIDAD.CurrentValue
			Call ewrpt_SetAttr(CustomView1.NACIONALIDAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' FACULTAD
			CustomView1.FACULTAD.ViewValue = CustomView1.FACULTAD.CurrentValue
			Call ewrpt_SetAttr(CustomView1.FACULTAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' codigo
			CustomView1.codigo.ViewValue = CustomView1.codigo.CurrentValue
			Call ewrpt_SetAttr(CustomView1.codigo.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ANO_MAT
			CustomView1.ANO_MAT.ViewValue = CustomView1.ANO_MAT.CurrentValue
			Call ewrpt_SetAttr(CustomView1.ANO_MAT.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PERIODO_MAT
			CustomView1.PERIODO_MAT.ViewValue = CustomView1.PERIODO_MAT.CurrentValue
			Call ewrpt_SetAttr(CustomView1.PERIODO_MAT.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' TIPOSITU
			CustomView1.TIPOSITU.ViewValue = CustomView1.TIPOSITU.CurrentValue
			Call ewrpt_SetAttr(CustomView1.TIPOSITU.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' DESCRIPCION
			CustomView1.DESCRIPCION.ViewValue = CustomView1.DESCRIPCION.CurrentValue
			Call ewrpt_SetAttr(CustomView1.DESCRIPCION.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))
		End If

		' CODCLI
		CustomView1.CODCLI.HrefValue = ""

		' DIG
		CustomView1.DIG.HrefValue = ""

		' PATERNO
		CustomView1.PATERNO.HrefValue = ""

		' MATERNO
		CustomView1.MATERNO.HrefValue = ""

		' NOMBRE
		CustomView1.NOMBRE.HrefValue = ""

		' NOMBRE_C
		CustomView1.NOMBRE_C.HrefValue = ""

		' JORNADA
		CustomView1.JORNADA.HrefValue = ""

		' CODCARR
		CustomView1.CODCARR.HrefValue = ""

		' ESTACAD
		CustomView1.ESTACAD.HrefValue = ""

		' INGRESO
		CustomView1.INGRESO.HrefValue = ""

		' DIRECCION
		CustomView1.DIRECCION.HrefValue = ""

		' COMUNA
		CustomView1.COMUNA.HrefValue = ""

		' CIUDAD
		CustomView1.CIUDAD.HrefValue = ""

		' FONO
		CustomView1.FONO.HrefValue = ""

		' MAIL
		CustomView1.MAIL.HrefValue = ""

		' SEXO
		CustomView1.SEXO.HrefValue = ""

		' NACIONALIDAD
		CustomView1.NACIONALIDAD.HrefValue = ""

		' FACULTAD
		CustomView1.FACULTAD.HrefValue = ""

		' codigo
		CustomView1.codigo.HrefValue = ""

		' ANO_MAT
		CustomView1.ANO_MAT.HrefValue = ""

		' PERIODO_MAT
		CustomView1.PERIODO_MAT.HrefValue = ""

		' TIPOSITU
		CustomView1.TIPOSITU.HrefValue = ""

		' DESCRIPCION
		CustomView1.DESCRIPCION.HrefValue = ""

		' Call Row_Rendered event
		Call CustomView1.Row_Rendered()
	End Sub

	' Get extended filter values
	Sub GetExtendedFilterValues()
		Dim sSelectFld, sSelect, sWhere, sOrderBy
		Dim wrkSql, wrkRs

		' Field NOMBRE_C
		sSelect = "SELECT DISTINCT SEK_matriculados_estados.NOMBRE_C FROM " & CustomView1.SqlFrom
		sWhere = CustomView1.SqlWhere
		sOrderBy = "SEK_matriculados_estados.NOMBRE_C ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		CustomView1.NOMBRE_C.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field ESTACAD
		sSelect = "SELECT DISTINCT SEK_matriculados_estados.ESTACAD FROM " & CustomView1.SqlFrom
		sWhere = CustomView1.SqlWhere
		sOrderBy = "SEK_matriculados_estados.ESTACAD ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		CustomView1.ESTACAD.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field FACULTAD
		sSelect = "SELECT DISTINCT SEK_matriculados_estados.FACULTAD FROM " & CustomView1.SqlFrom
		sWhere = CustomView1.SqlWhere
		sOrderBy = "SEK_matriculados_estados.FACULTAD ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		CustomView1.FACULTAD.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field TIPOSITU
		sSelect = "SELECT DISTINCT SEK_matriculados_estados.TIPOSITU FROM " & CustomView1.SqlFrom
		sWhere = CustomView1.SqlWhere
		sOrderBy = "SEK_matriculados_estados.TIPOSITU ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		CustomView1.TIPOSITU.DropDownList = ewrpt_GetDistinctValues("", wrkSql)
	End Sub

	' Return extended filter
	Function GetExtendedFilter()
		Dim sFilter, sWrk, arwrk
		sFilter = ""
		Dim bPostBack, bRestoreSession, bSetupFilter
		bPostBack = (Request.Form.Count > 0)
		bRestoreSession = True
		bSetupFilter = False

		' Reset extended filter if filter changed
		If bPostBack Then

		' Reset search command
		ElseIf Request.QueryString("cmd") = "reset" Then

			' Load default values
			' (already loaded) Call LoadDefaultFilters()
			' Field NOMBRE_C

			Call SetSessionDropDownValue(CustomView1.NOMBRE_C.DropDownValue, "NOMBRE_C")

			' Field ESTACAD
			Call SetSessionDropDownValue(CustomView1.ESTACAD.DropDownValue, "ESTACAD")

			' Field FACULTAD
			Call SetSessionDropDownValue(CustomView1.FACULTAD.DropDownValue, "FACULTAD")

			' Field ANO_MAT
			Call SetSessionFilterValues(CustomView1.ANO_MAT.SearchValue, CustomView1.ANO_MAT.SearchOperator, CustomView1.ANO_MAT.SearchCondition, CustomView1.ANO_MAT.SearchValue2, CustomView1.ANO_MAT.SearchOperator2, "ANO_MAT")

			' Field PERIODO_MAT
			Call SetSessionFilterValues(CustomView1.PERIODO_MAT.SearchValue, CustomView1.PERIODO_MAT.SearchOperator, CustomView1.PERIODO_MAT.SearchCondition, CustomView1.PERIODO_MAT.SearchValue2, CustomView1.PERIODO_MAT.SearchOperator2, "PERIODO_MAT")

			' Field TIPOSITU
			Call SetSessionDropDownValue(CustomView1.TIPOSITU.DropDownValue, "TIPOSITU")
			bSetupFilter = True ' Set up filter required
		Else

			' Field NOMBRE_C
			If GetDropDownValue(CustomView1.NOMBRE_C) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(CustomView1.NOMBRE_C.DropDownValue) Then
				If CustomView1.NOMBRE_C.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_CustomView1_NOMBRE_C")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field ESTACAD
			If GetDropDownValue(CustomView1.ESTACAD) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(CustomView1.ESTACAD.DropDownValue) Then
				If CustomView1.ESTACAD.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_CustomView1_ESTACAD")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field FACULTAD
			If GetDropDownValue(CustomView1.FACULTAD) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(CustomView1.FACULTAD.DropDownValue) Then
				If CustomView1.FACULTAD.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_CustomView1_FACULTAD")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field ANO_MAT
			If GetFilterValues(CustomView1.ANO_MAT) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field PERIODO_MAT
			If GetFilterValues(CustomView1.PERIODO_MAT) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field TIPOSITU
			If GetDropDownValue(CustomView1.TIPOSITU) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(CustomView1.TIPOSITU.DropDownValue) Then
				If CustomView1.TIPOSITU.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_CustomView1_TIPOSITU")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Validate form
			If Not ValidateForm() Then
				Message = gsFormError
				GetExtendedFilter = sFilter
				Exit Function
			End If
		End If

		' Restore session
		If bRestoreSession Then

			' Field NOMBRE_C
			Call GetSessionDropDownValue(CustomView1.NOMBRE_C)

			' Field ESTACAD
			Call GetSessionDropDownValue(CustomView1.ESTACAD)

			' Field FACULTAD
			Call GetSessionDropDownValue(CustomView1.FACULTAD)

			' Field ANO_MAT
			Call GetSessionFilterValues(CustomView1.ANO_MAT)

			' Field PERIODO_MAT
			Call GetSessionFilterValues(CustomView1.PERIODO_MAT)

			' Field TIPOSITU
			Call GetSessionDropDownValue(CustomView1.TIPOSITU)
		End If

		' Call page filter validated event
		Call CustomView1.Page_FilterValidated()

		' Build sql
		' Field NOMBRE_C

		Call BuildDropDownFilter(CustomView1.NOMBRE_C, sFilter, "")

		' Field ESTACAD
		Call BuildDropDownFilter(CustomView1.ESTACAD, sFilter, "")

		' Field FACULTAD
		Call BuildDropDownFilter(CustomView1.FACULTAD, sFilter, "")

		' Field ANO_MAT
		Call BuildExtendedFilter(CustomView1.ANO_MAT, sFilter)

		' Field PERIODO_MAT
		Call BuildExtendedFilter(CustomView1.PERIODO_MAT, sFilter)

		' Field TIPOSITU
		Call BuildDropDownFilter(CustomView1.TIPOSITU, sFilter, "")

		' Save parms to Session
		' Field NOMBRE_C

		Call SetSessionDropDownValue(CustomView1.NOMBRE_C.DropDownValue, "NOMBRE_C")

		' Field ESTACAD
		Call SetSessionDropDownValue(CustomView1.ESTACAD.DropDownValue, "ESTACAD")

		' Field FACULTAD
		Call SetSessionDropDownValue(CustomView1.FACULTAD.DropDownValue, "FACULTAD")

		' Field ANO_MAT
		Call SetSessionFilterValues(CustomView1.ANO_MAT.SearchValue, CustomView1.ANO_MAT.SearchOperator, CustomView1.ANO_MAT.SearchCondition, CustomView1.ANO_MAT.SearchValue2, CustomView1.ANO_MAT.SearchOperator2, "ANO_MAT")

		' Field PERIODO_MAT
		Call SetSessionFilterValues(CustomView1.PERIODO_MAT.SearchValue, CustomView1.PERIODO_MAT.SearchOperator, CustomView1.PERIODO_MAT.SearchCondition, CustomView1.PERIODO_MAT.SearchValue2, CustomView1.PERIODO_MAT.SearchOperator2, "PERIODO_MAT")

		' Field TIPOSITU
		Call SetSessionDropDownValue(CustomView1.TIPOSITU.DropDownValue, "TIPOSITU")

		' Setup filter
		If bSetupFilter Then
		End If
		GetExtendedFilter = sFilter
	End Function

	' Get drop down value from querystring
	Function GetDropDownValue(fld)
		Dim parm, arwrk
		GetDropDownValue = False
		If Request.Form.Count > 0 Then Exit Function ' Skip post back
		parm = Mid(fld.FldVar,3)
		If Request.QueryString("sv_" & parm).Count > 0 Then
			Dim nParm, i
			nParm = Request.QueryString("sv_" & parm).Count
			If nParm = 1 Then
				arwrk = Request.QueryString("sv_" & parm)
			Else
				ReDim arwrk(nParm-1)
				For i = 1 to nParm
					arwrk(i-1) = Request.QueryString("sv_" & parm)(i)
				Next
			End If
			fld.DropDownValue = arwrk
			GetDropDownValue = True
		End If
	End Function

	' Get filter values from querystring
	Function GetFilterValues(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		GetFilterValues = False
		If Request.Form.Count > 0 Then Exit Function ' Skip post back
		If Request.QueryString("sv1_" & parm).Count > 0 Then
			fld.SearchValue = Request.QueryString("sv1_" & parm)
			GetFilterValues = True
		End If
		If Request.QueryString("so1_" & parm).Count > 0 Then
			fld.SearchOperator = Request.QueryString("so1_" & parm)
			GetFilterValues = True
		End If
		If Request.QueryString("sc_" & parm).Count > 0 Then
			fld.SearchCondition = Request.QueryString("sc_" & parm)
			GetFilterValues = True
		End If
		If Request.QueryString("sv2_" & parm).Count > 0 Then
			fld.SearchValue2 = Request.QueryString("sv2_" & parm)
			GetFilterValues = True
		End If
		If Request.QueryString("so2_" & parm).Count > 0 Then
			fld.SearchOperator2 = Request.QueryString("so2_" & parm)
			GetFilterValues = True
		End If
	End Function

	' Set default ext filter
	Sub SetDefaultExtFilter(fld, so1, sv1, sc, so2, sv2)
		fld.DefaultSearchValue = sv1 ' Default ext filter value 1
		fld.DefaultSearchValue2 = sv2 ' Default ext filter value 2 (if operator 2 is enabled)
		fld.DefaultSearchOperator = so1 ' Default search operator 1
		fld.DefaultSearchOperator2 = so2 ' Default search operator 2 (if operator 2 is enabled)
		fld.DefaultSearchCondition = sc ' Default search condition (if operator 2 is enabled)
	End Sub

	' Apply default ext filter
	Sub ApplyDefaultExtFilter(fld)
		fld.SearchValue = fld.DefaultSearchValue
		fld.SearchValue2 = fld.DefaultSearchValue2
		fld.SearchOperator = fld.DefaultSearchOperator
		fld.SearchOperator2 = fld.DefaultSearchOperator2
		fld.SearchCondition = fld.DefaultSearchCondition
	End Sub

	' Check if Text Filter applied
	Function TextFilterApplied(fld)
		TextFilterApplied = (fld.SearchValue&"" <> fld.DefaultSearchValue&"") Or _
			(fld.SearchValue2&"" <> fld.DefaultSearchValue2&"") Or _
			(fld.SearchValue&"" <> "" And fld.SearchOperator&"" <> fld.DefaultSearchOperator&"") Or _
			(fld.SearchValue2&"" <> "" And fld.SearchOperator2&"" <> fld.DefaultSearchOperator2&"") Or _
			(fld.SearchCondition&"" <> fld.DefaultSearchCondition&"")
	End Function

	' Check if Non-Text Filter applied
	Function NonTextFilterApplied(fld)
		If IsArray(fld.DropDownValue) And IsArray(fld.DefaultDropDownValue) Then
			If UBound(fld.DropDownValue) <> Ubound(fld.DefaultDropDownValue) Then
				NonTextFilterApplied = True
				Exit Function
			Else
				Dim ar1, ar2
				ar1 = fld.DropDownValue
				ar2 = fld.DefaultDropDownValue
				Call ewrpt_SortArray(ar1)
				Call ewrpt_SortArray(ar2)
				NonTextFilterApplied = Not ewrpt_MatchedArray(ar1, ar2)
			End If
		ElseIf IsArray(fld.DropDownValue) Or IsArray(fld.DefaultDropDownValue) Then
			NonTextFilterApplied = True
		Else
			NonTextFilterApplied = (fld.DropDownValue&"" <> fld.DefaultDropDownValue&"")
		End If
	End Function

	' Load selection from a filter clause
	Sub LoadSelectionFromFilter(fld, filter, sel)
		Dim sSql
		sel = ""
		If filter <> "" Then
			sSql = ewrpt_BuildReportSql(fld.SqlSelect, "", "", "", fld.SqlOrderBy, filter, "")
			Call ewrpt_LoadArrayFromSql(sSql, sel)
		End If
	End Sub

	' Get dropdown value from Session
	Sub GetSessionDropDownValue(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv_CustomView1_" & parm)) Then fld.DropDownValue = Session("sv_CustomView1_" & parm)
	End Sub

	' Get filter values from Session
	Sub GetSessionFilterValues(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv1_CustomView1_" & parm)) Then fld.SearchValue = Session("sv1_CustomView1_" & parm)
		If Not IsEmpty(Session("so1_CustomView1_" & parm)) Then fld.SearchOperator = Session("so1_CustomView1_" & parm)
		If Not IsEmpty(Session("sc_CustomView1_" & parm)) Then fld.SearchCondition = Session("sc_CustomView1_" & parm)
		If Not IsEmpty(Session("sv2_CustomView1_" & parm)) Then fld.SearchValue2 = Session("sv2_CustomView1_" & parm)
		If Not IsEmpty(Session("so2_CustomView1_" & parm)) Then fld.SearchOperator2 = Session("so2_CustomView1_" & parm)
	End Sub

	' Set dropdown value to Session
	Sub SetSessionDropDownValue(sv, parm)
		Session("sv_CustomView1_" & parm) = sv
	End Sub

	' Set filter values to Session
	Sub SetSessionFilterValues(sv1, so1, sc, sv2, so2, parm)
		Session("sv1_CustomView1_" & parm) = sv1
		Session("so1_CustomView1_" & parm) = so1
		Session("sc_CustomView1_" & parm) = sc
		Session("sv2_CustomView1_" & parm) = sv2
		Session("so2_CustomView1_" & parm) = so2
	End Sub

	' Check if has Session filter values
	Function HasSessionFilterValues(parm)
		HasSessionFilterValues = _
			(Session("sv_" & parm) <> "" And Session("sv_" & parm) <> EWRPT_INIT_VALUE) Or _
			(Session("sv1_" & parm) <> "" And Session("sv1_" & parm) <> EWRPT_INIT_VALUE) Or _
			(Session("sv2_" & parm) <> "" And Session("sv2_" & parm) <> EWRPT_INIT_VALUE)
	End Function

	' Check if dropdown filter
	Function DropDownFilterExist(fld, FldOpr)
		Dim sWrk
		sWrk = ""
		Call BuildDropDownFilter(fld, sWrk, FldOpr)
		DropDownFilterExist = (sWrk <> "")
	End Function

	' Build dropdown filter
	Function BuildDropDownFilter(fld, FilterClause, FldOpr)
		Dim sSql, i, sWrk, FldVal
		sSql = ""
		FldVal = fld.DropDownValue
		If IsArray(FldVal) Then
			For i = 0 to UBound(FldVal)
				sWrk = GetDropDownfilter(fld, FldVal(i), FldOpr)
				If sWrk <> "" Then
					If sSql <> "" Then
						sSql = sSql & " OR " & sWrk
					Else
						sSql = sWrk
					End If
				End If
			Next
		Else
			sSql = GetDropDownfilter(fld, FldVal, FldOpr)
		End If
		If sSql <> "" Then
			If FilterClause <> "" Then FilterClause = "(" & FilterClause & ") AND "
			FilterClause = FilterClause & "(" & sSql & ")"
		End If
	End Function

	Function GetDropDownfilter(fld, FldVal, FldOpr)
		Dim sWrk, FldName, FldExpression, FldDataType
		sWrk = ""
		FldName = fld.FldName
		FldExpression = fld.FldExpression
		FldDataType = fld.FldDataType
		If FldVal = EWRPT_NULL_VALUE Then
			sWrk = FldExpression & " IS NULL"
		ElseIf FldVal = EWRPT_EMPTY_VALUE Then
			sWrk = FldExpression & " = ''"
		Else
			If Left(FldVal, 2) = "@@" Then
				sWrk = ewrpt_GetCustomFilter(fld, FldVal)
			Else
				If FldVal <> "" And FldVal <> EWRPT_INIT_VALUE And FldVal <> EWRPT_ALL_VALUE Then
					If FldDataType = EWRPT_DATATYPE_DATE And FldOpr <> "" Then
						sWrk = DateFilterString(FldOpr, FldVal, FldDataType)
					Else
						sWrk = FilterString("=", FldVal, FldDataType)
					End If
				End If
				If sWrk <> "" Then sWrk = FldExpression & sWrk
			End If
		End If
		GetDropDownFilter = sWrk
	End Function

	' Check if extended filter
	Function ExtendedFilterExist(fld)
		Dim sExtWrk
		sExtWrk = ""
		Call BuildExtendedFilter(fld, sExtWrk)
		ExtendedFilterExist = (sExtWrk <> "")
	End Function

	' Build extended filter
	Sub BuildExtendedFilter(fld, FilterClause)
		Dim FldName, FldExpression, FldDataType, FldDateTimeFormat, FldVal1, FldOpr1, FldCond, FldVal2, FldOpr2
		Dim IsValidValue, sWrk
		Dim wrkFldVal1, wrkFldVal2
		FldName = fld.FldName
		FldExpression = fld.FldExpression
		FldDataType = fld.FldDataType
		FldDateTimeFormat = fld.FldDateTimeFormat
		FldVal1 = fld.SearchValue
		FldOpr1 = fld.SearchOperator
		FldCond = fld.SearchCondition
		FldVal2 = fld.SearchValue2
		FldOpr2 = fld.SearchOperator2
		sWrk = ""
		FldOpr1 = UCase(Trim(FldOpr1))
		If (FldOpr1 = "") Then FldOpr1 = "="
		FldOpr2 = UCase(Trim(FldOpr2))
		If FldOpr2 = "" Then FldOpr2 = "="
		wrkFldVal1 = FldVal1
		wrkFldVal2 = FldVal2
		If FldDataType = EWRPT_DATATYPE_BOOLEAN Then
			If EWRPT_IS_MSACCESS Then
				If wrkFldVal1 <> "" Then wrkFldVal1 = ewrpt_IIf(wrkFldVal1="1", "True", "False")
				If wrkFldVal2 <> "" Then wrkFldVal2 = ewrpt_IIf(wrkFldVal2="1", "True", "False")
			Else
				If wrkFldVal1 <> "" Then wrkFldVal1 = ewrpt_IIf(wrkFldVal1="1", "1", "0")
				If wrkFldVal2 <> "" Then wrkFldVal2 = ewrpt_IIf(wrkFldVal2="1", "1", "0")
			End If
		ElseIf FldDataType = EWRPT_DATATYPE_DATE Then
			If wrkFldVal1 <> "" Then wrkFldVal1 = ewrpt_UnFormatDateTime(wrkFldVal1, FldDateTimeFormat)
			If wrkFldVal2 <> "" Then wrkFldVal2 = ewrpt_UnFormatDateTime(wrkFldVal2, FldDateTimeFormat)
		End If
		If FldOpr1 = "BETWEEN" Then
			IsValidValue = (FldDataType <> EWRPT_DATATYPE_NUMBER) Or _
				(FldDataType = EWRPT_DATATYPE_NUMBER And IsNumeric(wrkFldVal1) And IsNumeric(wrkFldVal2))
			If wrkFldVal1 <> "" And wrkFldVal2 <> "" And IsValidValue Then
				sWrk = FldExpression & " BETWEEN " & ewrpt_QuotedValue(wrkFldVal1, FldDataType) & _
					" AND " & ewrpt_QuotedValue(wrkFldVal2, FldDataType)
			End If
		ElseIf FldOpr1 = "IS NULL" Or FldOpr1 = "IS NOT NULL" Then
			sWrk = FldExpression & " " & wrkFldVal1
		Else
			IsValidValue = (FldDataType <> EWRPT_DATATYPE_NUMBER) Or _
				(FldDataType = EWRPT_DATATYPE_NUMBER And IsNumeric(wrkFldVal1))
			If wrkFldVal1 <> "" And IsValidValue And ewrpt_IsValidOpr(FldOpr1, FldDataType) Then
				sWrk = FldExpression & FilterString(FldOpr1, wrkFldVal1, FldDataType)
			End If
			IsValidValue = (FldDataType <> EWRPT_DATATYPE_NUMBER) Or _
				(FldDataType = EWRPT_DATATYPE_NUMBER And IsNumeric(wrkFldVal2))
			If wrkFldVal2 <> "" And IsValidValue And ewrpt_IsValidOpr(FldOpr2, FldDataType) Then
				If sWrk <> "" Then
					sWrk = sWrk & " " & ewrpt_IIf(FldCond="OR", "OR", "AND") & " "
				End If
				sWrk = sWrk & FldExpression & FilterString(FldOpr2, wrkFldVal2, FldDataType)
			End If
		End If
		If sWrk <> "" Then
			If FilterClause <> "" Then FilterClause = FilterClause & " AND "
			FilterClause = FilterClause & "(" & sWrk & ")"
		End If
	End Sub

	' Validate form
	Function ValidateForm()

		' Initialize form error message
		gsFormError = ""

		' Check if validation required
		If Not EWRPT_SERVER_VALIDATE Then
			ValidateForm = (gsFormError = "")
			Exit Function
		End If

		' Validate fields
		If Not ewrpt_CheckNumber(CustomView1.ANO_MAT.SearchValue) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & CustomView1.ANO_MAT.FldErrMsg
		End If
		If Not ewrpt_CheckNumber(CustomView1.PERIODO_MAT.SearchValue) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & CustomView1.PERIODO_MAT.FldErrMsg
		End If

		' Return validate result
		ValidateForm = (gsFormError = "")

		' Call Form_CustomValidate event
		Dim sFormCustomError
		sFormCustomError = ""
		ValidateForm = ValidateForm And Form_CustomValidate(sFormCustomError)
		If sFormCustomError <> "" Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & sFormCustomError
		End If
	End Function

	' Return filter string
	Function FilterString(FldOpr, FldVal, FldType)
		If FldOpr = "LIKE" Or FldOpr = "NOT LIKE" Then
			FilterString = " " & FldOpr & " " & ewrpt_QuotedValue("%" & FldVal & "%", FldType)
		ElseIf FldOpr = "STARTS WITH" Then
			FilterString = " LIKE " & ewrpt_QuotedValue(FldVal & "%", FldType)
		Else
			FilterString = " " & FldOpr & " " & ewrpt_QuotedValue(FldVal, FldType)
		End If
	End Function

	' Return date search string
	Function DateFilterString(FldOpr, FldVal, FldType)
		Dim wrkVal1, wrkVal2
		wrkVal1 = ewrpt_DateVal(FldOpr, FldVal, 1)
		wrkVal2 = ewrpt_DateVal(FldOpr, FldVal, 2)
		If wrkVal1 <> "" And wrkVal2 <> "" Then
			DateFilterString = " BETWEEN " & ewrpt_QuotedValue(wrkVal1, FldType) & " AND " & ewrpt_QuotedValue(wrkVal2, FldType)
		Else
			DateFilterString = ""
		End If
	End Function

	' Clear selection stored in session
	Sub ClearSessionSelection(parm)
		Session("sel_CustomView1_" & parm) = ""
		Session("rf_CustomView1_" & parm) = ""
		Session("rt_CustomView1_" & parm) = ""
	End Sub

	' Load selection from session
	Sub LoadSelectionFromSession(parm)
		Dim fld
		Set fld = CustomView1.GetField(parm)
		fld.SelectionList = Session("sel_CustomView1_" & parm)
		fld.RangeFrom = Session("rf_CustomView1_" & parm)
		fld.RangeTo = Session("rt_CustomView1_" & parm)
	End Sub

	' Load default value for filters
	Sub LoadDefaultFilters()
		Dim sWrk, sSql, arwrk

		' --------------------------------------------------
		'  Set up default values for dropdown filters
		'
		' Field NOMBRE_C

		CustomView1.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE
		CustomView1.NOMBRE_C.DropDownValue = CustomView1.NOMBRE_C.DefaultDropDownValue

		' Field ESTACAD
		CustomView1.ESTACAD.DefaultDropDownValue = EWRPT_INIT_VALUE
		CustomView1.ESTACAD.DropDownValue = CustomView1.ESTACAD.DefaultDropDownValue

		' Field FACULTAD
		CustomView1.FACULTAD.DefaultDropDownValue = EWRPT_INIT_VALUE
		CustomView1.FACULTAD.DropDownValue = CustomView1.FACULTAD.DefaultDropDownValue

		' Field TIPOSITU
		CustomView1.TIPOSITU.DefaultDropDownValue = EWRPT_INIT_VALUE
		CustomView1.TIPOSITU.DropDownValue = CustomView1.TIPOSITU.DefaultDropDownValue

		' --------------------------------------------------
		'  Set up default values for extended filters
		'
		' Field ANO_MAT

		Call SetDefaultExtFilter(CustomView1.ANO_MAT, "=", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(CustomView1.ANO_MAT)

		' Field PERIODO_MAT
		Call SetDefaultExtFilter(CustomView1.PERIODO_MAT, "=", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(CustomView1.PERIODO_MAT)

		' --------------------------------------------------
		'  Set up default values for popup filters
		'  - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Function CheckFilter()

		' Check NOMBRE_C non-Text filter
		If NonTextFilterApplied(CustomView1.NOMBRE_C) Then
			CheckFilter = True
			Exit Function
		End If

		' Check ESTACAD non-Text filter
		If NonTextFilterApplied(CustomView1.ESTACAD) Then
			CheckFilter = True
			Exit Function
		End If

		' Check FACULTAD non-Text filter
		If NonTextFilterApplied(CustomView1.FACULTAD) Then
			CheckFilter = True
			Exit Function
		End If

		' Check ANO_MAT Text filter
		If TextFilterApplied(CustomView1.ANO_MAT) Then
			CheckFilter = True
			Exit Function
		End If

		' Check PERIODO_MAT Text filter
		If TextFilterApplied(CustomView1.PERIODO_MAT) Then
			CheckFilter = True
			Exit Function
		End If

		' Check TIPOSITU non-Text filter
		If NonTextFilterApplied(CustomView1.TIPOSITU) Then
			CheckFilter = True
			Exit Function
		End If
		CheckFilter = False
	End Function

	' Show list of filters
	Sub ShowFilterList()
		Dim sFilterList
		Dim sExtWrk, sWrk

		' Initialize
		sFilterList = ""

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(CustomView1.NOMBRE_C, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.NOMBRE_C.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTACAD
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(CustomView1.ESTACAD, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.ESTACAD.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FACULTAD
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(CustomView1.FACULTAD, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.FACULTAD.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANO_MAT
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(CustomView1.ANO_MAT, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.ANO_MAT.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO_MAT
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(CustomView1.PERIODO_MAT, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.PERIODO_MAT.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field TIPOSITU
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(CustomView1.TIPOSITU, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & CustomView1.TIPOSITU.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Show Filters
		If sFilterList <> "" Then
			Response.Write ReportLanguage.Phrase("CurrentFilters") & "<br>"
			Response.Write sFilterList
		End If
	End Sub

	' Return poup filter
	Function GetPopupFilter()
		Dim sWrk
		sWrk = ""
		GetPopupFilter = sWrk
	End Function

	' -------------------------------------------------------------------------------
	' Function getSort
	' - Return Sort parameters based on Sort Links clicked
	' - Variables setup: Session[EWRPT_TABLE_SESSION_ORDER_BY], Session["sort_Table_Field"]
	Function GetSort()
		Dim sOrderBy
		Dim sSortSql
		Dim bCtrl, sCmd

		' Check for a resetsort command
		If Request.QueryString("cmd").Count > 0 Then
			sCmd = Request.QueryString("cmd")
			If sCmd = "resetsort" Then
				CustomView1.OrderBy = ""
				CustomView1.StartGroup = 1
				CustomView1.CODCLI.Sort = ""
				CustomView1.DIG.Sort = ""
				CustomView1.PATERNO.Sort = ""
				CustomView1.MATERNO.Sort = ""
				CustomView1.NOMBRE.Sort = ""
				CustomView1.NOMBRE_C.Sort = ""
				CustomView1.JORNADA.Sort = ""
				CustomView1.CODCARR.Sort = ""
				CustomView1.ESTACAD.Sort = ""
				CustomView1.INGRESO.Sort = ""
				CustomView1.DIRECCION.Sort = ""
				CustomView1.COMUNA.Sort = ""
				CustomView1.CIUDAD.Sort = ""
				CustomView1.FONO.Sort = ""
				CustomView1.MAIL.Sort = ""
				CustomView1.SEXO.Sort = ""
				CustomView1.NACIONALIDAD.Sort = ""
				CustomView1.FACULTAD.Sort = ""
				CustomView1.codigo.Sort = ""
				CustomView1.ANO_MAT.Sort = ""
				CustomView1.PERIODO_MAT.Sort = ""
				CustomView1.TIPOSITU.Sort = ""
				CustomView1.DESCRIPCION.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			CustomView1.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				CustomView1.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				CustomView1.CurrentOrderType = ""
			End If
			Call CustomView1.UpdateSort(CustomView1.CODCLI) ' CODCLI
			Call CustomView1.UpdateSort(CustomView1.DIG) ' DIG
			Call CustomView1.UpdateSort(CustomView1.PATERNO) ' PATERNO
			Call CustomView1.UpdateSort(CustomView1.MATERNO) ' MATERNO
			Call CustomView1.UpdateSort(CustomView1.NOMBRE) ' NOMBRE
			Call CustomView1.UpdateSort(CustomView1.NOMBRE_C) ' NOMBRE_C
			Call CustomView1.UpdateSort(CustomView1.JORNADA) ' JORNADA
			Call CustomView1.UpdateSort(CustomView1.CODCARR) ' CODCARR
			Call CustomView1.UpdateSort(CustomView1.ESTACAD) ' ESTACAD
			Call CustomView1.UpdateSort(CustomView1.INGRESO) ' INGRESO
			Call CustomView1.UpdateSort(CustomView1.DIRECCION) ' DIRECCION
			Call CustomView1.UpdateSort(CustomView1.COMUNA) ' COMUNA
			Call CustomView1.UpdateSort(CustomView1.CIUDAD) ' CIUDAD
			Call CustomView1.UpdateSort(CustomView1.FONO) ' FONO
			Call CustomView1.UpdateSort(CustomView1.MAIL) ' MAIL
			Call CustomView1.UpdateSort(CustomView1.SEXO) ' SEXO
			Call CustomView1.UpdateSort(CustomView1.NACIONALIDAD) ' NACIONALIDAD
			Call CustomView1.UpdateSort(CustomView1.FACULTAD) ' FACULTAD
			Call CustomView1.UpdateSort(CustomView1.codigo) ' codigo
			Call CustomView1.UpdateSort(CustomView1.ANO_MAT) ' ANO_MAT
			Call CustomView1.UpdateSort(CustomView1.PERIODO_MAT) ' PERIODO_MAT
			Call CustomView1.UpdateSort(CustomView1.TIPOSITU) ' TIPOSITU
			Call CustomView1.UpdateSort(CustomView1.DESCRIPCION) ' DESCRIPCION
			sSortSql = CustomView1.SortSql
			CustomView1.OrderBy = sSortSql
			CustomView1.StartGroup = 1
		End If
		GetSort = CustomView1.OrderBy
	End Function

	' Page Load event
	Sub Page_Load()

		'Response.Write "Page Load"
	End Sub

	' Page Unload event
	Sub Page_Unload()

		'Response.Write "Page Unload"
	End Sub

	' Message Showing event
	Sub Message_Showing(msg)

		'msg = newmsg
	End Sub

	' Page Data Rendering event
	Sub Page_DataRendering(header)

		' Example:
		'header = "your header"

	End Sub

	' Page Data Rendered event
	Sub Page_DataRendered(footer)

		' Example:
		'footer = "your footer"

	End Sub

	' Form Custom Validate event
	Function Form_CustomValidate(CustomError)

		'Return error message in CustomError
		Form_CustomValidate = True
	End Function
End Class
%>
